Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409F4C001DE
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 15:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uaBxv2DWCQCko85hRX4mmOBj1RtKMp3Z7ApSXi1kbjA=; b=FPa8lKZANxwggY
	eE0rmckonDlXGxBKRl0Q/64iZxWGLdhhL6+VKG09ZCIaeUkXGLPLz/d1nenFBWyZRV0cpE4ZZzfiJ
	Ge2P5HhMcWUsfMMcGAm6nrJ00dvMHtVsLoaWjj8OluBEul3QxwxChN5+zBYCvpejHnsQ8GNpVMi0h
	cZ3p6or++tvdSCwPSUru0b5B1vFBxnO9AhfK9E34GBMpugm/o5QIb69LHlPcz2DCNQZ7DG28yMtlR
	C6OH8YqNq7zWU9VGPswo449If3OqfuaGJcOUzS02qjfA502a+B+sBTNctIIAnXkiujqpRdnnuwtYK
	GO0P5kFExwfjRDfKxmPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJcAN-000QXI-3D;
	Wed, 12 Jul 2023 15:54:11 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJcAK-000QUT-1h
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 15:54:10 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-666e64e97e2so4044038b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 08:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689177245; x=1691769245;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENdFWLGX+AvB1bK16Fr9PBznhwFYP6hI+FTTAL1DdV8=;
        b=0/jJ62zVzIfwALA4eRjxinRTnh/WUikNk2zee5HN0Wi0PTj9bBLdpuDgWKgpbtHNgF
         /9NmaWoKkKs6y3YgpNQQvOpw3snzBTHfl/tUJhcmZ5tWEJ+KrPhL3w2PjBQUNyDeefCS
         JxHABTFsAtuqGNeOenWh19XcFxjk+djS2nIyjMKPRm6VWKBloW2BNv9E9jYAkvEQBahV
         u6sH3CehvS8tGzMJ6Kk2iHIcIgK7V/cQVg1Li5LjP62qDhd8VBt3dOxNdvA9cUnlpNec
         TAwgkZOotNNOmY2V5PSjdZJHbr2kJmB/juNVErlmlK4VSGCuWPY3Un7c6JSMzZIkC6U1
         qJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689177245; x=1691769245;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENdFWLGX+AvB1bK16Fr9PBznhwFYP6hI+FTTAL1DdV8=;
        b=YpcdQEaYkst1FNaLpEff3Qmp30z6BzONWTm4lSb0WjkmcMyKWdNiY4FA3fIHwZFt7L
         Fl6h1iCvRpfZz75la3J7I0mZVeh+MRekmrhZKTyaFPgf9H3AuNcYcitscWQR/G8PKonP
         X+7xn0rRSN32ZYM5adozGHzVm6wDGzjyJiUUhCKjOjtRY5VFlnlpXnUiqEUJ9PNI4b//
         1QrDEQeI31R7yK6VPbkrEilSA2RM0bPT5sPFK5/9xKrHfi+vmSzeBEfmK7Qzfl4/BtyI
         jmhDfvUQOqb38Exz3nXCF8Y+NSlsYGldcoYd9qqPbUbXFa2DmBI4S2swK5W2aY49q5EG
         5wDw==
X-Gm-Message-State: ABy/qLZOch6kWdJUeQhONGS9ymCVxLkrgXqvtXSWfCzddgR7yInpikzr
	o8lFJ17LO7U8JvDAseeP/E56Xw==
X-Google-Smtp-Source: APBJJlHhaZBQFN1lImTkqj2V2kw6YUqtObcnav1KaqjNyu1xB33lnBAPhj2UEL91h7/Ka6qOCQc5Fw==
X-Received: by 2002:a05:6a00:1492:b0:680:40b2:5424 with SMTP id v18-20020a056a00149200b0068040b25424mr20292863pfu.23.1689177244772;
        Wed, 12 Jul 2023 08:54:04 -0700 (PDT)
Received: from localhost ([50.38.6.230])
        by smtp.gmail.com with ESMTPSA id e26-20020a62aa1a000000b006749c22d079sm3739070pff.167.2023.07.12.08.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 08:54:04 -0700 (PDT)
In-Reply-To: <20230710154328.19574-1-eric.lin@sifive.com>
References: <20230710154328.19574-1-eric.lin@sifive.com>
Subject: Re: [PATCH] perf: RISC-V: Remove PERF_HES_STOPPED flag checking in
 riscv_pmu_start()
Message-Id: <168917713751.21773.4886524771952268051.b4-ty@rivosinc.com>
Date: Wed, 12 Jul 2023 08:52:17 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: atishp@atishpatra.org, anup@brainfault.org, Will Deacon <will@kernel.org>,
  Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Eric Lin <eric.lin@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_085408_564757_9AF78ED5 
X-CRM114-Status: UNSURE (   8.25  )
X-CRM114-Notice: Please train this message.
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


On Mon, 10 Jul 2023 15:43:28 +0000, Eric Lin wrote:
> Since commit 096b52fd2bb4 ("perf: RISC-V: throttle perf events") the
> perf_sample_event_took() function was added to report time spent in
> overflow interrupts. If the interrupt takes too long, the perf framework
> will lower the sysctl_perf_event_sample_rate and max_samples_per_tick.
> When hwc->interrupts is larger than max_samples_per_tick, the
> hwc->interrupts will be set to MAX_INTERRUPTS, and events will be
> throttled within the __perf_event_account_interrupt() function.
> 
> [...]

Applied, thanks!

[1/1] perf: RISC-V: Remove PERF_HES_STOPPED flag checking in riscv_pmu_start()
      https://git.kernel.org/palmer/c/66843b14fb71

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
