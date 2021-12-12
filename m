Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD777C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Dec 2021 21:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pH1JV0LxrNHSd4aAsMnYd0DfvjywjYxR83Ujx9MLIxE=; b=2UYSW2bfCEigfB
	B0MG7R6udHw1e93BGqWobbqriqBbhtO27ZZ7vuksrZWCpQlqxpXTKfmX8r2SAgSZMmmxoOciQzgio
	kgmiOjodNM6v5ZXvw8TFmFRByIGjJwo3TmcIyrkEZk3A8aVpnyK5OpwGSwglGAFOG1usQUOts2Mei
	LGwMjtv1nNv/W6zFj0y4t1jD4eFfGhcaY+EYmpJQ3imao3LeQqInoJfND7q4Zy9yc+2Ho7NsCy5xz
	Ofa05TFebt+ZojIGorc525Qn0UOCROXKWkZy/DIzN5dVQUkD1R0iRRc//Fz2XUyRlOvhrxdT8tjnR
	KV4UsLm5/8ICcKYIMUOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwW1H-007GXA-6p; Sun, 12 Dec 2021 21:04:31 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwW0o-007G82-K0
 for linux-riscv@lists.infradead.org; Sun, 12 Dec 2021 21:04:04 +0000
Received: by mail-lf1-x132.google.com with SMTP id b1so27368661lfs.13
 for <linux-riscv@lists.infradead.org>; Sun, 12 Dec 2021 13:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=032w538UVpeATjNmIAIpxMVbSRQ+KkFSikcjH52Go7E=;
 b=E9VJGzDO/MjlF9k/luR3Khbhy1NPRGJFu45WGR11yv2Csut15VlFqb3GxfyXiC5K1R
 KoOjuPxJ74P0WBK6P5Rh4Yk8N3YLtFpHfuaNjG/nuh/tfSGU3NqTk9edZfzSNHKBOR8m
 kPzSD7yXn2hiHnOuT2WH4wXsn02tbX247vyP+WAbNdjC41aD7suYMkTSBhHb57suBLzg
 JDCdqG/x0ozFIiafXt1VhOC6hig+lrppFxitm7BNJIhU1ULZzUrjdQMODUqHIbHIv5lc
 HP4HR2RELBXIYyMaOYQnB3LyrgNZPo6J89xd7q/RgqqbviF8jrhJU82mQviA1Jb3TY/T
 AUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=032w538UVpeATjNmIAIpxMVbSRQ+KkFSikcjH52Go7E=;
 b=YuMusOfs2nEd+SaCO0hQ+9cMlkJSqYjLYxQz+saVYfW365n8jIfvY9SqVdwBcrHfd7
 h5U8izi055D2z7YKYD1aB9PkdFs2GcYDtZuR/+p/NL4Irfc851XLDEYN95rPymZyFS/w
 DZPgay4clziCntab4qt/EzsZU09INlkkGAepvx6bGHy/klBPLAChVhKIT03c5lP2eCwC
 ZQ4sEOoG8s0MO8SddWMEvhJ07uf8ieNe8xSPKv2izeFl9p4L7eG9K/VCWfnj13JK5qM5
 FfAAf/oOBRxe2QVgmMBhthUCqdopvSwcjWGu+NgV1BP88AE+fH22fOlSw2D9HFltZ5To
 1Zvg==
X-Gm-Message-State: AOAM530ulHZremBIE+zzW+BvnamPPxjKDiLURIeoUXK4rV404u1yOyt3
 VW5NTdrgUCBRqpMN1ZpuUso=
X-Google-Smtp-Source: ABdhPJxUkKeqtg/YDWyN+6uH7IPe04t5eV8J/9ZVzn0URaLN05uRJEwSyylEX1JQ9jfzKVs+jpVePw==
X-Received: by 2002:a19:5e59:: with SMTP id z25mr25760424lfi.686.1639343040878; 
 Sun, 12 Dec 2021 13:04:00 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id y4sm1197172ljp.16.2021.12.12.13.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 13:04:00 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Greentime Hu <green.hu@gmail.com>,
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
 Stefano Stabellini <sstabellini@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, alankao@andestech.com,
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v5 13/21] sh: Use do_kernel_power_off()
Date: Mon, 13 Dec 2021 00:03:01 +0300
Message-Id: <20211212210309.9851-14-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211212210309.9851-1-digetx@gmail.com>
References: <20211212210309.9851-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_130402_699855_928E28D2 
X-CRM114-Status: GOOD (  13.75  )
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

Kernel now supports chained power-off handlers. Use do_kernel_power_off()
that invokes chained power-off handlers. It also invokes legacy
pm_power_off() for now, which will be removed once all drivers will
be converted to the new power-off API.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/sh/kernel/reboot.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/sh/kernel/reboot.c b/arch/sh/kernel/reboot.c
index 5c33f036418b..e8eeedc9b182 100644
--- a/arch/sh/kernel/reboot.c
+++ b/arch/sh/kernel/reboot.c
@@ -46,8 +46,7 @@ static void native_machine_shutdown(void)
 
 static void native_machine_power_off(void)
 {
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 }
 
 static void native_machine_halt(void)
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
