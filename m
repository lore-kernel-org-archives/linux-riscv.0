Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECD6C83F17
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 06:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WxSKDfZXlrAY0419X/MwWMeo94osGmSWR6Xcnx4b3JA=; b=rFQmAeejMcDePB
	TOr4JbnyvpniabUah/C0Hv/RZsstke8jQJCtxrz3ANx+zOmsz1++4BS+YhMj/UDPYueqt1i3IZNdg
	wzbARnsuyns/Mm2HfS0BwjHwggjarVXTZj8GVK6kIcgbadYM30xSNTjoXkgczI1SQxDi+XWCv324t
	Mik6rXv9LXtiFhfGa4OmSQEtqLe04CXDIBCEfWQkapOpq6uCMwGVR3rDsQoolJvUTC9aIGlg+WGeF
	BdPsU9agJ/r2rw5zDZpB9mqX+Yhe+Qb8/ZeyLWq44uomrwdseOVHENDhjdC3hSWSw+x+1MJB4Cmm3
	ziHpD7eaQwNuMj/lyS2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCie-00000001M2a-2IVT;
	Mon, 14 Jul 2025 06:31:20 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCP0-00000001ILZ-1mak
	for linux-riscv@lists.infradead.org;
	Mon, 14 Jul 2025 06:11:03 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3af3c860ed7so1701716f8f.1
        for <linux-riscv@lists.infradead.org>; Sun, 13 Jul 2025 23:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752473460; x=1753078260; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DAtRoMW47q6eWngfmkGzhbl2Om3dflePIieHts+FOBI=;
        b=qke6VoXyGwndbgcARfWPpfbO/f5PXZlN4S7cBAHPXMR1n7KV/K3AIJLs9rstnTAaR7
         9uqhvyblVFbi+V+wr8D/luh7TacuweY2MA5fFyFGtIQbLFCGkBcA9jaz3LCMnGLZAA4d
         LIRgJyigqGOxW51wzmZt4/qZMzjc/vtw5t1mrRoJ7+w/6J13Ir3XoHf5v0NcnaYo6Q+O
         ujAePWybFJMpz+lfDjaaOU22Y2fRFx6aXHzjbwOoBpf1zmebm3zH5YQIp/mIfwf6mTfo
         oormvT5FnnLTYTF4RVkqdudhXcuNrCxuRYthDAP7xKqrtnGPcOMY5h0i7zYZ9vOuxExv
         Zh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752473460; x=1753078260;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DAtRoMW47q6eWngfmkGzhbl2Om3dflePIieHts+FOBI=;
        b=O9rwxJWmB+E2SKZQQXds+lkGBrKE3ELMGgl75pbKOhySzieN+SpNVmbNEnD/zRLQLt
         L80B9QbrMOT5Qj3Riz0dMbrhvRvwZZybK/5+d1y954A4tznWyRElfD3prpmlUqUR+dvy
         yjuixJsplAJPqG5v9+K58U+0fWUcq9Cfa1yfhnHqX1giMmuDSF/XumQs/Zi1v2O1X8U9
         OzFgHuiS2pG+mnJA1lz0Kve0uCLa2s5yYEA7Xw2annanxRh6A/QzSYYaSYIs4A2EJU/F
         lqW6hMHfMJhgwbbt/eZYiF1Yr4F1J7vNQP49LG9NGT2ris58rjQZmtr4HHvI9jUroOsO
         h/cw==
X-Forwarded-Encrypted: i=1; AJvYcCVPn/y8iGs5sxSrVFWpmE/a/1Fc95u2eWznw4sNxyWX96E5pGy9RNrJWuRgjw+hpNhmm4M290K0Fy8RKw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzE34AROc5fPucBNNtQAXKl2F221LbmXplKvzfhtgTHJDSF7Wc6
	nvYqgu0R601zTZjpH/luWrLZFHI9f/q6XvUonWeQXs9LJEPUV1u+GQf17aZzMrcDK8wnKo0lvg=
	=
