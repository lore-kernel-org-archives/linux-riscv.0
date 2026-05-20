Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCE3CD4F3C
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 15:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=noy+OVShcNU/N1SR73r2hcAnO1QPBtQiTg+5jX+Y9Lw=; b=Lct4wUqgTzPG5Z
	mOzXEUNWsrdxGmWPSI1tYIoiIXGJ0e4cRTuMdL7gYZFUbTU2DdYPjCjjV/kIx7h7spklCEnyjM65I
	5xPn03YOH0ZyB8yVvf1tt+2uj0KdAwbN/GS7FYlHt4QybVnFzJ54ATWOxCKU1oTF+EWnM6XlVihWZ
	Wlg6fY/hPaBg63K8DfYjgGULQWHzsg+SI1lz/hh06dLbkRR8Vo5RhBh8XuiDuu+6RqhldQRtE6wk6
	lhW/M6HJYONZtNxXDM6ZNPzskQ+lyOM/9CUL7ZlL884r8HXu2jzbuFuVBm8eV2O/15oKbeEtZR3IF
	tm4O20zkVc5m0w+fzZXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPj9G-000000053W3-1LPJ;
	Wed, 20 May 2026 15:47:54 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPj9D-000000053V9-36Cg
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 15:47:53 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-7bdc947aaa3so45843437b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 08:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1779292070; x=1779896870; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JubydVUqW/P7ynT150P3sJMigiSm7SSOwcsE79mSJn4=;
        b=QEecgDi6Zt4eyYliVd7SQ2AWvgag2ay1S7uEu3QN87jat95xVqrFnwUgAQvzr5GzNl
         hyUQ/ET1twkvxt2MtM9S2sLuTJgTU6lYBc1OCXeJ8xDK7DI9B3hheBdUaeGClvy9CsOe
         gGhKugMpLlLlFqoowjPV4idX0EUrsygA7cIF/MUu0o94YeDkdM099nJef/mjl//4qbFX
         3xsVjthuu6NJuUJUF/Cxw4yE4+wDBaFz1xzbpKjJxp2s4fzUx9n29JqYiglPk2d1i/b7
         wswwwO83ZqxEORpEWvAjMluAhfVkg/ITrQbwPDMl63v0fMfxsA5YNNdqnS3E/Wv1+2RX
         gHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292070; x=1779896870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JubydVUqW/P7ynT150P3sJMigiSm7SSOwcsE79mSJn4=;
        b=XKZ3r2ZROBxgyitA6WaRrcXESLMSuSNnBmveU1McohhoIcqaUF+AjnzB5eAVXhdU4w
         B8q3wWfxsqit81zt84hGv55cmSzN7iCVPq74/83AhBmEx6IF69peI0/dsXzPCNqAS3To
         nBm38hOLXuWAF0BR1LCco4gyMaAtyzp5pUHTYvJS1kUd2vSdUwIk8D7puJTuOe6Ipus3
         6ie7CmnXFGDZRIUWTmlKYqcemqXsgHVQ2rlKjciupDPYIUyfMSMHafge9rcYzVSZkmic
         LqJB4UK8ICyyG7LMHoAZtYw2WuQ4X9+2gjPFoQexZ20tVF6tUj6tlX8hzRti+n4LJ3qx
         Dltg==
X-Forwarded-Encrypted: i=1; AFNElJ/nwTWqpow1l4nvqlzuEWxvcVVoQlq8pc5U8xko2zNPF2WZgxHXrBloMYV84YiiTHc/rTypGf0bOlt3gw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIZG3VQcPKBRNfaiEl0fO7rxVHm3XnKYSmg0wkQePaTcMXH/C/
	XIeuTS/Cqe9DQJm25HAhQjQ/dVhfoGRjirDkUB9Br7G+c8slaoF8WfG+JnXwN7MyCzo=
