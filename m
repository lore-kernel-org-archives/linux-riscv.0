Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1379AEA4E0A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 15:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gUPdPpt0NdPbijqKGblsBkFnbs31yhbjnoV7x9vK3Yo=; b=n8tHr65Tz5a98/
	II71KqcC3rJqG39rdnobZUncD3+3C/zXeV19DywkgVG48b/eDvNgnFL3WJg6iTfrJYCmHR57N6rLN
	0cX3r6cJkpXW/zeJjYsp0v2MeOAlvk9Uc+X8d02fmVZVfxEzqLkLKegFeHbxNKZ9jOndxFiF7Kvb7
	xakFFfXSIimUlScLX9HM6QBMY86LOu9d/AV2QhUBXBVhngRl+HDoJPDr3BZEz7hW8Ipe/c69LmKH3
	ITg6Rjlu1prPS9p+vGmukQlP9v9Qi7OvqToXyIjih3aM97zevqoGlUQqrE629C8Zh/730tyUnQmww
	PwzA84s6tFTIuAXW5v7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4y6-0000000DK2w-3iGh;
	Mon, 02 Mar 2026 15:13:58 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4y3-0000000DK0I-1QfR
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 15:13:56 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-483a2338616so29001295e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 07:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772464434; x=1773069234; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPno2RjoHZxgUnIZr6lB0hz/wV8TjU09ZahXKQxHzqQ=;
        b=QajjF2p2Uz6Pu+YfPzWayV96qDYjat9h+9ynP7Vm6uX5K9qp/zGfeHDolHGFIcQZ3q
         ScmfMwWDaufMKnp94m6DUXP/9q2vcWkvswxQ2J2vRdnKENzZHwHtyEoUSw78mntQsqME
         b8usdfg92inUBsZsvRnuNPaoiOz158r4fXoVrEFKNk/QUDvdFCytcBfrsu/npoNylSGE
         wBDHXlZ6wFD1nGfinr9L/XbkCRv4Ykjyghlv2lrqjk4c3K/XICa+CkXfJOuPsVoKkTja
         hQGojAN3GPj2YiZRVVq/ErVP8TZGHPolwtgVgWYlF/4GCVoDLtr7KCSK8Z+ETS0GT14l
         FpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464434; x=1773069234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xPno2RjoHZxgUnIZr6lB0hz/wV8TjU09ZahXKQxHzqQ=;
        b=nSBkqGyodn7Hy/iYT7iIrpmanF6fN2AgaPW/t2HFQXLHjT//yjH7hHBemIsd/IqhpR
         6XxrZx+lO9jWhcB6BaoRRjzmlbSCCXBUXFBJO7RUCsg/G5ladN7UnrQg8HWGN6mhzhID
         +oOyug7YgdMTDoKwaOS7QbScs8SX9zm3abgF789TAydjcxr6BUZpvg6l+xUQGBNUVB2O
         x2maBiwDQmRHYJ3WueF+WRjmkEBU+zFrR9o7tzo63bqV32yNUbCURTRtG8nN5ezkljkR
         9RG9ZG5QftMOPg9e6cY24hQX6KV1c4ckyFptA7bcYGkgA0t4q//HNmbIHgtazhhBppAe
         +6Dw==
X-Forwarded-Encrypted: i=1; AJvYcCXizbfZhWyHq0dig31cHxsAh5GYp/xGk7cLVcNkzaEBCKYzUwdlmBa4BvCBo4A9/LrrOaxSOU8CehtgFg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5aT7gUW7XAE+M/8pIdMGfDsmd1XWHfrnNkd93Q1HgpQVieKQn
	0dF7KRUoU2VbmnwqsxtAA/NBDtazlGlSw1pWbuXVBRI1wQ6JcyV2PhpW
X-Gm-Gg: ATEYQzyj0SfERjPOST+IgHxLT/rxMkDmistkDm//FoBm7QMntttqVmBOrX7hQjkMdxS
	6UemxOt6e1CFXm964F+rIR0QD1zewB6RuUbW7U1ONgYkPW9Xla/xKMj0QFVTEjpYkuac2OB1gik
	K3sdrTGLHTT0v018pd0BoZH19I/O0k/QUaDduTPhS8nGYKuOY/CJOwvx7vXeQInRKRju93UC4xT
	fQR7c2Yxx0cS4lOEdCbgHWK2cizImoVlubtQ9YvF1+Xk4hLLFbkm8pESQRiTP8lGeu4J/U3qz7y
	zNvpmKvmzFqgaR13oCmyRi9VpB17PVlrR7zvHZgNPT2LHPgp4ZVyfLIkF2ll6oui9tDZqgMrHmW
	TZfc4U1EblGVkdhmGX7Ay/MlI2/fde/tPvYEijzpNXfpkB6b4tOvHnImqVMwfbfhqlgT6SbIFSF
	JdwV8BQ/vqXMMfuWoJZ7YUi/V0HlL/fU5jK3LCQOBG8OShS3C1XbrR6DxUZ5mFvwpWiZvOguGJB
	/1W
X-Received: by 2002:a05:600c:b86:b0:480:4a90:1b06 with SMTP id 5b1f17b1804b1-483c9c196a5mr205940835e9.34.1772464433577;
        Mon, 02 Mar 2026 07:13:53 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm437240265e9.7.2026.03.02.07.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:13:53 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 02 Mar 2026 16:13:24 +0100
Subject: [PATCH 03/10] mmc: sdhci-of-k1: add regulator framework support
MIME-Version: 1.0
Message-Id: <20260302-orangepi-sd-card-uhs-v1-3-89c219973c0c@gmail.com>
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
In-Reply-To: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_071355_402718_5CC4FCCA 
X-CRM114-Status: GOOD (  11.15  )
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

Add regulator framework support for voltage switching operations. This
enables proper PMIC control for UHS voltage switching between 3.3V and
1.8V signaling levels.

- Add regulator supply parsing
- Implement voltage switching callback
- Enable mmc regulator framework integration

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index b703b78282ed8d89183c816477c149c0a565618a..c260cb89704ae7a25bec0f07831d495553405bbd 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -216,6 +216,12 @@ static void spacemit_sdhci_pre_hs400_to_hs200(struct mmc_host *mmc)
 			       SPACEMIT_SDHC_PHY_CTRL_REG);
 }
 
+static int spacemit_sdhci_start_signal_voltage_switch(struct mmc_host *mmc,
+						      struct mmc_ios *ios)
+{
+	return sdhci_start_signal_voltage_switch(mmc, ios);
+}
+
 static inline int spacemit_sdhci_get_clocks(struct device *dev,
 					    struct sdhci_pltfm_host *pltfm_host)
 {
@@ -291,6 +297,12 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
 
 	host->mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
 
+	ret = mmc_regulator_get_supply(host->mmc);
+	if (ret)
+		dev_warn(dev, "Failed to get regulators: %d\n", ret);
+
+	host->mmc_host_ops.start_signal_voltage_switch = spacemit_sdhci_start_signal_voltage_switch;
+
 	ret = spacemit_sdhci_get_clocks(dev, pltfm_host);
 	if (ret)
 		goto err_pltfm;

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
