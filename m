Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8D3CCFA0E
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 04:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6vsZkeq46s4j+xbTOZsWQMwJJ3/0cvMlwXVa6Gtcqc=; b=dK2ycvY6Hl728A
	7HA9GFkLapV/yiDwXyUBJxR0sjvv3StKMUO0AEcXTE0DpHB+TZzsaN9x6tFOjGRO0B7dV1PJyR1nL
	k2b6B+PccCoi6WOakhGbaLVqHr7n/H9w9ATamyGTQpAxHKDp1BnvN2qDMohCJmvWP9X8akwfyqAxo
	JvtLWjngTkUQhmPD352a/hYOZYwtzoyuzLuYSefSrX2tEtiEOwsuE86Fz+TYMXmMnMigYRYyu5HM/
	pJvnusW3pm1Eyisd4z5F3zvLvhSvx1tKOeNwkg37zYPgEcsyZg/y8EQXlf22x1/sZqxOcstfK1dMv
	vl/NZz40w+206V9stqgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t366e-00000009WLm-3EU3;
	Tue, 22 Oct 2024 04:02:52 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t366a-00000009WJR-0W8S
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 04:02:50 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-207115e3056so42485075ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 21:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729569767; x=1730174567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncgmlyGfcrqHCYKyqt0DRpGIqa2UXUmRq5v7oAb7ZpU=;
        b=b5ztyGRugWmNy2H46zNYFUwDyht4Z0hDTZX/BtFEEU+s0LKXfBx+gHd+jfcA4RyW1S
         Ndc4p4BxMJsQFFkUmE+TXQ+0CuRkoFjBX4ngEy+gDxoHkIB++SemYmIq4SlHevCatI5H
         MhaFUIR/YBEoaX9MvgDFAQoz51pUxGZzdvqPbZbdK0cQ5DnBBIBKgpyW7PT0XCFY0p+R
         IXTceLwRjF1e5CXh4jCrGHRrzPpGmPdoP7Ot2G9kRlVWTRY7H0KZaNpdI0TIo03KJuoJ
         pOPaw1/0iudfxlOpL0ABH0H1WXlLA8yLSGnbsvejWh+4sa0UT94YnpjdRnAblsurX5sa
         j4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729569767; x=1730174567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncgmlyGfcrqHCYKyqt0DRpGIqa2UXUmRq5v7oAb7ZpU=;
        b=P9VHt/VgkTK5ngDPMycPPYm8mvXl59MfWDzarZCN/KaPxze0Y/I6Q/Y2033F5W8LdO
         RkVIlduVtjNBAiGgTaYbxs8YXtX9u7Eq/PfAo0xyxPlMcv2Kq5CMydI/qMSF5kaRheUg
         CC2gLfLCu9VzegzeHvC+LsfoqJcFDBTDf6umj6GQimnMnkjQtCToEPN/3f4uo7gkj8SF
         7F+34sUBDrUYeltZ9eDP3ioPmC1w7bXZUAcXOKhDVdPMI+JMFpu0aeUV+RatqJUd2qKU
         pSqE7XhsF6eQl+9L77FHNLSzIw/EZDGC7MtYhnofAe/bdKzYYAS076cGk2PNTnFnCg0O
         MT+g==
X-Forwarded-Encrypted: i=1; AJvYcCUrYiSeCtpMzMmveNjU8NO4IQtdB1ligHesLSDolcbhAtk7lPalbF+bdMYgB2KDJPpCk6yRcZRGZMrYkg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2iCc2uXqtMoTY469byrQB3sxBXaPsmI4W8LtnNIIUI4wcK6hB
	tnHdUKotSw6VLAB2OtAkdIGF6NJiJ7pxbM5baKwB9L9xJMrv69nY
X-Google-Smtp-Source: AGHT+IHPcCzAx+iiW8df3gz3gZtXUxLdDe9DNtEZZmDqrW9DCC3AAd2AKq1gArxRGkZyiZRD4OwkTQ==
X-Received: by 2002:a05:6a21:6282:b0:1d5:2b7f:d2f8 with SMTP id adf61e73a8af0-1d92c4e05b3mr16504132637.13.1729569766739;
        Mon, 21 Oct 2024 21:02:46 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeabda3b2sm3924281a12.83.2024.10.21.21.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 21:02:46 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Hal Feng <hal.feng@starfivetech.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 3/3] riscv: defconfig: Enable T-HEAD C900 ACLINT SSWI drivers
Date: Tue, 22 Oct 2024 12:02:17 +0800
Message-ID: <20241022040218.450573-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241022040218.450573-1-inochiama@gmail.com>
References: <20241022040218.450573-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_210248_188690_F5824AEB 
X-CRM114-Status: UNSURE (   8.48  )
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

Add support for T-HEAD C900 ACLINT SSWI irqchip.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 2341393cfac1..5b1d6325df85 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -256,6 +256,7 @@ CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_PM_DEVFREQ=y
 CONFIG_IIO=y
+CONFIG_THEAD_C900_ACLINT_SSWI=y
 CONFIG_PHY_SUN4I_USB=m
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
 CONFIG_PHY_STARFIVE_JH7110_PCIE=m
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
