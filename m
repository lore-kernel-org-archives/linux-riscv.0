Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708C7CD37B0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 07:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lehxmfpqUCYS2QNdK3fP+HGmagEx1isr/un0wIWNlHg=; b=qtbueKRCcJG4Fy
	5IGlNFmCnmPCw3jt5drazqi4LEYGNehsM5xZENSyAp8fH3ipFNhkXU8vwA6UGOKoF3k7g1Lx1jynU
	9I00s2XjMFqruPehmOYdscyRiXplRZ5Ht0GpspvYUbIPd8u2wiDUGhg80wKifkUQ+WwDuDAaly8Ra
	fiFkZbvvE1F5ZN5TPkRJGeH6WgYKxPveMG2vUqhIGwNlNRi4ETe/3mrgtmlKJxMsE8m7j1/oRi9Hm
	CxSEc7QqkPhJOtvYFCcI4GzxwlJ/SuwwUJRzKMfWHNH3B7FziZ/0F3hJfmGaACMAwxyDhav3EUKQI
	5TYKoggacD7Sv+52qtKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi931-00EmZ8-02;
	Mon, 18 Sep 2023 07:51:59 +0000
Received: from mgamail.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi92y-00EmYI-0D;
	Mon, 18 Sep 2023 07:51:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695023516; x=1726559516;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=F92rNU2upp1sAb9O/m30BxSQQfs05gdxlTOIwaluPho=;
  b=k7RMbAKzSTyJbggFavO0e+48tohPOL0tDOhCohW2+ZAvFwnYJjNld8lA
   hPueXNmhYEjKYtCQAHETrcTjBz1OpUXzscBT0prvYPDCxwmh/gM32QOi3
   Ckd19u109SSOegVmPsSoaj5t36CdvYAdlpFubygmUPvkqatjKkIpWTZkU
   Hfsonn7hLti6G/TS5kak5bLcnUWcMoVtr9kG7VooHPXZU971SJm0L+0kB
   wB6zyRynY7U0HNVyrTSDNwcg/50BybUo1lY9NZVGq49YTq8UrQSk+3eZs
   Yd0wXqj1YSLRujyU5DmHX2HnS3iJHV2Fbmf6jrB4xgGEYAOzHJS+x+nid
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="382335541"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="382335541"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 00:51:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="811262156"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="811262156"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.238.8.84]) ([10.238.8.84])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 00:51:45 -0700
Message-ID: <d66795f8-e524-2912-4b71-92ca4ffe8807@linux.intel.com>
Date: Mon, 18 Sep 2023 15:51:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC PATCH v12 11/33] KVM: Introduce per-page memory attributes
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 Isaku Yamahata <isaku.yamahata@intel.com>, Xu Yilun <yilun.xu@intel.com>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Ackerley Tng <ackerleytng@google.com>,
 Maciej Szmigiero <mail@maciej.szmigiero.name>,
 David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>,
 Liam Merwick <liam.merwick@oracle.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20230914015531.1419405-1-seanjc@google.com>
 <20230914015531.1419405-12-seanjc@google.com>
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20230914015531.1419405-12-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_005156_143234_2771DEFC 
X-CRM114-Status: GOOD (  10.53  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 9/14/2023 9:55 AM, Sean Christopherson wrote:
> From: Chao Peng <chao.p.peng@linux.intel.com>
[...]
>   
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +/*
> + * Returns true if _all_ gfns in the range [@start, @end) have attributes
> + * matching @attrs.
> + */
> +bool kvm_range_has_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> +				     unsigned long attrs)
> +{
> +	XA_STATE(xas, &kvm->mem_attr_array, start);
> +	unsigned long index;
> +	bool has_attrs;
> +	void *entry;
> +
> +	rcu_read_lock();
> +
> +	if (!attrs) {
> +		has_attrs = !xas_find(&xas, end);
IIUIC, xas_find() is inclusive for "end", so here should be "end - 1" ?


> +		goto out;
> +	}
> +
> +	has_attrs = true;
> +	for (index = start; index < end; index++) {
> +		do {
> +			entry = xas_next(&xas);
> +		} while (xas_retry(&xas, entry));
> +
> +		if (xas.xa_index != index || xa_to_value(entry) != attrs) {
> +			has_attrs = false;
> +			break;
> +		}
> +	}
> +
> +out:
> +	rcu_read_unlock();
> +	return has_attrs;
> +}
> +
>
[...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
