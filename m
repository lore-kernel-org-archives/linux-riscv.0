Return-Path: <SRS0=wFsd=DO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC01FC4363C
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2020 04:12:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BC78208C3
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2020 04:12:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bqJN9+ZQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Am626B1m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BC78208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=n6xQvRqGXqi96exwrQwwgOo/mQaCj4tYzfYAd/SwkvY=; b=bqJN9+ZQeSi0adVsVIzVIY+Lm
	s3O+m4yOrmLTECmNuc6aikjHTDvgQ50RMFHz5ZS6IBFr3gxYfHTQSMKH5OuqjvCf7b8csDAUYyDhK
	mQnDCjCrmK6yob1vtItTRR4jz6+KbjE0fuf4I5fAfR53BjXC6LAEw1CBetVuF1/Z8U1xZa2ie9k1Y
	kioQSY0DfR9DYUeXwYBeL+y+gq9R61dV8IPcTHyJoSUw3yHK4mQ6ylGU27f2bt0ydHfzWmfeWLq18
	aFuJJGLOVfTHjHFYk7YYB8AsrhX97NqpIg8RFFiNEfEtQaZzlj4HJtvS9WiP6M+AAWLhOgTirfgau
	JrXuLfWRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ0oP-0001Ao-Pf; Wed, 07 Oct 2020 04:12:21 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ0oN-0001AB-S5
 for linux-riscv@lists.infradead.org; Wed, 07 Oct 2020 04:12:20 +0000
Received: by mail-pj1-x1044.google.com with SMTP id kk9so393347pjb.2
 for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2020 21:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Y42f+xCeFC9aJfaprUfLKsV1W6cjiDKd4zVBYm3so2c=;
 b=Am626B1mMSzKkJtKZO1KtVxoCrwhVXv6gfab3stoZ4ewy7b5+MYDP5R7eYl4JXL9kX
 ngSMaYqPVKvRv6wfttCJyW7VySrZdpDbLVd7OXy+XZCkdwvcmrH1JLH8ZQ0zqNwHMdhZ
 RZ3ankVeIu7omdFnqWFsJolMHytMcIUGg66DgJJxck6zBkvtdO8i2MrZAocOAIq3aHsp
 5iLjQ/pLIF+y0LHaRinPO/bNl9vZoIsTNCOKSfB3ekqC+P+gxY4eSuLt5B6wI3DOSxb0
 oXGMvUdklTynf3UE5QGClSGXUMnp/GW7uNrd+7RMirJIs1rUp948JKc47+jePxPQJnkc
 1E9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Y42f+xCeFC9aJfaprUfLKsV1W6cjiDKd4zVBYm3so2c=;
 b=TOg0NmWNYwg9N969tr9uk+XtRJjiZVe7MRC1omcLv9EY8geERPpAXCrJMZ8avPOIlv
 2CLHp+zrIC0uRmjsIsuSJl9JVpOkxSFChRhQLbd3EVSuIdiCp1I1e6mXQc6vNDsEMWLO
 8C2MBoMWZO9AN71gqI1QVPVScWpfvJY5YwDXqcnPdt5tQVKp27zUtROhOqDu/wDWSUGX
 B3bmYo5nHhNaL4kkXaR0vZQV7UCxgFq++hqyyUT29iBazv0xkVyL/rciZz41NVkKpleE
 O0n7fgjSQxcnTPq3CHVK1A6P/aoKCUF3J/GmDBXmyqzOufqx38bnELlbvQ0zi7aV+rA9
 VSvg==
X-Gm-Message-State: AOAM533wamc439WOLPEGMzKxmarGXGwwx0EOjehoaPiJtVA4oKtpeYEA
 CyivAgTAq5dtIt6zZznkR2kpeI9+6BAiEg==
