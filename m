Return-Path: <SRS0=H4U1=MV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1466AC4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jul 2021 04:30:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1D1161040
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jul 2021 04:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D1D1161040
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=9fPNWZZPj++JRN17AIoZrf8o/TB7kqrKc3Hyo7UNznc=; b=dxREu1eWUSo0m6kiyn3iC82dKg
	rXB4Rwu3/pA54eaOIi04Ey3MhN7Jr0mVLS3gco1X0T0+I+Cj3N/y7aof2e87cZKEXOpnOxrnYPFst
	eQ61nMAcHm8YoVCGXRMsqIKo5Y9j0WSHzLVzka1DsDXcQ/kegYYfnFtLl8Fg3GAOFz9Dir/2rKknr
	U4tDGjtrdOJa6pFAMeNvNCRy6LeGDJNfiBAAtplDlgCuMDgpRnRJ3RGmYXhfqs8lCwlHnund+4X5z
	6cUBtrvZCcNEULImmhqPbZpmrx/dEkZ1bpzgIGA0NfUxLjZCL9HtOBobPDdexcXWqEQ85a/31y6yw
	fAoh10/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8xgk-0033yL-85; Thu, 29 Jul 2021 04:30:30 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8xgg-0033w6-Mh
 for linux-riscv@lists.infradead.org; Thu, 29 Jul 2021 04:30:28 +0000
Received: by mail-pj1-x1030.google.com with SMTP id j1so8421743pjv.3
 for <linux-riscv@lists.infradead.org>; Wed, 28 Jul 2021 21:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=r5qJLsWAEhPcHvajOIKkhTOz7l5fXoAdAbtdJ9zbKtk=;
 b=Q86TpW5I0znqVc+apP3BPb/AIu+ZMA7Y7RBJURS9q38hVOM5CB6KzIfy5NFXTmi2A2
 5OvecmcEubsVRmQJA7Qf+/gcM6S9x0MnhYuWtWkO4usV+lBskgriqJ0BEW3SQuaHH61X
 CSnYLol3lLvPAKivObS8tfJ/Gc70QVEnJqEz4wtfQrXED1yNBuDc+v5Wn5hmS2ZDyYuX
 vykBxBxLjRsFdpC4q/e4oIDDLLvqklQBHyAkV/SX71d+0Jro+i8hrU/KPZZbjX89MQdt
 w65N9mbpRg5uMPiCmAa9m46aRoMLdExB3v6VoCqHPU38QxjJ76ugMsEeaE3jhDMmHnv1
 WbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=r5qJLsWAEhPcHvajOIKkhTOz7l5fXoAdAbtdJ9zbKtk=;
 b=SAdenHizZZyaNHwcfjVY6oOaykm+1LXS3XD3k8um329K24PaW/Zq5p/VTO6CAdMRpL
 SHs8w6RY0hyG/eEUwxqyAowvA55u1fQ05XjeLDAADBSrAsy2fP5RUY7wxWNPw5+rtPx9
 9igjhQXFkHn0BK+q9lp18qWUa62EtG+gTNXZ3SpqJw9CwP9NxjhjAHdw+ok7mrkxLWW2
 Z2u2M1ifdw4H8W8ibp+o8UqWduJbfQVXSlZv/fByyW02eyAyKyjyO3FtbDcQnpJ3g80l
 uAoWZaL9C4XYAn4XrDkOaCCsfHelxD+ikIkiBpNXV/3/mvWTJLEBD1MZdOjyya/plEMw
 HsLQ==
X-Gm-Message-State: AOAM530wHkCMR9QaXwQwoV3olJTVY7W5406XMnQfi7B2kNUZzKz2zn/Q
 pll0TqRO+1f/DsoYXO1ivw/lgg==
X-Google-Smtp-Source: ABdhPJw3SvJQlvvPQ4XX9lqXTB2Eg+0Y5qeOAYr7uHk8BfoCC2cp0TE4CD8Kga1iRtVepSUFZ9yVYw==
X-Received: by 2002:a17:902:dacd:b029:12b:acab:b878 with SMTP id
 q13-20020a170902dacdb029012bacabb878mr2857505plx.4.1627533022446; 
 Wed, 28 Jul 2021 21:30:22 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u188sm1720773pfc.115.2021.07.28.21.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 21:30:20 -0700 (PDT)
