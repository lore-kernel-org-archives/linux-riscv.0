Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B80FC433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 13:20:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 070542074B
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 13:20:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FxGnO16r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="YAS31mZ/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 070542074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DGqKHrg0L0vdnGfgsm3Srls1gigFStlxjK7L7Un4hsk=; b=FxGnO16r2VRXp/cSAWj47HFPs
	DwtBMaQkKt2k6uypvNMouuQelmjcm1Cg6oxZc3cjR4Cwh/lswi8FW9qqvs9TNUyPGreR567kxkamx
	lBDt0k9HruSNrwa0OkKKHGe0CYfWUcuzZdlsPQvLX0kpQfMT0NZfhzdITLyjsZuAfSOdCKjBotjCF
	P1CPoBpWnWwjY1Uv7tg7scjQzyG4CHyeYQXk1e6/PuCP/jyEhnEB1xEcmT4YfmUGE2QdGndxYYzSj
	+7FUzpNLefPMc6foeP2yV38D1BoC9wsKog9Ko4P+GCo2SQXmYzHZtTa2xS9g+zx+COCkeywIcjkwB
	Df7viurzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw3oO-0006I0-VM; Thu, 16 Jul 2020 13:20:32 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw3oM-0006HZ-Aw
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 13:20:30 +0000
Received: by mail-wr1-x443.google.com with SMTP id f7so7073622wrw.1
 for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2020 06:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pfpSq4DvBlL0D7ejymaDz8bArWnsRIi88cDneCbu2y8=;
 b=YAS31mZ/STKIbmeo2sBBPloQfilq26Uf4dTWQCS2bWyUHtZRLm2xpBxxXLF4fuj9f1
 Wmo4WpB8a+hibAYAD8LrJVxMgJQqYfkiDjgOPxYJfrVyntyI/aqWXKvihxJTsOEQdug1
 zobpXzlLehzzNhH9tloFP8WLI5hMkghNQGOQGaNThXI0cB4IufWue9wTdZDBHtVgH/KG
 481nblD7Y/1/C5/uIeNqa4kZP8XpcYFRRBIDCpeEUO8UJyaV3NoKql4KEIRMi4GYUArK
 OYbESX2VcAc3b9E2YdzxiPLMq9DRhasta+A2+i4bbuEoVfFoJ9jxL3+VOSwwws1QHJQk
 HOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pfpSq4DvBlL0D7ejymaDz8bArWnsRIi88cDneCbu2y8=;
 b=SXu6AeshLlekeNvQNL2+2y5g2uav8sTS/g9XHPgmjoKDgUrJTSat5Eon7ifWPr8iU3
 ZV2kD1U3ZufCNoQEiAwsd2ROJLZmo3DzXCooDAjedigwCR+0TxGHxRolBk0t1rspFQny
 CqYEfQqNPMwdDZXVpKTtAtcVxWUa89o7pj1Mx0hDtTtVuz2Jdph5uZiVSZlWtMP4JEIA
 jrr+ahTVRfw1XO0Pt6J50PX7RE4wyMaqJQeWtt1oHsVOUGq6EvPTAaRuHmlWJZ1eZ0EH
 rHY3Ny0yOWEFiAPesrhxWuQlZo77+h7o3bIWgSmzLH1mZ7aRwCVsz7JoPnuVMBGcp4Qw
 tGzA==
X-Gm-Message-State: AOAM531yMgwSt9vx2BH/0AcC6J0eJCDilFRv+ChYmxaaM+fRErXmwvDJ
 ZLOnXA6XRjkoJ37imwUEodI4lktrzxKgto5FKiUubFPCFnc=
X-Google-Smtp-Source: ABdhPJwdS5FgCKFmROVTu2BMJ/9+zwBq3b9LDYGDDGp/YQhzWsDX2aDEPh7oicx6LMFSG8DHSjtjKOnoj3Z6bCb3V1I=
X-Received: by 2002:adf:fcca:: with SMTP id f10mr4975330wrs.325.1594905629196; 
 Thu, 16 Jul 2020 06:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1594886530.git.zong.li@sifive.com>
 <8691a6a78271c748a2f75f1430b36f304551838d.1594886530.git.zong.li@sifive.com>
In-Reply-To: <8691a6a78271c748a2f75f1430b36f304551838d.1594886530.git.zong.li@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 Jul 2020 18:50:14 +0530
Message-ID: <CAAhSdy3q8SCj4aTanyvgywuEa+DWCOZeOF3=-xHW+UjzXXcd_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: Fix build warning for mm/pageattr
To: Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_092030_381991_57056AD7 
X-CRM114-Status: GOOD (  15.95  )
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
Cc: Pekka Enberg <penberg@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 16, 2020 at 6:36 PM Zong Li <zong.li@sifive.com> wrote:
>
> Add header for missing prototype. Also, static keyword should be at
> beginning of declaration.
>
> The warning messages as follows (with W=1 build):
>
> arch/riscv/mm/pageattr.c:130:5:
> warning: no previous prototype for 'set_memory_ro' [-Wmissing-prototypes]
>
> arch/riscv/mm/pageattr.c:136:5:
> warning: no previous prototype for 'set_memory_rw' [-Wmissing-prototypes]
>
> arch/riscv/mm/pageattr.c:142:5:
> warning: no previous prototype for 'set_memory_x' [-Wmissing-prototypes]
>
> arch/riscv/mm/pageattr.c:147:5:
> warning: no previous prototype for 'set_memory_nx' [-Wmissing-prototypes]
>
> arch/riscv/mm/pageattr.c:152:5:
> warning: no previous prototype for 'set_direct_map_invalid_noflush' [-Wmissing-prototypes]
>
> arch/riscv/mm/pageattr.c:169:5:
> warning: no previous prototype for 'set_direct_map_default_noflush' [-Wmissing-prototypes]
>
> arch/riscv/mm/pageattr.c:97:1:
> warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Pekka Enberg <penberg@kernel.org>
> ---
>  arch/riscv/mm/pageattr.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> index 289a9a5ea5b5..19fecb362d81 100644
> --- a/arch/riscv/mm/pageattr.c
> +++ b/arch/riscv/mm/pageattr.c
> @@ -7,6 +7,7 @@
>  #include <linux/pgtable.h>
>  #include <asm/tlbflush.h>
>  #include <asm/bitops.h>
> +#include <asm/set_memory.h>
>
>  struct pageattr_masks {
>         pgprot_t set_mask;
> @@ -94,7 +95,7 @@ static int pageattr_pte_hole(unsigned long addr, unsigned long next,
>         return 0;
>  }
>
> -const static struct mm_walk_ops pageattr_ops = {
> +static const struct mm_walk_ops pageattr_ops = {
>         .pgd_entry = pageattr_pgd_entry,
>         .p4d_entry = pageattr_p4d_entry,
>         .pud_entry = pageattr_pud_entry,
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
