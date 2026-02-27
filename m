Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DACFD4600
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 06:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ewLUGONJjVi4cgne/7D5ZzeYKiEYIT7RZMwTNiALJbg=; b=eNnkMg35Sr62dj
	K5vzhAM+HGyNSsMxa4Qs+/StaQ/yhzwt3HMWte+2mk737tjwQGufMWkxvR3jQTsA9wGIX4aPF/YKi
	vg2qT1Do2iCep1fNIOX1eikdHhUMy7zH2dE8t6cY0UA0BRbXZvp9hcGxhJyZYMxxNn8as7tZlN70Q
	rKf4OTz1urxR+7PpOPZBUhgvwcSjjwCgEmlNNHuw+hRa9Eeioppf0qpe4w5krnw2EedHxq3JACf3X
	/fvM0YG8FmSwrFWktqIfpbqM8zalQqKxRlqtlqJEMSlWIC7NdJjU+mrmiO2jO5+O/AFZ19ESAV/wA
	1oTU4oq7ren08pHRRaLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrfZ-00000007p95-3chI;
	Fri, 27 Feb 2026 06:49:49 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrfX-00000007p8m-0our
	for linux-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 06:49:48 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XditmXZ2NnCC8sU2rfkKSVe/maZouU+2bHr9lNmNQ/E=;
	b=0yR4XJQoQEwtE9eeG2+DzKfZNCfLPGiexMzmnNnuOMO2H/sVuH/0qjbvDyfDW1iTGhnIju
	h+Zk+XCOqZA/TgczL4FYXJ6OUJRfBkjrwcPT1ELG69/LJ6I5DiJYzjqk3NVZ4Cp2dHoOaQ
	fBZ9SbvogxU3q8cCcOWiWUKpnzuYjn345HotIh4LIJvEK4XUpzaofV2f1Gp2CwFyKI6l19
	+ozh5D6kmKW0R8V1fPGWKCWSoN8uMqt1OaWOReD80OYV7dbp/vAznmVY24vyVWQTuFmNYy
	B/qEbCj4mezXvrdHTpDoVtQJ5tDkHX/bDsMiwFP4wLGfVA3whMJZMsb6WJF+Yg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XditmXZ2NnCC8sU2rfkKSVe/maZouU+2bHr9lNmNQ/E=;
	b=Lps2T4aBBwULt+lvi83w8JJ+f61FJM+cNQJvbP6Km0gGWdnKcpg9BoBSM1u+es4LndIr2I
	2fU+yMo5TuZwPpBg==
Date: Fri, 27 Feb 2026 07:49:44 +0100
Subject: [PATCH v3] riscv: Implement ARCH_HAS_CC_CAN_LINK
MIME-Version: 1.0
Message-Id: <20260227-cc-can-link-riscv-v3-1-b0baf0fff571@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NwQrCMAyA4VcZPRtp09oxT76HeBht5oLSSTvLZ
 Ozd7QZeRDz+Cfkyi0SRKYljNYtImRMPoYTeVcL1bbgSsC8tUOJBISI4B64NcOdwg8jJZfBOamk
 81q4zotw9InU8beb5UrrnNA7xtb3Iap3+07ICBVZr0g2Z1kp/KsvnGIfA096TWMWMH8VKpewvB
 YtCbact+tq4Rn4ry7K8AVoxZrj8AAAA
