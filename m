Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17EF106FD9F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 08:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MymTXfW3WtE6nSUUc2rpzKhsV06xM7Xp6wvVD6wVin4=; b=do8VreyWsFAOtm
	bQBybuD7iq7TerjTDqawOVvy0D8bsPIz/HJH9YZdM6CBi1RTHTtoGfME1sej92TqAh4Hw6hqpYnd1
	hP9G7gEfjBvw+hUAYbPjYf0UksK8AuYyltT2MuUGRyoyLvVfk1f9onx8VRvoI32pWsXCsqymX6Zml
	+l3SXAQc7k9DZVpbqpb0DbepWMqYT0J0dDh75rj4FtjMnWwy18QBO0cKDcw2uq5WRw3UpRXOHyU/q
	DMdPHxqNiFTDhHLj5Gq+pK7YjZA2DIAme4i0KlaxgmwCbngTCyeE9U2gt6heumjsmTwgf0/7G4UgZ
	H1bWOUYTe6UqqAvR/+Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yAF-0000000HInC-2XHR;
	Fri, 13 Mar 2026 08:46:35 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yAE-0000000HImQ-0Hzr
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 08:46:35 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-899f5d337f7so24831516d6.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 01:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773391592; x=1773996392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjNcWwgkDEc/wZH33Xnfxi5l4V1B4L2jFZqML+Flhc0=;
        b=AR/WAUpqhAkAcvxpTtFzLGdXTopU0yHBfziHCrZinb9NORafAJ9Mb+FCVI98DVUxPy
         4dHrS5kZr5fP5eEvlgiFNCWetEayx7Ol6jzCx4rFtAyu7NasGcSjNM8rTroaJABuwqTJ
         8Nic82n6kechA3YRljuEF4ERe1vrPfsP9Sao/tH6oLUylUC3NSN+AqCoL4ilJQjpOpUs
         Xn3GIz7GhWMJJhoniuznuPGfKI6hsNYIYW6DklGk6ovMrpI6X5gFMCDC4nVZZngIUKFX
         ITZbwtimMS+s0gd7WVyoyudSdavt53A+JGcZ7vajXoGIlhsBgCaKRpFuYOY+Fo1aiYJo
         +GVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773391592; x=1773996392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mjNcWwgkDEc/wZH33Xnfxi5l4V1B4L2jFZqML+Flhc0=;
        b=a4y4uCjaAUUpDNYwwMTA3/70LpxmsEsJefuqeGq0VmJlL6/cO9Uxqj7E7tE00zbT8a
         ZyfLK1bAAnekxDB4LhchcDXaa/B1DUqxitII71IKWtXFw8HRLh5eG9Kf80PL8UvlPy68
         UzIbwyAl1y6Z4NTlLKiM8W4cEtOa7h8BfV39DF3FZ23l4FG/YPGUz1xCpjXPoxJIosTw
         xkTyVQqTBn+RXVWYJoFRFLFFqcpiz0HuxlSuGXKm69MRJZTEMvSVGdo5LeW6K7HCmPuA
         j25c3uiBABHAZHpVEEsbg+96JpsRoe8kaYxvSpTb+JOUzwjYguSJg0IBe8uNs8BabBoR
         8tCw==
X-Gm-Message-State: AOJu0YyN+sea78PWBoTk21grn12BstfnkPNJMrthn5JHj2y8JTS403yr
	dpqrdSmPgRNMsdJqgZXD7zqP2N92nqS3m7eXswkImbNrMdprhy66XNtHQmYKs7/c
X-Gm-Gg: ATEYQzwVpLDma9zXNlMWFSj5oCnZMUsqVMlgKDgpqfqewLWbFmGmpmGn9mRbO/Z91cZ
	hyQxIqvPogppySorwQkdOKys7JcJuLERViRfJyL3TSpiJKiA4yMVG+DejZ9apfaJIsboYUwo27l
	XXk1QuTllQqdQSnOA7vdrUr69P6dzHWeq/7oUD6N1KXel51mpnid/lXp+o/ufUCyMd6u16dtOHj
	tZKWEJ9RpkObZMFTBjt2RIXF+HARkE3ZSjZb6PYXgng/LoiUepDwg0AO60Kos+IjXPSj6LLOxDR
	5puHIobKBlhKEHiQaQzumiwkLE/UIkSJ7NgQApTdKrTB7OhbPPyw/u5o0Im+RAae7IdwyxqIJnj
	wTRBNe5mV9+w2zGRRfMLwejcRRzwySjtRw9vwo0Jy/BMK/I0XlOOWadqEhzJ8IL0Ld8GPQFm3rU
	Lk2mEGt8uNmPGdbG/pPR+uxZEI
X-Received: by 2002:a05:6214:262c:b0:899:a586:2923 with SMTP id 6a1803df08f44-89a81fd32c0mr35033836d6.28.1773391592387;
        Fri, 13 Mar 2026 01:46:32 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65beb131sm50142206d6.13.2026.03.13.01.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 01:46:31 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: linux-riscv@lists.infradead.org,
	samuel.holland@sifive.com,
	david@redhat.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	gaohan@iscas.ac.cn,
	me@ziyao.cc
Cc: lizhi2@eswincomputing.com,
	hal.feng@starfivetech.com,
	marcel@ziswiler.com,
	conor@kernel.org,
	kernel@esmil.dk,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 4/6] riscv: select RISCV_ISA_XPBMTUC in STARFIVE and ESWIN SoC
Date: Fri, 13 Mar 2026 01:44:05 -0700
Message-Id: <20260313084407.29669-5-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313084407.29669-1-ganboing@gmail.com>
References: <20260313084407.29669-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_014634_110019_2355D40E 
X-CRM114-Status: UNSURE (   8.11  )
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

Enable the XPbmtUC feature for Starfive and ESWIN SoC

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 arch/riscv/Kconfig.socs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index d621b85dd63bd..0584511707c7c 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -14,6 +14,7 @@ config ARCH_ANLOGIC
 
 config ARCH_ESWIN
 	bool "ESWIN SoCs"
+	select RISCV_ISA_XPBMTUC
 	help
 	  This enables support for ESWIN SoC platform hardware,
 	  including the ESWIN EIC7700 SoC.
@@ -56,6 +57,7 @@ config SOC_STARFIVE
 	select PINCTRL
 	select RESET_CONTROLLER
 	select ARM_AMBA
+	select RISCV_ISA_XPBMTUC
 	help
 	  This enables support for StarFive SoC platform hardware.
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
