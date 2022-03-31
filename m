Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908C8C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 20:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Gw3lPsqcxv9Dxsu74FrTaf2fmq2UeVzpCjxT9Iz3Zjo=; b=INrpUzABLzoskyRGIZeoog8VbC
	39c0kl8JyUYCCczyh+0YVC8ciA/Ekm/mCkdMkYonGM/XiCC2SEcifJTvjUITbg5XYyf3/KIswQwSp
	FT6Vl19MNbFqU4k+qgOwGb1sFQzUJTq1g9kXSZ5LItl1qpSZPydjQiw2XZs4NnzU+SH///3IGDQDY
	Yq99eeq5jIQsIwLBs3a181hSM8PqKZD7Ezu/0zdsqqOi1U2wDG3jyvbhC+UiBCrTuw/FQ/MuObAZv
	eXy89lfdDernLAPYVwoa8602ja3g23/en4Pppgb/oEPoIzejzkQYf7dGBeaY7zSgzAMvGi+VrrDp2
	WpGQlqDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1na1Ow-003aEH-An; Thu, 31 Mar 2022 20:28:14 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1na1Os-003aCa-RS
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 20:28:12 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 h23-20020a17090a051700b001c9c1dd3acbso517751pjh.3
 for <linux-riscv@lists.infradead.org>; Thu, 31 Mar 2022 13:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=TKoZ/nz81ZNzIZ4/qjkFTHoMQbOmbKcbWzVeoYJyq80=;
 b=bwM9YFd6aKcqeoiNrWLK4mKczmasgPfu7bkAid1hpS4njXXeAjHctX2fRHXNjMDVV3
 SvUXUf5cFCiTxeHo2HS3LNDPNO4M/iVVFku/IjWGo5nQdEqpiz2fwxyH4vi+Sr/BuBMO
 MDADNdyDNh31YDJ3C2fmywMndfKsAstXxJq6xvVX9/TAOViLLwCy2J1/YQA+BvtCFAe/
 MLPF/CsvXenJQrEZL177ucy4TYB8XNkB61N/MqbnR0m/40a6ynx03hUWEDsUOFQ+zfQ9
 PuxbxOSBwLXZGKOz2pbMwKSop9FfR0f4gwtQQJFUnyca77rRABvVffg+Ik+Iwq8mxwmZ
 i+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=TKoZ/nz81ZNzIZ4/qjkFTHoMQbOmbKcbWzVeoYJyq80=;
 b=30xTyZOxtOwpn0AguVs3JT+GiLcastIimB2Cn6IF5JkPI6RjSM1mHCtl5BtCjW8Uad
 mvRVCnDLx9zudzWq60vighWtuwtYY2M0nYGUAFLiSl/SaOKLU0hkhZPB3y4LvJqRH9XM
 y2PbG4oDeu1KqY/pIylgiRP5QItztiejBKbf+g+EsakleopSLkIytsHuYI8HRgbkuFIA
 uuLAKXvZHWhtGU05A3t9tGxfkGo9AZQwxsNIFiTuRlVNRMhD/w8VqEqbbLsEG4Z2o+7/
 9d48DQj1CnICLjD3w5GImBWNn04kj/ppMbvj4Li8oM47zni1TQ5ppfK1lOTBpTBXC6uL
 9NQg==
X-Gm-Message-State: AOAM532GQhm2pfuQDLP1PKMdpz3hLYVxE6EBD+SIX/YQlJ5GE3gEHD2e
 xy2ErYIWFmNInYhnaOaUIl7TMnL032YjTw==
X-Google-Smtp-Source: ABdhPJyVFn8ENa2kE4UdGb6NvElEUeGZjR6p4aS+Eck6YgHNh4BGSgMNXMsFs65zIo0RE+DgDQDQeQ==
X-Received: by 2002:a17:902:d48e:b0:154:b6a:9ff with SMTP id
 c14-20020a170902d48e00b001540b6a09ffmr7172437plg.2.1648758489028; 
 Thu, 31 Mar 2022 13:28:09 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 s2-20020a17090a1c0200b001c994db1960sm225986pjs.10.2022.03.31.13.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 13:28:08 -0700 (PDT)
Date: Thu, 31 Mar 2022 13:28:08 -0700 (PDT)
X-Google-Original-Date: Thu, 31 Mar 2022 13:23:48 PDT (-0700)
Subject: Re: [PATCH v2] kernel module: fix apply_r_riscv_rcv_branch_rela typo
In-Reply-To: <20220324020920.651419-1-zepan@sipeed.com>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 zepan@sipeed.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zepan@sipeed.com
Message-ID: <mhng-aa1f5a8e-0053-4e79-8dce-241e14aa94ee@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_132810_931278_542ECFE6 
X-CRM114-Status: GOOD (  15.53  )
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

On Wed, 23 Mar 2022 19:09:21 PDT (-0700), zepan@sipeed.com wrote:
> This patch fix typo: apply_r_riscv_rcv_branch_rela -> apply_r_riscv_rvc_branch_rela
>
> Signed-off-by: Wu Caize <zepan@sipeed.com>
> ---
>  arch/riscv/kernel/module.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 68a9e3d1fe16..b92e93f2aac3 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -56,7 +56,7 @@ static int apply_r_riscv_jal_rela(struct module *me, u32 *location,
>  	return 0;
>  }
>
> -static int apply_r_riscv_rcv_branch_rela(struct module *me, u32 *location,
> +static int apply_r_riscv_rvc_branch_rela(struct module *me, u32 *location,
>  					 Elf_Addr v)
>  {
>  	ptrdiff_t offset = (void *)v - (void *)location;
> @@ -290,7 +290,7 @@ static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
>  	[R_RISCV_64]			= apply_r_riscv_64_rela,
>  	[R_RISCV_BRANCH]		= apply_r_riscv_branch_rela,
>  	[R_RISCV_JAL]			= apply_r_riscv_jal_rela,
> -	[R_RISCV_RVC_BRANCH]		= apply_r_riscv_rcv_branch_rela,
> +	[R_RISCV_RVC_BRANCH]		= apply_r_riscv_rvc_branch_rela,
>  	[R_RISCV_RVC_JUMP]		= apply_r_riscv_rvc_jump_rela,
>  	[R_RISCV_PCREL_HI20]		= apply_r_riscv_pcrel_hi20_rela,
>  	[R_RISCV_PCREL_LO12_I]		= apply_r_riscv_pcrel_lo12_i_rela,

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
