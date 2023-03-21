Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E96C74A5B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 06:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1AaGLXqxdZuotKkrHUq/bhpRZ1/zk439c+Vy+180hGU=; b=WqLeGOD9LJj6w8
	7yTWDLRD9qUcNDmrlyTkzhYvvDhSJZa1sko1r3gpZ7DWpPsa0I3qqIxWnK1YfkVAWymot0EqdqpIo
	PpeMx5/iHzD31o0066YvTdZ/QAXPNKGo74uhM54RHpkeyTtMr6KGiT2WGzWBsfwhXhhKOffMfymAx
	775Mz3AUIKwwb4gspwsxGkjWDZA8fBgzAh9c+gMrLlisOxNgr0UpSceZVvAp2gcQFqjZCwLmhaePI
	RDeX2aenUIxNxLgOHbd9NZSDumxFsCJ3b9rMdsoOjkuaYgHdyP8dpjbsOmNQtN0m0dfcB93ysOR55
	AXXV35+CfRXGJF7Mej0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peVWD-00BNhh-2n;
	Tue, 21 Mar 2023 06:30:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peVWB-00BNfm-0F
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 06:30:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679380241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hLfcaciqC2sQRgVuiIt5OYHvRdezwnP+Ui5lox0wguk=;
	b=PF7iTdHplJ8+x6scSvXfSY5ot6SfSz1aKBq+W6awOj1QpQtUVwGqq1v8T0ngN08+p1RRUs
	g+nDjTw9Uc1pE+hOV9n14lMfEQmkZQzh2JXWpCgamTzrn3v+igRMJdN7BKxWhuGIrcCj0N
	yrmz1gc+mMCJTmnSt62qgJOdFEOV84M=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-tn_0WDOXPtGNcvt_-TndTw-1; Tue, 21 Mar 2023 02:30:40 -0400
X-MC-Unique: tn_0WDOXPtGNcvt_-TndTw-1
Received: by mail-oi1-f198.google.com with SMTP id bf33-20020a056808192100b003872286998bso367288oib.23
        for <linux-riscv@lists.infradead.org>; Mon, 20 Mar 2023 23:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679380240;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hLfcaciqC2sQRgVuiIt5OYHvRdezwnP+Ui5lox0wguk=;
        b=KwOI2HEOaRD0/E013pLEjYuM8nxpsMmVqbeOWYns1dfeF/g47huSCf4ryXENQtCckI
         3WXWyMlN9JIIdJaslT36BbE9qr7j48GZlnCiGw3GLb2iza8lX/cbeizQwJpdCazJe+aO
         52Mfb/Bahv6yRAcd5W/CG6xtlvNm4DhVOEmc5w+ykGljn9/75qxo8rJHcaHUKFwtDoP8
         GOaumk3vsLRN/qFXltmXPnJZFur4HMpmaFlY6ifEuMIwMrC4bQVnXY8MJyyWv2764Rqg
         duqlQ4opVTl4J26CkpQ6I6sZlEidAmf8nyzykN3IDK+FK6sSb0Hr8OvaGTv0mNAg+GoI
         rG4g==
X-Gm-Message-State: AO0yUKXezIS1d0a5zCWFfwpOB46jjqMizStBVgXmSySZkiSNB091EL4u
	cIiZiAfYN7HnuulwJj7ueviF5PDKmiUSPgCE/E32do2j1+s6UbozEe5BQ6KbVJhLbLJxZJVwPmI
	ePCq0vk3K4G67LMrWIlEBeqLu8z2N
X-Received: by 2002:a05:6870:e9a6:b0:177:896a:cb06 with SMTP id r38-20020a056870e9a600b00177896acb06mr532675oao.17.1679380239779;
        Mon, 20 Mar 2023 23:30:39 -0700 (PDT)
