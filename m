Return-Path: <SRS0=O7qi=BK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B746C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2020 08:17:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FC6E20829
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2020 08:17:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0xT9UoG1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FC6E20829
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=distanz.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d7UDLKlZ2F/wIwI7SpUaC6ymBxrPTvHNoIkGDJocpZw=; b=0xT9UoG1kRH8hj/t4wFNHtG9C
	/nl5b4c3ZSkcZJQj/vvQe2xtHG8SxP73Qy79yZVP9an4IkH5zOA0Npcmfv7FUn3gzaK9ffT/yCld6
	7MBfbNcU+udDSfAW0HTAJLkv7B+S+IfR3DRyBvAmJgTFUCMRMW+H5vIEiDi34gFQN1fmXnK5hflWx
	PhSvZS68wTnXWrcPP81Pm+bdV1DfNatdL0oJzaCf2OJWyPJOVHK0OfA0N7jPpr181+ERSDZMUjyGI
	DNaiqURubcdHUNA7t2Tj5PeeGAXuS3yFxr8W0rQH/2gI7bvrl0o6hYA/bEmxwMeEYL63gWPNL7R0V
	NKjN79pxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1QDu-0001lx-DM; Fri, 31 Jul 2020 08:17:02 +0000
Received: from sym2.noone.org ([2a01:4f8:120:4161::3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1QDr-0001l0-Gq
 for linux-riscv@lists.infradead.org; Fri, 31 Jul 2020 08:17:00 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 4BJ0Vr3vldzvjcX; Fri, 31 Jul 2020 10:16:52 +0200 (CEST)
Date: Fri, 31 Jul 2020 10:16:51 +0200
From: Tobias Klauser <tklauser@distanz.ch>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v2] riscv: don't specify -mno-save-restore when building
 with clang < 11
Message-ID: <20200731081650.ojhxnpaiiwi6xlko@distanz.ch>
References: <20200729044428.32460-1-tklauser@distanz.ch>
 <mhng-91321ec8-a62c-46f3-908f-4bd21148cd05@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-91321ec8-a62c-46f3-908f-4bd21148cd05@palmerdabbelt-glaptop1>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_041659_692295_782BF1DB 
X-CRM114-Status: GOOD (  29.26  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020-07-31 at 05:58:13 +0200, Palmer Dabbelt <palmer@dabbelt.com> wrote:
> On Tue, 28 Jul 2020 21:44:28 PDT (-0700), tklauser@distanz.ch wrote:
> > Clang before version 11 doesn't support -msave-restore and
> > -mno-save-restore [1].
> > 
> > [1] https://github.com/ClangBuiltLinux/linux/issues/804
> > 
> > This avoids the following message when building with clang 10 and older:
> > 
> >   '-save-restore' is not a recognized feature for this target (ignoring feature)
> > 
> > Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> > ---
> > v2: use cc-option and check for clang version
> > 
> >  arch/riscv/Makefile | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > index fb6e37db836d..30e34946af86 100644
> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -44,7 +44,14 @@ riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
> >  KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
> >  KBUILD_AFLAGS += -march=$(riscv-march-y)
> > 
> > -KBUILD_CFLAGS += -mno-save-restore
> > +KBUILD_CFLAGS += $(call cc-option,-mno-save-restore)
> > +# Clang versions less than 11 do not support save-restore. See
> > +# https://github.com/ClangBuiltLinux/linux/issues/804
> > +ifeq ($(CONFIG_CC_IS_CLANG), y)
> > +  ifeq ($(shell test $(CONFIG_CLANG_VERSION) -lt 110000; echo $$?),0)
> > +    KBUILD_CFLAGS := $(filter-out -mno-save-restore,$(KBUILD_CFLAGS))
> > +  endif
> > +endif
> >  KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
> > 
> >  ifeq ($(CONFIG_CMODEL_MEDLOW),y)
> 
> Ya, that seems worse ;).
> 
> Does this work?  I still get a -mno-save-restore on GCC, but I don't have an
> LLVM lying around to test it with.

Yeah, it should still emit -mno-save-restore on GCC and on Clang >= 11,
which is what it does in my tests here.

It is certainly rather brittle by relying on the specific Clang version
and not very nice to look at, so your solution would certainly be much
nicer. Unfortunately, with cc-option-skipwarn I still get:

  '-save-restore' is not a recognized feature for this target (ignoring feature)

when building with Clang 10 :( I think the issue is that Clang
"somewhat" accepts/handles the option  i.e. doesn't treat it as an
unknown option like others and thus doesn't exit with non-zero, like it
does for other options only available for gcc.

> From 3e3ae8610db0abba9dd6a18e5d6b9bc8c495c2fc Mon Sep 17 00:00:00 2001
> From: Palmer Dabbelt <palmerdabbelt@google.com>
> Date: Thu, 30 Jul 2020 19:41:11 -0700
> Subject: [PATCH 1/2] Kbuild: add cc-option-skipwarn
> 
> The documentation describes the behavior of this function.  In theory we could
> just add -Werror to cc-option, but I don't want to chase around an infinate
> tail of weird build bugs due to compilers that have this odd behavior.
> 
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
> Documentation/kbuild/makefiles.rst | 7 +++++++
> scripts/Kbuild.include             | 6 ++++++
> 2 files changed, 13 insertions(+)
> 
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index 6515ebc12b6f..dba9faf4af29 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -507,6 +507,13 @@ more details, with real examples.
> 	cflags-y will be assigned no value if first option is not supported.
> 	Note: cc-option uses KBUILD_CFLAGS for $(CC) options
> 
> +   cc-option-skipwarn
> +	Some compilers emit a warning on unsupported options rather than an
> +	error.  This trips up cc-option, as the test compiler run will succeed
> +	only to spit out the warning for every file.  cc-option-skipwarn allows
> +	the build infastructure to detect compiles that behave this way, but
> +	otherwise acts exactly as cc-option does.
> +
>    cc-option-yn
> 	cc-option-yn is used to check if gcc supports a given option
> 	and return 'y' if supported, otherwise 'n'.
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 9a15fbf66aa1..2efd3a8890c7 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -129,6 +129,12 @@ CC_OPTION_CFLAGS = $(filter-out $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
> cc-option = $(call __cc-option, $(CC),\
> 	$(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS),$(1),$(2))
> 
> +# cc-option-skipwarn
> +# Usage: cflags-y += $(call cc-option-skipwarn,-mno-save-restore)
> +
> +cc-option-skipwarn = $(call __cc-option, $(CC),\
> +	$(KBUILD_CPPFLAGS) -Werror $(CC_OPTION_CFLAGS),$(1),$(2))
> +
> # cc-option-yn
> # Usage: flag := $(call cc-option-yn,-march=winchip-c6)
> cc-option-yn = $(call try-run,\
> -- 
> 2.28.0.163.g6104cc2f0b6-goog
> 
> 
> From 8509566a1a3480ea309fd81317d8cd6125b5e294 Mon Sep 17 00:00:00 2001
> From: Tobias Klauser <tklauser@distanz.ch>
> Date: Wed, 29 Jul 2020 06:44:28 +0200
> Subject: [PATCH 2/2] riscv: don't specify -mno-save-restore unless it's
> supported
> 
> Clang before version 11 doesn't support -msave-restore and
> -mno-save-restore [1].
> 
> [1] https://github.com/ClangBuiltLinux/linux/issues/804
> 
> This avoids the following message when building with clang 10 and older:
> 
>  '-save-restore' is not a recognized feature for this target (ignoring feature)
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> [Palmer: Use cc-option-nowarn]
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
> arch/riscv/Makefile | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index fb6e37db836d..532029c887f1 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -44,7 +44,7 @@ riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
> KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
> KBUILD_AFLAGS += -march=$(riscv-march-y)
> 
> -KBUILD_CFLAGS += -mno-save-restore
> +KBUILD_CFLAGS += $(call cc-option-skipwarn,-mno-save-restore)
> KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
> 
> ifeq ($(CONFIG_CMODEL_MEDLOW),y)
> -- 
> 2.28.0.163.g6104cc2f0b6-goog
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