X-Change-ID: 20251222-cc-can-link-riscv-dc0304d27cf4
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174984; l=1987;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Tg2RFHj9eoQO5TzJVPaXMOYmW8CobLV5TZqXWixFR2U=;
 b=08UtNZMD4sKmYzGSO8dQo8sbuIv+eB2HZ4lpqIXa95hEDTLVTqQjy5RTYvsXOBJ001qQZerbk
 2IQfl+2fxBjCCJolabsH5Cydz02//tsDKF8oTjctJPMCQj1mTXsvHY3
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_224947_379876_74136186 
X-CRM114-Status: UNSURE (   5.67  )
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
LmRlPgotLS0KQ2hhbmdlcyBpbiB2MzoKLSBSZWJhc2Ugb24gdjcuMC1yYzEKLSBMaW5rIHRvIHYy
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwMTE2LWNjLWNhbi1saW5rLXJpc2N2LXYy
LTEtZWFmMzYyZDc0YzkwQGxpbnV0cm9uaXguZGUKCkNoYW5nZXMgaW4gdjI6Ci0gQWxzbyBoYW5k
bGUgIUZQVSBjYXNlLgotIEV4dGVuZCBjb21taXQgbWVzc2FnZS4KLSBMaW5rIHRvIHYxOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUxMjIyLWNjLWNhbi1saW5rLXJpc2N2LXYxLTEtNjMz
ZTM5ZTRhNjBkQGxpbnV0cm9uaXguZGUKLS0tCiBhcmNoL3Jpc2N2L0tjb25maWcgfCAxNSArKysr
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCmluZGV4IDkwYzUzMWU2
YWJmNS4uYTlkMTExZGEzN2MyIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKKysrIGIv
YXJjaC9yaXNjdi9LY29uZmlnCkBAIC0yNSw2ICsyNSw3IEBAIGNvbmZpZyBSSVNDVgogCXNlbGVj
dCBBUkNIX0VOQUJMRV9TUExJVF9QTURfUFRMT0NLIGlmIFBHVEFCTEVfTEVWRUxTID4gMgogCXNl
bGVjdCBBUkNIX0VOQUJMRV9USFBfTUlHUkFUSU9OIGlmIFRSQU5TUEFSRU5UX0hVR0VQQUdFCiAJ
c2VsZWN0IEFSQ0hfSEFTX0JJTkZNVF9GTEFUCisJc2VsZWN0IEFSQ0hfSEFTX0NDX0NBTl9MSU5L
CiAJc2VsZWN0IEFSQ0hfSEFTX0NVUlJFTlRfU1RBQ0tfUE9JTlRFUgogCXNlbGVjdCBBUkNIX0hB
U19ERUJVR19WSVJUVUFMIGlmIE1NVQogCXNlbGVjdCBBUkNIX0hBU19ERUJVR19WTV9QR1RBQkxF
CkBAIC0xMzc0LDYgKzEzNzUsMjAgQEAgY29uZmlnIFBPUlRBQkxFCiBjb25maWcgQVJDSF9QUk9D
X0tDT1JFX1RFWFQKIAlkZWZfYm9vbCB5CiAKK2NvbmZpZyBBUkNIX0NDX0NBTl9MSU5LCisJYm9v
bAorCWRlZmF1bHQgJChjY19jYW5fbGlua191c2VyLC1tYWJpPWxwNjRkKSBpZiA2NEJJVCAmJiBG
UFUKKwlkZWZhdWx0ICQoY2NfY2FuX2xpbmtfdXNlciwtbWFiaT1scDY0KSBpZiA2NEJJVAorCWRl
ZmF1bHQgJChjY19jYW5fbGlua191c2VyLC1tYWJpPWlscDMyZCkgaWYgRlBVCisJZGVmYXVsdCAk
KGNjX2Nhbl9saW5rX3VzZXIsLW1hYmk9aWxwMzIpCisKK2NvbmZpZyBBUkNIX1VTRVJGTEFHUwor
CXN0cmluZworCWRlZmF1bHQgIi1tYWJpPWxwNjRkIiBpZiA2NEJJVCAmJiBGUFUKKwlkZWZhdWx0
ICItbWFiaT1scDY0IiBpZiA2NEJJVAorCWRlZmF1bHQgIi1tYWJpPWlscDMyZCIgaWYgRlBVCisJ
ZGVmYXVsdCAiLW1hYmk9aWxwMzIiCisKIG1lbnUgIlBvd2VyIG1hbmFnZW1lbnQgb3B0aW9ucyIK
IAogc291cmNlICJrZXJuZWwvcG93ZXIvS2NvbmZpZyIKCi0tLQpiYXNlLWNvbW1pdDogNmRlMjNm
ODFhNWUwOGJlOGZiZjVlOGQ3ZTlmZWJjNzJhNWI1ZjI3ZgpjaGFuZ2UtaWQ6IDIwMjUxMjIyLWNj
LWNhbi1saW5rLXJpc2N2LWRjMDMwNGQyN2NmNAoKQmVzdCByZWdhcmRzLAotLSAKVGhvbWFzIFdl
acOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
