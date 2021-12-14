Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA51C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Dec 2021 16:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ZadMJCrv7PIB212TvLccYwreiCi+NrnPvXNNNBjyN5o=; b=cS7CDltMb8JiAe7UXfc9IbZIJC
	sTVmtrrbSk99lYuYoIHwk+0oOFCunWSNKDGoNAkAlipSh5Io7zWAQyuvV+ydgCviGdV2KhKtAH6tf
	QNY0kB5aeWr3aO3wcwTFhB9BCrYnWgAh6O5Bly93zaCgI/m27YKOLHM29Eh04XAGWDI7pQL6WMoDL
	ozmXrbMBi5oxWv5MsnTNr/kWtd7b1sBIWPSdBJk0SsvAkl7AwiXi1gRBLmtzxDyuJBCCrxIhy0YPq
	YJ/eA9yEa6vkQuNGnmdxlPnxyIqWMYDA0cEzMLkzl/cp20Ro+W9IMtwPVC/5rhWBpkZ/KQwmEJgQ9
	KPD4nVJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxAgR-00EsYI-14; Tue, 14 Dec 2021 16:29:43 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxAgC-00EsK6-4P
 for linux-riscv@lists.infradead.org; Tue, 14 Dec 2021 16:29:29 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 k6-20020a17090a7f0600b001ad9d73b20bso16413501pjl.3
 for <linux-riscv@lists.infradead.org>; Tue, 14 Dec 2021 08:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=F8tZTjHZ2yYRN1+Oex1t1Eoc2e/x1cydqgGYoHqswK8=;
 b=cswel/OaN5GDEddQIq4I2K+ubcGjJqWOxWC9f2jDmASgcA/ilqszRlMTXm9zjaJW+d
 U89llEIjBslM64rCcikMvCK4PI2bNIQcfFab2JhVTX8bFcACOFrtMztxsVpP8QddK7E2
 /nwoRLiz7iB0gss/dapd4H47nQGztvAU89mz9Fku05rS7TCMyzA4nqvSHoqwJ7V469vD
 nDA53TbvZ2MZMdmRO/F2fM7zL53+iPPhFb3Z7GPxRtHVFGtL+ihAno6e3UOW5Z51y3O7
 12KVCE+XHe0azHQULWYsdQWOHexxR3+xkJQIKRiyQSZWe9JJ6kx61KAUkTyYwyg74wQJ
 X8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=F8tZTjHZ2yYRN1+Oex1t1Eoc2e/x1cydqgGYoHqswK8=;
 b=uotw3dnlDj6jg0UuNnQTGri6cRI9ACR4MayPZK6SflqTqNzI8y/7I7yflbMRhPCmRO
 tjlMCNqbLAGa+vTQgqPjqUSYRJk5mFIvZ027UgsrL6gbIJXpuWS5nqCMixcTHnTBMEyj
 LlaRsfwuoY697GVcBagiCpxjuoQCfwBEievcTv4Uiqj87UPdzOleowXPF5J/cY27WD73
 i7YkFA9Ddv/qpaKsLfaUe9FqRr27UMc2VIdvoNTQGnJRR7XrH+9eHMioQq/NtAKcrDem
 EDM3eyhK4wjP4wBZfWUWc/bAklsMy4lBzix2St1K/08Ie5mGE4K01J8eWlTCQsBfkqCg
 5YsA==
X-Gm-Message-State: AOAM530C9YC2A1KaB+cCLd3japZk0yMK2CX16ix+HG5g5m4iZQ4aaX3O
 c585avM1hyP+Oitqd2u0MNSbMw==
X-Google-Smtp-Source: ABdhPJxreadDsRSfHcV9rVxes+7EwTLlJoBtYfZ9LcUbB4BFQCx9KbhdF7JA41d0ANFwXPxztbToGw==
X-Received: by 2002:a17:90a:fd96:: with SMTP id
 cx22mr6633392pjb.151.1639499363669; 
 Tue, 14 Dec 2021 08:29:23 -0800 (PST)
Received: from localhost ([12.163.77.120])
 by smtp.gmail.com with ESMTPSA id z13sm314691pfj.160.2021.12.14.08.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 08:29:23 -0800 (PST)
Date: Tue, 14 Dec 2021 08:29:23 -0800 (PST)
X-Google-Original-Date: Mon, 13 Dec 2021 18:18:38 PST (-0800)
Subject: Re: [PATCH v9 04/17] riscv: Add new csr defines related to vector
 extension
In-Reply-To: <6013bd0c309cecf244a151b54ee73c0ebd391663.1636362169.git.greentime.hu@sifive.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: greentime.hu@sifive.com
Message-ID: <mhng-00f26944-35dd-413c-ad9e-4db8c8144c11@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_082928_209897_3EDE74EA 
X-CRM114-Status: GOOD (  13.35  )
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

On Tue, 09 Nov 2021 01:48:16 PST (-0800), greentime.hu@sifive.com wrote:
> Follow the riscv vector spec to add new csr numbers.
>
> [guoren@linux.alibaba.com: first porting for new vector related csr]
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Acked-by: Guo Ren <guoren@kernel.org>
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>  arch/riscv/include/asm/csr.h | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 87ac65696871..069743102fac 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -24,6 +24,12 @@
>  #define SR_FS_CLEAN	_AC(0x00004000, UL)
>  #define SR_FS_DIRTY	_AC(0x00006000, UL)
>
> +#define SR_VS           _AC(0x00000600, UL) /* Vector Status */
> +#define SR_VS_OFF       _AC(0x00000000, UL)
> +#define SR_VS_INITIAL   _AC(0x00000200, UL)
> +#define SR_VS_CLEAN     _AC(0x00000400, UL)
> +#define SR_VS_DIRTY     _AC(0x00000600, UL)
> +
>  #define SR_XS		_AC(0x00018000, UL) /* Extension Status */
>  #define SR_XS_OFF	_AC(0x00000000, UL)
>  #define SR_XS_INITIAL	_AC(0x00008000, UL)
> @@ -31,9 +37,9 @@
>  #define SR_XS_DIRTY	_AC(0x00018000, UL)
>
>  #ifndef CONFIG_64BIT
> -#define SR_SD		_AC(0x80000000, UL) /* FS/XS dirty */
> +#define SR_SD		_AC(0x80000000, UL) /* FS/VS/XS dirty */
>  #else
> -#define SR_SD		_AC(0x8000000000000000, UL) /* FS/XS dirty */
> +#define SR_SD		_AC(0x8000000000000000, UL) /* FS/VS/XS dirty */
>  #endif
>
>  /* SATP flags */
> @@ -120,6 +126,12 @@
>  #define CSR_MIMPID		0xf13
>  #define CSR_MHARTID		0xf14
>
> +#define CSR_VSTART		0x8
> +#define CSR_VCSR		0xf
> +#define CSR_VL			0xc20
> +#define CSR_VTYPE		0xc21
> +#define CSR_VLENB		0xc22
> +
>  #ifdef CONFIG_RISCV_M_MODE
>  # define CSR_STATUS	CSR_MSTATUS
>  # define CSR_IE		CSR_MIE

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
