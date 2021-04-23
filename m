Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E59C433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 03:00:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73B506144D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 03:00:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73B506144D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=btwA588pP0BUvrbjk92TBVZsi0qby2cab23wvFlp0wE=; b=Lh8dsyjQFTunpVnuyFhSw/xYG
	/Vmj16WrGQZ0GVBzTyEpHS4B0uzCtMCxDFoIHmjM057oGd1IC/02NhjoTrZm3+2VRixscJaBLLUSA
	UMfCYFi0WCe/HrafBHiUFxITGTTKGIK1SaHeu7uvw4vNQYvpVy6Tx0SM+rTRPK+NtE1/18b9pEcaS
	danoF1RsT3uvQZ5NfkCxmQ87arwaEuxpYCqUg19Hzjwqw2CyzudozWaqv6Ef7Vx9k4HYYCQFUItWF
	THUtcs20tlwjDtD9rh3OZMunt02sIOmt+0jS9vhYp0mAVZwE9/dicv2wpIAwOHQE9Rf8PwyN+0RM/
	gJH9x9kiQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZm2o-000PtO-HA; Fri, 23 Apr 2021 02:59:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZm0V-000Ph6-Sk
 for linux-riscv@desiato.infradead.org; Fri, 23 Apr 2021 02:57:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=arsdj8vKnkIONLNBcA7aqij2gyfUw/1l6TswIRx/eE4=; b=4bFAfTi6UrrlxBH5rAGrAo6znF
 60KMkJ/KqLm9LhhwZJN/1xWmUUyQ9bSaDAxH7pAR00gIJfeYOG//JGGG+DtU6MVG7spFQ78QJCJ+G
 09/PlTPQXPoM82+Pz/3pJ9gg1HQBaILnu7nj1f7Q6u0EmzB1h5TUtrrwyLFEHcfN5yJuri9nz2U7P
 J0uA4vv1LT/mH3w2t3/jBcx18AtG1nFwlx/5m/ZuXI/fWRU0gkQmE6CM+aDfiHN3vyBbdt9Vd1a0j
 jOyTSn5yknPy2y+cYYSMoxPJye93df2qtvHdxD/lIvhztiICh0+cn+A1oEsyCZa0V28bYaQeVOHm5
 HK+hiRaA==;
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZm0S-00E6eE-NQ
 for linux-riscv@lists.infradead.org; Fri, 23 Apr 2021 02:57:26 +0000
Received: by mail-pg1-x532.google.com with SMTP id t22so2779730pgu.0
 for <linux-riscv@lists.infradead.org>; Thu, 22 Apr 2021 19:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=arsdj8vKnkIONLNBcA7aqij2gyfUw/1l6TswIRx/eE4=;
 b=eXQfRFQnN2l37Rz03yVVNKTfVVWaEtnmnCBueTkCJYLwVSfwlr004PJ6fCbfI0cwtE
 dBsCscUZJdU2+UwOP0gRfKGO14+WjaToJlGk41YLfdasQvfmY3VbL1LvpKE4rBYNhxZh
 mpPP/78fHZw3MKVGAjLEZbeA/ol8zp/LO+oRGWxMbOeVPraD8VzMgI117jJW2jsQHiwz
 0nOzRqej7s5U2DAjBPFp1qw9t++5bOgiHRvkOqsiRJu7eFRYAMkuIPt4VLQHluU7RKPU
 Ip1ZclGanO2CLGZyAqSrPbFm9FrtftttqFwgpu9u75yuFGL5GuGkh4TNiUyFgI8ReH5K
 aZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=arsdj8vKnkIONLNBcA7aqij2gyfUw/1l6TswIRx/eE4=;
 b=nEYF9PA54oYVH3xhkxufoZueVKxtyFJk1mHF1Qo7l9U9/uxcDPrLr4XJw36DmvYCIs
 hiPc4GOtyspM7PhAb9wEvh8d2+bpwaofiJ2j1TMr25WhzBtVMlKa8Lbml5IH6X41DMTw
 pnG69s7OlfhPbGnFA9gds8e5m8haYvFny054UKNaSPODSf+ID8qTtqq9g145afSAK31T
 jBFrufSMohFWJfI2ls2KTGn8UgWtz/hcLaAQ0d2lZGcuKTruTJINLxeDxwJdx9tSVzax
 aZLTanU8TvI/NlUr4v2fYJQI2p+8/2H/ep0fUgS/cWMAXUhAs1F6GM10zikaeBZ6nuqh
 XKrw==
