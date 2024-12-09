Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F32E77173
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2024 07:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uhYvPqVWvnmnOJY1IqtH5n3sIOg0Qi1YwPGtzKe1Dx0=; b=o9sTAXOchD0pj0
	r8/RBRcoxI7xsx07JxMMmAJ1hrPqcweBkK/j0DGN+IZkJ35cKabmMO4xZw7nqrvad8F61ebeKfazz
	1cIa3MZoOZyYiFV7TXiuUkH5tIveBP8GRgzDoXFQGqua7GOPjZAUgjOaoDWzGlrMyyxgFtdQ6zQNO
	Chd+lvuuZendiM50sJZS4vfyzklCsnY5Da67u3/cK5uLrWRZhT5M3yXaiIFbOVK6YPeXG7ZwdZiNL
	+Kvn74t8o+uIYJCAEaq90B6bc/Yd5VYdO8xHO+drA/KxByK9xqCvl4Q05yAssLxrKEX3/9/2ZVyIc
	NVqKE9fgi5XvwpTXuiVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKY4W-00000006hdZ-1p25;
	Mon, 09 Dec 2024 07:20:48 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKY47-00000006hNh-45ms
	for linux-riscv@lists.infradead.org;
	Mon, 09 Dec 2024 07:20:25 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-71deb8054e1so419433a34.3
        for <linux-riscv@lists.infradead.org>; Sun, 08 Dec 2024 23:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733728823; x=1734333623; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w6YQ0GzT2dh6d3+cDp1ybb0EefAGpyFstieUs8RwCKE=;
        b=GS7zL7U8tZggnyMh7pl9o/lZInk6v0ubsAcI0z3NaGFgpkr0j9xqcAg8SgxCigrx6O
         1DKqXLe+LYJ5QfRAlO+K7d7omoJklfG1eemL2ctRaPzpCpqy+chqUEB8PMLGMZnJdmxI
         NKpnH12AUjAWjLf3Sk4QQ3EqRrN+M33bD4QX0DshQ/LTmhs83QP7uunpJM3rqlvKi32G
         rg7M2e5dYEFxRg3FJG/Zb247LZeiodiFr0SEKaNlseaFW3rlWD593zwdRCL81YtTXKey
         WruXBqcDPaffZWzRF7mZsKBfhKxS2wa8Pz3BD8ZNau89QYfbiI5/i0BxkRDDzlYZtXA8
         /6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733728823; x=1734333623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6YQ0GzT2dh6d3+cDp1ybb0EefAGpyFstieUs8RwCKE=;
        b=uCQZVc6VVgVLrH2QMOAJni4+C9CyOHckWKpRjybWnCP+U5xFZYq6XxxjPdoTfd43XJ
         MQXhREywdFcNqpTlHcf4gCdMJmyAWGK7ZUWc+VmKToCFT1mHowSjqpS7Deopn8/0EAFi
         us6tMzXwI1K6nWEFhc7aKWpuNDBl8ZM0QOdRLXhPlI8B2qMXtadrIj1jx7YvkR7j+XiE
         pfnxVMgzefsFSVU3JDgQkYEc2cZ9CLuyxkogp9K8geA2D/K4sIoRRh/0QiMIE94er/b+
         OvQ3G0bHPx8jG/Bnnrl7b0r2Teu29SlykWXM0SecxOnkrOpxlvx7xdLdyw2G6f5SvlOJ
         Cq2w==
X-Forwarded-Encrypted: i=1; AJvYcCUIT77hdUuLZtynS85CnC1ohyIzLbA8dA28Ui69RmoESq85PXgL6H/7TSLdLEvkv9qasDl+Oc/Cp8FgBg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy7VZYkZ7UZG28CH9dNjW77/apDPU9jINzXcG9iKytWiAO3gVB
	aHSkYheIZ/Py1tEALkMGgehjsGb+d/I5kVxkvYXG+3CrstSwaegZ
X-Gm-Gg: ASbGncuvGu8KQm3ARYbMPt0pYsyMHzJv8WEGRf/7cmTOGK0kNAgV6Jh76K4lqy4QSU/
	ji+UQWbFWbRUQR4ThU6meU484nZYai2eqk8GA4l53Ohx/zKXAqRsnf8gyzePr5QhPHaIoTMrm1T
	V5e/K/U9bOO8k1/At3YBvUrJDrO40K3RrUXEtfU7vE2D3LlxRco2pm37nsw1RP76NEBU9mvcjik
	44B7c09ZYyABhM47myvb1DgrW2RRhEYDnly91SNEuP+10V65u5HLxtZVPjC
X-Google-Smtp-Source: AGHT+IHqaEN/srMd0hN83wcfS1YvS4PEsil1moDw9xoC0lsg+kGLgxp++DQy1DAhEkfiqMtdRGr+qQ==
X-Received: by 2002:a05:6830:610d:b0:71d:5084:3223 with SMTP id 46e09a7af769-71dcf4e5f65mr7035025a34.15.1733728822893;
        Sun, 08 Dec 2024 23:20:22 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71dc747d31dsm1973452a34.53.2024.12.08.23.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 23:20:21 -0800 (PST)
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
	fengchun.li@sophgo.com,
	helgaas@kernel.org
Subject: [PATCH v2 3/5] dt-bindings: mfd: syscon: Add sg2042 pcie ctrl compatible
Date: Mon,  9 Dec 2024 15:20:14 +0800
Message-Id: <29ceb01afb1838755b4b64ae891f51a5b1bb7716.1733726572.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733726572.git.unicorn_wang@outlook.com>
References: <cover.1733726572.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_232024_019270_5B0C83C7 
X-CRM114-Status: UNSURE (   7.53  )
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

Document SOPHGO SG2042 compatible for PCIe control registers.
These registers are shared by pcie controller nodes.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index b414de4fa779..afd89aa0ae8b 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -107,6 +107,7 @@ select:
           - rockchip,rk3576-qos
           - rockchip,rk3588-qos
           - rockchip,rv1126-qos
+          - sophgo,sg2042-pcie-ctrl
           - st,spear1340-misc
           - stericsson,nomadik-pmu
           - starfive,jh7100-sysmain
@@ -205,6 +206,7 @@ properties:
           - rockchip,rk3576-qos
           - rockchip,rk3588-qos
           - rockchip,rv1126-qos
+          - sophgo,sg2042-pcie-ctrl
           - st,spear1340-misc
           - stericsson,nomadik-pmu
           - starfive,jh7100-sysmain
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