X-Google-Smtp-Source: AGHT+IFsCLtHJL4bZduQByJdBWFSePt0ZVoqPC5acNqYECl/7QLB3y/VpTPIitmJ3C2pFikEet6/1z+u
X-Received: from wmbay17.prod.google.com ([2002:a05:600c:1e11:b0:450:cd94:c302])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:240a:b0:3a5:8a68:b839
 with SMTP id ffacd0b85a97d-3b5f2e26c14mr9849725f8f.45.1752473460616; Sun, 13
 Jul 2025 23:11:00 -0700 (PDT)
Date: Mon, 14 Jul 2025 08:08:46 +0200
In-Reply-To: <20250714060843.4029171-5-ardb+git@google.com>
Mime-Version: 1.0
References: <20250714060843.4029171-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5138; i=ardb@kernel.org;
 h=from:subject; bh=ntdr4EjVjZJfnyc3XZ20vyNdLzsBSSjtiozuNHpTjes=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIaNk3s+Lmbqczj0rvAVfRxbEdM6a85TrRHj8D0lpvTzZ/
 Fdaq652lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIk4VjL8T33FvUb59jozdqnm
 q/uqv/H1Tplbn7TcdSZ/lf6yLc3mAgz/jPUOZcXfVexgUWyuFC302nb67J1Gr/K2qWeKJ0eZ/2j hBwA=
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714060843.4029171-7-ardb+git@google.com>
Subject: [RFC PATCH 2/3] efi/test: Don't bother pseudo-testing unused EFI services
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_231102_470219_46BC8663 
X-CRM114-Status: GOOD (  12.44  )
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
Cc: Juergen Gross <jgross@suse.com>, linux-rtc@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Stefano Stabellini <sstabellini@kernel.org>, linux-efi@vger.kernel.org, x86@kernel.org, Bibo Mao <maobibo@loongson.cn>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, xen-devel@lists.xenproject.org, Feng Tang <feng.tang@linux.alibaba.com>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Ard Biesheuvel <ardb@kernel.org>

The EFI test module covers the get/set wakeup time EFI runtime
services, as well as GetNextHighMonoCount(). In both cases, though, it
just mindlessly exercises the API, without any functional testing.

In case of the get/set wakeup time services, this would involve setting
the wakeup time, and subsequently checking whether the system actually
wakes up at the configured time, which is difficult for obvious reasons.

In case of GetNextHighMonoCount(), this would involve performing some
kind of verification that the returned number increases monotonically
across reboots.

Given that these APIs are not used in Linux to begin with, let's not
pretend that testing them in this manner has any value, and just drop
these tests entirely, so that we can drop the APIs themselves from the
Linux EFI runtime layer.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/test/efi_test.c | 108 +-------------------
 1 file changed, 2 insertions(+), 106 deletions(-)

diff --git a/drivers/firmware/efi/test/efi_test.c b/drivers/firmware/efi/test/efi_test.c
index 77b5f7ac3e20..bb2ace902346 100644
--- a/drivers/firmware/efi/test/efi_test.c
+++ b/drivers/firmware/efi/test/efi_test.c
@@ -333,77 +333,6 @@ static long efi_runtime_set_time(unsigned long arg)
 	return status == EFI_SUCCESS ? 0 : -EINVAL;
 }
 
