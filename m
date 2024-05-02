Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3262C4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 01:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOUfzTm5qPLafceAi+ULeUSELNiJtMQ2Z/vrmcdHOI0=; b=t+crd+8c1NGeACyIX0rqmU8tAz
	2FRB34mIcy3AiaS69cEYVkA3QR7cWK/mb1b+j8eDWCWXlpoR8jLz0I0V/NNlZj0xN5x8fgOsUZ424
	MZV9PpOfU4ij0YYoDclinniN4KhqZU54TI/S9B95YXOoFlo1CGtnFAf/8spVGMhBS5M2e3LhfUdFU
	MGd1Moozaa8DC8ynJy1sQL547BGISAbSGdf//IFdo/TCFU+rqnH4Ry6GwHRb40T3A5R91QkI+WRzO
	hB+aSL/1eIRYSulfmD0ZLj/kai6WbPt0/TlRveaeQdolLmWSLk8r+ZDP+jYlXJ7/R95yDQyeSLk0j
	QUgRgu4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2LjI-0000000BAZj-195b;
	Thu, 02 May 2024 01:59:24 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2LjF-0000000BAZC-36At
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 01:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714615162; x=1746151162;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zKP4feh47Akq95l05ylgljUzunXEWN+72fMuFIKrAxs=;
  b=NDS5iUQ4xCN7uVFJkkaI4s28cTNtIgq+qTq525+dMd3+/lP0qGpDTfTU
   Ign7LlkBsVvZFt2JSTyMByM6oH9b0ePmyq4JCsIQXIvGUsd/0VzJEbVAk
   vjZk2KTmMIu4TjfSrTL0qCbUvqfvGs8UlEFgsdznSQwiNnLL5RS7CI0XP
   eRiRGtVk1HgOJStInqhpEt+myGGO1ahxMSKo/mNMrc5bwu420CTWdkI+z
   ug5zh//HaMjfg6axytWmfAngNAQsuRbgwn8Yg7gHKZtxaUSBUq/Ka3ykC
   LB8LGcUIIQhKSyV9H1kW7G2QUkyRZuXI+iT/6tS7EV2jNBsBHXSGY3NxD
   g==;
X-CSE-ConnectionGUID: 6cfTDCPfSvK6/T2hF/A/mw==
X-CSE-MsgGUID: g9UBpRjtTBGsZyo5TmFADQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10536760"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="10536760"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 18:59:20 -0700
X-CSE-ConnectionGUID: 5TEYAUJHQm6qKX56L2o3ug==
X-CSE-MsgGUID: BnZJQJRhTU2OMxt832m4uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="31782767"
Received: from unknown (HELO [10.239.159.127]) ([10.239.159.127])
  by orviesa004.jf.intel.com with ESMTP; 01 May 2024 18:59:15 -0700
Message-ID: <ed0e7138-c5db-40fb-ac12-36df007d0b4f@linux.intel.com>
Date: Thu, 2 May 2024 09:57:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] iommu/riscv: Device directory management.
To: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <cover.1714494653.git.tjeznach@rivosinc.com>
 <ce3b82a20db0b776685269674ce9b7a926d5680d.1714494653.git.tjeznach@rivosinc.com>
 <104358de-ea86-4e25-8942-ba285d6f317b@linux.intel.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <104358de-ea86-4e25-8942-ba285d6f317b@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_185921_881369_80A90BB1 
X-CRM114-Status: GOOD (  14.65  )
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

