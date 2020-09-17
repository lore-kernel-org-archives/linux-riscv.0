Return-Path: <SRS0=KFrn=C2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CB4C43461
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 07:59:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A15820665
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 07:59:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FXJzP+TK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="MPL4ax1S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A15820665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+pQ/T37Vg07rvyaazc2e5MWdsacnBbufCIt/Juk7fkI=; b=FXJzP+TKFqudTLLl+AhZM5C+9
	j6xru1AEHXbMm66rKUFWA3z2CL7BVvG4RwnJCl1Ii/Xle/mrat8HOk+zbTAgCAkLWX2A2LyLEYb7d
	2g5HRWdUHy2iQo69s64mtTSx3wK2fdM5Kpq01rTydzQ7Z6fBFR5CRyYhrlNV1ESXrH25bmI/6WH1t
	t3qw3sdAuSw0ofld5oJYQPQOZivvTNnAoXpu3XKqAy+zu3Ylts7SjztdOBcyCK8dy7AGO+iukCyd+
	+8m5F+WgILJfxP5Hs1+eoDISnHEBJN6OQ5cB7+TP6Avp8NtIE+L6HYe/1UDzAAALF75ITCaGM9gXK
	xYQBIzTaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIopE-0004hP-D6; Thu, 17 Sep 2020 07:59:28 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIopC-0004gI-Kw
 for linux-riscv@lists.infradead.org; Thu, 17 Sep 2020 07:59:27 +0000
Received: by mail-wm1-x342.google.com with SMTP id e17so1016169wme.0
 for <linux-riscv@lists.infradead.org>; Thu, 17 Sep 2020 00:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o9pR7FK+JGoERdb0Ak9FECdQMuRJrYsyh3lgs4kFEwQ=;
 b=MPL4ax1SFCVhCQXNZ+Ha0xfJQbr9rJo7lwNYbfSI5tHuUDUWkjIfUKBOpQG43D6n/n
 FTlO+xC+hXTt010btWXgWLdlxelIeZtC21jWFar+z+83KCo0mepJEWxf/ReYS/dQDx6Y
 KCWzPCJ7YK+kTZ5K2OoNmp/SD7rIC67kuetU9tQxsswe7RWhRRCGRhKKdf9YHNkb9P54
 yDrj9zZ7CVqqiG0kNJeb6FpmswiC1blbOcloYm1T/T//rJWS0ung+s9Fx2X5rzbRGL/n
 OJgFJjZZ51BK1Twn7baV28XqiiiGS8GoNJqsRSnm/GpxPYi+NLwEWRn7nGLC9M8+yjKd
 j7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o9pR7FK+JGoERdb0Ak9FECdQMuRJrYsyh3lgs4kFEwQ=;
 b=lvhbU3c3aaUUu+zeTMDZ2mxynD8zTiyiDFGR9JnuCd2LX1bzUK9SN8RqnVCUbrfz2d
 K3d2ACAtYx7/WhqWf6ncAIY2Nj+cyqVdyBmxQvjq3uCLP5GuW2+EflAdywVqimGb0F3m
 EnElMarhTyDpNYlISTarQzmhaN2g3h3fN7SKq34sFmV14/+ibb1fxgadqgulfaqbgiUT
 ajMc36VE1DZFAg27T65qGcqy991+VZjxhZW3WQoKZ9KoAHr42Qb96zUv0heYIz8QPpML
 GgyO29p1R8a67pub4CHSXenB7mdTd5K+ZXZgrIEivva5yZBTvgN3jzEnZ+ed0k1Y3FDJ
 jOGg==
X-Gm-Message-State: AOAM531aJ4TfgbeM6nkoZbpBJe5D/qUPanXCGzuK6/H1gJcyS2X5ySvC
 bWJN/CobJpQtcyUTYRrv/twNIZ/OpGOvUUrB8nLs9A==
X-Google-Smtp-Source: ABdhPJy64KlmX4N12OxqX23EP5E04YYy4MNUIXKmL/3zu7BPBVj4Ub21t3SB9b5bJIyYHJCiiwGiKVIn/Ld42eCnLog=
X-Received: by 2002:a7b:c0c5:: with SMTP id s5mr8505787wmh.152.1600329563988; 
 Thu, 17 Sep 2020 00:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <1600327549-3995-1-git-send-email-liush@allwinnertech.com>
In-Reply-To: <1600327549-3995-1-git-send-email-liush@allwinnertech.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 17 Sep 2020 13:29:12 +0530
Message-ID: <CAAhSdy1kn5K3aH3-LP9zy2R-Xq0ha9RqjBnBd8y9xZkCEn0rsg@mail.gmail.com>
Subject: Re: [PATCH] riscv: fix pfn_to_virt err in do_page_fault().
To: liush <liush@allwinnertech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_035926_819211_6CD5E66E 
X-CRM114-Status: GOOD (  16.64  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 peterx@redhat.com, daniel.m.jordan@oracle.com,
 Palmer Dabbelt <palmer@dabbelt.com>, Mike Rapoport <rppt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, walken@google.com,
 linux-riscv <linux-riscv@lists.infradead.org>, vbabka@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Sep 17, 2020 at 12:56 PM liush <liush@allwinnertech.com> wrote:
>
> The argument to pfn_to_virt() should be pfn not the value of CSR_SATP.
>
> Signed-off-by: liush <liush@allwinnertech.com>
> ---
>  arch/riscv/mm/fault.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 716d64e..9b4e088 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -212,7 +212,7 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
>                  * of a task switch.
>                  */
>                 index = pgd_index(addr);
> -               pgd = (pgd_t *)pfn_to_virt(csr_read(CSR_SATP)) + index;
> +               pgd = (pgd_t *)pfn_to_virt(csr_read(CSR_SATP) & SATP_PPN) + index;
>                 pgd_k = init_mm.pgd + index;
>
>                 if (!pgd_present(*pgd_k))
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
