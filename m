Return-Path: <SRS0=cKew=DB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED8DC4363D
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2020 16:20:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC5652311B
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2020 16:20:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O2DOTP3j";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="J8IIsKYi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC5652311B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ovu/jiXhikWvd2kXzXYak6f2wYt6wuZy4am9bZhsswo=; b=O2DOTP3jzSvmz46zNBC9546x5
	sb/I3cdPBPR/nptyYItjGfWYoPdAKXnY6ioyWWIAMPkqYeC9DPyE2Ixp8/x6FZjJCJUNL+9KDYkpk
	LN1DFq1xENfebZQcXZ82ozdgf+wd1bax5YTD15fa+L6E9jXU6QDg/gq/vZBxVeU6QGINURe2XD9Oq
	AVmY8tAAYr0fBcPG1vXO8aePkb3SUn+Fgk/GbG3tICVpS8UZ0rLc84pLMSi2Ps+C1Y8lTKd1v9P6g
	d0mCTD2K2esuima3Uu51+XsNOWM/iLQDeGsq8u4iUHIisSMXnYw09g6qtlHIMBn5s5qCDa61D2tLL
	tzP39gBlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLTyM-0003gp-JK; Thu, 24 Sep 2020 16:19:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLTyJ-0003gM-Lg
 for linux-riscv@lists.infradead.org; Thu, 24 Sep 2020 16:19:52 +0000
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB4852388A
 for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2020 16:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600964389;
 bh=r00IuGK5X4M7N6a9KOcuaC8vPlLWVqhKALShVxiGX1k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=J8IIsKYi2Sg1I974iLW774RlXPH4NpiJIHTCb40J2Kg5XuyCH70i3/2ElWkQC4dLl
 VIa/s7z3oKL0Y5ZO2WHgzdjvS81cW4H3GK23R4h3sBFEHcd939hMI6uFOA04s4haSp
 xuoTdJh0UgzRKbYb/hnhHLcmAQRNY8PysRdFdkfI=
Received: by mail-lf1-f50.google.com with SMTP id b12so4555014lfp.9
 for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2020 09:19:48 -0700 (PDT)
X-Gm-Message-State: AOAM533Gzhj4ni1y/ZsQt0Fb3L9KwUfarOYqZXxUr2zWOYviBk5p1S8/
 g/bMZOFdryO4BjZgesj0kIEYEK4iTXA+gwcocZE=
X-Google-Smtp-Source: ABdhPJxK14YFyUBWy6SgCJIl22YZISDj8RkvTJ370I4zSII4adfInU3jERuIkf/bpKmN5pFlCasStitlaM5OzKK+AJg=
X-Received: by 2002:ac2:5e99:: with SMTP id b25mr82111lfq.248.1600964387152;
 Thu, 24 Sep 2020 09:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <1593266228-61125-1-git-send-email-guoren@kernel.org>
 <1593266228-61125-2-git-send-email-guoren@kernel.org>
 <20200911204512.GA2705@aurel32.net>
 <CAJF2gTQiLV8sDE5cnvP=aBog4zaiMvMeieg_JtXwRODky1u3Hg@mail.gmail.com>
 <20200914103836.GB2705@aurel32.net> <87lfgzeidk.fsf@igel.home>
In-Reply-To: <87lfgzeidk.fsf@igel.home>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 25 Sep 2020 00:19:35 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ8ONde3GRhQgx2Nqvb5X20nTmW8jZEemZKhezRDzP3aQ@mail.gmail.com>
Message-ID: <CAJF2gTQ8ONde3GRhQgx2Nqvb5X20nTmW8jZEemZKhezRDzP3aQ@mail.gmail.com>
Subject: Re: [PATCH V2 1/3] riscv: Fixup static_obj() fail
To: Andreas Schwab <schwab@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_121951_891248_EE41FC56 
X-CRM114-Status: GOOD (  18.64  )
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
Cc: Tycho Andersen <tycho@tycho.ws>, Albert Ou <aou@eecs.berkeley.edu>,
 Nick Hu <nickhu@andestech.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

How about this, revert the commit and don't free INIT_DATA_SECTION. I
think the solution is safe enough, but wast a little memory.

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index f3586e3..34d00d9 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -22,13 +22,11 @@ SECTIONS
        /* Beginning of code and text segment */
        . = LOAD_OFFSET;
        _start = .;
-       _stext = .;
        HEAD_TEXT_SECTION
        . = ALIGN(PAGE_SIZE);

        __init_begin = .;
        INIT_TEXT_SECTION(PAGE_SIZE)
-       INIT_DATA_SECTION(16)
        . = ALIGN(8);
        __soc_early_init_table : {
                __soc_early_init_table_start = .;
@@ -55,6 +53,7 @@ SECTIONS
        . = ALIGN(SECTION_ALIGN);
        .text : {
                _text = .;
+               _stext = .;
                TEXT_TEXT
                SCHED_TEXT
                CPUIDLE_TEXT
@@ -67,6 +66,8 @@ SECTIONS
                _etext = .;
        }

+       INIT_DATA_SECTION(16)
+
        /* Start of data section */
        _sdata = .;
        RO_DATA(SECTION_ALIGN)

On Thu, Sep 24, 2020 at 3:36 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> On Sep 14 2020, Aurelien Jarno wrote:
>
> > How should we proceed to get that fixed in time for 5.9? For the older
> > branches where it has been backported (so far 5.7 and 5.8), should we
> > just get that commit reverted instead?
>
> Can this please be resolved ASAP?
>
> Andreas.
>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