X-Gm-Message-State: AOAM530tdoQ+VfZ7m4PN1GIq0K4DUJdnrm8Ts8+ZZIfruDIJfnJbNK+j
 SewL3wDmbKyPDzkvJuoqR8uefknMMQi0dA==
X-Google-Smtp-Source: ABdhPJzD1/uApxHDzfK9xvzlqGuD4OZV/7g8PoNIwhou7rOFWia/5lQuW5JSlqS+QRA4LREGC9ONkA==
X-Received: by 2002:a65:5888:: with SMTP id d8mr1634494pgu.23.1619146643509;
 Thu, 22 Apr 2021 19:57:23 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id d4sm5796664pjz.49.2021.04.22.19.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 19:57:22 -0700 (PDT)
Date: Thu, 22 Apr 2021 19:57:22 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Apr 2021 19:57:21 PDT (-0700)
Subject: Re: [PATCH] riscv: Bump COMMAND_LINE_SIZE value to 1024
In-Reply-To: <alpine.DEB.2.21.2104022022300.18977@angie.orcam.me.uk>
CC: david.abdurachmanov@gmail.com, dvyukov@google.com, alex@ghiti.fr,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-api@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: macro@orcam.me.uk
Message-ID: <mhng-9e6b4607-6bea-411c-b843-916c1e0798ee@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_195724_785992_AFE81129 
X-CRM114-Status: GOOD (  38.08  )
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

On Fri, 02 Apr 2021 11:33:30 PDT (-0700), macro@orcam.me.uk wrote:
> On Fri, 2 Apr 2021, David Abdurachmanov wrote:
>
>> > > >  This macro is exported as a part of the user API so it must not depend on
>> > > > Kconfig.  Also changing it (rather than say adding COMMAND_LINE_SIZE_V2 or
>> > > > switching to an entirely new data object that has its dimension set in a
>> > > > different way) requires careful evaluation as external binaries have and
>> > > > will have the value it expands to compiled in, so it's a part of the ABI
>> > > > too.
>> > >
>> > > Thanks, I didn't realize this was part of the user BI.  In that case we
>> > > really can't chage it, so we'll have to sort out some other way do fix
>> > > whatever is going on.
>> > >
>> > > I've dropped this from fixes.
>> >
>> > Does increasing COMMAND_LINE_SIZE break user-space binaries? I would
>> > expect it to work the same way as adding new enum values, or adding
>> > fields at the end of versioned structs, etc.
>> > I would assume the old bootloaders/etc will only support up to the
>> > old, smaller max command line size, while the kernel will support
>> > larger command line size, which is fine.
>> > However, if something copies /proc/cmdline into a fixed-size buffer
>> > and expects that to work, that will break... that's quite unfortunate
>> > user-space code... is it what we afraid of?
>> >
>> > Alternatively, could expose the same COMMAND_LINE_SIZE, but internally
>> > support a larger command line?
>>
>> Looking at kernel commit history I see PowerPC switched from 512 to
>> 2048, and I don't see complaints about the ABI on the mailing list.
>>
>> If COMMAND_LINE_SIZE is used by user space applications and we
>> increase it there shouldn't be problems. I would expect things to
>> work, but just get truncated boot args? That is the application will
>> continue only to look at the initial 512 chars.
>
>  The macro is in an include/uapi header, so it's exported to the userland
> and a part of the user API.  I don't know what the consequences are for
> the RISC-V port specifically, but it has raised my attention, and I think
> it has to be investigated.
>
>  Perhaps it's OK to change it after all, but you'd have to go through
> known/potential users of this macro.  I guess there shouldn't be that many
> of them.
>
>  In any case it cannot depend on Kconfig, because the userland won't have
> access to the configuration, and then presumably wants to handle any and
> all.

It kind of feels to me like COMMAND_LINE_SIZE shouldn't have been part 
of the UABI to begin with.  I sent a patch to remove it from the 
asm-generic UABI, let's see if anyone knows of a reason it should be 
UABI:

https://lore.kernel.org/linux-arch/20210423025545.313965-1-palmer@dabbelt.com/T/#u

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
