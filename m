Return-Path: <SRS0=Yzoz=SF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB1F4C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 02:43:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5108206DD
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 02:43:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ShmOvi5L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="jpwrGPFV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5108206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=D0J35k7nbHSdrBW6j30ULQzv4KKgi544S2Xz5jA9x58=; b=ShmOvi5LsyMJ3N9PXwtxaDkmb
	uOqnW2IKp1q4FcPkdorpEFPEaHMMw5sAoH8BhIW/4XHWhQ4RBcOi7O3bOPDCJIQ45ciFIZaNRO4pr
	rjXRYIu1zq91lpmnBnkRQOqGzJ83DEjRleD0qnEklcDZczBIi9kcGy3XX8NYQsVgDEqANaBTucqnV
	jpZyWfJkX0V1unQSaVFMnLD9ZjLfXjHOVISXk94/FKVj1tzH0EZq6FWjqfZldXiXcieuxMwbLcRme
	ivNZWENocLsNv0zwNL5VDoIHb5NfCQvvuZqErNTGQjnaLNO3QuslEaRM/CcPLkUtxJnGRk+XPIQqp
	BJUWWC8Kg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBVsN-0006lI-8K; Wed, 03 Apr 2019 02:43:43 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBVsK-0006ky-Lk
 for linux-riscv@lists.infradead.org; Wed, 03 Apr 2019 02:43:42 +0000
Received: by mail-pg1-x542.google.com with SMTP id g8so7526719pgf.2
 for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2019 19:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=uU9lkOWF4elggp8UB2I8990j7g3Old/5uePX/xYGcoA=;
 b=jpwrGPFVwafVd4BeLTkdHsnx/rq4ROpQtvEs7RDb3O7Cg81RVY4PaRgUQRceInxfj4
 M4y9xnRiXcMAYU6e0tWMurmAEkidA2EK/JzKm9p805OQQkW9DfPfjQINr+YUqq7PuQsq
 e8HmYBV5/nD+dK9TgcoN21EHAWFzRj6ZBKyV20A5gYyW43rCIe5astJnWjRjY1D2FH/x
 5VpcGqEYJFuQ5HKhvQZMpx7sEQ2/Cv/QleyqK99njK9foQNTKCtVfuExc7xDflFPOm0S
 NmxIxuZkKvHvkw+kSZn9V9uYRYGsozU+dqPuDoB+EyXu4SEtJrU+vl7kequUVOGVri0z
 nKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=uU9lkOWF4elggp8UB2I8990j7g3Old/5uePX/xYGcoA=;
 b=OSzdvzh3I0fmOLUL7h3xPtCyZ+SUl+4EbY0Ucu005lpfO/6+ZesLVCOA+fGjYdeM9f
 RMWzr+3in7FA/UqD0P8WzRm125m5JzjvbiRR524R+NEX1JEdr+4xmketAP7YZ8C2dKLG
 PXTjiPiXFgf1TZWkL4tDNbYZB+LQ7UN/jywIrfC//yPboPKJKkfDmgloXwh+Qcz5gmc4
 AFWOIarhJaaxmmwWAsu/OLJb3T7hjMu9ZACKSBTzHTyDk/lRyRn7DbxCl4HlXBYvP7YW
 gO2Ahz0NE8cNgIQ3RPqeEc+Js7BBoz7Rblb06qf+Y6dOwn1JdpTBt6/iX8EYj0/XHBsS
 FOvw==
X-Gm-Message-State: APjAAAXarZ9HtTZ4L3LK6EHL06lQqc4ZLZsDFEILb6bdcLwkQIjAd3ZD
 It+FWaE9FWJqIcrqhvXPFuN/AkKjGgM05A==
X-Google-Smtp-Source: APXvYqwQOHnwBJ8/rs0JRqy7I3fZ1uCftFZpUWoyZkBxYVZxkeRGW1hdb81gIYPTrvZ4b20O2bku1A==
X-Received: by 2002:a62:1881:: with SMTP id 123mr71857792pfy.25.1554259419688; 
 Tue, 02 Apr 2019 19:43:39 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 25sm17823161pfo.96.2019.04.02.19.43.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Apr 2019 19:43:38 -0700 (PDT)
