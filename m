Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CEBC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jan 2022 05:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LARgM22qKEtOnmuUuuhXinr8a9cfmihN/rX7auEZSTs=; b=3ina7Qtr1MKIOc
	EfBdx8WcUkc0PRGbmQL8IHc0heqftyrTQghIEp2uzgx+6EzKO0Kx23w3HTz0tlZy0HHVcLInLsV/K
	aL2vxWch4QRvzhPZx9KA65DArtYT6AvGfdf+y5CsXj4lsi/MmAU+y8JhAyxsnvgHur93HnryK7Bzv
	VFYUiiDuiKB5iTBde7EaKsnXcrj/iEzYZ835g5scp0hdaNH+2EVY0fRnVMnr9VcdhoW5Q2BPfWlVO
	zBrif2OrsyEbqMMeG5lZJkrgZLrXImfO4d4ptJFkTgCVe/qNwgHgEiVyiFLRdj4/A3yDO5CKkt0px
	Ze/zXTQXWuo9cqZk7DWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9h5T-000L8j-0Q; Tue, 18 Jan 2022 05:31:19 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9h5Q-000L8E-KY
 for linux-riscv@lists.infradead.org; Tue, 18 Jan 2022 05:31:17 +0000
Received: by mail-wm1-x32c.google.com with SMTP id c66so25078579wma.5
 for <linux-riscv@lists.infradead.org>; Mon, 17 Jan 2022 21:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M8RGE/DAeu/cF6MyOFk6fwmpPGM88lrl7wdwFAKJ4BE=;
 b=CEzdGWMBnd1J8rXO2caxD/gWSoNQevjJ/4T3wgxwnRqZ5iqNwq0UqmPEwUar/p7Jjl
 z5BzjHTCxfI9GVbPhoUfyXKYeWi56lbfbGLtsFXP+XKq4bw2AcoR+QpiV7jBgs8Tyw6p
 wQH9/ehapJ6DKhZsQSa3u9iyVXUJbSMLjOinpaCXBjwavCvTnKBT4ufuUNMyFlg041gQ
 BCEsoEZCsWZSzeyO/2fcF0VxjPhHidNNYSxQY42sbq5Ioqpyv8MupwS5Emo7JvRy/m1R
 BqXL6z+efN9KaKM7HMfppkbSjJABnNl41OVHTNQHUW+HVZi+QZELZBmsYrKzCjr/4ML/
 g+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M8RGE/DAeu/cF6MyOFk6fwmpPGM88lrl7wdwFAKJ4BE=;
 b=Pa1G18jeMVjfgG5T6hyF23+Sj/SbihwEIPSxhSEi+m7PaPlRx7q07V537vrwzYWe/a
 JpGcNLYYaQucaeMJ/uPBgfBvYJE7QTscBwhbxblIyzSvc2INvPWXfWrc26xrO/1UaZqe
 KVN54Aor8dexIjBgsOR9dNLqgBJMMb/6Lsa3xyT7aTqs+GCWym5TWCNurZBVHRE+jq0Q
 Rjwqz+yOPnoquVJpDCfrR+fJRAM/TnhODvt7g2fIkPDArcYroCr/+nzndSt1HYvM6Ire
 kYeLQKzcKVfAOduAWL0vrSO2OtWPYEIsBZm9cCvxdj3snTXXJb6jPw9RmvIEd3zZq1uB
 5jaQ==
X-Gm-Message-State: AOAM530IEMfsN4eUhnUJlvBmPaIsUzbOjuJnPl/vrocog34XAfzk9MBv
 ARgsvw5uQcQiID/XDMF9feES3hyyXCL6nDskvm5rhqrSKxJ1zg==
X-Google-Smtp-Source: ABdhPJz30QM3hgkUK8tGy9J8I/MAob8XT1qi6GJq/uClq3+JKuP5JkWkKU0Bb5Djvfnpc84vLhCmyRyBZcy4L+ejSNQ=
X-Received: by 2002:adf:9d81:: with SMTP id p1mr22027128wre.313.1642483874927; 
 Mon, 17 Jan 2022 21:31:14 -0800 (PST)
MIME-Version: 1.0
References: <20211225054647.1750577-1-atishp@rivosinc.com>
 <20211225054647.1750577-10-atishp@rivosinc.com>
In-Reply-To: <20211225054647.1750577-10-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 18 Jan 2022 11:01:03 +0530
Message-ID: <CAAhSdy1cyGwwq6BDO5Xv_TfR6Pbk26hKDWQZSUWKTTX0A6iHxw@mail.gmail.com>
Subject: Re: [v5 9/9] MAINTAINERS: Add entry for RISC-V PMU drivers
To: Atish Patra <atishp@atishpatra.org>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@rivosinc.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Damien Le Moal <damien.lemoal@wdc.com>, 
 DTML <devicetree@vger.kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_213116_703177_BCADE859 
X-CRM114-Status: GOOD (  11.65  )
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

On Sat, Dec 25, 2021 at 11:17 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> From: Atish Patra <atish.patra@wdc.com>
>
> Add myself and Anup as maintainer for RISC-V PMU drivers.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9af529acb6a6..6232ae05e12c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16056,6 +16056,15 @@ S:     Maintained
>  F:     drivers/mtd/nand/raw/r852.c
>  F:     drivers/mtd/nand/raw/r852.h
>
> +RISC-V PMU DRIVERS
> +M:     Atish Patra <atishp@atishpatra.org>
> +M:     Anup Patel <anup@brainfault.org>

Please use "R:" instead of "M:" for me.

> +L:     linux-riscv@lists.infradead.org
> +S:     Supported
> +F:     drivers/perf/riscv_pmu.c
> +F:     drivers/perf/riscv_pmu_legacy.c
> +F:     drivers/perf/riscv_pmu_sbi.c
> +
>  RISC-V ARCHITECTURE
>  M:     Paul Walmsley <paul.walmsley@sifive.com>
>  M:     Palmer Dabbelt <palmer@dabbelt.com>
> --
> 2.33.1
>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
