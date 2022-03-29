Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27774C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Mar 2022 01:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vlpJI611xegG6SxtbMRJC9sO8dWA5xAOa9D5z8ah3C0=; b=A9jirCxisZARCg
	psMWb7yNdQ0SmgQKvfY3gReGE6U1ZzkBZnKeENzqzx+pG0PsMI8K1iRZI2/GeTKHleuWkgFCzeMoa
	DbPn+coQAXjE/1G02O7AiAVby2Kb4Anxkg3ZjbNTd3hYubePStZS2WkYVbG0FJvLBjgkfMtlLRlBL
	iWmjYcPqeOoVcEfy1N2WOuBZzKwZD4DC0CLU8dHnqrqmB6kertXRJllrxeedIQXG6xDYhp+LH1Ono
	jv2AumRa6m8iKHewK7GkOXhRvgG0/1wIV7AgZVT9z5hhWZLNfkriJVdPwgyQQhgGUCqPiOCqEi3R0
	0+04+luxNe9wKDNIZYkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ0m6-00AfN4-6f; Tue, 29 Mar 2022 01:35:58 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ0m3-00AfMT-Ac
 for linux-riscv@lists.infradead.org; Tue, 29 Mar 2022 01:35:56 +0000
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2e5e9025c20so168188217b3.7
 for <linux-riscv@lists.infradead.org>; Mon, 28 Mar 2022 18:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V7I0uwf8IPEu8YwRUskYNPlj8l3hoiQdHtSwce4QS7o=;
 b=Vx6jozgmhNiZW7zvqD3KrH3lrJNzYe8cexbc0wIdzb17NWZRbkHgVC7ZNDnPDFbRDG
 tJNCmG99+V7qm6qWdu+6Rxr0Qf7j3w5Crxl8PWA1QKmeIAVrBbdRg+nfnTJdmsQg0Coe
 1DUMmQz6N91Sw+sOb79eGNrH6AYblLpqhLCkxPVdcNZvDydXIhQm+tEeBe3Suv62A4WG
 bLZ7KAxehj3xBlzHRiU2bpVzvdRZSrHQDspPZV6L4OmVdssGm4cH9LGQec6iwhr/qpPb
 u3J/rWnM1JoadRNB0ypcBU5z2TsQno/WKbSgkF8Wug7HwCO/ype3mFJR9wxADsdd2KLw
 UU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V7I0uwf8IPEu8YwRUskYNPlj8l3hoiQdHtSwce4QS7o=;
 b=UZn1akIsW0ocweLIqJfH0UrnmyQMmQXosQL4ipwNgFh1wh4zsKId6LaAy67AhJFHbm
 LOZI53LQAu0gM5u7L3dtnDMVH7AFLxFyEKpJv/b9SAK2q5ve97mQoA9PwEC1DalyTC74
 otfzMAFptDyKXpocPukkoTQ1rAgnrll26fuAjZ3lIbE+fkQlwd4ZhVdVLFbx3Zu9bYFT
 2YNn+KOmnQPFRkxE2uq042DLibMDPCtQ3G6ZdqGJWE2mzPSeXgV0JjpzTLC6ghG5XHZa
 Rpj7VVsgfKzmmwJiD2swqt/rM/pkYG3k+4DwFPxQUth+DR6CiRj4yPfvR6LrwKmjUSIN
 +KvA==
X-Gm-Message-State: AOAM533BDJNHqzKUQRb4FjnzdI5Qxuf41jav29FQn7m4bTVyJfHASweB
 ta75aMFmp/3e5SXpT40aAnmeJupM7ta8GEEKtDw=
X-Google-Smtp-Source: ABdhPJynywOppsd9u0oECrk1vvbMGNhMwoQbM2BOGEyu65aUGesK63Ug72+zCl1851ZeRt6xxCLsCVxmIABYLlwyQAI=
X-Received: by 2002:a81:1bc3:0:b0:2e3:aa1:f553 with SMTP id
 b186-20020a811bc3000000b002e30aa1f553mr28349485ywb.491.1648517754634; Mon, 28
 Mar 2022 18:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1648461096.git.zong.li@sifive.com>
 <d19daa503fb242eef00d79082931199cb3e48021.1648461096.git.zong.li@sifive.com>
In-Reply-To: <d19daa503fb242eef00d79082931199cb3e48021.1648461096.git.zong.li@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 29 Mar 2022 09:35:43 +0800
Message-ID: <CAEUhbmV67ms9za3BX9TvDah0_71gP0cRqGNLGJ+PCPG2Jxb-EA@mail.gmail.com>
Subject: Re: [PATCH v8 2/4] riscv: dts: Add dma-channels property and modify
 compatible
To: Zong Li <zong.li@sifive.com>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 krzysztof.kozlowski@canonical.com, Conor Dooley <conor.dooley@microchip.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Bin Meng <bin.meng@windriver.com>, 
 Green Wan <green.wan@sifive.com>, vkoul@kernel.org, dmaengine@vger.kernel.org, 
 devicetree <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_183555_387613_D04D25E2 
X-CRM114-Status: GOOD (  10.28  )
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

On Mon, Mar 28, 2022 at 7:25 PM Zong Li <zong.li@sifive.com> wrote:
>
> Add dma-channels property, then we can determine how many channels there
> by device tree, in addition, we add the pdma versioning scheme for
> compatible.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
