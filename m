Return-Path: <SRS0=VVci=OL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC05C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 11:42:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9600361166
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 11:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9600361166
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vb8zFb7zz8lNev62F7NwC7c5S2SbC9MfmLKhjLwmSg8=; b=RbfTQc5jASw9YU
	hxMmKfCjx97gK9cTDPc0YwdxMMC+uDkp93rAhygdjctQkwWEPK8NVptHA1JrzqnnzA7HuGafWw7Zx
	zegDBdSqdYvj1DVMfy6U02uAzqWImIVDomNuYbmGhs0eGq+nWdbPe1jyG8xKVkuXQolb6MSZbSkym
	VYJCVdWKotxxl/c4PIuQW0mC3vFhqV4t4CdaNmoNIGW4qfYJGN+sw5P0vFKcoWCB9zCUmtxodutGV
	gc/LxWKHkv/aMZrmm0yJgHLLs5+tFdUMtFScpA3Cv95gBhiOcXlT0ZLc4eJ1CJHLVGye2Fb9IpWKQ
	hc4ULP13FCJGOdkAuxcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSeAT-004Nki-H8; Tue, 21 Sep 2021 11:42:33 +0000
Received: from mail-ua1-f48.google.com ([209.85.222.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSeAR-004NkA-0E
 for linux-riscv@lists.infradead.org; Tue, 21 Sep 2021 11:42:32 +0000
Received: by mail-ua1-f48.google.com with SMTP id p9so13240058uak.4
 for <linux-riscv@lists.infradead.org>; Tue, 21 Sep 2021 04:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bdpYVMEOAHnNRkmR0T8flhT/zcYkeLeqbkwxnc5Ce/A=;
 b=1lubJRrwA8cfDyvLv/jVUAOhCqx+fhc4NuNu26PgQfJYcSjVqNr1TaTd6cAZ2orhyp
 qCNYEtFwjmLvy+w/Av0s5pFJn9/vHKe2os4t4V2PGpeXpEg4Rcy/rkWya6QdqXAgDnqd
 hGIrAxaJs9l/5z/qr6DQUuIodZN0xKWuplxa4OR/OjyVJHYTqyh7Uta9p9keMB0+Y1mV
 oNOE7LyFlMmmCDL6HDm+9xSCCKnrpRy2JzmFYudcRO1TzpuFYaar+1FNcztMVq+NttXx
 XbZJ7gZV+hFc0RhzliPYWE16ByyPYZcT4YnPY2I2vTCJ1alaiw8HTxGbnVu85SH7oWXZ
 3tPw==
X-Gm-Message-State: AOAM5303E7UOhSuwq6CUVRyem7z76eR21QHQ7Z2SQFt3/U8yTVZOBgKL
 2maSi55/Na3A7QkYb9wUwTZBw80s+DncnAruDEI=
X-Google-Smtp-Source: ABdhPJz660eJ8xFUWw21pLpoUoGUDUdkLS+vBfnrRwGe4YQC/sE0pLYK6sPltWQcEv22OrTdq3COoRkKQwR/vpyKOic=
X-Received: by 2002:ab0:6ec9:: with SMTP id c9mr17013019uav.114.1632224550054; 
 Tue, 21 Sep 2021 04:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210920150807.164673-1-krzysztof.kozlowski@canonical.com>
 <20210920150807.164673-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210920150807.164673-2-krzysztof.kozlowski@canonical.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Sep 2021 13:42:19 +0200
Message-ID: <CAMuHMdXH2rKKWmMF9PT3V54kiyO9qOJXEUwYYm9UunXdG3Vbjw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] riscv: dts: microchip: drop duplicated nodes
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Piotr Sroka <piotrs@cadence.com>, 
 Linux MMC List <linux-mmc@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_044231_083454_E377E3CC 
X-CRM114-Status: GOOD (  16.88  )
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

On Mon, Sep 20, 2021 at 5:09 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> The DTSI file defines soc node and address/size cells, so there is no
> point in duplicating it in DTS file.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

(from v1)
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
