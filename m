Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350BEC61CE8
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jun 2025 23:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7P//kXkL3vQbS6cDvs+skAqsC3YvL6mHBk65uU5VBAA=; b=cMZlAmCNOQ3L4E
	jkLjClHJB9Lk7zczdqh83hYW/43vtqEJ1I/yWqf7G++tJMlu3slbHd6tJ4/bN8g6GmAg2CZn608rT
	KPvM+lS8gsey0O4czYxWD10qrH7Z8mOVOM3yPn9sXh+rZfGhDe57HD/sHIfSoFZ0p3ZwJo6cc9bgq
	8N8s421PlafVZjl9BHPt3aT3Nmtde49vCiKU4seIKFtrF/3x+8UfI2dFYBwmENGc6p3rvvbfIrPu3
	3KEgVgOl+3cC5uwEiQBIOQ5NUh2laqb8SfOyT7+3bfQcBaXvPJwO3I/FGX4rPAXUPgSfkvkSzktDS
	FsuXBsNqpKaPeX2gumzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPSX-000000037Cv-081j;
	Sun, 08 Jun 2025 23:29:49 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPSV-000000037CJ-0Wk6
	for linux-riscv@lists.infradead.org;
	Sun, 08 Jun 2025 23:29:48 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7d38b84984dso201645785a.0
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jun 2025 16:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425386; x=1750030186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCb6v/f0HspzS243Pz/dNvSdYY/W6vQ50DJnwXfCQFM=;
        b=gAwrdZL3fvtDcsIF4g4MvXOPBiubiLsCIfe0FtWx2k6B4rRSeRr8S1O9VWOl1XQKux
         npmcLmp3gJIamC50qb5KNNnzV01w1Zb9eD11ahoXm5hZq9qOb08QR4bG4rI8FLI1VXT9
         dTlpPMJgYkrGooyPqPqpK1vtSQDInIg2lQmQ6ljYNSNZGJLkBNGuTv+1C5l3N0BzX0m7
         UTaWN7ggVNDgxzJQn7yyD+FSKn7gZqsC8EC198VBQq+6WBsenBtUdNeFmyeTZNmVrh6i
         gVb6XXF7CwcY/3gM+asHC+dh2WIi/NrS14hM1aNr2UoIxSmjAYc4FcOaD6OJR75LwdSv
         Lndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425386; x=1750030186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCb6v/f0HspzS243Pz/dNvSdYY/W6vQ50DJnwXfCQFM=;
        b=AR3af+fzOBZPX+d6AvimI6HdW/EM9KRiAQT8qb1Wt4VRvuZbtPS9amTrwhaGF2UhMq
         3E5URKFkTEJM5qv4YMnkcz/+35c1iiZCToBSiy4p7Ckfq1vQKN1O0xJAEDY4toxNtd+3
         eQXJWgf4oKyIdHQjKrRTldSHvd1ACYlZ4g7nzgZeo60a6iBssOFrRATHrtOfgJGVoE7V
         j2nvEAvDF861n13EViMasUpMoJwO6ze9nQXEir6bs+cKH9h9Ho2Rpinn1wKCYfQaHdca
         dC1HuObic6sm63EmY2K96HbcuqHS4Y228U4K6A97z7L/bq07I+uPDw8qk/gDcHmoy/vD
         ZCpg==
X-Forwarded-Encrypted: i=1; AJvYcCUshk6dYIImfZOJeZ7QhS90IfP1KQ91JdBME5ONbTOcztQ376hU/rc+mU7mXuwg36rvgxPMGy76n9iiyg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3fOkEMU2QWc8ZfXslv1on/ra/GgB1q+uJO1wEZhs80NW19UBJ
	fQfssf0RrOnGEnhcjPOvhrs23IoOeADinj/hQ5cnYor5QE+kpDPgBTmR
X-Gm-Gg: ASbGncv+RaU6wLHhptDXmy9E/Gac3afegr6/LRJz5nCalcsF/QOYe+4b27S2EMCMCq3
	yevIlgBS3LHWHha4PP3rzxIQMhJcUefqN0tOBtw9qJuGY8mg9XER+DXhODdNJqtbgWNXzmJ9ast
	7w/h12VDRECVQFUF35RFfqCJRxc0rfwSJ9BSoqPoy/CfD/SBVqaF5rMbxX4O5NiqT3g6X0Ztmd3
	msYehfx8iD5QuZN12JSFGoeG+p3hu8z8XIfaceldB82uJwZNnsD+iGmoQKwJpNevnCUZdJPpUfM
	PkXA/y965uPBaMGzFEU5WTnq/swr37xKGKH4Ag==
X-Google-Smtp-Source: AGHT+IF1BKK0uFTInialGKijH/6k16MniaxLSvYp4PMRIjXYhZYA5hYo3Y7cvlg6UD8+EGsy2nqTeg==
X-Received: by 2002:a05:620a:1a8b:b0:7c9:1523:3f17 with SMTP id af79cd13be357-7d2298ed2edmr1567583185a.57.1749425386115;
        Sun, 08 Jun 2025 16:29:46 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d25a535794sm465946885a.26.2025.06.08.16.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:29:45 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Longbin Li <looong.bin@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 01/11] riscv: dts: sophgo: sg2044: Add system controller device
Date: Mon,  9 Jun 2025 07:28:25 +0800
Message-ID: <20250608232836.784737-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232836.784737-1-inochiama@gmail.com>
References: <20250608232836.784737-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_162947_164891_45088DB6 
X-CRM114-Status: UNSURE (   8.22  )
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

The TOP system controller device is necessary for the SG2044 clock
controller. Add it to the SoC device tree.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index d67e45f77d6e..a0c13d8d26af 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -76,6 +76,13 @@ uart3: serial@7030003000 {
 			status = "disabled";
 		};
 
+		syscon: syscon@7050000000 {
+			compatible = "sophgo,sg2044-top-syscon", "syscon";
+			reg = <0x70 0x50000000 0x0 0x1000>;
+			#clock-cells = <1>;
+			clocks = <&osc>;
+		};
+
 		rst: reset-controller@7050003000 {
 			compatible = "sophgo,sg2044-reset",
 				     "sophgo,sg2042-reset";
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