X-Google-Smtp-Source: AK7set+sAnExMk7SZzECJpvie0SkEMvlJl4END4aZkWBt8HSEfwk2lzAbzgMlaR1FWZJdyt92s7VUw==
X-Received: by 2002:a05:6870:e9a6:b0:177:896a:cb06 with SMTP id r38-20020a056870e9a600b00177896acb06mr532663oao.17.1679380239515;
        Mon, 20 Mar 2023 23:30:39 -0700 (PDT)
Received: from ?IPv6:2804:1b3:a801:b074:274d:d04e:badc:c89f? ([2804:1b3:a801:b074:274d:d04e:badc:c89f])
        by smtp.gmail.com with ESMTPSA id bd35-20020a056871b32300b00177be9585desm4021051oac.1.2023.03.20.23.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 23:30:39 -0700 (PDT)
Message-ID: <4f35f41c143b02b6b815e7eb527ca3acd8b4aabe.camel@redhat.com>
Subject: Re: [RFC PATCH 0/6] Deduplicating RISCV cmpxchg.h macros
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren
	 <guoren@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 21 Mar 2023 03:30:35 -0300
In-Reply-To: <8f698f49-135a-4263-8471-96f406919cb1@spud>
References: <20230318080059.1109286-1-leobras@redhat.com>
	 <8f698f49-135a-4263-8471-96f406919cb1@spud>
User-Agent: Evolution 3.46.4
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_233047_189958_590A4A0A 
X-CRM114-Status: GOOD (  23.66  )
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

Hello Conor, thanks for the feedback!


On Sun, 2023-03-19 at 20:35 +0000, Conor Dooley wrote:
> On Sat, Mar 18, 2023 at 05:00:54AM -0300, Leonardo Bras wrote:
> > While studying riscv's cmpxchg.h file, I got really interested in 
> > understanding how RISCV asm implemented the different versions of 
> > {cmp,}xchg.
> > 
> > When I understood the pattern, it made sense for me to remove the 
> > duplications and create macros to make it easier to understand what exactly 
> > changes between the versions: Instruction sufixes & barriers.
> > 
> > I split those changes in 3 levels for each cmpxchg and xchg, resulting a 
> > total of 6 patches. I did this so it becomes easier to review and remove 
> > the last levels if desired, but I have no issue squashing them if it's 
> > better.
> > 
> > Please provide comments.
> > 
> > Thanks!
> > Leo
> > 
> > Leonardo Bras (6):
> >   riscv/cmpxchg: Deduplicate cmpxchg() asm functions
> >   riscv/cmpxchg: Deduplicate cmpxchg() macros
> >   riscv/cmpxchg: Deduplicate arch_cmpxchg() macros
> 
> >   riscv/cmpxchg: Deduplicate xchg() asm functions
> 
> FWIW, this patch seems to break the build pretty badly:
> https://patchwork.kernel.org/project/linux-riscv/patch/20230318080059.1109286-5-leobras@redhat.com/

Thanks for pointing out!

It was an intermediary error:
Sufix for amoswap on acquire version was "d.aqrl" instead of the
correct".d.aqrl", and that caused the fail.

I did not notice anything because the next commit made it more general, and thus
removed this line of code. I will send a v2-RFC shortly.

I see that patch 4/6 has 5 fails, but on each one of them I can see:
"I: build output in /ci/workspace/[...]", or
""I: build output in /tmp/[...]".

I could not find any reference to where this is saved, though.
Could you point where can I find the error output, just for the sake of further
debugging?

> 
> Patches 1 & 5 also add quite a lot of sparse issues (like 1000), but I
> think that may be more of an artifact of the testing process as opposed
> to something caused by this patchset.

For those I can see the build output diffs. Both added error lines to
conchuod/build_rv64_gcc_allmodconfig.
I tried to mimic this with [make allmodconfig + gcc build with
CROSS_COMPILE=riscv64-linux-gnu- ] but I could not get any error in any patch.

For patch 1/6 it removes as much error lines (-) as it adds (+), and the error
messages are mostly the same, apart for an line number.

For patch 5/6 it actually adds many more lines, but tracking (some of) the
errors gave me no idea why.

> 
> Cheers,
> Conor.

Thanks a lot!
Leo



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
