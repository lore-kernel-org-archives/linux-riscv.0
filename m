Return-Path: <SRS0=oP9+=KQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2936BC4707A
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 18:08:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD6C9613CB
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 18:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD6C9613CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=JT6qbQMaIjnkGFCwIqUPnn88zRQdopPSzy/Cn5UgXN0=; b=BuWKTYXzBBAHtWP40h4zAbH84L
	BoanOlHJwAP1XyYYZJjlb+5tkSdaWyYfVaBVSBYjdTmqaTyZuvAC/2pOtind7ic/7QyKayBf5je3k
	e6D5gOEMm05gDZBojJIRtVh++YuNVZy29kZ0kvu+KjfHyDtrZuq8sXfHpej43jiZJ6nR/5pwKADfW
	LZMfzLL7jn1uBNLB162EPCOCbxbbdQRpW0ze34LevAuefQL+CJln7tJpJm6Jt/zh+wVqV/EsY4hlB
	Ev4RgjXq1EXNa8U8XN8N+ewhEN+W9hPJj443bj2M9teb7mkN3OkWsdXBlA8dCRkjzsB/4CZ9hRBei
	jvNtieTg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk9ZP-000fCP-86; Fri, 21 May 2021 18:08:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk9ZM-000fBe-65
 for linux-riscv@desiato.infradead.org; Fri, 21 May 2021 18:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=5U6SWI6tKwJQxiyyyLqjT1i8tYx3isO7hjR5W5+1Jeo=; b=VYswGhKi21FCp1Mcj+Wq9iP+8h
 UPt4+j6+sbFDSR1WtZVw3S/SoaPMDeCVQqqhtixVHRPjFCLI9ch95msHN+zPGBaneOUGlT8TFYxyR
 7IowYkQSXnmCIMJC0V9GbdWykAN/2m5hGB2VDFSvwkvgzgysMhsVzMk5uTHneprJ9bKxjtMEJ/U97
 2N+X/AF+gXnADe5uCzQLbaZRiDrNvepioigc/FuMuhDbcv87S4uOTQ8UEhczgPaQq0zRU5yUVYmEK
 e40PVyU8XqkYnQE59Kc75SYb9VIMEdpH7Q+DfRHxL1T6VBHvha3bfHYeLTSVNMtzFb25tcUl63tEd
 Qmo8mfTA==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk9ZJ-00HLNt-D0
 for linux-riscv@lists.infradead.org; Fri, 21 May 2021 18:08:18 +0000
Received: by mail-pl1-x633.google.com with SMTP id s20so11390601plr.13
 for <linux-riscv@lists.infradead.org>; Fri, 21 May 2021 11:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=5U6SWI6tKwJQxiyyyLqjT1i8tYx3isO7hjR5W5+1Jeo=;
 b=vtTnyRah2kvhTAvKkgyp5rIri/BGQNchS7lXj3oCYhV5McFBbxGTr4EjYc6mvyOinn
 3AfMgA6VhS3u8947Z/3CuaEcMpm7wash5s4UhzpQ/gq2UOH/pXd1P8HP6LXs2AX2ghZ7
 WTvvt1/yfLL8GYTjA6616yKQHybiIg2wPemKZer7/tMyrMrTs7n6j06sv5XO10p5HCbh
 yLcC8WefzjiIY7amtnohfd+oXEAboa4fIZAxuILISPaizFwPRbUSghFsEjTIIQvrWCKL
 mLont745Oggstxjw6092u9UjqC0L3W/ZSGD2MiRRew69QhYXK6txzd/ZBpU4jI6Eu+y6
 cfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=5U6SWI6tKwJQxiyyyLqjT1i8tYx3isO7hjR5W5+1Jeo=;
 b=isI0FsQ7vJxZMZSAcJnrVdjlb90l354zieZrv7xbbv7uR/pCl/0JVM2fFDTcz0brqn
 MKinr1rzlIhNNJzXDJZxwUdU4ch2cNoTXalzj+nkafLnoNXzMeBZmHYrmutxVvzG01lD
 NN4apgKJD57FHdz7fCA8/rDeEY+niUeNioh2siNEC7GH8YyZj/jqY/S7QlgdZWeY31IT
 /krfWNBm0wI2a5IOvPyYDfkW55Duq+FJB+5/HXvojH8m7PBep+xuWCkzG3x7e+PhMoIV
 1IfF0BYw7T6WW5m0E1VvT2FmAj5z6iMOSldEVoe7I7PcXzuvBwQG8nN2t5ZQ76ABH9RU
 x6OA==
