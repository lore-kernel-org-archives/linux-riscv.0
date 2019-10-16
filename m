Return-Path: <SRS0=Ypxe=YJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB2BBECE59D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2019 02:07:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E61020872
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2019 02:07:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fsRDbygJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="TuTgvHXn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E61020872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sQAD5fS0jf8oHabjeKbDZNy5rynhlQ+DpIf3vvXLeKQ=; b=fsRDbygJRFMPjp
	vNHR2P68/goV8ogLXuiy8yEK9Z7iysam4b36bmmjqA1+VaNP62k5xSYklwr8jFgzz4TMFkv6Z8ayP
	aSUUwM+liCmlthTJVrUq6xu11m8WuQREQDn45JM2e7PJ0dKhqp1Q2bdO3LFcd8GC/zQBKh9t0noY7
	D+FwsYZWbAjTWMo2uKJtpk1LBlGCVIpmqzbKy2TmcoBxdyoKSsVhxj0Dfqn6nSG7e8Czt47ZHyj4r
	G5NCcFEP7UA04su4DKDCOCseQ1jvklA8DRfDdVgb8mDuXPaXFiyjgTikWNOXe5iTsTw6koGfOu6sT
	3fDJJo22abtZEDkWgakA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKYin-0000C8-Sg; Wed, 16 Oct 2019 02:07:29 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKYik-0000B7-Od
 for linux-riscv@lists.infradead.org; Wed, 16 Oct 2019 02:07:28 +0000
Received: by mail-il1-x144.google.com with SMTP id z2so858437ilb.3
 for <linux-riscv@lists.infradead.org>; Tue, 15 Oct 2019 19:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=51zE725bGKn/TMsbEENR+3CzjGIUxaDayj5ujguNtv8=;
 b=TuTgvHXnCneheTiY92PhGPs5WuijQ83ksh7D0cAI0C9x8HFesAJhsgRelKOXXMWhPo
 OqxujUk6fNo9nnCyVfR4jMvaRh5xf4wNJB2sA24dA5vqWIOeC5QBMg28ArPEDqvaoYO/
 Xlqnm9+O+7chiIniytFR0+6+ilfWyuj1I42ho43TJElpTcx3EFSDRUjACD07pbp23Uk9
 BCeAWHUFcJGt8ndp69mhiOWm9hZZjPSIMEfubVfSaE/obSlmnea7kn8Z7cRTdh5/Qm7c
 yWzPqiQURMDSUSjD8uEawNfKYW/27caNwDVRpDlRc9RXyoK+KpM9mVvjJ5dKr1++Gjsn
 6IKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=51zE725bGKn/TMsbEENR+3CzjGIUxaDayj5ujguNtv8=;
 b=TNxy9AJ95ywaH2jQMLESAhQzE45jlfNNPZOfd6F5LiLuISXwHvrihpXA2BdSoFCKzW
 tCEv6bqOx8KzaboEwMT9902mKOXg6VTNuyVjfkSTMrKBu/wI1hfz8RJYIs+3BGkUkZBa
 uXETxG3HixvAGqjqe2tqqwGmIBS7C9gFR1W7p1fVKYkOFxTUnLSGEFpJMtHYWuIXmHfh
 ///0R0/uA6sf5bIIg6kzgqhRrFMHnWcR89RXsAcYEGkfuhxTXOG/WzxO+ulfH5hpH5WR
 eDOnWHYIqvjMe15i/RAYGciI/eOq1mSJxACXLGxLeUjEBSs7mwbyhH5kM5okESwpMhbM
 +Z3g==
X-Gm-Message-State: APjAAAW6qZGfr6tdm+GZRvAOmLe2LBJhMpa5WfhenBVrDpmpx8Boxyrg
 9G9SBms+4LHNyd97mXLCKIVapQ==
X-Google-Smtp-Source: APXvYqzIRB6Bwyz35Ayx6azyqs98nmZMFA75wpQMZvBBAVpBl4S4ChwRipQn2BBFVSTLizuvItE5jQ==
X-Received: by 2002:a92:1948:: with SMTP id e8mr9256429ilm.302.1571191640330; 
 Tue, 15 Oct 2019 19:07:20 -0700 (PDT)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id q11sm3509738ilc.29.2019.10.15.19.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 19:07:19 -0700 (PDT)
Date: Tue, 15 Oct 2019 19:07:17 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 08/20] riscv: abstract out CSR names for supervisor vs
 machine mode
In-Reply-To: <20190903093239.21278-9-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1910151902060.12675@viisi.sifive.com>
References: <20190903093239.21278-1-hch@lst.de>
 <20190903093239.21278-9-hch@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_190726_802464_8D372998 
X-CRM114-Status: GOOD (  11.65  )
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
Cc: Atish Patra <atish.patra@wdc.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 3 Sep 2019, Christoph Hellwig wrote:

> Many of the privileged CSRs exist in a supervisor and machine version
> that are used very similarly.  Provide a new X-naming layer so that
> we don't have to ifdef everywhere for M-mode Linux support.
> 
> Contains contributions from Damien Le Moal <Damien.LeMoal@wdc.com>.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>

[ ... ]

> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index fb3a082362eb..853af1b7837b 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -56,23 +56,23 @@ void show_regs(struct pt_regs *regs)
>  	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT "\n",
>  		regs->t5, regs->t6);
>  
> -	pr_cont("sstatus: " REG_FMT " sbadaddr: " REG_FMT " scause: " REG_FMT "\n",
> -		regs->sstatus, regs->sbadaddr, regs->scause);
> +	pr_cont("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
> +		regs->xstatus, regs->xbadaddr, regs->xcause);
>  }
>  
>  void start_thread(struct pt_regs *regs, unsigned long pc,
>  	unsigned long sp)
>  {
> -	regs->sstatus = SR_SPIE;
> +	regs->xstatus = SR_SPIE;

Looks like this should be "regs->xstatus = SR_PIE;"

Will update it here.  Let me know if you don't agree -


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
