Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609CBCD5BC7
	for <linux-riscv@archiver.kernel.org>; Sun, 24 May 2026 13:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o3GLcf+1xAjR+6ShKl5iNv3tBjgurVc3Vp+Qq/0UUrE=; b=BmqMBPHQN7N8ek
	zLyXMNDs1M0xrh0SF3SHr1qgVpsv+GFsY8JbUj9g/JIsKeM7YV+HldE0hogi87RSKSp2qKFQZQNgw
	f8AFggvTAOwM8MxVNvqM7DQjSwivUZ/xMo+5zNSllfAIjOyl0qdT1SOdxNYt04HZ5CMaCHvuqvSXv
	9vi6b07c6j9iXFWJmqxLejLnKaNhcJc4c3YACLuq3CCtwZDIAZ9qP+bdF3T4YWzpsqhA6h5fj7VPK
	JwDNVSQ5I6JgjxfI9TLS1se9iQhcCJ+jk67r0JF6acqFW1lTGRozLuGoV/n6qeEcDxRLEEOsXnLWB
	YDXgKbU8h/aeLXY7YaSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR8eN-0000000Ezw1-1igL;
	Sun, 24 May 2026 13:13:51 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR8eK-0000000EzvW-0Z41
	for linux-riscv@lists.infradead.org;
	Sun, 24 May 2026 13:13:49 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-83ea84df1d0so2880185b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 24 May 2026 06:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779628426; x=1780233226; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KH7lD2kPuCDnCeLXXndiPaFJorhGJZaX8sM6bkfuBZU=;
        b=h5M5YXF7PpdeOsR1AX9LfKW9BLoXg6p3LuXHp9p7m17MT2O8TR1pC1FzNuBOSiF6Dh
         OGcaAaEk3e4I4RKgkuryCEyebUhanX2+XaBVDUUl+eGF3ey081nNP7Q8H7tQ3UeVO3zy
         zMafE1DleXNSpc8qgrKp16qc+tr+9ouKu6kkq35PbpCl3J7RLmzpNfafYjvakqrRqh1A
         yi2n9D9KK5XcVJjPk3g0L66uYFEwKRspfbKKZ7KcM3XLKW9bhVL0eLt3OI470UXHqOsM
         Lg4K8x0T7nyziDfT8TG1NyZEjKTqW4dv+msIXoagYgcsWB6T4O0Al1RBQucf7ydTN8fN
         G82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779628426; x=1780233226;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KH7lD2kPuCDnCeLXXndiPaFJorhGJZaX8sM6bkfuBZU=;
        b=RckEKmamNLX64Jnpweirh7QIDOLDL2xZN8wTnCwi6WgqoYg3KV/RtIGB/VMmplRpp3
         q0UETxVIC2QVVSpFegYVVLmpUczAN/7tTAm5dhJ5zIGldp+r5TiRttk6HOTb0dIP3f3/
         3WlM//WOWyZytJhSkZ/6xEG+2avZx9xOf1Bd+f2mpmAFjbuxpO7UXeAQRo8ZBgdfXyol
         Pclcwtfk7bbN7LnetH0Uhupfcx5rHx1xCnUP5iUeb+G9JEVIy3PiXGexta/LjOtdy58v
         sejzRb/01JvpIcc3sd7y00/Gc4jFr1xl0JPBvUtwZpx3UPLXHRWvNdUKhf79epcs3zAO
         uh6w==
X-Gm-Message-State: AOJu0YwuCZgyhX2UuNS2yIEvoovpFN3I6ng9gRVlxXz44igffRQuymft
	ilV8Ieh23EKCAXtVxln90rvUFPljpSyey3o3YSpm5eeODHEDJIhjR8HG
