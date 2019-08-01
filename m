Return-Path: <SRS0=GtJH=V5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40768C19759
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2019 15:50:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12EBB2087E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2019 15:50:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k73jkJSC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="NXLsozSY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12EBB2087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9RoIqgpZ16YlHrGg//pxKR/Mp/Ylsi+03HqoNt16tMg=; b=k73jkJSC8KLeCH
	Mcx9KfGO2/wgdjQmbixbB4SVELrL9KaI4GUGdAQiaxDYFJZWWuGLJac1v4AJmP/ImUPnTtuCcmuRX
	uqRP9dYEhfg3Uu5VHKbbUTvJPxPcfVG6LzhE73aFC1FoRw0cbTu6/fbv0t5P19UfdUlhubub58glC
	yjAIfXq3n93CLYQR4P8kp7bn8ic+G7UlnvEfWyD43w5zunpIIthm0UibPlr4eDqZX/ZN2RHVp7uLc
	cHM3EP8YOoAnvToodLrOLPpBvW6gQp1kwyElq2IUj/7cLwGRArhInVT5EIJWbpcPHkAWOdb1CtLC+
	7gYLJY3jJFfghQC1BMwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htDLx-0006jI-Pc; Thu, 01 Aug 2019 15:50:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htDLv-0006ij-KQ
 for linux-riscv@lists.infradead.org; Thu, 01 Aug 2019 15:50:53 +0000
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E0CA2171F
 for <linux-riscv@lists.infradead.org>; Thu,  1 Aug 2019 15:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564674651;
 bh=mo2HdMSRCqt3TFJkQl9d7X3tKGeVpM+cbgnJbsSOiBU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NXLsozSYOIx9rgmDZGvJH1orQh3Sih5ok+LDLGRki2c9GNYyHcBujEiSfTrb4L0hE
 Kq/zLCt7vLGKd95Jmjf+KBCOpxM7BmwGOZi5zcqTEOBKLZXpvIR9vZWaZOFuOFOAp4
 nKbypj4GdUDLiW2dD2yPDj6ZdsQV8WJLxPGE3UsA=
Received: by mail-qt1-f175.google.com with SMTP id y26so70723925qto.4
 for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2019 08:50:51 -0700 (PDT)
X-Gm-Message-State: APjAAAXIrR0aIsUgvjD/AdUzOL9ftFSK3OVVRXyQ0rEMGLLyu8nuZFgm
 rb5Q4syqgFc/wO8bg0lusY7/5SHrbPbOYoIxug==
X-Google-Smtp-Source: APXvYqzqIDIJzp/P5UH50rteyQO1siPBt2WuomDxMcjKRkIu8XCHmururywkdwwVKhn5raiJ1jaTSLRgDcGehkVoih0=
X-Received: by 2002:a0c:acef:: with SMTP id n44mr94852273qvc.39.1564674650265; 
 Thu, 01 Aug 2019 08:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190801005843.10343-1-atish.patra@wdc.com>
 <20190801005843.10343-6-atish.patra@wdc.com>
In-Reply-To: <20190801005843.10343-6-atish.patra@wdc.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 1 Aug 2019 09:50:37 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLqxN1+fvrdD24Ho6s7gB+pGy-0sZaL-jJqkYZ2yC4JEA@mail.gmail.com>
Message-ID: <CAL_JsqLqxN1+fvrdD24Ho6s7gB+pGy-0sZaL-jJqkYZ2yC4JEA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] dt-bindings: Update the riscv,
 isa string description
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_085051_706892_54F309BD 
X-CRM114-Status: GOOD (  15.49  )
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
 Anup Patel <anup.patel@wdc.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Johan Hovold <johan@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>, Gary Guo <gary@garyguo.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Enrico Weigelt <info@metux.net>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 31, 2019 at 6:58 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> Since the RISC-V specification states that ISA description strings are
> case-insensitive, there's no functional difference between mixed-case,
> upper-case, and lower-case ISA strings. Thus, to simplify parsing,
> specify that the letters present in "riscv,isa" must be all lowercase.
>
> Suggested-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index c899111aa5e3..4f0acb00185a 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -46,10 +46,12 @@ properties:
>            - rv64imafdc
>      description:
>        Identifies the specific RISC-V instruction set architecture
> -      supported by the hart.  These are documented in the RISC-V
> +      supported by the hart. These are documented in the RISC-V
>        User-Level ISA document, available from
>        https://riscv.org/specifications/
>
> +      Letters in the riscv,isa string must be all lowercase.
> +

The schemas are case sensitive this looks pretty pointless without the
context of the commit msg. Can you prefix with 'While the
specification is case insensitive, "

For some background, FDT generally always has been case sensitive too
(dtc won't merge/override nodes/properties with differing case). It's
really only some older true OF systems that were case insensitive. The
kernel had a mixture of case sensitive and insensitive comparisons
somewhat depending on the arch and whether of_prop_cmp/of_node_cmp or
str*cmp functions were used. There's been a lot of clean-up and now
most comparisons are case sensitive with only Sparc having some
deviation.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
