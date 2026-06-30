Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8C2C43602
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 07:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FLg1VLaqpaj0sx1VSclsQjV1YqIYPVD2CzKohvnbEqc=; b=xCrer7HzayFpkE
	HQxcN3znopgIXlSGZpAaTl86KBkva5Y1FOn6tghtAPoIFjHvj8JSs+29wDdtBjdc1fnNpfXPohMIb
	dRi0lqwl89Hnlj3rqOgI6TAH0YU8N7z1za2agOiQnIIm+mAkU65b9/yuC0N66FI+i6bxHncCP8hiZ
	QcyB5CP4at2MBVMHbM5MdpzaSv7uqP+w0mlJQaLqFjFxZq9Zk+oY3nE0N6pOMOjIFPzcqcLaVvTy9
	R1QWFnU9HOfQgU5URtkhXFJgstRNlP1iHeXlDY4NXAQE6t6gywTq/BgToXtx3deLt4j9KC4ELda/i
	hN7uPozobrEbQ8oO8XVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weT6L-0000000G8RI-2bCA;
	Tue, 30 Jun 2026 07:41:49 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weT6H-0000000G8PU-45K5
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 07:41:48 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782805303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AWln7+erE27GyR+XmAS3CC9f4VD/l3+w6GFimVfnwpg=;
	b=RG8qAktIcrd/XPU1hJwWLx3SGk+dukiEe7UXzWfuYCImeZiObH98vKbHii6gLYF6pC6RjH
	ZUfHHEQFZuFM7CRv8VokWD8M7Fe8GEex2OPe0n7LMDzvFqsKJNF2rgjt+GTn3duFOYepTB
	XqhRutvguY97QB4ctMCbB9TXfF/YVtTcBXDLSf6e+NMDmUV0voCJRB40kwfDtNojIgKyir
	2kvDUnmZEUZ0S4iZ6tr/2VhCPFySbbXX8IqxuGf2Kib4EZ3fg4CapwmjXJcSNRQN9UDQYw
	BGLhm9yGnYAsvf3A+9epoc6y3XKLHA9L8GkUsOdZH/bLrUy2luKqFWVWtyWsLA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782805303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AWln7+erE27GyR+XmAS3CC9f4VD/l3+w6GFimVfnwpg=;
	b=g3tw4ncYVnTOJWvOfxyPx8m6V1aXQAz1tJn98Qv7SJsEj70fsYCM1/7EHZPYsiVYUyD0di
	xCvQZVWgMj6grOBQ==
Date: Tue, 30 Jun 2026 09:41:41 +0200
Subject: [PATCH 2/3] riscv: alternative: Use the statically extracted vDSO
 section offsets
MIME-Version: 1.0
Message-Id: <20260630-riscv-vdso32-alternative-v1-2-a32fd89b7b1c@linutronix.de>
References: <20260630-riscv-vdso32-alternative-v1-0-a32fd89b7b1c@linutronix.de>
In-Reply-To: <20260630-riscv-vdso32-alternative-v1-0-a32fd89b7b1c@linutronix.de>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782805300; l=2089;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=OyNCttOSiVpV8hiUh9/hm5S6kUCNqzD9RrSp37lMT6I=;
 b=SS/LVnwqVzxKpfr3PeQ9n4HvlrJbGEUbcacDODsGtarJ3UBN+ZpORmiK7XgrjC6TKhd06GqYM
 JsuEKw4/0glBXwPCvz8+6PVSTaWMMQ/UQ7AQAKjiFTImK7t1PFj1RtS
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_004147_018423_D208287D 
X-CRM114-Status: UNSURE (   8.06  )
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

