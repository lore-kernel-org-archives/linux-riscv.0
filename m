Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23A5C2BA4C
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jan 2022 11:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Gi8PbPHLx/hf2YpNr/18k4SAWzFKt7kcCTTblmRmk/w=; b=bazTBguIAYKYtO
	n/CN2ZE0A2dvIQVSTNv3EDyxs5jwpWoSXL4ECGQJyR2T9lQy3U6AM0RtlKaCNvybBatAPOF5+sEag
	Ax6lhhwkHP66YJ7yd6UuctNElI2GuSOaDQhpeHqnW8IY8hhK9mkblY1PyYKzZPZ4y45D44Egt3LVc
	n8S9NKTWzHOi7jiCQzF1rBSFULLlR7bpoyn+eXt5a3+R2rmw9xFovfRErGxgAGV/r6ZFpHm2MBKc1
	csnBa3LXhBGt34QfW2sO1tJX3oLVLyHcrXtWmInVDwKxB1jn75HN/NCbwLuBzW1UYBcEEb/X8Bk22
	adwc5xqPJVX7h+Vy0HGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCgHv-00BQcR-Ea; Wed, 26 Jan 2022 11:16:31 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCg8C-00BONI-Cb
 for linux-riscv@lists.infradead.org; Wed, 26 Jan 2022 11:06:29 +0000
Received: by mail-pg1-x536.google.com with SMTP id g2so20855085pgo.9
 for <linux-riscv@lists.infradead.org>; Wed, 26 Jan 2022 03:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wVeAFMlelYX7tOY5dDydv687Sysfy98XLePUPfp3n+4=;
 b=iqV0Y1Oo4ZVC/LRdBxUVY+DWQCtN9EwZe16EDDI+ah7IN4Vu4+QJvHYkwMwMS9rPRj
 zksepFiZKbXjUahiuPE4mzkZZ41qSeF94mgFF2PXpn4F/PtAxL70JEoe5xpd78FyK4ib
 O0XWJVhx74oMvbVjpMS9ly9CjBGi3VEue3JeXxRilv28DYl2vlb9miSaS3UB4Wf/iiJO
 6P/dqKECxZyzsemWHECF4KdY3FAKPCBC4GQ4Feww6ZDAmFekb1xVADAoCu8cyDzat0EK
 TWeIU/+djGuIuY0kxB48NdAskmC/TEY+BV3D9VwF4RoccwOu/k9BP6Wofw4ZSc+cwbgi
 LCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wVeAFMlelYX7tOY5dDydv687Sysfy98XLePUPfp3n+4=;
 b=H5qMGYOcAdEskO04F/y5rSJgBxYfHsdb99TOHWYfFvCKc2vuZVIAzLbqyRHGf/t9JA
 GLZbjXaAySV3JhrnyxYiPDsx1VGWnopRoZED2fXfTEVIZgojkFisaVBYmPpjG5g53fXP
 llZNc2W9av2jS2Ox6ksOIUq+ZiiNwh99hPkVnk0XSCzjF68O49pb8GkNes+/HwaAMDr3
 JdIlHOzADYWgaDy+kPRyOicyxBnxzGaSDzi6jjYWWDC5Ud9ezs1YMa/idf5A3O44nLHA
 qAhcxVmEW4l25ym/LYX3tPLWVydRs1+JGNnTIxAnrXnofibN4J3ZEXI5Fmtq7rZJ9hIM
 ygZQ==
X-Gm-Message-State: AOAM532FR0WJtCrlm4zMM8kDQFkrvyF0VXEJkBD724u587hwVj2mEuNY
 0PpZ9ejHrv6UCt5UP6TjQIy9Qg==
X-Google-Smtp-Source: ABdhPJzTN8jP0iLPGAsGM1I8G+Bpd70Ujns36T3AIMX2axXRe9kLrfxOT2tnD1+4nMMN15p2XefwNg==
X-Received: by 2002:a63:8949:: with SMTP id v70mr13202922pgd.380.1643195185796; 
 Wed, 26 Jan 2022 03:06:25 -0800 (PST)
Received: from sunil-ThinkPad-T490.dc1.ventanamicro.com ([49.206.3.187])
 by smtp.gmail.com with ESMTPSA id r11sm1811792pff.81.2022.01.26.03.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 03:06:25 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>,
 Abner Chang <abner.chang@hpe.com>, Jessica Clarke <jrtc27@jrtc27.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [RFC PATCH 0/1] RISCV_EFI_BOOT_PROTOCOL support in linux
Date: Wed, 26 Jan 2022 16:36:14 +0530
Message-Id: <20220126110615.33371-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_030628_471851_52D8E7FB 
X-CRM114-Status: GOOD (  10.09  )
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
RISCV_EFI_BOOT_PROTOCOL in linux efi stub. While there is an existing solution
of passing the boot hart ID through Device Tree, it doesn't work for ACPI. Hence
an EFI protocol protocol is recommended which works for both DT and ACPI based
platforms.

The latest draft spec of this new protocol is available at
https://github.com/riscv-non-isa/riscv-uefi/releases/download/1.0-rc2/RISCV_UEFI_PROTOCOL-spec.pdf

This linux ptach can be found in:
riscv_boot_protocol_rfc_v1 branch at https://github.com/vlsunil/linux.git

This is tested in qemu with both u-boot and edk2 firmware changes. To test this
patch with u-boot, we need u-boot to support this new protocol which can be
found in:
riscv_boot_protocol_rfc_v1 branch at https://github.com/vlsunil/u-boot.git

Sunil V L (1):
  riscv/efi_stub: Add support for RISCV_EFI_BOOT_PROTOCOL

 drivers/firmware/efi/libstub/efistub.h    | 15 ++++++++++++
 drivers/firmware/efi/libstub/riscv-stub.c | 28 ++++++++++++++++++++---
 include/linux/efi.h                       |  1 +
 3 files changed, 41 insertions(+), 3 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
