Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C49BE67A68
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 04:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zC2fjcgYeJgtTqhpqa8bhH42lyASkY2Qmtfvl2Uo5pI=; b=t2c4Ft+YeoA3if
	6KCtEeK4tC2Acf9T1YF3E9oFSIgsBfbtDY519qbcFH4Vj//hyDw++4bh7n2fOFSHDwa848HYOZ41W
	nvgV+p07BjplLc35CXJPJg3TjeZud/qBLEIqb2ir4WkseuUzWEKhW853BLMaMO2lxi6XZfAn2exJw
	e1qalPC1ri4PgUkV+BbpXgICiLc7WEXjSS0H1L5wFiBKUATc32V8lj7ywU+4qZ8bauFUADuLBaeor
	V/e9OaMfH1rOwpoP2BuccbU8rynT6sSa1dxEY70kbtFFpdiZ6G83zizOWPBK5N+0/EfyVZWDRt+mw
	xUQcqM18vIfU6z+InYBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxHch-0000000EVhx-3Khi;
	Tue, 03 Mar 2026 04:44:43 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxHcf-0000000EVgq-3GOX
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 04:44:42 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c70bfef17a4so3161497a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 20:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772513080; x=1773117880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LWqfPnYJzFeuZzCdQbWgAY+H5By2f/u+Z1YMUOO9a4=;
        b=gflIhVXrv8Cpwnc3Xzm1idBwiEhVd+cJraPuJ5YWI4fpFVO4S+krrzHgqZY+raH+xk
         nItlvelk7Eb2JtQAwKAJol1Ko+vyM+yn0ePfhl0YsZinOXtQ5QbVh8MFA8YkS0JCWotl
         c3KEM7R3Y4fMc6YnpqTRw1wNNw+EQeuDrSFt4Ia1ooge96On7kfhu5rskDs3tPBtMpBF
         lzYgkS7bh2oC+PIm3FQQ54iDK9T9tG0FwU+iUxOv4QUKYSvus6xghJ20lIbdBZHQG05M
         /1u629ZDomOu2Iu73coMc+OnJbMHetHqElhHLWvmyAD2zPx3ttUgD+cfzUfd8jtOHKPP
         NP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772513080; x=1773117880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6LWqfPnYJzFeuZzCdQbWgAY+H5By2f/u+Z1YMUOO9a4=;
        b=FFFkzuWC8wUkw86JOGrIdp+uBUbihGUpgNOtfnU/1Sl7vL+DVpZYriVo4VylzMWrw9
         66ZEC7PQ30zITr3dJeOiNLFA3xtaG2qlEwW3ZHp7qZpU62fbozLHctiIqYZnnbvXnbgJ
         0JDPhO89mVf+G8D1UrIVH5ekMbRmmV7BOkHYw0Wdb6M9Scs5q/0ci2ryj+NpJKrkFvFs
         qv2H1MJdxkC3X551f/Wssi7owfMQv1duJxEIvFdFIXF1ZeypDpRKzZzJWv1YGrDUdHmv
         dItGhoEMkFxxthfXvQppjHenSUvQHb+d+KEGVkYQ7oTn4kseLrPBRrCTKZiBElHjGml6
         JjYg==
X-Forwarded-Encrypted: i=1; AJvYcCUrxCpfxeBdgDIzn8JA6FdtqyQIMR4BAY35inX/uqH5esCDmqxMvgNjG/QXvr7xi3+m6LI2VnO9+OLOvA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhk5MvVFt11D8v29cyWSzfypaXRNtxNpCZNRTrDQDDkeVPVCK4
	tVfUrgPbip6rkxQKJZOxw9vF+mtbiVo0DLcbPAsW3Gf/Wj3fYvV9TDlC
X-Gm-Gg: ATEYQzwClLT8DmKKgrtvXbqDJP/ImQKY55O8wlMqLaH0QXsyjZHZxB1/rNg0ggXR6Hh
	hf59i9ECQqVufCLNBj2hbOVlxcR1cg/kjkddHfa0YEyMD+T/2l1L/OMjDXLa/UoixefNxX4KNM+
	JM8u1s3HMbo8agu/V+s9Apgup6dhMYWxEwXty3m7favRUj1b0ART0Q/wPQvfBR6Na2VQUCm8XNs
	660iHz/EaFw7w8YZShpTtdy3cr+cJmftudIOsofgBqK0beeLPWEj1/2oFNGphh6JVS2SlXZsve5
	5BHKwCbtQW3SPaoJF80JdAY1LlCK86xg3LPUwf7hWaCfp4ihyHLHNlNd56cove1CtRs5enudhNP
	hLQXC/TXcIOH9nuGIoIWJfLZN7nZA3fh1+HZaIpw6Zu4oSx4Ho8Z0dkc46d4ZkntC1UH5MTG8iL
	VgsNqUNPievjXdR2L4u0gghw==
X-Received: by 2002:a17:902:ce06:b0:2ae:47c0:19ce with SMTP id d9443c01a7336-2ae47c01d10mr72462485ad.55.1772513080332;
        Mon, 02 Mar 2026 20:44:40 -0800 (PST)
