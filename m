Return-Path: <SRS0=skt0=OR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E3BC04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  8 Dec 2018 20:25:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 570182081F
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  8 Dec 2018 20:25:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PwSYjMEp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="OghsouaC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 570182081F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=33OLiRcWX15ttJgxKGBuu1GAUEMko7cHPy8dR70DEsA=; b=PwSYjMEpgPfh9PKXS60W+/DvK
	rTekQ07XPs1kiD1xKsQQcq8H/rHbqM5+9KuQX50NM48IN8l8zJArxWp5ZK7210dLwicZbVqS//XEl
	DUX3plZwhGAuWyjgvzXgP0Y9gJ+VAkvAAiVPCdytxdf84UZcIzA2q4gV78uWysLj9I+8P1k5xjL/y
	sKgiGcXcL477OsLNBMN8T4Mox3+f//2HHwhPnLsGgWK7gI55eiiYCO9AYmX0SV6ufRbMtXrg07gEQ
	aNfXwksyuAeakwTzpmCkL1nDSLQt7IJ5p7YgQdVDyFCtuYcMxcS/VdQZGz5bK1boqXapKpPrpNaJi
	Klyceo7Ig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVjAd-0000fJ-Pb; Sat, 08 Dec 2018 20:25:51 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVjAb-0000eQ-64
 for linux-riscv@lists.infradead.org; Sat, 08 Dec 2018 20:25:51 +0000
Received: by mail-pg1-x543.google.com with SMTP id n2so3189514pgm.3
 for <linux-riscv@lists.infradead.org>; Sat, 08 Dec 2018 12:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=zf7bPVq52POSMrfUrt5neVYgh/TC1AOdO9lXUX5jff0=;
 b=OghsouaCWKSivNi/XjvklEEPKUxAJ4kmmZL4gbJ6d93x8Kgm0dcLb5Pj4NwxzKr/ne
 2vmygzxIAphi7WKbza4dwRj8m0+ALVQni7N0zmQXWHsY9F1oiFSX90tPtfa5WhkClXHI
 ee3OY+WDNBQl4ixVC3iLRT6Xq2SiFSfVcqpkLMHL1hkH426Na9CFGEpxeQdDALwWKVkG
 tPTmZ65VdzFzf+qXE+X1GUJCsOavXSVhZQXdFss3apaz16lW1ke35vTM7XNspJIq6Jr4
 NX11BWxYxUWdCjCvuyBAeyewp8mF2OzAtt8duLRRbakRvtlIXZmhmLq4ScBRbFXcXxak
 pbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=zf7bPVq52POSMrfUrt5neVYgh/TC1AOdO9lXUX5jff0=;
 b=I8xPDboK1vJf9MCp67rggJtui3l2nuqjcCzB7HlupGA4QBV1YmgDsWAiGz2+NNyzx1
 X3lbVDkQuktetp/XkULvrfW3E3dCzzImoInIY8k8FJIVs9AOpKEDxgBTFS+rR/SJ+3vm
 THX8XinPrUKRz6qivQTeGMwlb8xm85hvUxQf8M8xfiN27unV/xWgldQJ1j8OxCi7XPpH
 0xTok7Cxg4zP9+mh3b7saU7+CjkVpEMZPC5Gp8vebc+F0fsqUqF7ziZLfv7cJQz6uuca
 SOc7z3js19En/lFhNqLE7B8aAR6ZRqVD95W//RwP9FQ/zcykCLnpu7hfJ48pxpNw8CyS
 +m7Q==
X-Gm-Message-State: AA+aEWa99AhpjIef5VsDI626RIj79WaH37FJNy1nZCkq/3a5hbbEbCBB
 Gte1UqVR0t0e32jmqCX64yEcJw==
X-Google-Smtp-Source: AFSGD/V+C94EZll93WdKSRwJ8FhV0SgxdbKKUeOa2BHIBb1E0tBkeP4b5uiAkgTNulICTcsxT9QR1g==
X-Received: by 2002:a63:990a:: with SMTP id d10mr6095711pge.279.1544300737726; 
 Sat, 08 Dec 2018 12:25:37 -0800 (PST)
