Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3ECBCA0FE8
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 11:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GPqmproshMatQWd8Hx3jAGwMVPE+RtBM4OQAUjNQ+v0=; b=HsYQNKqxT5Csxy
	o60woqms4fKL9E5W6FUPRgpXiTKue1N+kfD3OS9MAO7QxYcwUr0MGLCq6jRXejwk5xN2iGLVkFLT8
	7PQO1KZ6zOKYeQHfPdwKkovS98ZIiQyBBCbNTmE6F97ztL0Tmw06FPHmV59qVZc0U1AcZIce21BMO
	U/x2HjP1zhcM4YKIpNxrGNb52myDqJYMcVByTPDzrvKls0udT3XaaKAgzSAy4LmjRqpM0q1YaoHfD
	htaVp45FOG6+ubb3Rx5Vc6KDA96ybgCcvff/FTLKqrzoc3wBLUPs3X0Y0AQsiPCwa66lsXbz5Uvws
	RxTTV2AGaG/V+tJKY61g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPqs-00000002IAY-3rZY;
	Fri, 22 Aug 2025 11:22:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upI7E-00000001LJk-2Lbs
	for linux-riscv@bombadil.infradead.org;
	Fri, 22 Aug 2025 03:06:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=dC7kl9A7D2BWwkfx5jwlJiGlSj0s6ZSSxNG7ocAEL44=; b=N5QpgTbfEOO3z6SL93oPXcH3/P
	ZrO/eJeIIlEqgBPTDql8QFsnSPa4y6O4rEVGgRRg5Z2FNEL6klpGrVlp87Kxc4GxqJrlRPiFc28ET
	4O7dcWpIUWckOobIjhrwghTO/MbwpmzVU1mdcIbDeNyzTuxRCGfke7hiiu4kDziol5GI8eleZ6xIE
	Qguonwn6sUmPyCD/an9FU+La+9GgUqUAxloAFZs2TW2ed8Gt1lBCJ+8JoFdntEHsfB3vv9wgYs7o9
	RE+AvwoD7Hrvanpk6r1R7TsLfHF4MpUAeegCVDfMupNgsiBvYSepjOOHxyNQeBp/TYDMnlBh3zECY
	oSjylTFw==;
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upI7A-00000000mC2-31yu
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 03:06:55 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b47175d02dcso1272741a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 20:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755832010; x=1756436810; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dC7kl9A7D2BWwkfx5jwlJiGlSj0s6ZSSxNG7ocAEL44=;
        b=kuY0idLVnK9w+g6iED8Hq2e2zw3kSNfpW9DylU5YKHk2v6LRE7KqzBycZLi99yck3T
         rUoCzo0Rbqinex9jak2IauMHINMV8IYXiR0bPljk5my4BKjqVxeQNRKVI8LOgjnqdlOj
         uUKiyjIcbz0US2Z79myU7VecgOx2hOhk0LOIINH9uMJK5uR/7jrbrgqkGKyZUfn2JbJI
         kqX+NbBxWldk6gPTskpDT+RvFY5nZB2KvZXQg5zubet+S4FWW3Fh7blNxqGlp3HiNpNb
         4/eVv0ruFzi5yFXvaAKOG9Ay5us7rmMJNtQ9A8m4/6JdayQHY0zxDucJy+F9HtFJSC8c
         hisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755832010; x=1756436810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dC7kl9A7D2BWwkfx5jwlJiGlSj0s6ZSSxNG7ocAEL44=;
        b=lrtbKfUt6vyGCamJRZ31xiGR44z8yn6mWM0dCqMlhTVbYW6qwG5Qi7kjaj3mEKwwnw
         0CIoTtKfQUI7tnNu9mQK/nS8U1CUpuTO9LChrL3zAtwKYPup/Ek2rXmb9qokstsX49hr
         JQMOUdKIkWUmQo544NKF9hp99XrRyjFUQAuyBVyhOEdBPjCXohaTM4G9qH7epK1cZs+V
         zGnanV/VLy7Xog+nZW2v1R5hb8P+7x/HTuMKXJzmHmn6wuOKApDuiN0La2q3gNU9vORN
         pJ6yu0CS0VY+xBeUX5Ml7ejp0AruPjuAv07JIBtynPKYcfMaaLXO5n2JxBx6pFOMJEwN
         83Hg==
