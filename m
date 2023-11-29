Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D72CC4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 21:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fO3oKph/y7REBZsrzq/zF94fHS0wgIgZoFNCqCnRdFU=; b=AK3UrSW1YvAnAn
	OIQFRLFdAIRMbmNVEzxuxbKlNRIA0hZZfTWCYfK+xqp8OMAxYakwhB37fZKGVVKrNV+DH7nbH5StR
	rbTqNR69R8NkJyceO+kyC/2x3ovAKQq0QcJmSHOtip5+7cqLU+FN9zW7AYmfq0F5/kmWQmOgHf7FF
	fvRXOtaw3VpIHpF9LJraTyx7kuQFlvY6K3W9zeosefFpLMviYzKN0sRPKFDxPfH5DdXZYAwFBDjzm
	3kVkMv+Kf3JZbEoovI8lX5TGsZh6Ge0116x2xE2tkSb33ACcXfLKuUnDWsPeDO9C8oW/0ejtwQJYy
	zgU86tAo3DyjdTKHdthw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8S4D-009Jgu-0o;
	Wed, 29 Nov 2023 21:25:57 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8S49-009JgC-2T
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 21:25:55 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40b4f6006d5so1775485e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Nov 2023 13:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701293150; x=1701897950; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mTMzjE/bDrmBMPdnzKtm66VHkni1QoAV3st9513yBEk=;
        b=Mp1qhAaDvV2J9k8X+qCJOt2NzUlEPDVi7CFgQYQ+3cFrZ42TPJ9n4o0PoNYIff0b1C
         Ew5jb5XqSwH1y5NCPKI+5wHr7HDkpkc1JE/mWUlPxL5VQcDGzP+fgnU5xHUVTq1dUTG/
         lnoUnuXvLWgXAbiywnTXiuF92UGu6tsdWkJ23ROX3itJ7E8ar/lp4qz5NC8ngk/sKF+S
         WaUsuyWL5yG2NWsKljMjm7CBQteK/YYbJFIBQqjQG9WNoX89REpLx8rW3yJ1U19Qrfbt
         EF9WSh6QVEF0/34iIO0NTPlT2PU/Y+rGTGA/f3gZnASPCuyvn13y779ucEgdTVDcifRI
         LJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701293150; x=1701897950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mTMzjE/bDrmBMPdnzKtm66VHkni1QoAV3st9513yBEk=;
        b=Am8foBiCFd06AuX597k7Sh+6HwW3sYRmTix8mjVwjgXkB0/+Z19zkViTXKRYrY/aft
         5gS500To4Ley6x7UZEvaEvBYS/JjixtXRMQu7g0CyT/mVEMcxZ5VGgUbiJXek1HSgvYC
         nbmrN4EabdfHzjHbAhHa2/nszDrY+Ck5pENW2bK5i1BqXIIxJb3zqKFkKS/Di5KVb9l+
         +7TUvVKeTZQxwbtAyLkRve9Q+vaXUfRU3xzK3VnvsCL0eB981EqcRdSwxZqZQvnfMX5y
         Sig0qDnp3nnDaE3bIGS1mrQqI/6NNIhFJtYhGa8l+woO4tomYAH5V/JgoryRToNqlDDx
         jNmg==
X-Gm-Message-State: AOJu0Yz7Fye5RCw/Jy8k1c56914p7p/RehF26O2RhRS4+YYTOq9fTMnE
	QVeqIpyhKjpZgXOKKGrBtr0=
X-Google-Smtp-Source: AGHT+IE+EmxWqIy+5n9+9PMwi5GnrH95AFgkASnDZh/3Csqh+4tOrWDSiqppGP+0YILlGYONVBNNkw==
X-Received: by 2002:a05:600c:1d1d:b0:40b:5008:9c0 with SMTP id l29-20020a05600c1d1d00b0040b500809c0mr3786010wms.9.1701293150284;
        Wed, 29 Nov 2023 13:25:50 -0800 (PST)
Received: from andrea ([31.189.63.178])
        by smtp.gmail.com with ESMTPSA id f15-20020a05600c4e8f00b0040b3632e993sm3442383wmq.46.2023.11.29.13.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:25:49 -0800 (PST)
Date: Wed, 29 Nov 2023 22:25:44 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: paulmck@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu, mmaas@google.com, hboehm@google.com,
	striker@us.ibm.com, charlie@rivosinc.com, rehn@rivosinc.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] membarrier: riscv: Provide core serializing command
Message-ID: <ZWesWCRAPV3rZlx9@andrea>
References: <20231127103235.28442-1-parri.andrea@gmail.com>
 <20231127103235.28442-3-parri.andrea@gmail.com>
 <91ab0210-07f9-42c4-af7f-a98799250cf7@efficios.com>
 <ZWYDtB/otYvTMZWd@andrea>
 <0a84c0e0-2571-4c7f-82ae-a429f467a16b@efficios.com>
 <ZWeDF0eHyOc/b9UJ@andrea>
 <53aac2ac-46ae-46b8-9fdf-34527b79a63b@efficios.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <53aac2ac-46ae-46b8-9fdf-34527b79a63b@efficios.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_132553_823015_5AF30F36 
X-CRM114-Status: GOOD (  21.54  )
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

> > As regards the Fixes: tag, I guess it boils down to what we want or we
> > need to take for commit "riscv: Support membarrier private cmd".  :-)
> 
> I'm not seeing this commit in the Linux master branch, am I missing
> something ?

I don't think you're missing something: I was wondering "what/where is
this commit"?  Sorry for the confusion.


> > FWIW, a quick git-log search confirmed that MEMBARRIER has been around
> > for quite some time in the RISC-V world (though I'm not familiar with
> > any of its mainstream uses): commit 1464d00b27b2 says (at least) since
> > 93917ad50972 ("RISC-V: Add support for restartable sequence").  I am
> > currently inclined to pick the latter commit (and check it w/ Palmer),
> > but other suggestions are welcome.
> 
> Supporting membarrier private expedited is not optional since Linux 4.14:
> 
> see kernel/sched/core.c:
> 
>                 membarrier_switch_mm(rq, prev->active_mm, next->mm);
>                 /*
>                  * sys_membarrier() requires an smp_mb() between setting
>                  * rq->curr / membarrier_switch_mm() and returning to userspace.
>                  *
>                  * The below provides this either through switch_mm(), or in
>                  * case 'prev->active_mm == next->mm' through
>                  * finish_task_switch()'s mmdrop().
>                  */
>                 switch_mm_irqs_off(prev->active_mm, next->mm, next);
> 
> Failure to provide the required barrier is a bug in the architecture's
> switch_mm implementation when CONFIG_MEMBARRIER=y.
> 
> We should probably introduce a new
> Documentation/features/sched/membarrier/arch-support.txt
> to clarify this requirement.
> 
> Userspace code such as liburcu [1] heavily relies on membarrier private
> expedited (when available) to speed up RCU read-side critical sections.
> Various DNS servers, including BIND 9, use liburcu.

Thanks for the information.

So I should probably stick to 93917ad50972, which apparently selected
CONFIG_MEMBARRIER on RISC-V, for the Fixes: tag in question.

I'll look into adding the membarrier feature you mention (as a final/
follow-up patch), unless you or someone else want to take care of it.

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
