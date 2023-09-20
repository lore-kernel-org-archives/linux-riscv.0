Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E36CCE79AD
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 06:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jr3Q0nUp3Cr0nUGZYe4a9SRwA5mbKU2L7f45XXX4DD8=; b=lL9Q2cq/7qzbPq
	tl0eHf9FWspZNoucht8tlRN3p3kNRsfUSBTL3tvMIQcNxQ4vcLQW6+de7nyzn+/WLIdlxacKc2aSc
	Ha9YSAAOXOf+356iDs9O79CMX/+P/+upgWxVuj1NzfXFYzD0VM12HHoZsyBHbJ7Faogc1pfvFy/BJ
	gsO0Lzgb4nIeBWVbPzxGIJmCkrm9YKu5iuKk9s1pjxG77S+eHkAf6VvIS+Rm9pw3tAojJ2bpVYUTT
	P1Mi4W2P3PZ6UYQBnv5CwiOLcuDDNnmc52W/cvW75xaF/3TIY7MqJH9yItuaKj7F6KgvRdakOzXCP
	IE0Zv2A/xQjECERslyig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiqtm-0023E7-28;
	Wed, 20 Sep 2023 06:41:22 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiqtk-0023CY-1R
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 06:41:21 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-571194584e2so3961873eaf.3
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 23:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695192079; x=1695796879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPzRtbGVAyCieAczzidwpR61L2JC0XRU2iih1ur/Z2g=;
        b=aRs1GVa26EbUNl5AZkGmy4EgCegUyfcaiU5ikO/O0Jne3sYydaJQ/wsVmLwW/YsFlN
         /Wr2m/a8Fk5Mq897RjWzyBP55rUyfaaOS1FUh711tMXzDVzAIA83kpECw6WXw3BnQdHU
         fmXyNtEzUNuTjJeWEkqsd/BIe/F4JplEf/s9oV5zQT6P2moLyCGhBts8HU9IfIhmK2jq
         cGLPgtE2LhPMw1abfrWRtn+smneDQr8woOzjaZT8/30AHgqR+qytIZVWULbUq+tPSQ9s
         b9s6vOItZxV+5UohzOULPIWhyCJACr+cLax96EwphiAcvajkJm2hZGjlg/yNLrb2b9kl
         rUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695192079; x=1695796879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CPzRtbGVAyCieAczzidwpR61L2JC0XRU2iih1ur/Z2g=;
        b=KPYTdb6AoLMoRRWZTlBSP5bclP31RvQYxMiB8BYJB4dE/zueBNwxBnDDWKMCGRQzq/
         LPIA3IBivs2MVCvoOgxKoQ81ZH1y+8oIS6kopyTWhLhbDGLPQKvasUDjRd9/UPYZVurg
         UPNAlcjEK2rbYHATWT4Ja2sYUbuPNJ9nYN4nV9oAk9YggW6KgNo6XA3tehKHqAh7JA/U
         RTafB4owUQq+y0OkhW22OGMu3G+Qm9m1qbbeh6Jl2FX4jVid4HGsmyfL5jql34WRyJ0G
         45dqyNhXkLgzu321tDGXVrxJlUCykiQYUhaChwtSPzGJFH17254atfBtDuAFrp6wzGXA
         D7CQ==
X-Gm-Message-State: AOJu0Yzbskri0tla92G8TN1dNkrimk0QfNKDGUBqp88PrJg753IfPSa6
	1Va5FO4VE3gIhUuXosoVFbo=
X-Google-Smtp-Source: AGHT+IHPq6IFe9QBQQR+FnLEJiN55AB/ok6hOPAoJV6EieiQGia1ukQ+myI+nr9AP44rQ2wojZmBsA==
X-Received: by 2002:a05:6870:b313:b0:1bb:4606:5be with SMTP id a19-20020a056870b31300b001bb460605bemr1792059oao.9.1695192079100;
        Tue, 19 Sep 2023 23:41:19 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id ch17-20020a056871c41100b001d4c5e4c2c5sm6860300oac.25.2023.09.19.23.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 23:41:18 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
X-Google-Original-From: Chen Wang <wangchen20@iscas.ac.cn>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	emil.renner.berthing@canonical.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com
Cc: Chen Wang <wangchen20@iscas.ac.cn>
Subject: [PATCH v2 11/11] riscv: defconfig: enable SOPHGO SoC
Date: Wed, 20 Sep 2023 14:41:12 +0800
Message-Id: <835006e5c76ba1c53eed1b7806a08ddea3390bc5.1695189879.git.wangchen20@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695189879.git.wangchen20@iscas.ac.cn>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_234120_479226_6D06DA89 
X-CRM114-Status: UNSURE (   9.49  )
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

Enable SOPHGO SoC config in defconfig to allow the default
upstream kernel to boot on Milk-V Pioneer board.

Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index ab86ec3b9eab..bf737cfa1d2c 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -32,6 +32,7 @@ CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_STARFIVE=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_SOC_VIRT=y
+CONFIG_ARCH_SOPHGO=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
 CONFIG_PM=y
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
