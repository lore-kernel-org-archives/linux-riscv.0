Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C631EB362A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 18:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w7vpaAdVk5jtnUC3br1dOst1YEb5ddbtynyXMw3phfg=; b=fhJ6umM1UM/BiA
	AFHptHmo4uA+5rvsHJUKRNB//CaC6GCSO7yjB041MtTwLnGT9g5CdfiqmUmdNofWbqhjH0iWa9IOh
	ACP1km9rDxBApxBuuzWvST2BpRWYQB1E0C3PmT0kYRD6RGDsW5zNGA5LCleQq96W5J6uq5ry752M1
	0kbMugyfa0w0j9NIEutTSs5Mciska4qpoqTcaYF3A0lm4X5j9MMAHy7i55jqIQxKMX/Mey0vbBaxS
	q4AAv6GermefE2x29RIRRce8o0guWULOQ6LxIngVZl3QgGwj5ytV4sYCjlSZM08D2yHCHu7osNsn6
	SdF1CxMIIS7FACbVA/Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7ll-0000000DfDh-3XLi;
	Mon, 02 Mar 2026 18:13:25 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7lj-0000000DfDN-1BeF
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 18:13:24 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-82742aa5a3eso2242113b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 10:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772475202; x=1773080002; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hnWhypid25+2v4/CmwVulpRAOWew3H3syajXEsdh0sA=;
        b=gcUz1YUB2dWdLIm23z4z6UdLobU/NQHkPW6urg78QzMp7HOtnrlYubfQRD6YCF2kFn
         +vQEQ8gqrBbn39gCSbACU0teiFcBZqz16kiCZS8IWhfWflG4xKy2KHJaw1pu8Zcp99rY
         uIKqEpUacC62kbDcQfimMCsqCHGv3epk1nBrqhEnPPTfkRrutirR+5U5pv73cz3Ylf5l
         JWYrDu5ZKZcTnsOru6Hh67/G3gk+LBC06xBnPfs6r9tt3KUSMFipIYqQWJASK2WiAATo
         34N8ut6FCannp9NLpp8kQk/ODcW78mJgegIPWWyvcuTISMitn/QxyIlXe9btzF875LVN
         zt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772475202; x=1773080002;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnWhypid25+2v4/CmwVulpRAOWew3H3syajXEsdh0sA=;
        b=IgjP05WRe0ELuwVfxMEu0OvRIzUrXfzSM2eDvI7EW1BAw/toKQz2bFTshQEX6DvayB
         zlWyFTSGqmRtooTz3cw/boeR3WowNndXzQjVEJ1RKekV23dGa399F/XIcWyqmDmFHq+3
         CUv7OZjoP0qhpnUn3J8VJgRPWnjBN8oxVN3B5J82OKsjmxujy8assus2zTkYZoKrXurG
         nPkuuAwoyjqwRSytKgIa0v1ylAE0bmja8Im+Llr1Fte9H/1c7OguQYrs7QLSpeVih2Cq
         OhXiPuF5Dlgp8mTKBRwbk3HoctQ5iFSy/SxnapBuKX7Lr8oDNgbUclna/elc9UgHdjes
         Aa/Q==
X-Gm-Message-State: AOJu0YyVlgoRx7J2yd1VyLkbBqC63GjmWgbhO+hSSHUfK6WhcTc7Qtvk
	VmHv4zFsFUAOs1RUpI0sNFNq27hZPTshvbixyG9TSeZMn4rpwDXKJt8m
X-Gm-Gg: ATEYQzynqKxX9AfieqvS3vbcodYr7jCiVjlk0Xda8aUdwUP0GUN4yJtqeNOEk93YJhZ
	eu6aDyAf/VqJ1LNdNw4saMw+8dsJcYGkOjkf8JBVmzjJodc1xypQUr89TkCNLFPwElZciTt6Fog
	l/Gk2vL0fIrxJzjICsJNmdPjI6xIhG4KdufftcAIopKTCYDivMzOsqMvFeVFFP1p7jSk3R5N8cu
	rQjNTpeo20RTF5qGdaw8om6ztmx9i8M3G039pjEjoMTATid2sKBoPHui43dNhwelWtd/UybKkGH
	PhCfqbVXwlc8sXcRBc1Nyj/8xIevcBOzR5flKN5XnFxdPREf2TD4X0af/qjokb+L0Xts00KQNEE
	rqaLTxPEZzosZ4H+fs0Gtb+2PhXF0yOMaiKrtK2VQtiBfF9Bd0xve2YWGkGKEF9LmxIivdfwiPI
	kl8fYg5amytwgx78j332154NjjjoRovOFR+kB1
X-Received: by 2002:a17:90b:3b8b:b0:359:8632:5e39 with SMTP id 98e67ed59e1d1-35986325f9dmr4652923a91.5.1772475202326;
        Mon, 02 Mar 2026 10:13:22 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9009:3f2:4c92:fc5c:54e5:712e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35901883a0bsm24608201a91.6.2026.03.02.10.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 10:13:22 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 03 Mar 2026 02:13:17 +0800
Subject: [PATCH] pinctrl: microchip-mssio: Fix missing return in probe
MIME-Version: 1.0
Message-Id: <20260303-mssio-v1-1-ea0fdf3bf202@gmail.com>
X-B4-Tracking: v=1; b=H4sIADzTpWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNj3dxioBJdc2MTYxNL00RDC5M0JaDagqLUtMwKsDnRsbW1AIvNzr1
 XAAAA
X-Change-ID: 20260303-mssio-7343495a184f
To: Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772475199; l=1266;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=X9pFxZzMqkOXOXtjPC/JVKM4MxUqs2nrYJdjE2X9+yA=;
 b=cYspcSg2cni4FEWF1uboSvnd1CiyndInwPoVrAX1RlAaSyS6iRlllrsyLXTvMue2o2G90tCPd
 KJL+YEOurDvDBdY9wf4whkeVrXurUzX0DUKbv3pxtCMd+5h/49rpwA/
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_101323_328354_6B3CFDCA 
X-CRM114-Status: GOOD (  10.55  )
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

In mpfs_pinctrl_probe(), when pctrl->regmap fails, it just print out an
error message without return, which could lead serious errors.

Fixes: 488d704ed7b7 ("pinctrl: add polarfire soc mssio pinctrl driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c b/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
index 3d5ffd6cb14b..15d73ea1028c 100644
--- a/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
+++ b/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
@@ -686,7 +686,7 @@ static int mpfs_pinctrl_probe(struct platform_device *pdev)
 
 	pctrl->regmap = device_node_to_regmap(pdev->dev.parent->of_node);
 	if (IS_ERR(pctrl->regmap))
-		dev_err_probe(dev, PTR_ERR(pctrl->regmap), "Failed to find syscon regmap\n");
+		return dev_err_probe(dev, PTR_ERR(pctrl->regmap), "Failed to find syscon regmap\n");
 
 	pctrl->sysreg_regmap = syscon_regmap_lookup_by_compatible("microchip,mpfs-sysreg-scb");
 	if (IS_ERR(pctrl->sysreg_regmap))

---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260303-mssio-7343495a184f

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
