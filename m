Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64AAAC433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 04:40:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E17DD64FEF
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 04:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E17DD64FEF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Y++QPlDyaBqdB9dL+Cs1e9Y6hFdF6mjCVnl98jP3xa0=; b=au3tlyJYOAAwTQ2Hv+TII0wVF
	WO297W1/hKuLY2TdIRK0jY1jVL2FNRISmkcQ3uYBfEWmhkarcnk2A3KOsQ+QlDJVUefIrrqB3saxL
	/UrVVTir9G0rJ4oWtEVOw+ApPMC9p0eBytnFvT5QwH69lHx7Bq8XNjP1k8iVE6/ygbgvXdBf+Dmvv
	smOTCmoxHogyAI7j5zBtsBCKmB96bWC3JqiVen790ai7LK4Gw8juaxlQcEpwFw3KWcxkpVRGw6iD+
	mHMvhiq87L6R3epuQsWteR2jm4vmiE/ijXxLOTD/Gi59yp8UKKiGKMd8KxFsq1d8MqMC/foK5+R16
	1rsP2IwtA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJqdL-0060dd-AJ; Wed, 10 Mar 2021 04:39:43 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJqcr-0060Zw-4G
 for linux-riscv@lists.infradead.org; Wed, 10 Mar 2021 04:39:19 +0000
Received: by mail-pf1-x432.google.com with SMTP id l7so11225323pfd.3
 for <linux-riscv@lists.infradead.org>; Tue, 09 Mar 2021 20:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=yivrU7SIHNpwwHUWNit519hmOO2ZZWTmJ+KN7JWy7AI=;
 b=r4EP1H+TuCwfkmSdpktz3zXQx/2lLucsSW4KUFpcqWg705Wz7NEr+KRZT5AKllRHjX
 AWlmJ5M36ioGNf3kVeFMMD081+ZOTd0Ypv7Ravjeh/AzVjLEWK8cV/VXlYeD8ALWZKnj
 IbcSryb9BkK6tP6Uxfap+++56IoWWO7mNCNsZlldsPAB0kbCfL+T+1Yo9pWiLbefCLEk
 GMV6cqdayz3psbYg9dBvNkbJTJLpyDS+mxcSmhFM2PKTlr7vx/4ihEDrdxtNIjxKSIZX
 l/IVBKQ+F1lZTc1UB7ilFCnnWM0Xu8TESCjoj2mLXI3HoW7Pveo7Jr6tBHSTfHUS4Z6i
 KFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=yivrU7SIHNpwwHUWNit519hmOO2ZZWTmJ+KN7JWy7AI=;
 b=BZE0HKP8dM1Oq7sKUKmOECW6nYBeOJ759jBpbqMQ4zotVRDUIos5j3JT/oHw+vD2WL
 92XnujtfbU9JgdDcEsVXZEr7CgwkG/GR4qfNhnO0wocHRqV5wuAg3l4zimthBo+oMGID
 Ri7lPPZRtf75lolVXv+1Be1420e1FcNQKrXNl1VL+p5pwN84ebAsjsedORDChe05ZPTJ
 y2cvMDDWr9JKn/XgRUGrRzarLzI8nQfoYgqJ+YqKqzepVr1W5wyQTQhWc+nOVsVelZyF
 fNLuxv7mcybw+2ggYYswwE/O/c40LfDX/yO6FkdXdnrtzWpIPEl6ESw80fbwkd7Z52jf
 ei/A==
X-Gm-Message-State: AOAM53150mnhwzESfwjG1Z/pq7lcax1MIpnt3lcgdXLhK8reDIidj6P9
 2ajJAAie+8KBiOf1UtCGD+Mt8WbTNnswKQ==
X-Google-Smtp-Source: ABdhPJwlpeJekzj2Bi3kkKP524JIpnFGy3SWk6Y5UIgqmjCy2C7QwUpJ9WwyMxJ0qldbL1qm+/HJWw==
X-Received: by 2002:aa7:808b:0:b029:1ce:8a32:f5e8 with SMTP id
 v11-20020aa7808b0000b02901ce8a32f5e8mr1412883pff.34.1615351151287; 
 Tue, 09 Mar 2021 20:39:11 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id v2sm4339975pjg.34.2021.03.09.20.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 20:39:10 -0800 (PST)
Date: Tue, 09 Mar 2021 20:39:10 -0800 (PST)
X-Google-Original-Date: Tue, 09 Mar 2021 19:41:44 PST (-0800)
Subject: Re: [RFC patch 1/4] riscv: Add 3 SBI wrapper functions to get cpu
 manufacturer information
In-Reply-To: <1615175897-23509-2-git-send-email-vincent.chen@sifive.com>
CC: linux-riscv@lists.infradead.org, Frank.Zhao@starfivetech.com,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 guoren@kernel.org, alankao@andestech.com, 
 Paul Walmsley <paul.walmsley@sifive.com>, vincent.chen@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vincent.chen@sifive.com
Message-ID: <mhng-9928bd58-137c-4618-822c-56790ecd275a@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_043917_666897_FB2D1CCC 
X-CRM114-Status: GOOD (  17.72  )
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

On Sun, 07 Mar 2021 19:58:14 PST (-0800), vincent.chen@sifive.com wrote:
> Add 3 wrapper functions to get vendor id, architecture id and implement id
> from M-mode
>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>  arch/riscv/include/asm/sbi.h |  3 +++
>  arch/riscv/kernel/sbi.c      | 15 +++++++++++++++
>  2 files changed, 18 insertions(+)
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 99895d9c3bdd..94a7f664caf4 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -97,6 +97,9 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>
>  void sbi_console_putchar(int ch);
>  int sbi_console_getchar(void);
> +long sbi_get_vendorid(void);
> +long sbi_get_archid(void);
> +long sbi_get_impid(void);
>  void sbi_set_timer(uint64_t stime_value);
>  void sbi_shutdown(void);
>  void sbi_clear_ipi(void);
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index f4a7db3d309e..33e3a9d6efab 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -547,6 +547,21 @@ static inline long sbi_get_firmware_version(void)
>  	return __sbi_base_ecall(SBI_EXT_BASE_GET_IMP_VERSION);
>  }
>
> +long sbi_get_vendorid(void)
> +{
> +	return __sbi_base_ecall(SBI_EXT_BASE_GET_MVENDORID);
> +}
> +
> +long sbi_get_archid(void)
> +{
> +	return __sbi_base_ecall(SBI_EXT_BASE_GET_MARCHID);
> +}
> +
> +long sbi_get_impid(void)
> +{
> +	return __sbi_base_ecall(SBI_EXT_BASE_GET_MIMPID);
> +}

The function names should match the SBI function names, which have an extra "m" 
in them.  Otherwise it's just confusing.

> +
>  static void sbi_send_cpumask_ipi(const struct cpumask *target)
>  {
>  	struct cpumask hartid_mask;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
