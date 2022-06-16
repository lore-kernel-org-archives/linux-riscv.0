Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17218C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 15:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MlSjFGYZB48ENOrYV20FAmIlHDACsaqI24sJ4D70aCk=; b=qDCfX/xIYQIBC5
	4Q8MZ5MxIprQmTr7eYAHapJbloztHi0Ve1Q9efDAVzonhJwKYSRTt8MyHDDA/m3IOtsnr9z2AOzAm
	BQGLHkPGNQGBY+2Uq8svtIU8oaomgvR8vLqaf1bXkpisOKOvpAZL8dtba47P6Lcn1Y2n0ZexWjD2r
	Il+OPk9taJ6YlWJZfb81Qq7G4I26vc9f4q20P4dTuOagjAp8LhP7sxzaEpQWnxyWxsY/2urnLIQJ+
	kfhyshbRtvGarqkxf0u1S0/FsLP8SogmD879wohQcfaJKbv0hZDsTXpBS+plQrVfRXyhLE/jk+8KY
	isTwBEg0G/ha5CTKzfQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1rFl-003AUZ-Ie; Thu, 16 Jun 2022 15:17:49 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1rFi-003ATY-68
	for linux-riscv@lists.infradead.org; Thu, 16 Jun 2022 15:17:47 +0000
Received: by mail-wm1-x335.google.com with SMTP id a10so949380wmj.5
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jun 2022 08:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oI88Qu4qiMkSjs5momI9WAT894CnS3fhP5J1kHBA0Xw=;
        b=dvH6AD5BOgP7SSTByX9sqdfXDqv0OAOSj6yDH69SlzCgeOMMJ5RggvfLElOU/1QXhq
         jYCoS4+pJ+UoOD+Lc0st87cKPaVMPrifpGWvfdHMjDcxCTaXRalKzy9yr+iVAXSqiqr+
         aG2A6PGYZKOu7X87JiidBlHZRmUpgKqBFxJiXbJ/4siOMyHpspZEp0ToVO0ncipcNHGc
         aX3XRSi6kg50O2HCZvy6xYLEXZSAJpBf/v9MQchyhTE0sFvYza9elswswpa7Korf2ZXc
         K/syg11U9WT7hJ+DHV++210vXWPLaVHF9xyMxRisHNcCdvj3PEJts3hJF3cnEmRdhejl
         EvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oI88Qu4qiMkSjs5momI9WAT894CnS3fhP5J1kHBA0Xw=;
        b=ex/KqSlbVDpvnZMxUZ4vYW8SzdeAqVAi/lXn3HjWi9+GUOom0+tQMy+3iUCo65SQJP
         +5vOKfzwj+A7ggI4BdBArm5TTGWgmp/F3FMIQZczRihWIvwiMpEy9WnTAuYA9tM2s9g6
         P+sy8xfn2/OaDH31pPaad8giY1L+JS12XdHJFPBQH7F299KXmAqdtTTi2+vbfnFWsJNY
         A9H3y8pIk0V+D2508duqExdvhXutWoIg0Oo8toR+HKxVwNEAwiplaZ9n0F3n0pVEEOdm
         KLjm5gMDblNrQUqrYV61TbaGSdXv8Y+rf4BZjvzErYFwtk3sJZUCa1QeGduXVwnTu+Od
         uBNQ==
X-Gm-Message-State: AJIora8yIgmg7zyYVSJKCmbPqUZPywRS5JHHHIuVvCLFUvwSgzaqiw/O
	toBVn4CETSN5EdIEogzRbNCInA==
X-Google-Smtp-Source: AGRyM1t7s8sG7knah9RyDCtIy/zQzva/JpPwmUWGpQaRjdRRkx4tAVGSo4OZULRC2k5nQVmwxr3X/A==
X-Received: by 2002:a05:600c:2244:b0:39c:4060:1ec9 with SMTP id a4-20020a05600c224400b0039c40601ec9mr5421401wmm.147.1655392660737;
        Thu, 16 Jun 2022 08:17:40 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id j18-20020a5d6052000000b0021a35730281sm1929534wrt.91.2022.06.16.08.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 08:17:40 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: nagasuresh.relli@microchip.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	robh@kernel.org,
	paul.walmsley@sifive.com,
	linux-kernel@vger.kernel.org,
	aou@eecs.berkeley.edu,
	daire.mcnamara@microchip.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: microchip: remove spi-max-frequency property
Date: Thu, 16 Jun 2022 16:17:12 +0100
Message-Id: <165539261570.229722.8766263484989186462.b4-ty@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220616064251.586263-1-nagasuresh.relli@microchip.com>
References: <20220616064251.586263-1-nagasuresh.relli@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_081746_291484_F827979D 
X-CRM114-Status: UNSURE (   6.44  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Thu, 16 Jun 2022 12:12:51 +0530, Nagasuresh Relli wrote:
> Remove the spi-max-frequency property from the spi0 controller
> node as it is supposed to be a per SPI peripheral device property.
> 
> 

Applied to dt-for-next, thanks!

[1/1] riscv: dts: microchip: remove spi-max-frequency property
      https://git.kernel.org/conor/c/3f8ccf5f1a8c

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
