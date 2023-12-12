Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C572C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 15:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ZK4MZSZDEv1Yqhntup2DP9HdgO5KH70fs9z2uhfWjA=; b=bXJHUhA75odph6
	3bbHp4lQyDPDkzCnGsivwUqE2UO6zJB7UyMlWsd2ag0v8h6eWsbGTnytv3/h7u64UF7T07DPjCpAg
	rGmJkIXIB0zsmZkwrjHK90oE26RkL9cDRtCsLulHXfAiC4yuo1nH5kEVBq1IF/M/Mk2yE4xggaMxH
	RlJ+VoU6PQRxqB3/jvRDz0W+UR5uFXQoPUYvUZQq4g2pIW01+JPNjpcVfZ6HUyxQih5kN/NPOWXGK
	BGwMXLizP34EIzOQHC0HziX7kb7FRa27wTkefeoUUObHc0Lwcw+nxpYG/pe5tzzlAj7xJ/U6hIGd+
	lN0M4tBTnpqiLIp4Xr9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD4QV-00C0al-2E;
	Tue, 12 Dec 2023 15:12:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD4QS-00C0aE-2y
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 15:12:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 765AD60DCF;
	Tue, 12 Dec 2023 15:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1582C433C8;
	Tue, 12 Dec 2023 15:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702393918;
	bh=qJZVkUQwvB5yqptiVyPjwSDan514T78OaHmGGXo4cLw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SERNwVN+4SLJQoEa3HqRgAZZbiXJlVBfLAVxOtfTX15GdDtuJspYAmXzv4MFV1a16
	 zCgyMfivpWOR3Zw61SMeVvblqy2mh+GtpS8gU9X+rdQEQlcsUqn1n6RIGYooQyzIYI
	 OI1Cxmw250+k373iZ8aXgAg7ySvuwc0PnT3lp5IeQpwCZCpXTPYb6uQyjIirjNwjvy
	 WWIsuhLa5pwkkc/46Fwtu/vNpjDntVvjkEkQMQGQURSvcqoEP5zxGofjTr6e/GDCIq
	 2FTExQ2GJkTD55QWJQe62JbDu1UAt29/5v+DkCF+0xHSN6ZeguoCHvXZkNT/6rZtS3
	 AyW6/zvpD0yvQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, lkp@intel.com,
 linux-mm@kvack.org, linux@weissschuh.net, llvm@lists.linux.dev,
 mcgrof@kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH -next] drivers: perf: Fix build error by adding const to
 ctl_table argument of handler
In-Reply-To: <20231207083512.51792-1-alexghiti@rivosinc.com>
References: <202312062242.RFPPozG9-lkp@intel.com>
 <20231207083512.51792-1-alexghiti@rivosinc.com>
Date: Tue, 12 Dec 2023 16:11:55 +0100
Message-ID: <877cljsbes.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_071201_003906_03526DEF 
X-CRM114-Status: GOOD (  11.83  )
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

QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cml0ZXM6Cgo+IFRoZSBj
dGxfdGFibGUgYXJndW1lbnQgb2YgdGhlIHByb2NfaGFuZGxlciBmaWVsZCB3YXMgY29uc3RpZmll
ZCB0cmVld2lkZQo+IGJ1dCBzb21laG93IG1pc3NlZCB0aGUgb2NjdXJyZW5jZSBpbiB0aGUgcmlz
Y3YgcG11IHNiaSBkcml2ZXIsIHNvIGFkZCB0aGUKPiBjb25zdCB0byBmaXggdGhlIGJ1aWxkIGVy
cm9yLgo+Cj4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+
IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDIzMTIwNjIy
NDIuUkZQUG96RzktbGtwQGludGVsLmNvbS8KPiBGaXhlczogYzhiZTllNjZjYTFlICgic3lzY3Rs
OiB0cmVld2lkZTogY29uc3RpZnkgdGhlIGN0bF90YWJsZSBhcmd1bWVudCBvZiBoYW5kbGVycyIp
Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jIHwgMiArLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmku
Ywo+IGluZGV4IDE2YWNkNGRjZGI5Ni4uOTdlMzQ1ZjdkMjVkIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiArKysgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3Ni
aS5jCj4gQEAgLTk4Niw3ICs5ODYsNyBAQCBzdGF0aWMgdm9pZCByaXNjdl9wbXVfdXBkYXRlX2Nv
dW50ZXJfYWNjZXNzKHZvaWQgKmluZm8pCj4gIAkJY3NyX3dyaXRlKENTUl9TQ09VTlRFUkVOLCAw
eDIpOwo+ICB9Cj4gIAo+IC1zdGF0aWMgaW50IHJpc2N2X3BtdV9wcm9jX3VzZXJfYWNjZXNzX2hh
bmRsZXIoc3RydWN0IGN0bF90YWJsZSAqdGFibGUsCj4gK3N0YXRpYyBpbnQgcmlzY3ZfcG11X3By
b2NfdXNlcl9hY2Nlc3NfaGFuZGxlcihjb25zdCBzdHJ1Y3QgY3RsX3RhYmxlICp0YWJsZSwKPiAg
CQkJCQkgICAgICBpbnQgd3JpdGUsIHZvaWQgKmJ1ZmZlciwKPiAgCQkJCQkgICAgICBzaXplX3Qg
KmxlbnAsIGxvZmZfdCAqcHBvcykKCkFkZGluZyBsaW51eC1yaXNjdi4KClJldmlld2VkLWJ5OiBC
asO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
