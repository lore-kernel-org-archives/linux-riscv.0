Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EC8606A321
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 17:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tPIhw9ru;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gXAAaHUE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iy0yLrwkpmXqT6ZJAT+y8oLv4NFMsP4ZazaWOsHliEA=; b=tPIhw9ruZnwXwYJ7yq+ojArjW1
	9QEOEWibRtGHqFGLstM0mHN/e5EhlRkFwtzcwcX4LyoFszP1NJdyTuaRa3ktddPGxklSClo1GTwmF
	aO5TBkj3BMFlq3VVaOyNq7yRRmWkmEgex/I5T5ZCUXNPith+Bu5HvZ/+WzjiMFg10OBbm/LJFxPJb
	wuO5CoFrrBDJE7ixmXXqGtBww7t0fUi4kYF4yplpbYCffKU7KkgOkLoFJnKOheEb/FmaBgNiX4tsQ
	xYJZ2kMQQo5sEMqTQMuFOVkkXqm+n/FDwWbA0cKnANxsVrbwIZ/u+CjflZxzUod7h8mDNfqgi5Q5x
	YGFWgf1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzlg-0000000HH6G-3w0D;
	Fri, 27 Nov 2026 17:29:52 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzlb-0000000HH4d-3RWk
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 17:29:51 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3b532e633e1so502404a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Nov 2026 09:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795800587; x=1796405387; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=htgkc1niw9wiArafcYtBRNur9uqGXrmAC1AoCVzanjA=;
        b=gXAAaHUEyp9jkUA/toCHYuwWKOl3PjxcutYJvoY9Y/bP6V3ZIf0NY/gmiMpiqiqCqf
         H1YcVY8+iQwY8wOtxDk+rTQREVCXQlJSvhEKLXUATs+WS1683XH7dySx+miwQ4XIqL7x
         5OmCmxTZrRIo6D4v9zRrT9fgF4Lug6kgwfAvBIM2uxy1dTMljmKbRTXW+NXzRSFyuXJi
         vWh0irvb5P1UrAZprWluoNN2A1DKsXayDK7rcTVU+u3nDpugCLq6TcOnGrGnsdMB99Qk
         CdCIx4CsGiVdm75xQnHp/yoDUZ84kAyIGE7sDCNtMfIFu7PUiPR/UZZyru082znLH3De
         /8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795800587; x=1796405387;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=htgkc1niw9wiArafcYtBRNur9uqGXrmAC1AoCVzanjA=;
        b=I0xKFuwga7iwvq1gqtCpcjX1H13A6mcWt1dSEMg9/Uyg2/TfrGeYQQ9pf1AlV82HFf
         CdQIG/teuy6FHYKDnk5aEos1TkUu+Z2XsaWpsLI3CAMfjDZNi2lu5IvpHtRaRj2spRKN
         abYWeupwUAnunQFedpvz7YH5UmuYammgTKAY5YK0LbEPtmaXu3HZFzA2aCeqUk1wUsKl
         m5eH+JZjpjJcppyf6E8t+GyrO5GK5jaHNb+hePRmatQx962gopD30cCpWEEbM2Ow/g13
         ihXbtE9y7EdjnfGrimvdzWDihH6pxZBM6uPkExaer9tn/8fdA3RvnnFNN0a9Fxm5HJSA
         ckLg==
X-Forwarded-Encrypted: i=1; AL+hErFukOAu/Yqf/p55G/cdPOcjx1Mwd/X/Bju5DpDWq1QIWAkAisj0lNZ+MVDzXZZmi2Z8hImllhIh/ii8bg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/JxpCPWDdTuZb11L+lr5ldhQL6khrd6qasE55PTJHAU9A8UEB6
	Soa4D4vx0gkMF9DkAM/7pLb6/PvxSJQPhMil6nntP445jkMgKa7Bk7nvGW8kGQ==
X-Gm-Gg: AZFdTZebR3dfUbpFryRVc7pHJB4hwb1W0rSH+RExEdEQu8cQKLsM89F+F3/gQ39acRJ
	YByJaLGrn2+AM+nZw7UZzCrkNXhZFs2+EQ0xDD+YHsfIv3ccpUmaCI2XXmEg6E8LWvstrUWut69
	8yc1OvbOKBLgDea8kB5Vsw7E9ZwFC60fMufHgPS8blxaRe1HKFWXLstWWbvfg5POrhj+rPPEwn5
	YClkWdAQhcJe6e3zBYqB0dOEVITYAXnCPyCjPQh+xDGuYh8H9unXsO/HUivXHj3lzoT6YI/LRpX
	bixw0KTRVQaT8+261YYHV9XWwylfUT2NKYE2S/srErfyewJW1mNXpwDKEC/Yfv053IHsH3iwmP4
	QSdbPqxpmi0kgQUwubUVNy6evH5qWQ3TrnQVs08pU59KMqkuBYqxwAzg66ujeB5FjWeRCPaUw4p
	u7lyPEdmHusmWCq44VQwDNl2iGXyqm0heF2ABbcoQtWuug+FRkshh6M0KY8/rxirfGzpQbyHZQ+
	oF+sM6e9+VyVij3jTtsKICSHrVya3EuYx3SnZ36RnkACxiwvjfjva/CZSMOvifm0UaV09LZj8sF
	BdPPHPbqazGUjs3NLdevldItDisV2BVQ3g3syhCqTaPi5jlN9S0=
