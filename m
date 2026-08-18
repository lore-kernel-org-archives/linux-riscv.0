Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48913C5DF7E
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 12:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fZSEw49LVpZJwLodvexBWT+k6U5GLSI8TZJx0t0T07Q=; b=NP+uVJAxC5EnpC
	o7OdCUID4UvsZuyHuNccSMLHHJrxBdGcsjMvcj97aiRq9IkH9rtSNEVbjIsBLlM5kiH9kUrV0sU2O
	Sw54tZqP/DRNSd30UT6apjvFdQ2HSOFwjA4F9BDUtpvSAXsQ8rF+mi5cYTqo5vJWdGRgJ9jaWZ/+O
	GR5zbyZOypdchox3MC2h8lEdMeA5yPxat6Y3a48i1oLwseJEI0JPzBU7kLIGZnnPdcpkvtY7hY8z1
	5QgiAN+pHwPc9qjnmWHlpQYdfm42XRrIAuQliQ8uOgRYSI+u7LDdnivoWWqHhJ5U0kiYZRx9kUo8f
	RRmYRhUM0ApO0M87oCrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJ8C-00000007x1Q-19Ey;
	Tue, 18 Aug 2026 12:41:28 +0000
Received: from out162-62-57-252.mail.qq.com ([162.62.57.252])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJ89-00000007wyH-1UY5
	for linux-riscv@lists.infradead.org;
	Tue, 18 Aug 2026 12:41:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787056879; bh=BJQNpXc0ya1WN+TX0UpecmWu2MNTmLYNO2whLlTD9iQ=;
	h=From:To:Cc:Subject:Date;
	b=h0GETFbzD92oZYqIsAFTTxLZWmfAjhcvGOnh8gZPM2ACJyT4p8e23Zc9s51x0Veii
	 34BMS1H2s7xQF1RwOm1VGwLS5lie3JX7ljoByqkk+7LGO/ExuxwilEVwUJpFH26W7a
	 LLdpFe7j75zmHAQ/L4Eky+362ziaNrvIe9SaFCvA=
Received: from ws006419.mbzu.ae ([5.195.0.150])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id A5010876; Tue, 18 Aug 2026 20:41:16 +0800
X-QQ-mid: xmsmtpt1787056876txi8li185
Message-ID: <tencent_91A432B69EB44818B24B37DDE90E50EA7705@qq.com>
X-QQ-XMAILINFO: MDbayGdXPuoebvRmat116eaVwcXFolnffOCRAmZcJ3PxZHOUF94jMYV5bWJpCO
	 XVLimMqsNWB3UnhkYWvsXaHxNClE9+L32xdS0rmEqokccoo4j/EmwcFZcLqTzSaaXVrfbzJktRCw
	 2Mz6/iaRcGQKhEIT7/Shf9hSOFI1UZ3mZ7+mlGNVsKAlmVGpJWjlp4xkK8kWxHskmPsAgLms1g57
	 A8+d0BSOoHjgRMY30gfscBs+4kBRSUJfJRZWaB74pLDkPRDJMu5N8jxAIKwb6WFUOipKMPqMNYB0
	 uFF2l1w34xkEgWW4rF0Iq5FGKlp+BZN4qG0a7QtfxQaO+zAHO7eWQG3gfH+jbDrG7xyQVRsSYxrs
	 hQ0YZtvNockcNzc6gsjQcQD2Djb3aonT1dNCEg9RA6NXMJVHKu3hk+TUHBtxx6OzWPihFRGrci9W
	 C8P+Hku2toIF461333TEu8sN4liuzcdznw3zLFrPNrZk35PXVTSJ7zg4WbTH2rLCeuvFR0PXc6C+
	 zrxfOqhICPDDcxyAim0NHLR/OmL3+lM7pRepkltnlZkmOZ0zqGz2JkKeD9aWfsoiIu+ad0ThKKxM
	 PKgeceKfOdiQLKAmWlX90GoYWZf2FRcxmZbR065udqiFWvI2IqnarfqK5tnMch4Vmzm/gqGcXc6a
	 FoPf037LzDks7cZk3gRA1J9xrb1riFFU1qCd8PfK3nr33uyB3TbIyD700r/XoVJ6pymdi+7IrW/m
	 wQQKuWnCr2CrsfTPUKTA2jmkenle5BD0dVvZnD5Bg6w5LZ20ioaOFpUqtTPXNRzMiLaV4CLp8I2p
	 Y3ooHc0xekJd78jiWGZ/b52hoeTotu541AL3EHQNOxK8/KWGrB96eOq9pTJdXmbztgAvcnYWleBH
	 gMqKSe5V9yRHqs1wY3/VuX0CTzL4jDX2juMQBAxnEtD0y5yFBNseAXUVrPcV6dKomodXk2h6Mb6E
	 A4rcvP4ijloFHnajYn79eeDHpjcu8vUNnpUZtEVM19AUXthstDV6hzhhgKWSW+PCDLuJymAT1qyO
	 cyetBWMgphWMXan/RknFYSXNXtbKWe/yYLOV8mibyr0U0SheoSZc63uiPhaqrwPYe/hjgSi8POnT
	 tKIMRmTe4qFlxl2cDTN+QPSug2/w==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Jiawen Liu <1298662399@qq.com>
To: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jiawen <1298662399@qq.com>
Subject: [PATCH] i2c: microchip-corei2c: disable clock after removing adapter
Date: Tue, 18 Aug 2026 16:41:15 +0400
X-OQ-MSGID: <20260818124115.246682-1-1298662399@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_054125_949624_B6D6B124 
X-CRM114-Status: UNSURE (   5.99  )
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

From: jiawen <1298662399@qq.com>

In mchp_corei2c_remove(), the controller clock is disabled before
i2c_del_adapter() is called. This leaves the adapter teardown running
without the controller clock, which may be required for proper
operation. Reorder the calls to disable the clock after removing the
adapter, ensuring the adapter teardown runs while the clock is
available.

Signed-off-by: jiawen <1298662399@qq.com>
---
diff --git a/drivers/i2c/busses/i2c-microchip-corei2c.c b/drivers/i2c/busses/i2c-microchip-corei2c.c
--- a/drivers/i2c/busses/i2c-microchip-corei2c.c
+++ b/drivers/i2c/busses/i2c-microchip-corei2c.c
@@ -621,8 +621,8 @@
 {
 	struct mchp_corei2c_dev *idev = platform_get_drvdata(pdev);
 
+	i2c_del_adapter(&idev->adapter);
 	clk_disable_unprepare(idev->i2c_clk);
-	i2c_del_adapter(&idev->adapter);
 }
 
 static const struct of_device_id mchp_corei2c_of_match[] = {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
