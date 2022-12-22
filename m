Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A267C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 13:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s5Jb1epFkDZ/iOXL/XEO379YSsYsw7V50EOfq4arrzs=; b=kLsLVEH0Bqt/BZ
	EquIvjuRUEi6PdymQCXfQKuWRKW11icAf5/zS96EM0XdfLBWDEqruTerq7zv2qjrmd5aFUjEXbz4V
	xlW8cxxJwGlvPAeu1mDqfyoOYqE/knB93QmMRM31rhhkkTVI0s/C0RNJwfRepxF6xKZIkQX1DiWTY
	flAE+Mci5WJqCJGtDCKqvdfU3r9XczTsaQ0NXjRcMLuQd0xuBEOr/yG6aoV3cV9jM9TRnK85oa4tm
	gl5dzqDTqT/TVJWiIWImBJodVysFMD0GEQJttI+R0hA4shhTjqNR7o+sH8s+PqVGPeCg0Y66UV2qR
	/80GC/5Hu/ag7zSBAxwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8LjW-00CSlO-GD; Thu, 22 Dec 2022 13:35:38 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8KaT-00Bnzv-SD
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 12:22:15 +0000
Received: by mail-pj1-x1036.google.com with SMTP id z8-20020a17090abd8800b00219ed30ce47so5530307pjr.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Dec 2022 04:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/4Ai+7/9tsJEaKUGjCwWP2+aABMhRcTmi+u/34V2hQw=;
        b=nvZY/9YpTr6jdTc70zjaWMLJZUKjioAcdLd/4C8tX6ze7rKLdE852vscXOkFqjlaF9
         pLYIIy8ifrTQe4D2zsv5ltsg0oCwZ3z5qsDwuds5IV3RrFOB2/RiwXIBPYnPifCI3AEc
         VRT0rEkxIZBT9v4PExPhWXtNlfKkYqOqD222D4MRuvJYXjsS5JxNAK4W7oVZDeZoFeAs
         fx9jdR90hqF7s87xDjQCbnr/X+YNeLT6CywbuOVR1QuqtjKc3SpRtC9txaPtqdTqPGrL
         8gQBIQRaMrKKgy20xASCXrna+tkY3p2xP1uR+mV3O4VXBS+NkrPvAp4LVsDIM9QnMW+y
         c7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4Ai+7/9tsJEaKUGjCwWP2+aABMhRcTmi+u/34V2hQw=;
        b=QtkMCT6E5g9WgtdazmbqBA3qCoWxNbFafA2GZ8wH3/YxegwovA5OK2VTp7U/QfThi3
         jUYbXymZ0/WmiHLvx74zgycRb/+j1/I2O0gm4odBrxYoIojAeU5dAW05LPjHH2Fm99AD
         eYsf55F9F3uA5YuMWCimbg+W/BaFzMsvdbT/e26Q8I7bhycDxXXt0D53/HVeNrtsKWPa
         iiJlfVFSNoTCDeaoS+6FPglXfY0aC7eeYhfwU7zkFn6gpvua0SCcbXrs3n5k3vRbElCt
         8k6zqBWR6ycxHbkgEq8fawsYMOYb2p2sIsQLOKfCpWs6DGo9gHHlsWocSyJYefHWv8SH
         D6jw==
X-Gm-Message-State: AFqh2koy9QT4ngaIFA80JH2WxYSl7F4hTmumR+pzgFrrvmNz9tthaQiE
	fEHDcJ0rMbXUeIK3zncedhI=
X-Google-Smtp-Source: AMrXdXsYS0wAj3OWoSeexDWjyc/7PlVD9Fr/gxFxH6GG3j+D09BnjecoB8a4irEUWi+h3ICNtoWfYg==
X-Received: by 2002:a17:902:9043:b0:189:bc50:b93b with SMTP id w3-20020a170902904300b00189bc50b93bmr4937485plz.3.1671711729735;
        Thu, 22 Dec 2022 04:22:09 -0800 (PST)
Received: from mail.google.com ([103.135.102.144])
        by smtp.gmail.com with ESMTPSA id b8-20020a1709027e0800b00189a7fbfd44sm378005plm.211.2022.12.22.04.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 04:22:09 -0800 (PST)
Date: Thu, 22 Dec 2022 20:22:07 +0800
From: Changbin Du <changbin.du@gmail.com>
To: guoren@kernel.org
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	mhiramat@kernel.org, changbin.du@intel.com, zong.li@sifive.com,
	rostedt@goodmis.org, boqun.feng@gmail.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Changbin Du <changbin.du@gmail.com>
Subject: Re: [PATCH V2] riscv: patch: Fixup lockdep warning in stop_machine
Message-ID: <20221222122207.3ycdew6azfg6cqwy@mail.google.com>
References: <20221120101049.2078117-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221120101049.2078117-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_042213_960386_7402FBE7 
X-CRM114-Status: GOOD (  22.38  )
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