Date: Tue, 02 Apr 2019 19:43:38 -0700 (PDT)
X-Google-Original-Date: Tue, 02 Apr 2019 19:24:48 PDT (-0700)
Subject: Re: [hw-dev] Re: [isa-dev] UNIX-Class Platform Specification Working
 Group
In-Reply-To: <CAPweEDyjP7iyoyuHVOUPpJSgQzUZkx5Zc+yC2kFKjuxYELEXSQ@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: lkcl@lkcl.net
Message-ID: <mhng-a66e2566-0146-4da6-bb93-15d7feb0c1b5@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_194340_742937_CE5C929C 
X-CRM114-Status: GOOD (  23.54  )
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
Cc: isa-dev@groups.riscv.org, gurjeet@singh.im,
 Atish Patra <Atish.Patra@wdc.com>, sw-dev@groups.riscv.org,
 hw-dev@groups.riscv.org, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 02 Apr 2019 17:31:23 PDT (-0700), lkcl@lkcl.net wrote:
> On Wed, Apr 3, 2019 at 12:42 AM Gurjeet Singh <gurjeet@singh.im> wrote:
>>
>> Not that I'm interested in participating, but just curious
>> as to how these officially approved groups work.
>> Is there a mailing list for this group?
>
>  that's the question that i asked.  i had to ask it in the way that i
> did, using the words that i did, due to issues related to Trademark
> Law.
>
>> Is it open to public?
>
>  it has not been made clear, hence my question.
>
> (as an aside: none of the "official" RISC-V Working Group mmailing
> lists are open access.)

It's a RISC-V working group and therefor follows the same policies as the rest 
of them.  IIRC we're in a bit of a transition from workspace to groups.io, but 
either way the list (and associated meetings) will only be available to RISC-V 
members.  There's a free membership for open source projects, as well as a 
cheap membership for individuals.

>
>>  How does one request to participate in these lists?
>
>  again: it wasn't made clear.  if however it has been expected that
> the lists be "RISC-V Working Group Mailing lists", then  it is
> mandatory to sign the "RISC-V Membership Agreement", which prevents
> and prohibits all and any public discussion or release of information
> outside of the group without the expressed and explicit consent and
> approval of the RISC-V Foundation (Section 5).
>
>  this being what our team absolutely cannot do [enter into secret
> agreements that interfere with the BUSINESS objectives], hence why i
> requested clarification.

OK, well, I'm sorry you'll be unable to contribute.  We considered different 
contribution models as part of starting the group, but decided the standard 
RISC-V arrangement was the best fit for this group as well.

>>  How does one follow along in these conversations, that is, where are the mailing list archives for this group?
>
>  again it was not stated (apologies, to palmer), so we do not know.
>
>> The list [1] seems to be for this purpose, but it is not hosted @groups.riscv.org so I'm not so sure.
>> [1]: linux-riscv@lists.infradead.org
>
>   exactly: it's not clear.  so, it needs to be made clear exactly what
> the Standards Development Process is to be, where discussion is to
> take place, and whether there are any terms or conditions required for
> participation.
>
>  at that point, once it has been made clear, people will know what
> they are getting into.

That's the RISC-V Linux kernel mailing list, where is where RISC-V kernel 
development happens.  That is an open list, but does not directly discuss the 
development of RISC-V standards like the platform specification.  Platform spec 
discussions will happen the same place as all the other RISC-V discussions -- 
my other groups are on workspace.riscv.org, but I don't see a platform spec 
group there and with the LF transition IIRC we're deprecating workspace in 
favor of something else.  Maybe we'll be the first group to figure out how it 
works :)

I pinged some of the LF people to try and figure out how to get at least myself 
added to the list.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
