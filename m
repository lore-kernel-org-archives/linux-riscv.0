Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F10EE6427
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 07:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vfb2hzMCnmHEEAWo8wBVUKUupihd6laSx0eb3xlv8t0=; b=fqavcym6YJZUfO
	0CojpHoixJ5wwqq/dCg+pjeJ5M/Ahfyj6vSLF5c/x9/5RGFqLfqd3ly9Hh2FRHZqTL9pJwvoRPZVK
	LyuaDshXiiLbHDNmYc6TxyxYyY6vn5mCPbRAtg7gdOOnuAUsbm/nyI2zsyP8ZGN/4pOUtVHbWnRoY
	a/d22giqDZzzRRQC4tbpKkEVhkoxRU+lRx0UjbMCONpGrhjZsvpwi5Gy2HLhVAa8qd4yT/TnYR2dC
	owrtqjbIVX8ELZn8M23eCq9XuetbUprZVlKU+oyer07gazzA5XYuJhRCtzUFafijbnuNSRV7nV9XW
	g2nyulUrgiF7DjNmI+xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3EN-00A2JK-1c;
	Fri, 15 Sep 2023 07:27:11 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3EL-00A2Hb-24
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 07:27:10 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c434c33ec0so2413995ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 00:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694762824; x=1695367624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JjZ5p6sECHH5hqVMsjk72FLLIZN3XyOMXABaFLbFiJ8=;
        b=mG3a7Z7XfotxQkLa5oy2/GrE1v6itfbs7CgGZ5/n9hU8sOg+Fzes7oUj+dlGunJ36e
         3lBdM5GRQIF/zzBLmTw/ix7tTYCEvyWXciQ4g/ypNMoD8p08BvFIW/0kWEAbCPjqvSnQ
         b/MK+sil+By07sRepB4f/Geu2SIyJNB06fLUiPOimbjXCoVDgblf9xuWcmslvKhiN9vv
         DTzr0zdcYtnDuvYNXMwsS4hcJTR8E6AgrN0t/dCyYqXQ4ibtRx37Rm911nszH19gu30I
         cG7IMEYFuG8YMUrA9SVETvSYTVRLCgkwYiMLgrC3QN54MD1Z+wNhcuNoJ4Hj31+p2Dll
         ROgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694762824; x=1695367624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JjZ5p6sECHH5hqVMsjk72FLLIZN3XyOMXABaFLbFiJ8=;
        b=j9UPxaU5RZ054Qv3CswmSCdFP8LzTbHl1906guWI4aMnz6ieCIqrrTsX+hkbJejzaC
         262zqMLn3PMNXqcI14x5ovEKulm9BFjG8kC3dnxfZmvuDSZZY9pK+mpNmRzxZQ2vKXIE
         H4dEoMgHwktU7Q1y+B7nLfPTxAgRqYlav6ukD3IdH4M241vEqTmglokGqRMQO49Ml7SW
         aANl+9grIMsEvgPL3ujIRifq9LmZa+fNtVPyWkacOlJocmloWpHqtCg3T5ALXkkyY50H
         gugsAs11ULH0WrFIXuuGEFeUoZ6aRQBiYeRKDqOY0v8pMbpBKNQakWeCQ2A9cLSICH/C
         i6UQ==
X-Gm-Message-State: AOJu0YxWy6yAoKZ76f1gpPCk+rf+tL4UpRk+XrPiX4mSl4RD72YFAsqP
	OJT5UYLYGqAzKGxsg0/5mzAAVxL4uQgIRg==
X-Google-Smtp-Source: AGHT+IECzMqNl3d2ZZIy7/6r98qWTBpjr7wsj1gzpMfTrN07Rf3lIiwbg+FaRYaoR2DjxlC43Ef4zQ==
X-Received: by 2002:a17:903:22cd:b0:1c3:7628:fcb3 with SMTP id y13-20020a17090322cd00b001c37628fcb3mr873796plg.47.1694762824624;
        Fri, 15 Sep 2023 00:27:04 -0700 (PDT)
Received: from localhost.localdomain ([222.95.63.58])
        by smtp.gmail.com with ESMTPSA id k6-20020a170902694600b001b801044466sm2761928plt.114.2023.09.15.00.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 00:27:04 -0700 (PDT)
From: Wang Chen <unicornxw@gmail.com>
X-Google-Original-From: Wang Chen <wangchen20@iscas.ac.cn>
To: linux-riscv@lists.infradead.org,
	conor@kernel.org,
	aou@eecs.berkeley.edu,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jszhang@kernel.org,
	guoren@kernel.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	Wang Chen <wangchen20@iscas.ac.cn>
Subject: [PATCH 12/12] riscv: defconfig: enable SOPHGO SoC
Date: Fri, 15 Sep 2023 15:26:53 +0800
Message-Id: <20230915072653.118448-1-wangchen20@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_002709_675979_74C966F4 
X-CRM114-Status: UNSURE (   8.16  )
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

Signed-off-by: Wang Chen <wangchen20@iscas.ac.cn>
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
