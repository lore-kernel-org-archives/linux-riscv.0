Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D26AC02199
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Feb 2025 04:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9VXajq6t60neUU9rMTpi4e1cYBZ5EDOWx8giU8SqC4w=; b=aTuSvhYQ/m/BOH
	o5Is2NEty2V4j70JJnVgREl/bWQqWi5uiRSsSyfK87enZtLrVWKjOHODpQy9cMkEccxDREhFvpPLE
	+CsZScefZn+yaLfwQyexeWrZTPUQiOLZQnDqKfrLhB51B26OPyt8QV2dWlYllrpsxFDzZeI5AapNt
	ajpDivZRud8EGmUla/JXrsYZIfXCql5H5i6ynXwdai4VEvxKO3GG5IsSxmHVvodm4usFaCwsqjqfi
	9Cs9IDoeBHoGUY+oqg2/wMXL+mNLl5CEcUQAdPXIWWPP3FgtV6TEJDx2j2BNdkGbjFB3Ks7kQU2nJ
	r6a0FBzm6szqrD1NCouw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgyuV-0000000E4AP-41sP;
	Sun, 09 Feb 2025 04:27:12 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgylr-0000000E2Xw-1BJg
	for linux-riscv@lists.infradead.org;
	Sun, 09 Feb 2025 04:18:16 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2fa5af6d743so698482a91.3
        for <linux-riscv@lists.infradead.org>; Sat, 08 Feb 2025 20:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074695; x=1739679495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBZXTbuS/jzxIISJXLRWUHAJ1oANsva3E4CzlwWomJY=;
        b=H27wk9QWPks3qOJRzw9zAVDZV0byI+ZYSlJ9j9W1L9N7hblqCI3x/J80PFe6D1lKnb
         L3ezHGeugew3uGKjs95OmkFOA5iZFPj2TwhgxFGooitN6vB/cqWpjBHuigtzD+nGfOqa
         wLJAyDpXKdEBhUYqNOadgPNPsPhhjtgSos1BfIoBD+M+70jz/4+4Qds0fDHYktsIO6ze
         H4KOZZDxECif6FPSvOMWsMTNFCDrw8pgV19xWyRZmZWxYuJHd+wqq8QLhoe/x7sea1zK
         Kn9z4XCFG5YanELyGy+D/dN/vSlXTJCT/ni9U0aGk+/B/A3G6ex9Dz81mFhFJpNpuRnG
         iX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074695; x=1739679495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBZXTbuS/jzxIISJXLRWUHAJ1oANsva3E4CzlwWomJY=;
        b=MgeI+vNLwPobRTFuvsWwHpzXCJ/eDmLcuX9wxEqHAfYflyB6l40bJyuOVeDBZzYgSo
         kM4tHPW9dLSYHI64Ze2wFMFjVYwQIeY+aXL/Zw/vnvKxm/slU87aP3u8cEoQV5xKx/6u
         vU9bZxpJMRSVq7vCUUc21P4WHggjvcuamXF6kmXg1LAB7PfxdUeJnQpPXghcTvE5SACW
         1y0G0AK/i6E1O5xUlbve19BbkyPO5nQgl4bqbTZomcxrciuW5dWCMNJ0HIeN6f+33Ugg
         1zu/yFqZ+P8tGbEdIovn08z0L1wJVBRruQvgO+1v4GLS/SSGjGytjAdLyjiNB/fzvW58
         DZSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR1S2A+UeRedYQNfJUuvxs6oQzFYQMuxxeZhriTv+H38P/3vwMLC+KzCovjIpLkFUE7hgG7eP2IPT7qQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywim96YacWrCvUj3TWGHuCaCTRjRnf371WEexfxeHbbLATd7WJ+
	sLgXk6hnrTwfJ1kVpx4LGHrWWQNEieeSdQRLdcRqxzVHqkEzQn8Hb3VUMjVPQ3A=
X-Gm-Gg: ASbGncsHuX4+6gJ5SK7dV9U2/4Malz56AvpZBPEm7llxHd2dRgsIZHdD9gLBJ5cIqWM
	Brk9WCFNADVyfQXn6iL6UwnRu9wXRkA737Q7nr4jlHADnxvPR2TQZe+A6BtC5RZTv8rZz6ye7ld
	AvLAYwT/utagcOjRrfsWM9pNcnjVkI/VPMp+ZT185NWYZIBJLIa4hkQhdsqpk5iaD6vxZOc1z2C
	eRm9iG71F/sOuX9dUHdtYoe273r2Vl4w6je+MQFq8g/8wjfSV/CFSWmFD08nqeNjTw20C02uH1y
	UQcOSlwqtjkUNc4mNI2t7CjwmvOSIEkK+ISF5nytG7+evhNwhvOFF+E=
X-Google-Smtp-Source: AGHT+IHL0ZAy+b2/HWpMWPKyLFtjwNwqGOrHhxJ1k6glfU7lfaN1/yKHZr4v/qmnwtb+wj+/nQhb2w==
X-Received: by 2002:a05:6a00:2289:b0:725:460e:6bc0 with SMTP id d2e1a72fcca58-7305d2ac0admr15896176b3a.0.1739074694598;
        Sat, 08 Feb 2025 20:18:14 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:18:14 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Subject: [PATCH v5 07/11] RISC-V: Select GENERIC_PENDING_IRQ
Date: Sun,  9 Feb 2025 09:46:51 +0530
Message-ID: <20250209041655.331470-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250209041655.331470-1-apatel@ventanamicro.com>
References: <20250209041655.331470-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_201815_326220_50F02706 
X-CRM114-Status: UNSURE (   7.66  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Andrew Lunn <andrew@lunn.ch>, Atish Patra <atishp@atishpatra.org>, imx@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, hpa@zytor.com, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Enable GENERIC_PENDING_IRQ for RISC-V so that RISC-V irqchips can
support delayed irq mirgration in the interrupt context.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..a32f39748775 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -111,6 +111,7 @@ config RISCV
 	select GENERIC_IRQ_SHOW
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
+	select GENERIC_PENDING_IRQ if SMP
 	select GENERIC_PCI_IOMAP
 	select GENERIC_PTDUMP if MMU
 	select GENERIC_SCHED_CLOCK
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
