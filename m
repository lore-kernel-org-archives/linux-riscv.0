Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5176BCA0EE9
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 05:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PBbJohqToIUXXpKMMZyFf+n1ZJ0a2PixDoxqIRXbxDg=; b=yMpctAbiXfd7ZB
	DC9+12XhRbCkuq8lHaNYyDqBWZJz/nyzE7P1DvwD/w/v1b4u8KhHTfsJ+ikMG3Hih3gEBwKqd8u+0
	b5aorZdpsbL13oGvmwkrYuDTq4Mst9CYtjDybjPD6F//Z1nHec2q26zASzlIkh70TJL0zROAHqwZH
	GoYD+H3RLuvnWt6sx3bw2AGpwBzLOR35H61tkrtN5Mv1ViKZXVDuyv53bjMmh9oN0cuSgOg6qyhLF
	cK9gKybJoy2+smiRPaDCvg3L1JtNpcjEM4P/0OJvQH35hg48Qh5gIeR4S7VLUrcI2Otk7z2pJGVyr
	UfFYqOt0T+upWBTapkTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unsTn-00000006Yhf-389u;
	Mon, 18 Aug 2025 05:32:23 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrwv-00000006Ve1-3Xy6
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 04:58:26 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-76e2ea887f6so2671237b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 21:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755493105; x=1756097905; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YaG3DvsXq5/AKyC1GLSjgb34PJp+nqhxTUl2VKU3MC8=;
        b=G19JdnFYftguCrpc8sQji4jXJlH2ty0XbxFH4FNFm6vAO1i6l2p8YpS1g6RejztbcZ
         44SSZG8tNb3K8Xi7hvXLicapMSMQKWFMMKv1YkZlrOXUyD9GRyHn/Ky8d/8/Ew9acrIs
         xsqHAjKHmlITq68tauIoCQeDZzA5f4Mqk8NptWcR2bhdrpY37NVQ9WwzgWtb7T3KBnF/
         fF9OpKshehrO9BTeIDF2BW8r1hfFbHUj5JcWkdH8JC4rBgor9iEX2lThx7uT8IYlAi/9
         5cSMwM4LXXYWghPg+02BfNvevzUP2N4/mHRX/VMAVz+OCJul+KfjPHSVlRIYj+DLhyca
         iKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755493105; x=1756097905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YaG3DvsXq5/AKyC1GLSjgb34PJp+nqhxTUl2VKU3MC8=;
        b=M/9+ON19mmz2istLNvV36rlDMJrG8ahPVikvTXlHHnqfCanPyjzGlLazaPVHnH5FiU
         epJ+id7TMh2DC7+ao/zerTXnQMAdMja2TTPklAx7ncfAco8Es5MRI/54FgjNyRTKxbF8
         IpI9brUTerJ9pPY0M5h116Zw5sj2O0Vx3lOQKePhZJeHigMUHcs+sTP8gh8rxVJFeWFi
         pJqnfYQUFvMpFMmKayA4AJpZvk5bNpozttN64OaVPUbQq5s2KHfYSLM8hUotDTLyfl/x
         A5bBjwPMnmxsd+DqODH2LgKZaqzDdpBH/Fs6jrBrsXpLeGcu992I4FQA6WIY53rV7Hhw
         MH0A==
X-Forwarded-Encrypted: i=1; AJvYcCX5SCw9nkyT4MTYYXyzJ2tR0H5qNBM9Tn26UEXR6cMD1lgjckLa2jioT8dpKSx5mtukD35ulJMq3BG+PA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJXn15zfLht5khOQersdR2pECiIH2N1AhnrMF+AgFM6M641HUL
	pK1GRzCsiIDDGKOpSTIkPpPymJF9R8H1l8yEnh54qDV8L+0ccuZQr2FLrCLfGKW6Pjk=
X-Gm-Gg: ASbGncvMoMrqGWNOmCAlUxjpaBuyZj4yQcZVxByXJpit//bn7UvMx37EUPhnie4LZb1
	QhjBozr+uLuMQ30R9KBy9gXLMUAUx3Cjq3IkgZKGcv+TUsVoPxmm/7G3YoVD54AhagOomjIkg7Y
	f0P+v5bGo+Nq4sP/3Rr9qHX8a8xqGSFk+PW7KnGqrTGun6aapOSBIYV8VlZLffZxfV08khUudih
	XH9mL3rpXqBizOHTFScvX3FuevPiYbBXS1F7meUqvmVo/iocA1s3sFkGv/D9B8SqAswXaieZXd3
	i03LqS6rbDI1WVIk0K4sew6YPnjJ5CVTN5MPp8ZCPXx4GylaO+TItaO3eZiRBo62NuN1AH+O0hZ
	n0EdPHsUAZR73gAT1QoG4RIkL0jzgBYpgqzK5wZYt
X-Google-Smtp-Source: AGHT+IEemk+BWiEUx5FojBtceZEGdoOXlJtGCjztrL0+XbJGAKrKEJt4aBwM+DlqJqMugoECLw6zgA==
X-Received: by 2002:a05:6a20:5493:b0:22b:8f7f:5cb2 with SMTP id adf61e73a8af0-240d2dec932mr14433397637.8.1755493105211;
        Sun, 17 Aug 2025 21:58:25 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.199.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e4528c264sm6124047b3a.43.2025.08.17.21.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:58:24 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev
Subject: [PATCH v6 2/3] ACPI: scan: Add support for RISC-V in acpi_iommu_configure_id()
Date: Mon, 18 Aug 2025 10:28:06 +0530
Message-ID: <20250818045807.763922-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818045807.763922-1-sunilvl@ventanamicro.com>
References: <20250818045807.763922-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_215825_891890_8A9E512E 
X-CRM114-Status: UNSURE (   9.77  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
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
