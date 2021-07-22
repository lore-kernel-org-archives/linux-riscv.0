Return-Path: <SRS0=ruHO=MO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 549C6C6377A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 03:04:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26D406108B
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 03:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26D406108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCujiBo5MRqCwkPxoUgJ/MRKj+gMgoMpeyDHHgNYnkc=; b=d57ijaWfQfaBKc2FfXqvsu16cG
	RgZm8O9DryeOtgB4+ynZjyQUfrKq4LQ7+dexf8sdnW6hDjvssospW8LZL5h2EVtR9sK2yWnZrsoGJ
	lGCAyfx3dlOHw4RvDeo+fCMuFO57UdBKNiWNOOCzhzGk2JiAs5x7B9hks5n3EIHmXyX6myasrhee/
	apVp8Y69fRo6gGUUq82wDVEy0fTFxNUMYhAEhDHwLt++9UZjXzTXpkP/23ec2fOHOx9BFP0TbObe2
	8AED25O7KaA7IwtyzTeJBfqzWGCBu6mfoYxpjkXJpFAB8l32lKybDoZxa046HeOJUCnL4gAkGOHQx
	2jGf4MCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6P0M-0005c3-4h; Thu, 22 Jul 2021 03:04:10 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6P09-0005aO-Aj; Thu, 22 Jul 2021 03:03:58 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="191137744"
X-IronPort-AV: E=Sophos;i="5.84,259,1620716400"; d="scan'208";a="191137744"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 20:03:54 -0700
X-IronPort-AV: E=Sophos;i="5.84,259,1620716400"; d="scan'208";a="512019825"
Received: from lingshan-mobl5.ccr.corp.intel.com (HELO [10.255.29.38])
 ([10.255.29.38])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 20:03:46 -0700
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
Message-ID: <e8a7de91-fe48-c570-3cea-a296278a7c8a@intel.com>
Date: Thu, 22 Jul 2021 11:03:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <fd117e37-8063-63a4-43cd-7cb555e5bab5@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_200357_409907_39BAEDE4 
X-CRM114-Status: GOOD (  10.80  )
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
dGEtPnBtdS5yLnJlZ3MuY3BsICYgMykKPgo+IExpbmdzaGFuLCBzZXJpb3VzIGZvciB0aGlzIHZl
cnNpb24gPwo+Cj4gYXJjaC94ODYveGVuL3BtdS5jOjQzODo5OiBlcnJvcjogZXhwZWN0ZWQgaWRl
bnRpZmllciBvciDigJgo4oCZIGJlZm9yZSAKPiDigJhyZXR1cm7igJkKPiDCoCA0MzggfMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIHN0YXRlOwo+IMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqAg
Xn5+fn5+Cj4gYXJjaC94ODYveGVuL3BtdS5jOjQzOToxOiBlcnJvcjogZXhwZWN0ZWQgaWRlbnRp
ZmllciBvciDigJgo4oCZIGJlZm9yZSDigJh94oCZIAo+IHRva2VuCj4gwqAgNDM5IHwgfQo+IMKg
wqDCoMKgwqAgfCBeCj4gYXJjaC94ODYveGVuL3BtdS5jOiBJbiBmdW5jdGlvbiDigJh4ZW5fZ3Vl
c3Rfc3RhdGXigJk6Cj4gYXJjaC94ODYveGVuL3BtdS5jOjQzNjo5OiBlcnJvcjogY29udHJvbCBy
ZWFjaGVzIGVuZCBvZiBub24tdm9pZCAKPiBmdW5jdGlvbiBbLVdlcnJvcj1yZXR1cm4tdHlwZV0K
PiDCoCA0MzYgfMKgwqDCoMKgwqDCoMKgwqAgfQo+IMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKg
wqAgXgo+IGNjMTogc29tZSB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwo+Cj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXRlIHw9IFBFUkZfR1VFU1RfVVNFUjsKPj4gwqDCoMKg
wqDCoCB9CmZvcmdvdCB0byBlbmFibGUgWEVOIGJ1aWxkIGluIC5jb25maWcsIFY5IGZpeGVzIHRo
aXMgd2lsbCBjb21lIHNvb24KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
