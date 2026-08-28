Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED3FC61DB9
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 04:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I5YF6WbuLAwfhF8PHHbs1DsjKjoDj7/gfCkBTmNm6ng=; b=rf/q873CaTOnVf
	ppkfo7ZomEw/GhnBlo8Ad+zF7zKagMHOlu1g3WoNo/IilNgDZ1DRfptFIwl1mdpDGew5yWQlAQUq1
	ES9bTOF1iQX+Q3xtusKVs/6aNrvkJH7Bjing6kRExVPWIuoX59Q1mhrj/JafbgQxZib0j4A3flf2x
	ak1zIX0CYmZsDdqO9uS7QD7pD+BaFck8MtfoGeWyBCHEwSgt8T1YYwKaPvt0FY2kfwm98f5sWMkFf
	Nv/J03fikdkKdcm5UiWBpqP7AIK6mZp3CqTO60v+FJbbZLxCTjBLxWWdG5vL+ggEGOhQhH56JbDg5
	ITL6P8EZa6RS/JEzyF0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzoeT-000000057Mw-0wL8;
	Fri, 28 Aug 2026 04:57:17 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzoeP-000000057Mb-3X9W
	for linux-riscv@lists.infradead.org;
	Fri, 28 Aug 2026 04:57:16 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7eb1dc6bd53so623604a34.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Aug 2026 21:57:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787893032; cv=none;
        d=google.com; s=arc-20260327;
        b=NyasUc/P+i0wrabxgXGwNFqK3r4xpw51tCQQaNJJ6g5AQeohIqy5NoxGv8vSppjHNf
         EFnQHOgnKJpK8LVgWFAx+7KBMC5ueszeW0kDb+nllBqHL36MIGc7zd2h88WxByJoOLEI
         AmP8cCj2Dv/03F/jtm8dSetx5S1XJzhFidyQj8nQ1k/h/SBGBftD7hi57eJLFcuHiBJG
         17O73ljrSrLsfNqjM7X/mSG39hSHHXCHcHRxjeQ4cJPs2fAoXTwgKyp/2NQT1M4wySK7
         v/9evBSwtl5ck1qZ8jWJ+Xqe94iZwaMzEz2dTPcyTP5xB/sWnEcy6I8tTnqr0zf6CnSe
         24PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=xAjo1bmxd68t660NTrXjtLGrMTS8a3e9i1dAjF/4LUg=;
        fh=FMnDppApM8Rqa9KYzqp5hKeQzN3yRkkuMYn9MPhtjpE=;
        b=lsHD0sdG+wzIEP1S39AL7GMYtGs0JnfS2LjVlQ+2fKA+hdTDNa7eK3bS+YfuwemA69
         oej2Rq8gN05M4uwAfF1Wrq5pttDxYJVm4pixEF1stXyfXzlUWVTxj44YXIA6mXSTHmUU
         AWNMrRTeCstacc1J8+RWeNfkZqBaVzUUBVLGogMX8N1inRrBOMbYFTcXtRHZeFUsLyUK
         5GyZUw5fC5Bdp0wgYGURkZQCLj1/Z64rkrICkcFH39ZbLhTUHyGEPubNKc1xSzk+wy1Y
         5wNglWYRfmKNWwp2fxdATV+kIqVvmcUKITDB2Gd+y9gYZ+DNydhzh15zkiWgy/3vileX
         N0SQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787893032; x=1788497832; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xAjo1bmxd68t660NTrXjtLGrMTS8a3e9i1dAjF/4LUg=;
        b=J9umP/8UF7RLrxfs5Gt56+OkPTOYlqlOKTMEJJ1KE/2rIKiKVniP7dOllzMv7XBgiO
         VqvObnb1xOKyktImMA3BwQI7gfb1AO6gZ5Ifor0UM/F6Rn9ThKuUnCkzQ2zso+6oeabR
         jJjr6XqbRPqQyO1zTziYvooLpvZprZaDgDhywVDNafftZj6LHC9WVrDn0iKcJlw0/n9I
         RhlzLZ+6CBWMVrzLifg67/7jecRY0/jFiQ2hWjKKJwiYTuNM/J8y3PG5BG+FY8SNlZSE
         0kfI86OFAfaCm5z0txd8W/hpZ7KUy+odG+GaEij7GoG5sfM9pt+DtPSEHfdQfvqCPWnY
         NLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787893032; x=1788497832;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xAjo1bmxd68t660NTrXjtLGrMTS8a3e9i1dAjF/4LUg=;
        b=AhnPIGqxdjNGQGhZQNU16CYdor2ZXceA61jGG0FyaIF42ZQz4s+1iyp5U98LKIoZZC
         kdpVEIw9rLCtTyrjhDgwJm2zS/vu97D3UFCTwF7NRc/vz8afm54HCoQMTeBwM/173KtE
         OGTmgvbFHvCi91DvIcW1aeaBChnz7pFQBOeW0QKriyuxQoXmEdD8spIZj/fvd/ezd5rx
         sGCBRfuHYXP86B+wOt+zT/nZRdROIY7vt9WW4ubb/1jURwajDMF0mmZW5MVzJNCA8DXp
         CPJiF5EbOrOBTkmdeKXnZDEg85VtfKIWs/Y+nHHnmyzbGLxtqaVdvVJTIPyJjTh68S9O
         BPLA==
