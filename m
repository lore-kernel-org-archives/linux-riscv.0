Return-Path: <SRS0=Dv9V=MQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A08C4338F
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jul 2021 00:58:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AA8A60EB5
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jul 2021 00:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9AA8A60EB5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=TxNFtdAp74k0Z4WZa4Zta4ESHHs9dgsrPQRBQQJQ+go=; b=sjUM9wHOIng0Y5x8cTZelvYIIN
	RDwB0niYI+E9g68g/9VpSmHRkejocfsg/q+zEJl29JBHmh8D4PaeF8seloWMvB/2u1qt6KBRBefSB
	k4NQGD4mpzZUkgVb4u22KbZVke1x06eyBT/Om3t3iThQwARMpLx4RHpXG6yOONKmnylQdFcPsmFXf
	Y/mh6XC7wm78RJJtAGWBHprP3c/7oDDZorpLl/+NATg4VJzy/Wuo8hNWlI6EhvpS/Ocbici4huIj5
	Z+cv8D206wva/qOaF6cierIRUL8RG/W+jwuEDsrKF55p0JipCGWZuAd+1Oq7hvt2Gam+Kb5eSFNzu
	T82nBl0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m75zc-006UUm-Ov; Sat, 24 Jul 2021 00:58:16 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m75zY-006UIB-4T
 for linux-riscv@lists.infradead.org; Sat, 24 Jul 2021 00:58:13 +0000
Received: by mail-pj1-x1035.google.com with SMTP id j1so4545961pjv.3
 for <linux-riscv@lists.infradead.org>; Fri, 23 Jul 2021 17:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=vCPnA7IeT+1hjcpO3XpnPqAK8HPq6UrGaHaA0kO+qzY=;
 b=M+kZLvEoxZ29UvAOrnVgnF3KSsbu1JRIGRWRoSp5bf9EwJANF6nEj+Z58uDplkpHsL
 qn/w2qY7ASgP7n+BV5JliL7bBivpzL4LxMoQNnsZOVFCqFQV+81eRjBzNe3qCbryzqUg
 kEUq2efMky5Y5w+5iuwLfFNVN+18ryT4xzuebxd78O3fl1BzATSiZOArFXdQwaHhUca+
 h/mg/8aB8WTkbNhPMHkgCAJTlYkcnh8I3Y0rWdEtkTKDNalBTiPaPlNm/MPOy7eeHt72
 L6eVBpgvPSBF344a+uGbLwZVwhDn+zYT4VUs5IdIRoHHYIRoLPCV2dOfE6FCMzvMiKK4
 5nvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=vCPnA7IeT+1hjcpO3XpnPqAK8HPq6UrGaHaA0kO+qzY=;
 b=ghm7iWNeEKNmAbkPBbRoX2RXbWsJQgCMWnKuuCex0DhCU1sTwJI6hAqHzUcUHafbhL
 RB4UWYdCaiRAoqCjFa7aP4Wiq4Xv0Uu5sXLliTAKkEAEhEKiv9rT5Qzm/TVBkMwFSRqU
 XjXOZAhqlqdSfxM8Lj93NdHcXYs3sLcBypNL5osQJvuSneNBLZayBbtijU19OTh99meS
 CdOxn+PYNvWWxWTZOge0WK3S/22sFkdwrSpFooOJUdx+/kUb6Bi1CJQexuCKgQxDgDml
 AXWRktyOnYtOHO8luv3a2p/QDaOvDQW9dkvZkaCnaz8F3QT91RjAxsulLAP76scFREOs
 mDag==
X-Gm-Message-State: AOAM532qXXE7m+/gcxehbmoeDWC4mhh8xg3jwIDIRcl5tsDfTqBVjBkZ
 GH0U/QofnoMUoryIFWomQWvjZw==
X-Google-Smtp-Source: ABdhPJxIBNPvadCNK7jQpm/kPWrtZmYT1yF1DSR9HmcCxzy24G3S/GGCR15AWv4T0egdgTvfp2lqqw==
X-Received: by 2002:aa7:93cd:0:b029:328:9d89:a790 with SMTP id
 y13-20020aa793cd0000b02903289d89a790mr6783536pff.71.1627088291326; 
 Fri, 23 Jul 2021 17:58:11 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id e3sm30458869pjw.20.2021.07.23.17.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 17:58:10 -0700 (PDT)
