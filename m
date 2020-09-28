Return-Path: <SRS0=7Vio=DF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE360C47431
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2020 16:47:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B15B2073A
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2020 16:47:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p3ZFeHTA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="AqQExuuf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B15B2073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=OliFCF6DptatGJKOZ9PqRQfvgE62QifIKp2EPledWqk=; b=p3ZFeHTA9qgIx9mro2Cd0EcAG
	K74MrQknsETuwj4mB9faeesJ7cHjEqB9yT5N6YzXE5YBGj9lDzWvEZ3is2cO7UIuhaPvBvpLpd6Rp
	5eSyPQdvNvkSnMSFNZy0mX1b8DlcNdEGoh8E3EsaxEQh9htRzfMlnW5j1GV3IL5jyfecOumng+MSy
	GWTl4xzcK5EjLFRMoP2+XiL/oVm7FWa4lLfRU76YO9X1C/6nf+x6H+3JwC3j8vAYJnSh9mwZvVASX
	JN50SeVp48tiLTHEdYXgIOa4RguN64moH2FTpBsqVAdUX/Shoz+8pJYotkSJCdnActtzbOehbN0Y0
	UAeF9PbEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMwJ9-0006AN-6E; Mon, 28 Sep 2020 16:47:23 +0000
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMwHQ-0005FK-U6
 for linux-riscv@lists.infradead.org; Mon, 28 Sep 2020 16:46:02 +0000
Received: by mail-pg1-f196.google.com with SMTP id 7so1333632pgm.11
 for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2020 09:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=k5CJhKG0GbJaPZMSQdNzm2ZEeN1+360gQym/jYiLma0=;
 b=AqQExuufL4ixmO5/UkGibL3PcztVwBX8O7C4i1UIWVFxMUZPsLVdhF5Fjo9eBPQnYt
 j3j3aEfYHBfGQX67Mj2YACZXHEHUVkn9DfAmHWFo0t9w3dn2/D0JbaMFFzM9BZzjcbYX
 PfjtwgMcignt7LJnGbHBMXEbX8Z0AytN8hN5XVj/VfwdFqiwVzkXDW7Mr2GqOP8pYbMF
 TVko7kR9uCWOv/oEZvem9CrM7u3HYAIWIrDh+zLyG3TcRLw5A9ykRx/c8K5ZJu20ylDf
 4180YnTsy1CE/aP/Lu17Hxm4FpOgdq+t4WoGagvXZs36ZwgceawDRcFUBsH1U68uIdD2
 xCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=k5CJhKG0GbJaPZMSQdNzm2ZEeN1+360gQym/jYiLma0=;
 b=qdCW4Wkr0YPsfpFgPOusfFUYeHrAEZRnXLv1jmQDRKQLXMuX0UhanFN6hL3oZ5uJw0
 zrOC0rbZq68ogCVXiWHy3QNfKfOJgErurBh3TXdG8Y8/InQBhTFFzR3Fa6Ro93lsGDGm
 zSpJ9g2DI60qyrduCF1OpU51uyQnWC08SUTBzVRRbrTqtywYAYnUHDOhset/QA/aeHY5
 NrYJh5bcSRAg8Xi5os+2rPNcE3Rxc0/jvsXi/kywEmG6kPsNOJqzQX0VoELO/zYPskmB
 nnRiZZXN3Ny5R687U5zBmTobNbQ0/KNYVlIlbc6U7eoVMXTrQqqV1JR/9WVJQYbmmIbA
 O6aQ==
X-Gm-Message-State: AOAM533XuIxJblnghqqHctsRrx3ydfMHDANBvYJ2tAOeH9JXsw+iET4I
 neO8rYQo/EvDkYp/MraAycLMOg==
X-Google-Smtp-Source: ABdhPJwJo4C3QCkhpc5E6SNAbf9qW6KUQzb1KDeTrpgbWI5Op/tVKk2PV+95gaM7lOraa7QOH6n1aQ==
X-Received: by 2002:aa7:9f99:0:b029:13e:d13d:a134 with SMTP id
 z25-20020aa79f990000b029013ed13da134mr284820pfr.28.1601311530896; 
 Mon, 28 Sep 2020 09:45:30 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q16sm2392966pfj.117.2020.09.28.09.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 09:45:30 -0700 (PDT)
Date: Mon, 28 Sep 2020 09:45:30 -0700 (PDT)
X-Google-Original-Date: Mon, 28 Sep 2020 09:45:28 PDT (-0700)
Subject: Re: remove set_fs for riscv v2
In-Reply-To: <20200928124928.GA5834@lst.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <mhng-a034d2ee-67eb-4432-be9e-66fff000acda@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_124537_005450_72B9556C 
X-CRM114-Status: GOOD (  22.15  )
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 28 Sep 2020 05:49:28 PDT (-0700), Christoph Hellwig wrote:
> On Sat, Sep 26, 2020 at 10:50:52AM -0700, Palmer Dabbelt wrote:
>> On Mon, 21 Sep 2020 21:37:52 PDT (-0700), Christoph Hellwig wrote:
>>> Given tht we've not made much progress with the common branch,
>>> are you fine just picking this up through the riscv tree for 5.10?
>>>
>>> I'll defer other architectures that depend on the common changes to
>>> 5.11 then.
>>
>> I'm OK taking it, but there's a few things I'd like to sort out.  IIRC I put it
>> on a temporary branch over here
>>
>>    https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/log/?h=riscv-remove_set_fs
>>
>> under the assumption it might get lost otherwise, but let me know if that's not
>> what you were looking for.
>
> Well, we'll want it in linux-next and then 5.10.  Either a merge through
> the RISC-V maintainer, or as part of the base branch from Al would
> make sense to me.

Sorry, I guess my question was really: does that branch have all the
dependencies necessary for the RISC-V stuff to actually work?  IIRC this actual
patch set depended on some other one, and while I thinK I got everything I
don't want to pull in something broken.

>> Arnd: Are you OK with the asm-generic stuff?  I couldn't find anything in my
>> mail history, so sorry if I just missed it.
>>
>> Al: IIRC the plan here was to have me merge in a feature branch with this
>> stuff, but it'd have to be based on your for-next as there are some
>> dependencies over there.  I see 5ae4998b5d6f ("powerpc: remove address space
>> overrides using set_fs()") in vfs/for-next so I think we should be OK, but let
>> me know if I'm doing something wrong.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
