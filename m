Return-Path: <SRS0=/DNs=NT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FF0C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Nov 2018 02:10:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90CD320818
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Nov 2018 02:10:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m2/kIbbH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="fk6kgpfl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90CD320818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=XRobb0tD/Ue4vjumomQCxMeC3sYd3Ykp8L9bPfzlB9Y=; b=m2/kIbbH1o20eHQLlHMVMfsO2
	dzv+jjIlGKpgC9hXowMFzKdkh9Fd66BdNHaWROsBeCP/Uo7YPnVJzVf9oEevizvJJ0Hk2UvYrXICh
	BdLdZhQuz36dXywCyTS35DDw00wQ5CnHv3R+FYbEbA3xZaVX2mIpUCmcCR/oztYcyxQBqXNsNcRKk
	2cZGmClIhqrKVv+3fzuW1freK+/8O0JNTjzICxGS+vGv85Vk2AxTrWc5zhHiQHXeMF6h/8CW2Dize
	qw87ImQ7ES+altJEDOHwUOg6NmNqj2nFu1DGdhHWk5oqeX8gtTTnd/PX+tIbSDnEZ7m96FYSecif/
	LqqoK3lDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKZm7-0007sg-I6; Thu, 08 Nov 2018 02:10:27 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKZm4-0007rm-LS
 for linux-riscv@lists.infradead.org; Thu, 08 Nov 2018 02:10:26 +0000
Received: by mail-pf1-x442.google.com with SMTP id u13-v6so8571071pfm.4
 for <linux-riscv@lists.infradead.org>; Wed, 07 Nov 2018 18:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=7kEW53Tsf4vuHdcoSOTmu0pyxCYFBfcemBPKy1+w5vQ=;
 b=fk6kgpfl8XwG70W9Sc7cvloIkP5a89O+EiOwfsrji8K2IovJJiWEUhb4pDARDlfXlg
 jr4/qNuTnhtf9fkmuPoNIkaVfpOnbl3O7oORzPrZXatvG/UkJIqFpAu0Gws1SVjxQCho
 Lbd4tiqEyIFaDcXprjoxWQ8cks7WaFXKIQY2g/W2A0RB7cbCAYFEJMzvwDxySpJyLUer
 So6s2l+8MNjwqYMUufHEKvZpPqZvPRt0L7bHGThvGJpl9tfjwO2T0HBkp3HE5nWu65Ur
 swkRZeISUvO5jh/FDnjT4TtV6x1fe1dK+LyVtpwzbx4KrGKxMyHDoK21xjrD/AKXuut6
 bUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=7kEW53Tsf4vuHdcoSOTmu0pyxCYFBfcemBPKy1+w5vQ=;
 b=iqFSr3r620lYdbWYW0y3aekwh/dbPkHFpmUqMtvAsukydcs8Yk1a/3EPb4LU6Gd/0W
 ZkmGq8LdFzpVkE/TKdnmd+65sv8ZyJM+Uo4qxCwI4OyjTCOY4mru8qV2m6uUGR4J6/mx
 JjpF45mAiBRJRAe/tAYeMTAihOGwEi6ajmWvo6ry2AdVUox3AacN6QBZRyhwfXRtzOWz
 fZlP31CeXDr8uffjNz86f8ypXTip5W8R6T+sbRCMvPTzQf9H74UfF/uJv73x74YCgqbQ
 pEketrxuEaRRYoHBWzuMEJSwjyJyK3EBr2pLRskv2vPusoYaecpxHVPp6FX9U26a9B/3
 AMqw==
X-Gm-Message-State: AGRZ1gLCnbVeECvUCy3Tsy8abELFDvInZBLpyXg965NlbbChf2LQGDNv
 iCevhQ6aCVYUtbFuOm7qrl+KUg==
X-Google-Smtp-Source: AJdET5dU2vSAIUZy5vwCvt7RN6sDay0vRPm764BHcjREYrRjeOdiizp25PZyoDsOMnY45bjvh7BZWw==
X-Received: by 2002:a63:5153:: with SMTP id r19mr2257317pgl.281.1541643010023; 
 Wed, 07 Nov 2018 18:10:10 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id q76-v6sm2512764pfa.18.2018.11.07.18.10.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Nov 2018 18:10:09 -0800 (PST)
Date: Wed, 07 Nov 2018 18:10:09 -0800 (PST)
X-Google-Original-Date: Wed, 07 Nov 2018 18:09:18 PST (-0800)
Subject: Re: [PATCH] riscv: add asm/unistd.h UAPI header
In-Reply-To: <CAK8P3a30Dmq3vp-+=jvVu8VMe+GKc9dU=+ZF0rzhFiUq2NuJ_w@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-23f94805-b961-4e68-a4c1-7d79b60bd925@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181107_181024_703065_B0CED747 
X-CRM114-Status: GOOD (  15.43  )
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
Cc: aou@eecs.berkeley.edu, david.abdurachmanov@gmail.com,
 linux-kernel@vger.kernel.org, marcin.juszkiewicz@linaro.org,
 linux-riscv@lists.infradead.org, linux@roeck-us.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181108021009.WgfEoFoZSGicAGY1bEei_w3KO73fEms6PB1SpKIL9ec@z>

On Wed, 07 Nov 2018 13:09:39 PST (-0800), Arnd Bergmann wrote:
> On Wed, Nov 7, 2018 at 7:30 PM David Abdurachmanov
> <david.abdurachmanov@gmail.com> wrote:
>> On Wed, Nov 7, 2018 at 1:08 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>> > On Mon, 05 Nov 2018 12:56:15 PST (-0800), Arnd Bergmann wrote:
>
>> > The target is still the next glibc release (Feb 1st) for a stable RV32I ABI.
>> > That's progressing well, with one last blocking issue related to some of our
>> > floating-point emulation routines before we can submit the port.  This should
>> > give us ample time to line up the ABIs correctly so everything works.
>> >
>> > So I think the correct answer here is to drop __ARCH_WANT_STAT64 from RISC-V.
>> >
>>
>> Then if you agree I could do and send v2:
>>
>> +#ifdef __LP64__
>> +#define __ARCH_WANT_NEW_STAT
>> +#endif /* __LP64__ */
>
> Looks good to me.

This is a bit pedantic, but I'm not sure what the right answer is here: 
"-march=rv64gc -mabi=ilp32d" will not define __LP64__, but will define 
"__riscv_xlen == 64".  I actually don't know enough about how an rv64gc/ilp32d 
ABI would work to answer this: would we have "long long" all over our syscalls?

Probably not worth worrying about for now, as we'll have to go audit all of 
these if we ever end up with an ilp32 ABI.  So just go for it and we'll throw 
this on the pile to deal with later :)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
