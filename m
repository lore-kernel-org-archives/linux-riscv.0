Return-Path: <SRS0=l2EX=RA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1709AC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Feb 2019 03:35:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9AB22087C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Feb 2019 03:35:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lvB+U7JZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="iF6Nt54b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9AB22087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cMHmcZzyqTSVvUIjNc/jZlaBk3yxeowgmlluc/2iIAk=; b=lvB+U7JZtUZySm
	0W/AjwS5pykQc1iAO367ccRq/nbVkWrOZk7JA/rIIZa7QuYlWL3s0/L/tmC5JUYSFNt3e7cI5D8ZT
	rzJo/42WI19ORO1SVNyrisA4UXcUxkHtdWukJmF+6lHMYzWN4Rx40ZbKp1/UdhWKu4Y0JporPwG+L
	WspkVpzfTb2FtCiCb4AjFeJZY/luMlR9vbTDLufFl1Mmxs5MgDnAzbQu/2ppJMKLJqtdj30QhMMCw
	unALznPRTJnhsT3fw20racKjgkSJmqjYlgxA0+MzTGCNeOLmO54w6V3ovQupg6LO80uRYSuLNM8mj
	xBKyiuEHJ8Iw33zaS+zA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gy73H-0003yM-MQ; Mon, 25 Feb 2019 03:35:35 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gy73E-0003xM-Hf
 for linux-riscv@lists.infradead.org; Mon, 25 Feb 2019 03:35:34 +0000
Received: by mail-wr1-x443.google.com with SMTP id f14so8270802wrg.1
 for <linux-riscv@lists.infradead.org>; Sun, 24 Feb 2019 19:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xzg/QasZL4jzzrPuVbjB9SpdePZwSQI9y9MgCV95T6I=;
 b=iF6Nt54bBd5lpxIvsmhHHR92DIyyr977XxWN/aFRi5RwYaCwOt+QTruISVgsjyWX31
 LBY/X6TMwD2Q6tTeE15N/z0hLXRrKKY/Qja1K5UpyrtMCqNR2TqjpMbKL5xbGR8zjVOQ
 mg/PBUb7/+aoa248IYFtDJeZoGDFVqFiXitOT9owWCtrZr+L24ckl1CPbHTBJQ0+gX/s
 dZv7EUjZMj+mCWWVeEGOeGdX3QZyWUN2PQiHWdroNweeFrHUFLbND39fAF6K3KwzLN+d
 b/eWz8Dmawg6M78yWgPD6dBsEk57G88nMbcv9WsbU/Fmb3HnWnYhth+hTr3dYhpvl6AO
 KANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xzg/QasZL4jzzrPuVbjB9SpdePZwSQI9y9MgCV95T6I=;
 b=RM/LP37a13QG9yjERsMiCQDc5442QMU6Kl1ot7rsrOjyAJKJevPi8p8woeKrniCZHl
 /U9CisWfrEI521NnPYOE8PiI/0P4lAb01464Eg74VzSXDmImV9guAMkEv+3IA0MJXEuL
 q0QFl29CnV5JhezHxdpbUXGzEZytOubcdtsYZh9aHeftlcV+SP57VWmI64QnTiQHDfbw
 HFlSJEDjUUb3i0OQOX5X8eOg39znDti71l3VY9fCRouWdS6pgWvGVIRxmhLLrD64tcIC
 Hdu8BDcovqUGU8sC3RR391UwRJp0JrQxwNcEdSk6XF7C2qtH5nDpiEM12xcoJHY9JAuq
 OFIg==
X-Gm-Message-State: AHQUAuaGX/u5NxlfZhfwAKqNxnps8wjVRKResZUZWI44CoHFEkEznsFd
 NZ1GcucphiqEK5HDQG+JTyiBf+Mdr4N5R4nrsN2bAQ==
X-Google-Smtp-Source: AHgI3IZyQBSqt7EzRthk2sGISI+/77wf0SuVs8LJ5pdqvcwGQAUQlRc+GEeib2CPS9iVkQKrCcYkQNEsHgrRNABEq+8=
X-Received: by 2002:a5d:52ca:: with SMTP id r10mr11250812wrv.187.1551065728456; 
 Sun, 24 Feb 2019 19:35:28 -0800 (PST)
MIME-Version: 1.0
References: <1550864500-13652-1-git-send-email-atish.patra@wdc.com>
 <1550864500-13652-7-git-send-email-atish.patra@wdc.com>
In-Reply-To: <1550864500-13652-7-git-send-email-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 25 Feb 2019 09:05:17 +0530
Message-ID: <CAAhSdy3a_4sPUgDE8PjsvzpRx-i_mXrecLzjiagp9wZ7oUEVVw@mail.gmail.com>
Subject: Re: [v6 PATCH 6/6] RISC-V: Assign hwcap as per comman capabilities.
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190224_193532_628264_E3591741 
X-CRM114-Status: GOOD (  14.98  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alan Kao <alankao@andestech.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Andreas Schwab <schwab@suse.de>,
 Palmer Dabbelt <palmer@sifive.com>, Johan Hovold <johan@kernel.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Feb 23, 2019 at 1:11 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> Currently, we set hwcap based on first valid hart from DT. This may not
> be correct always as that hart might not be current booting cpu or may
> have a different capability.
>
> Set hwcap as the capabilities supported by all possible harts with "okay"
> status.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 41 ++++++++++++++++++++++-------------------
>  1 file changed, 22 insertions(+), 19 deletions(-)
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index e7a4701f..bc29b010 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -20,6 +20,7 @@
>  #include <linux/of.h>
>  #include <asm/processor.h>
>  #include <asm/hwcap.h>
> +#include <asm/smp.h>
>
>  unsigned long elf_hwcap __read_mostly;
>  #ifdef CONFIG_FPU
> @@ -42,28 +43,30 @@ void riscv_fill_hwcap(void)
>
>         elf_hwcap = 0;
>
> -       /*
> -        * We don't support running Linux on hertergenous ISA systems.  For
> -        * now, we just check the ISA of the first "okay" processor.
> -        */
>         for_each_of_cpu_node(node) {
> -               if (riscv_of_processor_hartid(node) >= 0)
> -                       break;
> -       }
> -       if (!node) {
> -               pr_warn("Unable to find \"cpu\" devicetree entry\n");
> -               return;
> -       }
> +               unsigned long this_hwcap = 0;
>
> -       if (of_property_read_string(node, "riscv,isa", &isa)) {
> -               pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
> -               of_node_put(node);
> -               return;
> -       }
> -       of_node_put(node);
> +               if (riscv_of_processor_hartid(node) < 0)
> +                       continue;
>
> -       for (i = 0; i < strlen(isa); ++i)
> -               elf_hwcap |= isa2hwcap[(unsigned char)(isa[i])];
> +               if (of_property_read_string(node, "riscv,isa", &isa)) {
> +                       pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
> +                       continue;
> +               }
> +
> +               for (i = 0; i < strlen(isa); ++i)
> +                       this_hwcap |= isa2hwcap[(unsigned char)(isa[i])];
> +
> +               /*
> +                * All "okay" hart should have same isa. Set HWCAP based on
> +                * common capabilities of every "okay" hart, in case they don't
> +                * have.
> +                */
> +               if (elf_hwcap)
> +                       elf_hwcap &= this_hwcap;
> +               else
> +                       elf_hwcap = this_hwcap;
> +       }
>
>         /* We don't support systems with F but without D, so mask those out
>          * here. */
> --
> 2.7.4
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
