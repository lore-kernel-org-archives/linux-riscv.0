Return-Path: <SRS0=8Zuv=ZU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB525C432C0
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2019 12:18:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFEB2217F9
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2019 12:18:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lEEotvnI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P9He/jdZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFEB2217F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cy1rigvI/5d1xlXOAPyHSP2OHA5ceojLuVQU8b6EWkI=; b=lEEotvnI6F/kYA
	V49NbnYcNdDFIFRa+BhDmcEcAV5Te3029ZoTsnQnhJfgngI1LLks14m5/2VNx3A6ZF/aZoCkhukee
	LMSNTpI7aEJgDum+2y18gho/rFVB5JtQXWZ8PZhaedm3KA3dp3t4nlf/jp9P9F2ZxSVV8vbkds3AK
	rmsd+AUQaH7A18ID+T0/aqs2fucbu7X4N12Ryezgf4C5YHvWeEcEJMg7TytVfz9BG2rUGuk+iylq7
	GXzTMw4pLAlSnF+ZRyTzsDr9OQQf6LUCN7zD4L8PjFHsEusB4pqKs60VeUjRd3hW+NJw7JOBT5fKp
	/4ajZGNC2196pp+/aoZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iaIkg-0007fq-Q5; Thu, 28 Nov 2019 12:18:30 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iaIkd-0007fW-L2
 for linux-riscv@lists.infradead.org; Thu, 28 Nov 2019 12:18:29 +0000
Received: by mail-lf1-x142.google.com with SMTP id l18so1876965lfc.1
 for <linux-riscv@lists.infradead.org>; Thu, 28 Nov 2019 04:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+9HaPIwDGWIORg/ZtcvZAIKmu4aZIOqFrtCVzv15Uo8=;
 b=P9He/jdZelhAF63c66JOtESkD9SWLHGoK4fcKXecnAKf5ycE/xInVMP5Id/tMj3hH6
 Eot7YcHkj6OIenHQPCoyPdDUMMGen9pcS+VlrkT4DTKC4AybqCnhpzdjooSoRj7PVtHV
 ECHxDrBKPIoRWVvwdJu+FH9TbmcBCA7YyDG2L2Rcfld6g7X6DH1nXRnyvIXtipPtyGu0
 OIJUACG6vpMSL4VRwwpCnhSEGh97UwtAOzcrV90ler+nsjpdHlOmdo40cQk2SkGDsGG4
 D5C017GmYOZtYttdL71Ygqefe9MCirKwDf1Htcj8o/01X5bZAL7OZv4XkVAUxYzWfgqa
 Z9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+9HaPIwDGWIORg/ZtcvZAIKmu4aZIOqFrtCVzv15Uo8=;
 b=VwsLe/X380uTr1N9mr6APbWS5KklkJbXsUrtST5pp5+Cfzp/Gl2ExSWodU2gqtrPfv
 BPBVClAM+k77afjLbMro6KjKafBJsipY5It2pD6cake0CuEeN9Zg0YsTJjfFTmasofna
 +Rt64P8h217XbTg7dLPZeCZUho/O9AWhxr7/Xak2daRXdwktBV9NdDRvnmIBCnfHh82Z
 NUCKT38NntWt0dkcEtKduc8gO4tg+yINJL+jmtu6zsLNwdFdar0raCnrN8ByA8g38xdL
 LvRy3C5mvbR4lqZPjahV9W/INexFv0ysw6otcfvABn83Nciw/rwCUhR8oBcCA511rOgq
 RUXg==
X-Gm-Message-State: APjAAAWO8slryoZ2ZgDfHQTxdB9z5lIvD55ZuEL2+kHx1NzZnqYgGUYW
 AaxpJG2ArchHEEEXWpSlqMYLOZDsO78xDh4Ko2/3Cg==
X-Google-Smtp-Source: APXvYqwfcdHhm4gyrSY0PXoqGz1WH61ou574arqZCBcFKymILHOQyJwQZjM0A1Ke/HyiK4TldEM2Asch76SNuXwaHnE=
X-Received: by 2002:a19:645b:: with SMTP id b27mr21863272lfj.117.1574943505250; 
 Thu, 28 Nov 2019 04:18:25 -0800 (PST)
MIME-Version: 1.0
References: <1574661437-28486-1-git-send-email-yash.shah@sifive.com>
 <1574661437-28486-5-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1574661437-28486-5-git-send-email-yash.shah@sifive.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Nov 2019 13:18:13 +0100
Message-ID: <CACRpkdZt53578c3tWFodq6-HwNzc+gp6mc-n-8-GKkGyy61JKQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] gpio: sifive: Add DT documentation for SiFive GPIO
To: Yash Shah <yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191128_041827_720874_35A307E2 
X-CRM114-Status: UNSURE (   5.49  )
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

> DT json-schema for GPIO controller added.
>
> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> [Atish: Compatible string update]
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
