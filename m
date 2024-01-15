Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A48DC3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 16:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ag2l90bZ01glwmB9oBsYv6Q/UwK7ED67JIIYHUYUE6c=; b=PooSHiiCFd2hlc
	+jZrHw4XkSbMm0/9HcBIOt0ANdspbImS7JEo4rONfFIYaEa36WsKBjBOL0PAKmNEVoGmbfX5NlCXm
	FOYwycQHSUZs6Z274GxsPl/VzXyXR/pQQV341Fi/HhqTjznxNSQNcpLzVDJAGgv2Awz9JKO0f1lvF
	SDvLslqaY7/N70Afeq5V46axBNuEKdsqbo8bi24sSPENWduq4K+m8i5cKoc+zYhs+B2EA/bqwDohr
	VWzcu8eyhMoYDtU0nR6P1NlEnO/Zk1jqSR8f8Kz3a+PfPSyNV1ikso5Wr4X8t6q5qKHI0mNqaCPs2
	8nuOoT+Yd+OL83Djkogw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPTm-009Y61-1R;
	Mon, 15 Jan 2024 16:06:26 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPTk-009Y3o-1q
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 16:06:26 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6d9af1f12d5so7745913b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 08:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705334783; x=1705939583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFjfBuQ8gREaq4FYxrLGf+324YZ/SzYtv7HMcJo8OiM=;
        b=eWd2sg9FjsHE3F6/jNBW76ESIW92lFW0V9Y0D5oECjDb3ObGiVr72F9NhyNzEPpC1O
         3tF5K6dZCwUdExyXO6oSmaj2WCZucIyUIfr5vmWrT8RZlm3umaxx5WUxMQBJNAMQoHH9
         30qf2u8elHrvMuoxhZykefz41miLuKVDKdb9G8MljJdUkToVNAdfzYazBiMH9E9mJfee
         OkTWiu91lvH4jqaT/+c9WbyBQ0Xk9iMbUZAkIboV5CEcoSWky2xbNh4rMqQkCsi9uUSc
         PaQ/GIG3BDIAquoH8XBDyMbU+O3Ugn5ogWQFD0HVy1Gwql5Jno0GjCssrRKLrY7eMnMF
         GXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705334783; x=1705939583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFjfBuQ8gREaq4FYxrLGf+324YZ/SzYtv7HMcJo8OiM=;
        b=SGgi3rw7tfRTMI/S4/2LCaCOSNFPlHpYHbb+HjkCA7qpbHSMriU/mz41CyV3D4/qHj
         XWcEUil7mCMIAuL4hOWfP4MW3CqEyEKmTmKRbQiBZAse78dMuLrRHWGdDoDqOV8WVtY+
         wJCXyYyIyyv9KGw9/0u1fi0Y0pDY9oJjryIgPu1TxrhVOBYXyP35U0ltG42AxzAxuXq7
         RnnhXO2CGDEMc5M3Mses9auVmHie3dwZKGkTPmDoR+CAaVCL7IzIoDOiDjdPdyOG5h6f
         GvpaQgehRpeodtAOIpmCXgIT+bBIShBOYM+9tHPdtVbxcsh96WVtGJiBuhWTFtzqHn/Z
         L/EA==
X-Gm-Message-State: AOJu0Yy/NBfdDgww/A3C2qeW95PYj8B6V7A5112I4dTz9mx30mtLsk5v
	P3SA85+YQkyRhkwbc40l4D0=
X-Google-Smtp-Source: AGHT+IFKj9mSl4b8I0aFzy6SsolLQ9h6pIbeCtf+spzb47O3C8OybzpfLNS5qaDEzORGMAY8PuH/4w==
X-Received: by 2002:a05:6a20:d392:b0:19a:9e3c:e98a with SMTP id iq18-20020a056a20d39200b0019a9e3ce98amr6370013pzb.21.1705334782493;
        Mon, 15 Jan 2024 08:06:22 -0800 (PST)
Received: from localhost ([124.131.233.112])
        by smtp.gmail.com with ESMTPSA id n27-20020a056a000d5b00b006d9fd64fdcasm7757783pfv.37.2024.01.15.08.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 08:06:22 -0800 (PST)
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	chao.wei@sophgo.com,
	unicorn_wang@outlook.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dlan@gentoo.org,
	inochiama@outlook.com
Subject: [PATCH v6 3/3] riscv: dts: sophgo: add rtc dt node for CV1800
Date: Tue, 16 Jan 2024 00:06:00 +0800
Message-ID: <20240115160600.5444-4-qiujingbao.dlmu@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115160600.5444-1-qiujingbao.dlmu@gmail.com>
References: <20240115160600.5444-1-qiujingbao.dlmu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_080624_607070_8151AD2E 
X-CRM114-Status: UNSURE (   8.65  )
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

Add the rtc device tree node to cv1800 SoC.

Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index df40e87ee063..66bb4a752b91 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -119,5 +119,17 @@ clint: timer@74000000 {
 			reg = <0x74000000 0x10000>;
 			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
 		};
+
+		rtc: rtc@5025000 {
+			compatible = "sophgo,cv1800-rtc", "syscon";
+			reg = <0x5025000 0x2000>;
+			interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&osc>;
+		};
+
+		por {
+			compatible = "sophgo,cv1800-por";
+			sophgo,rtc-sysreg = <&rtc>;
+		};
 	};
 };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
