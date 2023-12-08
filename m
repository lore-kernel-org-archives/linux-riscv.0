Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DB1C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 16:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=96+eLVq+5MrZcuvOa6mqtpzIb5hAU2lxr8SNJa0Vfzk=; b=letdBwdweH5F4BQ1duX1TB5iW2
	2Smo/sHE0COj48W1+4tREqi5e+XDB3zvX1UXZaQLgb/Y62HMS1s1UOq8Bv1HoWc++i3HBLDyIVDxz
	4ol1xgjp9f9z9EYXRwivXqGoLuHZN7Wz6ymqRTvpwGIIGs1PMFSz0a6hStgQTQ31p4Y0VNofbYttt
	AE8/u2bUQZEktqOdnnIRyiH5PJ16yHnqNEyr6OIS3zQjr5MV9hWzbKPbt+NnpE/9vy7gPHfvntPmW
	DzkdqCg3Ryr9j6igW56I6Vz4yuoxcGUu8hVxWOz5GjfWjNS3TOmuXw72wcZ7jl5XuXiXId+W6yWts
	xwziuRwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBdMC-00FyRc-33;
	Fri, 08 Dec 2023 16:05:40 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBdM9-00FyQK-02
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 16:05:38 +0000
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D6E0940AB2
	for <linux-riscv@lists.infradead.org>; Fri,  8 Dec 2023 16:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702051533;
	bh=NPjAizr1MOai52nap908c7Q+sjbuL1SW7438n8FuRps=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=CLeHnkjTEXizPKVW9PXMldAiB4zVUIgg5jwBu/dtxTdAdz23KCAmbPbdgJcR9boBp
	 aF1gxUWYL27Kbcx1Pg92+KDd8whjvb9MLaPhIsRdDmgAZEr4ozU0Zn0lXwMkA3hPBF
	 uQiqnpwIfF5+myiXNbenbYCl+2K/tUs5oaOrFOR+D3/4FvnlJVuyW8S46LBQc5Y4Jy
	 DSR3AzqDXeicI4kyA2NI5VnP+jNB0k4PZaKgpbpxY0yYitRJ/Cnp+2W3hLcYBnR//M
	 e1gU/Tqo0vsduQI/eIf/qjto+EdPqUiqcnWKK6mi5f95O/3TrhsRAXIEZGurFo0Hc2
	 Fu7phetzZ45OQ==
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2ca0fb01500so14279751fa.3
        for <linux-riscv@lists.infradead.org>; Fri, 08 Dec 2023 08:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702051533; x=1702656333;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NPjAizr1MOai52nap908c7Q+sjbuL1SW7438n8FuRps=;
        b=Ysx3ShGx66fh6Az1Q2k8iWREqPBQRDCoC8dbjnatbE8O6w3YIFjYYpOCyDZVc6v4Me
         3oRpRokZ0diG2W0nGHpXuqtInR61Sv0BIMiYGtzPB6LZwvt24IeGhXnA+UwNZCLBCYCU
         YiLn/8obwm+ixCY2Hi4xePA2gHX1qIoG+PmcvnhsEN8sderjIXEDT7AISfGj3CkAPXCK
         w8mhBvKzyxElHgk8JZVEHodQt2TEXAj6xRXjB7u8zD4KQdbKW0rpEaTbE5Y96wbn1SMW
         7V7v15ahtJk9ag+VU54iQNGqx9BUhKOHQnafQZ9OCu3rnNEPZyq7znobmfN4mQ/CtpJC
         CtCw==
X-Gm-Message-State: AOJu0Yzykt3TvbLnLxz6uceCZu/35mrO/ZtZPp0IsVRF89444lS0y7mD
	6L+Kg+LndJzFIDYYL3G9ckdqV944gXBDGxXxV3nJx6zEmAVrJqCfeDulzy3xJ1O5anqh2GYeJVG
	wFFwmUwgm9YdIcNWvvyhD13NHHeXSZ2uSZZUY0BOxWq0b6BugpStcNxaaFUT8lg==
X-Received: by 2002:a05:6512:4894:b0:50b:ef17:5136 with SMTP id eq20-20020a056512489400b0050bef175136mr42290lfb.154.1702051533069;
        Fri, 08 Dec 2023 08:05:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgfEA4LBbLEwJ04GKNCXCYVhgqscCJbjoiVfiXJNCGNQMCBQy0BVcPeUSngDtE9hH0oJFzO52hRcf04wYtCO4=
X-Received: by 2002:a05:6512:4894:b0:50b:ef17:5136 with SMTP id
 eq20-20020a056512489400b0050bef175136mr42276lfb.154.1702051532771; Fri, 08
 Dec 2023 08:05:32 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Dec 2023 08:05:31 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231201121410.95298-7-jeeheng.sia@starfivetech.com>
References: <20231201121410.95298-1-jeeheng.sia@starfivetech.com> <20231201121410.95298-7-jeeheng.sia@starfivetech.com>
Mime-Version: 1.0
Date: Fri, 8 Dec 2023 08:05:31 -0800
Message-ID: <CAJM55Z831ucY4QqPTR_0zJVB05UUT4W-3M0CGzvtyPo=AMD=Vw@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] riscv: dts: starfive: Add initial StarFive JH8100
 device tree
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>, kernel@esmil.dk, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, krzk@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	daniel.lezcano@linaro.org, tglx@linutronix.de, conor@kernel.org, 
	anup@brainfault.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	michal.simek@amd.com, michael.zhu@starfivetech.com, drew@beagleboard.org
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, leyfoon.tan@starfivetech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_080537_435365_F81852AE 
X-CRM114-Status: UNSURE (   2.84  )
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

Sia Jee Heng wrote:
> Add initial device tree for the StarFive JH8100 RISC-V SoC.
>
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Looks good to me, thanks.

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
