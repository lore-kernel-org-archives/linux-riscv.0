Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15724C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 19 May 2022 05:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l4pS6zS8sI7z/Qub2e8Qmsqa8N5kOYzbVc0QzXC6ltw=; b=qXryDEOGbAdVhb
	fcpW76DNVu+lPR/bpSLkaw982wcHBKp9Lzgh4OhjDWbpz/WkQgSBFgtAl4uXwyjs2ODIBbGeV7lux
	LLNpbP7lu3p12dPfQnZaFRR/9xvPSyYpSNsRSnd/Ob2TQ228KVgcrJ39agIZfrc6bR63v+jg6gnwe
	hm+vGDwlUrRcvhxlXuTU60fuPxQKiiq/sNMafmyHt/d0QitNJthsXd/BmGwLgodL8r5QvoBNt53QP
	V997Cj5RZyzZZAP8eUROz4yZfuREg2sOeKEyK+zYfIcoP7ZZGrd6gUfJaeLorDOofF263LwNpgE26
	LCsYsBgpMMhtRDf0Wk+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrYVT-0054AC-43; Thu, 19 May 2022 05:15:27 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrYVP-00548o-IU
 for linux-riscv@lists.infradead.org; Thu, 19 May 2022 05:15:25 +0000
Received: by mail-pg1-x52f.google.com with SMTP id h186so4073444pgc.3
 for <linux-riscv@lists.infradead.org>; Wed, 18 May 2022 22:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FnRdlHrEla6Dyd7Er3np/FEhy1piZaEXssJQV5c0vBg=;
 b=X7PIGUbjsnX+9thxa6uAkZM4MwFqyfuO4+IGUv2xRCyk5KRtzRZXdWCZ/en+OvmeqJ
 GfV655FXoVrgKNk6QgccY0PhQvGiTmcaWuXE/KRNvfc984v2kPu1yCJOXvWzchYyx6PB
 mhZ+1pMW0w3QdGDGh5Be9vxSsEwiRrn6rcffLyQv/68t++moJQZ86Mv9QD8YlP094BVq
 PO48tBY1ruxvX0shzKumY9T4woWYVg/co4PnQ5yycMkyiCujBG6b3vF1EdIuCXTZ1BJf
 Z0z5dIcQfRyVOgxgGeAnDP8BHaIzCS0UbXRKpervsgpiTzCvLb7ZYq8MuAHoOmObxp4m
 CK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FnRdlHrEla6Dyd7Er3np/FEhy1piZaEXssJQV5c0vBg=;
 b=Dybipana+OGBwdaU4WN9NZ86BHL5MvlwpT/ST6LUEEvn6rL5T0iYaC8W4k6OUiMoQx
 9ftDfTzBWmcPUnfNAeA1TohrGXZGjhWmua//JXySGWbesS0xHQS0RSuTLlOBe+k3hZwN
 CmOiQXG7rbXTu/IBgi+BTygz0lDMzulf2umi3QHpWt3NVmbrN192gAAvFRJ6/4O8UqPK
 infB4yZrPj8aMy8OXdXi/zxGE7C0lBdluJSElyGFuvcN1r8enOizJb/2Ddt2C9skMomn
 +0WTrwVBfarO+ZbGfjJODi0krmxh9lL1658OKJD1LHBLJDtECu3E6nt/zEuDDVOmY1B4
 tOBg==
X-Gm-Message-State: AOAM533RjJPwAv+qim5bTS4Y8bC+ZLSvQBPUTxIbV+wRRNfOLd7C1bDp
 suI3WwhhytrcZIbyN1n2kenSVQ==
X-Google-Smtp-Source: ABdhPJyfsA7vHd6Skw4UKaV0vjCh4Vet52VObBCGk1xXZ8PdZ5VGQsKj41jCUnIXPgWRqs2DXVr8lw==
X-Received: by 2002:a05:6a00:24c1:b0:50d:33cf:811f with SMTP id
 d1-20020a056a0024c100b0050d33cf811fmr3177502pfv.78.1652937321167; 
 Wed, 18 May 2022 22:15:21 -0700 (PDT)
Received: from kerodipc.Dlink ([49.206.10.235])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a056a00235300b0050dc76281a3sm2929007pfj.125.2022.05.18.22.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 22:15:20 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, Abner Chang <abner.chang@hpe.com>,
 linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Sunil V L <sunilvl@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, Sunil V L <sunil.vl@gmail.com>
Subject: [PATCH V5 0/1] RISCV_EFI_BOOT_PROTOCOL support in linux
Date: Thu, 19 May 2022 10:45:11 +0530
Message-Id: <20220519051512.136724-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_221523_652214_30F61AB3 
X-CRM114-Status: GOOD (  11.52  )
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
ACPI. Hence an EFI protocol protocol is recommended which works for both DT
and ACPI based platforms.

The spec of this new protocol post public review (Ratification-ready) is
available at:
https://github.com/riscv-non-isa/riscv-uefi/releases/download/1.0.0/RISCV_UEFI_PROTOCOL-spec.pdf

This is tested in qemu with both u-boot and edk2.

Changes since V4:
  - Changed data type of hartid to unsigned long
  - Updated jump_kernel_func() to take unsigned long for hartid

Changes since V3:
  - Rebased, no code changes.
  - cover letter updated with link to spec version after public review

Changes since V2:
  - Updated error message

Changes since V1:
  - Rebased to get the "Fix get_boot_hartid_from_fdt() return value"
    patch
  - Removed mixed_mode member
  - Separated return value and status.

Sunil V L (1):
  riscv/efi_stub: Add support for RISCV_EFI_BOOT_PROTOCOL

 drivers/firmware/efi/libstub/efistub.h    |  7 +++++
 drivers/firmware/efi/libstub/riscv-stub.c | 31 ++++++++++++++++++-----
 include/linux/efi.h                       |  1 +
 3 files changed, 33 insertions(+), 6 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
