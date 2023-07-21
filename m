Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DA7EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 11:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O9bDsg8q3t0iSXPIwCdq+mIFbqWhbovyTKJSFBcLiF4=; b=lLRikfczqtnKAw
	/A/7NSbtivDKNFwhDnbelQUz6OEAEof6BOzYTgq/yskl8NuMxtb3THywWrh6LXG1gkxjTNvaaMnfQ
	BEuL5oeZhnQabx+evM5RACoTn2LI8sWELm+H8nVJOZU6OlSxw9yriMDUtBCaMqpRsUPqyuTs0M+q3
	C3dbOcaaf1pfEHtp6xFE6SszV5HyL/3MHUu6u/hGJ0eBZyEbTkYRmTppm7bVxudlmSsRkYZ2Hg18o
	LYJg630hNtI7q0tUeE1qPiSgeZIZvSccKIdG+kjcKbwjQFw+L330OWUqAa3a41BM6mYQaNzD7a1+P
	ZJyLBUbPanha0/M0OgCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMonV-00DzWd-27;
	Fri, 21 Jul 2023 11:59:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMonS-00DzQW-1n
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 11:59:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689940782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Y7rbnaDJbn/YejSF4mQVA8Z4grlfMZHjKPnDFxLZ8A=;
	b=NLYxJ/tI375ddfrYE69u4PU4Z9h7i6tOguCLsIe+/EncQBl2Aqsf93Gj2dpLFHHmIJWLvd
	wEHK9+sHYSWQpfB86rX4TB+P5e6nKB+99bnGoy9jC96Rwt1F2pOlKeFgF426rwViuud1tV
	rJFa43qXP2DG3tN66TNOfIOxNbBopgE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-r-eThFJ5P8KDQB5sjqFULg-1; Fri, 21 Jul 2023 07:59:41 -0400
X-MC-Unique: r-eThFJ5P8KDQB5sjqFULg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-97542592eb9so118381866b.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 04:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689940780; x=1690545580;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Y7rbnaDJbn/YejSF4mQVA8Z4grlfMZHjKPnDFxLZ8A=;
        b=Gju4MAirmEwBD/bfQPE+4Lk66I608Jww7wfUIUdeSpVhGhZnv1NbuK6XvxlXr39vfx
         7rwunlQ15Z+ETrqQRhTsn5jug9Dpw6C1BDMT7OrGF2BkX1AqNVMq8uI0zaaJ+9C6j8sr
         rqlMCtLsTvqRuII9eHv8kLpFm2RGsEiNNgojdCj52i7TBZGeOc4FMO5HHfDOjtQ/w/4k
         caLb+qU7CLzPsiUrGZJrhPLtoD3gJTd6hmUsg88cKtfNAsKIUOg23sHYKyvk4YWf8wJ5
         MlWKNitipuSKMl0OxlYCcanxzu3SX+GCFDhC/qLTeUtnOjnfqMzqIR0ULg2Kpvufy0YQ
         vJyA==
X-Gm-Message-State: ABy/qLZeXlpLu1SLyQZ4VX1Qn0nNupeOEd/Ex1oa3u/latt8SKT250mC
	58X2CpcoK7Jbe9okv4ge3z4snuoqyKFSAj+26uRv90k2N/Q8pwhB0V4FkVU3L8d8q2QT1Vgytda
	WfXqntZ2GxVQPb8bU/LieIcstEYn0
X-Received: by 2002:a17:906:2da:b0:994:54af:e282 with SMTP id 26-20020a17090602da00b0099454afe282mr1360628ejk.10.1689940780003;
        Fri, 21 Jul 2023 04:59:40 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEk/l1rT7vVGyK6B+M0/vN6OF6CipTv2G0AE0UWGqg9sgFPNWcoUSGmc+Sw2v1G9OPem3PIcQ==
X-Received: by 2002:a17:906:2da:b0:994:54af:e282 with SMTP id 26-20020a17090602da00b0099454afe282mr1360600ejk.10.1689940779630;
        Fri, 21 Jul 2023 04:59:39 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id um15-20020a170906cf8f00b00992b3ea1ee3sm2078970ejb.159.2023.07.21.04.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 04:59:38 -0700 (PDT)
Message-ID: <6118063e-5c91-acc4-129f-3bacc19f25ce@redhat.com>
Date: Fri, 21 Jul 2023 13:59:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v11 09/29] KVM: x86: Disallow hugepages when memory
 attributes are mixed
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
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
 <20230718234512.1690985-10-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230718234512.1690985-10-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_045946_668693_185E3AB0 
X-CRM114-Status: GOOD (  10.69  )
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

On 7/19/23 01:44, Sean Christopherson wrote:
> +static bool range_has_attrs(struct kvm *kvm, gfn_t start, gfn_t end,
> +			    unsigned long attrs)
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

Can you move this function to virt/kvm/kvm_main.c?

Thanks,

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
