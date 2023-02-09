Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8EEC05027
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 23:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=gfxyJHpKCZtNpZ71Goid1E+kHPnhxcWvhWrBcEogzgY=; b=ufFdmiPdatOWfQF0mjA2S2WgZt
	d5vqBCxjdvLQcHz+XJZ+rLN3/G/KEURwx1a6oqGZTEIgHN8P01cm5sq/Pxn5LJ4Yk6dJw5lAatH6x
	9dBc6G/uTRq+Oc21GfMC4q6Atr1gcAhDTpVp/DWCXxPq9s7DVwkdmPv7fLZ7aLbsTx8V6J1YbORTC
	EhgKrI/JaVldh25ESonrsGco45Y+DliuXwJfJ1UVaof3vbp4m7I1x5gEwEwD4plsTvRfyoyyDXoyt
	w0h0n/IWp1sgDmZpF+ARoKSUfK+dUFkqAgasaWei5jVObYMCxkVqfx2cuWePTaoBML44RazrEWrnz
	sLpj5CPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQGeQ-003eAX-Ag; Thu, 09 Feb 2023 23:48:26 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQGeM-003e9P-RK
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 23:48:24 +0000
Received: by mail-pj1-x1036.google.com with SMTP id f15-20020a17090ac28f00b00230a32f0c9eso3887160pjt.4
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 15:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TbWYdqHwSto9YO7YB+6UGbw5fXLIzmmd65qc7lLKVWc=;
        b=voxfkaqKTjidecOv8HFOLzIviY9xDjRoVvioBFOWhSdCEJOPDorptBWE98l/Qd4mLF
         5vb87gMNXo95OnE3zYO9LqzZ//zrzdTxBnd7pHEJCuNxmmy5MDz0bYYvdcOpYBUNNRQe
         8jIuQAMrYIKrq2M09Z3cI4ZqAVE5CAO8p+TXFjFJtiUfB3xV6oDdJWuya3nJLH538xh+
         W2MuiRB1BrrgXit7boq1g4vjJZuh5XfcZwu2ggOqHoUBi03nbhbV+5cxSAJAG7KwlwJZ
         ubmNAqOnh9KwwbUw4tkgDQqbhdJVboD6t/EG8wNCfQm48Q/fJeleZhuR0I/qaoLKruFR
         MVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbWYdqHwSto9YO7YB+6UGbw5fXLIzmmd65qc7lLKVWc=;
        b=J7azEEumA7edGCGkuBNxGNyK9WiTrqSMT3pA0DwGaGBq6nCNbFmJSxpiAWiGlYOyXv
         bMWFEyz3SZSKSy+Jvarh2Ww696CK/gvgAOgFrF0mutPiI0Ntt/GOhp8ISd56/Q41oxTD
         +oNqD+MGQ+UIXUxIJ3Fuj3XIt43OKGZaRg/JIxsiNkZ4twLKgCb8Y4oHWO5V5yylFxK4
         J3VkFHQ0EWR0cnCUqHbdpx7KJvkQAxxUCucxx2l37cN+eKMtPxp/xXQx4QbRVxvyavUx
         wohZuu3aGJuGgYZvKSKbUn1v08K6IpMzoFjPcG5nQhJ8iZ2+ZQt9KPBlgFSnPEIsDUFc
         W4vw==
X-Gm-Message-State: AO0yUKV3nideToiSPX/b2nupkBd4oT9b1vfDh4bqK6vIL7JgSOOZiuL/
	uPIjtJU5LD0KVhuQBYSp5UIUUe3I7asHcKCf
X-Google-Smtp-Source: AK7set8BpY5cU5Bd5cEH6MQ9aM5cGH2OqoALs0sQq+FyHtNt11Dq6OnthUY0jZwTvEmqw/3PHOqajA==
X-Received: by 2002:a17:902:da8b:b0:199:bd4:9fbb with SMTP id j11-20020a170902da8b00b001990bd49fbbmr15173197plx.43.1675986498356;
        Thu, 09 Feb 2023 15:48:18 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id jd2-20020a170903260200b001946a3f4d9csm2097465plb.38.2023.02.09.15.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 15:48:17 -0800 (PST)
Date: Thu, 09 Feb 2023 15:48:17 -0800 (PST)
X-Google-Original-Date: Thu, 09 Feb 2023 15:47:34 PST (-0800)
Subject: Re: [PATCH] clocksource/drivers/riscv: Refuse to probe on T-Head
In-Reply-To: <Y+WEfc2fYd3qJmUe@spud>
CC: linux-riscv@lists.infradead.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, linux@rivosinc.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-c66f0475-5f2c-4aab-a532-7ce026fd5413@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_154822_908528_2A3632D5 
X-CRM114-Status: GOOD (  24.52  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 09 Feb 2023 15:40:45 PST (-0800), Conor Dooley wrote:
> Hey Palmer,
>
> On Thu, Feb 09, 2023 at 03:23:02PM -0800, Palmer Dabbelt wrote:
>> From: Palmer Dabbelt <palmer@rivosinc.com>
>> 
>> As of d9f15a9de44a ("Revert "clocksource/drivers/riscv: Events are
>> stopped during CPU suspend"") this driver no longer functions correctly
>> for the T-Head firmware.  That shouldn't impact any users, as we've got
>> a functioning driver that's higher priority, but let's just be safe and
>> ban it from probing at all.
>> 
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>> This feel super ugly to me, but I'm not sure how to do this more
>> cleanly.  I'm not even sure if it's necessary, but I just ran back into
>> the driver reviewing some other patches so I figured I'd say something.
>
> I'm not super sure what you're trying to fix here. That revert went
> through to restore behaviour for the SiFive stuff that do deliver events
> in suspend.

My worry was that we'd end up probing the SBI driver on T-Head systems, 
where it doesn't work (as the combination of SBI timer and SBI suspend 
depends on unspecified behavior).  So we'd be better off just failing 
early and obviously in the case, rather than letting users think they 
could get away with only the SBI drivers.

> Subsequently, we added a DT property (probably the wrong one tbh, but
> that's all said and done now) that communicates that a timer is
> incapable of waking the cpus. See commit 98ce3981716c ("dt-bindings:
> timer: Add bindings for the RISC-V timer device") & the full patchset is
> at:
> https://lore.kernel.org/linux-riscv/20230103141102.772228-1-apatel@ventanamicro.com/
>
> AFAIU, the binding for the T-HEAD clint was only accepted in the last
> week & there's nothing actually using this timer. IIRC, when I wanted to
> test the timer, Samuel cooked me up a WIP openSBI etc to enable it.

That makes sense.  I'd assumed these DTs just had the SBI timer in there 
(as a bunch of other stuff requires it), but from Samuel's reply it 
sounds like I was just wrong here.  I guess we're sort of in a grey area 
for DTs that aren't in the kernel source tree, but this code is ugly 
enough I'm OK just ignoring those.

> So ye, I don't think this is needed fortunately!

Ya, I think so too.

>
> Cheers,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
