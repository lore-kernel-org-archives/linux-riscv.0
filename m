Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFB7FD4601
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 06:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QXs6aj+kPxRB8tBt6Le6e1aQSrS972mw1Y1G1C1H6+Y=; b=qgr/JH1bZwMfyY
	VtBvqVWgRiUE/hP0Vc23dGw4ChDUJDYIqSW4Qz9yXEy9cHnQpoAK7TQ14nmfheHuR6EYXEofH38xN
	Epi1+ZZmSitzdYTTRtOl9g/mTrsNB7V+kvnknguNilhtFoYtaEX8L62r0ANQuiSancvEt+8gCX2A9
	20lLq4PjTdsOYzZeMIiOWvdKl+5LowcA/J2/QGy9jkx4an4AR1doJRMcB2o6tUYXW627G560zExTR
	+KXiayKLT9k1FGiyzUOKzegufL5sK12d7TvQMsf23ajrnlVW/6GD9h9orjesE5/+3taX9KETyQBPj
	TgHd14jESS6GqhenczXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvriH-00000007pON-0fWe;
	Fri, 27 Feb 2026 06:52:37 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvriE-00000007pNl-2LPA
	for linux-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 06:52:35 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772175152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mHtN+rnq/9BVWxyD3Wfvb5q97rTBXdu7QNBZAnIzMZw=;
	b=R8iFvmn3s/tr7AK87fk3ytAivAZsk7JBitSJHy/LS6DivMZH3cZuNRS/v4VNrVLCIw+p1C
	gr3qFw6OzXyUoDgqKXbVvnb+2uOK/m2gFWpwMqil8sPy6zs6ANoZWoMhIHOocgMk4jk+aE
	jHoimEmAp9bCWrO6DHY0T6mAGHaI959dsh3arOpbIKePw2tTKs5kyz58AzCVwPSvDMcPvm
	qoIRNIfyZpEhYh+4zCMJ+xmcD53tNWMd2M9BvdtjOYcitivdc7I2DiRRoDSng6ZKmnOsY3
	5WiPZWgqQR1B75/db9dd5HEqBI43Oa86/vSqHpzdnDlu4uQbIDUYVDE+wejcjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772175152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mHtN+rnq/9BVWxyD3Wfvb5q97rTBXdu7QNBZAnIzMZw=;
	b=oMeMy0TydGXlqF/9lnlhE+gbcNvJIpmhGbMi9EkvNCv8AsS+IubjRrGbWfhmfvqxAZqb/D
	WPR93/9vlJZoFQAw==
Date: Fri, 27 Feb 2026 07:52:29 +0100
Subject: [PATCH v4] riscv: Implement ARCH_HAS_CC_CAN_LINK
MIME-Version: 1.0
Message-Id: <20260227-cc-can-link-riscv-v4-1-854e0d31103c@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NwQrCMAyA4VcZPVtp09qhJ99DPNQ2dUHppJ1lM
 vbuVkEEGR7/hHyZWMZEmNmumVjCQpn6WEOvGuY6G8/IyddmIGAjAYA7x52N/ErxwhNlV7h3Qgn
 toXVBs3p3SxhofJuHY+2O8tCnx/tFka/pP61ILrlRCtUWtTXC7+vyPqQ+0rj2yF5igY9ihJRmS
 YGqoA3KgG+124olRX0VgHZJUVU5iZMNIoSwaeWvMs/zExBQakpCAQAA
