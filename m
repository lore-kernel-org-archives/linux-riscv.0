Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17644C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Apr 2022 21:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HHAnl5s02kmSQeCdQjrT/9h7KFnGgU/RqywbPg6sk5U=; b=MZUuJEfPjye9lC
	QsaU5DHqQAM6L1uR3TWiMNW85PXJ3zB+SVOlhr5lA/180TH+9wUT3xPGJdQ5ozvhpL9S9IOTLF8M6
	4QXTF0Jbi1ye3pJKiGSQW0+vjJ13Gx45EPbU08mdqTPkr/oaCQiU4W+nQnjH9JgbOs/JWv6+w1WCo
	1MuA83GDjNBtyUy6MSAshvYmwKUig2N45twkj+KpaqPf2KpEvtsqI+RU73Rm0qfE2BpoFUIhJcBC1
	SzKf2p86ViPaqVijyrkeb1uNmybSRhrJGBBMIR5Ytt0tjIXXOmse64y91FglB0DtJXrKhg4Bxoj9x
	f0BG3JBW5Qd+0GzcyqnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naOzd-007PuU-Rn; Fri, 01 Apr 2022 21:39:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naOza-007Ptc-Ug
 for linux-riscv@lists.infradead.org; Fri, 01 Apr 2022 21:39:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6CDCC61A78
 for <linux-riscv@lists.infradead.org>; Fri,  1 Apr 2022 21:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA97C34110
 for <linux-riscv@lists.infradead.org>; Fri,  1 Apr 2022 21:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648849176;
 bh=Gpj96KiChSJYrco1LEnEifrxak3dPMzFR8DmbI5Y51s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BMbb/oXfDAnwKuMtKiAn7XIQNQFmU1cdvrW0qNXR7OYLTHqC/3Xxv/jtng0vKnY4o
 tzs7mcbHd95F6BvfuQ5qBvrljgv2Z/U9PN8tEGyOhneA86hbRnQONyizz7gZNwHo7k
 bWK7BtPSxvLIL6caFDawnt2TgdA7X+u4AlmgNVyfILkcPpR++j9YEhFzmDsLaoYTU5
 I/tbjEPcDhA++G+BqW7osamcV4gxnFOoMSxcABH51V89WZ5UtChlzIhiEjLnZwwXVU
 fyOLMSnuu+BJrpJ2MvRNFkHfpKLvC3KvPR3tf2nMioyP/2DQdpXwG04lbyepNrwwbY
 87Mnmm6Mbd5/A==
Received: by mail-il1-f181.google.com with SMTP id q7so2875394ild.8
 for <linux-riscv@lists.infradead.org>; Fri, 01 Apr 2022 14:39:36 -0700 (PDT)
X-Gm-Message-State: AOAM53241/fwAjCad85+oTNnHukwnzVYvaxRsc+pDv7veC3L9PoJYF71
 Gv1yZdkLXZ2ZgCL595ZfnixSuNdf3Uiaj+PmfQ==
X-Google-Smtp-Source: ABdhPJz67vhBzOCPrpee46biTkgz2GvmlKmq0iYmwGAecXJCtTCuJEWVeUD1D8eRi+FyDIsw/lgsheByhgZAgBHK7wA=
X-Received: by 2002:a05:6e02:2183:b0:2c7:fe42:7b07 with SMTP id
 j3-20020a056e02218300b002c7fe427b07mr745149ila.302.1648849175895; Fri, 01 Apr
 2022 14:39:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220401212658.30607-1-palmer@rivosinc.com>
In-Reply-To: <20220401212658.30607-1-palmer@rivosinc.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 1 Apr 2022 16:39:24 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL8swP_NuMUiBeRrYhQ2XQct4uPxinOaE4dnn0K8mB1Wg@mail.gmail.com>
Message-ID: <CAL_JsqL8swP_NuMUiBeRrYhQ2XQct4uPxinOaE4dnn0K8mB1Wg@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: Fix phandle-array issues in the
 idle-states bindings
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 Guo Ren <guoren@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_143939_075104_6B6C311A 
X-CRM114-Status: GOOD (  15.58  )
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

On Fri, Apr 1, 2022 at 4:36 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> As per 39bd2b6a3783 ("dt-bindings: Improve phandle-array schemas"), the
> phandle-array bindings have been disambiguated.  This fixes the new
> RISC-V idle-states bindings to comply with the schema.
>
> Fixes: 1bd524f7e8d8 ("dt-bindings: Add common bindings for ARM and RISC-V idle states")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> Changes since v2:
>
> * Add the missing schema requirement to riscv/cpus.yaml
>
> Changes since v1:
>
> * Only fix the RISC-V bindings, to avoid a merge conflict.
>
> ---
>  .../devicetree/bindings/cpu/idle-states.yaml     | 16 ++++++++--------
>  .../devicetree/bindings/riscv/cpus.yaml          |  2 ++
>  2 files changed, 10 insertions(+), 8 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>

Thanks for fixing quickly.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
