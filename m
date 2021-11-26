Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F78BC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 18:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pK+4EBAa0SXOutsm8WJ+m6BjV0BZmyVmIa9nKTXDcPQ=; b=DOfhL16TfujeD6
	5CXjs2Q7U8sBfcmdj6XjW2HwCSgckKKJ9e+Zhu7ztaEpOCV9Isbo7JP7qTgEkFf9WCucOPkDAO2d2
	xPmwGjr0j/vrXRt77kBfPNRvlA8VJVguT9plNZQiyRGS146O3isEbhJOcRGTUz94sxu847z12enh9
	+pgz96qcK8mlFFRguKRf0goYFJITzZjLGR/19cW+X5bptc4D+jX3Uqgz91F/XyaFIHj5s4nhKIll/
	3g0ianiyA/iMNTF6i4Z4opwjPufjKnuF/Sd/aGR4varkgo3TBEnKmiPyen+v9LFzRbetKoSvBmv+Z
	nExHLfL1Es+vAKuOspGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqfY5-00BNkw-Aj; Fri, 26 Nov 2021 18:02:13 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqfXs-00BNan-89; Fri, 26 Nov 2021 18:02:02 +0000
Received: by mail-lj1-x235.google.com with SMTP id d11so20201050ljg.8;
 Fri, 26 Nov 2021 10:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TugVlbRXpFiQ9yttEJ2CYhwYKdBA8PSz6pBjqNjtqe8=;
 b=EXi/oxDDucB7vJNmfYFh1Iwg1we98RTNK7qyQ6Pdkz3hnbaV2hMW4l1POGeJ+EuDW3
 mfK8h6/HGX48geRcpT6dEfo/FZS8zjrNQzuV9D9yTWn1MlecsUkK/urNFZNa2VjEdWl9
 3/xQ0erpf6zbbhnap8EibMOxOLqWzB/sgB1oOOeSZJajy/Ifr+5no+/bjgdeTssZ3wit
 5MjglkJmn7BWDrHCR5FY99XqOGptLogROhVJVK+6zpUEjhp3iHhkSjd8cGYxkYTOE3E5
 Hunlawsq/RhtNyOKzbO6esnP6jp4mV/8bYBosw7nvP39SDUVYAevi9e0LAdOtl4z+dWr
 vlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TugVlbRXpFiQ9yttEJ2CYhwYKdBA8PSz6pBjqNjtqe8=;
 b=abCC/73c4PZ2Nvj5JxA1RtrUiUvj27LkaJRvERxRR703jXHvwFnZkfO5MhDUL6u0Og
 kRwmUM/5adWHGYmI1WSILEGeOhDYlzHuCkuj+J9Ok6oFtH4c6I0LcIVGQb1jhHD7JXV+
 gtD27Tmiq0Y8+HHFYNOTKXUOAddzojWw832xC20v2bCrtf+R2PPC9j1UduVM+z4SKL1y
 NIZNjOtdq6KIReCiHytIYoLSURBe6gcPKrxFFVm1+pLKX4RhZ7R1xNVV5kIGs8yikBvn
 QSsHkOdQeensAzVBR25JvxIVK+u6zhsTb6L7p9bBQH56cw1rVRoDmxMcPpxd7rYoo01d
 OGJw==
X-Gm-Message-State: AOAM531Cb5XdJQ4N13gKTdA9r33ui6O7GkSRYDfrQFJnP63r7b6aaRNq
 FHRTkY53clZQ9ElBGAZm+tc=
X-Google-Smtp-Source: ABdhPJxZrbo5DYPMSOmTH3wpvpPB7QiVBAcDOPNsyswyNXYwa8DOLhCA5ZoHQosELHStWSCO8T/NkQ==
X-Received: by 2002:a2e:740b:: with SMTP id p11mr33098297ljc.215.1637949718086; 
 Fri, 26 Nov 2021 10:01:58 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id i32sm553831lfv.295.2021.11.26.10.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 10:01:57 -0800 (PST)
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
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v4 04/25] reboot: Correct typo in a comment
Date: Fri, 26 Nov 2021 21:00:40 +0300
Message-Id: <20211126180101.27818-5-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126180101.27818-1-digetx@gmail.com>
References: <20211126180101.27818-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_100200_341460_C3338892 
X-CRM114-Status: GOOD (  14.40  )
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
