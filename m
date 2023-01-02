Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C118C4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jan 2023 08:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bVO/QaXMhuaOb0I2Y+ieLL8sURSzlBPmvK+yGEIz+34=; b=diCRsB+/Ir+Txw
	8ktC0Fb+3wy/KZSagVez3tRbfMSSURzw13aBjMZRr9v1jy8Iumu5KuUxPp1If3iDhkx1XS/3wdfVX
	+XVSAaMMVDljlquEqjqHvv3cYpGUu+JiRlj+dazJuJrY/Zgv4+UOg26SIvQ8id3U1T/YMxKeUaRBh
	KtZKrBkZK8COkTcwl8MWpNfHwaNloRca/aYmD3i3bEqSWMeTvjvxhwbj/qj2u58KRJuwSfdn2Dmmx
	syCSCZNxHYuJZmdiK8z5G7aXChhdfpOwXlpT5sER/TBk/120pnXXRChBQJxva9zNAHKvg1hGwuIXO
	A39E0hTdkS+Fz4JwklHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCG3z-009NeW-On; Mon, 02 Jan 2023 08:20:55 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCG3v-009NcO-KH
	for linux-riscv@lists.infradead.org; Mon, 02 Jan 2023 08:20:53 +0000
Received: by mail-pj1-x102c.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so32301963pjj.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jan 2023 00:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=is3qNJJQlv75VO8zVD9j6Fa5IiqfTR1o+COwoVHzUoQ=;
        b=o/zfZCVJ3Ojd061xw+HJ9QBQxsYFmWaXST1juNnvNLMS5HCJpsAIXBLab1XYurg5kd
         q6B9JhWFpu+TPmt+Oc+AZbBCwHjoMX+0B3xqrhSUD/Lx5RB6+xQBDvLjJRwnb5+1on5l
         f0ZCH6wn2E/1BpDCOOEeSYaX68efUzh/eBaGf+yuBO8tpzpwffWYKiLsjqfHnu8geYfE
         fJea3SOt1KbWgaozcMC40biMwVw8cdtEYHPJmE+qi4FLwBuJUQAbYjjTSkTZCh7qdvTt
         Nuf9VNhpSpx3PnydlSfmDTb0UsWB9y6ezgaA6I2f5AjL8EY/suXPHvUKKIB4TnvVvFGT
         BPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=is3qNJJQlv75VO8zVD9j6Fa5IiqfTR1o+COwoVHzUoQ=;
        b=U/fFqJPEekFmMxQtVqUSpeqQpErR5/9r3r9n6dcz/3rw/NI2aKC80ebQa+jFtJzhXJ
         YIoP1oAESKNMVc7FT+DEzVbVCx/x+y8dTANjKZZ/+b2SlfkkkJmoba/z5634syp/pn0e
         aCvyy1gHBwgWvMzbBiRS9QLWwrha/L5KouRbM7kd8fuYI0+jaAwyQFhr+w2VRl+ZLHUB
         Ho7wN0eu73eV1QBjBBKgwyidrNf1vgL2Ff6Tzhm2uzeBShH83Hy33NKKwfj3vRwBvMIj
         gC2CmhTMf+75najYMFry7ofDmF+tljDUprhGY6SDw+iAOHR5bq++upuW0wjQzrstSW5Y
         043w==
X-Gm-Message-State: AFqh2kqG7zpVZhecOD+uGp32bXCI0ARq6RAAcWIPEBAS75J67VX6SlvV
	R+nnK1Y7VUFRJKzNZIgdFqo=
X-Google-Smtp-Source: AMrXdXuTioJjSG5nKrVVsW0p7wwLx3TEBU+DqZCZuboHY3rE+2uQPc2KMU1lxShJ8Bv2Rb5qin36SA==
X-Received: by 2002:a17:90a:e516:b0:225:a520:e0a2 with SMTP id t22-20020a17090ae51600b00225a520e0a2mr41049329pjy.21.1672647649778;
        Mon, 02 Jan 2023 00:20:49 -0800 (PST)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id mq18-20020a17090b381200b001df264610c4sm23491898pjb.0.2023.01.02.00.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 00:20:49 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Marc Zyngier <maz@kernel.org>,
	Yash Shah <yash.shah@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	"Wesley W. Terpstra" <wesley@sifive.com>,
	linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH] gpio: sifive: Fix refcount leak in sifive_gpio_probe
Date: Mon,  2 Jan 2023 12:20:39 +0400
Message-Id: <20230102082039.3941790-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_002051_701725_8FD08155 
X-CRM114-Status: GOOD (  11.12  )
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

of_irq_find_parent() returns a node pointer with refcount incremented,
We should use of_node_put() on it when not needed anymore.
Add missing of_node_put() to avoid refcount leak.

Fixes: 96868dce644d ("gpio/sifive: Add GPIO driver for SiFive SoCs")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpio/gpio-sifive.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index 238f3210970c..bc5660f61c57 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -215,6 +215,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 	parent = irq_find_host(irq_parent);
+	of_node_put(irq_parent);
 	if (!parent) {
 		dev_err(dev, "no IRQ parent domain\n");
 		return -ENODEV;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
