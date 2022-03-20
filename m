Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0236EC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Mar 2022 18:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=GEs1xLwB63XKLKrTeAbTZ/59fmPZJ+N+dupZqckq798=; b=XgLLGHSwIQdkzIEDEwNSQP4J+/
	OcX1j9+MB1UZYqG4xvLAVPEFVTd3XG3eSzW5JNhHAcyxs0+CifxNfnCy20OlkphSxLoPZiEzcx0ak
	ikQTe9FinpyY2IvLCyjlvWjgeAYfTInRzdUpoZQYvF7akcIV00RT0/s7uby3+WGZED+fFqKkOhuVB
	ReoZKnYcM40wRXD7E++hkuXh3AfG0mESwAVaLUcyotGUD+XVLwFpOyVn9F4zwCf7475mrjQaQRtdN
	2YRh2dGkb+/cpJkaW2n1hKfltTuUk2lhyXnGgk1OYF1W7wWpgo/whIWzZfGiLpQCWBjo+ou20Ctwf
	mCS1W4Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVzvn-005euL-NS; Sun, 20 Mar 2022 18:05:31 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVzvb-005ers-HD
 for linux-riscv@lists.infradead.org; Sun, 20 Mar 2022 18:05:21 +0000
Received: by mail-pl1-x62e.google.com with SMTP id j13so1046581plj.8
 for <linux-riscv@lists.infradead.org>; Sun, 20 Mar 2022 11:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=W8wVV9vzvtZCSSPiAIhvOJYVojouvBvjOyuSiPQ7Orc=;
 b=BuisuQ8zdGEGElEJtLnEk71SamOFCHUHk+7Ws5ru+OHTRth66xjBGh0enkv7Of5kLu
 L6rKry91Ihzlj0uxyXjxLXb++DDhR1O8oNaCoVhMnO+Dvupl7sEy40n0EGOFWHdmhpd+
 8PqykppNi4Z6/mCgFVoUWj2oRG0ob7S1r4pNaL5OuEvmcoKWJtanxtJGkMC2ybIjybAf
 33UNziLBePEX6dwCBcBAhtjGYSPdBQFv+C0si9BVAMbxVlHZrXhP5L5pFaq8F+l/NwVx
 HZTmffxPCek82nQ94DyPjoysNPkmeYvmMTyS/A7HAeBdBojvWy3rEjD2CQOZhfR53D2y
 sgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=W8wVV9vzvtZCSSPiAIhvOJYVojouvBvjOyuSiPQ7Orc=;
 b=o1WisIBTM3BQeLF0qY4LFthyc9JYIjN3uIeOcWGJlJP9OCHqNrKP5ArtwjA7RJ1492
 V0lwzcxGvpsXYvmh9XaCGiS0nIwrPLxScX6j+XxnaBPLDzu+Jkocal9J001uA2ZkToBa
 mOg7TsgOfOGIq8WcMvZRT0IjTPnrXO43eDSAUYXP8Xpxx6XGB7y0RV05/NcMzPfNw7wQ
 wcAIqcw4hRZ1ELnK0J8TOMNTTEJSvaEtYi6yNGgiObAo75ETKdrbUm96JNAEhuLhC9E/
 STliA9RfoqcH04G2Qftpg/FV8q2Zb4KBlf9YYPQ9FFMWyuZu6ve59Mr16Rhe6QC663Gm
 h0uA==
X-Gm-Message-State: AOAM530x3EplyXI7aV2DPX31w5EUJnp0Mu62CxqRovGhVTzsbIZy4kqD
 m0WNff5Z/bhRZtdr+tizbgYIgA==
X-Google-Smtp-Source: ABdhPJyIXO8JsaI8FTrIRSaST77QU9EDA/NG1bQPqJX2QUGXuKXs3BzVWFYzx9mKyEttwTJPa1HxLQ==
X-Received: by 2002:a17:902:d48d:b0:153:a517:6ff2 with SMTP id
 c13-20020a170902d48d00b00153a5176ff2mr9360763plg.141.1647799517730; 
 Sun, 20 Mar 2022 11:05:17 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 s25-20020a056a00179900b004f737ce5c1asm16245907pfg.73.2022.03.20.11.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 11:05:17 -0700 (PDT)
Date: Sun, 20 Mar 2022 11:05:17 -0700 (PDT)
X-Google-Original-Date: Sun, 20 Mar 2022 11:05:07 PDT (-0700)
Subject: Re: [PATCH V2] arch: patch_text: Fixup last cpu should be master
In-Reply-To: <20220313012221.1755483-1-guoren@kernel.org>
CC: guoren@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org, 
 linux-xtensa@linux-xtensa.org, guoren@linux.alibaba.com, jcmvbkbc@gmail.com,
 Will Deacon <will@kernel.org>, 
 catalin.marinas@arm.com, mhiramat@kernel.org, chris@zankel.net,
 Arnd Bergmann <arnd@arndb.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: guoren@kernel.org
