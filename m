Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDD5CA0FE1
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 07:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LO9pueDlBtCpqOaIM5GvI1MINokcszf4dlvxl3eqxYg=; b=gjf6ZUv/2t6cTE
	LTU90w0+VAJUD6smO+kcNSmKRvSkz1HCVYrjOFRKVUqNoGP4/MLYpDvRVuCWtiwpa1JugEq7u0EVC
	kIyVZBVMEwkyvyAOb7OGfKOilVhZmhObxaW7z5tXTK+om84RDU4+OyjkRwB/RHk1bXgV/+bPUcqTz
	4DWxZZJeYzwHtexZRSh29YEZXHC558hhplUmitAc/uQJ6BJUKVp2yMevOHIEFPewBomAPomA0JIGD
	iLDQ0MXanBlhgG6j+bPhxET6HYVD0wPIAnGyBacJ/1KdT7WqImroxSTNI8Y/JB+XNo7toF465YWNh
	qKj71OfeiIhNJMKdmz2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRel-00000007Aam-30xc;
	Mon, 25 Aug 2025 07:30:19 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqR8Q-000000075ha-1GRu
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 06:56:55 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-30cceb749d7so1318493fac.2
        for <linux-riscv@lists.infradead.org>; Sun, 24 Aug 2025 23:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756105013; x=1756709813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6/Iq+sl3J+lnpf+wc6OQRiTYktTo8qUO7r+bK6zwUBU=;
        b=XopG0ftH7HCdXXDaLzxdB2y5kDRSzl/fv54WpFgHIx/o4DyCbvTmmh2Kf4SM8ILyB+
         6vsLaTkk8td1Pye/gHd1BpCS1vESl/Nf2TH6gfWigzkNQImMq3otAHXa14qdnL+xDadc
         Gg6xjBzTtUpHFh10xDvZhng/y8/shkZOaIagCvrZaYWOYRRcoDuX0/9mcYZ2VdMAnzwG
         EybaUB73u5C8PQh+I/elBU0K4lyKpWm9Y5M/jXIDDKzwYraODrCwWiy1PtfDkIIXUJFm
         WAEz4Bmu7uIdK9YRQLGDuq1Eoq5IPAku8I1/KCqpULu2kHhRwC2aaGrMiFVrDMRlEyMT
         zTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756105013; x=1756709813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/Iq+sl3J+lnpf+wc6OQRiTYktTo8qUO7r+bK6zwUBU=;
        b=rsUcfR/bHFSdosMUf73FggyBrPtF1VPKBhdTpFWOVmoj52fzL2EZ/0T1eomPEpnboU
         s2qlDMqE/iPnmubhybUFN2BRmhXnUO7fS/pS8UYoNRSFBFOxyd0gd9K0X38YWkCRb/T3
         lll6awf7E7ZHU3BJ1t9jjK3mEXcQGmVM02VhzGEz3YhPD6/FBxngve0L5/vVzsDaxMtV
         VLOH+Oi7de8B6eRjaPeL3814cO3K79p6sVa7B8lyu7kH+swrnBkXFTvvlT0JxeljlUji
         zVYHPFDx7FGlbwjxyC8/EDOp3L9jS8Ewm55iqqzGSEmDdpNYGFGWyPw7fQylV1T9xGI8
         IIQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBzeCriNN3ZkR2J2nuOYSMm+7xD2mMsi5n7Yopim6oH74Bpi14P7U0KO8yYdHShj8P+nRg0AfZmYtpLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxybFbqzhg3ogYM4MsdDczO6TQzJvLc7AvrP+xmcI5ALpizzaE
	14qIMgJ6/uqaWNFaqUKg56OdERDA8hI4/KbSf5qSq4LX6Ab07xh7Ie5X
X-Gm-Gg: ASbGnct1+IkOkoU0z74mKK4BDGlu0sy7HHTqlplZ+eoX7zpStno1+QymD0gtSbc9dnO
	p9Mpn8/FToH44o8keMxPDl0rQe+dcnkyDNJsTKY49jFgU26V8RckeoDxEnAgQjGhxorwjwQ1Oa5
	+lWdGc+d3Qsm0XOlbdQWsSLVmObnP9EqkvaGQ4mXaaZkTH/0WAxDftRIGAz0MHlPpKpKhPkQwTl
	0Ka0E1RWzOOz7oZBi0N+6zyeT5q8+O6JJO6uYW8arxiXNF9DOc+QW3vhi1g3sStbkg24tx/6QCp
	UXydkmmWx5jIOUxiTVUfNysSCED+GO4NJKXLxtregCWJymWUBdB8+dLOWh3e25KUq15VTbKaDRU
	/4B1ozwmeNaLFT0Qvzso5ciSu4TwMBGnZ
X-Google-Smtp-Source: AGHT+IE4S8hpOAZcHJoPilZ7mmplf7IZel6cvlTzB91P6LUa8rKsYKvo/Uiar7NnssN2qnxAYRP3Qw==
X-Received: by 2002:a05:6870:1698:b0:314:b6a6:68aa with SMTP id 586e51a60fabf-314dce1b218mr4807487fac.50.1756105013383;
        Sun, 24 Aug 2025 23:56:53 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-314f7a21bdfsm1630481fac.8.2025.08.24.23.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 23:56:53 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	inochiama@gmail.com,
	krzk+dt@kernel.org,
	looong.bin@gmail.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	tglx@linutronix.de,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev
Subject: [PATCH 4/4] riscv: sophgo: dts: sg2044: change msi irq type to IRQ_TYPE_EDGE_RISING
Date: Mon, 25 Aug 2025 14:56:44 +0800
Message-Id: <a0ddd70d0658a26a24a9ae48d7ea9e59dfd7cb6f.1756103516.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756103516.git.unicorn_wang@outlook.com>
References: <cover.1756103516.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_235654_337700_613BADFA 
X-CRM114-Status: GOOD (  12.26  )
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

From: Chen Wang <unicorn_wang@outlook.com>

The latest MSI driver will read the DTS configuration to set the IRQ type,
so correct the IRQ type in the DTS to the correct value.

This field in the DTS was not used before.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2044.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index 6ec955744b0c..320c4d1d08e6 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -214,7 +214,7 @@ msi: msi-controller@6d50000000 {
 			reg-names = "clr", "doorbell";
 			#msi-cells = <0>;
 			msi-controller;
-			msi-ranges = <&intc 352 IRQ_TYPE_LEVEL_HIGH 512>;
+			msi-ranges = <&intc 352 IRQ_TYPE_EDGE_RISING 512>;
 			status = "disabled";
 		};
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