On Sun, Nov 20, 2022 at 05:10:49AM -0500, guoren@kernel.org wrote:
> From: Changbin Du <changbin.du@gmail.com>
> 
> The task of ftrace_arch_code_modify(_post)_prepare() caller is
> stop_machine, whose caller and work thread are different tasks. The
> lockdep checker needs the same task context, or it's wrong. That means
> it's a bug here to use lockdep_assert_held because we don't guarantee
> the same task context.
> 
> kernel/locking/lockdep.c:
> int __lock_is_held(const struct lockdep_map *lock, int read)
> {
>         struct task_struct *curr = current;
>         int i;
> 
>         for (i = 0; i < curr->lockdep_depth; i++) {
> 			^^^^^^^^^^^^^^^^^^^
>                 struct held_lock *hlock = curr->held_locks + i;
> 					  ^^^^^^^^^^^^^^^^
>                 if (match_held_lock(hlock, lock)) {
>                         if (read == -1 || !!hlock->read == read)
>                                 return LOCK_STATE_HELD;
> 
> The __lock_is_held depends on current held_locks records; if
> stop_machine makes the checker runing on another task, that's wrong.
> 
> Here is the log:
> [   15.761523] ------------[ cut here ]------------
> [   15.762125] WARNING: CPU: 0 PID: 15 at arch/riscv/kernel/patch.c:63 patch_insn_write+0x72/0x364
> [   15.763258] Modules linked in:
> [   15.764154] CPU: 0 PID: 15 Comm: migration/0 Not tainted 6.1.0-rc1-00014-g66924be85884-dirty #377
> [   15.765339] Hardware name: riscv-virtio,qemu (DT)
> [   15.765985] Stopper: multi_cpu_stop+0x0/0x192 <- stop_cpus.constprop.0+0x90/0xe2
> [   15.766711] epc : patch_insn_write+0x72/0x364
> [   15.767011]  ra : patch_insn_write+0x70/0x364
> [   15.767276] epc : ffffffff8000721e ra : ffffffff8000721c sp : ff2000000067bca0
> [   15.767622]  gp : ffffffff81603f90 tp : ff60000002432a00 t0 : 7300000000000000
> [   15.767919]  t1 : 0000000000000000 t2 : 73695f6b636f6c5f s0 : ff2000000067bcf0
> [   15.768238]  s1 : 0000000000000008 a0 : 0000000000000000 a1 : 0000000000000000
> [   15.768537]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : 0000000000000000
> [   15.768837]  a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000000000000
> [   15.769139]  s2 : ffffffff80009faa s3 : ff2000000067bd10 s4 : ffffffffffffffff
> [   15.769447]  s5 : 0000000000000001 s6 : 0000000000000001 s7 : 0000000000000003
> [   15.769740]  s8 : 0000000000000002 s9 : 0000000000000004 s10: 0000000000000003
> [   15.770027]  s11: 0000000000000002 t3 : 0000000000000000 t4 : ffffffff819af097
> [   15.770323]  t5 : ffffffff819af098 t6 : ff2000000067ba28
> [   15.770574] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
> [   15.771102] [<ffffffff80007520>] patch_text_nosync+0x10/0x3a
> [   15.771421] [<ffffffff80009c66>] ftrace_update_ftrace_func+0x74/0x10a
> [   15.771704] [<ffffffff800fa17e>] ftrace_modify_all_code+0xb0/0x16c
> [   15.771958] [<ffffffff800fa24c>] __ftrace_modify_code+0x12/0x1c
> [   15.772196] [<ffffffff800e110e>] multi_cpu_stop+0x14a/0x192
> [   15.772454] [<ffffffff800e0a34>] cpu_stopper_thread+0x96/0x14c
> [   15.772699] [<ffffffff8003f4ea>] smpboot_thread_fn+0xf8/0x1cc
> [   15.772945] [<ffffffff8003ac9c>] kthread+0xe2/0xf8
> [   15.773160] [<ffffffff80003e98>] ret_from_exception+0x0/0x14
> [   15.773471] ---[ end trace 0000000000000000 ]---
> 
> Fixes: 0ff7c3b33127 ("riscv: Use text_mutex instead of patch_lock")
> Cc: Changbin Du <changbin.du@gmail.com>
> Co-developed-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Zong Li <zong.li@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> ---
> Changes in v2:
>  - Rewrite commit log with lockdep explanation [Guo Ren]
>  - Rebase on v6.1 [Guo Ren]
> 
> v1:
> https://lore.kernel.org/linux-riscv/20210417023532.354714-1-changbin.du@gmail.com/
> ---
>  arch/riscv/kernel/patch.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index 765004b60513..8619706f8dfd 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -55,13 +55,6 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
>  	bool across_pages = (((uintptr_t) addr & ~PAGE_MASK) + len) > PAGE_SIZE;
>  	int ret;
>  
> -	/*
> -	 * Before reaching here, it was expected to lock the text_mutex
> -	 * already, so we don't need to give another lock here and could
> -	 * ensure that it was safe between each cores.
> -	 */
> -	lockdep_assert_held(&text_mutex);
> -
>  	if (across_pages)
>  		patch_map(addr + len, FIX_TEXT_POKE1);
>  
> -- 
> 2.36.1
> 

Signed-off-by: Changbin Du <changbin.du@gmail.com>

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
