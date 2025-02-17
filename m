Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284C5C021A6
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 07:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4eAFaBVkw9OoObkFkl/6QpIb0ST2Q/UTAsDjRfqLCzA=; b=0X6mdSCojljUo1
	dskdMKAANG7Qn6MnwJQxNg7mfOcP1Jpfe0L+FaE6X96cuw8+rTdzA6qgWyV/te/2nYSE2B/69BdUG
	qcoaFL2Q09VL9Gt+Kfz//8t4t4if0+WGi9iTnjZGu6bW9INFGTV6DEp+WYrYeu2EAffGVxGuIw4+x
	Yu+WTQoDM4Z4zB7pb6rjIiNIXJf1IbrJMqWipLbG4HVTjMoVVwEfLA8r1MvwVFw6WqAVp6BFv46Ns
	Kr/K8tYIxuDHyuIJry6+HpvmEVGhE5aOkIkEV0B/0+XIjduTXRijAdBE/EFPMICx2T2z/HpU4rzqD
	lmwn+YulfZ8C7r3fOTHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjviD-00000003csR-2FNA;
	Mon, 17 Feb 2025 07:38:41 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjvhf-00000003cn2-0M1t
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 07:38:08 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739777883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/e6hxVPR8O3eSw41KB/yWx13z8cE7qxMOk6uwUqRyOI=;
	b=mmq7ri2soJnIuk80hlfk7lJDIEg5d+slMqE4lwALxZWl8x2hViKdViCeO4pv1gHrpxxe7b
	vVglNQC1ZoCX+tQ0LI1KcWgwbSm/DQq6H6IDG8EgQ1wBtXXwuaRnthS78vzCM3CHs1jgzJ
	sks0ohCLKT82SdgzS+gykqzcqLEwkxg/1pwFeddcvM5D6NZ5aJclWpILpfrDVqs4bmhAJj
	BX8Jc9ABu6fnLwcvp27o6SMENppq/VcEb0lBye3YiSuNDHeysjK289fbouq0j/JXuaxCV4
	3Q/5MWUdTaqQnzK7nrxaV5JhUiDhPUUtubcrcXZZ6DDdvuoQcjKpjXFAzf6IKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739777883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/e6hxVPR8O3eSw41KB/yWx13z8cE7qxMOk6uwUqRyOI=;
	b=HPyjybccJt0z38iBCnAO9Ze7hTvZidli6j+szvSACKwrnjiQCHVPmKwxUx+5cOZAmFQsDE
	fpsRM3SVpVjiEqBw==
Date: Mon, 17 Feb 2025 08:37:58 +0100
Subject: [PATCH] riscv: mm: Don't use %pK through printk
MIME-Version: 1.0
Message-Id: <20250217-restricted-pointers-riscv-v1-1-72a078076a76@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAFXnsmcC/x3MPQqAMAxA4atIZgNt8Qe8ijhom2qWVpIignh3i
 +M3vPeAkjApTM0DQhcr51Rh2wb8saadkEM1OON64+yIQlqEfaGAZ+ZUSBSF1V84OL8OoY9btB3
 U/hSKfP/veXnfD1ZIhOdrAAAA
X-Change-ID: 20250217-restricted-pointers-riscv-62ca6d5fbf14
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739777883; l=1258;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=HbY7o1txWSoh2feuXDu+61H2EnR68libmL0CyHKvVmQ=;
 b=9CoJwe1ivfUZhZ0Du4FieuXxCrYW629ahO+fL6dRstjmrXvuC/0QbTI7562oIjXixrE6e52sx
 S0WFfyrgan5A96bzlywW5jyteRl7ZQpvXeOnpxIMeztDZgRh+Kecapx
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_233807_263875_7657D1C5 
X-CRM114-Status: UNSURE (   7.53  )
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

UmVzdHJpY3RlZCBwb2ludGVycyAoIiVwSyIpIGFyZSBub3QgbWVhbnQgdG8gYmUgdXNlZCB0aHJv
dWdoIHByaW50aygpLgpJdCBjYW4gdW5pbnRlbnRpb25hbGx5IGV4cG9zZSBzZWN1cml0eSBzZW5z
aXRpdmUsIHJhdyBwb2ludGVyIHZhbHVlcy4KClVzZSByZWd1bGFyIHBvaW50ZXIgZm9ybWF0dGlu
ZyBpbnN0ZWFkLgoKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI1MDExMzE3
MTczMS1kYzEwZTNjMS1kYTY0LTRhZjAtYjc2Ny03YzcwNzA0NjgwMjNAbGludXRyb25peC5kZS8K
U2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0
cm9uaXguZGU+Ci0tLQogYXJjaC9yaXNjdi9tbS9waHlzYWRkci5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9tbS9waHlzYWRkci5jIGIvYXJjaC9yaXNjdi9tbS9waHlzYWRkci5jCmluZGV4IDE4NzA2
ZjQ1N2RhN2VjZjg0NTkxNTEwZWEyNjc4OWY3YWUzZTlhYmYuLjU1OWQyOTFmYWM1YzYyMjcxYTBl
NzkzMzIxYzk3Yjg3YmY0ZTFiM2MgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbW0vcGh5c2FkZHIu
YworKysgYi9hcmNoL3Jpc2N2L21tL3BoeXNhZGRyLmMKQEAgLTEyLDcgKzEyLDcgQEAgcGh5c19h
ZGRyX3QgX192aXJ0X3RvX3BoeXModW5zaWduZWQgbG9uZyB4KQogCSAqIEJvdW5kYXJ5IGNoZWNr
aW5nIGFnaW5zdCB0aGUga2VybmVsIGxpbmVhciBtYXBwaW5nIHNwYWNlLgogCSAqLwogCVdBUk4o
IWlzX2xpbmVhcl9tYXBwaW5nKHgpICYmICFpc19rZXJuZWxfbWFwcGluZyh4KSwKLQkgICAgICJ2
aXJ0X3RvX3BoeXMgdXNlZCBmb3Igbm9uLWxpbmVhciBhZGRyZXNzOiAlcEsgKCVwUylcbiIsCisJ
ICAgICAidmlydF90b19waHlzIHVzZWQgZm9yIG5vbi1saW5lYXIgYWRkcmVzczogJXAgKCVwUylc
biIsCiAJICAgICAodm9pZCAqKXgsICh2b2lkICopeCk7CiAKIAlyZXR1cm4gX192YV90b19wYV9u
b2RlYnVnKHgpOwoKLS0tCmJhc2UtY29tbWl0OiAwYWQyNTA3ZDVkOTNmMzk2MTlmYzQyMzcyYzM0
N2Q2MDA2YjY0MzE5CmNoYW5nZS1pZDogMjAyNTAyMTctcmVzdHJpY3RlZC1wb2ludGVycy1yaXNj
di02MmNhNmQ1ZmJmMTQKCkJlc3QgcmVnYXJkcywKLS0gClRob21hcyBXZWnDn3NjaHVoIDx0aG9t
YXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