-static long efi_runtime_get_waketime(unsigned long arg)
-{
-	struct efi_getwakeuptime __user *getwakeuptime_user;
-	struct efi_getwakeuptime getwakeuptime;
-	efi_bool_t enabled, pending;
-	efi_status_t status;
-	efi_time_t efi_time;
-
-	getwakeuptime_user = (struct efi_getwakeuptime __user *)arg;
-	if (copy_from_user(&getwakeuptime, getwakeuptime_user,
-				sizeof(getwakeuptime)))
-		return -EFAULT;
-
-	status = efi.get_wakeup_time(
-		getwakeuptime.enabled ? (efi_bool_t *)&enabled : NULL,
-		getwakeuptime.pending ? (efi_bool_t *)&pending : NULL,
-		getwakeuptime.time ? &efi_time : NULL);
-
-	if (put_user(status, getwakeuptime.status))
-		return -EFAULT;
-
-	if (status != EFI_SUCCESS)
-		return -EINVAL;
-
-	if (getwakeuptime.enabled && put_user(enabled,
-						getwakeuptime.enabled))
-		return -EFAULT;
-
-	if (getwakeuptime.pending && put_user(pending,
-						getwakeuptime.pending))
-		return -EFAULT;
-
-	if (getwakeuptime.time) {
-		if (copy_to_user(getwakeuptime.time, &efi_time,
-				sizeof(efi_time_t)))
-			return -EFAULT;
-	}
-
-	return 0;
-}
-
-static long efi_runtime_set_waketime(unsigned long arg)
-{
-	struct efi_setwakeuptime __user *setwakeuptime_user;
-	struct efi_setwakeuptime setwakeuptime;
-	efi_bool_t enabled;
-	efi_status_t status;
-	efi_time_t efi_time;
-
-	setwakeuptime_user = (struct efi_setwakeuptime __user *)arg;
-
-	if (copy_from_user(&setwakeuptime, setwakeuptime_user,
-				sizeof(setwakeuptime)))
-		return -EFAULT;
-
-	enabled = setwakeuptime.enabled;
-	if (setwakeuptime.time) {
-		if (copy_from_user(&efi_time, setwakeuptime.time,
-					sizeof(efi_time_t)))
-			return -EFAULT;
-
-		status = efi.set_wakeup_time(enabled, &efi_time);
-	} else
-		status = efi.set_wakeup_time(enabled, NULL);
-
-	if (put_user(status, setwakeuptime.status))
-		return -EFAULT;
-
-	return status == EFI_SUCCESS ? 0 : -EINVAL;
-}
-
 static long efi_runtime_get_nextvariablename(unsigned long arg)
 {
 	struct efi_getnextvariablename __user *getnextvariablename_user;
@@ -505,37 +434,6 @@ static long efi_runtime_get_nextvariablename(unsigned long arg)
 	return rv;
 }
 
-static long efi_runtime_get_nexthighmonocount(unsigned long arg)
-{
-	struct efi_getnexthighmonotoniccount __user *getnexthighmonocount_user;
-	struct efi_getnexthighmonotoniccount getnexthighmonocount;
-	efi_status_t status;
-	u32 count;
-
-	getnexthighmonocount_user = (struct
-			efi_getnexthighmonotoniccount __user *)arg;
-
-	if (copy_from_user(&getnexthighmonocount,
-			   getnexthighmonocount_user,
-			   sizeof(getnexthighmonocount)))
-		return -EFAULT;
-
-	status = efi.get_next_high_mono_count(
-		getnexthighmonocount.high_count ? &count : NULL);
-
-	if (put_user(status, getnexthighmonocount.status))
-		return -EFAULT;
-
-	if (status != EFI_SUCCESS)
-		return -EINVAL;
-
-	if (getnexthighmonocount.high_count &&
-	    put_user(count, getnexthighmonocount.high_count))
-		return -EFAULT;
-
-	return 0;
-}
-
 static long efi_runtime_reset_system(unsigned long arg)
 {
 	struct efi_resetsystem __user *resetsystem_user;
@@ -697,16 +595,14 @@ static long efi_test_ioctl(struct file *file, unsigned int cmd,
 		return efi_runtime_set_time(arg);
 
 	case EFI_RUNTIME_GET_WAKETIME:
-		return efi_runtime_get_waketime(arg);
-
 	case EFI_RUNTIME_SET_WAKETIME:
-		return efi_runtime_set_waketime(arg);
+		return -EINVAL;
 
 	case EFI_RUNTIME_GET_NEXTVARIABLENAME:
 		return efi_runtime_get_nextvariablename(arg);
 
 	case EFI_RUNTIME_GET_NEXTHIGHMONOTONICCOUNT:
-		return efi_runtime_get_nexthighmonocount(arg);
+		return -EINVAL;
 
 	case EFI_RUNTIME_QUERY_VARIABLEINFO:
 		return efi_runtime_query_variableinfo(arg);
-- 
2.50.0.727.gbf7dc18ff4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