X-Google-Smtp-Source: ABdhPJyYQFQrTMby8WlVHEvFCUzvT2Fa9HBpYH785CXECo64okrkWsmHHRBwGUcT1huT8BhMIW8nMA==
X-Received: by 2002:a17:90b:698:: with SMTP id
 m24mr1227870pjz.154.1602043935036; 
 Tue, 06 Oct 2020 21:12:15 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id h9sm810241pgk.52.2020.10.06.21.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 21:12:14 -0700 (PDT)
Date: Tue, 06 Oct 2020 21:12:14 -0700 (PDT)
X-Google-Original-Date: Tue, 06 Oct 2020 20:22:44 PDT (-0700)
Subject: Re: [PATCH] riscv: Fixup bootup failure with HARDENED_USERCOPY
In-Reply-To: <1602002973-92934-1-git-send-email-guoren@kernel.org>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: guoren@kernel.org
Message-ID: <mhng-405fa3f3-74ce-4a03-958e-d0a6c42de3f6@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_001219_940624_79A07A75 
X-CRM114-Status: GOOD (  26.34  )
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
Cc: linux-riscv@lists.infradead.org, guoren@linux.alibaba.com,
 schwab@linux-m68k.org, linux-kernel@vger.kernel.org, atishp@atishpatra.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 06 Oct 2020 09:49:33 PDT (-0700), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> As Aurelien has reported:
