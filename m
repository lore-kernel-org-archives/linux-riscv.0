Return-Path: <SRS0=pesg=US=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9DAC31E49
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2019 11:01:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 416502070B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2019 11:01:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i9i3K9cg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 416502070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=k/2mpQX0XHj+IVgNrlVC8Wil+2PEs9D4QkYZ1lLJxv0=; b=i9i3K9cgqpO0xhZOyyimLP0Xq
	O8iqlW3aPBZyTcyUdlgZugLgEIO8/kFCbQI7yj+PF1bUkhKFOne2+FUTjHxNrJQoibriKulTLNH5H
	XMC65RHDxwBpqEzqEaMhyTQDt4wjlfaBAbuMsSo+wfvsbuGaR1kZRIo2ZGz2yUeMH5nx3bTJg03ku
	Comh4r7tWl3gLOKsTAq/Tb0N95lpJemy92aOso+pdZVgul9SkHjSvO0G+le1rJ0fL77wvd2WXCvbL
	fWfMheRg2PLVkAnPEEq154wjK4z4VGOlys74KTGXRlEEo33L/QR1cR5NwHFo3lG9wgmEqbfx4vnGK
	XsQuUoNyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdYLj-0004v1-4o; Wed, 19 Jun 2019 11:01:55 +0000
Received: from mail-pl1-f196.google.com ([209.85.214.196])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdYLg-0004uV-Iv
 for linux-riscv@lists.infradead.org; Wed, 19 Jun 2019 11:01:53 +0000
Received: by mail-pl1-f196.google.com with SMTP id t7so7069034plr.11
 for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2019 04:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Xlf2a8lhFD9eTBm8XekoLbfqJaZ5v5X3xDJ2dgvNuSI=;
 b=ixqVSHr53InqjZ+iYfCmgFg4GeDwY0g4QD9zxHp2CC87Yx5usTJW+1bDDg/9lIC8XE
 lNPYf2FOEGS0mRJGY99GUSBxedt3d5Sh5MjLMYUrKirv/8EagnCR+DicWj4G0GpagdQM
 P4Z9XE4gVs9IFuKgDzNkFTqSVVpsWqUF2LXsHyIRCZFRMNCCe9E0SsBDBcJz1EltO9CY
 /HFyEAJAwope4mupbg2piMWr90/kVoE7C4XC0yybqs2JYiI+80BRalHo5GM4Hp5KH0GW
 kQn9oMnQb8iD/xfi+foNosuWpna1r0p03hWfnzDjsMc8YjHj5sb453etLpwr2vPgoiju
 UZkw==
X-Gm-Message-State: APjAAAVj6SBWm5ax+Q62igQ+2nucRx+SM3aiEnPEFQNKSp9BJXXEm4nY
 ds1eT7aWTim/rlNahRuitNNV5w==
X-Google-Smtp-Source: APXvYqyDk7ktQTTLcjnQutrgWKcAo14p9h5Ex0FFm5EESbzbUUeU/FDOjL2g+JqE4Wnsau52QtWeeA==
X-Received: by 2002:a17:902:2f84:: with SMTP id
 t4mr75514218plb.57.1560942111365; 
 Wed, 19 Jun 2019 04:01:51 -0700 (PDT)
Received: from localhost (amx-tls3.starhub.net.sg. [203.116.164.13])
 by smtp.gmail.com with ESMTPSA id y14sm1545266pjr.13.2019.06.19.04.01.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 04:01:50 -0700 (PDT)
Date: Wed, 19 Jun 2019 04:01:50 -0700 (PDT)
X-Google-Original-Date: Wed, 19 Jun 2019 04:01:44 PDT (-0700)
Subject: Re: [PATCH] riscv: mm: Fix code comment
In-Reply-To: <1560850755-3532-1-git-send-email-shihpo.hung@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: shihpo.hung@sifive.com
Message-ID: <mhng-fc86e260-86d9-439f-a7ac-3367e858f304@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_040152_623338_91E59D79 
X-CRM114-Status: GOOD (  12.29  )
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
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 shihpo.hung@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 18 Jun 2019 02:39:15 PDT (-0700), shihpo.hung@sifive.com wrote:
> From: ShihPo Hung <shihpo.hung@sifive.com>
>
> Fix the comment since vmalloc_fault doesn't reach
> flush_tlb_fix_spurious_fault.
>
> Signed-off-by: ShihPo Hung <shihpo.hung@sifive.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: linux-riscv@lists.infradead.org
> ---
>  arch/riscv/mm/fault.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 5b72e60..f53ffd7 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -285,9 +285,6 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
>  		 * entries, but in RISC-V, SFENCE.VMA specifies an
>  		 * ordering constraint, not a cache flush; it is
>  		 * necessary even after writing invalid entries.
> -		 * Relying on flush_tlb_fix_spurious_fault would
> -		 * suffice, but the extra traps reduce
> -		 * performance. So, eagerly SFENCE.VMA.
>  		 */
>  		local_flush_tlb_page(addr);

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
