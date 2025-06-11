Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D928BC677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KVWEF/VYhskb5SugoAQuB1b5uQPy9zgTI82WDhdNlJI=; b=Tk/ZfWTgE3/zT3
	EUP5Ls6v7/BO6cuggI22cAHk74PvEs3Q4GqBecjnBhzEGYFd1AI54O4XmbBuY0pUmnHRgKnzg5jJa
	PzVLqXlgs8QNPHSs4lciiVAhGAtX7Ma2J/GPRpl9hNsTUkjUxBDESQ6S+fHyD2lU0yeTY//Vk3qrt
	wzaK3IwCMOsySSoqTYvDmzMa0Nfoc3vKPI5jPrgEriVATaC2nse7leZOf5Qe+kXnAG6TdOIy//WkO
	3Nnd5+dJyzLa75vy2PqOEs2/QlXJBcmIsxFA7hSnsJi09nvSinSLwmV/UT3knVI46c+gcizheeFfW
	o5U3pNJv4TrcfG1hvwRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGf1-00000009EmS-21n4;
	Wed, 11 Jun 2025 08:18:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGIF-00000009APW-3DJZ
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 07:54:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=TucqLG/tk3Y/USNHaS48EdntTVxxdA1FanRm1k8rL/8=; b=b2achX8BUfQGGj/JtG5/d7tCiJ
	O/vrLC7H5KoIs4IwGHcf75uRyOOOFUtjmNudMSpWyhweg/XwY9/eVKXMYvRPoKk8flm1Ji85HNbZI
	DaXnU3GHPtb31jWUv3DqKTvLYnjcwEN4V7SD9PL5qMbdEz6Ds0ZNvUcqgvkqChroJOp8qlM+sKDJV
	iJpnHYUdmECuc8CLXPRdsi/5kzo2UqWlQYo1l/8dB6Rxpb6IdPHlPD6/A50+wU6LBfcgtkUKHyB1v
	LzpoF50nFyzJcDE3uY3Sfsc8JX8T2zf4Oc+E8MLnXcAuC4JDb+0DrQm2nnwf42LbPj5WOshPYBuN0
	U85LQ9sg==;
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGID-00000002Aus-3cDJ
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 07:54:43 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7d219896edeso623903285a.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 00:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749628478; x=1750233278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TucqLG/tk3Y/USNHaS48EdntTVxxdA1FanRm1k8rL/8=;
        b=Yoz1myusAF2VIDH3m+J/fBEoqd7L18QMfg4APLTJgkRPV29YdOOCv7HfI2IbvJdMaA
         x2R7uJIq/YmhUYRvOqbcsAQBxCbD6JPqe8ORpX3YU9+USfSLXhKq3vWRR8rWHlprxCY5
         A6urjZP8JwFTxGuAM9ePKLAt1N0Qi6B8UJgmlV3PcQpF7bVsbpZspwYlTdeCJoX6mjjZ
         lh9vXcW7qRLLzBiu6gC4M16dB22MWLx3uGo0CDipBU748vKDsmfIymsWuw6IMYe+n8jr
         fapNRbm71K3vXA7Vn2Lt7dZwAM6MT3H1pRvsqGcKKcgGFtxVTk0+aZilaY1wztQASh93
         40nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749628478; x=1750233278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TucqLG/tk3Y/USNHaS48EdntTVxxdA1FanRm1k8rL/8=;
        b=tooi11rTLR8RyhngqVyafnSQLE94cqrJ4r7+veHFjvLIS3iBy7joBcd9LWYIdP3Wh9
         Q+Uh6hiIL2K899C+3vfPGo0tLqkqdQgB5kjPTjbVVYlWOl6R5IcXc33/unw97VfXqtTH
         7Tv5q/RYJxbneFXUyzarp+A6xbZ/3qTXs9A+5A6mvjzI+qbD7BsMtUAUHAGEZwRsfHYM
         FwOFugqMsq+p7ut+gByKBYT5RujaZ09VWnadedFwaiJcEjw7x7RE3IlLK/kQAiTKgdaF
         TInTG3hRZ4rWdFGuo8Tf/XzzDkActsA01TVU8xKPH+P55rowuZUHXI3Ai21tc546SU/8
         8VCw==
X-Forwarded-Encrypted: i=1; AJvYcCXVlvxBgamFhZizpfpitcqtveVp3uD9gCFcAZclQ31r+UVuSVEemRctWMQNJ4o4n18DwnJBcwXbxcSH1g==@lists.infradead.org
X-Gm-Message-State: AOJu0YysV/GgmWJ9/9g5Q9gKIxOaWgqUT/lM1ch4wuuTaL3Kc7KaGY3z
	vuAWOql1Z/8tzxdgk2bAO4IwP/Wcq5DpCi3XUoprDB2Se1QeaIpi2pKe
X-Gm-Gg: ASbGncuoLtIitSYMTaglZTqkT7gEu7Q685g/SWeGuCixgUm6hU8n36Gx3OWVYCs5mkq
	NrXw2SeViJ0nmHrjG7HW+/SEFqT02Rza+HHZn4dwDNQaQZ30AyIw2BPelR7cJ+cxKXce19SO2j/
	tJwRLl5fULB9TxpqjZ9q16jNHCToKasvkjK/aQuv5QnZbk6PnkryPpAUmZuybYyqQS8rCQGz8hb
	eGFoNwWjuMvioyX6EcWDLrxwIDhNRcgsV7CwwWb5NizpWwhudRMQKW7z8FJG2Ta+D3m5EU0xm2Q
	+K4rH5zFQ0nxIs4iMQU9YTN7Dat/JCubAGGuob91rackMmBT
X-Google-Smtp-Source: AGHT+IEySdwciKZhGZrTCtsR/Gxqu5FAFCLHguwmpefzLwsb16bnu8UFs0/XpS23i1fk+Kd0aatnNg==
X-Received: by 2002:a05:620a:29ca:b0:7d0:99dc:d026 with SMTP id af79cd13be357-7d3a88057a4mr312939885a.12.1749628478269;
        Wed, 11 Jun 2025 00:54:38 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09ab8a3csm79057766d6.10.2025.06.11.00.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 00:54:37 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dmaengine@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 2/4] reset: simple: add support for Sophgo CV1800B
Date: Wed, 11 Jun 2025 15:53:16 +0800
Message-ID: <20250611075321.1160973-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611075321.1160973-1-inochiama@gmail.com>
References: <20250611075321.1160973-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_085441_945663_F202A65E 
X-CRM114-Status: UNSURE (   9.64  )
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

Reuse reset-simple driver for the Sophgo CV1800B reset generator.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 drivers/reset/reset-simple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 276067839830..79e94ecfe4f5 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -151,6 +151,8 @@ static const struct of_device_id reset_simple_dt_ids[] = {
 	{ .compatible = "snps,dw-high-reset" },
 	{ .compatible = "snps,dw-low-reset",
 		.data = &reset_simple_active_low },
+	{ .compatible = "sophgo,cv1800b-reset",
+		.data = &reset_simple_active_low },
 	{ .compatible = "sophgo,sg2042-reset",
 		.data = &reset_simple_active_low },
 	{ /* sentinel */ },
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
