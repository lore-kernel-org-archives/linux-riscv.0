Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D0B8C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 08:40:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45417611C4
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 08:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45417611C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+qGA5SrXu/J4ektSUtWRoqbKoTojMCJD6GbI02403qA=; b=ftUESz2+8hyWy3
	Ig8wuo+ZiYg5IxbngfAPwPE4byDFWAGmMEHl7W/oI1SJAp7B6QKschJ7FNwDVaVF0iveUumzTIVY/
	pUiLsIKkX/CPx3Pez9jbnfPy2EPbGb3aO70CN5moUpfHzuv8rvUYm1+QaLQ0enBMXlBEKqvZIh/Eh
	ShLZzL6DkE3e18N+Jq8N0jKk/qXd/hN4uKvT47QjSVpUzLxNYxdlzGA7zvgdJvOQm3ZzvkRBjK/PK
	MUGbrjZDHxQoAfykZWmCBZGRlyFvWvRE7nHs45tBPvnRxO0CND8zaPKViwUY7kb1ibH49IUaglP+c
	1OqrfPnK2/y074H6t8pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkMg6-0013VO-JG; Tue, 09 Nov 2021 08:40:26 +0000
Received: from mail-ua1-f45.google.com ([209.85.222.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkMfT-0013JM-Ep
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 08:39:48 +0000
Received: by mail-ua1-f45.google.com with SMTP id t13so21716212uad.9
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 00:39:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RhEU7/cMn0jM+Rvv1TDlHzOAxsTE31x17vOVQ8kJt3g=;
 b=Ma0QeD3elnFhj4EbQXu9ZJqRuAqa7+Ghl2rH6JXFCJWpRJCysfLA2lC5m8+B7PgPzV
 OoptznLgjVZ6HS0nqqOcDpAhu8Eo4tFv8fsCOigTGsXLXMw1+O+d2jQNNRHN4yK6WTN3
 KIXVkRXrSCqxgMO+6+TmcxU2UOU3yJk7P8kKWJGFTYs6puPfjbS15V3LAfYKDm9n39nH
 My7zYJbVTJDR/wbXwQjW5gT8MwdC+BLTAea9/vnbblmis1Qza6NPKmUhZJSay/HGDcqA
 XDVHh1JBqnVXdqUzcYwQB5urYWJmXZUA7l59Go7MrrKFF63XNo503/HAC6ggVHJa/dkg
 wdGg==
X-Gm-Message-State: AOAM531r18TVC9v741gB5UvdRZ/fEVpMO93tzGl+ETwwUf1WPPC3mQ6f
 78WM68qEOE0ByNnBvS26Oo0c8PXgMFuNrm18
X-Google-Smtp-Source: ABdhPJwnMAkv0bEVMj8JH0+bK7ORMem/j1LW2EGZ3t1zPRDjAGx4mWaiH6kfjcfZ72I3yg19fyD2xw==
X-Received: by 2002:a05:6102:c94:: with SMTP id
 f20mr9243388vst.14.1636447185840; 
 Tue, 09 Nov 2021 00:39:45 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46])
 by smtp.gmail.com with ESMTPSA id 3sm3634294vsq.1.2021.11.09.00.39.45
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 00:39:45 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id i6so36989577uae.6
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 00:39:45 -0800 (PST)
X-Received: by 2002:a05:6102:1354:: with SMTP id
 j20mr38560622vsl.41.1636447185011; 
 Tue, 09 Nov 2021 00:39:45 -0800 (PST)
MIME-Version: 1.0
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-8-conor.dooley@microchip.com>
In-Reply-To: <20211108150554.4457-8-conor.dooley@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Nov 2021 09:39:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWd_mXWeaDR+1SG=yoD=x6GGZwqXSH9pismXV=v2DOLhg@mail.gmail.com>
Message-ID: <CAMuHMdWd_mXWeaDR+1SG=yoD=x6GGZwqXSH9pismXV=v2DOLhg@mail.gmail.com>
Subject: Re: [PATCH 07/13] dt-bindings: rtc: add bindings for microchip mpfs
 rtc
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Mark Brown <broonie@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
 Lewis Hanly <lewis.hanly@microchip.com>, daire.mcnamara@microchip.com, 
 Atish Patra <atish.patra@wdc.com>, ivan.griffin@microchip.com, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-rtc@vger.kernel.org, 
 linux-spi <linux-spi@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Bin Meng <bin.meng@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_003947_536564_444368F8 
X-CRM114-Status: GOOD (  23.63  )
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

Hi Conor,

On Mon, Nov 8, 2021 at 4:07 PM <conor.dooley@microchip.com> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Add device tree bindings for the real time clock on
> the Microchip PolarFire SoC.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> @@ -0,0 +1,61 @@

> +examples:
> +  - |
> +    #include <dt-bindings/clock/microchip,mpfs-clock.h>
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;

Examples are indeed built with #{address,size}-cells = <1>.
However, there is no need to override this.  Just drop the zeros in
the reg property below.

> +        rtc@20124000 {
> +            compatible = "microchip,mpfs-rtc";
> +            reg = <0 0x20124000 0 0x1000>;
> +            clocks = <&clkcfg CLK_RTC>;
> +            clock-names = "rtc";
> +            interrupts = <80>;
> +        };
> +    };
> +...

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
