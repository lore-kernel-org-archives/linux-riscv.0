Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C6CC47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 05:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CDyyuiGJBd5c65qD1MNF1k1AVqTOGMP7QFYow2CfkpE=; b=fmI5QLIidxZ6+w
	UeR/z777dtxCAPEKX0dABjr7UFgxD8Bkp93LgkFyjC+3G2AWN6Pws4g7SfsCyOUj4OaCPRIfpIrIT
	NxSQROCVaX1AyiqrTTZ5rxrFNbr90OV93gWgxPCFStPqwDAdQafDLdg68kyckCQJii1lah8YceRwK
	YG2L/K/GS1GY6yac9siir1PvCnzOVeG/T/drbM3ShFocFLMJDLqXe3NfZ2mutnPGL4JkEHAsQyLWg
	2TjE2MhPzm+iBgXFAOEEMl+43ZbM5zZ1TLSnfyDY4YQQd5zeiLu8prBWZRrZ6UdMRoudvf+DSFRW2
	oqL6mKP/Gk8fA4wFEi5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLG0p-00CsUq-01;
	Thu, 04 Jan 2024 05:11:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLG0m-00CsUD-09
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 05:11:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704345079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P1vihmddHtSZ99/zq0fZBdm+zeXPC115N0eCs1YPKg8=;
	b=WgCPoPf0DHOTInW2th0z9/Eyfddgc6CAnHIgIYJ2tKdFStqtmF5x9UxXwIhCDSJBeySusM
	02KOkagv9W8K+2qKVynDnZfEqx8vuqpLTXiZuz8ViLjd16NOZfMSU8sPSjpbWe3eVSC4Xa
	ut93RR8DOONmywNDY7VjrafI9zVjTwg=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-V-Y8LXckPg2iYcJ0uHjNww-1; Thu, 04 Jan 2024 00:11:17 -0500
X-MC-Unique: V-Y8LXckPg2iYcJ0uHjNww-1
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-5ca4ee5b97aso96638a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 21:11:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704345076; x=1704949876;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P1vihmddHtSZ99/zq0fZBdm+zeXPC115N0eCs1YPKg8=;
        b=IpPFo+P8v1l+oThl94UacKSLJpkGLsHmCC5gwTWDOYrMm11ZdtdHgVRxtJ1cv6BFFy
         7eZUM2xky0thj4pFD2I2Nt5nM8hlNweTCASKsjOXvzI8sPse89QiDwMmLdu4qCkun2wp
         71HUe1hvjSsQK7L3XlRrxeXZ5GUUXFTlHAHEFlUqfvoeU1jgQA2ZLprtBC6BBAFZf+ni
         yfwrELdzMfB+JjQ4sSRrOL6p4aQxyRm/3vlDFYyRYJ98Y/SQW642QRtXxXiycIbKlpQ0
         LRDOvYShwFKu0V95ve2kGNyzpJTmlO+y6cOQne6HZvnCGh37xDUD8YhH+WiwJSs/2ehx
         47Aw==
X-Gm-Message-State: AOJu0Yz3N2WMLimWxMqxXHWC669GC549vOUDdC2EjJb6se2uNgv8xhnW
	3I9ro7TyWCv82og5RcAeacMfi5berZLeEaBx5xW1lP1+kCNbolBc2IkdR9Hvvx4JvBbsaNDo6qo
	ld7TGOl1FzfpbQE3kVwQ6BH6eS5yUXFhkSY/7
X-Received: by 2002:a17:902:da86:b0:1d4:d140:8171 with SMTP id j6-20020a170902da8600b001d4d1408171mr52101plx.41.1704345076622;
        Wed, 03 Jan 2024 21:11:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpSlvwWfbHMFG7wHdD03jmH2na3W8ssbNhKgAkQNbMSxmoAlh0aAjbmolGPOik5IenAoMbcg==
