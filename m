Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA57C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 15:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xhJNohpyF3+RDQ/lkhjip2xx0y1P+bGbPaHHME1m4LM=; b=l5CJrcaJexAJyp
	NnLtUvaFuA0wQCvmctAvNeErupirx0eSN7NYEHleHQMOPVXzq/zzgl9+WlxkT4UsvLnOEdZveyhvG
	HhqPAVGtwC9I6bcJzRlVp2pILYslbVWe06CQWrSsdvdXTzt0gVO4aHIRnr5c5ljmfyIOQsx84qGNH
	EzG1mct8zxzaLNQoFGSP5A2wAJJkeBPJ5tOo2pb91s27tnmT9d4ANftnMyARkoC+EGWDFqctvexzJ
	QLiTTly2dvwSkp1pwKZb+DYJzf5yk5JJjeHAEtutj/NvmZMawL0u5eQRl3ZciFxWbANMvIqY1s1a3
	82+EMV8ITZ8h352jL80g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s55gI-00000001tDu-37ME;
	Thu, 09 May 2024 15:27:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s55gG-00000001tDH-2N51
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 15:27:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62329106F;
	Thu,  9 May 2024 08:27:56 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE4E03F641;
	Thu,  9 May 2024 08:27:28 -0700 (PDT)
Date: Thu, 9 May 2024 16:27:26 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: Re: [PATCH v5 2/3] riscv: cacheinfo: initialize cacheinfo's level
 and type from ACPI PPTT
Message-ID: <ZjzrXnOc5AAost4O@bogus>
References: <20240509073300.4968-1-cuiyunhui@bytedance.com>
 <20240509073300.4968-2-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240509073300.4968-2-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_082736_726896_01A74CD6 
X-CRM114-Status: UNSURE (   8.11  )
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
Cc: Conor Dooley <conor.dooley@microchip.com>, aou@eecs.berkeley.edu, rafael@kernel.org, jhugo@codeaurora.org, tiantao6@huawei.com, john.garry@huawei.com, linux-kernel@vger.kernel.org, jeremy.linton@arm.com, linux-acpi@vger.kernel.org, pierre.gondois@arm.com, palmer@dabbelt.com, Jonathan.Cameron@huawei.com, paul.walmsley@sifive.com, bhelgaas@google.com, james.morse@arm.com, linux-riscv@lists.infradead.org, lenb@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBNYXkgMDksIDIwMjQgYXQgMDM6MzI6NTlQTSArMDgwMCwgWXVuaHVpIEN1aSB3cm90
ZToKPiBCZWZvcmUgY2FjaGVpbmZvIGNhbiBiZSBidWlsdCBjb3JyZWN0bHksIHdlIG5lZWQgdG8g
aW5pdGlhbGl6ZSBsZXZlbAo+IGFuZCB0eXBlLiBTaW5jZSBSSVNDLVYgY3VycmVudGx5IGRvZXMg
bm90IGhhdmUgYSByZWdpc3RlciBncm91cCB0aGF0Cj4gZGVzY3JpYmVzIGNhY2hlLXJlbGF0ZWQg
YXR0cmlidXRlcyBsaWtlIEFSTTY0LCB3ZSBjYW5ub3Qgb2J0YWluIHRoZW0KPiBkaXJlY3RseSwg
c28gbm93IHdlIG9idGFpbiBjYWNoZSBsZWF2ZXMgZnJvbSB0aGUgQUNQSSBQUFRUIHRhYmxlCj4g
KGFjcGlfZ2V0X2NhY2hlX2luZm8oKSkgYW5kIHNldCB0aGUgY2FjaGUgdHlwZSB0aHJvdWdoIHNw
bGl0X2xldmVscy4KPiAKPiBTdWdnZXN0ZWQtYnk6IEplcmVteSBMaW50b24gPGplcmVteS5saW50
b25AYXJtLmNvbT4KPiBTdWdnZXN0ZWQtYnk6IFN1ZGVlcCBIb2xsYSA8c3VkZWVwLmhvbGxhQGFy
bS5jb20+CgpJIGFtIG5vdCBzdXJlIHdoeSB5b3UgaGF2ZSBub3QgYWRkZWQgbXkgcmV2aWV3ZWQt
YnkgYXMgSSB3YXMgaGFwcHkgd2l0aAp2MyBvbndhcmRzIElJUkMuIEFueXdheXMsIEkgd2lsbCBn
aXZlIGl0IGFnYWluIPCfmIQKClJldmlld2VkLWJ5OiBTdWRlZXAgSG9sbGEgPHN1ZGVlcC5ob2xs
YUBhcm0uY29tPgoKLS0gClJlZ2FyZHMsClN1ZGVlcAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
