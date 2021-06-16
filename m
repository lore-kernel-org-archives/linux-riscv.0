Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DB4C49361
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 07:46:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3869861055
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 07:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3869861055
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kt9saOOpPlhpD0OfmE0wAioF64MZaFOWPQzmGbgDIjU=; b=c1TTrEi9YUyT25
	6yZRhOR9eYd7b+5+aS2tcipSQ2oAnc5Bi+QRHG11YvTgBV7BCvELp23lov/Qo/LqfT0pNEMqqmVcz
	k+a7i4zPS8FWPtHKwyKLcP+o0beMSMfjlxihAvavY/rsDWI3Cyn6F3eSK8G6bANaoFl58dZifUUxn
	JkftkCaX+TsusR7pRs2/MxQ0NIQJTTGEEeBkVT2hlmA2IQvuBqnWUiA7QwzNAiRPjeY+PhZCaNChD
	O8vYuEMKM0S3Tbfc1PKxDTrv0856Fu3BFTHKY1i5NWpzBteeW+7is6UpKyM5eTMXo28lz9TEYrOI0
	3YqG9Jj0HtPLCneJmZpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltQFs-005FrM-Up; Wed, 16 Jun 2021 07:46:32 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltQFp-005Fpb-J2
 for linux-riscv@lists.infradead.org; Wed, 16 Jun 2021 07:46:31 +0000
Received: by mail-ej1-x62d.google.com with SMTP id hq2so2312048ejc.2
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jun 2021 00:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M4TyHLQ4LR5S/LBt8eudzX9kDvJUMoDca5KcxWhDSDw=;
 b=rXiAp2jrc8fLpZsvaJgKpeHWxK/bdE8E3vIakHtTH15E8oMWr3+muv3c0kR8rpPcm0
 f3yHBzI2qJxygQT5UqkDMJZ9vXYjDWRZcg60v1Wu2rZCRCzwcFxF96YIGfF8r6OUdnuY
 6QnAf/pGbJgKO21PvnY7n3rP5QUZsHX61pEc0Z0dO56JRTQD4QJr011Qxa4+bqCLMzuZ
 pfDmLyk20vl5dv3G6R3N6eS3OpX2trEoGWMRwgv2xsJfYgba/aBP6/qCcrqKR03h34sM
 yzBTcAycRY6AiCrKvir05a28F6k9ggr6IyOypPupW97WWFI7ekfbk9syalk3D9DS74On
 rbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M4TyHLQ4LR5S/LBt8eudzX9kDvJUMoDca5KcxWhDSDw=;
 b=YCROxBS3gheGp+3CU7aly+JDjv8XcbE5R4dGFK+QOGGjZLAjuCSe0gjZf/cWENSfNr
 M+KY4jWC3xTaA3ly37AR/vXfecin4Ag8QjXKQaeLABZMrCivR/ICa6T3k++iVBG8C89r
 mVsZyBT3kd9Qmr+s6ztlCUYIzuwUBMWOq35g9IKJqjsijnx/l77XiXsT8pPVdI4K1WBS
 Y9SCNau6idf1arnj8RnksZ02eDK28okZZKaDw7l08cJAz/knjomfNGmXlO8WFegrMoIZ
 TfhnUvFAh/rvF0oKeiNItwRGR2FHNOFS0TwDiYZ5qXpcz7x3gBDigRkCl6AVz1guUkaR
 7YIw==
X-Gm-Message-State: AOAM530lObJ3uYkIlbEOBx59Q+P0GIOaQN5qqzYiQW9yJKorOH8fpCv8
 pE4O+fXYHj41kSSRpyi6G6E=
X-Google-Smtp-Source: ABdhPJyDQIZawhe/akfwnLVWsVWGjrvpS8PWc8rMTPN141zsfQEsVebK5UtEPzZZuPN9Oe+k4lECYw==
X-Received: by 2002:a17:906:48c8:: with SMTP id
 d8mr3974133ejt.176.1623829587813; 
 Wed, 16 Jun 2021 00:46:27 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id yd25sm657840ejb.114.2021.06.16.00.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 00:46:27 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 1/2] riscv: dts: unleashed: Add gpio card detect to
 mmc-spi-slot
Date: Wed, 16 Jun 2021 15:46:44 +0800
Message-Id: <20210616074645.429578-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_004629_686887_95F55E35 
X-CRM114-Status: UNSURE (   8.58  )
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

From: Bin Meng <bin.meng@windriver.com>

Per HiFive Unleashed schematics, the card detect signal of the
micro SD card is connected to gpio pin #11, which should be
reflected in the DT via the <gpios> property, as described in
Documentation/devicetree/bindings/mmc/mmc-spi-slot.txt.

[1] https://sifive.cdn.prismic.io/sifive/c52a8e32-05ce-4aaf-95c8-7bf8453f8698_hifive-unleashed-a00-schematics-1.pdf

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index 60846e88ae4b..22f971e97161 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -80,6 +80,7 @@ mmc@0 {
 		spi-max-frequency = <20000000>;
 		voltage-ranges = <3300 3300>;
 		disable-wp;
+		gpios = <&gpio 11 GPIO_ACTIVE_LOW>;
 	};
 };
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
