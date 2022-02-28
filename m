Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75089C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 19:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aGRLdB8fC7W1zMd3004ZKJ13RcDzRn5ro9ESWRC4qjg=; b=Za9lSAErwSsODs
	j7s3MwYrqUp0nD0SlH+ljRrR6bDr5EESBwRcIGuuWhNaMTb8O+54ULe8G2FXM1T7HTXrDbvmiskhF
	yzBAqKe2ZiaQo+eIyI0Vo0C3WQefnaajc2lI/so9FJNy0nHhEk/cW8cPabE8gfGYTtnazZjOpa2ge
	di/OgMdvjwt02t01pFqvd9dYNZcVQiIfINjkeJsDA8NEBLw+BWSYJxnMjB/5kP3BKV2nWfggzWluZ
	vXByxfQOJqWQA7afhCDw4w3iLEO45NeDCBMMJolpROQYK8uvpZ+sYG3NWl2Odp6Edm2obrJCwaww6
	siOnRkLhHc5MbmSCscQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOm94-00Dv0Z-MQ; Mon, 28 Feb 2022 19:57:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOm91-00DuzF-6a
 for linux-riscv@lists.infradead.org; Mon, 28 Feb 2022 19:57:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B58E360AC9
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 19:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22AABC340F2
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 19:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646078238;
 bh=l5lLRt3vCYUiYaHyAaMI2kjZl93YQn92cFQDfwENYYc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=A+gHE8ynvFySBYElIx1otyPFay0rvpFhk4R1i6htEBIkpbViL67XeFlpxC7qfYbHC
 adswbY2ndvA7R9wHtzVEWBSybHRfV5Q/ly9l/ZATgaJoT3A9sKgDm3SknViMkBoIJd
 7/on6FPbfEWACJEm4mpTOM9DUpVHmapxKlWaNFvgDDO/L+ym4S6n/5jy4CWn6PkcbS
 4nSNTijVu3T4ROd+izGeTRDoRluGibDsghw0N1qSo14dnoohCFcFtYM/bTm/AccsTF
 GfP3q7gJfxJrQrZThcj9lDaRu3p7ka0wTNNYRQvyIZwQ/HXaTl1Seb8jWcRBhdOBmE
 kj/WoGxs6rm3A==
Received: by mail-ed1-f46.google.com with SMTP id g20so19150184edw.6
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 11:57:18 -0800 (PST)
X-Gm-Message-State: AOAM531TdthbFW/BRFC8XdwosLPVfCW5Il2d+qGFrDxR456V4v4bEWoo
 azgRxwEBH2cJROe02cc4/OHHUGJr9jK5xcklAg==
X-Google-Smtp-Source: ABdhPJxu9XPcGWgUlPnfAVpPTPRsS8IAALKfEklJS+km7TveFGDFfTWE5+3j5LJ6ScmR5br0jvLWLJoTEZjDJKHIAzg=
X-Received: by 2002:aa7:ce92:0:b0:40f:b89c:18fe with SMTP id
 y18-20020aa7ce92000000b0040fb89c18femr21239364edv.67.1646078236360; Mon, 28
 Feb 2022 11:57:16 -0800 (PST)
MIME-Version: 1.0
References: <cover.1643360652.git.geert@linux-m68k.org>
In-Reply-To: <cover.1643360652.git.geert@linux-m68k.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 28 Feb 2022 13:57:04 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ=hikc1RAFkdV-uGWTVyHKp8z+=NEtTm-WZzc9h3Lxew@mail.gmail.com>
Message-ID: <CAL_JsqJ=hikc1RAFkdV-uGWTVyHKp8z+=NEtTm-WZzc9h3Lxew@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] dt-bindings: timer: sifive,
 clint: Miscellaneous improvements
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Anup Patel <anup.patel@wdc.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_115719_302989_ACA83E9F 
X-CRM114-Status: GOOD (  15.16  )
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

On Fri, Jan 28, 2022 at 3:07 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
>         Hi all,
>
> This patch series contains two improvements for the SiFive CLINT DT
> bindings.
>
> Changes compared to v3[1]:
>   - Use architectural maximum instead of practical maximum of 10,
>   - Add Reviewed-by (this time for real ;-).
>
> Changes compared to v2[2]:
>   - Add Acked-by, Reviewed-by.
>
> Changes compared to v1[3]:
>   - Split in two patches,
>   - Improve patch description and document limit rationale.
>
> Thanks!
>
> [1] https://lore.kernel.org/r/cover.1639744468.git.geert@linux-m68k.org/
> [2] https://lore.kernel.org/r/cover.1639662093.git.geert@linux-m68k.org
> [3] https://lore.kernel.org/r/20211125152317.162958-1-geert@linux-m68k.org
>
> Geert Uytterhoeven (2):
>   dt-bindings: timer: sifive,clint: Fix number of interrupts
>   dt-bindings: timer: sifive,clint: Group interrupt tuples
>
>  .../devicetree/bindings/timer/sifive,clint.yaml          | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

As these have not been picked up yet, I've applied them.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
