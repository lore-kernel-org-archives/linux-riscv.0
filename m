Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F218AE7D0BF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 01:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E09lckMtOcZFDL+rp5IAtOXlLBjIaGKY5LkZbKKFBcI=; b=xZE/b5a1oR7/Fr
	ZlPqvCRj7yXMpwCw5Q7BeEW0FcJfFYEhyXCpRY8NEwiAG5WUfCizzJX5a9G75O6rAwr20/kL9H2CL
	2J7sm2B9vxxd12Ki+Rd2bFIag8lXF01Jjzhkm9vbLeRvX7Wwp7E0kCrorTe/DLifhMkuWdcyvHlTI
	JhjLk3haxSNMsiNymNFMcwypbpf6UeiALYM5rosNENzXLF++K9xlREMVrDWrtz9VgZ6AKX2Fd7zFo
	WZ1fzGyQLDDI9MXRv0CMwUQCsOR1WTPiGekHbQkl0z1OQ+NUUta5ioDBLX2S26NZJv/2mhjfPxH6M
	i/+96eFhnx+csZTZAphQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjVK8-007aay-05;
	Fri, 22 Sep 2023 01:51:16 +0000
Received: from mail-vs1-f50.google.com ([209.85.217.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjVK3-007aXw-35
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 01:51:13 +0000
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4527d7f7305so818585137.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Sep 2023 18:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695347470; x=1695952270; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ixTqiGVx8ZXpjpR7y6lRGGFsz7OZ+ET+MZdQ4NUAsFY=;
        b=yYvZaoxx1/cwio9uoWvbJDNVkdnjH8YuPJm+4k6NpWswn5bx1ccnbbxhwmQRGkGHDC
         5c9fCckplG52ep8b5ng6mPMiGhndZXQ74mh0CAi29ZDElaiHj0YvMpeHUgY1i7syul2q
         MT+Ke8fin7Em6uGNYwD8NsfJgfEj2t5DgFW9TWXqnUNYLGTIu81eYXG6GnVzeMEDk/rU
         n9zGHaUQVzudhCIBRHh96l6HMfu4vvPrjOjsj5m5wqjhdr+ZIrXhNm5ugQb+Cclw+6iL
         TLNVK9cTelck0F8HwpfKWuvnNS/2alZiSZy5g3eqXibUZScklJyHOkyyUvm3rlKBhadG
         pRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695347470; x=1695952270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ixTqiGVx8ZXpjpR7y6lRGGFsz7OZ+ET+MZdQ4NUAsFY=;
        b=e1gfc1qVsuei2QJa9u2R6RPA5GOzvMffmNkxufcKWF98angoqGw7JgVVWqR97Tek+Z
         DjIQ09h2QZvpUMSUuJgrAcer63Y8XgKrjLYJnQf62iIUJCQtXfy/TR7nzSgNTSnnUHQR
         1c2AL1Cw9W0LP5L2birLrUlbQmzOI2YUkcYV4FPra04x4Qp54uA6XrOdAEw9wwUWfQU7
         O9rloiD9N+DSt6qibeWp9E4XSRkj+/knl9xbmERU/eAT6R+0ImmwCNGQNbLM7bD2G7AK
         fW/NifiD6WAZtkhRQ1/UYrAeEnanf/NvSs+iUUyjPX+f6LZjfUeKsS1w35PKYQYiMnDQ
         AHVQ==
X-Gm-Message-State: AOJu0YzTEARVUdViSIxV5lAFl58Xoe7oySIsNvfFD6bfdtRY6IDeIHkh
	aVtzxV7cS5Eca46tNvc92lAWpA==
X-Google-Smtp-Source: AGHT+IHj0Lr/Be8FAt3qA85CiKz6e+2ivU8VOj029IZto83YwRL3xxqYZvq42aLws+pyGjAy7HTN1A==
X-Received: by 2002:a05:6102:302c:b0:44d:4d5f:79a4 with SMTP id v12-20020a056102302c00b0044d4d5f79a4mr6139892vsa.20.1695347470206;
        Thu, 21 Sep 2023 18:51:10 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:fa26:6227:be1c:67f0])
        by smtp.gmail.com with ESMTPSA id y10-20020a63b50a000000b0057412d84d25sm1973856pge.4.2023.09.21.18.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 18:51:09 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Thu, 21 Sep 2023 18:49:49 -0700
Subject: [PATCH 2/6] mmc: sdhci: add __sdhci_execute_tuning() to header
MIME-Version: 1.0
Message-Id: <20230921-th1520-mmc-v1-2-49f76c274fb3@baylibre.com>
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
In-Reply-To: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695347467; l=1797;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=jbhsItAspw9Y505sHjMPZkocmfoBMXCEAbwf8HhAE8A=;
 b=Y7zI2YH3NQD0FaxiSQ4VnQS2RFqoHRb3cydOhAc2I8kHbSV81T3H1sj3MdzwctHhwtJlv39EH
 CGD7yjz/YJWDePGxpJZ2guSYNA4iKk5mDzTqvA3yDNkTUQHmVRbKFIQ
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_185112_002745_C954FBA9 
X-CRM114-Status: GOOD (  11.83  )
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
Cc: devicetree@vger.kernel.org, Drew Fustini <dfustini@baylibre.com>, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, Jason Kridner <jkridner@beagleboard.org>, Xi Ruoyao <xry111@xry111.site>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Expose __sdhci_execute_tuning() so that it can be called from the
mmc host controller drivers.

In the sdhci-of-dwcmshc driver, sdhci_dwcmshc_th1520_ops sets
platform_execute_tuning to th1520_execute_tuning(). That function has
to manipulate phy registers before tuning can be performed. To avoid
copying the code verbatim from __sdhci_execute_tuning() into
th1520_execute_tuning(), make it possible for __sdhci_execute_tuning()
to be called from sdhci-of-dwcmshc.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 drivers/mmc/host/sdhci.c | 2 +-
 drivers/mmc/host/sdhci.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index ff41aa56564e..fd607058d176 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -2841,7 +2841,7 @@ void sdhci_send_tuning(struct sdhci_host *host, u32 opcode)
 }
 EXPORT_SYMBOL_GPL(sdhci_send_tuning);
 
-static int __sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
+int __sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
 {
 	int i;
 
diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
index f219bdea8f28..a20864fc0641 100644
--- a/drivers/mmc/host/sdhci.h
+++ b/drivers/mmc/host/sdhci.h
@@ -793,6 +793,7 @@ void sdhci_set_bus_width(struct sdhci_host *host, int width);
 void sdhci_reset(struct sdhci_host *host, u8 mask);
 void sdhci_set_uhs_signaling(struct sdhci_host *host, unsigned timing);
 int sdhci_execute_tuning(struct mmc_host *mmc, u32 opcode);
+int __sdhci_execute_tuning(struct sdhci_host *host, u32 opcode);
 void sdhci_set_ios(struct mmc_host *mmc, struct mmc_ios *ios);
 int sdhci_start_signal_voltage_switch(struct mmc_host *mmc,
 				      struct mmc_ios *ios);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
