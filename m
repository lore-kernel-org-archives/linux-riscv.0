Return-Path: <SRS0=jEvo=KT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D27C04FF3
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 18:15:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3801A613F4
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 18:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3801A613F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XAUMETstM7jCJKmxw7UKGuHd6wGPGJd3Q4VtvjDlDSc=; b=GB6VqmIidxt2TZ
	Eeq7SIpFNZHVjc7CGixGwWXMtUIuqA3HtC6CdzYNZ4TtKXnCerPiwy6wUMs6/5prMAa4lmKLm97DF
	kV4I2icau+mYnQ8cYzoTyRREQLVP3A2MKmIwURhM7mc2o0x/+y7kH0ObmRR2yjtjnEUXUplkD2GLN
	Dd8QIQ1nv7MRkoejsQzs314hfVnV5mopK8RmRaWUH9YdC+NBbKw4Ec8yBotKOyAQdH+TfSV4Fl+jv
	g+wFTwFFRsClhnX0cQMy79Ufqyy248lFjB9/rFJ0Y1tf5ohZFY0rxUVppK8uZ/n1zpRvAtzHfky7M
	PeCV4Y7ReOrkzTqZbA3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llF6q-001PqY-G0; Mon, 24 May 2021 18:15:24 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll82i-000q1n-1W
 for linux-riscv@lists.infradead.org; Mon, 24 May 2021 10:42:41 +0000
Received: by mail-wr1-x433.google.com with SMTP id z17so28017370wrq.7
 for <linux-riscv@lists.infradead.org>; Mon, 24 May 2021 03:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/eUOrn9lE2HWE5uWnHqSiVPbmorQyM5RkNMwB1g8oIs=;
 b=0yAdh939lZC+DNZj9zX08KI/2bh/2h7zmkHMSnczbPROY1mBpcwAmg0BQPTddC33YH
 4poJ7dKhhKT4R4TGNXdtorC9bI2PVGH3oXRIPpAS/DKiuIxy/TzYsazkdd3Qpzv1SG/2
 r9YwVzaeFmSJAJ3aqiEVi9Ry0XwMT4iGOOiqcC9zemBuKsWaAgalXyA5WRQrcMbcdMoY
 sOdd9GnmW7iWCEJydL+7x3rrUSV+8pYIOL2gETTo15dqXQtU/3MvCuijaryNcvW2d3fA
 DRH8il9kC3BqiomKign1XqgPFDcyL8bPJvmkWu1ndPqOrDtLgeCriIec0SZ8emwQGmU5
 IH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/eUOrn9lE2HWE5uWnHqSiVPbmorQyM5RkNMwB1g8oIs=;
 b=rwvmY/Vn/J9CnnKU5d7VyqQBkU1VPTX+ccXtXP/nvMWK3u2dzc/cPJqaVGCfFAepjW
 T+JPKLSCiIjyvgepQMk3HJQJ8RvhlPqe5p0KijmBdMrOmWwrdoaHVIRB4RpvaDS/kyT5
 uof3Lh/yw2Gey4UlQc1SZfXmFoV3fu69Ld+9nbr3ENCx/QWNpmrVYC2uNuyeu/JMB3xJ
 33MaLI/hDrBjtKc5EYHWcSmN2Scc/k7Uiw+0wh9e+TdvyuysvAyWI7oo4qA31Kdbvn+Q
 LzZdXRzYA5Ue+JTAYXOnVHLt7f64qzcxsdooQlAyRS9c4ekyaV+bx+iOtR5FOYE3JGaQ
 oC1w==
X-Gm-Message-State: AOAM531DbYKt+k0VVmo5xPQqAOXKGuduFaO9fiRESNNQ+k7k7Ovlzlzr
 QBdhwMhC6Qe7NvWmKtfFdtHj1t7sg5IkgRZ0TrQ5mA==
X-Google-Smtp-Source: ABdhPJyWPhOVNAkgUqE7qc9+oTrs7UQSenUtFjVASUHEuOyt8RBQDzntOc1bcLlVhXlvtZH0j/l7d8a1Eumaxmy0RFw=
X-Received: by 2002:a5d:6701:: with SMTP id o1mr22084731wru.390.1621852958251; 
 Mon, 24 May 2021 03:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <1621839068-31738-1-git-send-email-guoren@kernel.org>
In-Reply-To: <1621839068-31738-1-git-send-email-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 24 May 2021 16:12:26 +0530
Message-ID: <CAAhSdy1QsyddHG3u=+Sv3mrVmtB15pr-hvg7+UT1evmNSwyY1g@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: Fixup _PAGE_GLOBAL in _PAGE_KERNEL
To: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_034240_178965_635E9EF0 
X-CRM114-Status: GOOD (  17.19  )
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

On Mon, May 24, 2021 at 12:22 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Kernel virtual address translation should avoid care asid or it'll
> cause more TLB-miss and TLB-refill. Because the current asid in satp
> belongs to the current process, but the target kernel va TLB entry's
> asid still belongs to the previous process.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>  arch/riscv/include/asm/pgtable.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 78f2323..017da15 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -135,6 +135,7 @@
>                                 | _PAGE_PRESENT \
>                                 | _PAGE_ACCESSED \
>                                 | _PAGE_DIRTY \
> +                               | _PAGE_GLOBAL \
>                                 | _PAGE_CACHE)

It seems this patch is not based on the upstream kernel. The
_PAGE_CACHE seems to be from your other patch series.

Please rebase these patches on the latest upstream kernel without
dependency on any other patch series.

Regards,
Anup

>
>  #define PAGE_KERNEL            __pgprot(_PAGE_KERNEL)
> --
> 2.7.4
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
