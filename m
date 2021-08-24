Return-Path: <SRS0=qQBT=NP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F3BC4338F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Aug 2021 15:33:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0D586127B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Aug 2021 15:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B0D586127B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RuXwq1NJybnG6Bx6wiv3TOoYZ1VxXX32lRSesBVK75M=; b=E5cTYkr0Oooizt
	CEjQH9pwAEwnxJrLt5ZLe9NNjyBrWw1+2wUaRQ2o4KqjGdKI8x+hSZHLNdkyNTW63MPuZC8DcIx37
	XVWNQQOcScGcg5gIKO5dxYCeDp2bjBJW+mzB+1dovloWMyK8E5PbuVdzd5rNN3aN8Csr1enAOdEzo
	P3spYDAe2fQB2yjZiBwTctTuOwxnmCCq46PF9UwInZZ/fZ2maHFgiI1yy3B92QFHPy+4NjLzPssMF
	qQ+Hl71GbK5VhAI/slkmgwcptR8UPtTWNVItkVS1SsEmXLilnsTFECXYx6VANV12OLNPoQPsSugJI
	GLCa35EeQLqyzrAPxJ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIYQG-003jqi-GS; Tue, 24 Aug 2021 15:33:08 +0000
Received: from mail-ua1-f52.google.com ([209.85.222.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIYQD-003jpE-Fb
 for linux-riscv@lists.infradead.org; Tue, 24 Aug 2021 15:33:06 +0000
Received: by mail-ua1-f52.google.com with SMTP id a4so11811910uae.6
 for <linux-riscv@lists.infradead.org>; Tue, 24 Aug 2021 08:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=44Y8+N+SnYtYOywdEreCzeQ16Qc35iaWv8K0CtlpfOM=;
 b=EwiG2I8ZZLtfh+9ua2thWKH7xdn8pPk0h+nkG+Xk5md0bf1pq8kccL0L01IZY2nAbr
 fA5Mxcn8998SMwF13QBCdjOIZfAdtl97JWbNzJMmhX/DBiOF03ldfGUZYJncsEhU3gro
 JjVfy3kiIeMNIwQfdkk6HMb4s2pITkvEid/0NPoCaS6eUl4mFBWYo59cXcvOtPVnafjG
 lU+6xKMFFjUGf24RgHy7drtWbbn7ALB5xwYMtsNOEh2eqfAdA1NqcJIUtgm2ts1b/KzD
 jW92yAF6otGezokZJsK8e3xkMQo03SK2+H1TkwMj38PXbhk5uMKH1Jbe1hlCQF33hN/2
 Gj7g==
X-Gm-Message-State: AOAM532L+rKbAId2XhHPaHXTkUedPk0qf6JD2b1mNE6HbyWX8UUaRV32
 9Sy/E3vEVX6f+eGK+rS9mLjHRmYrtAGri2FMTo8=
X-Google-Smtp-Source: ABdhPJx43ZwCwMlUtl1S7uSysr1dAaJDUFsrHb1A75ES/kPsKLv6OsWvOzGC+YT4ae4ieTdk/o5Bbk59uGjg6cLvkLI=
X-Received: by 2002:ab0:4d5b:: with SMTP id k27mr13478215uag.78.1629819183896; 
 Tue, 24 Aug 2021 08:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210819154436.117798-1-krzysztof.kozlowski@canonical.com>
 <20210819154436.117798-3-krzysztof.kozlowski@canonical.com>
 <4d0d6290-8341-56d8-7902-5a8c36bc7bb5@canonical.com>
In-Reply-To: <4d0d6290-8341-56d8-7902-5a8c36bc7bb5@canonical.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Aug 2021 17:32:52 +0200
Message-ID: <CAMuHMdWA3_c13dCVUm7o2QzBmDN4G4fA6B+xSftx9FtEyYtT7w@mail.gmail.com>
Subject: Re: [PATCH 3/6] riscv: microchip: mpfs: drop duplicated nodes
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Atish Patra <atish.patra@wdc.com>, Yash Shah <yash.shah@sifive.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Piotr Sroka <piotrs@cadence.com>, 
 Linux MMC List <linux-mmc@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_083305_575963_3BB2D421 
X-CRM114-Status: GOOD (  20.55  )
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

Hi Krzysztof,

On Thu, Aug 19, 2021 at 6:22 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> On 19/08/2021 17:44, Krzysztof Kozlowski wrote:
> > The DTSI file defines soc node and address/size cells, so there is no
> > point in duplicating it in DTS file.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > ---
> >  arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts | 5 -----
> >  1 file changed, 5 deletions(-)
> >
>
> Now I wonder whether the subject prefix should be "riscv: dts:
> microchip:" instead?

Agreed.

For the actual patch contents:
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
