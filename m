Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA671C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 19:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vwaCGugfWJGhRg5izUrALCFsDKgQ1ot6O9LfdKGeGFQ=; b=uOkhc+1sOIONTO
	Dk9HPd+QpaA82apL4Dc7vblfBfBS2CGvK+LpU0XNaXOKeoKBLWNrR9gQg60KbMq90b1CwpC8Nt6ff
	6cVXWSFM29qPhin75mQk3KzmrecsahNTjnDf4O0aI1n7EXZxue3OIVpjKGyTG0KyJO5zLD1d8yNpV
	wo4yZoIHPyASt8NxkMRIISKKSUf68PeHmlde8/J4xjHZ/xP+DxrKKOnSaMjn+5KMfUqofGkgcpLCj
	52UEWCPrLwglznvt2tA9dNHXq9lEOXG9uGFdKJeus+dfxyK6tjvXo8w4KiIW4QRzcWp8cI6Nyirzi
	lPba4Tg/5LgnNZ5EhzXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj4Bs-00Crin-Df; Thu, 13 Oct 2022 19:48:24 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj4Bl-00CreT-V5
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 19:48:19 +0000
Received: by mail-pf1-x433.google.com with SMTP id 67so2854592pfz.12
        for <linux-riscv@lists.infradead.org>; Thu, 13 Oct 2022 12:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HEEvU1WRCn8Pz+Xrx0i1sBR3oYcOXgM9wHphIai/kos=;
        b=PdHkBHnIuCgx63ErCfhFwNqHRaO05dSvLYStnTWA+Yz7GkPaQM8y4w32Ba6mtG9PHe
         90vClTZmju76a0w0wZ+liTW9z8MaLFsdKOJgRe5Mrv2Z/xH19pLF3YS6aXxy6IfABlm4
         jxulVNACfDBiGE2UANEQI7PjZIBt92ZoWapMN9Sd9CfOLnhMXhaRKF3YMRTyiELMzKPr
         whqEOqlX+YbpwZ6xyGFyTYh0CT4ebFCamTQiIN3h5j0G9vMgoSfCM2Xo6dVyLX6C7ICM
         nHkWE1Q47a1WwWjw8q8ky70CZdoiHffoM2vb0pFmkk4HFK6I5fajM3HU8CQZOeXEF3x2
         mZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HEEvU1WRCn8Pz+Xrx0i1sBR3oYcOXgM9wHphIai/kos=;
        b=mIHY2tzvDnAo5iGSzPTExnvxHcelix2Yoe5WctkcHwABanpUDIyfR1mRny6nWz9fm+
         uR0PNlkFVcHpzfUyoWqgVs9Jt41tniM8zNddSBu2aKjyGZdV2WaR3Zj01DVUxr+B0dV9
         k+3XiDCIeMLp4YMX1cGbqyoyTqadOGqpK1lX77S8JUU+R4ms1IVTE/AY/K0kxMGaKkif
         b9hlNeKxHcWz/vE39F/pwHsdvwySn/bkFwkDUyjA/CN96sj7xP6Oqg5dPuMZ9LNLpNZ4
         AYuNHHrKhg1TQDoXImNByt3KiSJmPfq+U1Q0fmXDoSLlcqWpzVCkmwdZnzlA2fWtJe89
         fVjA==
X-Gm-Message-State: ACrzQf077oDd55hdw9t2jOviQpWHT+nx4M1xwVyNqRAClfJTuDm4i0ze
	BcwmojS6rZYgqGFpmDrqWHsrzxOhjt0UFe1Z
X-Google-Smtp-Source: AMsMyM61ZQf4FwZ76HDrN21ZOkgGMGkQ6x+DVTQIHOnwY5v9xssjY6lcnqOHVw2LHzfALa8MIyzI3w==
X-Received: by 2002:a63:fd4f:0:b0:45f:d7ef:9f94 with SMTP id m15-20020a63fd4f000000b0045fd7ef9f94mr1355986pgj.137.1665690495004;
        Thu, 13 Oct 2022 12:48:15 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id g3-20020a656cc3000000b004588814ca73sm102206pgw.21.2022.10.13.12.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 12:48:14 -0700 (PDT)
In-Reply-To: <20220729111116.259146-1-conor.dooley@microchip.com>
References: <20220729111116.259146-1-conor.dooley@microchip.com>
Subject: Re: [PATCH] riscv: enable software resend of irqs
Message-Id: <166569033642.14806.6789271039853052631.b4-ty@rivosinc.com>
Date: Thu, 13 Oct 2022 12:45:36 -0700
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-36ce3
Cc: samuel@sholland.org, dfustini@baylibre.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_124818_019734_30D004ED 
X-CRM114-Status: UNSURE (   6.04  )
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

On Fri, 29 Jul 2022 12:11:17 +0100, Conor Dooley wrote:
> The PLIC specification does not describe the interrupt pendings bits as
> read-write, only that they "can be read". To allow for retriggering of
> interrupts (and the use of the irq debugfs interface) enable
> HARDIRQS_SW_RESEND for RISC-V.
> 
> 

Applied, thanks!

[1/1] riscv: enable software resend of irqs
      https://git.kernel.org/palmer/c/c45fc916c2b2

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
