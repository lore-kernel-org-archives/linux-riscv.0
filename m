Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FDE3C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 04:09:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 407FB2064B
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 04:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 407FB2064B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GCqWHfY538F3/riz1ScHfAtudzQitz/aWp199vnXpvU=; b=D1POs0Yni84bPpbg/E2OXfvtY
	3H22aOyjbeZi+MSzIa9vuU+wSnuBjxPwOdnl5036F4lEzvme9tO6YAIYxJxsNYakkFakwHujvSJS2
	rd0bhiCPmArsOjgzcA6LECfkrbeO5MsgEHI48qqCXxN2p/nR7vPqnhMFpbF5gZGOBDknqYVLF8mji
	087bWcrctuh+mQswn/YoZeoWo41KmpN20bSRWvTDqS4Zu6YECKfo2jLmc2irWPxM9/4/FL0nuxtzQ
	BYWwnMhQwq5YLZIZT6H3sZVtuPBRSAe9Od/bqx9/hq6VTDlgKKJ05/zZtTf1dWEWSRJXFhqxmT0Kf
	rI3tUVNVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1Lr5-0006Je-46; Mon, 18 Jan 2021 04:09:27 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Lr3-0006JH-50
 for linux-riscv@lists.infradead.org; Mon, 18 Jan 2021 04:09:26 +0000
Received: by mail-lf1-x130.google.com with SMTP id x20so22044144lfe.12
 for <linux-riscv@lists.infradead.org>; Sun, 17 Jan 2021 20:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kKCfYpwo74RsICpySZjG8kYYtlGFYkZdkFNgkyDKCT0=;
 b=AhP6NwUJdS6wWmHjt3HVF9oEPO27LTk5ZVVsxfNNJTMJp4YreqXTOfX10k/oD9Iezt
 dPoCBKQfITeUdF9ZwOVLLSdBNnkPxn6C/waTP0lhhjVLkvDe0nH8PCUsk2ocEltwo5d/
 UtNXbXKZcmomHLmiiQGa/MZ0uAXHsmBUGD1bFvU+4VAkjw55pUE9tsszsDvS+C497hnt
 Tg1MDAYbZgFEJjcjE9s39o9ntWTVx6WuvpWDYNFOBMTDiNMnUjgcJ3GdeDkb4Tz7Vc3Z
 Et4Qgio5JzLD81e1Tgb872rmEeNIRGeiOe08Hch0FH41kuJNVeiuGDq1JP1kI8cmwXQ8
 ystA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kKCfYpwo74RsICpySZjG8kYYtlGFYkZdkFNgkyDKCT0=;
 b=Mg17+KmfsaE2aX+vcpIRi6zftWisOjM1dXbsH8gCeLqhwNwCuUujGTqxPfcAd3nMhE
 YQAARpFwo/Kfr9s1+KzU45FCAPBntC1JQ+vH8x7X1D71mSZXDWBCO37PJw69yxt5ZVWr
 WKXQLBf5MdQ/VxHZGwDLOhaa9v7bft7CjrD3PWoanclA/oERq2QKP3AuaTUYkM4CEX6H
 QfFL2XLOYeHuCbFE3oCu8qbdMdluyQZ85T0XqpqsXBC0uawmyPAW4I9WRFZsNCpq5MO6
 o7cmhEzPsh3iz02MQZGQpv508l+77m28eEYA2PKKoLDrm2N32Vi3+OvJ2MIw5n+iBJ23
 5nhA==
X-Gm-Message-State: AOAM533dXteiOo5dqZfZ9tnsaSGwMXn6k6ooIYoig6WEUKdQaht2Ll3b
 el3pMttkaAt8d4b69fi0snvcOBcGMCgx1hu/6JE+Uw==
X-Google-Smtp-Source: ABdhPJw87g/8egB7b0xP0jb75QeBiNosVXRLBEN4XgOceeOKqXL+Kuh7KPX0ZjWPRfqEjlvRbpZdIED/dekKQwpxGxc=
X-Received: by 2002:a05:6512:234d:: with SMTP id
 p13mr10075578lfu.87.1610942961812; 
 Sun, 17 Jan 2021 20:09:21 -0800 (PST)
MIME-Version: 1.0
References: <20210118020244.103451-1-damien.lemoal@wdc.com>
 <20210118020244.103451-7-damien.lemoal@wdc.com>
In-Reply-To: <20210118020244.103451-7-damien.lemoal@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 18 Jan 2021 09:38:10 +0530
Message-ID: <CAAhSdy2BqJddRbCWR=jAsjvB0GUWbwnF9T0rJRgoFnKZnJZ2CQ@mail.gmail.com>
Subject: Re: [PATCH v13 06/17] dt-bindings: update sifive clint compatible
 string
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210117_230925_291261_AB46FB64 
X-CRM114-Status: GOOD (  17.33  )
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Anup Patel <anup.patel@wdc.com>, Sean Anderson <seanga2@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 18, 2021 at 7:33 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> Add the "canaan,k210-clint" compatible string to the Sifive clint
> bindings to indicate the use of the "sifive,clint0" IP block in the
> Canaan Kendryte K210 SoC. The description of the compatible string
> property is also updated to reflect this addition.
>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../bindings/timer/sifive,clint.yaml          | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index 2a0e9cd9fbcf..1a7d582a208f 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -22,16 +22,23 @@ description:
>
>  properties:
>    compatible:
> -    items:
> -      - const: sifive,fu540-c000-clint
> -      - const: sifive,clint0
> +    oneOf:
> +      - items:
> +          - const: sifive,fu540-c000-clint
> +          - const: sifive,clint0
> +
> +      - items:
> +          - const: canaan,k210-clint
> +          - const: sifive,clint0
>
>      description:
> -      Should be "sifive,<chip>-clint" and "sifive,clint<version>".
> +      Should be "<vendor>,<chip>-clint" and "sifive,clint<version>".
>        Supported compatible strings are -
>        "sifive,fu540-c000-clint" for the SiFive CLINT v0 as integrated
> -      onto the SiFive FU540 chip, and "sifive,clint0" for the SiFive
> -      CLINT v0 IP block with no chip integration tweaks.
> +      onto the SiFive FU540 chip, "canaan,k210-clint" for the SiFive
> +      CLINT v0 as integrated onto the Canaan Kendryte K210 chip, and
> +      "sifive,clint0" for the SiFive CLINT v0 IP block with no chip
> +      integration tweaks.
>        Please refer to sifive-blocks-ip-versioning.txt for details
>
>    reg:
> --
> 2.29.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
