Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490DFC4345F
	for <linux-riscv@archiver.kernel.org>; Sat,  4 May 2024 02:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3j57sHT2zSM6J37GfkX5JL+qR9Ik/N7WMFZmMHmBXf4=; b=chiGpYSsvJdq7Cg1AkODpheno0
	H710Wo1Rdl93KoSHL/aJgRuOyUUAHpr46B5pHRrWKn4u+yfGXole8jzRGsrbkYE2BrQj324L4PHfI
	EhhmQKZLWn0rWc746Gn4EIIPaGTWZI2d4QlhzQ0vUQn8szxKkH+g5wnOxpRf/dNCQFn5VoDO/xBhX
	tupa9qBb0oz3TB291AYuc8Fcdxy2Vkig1kNvkSo4AMvG+VHc4lsZWVLrilT8O58+RHERsgXSLDEHy
	5DRpNB1cGBVWDqGr3xmKKMk3brDEyNnwVJNNRxrqVgt/L6iWk6B84pt/jKflU4B21d07KtDF4Kaxl
	yGy+sSaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s34mS-000000011lU-45jI;
	Sat, 04 May 2024 02:05:40 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s34mQ-000000011kx-08oK
	for linux-riscv@lists.infradead.org;
	Sat, 04 May 2024 02:05:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714788338; x=1746324338;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7klp7IIY3XFtHFhsC2ojag4m07iXNC50Ffi+qHgcjKk=;
  b=cpauNhvSVQQVytsdujuK7TBLn6HVH6EfIXn1z37MXIvzUoClqTWIGwzP
   XpHh0EdkynQP4K3Oq9xBLSNeqZCf4yu8KQKnsTtpNbetEdbvjHoPwT2ms
   OuH42ojuqipajXcv4b7z/WiifoghQS33IEuOlcwsO8ZrI0SdXjVf/wfil
   auHu6cadgrv39Ret1LYCI3aUWsmJcWg315IAixJtO5OI1IRhP2t7mvm/Z
   lIrLfH+T0IYi4Ume8o8+V4vYVl6xhEaUeKhh40Qwo8oD2R2ZLDPLelj2c
   O4ds1m8L3FQ0bGiuPbTs55YnWfnElO+VXXrjVODBqCHse6FcVshKYrEHE
   w==;
X-CSE-ConnectionGUID: Yc/iFS8CR0On4qB5bs79+Q==
X-CSE-MsgGUID: /k8ROvV/Ri2dq+oQpSkXAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14395662"
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; 
   d="scan'208";a="14395662"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 19:05:36 -0700
X-CSE-ConnectionGUID: LoYy6EzuQwejfXItCMF5OQ==
X-CSE-MsgGUID: pIjcEpz0SHWP9ccYOy3Ogg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; 
   d="scan'208";a="58817915"
Received: from unknown (HELO [10.239.159.127]) ([10.239.159.127])
  by fmviesa001.fm.intel.com with ESMTP; 03 May 2024 19:05:32 -0700
Message-ID: <0db1f6d3-5eb7-4cda-877e-80d477333db9@linux.intel.com>
Date: Sat, 4 May 2024 10:03:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] iommu/riscv: Paging domain support
To: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <cover.1714752293.git.tjeznach@rivosinc.com>
 <1cda67ed73f0a1d5cb906b3692a90ab35416f2ba.1714752293.git.tjeznach@rivosinc.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <1cda67ed73f0a1d5cb906b3692a90ab35416f2ba.1714752293.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_190538_164460_5F489CE8 
X-CRM114-Status: UNSURE (   9.12  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, baolu.lu@linux.intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNS80LzI0IDEyOjEyIEFNLCBUb21hc3ogSmV6bmFjaCB3cm90ZToKPiBJbnRyb2R1Y2UgZmly
c3Qtc3RhZ2UgYWRkcmVzcyB0cmFuc2xhdGlvbiBzdXBwb3J0Lgo+IAo+IFBhZ2UgdGFibGUgY29u
ZmlndXJlZCBieSB0aGUgSU9NTVUgZHJpdmVyIHdpbGwgdXNlIHRoZSBoaWdoZXN0IG1vZGUKPiBp
bXBsZW1lbnRlZCBieSB0aGUgaGFyZHdhcmUsIHVubGVzcyBub3Qga25vd24gYXQgdGhlIGRvbWFp
biBhbGxvY2F0aW9uCj4gdGltZSBmYWxsaW5nIGJhY2sgdG8gdGhlIENQVeKAmXMgTU1VIHBhZ2Ug
bW9kZS4KPiAKPiBUaGlzIGNoYW5nZSBpbnRyb2R1Y2VzIElPVElOVkFMLlZNQSBjb21tYW5kLCBy
ZXF1aXJlZCB0byBpbnZhbGlkYXRlCj4gYW55IGNhY2hlZCBJT0FUQyBlbnRyaWVzIGFmdGVyIG1h
cHBpbmcgaXMgdXBkYXRlZCBhbmQvb3IgcmVtb3ZlZCBmcm9tCj4gdGhlIHBhZ2luZyBkb21haW4u
ICBJbnZhbGlkYXRpb25zIGZvciB0aGUgbm9uLWxlYWYgcGFnZSBlbnRyaWVzIHVzZQo+IElPVElO
VkFMIGZvciBhbGwgYWRkcmVzc2VzIGFzc2lnbmVkIHRvIHRoZSBwcm90ZWN0aW9uIGRvbWFpbiBm
b3IKPiBoYXJkd2FyZSBub3Qgc3VwcG9ydGluZyBtb3JlIGdyYW51bGFyIG5vbi1sZWFmIHBhZ2Ug
dGFibGUgY2FjaGUKPiBpbnZhbGlkYXRpb25zLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRvbWFzeiBK
ZXpuYWNoPHRqZXpuYWNoQHJpdm9zaW5jLmNvbT4KClJldmlld2VkLWJ5OiBMdSBCYW9sdSA8YmFv
bHUubHVAbGludXguaW50ZWwuY29tPgoKQmVzdCByZWdhcmRzLApiYW9sdQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