X-Gm-Gg: Acq92OFlG8n7jXyGuaA5mnEVhVSMeN0XuVM2elS2W5OWs9swbrwKrUGnTjD2pUMHATp
	/iVZQ69Ghoc8V66DxW2f/OmaFgHjARYypZ4QKKmn069PiAxxVV0ROqMou/T6YbWdmMGEBKfDSMI
	kaF2aUwJdo5/uvOSUoI9ixadWarjfs1dkW7gRgwdtcqjW8dHCrVrShq0d+2T7xgkv0ILqQX6Dzx
	cljlXZu/dU7Y+hkxTs1ztXIZcJnK5s9EfEXhWiROkzfsDpp5D9jmy3T0wM7Xi40p0KChfMCbPS4
	BAUxIj5YErXeD0wvpaegPcdzMC6Byh/Z17z0/mGmySLWWuQFSGZCZlFxwwK7tzKd2m7vh0adJhW
	fgPRMIQcpokxNOMRWdPZdVdemq0ULymqL6ilnTK85FSwVKFiTMMgdNysCPZq0Czp4G/UecQW1NJ
	eDEz3Sze4cKiyKuGQ6s5SWi2cI5qQ=
X-Received: by 2002:a05:6a00:a383:b0:82f:21ee:270e with SMTP id d2e1a72fcca58-8415f6d0bb4mr10541125b3a.42.1779628426474;
        Sun, 24 May 2026 06:13:46 -0700 (PDT)
Received: from guoguo-lecoo.lan ([104.28.159.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fb28d5sm7163128b3a.41.2026.05.24.06.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 06:13:46 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH v2 0/3] clk: add Siflower SF21 topcrm support
Date: Sun, 24 May 2026 21:13:05 +0800
Message-Id: <20260524-sf21-topcrm-v2-0-4527aae05c3d@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1XMTQrCMBCG4auUWTuSHxODK+8hXdSYtAOmKUkJS
 sndjQUXLt8ZvmeD7BK5DJdug+QKZYpzC3HowE7DPDqkR2sQTGimuMLsBcc1LjYF5EZpy9Rdc2m
 gLZbkPL127da3niivMb13vPDv9eec/5zCkeFJGi9c+0nvr2MY6Hm0MUBfa/0A4l5N6KYAAAA=
X-Change-ID: 20260515-sf21-topcrm-1856c05b6138
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Yao Zi <me@ziyao.cc>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_061348_187818_EA536F11 
X-CRM114-Status: GOOD (  11.21  )
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

Siflower SF21A6826 and SF21H8898 are RISC-V chips with quad-core
T-Head C908 for home routers and gateways.
This series adds the initial RISC-V Kconfig entry for Siflower SoCs and
support for the toplevel clock and reset module on Siflower SF21 socs.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
Changes in v2:
- drop "if TTY" condition in ARCH_SIFLOWER
- drop "xin25m" in dt bindings for the possibility of a different
  xtal frequency.
- use index instead of fw_name for xtal clock in the driver.
- drop unnecessary fixed-clock node in dt binding example.
- name the top node "soc" instead of "/" to fix binding check
  failure on missing "model" and "compatible".
- drop SF21_RESET_MAX, rename SF21_CLK_MAX to SF21_NUM_CLKS and
  define it in driver instead of binding header.
- split dt binding header into separated clock and reset headers.
- sort headers in the driver
- add a shared sf21_dual_dividers for the two dividers in series
  in CMNPLL and PCIEPLL.
- multiply before divide for PLL VCO calculations.
- change cpu and pic clock flags from ignore_unused to is_critical.
- use guard macro for spinlocks.
- split clock and reset locks and use raw_spinlock for clock lock.
- select RATIONAL in Kconfig for clk driver.
- use FIELD_MAX instead of BIT(x) - 1 for field max value.

- Link to v1: https://lore.kernel.org/r/20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com

---
Chuanhong Guo (3):
      riscv: add Siflower RISC-V SoC family Kconfig support
      dt-bindings: clock: add header/doc for Siflower sf21-topcrm
      clk: add support for siflower sf21-topcrm

 .../bindings/clock/siflower,sf21-topcrm.yaml       |   60 ++
 arch/riscv/Kconfig.socs                            |    7 +
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/siflower/Kconfig                       |   23 +
 drivers/clk/siflower/Makefile                      |    1 +
 drivers/clk/siflower/clk-sf21-topcrm.c             | 1017 ++++++++++++++++++++
 include/dt-bindings/clock/siflower,sf21-topcrm.h   |   42 +
 include/dt-bindings/reset/siflower,sf21-topcrm.h   |   25 +
 9 files changed, 1177 insertions(+)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260515-sf21-topcrm-1856c05b6138

Best regards,
-- 
Chuanhong Guo <gch981213@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