X-Forwarded-Encrypted: i=1; AJvYcCW6vxOS0bqN26JfzFkwhTCL459J1U4uy9BZb7DeYB8JO4185zET9c6FOpU/S5+EAJK/uDYMQMP1Hgo05g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuLYPbAJSJF+fd86mHlaKl9Ybk8GIi1rl3EmYt4zPh0K8nILe3
	Kbxt1c2H5NhEmC0uf9t13u8wunZ/hmYTZW/9wsUfSdbmM/55x1PKTMb3v9W+JTRxMac=
X-Gm-Gg: ASbGnctRil4QLRF7uPLh79Lrrm2RaqEvrG/VVL0VpewLCv4Dbl8ITDeSsKR/tEmqujo
	rz58EdVkzUWHwUBcr8wAHo6+uaUb0f0HQcfP1myu8wNcnOzY58PajhUBXqehD6vkpmkZVHE3rfx
	0YXfVy9xWc8LFfyG6sXH7UKVcLcKm00FEAnswT7DTNZmOjCpgpzsgnMN3rdx6CFOar7Hc51NVQi
	iB5JDJeRA57CQl2wOT5EJZdOcAnFFlA5T+U3KSjtBmobLzWWzwqrr10eHg7IS0W7o2Dzdtf9Uxk
	RPx7YVoX3qHU7/ODSFWU08oRsMHAZhJHzV03ICduoogc/dbF287YZH/nyGV8KN4qlc9kMl0paly
	X71zi9915hwsy7pOGdSB+jFhHovm+I9b9iA==
X-Google-Smtp-Source: AGHT+IEAIhdT3Tfgdb8iNC0j7z0iqiuqLPLYGzXSr+7++MUa1eCRn81F36zR4QAh/yOgPvq9YcRdkQ==
X-Received: by 2002:a05:6a21:339c:b0:220:aea6:2154 with SMTP id adf61e73a8af0-24340b016bamr2141981637.17.1755832009592;
        Thu, 21 Aug 2025 20:06:49 -0700 (PDT)
Received: from [127.0.1.1] ([222.71.237.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47769afc1bsm2756777a12.19.2025.08.21.20.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:06:49 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 22 Aug 2025 11:06:29 +0800
Subject: [PATCH v5 3/8] dmaengine: mmp_pdma: Add reset controller support
MIME-Version: 1.0
Message-Id: <20250822-working_dma_0701_v2-v5-3-f5c0eda734cc@riscstar.com>
References: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
In-Reply-To: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, duje@dujemihanovic.xyz
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_040653_160013_58052DE0 
X-CRM114-Status: GOOD (  13.01  )
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

Add support to acquire and deassert an optional hardware reset controller
during mmp_pdma_probe(). It is optional because in Marvell devices
such as "marvell,pdma-1.0" the resets property is not a required
property. But in SpacemiT K1 PDMA, "spacemit,k1-pdma" as the dt
binding schema file stated, resets is required.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v5: No change.
v4: Updated the commit message, no source code change.
v3: No change.
v2: No change.
---
 drivers/dma/mmp_pdma.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index 4a6dbf55823722d26cc69379d22aaa88fbe19313..fe627efeaff07436647f86ab5ec5333144a3c92d 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -16,6 +16,7 @@
 #include <linux/platform_data/mmp_dma.h>
 #include <linux/dmapool.h>
 #include <linux/clk.h>
+#include <linux/reset.h>
 #include <linux/of_dma.h>
 #include <linux/of.h>
 
@@ -1021,6 +1022,7 @@ static int mmp_pdma_probe(struct platform_device *op)
 	struct mmp_pdma_device *pdev;
 	struct mmp_dma_platdata *pdata = dev_get_platdata(&op->dev);
 	struct clk *clk;
+	struct reset_control *rst;
 	int i, ret, irq = 0;
 	int dma_channels = 0, irq_num = 0;
 	const enum dma_slave_buswidth widths =
@@ -1043,6 +1045,11 @@ static int mmp_pdma_probe(struct platform_device *op)
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
+	rst = devm_reset_control_get_optional_exclusive_deasserted(pdev->dev,
+								   NULL);
+	if (IS_ERR(rst))
+		return PTR_ERR(rst);
+
 	if (pdev->dev->of_node) {
 		/* Parse new and deprecated dma-channels properties */
 		if (of_property_read_u32(pdev->dev->of_node, "dma-channels",

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
