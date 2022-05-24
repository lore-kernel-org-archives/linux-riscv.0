Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D50C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 24 May 2022 15:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PrQqbDmfJmtS8vqBtifBm/TqCVdcaioaet3KqHUagrA=; b=4pRF6FOYPJ2xtA
	2l6mk3umVFcs0PahuQFnHvFfNUrs8wQvl3jYEDlQc/tIbpzbT3cMKTLSv77blRN6Op5TauYybgCgd
	YTgjoaKHqesMN2RebFhXvcJ927rSHlvpBC/x0o78gXH389eyG/8LTmbdFW1xagde4dhknA97xJK1R
	aUssvqOKekdabY1914fCwkC9VxxdqUHa4GJLzHjZ21CZTxuSFov0OUBKxpazNnGI8JYDIAdjPxb/c
	SxKC914biiiSPaXsPCdC7QMgLSCbmckgrmQN2i0lCDhUDGkynBBQ48krujUcp1wPPT5B49lKZDFkk
	yhCBRL5fCD5mKACFK5Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntWLc-008QA1-Ku; Tue, 24 May 2022 15:21:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntWLZ-008Q8j-VD
 for linux-riscv@lists.infradead.org; Tue, 24 May 2022 15:21:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DBA736170E;
 Tue, 24 May 2022 15:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E198C34115;
 Tue, 24 May 2022 15:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653405680;
 bh=wbKQ2m0zStxrwKVrhRcUOORtvQoLUD745FXYrf3v+NU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vQaqWjmbvwgE/Olkgr9/EUuu7JXEZRDNPCDc0u6VgAvSy5+DGzFLL2zWWZFPNxDVe
 YIEVZ8jH9ZZBli2pZZJTCLfVsXb5vw+mlCuXHE3PX6qqrzM6A2Phlynuaryr1nS3nO
 t//i9rRGFPNJ1M/XLlDrrVP+2jM9vJqBHI9xVRBN3Vr3Y03x322QQFUvTHxa18TR49
 EPRQsF0s5mI14wedeKtXtSr8pd7DjIgn+Xa7E7+Uvm78lHYBJcfczMaEeP5hbXjnhM
 KJdb38SniAPvPyRoO9pNyHFm6BaqGjkr4sJmETdDNw/mS6KHAJ5A+B/VNHmipFdI/J
 zvpXsHA/jN7Dg==
Date: Tue, 24 May 2022 23:12:41 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Liao Chang <liaochang1@huawei.com>, Guo Ren <guoren@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 mhiramat@kernel.org, rostedt@goodmis.org, peterz@infradead.org,
 naveen.n.rao@linux.vnet.ibm.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/kprobe: reclaim insn_slot on kprobe unregistration
Message-ID: <Yoz16RUZvfyxmywT@xhacker>
References: <20220523015124.98743-1-liaochang1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220523015124.98743-1-liaochang1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_082122_081599_20432948 
X-CRM114-Status: GOOD (  18.00  )
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

On Mon, May 23, 2022 at 09:51:24AM +0800, Liao Chang wrote:
> On kprobe registration kernel allocate one insn_slot for new kprobe,
> but it forget to reclaim the insn_slot on unregistration, leading to a
> potential leakage.

+ Guo Ren

Nice catch! I think csky needs the fix as well.

> 
> This bug reported by Chen Guokai <chenguokai17@mails.ucas.ac.cn>.

This needs a "Reported-by: ..." tag

> 
> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> ---
>  arch/riscv/kernel/probes/kprobes.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
> index e6e950b7cf32..f12eb1fbb52c 100644
> --- a/arch/riscv/kernel/probes/kprobes.c
> +++ b/arch/riscv/kernel/probes/kprobes.c
> @@ -110,6 +110,10 @@ void __kprobes arch_disarm_kprobe(struct kprobe *p)
>  
>  void __kprobes arch_remove_kprobe(struct kprobe *p)
>  {
> +	if (p->ainsn.api.insn) {
> +		free_insn_slot(p->ainsn.api.insn, 0);
> +		p->ainsn.api.insn = NULL;
> +	}
>  }
>  
>  static void __kprobes save_previous_kprobe(struct kprobe_ctlblk *kcb)
> -- 
> 2.17.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