Q3VycmVudGx5IHRoZSBhbHRlcm5hdGl2ZSBzZWN0aW9ucyBhcmUgZXh0cmFjdGVkIGZyb20gdGhl
IHZEU08KYmluYXJpZXMgYXQgcnVudGltZS4gVGhpcyBoYXMgcnVudGltZSBvdmVyaGVhZCBhbmQg
YWxzbyBkb2Vzbid0CndvcmsgZm9yIHRoZSBjb21wYXQgdkRTTy4KClVzZSB0aGUgb2Zmc2V0cyBn
ZW5lcmF0ZWQgZHVyaW5nIHRoZSBidWlsZCBpbnN0ZWFkLCBmaXhpbmcgYm90aCBpc3N1ZXMuCgpT
aWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRy
b25peC5kZT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9hbHRlcm5hdGl2ZS5jIHwgMjggKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyks
IDE3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2FsdGVybmF0
aXZlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9hbHRlcm5hdGl2ZS5jCmluZGV4IDEwNGRjMDg2MmM1
Yy4uNmFiYTE2OWZiMjEzIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9hbHRlcm5hdGl2
ZS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2FsdGVybmF0aXZlLmMKQEAgLTE3MywyNCArMTcz
LDE0IEBAIHN0YXRpYyB2b2lkIF9faW5pdF9vcl9tb2R1bGUgX2FwcGx5X2FsdGVybmF0aXZlcyhz
dHJ1Y3QgYWx0X2VudHJ5ICpiZWdpbiwKIAkJCQlzdGFnZSk7CiB9CiAKLXN0YXRpYyB2b2lkIF9f
aW5pdCBhcHBseV92ZHNvX2FsdGVybmF0aXZlcyh2b2lkICpzdGFydCkKK3N0YXRpYyBfX2Fsd2F5
c19pbmxpbmUKK3ZvaWQgX19pbml0IGFwcGx5X3Zkc29fYWx0ZXJuYXRpdmVzKHZvaWQgKmJhc2Us
IHNpemVfdCBhbHRlcm5hdGl2ZXNfYmVnaW4sIHNpemVfdCBhbHRlcm5hdGl2ZXNfZW5kKQogewot
CWNvbnN0IEVsZl9FaGRyICpoZHI7Ci0JY29uc3QgRWxmX1NoZHIgKnNoZHI7Ci0JY29uc3QgRWxm
X1NoZHIgKmFsdDsKLQlzdHJ1Y3QgYWx0X2VudHJ5ICpiZWdpbiwgKmVuZDsKLQotCWhkciA9IChF
bGZfRWhkciAqKXN0YXJ0OwotCXNoZHIgPSAodm9pZCAqKWhkciArIGhkci0+ZV9zaG9mZjsKLQlh
bHQgPSBmaW5kX3NlY3Rpb24oaGRyLCBzaGRyLCAiLmFsdGVybmF0aXZlIik7Ci0JaWYgKCFhbHQp
CisJaWYgKGFsdGVybmF0aXZlc19iZWdpbiA9PSBhbHRlcm5hdGl2ZXNfZW5kKQogCQlyZXR1cm47
CiAKLQliZWdpbiA9ICh2b2lkICopaGRyICsgYWx0LT5zaF9vZmZzZXQsCi0JZW5kID0gKHZvaWQg
KiloZHIgKyBhbHQtPnNoX29mZnNldCArIGFsdC0+c2hfc2l6ZSwKLQotCV9hcHBseV9hbHRlcm5h
dGl2ZXMoKHN0cnVjdCBhbHRfZW50cnkgKiliZWdpbiwKLQkJCSAgICAoc3RydWN0IGFsdF9lbnRy
eSAqKWVuZCwKKwlfYXBwbHlfYWx0ZXJuYXRpdmVzKGJhc2UgKyBhbHRlcm5hdGl2ZXNfYmVnaW4s
CisJCQkgICAgYmFzZSArIGFsdGVybmF0aXZlc19lbmQsCiAJCQkgICAgUklTQ1ZfQUxURVJOQVRJ
VkVTX0JPT1QpOwogfQogCkBAIC0yMDQsMTAgKzE5NCwxNCBAQCB2b2lkIF9faW5pdCBhcHBseV9i
b290X2FsdGVybmF0aXZlcyh2b2lkKQogCQkJICAgIFJJU0NWX0FMVEVSTkFUSVZFU19CT09UKTsK
IAogCWlmIChJU19FTkFCTEVEKENPTkZJR19NTVUpKQotCQlhcHBseV92ZHNvX2FsdGVybmF0aXZl
cyh2ZHNvX3N0YXJ0KTsKKwkJYXBwbHlfdmRzb19hbHRlcm5hdGl2ZXModmRzb19zdGFydCwKKwkJ
CQkJX192ZHNvX2FsdGVybmF0aXZlc19zdGFydF9vZmZzZXQsCisJCQkJCV9fdmRzb19hbHRlcm5h
dGl2ZXNfZW5kX29mZnNldCk7CiAKIAlpZiAoSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfVVNFUl9D
RkkpKQotCQlhcHBseV92ZHNvX2FsdGVybmF0aXZlcyh2ZHNvX2NmaV9zdGFydCk7CisJCWFwcGx5
X3Zkc29fYWx0ZXJuYXRpdmVzKHZkc29fY2ZpX3N0YXJ0LAorCQkJCQlfX3Zkc29fYWx0ZXJuYXRp
dmVzX3N0YXJ0X2NmaV9vZmZzZXQsCisJCQkJCV9fdmRzb19hbHRlcm5hdGl2ZXNfZW5kX2NmaV9v
ZmZzZXQpOwogfQogCiAvKgoKLS0gCjIuNTUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
