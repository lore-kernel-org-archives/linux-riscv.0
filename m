Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E089C77B7A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 21:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=7e8HHQRXarzrbs9J+UDcLlSGQHfjsEAB/pwgnIDSH9g=; b=DKY+oo559y0YBmpt8rDf4wh6Pd
	8ETMQeis86E9rGfUbtSPyQ1xkfEU3x19icymcOWIsCT2ndSCOLBKCtzH5Pe+n1uJTaKIhQY6mZkoo
	+NbBwMwGOBHD+gRONEm+1y1pdQJQlkbCtWtqTHOFZTtKQuD2lNecmxBnoPdfIrenggcXh4ragTPjw
	8qX4SqJ2UlgCao/z7iHe87SaqjflWiFuEVkf45R4rKkNUjIOnnLnCqYlkzQFID4DX4G+KZnYr3zWh
	ExGAs+1g8I4VR2ezrEq0nUq0tPN+Sksp3uqsA8+NoggKP0C43x/3a/oobHlSXdIxIEvQczRi22xlf
	905zQ04w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4pTJ-004wPV-2v;
	Thu, 01 Jun 2023 21:04:37 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4pTG-004wO7-1f
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jun 2023 21:04:36 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1b025d26f4fso11873975ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Jun 2023 14:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1685653471; x=1688245471;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K31mK0e+lIqylDP59GLpflc/FdALwYXOTEKBXYSCF3s=;
        b=hD86mUY+jh5Zr2r/OzEM0gXDwcMSCuP0E3Mpln2EzFR5snPWjqAabs2J0xyA8iQNOw
         eET4SphsWQLerVWdmiRSkShubeB+xEDyJ4I7qEFAIcvb8WOTtKPqyMlXNNeaocvXW2kH
         5ES/j4TYGlpedOet+dBKJol76pC/VtZwTdVZrvBZ/ItjXWGyt3gCOt/mEraErqqALmMl
         RfimiiKTwlH65pIWR9c2C63g5VezIf2prF0S5uWvoVWKnBgkoCvdqIFwXncSO6rckt0U
         lvn3r0wtzRID1YMpNeWoWmP5b2vJHcbgEMsB0MGFSfs2GLlJNEHJz1m5IoFHbxT1zUiS
         jpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685653471; x=1688245471;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K31mK0e+lIqylDP59GLpflc/FdALwYXOTEKBXYSCF3s=;
        b=OtJKh/+jr+DUTCrZLKNW44tM/HOXuIHgUtj9MrZNWgM1bbj1XNdJ2fdisE7bsdcDbR
         hQiwlGNZTV9Yy5pF6j3bTdn8aWWCL+PLM79J/m3jrc3y7KfGXzZcqodWu0q255M/9pMw
         m2WWe0xwS3qsX2VNWisH8Rz4TUGJiRPY5lOVRnJxpis3bkCCGC5x/94CeL9Kj5e4JGAb
         V8WO8unrAQfaKv+DZn21uv10wSZgFJ5sN/W6TjRNuMkyMY+m3EELTvDlBGp8wTLWzMLh
         WmZ68nVxviLIZL71OE6IdxrTR9ccawZfK08yu9xeVd8AY7CSZeQF+pfnBuKtW6u2jevw
         hwYQ==
X-Gm-Message-State: AC+VfDyJeWRrlazSAVJlZWz1uWwdxBpmUROsuZHmdhYS383u/0mANd8Z
	PmrUjvpBdMAY5eNwgCyV7sxbvQ==
X-Google-Smtp-Source: ACHHUZ4tEOZ/E7aubo2t8nuiBBW7VMGKRiaRb2mGTccmObI2XGljcRJI09ojuq0f4iNB65iD0dXc8g==
X-Received: by 2002:a17:903:4292:b0:1b1:78ba:f350 with SMTP id ju18-20020a170903429200b001b178baf350mr456252plb.46.1685653470704;
        Thu, 01 Jun 2023 14:04:30 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id b7-20020a170902650700b001b034d2e71csm4009814plk.34.2023.06.01.14.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 14:04:30 -0700 (PDT)
Date: Thu, 01 Jun 2023 14:04:30 -0700 (PDT)
X-Google-Original-Date: Thu, 01 Jun 2023 14:04:00 PDT (-0700)
Subject: Re: [PATCH v2] riscv/purgatory: Do not use fortified string functions
In-Reply-To: <202306011331.880AF01743@keescook>
CC: Paul Walmsley <paul.walmsley@sifive.com>, ndesaulniers@google.com,
  linux-kernel@vger.kernel.org, gustavoars@kernel.org, linux@leemhuis.info, heiko.stuebner@vrull.eu,
  linux-hardening@vger.kernel.org, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
  joanbrugueram@gmail.com, masahiroy@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
  ajones@ventanamicro.com, hi@alyssa.is
From: Palmer Dabbelt <palmer@dabbelt.com>
To: keescook@chromium.org
Message-ID: <mhng-cb8265a9-018d-483b-8de9-b7b2eaa5557f@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_140434_577692_B2CC9A42 
X-CRM114-Status: GOOD (  17.47  )
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

On Thu, 01 Jun 2023 13:31:33 PDT (-0700), keescook@chromium.org wrote:
> On Thu, Jun 01, 2023 at 01:17:03PM -0700, Palmer Dabbelt wrote:
>> On Thu, 01 Jun 2023 11:27:03 PDT (-0700), keescook@chromium.org wrote:
>> > On Thu, 1 Jun 2023 09:00:28 -0700, Kees Cook wrote:
>> > > With the addition of -fstrict-flex-arrays=3, struct sha256_state's
>> > > trailing array is no longer ignored by CONFIG_FORTIFY_SOURCE:
>> > >
>> > > struct sha256_state {
>> > >         u32 state[SHA256_DIGEST_SIZE / 4];
>> > >         u64 count;
>> > >         u8 buf[SHA256_BLOCK_SIZE];
>> > > };
>> > >
>> > > [...]
>> >
>> > Applied to for-next/hardening, thanks!
>> >
>> > [1/1] riscv/purgatory: Do not use fortified string functions
>> >       https://git.kernel.org/kees/c/ca2ca08f479d
>>
>> Sorry, I'd just applied this to riscv/fixes as well.  I can drop it if you
>> want?  I was going to send a PR tomorrow, just LMK.
>
> I'm fine either way. I was carrying each arch's fix just since it was
> related to the -fstrict-flex-arrays=3 patch in the hardening tree.

Works for me, I'll drop it.

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

The bots will probably get confussed and it was briefly visible to 
linux-next, so there might be a bit of spam.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
