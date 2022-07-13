Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486A1C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 03:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=scj6S+c1XLhiJYIfNEzlld/b6j85jF825K2e6b+6FQk=; b=XtuD4AAOGlA+luqIUGTy4xxnM+
	GhVB+P0quzgDgU5Xqfk821NA1yPIHwYBCz2hZBrbiNRjFJVY2MxTyOHOHVAuQaOZlS+hz3HffTBpM
	itVkW2KXf15SrnE5E+9CKtURh/DQw71Yi7MwQOQli2AWWw2SgSHNXyCFjCg3f2HJMIuXRZclWpt4T
	O4OyN1Jv9xV3FbH1fvGJ/p/t27bSiySKrO/tlz4l1OfXXsjqy6ACIfJHlcANH0JA77dcDib0bw2K1
	S6B/M+s4L72T50Yk6t8Du7dvGQjrV3Y6kFYGwshIMMwrB9vvTarCKO2K9D6Lut4CfDXuoY522dboW
	yQ+y0nHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBSuA-00HAYI-BG; Wed, 13 Jul 2022 03:19:14 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBSu7-00HAXM-Cr
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 03:19:13 +0000
Received: by mail-pf1-x432.google.com with SMTP id w185so9124274pfb.4
        for <linux-riscv@lists.infradead.org>; Tue, 12 Jul 2022 20:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=R6xI0morLL57JUlbA0u3eGGm5aJePBaipJygvCaQ9U0=;
        b=2BzjTzbUXD1woQQGYOJ7CSmknNB/O8RnasV2LMyIW04QMAfAF3i6aldO/K/u/4ioDt
         hLdJe33qPcDPPAP8yb5qlaHVlsTECwjIMXNK1m+xG449/s/ilZ/hwVC3AhOIvUTW3Ovq
         jGoD17lRk59TH65lzQaqIe54ZEi5I/g+CdhXSWLyAe3gHxCkuqaIoWNY0/h4ssVfMMtQ
         1V3qugKEAA3RtRnAbsxiZ0FRcXvV+UEwDlXR5l/mJb4ewDjU7HubwrVCgH9uUirRx8v0
         orUlIU9mx3I99gNzrI+6a2YV62S95lfPCYg+8zpVDFDK02H6pdC9SzsA9REXUPw3dmq/
         fFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=R6xI0morLL57JUlbA0u3eGGm5aJePBaipJygvCaQ9U0=;
        b=5i7DKJetH9nNVE+ETLMq7agjGkWtGMNDL/Luz9AFaNlG5y4jpvPrrm+o2I/hVROQOc
         aQZUq3XVKo/E2PIJIKDosNQP/zFjcbQQwtHhrQyp0pjlHjUvNd7H9T3h4/HavWtoW1Iw
         kmdQNx0XMIMiiF2S/RTOatnwfFZTU2Wuq/IuyT6cyJFxUeLvDH3Fvlu8CnnD+nrV9g9Y
         nndYy5AiYJSnGx1y3y3Ezlpm752AKwrkbbCnNbDUnxZLrfbp8sNd+qjQiiADnNc8mKUl
         GX8o6/LsrorT/maXld7PuYUg9aVLb8+DsrfkioIobT9SxYjhmhmDM7ePuZQHs4dtC/ia
         Z61g==
X-Gm-Message-State: AJIora/lhgzmZHMDXhkQrj0hKvlcIlbacBgx8gekEpT1dtONhFAMFk4F
	nABXNABGuF+H5Li3pnxrK8mOAg==
X-Google-Smtp-Source: AGRyM1tZjKVMWuD2n12LJ90FJHY8IZsKaQrHl5SuVWznr1RNc44Ebbb9J2BH8KdkKZspCJ0XQXgm5Q==
X-Received: by 2002:a65:4907:0:b0:3fd:bc3e:fb0a with SMTP id p7-20020a654907000000b003fdbc3efb0amr1155392pgs.123.1657682348898;
        Tue, 12 Jul 2022 20:19:08 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id 77-20020a630650000000b0041299ef533csm6846318pgg.41.2022.07.12.20.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 20:19:08 -0700 (PDT)