Received: from localhost ([216.3.10.7])
 by smtp.gmail.com with ESMTPSA id j70sm9270301pfc.43.2018.12.08.12.25.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Dec 2018 12:25:36 -0800 (PST)
Date: Sat, 08 Dec 2018 12:25:36 -0800 (PST)
X-Google-Original-Date: Sat, 08 Dec 2018 12:15:39 PST (-0800)
Subject: Re: [PATCH 4/4] RISC-V: Fix non-smp kernel boot on SMP systems
In-Reply-To: <CAAhSdy1gNB0sMAq4mtGSNJ96BND4tMxHShq==3B1hzL9ebs=oQ@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: anup@brainfault.org
Message-ID: <mhng-13731457-9a18-4add-983c-decbae526c81@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181208_122549_294253_7DBD3D78 
X-CRM114-Status: GOOD (  19.13  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Damien.LeMoal@wdc.com,
 aou@eecs.berkeley.edu, dmitriy@oss-tech.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, atish.patra@wdc.com, robh+dt@kernel.org,
 linux-riscv@lists.infradead.org, tglx@linutronix.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 07 Dec 2018 09:20:57 PST (-0800), anup@brainfault.org wrote:
> On Fri, 7 Dec, 2018, 10:30 PM Palmer Dabbelt <palmer@sifive.com wrote:
>
>> On Mon, 03 Dec 2018 12:57:31 PST (-0800), atish.patra@wdc.com wrote:
>> > Currently, clocksource registration happens for an invalid cpu
>> > for non-smp kernels. This lead to kernel panic as cpu hotplug
>> > registration will fail for those cpus.
>> >
>> > Do not proceed if hartid is invalid. Take this opprtunity to
>> > print appropriate error strings for different failure cases.
>> >
>> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> > ---
>> >  drivers/clocksource/riscv_timer.c | 13 ++++++++++---
>> >  1 file changed, 10 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/drivers/clocksource/riscv_timer.c
>> b/drivers/clocksource/riscv_timer.c
>> > index 39de6e49..4af4af47 100644
>> > --- a/drivers/clocksource/riscv_timer.c
>> > +++ b/drivers/clocksource/riscv_timer.c
>> > @@ -108,6 +108,8 @@ static int __init riscv_timer_init_dt(struct
>> device_node *n)
>> >       int cpuid, hartid, error;
>> >
>> >       hartid = riscv_of_processor_hartid(n);
>> > +     if (hartid < 0)
>> > +             return hartid;
>>
>> This seems like it's just hiding a bug somewhere else.  We should at least
>> put
>> out a WARN here, as I'm not sure the error will propagate anywhere useful.
>>
>
> We need separate DT node for riscv_timer. The riscv_timer is nothing but
> SOC timer accessed via rdtime and SBI calls. It can be viewed as one
> device. In fact, this is how it's done in ARM/ARM64.

We had that at some point, but this was changed.  The logic was that, since the 
RISC-V ISA mandates the presence of this timer for all harts, the RISC-V CPU 
node is sufficient to encode the presence of a RISC-V timer.

I'm OK changing this, but you should look at the old thread (which I can't 
find) to make sure all the arguments are taken into account.

>> >       cpuid = riscv_hartid_to_cpuid(hartid);
>> >
>> >       if (cpuid != smp_processor_id())
>> > @@ -115,14 +117,19 @@ static int __init riscv_timer_init_dt(struct
>> device_node *n)
>> >
>> >       /* This should be called only for boot cpu */
>> >       riscv_timebase = riscv_timebase_frequency(n);
>> > -     clocksource_register_hz(&riscv_clocksource, riscv_timebase);
>> > +     error = clocksource_register_hz(&riscv_clocksource,
>> riscv_timebase);
>> >
>> > +     if (error) {
>> > +             pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
>> > +                    error, cpuid);
>> > +             return error;
>> > +     }
>> >       error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
>> >                        "clockevents/riscv/timer:starting",
>> >                        riscv_timer_starting_cpu, riscv_timer_dying_cpu);
>> >       if (error)
>> > -             pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
>> > -                    error, cpuid);
>> > +             pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
>> > +                    error);
>> >       return error;
>> >  }
>>
>
> Regards,
> Anup
>
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
