Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266A5C433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 23:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jRrqbF6dLLGw1Xv/hxG3nMi6vr2E6YUdJsVEGdK5SBk=; b=4FFJ0qODDLLyQn
	O0CjjEdCPbOBEqPT1uDn4iH540kbqh+0yjPjjDsLuy9qL0GC1DvFoH/dZk4UfRssawkSuaUpwT8d5
	v8KEGWn0Vn/nlybpq4LgdwKaw1xlCiWWU5bQuWWBvksGG7rfaGf+ViKwTKssJTvwzKOE6YSzegR2P
	jPMrpVobIiie8M5qwHlXbcObE/O34ZAFRyz6gcnKnoi0CsRtJlmMeOFbra1W2Qci/n0GNzFvvZNVh
	7n+Wl8yHeat1SwwE/t1x50MjD7uXcGZORKrdTtVt789ZUGr497i3Phxoe64Mu/Qvin6LFBtKfqFNq
	Jmc5buPVE5sO1ekTEL+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEJmR-007gUf-Mv; Sun, 30 Jan 2022 23:38:47 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEJlY-007fiK-Il
 for linux-riscv@lists.infradead.org; Sun, 30 Jan 2022 23:37:54 +0000
Received: by mail-lf1-x131.google.com with SMTP id p27so23343277lfa.1
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jan 2022 15:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qHFCRJN9BVY8RauX1oKR/zvQzYk8hOXc8BKode7q7dE=;
 b=YRe+4ENn+xLHydu0qjVK8NSLNEa98MBt5tDc08FixS3wAMtLqAIaFtklni0+X5AStQ
 NWa/KRzoUn8+IVpsHAm/xOs3k+cj+LL2OhKl5gVUEFkp5ndqFg9Q7IDP7ikRXZxwNK+4
 SbLkN6wlP8yDXzq0kfXqbvVsy1Hp18D+sINvf4RsWjU2CJLvpbxk+Pf4y4Di+ROI2ccO
 YZHUhr0Z8uHoIysiX6fudWOQ4mPt5OAElluDMzBTS4VC1jyp+W5tjIzGJQ2uBLL5DStr
 tO2S0szt+wkyquwgkXuRB6clwJUeXCGMkJhIWs2QZ///pnQ6oMEGbscGlCpylcxuYJ5J
 9wBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qHFCRJN9BVY8RauX1oKR/zvQzYk8hOXc8BKode7q7dE=;
 b=O8c1W/UPO85yF/ZvJdnTOqkRv6igiufGzygZx+DT/dgKzdnfuRjfcIGhUAhDv/Jpn1
 UrUOPz7Ni9Iqn5y+DTfNcA5+Rhd4dkkKiJOezPvIlphov5eSvnht79ykoTLsTa6Exomy
 l53Igoporxn6wqx3XYifyLGnDlUWLGb0WXs/odLBqQgys9ae2m3ZSBVrxg0KVJjBsP0S
 lqDtcMAmkzoCVsNXUS67G7kqf9ZGq6fDTInB+4d6AA5KSLD7rZLyYJ/yg4vGS+SmdLkL
 8MiLNP8TFQ2F0c29D1yVmiak9IvfMIImjMMjmDFQ6QB7mzzjofj8oPSrM9Z2zOuzluUl
 JOWQ==
X-Gm-Message-State: AOAM530vF7ZuBUuthHx5CFcBUlyEMvJa4LOGzQSA4heOREKrcqKNYHNw
 7rVVdlbVx2pebQu0xezphg0=
X-Google-Smtp-Source: ABdhPJykkAmU8QPmCYCQWolQuhTlQmgl/dllVJKfSuOOVtywU8GyeEW3uMb4RjUXLkfRs/7Y/PbgFw==
X-Received: by 2002:a19:6a12:: with SMTP id u18mr13556400lfu.348.1643585870718; 
 Sun, 30 Jan 2022 15:37:50 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:37:50 -0800 (PST)
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
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v6 14/21] x86: Use do_kernel_power_off()
Date: Mon, 31 Jan 2022 02:37:11 +0300
Message-Id: <20220130233718.21544-15-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
References: <20220130233718.21544-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_153752_736171_CBB0A920 
X-CRM114-Status: GOOD (  16.12  )
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
 arch/x86/kernel/reboot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
index fa700b46588e..c3636ea4aa71 100644
--- a/arch/x86/kernel/reboot.c
+++ b/arch/x86/kernel/reboot.c
@@ -739,10 +739,10 @@ static void native_machine_halt(void)
 
 static void native_machine_power_off(void)
 {
-	if (pm_power_off) {
+	if (kernel_can_power_off()) {
 		if (!reboot_force)
 			machine_shutdown();
-		pm_power_off();
+		do_kernel_power_off();
 	}
 	/* A fallback in case there is no PM info available */
 	tboot_shutdown(TB_SHUTDOWN_HALT);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