Date: Fri, 23 Jul 2021 17:58:10 -0700 (PDT)
X-Google-Original-Date: Fri, 23 Jul 2021 17:43:59 PDT (-0700)
Subject: Re: [PATCH] riscv: stacktrace: pin the task's stack in get_wchan
In-Reply-To: <20210723082226.7b7b4707@xhacker>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 schwab@linux-m68k.org, atishp@atishpatra.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang3@mail.ustc.edu.cn
Message-ID: <mhng-cf2c0120-e598-4cfe-b76e-aba76b722f19@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_175812_222065_1E22611B 
X-CRM114-Status: GOOD (  19.72  )
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

On Thu, 22 Jul 2021 17:22:26 PDT (-0700), jszhang3@mail.ustc.edu.cn wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> Pin the task's stack before calling walk_stackframe() in get_wchan().
> This can fix the panic as reported by Andreas when CONFIG_VMAP_STACK=y:
>
> [   65.609696] Unable to handle kernel paging request at virtual address ffffffd0003bbde8
> [   65.610460] Oops [#1]
> [   65.610626] Modules linked in: virtio_blk virtio_mmio rtc_goldfish btrfs blake2b_generic libcrc32c xor raid6_pq sg dm_multipath dm_mod scsi_dh_rdac scsi_dh_emc scsi_dh_alua efivarfs
> [   65.611670] CPU: 2 PID: 1 Comm: systemd Not tainted 5.14.0-rc1-1.g34fe32a-default #1 openSUSE Tumbleweed (unreleased) c62f7109153e5a0897ee58ba52393ad99b070fd2
> [   65.612334] Hardware name: riscv-virtio,qemu (DT)
> [   65.613008] epc : get_wchan+0x5c/0x88
> [   65.613334]  ra : get_wchan+0x42/0x88
> [   65.613625] epc : ffffffff800048a4 ra : ffffffff8000488a sp : ffffffd00021bb90
> [   65.614008]  gp : ffffffff817709f8 tp : ffffffe07fe91b80 t0 : 00000000000001f8
> [   65.614411]  t1 : 0000000000020000 t2 : 0000000000000000 s0 : ffffffd00021bbd0
> [   65.614818]  s1 : ffffffd0003bbdf0 a0 : 0000000000000001 a1 : 0000000000000002
> [   65.615237]  a2 : ffffffff81618008 a3 : 0000000000000000 a4 : 0000000000000000
> [   65.615637]  a5 : ffffffd0003bc000 a6 : 0000000000000002 a7 : ffffffe27d370000
> [   65.616022]  s2 : ffffffd0003bbd90 s3 : ffffffff8071a81e s4 : 0000000000003fff
> [   65.616407]  s5 : ffffffffffffc000 s6 : 0000000000000000 s7 : ffffffff81618008
> [   65.616845]  s8 : 0000000000000001 s9 : 0000000180000040 s10: 0000000000000000
> [   65.617248]  s11: 000000000000016b t3 : 000000ff00000000 t4 : 0c6aec92de5e3fd7
> [   65.617672]  t5 : fff78f60608fcfff t6 : 0000000000000078
> [   65.618088] status: 0000000000000120 badaddr: ffffffd0003bbde8 cause: 000000000000000d
> [   65.618621] [<ffffffff800048a4>] get_wchan+0x5c/0x88
> [   65.619008] [<ffffffff8022da88>] do_task_stat+0x7a2/0xa46
> [   65.619325] [<ffffffff8022e87e>] proc_tgid_stat+0xe/0x16
> [   65.619637] [<ffffffff80227dd6>] proc_single_show+0x46/0x96
> [   65.619979] [<ffffffff801ccb1e>] seq_read_iter+0x190/0x31e
> [   65.620341] [<ffffffff801ccd70>] seq_read+0xc4/0x104
> [   65.620633] [<ffffffff801a6bfe>] vfs_read+0x6a/0x112
> [   65.620922] [<ffffffff801a701c>] ksys_read+0x54/0xbe
> [   65.621206] [<ffffffff801a7094>] sys_read+0xe/0x16
> [   65.621474] [<ffffffff8000303e>] ret_from_syscall+0x0/0x2
> [   65.622169] ---[ end trace f24856ed2b8789c5 ]---
> [   65.622832] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/kernel/stacktrace.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
> index ff467b98c3e3..ac7593607fa6 100644
> --- a/arch/riscv/kernel/stacktrace.c
> +++ b/arch/riscv/kernel/stacktrace.c
> @@ -132,8 +132,12 @@ unsigned long get_wchan(struct task_struct *task)
>  {
>  	unsigned long pc = 0;
>
> -	if (likely(task && task != current && !task_is_running(task)))
> +	if (likely(task && task != current && !task_is_running(task))) {
> +		if (!try_get_task_stack(task))
> +			return 0;
>  		walk_stackframe(task, NULL, save_wchan, &pc);
> +		put_task_stack(task);
> +	}
>  	return pc;
>  }

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
