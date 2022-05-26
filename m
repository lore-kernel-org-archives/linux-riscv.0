Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F98C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 15:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tcOHKBUagTQRZdQp2475X1i223WL28xYiRJ7E0cicBk=; b=be9M/p0dBbIe/j
	s/mQiwb9vSD4/lAUYiFDk2yVzwAJvzzKFEz5ZcV3U4MxZ8XvuQ7KCu5evpvCVPsO7VeHZ/AtgS5GI
	5GaGSz5iEIDFkYWjhN5A9DOSjwUjhrT1ZAD4E1Ke1E7UrYKmuR+mRmo3dkb2Bhvp9BO7fCtTFkrhd
	nHVagT4+oRi1bS8Rkx1EkyJjbwrRBSOMxl7AXY1jiLSLhkjsjWcOFRtZ/6UcW31yuZDvuoTuy0Bkr
	FqBPyF6cDKkEHnnv2dBRGmp3s+AR3XubYNVl84bqSHPxLHoca8qih89BRAaa9BI5vO+Qpoyx6PATE
	UpQgpQGqekAaX2p0ar2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuFUg-00FKPU-Ch; Thu, 26 May 2022 15:33:46 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuFUc-00FKOR-Rq
	for linux-riscv@lists.infradead.org; Thu, 26 May 2022 15:33:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 5E05FCE22C5;
	Thu, 26 May 2022 15:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A44C385A9;
	Thu, 26 May 2022 15:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653579215;
	bh=FT4RzyNJhGH1Xvs0BNepk6mODPann7y9135LL7cckyA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=saerT/+VGvOH8MzSXrAq+VXSokBG5Y3jxqeXe9/5kkx6DjMLknN7mMDFnuOEm/Ww6
	 hXStapOVvQIhG2bEqWF51SUy1np+N5e0Lq1NrGB6fXl+0tpmQkAr7vemq6IGDdretc
	 4e6+ov0k1fgwdGvWJtR2R3uKwaXjJ5o7xxK+m3DctnTnLcYlgtKeotrKxz3iwFwswd
	 G9AZq66oBVufxqZylDP8cB//xx8KA09z0AznzixoVPJG+vsPcqV6aFtRTXuJijHjdd
	 twd58GtstuCxSslhtCacTmuiBMf9AjEpfgtcPNFWhggahO1MI/MOsu947pI495kM1d
	 H+kDD6z+aWDbw==
Date: Fri, 27 May 2022 00:33:30 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Liao Chang <liaochang1@huawei.com>
Cc: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <rostedt@goodmis.org>, <peterz@infradead.org>,
 <naveen.n.rao@linux.vnet.ibm.com>, <jszhang@kernel.org>,
 <guoren@kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] riscv/kprobe: reclaim insn_slot on kprobe
 unregistration
Message-Id: <20220527003330.68f1fc0f58ecec812a7d037e@kernel.org>
In-Reply-To: <20220525014424.20717-1-liaochang1@huawei.com>
References: <20220525014424.20717-1-liaochang1@huawei.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_083343_461960_DACC668A 
X-CRM114-Status: GOOD (  16.30  )
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

On Wed, 25 May 2022 09:44:24 +0800
Liao Chang <liaochang1@huawei.com> wrote:

> On kprobe registration kernel allocate one insn_slot for new kprobe,
> but it forget to reclaim the insn_slot on unregistration, leading to a
> potential leakage.
> 
> Reported-by: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
> Signed-off-by: Liao Chang <liaochang1@huawei.com>

Looks good to me.

Fixes: c22b0bcb1dd0 ("riscv: Add kprobes supported")
Cc: stable@vger.kernel.org
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thank you,


> ---
> v2:
>   Add Reported-by tag
> 
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


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
