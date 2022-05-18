Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1D6C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 18 May 2022 09:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xJC6JrU/hsMFFZBoWTf1enIjUmIth+J1O3IB4jjWQx4=; b=13j3XQGxOfpdFJ
	B06cWgkUr64pav+iqhBd4ckEL+yZ5bywEpr6Rmp84h1Fixj2ZPNWjF5zyguDsN6p2keia6uzoy2Ad
	2d0e+VA6WZGS12lgS6/k0hBwqK9FUKpqBJuS3Y/xs5I8uxfCMgW9w8YzQJivtuPC0lLvXhSFpC+O+
	T/9ab18elZiIG7v+XoOYsPlTYXR9QfjaSCtl5vmHSvDWCJTUjno6kVykcZnlQvHA9uoeaylEwsV4y
	r67NZkMALgiKSK9D+6M5aLXTdhpF7MDt9FX+beA4I6oS9c4iR9JqLncBZmF3loWce/ftOkz7NA5x6
	qL57LPXqLamqCfoFRteg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrGQf-001DSC-T9; Wed, 18 May 2022 09:57:17 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrGQc-001DQc-Ib
 for linux-riscv@lists.infradead.org; Wed, 18 May 2022 09:57:16 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 a23-20020a17090acb9700b001df4e9f4870so1540527pju.1
 for <linux-riscv@lists.infradead.org>; Wed, 18 May 2022 02:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LMWRi+RpI9EfHgaGzmTuiTtwswTwktoLVmDlPpJXLGU=;
 b=SmxAwuuNLFsiav9NwR2VOJpmtshTgs5aNMEFFJZ8HerwonyaiDij7y0KGmWgsyUi8X
 EUvzwoqx30XPI0/fzQzShC9WWLRAQQIvdkmPzLU32Wr8naGZaam1WFdZ9wQYMGFOCM3P
 jgwooWAuyvvHjIsksux4ebr0J//bjQOWWL+K2jZmwwQEM0Nu4MvZPNoYm6rmYa6W+rJp
 msoRwvH/cnc92HDQuzvE5kt1fXp8YbSS/a1PG6GnvAtqur1ZBKgtWaE15OPYcqFxdpnZ
 JOYsl95QMBCLFMUxdAAscbDKHSEQI5IB79PACZfBGgKR76E4Y9B5Bwd1RWRrukx6s6zu
 dorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LMWRi+RpI9EfHgaGzmTuiTtwswTwktoLVmDlPpJXLGU=;
 b=rZq/8vu7+D1cdG8zLuoXpTvXhMIR/I3zxjbt0TtUyk9y+OtbWWKj/I5yOle7CTS6hA
 q3RhChjdNS0vMFDKb1c2FGx4ikjAB0xMyQRqPr0KBHTw11qC8uMXuO6mVf9yiWFSShJC
 V7We08tHtmkeLgvMbyu9yzcK4O/DH9vXxvfIAO7wwSziHe2WZsqwMkp+iAd0JeMI1z2o
 COp/hPx9eiM8ZKq+c0VjuN4+GpsdMgmLT8U4WE21u+o/qyYpnCcFghqxJQbcSlKv/F8n
 ZFeDRvBVZiFm9GPt1j4oYpJUwkjT0HiFw9Ye6OKvNcKYd2F1lx2caLArG89unmeC1ISu
 Oq4A==
X-Gm-Message-State: AOAM533NIGydNxoFlQh49DvmIgMG0ZH1z/EM8CpYxv6K7SzN0quMCYfV
 3jBWWXECLEmv050J6FRB/9mMpw==
X-Google-Smtp-Source: ABdhPJyWK9OF1+2sLxkdi1qFTTZkvoplqztdXWVshfSufuv9hZdvKNjmq6vjPPaR08Ib/BCSnHlFDw==
X-Received: by 2002:a17:90a:aa8c:b0:1df:359a:1452 with SMTP id
 l12-20020a17090aaa8c00b001df359a1452mr18932511pjq.75.1652867829760; 
 Wed, 18 May 2022 02:57:09 -0700 (PDT)
Received: from kerodipc.Dlink ([49.206.7.17]) by smtp.gmail.com with ESMTPSA id
 u2-20020a1709026e0200b0015e8d4eb1b7sm1258252plk.1.2022.05.18.02.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 02:57:09 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Ard Biesheuvel <ardb@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, Abner Chang <abner.chang@hpe.com>,
 linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Sunil V L <sunilvl@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH V4 0/1] RISCV_EFI_BOOT_PROTOCOL support in linux
Date: Wed, 18 May 2022 15:26:45 +0530
Message-Id: <20220518095646.47548-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_025714_654974_BAB4D48F 
X-CRM114-Status: GOOD (  10.40  )
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
