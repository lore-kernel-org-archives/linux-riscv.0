Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EFFCAC5B3
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 20:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zt8QEOqRFBKBMejHsLg7mEufGmE0DVQgRVFEQVk8/B8=; b=16N/a1SPBd4WHV
	VLbd5vwuWRe11WLN+7r8h9mWn/RADUwdt6uImdThgUPO9Sfvp+aiilzFLt6YIzaQ4XIBSElQ7iQ8T
	6H0dUv75D/CrhEjS3ErRtQrraNyzoMv7a0bZF6Ic93e1q0FBwK+lM/VFruUUo7BMxPHGM1vcKdrDp
	1VNpEToErqHNoycqdtixmWEAD1+4vKgqLMvtmrcbesgdSAnPbGk7aAfwXZ33VSdhQ3L6nIDLU5dWs
	+r8+3KOvWdysRDM0cgwbc2HvgiWmcOzGBltbcYcUPRVBdWTU7apvv0HHpa3ouqReCPW1JffzzJhcZ
	CJTprfBlVVO1f0R5ckNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04Ma-00000005tsD-3TEX;
	Sat, 20 Sep 2025 20:39:20 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MS-00000005ta5-0ZzN
	for linux-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 20:39:13 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-425635acc4dso6654135ab.1
        for <linux-riscv@lists.infradead.org>; Sat, 20 Sep 2025 13:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758400751; x=1759005551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxscO8SXNrjDBekFMJlTFlhXiLgQFfajmO2RZqDfrAU=;
        b=WJx6LN9oT5I061YlI9UAgnYaUdpMz1SIDS1+QGaI1mVcTHX3GwOeKejn/IdePUg40G
         4NBr+Ym88iosHcwzAiOw6O6KZ1rEo3IjnV+8NSF1TIogGzFY+0hQqpnlxReE64frpMes
         bbtV5EvSG8gaKIfyhMiltW7ceORzqOFALwfF0ahO2Ir+ai7o5STKftg1JoX99/iQmMkg
         v2CF7KA1VbYnqaNDFe+A3XqffPQivk2KmNEl+E4xHvhvJBXRBjvzC2QqRXbfrpKx76oz
         CjWUkqf05xDyncDbk/6+vd4rK+mAccSOmPVjkjVzQQc+q8Afr1ySLAjuX1noMpek351O
         NHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758400751; x=1759005551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TxscO8SXNrjDBekFMJlTFlhXiLgQFfajmO2RZqDfrAU=;
        b=KOzTjyAUsNv1frqX/RW/XRYEZ9DyM8fIKSnXW+uJarmOGSrDJqgrd19OIj2L6E8kzo
         9Wa1ZFgufypd7egH32QP/KOipEHXdAeSLrTUspEwKzzjX0W/KTN+1aBsI/hbtyMjKGjM
         Kfjn7YAdGuR34+pfCcxP9f7hIsi/DaqzRYMAa/2FAJTZlCyJ1K6QN+e+o2jgk+HCAX9j
         wCAGyxi75OnNs8QGctSGUywLGyE/aLQevgdZeyzdaMo8ziCuKsrRM+8VrPus53wgBVZV
         BthlNhIaF+nSG0PM9y5GosedEam3mvXP9I7d+KNuv//2pfsBvd3vSAiOP9Qkk9WbpO3s
         lNpA==
X-Forwarded-Encrypted: i=1; AJvYcCXjoT1fxlrtR9LgeGevFF+VDZw0rnFQ70LkPLpoKASLAqmWRuS3dU7Cmn+narG9TpWYxEUNKYMeAvlNIg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUeCckhUYQzTNrCZuoWsqTxfXiO4JP2y04yQBH4bbNvpAkYlet
	NLhBWUTKPDRiobSUMh3gjQX84nCBSm8q59Kj8ofiaYt/Nx3RRd6cxFp0cocnzz34C7Q=
X-Gm-Gg: ASbGncuWyppTnE0JMZCiKUiFfXoCPD/M0xYH0SC12DAld8OFp4PgcjQyEVSv9oOXQWA
	Uv7yVIOc2ccYnsbQgCnemFkySrY5/Zbv+zLK0VESWd0JWfZ8G6IeTB3DHYCC6L7FfEm8kowIZjw
	fpjR+WjPpZiH5JG200jRtg4HuBew09C+xnopeJD0AnwUn420G5rThXEJZjCzY0av92ssPrhOmr9
	sPra3py25h4K2zGFw4T+qhGud7D0kspGcQ3Tm7Qou5JzaJwqHd7e1bem6ye1hgbGkIJEkS91poU
	VBeofDSTOR5Y1XXy4VavHvMLCYOzyeY9e/1FiZE0TSQw8ornoKIxDPlxH+ImPZ0udxSRI8wRu9s
	JwR48cSemwlFpjxzcsff/tnA8
X-Google-Smtp-Source: AGHT+IERpRPEc12mV955tvnuQoeNvkZUC+MN7EtTp3JKXd3eHnM2oBc0U3F0kWPqnL99WZIdHZ+AuQ==
X-Received: by 2002:a05:6e02:1d9d:b0:410:cae9:a089 with SMTP id e9e14a558f8ab-42481922e1cmr116891435ab.2.1758400751055;
        Sat, 20 Sep 2025 13:39:11 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d56e429f3sm3768486173.74.2025.09.20.13.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:39:10 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: jgg@nvidia.com,
	zong.li@sifive.com,
	tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	tglx@linutronix.de,
	alex.williamson@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alex@ghiti.fr
Subject: [RFC PATCH v2 14/18] RISC-V: KVM: Enable KVM_VFIO interfaces on RISC-V arch
Date: Sat, 20 Sep 2025 15:39:04 -0500
Message-ID: <20250920203851.2205115-34-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250920203851.2205115-20-ajones@ventanamicro.com>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_133912_226328_096E6D2F 
X-CRM114-Status: UNSURE (   7.75  )
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

From: Tomasz Jeznach <tjeznach@rivosinc.com>

Enable KVM/VFIO support on RISC-V architecture.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index 5a62091b0809..968a33ab23b8 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -30,10 +30,12 @@ config KVM
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	select KVM_GENERIC_HARDWARE_ENABLING
 	select KVM_MMIO
+	select KVM_VFIO
 	select KVM_XFER_TO_GUEST_WORK
 	select KVM_GENERIC_MMU_NOTIFIER
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
+	select SRCU
 	help
 	  Support hosting virtualized guest machines.
 
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