X-Forwarded-Encrypted: i=1; AHgh+Romgk25jWoXkpFzBLeYvPUeAuyuUzZCjBHliSPuJ0eGSLZeK1vO0l0lTsWKIkOXMjl6r2bPpVGF0DE/xQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kMsiqvEA+tTNhoYahZeWZbQX7XzlsptoWBy6pnvjZh9X8IIr2H
	Q8KxFnjuZXnV2lOV+VH3NpUCX3dXQEJji97F5fXcPrAvo9NqWAZ2Crw10AbzNCVhON+A7moflfl
	sfbeuzfzyrNdco7pXz9l+R/w8dB0wwHCK6qmU0Kyh4w==
X-Gm-Gg: AR+sD11Luyk+ugT9qb+VQphFduTMA2PlOUZdDu+drvwUufIWo7I/Y2rq/u3hSfZmgLM
	mJjaDkpZCh4j8ct356LRj+Rn0mgD6iiLRgL9hJKs3QFVS5+nVoFKKpN/AatQ5IG/2jUjCW4dDzf
	XU9gQzxOR8tKf6gHu78bpUstD35ejf/RGLymanNqayD8zpsG++wWFdqJR02ap6p2u+xGoaf8Lm4
	YWaVi4T3C1H/lFpN8CZtsy28kQvi+jsT+fbGIrYRYdEHF/Xikbx9Zwhr+6oiW/esIPbUPmh+apH
	AqbW+k1Z2A9OhexGtW6gKUrQefJoEmVdfIPDPKBpeinZOIoD/p7SVJ77ng==
X-Received: by 2002:a05:6820:5614:b0:6b1:2ca:c11b with SMTP id
 006d021491bc7-6b1c6703715mr2791840eaf.33.1787893031907; Thu, 27 Aug 2026
 21:57:11 -0700 (PDT)
MIME-Version: 1.0
From: Jimmy Ho <jimmy.ho@sifive.com>
Date: Fri, 28 Aug 2026 12:56:56 +0800
X-Gm-Features: AcwNN1W3e4ztIumw8DBbX4m3JDdrQIrd8AqpvyD0ujUMekSfuVmwDwWK-gW_9Y8
Message-ID: <CAJh9TS+k9P7bpa5gW+XV_da6JvA6TOGFJEdmsEmAULNAiZTBaQ@mail.gmail.com>
Subject: RISC-V genpd race in OSI mode (genpd domain power_off vs firmware
 suspend call)
To: linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: ulf.hansson@linaro.org, Anup Patel <anup@brainfault.org>, rafael@kernel.org, 
	daniel.lezcano@linaro.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, Nick Hu <nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_215713_908502_97A2656E 
X-CRM114-Status: GOOD (  15.26  )
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

Hi linux-pm,

We hit a race condition involving genpd's CPU PM domain (OSI-mode
hierarchical cpuidle, similar to the ARM PSCI OSI model) on a RISC-V
platform, and would like to get your opinion on whether this is a
genpd-level issue and what the preferred generic fix would look like.

Background
----------
Observed this issue on qemu platform
On our SoC, drivers/irqchip/irq-riscv-aplic-main.c registers a genpd
notifier to save/restore the S-mode APLIC context:

  aplic_notifier()
    GENPD_NOTIFY_PRE_OFF -> aplic_save()
    GENPD_NOTIFY_ON      -> aplic_restore()

