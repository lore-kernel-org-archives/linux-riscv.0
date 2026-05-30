Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422DBCD6E55
	for <linux-riscv@archiver.kernel.org>; Sat, 30 May 2026 17:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d/HnWJYSOKO7MnABME+1/ziyVc2n8dSlCAkPB4LD8YI=; b=Yu+GmrB2+Bi7gT
	vns1m9DbxjkmsdmTYQ/CahA/YfM1aJpXN4w0euXwoe8DxUK92XVewoQI86pFAixl+z8QaPC9LbU5g
	w011ilYbbPsmyjSxwbetx1sDNcA7DNRkpSkOa3lfbfwys6CYGs0ew68fbpUSjOgc/+l836gN8OkxI
	t+/cY59ahKuHgZ6x7gJ3ht5JDCSKwBHb2x8L5sejALeHbHgKhtNDlgSPN1LsAGH+vXnbL89jdrsQD
	cyt9H61SkXJknHY0LoqqG7r26M2TgwbdIx8MfbqwE1hBMJjU/mT66e0mQ3lEaGVwAkE3OVbtp14XV
	P0DIIvVGFLC74+gwrccA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTNb1-00000008yEO-1yHq;
	Sat, 30 May 2026 17:35:39 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTNav-00000008yCT-2M82
	for linux-riscv@lists.infradead.org;
	Sat, 30 May 2026 17:35:35 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-91550eca866so7816785a.1
        for <linux-riscv@lists.infradead.org>; Sat, 30 May 2026 10:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780162532; x=1780767332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NICNW7Co3viLg/bgtUjVDeGjmH93cilbK6h9R5fkil0=;
        b=UXEKFn4r1QQ5H9LHRBYuDYTzoU8V9TOowm/NrEqSzSqVwstSzl3G+CMnDOfl/D5RZC
         NS1/s5wagvba1pma3RpjvppInjEtaavf/WuRA2ORTGoQPZAPlmWR5ECCSFESR0G9dRmm
         eEnPqdW5i5Nu79G/DC8bdS3S3EBuSxprhs6Tg/MBv/yuLxH84RrceXRmQva9ozS30Pov
         8YPZsEL5sZe7kJnVBcO4O9QDIwqxae18WaP2Q4oC7MaXCxrvuY7ieOwy+3m/OVo1/DI2
         ivRQ23Oak2UkdEC9hBr+heMvLkPy571fWbRFPYYXiYByvEj4DTDv/o5TcwckkLw+33MN
         Crqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780162532; x=1780767332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NICNW7Co3viLg/bgtUjVDeGjmH93cilbK6h9R5fkil0=;
        b=pFrEnvopTMBtAKR1gXIFEc52tN8w7wdUd4lZyX4epibhyzpoiWk+rcVLLLASje8FtC
         J2eEpjer1/NVHvDOJbUeSaF0UKy99dbefKLcavly9v1ul55ANSvW0VKHHWt/oTIOSKQ8
         eX4xC7bPZnqZ35774pAGtflg/qGZwP7irtoEbpyP6hpfuVGM5ao9ldhLe4nKt5tO11mW
         2ZGaq3ogyCBCWLPkULE7hGQhFWeVasX2wp2gMU8olIo88tttr3haVrcTFAfjkPDSczjK
         MTt5oxQ3rM/v+ivu5tWks6CZistBunnhipAE72Imdz2LyvjOiCjl6NP5TaIRXChyza/C
         1FFQ==
X-Forwarded-Encrypted: i=1; AFNElJ++S5UvDmPtc39cq8eze/lTEPPM7OAIsJWxoA0EA83/Le613GOx6QkSwATCeb3X1vVYM4LufE78xR/0PA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoUO5JaHSz/MH5fUoOSvowuytuahgyC9QHO7OncDkhLZNY3uye
	p2afOz7/mfmRxSlaIyC44FzjPSJ5ZvWqUElKsgNxEr1Q59CgMYfjuMyjd5xXQlcmX8I=
X-Gm-Gg: Acq92OEQeDo6ZkcmJ8UHFQHAO/MY99W0j6CG5jwJ6E/PE2egAtS98tD2fz+HVLX4CB/
	SGia2Es3Mr7uigGmLIOUTgLIwUW6ghD+QQjmoeV3V6Y1dGy3IPMpl1g6JjgQchS2BvhnXdoLqVD
	73XwhJVhxSw8xj8vhKtt08r6N9ewgDF5T60Fecd1/5ab0mTGIURndnaAXCUcsWPbL+T2FFtNiKb
	sP+Y4BoQdiIroa5W+zovrg1jBwaMUAfe4+Q4WN+KpAdf0snEQWnKFBl5CcRlxVWFcKKDYiSMORk
	WQwBpEmF6oE+a0KX4eM45w1N4yebNY6tGmI5mlWhbYKTo/YBqwZIa3wB5yvHHL7fnEKpjJ6qHY8
	Ry3vU48juCPcZvOqRD6y7fy6g83MUsWLqLv/IMuNeM0/s8OfGoABP7BMATctMRNwbvoaQ4Drr+i
	tbmHHIW09Q4vvdZ/EVige/266GxHa3XpE++wi0qMdKfab+W5ARnDRSrxMblsAkZsecn80=
X-Received: by 2002:a05:620a:4510:b0:911:8e3c:f165 with SMTP id af79cd13be357-9153d99ebdbmr687805885a.19.1780162532103;
        Sat, 30 May 2026 10:35:32 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9153244e114sm565606885a.5.2026.05.30.10.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 10:35:31 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	daniel.lezcano@linaro.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v5 RESEND 3/5] dt-bindings: soc: sophgo: add sg2000 plic and clint documentation
Date: Sat, 30 May 2026 13:33:45 -0400
Message-ID: <20260530173347.33533-4-josh.milas@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530173347.33533-1-josh.milas@gmail.com>
References: <20260530173347.33533-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_103533_624673_3B57175C 
X-CRM114-Status: UNSURE (   8.51  )
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

Document the compatible strings for the sg2000 interrupt
controller and timer.

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 Documentation/devicetree/bindings/timer/sifive,clint.yaml        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index e0267223887ec..decc43df3c839 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -73,6 +73,7 @@ properties:
               - allwinner,sun20i-d1-plic
               - sophgo,cv1800b-plic
               - sophgo,cv1812h-plic
+              - sophgo,sg2000-plic
               - sophgo,sg2002-plic
               - sophgo,sg2042-plic
               - sophgo,sg2044-plic
diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 3bab40500df9b..54266b3c2a185 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -50,6 +50,7 @@ properties:
               - allwinner,sun20i-d1-clint
               - sophgo,cv1800b-clint
               - sophgo,cv1812h-clint
+              - sophgo,sg2000-clint
               - sophgo,sg2002-clint
               - thead,th1520-clint
           - const: thead,c900-clint
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