X-Change-ID: 20251222-cc-can-link-riscv-dc0304d27cf4
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772175151; l=2321;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=JQCgf544xbi44CoC+gqLmySNluxUodaT1DMo8nxG7cw=;
 b=y1KHwjRWdEyFAkLM7VLjstYwTC17VkQwahVP8nS0/ZE/6SVlDNzFKg/r5nsRo86Hmi1ILYVqs
 0XwflV4BL1FDZf7laFavkkLsUE8wkSLOjLu8GrTwbKXzjp3rx8YRSbT
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_225234_738697_FA330F30 
X-CRM114-Status: UNSURE (   6.41  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhlIGdlbmVyaWMgQ0NfQ0FOX0xJTksgZGV0ZWN0aW9uIHJlbGllcyBvbiAtbTMyLy1tNjQgY29t
cGlsZXIgZmxhZ3MuClRoZXNlIGFyZSBub3Qgc3VwcG9ydGVkIGJ5IHJpc2N2IGNvbXBpbGVycy4K
ClVzZSBhcmNoaXRlY3R1cmUtc3BlY2lmaWMgbG9naWMgdXNpbmcgLW1hYmkgaW5zdGVhZC4KClBy
ZWZlciB0aGUgJ2QnIEFCSSB2YXJpYW50IHdoZW4gcG9zc2libGUgYXMgdG9kYXlzIHRvb2xjaGFp
bnMgYXJlIG1vc3QKbGlrZWx5IHRvIHByb3ZpZGUgYSBsaWJjIGZvciB0aGF0IG9uZS4KClNpZ25l
ZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4
LmRlPgotLS0KQ2hhbmdlcyBpbiB2NDoKLSBBZGQgLW1hcmNoPSBmb3IgY2xhbmcgY29tcGF0aWJp
bGl0eS4KLSAoU29ycnkgZm9yIHRoZSBmYXN0IHJlc2VuZCwgdGhlIGZpeGVkIHZhcmlhbnQgd2Fz
IG9uIGEgd3JvbmcgYnJhbmNoKQotIExpbmsgdG8gdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMjAyNjAyMjctY2MtY2FuLWxpbmstcmlzY3YtdjMtMS1iMGJhZjBmZmY1NzFAbGludXRyb25p
eC5kZQoKQ2hhbmdlcyBpbiB2MzoKLSBSZWJhc2Ugb24gdjcuMC1yYzEKLSBMaW5rIHRvIHYyOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwMTE2LWNjLWNhbi1saW5rLXJpc2N2LXYyLTEt
ZWFmMzYyZDc0YzkwQGxpbnV0cm9uaXguZGUKCkNoYW5nZXMgaW4gdjI6Ci0gQWxzbyBoYW5kbGUg
IUZQVSBjYXNlLgotIEV4dGVuZCBjb21taXQgbWVzc2FnZS4KLSBMaW5rIHRvIHYxOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9yLzIwMjUxMjIyLWNjLWNhbi1saW5rLXJpc2N2LXYxLTEtNjMzZTM5
ZTRhNjBkQGxpbnV0cm9uaXguZGUKLS0tCiBhcmNoL3Jpc2N2L0tjb25maWcgfCAxNSArKysrKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCmluZGV4IDkwYzUzMWU2YWJm
NS4uNjE0MTA2Njk0MjI0IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKKysrIGIvYXJj
aC9yaXNjdi9LY29uZmlnCkBAIC0yNSw2ICsyNSw3IEBAIGNvbmZpZyBSSVNDVgogCXNlbGVjdCBB
UkNIX0VOQUJMRV9TUExJVF9QTURfUFRMT0NLIGlmIFBHVEFCTEVfTEVWRUxTID4gMgogCXNlbGVj
dCBBUkNIX0VOQUJMRV9USFBfTUlHUkFUSU9OIGlmIFRSQU5TUEFSRU5UX0hVR0VQQUdFCiAJc2Vs
ZWN0IEFSQ0hfSEFTX0JJTkZNVF9GTEFUCisJc2VsZWN0IEFSQ0hfSEFTX0NDX0NBTl9MSU5LCiAJ
c2VsZWN0IEFSQ0hfSEFTX0NVUlJFTlRfU1RBQ0tfUE9JTlRFUgogCXNlbGVjdCBBUkNIX0hBU19E
RUJVR19WSVJUVUFMIGlmIE1NVQogCXNlbGVjdCBBUkNIX0hBU19ERUJVR19WTV9QR1RBQkxFCkBA
IC0xMzc0LDYgKzEzNzUsMjAgQEAgY29uZmlnIFBPUlRBQkxFCiBjb25maWcgQVJDSF9QUk9DX0tD
T1JFX1RFWFQKIAlkZWZfYm9vbCB5CiAKK2NvbmZpZyBBUkNIX0NDX0NBTl9MSU5LCisJYm9vbAor
CWRlZmF1bHQgJChjY19jYW5fbGlua191c2VyLC1tYXJjaD1ydjY0ZyAtbWFiaT1scDY0ZCkgaWYg
NjRCSVQgJiYgRlBVCisJZGVmYXVsdCAkKGNjX2Nhbl9saW5rX3VzZXIsLW1hcmNoPXJ2NjRnIC1t
YWJpPWxwNjQpIGlmIDY0QklUCisJZGVmYXVsdCAkKGNjX2Nhbl9saW5rX3VzZXIsLW1hcmNoPXJ2
MzJnIC1tYWJpPWlscDMyZCkgaWYgRlBVCisJZGVmYXVsdCAkKGNjX2Nhbl9saW5rX3VzZXIsLW1h
cmNoPXJ2MzJnIC1tYWJpPWlscDMyKQorCitjb25maWcgQVJDSF9VU0VSRkxBR1MKKwlzdHJpbmcK
KwlkZWZhdWx0ICItbWFyY2g9cnY2NGcgLW1hYmk9bHA2NGQiIGlmIDY0QklUICYmIEZQVQorCWRl
ZmF1bHQgIi1tYXJjaD1ydjY0ZyAtbWFiaT1scDY0IiBpZiA2NEJJVAorCWRlZmF1bHQgIi1tYXJj
aD1ydjMyZyAtbWFiaT1pbHAzMmQiIGlmIEZQVQorCWRlZmF1bHQgIi1tYXJjaD1ydjMyZyAtbWFi
aT1pbHAzMiIKKwogbWVudSAiUG93ZXIgbWFuYWdlbWVudCBvcHRpb25zIgogCiBzb3VyY2UgImtl
cm5lbC9wb3dlci9LY29uZmlnIgoKLS0tCmJhc2UtY29tbWl0OiA2ZGUyM2Y4MWE1ZTA4YmU4ZmJm
NWU4ZDdlOWZlYmM3MmE1YjVmMjdmCmNoYW5nZS1pZDogMjAyNTEyMjItY2MtY2FuLWxpbmstcmlz
Y3YtZGMwMzA0ZDI3Y2Y0CgpCZXN0IHJlZ2FyZHMsCi0tIApUaG9tYXMgV2Vpw59zY2h1aCA8dGhv
bWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
