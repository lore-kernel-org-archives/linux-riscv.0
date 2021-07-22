Return-Path: <SRS0=ruHO=MO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2376C6377A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 02:39:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA6A960FF2
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 02:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA6A960FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZ/Vh5kmXU0WhRTB37w/dJtclJAYIa7Ua7emEayDMUQ=; b=KYINZ5wo8BGfn/FRaME7dxoFEN
	KR/HSO6BIGS5iesBeY2kxznfANl3iNNIQbaOaJMiHZ9gSAFv4+L6ivwFoo5wmyQkrkEcx3i+jmJG+
	1rKrtysbrvbhE+V+CS5/t4pB2M656Du3XYk5SuifrufMmyKc/f6t2s2kKekg0pyfuiSGXZ16ThhcD
	vIQko7iKuWjamEL2cRpcZRI25q3kBqWiBKy4QtE2krukEaj9SkhHqQ3lhh7dHPqZWT8asev6mRSqw
	JYhfhuExUnXi/nS4c7pNbWU9jJcUF+9k9PJqFNJsIUn4fA3Hnuj8Pc2UjBfJro1Dx0uOEHGH6gDmD
	4uY2xZWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6ObP-00021I-Hz; Thu, 22 Jul 2021 02:38:23 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6ObC-0001yb-F5; Thu, 22 Jul 2021 02:38:11 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="191827521"
X-IronPort-AV: E=Sophos;i="5.84,259,1620716400"; d="scan'208";a="191827521"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 19:38:09 -0700
X-IronPort-AV: E=Sophos;i="5.84,259,1620716400"; d="scan'208";a="512014134"
Received: from lingshan-mobl5.ccr.corp.intel.com (HELO [10.255.29.38])
 ([10.255.29.38])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 19:38:02 -0700
Subject: Re: [PATCH V8 01/18] perf/core: Use static_call to optimize
 perf_guest_info_callbacks
To: Like Xu <like.xu.linux@gmail.com>
Cc: bp@alien8.de, seanjc@google.com, vkuznets@redhat.com,
 wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
 kan.liang@linux.intel.com, ak@linux.intel.com, wei.w.wang@intel.com,
 eranian@google.com, liuxiangdong5@huawei.com, linux-kernel@vger.kernel.org,
 x86@kernel.org, kvm@vger.kernel.org, boris.ostrvsky@oracle.com,
 Like Xu <like.xu@linux.intel.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
 Nick Hu <nickhu@andestech.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 xen-devel@lists.xenproject.org, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210716085325.10300-1-lingshan.zhu@intel.com>
 <20210716085325.10300-2-lingshan.zhu@intel.com>
 <fd117e37-8063-63a4-43cd-7cb555e5bab5@gmail.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Message-ID: <c5fad2b5-2c2f-9b06-6f45-629776a690fa@intel.com>
Date: Thu, 22 Jul 2021 10:38:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <fd117e37-8063-63a4-43cd-7cb555e5bab5@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_193810_559217_EA430C7B 
X-CRM114-Status: GOOD (  10.48  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiA3LzIxLzIwMjEgNzo1NyBQTSwgTGlrZSBYdSB3cm90ZToKPiBPbiAxNi83LzIwMjEgNDo1
MyBwbSwgWmh1IExpbmdzaGFuIHdyb3RlOgo+PiArwqDCoMKgIH0gZWxzZSBpZiAoeGVucG11X2Rh
dGEtPnBtdS5yLnJlZ3MuY3BsICYgMykKb2gsIG15IHR5cG8sIHdpbGwgZml4IGluIFY5CgpUaGFu
a3MKPgo+IExpbmdzaGFuLCBzZXJpb3VzIGZvciB0aGlzIHZlcnNpb24gPwo+Cj4gYXJjaC94ODYv
eGVuL3BtdS5jOjQzODo5OiBlcnJvcjogZXhwZWN0ZWQgaWRlbnRpZmllciBvciDigJgo4oCZIGJl
Zm9yZSAKPiDigJhyZXR1cm7igJkKPiDCoCA0MzggfMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHN0
YXRlOwo+IMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqAgXn5+fn5+Cj4gYXJjaC94ODYveGVu
L3BtdS5jOjQzOToxOiBlcnJvcjogZXhwZWN0ZWQgaWRlbnRpZmllciBvciDigJgo4oCZIGJlZm9y
ZSDigJh94oCZIAo+IHRva2VuCj4gwqAgNDM5IHwgfQo+IMKgwqDCoMKgwqAgfCBeCj4gYXJjaC94
ODYveGVuL3BtdS5jOiBJbiBmdW5jdGlvbiDigJh4ZW5fZ3Vlc3Rfc3RhdGXigJk6Cj4gYXJjaC94
ODYveGVuL3BtdS5jOjQzNjo5OiBlcnJvcjogY29udHJvbCByZWFjaGVzIGVuZCBvZiBub24tdm9p
ZCAKPiBmdW5jdGlvbiBbLVdlcnJvcj1yZXR1cm4tdHlwZV0KPiDCoCA0MzYgfMKgwqDCoMKgwqDC
oMKgwqAgfQo+IMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqAgXgo+IGNjMTogc29tZSB3YXJu
aW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwo+Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHN0YXRlIHw9IFBFUkZfR1VFU1RfVVNFUjsKPj4gwqDCoMKgwqDCoCB9CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
