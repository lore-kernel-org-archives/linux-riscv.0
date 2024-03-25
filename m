Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC04C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 20:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vYkUwroXbr74jQpeFFd4DYwmblI4NrYk/rDyJpkR8Ww=; b=zLPD68iBzBQxbr
	FlDE5899Gs7IaIaWrw7mQVw8sh7HCN9oOSQDyeOv9YFNmn3AHCc1LNBlTLINQbJkd/XzyDp6JxQ2/
	2s4owCtu4OEkW8Gc3XlidxgLUPSWUI0cWFNuvQwL26JkfTDTUZ+o0A5IoGrimyb08XJk6r0e/LwHM
	FqG7/E+4qxoWky6WnFgsRuHMwSqZKFZRd4P5o5r3ng+aWxJGck15iMdgLcR5li0xnWWGd9edCFxMp
	YGvV0QnHV+44a3+LWqb3ZR1B2DpwHqzL5ooy5QyuUoO/o3Ha0uimcRdZ4xmXWFK/6qMFxueHQCyoQ
	mO3gmq3wXJh0MrXlkxGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rorHO-00000001u0C-1tUk;
	Mon, 25 Mar 2024 20:50:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rorHK-00000001tyT-1DHB
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 20:50:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8339E61189;
	Mon, 25 Mar 2024 20:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCCEEC433C7;
	Mon, 25 Mar 2024 20:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711399845;
	bh=nwpWNJ7Rq9nWxFjGUbTYvZ8rrXcuvUx4PD8XjiRJP98=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=SB97ZrcSI2pLHFXsw+oj5amBylNVmymv+FPWWcYtfpoQwYznb+o7ooG/Q3UrhCMmR
	 NrnumCMSzASq3eFhi1FVniahuIvABwjhcof2L3TyuOkd5noG3RnHb5DGz0H6KDQR0k
	 uSxFsmyYmAg5xxTllnUFXfTCF+lWEojUu7QSlTfAyfbm0oVX1+G5kZKgI5LEK3Dgw0
	 A1GOKSqg8lOw1Jr3snDb103h8/CwoNAW6HSWvRJzDqTI3djLJwxF+4fLBRdGHclh7m
	 ZL7SFlRWjjEsbXsFXa5gIhRFaDusjA+RfF6fU5C5NQoF8SBF7Ig8OH2HY1O66R7ltU
	 s8lO9DVr9bvkw==
Mime-Version: 1.0
Date: Mon, 25 Mar 2024 22:50:40 +0200
Message-Id: <D034M18D63EC.2Y11D954YSZYK@kernel.org>
Cc: "Masami Hiramatsu" <mhiramat@kernel.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, <linux-modules@vger.kernel.org>, "Naveen
 N . Rao" <naveen.n.rao@linux.ibm.com>, "Anil S Keshavamurthy"
 <anil.s.keshavamurthy@intel.com>, "David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH v3 1/2] kprobes: textmem API
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, <linux-riscv@lists.infradead.org>
X-Mailer: aerc 0.17.0
References: <20240325203755.1811-1-jarkko@kernel.org>
In-Reply-To: <20240325203755.1811-1-jarkko@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_135046_388815_F10B8507 
X-CRM114-Status: UNSURE (   5.24  )
X-CRM114-Notice: Please train this message.
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

On Mon Mar 25, 2024 at 10:37 PM EET, Jarkko Sakkinen wrote:
> -	if (ret == -ENOENT && !trace_kprobe_module_exist(tk)) {
> +#ifdef CONFIG_MODULES
> +	if (ret == -ENOENT && trace_kprobe_module_exist(tk))
> +		ret = 0;
> +#endif /* CONFIG_MODULES */

For this we could have

#ifndef CONFIG_MODULES
#define trace_kprobe_module_exist(tk) false
#endif

That would clean up at least two locations requiring no changes. Should
I go forward this or not?

BR, Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
