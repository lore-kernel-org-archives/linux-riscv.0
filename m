Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCD9C001DF
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 11:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r5Mo/flGWore1XgIsyuojr32HZl2uldk9cwuUrir78o=; b=drg0d8HWsyn1Mf
	d9zWXO2gnYngoA1/IObpneWTq9qRL1qYpjB7WBZkKCZHkgjpWcKQxg3QR7e5a64fjBrOhw9ARlYsz
	z8xbBQHZVdmjJ1dYS+v1z8HpIim837gz7hKw1U65lefhF86IubmTK2nK4nuYsfxBugK+SXxGS2BLh
	oQOLNYttwwpUR3ti/8ISqNwG7Hcwnwt/F/fV66iTQ/xW87mBYoIhgUSBj3h883jnC35NcCXoopW8F
	dP/0F+FhQHmJR/Vzozlvluysn47GQqejpX+pzLbjOzEyg8t3XiCcQs16+PekfO3C/5lQTONvjNO62
	Ej9uce3YqZPmJJxa1p3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH0wA-00Fkyb-0b;
	Wed, 05 Jul 2023 11:44:46 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH0w7-00Fkxg-1w
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 11:44:45 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2633fe9b6c0so439622a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 04:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1688557478; x=1691149478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=heYxA+Mau07N/7p/yYCay8/E0q4AKYFHNWyC4Hmd8zw=;
        b=LCVJo1iC398QqSGBbSt3HMGRz4/6jQ17VocWqxatr+VH8bVDf8rSkxpkL7m2b/QlEt
         eQ8pti3q69C8zwvPmUiTV8DW+nE3IcQyXVe0YeoX9x2vqVwDmjtDjPqfIl2pyeMnhzik
         KToCLoPAtvpLYvDLkAWK6X90EERvIcNKunS7pZGI7D/EmJVvpBJah4xbs9FlTLtz/RcN
         FetDHam8n3J+ilgWlmeRK9W0uLNSN3E0XIP6RA1NH/5q6I1ObXbnt+OYNr+4/rQLiHyP
         MAZNa7QoBTTaUCTpG6MXQK+S04oTo3bGbjE1ZRU8IWiMvwTTc4AMuD9mhBnrtC5ZkJ3B
         Unqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688557478; x=1691149478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=heYxA+Mau07N/7p/yYCay8/E0q4AKYFHNWyC4Hmd8zw=;
        b=BeD8sgb7fbDR5Dk0CCTvJFK/Bp+aP5vmC2K9rFecya3n1A0YjQhP6haU9XVsvUGy7K
         wRU9ebpBzaqvcPWHOBAysbP4wooe7niDqidsP4UKTNj7sTMg4rw6tdSHIUihmF9ZBw2R
         LZbqE12igikEqioM8cuH+edihm/zANmC1WMqQ410Wz1bTHrbHiRQR0psyjzHx5zpuA1A
         ptL9zHjiKiWOXSkceBRCuVzu4inGAKKqITG1mdJB/bLlginPvz7igEIpscd6XZkTGOj1
         5PnYEYlbvRlVfCRBUqu5NEFJL1nLAnRr3Op79U4GeRy7qIbhRtWAkTaTWWwIsA8EKsj+
         8u9g==
X-Gm-Message-State: ABy/qLbZ26VV9lw/3v22fuVQdOz4Fo5+ZYzr2vIDxJJbUSy5UhdZIMof
	B6DgKzFwzJFI6qX6AhAMgAxHrg==
X-Google-Smtp-Source: APBJJlF8iWM4sc1lZLKemHqMLhwUFgL4HgU3QAOE3GBa+o5h14Fsgs8Q290OJZcMEJ30fWvXqRIU8g==
X-Received: by 2002:a17:90b:3ec5:b0:263:70d1:ba84 with SMTP id rm5-20020a17090b3ec500b0026370d1ba84mr2812548pjb.18.1688557478638;
        Wed, 05 Jul 2023 04:44:38 -0700 (PDT)
Received: from PF2E59YH-BKX.inc.bytedance.com ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id 3-20020a17090a194300b00263f6687690sm1177900pjh.18.2023.07.05.04.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 04:44:38 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: conor@kernel.org,
	sunilvl@ventanamicro.com,
	ardb@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	rminnich@gmail.com,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	rafael@kernel.org,
	lenb@kernel.org,
	jdelvare@suse.com,
	yc.hung@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	allen-kh.cheng@mediatek.com,
	pierre-louis.bossart@linux.intel.com,
	tinghan.shen@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	geshijian@bytedance.com,
	weidong.wd@bytedance.com,
	cuiyunhui@bytedance.com
Subject: [PATCH v3 0/4] Obtain SMBIOS and ACPI entry from FFI
Date: Wed,  5 Jul 2023 19:42:47 +0800
Message-Id: <20230705114251.661-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.37.3.windows.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_044443_645343_01714068 
X-CRM114-Status: UNSURE (   8.29  )
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

Here's version 3 of patch series.

V1: The FFI (FDT FIRMWARE INTERFACE) scheme has reached a
consensus with the Maintainers.
Please refer to:
https://patches.linaro.org/project/linux-acpi/patch/20230426034001.16-1-cuiyunhui@bytedance.com/

Changes v1->v2:
Adjusted the code structure, put the ACPI part under the RISC-V architecture,
and put the general part of obtaining SMBIOS entry through FFI
under driver/firmware/.
Please refer to:
https://lore.kernel.org/lkml/20230703-71f67eb66a037f5c0fb825c6@orel/T/

Changes v2->v3: 
According to the suggestions of maintainers, the code has been modified as follows:
1. Modified the commit log.
2. Added description of "ffitbl" subnod in dt-bindings.
3. Add stub function to the function
4. arch/riscv/ and driver/firmware/ use CONFIG_FDT_FW_INTERFACE to control
5. Modified the ffi_smbios_root_pointer() function logic and printing
etc.

Yunhui Cui (4):
  riscv: obtain ACPI RSDP from devicetree
  firmware: introduce FFI for SMBIOS entry
  riscv: obtain SMBIOS entry from FFI
  dt-bindings: firmware: Document ffitbl binding

 .../devicetree/bindings/firmware/ffitbl.txt   | 27 ++++++
 MAINTAINERS                                   | 13 +++
 arch/riscv/include/asm/acpi.h                 |  9 ++
 arch/riscv/include/asm/ffi.h                  | 14 +++
 arch/riscv/kernel/Makefile                    |  1 +
 arch/riscv/kernel/ffi.c                       | 40 ++++++++
 arch/riscv/kernel/setup.c                     |  2 +
 drivers/firmware/Kconfig                      | 11 +++
 drivers/firmware/Makefile                     |  1 +
 drivers/firmware/dmi_scan.c                   | 97 +++++++++++--------
 drivers/firmware/ffi.c                        | 42 ++++++++
 include/linux/ffi.h                           | 29 ++++++
 12 files changed, 246 insertions(+), 40 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/firmware/ffitbl.txt
 create mode 100644 arch/riscv/include/asm/ffi.h
 create mode 100644 arch/riscv/kernel/ffi.c
 create mode 100644 drivers/firmware/ffi.c
 create mode 100644 include/linux/ffi.h

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
