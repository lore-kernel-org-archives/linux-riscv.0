Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081A9C9833E
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 11:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jJJbkhx1Kzr3QsdvIoSzDjrSvJxGrJ+9iefBK+BWMaU=; b=NfXMo4XzMtFsz5
	+guR0aHY6fNflKOApJACIGNau5lA4854kReKpbGfXJGWj7AuJg3W/7X3OReQxLZPiW7JU3NK6jkpE
	5UgjFLrbg4f5D8NZE0JsZUWQeAyqe9BUcompAdzS9k4O/N7xA6NzD2ahgSMR6DynFeqhNFagVVgE6
	wKEbqDrXiT4W+KABhJn+Rzcv8sfMfUL/MfsZq5AIAgMNcAoFohM9ixi+OcfsyHz3ngk0Dvg1NgEmI
	alsEJxvObrXiL176qzAUVSh2Pe73R2HOZRLeLrQKVmJJXJmvH/b3lzS3BOXpXvdo77/N4HiV02Gt0
	8pm3rxLqptxjV5zskouQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAnFS-0000000GFOw-0Bsm;
	Sun, 27 Sep 2026 11:40:50 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAnFP-0000000GFJm-31T1
	for linux-riscv@lists.infradead.org;
	Sun, 27 Sep 2026 11:40:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790509225;
	bh=AxSkBYVSgPpuL1MDhi0QbGNCeRr0nlyN70G0ZK6JT7o=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=uwr6bnzcscW7/B5pP7RMLj/pzCNdY0fc9hH9OP7loTLJsn0d9V2oLtS/g3j7eHf+U
	 dfJPyha9Jm0QjSX+AXNxYuunF+k4aisFpsj6gLvnsJPc8BB5SIhhS8LZww1mP0QoU6
	 y47D8ettS4qM/0Ze44F/NgRe2zEVEodkY0fcTwio=
X-QQ-mid: esmtpgz12t1790509219t77f39464
X-QQ-Originating-IP: Q9Fmadj4aY05j/N8kJ39rt0dI6voa+weiCz4y/q+x7o=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 27 Sep 2026 19:40:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11085124453979755528
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Sun, 27 Sep 2026 19:40:06 +0800
Subject: [PATCH v3 4/8] usb: chipidea: usb2: add SpacemiT K1 support
MIME-Version: 1.0
Message-Id: <20260927-b4-spacemit-k1-usb2-v3-4-ce7095896039@linux.spacemit.com>
References: <20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com>
In-Reply-To: <20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Ze Huang <huang.ze@linux.dev>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790509204; l=1399;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=U8/fCpx/xwF8ygBxGfu0cbDRHmKfiFbEgdmW9dS/upI=;
 b=ltMR5hwwy8URYFQiTt309gX0S/uTxgDcmsAjzGIb9xMJD8PfPi4t1HgoCA8sM+uXGMPHY9Lw2
 rqKXFU/Y0I7DW4/jOeQZm4Nzqz8n5fxA6LTFaWu1BFbw6CHGKtQastD
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NOWj8FKbz2OZvPyw92zxKkjmAGL5naSp3IJhRQWGkov7+OrQgjuk4VcS
	/+P5sndqSNzdpFu4oFy15wOJgWjjv65TWWlDAWm2msVb+SiFrc9DUzjygGEB7ISlfBSOY95
	TLS1ueib0dwLQ1qYR+MeT5A9pXBSPT8XA9M0Na3x5jFWMdci+Q5nAEVvCH2AZ75G6fXVSDW
	0nJGdOTIYw7UYuGdmSLmaxjWAKwdamA9F/2uEqhS+chN6iPdujaxg+qFAYu/v/plzRong11
	/VlxIhl5RvNyURDQTV44vc9S1ZcrlS5KKemoZSnFJ6vff5PQQ3FkjTIr3CHf7bqasxIB4w0
	PVBra5/F7i/p5hrBMnLgx4q5E9Z5phyGsZFE4Gr1m975OJiJrVyucNZyvaWmoRCxfw1eo5F
	t27DPTrtJ7oT/JE50tj9bTAZtDEHeerh3+Hx1r5ZyU6SlYjT/VsFmK3KVrNHzRYBL5UJs9C
	4URI78baHx23uZxVKdcUGwgXL0R9Ijnz37EsebOQ4TfM9igLHXdt+d/c+Twp+UZCarCju5x
	EyH4hDwTkZIZwIWxt+HjAGODw7+M94LZrZfZONfUlQTMEYZk4sZOu0YrBCIldFsijJPPx3l
	euqVEdu/wWGRN+dtAwX4p8xlDtVcsYewikADSV7t209wKNhQxdlr6vp5GdHqGFMi/y4apq2
	yagDJbQUSW9WB3L0p/MxbKyWPNXA42Sb8k6KJeDGpoXj8CqtseqY5P674oQ8zSESXNq1Kma
	FQA2LqX2acS6MNL/A9YD/+0X2vrG6WcQovg6NwePwKp69f+0cUHzedKqmnb1zOngh7zT2lX
	6IyLbjayADbyUiZSNCzbpVgDFzn6XINlcXuz0dFQxbeVa8EUfGj7FWgz6thZvkTjGB8RZ1D
	7oNaazkUKYVw+nRxlfXRWbpPUozNutue3tUb8cCDgRs/9nlI0lm2VtAOWTQR0UAazxF97z1
	g48X73iYEQBEDYyX6kHHm0zD1Md22nKOwu0/f8PH71Vrj1pHZjyq8kD9vB44PAZtFm26EJH
	+Y5sYFHbaqSjlBGywcHAqc4B8tR00pxx1+9ApWdnE257YktLDuwsN/mlaMk3kdZnqeVxAje
	1jSlIIFgzzA4+Aje+wHNjVZyDnmRjmRldE9k/JUisKcQWc7qJrkUthNRdW5sFueQrXCzHMQ
	BpubjpnEQRO6AlKcQw2+bPAbbmhX0RhrLhi6kyCU6G74487tkE3hY5Z7mQ==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_044048_336295_0194B675 
X-CRM114-Status: UNSURE (   9.51  )
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

Add a compatible for SpacemiT K1, and add platform data with correct
flag since the hardware doesn't have internal otg register support.

Acked-by: Peter Chen <peter.chen@kernel.org>
Tested-by: Ze Huang <huang.ze@linux.dev>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 drivers/usb/chipidea/ci_hdrc_usb2.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
index 85244e8bbc3f..a5ed2bad5573 100644
--- a/drivers/usb/chipidea/ci_hdrc_usb2.c
+++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
@@ -38,10 +38,18 @@ static const struct ci_hdrc_platform_data ci_zevio_pdata = {
 	.flags		= CI_HDRC_REGS_SHARED | CI_HDRC_FORCE_FULLSPEED,
 };
 
+static const struct ci_hdrc_platform_data ci_k1_pdata = {
+	.capoffset	= DEF_CAPOFFSET,
+	.flags		= CI_HDRC_DISABLE_STREAMING |
+			  CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS |
+			  CI_HDRC_DUAL_ROLE_NOT_OTG,
+};
+
 static const struct of_device_id ci_hdrc_usb2_of_match[] = {
 	{ .compatible = "chipidea,usb2" },
 	{ .compatible = "xlnx,zynq-usb-2.20a", .data = &ci_zynq_pdata },
 	{ .compatible = "lsi,zevio-usb", .data = &ci_zevio_pdata },
+	{ .compatible = "spacemit,k1-usb2", .data = &ci_k1_pdata },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ci_hdrc_usb2_of_match);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
