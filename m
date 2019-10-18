Return-Path: <SRS0=JNhR=YL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B947DCA9ED0
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Oct 2019 04:06:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F1D4222C3
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Oct 2019 04:06:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BmplcPJa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJTkrh1f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F1D4222C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K1r8Oy35RRmWfXfQLOhpXoC4YPReKDw3vAkzgkKSZ4o=; b=BmplcPJax4Jzw6
	s9A3QTrEI8c8BM1Bxe7AHFBuUgC3y8KSGqAt6uDZRlLxNb9wQbJP2dT7l7TJzr8RHERQCQQzP1DtC
	S0Kf9467QyKtPekjq+FyJnBUhmv2xLjjKx9f/xgMPrtGAKpR0ukPFFrj43xte5tt9BEEb9lD9Xo74
	PP9wg1oSjjuqRszF4kXwTGONN+C6FxFaSlZYj0JaWgrsGTE9AHGNDz29xuF6vr2KE8C9uQR3vdEnC
	K9zu7oFNRHtZqBeB0otKxLsVD+btLqtLY7wMjAupKKVVDr5FYeWHXHLsn9iaTHhIPuPc1DQMuNzuB
	FphrO1KB0KBZCmNm8sIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLJX0-0002gQ-Kr; Fri, 18 Oct 2019 04:06:26 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLJWx-0002g6-Vh
 for linux-riscv@lists.infradead.org; Fri, 18 Oct 2019 04:06:25 +0000
Received: by mail-wr1-x442.google.com with SMTP id r3so4619695wrj.6
 for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2019 21:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=A/Tf4iJWS8qcGlBMvo/id14sOzyak6H/JZlFaeq1a2M=;
 b=GJTkrh1foXLVx/GfRMgwY/5lZrE6f9Fzp9iyjCdB5NFY+dJeU/d3QExp2xXE18QY5l
 INr6CRdIP/oYiK2MI54mC66XxUdHkBJ5zJ9iRnMQg4Ip05vhs6wu7zLobhVq7FEcJtH1
 Ljw7Rem15V6dQg65HgOc2KxvQdIvAa1422/x7Uyu+dheEEt6NGHDEC4X6Ekhc/JG8BLI
 Na48sFj8Fwlg6iDcfBxfSYCUkmVkdM0RLpEpPrnFNF1Q2O6n2ylRctHkI0vThzAulNdq
 8KOHE98G/wc1uq+arXQrfdACByJaIho595AG6ZxA0vC6qghDEuoRMz282Mfy77ii/kzn
 GodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=A/Tf4iJWS8qcGlBMvo/id14sOzyak6H/JZlFaeq1a2M=;
 b=TkzMdll+XpNjsleq5JYuuIB7oJiSzzJLI+MEUjtmT5xp3XddFxPZ5pNDQdJyXsoHXI
 2MfsIfGfp4Rsma1PYWpTnWRbFmZWmHlWjAR1J3fP/VexkMO12ZEwXR2YiohaQ5U9sFSZ
 Z7WTkwzFkZ27/QmXaXU+VxSx62ZAUgrHFNoon4mc0becMLf+d2pFmh4oFAP3RZi9kG/r
 fESi3IO8zD8Etr4P7soNt5/x1ojlZWJu/SpnxDpTES/NNRD1FvrH12XQsVKfxNmwLNF+
 6+y588x6S8OiUk8Z8zVSy0MD+WN0PdiuCIki/fTT4ybWHizbAlj2ri4Pe7arP0sxqHhf
 ShgA==
X-Gm-Message-State: APjAAAW8Gm7D+4x8LblbSmqScff1AY7j+H01EKrWSidwxZEIEpMIs8MN
 kUjQl/e/HJvnwMyY7uGctO8=
X-Google-Smtp-Source: APXvYqxjFg1SXCQ+fipbiPTH8W1CtjD2slFtJSRD3RXU/MYRTMdtOmGZYYVkzVsFh9Oh91u3gt6q4g==
X-Received: by 2002:adf:a506:: with SMTP id i6mr5692969wrb.159.1571371582365; 
 Thu, 17 Oct 2019 21:06:22 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:40ac:ce00:18e1:7d90:ccf5:4489])
 by smtp.gmail.com with ESMTPSA id w18sm3970796wmc.9.2019.10.17.21.06.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Oct 2019 21:06:21 -0700 (PDT)
Date: Fri, 18 Oct 2019 06:06:20 +0200
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 4/8] riscv: ensure RISC-V C model definitions are passed
 to static analyzers
Message-ID: <20191018040619.o3qb5fyj4qdevwoe@ltop.local>
References: <20191018004929.3445-1-paul.walmsley@sifive.com>
 <20191018004929.3445-5-paul.walmsley@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191018004929.3445-5-paul.walmsley@sifive.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_210624_017481_2E2584D9 
X-CRM114-Status: GOOD (  12.92  )
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 17, 2019 at 05:49:25PM -0700, Paul Walmsley wrote:
> Static analysis tools such as sparse don't set the RISC-V C model
> preprocessor directives such as "__riscv_cmodel_medany", set by the C
> compilers.  This causes the static analyzers to evaluate different
> preprocessor paths than C compilers would.  Fix this by defining the
> appropriate C model macros in the static analyzer command lines.
> 
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> ---
>  arch/riscv/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index f5e914210245..0247a90bd4d8 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -47,9 +47,11 @@ KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
>  
>  ifeq ($(CONFIG_CMODEL_MEDLOW),y)
>  	KBUILD_CFLAGS += -mcmodel=medlow
> +	CHECKFLAGS += -D__riscv_cmodel_medlow
>  endif
>  ifeq ($(CONFIG_CMODEL_MEDANY),y)
>  	KBUILD_CFLAGS += -mcmodel=medany
> +	CHECKFLAGS += -D__riscv_cmodel_medany

I can teach sparse about this in the following days.

-- Luc Van Oostenryck

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
