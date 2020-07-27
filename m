Return-Path: <SRS0=GA+h=BG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC9DC433E8
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2020 20:20:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B17E20729
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2020 20:20:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l10Pganj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="solVB7kl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B17E20729
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=/vYGqs5QdakA9A6JOE7IvokOk00SyTjVZ6FsU+xV29o=; b=l10Pganj29ehRegCUSNLQ+Jc5
	MuFfC956X0L9N8cC1Qy/rWFpp2tnfZ2JpFhzVY0LrIiFtbkzjtsz/ITJvnMw08g28N+7T0SZ+swPL
	T/rvg8gCE4Nr0on2weu/WAJnAb2j4jZGujaP1VWXrtTuMyjiPymU8h4D+64dvWAp91ZiPcZ7lYKdB
	awuHn/nWuER5pU1iFZZhaD9xW9lxhXVRyeaoPtlJBJGPB0+tivYmBi/8txGGfJuk4DHS5FZiVY+ni
	8Bl0GOxruRt+f/tOzaxYRcAxIAFE5bcqElcmupuzuB6fEasmWtcbNzdm2ze9ofdlLJ2tzNIIXEcTP
	B3nSReUKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k09b9-0002eP-PQ; Mon, 27 Jul 2020 20:19:47 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k09b7-0002dp-9U
 for linux-riscv@lists.infradead.org; Mon, 27 Jul 2020 20:19:46 +0000
Received: by mail-pl1-x644.google.com with SMTP id q17so8731798pls.9
 for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2020 13:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=GEaUy1Fu1lp3m+GXiMScnx03WYprA9BtWxGSWIlMkLY=;
 b=solVB7klx3WtOFjPCehD4ovahfSWXpY6iMsiq40Rb4dqAUniRy9npg8YQ4JqKQNOuk
 J2hF6ajxMWTaBkunpx7+uJfzUPLXy2nlPcv+qGRfxFRT5cPoG6/Zx4KUQ3xe4eOpvbTX
 bfqTbFkgtlp4VVsjV6mQVU0hT6svzW0P8/FLzUwCXzzERMTaw+P5mSpMcYTmCm7i/nG3
 oRQ61qrLW4XTYX56489z7Cits0SmPHnmJYR7G2Kjcaar9gM2v1nrLwefqTUdPxxYREvp
 PEfAhiVEsGKsWEV7UfKanP6gEFCbwP5dV6yaqWRRNbpmrkLdPHEJDF7j8P+o8euxW6L3
 QcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=GEaUy1Fu1lp3m+GXiMScnx03WYprA9BtWxGSWIlMkLY=;
 b=YUaXc0N0SCR2qKXDsypi/5iHTlb52PGox0blAmB1bJSTPMPQltmFwWhLlt5cxlUg9l
 DiA0f1zmwnU4njYpoaO/GmJtapItflfWw0t7Z6uyhL+clHojxKWQCkfHkZMkRzCA4zuK
 VuKU5zgbIPvdrKAeguYxgwHPi9oE7oSAt4WRvoZz35hMej1ykOiOelWWj0F/eiXxpMJ5
 U7d/PNNXHRbQ9Ym+UEbxqWNsedoQG9C3jj+fmkjIFoGqtZX+b7ecaYD8zb2vuHtiJf2m
 7wN0ckC1j9IXLKc2k01wDKzBSVG7ywzpCKypl9FEXnWP/sRjcY4aL1g8EO9tssleaZFG
 N+sg==
X-Gm-Message-State: AOAM530sHVktUfCvGWc17R9tULkfDTDVHmQuiZvQ0/VzTfqCaqfFdbY+
 RijxMEMElVAOuSA5Qdz21MNSy7kKbhg=
X-Google-Smtp-Source: ABdhPJxCc30R6xAjTUNEOkp0/wPdS5BuAQ64CALm1PJzGSrmZW30yt2uBc//rr4MEU1Xx2IdP6j8yQ==
X-Received: by 2002:a17:90a:2d83:: with SMTP id
 p3mr972544pjd.124.1595881180864; 
 Mon, 27 Jul 2020 13:19:40 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id o10sm426540pjo.55.2020.07.27.13.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 13:19:40 -0700 (PDT)
Date: Mon, 27 Jul 2020 13:19:40 -0700 (PDT)
X-Google-Original-Date: Mon, 27 Jul 2020 13:19:31 PDT (-0700)
Subject: Re: [PATCH] riscv: Grab text_mutex before patching jump-labels
In-Reply-To: <20200723163628.82794-1-kernel@esmil.dk>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: kernel@esmil.dk
Message-ID: <mhng-f51a8614-665a-4961-b6d6-a37c0af73a8d@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_161945_360314_6D5F1A71 
X-CRM114-Status: GOOD (  22.78  )
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
Cc: Bjorn Topel <bjorn.topel@gmail.com>, linux-riscv@lists.infradead.org,
 kernel@esmil.dk, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 23 Jul 2020 09:36:28 PDT (-0700), kernel@esmil.dk wrote:
> Like other arch's we use patch_text_nosync or equivalent
> to patch the jump-labels, but also like other arch's we
> need to hold the text_mutex before calling that.
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>
> Fixes: b6e0878a4ec8 ("riscv: Add jump-label implementation")
> ..that is already in riscv/for-next.
>
> Palmer: Sorry, I didn't notice this before. Feel free to
> squash this into the commit above if you like.
> ---
>  arch/riscv/kernel/jump_label.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/jump_label.c b/arch/riscv/kernel/jump_label.c
> index 1bab1abc1aa5..20e09056d141 100644
> --- a/arch/riscv/kernel/jump_label.c
> +++ b/arch/riscv/kernel/jump_label.c
> @@ -4,8 +4,10 @@
>   *
>   * Based on arch/arm64/kernel/jump_label.c
>   */
> -#include <linux/kernel.h>
>  #include <linux/jump_label.h>
> +#include <linux/kernel.h>
> +#include <linux/memory.h>
> +#include <linux/mutex.h>
>  #include <asm/bug.h>
>  #include <asm/patch.h>
>
> @@ -33,7 +35,9 @@ void arch_jump_label_transform(struct jump_entry *entry,
>  		insn = RISCV_INSN_NOP;
>  	}
>
> +	mutex_lock(&text_mutex);
>  	patch_text_nosync(addr, &insn, sizeof(insn));
> +	mutex_unlock(&text_mutex);
>  }
>
>  void arch_jump_label_transform_static(struct jump_entry *entry,

I've just put this on for-next as is.  I generally try to avoid rebasing stuff,
but I think I saw a message today about a patch I put there prematurely so I
might have to rewrite history anyway.  If I do I'll squash it and a few other
small fixes.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
