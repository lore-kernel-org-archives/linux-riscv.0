Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504BAC83F1F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 10:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PBbJohqToIUXXpKMMZyFf+n1ZJ0a2PixDoxqIRXbxDg=; b=rM7d3L+Kl0FeVq
	PQTEfqxHevOcdUMzbiAcNrugBig1JU0sZLUbfTZuVPL2IOClTCQTXt1zaS7+/rbWMnaciTYxfeZZ6
	QADUu9Bg1CgdUuzpZQWahfthr6+gwqtZd8EFLLtjAZ0R/iqxNp8d+HkvAUCsJbP4BUk22LxmKGbTC
	8xcZY6KiFSwvZyZbUeBYFg9bhlsQRetEOCsN0vTvM7w64/tzCGYUWvpEuCMgdr91uhzfLK4KQCO/b
	XVoYfzO1+WiyCg7P7QhbiRtc/Rt0U+wh/YBc1uH9SzgUNVLzoH36ytrvKdEDL24TBHQwDvoaoV2lB
	VCbyHgrZGvyXfUPolBvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZoGn-0000000BQsi-2xeO;
	Thu, 10 Jul 2025 10:12:49 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZn5l-0000000BFoG-1yRi
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 08:57:22 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso689779b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Jul 2025 01:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1752137841; x=1752742641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YaG3DvsXq5/AKyC1GLSjgb34PJp+nqhxTUl2VKU3MC8=;
        b=i48w//StBZQ9OR+TRdP2HoLJPI0lUC2msRtQ0YG0HIKwpswx9nFrzxJaoyS3roOw0J
         aJcyFiDdzIC1Dt+WVZ+JGpvyy0VurK1zvU4/FMee+3OSfSta+NRhQKFnVwvL3tjkKbMb
         1ZWcL3ctsXS2fsWGoIlTwOFB5qpBNwx6u+dkOL6z8UHMz02FWoZnf6mVuTvtt6DfI1Ja
         7CD5BWXb7Caxmx6/Op1gIjFbdI/OjEZMBtNCiSsVblQhWFwH6T5mJ1ikiyIAqsUMk5od
         MxLMWgWpj6V2JwoihoY3gnl1I+PTbmNwd56Pa4aZYZdDDSegvw9YjYKuAVEXW2ZuYAlY
         WmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752137841; x=1752742641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YaG3DvsXq5/AKyC1GLSjgb34PJp+nqhxTUl2VKU3MC8=;
        b=lGMs8kyWLLrwj3o33hFbS2KKJME2wFY+uCqBZLQ/+PJz1zLzPEjn26ErRZMRmP+AEG
         vWGaOCuBkhkugJL1iV/m0RcrdrRpAdnaPLtaDko+8StaBnEkmnwinHq5qpR+smYgsnXh
         4Qs4bxwug89Ix57hmx0NR8s+RcEnngahNmW/qrwdk8NcoodISQyJnP+rJhkoP7xTH+Uy
         Tgy/VsD4fFO/lHogmd7sPiRkBWZJ5xJ3jYgTpz+quuwg9BTvTTis+g9ZEhs9N35QLfKz
         39JN7GvUZSLbj0PLEV7XWOK18fEMW6M2MvgV3Y91OJ02EmALizMJd9hmmXCbB2Qqn0U9
         p+qw==
X-Forwarded-Encrypted: i=1; AJvYcCWYWMO48lZbxehrmnf6LDqP+ACCfLKV5/u95Rx+i6gG9hrpY69NUTw8Kd5TUzp/YKa0zKzWW7J2i06Fkg==@lists.infradead.org
X-Gm-Message-State: AOJu0YySuChRtoUS/iMdFaSLrj1WgO8j+lcU0o2iuz5xwpTh5rd0p0R0
	0UZBfmEs2tTeYc7fpRxwZq8LS6Ajwztq+m2qbXDhjRCjT9TVkEFdpXi/ly/cAk2zmks=
X-Gm-Gg: ASbGncvJaLNfovasJfIoF/t4si0Ev+2j9vth+VxD+N6kV+oOcjz3GBrrBV0EZMVS06k
	dvZPw5RhQej9414H3+LVciFaczRpejeyFyDCq3Ziou3/tq1U9Qgd/7MFbqSgvfMptAFRgTgWeDO
	f/19fDLHoGDZFqLKSvvzIy8YYyD/ePOSbqMK9ySqXq6uh1n/omCfji2graeyh+s0VyNQNSdIxws
	XWdZymo85iqu/V2YpEUH794FYCHmTGe/OEQ/ARJw/PtaVIym0pX2/Pc2+HSb5OvD5qGqDJIFNYC
	CQSsH5VvW0NBQ16Os6JAek8ZR7LxxsyJ1RXKoUnHuqfVRPN/1NXBB5ZOOWlO8+f/i6j7kHsK8A6
	Gu60zW7c=
X-Google-Smtp-Source: AGHT+IGTMhySvFIKwSkWciVZb8lELRF3nbSYJnKAx6xboIUomqUcgBH56UpRO0apylqo7r2SLhP6yw==
X-Received: by 2002:a05:6a21:6e4b:b0:226:c204:3c40 with SMTP id adf61e73a8af0-23003af63admr2908259637.5.1752137840711;
        Thu, 10 Jul 2025 01:57:20 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.195.230])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe52ecdcsm1522323a12.14.2025.07.10.01.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 01:57:20 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev
Subject: [PATCH v4 2/3] ACPI: scan: Add support for RISC-V in acpi_iommu_configure_id()
Date: Thu, 10 Jul 2025 14:26:56 +0530
Message-ID: <20250710085657.2844330-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250710085657.2844330-1-sunilvl@ventanamicro.com>
References: <20250710085657.2844330-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_015721_505280_8784E56D 
X-CRM114-Status: GOOD (  10.14  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Tomasz Jeznach <tjeznach@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Atish Kumar Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

acpi_iommu_configure_id() currently supports only IORT (ARM) and VIOT.
Add support for RISC-V as well.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/acpi/scan.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index fb1fe9f3b1a3..f022f32de8a4 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/acpi.h>
 #include <linux/acpi_iort.h>
+#include <linux/acpi_rimt.h>
 #include <linux/acpi_viot.h>
 #include <linux/iommu.h>
 #include <linux/signal.h>
@@ -1628,8 +1629,11 @@ static int acpi_iommu_configure_id(struct device *dev, const u32 *id_in)
 	}
 
 	err = iort_iommu_configure_id(dev, id_in);
+	if (err && err != -EPROBE_DEFER)
+		err = rimt_iommu_configure_id(dev, id_in);
 	if (err && err != -EPROBE_DEFER)
 		err = viot_iommu_configure(dev);
+
 	mutex_unlock(&iommu_probe_device_lock);
 
 	return err;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