T24gNS8yLzI0IDk6MzggQU0sIEJhb2x1IEx1IHdyb3RlOgo+IE9uIDUvMS8yNCA0OjAxIEFNLCBU
b21hc3ogSmV6bmFjaCB3cm90ZToKPj4gQEAgLTEyOCw2ICs0ODksNyBAQCB2b2lkIHJpc2N2X2lv
bW11X3JlbW92ZShzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlIAo+PiAqaW9tbXUpCj4+IMKgIHsK
Pj4gwqDCoMKgwqDCoCBpb21tdV9kZXZpY2VfdW5yZWdpc3RlcigmaW9tbXUtPmlvbW11KTsKPj4g
wqDCoMKgwqDCoCBpb21tdV9kZXZpY2Vfc3lzZnNfcmVtb3ZlKCZpb21tdS0+aW9tbXUpOwo+PiAr
wqDCoMKgIHJpc2N2X2lvbW11X2lvZGlyX3NldF9tb2RlKGlvbW11LCBSSVNDVl9JT01NVV9ERFRQ
X01PREVfT0ZGKTsKPj4gwqAgfQo+PiDCoCBpbnQgcmlzY3ZfaW9tbXVfaW5pdChzdHJ1Y3Qgcmlz
Y3ZfaW9tbXVfZGV2aWNlICppb21tdSkKPj4gQEAgLTEzOCwxMiArNTAwLDEzIEBAIGludCByaXNj
dl9pb21tdV9pbml0KHN0cnVjdCByaXNjdl9pb21tdV9kZXZpY2UgCj4+ICppb21tdSkKPj4gwqDC
oMKgwqDCoCBpZiAocmMpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZGV2X2Vycl9wcm9i
ZShpb21tdS0+ZGV2LCByYywgInVuZXhwZWN0ZWQgZGV2aWNlIAo+PiBzdGF0ZVxuIik7Cj4+IC3C
oMKgwqAgLyoKPj4gLcKgwqDCoMKgICogUGxhY2Vob2xkZXIgZm9yIGEgY29tcGxldGUgSU9NTVUg
ZGV2aWNlIGluaXRpYWxpemF0aW9uLgo+PiAtwqDCoMKgwqAgKiBGb3Igbm93LCBvbmx5IGJhcmUg
bWluaW11bTogZW5hYmxlIGdsb2JhbCBpZGVudGl0eSBtYXBwaW5nIAo+PiBtb2RlIGFuZCByZWdp
c3RlciBzeXNmcy4KPj4gLcKgwqDCoMKgICovCj4+IC3CoMKgwqAgcmlzY3ZfaW9tbXVfd3JpdGVx
KGlvbW11LCBSSVNDVl9JT01NVV9SRUdfRERUUCwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgRklFTERfUFJFUChSSVNDVl9JT01NVV9ERFRQX01PREUsIAo+PiBSSVNDVl9JT01NVV9E
RFRQX01PREVfQkFSRSkpOwo+PiArwqDCoMKgIHJjID0gcmlzY3ZfaW9tbXVfaW9kaXJfYWxsb2Mo
aW9tbXUpOwo+PiArwqDCoMKgIGlmIChyYykKPj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gZXJyX2lu
aXQ7Cj4+ICsKPj4gK8KgwqDCoCByYyA9IHJpc2N2X2lvbW11X2lvZGlyX3NldF9tb2RlKGlvbW11
LCBSSVNDVl9JT01NVV9ERFRQX01PREVfTUFYKTsKPj4gK8KgwqDCoCBpZiAocmMpCj4+ICvCoMKg
wqDCoMKgwqDCoCBnb3RvIGVycl9pbml0Owo+PiDCoMKgwqDCoMKgIHJjID0gaW9tbXVfZGV2aWNl
X3N5c2ZzX2FkZCgmaW9tbXUtPmlvbW11LCBOVUxMLCBOVUxMLCAKPj4gInJpc2N2LWlvbW11QCVz
IiwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9uYW1l
KGlvbW11LT5kZXYpKTsKPiAKPiBUaGUgZGV2aWNlIGRpcmVjdG9yeSByb290IHBhZ2UgbWlnaHQg
YmUgYWxsb2NhdGVkIGluCj4gcmlzY3ZfaW9tbXVfaW9kaXJfYWxsb2MoKSwKPiAKPiArwqDCoMKg
IGlmICghaW9tbXUtPmRkdF9yb290KSB7Cj4gK8KgwqDCoMKgwqDCoMKgIGlvbW11LT5kZHRfcm9v
dCA9IHJpc2N2X2lvbW11X2dldF9wYWdlcyhpb21tdSwgMCk7Cj4gK8KgwqDCoMKgwqDCoMKgIGlv
bW11LT5kZHRfcGh5cyA9IF9fcGEoaW9tbXUtPmRkdF9yb290KTsKPiArwqDCoMKgIH0KPiAKPiBC
dXQgSSBkaWRuJ3QgZmluZCBhbnkgcGxhY2UgdG8gZnJlZSBpdCBpbiB0aGUgZXJyb3IgcGF0aHMu
IERpZCBJCj4gb3Zlcmxvb2sgYW55dGhpbmc/CgpJIGZvdW5kIHRoZSBhbnN3ZXIgYnkgbXlzZWxm
LiBkZXZyZXNfYWxsb2MoKSBpcyB1c2VkIHNvIHRoZSBwYWdlIG1lbW9yeQpyZXNvdXJjZXMgYXJl
IG1hbmFnZWQgYnkgdGhlIGRyaXZlciBjb3JlIGF1dG9tYXRpY2FsbHkuIFBsZWFzZSBpZ25vcmUK
dGhlIGFib3ZlIGNvbW1lbnQuCgpOb3Qgc3VyZSBhYm91dCB0aGUgcGFnZXMgZm9yIHBhZ2luZyBk
b21haW4uIElmIGFsbCBwYWdlcyByZWxlYXNlIGlzCmRlZmVycmVkLCBpdCBtYXkgY2F1c2UgYmln
IG1lbW9yeSBjb25zdW1wdGlvbi4gV2UgaGF2ZSBhIHRyYWRlLW9mZiBoZXJlLgpPbiBvbmUgaGFu
ZCwgdGhpcyBtaWdodCBzcGVlZCB1cCB0aGUgZG9tYWluIG1hcHBpbmcgc2luY2UgYWxsIHBhZ2Vz
Cm1pZ2h0IGJlIHByZWFsbG9jYXRlZDsgb24gdGhlIG90aGVyIGhhbmQsIGl0IHdpbGwgY29zdCBt
b3JlIG1lbW9yeS4KCkJlc3QgcmVnYXJkcywKYmFvbHUKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
