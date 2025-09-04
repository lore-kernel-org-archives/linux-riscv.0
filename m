Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B0BCA1014
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 03:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ce9f2BWhY+rqCaby3ar9/nvMWk1sqjSR4a2YFB/PvSU=; b=2KBAH6TOFM5i89
	Z7CaXH2QLUspVx2qUhXrXiJEpLoYPq5tbwxeM93w4osdICHdj50Mr5ZqZcGbEb3K0/6MDuP5EQhhN
	/p0XAIVsC5CRqNhoBwjbxBEJ6y22fQ/oN+XVjnr3B3E9f7zgzmuY+g2ic14H0fR2sUl+w5E800opO
	5lbuxbk7cIK6ri1hRQ4qveNcRGbjHX6NWqGmoAcleL30cAnSLLxI3lVE/21f4h4YsRIm6wO0SqI5j
	GkhkUfzhoP/zINbbFAZMOZefTPpDkD0ejysscHijtozEJS8oku40f5HaVsh1wjzA+tV4tTnWGxztu
	0OZ0anHjloi+vWQAVUtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0DS-00000008XiW-027u;
	Thu, 04 Sep 2025 03:00:50 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0DP-00000008Xhy-2Fwh
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 03:00:48 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-30cce892b7dso244030fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Sep 2025 20:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756954846; x=1757559646; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5jXeT55BnpUVCszwTrOGZ3L+gWKoVejeqfq+IifiGA=;
        b=mUWF/PRTwy7LqtxumNyDVjFXB7apqO5A2upc5b3t4pQN+bvKcVCclWvwRU5dp54QEr
         0XBuZ6++RMgAGWP4uNr90jJmQN9e64e4onpoLNrB19tMpP8YPeXldPBoxZ82hsza3UcR
         6CvTZg1BcsgTsCst+B/R9V7qkYX8Y6P3KDywRd6IKRu5Fx7YkDGbZlg7ZhNfdFCU/edz
         8rsHmNr25tVJ9QCkKaflo4F5op798OEW0hsK2//1u7YH+tDSlCSzzMKwI8Yy7roqWhUm
         fqJigamaDoNk7DXR3JDWe9BI9u0oD+1g2ZcBL0NRGYR/Imu405pL5kuEhrw9xIs0QtSI
         UtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756954847; x=1757559647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b5jXeT55BnpUVCszwTrOGZ3L+gWKoVejeqfq+IifiGA=;
        b=k2cjLyuHaOoL3DpqM36heSXPTWLWkORVRGt+oog147GL3U4v51kDHl3ZFfTzZs3SRQ
         ycQFrkvBBevyUi7e5IZCRt3EMujbcnKZIKyLbVTuYx3d0Yh/ZYGukMENqQqCHL2UpsA3
         F3dxsBQXLslkWBV0r+fufNorngSRYO6iDJFclNp7KgyjP6adPnYfKGR7w/R0MMAS3v/8
         1qergzovjS9r9Z20hx7t8VFXNR9cNlwiUwYbx3AK+eoZW417AL5dO0yVHtctdQ8KWZUp
         JIADHlAlOLyOwcisKGTFeOriQC2PS1j4nW/slTSZ3yT1ozg+HZMSFi+gXMggKxgU7j/d
         J3KA==
X-Forwarded-Encrypted: i=1; AJvYcCVoXjLjHM00vyeJan0ncTlTJAX3Ix+hH+5fItK0BdQ3cnDwJijmmvgTlZGnZ6n/wJ6rNO0plnZ2/EPVJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwICMYzIfsz+W+vnK/eAnKxkdXzkr6mHOKiDpQrlSa5dp16n7xK
	IUHWELVcmRHcHRhgi/FC7c7HrYFQF0c26/WEXxD7cK3J1CeiscjbzLlb
X-Gm-Gg: ASbGncuqFZ7a7gucC/Qg4hqOnhAfOU/OFej6Ye2nIohTGrHbTnbnDWaKDhz3wdN5ce2
	zCK2E3h1y6ZuHxeygIpeTc0BFJjBAdUXX0GijFkJwPzNqFKAy4LsJkaaSQSYY47bqbtKGxRhhsT
	yPT81FIMEs1AQ54pc00dDeyGJgoxD8x5ZXaMbLvF/0ClnwFdpXXapeCf0A8mk0zCjrRTrxVY9Im
	ftq1mz7khH8uUqLHHKR7woc9g22VhpVJZMlqdp7f3wKRoNJwOiCgjgopc/d+t398q5iOtC8ceqf
	sR9JcOWCZuO7ePaanVywy5mFWp3UwFrCY5f/nnDkUaEcrV+io8oxHnx5qTJMmKKtNsokQTG90ZM
	2kM9vO8l4PvWlWhFhDe7QykdKccHKSl7aMvN1Em+/cIQ=
X-Google-Smtp-Source: AGHT+IHlvmexbbW2CBYnIgaBbF+B/QOgH7eG7bUDWUjPCiy5DLQ8QKw4zT3k8FX/kgF+W7r/JPofcg==
X-Received: by 2002:a05:6870:63aa:b0:30b:7ffc:ee85 with SMTP id 586e51a60fabf-319631d13f0mr8794231fac.21.1756954846566;
        Wed, 03 Sep 2025 20:00:46 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7457428c153sm2570265a34.8.2025.09.03.20.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 20:00:45 -0700 (PDT)
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
Subject: [PATCH v3 1/3] riscv: sophgo: dts: sg2042: change msi irq type to IRQ_TYPE_EDGE_RISING
Date: Thu,  4 Sep 2025 11:00:37 +0800
Message-Id: <831c1b650c575380d56ef3e2faed9bee278c9006.1756953919.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756953919.git.unicorn_wang@outlook.com>
References: <cover.1756953919.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_200047_574987_26607DC0 
X-CRM114-Status: GOOD (  10.94  )
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

Fixed msi irq type to be the correct type, although this
field is not used.

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
