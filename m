Return-Path: <SRS0=t+eB=NN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85615C32789
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 13:10:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 495E22081F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 13:10:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l8zmTxO0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YNfbpLCs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 495E22081F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZJFErtz2IhckaNS9E4uwG/xiXZNEdNANmQi9TB62m0s=; b=l8zmTxO02TzzIv
	MSYT51aL96ujlWV5Qq1XesLu2GxM6agBm1ccxCaS/YAMzEnt1G4bCwWigWTkctSnkXPGAZFyxFGHt
	frMEMiSm1qZF8tkn110Ngp17eGMrJJCYRYD/6mC/AGdfFJy9EynUHtxrEBAC+oQ4BlDgXYs/5n6Mw
	aSHZcLN+Uormeu9gdeCCsARZJiad8x/6ycLaHbSFRhV/g4Xlx8M5zTdC+pGqK41aPajqI10RrInq4
	6zaqcivY5BUTWuZJ77RJUEfjNMe+hv366lArjiwcdiQe/YiiUxb5pQxUAWiit90EnOdpramfQfni9
	Pbd3hMMHcnbGoCW6lPYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIZDD-0006C9-4Z; Fri, 02 Nov 2018 13:10:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIZD8-0005Zp-Sm
 for linux-riscv@lists.infradead.org; Fri, 02 Nov 2018 13:10:04 +0000
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AC4EB20837
 for <linux-riscv@lists.infradead.org>; Fri,  2 Nov 2018 13:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1541164191;
 bh=qMZ9pyvPPpltF8qgL0zVw3Rg77DcLSobc/0euP13IuA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YNfbpLCsCdgkYETVweEENx2a5g4v6uDlZI0ZuR5jKt1z6kq91OotgOiOfYRCOtwb1
 J035zvN6THkJOvhI36eG8c3LZag2Xw2fY0SMyu8Pq2QuiLv5jlKl/ddlqYlofPqk+t
 +Eh6xJR0U5sdMqrgTltaxid+bSJ24QNRt0TCcWXI=
Received: by mail-qk1-f170.google.com with SMTP id u68so2854017qkg.9
 for <linux-riscv@lists.infradead.org>; Fri, 02 Nov 2018 06:09:51 -0700 (PDT)
X-Gm-Message-State: AGRZ1gLB9x9tvVkpGvmMkqpX9oiIScFzit3GF47fb0vCDXo+q8qk5wdW
 9WtWrRIPBHPnlakKB0Vpxj4tciJmBDabSBe6eA==
X-Google-Smtp-Source: AJdET5fPJYXS2sBya7lPKKnVQ5AnzKv0C8Klbp4k5H63CRRYLQnLTZmy2NOavro+b86ZqPrV/CPOAROUkwRKGIu7oAM=
X-Received: by 2002:a0c:9e05:: with SMTP id p5mr10685349qve.246.1541164190826; 
 Fri, 02 Nov 2018 06:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
 <1541113468-22097-2-git-send-email-atish.patra@wdc.com>
In-Reply-To: <1541113468-22097-2-git-send-email-atish.patra@wdc.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 2 Nov 2018 08:09:39 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+wProNynprMjQnrz1jmbZT9TmmA-_=vPUxCEED_8xONg@mail.gmail.com>
Message-ID:
 <CAL_Jsq+wProNynprMjQnrz1jmbZT9TmmA-_=vPUxCEED_8xONg@mail.gmail.com>
Subject: Re: [RFC 1/2] dt-bindings: topology: Add RISC-V cpu topology.
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181102_061002_982621_AD6E0C6D 
X-CRM114-Status: GOOD (  22.71  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 Damien.LeMoal@wdc.com, alankao@andestech.com, Zong Li <zong@andestech.com>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181102130939.0VM007lw3PMYY9vdNwzz55x5pB7nMCaiLbeyEdVL22E@z>

On Thu, Nov 1, 2018 at 6:04 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> Define a RISC-V cpu topology. This is based on cpu-map in ARM world.
> But it doesn't need a separate thread node for defining SMT systems.
> Multiple cpu phandle properties can be parsed to identify the sibling
> hardware threads. Moreover, we do not have cluster concept in RISC-V.
> So package is a better word choice than cluster for RISC-V.

There was a proposal to add package info for ARM recently. Not sure
what happened to that, but we don't need 2 different ways.

There's never going to be clusters for RISC-V? What prevents that?
Seems shortsighted to me.

>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  .../devicetree/bindings/riscv/topology.txt         | 154 +++++++++++++++++++++
>  1 file changed, 154 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/topology.txt
>
> diff --git a/Documentation/devicetree/bindings/riscv/topology.txt b/Documentation/devicetree/bindings/riscv/topology.txt
> new file mode 100644
> index 00000000..96039ed3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/topology.txt
> @@ -0,0 +1,154 @@
> +===========================================
> +RISC-V cpu topology binding description
> +===========================================
> +
> +===========================================
> +1 - Introduction
> +===========================================
> +
> +In a RISC-V system, the hierarchy of CPUs can be defined through following nodes that
> +are used to describe the layout of physical CPUs in the system:
> +
> +- packages
> +- core
> +
> +The cpu nodes (bindings defined in [1]) represent the devices that
> +correspond to physical CPUs and are to be mapped to the hierarchy levels.
> +Simultaneous multi-threading (SMT) systems can also represent their topology
> +by defining multiple cpu phandles inside core node. The details are explained
> +in paragraph 3.

I don't see a reason to do this differently than ARM. That said, I
don't think the thread part is in use on ARM, so it could possibly be
changed.

> +
> +The remainder of this document provides the topology bindings for ARM, based

for ARM?

> +on the Devicetree Specification, available from:
> +
> +https://www.devicetree.org/specifications/
> +
> +If not stated otherwise, whenever a reference to a cpu node phandle is made its
> +value must point to a cpu node compliant with the cpu node bindings as
> +documented in [1].
> +A topology description containing phandles to cpu nodes that are not compliant
> +with bindings standardized in [1] is therefore considered invalid.
> +
> +This cpu topology binding description is mostly based on the topology defined
> +in ARM [2].
> +===========================================
> +2 - cpu-topology node

cpu-map. Why change this?

What I would like to see is the ARM topology binding reworked to be
common or some good reasons why it doesn't work for RISC-V as-is.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
