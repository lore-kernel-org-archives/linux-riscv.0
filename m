Return-Path: <SRS0=FXTp=BN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0574CC433DF
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2020 20:28:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB0FB2086A
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2020 20:28:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BGYjckE9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="0EozY3rM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB0FB2086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=jjG9QDPjOYC1h0skZsuF3PX6j11ArPNItTvJRbAP7cg=; b=BGYjckE93uki2BVEvm1X55KIV
	3/HGujHZXurnORw6BiWRkxYLU3NDzxD0ElgDYr9GGl14q+QGx03/++AYBFfojB+V5OFRx2tvwmg1t
	V9Tj2JiN9W91uP6nV8Aes8BAoZ+C76mFNxrq61xKsLLaDNoTzTX3/DmWx7O04R1gTAecgvOb6DM2d
	SbjbCobkwA1EOfQOueToDHWLeJ+Z1RwWIKbV7kClUMYI7e6RPs18qtgrOlvdgOR0uCwf5p3xDhF1z
	7gW8/PB4hlwrBlDFInDZO+zK5eGZUcerOiQLb+Q5r+e2ey5WxJvJGre5GoYBixjoVwD1uSUqo5qWb
	uG3NA1q6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2h47-0005c6-FO; Mon, 03 Aug 2020 20:28:11 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2h43-0005be-Jq
 for linux-riscv@lists.infradead.org; Mon, 03 Aug 2020 20:28:09 +0000
Received: by mail-pf1-x441.google.com with SMTP id d22so545172pfn.5
 for <linux-riscv@lists.infradead.org>; Mon, 03 Aug 2020 13:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=DsyHG58Ml3el1klPF1bwBCrgnOm9NV9u/jTv68prhdo=;
 b=0EozY3rM+AKUvBQaldReZIEHQoZZn+QeItYkc6NopwPAm1+4L8J88UMKDRVc0Loc7y
 CEZnWoAwfqNu8Bo/4F5RbqcFJ1ypilSIDbMPRdPh9358pUTyq7OiWNkQ2eyEwqg01aSH
 aWWzEA7pNbpfK2ycb7Bs5tOtxVfInBI1+TIq+91zOjvWZ30lkQ7TEh6HQMQElIDlVdQo
 q7sw14f8PxnwdkFuDr9IDVYz+1sGMCtQdAhmbo9X6p2GVdRlK8oyplpMiks6F6HaRKzw
 GbPC9t6LhDCpq9CH2sYf78MiCs1YiJ1P+MQ+Wg+fmc7M4QXu3cE2QoAXtzEdb3zgMavh
 xXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=DsyHG58Ml3el1klPF1bwBCrgnOm9NV9u/jTv68prhdo=;
 b=OHnAcRvpNSdwxl8ogGMtfhYB2e2SiUIfF1SgGxyZO9r5wUEzksAb11TKV7q+o1dDFl
 3jD9khxsD4o0kMPpF8TwFlxyGQooUVtUh5IBQAKQ40g7aaXN2BxuUaXmXEOE8oYJs1Fh
 Il39j8IG6DjXKov1JNsqkH2ErsUKL4ioAsEPSE1EDw3PeJ6qVnKMaKTHh92A2Ju9ACdl
 uX3k7SPvEV8R8ldq5CiJawtGBLhkPsxmRE5AQeXvrh3cvoWAWJWFHPX7n2FgeVvYbB66
 Js7PI8dDyFBjtdRVen1ST55yOUyasY3AyD2iMeyhhGB3dPb65UwIR9BSQKJUC0mrodlI
 Jtug==
X-Gm-Message-State: AOAM533ZECLlJZcAtuzxjQVs/8zYwH5iW7+l6OZtHMU4LYGTAgGzFIi8
 jLVQAM4AiNnPejSBllu0YVMaxg==
X-Google-Smtp-Source: ABdhPJwWy59mN15dEZz73tgDeTM9hlcOWhQ8dG4GRqA+j4YfM28o5M+DWqQ35OxU6A8Jf2A61kG5wg==
X-Received: by 2002:a63:5d1:: with SMTP id 200mr16589218pgf.59.1596486482038; 
 Mon, 03 Aug 2020 13:28:02 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q24sm19614316pgg.3.2020.08.03.13.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 13:28:01 -0700 (PDT)
Date: Mon, 03 Aug 2020 13:28:01 -0700 (PDT)
X-Google-Original-Date: Mon, 03 Aug 2020 13:27:57 PDT (-0700)
Subject: Re: [PATCH v2] riscv: don't specify -mno-save-restore when building
 with clang < 11
