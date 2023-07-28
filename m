Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC6BC0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 09:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lSfC0GeevG276fEgcsXftU1AzUp3kgK+1YN22TBbcNQ=; b=i713DDnKIsdeNK
	+hIm/Be/IuFtT+AX7SeczHLc7kB+o5Fq70w9pR+t6KTiF6SlVmFyG0V7bDl+IR8eC7kQVxyabN95p
	+0LWDIhmz97E63cujRtdYsBOukpee1wyT7IEGYQTO3whXJdqqQBVA/RI2KC0Q4xBLTc6ZvPapmq7j
	oisl+DFhnIIOd05Dh5JSUzCoiScYRaXvN7bejPFVmCJrxT4X4LTs+gUYnT/Gsj5Z5hH8bvEIt1a4r
	QEWyCbq1ADU7e1phAnCf+xECn7MC8HadDzWgY6y1p495tU25sirDD5vSQ+P+MPo9DBpglKeEp4kCx
	FGqxQkDHSCoPJW45AQEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJj6-002d1x-1D;
	Fri, 28 Jul 2023 09:25:36 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJj4-002d0R-1D
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 09:25:35 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99b9161b94aso272274866b.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 02:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690536326; x=1691141126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MyDeksRVqGtJNd0fe/itajI8E9fXoiZCjVyZ7emrXms=;
        b=yZlBBa+QgG6A3izqrAvYrZmjNARnJqe9UVJDDaWeo1ngnmOt9VRY93kWsBg3OxlgJ6
         BNgAnv6T/0ObsR7NeaCjk+WNJnmyD7Q59yeCq15kUZEqjsFvHdvXA60zH7S6F25/qIjt
         fm8Sg5o5MpunPrL/BqoXYGZy7msDjit8jc0wg2EmQ6Q8Th8F7S82AjrHRl+/FMq8bTJh
         sEoAOBkEqP29Krhf8xqYypp/joUWh9VUOF8DEcZIisv2V3iWTfC6qxmMhKHNjRW9HI9T
         TolK5KmZ7NzIlhfQCguxbwjQDJpXunGMqxws18N6XaE4FtdLuzrmk4BalRM99UvIXMiI
         LjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690536326; x=1691141126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MyDeksRVqGtJNd0fe/itajI8E9fXoiZCjVyZ7emrXms=;
        b=G8zC5BBub2IhuqrkQGdfQKkRYVFgH+76Fy9MpkUo6u9nPeHXAZT1jjuZDzwS6jyYq7
         zi5/Iil3pQVT71focmcmwRI/U0Y5Xl1aGprRSx4ZOkx1aNCV/Nn26jZ/+9tDoZP/Y5pk
         tQ9dBAJ2nhYzlqAeYoOYlTXSRYVTB4HgVyPQPmhQZ16z2u/nTtSAy0VNcQsuXGUtHpPI
         +s8k4odjlBlc1W6kMeBI+jlOV8t6tHiJma2NTmFIypREn0sgXOWGGWm/pb9RmiYaHglG
         49dWP6StNqNJuJoKggCi5GcV9o7lSR+0XbIet0x0gt9ARm/fJlV0JRHy91SLsxzy4XNc
         ReGQ==
X-Gm-Message-State: ABy/qLaBYCDHDvYmN6GA2vDB2R3W4PCJYB7p0me9mvw0OMNtsI7FYIvI
	sXykyLEskljcB7Nlv8SOiwGAAQ==
X-Google-Smtp-Source: APBJJlG4DNtaaix3llwTkCcLiQNG9ALlnJv6ynH+2HDeVn6HzB3Xx8i5ieUEd323eDEBkV9C48RmSw==
X-Received: by 2002:a17:906:8454:b0:994:1fee:3065 with SMTP id e20-20020a170906845400b009941fee3065mr1975862ejy.15.1690536326590;
        Fri, 28 Jul 2023 02:25:26 -0700 (PDT)
Received: from google.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id n12-20020a170906688c00b00992c92af6f4sm1857653ejr.144.2023.07.28.02.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 02:25:26 -0700 (PDT)
Date: Fri, 28 Jul 2023 09:25:22 +0000
From: Quentin Perret <qperret@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	Chao Peng <chao.p.peng@linux.intel.com>,
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>,
	Yu Zhang <yu.c.zhang@linux.intel.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Maciej Szmigiero <mail@maciej.szmigiero.name>,
	Vlastimil Babka <vbabka@suse.cz>,
	David Hildenbrand <david@redhat.com>,
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>,
	Liam Merwick <liam.merwick@oracle.com>,
	Isaku Yamahata <isaku.yamahata@gmail.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [RFC PATCH v11 06/29] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
Message-ID: <ZMOJgnyzzUNIx+Tn@google.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-7-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230718234512.1690985-7-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_022534_414412_6B6146CD 
X-CRM114-Status: GOOD (  11.93  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tuesday 18 Jul 2023 at 16:44:49 (-0700), Sean Christopherson wrote:
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -95,6 +95,16 @@ struct kvm_userspace_memory_region {
>  	__u64 userspace_addr; /* start of the userspace allocated memory */
>  };
>  
> +/* for KVM_SET_USER_MEMORY_REGION2 */
> +struct kvm_userspace_memory_region2 {
> +	__u32 slot;
> +	__u32 flags;
> +	__u64 guest_phys_addr;
> +	__u64 memory_size;
> +	__u64 userspace_addr;
> +	__u64 pad[16];

Should we replace that pad[16] with:

	__u64 size;

where 'size' is the size of the structure as seen by userspace? This is
used in other UAPIs (see struct sched_attr for example) and is a bit
more robust for future extensions (e.g. an 'old' kernel can correctly
reject a newer version of the struct with additional fields it doesn't
know about if that makes sense, etc).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
