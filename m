Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF1FC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 23:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HiUtU8GYc/G1xJFor9YhphTwIZRxCYhxqRLK22jSIsM=; b=YPwsTK5Hgn7rWi
	8HRByCwZmJPcNq40KqgXho3O+I/4zJKbTtzgNytkdOWssHv2hcbpj04pVXbURzt8nxnK8tDs6ysQl
	BvjU1zxs8YpVTTIenSxmIePbRCVINYZ/F/+s/+CQXtvWnckL2R7AdGekY2lWdSPz/Wgz1ZSaHG8l+
	Z4O8plHf7mDI+W2LmKpBJFDbSgf9GfBidO+2ItJWzUPeLJu0wSXf4CA7AHEty2P8GQkgD/pqzomw8
	kwfSyKip8Co/eXoUtMDDOv+rw5NvN2mcRr83HCGSSd3QUxxz0w4Y3UR8q+T/+GopqE29bZTyM9uMC
	yt5EJb5JdFd55snm4uoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4rxk-006xrv-BP; Mon, 12 Dec 2022 23:11:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4rxa-006xlJ-LN
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 23:11:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670886704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ro+zcDO7opJfp7WFDTaK4QIlqGiqpBQjwVa0Lz8JmGo=;
	b=NeJT55RQ3SNHTKrzw9n1zud4OqrpJZ4wUmIGc0yw5WM+WEt2rdPTV+SeY1qHHoT766xQFI
	LH4RGL/isKhTISellTHFCutaUbgHj3ZO/Y/QL44ye/QuhljbFtnjToKBk+q4z+aL645B3s
	5CHuRguylcWkr+b65+OI7UxpIknlT1E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-277-lUzGMWKDOQWquoc6ba87PA-1; Mon, 12 Dec 2022 18:11:43 -0500
X-MC-Unique: lUzGMWKDOQWquoc6ba87PA-1
Received: by mail-wm1-f70.google.com with SMTP id i9-20020a1c3b09000000b003d21fa95c38so2002651wma.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 15:11:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ro+zcDO7opJfp7WFDTaK4QIlqGiqpBQjwVa0Lz8JmGo=;
        b=cgfudwXXoP2BiypSaKvMLFHsjgqTJAaL3bTPmTMaT98te0WNjRYeswkaAWDGW00WGK
         58h4TqECADxH/QbsxYGqUARcCW4n1FMssCZmVgq6CbeJOBl8Ir9JDQzinak44zahcq8F
         IiRO1aTOx8+bAE6OWO5MZf2ra1EkV5P7DHG1Pqilu9uQPJKlllfOoKtqZ0UcDOzjoEjA
         Lbr11/W+nbWMva27QXvxl4a9uImidfHgEF4L9fRasJoOUbazl6rnDSEqaoMJKMycw87y
         FfXlDt3pEVPoN4CSc1+AcRFd/9VRzxUGRU4XapNuBQJ2gGc5pdK2Y6CZAAEkyR16m6D6
         okRA==
X-Gm-Message-State: ANoB5pnAZv156srVLvleOCvv7CG9LOorAMT6F36rxKyP5vpk4rq2f8bg
	LlIUK1qTH10a/DcxPs4IxyadAc+OPJGNabBMgXE01sMabCw/pC/iB8oH7reVM/Y+gNHUG41I7zb
	HWwyVLt012dxQXH+ZUmuyU/VHo/Qx
X-Received: by 2002:a05:600c:3d19:b0:3c6:edc0:5170 with SMTP id bh25-20020a05600c3d1900b003c6edc05170mr14313835wmb.25.1670886702710;
        Mon, 12 Dec 2022 15:11:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5lDfiYN0rE6YVEbmBF7N8YZEpLr9T7uo4Q3R+sKGlV+dcjnOy985UIqQQiqS+aPBilidYnPg==
X-Received: by 2002:a05:600c:3d19:b0:3c6:edc0:5170 with SMTP id bh25-20020a05600c3d1900b003c6edc05170mr14313790wmb.25.1670886702453;
        Mon, 12 Dec 2022 15:11:42 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id i14-20020a05600c354e00b003c6f3f6675bsm11712338wmq.26.2022.12.12.15.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 15:11:41 -0800 (PST)
Message-ID: <48f4df00-8ef6-042f-c9ae-4023c4f70058@redhat.com>
Date: Tue, 13 Dec 2022 00:11:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
To: David Matlack <dmatlack@google.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Nadav Amit
 <namit@vmware.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett"
 <Liam.Howlett@Oracle.com>, Suren Baghdasaryan <surenb@google.com>,
 Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Yu Zhao <yuzhao@google.com>,
 Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>,
 Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>,
 Krish Sadhukhan <krish.sadhukhan@oracle.com>,
 Ricardo Koller <ricarkol@google.com>, Jing Zhang <jingzhangos@google.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org
References: <20221208193857.4090582-1-dmatlack@google.com>
 <20221208193857.4090582-3-dmatlack@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 02/37] KVM: MMU: Move struct kvm_mmu_page_role into
 common code
In-Reply-To: <20221208193857.4090582-3-dmatlack@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_151146_785381_09108293 
X-CRM114-Status: GOOD (  16.42  )
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

On 12/8/22 20:38, David Matlack wrote:
> +/*
> + * kvm_mmu_page_role tracks the properties of a shadow page (where shadow page
> + * also includes TDP pages) to determine whether or not a page can be used in
> + * the given MMU context.
> + */
> +union kvm_mmu_page_role {
> +	u32 word;
> +	struct {
> +		struct {
> +			/* The address space ID mapped by the page. */
> +			u16 as_id:8;
> +
> +			/* The level of the page in the page table hierarchy. */
> +			u16 level:4;
> +
> +			/* Whether the page is invalid, i.e. pending destruction. */
> +			u16 invalid:1;
> +		};
> +
> +		/* Architecture-specific properties. */
> +		struct kvm_mmu_page_role_arch arch;
> +	};
> +};
> +

Have you considered adding a tdp_mmu:1 field to the arch-independent 
part?  I think that as long as _that_ field is the same, there's no need 
to have any overlap between TDP MMU and shadow MMU roles.

I'm not even sure if the x86 TDP MMU needs _any_ other role bit.  It 
needs of course the above three, and it also needs "direct" but it is 
used exactly to mean "is this a TDP MMU page".  So we could have

union {
	struct {
		u32 tdp_mmu:1;
		u32 invalid:1;
		u32 :6;
		u32 level:8;
		u32 arch:8;
		u32 :8;
	} tdp;
	/* the first field must be "u32 tdp_mmu:1;" */
	struct kvm_mmu_page_role_arch shadow;
};

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
