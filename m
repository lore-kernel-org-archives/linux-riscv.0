Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E494EC433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Mar 2022 15:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BZ3QSXdLkvRm7fJaYTeSTrNTCtLELFdWxC2QRsK3zGw=; b=k4H9JyjjghNNjc
	gjuJ9jJ+j1vqcHJofG+7Q8MvIFId1eCIJYUUKqr5L28nReg/yT9w+uXLJtode1SU1irE3mKN93wKj
	9kO/6/aN90jvIOfrSaSTMFUsFQHnpDVGE6JfxNOZxTHgB80hQyBxyGBmx4Gy2GpDNek78sWgk019A
	ndD0hbLtiQE2zgQHLRS9Jl0LlAAbItAdBleyhp14aArD/5d4aPmc++mUHPSHrH7d2KtIZN/BdJrK8
	revqqaLc7BglU1QtzREMwwulW9BjRR4NPyEJ4VJhJD4gR34x029XvysS92+k11/i6Onrs3sduolTa
	R7vMM7BKXFRf3xtWVa4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPmw3-006jhY-91; Thu, 03 Mar 2022 15:00:07 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPmvw-006jds-EU
 for linux-riscv@lists.infradead.org; Thu, 03 Mar 2022 15:00:06 +0000
Received: by mail-wm1-x32e.google.com with SMTP id i66so3306866wma.5
 for <linux-riscv@lists.infradead.org>; Thu, 03 Mar 2022 06:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hyZKtms3/fooY346YEFh4aDUln7VR4f3ZkWUMV+VfiY=;
 b=XoZI7nJBCKEM9JhyOj4+4Q/Ee/yq2th4jAnz/UhBWAKDEgTrbUkfdcxKDciB6eEhjC
 eu1hktSPl2tRO0qnypW8sk7nLauSF373ejLjGCvkInaDqIkg8mTY8BOO0SbsT19/BQE8
 FU24TDNc2ZrpGUMsktjKuOK6lRIqhUtV4r4tniYIIPW/fYzB+c9YvQK3ouion6eS/abr
 dcu5rUaZ6s2dWGZ4ZbaVtabVYr1ASu4BeEA8hiVMqCVbcERpTZOxGCHrMksDLSSRL2eX
 VzrlPgWl6ukUwfM+NF0fwROCvjlq/g3LVy9wr/qzTzkRy26qkAIUi27HY72ND5MxX4Qi
 ir/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hyZKtms3/fooY346YEFh4aDUln7VR4f3ZkWUMV+VfiY=;
 b=AbM2mzMP2DuyWEQ/zIo7yxs9cBaTst2cHJ/sooU8CmkFfaaJCz38AtofDq8GeXoXyu
 F+mQE3QoIdXQHcNHuBPtg6/dtnUjRo1cdSLcNqnYaWhU7pIqC3NYwUqcK0jonJoCcoQD
 bCI+pnDqNWJpG7irsRot/d2HXKStx7F89dTRSZyg08AzYdf9spyZmw/yxPnUBNGbmsHX
 XEnLSEG9JT+PRz4HB/4Bnn5fCIYozJglSBC7HnAS7+AcHMOxvCShqcFW5bSxh+5BUPzK
 RJ8VOCmJ2yaGIo0r6+t0iiLhBa9dwJmbhC6J0qbQ92KrKoYoHVgHeVadJU+ei7rjklot
 wjyw==
X-Gm-Message-State: AOAM5320sdEqlMWt2nv9tjYzNgzDABfE5TH7SXvrh2Mngi1z4l9CPHR2
 pJUr+RW32H/GJk7uI+eZ4jC0og==
X-Google-Smtp-Source: ABdhPJyNhPVn3ujz+yed9ZU8ZsVBArmJ+s8GAWfDmrjEO7NKWveEpuqL/2TcQKekRcVES9Tf/1cDog==
X-Received: by 2002:a05:600c:1c25:b0:380:d306:1058 with SMTP id
 j37-20020a05600c1c2500b00380d3061058mr4125847wms.150.1646319598144; 
 Thu, 03 Mar 2022 06:59:58 -0800 (PST)
Received: from localhost.localdomain ([49.206.7.17])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a5d522f000000b001e85b14dadcsm2224166wra.5.2022.03.03.06.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 06:59:57 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>,
 Abner Chang <abner.chang@hpe.com>, Jessica Clarke <jrtc27@jrtc27.com>,
 linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Sunil V L <sunilvl@ventanamicro.com>
Subject: [RFC PATCH V2 0/1] RISCV_EFI_BOOT_PROTOCOL support in linux
Date: Thu,  3 Mar 2022 20:29:43 +0530
Message-Id: <20220303145944.307321-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_070000_536569_584C63A7 
X-CRM114-Status: UNSURE (   9.92  )
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
solution of passing the boot hart ID through Device Tree, it doesn't work
for ACPI. Hence an EFI protocol protocol is recommended which works for
both DT and ACPI based platforms.

The latest draft spec of this new protocol is available at
https://github.com/riscv-non-isa/riscv-uefi/releases/download/1.0-rc2/RISCV_UEFI_PROTOCOL-spec.pdf

This linux ptach can be found in:
riscv_boot_protocol_rfc_v2 branch at
https://github.com/vlsunil/linux.git

This is tested in qemu with u-boot 2022.04.rc3.

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
