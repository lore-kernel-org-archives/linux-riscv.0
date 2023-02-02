Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53668C05027
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 12:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wvX9hqHPW6wGnPVZqp7cCtl0/bvaVK8DJBypcY2Z89A=; b=fgPzL5T7aPOfW+
	kzIa59Z1ABv/J8LMhNK2x50s9f+q1bQNa4JEzJ9Zfec+bm0WczrV6rwBHKTJVgF4gfvBFeGHYgsWC
	ES0+TCX3JBERUcub/cRmxogq2QImxDMS9EFhrVzEk0DU7u/D0/xwLLxFAxM2N5ja4QMbx0usGv1ha
	o7tVZwp9kSQcBYk90AGfKV68xIM37hHCrRIj+q/5LstRJ8mj9krX7bPH4T3KTON7iC8FI97+AhSle
	CwCK9gBL/uBhjegPkTO+67Pc3vb3rJUpOLxMx8qVpj5ycNdvdCLx6phJqja4Dw7JzMbkACMhmImNI
	eP5b4/+P9SBE8FnjT1og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNZ4a-00Ft8w-Df; Thu, 02 Feb 2023 12:52:16 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNZ4Y-00Ft5J-9h
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 12:52:15 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 123so2012228ybv.6
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 04:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iTEsYvNbhZUvr3t5FDyaBPDIayK5soN0V1YA6KoE95Q=;
        b=PPfSS12X5711vg3bhuNrJmUVkzvhGet/0lNfQTXDPw/wtNntkEWqMG9cO2+AQaapQi
         MZJcaRC71fY2ZMHLvVtk19QBWC1mCJPijp0uWxSPYRqKKnRf1wK8sVEE8LuBsjsuG+5t
         x1Qfdfr93US48KlEdOPNzlN6NNSHJoWxD+ccOAxBTB+PoK6YHr6Fn8j8ialUwaevYP2c
         aixY6bNdQwbQ+vFjTT8ZPOtdFdyJvVNLLrIZFSz/pqtkbGzYjg1HuIz6De2bTmz4GpwA
         Qam0sl8kV1yAtcdu12tzoopbHGDis2sPmqKBDume7Nod8LxoXbavP03tvajPG2IFZ/lT
         sPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iTEsYvNbhZUvr3t5FDyaBPDIayK5soN0V1YA6KoE95Q=;
        b=UsqhUcTiRAX2cA2igET2RYYaGa6ZTpoAocQODtyZwAhLxZZB+ykr6+jYGuJ/BUyWqy
         33uMX9pZWtZdStsxGS9qv9C2qjY7M+M4AW0Uy0FEv8xxz++2CmyoAkXHsvUmrAuywEID
         K4yK+AGg+WSlQ82eUFVq7LzVsUtVrg8wMED7kARaPzarzvmj2zUvWxL1oL5lLIuZ3Qz5
         GsQPhN84ewBU/e87/OTA1JOW9E4Wr+G8yyP6YPTUpHms9BM5y4OzutwWXzXzwUUrYKKm
         xm0EpYAk3nvXjRT6sZx6l+TbKYNAyf+CnK55BlJC3P3q8E+tAL2sfbdIE/aX4LE9A+DR
         zdpQ==
X-Gm-Message-State: AO0yUKUu4ksmAEIg78K7zUjqq3Hkg8StmMWrJohYtr7m1YslnavmRXll
	3s3DdN7uiHnQ83okFW99NROq5QmizVYtYevLocSUag==
X-Google-Smtp-Source: AK7set/IzybDVeByN7olzBbtRq2zPCd8ReB2ZColcl64XBQe7/HYO17UuFBtuhM1xYbR1EXmfXF7asG9PYGE8qn+MFw=
X-Received: by 2002:a25:fe0a:0:b0:7ca:9b40:72a7 with SMTP id
 k10-20020a25fe0a000000b007ca9b4072a7mr435003ybe.130.1675342322566; Thu, 02
 Feb 2023 04:52:02 -0800 (PST)
MIME-Version: 1.0
References: <20221207131731.1291517-1-william.qiu@starfivetech.com>
 <20221207131731.1291517-3-william.qiu@starfivetech.com> <CACRpkdYP7MokLdRtxX9w7p80c=wHDHsoTYWrU53CnpsZ7o6aGg@mail.gmail.com>
 <4529a646-1faf-c858-cfbe-1560ebeb1fba@starfivetech.com>
In-Reply-To: <4529a646-1faf-c858-cfbe-1560ebeb1fba@starfivetech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 2 Feb 2023 13:51:51 +0100
Message-ID: <CACRpkdYAP_WYwfiFxXybqqa8OJw98cxUwJgW0RUCgLLGaV+LJQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] mmc: starfive: Add sdio/emmc driver support
To: William Qiu <william.qiu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-mmc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_045214_356213_D65C5400 
X-CRM114-Status: GOOD (  14.58  )
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

On Thu, Feb 2, 2023 at 12:10 PM William Qiu
<william.qiu@starfivetech.com> wrote:
> On 2022/12/9 5:09, Linus Walleij wrote:

> >> +       priv->syscon_offset = args.args[0];
> >> +       priv->syscon_shift  = args.args[1];
> >> +       priv->syscon_mask   = args.args[2];
> >
> > Why should these three things be in the device tree instead of being derived
> > from the compatible-string or just plain hard-coded as #defines?
> > I don't get it.
> >
> Hi Linus,
>
> I'm sorry to bother you, but as for the definition of syscon, after discussing with
> my colleagues, we think it is easier to distinguish SDIO0 and SDIO1 by defining it in
> the device tree, and the code compatibility is better.

OK sounds good looking forward to seeing the result :)

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