X-Gm-Gg: Acq92OEJsOsSD6IAGlAodXARJR+PKrVXqmmpac4jNMNZk1AGstoRODE/+BQBiaOc56x
	Y6K5sbLsAWtrLfv/7HPzZAP3jujWKOsn8xLzDEO1QjCDfXle3s42DA/rHuZjTTV4DHduU2sT77x
	kQ1ueRq5DH1jcggoJsnLEWrqRA4It2ELDwCh/MBGHkenXzp8EB8NaberxPB1AOerVpV9pT1n3ag
	gqRN1wJJ+Q5tVivIK4LW9wyJctJk+O35EfgtT46LjgyebaWFIjyhX3cqSg/0XSbs7xtjmcsDgZ6
	CYyXNAYs70hRjlFNMxozlo5EYTqAB9zTgAYhDnMg6foiuqYPypw3+3zbCW5tIuPXfVndGjbjqTF
	X+pQiTPLG0KAEZ/0fCTCBcDdMRj/wu3LEm5kVPNUe7aQ+IwcxSNR3E2DKgQLJCwnB8dT2kmYbtf
	tNwJvc0aNpcFD7p3tfMu7IEUfJjxH5LdROp98Il4lnYmezzA8VFTUkdid74jhY4i8=
X-Received: by 2002:a05:690c:6c87:b0:7c0:8028:11f7 with SMTP id 00721157ae682-7c959b9720amr280334897b3.6.1779292070323;
        Wed, 20 May 2026 08:47:50 -0700 (PDT)
Received: from toolbox ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc9bc0ccf7sm55086957b3.25.2026.05.20.08.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:47:49 -0700 (PDT)
Date: Wed, 20 May 2026 10:47:35 -0500
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: Vivian Wang <wangruikang@iscas.ac.cn>, Paul Walmsley <pjw@kernel.org>
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Songsong Zhang <U2FsdGVkX1@gmail.com>, 
	Michael Ellerman <mpe@kernel.org>, Drew Fustini <fustini@kernel.org>
Subject: Re: [PATCH v2] riscv: misaligned: Make enabling delegation depend on
 NONPORTABLE
Message-ID: <nrvt74qnojaubiwjo37ums4lnclu466hovwrhmtbag6f5uhrql@q6msoe2oto4b>
References: <20260401-riscv-misaligned-dont-delegate-v2-1-5014a288c097@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260401-riscv-misaligned-dont-delegate-v2-1-5014a288c097@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_084751_795940_499EA4ED 
X-CRM114-Status: GOOD (  16.53  )
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

Hi Vivian, Paul

On Wed, Apr 01, 2026 at 09:53:17AM +0800, Vivian Wang wrote:
> The unaligned access emulation code in Linux has various deficiencies.
> For example, it doesn't emulate vector instructions [1] [2], and doesn't
> emulate KVM guest accesses. Therefore, requesting misaligned exception
> delegation with SBI FWFT actually regresses vector instructions' and KVM
> guests' behavior.
> 
> Until Linux can handle it properly, guard these sbi_fwft_set() calls
> behind RISCV_SBI_FWFT_DELEGATE_MISALIGNED, which in turn depends on
> NONPORTABLE. Those who are sure that this wouldn't be a problem can
> enable this option, perhaps getting better performance.
> 
> The rest of the existing code proceeds as before, except as if
> SBI_FWFT_MISALIGNED_EXC_DELEG is not available, to handle any remaining
> address misaligned exceptions on a best-effort basis. The KVM SBI FWFT
> implementation is also not touched, but it is disabled if the firmware
> emulates unaligned accesses.

On a Tenstorrent Blackhole with SiFive x280 cores, with OpenSBI 1.7 and
defconfig kernel, I'm seeing a bunch of hangs/opensbi prints at boot time.
Without this patch, the boot prints this and continues on.

[    0.226339] SBI misaligned access exception delegation ok

With this patch, I see a bunch of lines like this

