Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B44EC54E4A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 06:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aQzyZLmZwMWExDmc2QDgcfi68VFuCulntNmt7aM/wkY=; b=VopjYL4fSja+0s
	SxEH7AObYIzz9J702WRlBDTCiF/Jjur3Tn3L6kLl7yOufcYyHwhooDknUBNszZTOL5yJSnYchDfH8
	lnb5jT1dw+wyYYyMQVvtYBYVCw1UkL3ue6qn1pMskU58zP+8PL9qgFuuZ33tmUqawBCP4emcMMHjm
	VLG1VEOoS3X8SOBDtgbsrzd7ouaxpHw9GCXmEitlLxJOt/5bP5USZvyJ5JHQST3UDmUXY3zokzK5r
	5yvt0oX8na3T3+UpElzbsFWfSQmw/D4AGvppAmp0WBFGzWC17vAkBI7zujivNXtjfmYH7jmrGbtUu
	jz+CnnWQzBk+4lIWkKpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfDrL-00000008EIl-3RPW;
	Wed, 28 Feb 2024 06:56:07 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfDrI-00000008EHE-2L7P
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 06:56:05 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6e4f569f326so2577740b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 27 Feb 2024 22:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709103361; x=1709708161; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JxG7vP1SFrBhJ98k0I3xsm/G/tk3/29eGsIPZ1DJHx8=;
        b=GjWXjSzdMgJcCmEndCjXh6dAEhG8iNHsk3ueB0z7RuGiMUWMisaMDkUTUCI8skJCKF
         AFMSPfRZ0IMlPBVtIaFqqidoFzeQF6M2nJAPSzD12x8rnudl8i4Bsgoyt+DL24mnjHON
         O0Wp395OfNs7X5qb4lb4/O33yzb4pqCpackZuICI6gEwnbG6EBdckKQzrf54aUJNgOAA
         sB9MU+yjlf6sT9ZcTF2nLOZw68PFu9LdHG1S6PZnKD935TN9XzJ0r+SUe77Dsa+ZjCCW
         4nVqpSlzp6gCurHhxGYDCLv0LrgJ0QvKNET134PSAsttpmAIOkDt3ImwIfh9Pfv7t6C9
         Yf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709103361; x=1709708161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JxG7vP1SFrBhJ98k0I3xsm/G/tk3/29eGsIPZ1DJHx8=;
        b=fdkLiPqS/5HA+8LU/j21sw8s0qaUITwuA8gVuQpOnITEAPMDa0OIdpHToAdWK8yXi0
         6h/AEXpZY4tbPUgCDyVx/V5yweJu8SPySUHSCOKElQWJR97npJd3EMgofxdlnwp8ZpnP
         mBmTHGS1JnVCnxHD4qXO6nX8Se7uUs33gvZ8Sq6nzmRUFeUizzD32jPqqN+/AVyskWtO
         tumSkd9ionIYWvoQkejoxbGkCOzfGXXpzJ556GiQ9ccqDdjC9HnUIxf9DlriVqI8pV8a
         RHusDirKu/okf5aYuQmQiKM9LuqZ9Ch/ej9EsLWfjKzIb8f3lHj3IMbJZDYDOiSJK2FO
         FrVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgJGxgtk/qjLFOqTSbysIZTCXExwTAe1h/YGvaCf4eQ3brg+RnmcLelQE/zCsvkuOzugwsz5X0fvTwzraVZ6XM8GsECcw41faS6eiwMm9S
X-Gm-Message-State: AOJu0YzpXbzJx1qObbsSxm9PnaCFZctbIeIYVBOtWw4OG8cn8EsikNPZ
	lHLKbhJE7SdNT0vVpI8j+Okc0QBXkIooNaxMt6ZLxIuEYjwOOTxfMZ1KPTPUSMo=
X-Google-Smtp-Source: AGHT+IHHOue4TrxJ31AUpskbU0nr+ZxbtS6GU64fgSQ6x04HFCZfxdsGdPGmSmGJvkrgw2d5djzHTA==
X-Received: by 2002:a05:6a00:2:b0:6e4:e611:8f65 with SMTP id h2-20020a056a00000200b006e4e6118f65mr12013448pfk.21.1709103361509;
        Tue, 27 Feb 2024 22:56:01 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id e12-20020a62aa0c000000b006e5590729aasm1010112pff.89.2024.02.27.22.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 22:56:01 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	Stefan O'Rear <sorear@fastmail.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH -fixes v4 0/3] riscv: cbo.zero fixes
Date: Tue, 27 Feb 2024 22:55:32 -0800
Message-ID: <20240228065559.3434837-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_225604_727204_2FB45B49 
X-CRM114-Status: GOOD (  11.87  )
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

This series fixes a couple of issues related to using the cbo.zero
instruction in userspace. The first patch fixes a bug where the wrong
enable bit gets set if the kernel is running in M-mode. The remaining
patches fix a bug where the enable bit gets reset to its default value
after a nonretentive idle state. I have hardware which reproduces this:

Before this series:
  $ tools/testing/selftests/riscv/hwprobe/cbo
  TAP version 13
  1..3
  ok 1 Zicboz block size
  # Zicboz block size: 64
  Illegal instruction

After applying this series:
  $ tools/testing/selftests/riscv/hwprobe/cbo
  TAP version 13
  1..3
  ok 1 Zicboz block size
  # Zicboz block size: 64
  ok 2 cbo.zero
  ok 3 cbo.zero check
  # Totals: pass:3 fail:0 xfail:0 xpass:0 skip:0 error:0

Changes in v4:
 - Add a patch defining and setting the Xlinuxenvcfg ISA extension bit
 - Check for Xlinuxenvcfg instead of Zicboz

Changes in v3:
 - Drop patches added in v2
 - Check for Zicboz instead of the privileged ISA version

Changes in v2:
 - Add patches to allow parsing the privileged ISA version from the DT
 - Check for privileged ISA v1.12 instead of the specific CSR
 - Use riscv_has_extension_likely() instead of new ALTERNATIVE()s

Samuel Holland (3):
  riscv: Fix enabling cbo.zero when running in M-mode
  riscv: Add a custom ISA extension for the [ms]envcfg CSR
  riscv: Save/restore envcfg CSR during CPU suspend

 arch/riscv/include/asm/csr.h     |  2 ++
 arch/riscv/include/asm/hwcap.h   |  2 ++
 arch/riscv/include/asm/suspend.h |  1 +
 arch/riscv/kernel/cpufeature.c   | 16 +++++++++++++---
 arch/riscv/kernel/suspend.c      |  4 ++++
 5 files changed, 22 insertions(+), 3 deletions(-)

-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