X-Received: by 2002:a17:90b:248e:b0:3b5:35eb:5e85 with SMTP id 98e67ed59e1d1-3b535eb5f39mr2367200a91.2.1795800586587;
        Fri, 27 Nov 2026 09:29:46 -0800 (PST)
Received: from google.com ([118.150.148.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d05782asm12632435a12.24.2026.11.27.09.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:29:46 -0800 (PST)
Date: Sat, 28 Nov 2026 01:29:42 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH RESEND] clocksource/timer-riscv: use
 riscv_has_extension_likely
Message-ID: <awm-BjjOPxHo2n2E@google.com>
References: <20261107134952.17873-1-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261107134952.17873-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_092950_595337_94CF3087 
X-CRM114-Status: GOOD (  21.86  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jisheng,

On Sat, Nov 07, 2026 at 09:49:52PM +0800, Jisheng Zhang wrote:
> Instead of static branch, use riscv_has_extension_likely() to check
> whether SSTC is supported or not. For one thing, this is straight
> forward, no need to add and enable/disable a static branch during
> probe; For another, riscv_has_extension_likely() is based on
> alternative mechanism, it avoid some downsides of static branch, for
> example static branch's metadata in the __jump_table section, which is
> not discarded after ISA extensions are finalized, wastes some space.

After reading the __jump_table note above, I checked the generated
timer-riscv.o. One side effect I noticed in the disassembly is that gcc
stops inlining riscv_clock_event_stop() with the alternative asm, so
riscv_timer_interrupt() ends up doing an extra call/ret plus a stack
spill/reload on every timer irq.

Not sure if it's worth worrying about, or if marking
riscv_clock_event_stop() inline makes sense to keep the irq path flat.

Otherwise, I tested this on qemu virt smp for both rv64 and rv32 with
sstc enabled and disabled, including cpu hotplug, and everything worked
fine.

Tested-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Regards,
Kuan-Wei

> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/clocksource/timer-riscv.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index b310e6721fac..151f4f0cfd6c 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -29,12 +29,11 @@
>  #include <asm/sbi.h>
>  #include <asm/timex.h>
>  
> -static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
>  static bool riscv_timer_cannot_wake_cpu;
>  
>  static void riscv_clock_event_stop(void)
>  {
> -	if (static_branch_likely(&riscv_sstc_available)) {
> +	if (riscv_has_extension_likely(RISCV_ISA_EXT_SSTC)) {
>  		csr_write(CSR_STIMECMP, ULONG_MAX);
>  		if (IS_ENABLED(CONFIG_32BIT))
>  			csr_write(CSR_STIMECMPH, ULONG_MAX);
> @@ -48,7 +47,7 @@ static int riscv_clock_next_event(unsigned long delta,
>  {
>  	u64 next_tval = get_cycles64() + delta;
>  
> -	if (static_branch_likely(&riscv_sstc_available)) {
> +	if (riscv_has_extension_likely(RISCV_ISA_EXT_SSTC)) {
>  #if defined(CONFIG_32BIT)
>  		csr_write(CSR_STIMECMP, ULONG_MAX);
>  		csr_write(CSR_STIMECMPH, next_tval >> 32);
> @@ -112,7 +111,7 @@ static int riscv_timer_starting_cpu(unsigned int cpu)
>  	ce->irq = riscv_clock_event_irq;
>  	if (riscv_timer_cannot_wake_cpu)
>  		ce->features |= CLOCK_EVT_FEAT_C3STOP;
> -	if (static_branch_likely(&riscv_sstc_available))
> +	if (riscv_has_extension_likely(RISCV_ISA_EXT_SSTC))
>  		ce->rating = 450;
>  	clockevents_config_and_register(ce, riscv_timebase, 100, ULONG_MAX);
>  
> @@ -186,10 +185,8 @@ static int __init riscv_timer_init_common(void)
>  		return error;
>  	}
>  
> -	if (riscv_isa_extension_available(NULL, SSTC)) {
> +	if (riscv_isa_extension_available(NULL, SSTC))
>  		pr_info("Timer interrupt in S-mode is available via sstc extension\n");
> -		static_branch_enable(&riscv_sstc_available);
> -	}
>  
>  	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
>  			 "clockevents/riscv/timer:starting",
> -- 
> 2.53.0
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
