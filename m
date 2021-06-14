Return-Path: <SRS0=CnAn=LI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64CB1C2B9F4
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 13:34:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DC6C6109E
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 13:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DC6C6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BzN22os5+8pTLMTtoMFqwwIXoKh7WtXWYoCT3U3+15k=; b=bcBpxVl7XdxIln
	oBVTt2pQ1qZmLgsKyNgb08dPvDSktuzsbsyvNptWaH3Ly2HdKCe7eYdJWBbtTnkjNJ6td/HdFxDow
	UggbtATFU18u1xJVDbDrfA193NEgJoM9R0iSBzw7kDwEb80dzKtlkIot9kdGePb7mCz1E61uk/gd5
	AqvowfEku6usnL1mMEjpSPye0cyk7bNBVDvbFA8fhIMVBOjM/RXtgnsdlm0u9p7+kT5jzBQAGyreq
	OGfvXED8p88WbS+pDTti3nEZXRfEaPH/ScWMlXe2Nc7DnN206WVwp4O2ZdK4ytWJSQZHqgpvx13bw
	xy/YSEQ/Ol8U1ZlXts1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsmjZ-00EI7s-55; Mon, 14 Jun 2021 13:34:33 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsmjU-00EI4x-TA
 for linux-riscv@lists.infradead.org; Mon, 14 Jun 2021 13:34:30 +0000
Received: by mail-yb1-xb32.google.com with SMTP id b9so15453952ybg.10
 for <linux-riscv@lists.infradead.org>; Mon, 14 Jun 2021 06:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jjeb2VBZlHsMDUPadrsr3uON+trO752pZHCWpt5WtHQ=;
 b=PJ35xyFVTzv/+suvuO3wLsMl2ome1H3nJs2WPwL2tfdai6MF4Xr4Tzp3NkbBDZQ6px
 jrdeZmfji2yZz2nerme9LNjHMAnISVHEnuRsGYTkOG6EHitziq7JyfhhE+NDsQZ2WW32
 +J2zSlMcIl0/D9BdQDMZ3WeEmIYCUYx2aCtlwn/HCOXbhIS9qHFVnEJXB5USYQ0paxqi
 8nK/0Q0LVJe99gEDWJ3EMk+tcUBubZ5tPAJCcBBy0534cSTi0+C7YqI5USQxoSowbjH7
 yrLYRH/AE92rqXJ9ad6ZdJTKL2pLfLSKsUCOAVxDs8N8UhkiVPf6BcTGpF6wCVY5tA+6
 kPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jjeb2VBZlHsMDUPadrsr3uON+trO752pZHCWpt5WtHQ=;
 b=iiiLPFI6nNrsR+Y1N7roj9WRXqJR7p0no6mzfGF74XMC6+LusNy5R4OyPUKLmViIMp
 8NeGQ6L8ydGJj8jkLFECxcEJbcaaZZ3MdowU/JIDHy5/UGVsU5dWw/oz1vQxf5+slENl
 wfM5pEzwsucI7RK1wcf9tyMrO8/dVB7MlljzJsxDoFQkbjNwRrlZ3jAUE3VQ2maJgfZE
 Yq9QaBCoN6wc1f8WI1cCqI5KqH21WZnGdAk342YpkjijbqTa99JDG0T1i7qB+wXlDgPA
 UjX1ZU/l/B4y5zbKTj3VOhmi1wZkxMr9J1EW2Lk2iG/AaD2YeaIxc/hKw/WbFpHhlivj
 ihtA==
X-Gm-Message-State: AOAM532A/EiOb3zimPSF+Ulp/J7csoeMeMuziGZpVZQNeRldwRLZ74nh
 VTrQM2rlMTIJw9mZKVsf+L795wGIS8MOgcnFpc0=
X-Google-Smtp-Source: ABdhPJyFwHZpRU74JDJMgDYk1WERGTnTqTksGdZ8EaZrxK/tuJc0NHSS3jIS9xxtboEFCHv0OKpxB7UkBau+FvUFGTA=
X-Received: by 2002:a25:b8c:: with SMTP id 134mr24998511ybl.332.1623677667645; 
 Mon, 14 Jun 2021 06:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210612160422.330705-1-anup.patel@wdc.com>
 <20210612160422.330705-11-anup.patel@wdc.com>
In-Reply-To: <20210612160422.330705-11-anup.patel@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 14 Jun 2021 21:34:15 +0800
Message-ID: <CAEUhbmUGSWOS7iG209BqTWBgTc63xPm1L_0xNBhKXVnu7Wpjjg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 10/10] MAINTAINERS: Add entry for RISC-V ACLINT
 drivers
To: Anup Patel <anup.patel@wdc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Atish Patra <atish.patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_063428_993504_07A92C0E 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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

On Sun, Jun 13, 2021 at 12:08 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> Add myself as maintainer for RISC-V ACLINT drivers.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
