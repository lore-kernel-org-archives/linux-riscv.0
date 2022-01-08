Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0492C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Jan 2022 23:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=su0anqOfZ7m3uN9ppByDORRSCEDHQsaPEHcYJIl3hQg=; b=uMDpIeKmF/xfp0
	aoYF+eX4PF//ZJcrymybNcDKNqIch2p+dd//JEs7mWVjgGYbu3qUXI+ja2G/n2+MITSeSNKYozVPP
	rwwIlVasacowwPsV+hUjACDlwpRK/cAbbG9NyM/ObnKI/V9KQcgVmVPXHfbd/b+cifJPdRC542XQA
	6k+PH8J75Kim9jQlT/kIZXacg70PV/ebx76jfyON0vmxoQDhnln3wuh4yRVQfkZEpaPjoQy2WJZZg
	UR16fXDN53hA4T/rwGmXPahVsEIrR6soPfN3Ct8CT7ldFbzhAlUGR6UNageWkjQGGOCKwkwzUv6mx
	2UjnFbZojX6IAItraA4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6LFO-007790-OU; Sat, 08 Jan 2022 23:35:42 +0000
Received: from rere.qmqm.pl ([91.227.64.183])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6LFK-007787-Uj
 for linux-riscv@lists.infradead.org; Sat, 08 Jan 2022 23:35:40 +0000
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4JWbzn6Bf4z9c;
 Sun,  9 Jan 2022 00:35:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1641684931; bh=PlUOfTOJmz/Ue3/EDBlVUxJ2DxqecfDU18/1xQbQtoA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FscL30pAUhiOa20r1Aci5nnOyAPPM7+JoY4I/TdvClRTh0U4D6S+wg1hl5DP6lTxY
 uXsR1x49ZX58OBDSXL5QGeKh44OE5Qx3HX+fhAHnzzl6d2Bb3RMolFLW/CZs7ANyT9
 2B2bqDVSaDvrnFLV9W4laov2KVjSpYZyXNNSx0uhvIf6/Ty/Jc6im2Ya6WtOK+mKnU
 8tBa912YBdNEWU6kN5XGlGndW+KwbfYMSoJHIv4OJWOXoW7NdW+vFlXd5iG2C0Sl5t
 yLjrrdYJpGeB9xfuugFJFXVZkd4+VRh97hWFY+LEwPEsT5kUEeN00fOMl2F0IbFH2g
 x9nJQfgC6GmfA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.4 at mail
Date: Sun, 9 Jan 2022 00:35:15 +0100
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
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH v5 04/21] kernel: Add combined power-off+restart handler
 call chain API
Message-ID: <Ydofs2CIfA+r5KAz@qmqm.qmqm.pl>
References: <20211212210309.9851-1-digetx@gmail.com>
 <20211212210309.9851-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211212210309.9851-5-digetx@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220108_153539_366933_7EF3EB5D 
X-CRM114-Status: GOOD (  19.15  )
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

On Mon, Dec 13, 2021 at 12:02:52AM +0300, Dmitry Osipenko wrote:
[...]
> +/**
> + * struct power_off_data - Power-off callback argument
> + *
> + * @cb_data: Callback data.
> + */
> +struct power_off_data {
> +	void *cb_data;
> +};
> +
> +/**
> + * struct power_off_prep_data - Power-off preparation callback argument
> + *
> + * @cb_data: Callback data.
> + */
> +struct power_off_prep_data {
> +	void *cb_data;
> +};

Why two exactly same structures? Why only a single pointer instead? If
it just to enable type-checking callbacks, then thouse could be opaque
or zero-sized structs that would be embedded or casted away in
respective callbacks.

> +
> +/**
> + * struct restart_data - Restart callback argument
> + *
> + * @cb_data: Callback data.
> + * @cmd: Restart command string.
> + * @stop_chain: Further lower priority callbacks won't be executed if se=
t to
> + *		true. Can be changed within callback. Default is false.
> + * @mode: Reboot mode ID.
> + */
> +struct restart_data {
> +	void *cb_data;
> +	const char *cmd;
> +	bool stop_chain;
> +	enum reboot_mode mode;
> +};
> +
> +/**
> + * struct reboot_prep_data - Reboot and shutdown preparation callback ar=
gument
> + *
> + * @cb_data: Callback data.
> + * @cmd: Restart command string.
> + * @stop_chain: Further lower priority callbacks won't be executed if se=
t to
> + *		true. Can be changed within callback. Default is false.

Why would we want to stop power-off or erboot chain? If the callback
succeded, then further calls won't be made. If it doesn't succeed, but
possibly breaks the system somehow, it shouldn't return. Then the only
case left would be to just try the next method of shutting down.

> + * @mode: Preparation mode ID.
> + */
> +struct reboot_prep_data {
> +	void *cb_data;
> +	const char *cmd;
> +	bool stop_chain;
> +	enum reboot_prepare_mode mode;
> +};
> +
> +struct sys_off_handler_private_data {
> +	struct notifier_block power_off_nb;
> +	struct notifier_block restart_nb;
> +	struct notifier_block reboot_nb;

What's the difference between restart and reboot?

> +	void (*platform_power_off_cb)(void);
> +	void (*simple_power_off_cb)(void *data);
> +	void *simple_power_off_cb_data;
> +	bool registered;
> +};

BTW, I couldn't find a right description of my idea of unifying the
chains before, so let me sketch it now.

The idea is to have a single system-off chain in which the callback
gets a mode ({QUERY_*, PREP_*, DO_*} for each of {*_REBOOT, *_POWEROFF, ...=
?).
The QUERY_* calls would be made in can_kernel_reboot/poweroff(): all
would be called, and if at least one returned true, then the shutdown
mode would continue. All of PREP_* would be called then. After that
all DO_* would be tried until one doesn't return (succeeded or broke
the system hard). Classic for(;;); could be a final fallback for the
case where arch/machine (lowest priority) call would return instead
of halting the system in machine-dependent way. The QUERY and PREP
stages could be combined, but I haven't thought about it enough to
see what conditions would need to be imposed on the callbacks in
that case (maybe it's not worth the trouble, since it isn't a fast
path anyway?). The goal here is to have less (duplicated) code in
kernel, but otherwise it seems equivalent to your API proposal.

Best Regards
Micha=B3 Miros=B3aw

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
