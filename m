Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5604EE743C8
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 22:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F0DeH6W6BVaresseiZuINWE46TWzDkvm17iViN5zIEM=; b=q8jxJHJMf7M5+0
	2zlNf8upLgHVsJdXPgi2vIKHKScIXxPaLNM/Vze05N2KZgKeoA8F1gZ9UdUQr3gQCLmIoF+BBbywu
	ZFWWU1Q8Urq/qh35uoQ5oiBx0W2Me2y7V2IkWteET/uoHQOXNKQVksBPgxVVux6wXClJVG97k+zwC
	3sdJJOpJQ0t+VS4bECLjWKNAZCa0akvC4S9DGwm5VMkxeJEf7FGgG+Hms+WUhIO4U/wd2momcDdru
	9kMKu7OVHTrbH0TGtUfayEi1Xeu+MDc0HvjiMHmiNVW/qv1brpGMccVYd68soQnCiPbV7vD/AR8Jd
	lavNKVxoT73Iv2GbHsnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlzO6-006m3e-1l;
	Thu, 28 Sep 2023 22:21:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlzO3-006m1I-10
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 22:21:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695939692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/l7DOL4i9eWpBdCSwTRJyugH/jLo/b6g4jXHDN7U+14=;
	b=OCs1a95MPVDOSm0O5CL13JBtQ0GOMPpe7wYzVfjVCvZk1z6rBYZJdZym3UrL+UGZ4Z/6so
	kyy+RYP3pi75BrxPaaptpZs069CK7fsL5GFlT661q9cSNOHy1ZpIYd2Y4tuLZEr01b4anb
	OrHLlXaYfKTHqC7uLKgZBFhpTDwm8zs=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-rOw3NspGNiWb9kachAJTxw-1; Thu, 28 Sep 2023 18:21:31 -0400
X-MC-Unique: rOw3NspGNiWb9kachAJTxw-1
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3516579e7f7so29990975ab.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 15:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695939690; x=1696544490;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/l7DOL4i9eWpBdCSwTRJyugH/jLo/b6g4jXHDN7U+14=;
        b=UeMw1RJEl2Z3a6dT4bAocyQsJzrfwGAx+KZhEibUnYr4VpDUyJo8AKnRPbhlgOylim
         fXyPwHmrvL/o8VseK8yxPj9n9d7F2DMS0BB0dw6jeqNLH4esQM/AVoBOydtyln1BhYie
         4Tgcf955itVX08Cd2xmMVPku6RyFZvSWQXY4iAb5DiSlyISkiM3gKPWogV5kVF2AX/aY
         3fXUMajUxkevkCq2tjtf/WkcoAoSXKTNJoXg7kB8j3va6JkOp3emSrmgPl9mmdgbjdmH
         yeC35QrXVQs6xkK7TSuKNmV9kLgnIoMfoZHQn4Q+Uj1TUhoXQplwvsDeffUjYUT+rkq1
         1bFQ==
X-Gm-Message-State: AOJu0YyTQFGciQAKwi4ODYb+DOr7wOz3o9WF5Ox/Cy/Jg0RIzeeZJGFV
	uHawhjGM2JsKdy5SesmcgpiwIoTwqoQ5M/ezfVQjScFoF660hLZ3juYCvdVGY3hAH2pY+D8/q2T
	AYm5LH6q80Duqm1MHErqQDoG3ubHS
X-Received: by 2002:a05:6e02:1809:b0:34f:ed76:7db8 with SMTP id a9-20020a056e02180900b0034fed767db8mr3391336ilv.26.1695939690611;
        Thu, 28 Sep 2023 15:21:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOH5tZZiZuKh+d30ZefE58SY4OZ2k4eRgPtsp2uogyFxnPRFAQcoCds5f0KJfUDnAzkmiCTw==
X-Received: by 2002:a05:6e02:1809:b0:34f:ed76:7db8 with SMTP id a9-20020a056e02180900b0034fed767db8mr3391301ilv.26.1695939690276;
        Thu, 28 Sep 2023 15:21:30 -0700 (PDT)
Received: from redhat.com ([38.15.60.12])
        by smtp.gmail.com with ESMTPSA id t23-20020a02c497000000b0042b10d42c90sm4610172jam.113.2023.09.28.15.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 15:21:28 -0700 (PDT)
Date: Thu, 28 Sep 2023 16:21:08 -0600
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
Subject: Re: [PATCH 04/26] vfio: Add struct to hold KVM assets and dedup
 group vs. iommufd code
Message-ID: <20230928162108.3fdd73bf.alex.williamson@redhat.com>
In-Reply-To: <20230916003118.2540661-5-seanjc@google.com>
References: <20230916003118.2540661-1-seanjc@google.com>
	<20230916003118.2540661-5-seanjc@google.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_152135_448375_66500721 
X-CRM114-Status: GOOD (  30.28  )
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

On Fri, 15 Sep 2023 17:30:56 -0700
Sean Christopherson <seanjc@google.com> wrote:

