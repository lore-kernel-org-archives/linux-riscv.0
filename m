Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F0C2D7877A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 13:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4PBpn2cARXKFO2C8OHOWN4TUhg30w6LjaETKOgYZyU=; b=E8ZNLiCEXY8j9X
	tOdRKtMaPXPj7+LW1W4anf2Y11hNxqMav9pMgt7OPIKjQ2YWOwc8dKJvpPAbj07UC1kVOITSOr8cq
	1122qHa4Hp7KqcTiWZGkpoLSRAbtxW3oimdrFg6zLTlvFMCz66aiZzWorR10N8UDakX8ylRZd8f7j
	kFpsNb5Y9Th9145v5hMtRu+YEm15Su+cZTqiwFMLLD7d72Ps1GJuiJf0cc+a0ZykiPoAzqi1EvcuT
	Ndw7KkVmZFwbEfFVWJ0Zm7GoPyAp0F1HPmPqHGkHOrMqot95KCnEHGuYwvR2nVASAkl0WmGJa+NUc
	BUct5awZvohH2PihpSyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWar1-0000000AN78-26ME;
	Fri, 19 Dec 2025 13:49:11 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWaqz-0000000AN6h-0lYu
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 13:49:10 +0000
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail-out.m-online.net (Postfix) with ESMTP id 4dXpmK5LDPz1r2sG;
	Fri, 19 Dec 2025 14:49:05 +0100 (CET)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4dXpmH4HF4z1r2s6;
	Fri, 19 Dec 2025 14:49:03 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4dXpmH0zLYz1qqlW;
	Fri, 19 Dec 2025 14:49:03 +0100 (CET)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id E4ohm9qLVkoj; Fri, 19 Dec 2025 14:48:53 +0100 (CET)
X-Auth-Info: j2e6s1CXppbb5zYPxe4cgxoysHjyKAsYTE29A1lhOPRvTdV1SOD7vasi/J2u3d5m
Received: from igel.home (aftr-82-135-83-185.dynamic.mnet-online.de [82.135.83.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 19 Dec 2025 14:48:53 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
	id 2B70F2C18F3; Fri, 19 Dec 2025 14:48:53 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Menglong Dong <menglong.dong@linux.dev>
Cc: ast@kernel.org,  Menglong Dong <menglong8.dong@gmail.com>,
  rostedt@goodmis.org,  daniel@iogearbox.net,  john.fastabend@gmail.com,
  andrii@kernel.org,  martin.lau@linux.dev,  eddyz87@gmail.com,
  song@kernel.org,  yonghong.song@linux.dev,  kpsingh@kernel.org,
  sdf@fomichev.me,  haoluo@google.com,  jolsa@kernel.org,
  mhiramat@kernel.org,  mark.rutland@arm.com,
  mathieu.desnoyers@efficios.com,  jiang.biao@linux.dev,
  bpf@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-trace-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org
Subject: Re: [PATCH bpf-next v3 3/6] bpf: fix the usage of
 BPF_TRAMP_F_SKIP_FRAME
In-Reply-To: <1948844.tdWV9SEqCh@7950hx> (Menglong Dong's message of "Fri, 19
	Dec 2025 21:31:13 +0800")
References: <20251118123639.688444-1-dongml2@chinatelecom.cn>
	<875xa2g0m0.fsf@igel.home> <5070743.31r3eYUQgx@7950hx>
	<1948844.tdWV9SEqCh@7950hx>
Date: Fri, 19 Dec 2025 14:48:53 +0100
Message-ID: <87cy4aeg56.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_054909_388775_ABF6CB53 
X-CRM114-Status: GOOD (  10.79  )
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

On Dez 19 2025, Menglong Dong wrote:

> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index 5f9457e910e8..09b70bf362d3 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c
> @@ -1134,7 +1134,7 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
>  	store_args(nr_arg_slots, args_off, ctx);
>  
>  	/* skip to actual body of traced function */
> -	if (flags & BPF_TRAMP_F_ORIG_STACK)
> +	if (flags & BPF_TRAMP_F_CALL_ORIG)
>  		orig_call += RV_FENTRY_NINSNS * 4;

There are now three occurrences of that condition, and only the third
one uses orig_call.  How about merging them?

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
