Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30260C54750
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 08:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D3N3f4JL3cUtVzoNb6QltHH3DMm8vaD7KJVLqxSBS5s=; b=1HINuKajX2Iabi
	JAb5jmMJYwcF2Nd4aNQhaf+05hkN5BfMvW8E9JR9tW8GdVbXCxUJs54RY8247rDIUmX/3i86qZXfi
	xJFIl/Pia2RGkFXvziTQgkc4AfSwU/VYU4fms72F0lN1aYLfmmGT6s2F4LIkuhJG6WXJIR4K9MQC/
	/T1gaGCV8jMhC167/KXIwiOaaIYUh871BbgWIjSnfnNrVVH5GqaiS+bbWK87sco608r0yPx2gzLem
	phBJkHtCDBYhSd/HeNcm5WjUKdU03cEzm0gPwaQMlbW4HPJZyiy5qI0oyktkorU8/7/zLyaCIKOhk
	T9A6j7LWSwjhhHC9ZTsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjDbh-0000000ERNQ-1HFn;
	Wed, 28 Aug 2024 08:00:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjCac-0000000EAAq-1m4m
	for linux-riscv@bombadil.infradead.org;
	Wed, 28 Aug 2024 06:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xRxYEethFaPHbS9fj3JDuM9MZyXWGe/oMxrByYjDscI=; b=dSkmZFd78ebnLppGNfBTC++ibx
	E0oOvMgPaIR6Y+fc0CtC3M5R9qHAi3JqM5rJjRpIIOONjoOKyYh3Wvs33HkvC41RcJJ1VYhbOlXZK
	SPFz4nImYAMdAGjM1FrhdrGvzfRxy4mlkFuG1sjo8QmerQbOJzsIlFB26ot78x/9hzN00tGzpcNQN
	dfF8xbsgoNshLXchn7k1tzFe1RpJQOix7ThUvvHPSPHHB4vt26NrMVqq0OCwlo3kqeF6aUeQknnb7
	OAydih2v/2Sj3mX2FOyaokuKHGod8wKGEcheNLhRlC8X8h4aCEC3+2jJKZn53CHj5QJXhqkQXTfoF
	KQD96Prw==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjCaU-0000000B4hP-1WzR
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 06:55:31 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2020b730049so50081235ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 27 Aug 2024 23:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724828124; x=1725432924; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRxYEethFaPHbS9fj3JDuM9MZyXWGe/oMxrByYjDscI=;
        b=cblB/MZHwPXhEFXmWEZ/SSYwYyRUKZAgJ4qmg3ZLm/c1iAlNAkVNNTgc+3xjDOQU+6
         6YWLgXTkzUcZvwPww6PWDdAzSfKAIxBimTuC7v8ueyG7omz0DuwlMPXzDOF/qnMWINtF
         7tzEXNmHena8ymT84XPLgV7YzXyaOWniHSG4J70/1NN2+G0a3hFzVzq2Fn4ErL6SNHji
         PjiVlO8vne8WxjWPJ4m/8bfQtuo4mSSOpiBD3NptToDevdtNScesqPYY/GGd3wFqcbmh
         0s1T9NoA+ZBugoGjeIITqefr+nIobO/7D/a3H8qKPWLnPN8JUDX+5Opz9HylmHqsdky2
         TdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724828124; x=1725432924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRxYEethFaPHbS9fj3JDuM9MZyXWGe/oMxrByYjDscI=;
        b=bOagpDm8w6sH5Drc8atUuwonwrZRJiwp15bgV6snCP2FiQp+5OSTXwzFWvL137wrss
         EYypsHsIquOPluarEPlECrczmfEs3dxTOa9TiFXX5+w9OphRV9698Xthm2thNCMex8US
         1TaAeRztCnpUOqqhcUDjnRTvdK5ba3wVEVL/soMtXSO66Ht2f0q/s1pCm6d04fds9ERi
         N2IF+FB+J0RedNdkUxO81meR2LwJZz2hdPJ1mN/s5mey9/cPCjufU9+40r3i/1gKKdoX
         tzjtBbBi8V7cjOkeAuSr0WlPwu6QVSnYAOFg89ewoTPXYErNxU4kaXzXU8s9GF2MEaSD
         IWMA==
X-Forwarded-Encrypted: i=1; AJvYcCUgOiJ4qTD4OoBaVe1EALzVv+AHuZRUPU0ASPJ1bKfhzCyn23UliF02gUumwi9bpjRSbvjDN0XbJKXc/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmEWoPKzAbfLbaPgbhvMP9ksr5cGsf/SwLLLIxdlE0WzYS+kwW
	7C+x2P5wKLrOZ2QhC/9mjIo6Tf2IBUYkZp+gdezeBJQkWJKaerEs
X-Google-Smtp-Source: AGHT+IFNEx4Dk5gs2p6bZvs7Rq9HQ8hMPHB0qibnOdi772UG3c9oJXf1TaaHf1ctBf8WV+Gpt55VlQ==
X-Received: by 2002:a17:902:e891:b0:202:38be:7b20 with SMTP id d9443c01a7336-2039e4cd9d5mr157176925ad.38.1724828123590;
        Tue, 27 Aug 2024 23:55:23 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385607f94sm92816005ad.182.2024.08.27.23.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 23:55:22 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: zong.li@sifive.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Pragnesh.patel@sifive.com,
	aou@eecs.berkeley.edu,
	erik.danie@sifive.com,
	hes@sifive.com,
	mturquette@baylibre.com,
	palmer@dabbelt.com,
	palmerdabbelt@google.com,
	paul.walmsley@sifive.com,
	pragnesh.patel@openfive.com,
	sboyd@kernel.org,
	schwab@linux-m68k.org,
	yash.shah@sifive.com
Subject: [PATCH 2/3] riscv: dts: sifive: fu740: Use reset index from header
Date: Tue, 27 Aug 2024 23:55:19 -0700
Message-Id: <93f4603de5056c94085cd2a91934563789701795.1724827635.git.ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724827635.git.ganboing@gmail.com>
References: <cover.1724827635.git.ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_075528_583384_2B0F511C 
X-CRM114-Status: UNSURE (   9.32  )
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

The hard-coded index is removed.

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
index 6150f3397bff..a2c09033a9ed 100644
--- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
@@ -4,6 +4,7 @@
 /dts-v1/;
 
 #include <dt-bindings/clock/sifive-fu740-prci.h>
+#include <dt-bindings/reset/sifive-fu740-prci.h>
 
 / {
 	#address-cells = <2>;
@@ -358,7 +359,7 @@ pcie@e00000000 {
 			clocks = <&prci FU740_PRCI_CLK_PCIE_AUX>;
 			pwren-gpios = <&gpio 5 0>;
 			reset-gpios = <&gpio 8 0>;
-			resets = <&prci 4>;
+			resets = <&prci FU740_PRCI_RST_PCIE_POWER_UP_N>;
 			status = "okay";
 		};
 	};
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