> Add a struct to hold the KVM assets need to manage and pass along KVM
> references to VFIO devices.  Providing a common struct deduplicates the
> group vs. iommufd code, and will make it easier to rework the attachment
> logic so that VFIO doesn't have to do a symbol lookup to retrieve the
> get/put helpers from KVM.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  drivers/vfio/device_cdev.c |  9 +-------
>  drivers/vfio/group.c       | 18 ++--------------
>  drivers/vfio/vfio.h        | 22 +++++++++----------
>  drivers/vfio/vfio_main.c   | 43 +++++++++++++++++++++++++++-----------
>  4 files changed, 45 insertions(+), 47 deletions(-)


Reviewed-by: Alex Williamson <alex.williamson@redhat.com>

 
> diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
> index e75da0a70d1f..e484d6d6400a 100644
> --- a/drivers/vfio/device_cdev.c
> +++ b/drivers/vfio/device_cdev.c
> @@ -46,13 +46,6 @@ int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep)
>  	return ret;
>  }
>  
> -static void vfio_df_get_kvm_safe(struct vfio_device_file *df)
> -{
> -	spin_lock(&df->kvm_ref_lock);
> -	vfio_device_get_kvm_safe(df->device, df->kvm);
> -	spin_unlock(&df->kvm_ref_lock);
> -}
> -
>  long vfio_df_ioctl_bind_iommufd(struct vfio_device_file *df,
>  				struct vfio_device_bind_iommufd __user *arg)
>  {
> @@ -99,7 +92,7 @@ long vfio_df_ioctl_bind_iommufd(struct vfio_device_file *df,
>  	 * a reference.  This reference is held until device closed.
>  	 * Save the pointer in the device for use by drivers.
>  	 */
> -	vfio_df_get_kvm_safe(df);
> +	vfio_device_get_kvm_safe(df->device, &df->kvm_ref);
>  
>  	ret = vfio_df_open(df);
>  	if (ret)
> diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
> index 610a429c6191..756e47ff4cf0 100644
> --- a/drivers/vfio/group.c
> +++ b/drivers/vfio/group.c
> @@ -157,13 +157,6 @@ static int vfio_group_ioctl_set_container(struct vfio_group *group,
>  	return ret;
>  }
>  
> -static void vfio_device_group_get_kvm_safe(struct vfio_device *device)
> -{
> -	spin_lock(&device->group->kvm_ref_lock);
> -	vfio_device_get_kvm_safe(device, device->group->kvm);
> -	spin_unlock(&device->group->kvm_ref_lock);
> -}
> -
>  static int vfio_df_group_open(struct vfio_device_file *df)
>  {
>  	struct vfio_device *device = df->device;
> @@ -184,7 +177,7 @@ static int vfio_df_group_open(struct vfio_device_file *df)
>  	 * the pointer in the device for use by drivers.
>  	 */
>  	if (device->open_count == 0)
> -		vfio_device_group_get_kvm_safe(device);
> +		vfio_device_get_kvm_safe(device, &device->group->kvm_ref);
>  
>  	df->iommufd = device->group->iommufd;
>  	if (df->iommufd && vfio_device_is_noiommu(device) && device->open_count == 0) {
> @@ -560,7 +553,7 @@ static struct vfio_group *vfio_group_alloc(struct iommu_group *iommu_group,
>  
>  	refcount_set(&group->drivers, 1);
>  	mutex_init(&group->group_lock);
> -	spin_lock_init(&group->kvm_ref_lock);
> +	spin_lock_init(&group->kvm_ref.lock);
>  	INIT_LIST_HEAD(&group->device_list);
>  	mutex_init(&group->device_lock);
>  	group->iommu_group = iommu_group;
> @@ -884,13 +877,6 @@ bool vfio_group_enforced_coherent(struct vfio_group *group)
>  	return ret;
>  }
>  
> -void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm)
> -{
> -	spin_lock(&group->kvm_ref_lock);
> -	group->kvm = kvm;
> -	spin_unlock(&group->kvm_ref_lock);
> -}
> -
>  /**
>   * vfio_file_has_dev - True if the VFIO file is a handle for device
>   * @file: VFIO file to check
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index c26d1ad68105..a1f741365075 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -12,18 +12,23 @@
>  #include <linux/module.h>
>  #include <linux/vfio.h>
>  
> +struct kvm;
>  struct iommufd_ctx;
>  struct iommu_group;
>  struct vfio_container;
>  
> +struct vfio_kvm_reference {
> +	struct kvm			*kvm;
> +	spinlock_t			lock;
> +};
> +
>  struct vfio_device_file {
>  	struct vfio_device *device;
>  	struct vfio_group *group;
>  
>  	u8 access_granted;
>  	u32 devid; /* only valid when iommufd is valid */
> -	spinlock_t kvm_ref_lock; /* protect kvm field */
> -	struct kvm *kvm;
> +	struct vfio_kvm_reference kvm_ref;
>  	struct iommufd_ctx *iommufd; /* protected by struct vfio_device_set::lock */
>  };
>  
> @@ -88,11 +93,10 @@ struct vfio_group {
>  #endif
>  	enum vfio_group_type		type;
>  	struct mutex			group_lock;
> -	struct kvm			*kvm;
> +	struct vfio_kvm_reference	kvm_ref;
>  	struct file			*opened_file;
>  	struct blocking_notifier_head	notifier;
>  	struct iommufd_ctx		*iommufd;
> -	spinlock_t			kvm_ref_lock;
>  	unsigned int			cdev_device_open_cnt;
>  };
>  
> @@ -108,7 +112,6 @@ void vfio_device_group_unuse_iommu(struct vfio_device *device);
>  void vfio_df_group_close(struct vfio_device_file *df);
>  struct vfio_group *vfio_group_from_file(struct file *file);
>  bool vfio_group_enforced_coherent(struct vfio_group *group);
> -void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm);
>  bool vfio_device_has_container(struct vfio_device *device);
>  int __init vfio_group_init(void);
>  void vfio_group_cleanup(void);
> @@ -171,10 +174,6 @@ static inline bool vfio_group_enforced_coherent(struct vfio_group *group)
>  	return true;
>  }
>  
> -static inline void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm)
> -{
> -}
> -
>  static inline bool vfio_device_has_container(struct vfio_device *device)
>  {
>  	return false;
> @@ -435,11 +434,12 @@ static inline void vfio_virqfd_exit(void)
>  #endif
>  
>  #if IS_ENABLED(CONFIG_KVM)
> -void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm);
> +void vfio_device_get_kvm_safe(struct vfio_device *device,
> +			      struct vfio_kvm_reference *ref);
>  void vfio_device_put_kvm(struct vfio_device *device);
>  #else
>  static inline void vfio_device_get_kvm_safe(struct vfio_device *device,
> -					    struct kvm *kvm)
> +					    struct vfio_kvm_reference *ref)
>  {
>  }
>  
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 124cc88966a7..e77e8c6aae2f 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -397,7 +397,7 @@ vfio_allocate_device_file(struct vfio_device *device)
>  		return ERR_PTR(-ENOMEM);
>  
>  	df->device = device;
> -	spin_lock_init(&df->kvm_ref_lock);
> +	spin_lock_init(&df->kvm_ref.lock);
>  
>  	return df;
>  }
> @@ -1303,7 +1303,8 @@ bool vfio_file_enforced_coherent(struct file *file)
>  EXPORT_SYMBOL_GPL(vfio_file_enforced_coherent);
>  
>  #if IS_ENABLED(CONFIG_KVM)
> -void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)
> +void vfio_device_get_kvm_safe(struct vfio_device *device,
> +			      struct vfio_kvm_reference *ref)
>  {
>  	void (*pfn)(struct kvm *kvm);
>  	bool (*fn)(struct kvm *kvm);
> @@ -1311,28 +1312,33 @@ void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)
>  
>  	lockdep_assert_held(&device->dev_set->lock);
>  
> -	if (!kvm)
> -		return;
> +	spin_lock(&ref->lock);
> +
> +	if (!ref->kvm)
> +		goto out;
>  
>  	pfn = symbol_get(kvm_put_kvm);
>  	if (WARN_ON(!pfn))
> -		return;
> +		goto out;
>  
>  	fn = symbol_get(kvm_get_kvm_safe);
>  	if (WARN_ON(!fn)) {
>  		symbol_put(kvm_put_kvm);
> -		return;
> +		goto out;
>  	}
>  
> -	ret = fn(kvm);
> +	ret = fn(ref->kvm);
>  	symbol_put(kvm_get_kvm_safe);
>  	if (!ret) {
>  		symbol_put(kvm_put_kvm);
> -		return;
> +		goto out;
>  	}
>  
>  	device->put_kvm = pfn;
> -	device->kvm = kvm;
> +	device->kvm = ref->kvm;
> +
> +out:
> +	spin_unlock(&ref->lock);
>  }
>  
>  void vfio_device_put_kvm(struct vfio_device *device)
> @@ -1353,6 +1359,21 @@ void vfio_device_put_kvm(struct vfio_device *device)
>  	device->kvm = NULL;
>  }
>  
> +static void vfio_device_set_kvm(struct vfio_kvm_reference *ref,
> +				struct kvm *kvm)
> +{
> +	spin_lock(&ref->lock);
> +	ref->kvm = kvm;
> +	spin_unlock(&ref->lock);
> +}
> +
> +static void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm)
> +{
> +#if IS_ENABLED(CONFIG_VFIO_GROUP)
> +	vfio_device_set_kvm(&group->kvm_ref, kvm);
> +#endif
> +}
> +
>  static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm)
>  {
>  	struct vfio_device_file *df = file->private_data;
> @@ -1362,9 +1383,7 @@ static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm)
>  	 * be propagated to vfio_device::kvm when the file is bound to
>  	 * iommufd successfully in the vfio device cdev path.
>  	 */
> -	spin_lock(&df->kvm_ref_lock);
> -	df->kvm = kvm;
> -	spin_unlock(&df->kvm_ref_lock);
> +	vfio_device_set_kvm(&df->kvm_ref, kvm);
>  }
>  
>  /**


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
