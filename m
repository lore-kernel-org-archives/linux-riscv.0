Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1C6C47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 05:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GTHnAIUHLt1x/pZ08XCYghsGkFgAEQsZM/Zyp778p0E=; b=MIRjU5aU3MnntW
	mrUplkIu/Un3ypJaLDU70qOqffa7AGd5XViZsfBefTfHAyU20pPPfb7vkhnvUPhEIJtPvNsCYtCWF
	zJGWWdiRFe1jbT8/JteTHmIkVCGLFnc8i/ogrzh74Xjnt0n3JgTwlChirDqnq3bzY8QvAr3/HsEtz
	a3AdIn17vA6Luo+mC6hhPO/q4H7/2YkOXp5hXls+X0Qf/KtssENmJck6hkFdXnELefk6DbsG1PuI7
	kEomdk326zPZQcxIP7iVhMw/5SbEccWPMyDYJipf/u0W/ypPcsDBuWhgTFHcHUJGfD1aIYJp4v+Si
	GKDx2lWI9qLgrtCkfjgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLFwv-00Cs9F-0V;
	Thu, 04 Jan 2024 05:07:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLFwr-00Cs6i-24
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 05:07:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704344823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9wsIvjC67PLFCF/BdJ20SdklAkum5ffGTzXv885bu5w=;
	b=bh2Qphh59DHwxbTW1zFgYoCjlnOeWpx2eiFygVJFs58qaJ+Mg2Lh6/WgnzDHJpTb8tEb+H
	TylXgGuY2SQwU4eDb0SsW1lVJ8uzYB9N69+ZDuMHQE+oYxqLkyO4VS6Jaf/ghOAOc5rnFf
	rXryFzYAv68J8fKaTezbBRJpHcgRWUo=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-FiToQ0twOL2ze7YNL9dtmw-1; Thu, 04 Jan 2024 00:07:01 -0500
X-MC-Unique: FiToQ0twOL2ze7YNL9dtmw-1
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1d4a097002fso1218185ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 21:07:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704344820; x=1704949620;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9wsIvjC67PLFCF/BdJ20SdklAkum5ffGTzXv885bu5w=;
        b=M2+C8yhxXPW/EcsncHH+X2zD9rUE6PeotePUvAHtEvXHwuQpev30pNZOB/RoKbqjV7
         8PZaYYGn4ljNG5heQD0rW1UyMgUdto1OFXIc/4FGiONSFe+4rF6i/xdR7P0LH6t+m8dC
         mD4/fZgVOEtPgK5CccI4cfunsfNjUhDqqoGhsnALAJ3b+j92DhQH/LCNCHEdw+kTMpbS
         UJ2R+nTlq1FGxOJgcxre4+IDkbWOEDdtUniQep873ZxEcTtXuwU+mW5Ak/QJwyuN3pOX
         JaN0NMEmCscuSvaBBUS7Us50DYmZU6bQgYzgdzX6+CmjitPUI1TGyAnkrXqgHv8dohnO
         pQag==
X-Gm-Message-State: AOJu0YwYSx0ki9OHAhoL5M2IQD1POm7OHxa5rceLIpQy8IEFIIbNKIa/
	9RCG4lgw/Sls4k3neEWMwevNgpDfEd9rW4Wi/Tbk2+OtpnT0MGtDAeLU6jmEmRa9COSPIf1mT4b
	VXu5+YYITZh1fqN+ZEHl6cxMUAq2v48LZYxen
X-Received: by 2002:a17:903:2448:b0:1d4:418e:d83b with SMTP id l8-20020a170903244800b001d4418ed83bmr67097pls.111.1704344820266;
        Wed, 03 Jan 2024 21:07:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtRRfPoD2AmDU6qtptVCBW0QbNzJYM+ha8MKoofBpriej1vuzGKEnPUsoFlW2M8rLqW0B82A==
X-Received: by 2002:a17:903:2448:b0:1d4:418e:d83b with SMTP id l8-20020a170903244800b001d4418ed83bmr67071pls.111.1704344819948;
        Wed, 03 Jan 2024 21:06:59 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7ec:911:6911:ca60:846:eb46])
        by smtp.gmail.com with ESMTPSA id e1-20020a170902ed8100b001d4ab4e2a7asm8332870plj.231.2024.01.03.21.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 21:06:59 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: guoren@kernel.org
