Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CD4C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 06:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XeBe0GUQtWRcWqKad90UXvPm8cTUa4S0oOwBBJlnrNo=; b=1Opz5N8m45j4Zr
	oAwb92FEHOVUaTqo7sZJQEWi1ViaSQhk+5nSl7v4QtWSdfnVq9i8fMZxvHSXb5FXLd+DQUn16SEbm
	qs7fVIvj6go2e4UhwHGWqYoKH0Iyzj60u/iaAFi+rmNaDSafZEY/Fjet2oi9VyiWwtkEjYLW3O59g
	pThqUgHwUkkqJwhUAq2DfBADf2HyYujSOxP629G+eYXWr6zYAsjdgsqAFjvXuEWLyV1oZj84N3h/a
	BmoE0SC/n6Xdi4nAUoxpvypK+UzB2CseGBGzvjgC/eUKTaxTpp0PsSpJeIChHmyJWZADMe9eUrLp9
	9jUJVjuXa+HDLJtmSR6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyQkc-008nBx-21;
	Thu, 02 Nov 2023 06:00:18 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyQkW-008n9W-07;
	Thu, 02 Nov 2023 06:00:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698904812; x=1730440812;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ou5/8bq0/RVZthvT/yQo+QsMVA9om+MCO0TErMQh5Kw=;
  b=c5wbeiREiN2KALcZh8hwv8X9w8lgapff7lWj8pPyGZK8lBCleCh22/cq
   UcTiVNi/xsML9ylAwAS3SlxQVwFFWRXij/KKT8FzEc0gmGOSRnoa8QDnG
   wEFSfW+YXNdsZeBTi5XcjxGQ6gbGl1NvvHIlBOlowwjBm85PfyW9QQr+5
   Ngmz7/sMnYcXP5dSZl0eiuQF4vTfGf42WsnsfgrQFSbSV5z3UZ3ol2kto
   9yJZDHEZSoT5p/3DCETXhE7CB2MNGCnIq0tk8AiJovra5NVibWifXkGif
   uN7rdW1sh0E9s/LVGTN+IJ5p1v2WuFc37POWFWnlMDs3gCJu7GL5O6psR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="10174681"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="10174681"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 23:00:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="884777553"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="884777553"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.238.2.253]) ([10.238.2.253])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 22:59:55 -0700
Message-ID: <9963b77c-3a38-4f89-b21e-48d0fdda8f53@linux.intel.com>
Date: Thu, 2 Nov 2023 13:59:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 12/35] KVM: Prepare for handling only shared mappings
 in mmu_notifier events
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>,
 Xu Yilun <yilun.xu@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>,
 Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Anish Moorthy <amoorthy@google.com>, David Matlack <dmatlack@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?=
 =?UTF-8?Q?n?= <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>,
 Vishal Annapurve <vannapurve@google.com>,
 Ackerley Tng <ackerleytng@google.com>,
 Maciej Szmigiero <mail@maciej.szmigiero.name>,
 David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>,
 Liam Merwick <liam.merwick@oracle.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-13-seanjc@google.com>
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20231027182217.3615211-13-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_230012_086082_7937DA5C 
X-CRM114-Status: GOOD (  18.24  )
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

