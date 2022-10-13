Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E022EC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 05:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IGdnaghV25mvuyYkva3mbf85kYZuIyHTRky6RtVh8+A=; b=A2WCJNl8MHuvsu
	+oXst5RFcRjiGLGoIfG20SIuIEtVvuEF9lCZlyjQfwZC/mrL9F0sxEYF1pDA4PHhIaAR9APIh9nk8
	JqT87wP5ZNprzD8T+krnyj12JH6F44Z+yRNdBrnqoyzPfMFLUIbS4poMpxno8eGcMQiU02ufLduwn
	TpJa+gLh5z+Rfwq/kHUAdtFAWhBajmhoDezw/ljpNtG9e0xF2R2VIJIFCdy0+2gvmcNG27lMvUB5l
	0L48eIeUBg79QHhXr+1ATU3ve539FgL+QnXKNQsO5ybdicxDTBECPtoXRCpecHIcVUEI3l9oQH+R7
	haWv7VjWqZGXlEkE+dEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqSa-00AfeQ-3C; Thu, 13 Oct 2022 05:08:44 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqSX-00Afds-HY
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 05:08:43 +0000
Received: by mail-ej1-x62d.google.com with SMTP id q9so1580132ejd.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 22:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wKssAxycUZVdqYlyW7XBylh/ZQdAtWozk4R8pqdfx/8=;
        b=ks1MQWQJyaHI0QuXwV2LFMDlYOPnBOKUBf/oq2e8LAfOH5bmfiIxf1g0Yw8TU8BYit
         r/ozSxUEGY56R5cA84AddDAHGT0tOydWY6qeVOISxqbuD0xLjULGXZB6xal1DZ/pVDyw
         6zXQGrZ2IhmIG4PLsqZfyngx7/Kfpol9JTomShxTGojdZlGBy8UHBrKMez3+8pMljJqN
         ZPImneRFx+Y4XsZgHBn7XJRE0X1f1aqOVWiwBwy9xET5yyEb88YchIPi8ntsN3OtTwpB
         EdIb71eTBBCSkZ+eeMdBX1WiI3tlJhiw/lZG6C3NR/q3B2cRHYPDFmSE50roii5vIorR
         nHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKssAxycUZVdqYlyW7XBylh/ZQdAtWozk4R8pqdfx/8=;
        b=0Umi4034JA5x0yA8fxnoNLW9XiJEYi9hHZwinXF/tkNoQKBmScVJykCPz2FonMIz4Y
         hqOOlz/CeVJoZDTHr90T05RjLpVeKSEUiITjqBOzFq9gyhviTFxaPESsvdA8V2rriwIv
         6FXJKyHSd08NfsLFLebuKb01Ii3d8piA53n4i4pdx2j+XVxUNpNrjeNeD91tpMEgUQ+1
         Gjrg/FxDx9G4AU+SUpl2MKA8HUEX6HwNi4uXKepBInP3gjTdJcuQBXlutTrdvcZ8zQJ4
         U5iDbGb4iDQULxZzgM9UGqa9ahcJhq0Z3iaZ2pr+SVcxTWEsqNFTlBEwkAt5NcP2NNeu
         RenQ==
X-Gm-Message-State: ACrzQf2CJgJb40kcdj2RZmF7eUsaIWf7SVWfkGd/ka+4fR0Jd7aObRR0
	zd1GWrbIHChh9osvP7FAg6ZQJ0/tXg8JGobYq3QOiA==
X-Google-Smtp-Source: AMsMyM4UvlKR7SSKX9XkcQKXEiFgw4SDdjwmGyp9MRtR6ny/AxgfBzL0esK4jG/yMbkgHjvvMgHXLgBWomXLvr6l5s4=
X-Received: by 2002:a17:906:ee81:b0:77e:829a:76e9 with SMTP id
 wt1-20020a170906ee8100b0077e829a76e9mr25919122ejb.207.1665637719127; Wed, 12
 Oct 2022 22:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221013045619.18906-1-palmer@rivosinc.com> <20221013045619.18906-2-palmer@rivosinc.com>
In-Reply-To: <20221013045619.18906-2-palmer@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Oct 2022 10:38:27 +0530
Message-ID: <CAAhSdy0_WaEFXgduBPKQMW20W=fQVinGZwgW8Z2jv=u4ig=rzA@mail.gmail.com>
Subject: Re: [PATCH 1/4] Documentation: RISC-V: Fix a typo in patch-acceptance
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Atish Patra <atishp@rivosinc.com>, corbet@lwn.net, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, 
	conor.dooley@microchip.com, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_220841_605020_CB243762 
X-CRM114-Status: GOOD (  17.89  )
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

On Thu, Oct 13, 2022 at 10:26 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> I just stumbled on this when modifying the docs.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Looks good to me from a KVM RISC-V perspective.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  Documentation/riscv/patch-acceptance.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
> index dfe0ac5624fb..5da6f9b273d6 100644
> --- a/Documentation/riscv/patch-acceptance.rst
> +++ b/Documentation/riscv/patch-acceptance.rst
> @@ -29,7 +29,7 @@ their own custom extensions.  These custom extensions aren't required
>  to go through any review or ratification process by the RISC-V
>  Foundation.  To avoid the maintenance complexity and potential
>  performance impact of adding kernel code for implementor-specific
> -RISC-V extensions, we'll only to accept patches for extensions that
> +RISC-V extensions, we'll only accept patches for extensions that
>  have been officially frozen or ratified by the RISC-V Foundation.
>  (Implementors, may, of course, maintain their own Linux kernel trees
>  containing code for any custom extensions that they wish.)
> --
> 2.38.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