>
> [    3.484586] AppArmor: AppArmor sha1 policy hashing enabled
> [    4.749835] Freeing unused kernel memory: 492K
> [    4.752017] Run /init as init process
> [    4.753571] usercopy: Kernel memory overwrite attempt detected to kernel text (offset 507879, size 11)!
> [    4.754838] ------------[ cut here ]------------
> [    4.755651] kernel BUG at mm/usercopy.c:99!
> [    4.756445] Kernel BUG [#1]
> [    4.756815] Modules linked in:
> [    4.757542] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.8.0-1-riscv64 #1 Debian 5.8.7-1
> [    4.758372] epc: ffffffe0003b5120 ra : ffffffe0003b5120 sp : ffffffe07f783ca0
> [    4.758960]  gp : ffffffe000cc7230 tp : ffffffe07f77cec0 t0 : ffffffe000cdafc0
> [    4.759772]  t1 : 0000000000000064 t2 : 0000000000000000 s0 : ffffffe07f783cf0
> [    4.760534]  s1 : ffffffe00095d780 a0 : 000000000000005b a1 : 0000000000000020
> [    4.761309]  a2 : 0000000000000005 a3 : 0000000000000000 a4 : ffffffe000c1f340
> [    4.761848]  a5 : ffffffe000c1f340 a6 : 0000000000000000 a7 : 0000000000000087
> [    4.762684]  s2 : ffffffe000941848 s3 : 000000000007bfe7 s4 : 000000000000000b
> [    4.763500]  s5 : 0000000000000000 s6 : ffffffe00091cc00 s7 : fffffffffffff000
> [    4.764376]  s8 : 0000003ffffff000 s9 : ffffffe0769f3200 s10: 000000000000000b
> [    4.765208]  s11: ffffffe07d548c40 t3 : 0000000000000000 t4 : 000000000001dcd0
> [    4.766059]  t5 : ffffffe000cc8510 t6 : ffffffe000cd64aa
> [    4.766712] status: 0000000000000120 badaddr: 0000000000000000 cause: 0000000000000003
> [    4.768308] ---[ end trace 1f8e733e834d4c3e ]---
> [    4.769129] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> [    4.770070] SMP: stopping secondary CPUs
> [    4.771110] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
>
> Above failure is relate to commit: a0fa4027dc911 (riscv: Fixup

That commit isn't in Linus' tree (at least, as far as I see it).  I have
6184358da000 ("riscv: Fixup static_obj() fail"), so I'm going to fix that -- in
fact, I'm going to essentially just replace most of this rationale with what I
wrote up in my revert as this is all a bit too long for a commit message.

I was kind of worried the initdata move was a bit too risky, but after reading
the users of __init_{begin,end} I think it's safe.  Here's what I ended up with
on fixes.

Thanks!

commit 84814460eef9af0fb56a4698341c9cb7996a6312 (HEAD -> fixes, riscv/fixes)
gpg: Signature made Tue 06 Oct 2020 09:11:35 PM PDT
gpg:                using RSA key 2B3C3747446843B24A943A7A2E1319F35FBB1889
gpg:                issuer "palmer@dabbelt.com"
gpg: Good signature from "Palmer Dabbelt <palmer@dabbelt.com>" [ultimate]
gpg:                 aka "Palmer Dabbelt <palmerdabbelt@google.com>" [ultimate]
Author: Guo Ren <guoren@linux.alibaba.com>
Date:   Tue Oct 6 16:49:33 2020 +0000

    riscv: Fixup bootup failure with HARDENED_USERCOPY
    
    6184358da000 ("riscv: Fixup static_obj() fail") attempted to elide a lockdep
    failure by rearranging our kernel image to place all initdata within [_stext,
    _end], thus triggering lockdep to treat these as static objects.  These objects
    are released and eventually reallocated, causing check_kernel_text_object() to
    trigger a BUG().
    
    This backs out the change to make [_stext, _end] all-encompassing, instead just
    moving initdata.  This results in initdata being outside of [__init_begin,
    __init_end], which means initdata can't be freed.
    
    Link: https://lore.kernel.org/linux-riscv/1593266228-61125-1-git-send-email-guoren@kernel.org/T/#t
    Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
    Reported-by: Aurelien Jarno <aurelien@aurel32.net>
    Tested-by: Aurelien Jarno <aurelien@aurel32.net>
    [Palmer: Clean up commit text]
    Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>

> static_obj() fail). When we expand static_obj include INIT_DATA,
> we also include INIT_TEXT into usercopy check kernel text:
>
> /* Is this address range in the kernel text area? */
> static inline void check_kernel_text_object(const unsigned long ptr,
>                                             unsigned long n, bool to_user)
> {
>         unsigned long textlow = (unsigned long)_stext;
>         unsigned long texthigh = (unsigned long)_etext;
>         unsigned long textlow_linear, texthigh_linear;
>
>         if (overlaps(ptr, n, textlow, texthigh))
>                 usercopy_abort("kernel text", NULL, to_user, ptr - textlow, n);
>
> When INIT_TEXT/DATA are freed, new allocation will reuse these
> memory and overlaps check will be triggered.
>
> The patch met static_obj and check_kernel_text_object requirements.
>
> Link: https://lore.kernel.org/linux-riscv/1593266228-61125-1-git-send-email-guoren@kernel.org/T/#t
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Reported-by: Aurelien Jarno <aurelien@aurel32.net>
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> Cc: Atish Patra <atishp@atishpatra.org>
> Cc: Andreas Schwab <schwab@linux-m68k.org>
> ---
>  arch/riscv/kernel/vmlinux.lds.S | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> index f3586e3..34d00d9 100644
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -22,13 +22,11 @@ SECTIONS
>  	/* Beginning of code and text segment */
>  	. = LOAD_OFFSET;
>  	_start = .;
> -	_stext = .;
>  	HEAD_TEXT_SECTION
>  	. = ALIGN(PAGE_SIZE);
>
>  	__init_begin = .;
>  	INIT_TEXT_SECTION(PAGE_SIZE)
> -	INIT_DATA_SECTION(16)
>  	. = ALIGN(8);
>  	__soc_early_init_table : {
>  		__soc_early_init_table_start = .;
> @@ -55,6 +53,7 @@ SECTIONS
>  	. = ALIGN(SECTION_ALIGN);
>  	.text : {
>  		_text = .;
> +		_stext = .;
>  		TEXT_TEXT
>  		SCHED_TEXT
>  		CPUIDLE_TEXT
> @@ -67,6 +66,8 @@ SECTIONS
>  		_etext = .;
>  	}
>
> +	INIT_DATA_SECTION(16)
> +
>  	/* Start of data section */
>  	_sdata = .;
>  	RO_DATA(SECTION_ALIGN)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
