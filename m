Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A041C61D94
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 13:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p7B3WHzL0OVxKOZJE3begU5OosJdIZFJOhswojGe49o=; b=dym4LDDU3AVIu6
	kGxXYdjGNZkKODVhFJbLCJWggiMsHUjqdWwiHkSo1xTDlC9qnr3YqlwEkJTCEpBwdinIQkQmeVe5E
	cBarGGhUWfhV1nE1jCQ4qNOT9AGuJZCsx5oXT0YUqpIs0f6GlCKnV+OvRcpSpg6Q/ua4czNAOugYZ
	urpgaDU+i6uGdmlB1VYWgGWh3lwgV/gilp7Up3TxSmkDAJx0CBeofjkwA/qgNngr7LCu3T7Ht2zUT
	LoeFw1n2tWnWoPWESSbRkH1FjWOwkImcmVEIOqMA3kUwyEymVnprehUgx0cZwEizSfAEeQzllieka
	wH23+RBzgYAJxJkquvBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Qsm-00Gpc6-0R;
	Tue, 21 Nov 2023 13:33:40 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Qsi-00Gpb6-0z;
	Tue, 21 Nov 2023 13:33:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jVVGFvUYMz4XS+12ONkU+6fJSyRI8izrxLMtrbuvIP0=; b=kY5cEp8xCY9jLDgh/xFp6cSuy2
	Jz+RL6eU+iPaAzt9qIKWRj6yqyviyOhB1z7dy2+vtQP50sWKI0Vo1nx6VtaheqE6cZm80bSiMXeVf
	FtCABkjqw7Mq+I4pdZgV29XwSrD/q5N1YePzz0dnXidk6+Sg6w/Y3tlbzZ03VWOdiCgf5RjpUx21u
	UWT+tXSPBOJFKU/6bm4HHOJiDZEbNoCWfjAGQuIHqKEAhEWk7GyIa+p4CSMtlFCimVQmcBnkShinV
	W+1396JlMfCb5i1bc/V0iKk53XzoWqswkq/u0dlc7cSJ+bZyvX5+4xOFhEPVzUBUzQkBJFqQw9BEJ
	hAqkSFHg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36490)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1r5Qsc-00074Y-16;
	Tue, 21 Nov 2023 13:33:30 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1r5Qsc-0004DM-VQ; Tue, 21 Nov 2023 13:33:30 +0000
Date: Tue, 21 Nov 2023 13:33:30 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, linux-csky@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com,
	James Morse <james.morse@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH RFC 08/22] drivers: base: Implement weak
 arch_unregister_cpu()
Message-ID: <ZVyxqoKBL8LsxXW+@shell.armlinux.org.uk>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JLL-00CTxD-Gc@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1r0JLL-00CTxD-Gc@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_053336_367281_BF2615AA 
X-CRM114-Status: GOOD (  20.63  )
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

On Tue, Nov 07, 2023 at 10:29:59AM +0000, Russell King wrote:
> From: James Morse <james.morse@arm.com>
> 
> Add arch_unregister_cpu() to allow the ACPI machinery to call
> unregister_cpu(). This is enough for arm64, riscv and loongarch, but
> needs to be overridden by x86 and ia64 who need to do more work.
> 
> CC: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> Changes since v1:
>  * Added CONFIG_HOTPLUG_CPU ifdeffery around unregister_cpu
> Changes since RFC v2:
>  * Move earlier in the series
> ---
>  drivers/base/cpu.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
> index 579064fda97b..58bb86091b34 100644
> --- a/drivers/base/cpu.c
> +++ b/drivers/base/cpu.c
> @@ -531,7 +531,14 @@ int __weak arch_register_cpu(int cpu)
>  {
>  	return register_cpu(&per_cpu(cpu_devices, cpu), cpu);
>  }
> -#endif
> +
> +#ifdef CONFIG_HOTPLUG_CPU
> +void __weak arch_unregister_cpu(int num)
> +{
> +	unregister_cpu(&per_cpu(cpu_devices, num));
> +}
> +#endif /* CONFIG_HOTPLUG_CPU */

I have previously asked the question whether we should provide a
stub weak function for the !HOTPLUG_CPU case for this, which would
alleviate the concerns around if (IS_ENABLED()) in some of the later
hotplug vCPU patches... which failed to get _any_ responses.

So, I'm now going to deem the comment I received about if (IS_ENABLED())
potentially causing issues to be unimportant, and thus there's no
need for a stub weak function. If we start getting compile errors,
then we can address the issue at that point. So far, however, the
kernel build bot has not identified that this as an issue... and it's
been chewing on this entire patch set for well over a month now.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