CPUs are attached to this genpd via dt_idle_attach_cpu() (as in
drivers/cpuidle/cpuidle-riscv-sbi.c, mirroring cpuidle-psci.c). When
the last CPU in the domain goes idle, genpd_power_off() decides the
domain can be turned off (based on the "not_suspended" count computed
under genpd_lock). When the first CPU
resumes, genpd_power_on() decides to turn the domain back on and fires
GENPD_NOTIFY_ON, which triggers aplic_restore().

However, the actual SBI HSM suspend call (riscv_sbi_hart_suspend(),
similar to a PSCI CPU_SUSPEND call) is *not* issued inside
genpd_lock. genpd's power_off() callback only records which domain
idle state was selected; the real firmware suspend call happens later,
asynchronously, on each CPU's own cpuidle enter path
(__sbi_enter_domain_idle_state()).

The race
--------
Because of this gap between "genpd's software decision that this CPU
is last-man / first-man" and "the CPU actually issuing the firmware
suspend/resume call", we observed the following sequence

1. CPU0 requests a system domain-level power-gate (deep sleep, tears down the
   shared S-mode APLIC context) and hands off to firmware.
2. Before CPU0's request is physically completed, CPU1 wakes up,
   genpd_power_on() runs, GENPD_NOTIFY_ON fires, aplic_restore() runs.
3. CPU1 goes idle again, but this time system domain-level genpd reject
   request, so it fallback to core level power-gate
4. CPU0's original system deep power-gate request eventually completes at the
   firmware level -- physically collapsing the system domain, including the
   S-mode APLIC context, saved earlier by aplic_save()
5. CPU0 wakes up (e.g. UART interrupt), enters Linux, but system genpd's
   software state still says the domain is "on" (from step 2), so system domain
   GENPD_NOTIFY_ON will not be fired again and aplic_restore() will not be
   called

This looks structurally identical to the race TF-A's PSCI OS-initiated
mode documentation describes:
https://trustedfirmware-a.readthedocs.io/en/latest/design_documents/psci_osi_mode.html#races-in-os-initiated-mode


  "In OS-initiated mode, there are race windows where the OS's view
  and implementation's view of the system's state differ... the OS
  might request a powerdown state for a node from one core, while at
  the same time, the implementation observes that another core in
  that node is powering up."

TF-A's answer is to require the OS to encode a "last_at_pwrlvl" field
into the StateID passed to CPU_SUSPEND, which firmware validates
against its own view of system state before honoring a powerdown
request. We could not find any code in current mainline Linux
(cpuidle-psci.c or generic cpuidle/genpd code) that actually computes
and encodes this field dynamically per suspend call, so as far as we
can tell this race is unhandled generically today, on both arm/psci
and riscv/sbi backends.

Options we considered
----------------------
1. Implement something like PSCI's last_at_pwrlvl generically: expose
   genpd's already-computed "am I the last CPU in this domain"
   information through the power_off() callback API, so
   backends can pass it down to firmware, and have firmware validate/
   reject stale requests.
   - Pro: matches the documented PSCI OSI approach.
   - Con: We don't know how to set this flag properly in a generic way.
     last_at_pwrlvl is only meaningful on riscv/arm, so we can't just
     add it to genpd's generic code path. genpd also doesn't keep a
     counter of how many CPUs in a domain are still alive, so there's
     no existing state in genpd's power_off() callback we could read
     to derive the flag. One idea would be to walk the genpd hierarchy
     from within the power_off() callback and check the runtime_status
     of each CPU device in the same domain (genpd domains already carry
     a CPU mask, and get_cpu_device() can be used to look up the
     corresponding CPU device)

2. Do the power-domain control directly from the power_off()/power_on()
   genpd callbacks (e.g. have them poke the SoC's power controller
   registers via an SBI call, instead of relying on each CPU's own
   idle-entry path to trigger the deepest state).
   it creates two independent driver that will touch power controller
   (opensbi vs linux)

3. Have each CPU pass a monotonically increasing sequence number
   alongside its suspend request to firmware, and have firmware
   itself detect and reject/downgrade a deep power-down request if a
   *newer* sequence number from a shallower (i.e. "some CPU became
   active again") request has been observed for the same domain since.
   This is a firmware-side staleness check, entirely below the SBI
   call boundary
   this seq number can be maintained in gendpd generic code
   or riscv power_off() callback, where do you suggest this to be
   added?

Do you have any suggestion to solving this issue?
Thanks,
Jimmy Ho

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
