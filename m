Return-Path: <SRS0=W16s=BP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF65C433DF
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 03:15:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C3EA207FC
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 03:15:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cq03Xg24";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="zJXG3v/h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C3EA207FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=hd4ToEuj/GA5bC9mO8pMEEs+qtcs9HoNHKYcqUCATPQ=; b=Cq03Xg24tpcMWzUZ6HByUwBSv
	Kh550Ueyfts8CwTEf+Tl+HpX37U+NFQLqTeqIUSHvt1Sf2MZ4fxvctmaiJ3fbrfFqVrxO1Uzc059P
	Z4zsjZI4IED+QisevJe9c9H1iMb4NTNRR3Rflvekn7opBI/4PMtZR3Of2JeAoiFuY0ojkRbEDeWPY
	teI7yAlcPb32zxDlPWrN5D0N4nnEa7ZFGtLYs+vKPiI4iUgAW2jirlNxoS70LDLEcbOKvXgTm7xkl
	UkGMk/2OwmfznIPS5E2QECxNMW7iw7XQ6v+EaSsFLLQDFy/sIYjB8jPnCsNf0z06e+O+Ks48fcjbo
	C6d4GYeeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k39tn-00025X-4W; Wed, 05 Aug 2020 03:15:27 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k39tj-00024u-VN
 for linux-riscv@lists.infradead.org; Wed, 05 Aug 2020 03:15:25 +0000
Received: by mail-pj1-x1041.google.com with SMTP id ha11so3531883pjb.1
 for <linux-riscv@lists.infradead.org>; Tue, 04 Aug 2020 20:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=VtIghFUUQN5mDIDgH3ibaPqJHhjrfIMsBIz4Kx+N5Ow=;
 b=zJXG3v/hVCrB+1rVcOQ6m9Yd0dtr2TN4bTZWw8Zu1q5/MQWvJ4DwFqCrIcfwGunIEp
 ucW/z3YH4km9BvKmyUXePzMMjY7EgMsbXoWGeRueG7leIua6KOTit+hv0QLyEhY007Io
 VFcoElqsSZkts2Evqn94Us0FFofeU+X0vJyPc7J0K6u/ma9K7E8rE/8v+A/bT9fWF7C5
 CHjKNqngi+xZAVGpkMVDUHIU87S50gkaXEb+OqkdzNnc1y4y440Tu0/ccW5d6CfKfys5
 Ptma1t87IloKNk5AuPTCYukFVebK9gKUXA2Z7jT6z4luMlaFrOVkl2LR9GCbaEbpi9yi
 yAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=VtIghFUUQN5mDIDgH3ibaPqJHhjrfIMsBIz4Kx+N5Ow=;
 b=HwyEKT4jdcFf6JbNVeF0AFoMOY8zLw3C4X1dUWM6Dd5OpzaG72hHbTuEsFlPWn7U9t
 Xx9xExEjjm+OZgt7CNgsguEuHoiPRu/Rug1/9rGMiaTdHGjx3NqrEPTJuE11YGNmuPGh
 +7nvcXMaIS/tNNKoxNDGUjKY8Z4mNzhueJA2gf4aA+Rtm1IGhwWdgh2TKLkfyoc/p4K/
 86EsYmncmdepYJyjbDCWHtmLpF0xMXw7I9uZeKAA+75pDaUk30tT9A/kVRn2Yrx8bT6H
 TctSSaw66OedqWdwD82Z9ghazYFloCaTWnLxJ5brdz7ypGva4guADE3kvzegMOZy4/8m
 ZHtQ==
X-Gm-Message-State: AOAM531aEQqdrzIUtp5qCTU+qXtURynowc/V0cHZE1nWvPdFqVWFmDte
 oAW/1wJ3OPA8+IvDiu+eM8CFMw==