Message-ID: <mhng-b034f45a-521b-4c80-a314-4ddf1a1dc534@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220320_110519_655987_6698EB9A 
X-CRM114-Status: GOOD (  26.74  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 12 Mar 2022 17:22:21 PST (-0800), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> These patch_text implementations are using stop_machine_cpuslocked
> infrastructure with atomic cpu_count. The original idea: When the
> master CPU patch_text, the others should wait for it. But current
> implementation is using the first CPU as master, which couldn't
> guarantee the remaining CPUs are waiting. This patch changes the
> last CPU as the master to solve the potential risk.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Peter Zijlstra <peterz@infradead.org
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Arnd Bergmann <arnd@arndb.de>
>
> ---
> Changes in V2:
>  - Fixup last cpu should be num_online_cpus() by Max Filippov
>  - Fixup typos found by Max Filippov
> ---
>  arch/arm64/kernel/patching.c      | 4 ++--
>  arch/csky/kernel/probes/kprobes.c | 2 +-
>  arch/riscv/kernel/patch.c         | 2 +-
>  arch/xtensa/kernel/jump_label.c   | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
> index 771f543464e0..33e0fabc0b79 100644
> --- a/arch/arm64/kernel/patching.c
> +++ b/arch/arm64/kernel/patching.c
> @@ -117,8 +117,8 @@ static int __kprobes aarch64_insn_patch_text_cb(void *arg)
>  	int i, ret = 0;
>  	struct aarch64_insn_patch *pp = arg;
>
> -	/* The first CPU becomes master */
> -	if (atomic_inc_return(&pp->cpu_count) == 1) {
> +	/* The last CPU becomes master */
> +	if (atomic_inc_return(&pp->cpu_count) == num_online_cpus()) {
>  		for (i = 0; ret == 0 && i < pp->insn_cnt; i++)
>  			ret = aarch64_insn_patch_text_nosync(pp->text_addrs[i],
>  							     pp->new_insns[i]);
> diff --git a/arch/csky/kernel/probes/kprobes.c b/arch/csky/kernel/probes/kprobes.c
> index 42920f25e73c..34ba684d5962 100644
> --- a/arch/csky/kernel/probes/kprobes.c
> +++ b/arch/csky/kernel/probes/kprobes.c
> @@ -30,7 +30,7 @@ static int __kprobes patch_text_cb(void *priv)
>  	struct csky_insn_patch *param = priv;
>  	unsigned int addr = (unsigned int)param->addr;
>
> -	if (atomic_inc_return(&param->cpu_count) == 1) {
> +	if (atomic_inc_return(&param->cpu_count) == num_online_cpus()) {
>  		*(u16 *) addr = cpu_to_le16(param->opcode);
>  		dcache_wb_range(addr, addr + 2);
>  		atomic_inc(&param->cpu_count);
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index 0b552873a577..765004b60513 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -104,7 +104,7 @@ static int patch_text_cb(void *data)
>  	struct patch_insn *patch = data;
>  	int ret = 0;
>
> -	if (atomic_inc_return(&patch->cpu_count) == 1) {
> +	if (atomic_inc_return(&patch->cpu_count) == num_online_cpus()) {
>  		ret =
>  		    patch_text_nosync(patch->addr, &patch->insn,
>  					    GET_INSN_LENGTH(patch->insn));

Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V

It's better if these sorts of things get split up: there's really no 
dependency between these diffs and having them together just makes for a 
merge/test headache for everyone.

I'm OK taking this through the RISC-V tree if other folks ack it, but 
for now I'm going to assume it's going to go in via somewhere else.

> diff --git a/arch/xtensa/kernel/jump_label.c b/arch/xtensa/kernel/jump_label.c
> index 61cf6497a646..b67efcd7e32c 100644
> --- a/arch/xtensa/kernel/jump_label.c
> +++ b/arch/xtensa/kernel/jump_label.c
> @@ -40,7 +40,7 @@ static int patch_text_stop_machine(void *data)
>  {
>  	struct patch *patch = data;
>
> -	if (atomic_inc_return(&patch->cpu_count) == 1) {
> +	if (atomic_inc_return(&patch->cpu_count) == num_online_cpus()) {
>  		local_patch_text(patch->addr, patch->data, patch->sz);
>  		atomic_inc(&patch->cpu_count);
>  	} else {

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
