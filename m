Return-Path: <SRS0=s7xG=NB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C50C43214
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Aug 2021 14:16:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22B536108C
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Aug 2021 14:16:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22B536108C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zdo/q+J2Dx4QfMS3vfF/iOqDBETQmfR5njeENd3fFKw=; b=xNjckXRKUfowNX
	EK3BIwyQ9pW092S/sN88AOpvGO61pWx2rtX6OhFBHAQrjmI8goN2zzmQwhQ2OnjcqDto+DdZJWVn4
	vVzPvWpQeyAsIVcV3KSzM8OGsD1OJipkgZJXgJ0/JuDK6KMMpNcq7BY1n3+INVFTTjCAXlDgMqiVP
	t9eLtjb2RIC3AlfUUGmXLSsJzmPaTURNNawdHa7uMP9AJOQwP25Nw6itxls0ZgSZfg0xI9lOC8JbD
	Zgy0hj9/JpM2KguVpuNONYsVs5cYP5fcjl8UE6hoJZpnNwyzXe36zriQDoZeVSTiR5/Q2irKhRR2x
	5Kz76ee+31uejLp8SQEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDSXl-0046Zp-R8; Tue, 10 Aug 2021 14:15:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDSXQ-0046Tf-Uk
 for linux-riscv@lists.infradead.org; Tue, 10 Aug 2021 14:15:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D4AE361008;
 Tue, 10 Aug 2021 14:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628604928;
 bh=M4IO3RhlVin1iu3XzP+nfxLyRXRODIc+CtwQNbOT6i0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u4lyCX84fWxdYVQo2IGhbXo7Vs6ydxEGRGPFnDzwTjcZJ8NX19UBCa8FDVk6VYfw1
 Xdn7PtypcSS0f+FjsY9bbTDsUuSzaMkX4/3vyf+yAYOrK9xGSka025DHrlC5WcaLYo
 QLqYeqC+3JXyNUVJfZhN6sdk+cxJbZm5UzW4Sw84rtxQi9KFNYEm7y88HC+NQHR26T
 Uqk/dL0Lh9XRaVWEB8FOJA3Fl4tW04H+VAxkws0xZDg0PI0DsgS/QfAT3t2S+1M5rJ
 9t4y5zBIBWnfBUpZUhumibUWt/CbFcR9n5MLg3wFE2Q3fDUg5R0BKu3UcNIsHrIaii
 yFYCI2Ul/buDw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Qiu Wenbo <qiuwenbo@kylinos.com.cn>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Sasha Levin <sashal@kernel.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.13 17/24] riscv: dts: fix memory size for the SiFive
 HiFive Unmatched
Date: Tue, 10 Aug 2021 10:14:58 -0400
Message-Id: <20210810141505.3117318-17-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210810141505.3117318-1-sashal@kernel.org>
References: <20210810141505.3117318-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_071529_076054_EBBBE2E7 
X-CRM114-Status: UNSURE (   8.28  )
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

From: Qiu Wenbo <qiuwenbo@kylinos.com.cn>

[ Upstream commit d09560435cb712c9ec1e62b8a43a79b0af69fe77 ]

The production version of HiFive Unmatched have 16GB memory.

Signed-off-by: Qiu Wenbo <qiuwenbo@kylinos.com.cn>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index b1c3c596578f..2e4ea84f27e7 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -24,7 +24,7 @@ cpus {
 
 	memory@80000000 {
 		device_type = "memory";
-		reg = <0x0 0x80000000 0x2 0x00000000>;
+		reg = <0x0 0x80000000 0x4 0x00000000>;
 	};
 
 	soc {
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