In-Reply-To: <20200801103016.l2hs2g2vdsphkjbt@distanz.ch>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tklauser@distanz.ch
Message-ID: <mhng-7ade2879-fcf9-4419-aca8-0c80c1990887@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_162807_793133_06E66104 
X-CRM114-Status: GOOD (  42.60  )
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
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 01 Aug 2020 03:30:17 PDT (-0700), tklauser@distanz.ch wrote:
> On 2020-07-31 at 18:16:28 +0200, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> On Fri, 31 Jul 2020 01:16:51 PDT (-0700), tklauser@distanz.ch wrote:
>> > On 2020-07-31 at 05:58:13 +0200, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> > > On Tue, 28 Jul 2020 21:44:28 PDT (-0700), tklauser@distanz.ch wrote:
>> > > > Clang before version 11 doesn't support -msave-restore and
>> > > > -mno-save-restore [1].
>> > > >
>> > > > [1] https://github.com/ClangBuiltLinux/linux/issues/804
>> > > >
>> > > > This avoids the following message when building with clang 10 and older:
>> > > >
>> > > >   '-save-restore' is not a recognized feature for this target (ignoring feature)
>> > > >
>> > > > Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
>> > > > ---
>> > > > v2: use cc-option and check for clang version
>> > > >
>> > > >  arch/riscv/Makefile | 9 ++++++++-
>> > > >  1 file changed, 8 insertions(+), 1 deletion(-)
>> > > >
>> > > > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
>> > > > index fb6e37db836d..30e34946af86 100644
>> > > > --- a/arch/riscv/Makefile
>> > > > +++ b/arch/riscv/Makefile
>> > > > @@ -44,7 +44,14 @@ riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
>> > > >  KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
>> > > >  KBUILD_AFLAGS += -march=$(riscv-march-y)
>> > > >
>> > > > -KBUILD_CFLAGS += -mno-save-restore
>> > > > +KBUILD_CFLAGS += $(call cc-option,-mno-save-restore)
>> > > > +# Clang versions less than 11 do not support save-restore. See
>> > > > +# https://github.com/ClangBuiltLinux/linux/issues/804
>> > > > +ifeq ($(CONFIG_CC_IS_CLANG), y)
>> > > > +  ifeq ($(shell test $(CONFIG_CLANG_VERSION) -lt 110000; echo $$?),0)
>> > > > +    KBUILD_CFLAGS := $(filter-out -mno-save-restore,$(KBUILD_CFLAGS))
>> > > > +  endif
>> > > > +endif
>> > > >  KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
>> > > >
>> > > >  ifeq ($(CONFIG_CMODEL_MEDLOW),y)
>> > >
>> > > Ya, that seems worse ;).
>> > >
>> > > Does this work?  I still get a -mno-save-restore on GCC, but I don't have an
>> > > LLVM lying around to test it with.
>> >
>> > Yeah, it should still emit -mno-save-restore on GCC and on Clang >= 11,
>> > which is what it does in my tests here.
>> >
>> > It is certainly rather brittle by relying on the specific Clang version
>> > and not very nice to look at, so your solution would certainly be much
>> > nicer. Unfortunately, with cc-option-skipwarn I still get:
>> >
>> >   '-save-restore' is not a recognized feature for this target (ignoring feature)
>> >
>> > when building with Clang 10 :( I think the issue is that Clang
>> > "somewhat" accepts/handles the option  i.e. doesn't treat it as an
>> > unknown option like others and thus doesn't exit with non-zero, like it
>> > does for other options only available for gcc.
>>
>> Sorry, I was asking if my patches below work.  Your stuff seems like it'd
>> pretty obviously work, I just don't like sticking the version in there.  The
>> patches are below.
>
> Sorry, I should have been more explicit in my message. I was testing
> with cc-option-skipwarn with your two patches applied already. But
> unfortunately, the warning still appeared when building with Clang 10
> :-(

Bummer.

> The only way I can currently think of to detect this case using a
> cc-option helper would be to somehow parse clang's stdout/stderr for the
> message which IMO would be equally brittle as making the flag version
> dependent :-(

Ya, that's worse.  I'm going to take a poke at clang and see if I can get
something cleaner to work, otherwise I'll just take your patch.  I should
probably add clang-based builds to my tests anyway.

Thanks!

>
>> >
>> > > From 3e3ae8610db0abba9dd6a18e5d6b9bc8c495c2fc Mon Sep 17 00:00:00 2001
>> > > From: Palmer Dabbelt <palmerdabbelt@google.com>
>> > > Date: Thu, 30 Jul 2020 19:41:11 -0700
>> > > Subject: [PATCH 1/2] Kbuild: add cc-option-skipwarn
>> > >
>> > > The documentation describes the behavior of this function.  In theory we could
>> > > just add -Werror to cc-option, but I don't want to chase around an infinate
>> > > tail of weird build bugs due to compilers that have this odd behavior.
>> > >
>> > > Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
>> > > ---
>> > > Documentation/kbuild/makefiles.rst | 7 +++++++
>> > > scripts/Kbuild.include             | 6 ++++++
>> > > 2 files changed, 13 insertions(+)
>> > >
>> > > diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
>> > > index 6515ebc12b6f..dba9faf4af29 100644
>> > > --- a/Documentation/kbuild/makefiles.rst
>> > > +++ b/Documentation/kbuild/makefiles.rst
>> > > @@ -507,6 +507,13 @@ more details, with real examples.
>> > > 	cflags-y will be assigned no value if first option is not supported.
>> > > 	Note: cc-option uses KBUILD_CFLAGS for $(CC) options
>> > >
>> > > +   cc-option-skipwarn
>> > > +	Some compilers emit a warning on unsupported options rather than an
>> > > +	error.  This trips up cc-option, as the test compiler run will succeed
>> > > +	only to spit out the warning for every file.  cc-option-skipwarn allows
>> > > +	the build infastructure to detect compiles that behave this way, but
>> > > +	otherwise acts exactly as cc-option does.
>> > > +
>> > >    cc-option-yn
>> > > 	cc-option-yn is used to check if gcc supports a given option
>> > > 	and return 'y' if supported, otherwise 'n'.
>> > > diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
>> > > index 9a15fbf66aa1..2efd3a8890c7 100644
>> > > --- a/scripts/Kbuild.include
>> > > +++ b/scripts/Kbuild.include
>> > > @@ -129,6 +129,12 @@ CC_OPTION_CFLAGS = $(filter-out $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
>> > > cc-option = $(call __cc-option, $(CC),\
>> > > 	$(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS),$(1),$(2))
>> > >
>> > > +# cc-option-skipwarn
>> > > +# Usage: cflags-y += $(call cc-option-skipwarn,-mno-save-restore)
>> > > +
>> > > +cc-option-skipwarn = $(call __cc-option, $(CC),\
>> > > +	$(KBUILD_CPPFLAGS) -Werror $(CC_OPTION_CFLAGS),$(1),$(2))
>> > > +
>> > > # cc-option-yn
>> > > # Usage: flag := $(call cc-option-yn,-march=winchip-c6)
>> > > cc-option-yn = $(call try-run,\
>> > > --
>> > > 2.28.0.163.g6104cc2f0b6-goog
>> > >
>> > >
>> > > From 8509566a1a3480ea309fd81317d8cd6125b5e294 Mon Sep 17 00:00:00 2001
>> > > From: Tobias Klauser <tklauser@distanz.ch>
>> > > Date: Wed, 29 Jul 2020 06:44:28 +0200
>> > > Subject: [PATCH 2/2] riscv: don't specify -mno-save-restore unless it's
>> > > supported
>> > >
>> > > Clang before version 11 doesn't support -msave-restore and
>> > > -mno-save-restore [1].
>> > >
>> > > [1] https://github.com/ClangBuiltLinux/linux/issues/804
>> > >
>> > > This avoids the following message when building with clang 10 and older:
>> > >
>> > >  '-save-restore' is not a recognized feature for this target (ignoring feature)
>> > >
>> > > Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
>> > > [Palmer: Use cc-option-nowarn]
>> > > Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
>> > > ---
>> > > arch/riscv/Makefile | 2 +-
>> > > 1 file changed, 1 insertion(+), 1 deletion(-)
>> > >
>> > > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
>> > > index fb6e37db836d..532029c887f1 100644
>> > > --- a/arch/riscv/Makefile
>> > > +++ b/arch/riscv/Makefile
>> > > @@ -44,7 +44,7 @@ riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
>> > > KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
>> > > KBUILD_AFLAGS += -march=$(riscv-march-y)
>> > >
>> > > -KBUILD_CFLAGS += -mno-save-restore
>> > > +KBUILD_CFLAGS += $(call cc-option-skipwarn,-mno-save-restore)
>> > > KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
>> > >
>> > > ifeq ($(CONFIG_CMODEL_MEDLOW),y)
>> > > --
>> > > 2.28.0.163.g6104cc2f0b6-goog
>> > >
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
