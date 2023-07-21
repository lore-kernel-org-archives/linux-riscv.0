Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41575C0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 15:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jUTV+Va4qhj6THVtO0eeYg1vyQYOacA3wW1g6ZIMJgg=; b=YLL5PeBYYWbYtO
	5wJ8neC+IGqJbnyyX4ne09N4LlOKJ54fwQ/lT9HgujWHNC3p8FvqIWKSWVrBqUrbon0001fnrPvVZ
	rcW+W9kOLDu2QTK1uF/yS8n1Z9fo7YzgFGiV7dFk7HRvHHpFxUmUHgRWA18jhuhjm608vGPovyiGO
	1wCxIhDRtAJxqIqN0gjEzQ3lJ+wPRfY8VUSgW8+LxRTweHh29UhjR6U2dfRjJS3T5ijyXlQoGOmtM
	UKkDv+UR1l8eRHj/P9Mjo0PiSIywLo2Xgpyni7NW+rTWsx8Bzs1RwbKr/bMGChAJ/v1O7iWhf4vuh
	qPbYbRkls54peGwLIleA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMsGu-00ESSw-1D;
	Fri, 21 Jul 2023 15:42:24 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMsGq-00ESSA-3A;
	Fri, 21 Jul 2023 15:42:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689954140; x=1721490140;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=dgWqCDpNSWuzZvJih5GvRdqDtkxO0fYOrqXInsikkp8=;
  b=Bdht11JlzuM2IdRQlA1az3gNEKhWCb7NqR0Oa8NKVofUZXGhau7NEP7m
   M8M++jhSyV9vrEr7h8KlT+0e4ky/yI8GdWzETWzz9vImVT636zJMLk2pc
   t9AxN3VmF4CmgIE8D+LoHiJmGkXwW1SCyLEAIb6K8TJrsJ735qxbA9V1H
   DldHGmduttvOlgbA7DjGTG/KqMvU/cTol/qNyMlPQlx7EWficFvoOH0HJ
   E3N7MEa5Qnrui6MhWdSx66QzXYFnQl4h93gLETJXHoYXEpUGAvkDck1Jj
   0mFJZgYqBSgAYFKhP0OkqlmtzQVpaFOnq78zzd4pgihoDRQpX6F2bgV8x
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="367087046"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="367087046"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 08:42:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="868274880"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.93.6.77]) ([10.93.6.77])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 08:42:09 -0700
Message-ID: <29baac45-7736-a28c-3b2d-2a6e45171b8b@intel.com>
Date: Fri, 21 Jul 2023 23:42:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chao Peng <chao.p.peng@linux.intel.com>,
 Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 Vishal Annapurve <vannapurve@google.com>,
 Ackerley Tng <ackerleytng@google.com>,
 Maciej Szmigiero <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>,
 Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>,
 Wang <wei.w.wang@intel.com>, Liam Merwick <liam.merwick@oracle.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-13-seanjc@google.com>
 <fdc155f5-041b-a1b1-15aa-8f970180a13a@intel.com>
In-Reply-To: <fdc155f5-041b-a1b1-15aa-8f970180a13a@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_084221_029528_2C6152C3 
X-CRM114-Status: UNSURE (   9.75  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNy8yMS8yMDIzIDExOjA1IFBNLCBYaWFveWFvIExpIHdyb3RlOgo+IE9uIDcvMTkvMjAyMyA3
OjQ0IEFNLCBTZWFuIENocmlzdG9waGVyc29uIHdyb3RlOgo+PiBAQCAtNjI1NSwxMiArNjI5OCwx
NyBAQCBpbnQga3ZtX2luaXQodW5zaWduZWQgdmNwdV9zaXplLCB1bnNpZ25lZCAKPj4gdmNwdV9h
bGlnbiwgc3RydWN0IG1vZHVsZSAqbW9kdWxlKQo+PiDCoMKgwqDCoMKgIGlmIChyKQo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgZ290byBlcnJfYXN5bmNfcGY7Cj4+ICvCoMKgwqAgciA9IGt2bV9nbWVt
X2luaXQoKTsKPj4gK8KgwqDCoCBpZiAocikKPj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gZXJyX2dt
ZW07Cj4+ICsKPj4gwqDCoMKgwqDCoCBrdm1fY2hhcmRldl9vcHMub3duZXIgPSBtb2R1bGU7Cj4+
IMKgwqDCoMKgwqAga3ZtX3ByZWVtcHRfb3BzLnNjaGVkX2luID0ga3ZtX3NjaGVkX2luOwo+PiDC
oMKgwqDCoMKgIGt2bV9wcmVlbXB0X29wcy5zY2hlZF9vdXQgPSBrdm1fc2NoZWRfb3V0Owo+PiDC
oMKgwqDCoMKgIGt2bV9pbml0X2RlYnVnKCk7Cj4+ICvCoMKgwqAga3ZtX2dtZW1faW5pdCgpOwo+
IAo+IHdoeSBrdm1fZ21lbV9pbml0KCkgbmVlZHMgdG8gYmUgY2FsbGVkIGFnYWluPyBieSBtaXN0
YWtlPwoKSSdtIHN1cmUgaXQncyBhIG1pc3Rha2UuCgpJJ20gdGVzdGluZyB0aGUgZ21lbSBRRU1V
IHdpdGggdGhpcyBzZXJpZXMuIFNXX1BST1RFQ1RFRF9WTSBnZXRzIHN0dWNrIAppbiBhIGxvb3Ag
aW4gZWFybHkgT1ZNRiBjb2RlIGR1ZSB0byB0d28gc2hhcmVkIHBhZ2Ugb2YgT1ZNRiBnZXQgemFw
cGVkIAphbmQgcmUtbWFwcGVkIGluZmluaXRlbHkuIFJlbW92aW5nIHRoZSBzZWNvbmQgY2FsbCBv
ZiBrdm1fZ21lbV9pbml0KCkgCmNhbiBzb2x2ZSB0aGUgaXNzdWUsIHRob3VnaCBJJ20gbm90IHN1
cmUgYWJvdXQgdGhlIHJlYXNvbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
