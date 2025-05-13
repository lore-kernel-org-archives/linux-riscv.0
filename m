Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5542DC3ABC3
	for <linux-riscv@archiver.kernel.org>; Tue, 13 May 2025 20:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X0LSz7vZdHA5nQClvAEmiMeKAWFc2uXSKeqmCUqplbI=; b=AIV4DUpGRBOWLP
	ZUnrlvGv3e0ByApRvwdJH1fPcGX0bcxj58c7wFrILdwjWtTTeRgv28rrsdHweq26/We/uC8MRKoPJ
	jo2t5hf6/tqCNQCDmwGWFUKl2+cZWZZDqWxbkUi6j4c3ekvhNpOQAzV+qZe9Kc/mIZUJf07ApZZ+X
	8CYaNqJPuV4gpsW+KZ9UVo6ZjRoW2PWekDG6djvpJsPCBqnt9OS1snfOfr8MNxQhnzLWVyoE3ilKx
	rjhouLiThwSFa2IKKMht3L5VIbYRIJvwqOkoHJE3ebp44YWhcj4tqItSFTQBEABjtV7zjr/GFGkAi
	mZk2L0MflAIYtCgKVAOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEwIC-0000000DTeT-2TqH;
	Tue, 13 May 2025 20:32:00 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEwI9-0000000DTdq-2Twl
	for linux-riscv@lists.infradead.org;
	Tue, 13 May 2025 20:31:58 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-acb5ec407b1so1042774566b.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 May 2025 13:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747168315; x=1747773115; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WCZ2i6E0I6gwRQJDyVBo1njeILo9WXLxHiX21CXlaCc=;
        b=GzG56Zb+A9iXQ9D0RB/uirIGfLjXRRCnZt8vSwKrK/epBIdh203xP57PEt7NjA6ibk
         87hRAotu82XjBThjHOP5WNBAQz0LE4dId31zErJfBXJ4gzzUdyu/kqmH+cg88WDRB6mi
         zVbQDS+V+RwcHErfPe82jd8dk6608LUEd0G79uMol8asDMml8Y2zsZGd3GeHPilYEQpJ
         IhCOmASTtwFTMbIlyf3zvs5kBpVeB4057VjeAFHx5cqrd+AI88srAYrWIZTVF5/OvU8q
         zeC6rv0baOwFZ+oT/ZhJkLIj128jMwR//PPqhLEWGO2uYqzj/UDwbCs5/oPDENMkgLpr
         ahRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747168315; x=1747773115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WCZ2i6E0I6gwRQJDyVBo1njeILo9WXLxHiX21CXlaCc=;
        b=MrbXRajQ2shZEJ3MNtGnXUq+c6NayV4H/ntv6HZ59EWSdeaP+XjOA/IxzWZ4C63w9Q
         DrwbQFKqd2RMQ9YuXd+tM66BfrigfnejfXOTA3jXqcrcDk0wNjSYyoJ+WWaK46Yt7zhB
         lf3wloPeuCCHn6ZK6faSh19cGttPzQmbA9G99k1hskNkMzaOF3K1tBOK3s4qdVJ5D1pG
         gUYwArF75sVFS5fBmCPRbUVoeILAEm8oYgmMV34EQz3MqT7k4UKiRteOXl/rxtUwnLjm
         jAWCsgOk+MEnK2vaak+QoyOT/DDU9fjc7MUTbK3KEqDlwpPpO8xe/57Po2LVPSYBn8HZ
         Q7NA==
X-Forwarded-Encrypted: i=1; AJvYcCU3h63FLZ3ZhFukAEI1Evf4FMk+HceBo0lk2Exl9jE5xujNuL/aXNyalLqpG6/Iawi57KdFnIiP1oFWXg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxK79drrzqDM3/NZwhg6gmKTuipSSIWT4wRx5JCv7+itS9+wIpv
	mvLXUzVyiV6AiC8kFebC2gikLbXqjrLHRyMWFG7DNXjNzDjB1o+l
X-Gm-Gg: ASbGnctI+46cxmjwVfTHuQ44v+wuRPmfPSfHJV71+7gxeTIogNDqXvynOI+5CCiNuMO
	LgUbx/YGEPWgJirk1HJzrakGnOtjndIpFGzrGHP/lr9ScyoVdz5YhHOiEiLvRou8BCOEaP/cS1l
	dPju9GRXADVIteV0tB7rvGyr3utJjV8ODfKQwiewvJWJVTGfgVuj0aKAapBQXkIpmalvheFGFwI
	PrvWQg4r9ihxIoliUXXnq8OA7J+WFOm7kWMweqhbxzXh9OBpA51qUVqi7hNh7t+OVsALXBBO2L+
	8GfxBe9W0EpUyVcaXMPoRQ5ba4beDZsp4jaSce6nWKX6iqsBWdqtPgzd7PC7aew8
X-Google-Smtp-Source: AGHT+IHjQ1dMS6usnLiHaz4sXCz7Jck/zY0kS9uEoTI505F+c6LZUIo6wME/2RdA32p259FKoLkbrQ==
X-Received: by 2002:a17:907:7d8e:b0:ad2:50ef:4930 with SMTP id a640c23a62f3a-ad4f715a442mr96322466b.33.1747168315249;
        Tue, 13 May 2025 13:31:55 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8508sm819349766b.9.2025.05.13.13.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 13:31:54 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	sophgo@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: sophgo: cv18xx: Add RTCSYS device node
Date: Tue, 13 May 2025 22:31:25 +0200
Message-ID: <20250513203128.620731-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_133157_631944_083B9A93 
X-CRM114-Status: UNSURE (   8.36  )
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

Add the RTCSYS MFD node: in Cvitek CV18xx and its successors RTC Subsystem
is quite advanced and provides SoC power management functions as well.

The SoC family also contains DW8051 block (Intel 8051 compatible CPU core)
and an associated SRAM. The corresponding control registers are mapped into
RTCSYS address space as well.

Link: https://github.com/sophgo/sophgo-doc/tree/main/SG200X/TRM
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index ed06c3609fb2..280c45bd3b3d 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -307,5 +307,17 @@ dmac: dma-controller@4330000 {
 			snps,data-width = <2>;
 			status = "disabled";
 		};
+
+		rtc@5025000 {
+			compatible = "sophgo,cv1800b-rtc", "syscon";
+			reg = <0x5025000 0x2000>;
+			interrupts = <SOC_PERIPHERAL_IRQ(1) IRQ_TYPE_LEVEL_HIGH>,
+				     <SOC_PERIPHERAL_IRQ(2) IRQ_TYPE_LEVEL_HIGH>,
+				     <SOC_PERIPHERAL_IRQ(3) IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "alarm", "longpress", "vbat";
+			clocks = <&clk CLK_RTC_25M>,
+				 <&clk CLK_SRC_RTC_SYS_0>;
+			clock-names = "rtc", "mcu";
+		};
 	};
 };
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
