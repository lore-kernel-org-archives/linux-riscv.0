Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1D4C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Nov 2021 00:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dKkv3zd+MX/eS3gWpnCxRO/R2tfdmFDFK1b9aLWj8Lk=; b=mzuM4UP3bS7oe7
	CmCQRMsqIFVZh8lQy48vfG5am67VQtQzPFIO4Hu9ihaCiSzqSjZZ+RYBKX6g6kMEyieN+dtZ7lJtJ
	1iC2H5GnDZz70rR/7CCTzq9QiH8Ic33K7Rm9Tyte0BzciCB/BELbPhYxEnq95KBvI274YajxLmTVV
	UklIEjsY8QYtajA3qoZyrRYxdA3/BhiSwbdAbdhCnXw0YhvmPGHToTQukJM5cFsefED2B8MttTsfL
	KKaayiBlz6cQBtGb2pO8zY9JmZGmohyFQLEADk17BBTRyDJYaKkuZQ6Rv8O1cY3Lit6zWf+VRTXg8
	m41bNn5LCxEE9JZPhQzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mr846-00Ehml-1e; Sun, 28 Nov 2021 00:29:10 +0000
Received: from rere.qmqm.pl ([91.227.64.183])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mr843-00EhmG-8F; Sun, 28 Nov 2021 00:29:08 +0000
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4J1q8r4xRGz9Y;
 Sun, 28 Nov 2021 01:28:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1638059340; bh=BpCUv6sc6+ijt8bP2X1dBPBQztb08CMPEjcmSI4mWHs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E2pJXVdwpF7xa7NgJpuaA7I4sUgCSxdIM51ma240k1OvyN0BqmbHCll/qibc7LmRW
 l2lYyRdiOG0LzZZRcQGCbOEp7l5l7FW2EF13o78tAxh2BlfQLPIqSf2RtHjwNL3AHE
 ag5QLlLhW95Kp8fH9dCV3j4Imx5XQ5T4nV1vyleMAzKz1Soq6c6OnKpJ5TdzfdwJ2G
 LnQoKtgUWmpQEblg3IMnaxzgslueaP8apjKdZ9y96JJ35QjeXKQSawNEPmoxjBztTd
 XADr6Ffb3r0e7Kv67f/UCkeky+8m4GCPkGRqXkdYh2BWzTit8bUIHp4dPNUh/LgLHY
 SH/yCd1X39o+Q==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date: Sun, 28 Nov 2021 01:28:40 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, alankao@andestech.com,
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 05/25] reboot: Warn if restart handler has duplicated
 priority
Message-ID: <YaLNOJTM+lVq+YNS@qmqm.qmqm.pl>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-6-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211126180101.27818-6-digetx@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211127_162907_514807_FAC78182 
X-CRM114-Status: GOOD (  13.76  )
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 26, 2021 at 09:00:41PM +0300, Dmitry Osipenko wrote:
> Add sanity check which ensures that there are no two restart handlers
> registered with the same priority. Normally it's a direct sign of a
> problem if two handlers use the same priority.

The patch doesn't ensure the property that there are no duplicated-priority
entries on the chain.

I'd rather see a atomic_notifier_chain_register_unique() that returns
-EBUSY or something istead of adding an entry with duplicate priority.
That way it would need only one list traversal unless you want to
register the duplicate anyway (then you would call the older
atomic_notifier_chain_register() after reporting the error).

(Or you could return > 0 when a duplicate is registered in
atomic_notifier_chain_register() if the callers are prepared
for that. I don't really like this way, though.)

Best Regards
Micha=B3 Miros=B3aw

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
