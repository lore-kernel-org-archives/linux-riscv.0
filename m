Return-Path: <SRS0=LGYn=NG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D1CECDE46
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Oct 2018 19:33:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EF0C20834
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Oct 2018 19:33:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pzj7KhT/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="LxoATBM+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EF0C20834
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=UygpnMrs3GPMm4XMxCA76Dd3NwZ+nI6wSNBqdZtTbME=; b=Pzj7KhT/fsSu1pgLeW/XhZbeu
	RfgG6rAVoQSDNsZjrCTBk03h9XC7clPJUY8lXyl+BPUnrwDcGuSn1En78kzwbckpr3x7smAUTQACh
	18FKBhZI6rd7ZQDLCr8dAm7lTQSmEshsHLU4I0Gx6h2k8OBlXbjNuixi9Lo+grcFuU2GH3gzuMm3/
	L/eHxIDSogAKJZWcUGhO1qlDnTv2BSBghhYSmnHnSWXEC8rjGVw1aEPG5mNp8yCWcbIUbJdfOe0hZ
	4GLepHMWnHTFKMMC/SjvmWHgQOlFJvHBiItkop5dVqHQQsNRNOEfqBWdqZ47NrPcBkN3KPOtaOnLr
	nXai9TC+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gG7rG-000680-3v; Fri, 26 Oct 2018 19:33:22 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gG7qu-0005u3-CI
 for linux-riscv@lists.infradead.org; Fri, 26 Oct 2018 19:33:09 +0000
Received: by mail-pf1-x442.google.com with SMTP id r64-v6so1005141pfb.13
 for <linux-riscv@lists.infradead.org>; Fri, 26 Oct 2018 12:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=x0Wn+vfPKKXHEvMKPA0d/KQJi/QqD8ugXxafW72W89U=;
 b=LxoATBM+BvaqAzgEbMwClM/pSMZZK/dh9NDTqbKduZt3vh3qEcOi34eefm+NYVTS4E
 86q7WnZ/poIUEAYXdO8UGyCY0Tn6P9riRZH40srasb6gpZulupWb2E5P5+CF8Vb7euZq
 XFG1iKAND94Qi6wnEcB1z8959dhl4+6Q6KIqnPsTq+B++pN9quf/DPXjd26WrK7CNitA
 zmSJ1CtTjS3denuOaJh6mCHBwYaoPZGLIy+lkEcK8ole94NOC6KRXxSh5PYK5th2DH+S
 cXIMjx3FPlC9y73rBIvh9JPila2/DPBF9tDDXsIasYJ0ETKy9KZvxDMkKio/v3cdyyBV
 h8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=x0Wn+vfPKKXHEvMKPA0d/KQJi/QqD8ugXxafW72W89U=;
 b=Np0oqXTe7Jx89XZ9TLx3wW5eKyQBfiuSwzqMG/8D8ASpkDo+pIvytzBfP2wTdgmsIt
 3r6lkPBQbl56M6DjPCB51/aehXpGi/6hT4DvfwbXreImfj2kd4YVeNLuaHQhLofYqhci
 dUcIbSsr62HGm9EtoRfyrC1hAR70/ZkLlPT3BOC4mwAtgtpBqyDmUVuJdM6F3XsQLpYc
 SPIUB/NXl62Vx5o+TEc7f/929q3RQJ28tInk5rcjahWQ7C8PRqIOBsCzTiN2ZIv028+G
 VpQW5njdn/ni85S7CGZ/6Hu3TMGEYvPhZ+TVCk0OD4GAFsknip6IoseSl2LjUnaD18Tw
 +4Ow==
X-Gm-Message-State: AGRZ1gJjdyt22e/QRv/gemLepJuEm7pLXyp5Z17TwI+QkpAVdD5cxmVM
 2FvFNYC/AWJ4rCoq/GVXk37ZJlY4KGA=
X-Google-Smtp-Source: AJdET5c+PkKRSMzJuNFIyzYMR2kU1zi4qQjMN0/Crs08cRw8Sp2moQPisEsJJRu6nkHg1cJ7r1LzHQ==
X-Received: by 2002:a62:104b:: with SMTP id
 y72-v6mr5073637pfi.113.1540582368497; 
 Fri, 26 Oct 2018 12:32:48 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 64-v6sm28317024pfq.10.2018.10.26.12.32.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Oct 2018 12:32:47 -0700 (PDT)
Date: Fri, 26 Oct 2018 12:32:47 -0700 (PDT)
X-Google-Original-Date: Fri, 26 Oct 2018 12:32:44 PDT (-0700)
Subject: Re: [GIT PULL] RISC-V Patches for the 4.20 Merge Window, Part 1
In-Reply-To: <CAHk-=wimJ+g2O7DND0XZ54XZSrY_aiVWsiyyAXL9T1+=BG9Ptg@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-5d10d061-df2c-4077-9ff3-4e3845f85293@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181026_123300_472699_92206EA6 
X-CRM114-Status: GOOD (  18.83  )
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
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181026193247.q0Vi8ik1fC_ePKa1H3TupuG4Ti57u8h9ts6Sft4YiH0@z>

On Thu, 25 Oct 2018 18:12:46 PDT (-0700), Linus Torvalds wrote:
> On Wed, Oct 24, 2018 at 1:42 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> I'm pretty sure this is our largest patch set since the original kernel
>> contribution, and it's certainly the one with the most contributors.
>> While I don't have anything else I know I'm going to submit for the
>> merge window, I would be somewhat surprised if I didn't screw anything
>> up.
>
> So I'm not entirely sure this is a screw-up, but it does have some
> signs of being one:
>
>>       lib: Add umoddi3 and udivmoddi4 of GCC library routines
>
> We have *actively* tried to avoid needing umoddi3 and friends, and
> have so far succceeded in doing that across many different
> architectures, and many many years.
>
> And when we _have_ added it, we've added it as architecture-specific
> optimized routines when people really need it.
>
> The reason to avoid a full 64-by-64 divide is that
>
>  (a) it is really expensive
>
>  (b) code that needs it is almost always actually wrong
>
> Almost always, the 64-bit divide turns out to be entirely pointless,
> and the code can be written as a (much cheaper) 64-by-32 divide
> instead using the functions in <asm/div.h> instead.
>
> Does RISC-V _really_ need that disgusting full 64-bit divide, or was
> the addition of that simply a "we didn't know better, and didn't
> realize just how expensive and wrong it is"?
>
> I've pulled this, but I really _really_ hope that I will get a second
> pull request that gets rid of this again, and fixes whatever RISC-V
> code that triggered this to just do not do an insane full 64-bit
> divide on a 32-bit architecture.

Thanks.  We'll go figure out how to remove it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