[    0.432225] cpu1: scalar unaligned word access speed is 0.01x byte access speed (slow)
[    0.432232] cpu0: scalar unaligned word access speed is 0.01x byte access speed (slow)
[    0.432232] cpu3: scalar unaligned word access speed is 0.01x byte access speed (slow)
[    0.432232] cpu2: scalar unaligned word access speed is 0.01x byte access speed (slow)

and depending on the boot I either see

sbi_trap_error: hart1: trap1: store fault handler failed (error -3)
sbi_trap_error: hart1: trap1: mcause=0x0000000000000007 mtval=0x0000000000000000
sbi_trap_error: hart1: trap1: mepc=0x00004000300241ec mstatus=0x0000000a00001920
sbi_trap_error: hart1: trap1: ra=0x00004000300241ec sp=0x000040003004ad40
sbi_trap_error: hart1: trap1: gp=0xffffffff81a2b090 tp=0xffffaf800227e400
sbi_trap_error: hart1: trap1: s0=0x000040003004ac80 s1=0x000040003000ef42
sbi_trap_error: hart1: trap1: a0=0x000040003004ceb0 a1=0x000040003004ad18
sbi_trap_error: hart1: trap1: a2=0x0000000000000000 a3=0xffffaf8002944089
sbi_trap_error: hart1: trap1: a4=0x00004000300241ec a5=0x0000000000000004
sbi_trap_error: hart1: trap1: a6=0x000040003004cdf0 a7=0x0000400030010d64
sbi_trap_error: hart1: trap1: s2=0x0000000000000001 s3=0x0000000000000000
sbi_trap_error: hart1: trap1: s4=0x000040003004aeb0 s5=0x0000000000000c01
sbi_trap_error: hart1: trap1: s6=0x0000000000000000 s7=0xffff8f800029b988
sbi_trap_error: hart1: trap1: s8=0xffffffff812b2fb0 s9=0xffff8f800029bae8
sbi_trap_error: hart1: trap1: s10=0x0000000000000000 s11=0x0000000000000000
sbi_trap_error: hart1: trap1: t0=0x0000040000000000 t1=0xffff8f800029bae8
sbi_trap_error: hart1: trap1: t2=0xffffffff810015e0 t3=0xffffffff819e5cb0
sbi_trap_error: hart1: trap1: t4=0x0000000000000007 t5=0x0000000000000003
sbi_trap_error: hart1: trap1: t6=0xffffffff81811d08
sbi_trap_error: hart1: trap0: mcause=0x0000000000000002 mtval=0x00000000c0102573
sbi_trap_error: hart1: trap0: mepc=0xffffffff8091f898 mstatus=0x0000000a00000920
sbi_trap_error: hart1: trap0: ra=0xffffffff800dd346 sp=0xffff8f800029b8f0
sbi_trap_error: hart1: trap0: gp=0xffffffff81a2b090 tp=0xffffaf800227e400
sbi_trap_error: hart1: trap0: s0=0xffff8f800029b900 s1=0xffffffff81897e08
sbi_trap_error: hart1: trap0: a0=0x0000000000000000 a1=0xffffffffffffffff
sbi_trap_error: hart1: trap0: a2=0x0000000000000000 a3=0xffffffff812b2fb0
sbi_trap_error: hart1: trap0: a4=0x0000000000000003 a5=0xffffffff8091f890
sbi_trap_error: hart1: trap0: a6=0x0000000000000000 a7=0xffffffff819e5ca0
sbi_trap_error: hart1: trap0: s2=0xffffaf80fe3b03a8 s3=0x0000000000000004
sbi_trap_error: hart1: trap0: s4=0xffffffff81897e08 s5=0x0000000000000000
sbi_trap_error: hart1: trap0: s6=0x0000000000000000 s7=0xffff8f800029b988
sbi_trap_error: hart1: trap0: s8=0xffffffff812b2fb0 s9=0xffff8f800029bae8
sbi_trap_error: hart1: trap0: s10=0x0000000000000000 s11=0x0000000000000000
sbi_trap_error: hart1: trap0: t0=0xffffffff81001548 t1=0xffff8f800029bae8
sbi_trap_error: hart1: trap0: t2=0xffffffff810015e0 t3=0xffffffff819e5cb0
sbi_trap_error: hart1: trap0: t4=0x0000000000000007 t5=0x0000000000000003
sbi_trap_error: hart1: trap0: t6=0xffffffff81811d08

