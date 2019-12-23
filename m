Return-Path: <SRS0=B3U6=2N=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F458C2D0C0
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2019 18:58:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC83D2073A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2019 18:58:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g2M5/S3n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Y7TjIfdh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC83D2073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:References:
	In-Reply-To:To:Subject:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vFoEgxaEB1zc0DAr9pJZ8IZIOptwhmCYzlzwd9xd7k0=; b=g2M5/S3nPlwXJp
	ToZGxEeLXwlpejAwLmn7xcQyJHh5WMLd0MEWadCr4LCs1K684EzPvXmiNE/uy0wz91RQO9MPY8zPk
	yLsVrvVS9nN2SZBzceFkV98QKGFYtfIHGHNllDoOsyQQPRNY7PTczzRN58Q5lZD2xrqc0lzaIAr8L
	LlOoqv92p0IFfAbS/3HxlVRo8YW3S47D2IDA374JFJ/PqbWmhYaDaDx0a8i74rjXhFLCQxeRuFfOW
	SI+FfP6tyiA5TU/MOHXEHTDZBcuGntp0ceIMtReSBO+mRjIUpPrNO5SnnxwjMmne6nK6tnUXEW85k
	KHVRt8mzSQ2XPBwZYN4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijSuq-0002LC-Jz; Mon, 23 Dec 2019 18:58:52 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijSul-0002G3-TE
 for linux-riscv@lists.infradead.org; Mon, 23 Dec 2019 18:58:49 +0000
Received: by mail-pj1-x1043.google.com with SMTP id bg7so141373pjb.5
 for <linux-riscv@lists.infradead.org>; Mon, 23 Dec 2019 10:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:cc:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=vFoEgxaEB1zc0DAr9pJZ8IZIOptwhmCYzlzwd9xd7k0=;
 b=Y7TjIfdheQGrUncpijbP3hs1oxbU1c+HQHDUq2jIuY+c3aAGbPpUV6m+vTiPxOUj/f
 KulYmNx1lXUqyX0K/YhvZxCzhIwdmK/b/rs1BuCVh6Ghy7UammYuYGo1gSb1706i4q/s
 Yv9FxEElY0F0z/Xpjf/WF18DSYb9uZkZLZ6shBIIMmSzv1Ii2bU4r1JT0TnR2uyguxrZ
 nlAxqLOajMsINDJoRu5fMQEtCmJEK13krcAf1PPCePWkeCLtYKw1G4IA01aZPwigFyM2
 XeKcUcWZ/r/eqN6/rUHfXseLWZ3XgQ9sS3+Ove1As4+4ZA/3DF3pE8BALqz9+vT8ZXGC
 nJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=vFoEgxaEB1zc0DAr9pJZ8IZIOptwhmCYzlzwd9xd7k0=;
 b=b/M6AVxB+T2wnqhDfGryc8YRkAK04OiGgwA857YgVX+CabemjCICpM9T8LxJvSx6LH
 sSKDbhfq/41g0qn5bsDXJ7nxoQru4m9+wbrR8AEZxt9MPDsPhscQodKfJ8gIV8IIRBok
 /U28ZSdy3aAcaasrKBSdubSswk904Y7fPoDsT60Acqn8DBb3aZIYahs4VkJZtggAhNgV
 25RW3hUbcYMWyLhaNvNAmtELg38oTFmTZdqBCa4H1XYoctdZJhCwvhMQd5ljmxGe/oaY
 rGijz5uJA/cjf0i7eFxDdO/P54DUz79DN2issvsr5mPs9U14pBr9QmAap9aaH6wKSEFL
 kLHA==
X-Gm-Message-State: APjAAAVoyvcDr4F76M8ECk9p1reWi7r5Q/LBrj2j4YWyT73WqLchWMQP
 W6dnBVnuj/1rtGzuIDiaMq31Sw==
X-Google-Smtp-Source: APXvYqy14gp9fKJfJ2IsprI6RsHoI0uFkv1aR6vtNaqrvw2G9l8sGZR5y6mDDJYHrXI+5a8XC1/DRQ==
X-Received: by 2002:a17:90a:1785:: with SMTP id
 q5mr590326pja.143.1577127526213; 
 Mon, 23 Dec 2019 10:58:46 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id r6sm25604177pfh.91.2019.12.23.10.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2019 10:58:45 -0800 (PST)
Date: Mon, 23 Dec 2019 10:58:45 -0800 (PST)
X-Google-Original-Date: Mon, 23 Dec 2019 10:58:41 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH bpf-next v2 9/9] riscv,
 perf: add arch specific perf_arch_bpf_user_pt_regs
To: Bjorn Topel <bjorn.topel@gmail.com>
In-Reply-To: <20191216091343.23260-10-bjorn.topel@gmail.com>
References: <20191216091343.23260-10-bjorn.topel@gmail.com>
 <20191216091343.23260-1-bjorn.topel@gmail.com>
Message-ID: <mhng-96d54703-6e9d-45df-b204-a16fe8dc57e0@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191223_105847_941565_2B8964FE 
X-CRM114-Status: GOOD (  11.90  )
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
Cc: daniel@iogearbox.net, netdev@vger.kernel.org, ast@kernel.org,
 Bjorn Topel <bjorn.topel@gmail.com>, linux-riscv@lists.infradead.org,
 bpf@vger.kernel.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 16 Dec 2019 01:13:43 PST (-0800), Bjorn Topel wrote:
> RISC-V was missing a proper perf_arch_bpf_user_pt_regs macro for
> CONFIG_PERF_EVENT builds.
>
> Signed-off-by: Björn Töpel <bjorn.topel@gmail.com>
> ---
>  arch/riscv/include/asm/perf_event.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/include/asm/perf_event.h b/arch/riscv/include/asm/perf_event.h
> index aefbfaa6a781..0234048b12bc 100644
> --- a/arch/riscv/include/asm/perf_event.h
> +++ b/arch/riscv/include/asm/perf_event.h
> @@ -82,4 +82,8 @@ struct riscv_pmu {
>  	int		irq;
>  };
>
> +#ifdef CONFIG_PERF_EVENTS
> +#define perf_arch_bpf_user_pt_regs(regs) (struct user_regs_struct *)regs
> +#endif
> +
>  #endif /* _ASM_RISCV_PERF_EVENT_H */

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

