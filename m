Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A405FC617D
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 09:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EGHjgXyyq6YIWBKMYxjy65LjStdWoV9FleW57qm92mw=; b=NANH3FhDt40gAv
	bC4o5AA2mfe+jZd6McY04OYkXSHtfCqFch3ZDIDl8REA4fRyhIs/5f95BSU7xTJzO8pAdw8u5/OLP
	TxhNneVHWSIr2szV/xRSLbPXIs8CJG3ZUQd82zwtCQt0VG/0h5e+CBQbGMJKgUmdl/iuV9cqeacgy
	QlgkKrcZQhUO/kKuGMoKdVwDT5mSj1RjP+sH+WQt6iUwgzNwohv1+4V27mscsmP8g+3ieKadWE8wM
	BXz24GahftsY+Nmr0LFNyyyTIoUhHFK0forfF97/NvE2baEjvHuj6yQFEjObp2dcmuJvqpBZVeu38
	vaHAoMszmRVhP5NMKSgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbyDG-00000009ABR-1gG2;
	Sat, 03 Jan 2026 09:46:22 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbyDC-00000009A8Z-42lw
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 09:46:21 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a081c163b0so115455265ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 03 Jan 2026 01:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767433578; x=1768038378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dP0IVTx42h14KuVE1/XaC/JEoSCL6PoSMoPSC6rOH4g=;
        b=cmy12xDJKXQitr4bT6pk96ayrHmCeztK7uuQFxpcjS5+FZnQDe8dY21ebrgg7iCPnu
         aYqpmsx95VwH9XfbfEl2zG4SSu2T/h1cGtyNOdXDBqa0w+uIEJW/0BEmFsMTjlgq2+45
         +A3vnJDJyVy9s0yxGzn6uT6H7ZZtwRFGUAwv9dz5nzcnCZLdGBHMuj/nFW7P5SqZKXyd
         zrSXKczEL07f4pvSnXoXii7cBh+eFnh+6f8ZdebyDrirC6chBNTCvDJaRTdweVXZzlMu
         r2Yd/3Gkn3zPAAcZLGbl/PZbmZqCzbVDhIWV4XhnVTaL2bDI29GytpLaJmptAmHXGdkz
         isOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767433578; x=1768038378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dP0IVTx42h14KuVE1/XaC/JEoSCL6PoSMoPSC6rOH4g=;
        b=voK6gwp8sFPBju33Scv4EJcpTsO89KwrMgqBL73oXtby+RA6uZOzvFMUUyxdHsARPu
         Xp4F52304ai2At6zby886nbkHK2ZBMRMRenyogtj5xaJ4SWWX2zNhpN6Hp/qTtdStiqo
         nrlWyA5Vc0VVw5PsU4qxYzwXl6wk5dQ9qIwPJvjYnZIt85yMJQEMvb2ntX/zXe1RsE1E
         UXuIO90cfpRdwD/LdIOqLFwpfBOBecedgtUSOFF3Jg9pVFdZK3Md4T9rRKi5C0BztqgQ
         5+xd/vSRQ6TUW6cYj8aHecBhia7m60R8a2tq5p0f7nc17yDK1JYYFZHZXdNLI5LX+A2+
         Kz0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWt2kAcU2Sr9XY6wj8D3/jfRpuSnKEy6V2cLyuXfW12Xf6ZOSAlC6jdzS7nB1KxmpaEjH8Y+NJ92KRlEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwM5pa2mHv2ClDYUDF3sf9V6+pGIZh+hzLB/Goi+TxQUYJw2/Ha
	zKp0CmlGHEpZwkbtDgHmyDp9X2ELudWdogBbGlFOIFE4q0QHap25pSkf
X-Gm-Gg: AY/fxX4bqVaHsI9SlQOaPu8wJx1qYxUOlYmG8T+eXLfBMlbjGuUMgH9fTSx0dbXrTaP
	sB8Z8NEO0Tn+XtqDpYw7Ku9gw0sWwztGDmaEkS7md+WVvvA8k/KCNrfnkCTwzINeGd04B8108rP
	PgW0PbGhMADEAwSFQQzSNCG2CjHuMAnr8r9vDAS5SI8MIFVKhkIIqFtFJ82hKO7QC9ngSrf8wob
	l57fuWd6g5PpHhlz6YBETA4NUZBvX2RsSugxettjWaNQm1V0VuBtOZPQqR8106z2pN9Ik8dAWMT
	588R/o4foEd0vTkk600UGWAAzApO2rv3fNgf55d7Zz8zCtUQYUqY1tzN3Sphae+PsZZt05h/yKP
	H/DMnIj9+MAU+AnXP4KOzyzRyK94rrVir0KYXzliYniDpzeKv34xW7kv+4jzsKG5CajVwfM3pVS
	DssQ2jDRZNGju1hMraSsZEcQ4Jq6irxffUxqiWGp9qgextUj+2ufg/qgMc/GqqFtBZ
X-Google-Smtp-Source: AGHT+IG1CFsdsCyqKZEWFTi8fQu6+83oYv/ThQFQjQRZsNEh4BZNCae/3IqB71uabmFWXjYrwHYsoQ==
X-Received: by 2002:a17:902:f68a:b0:295:99f0:6c66 with SMTP id d9443c01a7336-2a2f2836964mr436024535ad.36.1767433578268;
        Sat, 03 Jan 2026 01:46:18 -0800 (PST)
Received: from localhost.localdomain (123-48-16-240.area55c.commufa.jp. [123.48.16.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbdasm403124315ad.65.2026.01.03.01.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 01:46:17 -0800 (PST)
From: Naohiko Shimizu <naohiko.shimizu@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	atish.patra@linux.dev,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	nick.hu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Naohiko Shimizu <naohiko.shimizu@gmail.com>
Subject: [PATCH 3/3] riscv: suspend: Fix stimecmp update hazard on RV32
Date: Sat,  3 Jan 2026 18:45:01 +0900
Message-Id: <20260103094501.5625-4-naohiko.shimizu@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260103094501.5625-1-naohiko.shimizu@gmail.com>
References: <20260103094501.5625-1-naohiko.shimizu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_014619_043087_905EA03A 
X-CRM114-Status: UNSURE (   8.06  )
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

Signed-off-by: Naohiko Shimizu <naohiko.shimizu@gmail.com>
---
 arch/riscv/kernel/suspend.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index 24b3f57d467f..aff93090c4ef 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -51,10 +51,11 @@ void suspend_restore_csrs(struct suspend_context *context)
 
 #ifdef CONFIG_MMU
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SSTC)) {
-		csr_write(CSR_STIMECMP, context->stimecmp);
 #if __riscv_xlen < 64
+		csr_write(CSR_STIMECMP, ULONG_MAX);
 		csr_write(CSR_STIMECMPH, context->stimecmph);
 #endif
+		csr_write(CSR_STIMECMP, context->stimecmp);
 	}
 
 	csr_write(CSR_SATP, context->satp);
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
