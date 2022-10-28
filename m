Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C97C38A02
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 22:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=b3W4Arjjb6CzexbV3q8Qp67ROQmE2kB7Hla3OIgcsoE=; b=tiVnrXo6YIBr2J6iLDWEKfQdK+
	0ji1SY4Z7EzgXup583gi1QVjH4Q7DDUDPy44X41E+LRx6GFcn6shA6RS7OCTW9r42nE5kwpA+qMKw
	xgG6G9hQtwfzi4sZeP1wyfjvbJ3nmkNHHoSwdZkyLNpXNan1DGhapjXmQWo8vk4b1FO0FDEAVbbpe
	uYTlDnruBmI2Z8FMLeh1GOKz9ZwBlFHOPPJ6fN5GuL3CLfMoApPbCpv6lKD8DUl3Ysb2Ct4jtFBz5
	9pgSfrk1t74mazyTnTLv/VqLYN5/R6LfXqL4uorGSxkiVRrrmIMrJMnfFLOJjVFb2n4d0LIoNHgu3
	QqkQC85Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooXlA-0038ku-1d; Fri, 28 Oct 2022 22:23:28 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooXl7-0038jY-4l
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 22:23:26 +0000
Received: by mail-pf1-x431.google.com with SMTP id g62so5906029pfb.10
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 15:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFnoJJc5jH9h4ZyR1/8puw/12uZIyqbNMSZteb25A9U=;
        b=PQbmsXb2a72NLiB40rax6kZnW53XFelVILJp/xijhdqRs2/D4aDixRl81wGJ1w+0Ki
         TNaAMtHem7R0pCI7UFADgRuBa45arIsYNYd8tmnNoTACpKqeTUmT9QBb+8d1mSXVc212
         PuXO8oAVpf0MXN1wVLYKClEPJbPWVgDuv9tC/XU3NyloWN4U3muoUiNUf+edZnilZK6C
         plmObKu9DfpspMAkY9PuKZb4eqkIBGbbTCE7XodKFNksTBtDeL23eRTBsIEWikSDwVNF
         jLErOxB2wwAXvmt/H43XdkKNGBTi+43VElI4gEqHuWmlbJVxRXBfkvj/ljdcUNs882Ju
         o3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFnoJJc5jH9h4ZyR1/8puw/12uZIyqbNMSZteb25A9U=;
        b=KYHrnaiwihbftKpksxVSmtkYkC7U5aesL31PDlQwIC0eVvQaDoJmtX2zo1RaVaXEiD
         9qCviwXG92n91q5+uAJLGkLr5il5xFG+x8NO4tOOko7Zmzgpz63AoKeC6JxfrGm5oe87
         1z8wLoHXZpEJkud6Q96ZIytKXj/GfL/Zi6Mp+8g+QIfWm6cSbEDfZSlheXwXdhxAEVAt
         PMOZkouB2rRyuOupuc6aTiXFIbiAsjDMZKb4fJXEdFPp9iSPrgMSRUVxjeLarNXZw43U
         Hc7wTmaxK+s9dHi2SnFNiBCPZ1qRoyLqIM5NesdVIxG4XtMaC6vb0iV1x6Ye9JRHsz02
         hFQw==
X-Gm-Message-State: ACrzQf1DnvSQBK25asSLwV233QV2mA9UIkHrOdV5Kk3oHM8Hi9PEwVlO
	MYcUESI2Jwklgw+BpX5ANsB5dg==
X-Google-Smtp-Source: AMsMyM6qhNyvCpqBCc9JD9kPANbFBQ9f31s9FXgZAwzTnrQqHNVrj3TSSTGoMRINKP2BKoJPLBrkpw==
X-Received: by 2002:a62:7b0f:0:b0:56b:e472:9e81 with SMTP id w15-20020a627b0f000000b0056be4729e81mr1353988pfc.13.1666995802757;
        Fri, 28 Oct 2022 15:23:22 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id t3-20020a170902d14300b0017f637b3e87sm3442257plt.279.2022.10.28.15.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 15:23:21 -0700 (PDT)
Date: Fri, 28 Oct 2022 15:23:21 -0700 (PDT)
X-Google-Original-Date: Fri, 28 Oct 2022 14:51:10 PDT (-0700)
Subject: Re: [PATCH v2] riscv: fix styling in ucontext header
In-Reply-To: <Y0/PfL5SWNw8HCLr@wendy>
CC: waterdev@galaxycrow.de, Conor Dooley <conor@kernel.org>,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor.dooley@microchip.com>
Message-ID: <mhng-036eff83-1a93-4e98-9810-a4abb79e55e7@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_152325_425038_A89E774E 
X-CRM114-Status: GOOD (  19.03  )
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

On Wed, 19 Oct 2022 03:20:44 PDT (-0700), Conor Dooley wrote:
> On Wed, Oct 19, 2022 at 12:07:58PM +0200, Cleo John wrote:
>>
>> Hey, because I am new to Kernel submissions I wanted to ask if there is a way for me to see / track how far this commit has gone in the pipeline of commits?
>
> https://patchwork.kernel.org/project/linux-riscv/patch/20221010182848.GA28029@watet-ms7b87/
>
> IIRC you sent the patch during the merge window, so it wouldn't be
> applied for v6.1-rc1. You'll get an email from the patchwork-bot when it
> gets applied.

Yep, this is one of the more confusing parts of the Linux development 
process for new folks (or at least was for me when I was new): you send 
a patch and it's not super clear what's going to happen to it for a 
while.  The merge window is generally a pretty hectic time, so stuff 
like this that's not fixing a bug or adding some frameware that other 
patches depend on can kind of get lost in the shuffle.

I always feel kind of bad for folks about that, but patchwork should 
help some here as at least we can get the smaller stuff called out.

This is on for-next, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
