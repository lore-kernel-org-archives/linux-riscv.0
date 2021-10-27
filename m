Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20E11C43219
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 21:18:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E54A6610FC
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 21:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E54A6610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pK+4EBAa0SXOutsm8WJ+m6BjV0BZmyVmIa9nKTXDcPQ=; b=iSrgrd8kE6Nfot
	8b/wsHDAMNGDV+mypQunBwJ8PYM8FqIsiWjBvIL/w7L76RclD1JyfEnZTZ31Xbp4JzH9cIGumx0fR
	G0rfNtp9k5bFF/lbJJEgVmrYgyzHP8sxkspMAubWvxkn7b+SXEj+OjbtvV/i/mVl/KQGle/9SVyL9
	2pG3t5O7Jj4vkKkv78iOoSHdFelE6GcfyctzV2fbXwaSUdMVLeyUK8C1wqLpgQSsZ9w00Q8v5OqqG
	SofMJ0asVpBNROkiGv4NAmtwSo6xv1wjlIiUhRA091WvqKTbwMWq6EiJxJYJxlPcLpATiz6q+Capk
	hFqXbcLXd8794O3VG8iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfqJW-006Ad3-5t; Wed, 27 Oct 2021 21:18:26 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfqJC-006AKm-Aq; Wed, 27 Oct 2021 21:18:08 +0000
Received: by mail-lj1-x229.google.com with SMTP id 17so3837660ljq.0;
 Wed, 27 Oct 2021 14:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TugVlbRXpFiQ9yttEJ2CYhwYKdBA8PSz6pBjqNjtqe8=;
 b=LxdZEWQx3suPqkadhSlrIg8Y/wBbCgZ19oaPbtBfHJRBGXgu8OvRhmKtGBeiAtGOi+
 liDoShgJoGfChatXJvVHlGfhJqZTZfaSa614IMYrTFjYDb/peXO5oxQ8SJntz+ROu8lH
 ob1M7/DUPmtXRrZcD8cMolSz0IhB48FDFGrv8rmurlnFUtz5GHTwT3bfswp5rSRPgw7Q
 Bzriun3on2U4+nPpGH/7v8uRLlN52ALrwjKmwn0fNW7IfodPJ5+z4OBz44Q0tz7qr3AI
 hQkqoobZyhuG5/zdS6+8c5M7BaM8ouPopuZJKxbxjokH3QVc4vnRaK15kTyz9igV7eYm
 7uUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TugVlbRXpFiQ9yttEJ2CYhwYKdBA8PSz6pBjqNjtqe8=;
 b=PuepJUJDfr5ZCLBGJf03JwZNiL8e/920KYZ1ov53G3fu+/m4mi4tUs1dU3+StFBCr5
 F9JZxe1yTfW9xfT7+kAEM8KL9IshA8PuuQtVyVtL3DR1bSmp2iOolcMx76Bir3I4kkF6
 lpAnHsfUprRrRPCWM1w0huXoJsCGR+5ounSeh7M8rPRPxG2n32+VO+3OWH7J4Gp3Z03c
 SUfLtB8gzmadBp7zm/rA5Dlq7dTLjbfUHBhPMUfo1oAsH2m/9UMPrJozfWt5C3PtJS3f
 PxiDp+QbdtX1rXaQkMI69d7RzIy02hLSKjyuj+Sbsutw+xCUeI+AMmpL3y0dkZMD9XKN
 KdWw==
X-Gm-Message-State: AOAM530MsjHSa9nS6maL1ywANnoYVJMUDylwYPpPENQZxtBC75saUbM7
 rEn2TRQ6U4tSh90IQABAaWo=
X-Google-Smtp-Source: ABdhPJzuqmviV3vutEjHAVvh6ry+9Hwrmd//Nm2QPeCY1TzVEUwjdrrEOpdr1ds5exnt/bZhRUUrMg==
X-Received: by 2002:a2e:a5c8:: with SMTP id n8mr301030ljp.307.1635369480150;
 Wed, 27 Oct 2021 14:18:00 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:17:59 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Pavel Machek <pavel@ucw.cz>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: [PATCH v2 04/45] reboot: Correct typo in a comment
Date: Thu, 28 Oct 2021 00:16:34 +0300
Message-Id: <20211027211715.12671-5-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_141806_449782_00051FEF 
X-CRM114-Status: GOOD (  15.42  )
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

Correct s/implemenations/implementations/ in <reboot.h>.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/reboot.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/reboot.h b/include/linux/reboot.h
index af907a3d68d1..7c288013a3ca 100644
--- a/include/linux/reboot.h
+++ b/include/linux/reboot.h
@@ -63,7 +63,7 @@ struct pt_regs;
 extern void machine_crash_shutdown(struct pt_regs *);
 
 /*
- * Architecture independent implemenations of sys_reboot commands.
+ * Architecture independent implementations of sys_reboot commands.
  */
 
 extern void kernel_restart_prepare(char *cmd);
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