X-Google-Smtp-Source: ABdhPJwACgfukRamo/zUHdUPi8KTwWhQHcSlNJgrqdqyEldAO2Q5ZM3XH0cxBgJ2eb195FpT47V41Q==
X-Received: by 2002:a17:90a:25a9:: with SMTP id
 k38mr1178872pje.103.1596597321290; 
 Tue, 04 Aug 2020 20:15:21 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id il10sm816178pjb.54.2020.08.04.20.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 20:15:20 -0700 (PDT)
Date: Tue, 04 Aug 2020 20:15:20 -0700 (PDT)
X-Google-Original-Date: Tue, 04 Aug 2020 20:15:19 PDT (-0700)
Subject: Re: [PATCH 1/2] riscv: ptrace: Use the correct API for `fcsr' access
In-Reply-To: <20200805024807.GM1236603@ZenIV.linux.org.uk>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: viro@zeniv.linux.org.uk
Message-ID: <mhng-2d0483dd-411b-4e2b-aae1-b8bb52417d29@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_231524_056265_6F47E1C2 
X-CRM114-Status: GOOD (  32.02  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, macro@wdc.com,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 04 Aug 2020 19:48:07 PDT (-0700), viro@zeniv.linux.org.uk wrote:
> On Tue, Aug 04, 2020 at 07:20:05PM -0700, Palmer Dabbelt wrote:
>> On Tue, 04 Aug 2020 19:07:45 PDT (-0700), viro@zeniv.linux.org.uk wrote:
>> > On Tue, Aug 04, 2020 at 07:01:01PM -0700, Palmer Dabbelt wrote:
>> >
>> > > > We currently have @start_pos fixed at 0 across all calls, which works as
>> > > > a result of the implementation, in particular because we have no padding
>> > > > between the FP general registers and the FP control and status register,
>> > > > but appears not to have been the intent of the API and is not what other
>> > > > ports do, requiring one to study the copy handlers to understand what is
>> > > > going on here.
>> >
>> > start_pos *is* fixed at 0 and it's going to go away, along with the
>> > sodding user_regset_copyout() very shortly.  ->get() is simply a bad API.
>> > See vfs.git#work.regset for replacement.  And ->put() is also going to be
>> > taken out and shot (next cycle, most likely).
>>
>> I'm not sure I understand what you're saying, but given that branch replaces
>> all of this I guess it's best to just do nothing on our end here?
>
> It doesn't replace ->put() (for now); it _does_ replace ->get() and AFAICS the
> replacement is much saner:
>
> static int riscv_fpr_get(struct task_struct *target,
>                          const struct user_regset *regset,
>                          struct membuf to)
> {
> 	struct __riscv_d_ext_state *fstate = &target->thread.fstate;
>
> 	membuf_write(&to, fstate, offsetof(struct __riscv_d_ext_state, fcsr));
> 	membuf_store(&to, fstate->fcsr);
> 	return membuf_zero(&to, 4);     // explicitly pad
> }
>
> user_regset_copyout() calling conventions are atrocious and so are those of
> regset ->get().  The best thing to do with both is to take them out of their
> misery and be done with that.  Do you see any problems with riscv gdbserver
> on current linux-next?  If not, I'd rather see that "API" simply go away...
> If there are problems, I would very much prefer fixes on top of what's done
> in that branch.

I guess my confusion was about "start_pos *is* fixed at 0": it certainly is
zero in the code right now, but when poking around while review the patch I
didn't see any reason that must be so.  Admittedly all I did was read the
prototype and function, so maybe I'm just missing something.  That said, if
it's all going away anyway then I don't really care either way.

As far as I can tell the patch set in question (the RISC-V one) doesn't change
any functionality.  I don't actually use GDB, but I haven't seen any issues
reported in a few years so if there is one I've missed it.

I did this ptrace stuff many years ago (IIRC it was actually my first RISC-V
Linux patch), and all I really remember is that it seemed way more complicated
than it needed to be.  I'm happy to just drop our patch set, as yours looks way
cleaner to me and if you're already planning on fixing put() then it doesn't
seem worth the churn.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
