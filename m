Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0676DD12D71
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 06:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqD0KotWNsc1ton/xMtWiZ8Yh3lchCJiC5bdZfnOCDw=; b=JQ6FOH4anzevhP
	tByUZDURxcSw0TjkyFT5EfCOqrFk/YDgbH+s9ty0u1UlwfRU6Z/5pxIBVvOMD3M4UuD6f+cXsDCPu
	tZcyHKrYRERd5fNwiG26Orv9iDMprAyzFywWxjjYwILnFqmbxkWZMa2gVbd5+0BVso+22ktyZsNaq
	Z4eIxIkKESGjZ0SNGpoMoQU07eoeWSc+qwPUocdPK4qfWdcvtLIDWVQMauxwS5Cm50I7I8Gd7szXd
	imWtv7UKZjrEUoT8jeLtvTk3LwFJfXhvqQFQZJGzmlSPlQxIeNa9pBzgyebgODV6ZZlWOpCix2zU9
	hcQ+gbWnQ8DgUNqe4nyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tANU6-0000000GRSo-1UEH;
	Mon, 11 Nov 2024 06:01:10 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tANU2-0000000GRP8-3BQr
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 06:01:08 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-718119fc061so2101599a34.2
        for <linux-riscv@lists.infradead.org>; Sun, 10 Nov 2024 22:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731304862; x=1731909662; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ln/YvogurAeDd4PXMTsxwRi+ScCPO8pDH1rSa6dd7is=;
        b=G4s53lrnsKW9wMeOCk89Qiuylba0Nqel2WlE0BsLoqeokEUhsXSqN9ydx8V+4iRcbh
         N8cVe/Wcyh1xjofu8Zs46YxMrWWrpmSfcN0umIjTZC4xvsswRGeJuc3vfOJRlTEZV5T1
         SLN2NoIjXaFVuH/TDAzc/0UjL60CrlnGMdDow64g4zvWP+F/SgTmFdTvfgcOLhSf+KnF
         zoZhheUrDqUDq1odl1NcuRehvakhyRSSOf9jdjlfTkJHp651ClZNJFebybgjUwHYx9c6
         24wrL6LbIfYLBTfEEB66Mr/xS2xb9otCtqhn0CUG1MvdVlokyeBoDkNP0HXMTPsUwU4x
         VvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731304862; x=1731909662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ln/YvogurAeDd4PXMTsxwRi+ScCPO8pDH1rSa6dd7is=;
        b=MNg588X+FtYq0N5MNqYR+OhuX7Ivg6vAjE9QzP3IRtxijZZAc9YlxrTCHDRmWYL3NE
         uKn/DgdbY9mZ+B1fJ5n75QGuSRvoYQduZ1BQBpPXHhMQzE6m0GMDoLQnc+ht0jttPxWW
         /6brZdI5+vzvr3nPB6i9K8GgfUFGg5qmJ0c96zoAmN9Ftu3KkCA4N8a2+fFolr2kIm7C
         vvkbhmf2+RAeits7hU2N3mlzpG8h0TKXSPYuzbxlWu+auMazi97pk2frJbmiM03aC23y
         tqpdY1vmV8vKPr47dBGOI3Jgzbf2VE8T1CsgV03fycG0rE1DTuylyajukjtFURfEzIF8
         mSrw==
X-Forwarded-Encrypted: i=1; AJvYcCW1cngKER/PXvHKQK7h/a8+ymeWFqomIzOf9g9JXe6B3hGiOS+mT1BRH18xT3+XZj868FLDkZcFcdUZxg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc7y65gg/SYbjvW82w7G9IvsSlMoyzz8IhwKunXHhKoyx4WFRh
	oECKXmkHsu+YwQNJ+/zyXc8u38uQn4/RMeBDpMsD1mV8vUst6IqW
X-Google-Smtp-Source: AGHT+IFBlx2VElOixlZusR/Vn6fS6PXbSuh9gX6z0Dkf7b72H47WFUGg6sJXSpzTddWCr+wvW2+BFA==
X-Received: by 2002:a05:6830:4cd:b0:71a:21c9:cd5c with SMTP id 46e09a7af769-71a21c9ce57mr6154495a34.22.1731304862305;
        Sun, 10 Nov 2024 22:01:02 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71a107ebea1sm2125973a34.14.2024.11.10.22.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 22:01:01 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: kw@linux.com,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	lee@kernel.org,
	lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pbrobinson@gmail.com,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH 5/5] riscv: sophgo: dts: enable pcie for PioneerBox
Date: Mon, 11 Nov 2024 14:00:53 +0800
Message-Id: <bbb573658f02c5a373eca1fe3f55ef40b09c7a57.1731303328.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731303328.git.unicorn_wang@outlook.com>
References: <cover.1731303328.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_220106_933932_71EE6428 
X-CRM114-Status: UNSURE (   7.68  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Enable pcie controllers for PioneerBox, which uses SG2042 SoC.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index a3f9d6f22566..746b9c3d254c 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -45,6 +45,18 @@ mcu: syscon@17 {
 	};
 };
 
+&pcie_rc0 {
+	status = "okay";
+};
+
+&pcie_rc1 {
+	status = "okay";
+};
+
+&pcie_rc2 {
+	status = "okay";
+};
+
 &sd {
 	bus-width = <4>;
 	no-sdio;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
