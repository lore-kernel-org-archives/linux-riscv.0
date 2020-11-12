Return-Path: <SRS0=fdZL=ES=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7A8C2D0A3
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 07:26:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B04C6206E3
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 07:26:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TiKuuIKD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="IlMKqxBr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B04C6206E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jB+xYlMJaoG2gy1VHDJnUcmGXyVaC9QJ41HxUXS8ulE=; b=TiKuuIKDsXlTLLA1S6lDECvgb
	3kvqmFPcktYm6B9CdjxRvveLfRfPiAh2OAUKz8GKuLaP3X0NxiuRKxu9KE6uDrj/1g+FXMOtOh/VP
	N/BmPfy4I7/WJHHbGMSzmFyEeET0SczjTcoyt4pk4K/1SY55Vf700OfDK62SZg4k583LjMe16TKFJ
	ko3svKcbMczh2r+MkxHL+EV30mJhNLTPRaJIpL4TCJ/Da3aU5AUOM3OMPjXGe1q+BjX1o/nwvLWGS
	TYDkvGhRdWOPW0YBNjCn4Jd4MUX9lURd4LV9BW4EzjbjsW0f2abaxn4Y/Zk0z6XMrs4S5Cf9UnGii
	1BIomLy4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kd6zs-0005NE-5G; Thu, 12 Nov 2020 07:26:20 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kd6zp-0005Mf-Ak
 for linux-riscv@lists.infradead.org; Thu, 12 Nov 2020 07:26:18 +0000
Received: by mail-il1-x143.google.com with SMTP id y9so4393536ilb.0
 for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2020 23:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pLDIuwrsIRSg7lfGwmrI16OG7sr4NN+e1gdmA0dYlps=;
 b=IlMKqxBroBZg+vpF3+oYyiAwcG0lc3ZUty954fYDavsYQkjuHEFajlH/U/NVt9YjNG
 eIf5cAv3do4b8O2TkbgM2FfucnAwaCp0Bir91W0dPGOHqf+2FjKYC2FjcCXD1BvNUYCz
 sUQKL6WPCES6DjGWmj5PZOaYQiGoiXkCKh17g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pLDIuwrsIRSg7lfGwmrI16OG7sr4NN+e1gdmA0dYlps=;
 b=kwzP8RzxfpkXCKxDPylJHu4u6ah4S64cf1xrvcb9U1Ox/Xp6/g4+a6u4JkiMSTILHl
 dAF67IAJ7O/bdlcgYE3R4mVWyYpzbKtDmzXNAOFQ59PerStUb+GObJKruIBbQ0NsVYEj
 cwXxZ1OBn3AtIANZ7n5g0TnUPLmmr2HRenV4vZ/9dQBH5PCSBsQU0GTumWg084VucIMP
 mv4gSI1Iw/Y+KeCeKD1VuTIW5H2Ietyzhz9WAtElsntclBaq72DpxKBx9+dg2zQmsY1l
 c+Mb7mEj3j3Mo/IgbescmXTdiarnq+hmn7IN2969zIbBPOXPb3CMZmk4mzmAo6h3ZJ2F
 hq3g==
X-Gm-Message-State: AOAM530BWEarAkSEX4jXdDBEbre3p0mAQfSWontq5c5AQGlDalvnlqIM
 oTyBfpaHSN8XG2Y19jG4dIjphhSmokBNgdjIbseX
X-Google-Smtp-Source: ABdhPJxZqV0AiTwfDKwYoDCRu0L/SVkqjJC5iBOWjNqTEdN5r1xthFhc18N2YTZNf1oHC6ZwtI+Z3uuZ/YNtV8IZaro=
X-Received: by 2002:a92:6410:: with SMTP id y16mr21499233ilb.126.1605165975082; 
 Wed, 11 Nov 2020 23:26:15 -0800 (PST)
MIME-Version: 1.0
References: <20201111115216.31447-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20201111115216.31447-1-wangkefeng.wang@huawei.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 11 Nov 2020 23:26:04 -0800
Message-ID: <CAOnJCUK21nn+hPOJX0S1TY7=t312z_w4x+gc8YiJi1R7VjytkQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Drop a duplicated PAGE_KERNEL_EXEC
To: Kefeng Wang <wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_022617_407664_3B73A662 
X-CRM114-Status: GOOD (  14.45  )
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
Cc: Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 11, 2020 at 3:47 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> commit b91540d52a08 ("RISC-V: Add EFI runtime services") add
> a duplicated PAGE_KERNEL_EXEC, kill it.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/include/asm/pgtable.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 183f1f4b2ae6..73e8b5e5bb65 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -99,7 +99,6 @@
>                                 | _PAGE_DIRTY)
>
>  #define PAGE_KERNEL            __pgprot(_PAGE_KERNEL)
> -#define PAGE_KERNEL_EXEC       __pgprot(_PAGE_KERNEL | _PAGE_EXEC)
>  #define PAGE_KERNEL_READ       __pgprot(_PAGE_KERNEL & ~_PAGE_WRITE)
>  #define PAGE_KERNEL_EXEC       __pgprot(_PAGE_KERNEL | _PAGE_EXEC)
>  #define PAGE_KERNEL_READ_EXEC  __pgprot((_PAGE_KERNEL & ~_PAGE_WRITE) \
> --
> 2.26.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Apologies for the oversight. Thanks for the quick fix :).

Reviewed-by: Atish Patra <atish.patra@wdc.com>
-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
