Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C09CC54ED0
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 14:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DbBBTHTk5ErBVzKJDsGYHP5IBzsPB3+XYV+IYkFdW4k=; b=pbgX2k/GgspQnN
	+YjaPNDQgwl31aQ8Wu7yQDs0YL6lcPXUHAuTIyuYvMyNaWFPLIgQcjuue8ggyxNZuCxKQfS0RnWym
	ABQQ5djh2WktqqoaKFkiXRukmYXyAj76K3OaconyW33JEm2V5vXhNlIBdnoFq9lDv5P8BRNjn5k0h
	jr53+LKi9ypReI4fdNMSAa/NoO0O0Z+SNfjD19Eq/GlQFFs3CAQg3hcAuct+9SHLjdc6dFC22Jq10
	QWuhKmbwC2qcDbQHIuv+APQfEB2CCb3HP7Y37chIo0JkVZEw8qIHVvy/djuvq+sXpuBxhC++3lgv4
	2yysjv/g7ql3EStb3xag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI6vF-00000001Fcf-28hj;
	Thu, 22 May 2025 14:29:25 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI6gc-00000001DnM-1Xlj
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 14:14:19 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so59886445e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 07:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747923256; x=1748528056; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U/uSymK2KQolRGNG/Zro5bwOoIkGZ6ivjeaFlFxOB+M=;
        b=gCn2MBCq1xooNR2/biyKp5VgplWN9XnM0+86EC8paCg2tIjZ8CMFLcrWqlEVG9P6rd
         05docv3y/mJ2vlTNKY8OtxqodK+A8CetztXpn6oDe2jVs+k88cQNk54i5yKi4P9AXVE1
         YfJnegab6fdj/kjOeoHHOaWvsuE5eR+gNCzmHU0KvU526elHfrzVAUUxKBngIfRM3AOX
         k7kMTMeXrHFdtJBwFRBuKFyyNY/wavPYkmPm+b+gPsXrdGi2ZWvjVBMWZcvWmrG4v921
         xm/2MD8VTn4MvMs9ZGT/CPg/yDxg2XO8DJs7WITIbsZIy0dYjJkWnhzfuDhMVt0SvuqV
         mFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747923256; x=1748528056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/uSymK2KQolRGNG/Zro5bwOoIkGZ6ivjeaFlFxOB+M=;
        b=jnlEAoFUVrRVV+NfxBnVoS0oDiHoOCZI/m+T8M49SCu3fpg5WBgx2Ab3riVBwv4jO+
         RIEQqimjUobTElGz9RyhAdNPzWi4rTCm05Ox1PIg/2rB1kiYseZyiW69q5xXf08nFQIV
         Nut8Rs9t1CdG04C/Z9HrVc/BuFRUdgSicBj4gR0dOZ/+5HUdiM32swKAc0aZ7X8QOOg1
         ZHAgloHBOhrPQQqMnf7CwJDCMSne0p2kx6havEZl/wxzcH/WLt++l3ErDeE+Mh7vta16
         DhG9YLaAbTu2XspCOmMU1C33mVYZbaotl85hwNS/QDRlUcbICGOSyVmdutMkUDeaA4oW
         9wHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj7nejqtpcJ3WTVcz56i7gO1v+qXxzoCmX3opA0Wx+cHIeu/wtOIESR4UFoX6IXJHW3nDE3/KILgf1ww==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb0/DZIRrOTA0vtuITgWeDGgjlaExXerq1fSIRnB+X76zg2fdp
	f3sDIW8ueeKPp0qxaPWKfyTTsYm5AVU7RMKcMQUwn7/gHY+JXj6qOSiSKpvmDeBcg1U=
X-Gm-Gg: ASbGnctoqxidVcYcD9+40Y3Yf4DGB3JpdWXNJKbCnsqgIzVrGVprL+kZyyCY4LTugZQ
	aFMPvpXZC69i6nPOvH6ltm8DXomK3S63TvlnytqL/I8Sz7/HSTi2YbeiBdcPRzCoIs7/j4ORszi
	ap9uCiyXkAFmUMvFEUwCKMZRb4V3CBM7UDNOP4QxHd9dwxUvUbayOjBDujASidWnFI3y3Q8zzvl
	XKrGCKavYU4jfh4tUgHfUx6umjzgAG4CpoBBoHl2Tjbu69JFUq0J5+2DGxvarfJYWG8hpIU+TFL
	Ndk6NrBG45cAo1zE9ljSl/J9J4nUGf7mmrbVJiAUfeQUN4s3J5LWuDlqb5IivGeFalsdMq34Trr
	XN/XTLg==
X-Google-Smtp-Source: AGHT+IG0f08eYuSPxr3k77OUaqNYl8jJN0PAzE7LLLCfL4pu+eoqr3PWdm1MbbqN3+STTYtiLTQqeQ==
X-Received: by 2002:a05:6000:26d3:b0:3a4:7373:7147 with SMTP id ffacd0b85a97d-3a473737314mr6667933f8f.25.1747923255863;
        Thu, 22 May 2025 07:14:15 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3382:ef90:a754:c956:d8da:801c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8caaasm22910191f8f.83.2025.05.22.07.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:14:15 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] drivers: acpi: Fix platform profile driver on !acpi platforms
Date: Thu, 22 May 2025 16:13:56 +0200
Message-ID: <20250522141410.31315-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_071418_599920_0BC7B784 
X-CRM114-Status: GOOD (  13.02  )
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

The platform profile driver is loaded even on platforms that do not have
acpi enabled. The initialization of the sysfs entries was recently moved
from platform_profile_register() to the module init call, and those
entries need acpi_kobj to be initialized which is not the case when acpi
is disabled.

This results in the following warning:

 WARNING: CPU: 5 PID: 1 at fs/sysfs/group.c:131 internal_create_group+0xa22/0xdd8
 Modules linked in:
 CPU: 5 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W           6.15.0-rc7-dirty #6 PREEMPT
 Tainted: [W]=WARN
 Hardware name: riscv-virtio,qemu (DT)
 epc : internal_create_group+0xa22/0xdd8
  ra : internal_create_group+0xa22/0xdd8

 Call Trace:

 internal_create_group+0xa22/0xdd8
 sysfs_create_group+0x22/0x2e
 platform_profile_init+0x74/0xb2
 do_one_initcall+0x198/0xa9e
 kernel_init_freeable+0x6d8/0x780
 kernel_init+0x28/0x24c
 ret_from_fork+0xe/0x18

Fix this by checking if acpi is enabled before trying to create sysfs
entries.

Fixes: 77be5cacb2c2 ("ACPI: platform_profile: Create class for ACPI platform profile")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 drivers/acpi/platform_profile.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/acpi/platform_profile.c b/drivers/acpi/platform_profile.c
index ffbfd32f4cf1..b43f4459a4f6 100644
--- a/drivers/acpi/platform_profile.c
+++ b/drivers/acpi/platform_profile.c
@@ -688,6 +688,9 @@ static int __init platform_profile_init(void)
 {
 	int err;
 
+	if (acpi_disabled)
+		return -EOPNOTSUPP;
+
 	err = class_register(&platform_profile_class);
 	if (err)
 		return err;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
