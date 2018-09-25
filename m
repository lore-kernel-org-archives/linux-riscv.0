Return-Path: <SRS0=2CuI=MH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 252ACC43382
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 18:08:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7E032086E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 18:08:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qv55B3EN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="C/q+VfVK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7E032086E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=m//veuba0pNJbJzT2CUo+Q92DC3Pjm7JixnZ43q18lQ=; b=qv55B3ENSJqOphbpkQBb0/4EX
	vtW1sCk9CzYg3qilh0Ixg02lcvdxVVVa+om2aZLp2IfHOY7os8eQaXKn1gszJNHcyaI/OaIkFRm+l
	5f4RLf2IzjvpeOSk0TdCnFHlMqxM+jl3HNZXCLR7D2LmlGHw7rpTYitqnV0+ebZNp71T2aIoB0ClU
	IC/wbPzGYgnOuU2w5PC+YaeifXL3ifaLUM26C/IAOwA4eMxr7rvy5NnZ6nHB/A8BOCL/UUSGz2Fbj
	kIDbiafaGhiX/H3QYv230jaB5k+dH1+ncUfB4VyaQ9bMYoOFypwfnn3Rwe/VJNIEUtf2gaaIDdGFa
	96gIm6zaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g4rl6-0005Jx-5H; Tue, 25 Sep 2018 18:08:28 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4ran-0007Fv-E2
 for linux-riscv@lists.infradead.org; Tue, 25 Sep 2018 17:57:58 +0000
Received: by mail-pg1-x541.google.com with SMTP id r77-v6so6986309pgr.5
 for <linux-riscv@lists.infradead.org>; Tue, 25 Sep 2018 10:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Iklni6IQbkhRGwlv6LdvXJQI+fFbeMUtQR8t9lMsR3w=;
 b=C/q+VfVK7gBEEvqjiuOyGIQzugZiMmLTq3AqrA2SjyzlE5bkWoGV0EVB9iPVbN+D73
 zyKRalmvRWdCn0WNToFX0qsmn6oiIg1y9lmLSXL0BQOQZh9qEe2ATmwaJEjbptjsvOwv
 m+aX87ScmoTrJRHOvCV7gvNgbX64ar5AWIPhMsdTT3cUR0bLuT9b8D7i/tDqF5RJqYBI
 B0UmIWzGjrMRv9wJIv2BJoYEogZ11ZqhllbSG7+UlnJdxl7lq8c4tXBnZuoh2iVd/LLP
 Izw0kU1xTXDw416VFdKIMhaB+WXvQP9F0w1esXH9kuA2eRbXXd4G4TmbE6JKWdOsn5Bw
 1I9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Iklni6IQbkhRGwlv6LdvXJQI+fFbeMUtQR8t9lMsR3w=;
 b=OxCRclZS2trWf9o6IbtSmddGavqlGNyXRhwdurKfbFpKkcJ+/nbS5qR+YLzdHmLHAr
 onCg/wU39qPCAAQQLCYXFO0iM5w6H81oftipGjzSIwsFvEo74W2OZPy9kTvRZdo8Xpo+
 za4iMWsZM98/xJxFSnVxhE5mc7I87lz3gP48daqZfxyi66aHMuBoaoGB3RrQHag7V6XQ
 gmMiJcNE8GDu4HsBM1jezvuHNhm7IAhBVU6RD7G2/i6WOpH1NAW7T/3chWiVpaoOERtZ
 3/91lCTzQTVGVBnSNGO+VLIJtelNOpDVVnjJKXukfE/rDRlhgn0cM2ryIQOH6Y+qKh7n
 zJBQ==
X-Gm-Message-State: ABuFfojTqzqaMInsaFrBLgHhAQ3Hf13rNYd5UzC3pt3fGk3bbDO83Xds
 6lfDT9ISzKOoJPxsqxFj0v4Ftg==
X-Google-Smtp-Source: ACcGV602ItCMMjtPrDOeHK3fWrdoYOaW345EeghiUuJx/6NSbkL0Bs0nAVvGmOlmHC7/6Izf9XoXIA==
X-Received: by 2002:a63:9809:: with SMTP id q9-v6mr2080619pgd.58.1537898241786; 
 Tue, 25 Sep 2018 10:57:21 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id u13-v6sm3941720pfn.59.2018.09.25.10.57.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Sep 2018 10:57:20 -0700 (PDT)
Date: Tue, 25 Sep 2018 10:57:20 -0700 (PDT)
X-Google-Original-Date: Tue, 25 Sep 2018 10:55:01 PDT (-0700)
Subject: Re: [GIT PULL] A Single RISC-V Update for 4.19-rc6
In-Reply-To: <20180925173212.GA21414@infradead.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <mhng-1e34b187-31ec-4f17-8d3e-cad8b9aa8da6@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180925_105749_705538_0633A541 
X-CRM114-Status: GOOD (  15.17  )
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
Cc: Christoph Hellwig <hch@infradead.org>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180925175720.GzSOE3iE4TayH62sdF3iXGStvTEnAZbIioTD8yymf2k@z>

On Tue, 25 Sep 2018 10:32:12 PDT (-0700), Christoph Hellwig wrote:
> On Tue, Sep 25, 2018 at 09:26:51AM -0700, Palmer Dabbelt wrote:
>> On Tue, 25 Sep 2018 09:15:38 PDT (-0700), Christoph Hellwig wrote:
>> > I think this fix isn't quite right actually - we don't need asm-generic
>> > asm-prototypes.h, as said in the review of this patch.
>> >
>> > Also on it's own it isn't going to help with doing a modversions enabled
>> > build, as the return_to_handler export needs to be dropped.
>>
>> Ah, sorry -- my understanding was that while this wasn't the cleanest fix,
>> it would at least enable the Debian people to work around their issue.  If
>> that's not the case then I'll just drop this PR, but I'd really like to
>> enable the Debian people to ship kernel images and that's a big step.
>>
>> Did I misunderstand what's going on here?  I tried to build it according to
>> the patch's instructions and don't remember seeing the warnings, but I might
>> just be wrong here...
>
> You'll only see the warning when you actually install the modules
> if I remember correctly.

Ah, OK.  I'll kill this PR, then.  Depending on how much time I have I'll 
either re-spin an out-of-sequence flow, or just submit a fix for rc7.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
