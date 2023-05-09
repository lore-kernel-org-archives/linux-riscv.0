Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E938CC7EE22
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 20:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=R7Q+4hjXbS2vEgrMkLESRBJwJPmKinsNGq19fND1vEM=; b=rcQNMZs1lWrSoikRDvQeVAuUxz
	xqjPCcR1xuqS3M7yZI7Q/X8u5SCBjMEpizcyn6Bco6jRuGRid+0UkaQ7jCudh1N1UMNcDzte40o5D
	lrVtOhFOZ2UAdtRWhLXs+q5cf/H5VRCCe1zfOPjooxQivCTJbFIgXStJ6MuphfiwYMlFSmgUNjBDU
	XE8/adiWFxEKhnbsXedOi9vakOstDSar0DL9nXYcKqgf8vcrTodcDl4IcQ21xPiCsq12TECEiMvnx
	V/jKXOO6soenHmnK9JVO/m+Npd1W8x/r64tEBn5KDP/L75VR7vfbrWB52S5bgcHZvfmKVxeoOV28t
	HYNDBNyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwUQr-004G9w-09;
	Tue, 09 May 2023 20:59:37 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwUQo-004G9P-23
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 20:59:36 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6435bbedb4fso6917694b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 13:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1683665974; x=1686257974;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dOA7aJvMFPIkPvFgyp6AOgLLNvmw7SXjInRd3Q4PUKk=;
        b=fER7egYWZZVJlKQe61uKSAjjxl4qpXLIRyuiKsUfwAK+LeTe18xU8zSiWYIcGHx1KM
         bl0QctHKOSFvOJ39wV8yANe3Jq9mNy+uhKRxWRggaEpCXiy0j4ZltBexvmMXRTC3KKVF
         jcDSwPmfmUzut/6g94HrsNBGmBrqQeWNA+oFfM9r1VPZ/mscu8UvoXE59o3APiYOQaHG
         r9cf46p/vhrwvD7scWdWeVh8DS9ppwbl/eLscWXTpwiPKvKJmZAf/YMgCnIsmkYN5oON
         /9jEX/mU44QFuAQ2NnK+ZauXyM0+mpohssZZK27GJwOmdwNMwotVoYi/xjU0VVdSIvcE
         4CLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683665974; x=1686257974;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOA7aJvMFPIkPvFgyp6AOgLLNvmw7SXjInRd3Q4PUKk=;
        b=kN2hBZJGcJ65TO58CCqqgDR4Q6tjpGb0UveKc27tTRStkFiF+9ZGSR8fsyUB5Scbh9
         RB2s5mlqgf+ouctqEzQLW9nJPwkgdQaAl/EGt1N/2Vj4EeDcBcaBHJVRF+6e/pYrDVGD
         YZxnXv0Z59DjUw2NmZZH707qvWE+/ghS8BPycGvIPAlRgl3CZF9vgBkVba42S1nAKBxU
         7Lir3r+bND3rPDeRqGV0az7bT/6DDHS0OL357qK+/QLyhfMV9+HXGEoo6V0x1wy2kbG1
         yThda2MxocP+QUr9BQNgTazFcLoO4ZthojfCschTezk4TrCbL99XL8OhnQBz+jzy3fNX
         jaYA==
X-Gm-Message-State: AC+VfDwAnWRn6y2Jcw45RRwQ95BpHOk6LZmPql1xAIKog4oihEVhhEgI
	lNVnQ9X0dkGudW+6TBmIlQfRyQ==
X-Google-Smtp-Source: ACHHUZ5Sk19YYdZdX1ZH0iYmz2+p2ZcC++WuYNTJtf0d4B1IkG2GfHwfxDHcw+x9GrNCAvqxF7kPDA==
X-Received: by 2002:a05:6a00:1383:b0:63b:599b:a2e6 with SMTP id t3-20020a056a00138300b0063b599ba2e6mr21128967pfg.27.1683665973734;
        Tue, 09 May 2023 13:59:33 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id j11-20020a62e90b000000b00571cdbd0771sm2158999pfh.102.2023.05.09.13.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 13:59:33 -0700 (PDT)
Date: Tue, 09 May 2023 13:59:33 -0700 (PDT)
X-Google-Original-Date: Tue, 09 May 2023 13:59:04 PDT (-0700)
Subject: Re: [PATCH -next v19 23/24] riscv: Enable Vector code to be built
In-Reply-To: <20230509-chitchat-elitism-bc4882a8ef8d@spud>
CC: andy.chiu@sifive.com, Conor Dooley <conor.dooley@microchip.com>,
  linux-riscv@lists.infradead.org, anup@brainfault.org, atishp@atishpatra.org, kvm-riscv@lists.infradead.org,
  kvm@vger.kernel.org, Vineet Gupta <vineetg@rivosinc.com>, greentime.hu@sifive.com,
  guoren@linux.alibaba.com, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-8554b236-c9d4-4590-8941-ed7ca5316d18@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_135934_914308_0642BBB2 
X-CRM114-Status: GOOD (  29.83  )
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

On Tue, 09 May 2023 09:53:17 PDT (-0700), Conor Dooley wrote:
> On Wed, May 10, 2023 at 12:04:12AM +0800, Andy Chiu wrote:
>> > > +config RISCV_V_DISABLE
>> > > +     bool "Disable userspace Vector by default"
>> > > +     depends on RISCV_ISA_V
>> > > +     default n
>> > > +     help
>> > > +       Say Y here if you want to disable default enablement state of Vector
>> > > +       in u-mode. This way userspace has to make explicit prctl() call to
>> > > +       enable Vector, or enable it via sysctl interface.
>> >
>> > If we are worried about breaking userspace, why is the default for this
>> > option not y? Or further,
>> >
>> > config RISCV_ISA_V_DEFAULT_ENABLE
>> >         bool "Enable userspace Vector by default"
>> >         depends on RISCV_ISA_V
>> >         help
>> >           Say Y here to allow use of Vector in userspace by default.
>> >           Otherwise, userspace has to make an explicit prctl() call to
>> >           enable Vector, or enable it via the sysctl interface.
>> >
>> >           If you don't know what to do here, say N.
>> >
>> 
>> Yes, expressing the option, where Y means "on", is more direct. But I
>> have a little concern if we make the default as "off". Yes, we create
>> this option in the worries of breaking userspace. But given that the
>> break case might be rare, is it worth making userspace Vector harder
>> to use by doing this? I assume in an ideal world that nothing would
>> break and programs could just use V without bothering with prctl(), or
>> sysctl. But on the other hand, to make a program robust enough, we
>> must check the status with the prctl() anyway. So I have no answer
>> here.
>
> FWIW my logic was that those who know what they are doing can turn it on
> & keep the pieces. I would expect distros and all that lark to be able to
> make an educated decision here. But those that do not know what they are
> doing should be given the "safe" option by default.
> CONFIG_RISCV_ISA_V is default y, so will be enabled for those upgrading
> their kernel. With your patch they would also get vector enabled by
> default. The chance of a breakage might be small, but it seems easy to
> avoid. I dunno...

It's really more of a distro/user question than anything else, I'm not 
really sure there's a right answer.  I'd lean towards turning V on by 
default, though: the defconfigs are meant for kernel hackers, so 
defaulting to the option that's more likely to break something seems 
like the way to go -- that way we see any possible breakages early and 
can go figure them out.

Depending on the risk tolerance of their users, distributions might want 
to turn this off by default.  I posted on sw-dev, which is generally the 
best way to find the distro folks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
