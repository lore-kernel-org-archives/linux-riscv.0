Return-Path: <SRS0=rJkP=WC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E797C31E40
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2019 21:55:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CF682173C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2019 21:55:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GCsTsPkU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="nC2RK+wj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CF682173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ArmDXeNry/mckLQjPImDUuKvWckDuRzAJNIWA7yLJUk=; b=GCsTsPkUSBpzj0
	ZjLWEJP9quxQoUQnlNJ8JDtAw4XoHy46PqpWPjZF7YT95QxdgHS+2bcpAu8GVfNdJMpQut/fe2XSq
	LjB0evb7QMngaMwukoqTktcejTsTyZah7As8Zc+lf/Z+wScCTitKXqQ39OeRmo57BvX5n0o2WN06Z
	c602h/wnf7a5PHKnUmaQSj5oioD5EV0/8rh3Qf/BbqdWJ5eYQc0jhks1cCrMRbY5NWsPpNmArnKQd
	4GI3ZMIpv2y92q/sOrcms/DuHFM2hRG1P/RaD7BAsZdcYo22TVQ+YjKiBllT5voe5l/IuTJDk/hsg
	nvaFX5g0kDUP9SFusWfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hv7Q1-0001Mq-U1; Tue, 06 Aug 2019 21:54:57 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hv7Pz-0001Lr-7j
 for linux-riscv@lists.infradead.org; Tue, 06 Aug 2019 21:54:56 +0000
Received: by mail-ot1-x344.google.com with SMTP id q20so96270912otl.0
 for <linux-riscv@lists.infradead.org>; Tue, 06 Aug 2019 14:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=e0N0ZZ7gbRhdL+UK8EX1dMgG/3bO/cb7jXRFzExUL4k=;
 b=nC2RK+wjbSKbABdylLiYJMYOsFyEaY+iXsRPvSPywyopW3IGcH2lgAojRCNmpiStVL
 zZYaAtNAnpiMxnK1MpKnaUChgb3VqZ5jtmBfmbv6GIQXd4RHouKZ1RwGKGSFTwENK2Gu
 CdYxLb5F44BiYphtIhsfrdBL/XR3rPypAqjPWi4GEwj8Ql8mYTJvQFS/5l82Xbp2sQNU
 IJfybu+HiA8Rzx1717EYb+nbJVTaOUTfNhq4nq4vsiwoLg/bcTL6duKfQwWMfvzOxFzJ
 gC6aZfHv2hwKrTzOH0+vWrpHBmFbcJylo+X4DmM0Gl7/X40VjmJfhWM9fhWbHYSpk2XK
 crzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=e0N0ZZ7gbRhdL+UK8EX1dMgG/3bO/cb7jXRFzExUL4k=;
 b=Qe/0q+wLYxyQ1wRIodH5towdziWcSBGQSKg1GMF2U4NxRdHnUGxL/RM4i8QJMCchTm
 +itIaZtnMOUbIGJldPqu3kiAldwnA6bbgLZg3KVXqsvPZaew6okqO/ViWo0V+BnCamuJ
 Vla/JKLPho+35Lsnq4HdQoCB8nK4eviptOLI5bXkFA276C/xqEPs45cHMRzXOJm/rFH8
 TOmhb/lu5XV3FTfrE1fUyAQpss13pWwGw/JpLfMi4gCHvd+3SxOTymO9mHAOUhAwQua6
 QpV7IFrdX+BQXDXT1T3whajVj2IrFM5dbGdJojXt6nKm/hjKsmGHLk8iM+oW0B6K1uhn
 WHqg==
X-Gm-Message-State: APjAAAW3GgHHaWbs56Csrw8bbIorz9f/tIpeV+ZIClBFSrQOROh33rC6
 vZwpqtsBqeFMw2bgQ2sATCOQrA==
X-Google-Smtp-Source: APXvYqzPVNaDRTXzYBHYAB33LLYEDUma/TzBsb06XC691qDzmkvhh49XRDXuGu0MTeDKJrnOkXJJAg==
X-Received: by 2002:a6b:1ca:: with SMTP id 193mr6162600iob.264.1565128490422; 
 Tue, 06 Aug 2019 14:54:50 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 e26sm71330428iod.10.2019.08.06.14.54.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 14:54:50 -0700 (PDT)
Date: Tue, 6 Aug 2019 14:54:49 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>
Subject: Re: [PATCH v4 2/4] RISC-V: Add riscv_isa reprensenting ISA features
 common across CPUs
In-Reply-To: <20190803042723.7163-3-atish.patra@wdc.com>
Message-ID: <alpine.DEB.2.21.9999.1908061452570.13971@viisi.sifive.com>
References: <20190803042723.7163-1-atish.patra@wdc.com>
 <20190803042723.7163-3-atish.patra@wdc.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_145455_280476_2B2AFF67 
X-CRM114-Status: GOOD (  11.08  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Alan Kao <alankao@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
 Enrico Weigelt <info@metux.net>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Anup, Atish,

On Fri, 2 Aug 2019, Atish Patra wrote:

> From: Anup Patel <anup.patel@wdc.com>
> 
> This patch adds riscv_isa integer to represent ISA features common
> across all CPUs. The riscv_isa is not same as elf_hwcap because
> elf_hwcap will only have ISA features relevant for user-space apps
> whereas riscv_isa will have ISA features relevant to both kernel
> and user-space apps.
> 
> One of the use case is KVM hypervisor where riscv_isa will be used
> to do following operations:
> 
> 1. Check whether hypervisor extension is available
> 2. Find ISA features that need to be virtualized (e.g. floating
>    point support, vector extension, etc.)
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Do you have any opinions on how this patch might change for the Z-prefix 
extensions?  This bitfield approach probably won't scale, and with the 
EXPORT_SYMBOL(), it might be worth trying to put together a approach that 
would work over the long term?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