X-Received: by 2002:a17:902:da86:b0:1d4:d140:8171 with SMTP id j6-20020a170902da8600b001d4d1408171mr52085plx.41.1704345076326;
        Wed, 03 Jan 2024 21:11:16 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7ec:911:6911:ca60:846:eb46])
        by smtp.gmail.com with ESMTPSA id u15-20020a17090341cf00b001d3ecbccb52sm24427284ple.213.2024.01.03.21.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 21:11:15 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: guoren@kernel.org
Subject: Re: [PATCH V12 08/14] riscv: qspinlock: Force virt_spin_lock for KVM guests
Date: Thu,  4 Jan 2024 02:11:05 -0300
Message-ID: <ZZY96U3CzvDhu3BL@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231225125847.2778638-9-guoren@kernel.org>
References: <20231225125847.2778638-1-guoren@kernel.org> <20231225125847.2778638-9-guoren@kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_211120_184003_1DC43BE8 
X-CRM114-Status: GOOD (  17.53  )
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

On Mon, Dec 25, 2023 at 07:58:41AM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Force to enable virt_spin_lock when KVM guest, because fair locks
> have horrible lock 'holder' preemption issues.
> 
> Suggested-by: Leonardo Bras <leobras@redhat.com>
> Link: https://lkml.kernel.org/kvm/ZQK9-tn2MepXlY1u@redhat.com/
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/include/asm/sbi.h | 8 ++++++++
>  arch/riscv/kernel/sbi.c      | 2 +-
>  arch/riscv/kernel/setup.c    | 6 +++++-
>  3 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 0892f4421bc4..8f748d9e1b85 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -51,6 +51,13 @@ enum sbi_ext_base_fid {
>  	SBI_EXT_BASE_GET_MIMPID,
>  };
>  
> +enum sbi_ext_base_impl_id {
> +	SBI_EXT_BASE_IMPL_ID_BBL = 0,
> +	SBI_EXT_BASE_IMPL_ID_OPENSBI,
> +	SBI_EXT_BASE_IMPL_ID_XVISOR,
> +	SBI_EXT_BASE_IMPL_ID_KVM,
> +};
> +
>  enum sbi_ext_time_fid {
>  	SBI_EXT_TIME_SET_TIMER = 0,
>  };
> @@ -276,6 +283,7 @@ int sbi_console_getchar(void);
>  long sbi_get_mvendorid(void);
>  long sbi_get_marchid(void);
>  long sbi_get_mimpid(void);
> +long sbi_get_firmware_id(void);
>  void sbi_set_timer(uint64_t stime_value);
>  void sbi_shutdown(void);
>  void sbi_send_ipi(unsigned int cpu);
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index 5a62ed1da453..4330aedf65fd 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -543,7 +543,7 @@ static inline long sbi_get_spec_version(void)
>  	return __sbi_base_ecall(SBI_EXT_BASE_GET_SPEC_VERSION);
>  }
>  
> -static inline long sbi_get_firmware_id(void)
> +long sbi_get_firmware_id(void)
>  {
>  	return __sbi_base_ecall(SBI_EXT_BASE_GET_IMP_ID);
>  }
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 0bafb9fd6ea3..e33430e9d97e 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -281,6 +281,9 @@ DEFINE_STATIC_KEY_TRUE(virt_spin_lock_key);
>  
>  static void __init virt_spin_lock_init(void)
>  {
> +	if (sbi_get_firmware_id() != SBI_EXT_BASE_IMPL_ID_KVM)
> +		no_virt_spin = true;
> +
>  	if (no_virt_spin)
>  		static_branch_disable(&virt_spin_lock_key);
>  	else
> @@ -290,7 +293,8 @@ static void __init virt_spin_lock_init(void)
>  
>  static void __init riscv_spinlock_init(void)
>  {
> -	if (!enable_qspinlock) {
> +	if ((!enable_qspinlock) &&
> +	    (sbi_get_firmware_id() != SBI_EXT_BASE_IMPL_ID_KVM)) {
>  		static_branch_disable(&combo_qspinlock_key);
>  		pr_info("Ticket spinlock: enabled\n");
>  	} else {
> -- 
> 2.40.1
> 

LGTM:
Reviewed-by: Leonardo Bras <leobras@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
