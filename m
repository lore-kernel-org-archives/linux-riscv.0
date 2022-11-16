Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8FFC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 10:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pcEJtSUkdv/lScNIa3baE1TyTmfZAC4/IQ8W4cLXJiM=; b=2edX2oIXJjcxtk
	YbGiRZhRL/zB/TH5xfZ6wqNGkM2GR/e4FSrlX4zuZReMofRm2m8BM4K2xnuTiu30w+58Kcm0nnDkf
	fY5SgMjMTFzH4IL8WOvdvigXxkTvfL064ynz+xhFWSFV7po+50yc26+iMCpeYvPGnVWb19vjeOXL0
	LoIuHj67/qgbyinAPcnMO2p5qpb6ympEbf97vA1qk/2YVhuMM5JSfgu/RbPCS+U1sQcHB4yxK4P60
	RNP8h3jcEguAkp88b1xwbMCpe/AbPpX16xLEkW753hiaXJUUdVQCz5KSQijXI+t/33KtlCbXS18Fk
	22aW+BlXD3M01tXnjc2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovFtb-002MrL-8V; Wed, 16 Nov 2022 10:43:55 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovFkx-002Gfd-FC
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 10:35:00 +0000
Received: by mail-ot1-x332.google.com with SMTP id m7-20020a9d6447000000b0066da0504b5eso3814621otl.13
        for <linux-riscv@lists.infradead.org>; Wed, 16 Nov 2022 02:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UvHDrdWNJq6p+2GYaU9sc6HRRjXg7yWYn54epDm0dHI=;
        b=jknnzhc7h4x3wJA9jBdy+65pzdGdPdyylHFCtOvxW3Pw3KIbBsGz4fzgSZKDPXIVT1
         6a9ICbrfUODfviJcHgaGZMccDge6RvyanNLFQA9uCgSuKDQphcEvySdWLLi0YEwp+u0j
         G6qOGHBnddoo3cKZUIERPjc+tTuafkkcU85wvS23YhoZHjkw1pLJJRgvrP/O3EnlhABj
         Po/1o37x1riM7S3DbmQ8FG7LBL1BhD8sYhKwL84s9kX5vVVbDkOczE98D4JvkfsXUVi7
         H+e2g4jCLHMMpTD1hscvLtVJezH30OGiZRNecLgQwvmSfhxEbWvfYVkvGBGDhTIXnuGU
         n6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UvHDrdWNJq6p+2GYaU9sc6HRRjXg7yWYn54epDm0dHI=;
        b=uTxrSVeqG2tjmZtkFBmL8GCv/iCGsEW0+HhmXS9Xq7oS2/vzffo5/6agyY4x2fG1gS
         iz/NYb3xUIKz73De+BqfQC5aqMEpEuoBSqt80puX5wfjGFQF2J6GYkhR2Xq0rn9AzJLY
         oznuhQGFLRKVkqLlsp9NUv5W+GNOqIODJki2EcFhkRj/LE/egaogLezSj7JQOaWKp8bH
         RoDZ9lKR86BX3SOHjStiXEww9BQBflBKqNkUvemrAd7NjA0TJ8yB8DxbmR6KVsATYwOs
         9aXmLjVc3Xa6qAugjVym0u0euXSNnyTSyVUNZXSxq6qW6QTRcBa7QD9wKeiKknISCaI1
         1JKA==
X-Gm-Message-State: ANoB5pk6lFmhs0ThqjzRq3NLEdjt1cAIRG2EJqw0qCu/4whyTIp+VkZE
	gcjv3tSB+VkNfsm4T4lVnH9I4m78Q8+i95vpjUdt4g==
X-Google-Smtp-Source: AA0mqf5uFDJIvoKh6oYwXem2Bw2v5rzobdymFcZkJUXvQ91kXntl6fLIfQ3vmWssZKwMpNvuUR9ZNcYbLbUc+9rEpA0=
X-Received: by 2002:a9d:3e4:0:b0:662:2458:3ef7 with SMTP id
 f91-20020a9d03e4000000b0066224583ef7mr10654090otf.150.1668594896741; Wed, 16
 Nov 2022 02:34:56 -0800 (PST)
MIME-Version: 1.0
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
 <20221111044207.1478350-5-apatel@ventanamicro.com> <Y3EDuaW0zQSSfiQ/@spud>
 <CAK9=C2WDQCnVnxKR6SFspdwope2KffyASLJDF_Ygo_417ekJ5w@mail.gmail.com>
 <Y3QT5Vy3RnIXobHz@spud> <3037b4f9-268d-df03-380c-393a5d01f3ba@linaro.org>
In-Reply-To: <3037b4f9-268d-df03-380c-393a5d01f3ba@linaro.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 16 Nov 2022 16:04:45 +0530
Message-ID: <CAK9=C2UpiM=UC27Bgm+QqSc=27g__QLL3y-wMVJGjO-N-XKThw@mail.gmail.com>
Subject: Re: [PATCH 4/9] dt-bindings: Add RISC-V incoming MSI controller bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Atish Patra <atishp@atishpatra.org>, 
	Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_023459_564238_59629123 
X-CRM114-Status: GOOD (  16.35  )
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

On Wed, Nov 16, 2022 at 2:30 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 15/11/2022 23:34, Conor Dooley wrote:
> > On Mon, Nov 14, 2022 at 05:59:00PM +0530, Anup Patel wrote:
> >> On Sun, Nov 13, 2022 at 8:18 PM Conor Dooley <conor@kernel.org> wrote:
> >
> >>> Also, the file name says "riscv,imsic", the description says "IMSIC" but
> >>> you've used "imsics" in the compatible. Is this a typo, or a plural?
> >>
> >> Yes, the file name should be consistent. I will update the file name.
> >
> > Is there a reason why the compatible is plural when all of the other
> > mentions etc do not have an "s"? It really did look like a typo to me.
> >
> > It's the "incoming MSI controller", so I am unsure as to where the "s"
> > actually even comes from. Why not just use "riscv,imsic"?
>
> Yep, should be rather consistent with all others, and IMSIC stands for
> Integrated Circuit?

This is intentionally plural because even though we have one
IMSIC per-CPU, Linux (and various OSes) expect one DT node
as MSI controller targeting all CPUs.

The plural compatible string "riscv,imsics" was chosen based
on consensus on RISC-V AIA Task Group meetings.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
