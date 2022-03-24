Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3357BC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Mar 2022 11:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aZj6f4rn+sGaGX9ogbghvR2ArH3TJ20E7+MXTLYINSg=; b=0IwHFzl2lc31nQ
	04jlLglDtt4O/JmWJRPD6MXxtKBCFISDwG5bw6RJlEK6C5T7WepzfoxQB/71+Wlwagalo1HPIitkV
	MVXz3bMSo/dYwdny9qIKlqWAbHWJFtId7YnAmMoR+kjOE1KzUgoiWTw+Zzzt16vURuhx2oVnpFNBe
	HvEYQO+QBwAx4MqDL3VINi99VUAcqFJb18yUe+tnjRgAC1PdY1J47MK8z3f0CXt4Hdi0XgOEy24Tn
	272RF1xbRrxichWUHeKbTCEldtVY62knpMu81lma7TF2HCirndIol/KSBPLpjSwNVgoPk3QNDR+AD
	4bYt5ESEhOAAK7PS3McQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXM3L-00GOm1-IY; Thu, 24 Mar 2022 11:54:55 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXM3J-00GOlN-AB
 for linux-riscv@lists.infradead.org; Thu, 24 Mar 2022 11:54:54 +0000
Received: by mail-wr1-x434.google.com with SMTP id w4so6254768wrg.12
 for <linux-riscv@lists.infradead.org>; Thu, 24 Mar 2022 04:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LIfAgUFlQuuXkU1fEu/zVHtHcFjwIMuJbdKlY7p+oOQ=;
 b=mLly/YqVCxPLAJbooavjHV5mjXFaM/LxoLnG6gn2jf4dQkFUxhvFC0SoZ+TDZB2UDq
 HOlJ1H5dTfPFL/pjjoQxwDQIKblrolKef/4YvHw+q6jK+VgabdQ7Quvkz0R7wNmKlIfO
 Pa4G1X1L/wgejr1+fCojmWddwOqOIMUFDCWmMy7DbiVW8T2+NS5tk4DOrpXEAR/4xqVr
 3qLZaaHxwF6GSy5z++kLQ/K8Trt0FJAoTLMlG2NjtbrECOEnlv6Nv29vowexmD1gLzz2
 BSQagWAS6ZEC2uYcYrze/SBEWTt6L5lTEYXOpM2e6FYhQYa49vH5flwmqeaf+yUcSjZP
 uhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LIfAgUFlQuuXkU1fEu/zVHtHcFjwIMuJbdKlY7p+oOQ=;
 b=slyBhUA0V8x8eNmw9oguuvvVnxNqug2GBiD7amjeQAhYwKrqNBeuFtPq5DqvyMNuky
 or2Ea27E59HPUGTNEkxgZU8vS1wchJGK6lWABNGbvYOkQcA28gxhlpa80bJcUsBdSWMi
 CYTENlMHsBMQmO3MWgHZCkml56l1Me8OnLkt2ZlhBv8LUPfOWg0Xz5pSeeDfkIqj5x2l
 NUjAaPXKcB2y0/3/P0CiMAq3NXW1faQgaHiRnDIEIo0uwpkVERePLLhrzV92X4yXSF/e
 uc2NIXrlqImaPV0VEWZyHE6E+t9BWgola52B0DyB7KS9ApT12EsP2D15J8lL81r/pYD8
 p0fQ==
X-Gm-Message-State: AOAM531WcfPpNhFuhHf3tBlN4xQxAWOcvNI/1KxAeQsoQhlebMJYXsIk
 jwBxJjjn1umbNr+ccwJlUGgGaw==
X-Google-Smtp-Source: ABdhPJxuJWmhZQ4LiNF2bBYCyyu4Ia+w/e4PXH2Kq0VpkzGuvh9YsYCEjwIeLKjFpDHbboX0ePbFIw==
X-Received: by 2002:a05:6000:1a85:b0:203:86bc:9816 with SMTP id
 f5-20020a0560001a8500b0020386bc9816mr4320729wry.67.1648122891324; 
 Thu, 24 Mar 2022 04:54:51 -0700 (PDT)
Received: from localhost.localdomain ([49.206.7.17])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a5d5849000000b002058631cfacsm2543857wrf.61.2022.03.24.04.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 04:54:50 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, Abner Chang <abner.chang@hpe.com>,
 linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V3 0/1] RISCV_EFI_BOOT_PROTOCOL support in linux
Date: Thu, 24 Mar 2022 17:24:37 +0530
Message-Id: <20220324115438.210390-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_045453_400458_E5C3B60B 
X-CRM114-Status: UNSURE (   9.95  )
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

This patch adds support for getting the boot hart ID using new
RISCV_EFI_BOOT_PROTOCOL in linux efi stub. While there is an existing
solution of passing the boot hart ID through Device Tree, it doesn't work for
ACPI. Hence an EFI protocol protocol is recommended which works for both DT and ACPI
based platforms.

The frozen spec of this new protocol is available at
https://github.com/riscv-non-isa/riscv-uefi/releases/download/1.0-rc3/RISCV_UEFI_PROTOCOL-spec.pdf

This is tested in qemu with both u-boot and edk2.

Changes since V2:
  - Updated error message

Changes since V1:
  - Rebased to get the "Fix get_boot_hartid_from_fdt() return value"
    patch
  - Removed mixed_mode member
  - Separated return value and status.


Sunil V L (1):
  riscv/efi_stub: Add support for RISCV_EFI_BOOT_PROTOCOL

 drivers/firmware/efi/libstub/efistub.h    |  7 ++++++
 drivers/firmware/efi/libstub/riscv-stub.c | 29 +++++++++++++++++++----
 include/linux/efi.h                       |  1 +
 3 files changed, 32 insertions(+), 5 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