X-Gm-Message-State: AOAM531dmborNJy/FDXgpIIB87Lgu5dVUdOl0FpWr2ZHgiUXSWwYoDCS
 d6HbjgKVFFW7FcykUVjCtgHyPg==
X-Google-Smtp-Source: ABdhPJwLEJQWqh67UT0dt8OTf7ZYOzZievMqQ6z7E3S6USV227nLPVyaUv+fvSjbWzdxhAnKUIgAHA==
X-Received: by 2002:a17:902:f543:b029:f3:bfca:21b4 with SMTP id
 h3-20020a170902f543b02900f3bfca21b4mr13333335plf.6.1621620495939; 
 Fri, 21 May 2021 11:08:15 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id r11sm4812600pgl.34.2021.05.21.11.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 11:08:15 -0700 (PDT)
Date: Fri, 21 May 2021 11:08:15 -0700 (PDT)
X-Google-Original-Date: Fri, 21 May 2021 11:08:12 PDT (-0700)
Subject: Re: [PATCH v18 00/18] KVM RISC-V Support
In-Reply-To: <YKfyR5jUu3HMvYg5@kroah.com>
CC: pbonzini@redhat.com, anup@brainfault.org, Anup Patel <Anup.Patel@wdc.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 corbet@lwn.net, graf@amazon.com, 
 Atish Patra <Atish.Patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <mhng-122345f7-47d9-4509-8ae6-ce1da912fc00@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_110817_480022_682BBA5E 
X-CRM114-Status: GOOD (  28.78  )
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

On Fri, 21 May 2021 10:47:51 PDT (-0700), Greg KH wrote:
> On Fri, May 21, 2021 at 07:21:12PM +0200, Paolo Bonzini wrote:
>> On 21/05/21 19:13, Palmer Dabbelt wrote:
>> > >
>> >
>> > I don't view this code as being in a state where it can be
>> > maintained, at least to the standards we generally set within the
>> > kernel.  The ISA extension in question is still subject to change, it
>> > says so right at the top of the H extension <https://github.com/riscv/riscv-isa-manual/blob/master/src/hypervisor.tex#L4>
>> >
>> >   {\bf Warning! This draft specification may change before being
>> > accepted as standard by the RISC-V Foundation.}
>>
>> To give a complete picture, the last three relevant changes have been in
>> August 2019, November 2019 and May 2020.  It seems pretty frozen to me.
>>
>> In any case, I think it's clear from the experience with Android that
>> the acceptance policy cannot succeed.  The only thing that such a policy
>> guarantees, is that vendors will use more out-of-tree code.  Keeping a
>> fully-developed feature out-of-tree for years is not how Linux is run.
>>
>> > I'm not sure where exactly the line for real hardware is, but for
>> > something like this it would at least involve some chip that is
>> > widely availiable and needs the H extension to be useful
>>
>> Anup said that "quite a few people have already implemented RISC-V
>> H-extension in hardware as well and KVM RISC-V works on real HW as well".
>> Those people would benefit from having KVM in the Linus tree.
>
> Great, but is this really true?  If so, what hardware has this?  I have
> a new RISC-V device right here next to me, what would I need to do to
> see if this is supported in it or not?

You can probe the misa register, it should have the H bit set if it 
supports the H extension.

> If this isn't in any hardware that anyone outside of
> internal-to-company-prototypes, then let's wait until it really is in a
> device that people can test this code on.
>
> What's the rush to get this merged now if no one can use it?
>
> thanks,
>
> greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
