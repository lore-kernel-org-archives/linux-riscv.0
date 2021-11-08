Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0603CC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 00:48:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1CAA60F4A
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 00:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1CAA60F4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ntzpkMCxzM8BcJT+V9cTdrpx5nfUW0SpTLn4ZhKI1jE=; b=FSfEI40GMldLPX
	SMcgkCTqIOJxII1mgahTJo2Eb+fjTREupxJ83qqAxO3OGlL1yKpMEPfVBEQ8OwrzDWs5iLLT2Oa3/
	uAWA+G33W38vEeQakuleJ9Ps2YLxX3DDFCB5hxhUiT+A9X5BmLj5cMntf58PZbT8Mnjp/Mh1cTmPb
	Cw3GTcqjORYdfZs1moRJFEZw7bbp+dod7I2Zx/Vtu3euqaf8zcsxtMLeS35N6+Oyd/vECxluhtseS
	3cXh0deLrEh8cegEYtJhwaItSvxWapEc2rWF9eGSrYmQE0zHkdgrsJDaBFJz4kRQS1DE3J0dt5oP3
	YV6jrqm6zgPXeXNxbhAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjspY-00F7Yg-D4; Mon, 08 Nov 2021 00:48:12 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjspL-00F7O8-Mi; Mon, 08 Nov 2021 00:48:01 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 207so7999409ljf.10;
 Sun, 07 Nov 2021 16:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=idp+KUM0Lads56hMjVdKoUEucrYOLC8M0llXkHYfiR0=;
 b=MSIokg9fBl5wCKU+YCh/ZsTnRbPxtyYkn0IXkmz1QgysWSCzedTHzXunmbe5h3S6bm
 UnVL+wV6mqmFlzA/9Cm1DjvGCGyG1UlF0UpjGzAyekOseWLiiFHuU/rzzoJCNBaI+Ut+
 tXv3jqiyClz8c/yGI+0sql8rliP5FMVBt2m13PFdeI0ncEKECxTJKTD2uIvZxfhnpZtc
 pTtiL6yFqIiWFaztPJXKxizN2sS1pJLHyx55ZI+6yNFLo/Lx5fkTcHCO0Wef47K1i5ee
 hCd51zpj+5nuMAdYUzdECYDopq77neBqCsiLrTGv9/feFU5+CZJd4t4x88wQvcjrAxlc
 1+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=idp+KUM0Lads56hMjVdKoUEucrYOLC8M0llXkHYfiR0=;
 b=7lFJ6YtAeKWXdlXG/uHOffIthxyAJMeznd0to9v4Ormz7594bGwCIpot9+WoQIvTwL
 XdeQQ3vD5pkJxhaQg5s02wzpZER+3uYM35V9Mpc4tjOqyDixi9ic6FbqwOoPWRxMODDg
 doS05uyzFSjIqbk9/qO5pU/ElDcCHAhwbrn+5OAhoKSvGqRxt8z7wp8hB0qwx/WRqF+l
 zPKqRkk7yJ/dIUL/l+sDvld48mbQz6LpzpitH7Z/XnJAyWKjK3Rx80iyHSAh6jSrKzzD
 tB9+P21BWxzw+Nwoy4JNSnRj8LvllmldQLQB8sXy7xnMSL3xwiwercAxdxis9Okne2DL
 xjMw==
X-Gm-Message-State: AOAM5327/BoSUZ35KHxe+KHst51IWNqzLeMueSqdFQmdzXpVaDM9Ettw
 +z+tnjmuJwrPG75wpj74w3A=
X-Google-Smtp-Source: ABdhPJxSy/O3ZKQtb6VfZ0yaPaYZOmyzwu5OdP3V3ve+XGbVnBVt+toWzoBqdj+8FoRHXqlPFKwvJw==
X-Received: by 2002:a2e:b88f:: with SMTP id r15mr57944203ljp.309.1636332477998; 
 Sun, 07 Nov 2021 16:47:57 -0800 (PST)
Received: from localhost.localdomain (79-139-188-96.dynamic.spd-mgts.ru.
 [79.139.188.96])
 by smtp.gmail.com with ESMTPSA id p17sm1625266lfu.209.2021.11.07.16.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 16:47:57 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
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
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 06/25] reboot: Warn if unregister_restart_handler() fails
Date: Mon,  8 Nov 2021 03:45:05 +0300
Message-Id: <20211108004524.29465-7-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108004524.29465-1-digetx@gmail.com>
References: <20211108004524.29465-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_164759_785018_5517B482 
X-CRM114-Status: GOOD (  13.86  )
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

Emit warning if unregister_restart_handler() fails since it never should
fail. This will ease further API development by catching mistakes early.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 kernel/reboot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index e6659ae329f1..f0e7b9c13f6b 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -210,7 +210,7 @@ EXPORT_SYMBOL(register_restart_handler);
  */
 int unregister_restart_handler(struct notifier_block *nb)
 {
-	return atomic_notifier_chain_unregister(&restart_handler_list, nb);
+	return WARN_ON(atomic_notifier_chain_unregister(&restart_handler_list, nb));
 }
 EXPORT_SYMBOL(unregister_restart_handler);
 
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
