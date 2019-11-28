Return-Path: <SRS0=8Zuv=ZU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED61C432C0
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2019 12:20:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4938217BA
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2019 12:20:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NB4SLSOh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FRYu0UXF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4938217BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tUqV7U5pbjvjBCmoU0NTZ/ubTnNFdmTqbp5y6xeBPvE=; b=NB4SLSOhU5exoc
	NnZYFVnwXYEIAud2hHlpxjivcX//KU+4tcCRgurETv8LWChMjjDN+a+ULUhE6dZoBvhwva34aU2ur
	+g1KumqFodNJphX56WOjyd5bhxSEoVOBBble9oo6uv1A2AVyRGEvD4QszPq/zZwYN/RM4FQqIp5Dg
	s4kiWe26rfA2zmeFms3ybmO7sfqOEztjwDXG3IC3XQsoiuLP3lYHQK94bREWY8oDW74segEowOfzq
	ra0tYShOknbGmUEdpuv7DYYIvt5yODg37gucs0krWoxVS6fRnNizy5yTZ4z4Ca7fjELb/nwUWNy61
	bwhy6DiOhogIdRrBbQ9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iaImt-0000i2-Mg; Thu, 28 Nov 2019 12:20:47 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iaImr-0000hQ-2s
 for linux-riscv@lists.infradead.org; Thu, 28 Nov 2019 12:20:46 +0000
Received: by mail-lj1-x242.google.com with SMTP id e9so28261704ljp.13
 for <linux-riscv@lists.infradead.org>; Thu, 28 Nov 2019 04:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qmf6jeZshq1jDY76loZcrxtrhAg7lwPCb71uVMENsw0=;
 b=FRYu0UXFOIpf1bWRYoJ1c9xHbXgvePCRjx4PZ5IZ5RV3Yz07xamodlI746hL9a9kcu
 oM/33Jk8YUVjiLAWEcliFiYtvfVwP69h8KPk0v0GARBdSoyaSNFtsfMYbyX7Dqk9AABs
 W2Ftf/w30gEOA5INs/fO0ChaN4+or7M8h5eE61FnIshjUh38nh7BbyelaZmeOAL0hi75
 emwPQn9+FGy139ZtDVsjT91HSxrtPW2QsuEAD/AhE5pO+wCEJ/YlJy2U+74OENsvW3gQ
 wNux0h4Q+8bJN52v8Cdk7gR/N9vmkXJYOwJ1h3c1h26ULVZ+s7IBMeExpJ8BhUSIvipq
 qocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qmf6jeZshq1jDY76loZcrxtrhAg7lwPCb71uVMENsw0=;
 b=Ow9/SM6ZvgaZqT0o5JkLxUYkrCG9jwKXUxU+RepcRQp8qM/vRmzDXToXv6cwxU2qIB
 MmzRz7FvguYl/oPWV5brno4I1+uCS73/PNTsFIaocxSqsGDgdCIg5ijvnpL+w/lX4BnL
 bHNpLbm1AuVu2/AbCanuNfjFXIbYEWoOrTsUpajKEnvD+iyMTPrMxqq18EAM3GQ4P2kD
 0YIVb3jTyfdu8fx/5PaUeNjzU29uw7K9U6YBwrCp6c/9azZ2k8FydxazGqBLkRfdNaZm
 yfGXe5g+n9zhu8E8hvm8tCwL9DH4Mir2kOw4FWHBeeJ7k3jPGMdRPk28BLIp/rGItanm
 KqnQ==
X-Gm-Message-State: APjAAAX7DOfWq/2kpDMPzfND9aZtLzIJ0AiWDmTHYjPUhs7FvN9JCb2H
 N/8Fyz754uj739FubImFLhWlatjbz1uTHWg2pbRV/Q==
X-Google-Smtp-Source: APXvYqy5FIUKPl7C4nNCrIegY7/L/e3N0NOcZm89h/t+XCUHcKulKwvWZPZSi8sYlGYMiq1wU75t2SUzdLcDQIXtsPc=
X-Received: by 2002:a05:651c:102a:: with SMTP id
 w10mr5221499ljm.77.1574943641831; 
 Thu, 28 Nov 2019 04:20:41 -0800 (PST)
MIME-Version: 1.0
References: <1574661437-28486-1-git-send-email-yash.shah@sifive.com>
 <1574661437-28486-6-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1574661437-28486-6-git-send-email-yash.shah@sifive.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Nov 2019 13:20:29 +0100
Message-ID: <CACRpkdY7fGvTPcwwC0XU+XN2w_QUCj0MmOYhp183P3Lj7Qw8WA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] gpio: sifive: Add GPIO driver for SiFive SoCs
To: Yash Shah <yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191128_042045_248961_F71CE0EA 
X-CRM114-Status: UNSURE (   6.68  )
X-CRM114-Notice: Please train this message.
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "jason@lakedaemon.net" <jason@lakedaemon.net>,
 "atish.patra@wdc.com" <atish.patra@wdc.com>, "maz@kernel.org" <maz@kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 "Paul Walmsley \( Sifive\)" <paul.walmsley@sifive.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Sachin Ghadi <sachin.ghadi@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 25, 2019 at 6:58 AM Yash Shah <yash.shah@sifive.com> wrote:

> Adds the GPIO driver for SiFive RISC-V SoCs.
>
> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> [Atish: Various fixes and code cleanup]
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I suppose Marc will merge all patches into the irqchip tree
as they are logically dependent? If you want the GPIO bindings
and this driver directly merged (no deps) then I can do that
as well.

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