Date: Wed, 28 Jul 2021 21:30:20 -0700 (PDT)
X-Google-Original-Date: Wed, 28 Jul 2021 20:38:34 PDT (-0700)
Subject: Re: [RFC PATCH v2 00/11] Linux RISC-V ACLINT Support
In-Reply-To: <CAAhSdy1rA9e2iCJWeVEQwKTRfTZZaRZVcMe1o8wMnFiWOOGW3w@mail.gmail.com>
CC: Marc Zyngier <maz@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 tglx@linutronix.de, daniel.lezcano@linaro.org, robh+dt@kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Anup Patel <Anup.Patel@wdc.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: anup@brainfault.org
Message-ID: <mhng-7fd3d454-cd80-4ede-baed-08003d66b3a4@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_213026_824968_F83209A7 
X-CRM114-Status: GOOD (  30.82  )
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

On Mon, 26 Jul 2021 06:01:01 PDT (-0700), anup@brainfault.org wrote:
> Hi Marc,
>
> On Mon, Jul 26, 2021 at 8:02 PM Marc Zyngier <maz@kernel.org> wrote:
>>
>> On Mon, 26 Jul 2021 13:45:20 +0100,
>> Anup Patel <anup@brainfault.org> wrote:
>> >
>> > Hi Marc,
>> >
>> > I have taken the approach of IPI domains (like you suggested) in this series.
>> >
>> > What do you think ?
>>
>> I have commented on the irqchip driver.
>>
>> As for the RISC-V specific code, I'll let the architecture maintainers
>> look into it. I guess the elephant in the room is that this spec seems
>> to be evolving, and that there is no HW implementation (how this
>> driver maps on SF's CLINT is anybody's guess).

There's a long history of interrupt controller efforts from the RISC-V 
foundation, and we've yet to have any of them result in hardware.

> The SiFive CLINT is a more convoluted device and provides M-level
> timer functionality and M-level IPI functionality in one MMIO device.
>
> The RISC-V ACLINT specification is more modular and backward
> compatible with the SiFive CLINT. In fact, a SiFive CLINT device
> can be viewed as a ACLINT MSWI device + ACLINT MTIMER device.
> This means existing RISC-V boards having SiFive CLINT will be
> automatically compliant to the RISC-V ACLINT specification.

So is there any hardware that this new specification enables?  It seems 
to be a more convoluted way to describe the same mess we're already in.  
I'm not really inclined to take a bunch of code that just does the same 
thing via a more complicated specification.

> Here's the RISC-V ACLINT spec:
> https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc
>
> The RISC-V ACLINT spec is quite stable and we are not seeing any
> further changes hence I sent out RFC PATCHes to get feedback. The
> RISC-V ACLINT spec will be frozen before 2021 end (i.e. before next
> RISC-V summit).

Have you talked to the other ISA folks about that?

As far as I can tell this new spec allows for multiple MTIME registers, 
which seems to be in direct contradiction to the single -MTIME register 
as defined in the ISA manual.  It also seems to be vaguely incompatible 
WRT the definition of SSIP, but I'm not sure that one really matters all 
that much as it's not like old software can write the new registers.

I just talked to Krste and Andrew, they say they haven't heard of any of 
this.  I don't know what's going on over there, but it's very hard to 
review anything when I can't even tell where the ISA is defined.

> The Linux NoMMU kernel (M-level) will use an ACLINT MSWI device
> for IPI support whereas the regular Linux MMU kernel (S-level) will
> use an ACLINT SSWI device for IPI support.
>
> The ACLINT SWI driver is a common IPI driver for both ACLINT
> MSWI (Linux NoMMU) and ACLINT SSWI (Linux MMU). In fact,
> the ACLINT SWI also works for IPI part (i.e. MSWI) of SiFive CLINT.
>
> Regards,
> Anup
>
>>
>>         M.
>>
>> --
>> Without deviation from the norm, progress is not possible.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
