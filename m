Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F00C48BC4
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 20:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xm8w8ATZmcJJL7Mw5cQM6HFc/KQYHHiaH3it6jVaQ7U=; b=XEMCp1eZl3L7LG
	2Fr/150CC2yQYhY7n+BO7XKCx2t1fYDV0iI5dSsBu4D1uzVfntXV/DEDQ8Z4Jyo4jNlhNQousXrkt
	S31AOE6WQPHEGYe7r8NU9m5qXY/P3zQt65fjZ4Ixwl+pKzTzl8g0SrC/wLdlv1oY1KjUSFmM0RzV8
	B0VdMRXkf4mkEVTHqpF2JW3M9rz8Conh8PAImPx5y9Zj4XXHC0U2CL33/3tvBU84xGb5UBqq5XAbx
	OvzO1kgYuaSMdv/fY9hBijJi+21PNra64Y2+Y6BziS76UltzdhfyXIHYDO50RWYNEmBlHd/jptSFh
	EE27RpNF+BN5WQLSenUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcXCx-0000000GBIG-1fMn;
	Tue, 20 Feb 2024 20:59:19 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcXCr-0000000GBGf-3o2T;
	Tue, 20 Feb 2024 20:59:17 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708462752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u21hqSyJPPttI5Wdupn9KsZ7LFUwPOf3FZzwjE066uA=;
	b=Xor8CRcTwPTSqaxO4FKKslN2jk/ojHSNTHculGtpBB1jNcLDtzMdKPK63WYFU5RZ57HQnI
	1uUoRztjwmqAbJqm/zBXBUrDkRbHGYGSJrioW6qIirJEtOtpKudjOyABlOQf3CoTreafDe
	Ip6of8Jvp7Fnd4kqiY/lPPzvzRbjCqzEwA3ZSvyF2wWyf8xRuXexUeeA973E1shLXl40u5
	1Jryfkg+L42BhQshHC3pwvG/4XzuBLzJ4paCnYcWRjdAPk85/SkILxv9Y4Q4bGPMSRHj4d
	bNrxxtCnn5zexBkWu36nHZdJgSY5c3eXo9pVdGY+tbnLeTXm1yDR9PlOYu4SHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708462752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u21hqSyJPPttI5Wdupn9KsZ7LFUwPOf3FZzwjE066uA=;
	b=vVXMvjvMnysVR+MWyo88LUHR5L6hT2UjdH5RZFhI+vY6FsaskvDlA/wloCfWkR9QnRegP1
	fGX+SdVpvh9+a8DA==
To: "Rafael J. Wysocki" <rafael@kernel.org>, Russell King
 <rmk+kernel@armlinux.org.uk>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org,
 acpica-devel@lists.linuxfoundation.org, linux-csky@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com, James Morse <james.morse@arm.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH RFC v4 02/15] ACPI: processor: Register all CPUs from
 acpi_processor_get_info()
In-Reply-To: <CAJZ5v0iiJpUWq5GMSnKFWQTzn_bdwoQz9m=hDaXNg4Lj_ePF4g@mail.gmail.com>
References: <Zbp5xzmFhKDAgHws@shell.armlinux.org.uk>
 <E1rVDmU-0027YP-Jz@rmk-PC.armlinux.org.uk>
 <CAJZ5v0iiJpUWq5GMSnKFWQTzn_bdwoQz9m=hDaXNg4Lj_ePF4g@mail.gmail.com>
Date: Tue, 20 Feb 2024 21:59:11 +0100
Message-ID: <87h6i2hmxs.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_125914_113570_63584616 
X-CRM114-Status: GOOD (  10.43  )
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

T24gVGh1LCBGZWIgMTUgMjAyNCBhdCAyMDoyMiwgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4g
T24gV2VkLCBKYW4gMzEsIDIwMjQgYXQgNTo1MOKAr1BNIFJ1c3NlbGwgS2luZyA8cm1rK2tlcm5l
bEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9iYXNlL2Nw
dS5jIGIvZHJpdmVycy9iYXNlL2NwdS5jCj4+IGluZGV4IDQ3ZGUwZjE0MGJhNi4uMTNkMDUyYmYx
M2Y0IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2Jhc2UvY3B1LmMKPj4gKysrIGIvZHJpdmVycy9i
YXNlL2NwdS5jCj4+IEBAIC01NTMsNyArNTUzLDExIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBjcHVf
ZGV2X3JlZ2lzdGVyX2dlbmVyaWModm9pZCkKPj4gIHsKPj4gICAgICAgICBpbnQgaSwgcmV0Owo+
Pgo+PiAtICAgICAgIGlmICghSVNfRU5BQkxFRChDT05GSUdfR0VORVJJQ19DUFVfREVWSUNFUykp
Cj4+ICsgICAgICAgLyoKPj4gKyAgICAgICAgKiBXaGVuIEFDUEkgaXMgZW5hYmxlZCwgQ1BVcyBh
cmUgcmVnaXN0ZXJlZCB2aWEKPj4gKyAgICAgICAgKiBhY3BpX3Byb2Nlc3Nvcl9nZXRfaW5mbygp
Lgo+PiArICAgICAgICAqLwo+PiArICAgICAgIGlmICghSVNfRU5BQkxFRChDT05GSUdfR0VORVJJ
Q19DUFVfREVWSUNFUykgfHwgIWFjcGlfZGlzYWJsZWQpCj4+ICAgICAgICAgICAgICAgICByZXR1
cm47Cj4KPiBIb25lc3RseSwgdGhpcyBsb29rcyBsaWtlIGEgcXVpY2sgaGFjayB0byBtZSBhbmQg
aXQgYWJzb2x1dGVseQo+IHJlcXVpcmVzIGFuIEFDSyBmcm9tIHRoZSB4ODYgbWFpbnRhaW5lcnMg
dG8gZ28gYW55d2hlcmUuCgpUaGF0IHNob3VsZCB3b3JrLCBidXQgeWVzIEkgYWdyZWUgaXQncyBh
bGwgYnV0IHByZXR0eS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
