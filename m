Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D092FC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 22:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6f7aqTi8jpKJpkoI50m/T31zKg7lC9nTUTKaa/Wd0bc=; b=cuskUq8fD9vm+Q
	m4sz/1xh1f9fksvD386zCDwOvTkbp+/i5DPWMeCHqcA7OXn4RMUnREJ79KKcg5f67FIQhtih0zbYS
	44wpPyMEsXewfz7mWOziXd3NK2JrCL6oIFNPmO9ayK++FJANxVz/62/Nzz8ydNqBSTb884AOESFYw
	9O5HtUt6oq/kKvQHCJBXKCEr7qh/iRWVZ1Varg8gzaFxWDa17DVjREzyV3htbBKa8vAQmMVPkMre+
	I1tt+X/wtkp+IwLxNyug3aLLo/NFuXqMq2/DW2ccBkWtH8Q/6zugfLYIs3aQLCfeYMEp5MZlw0ViH
	Fi2rAv1mO5gCrvcaqtjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3lko-00BplF-SK; Fri, 09 Dec 2022 22:22:02 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3lkl-00BpkQ-UZ
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 22:22:01 +0000
Received: by mail-pl1-x629.google.com with SMTP id s7so6332468plk.5
        for <linux-riscv@lists.infradead.org>; Fri, 09 Dec 2022 14:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=niC8DHNdli72dkTtj3DZWi/AbOXC/tYolRKli5nyqno=;
        b=zD1pfDeBi8JQ5NpCavO1bP6tqUGc9B0z3S8qAlFXPUS05th21CMN4L/3tVPNJ0Ndka
         1lqFdGOM06ZgF64k50tpj0VMpu5a5F/Amoz/+f63Q55VIJ2miSDAJB6/PWww+GbASUpp
         ZjuRe2WRxVtRrncwuapw9mqubYs9S9NvKihMdZyqRTtrwBwhdIXoHdgCJAqGLmSZWESU
         zUT+paoe48nllHZhD6cZh7jpfy2e7jC85uwKFJPQFZ6nRNBUrZIqqzJ5VzVDeqxZj87H
         cAtd0Bg2kO6vSHBTupFZaN802/9GE5eAa0rePnPvpr/5PqD/YROvHl2233UU/9fNYj/0
         iSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=niC8DHNdli72dkTtj3DZWi/AbOXC/tYolRKli5nyqno=;
        b=HgmdK5cTDWtlSHSXQSOpfC9iZ/5lCT1bsIQ3abT9qRW2mVGsk821HYIOhwc3ljmzE2
         H790Vx9A5bxzh+LARzo6UcHNbQ5WiXlpho/nwTjykCMqKF3BNSH+fkvMPRtL2liKzC8x
         rQhziDUf0QqicPmM4/GZasNS8tnHUn7kfDIJgTMPKKVevBO57MK0FRLUPyPosGG6vigl
         mSvsrG00TBt2NGCZLQuoiaAU/2Ftg+gGkmt8hrjcDo+0WzFAT6tT4t0K98tDRhQTUksp
         2Ig3ihV03C2IWWvxNOQzCk1h+/GSQh/Y8BTd6jgDwmvG4MB2vc5svfDf1jAWGChinoEU
         Esqg==
X-Gm-Message-State: ANoB5pled/f9xnxP6KXkJy2W7rgdNIwWoogGcQp244uv82pGKj4+gstR
	SWfNmSXS7g+kOUoaOe6dlOp4kg==
X-Google-Smtp-Source: AA0mqf6zjfnmFCTPZEe8uZh6cbl+/DOJw0TxzYZkzinfnQrsORGolRqlVVIhe68Vn1w7Vh1ceoOcBg==
X-Received: by 2002:a05:6a20:1e4b:b0:a3:c7f7:8b59 with SMTP id cy11-20020a056a201e4b00b000a3c7f78b59mr9420257pzb.50.1670624519064;
        Fri, 09 Dec 2022 14:21:59 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id u9-20020a634709000000b004768ce9e4fasm1406290pga.59.2022.12.09.14.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 14:21:58 -0800 (PST)
In-Reply-To: <20221129143447.49714-1-ajones@ventanamicro.com>
References: <20221129143447.49714-1-ajones@ventanamicro.com>
Subject: Re: [PATCH v3 0/3] RISC-V: Ensure Zicbom has a valid block size
Message-Id: <167062428740.6627.12481538665301585531.b4-ty@rivosinc.com>
Date: Fri, 09 Dec 2022 14:18:07 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, Atish Patra <atishp@rivosinc.com>,
  Heiko Stuebner <heiko@sntech.de>, Anup Patel <apatel@ventanamicro.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_142200_225896_3C108AFB 
X-CRM114-Status: UNSURE (   9.84  )
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

On Tue, 29 Nov 2022 15:34:44 +0100, Andrew Jones wrote:
> When a DT puts zicbom in the isa string, but does not provide a block
> size, ALT_CMO_OP() will attempt to do cache operations on address
> zero since the start address will be ANDed with zero. We can't simply
> BUG() in riscv_init_cbom_blocksize() when we fail to find a block
> size because the failure will happen before logging works, leaving
> users to scratch their heads as to why the boot hung. Instead, ensure
> Zicbom is disabled and output an error which will hopefully alert
> people that the DT needs to be fixed. While at it, add a check that
> the block size is a power-of-2 too.
> 
> [...]

Applied, thanks!

[1/3] RISC-V: Improve use of isa2hwcap[]
      https://git.kernel.org/palmer/c/78eda777d2f1
[2/3] RISC-V: Introduce riscv_isa_extension_check
      https://git.kernel.org/palmer/c/132cfeb2b7fd
[3/3] RISC-V: Ensure Zicbom has a valid block size
      https://git.kernel.org/palmer/c/68dc0718407d

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
