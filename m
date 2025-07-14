Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D78C83F24
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 06:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sBuwfufaFOzLBKdvZfuB0V2XMIUkbrJ/WAXK/JBoy/0=; b=3dKaEepNrvPrO8
	Tbm06/C+v8L+fdBJw15g+1pnCxZlv+qV5Z+z9qdn997mgRGN8P7J5bLA+ExrhJBne/0mKRUeCwvrQ
	us257mmUWWgVaGktg8JAboN0FGhXsQ67TNNN3DCo/h1+7mNTFSedgta9VlHnr4p89a8Kznd2JtJYn
	8/HYzGrJe1cmLXdNuojov+iSOBlvnBncZhYnR88/KwWNN7yde/BV/TZ1uyVi5fJtZ18ePEaytuAiv
	Q+PAgudeOHGr2bPEfP6l7PurWC74sH56s7fsztletZeZbNpPDNCOSmgFqKmvzQvbtJvAO4nOkDFtg
	5eZT1zQ5J0E/VKUkV0dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCid-00000001M2U-3xHS;
	Mon, 14 Jul 2025 06:31:19 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCOy-00000001IKt-1BrS
	for linux-riscv@lists.infradead.org;
	Mon, 14 Jul 2025 06:11:01 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-455ea9cb0beso19064175e9.0
        for <linux-riscv@lists.infradead.org>; Sun, 13 Jul 2025 23:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752473458; x=1753078258; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dSes2g4E88oXBSFPDQ6neF7W89c9NwaUqwVhdR4xBqI=;
        b=p83TZ5yelZmEOLaqnWsPDS764aalSazNYIIzJbpk/Oa1+Q39MmdM3WrGT+1mKrvOoC
         uZ5cKJ9EZWxY10mctZttaFwizQrEd0A47tz/qJFXiUJKVxy9qXAwdrHggiuUYLPJ+3ar
         +3SagJiEvCjCzfkEMq9VFw/zC1RExpuixAkZq/SwD5troBtfyhWfOR/SGzcRIHkoAP3G
         OtW4Cj9C7X75FiybpQb1mQb5DSZZFCRw3QvNML3GnJkE9eykVxvv9NLw1/edVIPA2E6B
         ra+DGPjRcyZLiOus9IDrETWG5z/wVYYKupjncQQGTDBpm02QquBPgUt/TmyakX1LybjS
         JURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752473458; x=1753078258;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSes2g4E88oXBSFPDQ6neF7W89c9NwaUqwVhdR4xBqI=;
        b=nsJ6OSAVT+Rpa4Bv3cNchdAguyGmMIGON4JWjwvr5Kt0s1x0Z8FoYCyrQ844dllLYX
         0sF3601xGzBFOFm6bgTpZZayI1iFFinb68R5BOwP6mch/jzxt3jQ5mn0kaMmS1ARUsO+
         VSJSO9LPaQBowCX4bNgXo2iK5sdKrllBIqPy61AMN1weBdbQ9ylzUQaK/nsCGB6b9tE2
         u9fRZG2UYWtZgWWkkiTmgPQJ6q3ldutoCnjjeAiwuaRh+NjY5TKau+5agEX/BkrXQa1q
         7rqoBlJkOYdf972f+id62EkjLAJh0v5IzwywyPtV9z10ZLE+ozr45hp8PqueVxCXV4NY
         PXVw==
X-Forwarded-Encrypted: i=1; AJvYcCU7cw79XlAyU2V5gTz8izUvx/OLmzzfe6I3kTWk7rkwm8Ol8RWXSV8GAu8xmkAcJd4TacsCTs+ZzOEeJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6cLrga37AZIVVircm9080taqlWMKKUwUds6bia3r5uuu6zMI1
	G0RrjajmU2n4ZutnRet5CSoG+OWqvJuMI0C1Bs+/T4xQN5Hd8ejmUPrB9pc7YyYH/WFll3qYcw=
	=
X-Google-Smtp-Source: AGHT+IFULlVjyNemOnSbG4TdMozAA0zsJZsF8hZ5FwjjrDDzQ4zhxHet1bEj5zD9JLh9WJDb+7sgf2zL
X-Received: from wmbel18.prod.google.com ([2002:a05:600c:3e12:b0:456:1194:a7e7])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:358f:b0:456:7cf:527a
 with SMTP id 5b1f17b1804b1-45607cf57cbmr50279335e9.28.1752473458182; Sun, 13
 Jul 2025 23:10:58 -0700 (PDT)
Date: Mon, 14 Jul 2025 08:08:45 +0200
In-Reply-To: <20250714060843.4029171-5-ardb+git@google.com>
Mime-Version: 1.0
References: <20250714060843.4029171-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4119; i=ardb@kernel.org;
 h=from:subject; bh=1185/TpkpWg9isRLFf5wyjQebHCYqV40b1OjCDnfhjU=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIaNk3pfgGfFHvMs1rzs+7g2Z3jR3vmPyZLljMXN3nZu4o
 j/3A2d6RykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZhI9XmGf+YT5LnE2xivqL3c
 nC3HM8NQY4PQY8/mbbM+RMQ4nbzY8JqRYeV6Hz0bozMrpnLtY7c4Y8N90k7s2BaRs7se9l/3u/z 3DAMA
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714060843.4029171-6-ardb+git@google.com>
Subject: [RFC PATCH 1/3] efi-rtc: Remove wakeup functionality
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_231100_317636_82C00337 
X-CRM114-Status: GOOD (  14.50  )
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

