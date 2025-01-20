Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF10C02187
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 02:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ss3rXt7uoZwhMFLk106B+ZGF7XiX7tVJJkoefmR0c58=; b=lW/tMNI/tJfZNb
	3f/HE7Z/mKC0kApSLOFOc6OxvKG9q2JZ4buxMmtkpdoIxUF9J7NlPip8Cmso9wAi/Cj9iDaAQ2PHL
	Qt/+ogJBiJLUoNgSUwuE6HgPsUnMtuD3Eh8QndbX1tws9TngioYRmqAUE7EJMcdi5BHbHFIwDuxsA
	3zThIW7Cny8VM0oq8aubMRVbjUvPB6EZU3OLGcQRHq2pi/ltk/d2h92Dvi3mHPCQzPpO9LMwmTKr1
	sHczoY2DWS8VJWnxYZxow4Wv/7Oo285v7JrfwdcZDctr97p8Tq1w7Ycj51feQRzdKX/irwU7xbDdo
	O5mKN/OmxamENI7bHfKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZhSp-00000004Zp4-1MH1;
	Mon, 20 Jan 2025 02:24:31 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZhSn-00000004ZoI-053Q
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 02:24:30 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2f43da61ba9so5179781a91.2
        for <linux-riscv@lists.infradead.org>; Sun, 19 Jan 2025 18:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737339868; x=1737944668; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qSPD4uPn9ljhmXOS2W7sKx3A1wCgZT7TGKaYTZxf65o=;
        b=DizG/sjU1XCYdoYd0Owgxph51hkVJKb8KIaGvSvQ4d2Kt6t77GZzXKTQF9bgLaC7ol
         hNfP+g9zbZbeBsU5s22JqsuSgbgF6aR+VDBBN7XkMdcxscY9vrUVn0MJ71PIDEEAMlUL
         xNX2KeW77P2brq1WHnrQtHdy7pPc50sitY0myuZPz/qplqxciv9/5mKiNnCmvpEqwTZs
         hMnVhj1dEQj+FdeJKrX0r3mzFv94XG8jcgCqrzXJcLUyg6r6lzTLKiO/fBSNbVE5b9+/
         1aIn4N2P8Alnmsgq2zh9IH3W/+3TdH6KUDRVCF/EcTO5y8RUxoqpsrHPuUbKPx4vg2WK
         4iGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737339868; x=1737944668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qSPD4uPn9ljhmXOS2W7sKx3A1wCgZT7TGKaYTZxf65o=;
        b=xRXRRVF3+wTNSbjv3X3rOspPl1QC/YH1nbL8rhtRV0zcfaM9AWZqRbR4q3r9tb/1s2
         DAhmMimfeY5r/scqPd5bii31I02Mme+LTUwaiVmg3Rl6UCD09PhdqOawoBReHlPa/J9p
         TAo9cFXEBsUc/OhB2KONf+eN+6TluEgfSesO1o7IqtP/YGorzmIeQfsodk6Im/ya+2Ip
         C4TLLkwd0vSVL1n5tmFqZ1xYcSPeplzXADH8v1giH+CRXyOS2o2yjnmq/I7ZOJgk6C16
         /wuerhtKlws8oxQSUWH8v1JFoAnEMqIlAIHq3FQ/ahedpfLSkHFgLsZCqSosGgW4CUE+
         Jy3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2EQ0xWmniR0tfBUEK+kMS8/Nw0TPZYDe6A4gUenzIoGfJOGUeEJeiwkARjCdtic1upXdqUWxL+km26g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4+/n923bqz60BmsywFly+3lO0xtmyLZcA5sX+gcAJpeeF8pgV
	CSgHbXElWq1H2ryKBEBj3q6HM7nSpuzYEKebGY4h5Uq3pOJl1ic1
X-Gm-Gg: ASbGncvIx8oSjey1rH2wk5OiJnxEvB8ZvBR2W38w75ZLluxLGKFp/LuBiXaPlevvQzN
	xnZXxBtjpq3ZJZaWlu4B6zC5HT+hefDPMwAJAlx2YxV7HouFu+mkH0mqQzpW4x0sNufEoPEFjk/
	sQF7YFCb+DdTzphYh9rrsMX9xpmB4itfivjE7uGDkLahCxwefBWhA/I9pee0RjA0QEL9T0KzdAx
	3JEKv4YlD+zCQLp/RW5VgAYcFvAaA5iVmsA7pb8+NRJs7YVG85J7yDfnv/9ToCzbouhMkznTW4R
	ffY=
X-Google-Smtp-Source: AGHT+IF9loSx4hcMRg8pwG5Txby//fmGQBG8nh4tiV48z7SNly+Xn6fPM/jwGQ4MGy6UZh8hBEUizA==
X-Received: by 2002:a05:6a00:84f:b0:725:df1a:288 with SMTP id d2e1a72fcca58-72dafaf8ab3mr19585012b3a.24.1737339868062;
        Sun, 19 Jan 2025 18:24:28 -0800 (PST)
Received: from guoguo-thinkbook.lan ([112.64.60.79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab9c8da5sm5736027b3a.118.2025.01.19.18.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 18:24:27 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Chuanhong Guo <gch981213@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: add Siflower RISC-V SoC family Kconfig support
Date: Mon, 20 Jan 2025 10:23:58 +0800
Message-ID: <20250120022359.125952-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_182429_054974_48D4D602 
X-CRM114-Status: UNSURE (   7.73  )
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

Siflower RISC-V SoCs, including SF21A6826, SF21H8898 and some other
upcomping chips, are RISC-V chips with T-Head C908 cores for home
routers and gateways. Add a Kconfig entry named ARCH_SIFLOWER for
them.
Notably these chips uses ARM PL011 for UART. ARM_AMBA is selected
for its driver.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---

Changes since v1:
 * removed deprecated SOC_ symbol

 arch/riscv/Kconfig.socs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 1916cf7ba450..64a49e7ea03e 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -19,6 +19,12 @@ config ARCH_SIFIVE
 	help
 	  This enables support for SiFive SoC platform hardware.
 
+config ARCH_SIFLOWER
+	bool "Siflower RISC-V SoCs"
+	select ARM_AMBA if TTY
+	help
+	  This enables support for Siflower RISC-V SoC platform hardware.
+
 config ARCH_SOPHGO
 	bool "Sophgo SoCs"
 	help
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
