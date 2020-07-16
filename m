Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8CEAC433E3
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 13:20:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 811C32065F
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 13:20:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WCK2n09X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="wTAAXqYW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 811C32065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RuP2mjtSFpLt/bPkSY7adhoJOlvym+lAvx8MKTUwFAI=; b=WCK2n09XA9O+Rrae+h8EQBcQE
	U1PPHWayOlkL8tQmZBJRM7h35lF5gcEUB+Mk2rRiSL7s/qRoOeoRk88SvB7bc61D0DkHlDZBBo9Uy
	oYyi2k/y8IywxH/qs8f3VHNmOY4ED4pnvQl7C6j5ubWh3GLWgwOsK3VQO/BgeG8DtN0MI1HiKpiXE
	gWWSkkYbZw5MQPceNNlTYqZZmmtQJsOVL1v+57q+uFlg+B/WJ8ZtRZTEpfYndy4mLJz9gwGER8MDJ
	yYjtpT0RzoEgb+b4h3GPHzng2G62FpZWIF/Xple1V7GefsCGbPHSEXrNd4ni/tz4icVwl1u+Q+vxC
	iki/gEHLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw3nq-0006DN-Br; Thu, 16 Jul 2020 13:19:58 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw3no-0006Cx-S4
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 13:19:57 +0000
Received: by mail-wm1-x343.google.com with SMTP id l2so11617593wmf.0
 for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2020 06:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+Opa04oEqgTBiOKYS1pjpUdtak0oL8WBVStzXqF1+/8=;
 b=wTAAXqYWiNlP2B6mjWEgbI3KTLl2M0kIkndJjf3MujFAWW6KxBgEHGHnK6nLsvxQUr
 uNgBkwVHPilPpPR06GmDjPi2JrQ0jdDsCMihlJEk9FBcMg0Krm8g2F14514JnrBaooXY
 ueu2SQbxihXqtyfVhrolWOPfnc8ouBq15nSh8Yo1YM5S1/Xxu4qMnNFBi/K/eKppxuZs
 GR6RLTrq5iVnR/rOOo/1PhFSyUv7yUDXRWj0d5d0tRE1eauZk9bDibb/+TZsMU3rb5qF
 uvBU2KmfSz5ySW/3Gbl2KKGrQVT1eB/mEYz/y/oUWRiKJSR3JD6Phk20cSntOYmLKPoa
 H6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+Opa04oEqgTBiOKYS1pjpUdtak0oL8WBVStzXqF1+/8=;
 b=OqcWL0oNXP8tsXNpjfktKSjPmzv9OZ4B0DFWJV1Yua9MqV3EdYmWXfU8PNYEprmXvb
 HhcI5eYCM+DUf5Z85kPYUSLgiIqGi6iHq/mmU3UssFAGFQb8Ju+8mvAv4tisUtxF2WmO
 XbSsZYvuknt7lXAtbrlJWEIxFqQ4lqNALzXOTvgqQKzAluqAsYdkM+oy16Xoncrrjatm
 icQjut7FDwSu5HZ/TQn5I4vAZI2/2a/cqn/leuJotpyGtxVgwd9/mk4/4rY2H4SggcBG
 DA1esVdFem6+2Wn5SjIuZlheLSszY+RFQEHxwLjGcufztubAwPRrjGJWKa0Dn3aqOgjN
 b3Ag==
X-Gm-Message-State: AOAM532NtviFFnGyeKknO0BmP2HFQpfmSXyM5wK4qx37qY4i6+NPuv8C
 vdleeTSmlbwHGaAt74snd7DgxaLBw33eHrIfuScH4gBd
X-Google-Smtp-Source: ABdhPJylq+3o0Lu5wXx1xEQJXkr2imDIzJcWCeXrqYKBHTAAktFAHHv5KdeprXPI7ialRp6Hxj+DFYXMEvHWz62F8/Y=
X-Received: by 2002:a1c:2d91:: with SMTP id t139mr4306095wmt.3.1594905595633; 
 Thu, 16 Jul 2020 06:19:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1594886530.git.zong.li@sifive.com>
 <628efa24c79a493e39ce6ef13017ae52eaf13388.1594886530.git.zong.li@sifive.com>
In-Reply-To: <628efa24c79a493e39ce6ef13017ae52eaf13388.1594886530.git.zong.li@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 Jul 2020 18:49:42 +0530
Message-ID: <CAAhSdy38QtmA-D2iOyC=dwrwtfVWfEiYQY529zJVsPS+FwTuzg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] riscv: Fix build warning for mm/init
To: Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_091956_927380_798CC6A2 
X-CRM114-Status: GOOD (  13.73  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 16, 2020 at 6:35 PM Zong Li <zong.li@sifive.com> wrote:
>
> Add static keyword for resource_init, this function is only used in this
> object file.
>
> The warning message as follow (with W=1 build):
>
> arch/riscv/mm/init.c:520:13:
> warning: no previous prototype for 'resource_init' [-Wmissing-prototypes]
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  arch/riscv/mm/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 92002952c621..66f5952f39c0 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -517,7 +517,7 @@ void mark_rodata_ro(void)
>  }
>  #endif
>
> -void __init resource_init(void)
> +static void __init resource_init(void)
>  {
>         struct memblock_region *region;
>
> --
> 2.27.0
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