The EFI rtc driver is used by non-x86 architectures only, and exposes
the get/set wakeup time functionality provided by the underlying
platform. This is usually broken on most platforms, and not widely used
to begin with [if at all], so let's just remove it.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/rtc/rtc-efi.c | 76 +-------------------
 1 file changed, 2 insertions(+), 74 deletions(-)

diff --git a/drivers/rtc/rtc-efi.c b/drivers/rtc/rtc-efi.c
index fa8bf82df948..b4f44999ef0f 100644
--- a/drivers/rtc/rtc-efi.c
+++ b/drivers/rtc/rtc-efi.c
@@ -112,48 +112,6 @@ convert_from_efi_time(efi_time_t *eft, struct rtc_time *wtime)
 	return true;
 }
 
-static int efi_read_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
-{
-	efi_time_t eft;
-	efi_status_t status;
-
-	/*
-	 * As of EFI v1.10, this call always returns an unsupported status
-	 */
-	status = efi.get_wakeup_time((efi_bool_t *)&wkalrm->enabled,
-				     (efi_bool_t *)&wkalrm->pending, &eft);
-
-	if (status != EFI_SUCCESS)
-		return -EINVAL;
-
-	if (!convert_from_efi_time(&eft, &wkalrm->time))
-		return -EIO;
-
-	return rtc_valid_tm(&wkalrm->time);
-}
-
-static int efi_set_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
-{
-	efi_time_t eft;
-	efi_status_t status;
-
-	convert_to_efi_time(&wkalrm->time, &eft);
-
-	/*
-	 * XXX Fixme:
-	 * As of EFI 0.92 with the firmware I have on my
-	 * machine this call does not seem to work quite
-	 * right
-	 *
-	 * As of v1.10, this call always returns an unsupported status
-	 */
-	status = efi.set_wakeup_time((efi_bool_t)wkalrm->enabled, &eft);
-
-	dev_warn(dev, "write status is %d\n", (int)status);
-
-	return status == EFI_SUCCESS ? 0 : -EINVAL;
-}
-
 static int efi_read_time(struct device *dev, struct rtc_time *tm)
 {
 	efi_status_t status;
@@ -188,17 +146,13 @@ static int efi_set_time(struct device *dev, struct rtc_time *tm)
 
 static int efi_procfs(struct device *dev, struct seq_file *seq)
 {
-	efi_time_t        eft, alm;
+	efi_time_t        eft;
 	efi_time_cap_t    cap;
-	efi_bool_t        enabled, pending;
-	struct rtc_device *rtc = dev_get_drvdata(dev);
 
 	memset(&eft, 0, sizeof(eft));
-	memset(&alm, 0, sizeof(alm));
 	memset(&cap, 0, sizeof(cap));
 
 	efi.get_time(&eft, &cap);
-	efi.get_wakeup_time(&enabled, &pending, &alm);
 
 	seq_printf(seq,
 		   "Time\t\t: %u:%u:%u.%09u\n"
@@ -214,26 +168,6 @@ static int efi_procfs(struct device *dev, struct seq_file *seq)
 		/* XXX fixme: convert to string? */
 		seq_printf(seq, "Timezone\t: %u\n", eft.timezone);
 
-	if (test_bit(RTC_FEATURE_ALARM, rtc->features)) {
-		seq_printf(seq,
-			   "Alarm Time\t: %u:%u:%u.%09u\n"
-			   "Alarm Date\t: %u-%u-%u\n"
-			   "Alarm Daylight\t: %u\n"
-			   "Enabled\t\t: %s\n"
-			   "Pending\t\t: %s\n",
-			   alm.hour, alm.minute, alm.second, alm.nanosecond,
-			   alm.year, alm.month, alm.day,
-			   alm.daylight,
-			   enabled == 1 ? "yes" : "no",
-			   pending == 1 ? "yes" : "no");
-
-		if (alm.timezone == EFI_UNSPECIFIED_TIMEZONE)
-			seq_puts(seq, "Timezone\t: unspecified\n");
-		else
-			/* XXX fixme: convert to string? */
-			seq_printf(seq, "Timezone\t: %u\n", alm.timezone);
-	}
-
 	/*
 	 * now prints the capabilities
 	 */
@@ -249,8 +183,6 @@ static int efi_procfs(struct device *dev, struct seq_file *seq)
 static const struct rtc_class_ops efi_rtc_ops = {
 	.read_time	= efi_read_time,
 	.set_time	= efi_set_time,
-	.read_alarm	= efi_read_alarm,
-	.set_alarm	= efi_set_alarm,
 	.proc		= efi_procfs,
 };
 
@@ -271,11 +203,7 @@ static int __init efi_rtc_probe(struct platform_device *dev)
 	platform_set_drvdata(dev, rtc);
 
 	rtc->ops = &efi_rtc_ops;
-	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
-	if (efi_rt_services_supported(EFI_RT_SUPPORTED_WAKEUP_SERVICES))
-		set_bit(RTC_FEATURE_ALARM_WAKEUP_ONLY, rtc->features);
-	else
-		clear_bit(RTC_FEATURE_ALARM, rtc->features);
+	clear_bit(RTC_FEATURE_ALARM, rtc->features);
 
 	device_init_wakeup(&dev->dev, true);
 
-- 
2.50.0.727.gbf7dc18ff4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
