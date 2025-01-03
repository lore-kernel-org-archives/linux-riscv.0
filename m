Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8475E77188
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jan 2025 09:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/75SpAdy13QGsfC0bmWwV7p2kECK4F+1ZgDTrGRdSVk=; b=cT2wgBXZCiHHsN
	pMEo+ftS/DGQ7jQKNfux3yc867+XUBa99rnQU8+IDv3TpTspQVwYGVbI3dW+mjVl6Gr5lpfdQZ12h
	568BiPhBreOK8Sa0ejC1SjuqNU3nM7ChnKfmYfyetufABVqCpt6LnlUM7R+2/X7Ztvetd6j/LXVqS
	Kn8e3xilB5ZJvU9ewDLNpaquln2xFJEx8lrNrGJyQAoirtIxXD/BphluaBQji8W6cfJvW+qx7gFAe
	hjd4wtR7bVfP0wvJJys4tHiXgHGJzt1FThX3j1/WuQ4sl4RH5lk328h9Ngi5SmKCAxkX3u2lMeyCf
	gaBm81KtYz2ltTX5qZLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTe2h-0000000Cchs-0zuY;
	Fri, 03 Jan 2025 09:32:31 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTe2f-0000000Cch9-00UF
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jan 2025 09:32:30 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21649a7bcdcso162861205ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 03 Jan 2025 01:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735896748; x=1736501548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SKk1FI6zQyxC6Jfeaa2W406Eo5j/J0Vbugy5i2jnps4=;
        b=TDY3PG4OZvG5wdoTaRCvOhwj4l9liNcyVNtIYGw2Sp8nyCZqkCmrLBeoq+Qfno7eWB
         xzCoVEmUKVHFL/uITbsjMkm6WLnM+49BPvsAhAU0afJPexdfp27xKL+BpaukTDNc9/vf
         u0fXbYOf0+UeHi5OEMdmzAr2eIDYnlfzsL0AEORspu7T8U+h4Eehv03rdN7Uw80CmeYe
         vAc4k5mQIPEUW2IWIn8Wphv2hw2ZnVEnMaS157SywR0UIg7Sf2oCRQrQ1GfmDa77ECUj
         M8ap1fgDYR77VdPzfJeaZ96qJXQMC1FiqRxzMmeUFDofN7UVrsV0OGTJVGiy3tk74cIK
         drBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735896748; x=1736501548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKk1FI6zQyxC6Jfeaa2W406Eo5j/J0Vbugy5i2jnps4=;
        b=RMFFIl2yEMCk5cdN0FCg8eQXoj+LiF2hNIpiakCuCpAFB0MhA9V9ofCpLTi9l7B4A8
         lsZM3Qd3gK4vMLrNKahscSbemL1Nb87U0r1WwYottx/KdTWSj+iznBoPnGHnsK+GiQW8
         hFVo+pokN//G+mWYzPa0d0KmUc779yMI6NQ/iVxzQdx9+q7dzCKohfke4WaDY/bOp2NZ
         7XgZCXVHqq22+RrNR9leR1G4sYS1cMincqwnTtyaIfSudxQLt1QseYMdq/y9Z3DTSYXd
         trf1fqBrQK7erzI8zDq1Hg4yOBs7MOwMs4SCC/BMcp038t3jUPrqCc6vUCkc6JhYOPBv
         BgNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM0l6LMNROHt0SFcaN11YCGuvIXAP0bsHCwXQQiaqDgV8YLZgZ1S7cZPgBVBsVy2PhRNVUWhFbgviWIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMw7aaomzTAu0TNAKwpx8XdSZXHRYvj/e1CTnSEfvGXzzu+5nE
	vcM8mg4VpM+uS45Gw3keVwBXxU9htVoEC2POZbyva2rIp99e0fkLqClQhCQeRFQ=
X-Gm-Gg: ASbGncsxyuAbPvQH72al/LKp7G0bIzf8QlcEgZESteUWdCUcErqFgO0WSYJXl4pxTSM
	w/T25yERLrmr07rq9wUwU6KuAysJNAcFIegDNIEz0qcGyKQ19LXVi26SRZZjM/3XnnJPbwbe++i
	5k00xYMsAtzumkeqRfaonwNl8uV6yoBP/G4DujGA+/slN674ZNzlV07AUjWc97nBjP/hvOssL11
	vTmjHaS/mGIhf5Y/W8cigZBME8rIZ6GcDLmI6193o5ewYxCruWbrWxP5DaRHut1mjU7IKAVREdu
	3D+m//XQnW1uHWzD/ng7N1/fqc0xEoZUwDO1FYI=
X-Google-Smtp-Source: AGHT+IGBzxD4H34Ifr5hg3tZ1klbrrjY+CrreB/5URknlVxUQwbmgmz/BsJ+ZoGNL1+L0MbwMbpjzQ==
X-Received: by 2002:a17:903:238b:b0:216:39fa:5cb4 with SMTP id d9443c01a7336-219e6eb6234mr722356135ad.25.1735896748046;
        Fri, 03 Jan 2025 01:32:28 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f4a2csm242227395ad.175.2025.01.03.01.32.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 03 Jan 2025 01:32:27 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org
Cc: lihangjing@bytedance.com,
	xieyongji@bytedance.com,
	guojinhui.liam@bytedance.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH RESEND 0/2] riscv: iommu: Add shutdown callback for kexec
Date: Fri,  3 Jan 2025 17:32:18 +0800
Message-Id: <20250103093220.38106-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_013229_037800_ADF1C1F1 
X-CRM114-Status: UNSURE (   6.38  )
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

After kexec, the newly booted kernel can not initialize iommu driver
successfully as no one resets iommu state before kexec.

This patch series supplies shutdown callback for iommu driver. The shutdown
callback resets necessary registers so that newly booted kernel can pass
riscv_iommu_init_check() after kexec.

Xu Lu (2):
  iommu/riscv: Empty iommu queue before enabling it
  iommu/riscv: Add shutdown function for iommu driver

 drivers/iommu/riscv/iommu-pci.c      |  8 ++++++++
 drivers/iommu/riscv/iommu-platform.c |  6 ++++++
 drivers/iommu/riscv/iommu.c          | 12 ++++++++++--
 drivers/iommu/riscv/iommu.h          |  1 +
 4 files changed, 25 insertions(+), 2 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