Received: from ubuntu.. ([89.222.116.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4f945985sm74775645ad.71.2026.03.02.20.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 20:44:39 -0800 (PST)
From: "jk.hong" <ryan.jk.hong@gmail.com>
To: xujiakai2025@iscas.ac.cn
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	Ryan JK Hong <ryan.jk.hong@gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Fix use-after-free in kvm_riscv_aia_aplic_has_attr()
Date: Tue,  3 Mar 2026 12:44:30 +0800
Message-ID: <20260303044432.699084-1-ryan.jk.hong@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260302085312.1649738-1-xujiakai2025@iscas.ac.cn>
References: <20260302085312.1649738-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_204441_864209_7EB9740A 
X-CRM114-Status: GOOD (  20.21  )
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

From: Ryan JK Hong <ryan.jk.hong@gmail.com>

> Fuzzer reports a KASAN use-after-free bug triggered by a race
> between KVM_HAS_DEVICE_ATTR and KVM_SET_DEVICE_ATTR ioctls on the AIA
> device. The root cause is that aia_has_attr() invokes
> kvm_riscv_aia_aplic_has_attr() without holding dev->kvm->lock, while
> a concurrent aia_set_attr() may call aia_init() under that lock. When
> aia_init() fails after kvm_riscv_aia_aplic_init() has succeeded, it
> calls kvm_riscv_aia_aplic_cleanup() in its fail_cleanup_imsics path,
> which frees both aplic_state and aplic_state->irqs. The concurrent
> has_attr path can then dereference the freed aplic->irqs in
> aplic_read_pending():
> 	irqd = &aplic->irqs[irq];   /* UAF here */
> 
> KASAN report:
>   BUG: KASAN: slab-use-after-free in aplic_read_pending
>               arch/riscv/kvm/aia_aplic.c:119 [inline]
>   BUG: KASAN: slab-use-after-free in aplic_read_pending_word
>               arch/riscv/kvm/aia_aplic.c:351 [inline]
>   BUG: KASAN: slab-use-after-free in aplic_mmio_read_offset
>               arch/riscv/kvm/aia_aplic.c:406
>   Read of size 8 at addr ff600000ba965d58 by task 9498
>   Call Trace:
>    aplic_read_pending arch/riscv/kvm/aia_aplic.c:119 [inline]
>    aplic_read_pending_word arch/riscv/kvm/aia_aplic.c:351 [inline]
>    aplic_mmio_read_offset arch/riscv/kvm/aia_aplic.c:406
>    kvm_riscv_aia_aplic_has_attr arch/riscv/kvm/aia_aplic.c:566
>    aia_has_attr arch/riscv/kvm/aia_device.c:469
>   allocated by task 9473:
>    kvm_riscv_aia_aplic_init arch/riscv/kvm/aia_aplic.c:583
>    aia_init arch/riscv/kvm/aia_device.c:248 [inline]
>    aia_set_attr arch/riscv/kvm/aia_device.c:334
>   freed by task 9473:
>    kvm_riscv_aia_aplic_cleanup arch/riscv/kvm/aia_aplic.c:644
>    aia_init arch/riscv/kvm/aia_device.c:292 [inline]
>    aia_set_attr arch/riscv/kvm/aia_device.c:334
> 
> Fix this race by acquiring dev->kvm->lock in aia_has_attr() before
> calling kvm_riscv_aia_aplic_has_attr(), consistent with the locking
> pattern used in aia_get_attr() and aia_set_attr().
> 
> Fixes: 289a007b98b06d ("RISC-V: KVM: Expose APLIC registers as attributes of AIA irqchip")
> Signed-off-by: Jiakai Xu<jiakaiPeanut@gmail.com>
> Signed-off-by: Jiakai Xu<xujiakai2025@iscas.ac.cn>
> ---
> V2 -> V3:
> - Fixed incorrect locking pattern in aia_has_attr(): avoid returning
>    while holding dev->kvm->lock by storing the return value in a local
>    variable, unlocking, and then returning.
> V1 -> V2:
> - Fixed the race by adding locking in aia_has_attr() instead of
>    introducing a new validation function, as suggested by Anup Patel.
> ---
>   arch/riscv/kvm/aia_device.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
> index b195a93add1ce..0722cbaed5ec9 100644
> --- a/arch/riscv/kvm/aia_device.c
> +++ b/arch/riscv/kvm/aia_device.c
> @@ -437,7 +437,7 @@ static int aia_get_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
>   
>   static int aia_has_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
>   {
> -	int nr_vcpus;
> +	int nr_vcpus, r = -ENXIO;
>   
>   	switch (attr->group) {
>   	case KVM_DEV_RISCV_AIA_GRP_CONFIG:
> @@ -466,12 +466,15 @@ static int aia_has_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
>   		}
>   		break;
>   	case KVM_DEV_RISCV_AIA_GRP_APLIC:
> -		return kvm_riscv_aia_aplic_has_attr(dev->kvm, attr->attr);
> +		mutex_lock(&dev->kvm->lock);
> +		r = kvm_riscv_aia_aplic_has_attr(dev->kvm, attr->attr);
> +		mutex_unlock(&dev->kvm->lock);
> +		return r;
>   	case KVM_DEV_RISCV_AIA_GRP_IMSIC:
>   		return kvm_riscv_aia_imsic_has_attr(dev->kvm, attr->attr);
>   	}
>   
> -	return -ENXIO;
> +	return r;
>   }
>   
>   struct kvm_device_ops kvm_riscv_aia_device_ops = {

This case branch has the same problem.
	case KVM_DEV_RISCV_AIA_GRP_IMSIC:
		mutex_lock(&dev->kvm->lock);
		ret = kvm_riscv_aia_imsic_has_attr(dev->kvm, attr->attr);
		mutex_unlock(&dev->kvm->lock);
		return ret;
	}


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