Date: Tue, 12 Jul 2022 20:19:08 -0700 (PDT)
X-Google-Original-Date: Tue, 12 Jul 2022 20:19:06 PDT (-0700)
Subject: Re: [PATCH v3 0/4] Add PLIC support for Renesas RZ/Five SoC / Fix T-HEAD PLIC edge flow
In-Reply-To: <92a45bf04cfe140c7605559fa3d8f4eb@kernel.org>
CC: samuel@sholland.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
  prabhakar.csengg@gmail.com, sagar.kadam@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
  guoren@kernel.org, tglx@linutronix.de, geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org,
  biju.das.jz@bp.renesas.com, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
  devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Marc Zyngier <maz@kernel.org>, davidlt@rivosinc.com
Message-ID: <mhng-60d46fe7-e88d-43b0-9cea-a4ae865baeb4@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_201911_456051_3EF7BE26 
X-CRM114-Status: GOOD (  19.70  )
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

On Fri, 01 Jul 2022 07:28:48 PDT (-0700), Marc Zyngier wrote:
> On 2022-06-30 11:02, Samuel Holland wrote:
>> This patch series adds PLIC support for Renesas RZ/Five SoC.
>>
>> Since the T-HEAD C900 PLIC has the same behavior, it also applies the
>> fix for that variant.
>>
>> This series is an update of v2 of the RZ/Five series[0], and replaces
>> the separate T-HEAD series[1].
>>
>> [0]:
>> https://lore.kernel.org/linux-riscv/20220626004326.8548-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>> [1]:
>> https://lore.kernel.org/linux-riscv/20220627051257.38543-1-samuel@sholland.org/
>>
>> Changes in v3:
>>  - Add a more detailed explanation for why #interrupt-cells differs
>>  - Add andestech,nceplic100 as a fallback compatible
>>  - Separate the conditional part of the binding into two blocks (one
>> for
>>    the PLIC implementation and the other for the SoC integration)
>>  - Use a quirk bit for selecting the flow instead of a variant ID
>>  - Use the andestech,nceplic100 compatible to select the new behavior
>>  - Use handle_edge_irq instead of handle_fasteoi_ack_irq so .irq_ack
>>    always gets called
>>  - Do not set the handler name, as RISC-V selects
>> GENERIC_IRQ_SHOW_LEVEL
>>  - Use the same name for plic_edge_chip as plic_chip
>>
>> Changes in v2:
>>  - Fixed review comments pointed by Marc and Krzysztof.
>>
>> Changes in v1:
>>  - Fixed review comments pointed by Rob and Geert.
>>  - Changed implementation for EDGE interrupt handling on Renesas
>> RZ/Five
>>    SoC.
>>
>> Lad Prabhakar (2):
>>   dt-bindings: interrupt-controller: sifive,plic: Document Renesas
>>     RZ/Five SoC
>>   irqchip/sifive-plic: Add support for Renesas RZ/Five SoC
>>
>> Samuel Holland (2):
>>   dt-bindings: interrupt-controller: Require trigger type for T-HEAD
>>     PLIC
>>   irqchip/sifive-plic: Fix T-HEAD PLIC edge trigger handling
>>
>>  .../sifive,plic-1.0.0.yaml                    | 65 +++++++++++++--
>>  drivers/irqchip/irq-sifive-plic.c             | 80 +++++++++++++++++--
>>  2 files changed, 135 insertions(+), 10 deletions(-)
>
> I'm going to provisionally queue this into -next so that it
> can get some testing. I'd still want the DT changes to be
> Ack'ed before the next merge window though.

+David, as IIRC he still tests on SiFive hardware.

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Though I also wait for Rob on DT stuff (I saw the other thread), so not 
sure that helps any.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