Subject: Re: [PATCH V12 07/14] riscv: qspinlock: Add virt_spin_lock() support for VM guest
Date: Thu,  4 Jan 2024 02:06:46 -0300
Message-ID: <ZZY85kZZ_uipkVTW@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231225125847.2778638-8-guoren@kernel.org>
References: <20231225125847.2778638-1-guoren@kernel.org> <20231225125847.2778638-8-guoren@kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_210717_777764_74F3B0BB 
X-CRM114-Status: GOOD (  26.69  )
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
Cc: Guo Ren <guoren@linux.alibaba.com>, kvm@vger.kernel.org, peterz@infradead.org, paul.walmsley@sifive.com, bjorn@rivosinc.com, virtualization@lists.linux-foundation.org, conor.dooley@microchip.com, jszhang@kernel.org, panqinglin2020@iscas.ac.cn, linux-riscv@lists.infradead.org, anup@brainfault.org, unicorn_wang@outlook.com, xiaoguang.xing@sophgo.com, wuwei2016@iscas.ac.cn, keescook@chromium.org, atishp@atishpatra.org, chao.wei@sophgo.com, linux-kernel@vger.kernel.org, Leonardo Bras <leobras@redhat.com>, palmer@dabbelt.com, wefu@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Dec 25, 2023 at 07:58:40AM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Add a static key controlling whether virt_spin_lock() should be
> called or not. When running on bare metal set the new key to
> false.
> 
> The VM guests should fall back to a Test-and-Set spinlock,
> because fair locks have horrible lock 'holder' preemption issues.
> The virt_spin_lock_key would shortcut for the queued_spin_lock_-
> slowpath() function that allow virt_spin_lock to hijack it.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  .../admin-guide/kernel-parameters.txt         |  4 +++
>  arch/riscv/include/asm/spinlock.h             | 22 ++++++++++++++++
>  arch/riscv/kernel/setup.c                     | 26 +++++++++++++++++++
>  3 files changed, 52 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 2ac9f1511774..b7794c96d91e 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3997,6 +3997,10 @@
>  	no_uaccess_flush
>  	                [PPC] Don't flush the L1-D cache after accessing user data.
>  
> +	no_virt_spin	[RISC-V] Disable virt_spin_lock in VM guest to use
> +			native_queued_spinlock when the nopvspin option is enabled.
> +			This would help vcpu=pcpu scenarios.
> +
>  	novmcoredd	[KNL,KDUMP]
>  			Disable device dump. Device dump allows drivers to
>  			append dump data to vmcore so you can collect driver
> diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
> index d07643c07aae..7bbcf3d9fff0 100644
> --- a/arch/riscv/include/asm/spinlock.h
> +++ b/arch/riscv/include/asm/spinlock.h
> @@ -4,6 +4,28 @@
>  #define __ASM_RISCV_SPINLOCK_H
>  
>  #ifdef CONFIG_QUEUED_SPINLOCKS
> +/*
> + * The KVM guests fall back to a Test-and-Set spinlock, because fair locks
> + * have horrible lock 'holder' preemption issues. The virt_spin_lock_key
> + * would shortcut for the queued_spin_lock_slowpath() function that allow
> + * virt_spin_lock to hijack it.
> + */
> +DECLARE_STATIC_KEY_TRUE(virt_spin_lock_key);
> +
> +#define virt_spin_lock virt_spin_lock
> +static inline bool virt_spin_lock(struct qspinlock *lock)
> +{
> +	if (!static_branch_likely(&virt_spin_lock_key))
> +		return false;
> +
> +	do {
> +		while (atomic_read(&lock->val) != 0)
> +			cpu_relax();
> +	} while (atomic_cmpxchg(&lock->val, 0, _Q_LOCKED_VAL) != 0);
> +
> +	return true;
> +}
> +
>  #define _Q_PENDING_LOOPS	(1 << 9)
>  #endif
>  
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index d9072a59831c..0bafb9fd6ea3 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -27,6 +27,7 @@
>  #include <asm/cacheflush.h>
>  #include <asm/cpufeature.h>
>  #include <asm/cpu_ops.h>
> +#include <asm/cpufeature.h>
>  #include <asm/early_ioremap.h>
>  #include <asm/pgtable.h>
>  #include <asm/setup.h>
> @@ -266,6 +267,27 @@ early_param("qspinlock", queued_spinlock_setup);
>  DEFINE_STATIC_KEY_TRUE(combo_qspinlock_key);
>  EXPORT_SYMBOL(combo_qspinlock_key);
>  
> +#ifdef CONFIG_QUEUED_SPINLOCKS
> +static bool no_virt_spin __ro_after_init;
> +static int __init no_virt_spin_setup(char *p)
> +{
> +	no_virt_spin = true;
> +
> +	return 0;
> +}
> +early_param("no_virt_spin", no_virt_spin_setup);
> +
> +DEFINE_STATIC_KEY_TRUE(virt_spin_lock_key);
> +
> +static void __init virt_spin_lock_init(void)
> +{
> +	if (no_virt_spin)
> +		static_branch_disable(&virt_spin_lock_key);
> +	else
> +		pr_info("Enable virt_spin_lock\n");
> +}
> +#endif
> +
>  static void __init riscv_spinlock_init(void)
>  {
>  	if (!enable_qspinlock) {
> @@ -274,6 +296,10 @@ static void __init riscv_spinlock_init(void)
>  	} else {
>  		pr_info("Queued spinlock: enabled\n");
>  	}
> +
> +#ifdef CONFIG_QUEUED_SPINLOCKS
> +	virt_spin_lock_init();
> +#endif
>  }
>  #endif
>  
> -- 
> 2.40.1
> 

LGTM:
Reviewed-by: Leonardo Bras <leobras@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
