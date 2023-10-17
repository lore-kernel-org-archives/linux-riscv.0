Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58398CDB474
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 10:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i4BF1B3dW2qQj4oqrMw9xT9c4Ej9OZhAWMFaUSX34GA=; b=xvYePUXfOP6pWC
	3rI5TtbfGItIDHfFBa9AGPVOZAEvQtdMmnhOuFVMBuHn8MqPlB5B1an0/CsOWZcCmr1XjPe90fJnz
	Ihua0ZO9AkEKWj/r4W3bbJM10PuU2dkBluD/XNq+rXa5eN7VWUvHcfEUBxWSG90NRUGpIeCIwjP/h
	AODSH9rLuXfmxxvFUoW97X7qSMUKlWnVcowHioOplkM0qemKvNbFK0KO7cSJwKhhV3vxQKIHMxn7c
	I/cdPoNsQBc7c4Qag5XEb2pzkpxXZvWD3kwQeGAzUppxXQmwbRRkxcB518scZ7wjX69ZEy8XPuvMW
	OkWsE+mh6NS3xloVdIrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qshcH-00C7Ub-2A;
	Tue, 17 Oct 2023 10:48:01 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qshcD-00C7Ql-3A
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 10:47:59 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c4fdf94666so57048051fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 03:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697539674; x=1698144474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wW4HxCYnatcP/vztbzCLoFkbFaiPGRf9h2XT9nzoMiE=;
        b=k8EUuBpZfulNrVN8/ElFeBUfQR1+SFa/+zrxs4L55OkoWQgz7QBx7/bsLHS64RhdDV
         hSgJyaXpMVfkf/BHBum2htHKkwbEEnJI1E/bI3vChh+pChHeefayQ/oo2qPbs1zz2qbN
         Arw90C7dwj60Tl/qp8SZjLbLYg4ygGQVtLbN760r9YreFLOlpoX/+F3yy28MNJbq13QX
         /2HZxUL5uW1TmAF2o39DLN0fpnMssM4r96Qf9z6we5pc83YGG1CVORYGRer0LCEg5qXq
         eF5LrKap/iNiDzli3wvyt1StjxzHxkvgNF0O7vcViECYA3JmcYgqmyy3NlL4rvfjdNG7
         jz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697539674; x=1698144474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wW4HxCYnatcP/vztbzCLoFkbFaiPGRf9h2XT9nzoMiE=;
        b=R3BVxsQEvS0QFTBaHecjfFkcFSnqPN2RQ76ooo1N1o3Sq7a9ZwaQem68eOD3l9Gxh0
         +DAyluEu10BdfO8DUjzB0E3SLFZ672/1L41zFU5HSjH7NBkpV6zFrviCQvQcixkHWTcf
         cZJrVeZxwWms8zFzyXYsXsWnIRpkD1MzJPMUPC48dW9yFOQflf9Y8xiHfwzvjcuOyUJ/
         8z8x6VPiz/rqOZXfZ0OE4xO4wQTcn8MxBUFtNRUIB7bzsFDNwvKk4PUGZ/RaOb6MX5OU
         zWVtk0twqMwz08QZQt9gZu7mUocdT+xVgEzfG+rPyMSiuKGIGowiPRCLem3nSWvh6uS8
         BlkA==
X-Gm-Message-State: AOJu0Ywy66OPNHQoceiBbg8HH1Wow8ga9ELuKY2Chvo7NMOkgr9VcJP+
	DkLBoxC52eZHjyZXlsMJoOI=
X-Google-Smtp-Source: AGHT+IEJPTcRkmP/L+efxr/73vVSzCydhcAMii3FSFXDwAm/r+Qq/fG4Jwxl694rQJqlTaV0diobhw==
X-Received: by 2002:a2e:a98a:0:b0:2c5:72e:6ff9 with SMTP id x10-20020a2ea98a000000b002c5072e6ff9mr1913088ljq.6.1697539673656;
        Tue, 17 Oct 2023 03:47:53 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:e26d:77db:3f90:862b])
        by smtp.gmail.com with ESMTPSA id a6-20020a05600c348600b0040652e8ca13sm9582037wmq.43.2023.10.17.03.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 03:47:52 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/3] riscv: dts: renesas: r9a07g043f: Update gpio-ranges property
Date: Tue, 17 Oct 2023 11:46:38 +0100
Message-Id: <20231017104638.201260-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017104638.201260-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20231017104638.201260-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_034758_023879_A7FB0AA5 
X-CRM114-Status: UNSURE (   9.25  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On RZ/Five we have additional pins compared to the RZ/G2UL SoC so update
the gpio-ranges property in RZ/Five SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
index b0796015e36b..e68a91c9fe77 100644
--- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
+++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
@@ -42,6 +42,10 @@ cpu0_intc: interrupt-controller {
 	};
 };
 
+&pinctrl {
+	gpio-ranges = <&pinctrl 0 0 232>;
+};
+
 &soc {
 	dma-noncoherent;
 	interrupt-parent = <&plic>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