CgpPbiAxMC8yOC8yMDIzIDI6MjEgQU0sIFNlYW4gQ2hyaXN0b3BoZXJzb24gd3JvdGU6Cj4gQWRk
IGZsYWdzIHRvICJzdHJ1Y3Qga3ZtX2dmbl9yYW5nZSIgdG8gbGV0IG5vdGlmaWVyIGV2ZW50cyB0
YXJnZXQgb25seQo+IHNoYXJlZCBhbmQgb25seSBwcml2YXRlIG1hcHBpbmdzLCBhbmQgd3JpdGUg
dXAgdGhlIGV4aXN0aW5nIG1tdV9ub3RpZmllcgo+IGV2ZW50cyB0byBiZSBzaGFyZWQtb25seSAo
cHJpdmF0ZSBtZW1vcnkgaXMgbmV2ZXIgYXNzb2NpYXRlZCB3aXRoIGEKPiB1c2Vyc3BhY2Ugdmly
dHVhbCBhZGRyZXNzLCBpLmUuIGNhbid0IGJlIHJlYWNoZWQgdmlhIG1tdV9ub3RpZmllcnMpLgo+
Cj4gQWRkIHR3byBmbGFncyBzbyB0aGF0IEtWTSBjYW4gaGFuZGxlIHRoZSB0aHJlZSBwb3NzaWJp
bGl0aWVzIChzaGFyZWQsCj4gcHJpdmF0ZSwgYW5kIHNoYXJlZCtwcml2YXRlKSB3aXRob3V0IG5l
ZWRpbmcgc29tZXRoaW5nIGxpa2UgYSB0cmktc3RhdGUKPiBlbnVtLgpJIHNlZSB0aGUgdHdvIGZs
YWdzIGFyZSBzZXQvY2xlYXJlZCBpbiBfX2t2bV9oYW5kbGVfaHZhX3JhbmdlKCkgaW4gdGhpcyAK
cGF0Y2gKYW5kIGt2bV9oYW5kbGVfZ2ZuX3JhbmdlKCkgZnJvbSB0aGUgbGF0ZXIgcGF0Y2ggMTMv
MzUsIGJ1dCBJIGRpZG4ndCBzZWUgdGhleQphcmUgdXNlZC9yZWFkIGluIHRoaXMgcGF0Y2ggc2Vy
aWVzIGlmIEkgZGlkbid0IG1pc3MgYW55dGhpbmcuwqAgSG93IGFyZSB0aGV5CnN1cHBvc2VkIHRv
IGJlIHVzZWQgaW4gS1ZNPwoKCj4KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
WkpYMGhrK0twUVAwS1V5QkBnb29nbGUuY29tCj4gU2lnbmVkLW9mZi1ieTogU2VhbiBDaHJpc3Rv
cGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Cj4gLS0tCj4gICBpbmNsdWRlL2xpbnV4L2t2bV9o
b3N0LmggfCAyICsrCj4gICB2aXJ0L2t2bS9rdm1fbWFpbi5jICAgICAgfCA3ICsrKysrKysKPiAg
IDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9rdm1faG9zdC5oIGIvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCj4gaW5kZXggOTZh
YTkzMDUzNmIxLi44OWMxYTk5MWEzYjggMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9rdm1f
aG9zdC5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCj4gQEAgLTI2Myw2ICsyNjMs
OCBAQCBzdHJ1Y3Qga3ZtX2dmbl9yYW5nZSB7Cj4gICAJZ2ZuX3Qgc3RhcnQ7Cj4gICAJZ2ZuX3Qg
ZW5kOwo+ICAgCXVuaW9uIGt2bV9tbXVfbm90aWZpZXJfYXJnIGFyZzsKPiArCWJvb2wgb25seV9w
cml2YXRlOwo+ICsJYm9vbCBvbmx5X3NoYXJlZDsKPiAgIAlib29sIG1heV9ibG9jazsKPiAgIH07
Cj4gICBib29sIGt2bV91bm1hcF9nZm5fcmFuZ2Uoc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3Zt
X2dmbl9yYW5nZSAqcmFuZ2UpOwo+IGRpZmYgLS1naXQgYS92aXJ0L2t2bS9rdm1fbWFpbi5jIGIv
dmlydC9rdm0va3ZtX21haW4uYwo+IGluZGV4IGNiOTM3NjgzM2MxOC4uMzAyY2NiODdiNGMxIDEw
MDY0NAo+IC0tLSBhL3ZpcnQva3ZtL2t2bV9tYWluLmMKPiArKysgYi92aXJ0L2t2bS9rdm1fbWFp
bi5jCj4gQEAgLTYzNSw2ICs2MzUsMTMgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBrdm1fbW5f
cmV0X3QgX19rdm1faGFuZGxlX2h2YV9yYW5nZShzdHJ1Y3Qga3ZtICprdm0sCj4gICAJCQkgKiB0
aGUgc2Vjb25kIG9yIGxhdGVyIGludm9jYXRpb24gb2YgdGhlIGhhbmRsZXIpLgo+ICAgCQkJICov
Cj4gICAJCQlnZm5fcmFuZ2UuYXJnID0gcmFuZ2UtPmFyZzsKPiArCj4gKwkJCS8qCj4gKwkJCSAq
IEhWQS1iYXNlZCBub3RpZmljYXRpb25zIGFyZW4ndCByZWxldmFudCB0byBwcml2YXRlCj4gKwkJ
CSAqIG1hcHBpbmdzIGFzIHRoZXkgZG9uJ3QgaGF2ZSBhIHVzZXJzcGFjZSBtYXBwaW5nLgo+ICsJ
CQkgKi8KPiArCQkJZ2ZuX3JhbmdlLm9ubHlfcHJpdmF0ZSA9IGZhbHNlOwo+ICsJCQlnZm5fcmFu
Z2Uub25seV9zaGFyZWQgPSB0cnVlOwo+ICAgCQkJZ2ZuX3JhbmdlLm1heV9ibG9jayA9IHJhbmdl
LT5tYXlfYmxvY2s7Cj4gICAKPiAgIAkJCS8qCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
