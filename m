Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F4CECAAD3
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 16:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mb5Q8ge/IKhOW8CFjU+e3AhsT/G66g1tQRR6fOInVAE=; b=hNJpmC6zcZYgX/
	e8cdlYTqcTw1ZTD68dxJvV8HstcZBIA6JbcuY59Vyrfs2qHZMG9YDErAXOdOkJqcFnbVrgjfF5PdY
	n6bhOpwaIEMJyEKRbNLvFmZVJ80z00jTdEDwmNIkdRzCFei8VAf1dpNkuj8xlxb7mH8D9qHmh+GKW
	zsmhpTVkIADfDke2/oLYFpe/m2K8dhujMX/FnLV0De8koRjPZ5UDmxSev49+46WSOdnlKS0qsLquW
	FYY4lkFEZ/0ADPF6HaaVQ/5jcY7mP6dup56Bknu6lrOIDnitZtS68PAGgY2UD0ekBA1WfNrnC2lfM
	oobdP0RJ+GnHmzeK/G/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVFBq-0071It-3T; Mon, 05 Sep 2022 16:43:14 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVCj6-0048YO-FW
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 14:05:28 +0000
Received: by mail-wr1-x432.google.com with SMTP id f15so6765149wrw.3
        for <linux-riscv@lists.infradead.org>; Mon, 05 Sep 2022 07:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=EWYn0J7WPavaTgTTHsAJLPPLXm3IrDBQA3Am2N9LKbc=;
        b=RREVlJgowp20xJl611CUIlXXcHWKHX81piHaUH+iNRrbmdAxBqM+mRvPyqsTrJOVm5
         rAEBj0DBvmLHM0bCNrTXZMo1uFl03j6iM4LnXnn/M+xhk3cP/UP5xBjm5bmyvy75ka2z
         VN2iC1WjhEHAfV5axu40Bp1qqpewT5iQOrVTQK6JP9NxOsg23/IffVgW7Zwky3zHWhs7
         MN4FqO632/rzrmpMcZXWux2L19LA5YhViqB+L+sObj3ICsQWSezoGIO9QW7zuzR9dy/H
         tdSjzdfubmcwkvrSKY5dtDY+6LMhlw4RXXjrExSJOKqkzvxboDsV3tt/mmZLrXe0Bp1U
         GA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=EWYn0J7WPavaTgTTHsAJLPPLXm3IrDBQA3Am2N9LKbc=;
        b=sfPcdT+qyux5Yr4UnMh5aNQaYiIpDCu6PLMC+JpOJP1bhrShT6abNuxezb0OMTXhn1
         q+ev/TwYBGSkDcIftIUiweH5g8ylEhasx2qOwEgkme21ss2NjSzQLFvzylx0DrfTF+eX
         nMd4D5sE7/wkaeZqTtu5AzZh/ZNPJRvMFAtEzE+Tkxd1GAd6jDfvWLYxk/lTlMVUjC4p
         0ftfy7T9Vb6s5YOgnHbQLZj/xeW8u3yAjZpjbwr2Zr7gHVPtk2/Ir5L0qgvpu1vNIhck
         JQMocQYRo3HRf0h7NpXXDoXdACgOiNlpFJ8Z6r+h2GwE01VbwP4N1I+MCLgv50pLgh28
         +yWg==
X-Gm-Message-State: ACgBeo3GaSsHrqAFw5a177pP9133Bst6lo1n+6uoRe2FFi3Zl9wdC5EN
	+L6trvh3v70CWXjLgMwywQ7d+Q==
X-Google-Smtp-Source: AA6agR5n8mXcPAFDTtcz/LoCzBHOCGeMxpW/ITe1Ff6sdYJh6aJoz+VcFowQp3QZJds50a5RRueKrw==
X-Received: by 2002:a05:6000:1d81:b0:226:fa3a:8721 with SMTP id bk1-20020a0560001d8100b00226fa3a8721mr11351511wrb.475.1662386721837;
        Mon, 05 Sep 2022 07:05:21 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id i8-20020a5d5588000000b002258956f373sm9021634wrv.95.2022.09.05.07.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 07:05:21 -0700 (PDT)
Date: Mon, 5 Sep 2022 16:05:20 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Svinval support for KVM RISC-V
Message-ID: <20220905140520.dmpbbh5fkk634leg@kamzik>
References: <20220902170131.32334-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220902170131.32334-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_070527_035589_76DF40F8 
X-CRM114-Status: GOOD (  12.67  )
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

On Fri, Sep 02, 2022 at 10:31:28PM +0530, Anup Patel wrote:
> This series adds Svinval extension support for both Host hypervisor
> and Guest.
> 
> These patches can also be found in riscv_kvm_svinval_v1 branch at:
> https://github.com/avpatel/linux.git
> 
> The corresponding KVMTOOL patches are available in riscv_svinval_v1
> branch at: https://github.com/avpatel/kvmtool.git
> 
> Anup Patel (2):
>   RISC-V: KVM: Use Svinval for local TLB maintenance when available
>   RISC-V: KVM: Allow Guest use Svinval extension
> 
> Mayuresh Chitale (1):
>   RISC-V: Probe Svinval extension form ISA string
> 
>  arch/riscv/include/asm/hwcap.h    |  4 +++
>  arch/riscv/include/asm/insn-def.h | 20 +++++++++++
>  arch/riscv/include/uapi/asm/kvm.h |  1 +
>  arch/riscv/kernel/cpu.c           |  1 +
>  arch/riscv/kernel/cpufeature.c    |  1 +
>  arch/riscv/kvm/tlb.c              | 60 ++++++++++++++++++++++++-------
>  arch/riscv/kvm/vcpu.c             |  2 ++
>  7 files changed, 77 insertions(+), 12 deletions(-)
> 
> -- 
> 2.34.1

For the series,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
