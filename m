Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA361C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 14:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f91n8LHsfCESmaGhLEN0PPrIR3UaVaRQimYXYTqvb7A=; b=J3xvVfSKaMn468
	T47xljMQuPJQLf8N9o9oC+Ux383SxD9V06BPUKozD8oElO6X8KoKYTkYU+KRP5nH4AkxRQX6/0cIS
	Gqo2eYFRTau/WpeyeuxlY5IpgLKGeHeuPVTcs9kKZIGlSpf6wXv9PqQumNFUesnOY2sWFbdr5/jBc
	rBlghpjUFIiNBlnLMsK3jUDj9V3vzP+zp2ONMxLg9RBqVJNrQa5RCpOzGuxzajq+DRH3FO7OPVToG
	9Bz3Dqsxtt/QxbttTwcaWkE+qjmxbtlprIIdd3pgOErj6pdfekWXRTwzV/OdSGF+1T9Fc+BXIjmrE
	vv/wiRBgNLqZuxGPjQ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzzqM-00000008jV5-0498;
	Thu, 25 Apr 2024 14:12:58 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzzqI-00000008jNt-2iFn
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 14:12:56 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2dde561f852so11570071fa.2
        for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2024 07:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714054356; x=1714659156; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zgj3m/Cw0cxG7wHpYlRihQfjnwxhhxsXHcabhCA3Erw=;
        b=w43tg0g5nUhFqxq0YHp1UYY1jPsFF7TfXz7rYM7JV1bdKQgyk6poubPDmd0E0nfIED
         ogwxmYj9l2JP/b8AN5xK6OXY77UsIxnCjvew8ON1GMce6kt/7RjCCC8mEVdg5VxhhDal
         J0cWGJyaAnmDdqWzTxYcLwUxBKgvoCBnCpres5kVjLqxSrJE33Gf6+AQEUCbYacLfUEE
         mlgzB+jrCCgEEdJLY1+VooR63Chq3Tepi4zVs7eb+uZLJZAdXUtWBKN1D/k9efrhmczi
         2Q04cHGb5msWTacXFUBU7UGt/hrnj01HcF6f+mmp1PUMQ+HKS5wulcw0zVAt9ZMwkyac
         cSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714054356; x=1714659156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgj3m/Cw0cxG7wHpYlRihQfjnwxhhxsXHcabhCA3Erw=;
        b=C4xKHH1LYTzAJ0HjsnsXBpeE6AyreNt0zWWO69MiqbAryzNkIRxQlSRrQNzdd3dEOx
         WfnzJDg/nNRO3fJe5CPrEyk4eezBkyAsvcYstHo4yvFGQcOxA12PEPzFw1E6m/BZ6TTB
         Rigg8AcCN3Bg6VSZLJK353p3tN0LTlhUtZVkMUgcnOJqZT/lypDRQHv+zKu0g+Ac837k
         eu7AOTRI0uAalMldsd4lC0/ZXKMjjmYsM7x8H3jhSBsHpwZx/xG47bd0ubZ1G9nH9b5S
         9C6nnwli9mfFIo+6jhZ2OVJcWVZnQpdqMAgt6TteukhgNvTE10iof93x2bfaB+vyTlkn
         K4eg==
X-Forwarded-Encrypted: i=1; AJvYcCWAX61RKHfxtnHwByc0omS40BcYvIjmX5xVu5IztUpo81W3ewORFR2tHB0xRBkny7SLUo9sRLdykWnganmYNW7UmFbrb+66Az1dofBvR2u7
X-Gm-Message-State: AOJu0YxggSfBfurBdHLPkBss0ZJJ4Zyn+odLRULFK128UUkNeZF8Pf+x
	N2R/c5IBHZpQveTSNX+3vXYeirvvfBuvmSTlWsDlrKaGPUbl6i9PJqjRK1sJYCo=
X-Google-Smtp-Source: AGHT+IG4h73e/VD0OiMdGC2ljHdBFoL8+iSdydmC9vOMTBe1nYjTZzgcSwjFqh+dbSJpqsAZN+aRMQ==
X-Received: by 2002:a2e:818a:0:b0:2de:4b8d:ee31 with SMTP id e10-20020a2e818a000000b002de4b8dee31mr3860645ljg.37.1714054356205;
        Thu, 25 Apr 2024 07:12:36 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id hg16-20020a05600c539000b0041aa8ad46d6sm10244618wmb.16.2024.04.25.07.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 07:12:35 -0700 (PDT)
Date: Thu, 25 Apr 2024 17:12:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Chao Peng <chao.p.peng@linux.intel.com>,
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>,
	Anish Moorthy <amoorthy@google.com>,
	David Matlack <dmatlack@google.com>,
	Yu Zhang <yu.c.zhang@linux.intel.com>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Vlastimil Babka <vbabka@suse.cz>,
	Vishal Annapurve <vannapurve@google.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Maciej Szmigiero <mail@maciej.szmigiero.name>,
	David Hildenbrand <david@redhat.com>,
	Quentin Perret <qperret@google.com>,
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>,
	Liam Merwick <liam.merwick@oracle.com>,
	Isaku Yamahata <isaku.yamahata@gmail.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Benjamin Copeland <ben.copeland@linaro.org>
Subject: Re: [PATCH v13 25/35] KVM: selftests: Convert lib's mem regions to
 KVM_SET_USER_MEMORY_REGION2
Message-ID: <69ae0694-8ca3-402c-b864-99b500b24f5d@moroto.mountain>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-26-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231027182217.3615211-26-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_071254_708887_6BC21DF2 
X-CRM114-Status: GOOD (  10.36  )
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

On Fri, Oct 27, 2023 at 11:22:07AM -0700, Sean Christopherson wrote:
> Use KVM_SET_USER_MEMORY_REGION2 throughout KVM's selftests library so that
> support for guest private memory can be added without needing an entirely
> separate set of helpers.
> 
> Note, this obviously makes selftests backwards-incompatible with older KVM
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> versions from this point forward.
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Is there a way we could disable the tests on older kernels instead of
making them fail?  Check uname or something?  There is probably a
standard way to do this...  It's these tests which fail.

 kvm_aarch32_id_regs
 kvm_access_tracking_perf_test
 kvm_arch_timer
 kvm_debug-exceptions
 kvm_demand_paging_test
 kvm_dirty_log_perf_test
 kvm_dirty_log_test
 kvm_guest_print_test
 kvm_hypercalls
 kvm_kvm_page_table_test
 kvm_memslot_modification_stress_test
 kvm_memslot_perf_test
 kvm_page_fault_test
 kvm_psci_test
 kvm_rseq_test
 kvm_smccc_filter
 kvm_steal_time
 kvm_vgic_init
 kvm_vgic_irq
 kvm_vpmu_counter_access

regards,
dan carpenter


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
