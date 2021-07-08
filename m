Return-Path: <SRS0=GvX2=MA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A23F5C07E96
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jul 2021 13:40:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67692613C1
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jul 2021 13:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67692613C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yEqLUTl+f+wqnN8UuK+HVHRfOqZncVt50AKyr1ZvJp8=; b=yk1YvnWN9aCi/Q
	mBFzc738fJavd9M8uianETI/ctOkTUbYIgmPiTOCpci+6rgP4oZrE54XM/IrPsQ7qHap1ZQawiEjC
	aJYmEFXTCnSCE7s2DtVJ5a6rJhiBLSndvVDobIQGtwKLou7ANMD0EZl/I6dY0zzWaA9nQPGgbsiSV
	ergsDHrUaX3oYvGmsJyp/Opv5IeDIo8hhKbEctPKhrnsYEkA7fFbJw5mgKtqRWu3SJQY/VNsIx4SC
	9wts51srkTMXll6kTCEKMcjINjMj2raRWIdt1BKv5RXzG+pAowta5B2vc5Xa+hsbJSeoJqgn0CshG
	g8IeVdPpuik0UdY3OaFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1UGI-00H7Ff-Sf; Thu, 08 Jul 2021 13:40:18 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1UGF-00H7E8-Ug
 for linux-riscv@lists.infradead.org; Thu, 08 Jul 2021 13:40:17 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id v189so514873ybg.3
 for <linux-riscv@lists.infradead.org>; Thu, 08 Jul 2021 06:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JeBVWsbWOT+Wo/FxJAgeQ+5Dtzc9jQjwBH9z1csOAl0=;
 b=S7yp8ZYPdK3xCJH76ogcQ3WNYKFNhyiZWqWRgZLnqFYMBBNXLBcOYSNhRR1PyDL25T
 tYgSTxiU9z94G8BynrhcTjCKWbzOWEWQHM/nIlYIbW5MTfbFVt+x2IsZhCkXmbFCRKpA
 /Lz7SwU3nIuTOWQPgfNMfo1FeH/I5Tg+BuuHR1GX+iAx4bU3MudcP7AQu7dJiY0xhBvA
 z17XhO7wYwk8nUE6ER5qYWPI4oVhGfdstPaklgSniD0vB6YQpbe02f0HYHw2By8OTrp+
 4AOVy3vuZgohfC8PnZRTRQYt0YL1tAmCPAlQQ4YnsOjAbsFLRWLhhQxAorKQ/bCLdAeH
 mJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JeBVWsbWOT+Wo/FxJAgeQ+5Dtzc9jQjwBH9z1csOAl0=;
 b=XE7PW2CHnKvf7843FUWhlFIG7zEM4xZznuicoWNAz3KM0SABnKdHlXQDQPKMdcK1s/
 OcIYuU0pLSaOxB/QhEuZ4scneCOpZcFkVGV4GhpjuPP6arDtSUfDIZch5KZ79hq3sbwE
 +WI813L3Q317h1IuOYR/Sd8CaFPjEh7YDOCvLr9lzc18cw/0t7WJYZBgNrZscGCkN5k6
 brKCYtKSKdyzotZB2ifTFaqTXGlx4kIl4wbN0WJmVu6uH4rJBX2M80tFjPBaXeTVnFIK
 dUevA3ZdNE8FIzaADFOtplKqcdsXpeTTsnsHa8je74mET2QgZZonPP2DkN2b2Nz69k8o
 RapA==
X-Gm-Message-State: AOAM533i0+bBicXVEZVsGNW9M6sPKWxTWvA85Z+tpiH9gTAzeatqSjvb
 JVwhsN1PkroTc8UFwWvGKNNHXEJviITG1SB0rlw=
X-Google-Smtp-Source: ABdhPJx4xwpTR3OAjGSmYCe1jeUNioBN+m8L6JQcgu7QKc3knfPJNKQKr/Gv1Q1DQqgclX4S2mWGkoT8ggWYPCc5fZY=
X-Received: by 2002:a25:6c04:: with SMTP id h4mr39916637ybc.122.1625751614749; 
 Thu, 08 Jul 2021 06:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210616074645.429578-1-bmeng.cn@gmail.com>
In-Reply-To: <20210616074645.429578-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 8 Jul 2021 21:40:03 +0800
Message-ID: <CAEUhbmWZL3QoS_qNe8xEPrBWm0+hLauLAhm9-Wxt2jSDntP=5Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: unleashed: Add gpio card detect to
 mmc-spi-slot
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 David Abdurachmanov <david.abdurachmanov@sifive.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
Cc: Bin Meng <bin.meng@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_064016_062370_77D60A36 
X-CRM114-Status: GOOD (  11.72  )
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

On Wed, Jun 16, 2021 at 3:46 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Per HiFive Unleashed schematics, the card detect signal of the
> micro SD card is connected to gpio pin #11, which should be
> reflected in the DT via the <gpios> property, as described in
> Documentation/devicetree/bindings/mmc/mmc-spi-slot.txt.
>
> [1] https://sifive.cdn.prismic.io/sifive/c52a8e32-05ce-4aaf-95c8-7bf8453f8698_hifive-unleashed-a00-schematics-1.pdf
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 1 +
>  1 file changed, 1 insertion(+)
>

Ping?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
