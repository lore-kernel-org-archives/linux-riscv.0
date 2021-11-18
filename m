Return-Path: <SRS0=Kh2H=QF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E1C8C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 18:23:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BC3761AA2
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 18:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2BC3761AA2
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C8wyC5Cn0GoX0ByloQfYZuO8humEW8J2ORFJ7PjQz4s=; b=GRgnfFHOFlP+wH
	QWtyOtQv5JYYOxgLR5chJjmFsEpB9tohmOYPt2Vcen8Or90vyu3U7cy853Ds1NqY0A2W5lVV4W9yv
	CU4IE95JK/hshmxXnvhT+yVadxt84zbsal1OSHep/PsuyCI5s+2EGCnAMHPWNXDHGc65hDVZbaXYL
	FjDWuOAOoA5zt6hcoo+wCwCxeES7/sOPz8CZAsllGkwRQ9MoJR0uIr+SJcLvetrul44eTuQgjgK3S
	a+GQ3wqO/fkF2z/FCUFD47yPErsr+B+95v3BqQOZCBMA+ImVLSH2cJ2oH0aH+mOyqlUvFGBoorIGn
	7ma5bYLidf0jJgQVb+dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnm3l-008XrN-3A; Thu, 18 Nov 2021 18:22:57 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnm3i-008XpO-Vz
 for linux-riscv@lists.infradead.org; Thu, 18 Nov 2021 18:22:56 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 28so6134292pgq.8
 for <linux-riscv@lists.infradead.org>; Thu, 18 Nov 2021 10:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RxXagynv4ZtTxwDXTPjZYaISy3py26voDBtBw3aaQgQ=;
 b=OBlnJC4k1myvVeYu1NZFyNQ7qs/DclyrajXgQLwlwDdvyrZ1+s9GpJL+W34aT1uHku
 J9wZKd+02F7Er09DCXIA4DItiSZshXGnoeLLFc0LEv1itHvrGlrNwc86GwZ+//C5msRa
 QQXoaNdT+OSK2tLxMzOUcYsIV1YXz0/Nmu3cNVd2SO5kWEG6YrMHl8I0nbd9mg3BjspR
 NIo0GdtkntdAdN9EIj31GsTeZ5hB8HliqHEFc0AJ0e/ZfzHWSdsq8Gh9tPPV2zL4ofso
 VSK22FsK0SEiEcRe50ecyel1PB1xFbX31kTsaXpkN/sYQYsin8zVD07JdS1VXFcMUG7O
 t9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RxXagynv4ZtTxwDXTPjZYaISy3py26voDBtBw3aaQgQ=;
 b=mQILG0HK2EXnzXP6fy+CqYR5/1rzwrYT3UT0vPcvvXzeO4ZCe4EgrCSCFNJ9bO889L
 6XOTshN9fyR+R/VHVoiuRpFAf3f83cUYp1IZrhHXPysefMalmrjHgdWpFB8eZQwlxpHz
 F+aLiJGwEowZsWGjnjwmaKzeDnS+x672PLqhAVnP/0l7d7/X+Bka4dFVVooeOE8VSluo
 8j8vqJbb2LRnCCp/C6cWEaVl3YLRgpbrFktO/2v+u37cMs7TxRoUwK/m5PVf4usvNVpJ
 lvbFlbBn0mgHc2WfYQORvjuK4QA73/tJWv1U4zMe3QGE2jyBQjzY5OevHMIUeoF6+JZm
 rt6w==
X-Gm-Message-State: AOAM532wBtlUHjnDBDvivQ3OjCfY9jtp0puXqhpOrryNH2M2JCAQJDWf
 r/hQLbFSYlowhO7yTeRBJjlUxw==
X-Google-Smtp-Source: ABdhPJyTh37LpHwXrN+6deoifsV0BNizkbqHIu8tIW6La8IWWgSK2j8DxntCks4HzMc3Ez+BucvBTw==
X-Received: by 2002:a63:6945:: with SMTP id e66mr12760455pgc.9.1637259768283; 
 Thu, 18 Nov 2021 10:22:48 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id i68sm264849pfc.158.2021.11.18.10.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 10:22:47 -0800 (PST)
Date: Thu, 18 Nov 2021 18:22:44 +0000
From: Sean Christopherson <seanjc@google.com>
To: Atish Patra <atishp@atishpatra.org>
Cc: linux-kernel@vger.kernel.org, anup.patel@wdc.com, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: Update Atish's email address
Message-ID: <YZaZ9KxEz+GVjH7q@google.com>
References: <20211118060501.932993-1-atishp@atishpatra.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211118060501.932993-1-atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_102255_050239_B7A519AB 
X-CRM114-Status: GOOD (  13.27  )
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

On Wed, Nov 17, 2021, Atish Patra wrote:
> I no longer employed by western digital. Update my email address to
> personal one.
> 
> Signed-off-by: Atish Patra <atishp@atishpatra.org>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7a2345ce8521..b22af4edcd08 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10434,7 +10434,7 @@ F:	arch/powerpc/kvm/
>  
>  KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)
>  M:	Anup Patel <anup.patel@wdc.com>
> -R:	Atish Patra <atish.patra@wdc.com>
> +R:	Atish Patra <atishp@atishpatra.org>
>  L:	kvm@vger.kernel.org
>  L:	kvm-riscv@lists.infradead.org
>  L:	linux-riscv@lists.infradead.org
> -- 

Please add an entry in .mailmap as well.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