or

[    0.252142] Oops - instruction access fault [#1]
[    0.252150] Modules linked in:
[    0.252160] CPU: 2 UID: 0 PID: 63 Comm: kworker/2:1 Not tainted 7.1.0-rc4-next-20260519 #1 PREEMPTLAZY 
[    0.252167] Hardware name: Tenstorrent Blackhole (DT)
[    0.252172] Workqueue: events check_vector_unaligned_access
[    0.252186] epc : __riscv_copy_vec_words_unaligned+0xe/0x24
[    0.252192]  ra : measure_cycles.constprop.0+0x5e/0xac
[    0.252197] epc : ffffffff8001a92e ra : ffffffff8001a3f2 sp : ffff8f80002fbca0
[    0.252201]  gp : ffffffff81a2b090 tp : ffffaf8002a41900 t0 : 0000000000000008
[    0.252204]  t1 : ffff8d80000ab708 t2 : 0000000000000008 s0 : ffff8f80002fbce0
[    0.252208]  s1 : 000000001fb5c27a a0 : ffffaf8002add561 a1 : ffffaf8002adf563
[    0.252211]  a2 : 0000000000001f80 a3 : ffffaf8002adff83 a4 : 0000000000001f80
[    0.252214]  a5 : 0000000000000072 a6 : ffffffff81036d70 a7 : ffffffff819e5ca0
[    0.252217]  s2 : ffffffffffffffff s3 : 000000000f37f1cc s4 : ffffffff8001a920
[    0.252220]  s5 : ffffaf8002adc001 s6 : ffffaf8002ade003 s7 : 0000000000000402
[    0.252223]  s8 : ffffaf80fe3c2080 s9 : 0000000000000000 s10: 0000000000000000
[    0.252227]  s11: 0000000000000000 t3 : ffffffff819e5cb0 t4 : 0000000000000007
[    0.252230]  t5 : 0000000000200b20 t6 : 0000000000000001 ssp : 0000000000000000
[    0.252233] status: 8000000200000720 badaddr: 0000400030048d30 cause: 0000000000000001
[    0.252237] [<ffffffff8001a92e>] __riscv_copy_vec_words_unaligned+0xe/0x24
[    0.252243] [<ffffffff8001a46c>] compare_unaligned_access+0x2c/0xac
[    0.252248] [<ffffffff8001a6bc>] check_vector_unaligned_access+0xb4/0x138
[    0.252253] [<ffffffff80047f6a>] process_one_work+0x10e/0x354
[    0.252258] [<ffffffff80048826>] worker_thread+0x136/0x280
[    0.252263] [<ffffffff800500ca>] kthread+0xda/0xfc
[    0.252271] [<ffffffff8001358e>] ret_from_fork_kernel+0x1a/0x154
[    0.252279] [<ffffffff80bb3d9a>] ret_from_fork_kernel_asm+0x16/0x18
[    0.252291] Code: eee3 fad5 8082 7713 fe06 cf19 86b3 00e5 72d7 cd34 (e007) 0205 
[    0.252298] ---[ end trace 0000000000000000 ]---


Sounds like previously we were relying on misaligned trap delegation
without knowing it, and now there seem to be some issues in opensbi
causing these errors.

Has anyone tested this patch on other HW? Paul, any chance you could
test this on other SiFive boards?

Regards
Anirudh Srinivasan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
