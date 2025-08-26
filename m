Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924D4CA0FE7
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 01:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uXDDqY0TPrvdUqtoRBiBZjB8FNQrf34MnSmlG/N9iu8=; b=Zpnq7LxQjmwmKg
	ON39W90MlQbKZbQyMVta7Juwvt2T+kodVUoXGiQ+A5bQfq/kDv/RTrLrRW+R/OLFFzB0xK7l3ZEv8
	hrUltyr8Uh377aHDXXR9d5NDHwRUU4kYbS0Wfx2oCaU9LEA2Gbr3SpqHKX4osPXcsYm5Ukixbwwvb
	ui1Axg3nijdzz0tA4SHue+S2osueNmZVu0APUiQ1IVDY0vNn5+F/si0ngvrZseKXzG3jtOfpjRRgr
	5LbxxijCkrxG5SujRCyzeQ0f6R8crfoJLUbWHVlKCg11mm1sDrzBXIpeixU2vh66ZsTJQAqiwu2Tq
	j4Ao3l/5Fv1/YvJeXNKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqiCJ-0000000AG6A-3XXT;
	Tue, 26 Aug 2025 01:10:03 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqiCH-0000000AG5Z-3MwT
	for linux-riscv@lists.infradead.org;
	Tue, 26 Aug 2025 01:10:02 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-30cce90227aso1670227fac.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 Aug 2025 18:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756170601; x=1756775401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fr502dmQ4odPuahV9+jfQPzgPn5kXy7yEDTTv9ShcH0=;
        b=eyAD8cD9fKQgUyZRZ+FPp+v3DleNU30NX/YImQpEi09iFNK1CummR86tz+mdkt/Hef
         VKeAK0BDTqaU4svKjuuNFmWUtHZvHQrNfy2eXrr7jwTBXd2y3faScobJ/hMfWZnsDPRh
         BBTAAgraXAHPwD/qhVi0Pf+EEijX7KOJI9l2PEkVBwxYwVtCHSS7UO0r1r8sB5lvz9Vk
         K1pBXsWl1Vs60b5oQ2lhSB1dKc9Ujrl8Tdpvy0hMYBepdGU46BRM0qQwiil8YsLQq3Mb
         VSkyHvNTqnxVmHDeWK8wm7hXcGqQ8j1Gh8mBPOuN0B3w+7oNKfzCPH6JDG3up9KzydDF
         OAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756170601; x=1756775401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fr502dmQ4odPuahV9+jfQPzgPn5kXy7yEDTTv9ShcH0=;
        b=nj4tW1hTtHNjqnKgQ9aWVHjmQV/MRfbJFz/4eG6urg4oaNgWIIKd7k0RwtHOGtwPnq
         1VVZkDAguqiixpEtT1Sid4RCMkIBiOCJdJRa1utwcAKy48t2cBuAUn3EEi+FdvylOvyO
         W9Hdsjs9nhwcwcsgi49Nm7cGY0zbkBc/HHQG02SM/sBwUi6c+jr7GqPs1wQZ221w6JAa
         pqnVzIDDwEoQa0JCPCNZQJk1NiG9V8BfMthsrGSGHpdlE14i4RxshX8K2PCsmjSqrig9
         dPhfAi1cA/YY0Q1ReIZOee4s7qpumam2CHH0IXcuEzSkZES5Cm7luxwDIkdw3i156QIw
         SKyw==
X-Forwarded-Encrypted: i=1; AJvYcCViilRzG5OKlgWFeja8VIi6RrERkeg5KmNKOsC4E3MGT82o9byoz45C/N+UARJU4GFu2xenngGhJsQ05g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8tSJYEoZsudhjLKlpwvVycKUPjdr1XtMqaELIEXJUIwlOV75Z
	/KlUQXJW9qmP12eP3VcNrgC+QmUMjYc2BmIZfVrDbMcEXU4Im9fVku7a
X-Gm-Gg: ASbGncu8OkCyjeCrXYyBLwxjnWbnz2XkYagE6UXXvmU/0dvwNL26eQdTBCMtW1tYBDV
	8U+401gYx6m+i6vRgoMSbgie9zSJa2CpDfFFhwwUHyi7cWvLSgTU/Ih+qcWyAF5bmlNA150drI4
	w1zxZwrAKsTHVcE5b8nKKltO+b/RsfJ+ZrVyXuyrhkOBvlmlz5WHSEZm5k9PQvUVL5DvBdfOH5w
	5x1WZhVgNSf05r8BEqQMXTGczqkLo4xj1FbOxNWceZmbt1X3Os2WCvnlpmv9A91NCWHuwOzr9EV
	NGasIRfJPPpiJeHTnGeN7nykyga6lDja90qAYUKd3U0dv03fpTPKuQlw72LPDZXunQfhBnY9QIP
	Bka+XeiFi0MdUlPnBPFqNsnDv0S5uUKzm
X-Google-Smtp-Source: AGHT+IEsQEcjW1z7CYizlWk5Kdag1/FnHr2VMtUprwv0c3Uuh19bv5SQ7f4+YOhBfQookgotMBtBBA==
X-Received: by 2002:a05:6870:35ce:b0:30b:b7e1:b3fc with SMTP id 586e51a60fabf-314dcda8715mr6397465fac.37.1756170600590;
        Mon, 25 Aug 2025 18:10:00 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-314f7dd474fsm2181363fac.34.2025.08.25.18.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 18:09:59 -0700 (PDT)
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
Subject: [PATCH v2 2/3] riscv: sophgo: dts: sg2042: change msi irq type to IRQ_TYPE_EDGE_RISING
Date: Tue, 26 Aug 2025 09:09:52 +0800
Message-Id: <edafa432c80a328d80952fd40753d1c8cdd5364e.1756169460.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756169460.git.unicorn_wang@outlook.com>
References: <cover.1756169460.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_181001_843979_A3DB2A46 
X-CRM114-Status: GOOD (  12.53  )
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
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index b3e4d3c18fdc..6430c6e25c00 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -190,7 +190,7 @@ msi: msi-controller@7030010304 {
 			reg-names = "clr", "doorbell";
 			msi-controller;
 			#msi-cells = <0>;
-			msi-ranges = <&intc 64 IRQ_TYPE_LEVEL_HIGH 32>;
+			msi-ranges = <&intc 64 IRQ_TYPE_EDGE_RISING 32>;
 		};
 
 		rpgate: clock-controller@7030010368 {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
