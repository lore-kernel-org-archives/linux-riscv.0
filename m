Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E5EE743CC
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 22:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2NEVXoPajJ4J8jvLOML8pDMWKqOYIYUgfdeRAEb4A0s=; b=gKAHwVMUf5Ysgw
	3ZILW/oGVuQWoeRUlZOSB79ogVTofGtCkgaTaBmH8s5VDVD2XWb9tZYoBeBovLZl1xFDlwl4ukzsL
	ZbwzAbE/A/u2Uj1K8QoJJL6GH/mmH1z6dnWeoqkln2vQhAeQqpmY2/Tmxty4tgrz4zbswd41NJsed
	EDQupK0LyhZAHdXvwWXB0Vsz5Ief8f0YUKwFqV2q5XlqHgIBG7ex3G7MtqE1kCmqMZ16UiYKbnf74
	WosK3iImx7o33t0KB2qTszVRGIGmGo07DrXj04A18Jc3paEaMpjS0XPp8RpuTXuEean/wjxrkMSv1
	SEs7zGwkB3e7FL+HYQEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlzOk-006mPb-2A;
	Thu, 28 Sep 2023 22:22:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlzOA-006m6q-1P
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 22:21:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695939701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VYqIaFDftvj8+TDcTZgaXgu9cICTLPBd1GmPz49S0qk=;
	b=P/J1GSJdGdP+wYekWor9SaPZNYjnV+SDxw2YnSPeHVnIOUww/2MeAXS+7n0ni4X1IdAEM1
	rB+K80h0xf06LxCM5yfD0RQPUhyZfDWrdL/ncllewH91/Lj62kwYBnfiVDXAPPuw6U5pq8
	f+g3Qh/aT/HwRz4Wma7CjTDiGqY0YO0=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-ACTVNivhMauLFi40ZvfkKw-1; Thu, 28 Sep 2023 18:21:39 -0400
X-MC-Unique: ACTVNivhMauLFi40ZvfkKw-1
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-79f9edb0086so1530961039f.2
        for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 15:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695939698; x=1696544498;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VYqIaFDftvj8+TDcTZgaXgu9cICTLPBd1GmPz49S0qk=;
        b=DToWSlaGdiv5pPN717D7LH0G7X57xW16fK0Lq3+iu6AEnIfSrUBTIAlp7+LF43Eh5R
         gfv/O+otmBTzC14VcyDrRgF+BVRel97QisfhkOs8upC2RKm/YJQ2OunTDag/W0Ob1yZd
         BBCv0tcM6OxQoWTtoBZT6PKgJEX6EGvyxxYoCNcXHyUkhGQf4Vc6MmKhpniStfmq+07A
         /2UVxcC3wGWQ/EYW2fgDXiFWY2nQVBDWCIDpFm+jQmyPk13jeCxZoR0IlN37zi56vP/V
         7HBshM5Iw6i5p5foKllq4emcKF/qVxEniYOgmLdtviAsYL2xuenS2boNQTM6LE9zg2xb
         LTtQ==
X-Gm-Message-State: AOJu0YxxbM4zCcUDDY+946sAAHzsCgYw0ZZ71VvQ3EP3EJLitY+iS/4n
	mSgKBSlXV7pbNGl916rH2CbknY8s2/5p5zox32dUKjwN5TRJpYXSg4nlesNPG/BfePCPfkmGSg/
	Jsmm5qm7U38G0tsZw9jR0jeIJPVaF
X-Received: by 2002:a05:6602:2211:b0:798:3cb5:ad30 with SMTP id n17-20020a056602221100b007983cb5ad30mr2909928ion.7.1695939698494;
        Thu, 28 Sep 2023 15:21:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv0LRR9DkFI1OYy1PoOT1i3eAWQj2VngBzVVO4xeK3kF6WDlUiAdkJKTL/cdHqWL0xs+JJYA==
X-Received: by 2002:a05:6602:2211:b0:798:3cb5:ad30 with SMTP id n17-20020a056602221100b007983cb5ad30mr2909893ion.7.1695939698157;
        Thu, 28 Sep 2023 15:21:38 -0700 (PDT)
Received: from redhat.com ([38.15.60.12])
        by smtp.gmail.com with ESMTPSA id t23-20020a02c497000000b0042b10d42c90sm4610172jam.113.2023.09.28.15.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 15:21:37 -0700 (PDT)
Date: Thu, 28 Sep 2023 16:21:06 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio
 Imbrenda <imbrenda@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, Peter Zijlstra
 <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Paolo
 Bonzini <pbonzini@redhat.com>, Tony Krowiak <akrowiak@linux.ibm.com>, Halil
 Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, Harald
 Freudenberger <freude@linux.ibm.com>, Andy Lutomirski <luto@kernel.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-mips@vger.kernel.org, kvm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Anish
 Ghulati <aghulati@google.com>, Venkatesh Srinivas
 <venkateshs@chromium.org>, Andrew Thornton <andrewth@google.com>
Subject: Re: [PATCH 03/26] virt: Declare and define vfio_file_set_kvm() iff
 CONFIG_KVM is enabled
Message-ID: <20230928162106.0b0de53c.alex.williamson@redhat.com>
In-Reply-To: <20230916003118.2540661-4-seanjc@google.com>
References: <20230916003118.2540661-1-seanjc@google.com>
	<20230916003118.2540661-4-seanjc@google.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_152142_560564_47C5A0A6 
X-CRM114-Status: GOOD (  16.68  )
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

On Fri, 15 Sep 2023 17:30:55 -0700
Sean Christopherson <seanjc@google.com> wrote:

> Hide vfio_file_set_kvm() and its unique helpers if KVM is not enabled,
> nothing else in the kernel (or out of the kernel) should be using a
> KVM specific helper.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  drivers/vfio/vfio_main.c | 2 +-
>  include/linux/vfio.h     | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)


As Jason noted, s/virt/vfio/ in title.

Reviewed-by: Alex Williamson <alex.williamson@redhat.com>

 
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 6368eed7b7b2..124cc88966a7 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -1352,7 +1352,6 @@ void vfio_device_put_kvm(struct vfio_device *device)
>  clear:
>  	device->kvm = NULL;
>  }
> -#endif
>  
>  static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm)
>  {
> @@ -1388,6 +1387,7 @@ void vfio_file_set_kvm(struct file *file, struct kvm *kvm)
>  		vfio_device_file_set_kvm(file, kvm);
>  }
>  EXPORT_SYMBOL_GPL(vfio_file_set_kvm);
> +#endif
>  
>  /*
>   * Sub-module support
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index 454e9295970c..e80955de266c 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -311,7 +311,9 @@ static inline bool vfio_file_has_dev(struct file *file, struct vfio_device *devi
>  #endif
>  bool vfio_file_is_valid(struct file *file);
>  bool vfio_file_enforced_coherent(struct file *file);
> +#if IS_ENABLED(CONFIG_KVM)
>  void vfio_file_set_kvm(struct file *file, struct kvm *kvm);
> +#endif
>  
>  #define VFIO_PIN_PAGES_MAX_ENTRIES	(PAGE_SIZE/sizeof(unsigned long))
>  


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
