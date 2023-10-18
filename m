Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5159ECDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 17:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=baBlCk9f4QN/kyhTOIO/WsBii4BC/BZ6/vVHO43VGkA=; b=WXe46JT8QvIcaV
	32d9XoYeoEvIOwzMHpDnIYOeAUi1IlEc6Ho1Z5GDpvdtzFrWwDtRIQj3B8R4EaquU33QMN1ldF7MR
	E7BqBpzxkWP8eQU4Fd+Yriq9eFf5W/314cBheqlaNjqWJ+oQDWB6WBSFFTWCLk64H5HCGXuwV75qn
	DxGqEEXVwnSq8dRiyGke8rPJDksrA4lnP7/HoQQx+kbW9dgQd/IWIMsDPmjWadgAfcciS7xKMMJpI
	gFGaO9I831riUBnehuavFv907baX3jbAlyOg5FVTgHMa5rTUKdeIVzj2kH5UO7q8r2xJ6N231R4aD
	QaGjc2lLi5wlIUYg8e9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAOQ-00FKb5-12;
	Wed, 18 Oct 2023 17:31:38 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAOM-00FKZr-2G
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 17:31:36 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-77421a47db6so434573585a.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 10:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697650293; x=1698255093; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9bLri2X0kCXBGV92nbDG6SwJM6GKrFdnsc241iebPNs=;
        b=0Rn5/guvRhZLE7VcbsNEVUDwsRgvyAIzMb3yYwRc2Qm+iVGvdT+j14fk0tT9DhvU+u
         eOaMV/0jDKt/8kezFXv4dguQPerUwo5qEcT1rOvigHgcVxCFyfCsaWUnuELYO6i/nkxV
         p+WNQShK/8CIAi0ymmWR9KvvvIrw0GH/JVLXdqfFF5ko4tSQtViIiEiSNb1vTvqYeX0T
         XwjYxNehTBX9N0y5BMgQ3TzZsO0WJL1sOr/B4IfDYpp2k2e3zG+FGiiklQrcWiJtB4Bi
         lpdOYOZyVFGxWlGiaeChw2TdXW5wDopgakfqdl5SVGpZFV4bsrKe7Jfr+6KepvkPyZDC
         ULQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697650293; x=1698255093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bLri2X0kCXBGV92nbDG6SwJM6GKrFdnsc241iebPNs=;
        b=ZeQXpaUSZHAv5Z4tS6dolkQOz/EJomTXQmCIRrsgzMkhUE/Zu3mpR/gpvasttZgplH
         JUQnN8vJZRjwg6Rz8wqYl1kKMI8cEUY2W8lx8dGe9Sg/xAuF4/bRiNGOw4FRP2OeZdQ2
         GexEaWf37AMd4c6NNsCDWozw5imJQDV6pk6SgA0buwSFPpXxLZckRSM/8DyzZVaucoFJ
         WJG7vBKNdaSHR3s2gQ4Dk+r6BQMC/oy4Gb2MJoWO5TKvajsGogueACNimJwmFssR6y2t
         ngED987k98zyfJHJw7PZZ+dBkITDC1FL7ASt0nGUJ7J43kfjpVU6jgh0RHLysRjPzOO2
         P8Fg==
X-Gm-Message-State: AOJu0Yw5MadFAx+f/lvuxiYRwwqcKH5uK+qmkaBSou7jUHDhU5yqv4J0
	weaPA3FCQwdEvlAvbBGRRrMIIQ==
X-Google-Smtp-Source: AGHT+IFo+mjFtPxRpd0jIylF9fz6tknOGNAoG6F08LeZnO+TZslObXXsbTQ7uyBbn7ocgkka/c15Cw==
X-Received: by 2002:a05:620a:3994:b0:775:9c22:e901 with SMTP id ro20-20020a05620a399400b007759c22e901mr5485542qkn.15.1697650293358;
        Wed, 18 Oct 2023 10:31:33 -0700 (PDT)
Received: from ghost ([208.116.208.98])
        by smtp.gmail.com with ESMTPSA id g3-20020a05620a108300b007789a3499casm109418qkk.115.2023.10.18.10.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 10:31:32 -0700 (PDT)
Date: Wed, 18 Oct 2023 10:31:29 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v4 0/2] riscv: Add remaining module relocations and tests
Message-ID: <ZTAWcX1qVhkC71BJ@ghost>
References: <20231017-module_relocations-v4-0-937f5ef316f0@rivosinc.com>
 <20231018-smite-bungee-f46b15b4ce6f@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231018-smite-bungee-f46b15b4ce6f@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_103134_742072_E7D528FC 
X-CRM114-Status: GOOD (  24.00  )
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

On Wed, Oct 18, 2023 at 12:35:55PM +0100, Conor Dooley wrote:
> Hey Charlie,
> 
> On Tue, Oct 17, 2023 at 10:34:15PM -0700, Charlie Jenkins wrote:
> > A handful of module relocations were missing, this patch includes the
> > remaining ones. I also wrote some test cases to ensure that module
> > loading works properly. Some relocations cannot be supported in the
> > kernel, these include the ones that rely on thread local storage and
> > dynamic linking.
> > 
> > ULEB128 handling is a bit special because SET and SUB relocations must
> > happen together, and SET must happen before SUB. A psABI proposal [1]
> > mandates that the first SET_ULEB128 that appears before a SUB_ULEB128
> > is the associated SET_ULEB128.
> > 
> > This can be tested by enabling KUNIT, RUNTIME_KERNEL_TESTING_MENU, and
> > RISCV_MODULE_LINKING_KUNIT.
> > 
> > [1] https://github.com/riscv-non-isa/riscv-elf-psabi-doc/pull/403
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> > Changes in v4:
> > - Complete removal of R_RISCV_RVC_LUI
> > - Fix bug in R_RISCV_SUB6 linking
> > - Only build ULEB128 tests if supported by toolchain
> > - Link to v3: https://lore.kernel.org/r/20231016-module_relocations-v3-0-a667fd6071e9@rivosinc.com
> 
> On patch 2/2:
> 
> ../arch/riscv/kernel/tests/module_test/test_uleb128.S:18:17: error: unknown relocation name
> ../arch/riscv/kernel/tests/module_test/test_uleb128.S:19:17: error: unknown relocation name
> 
> Same toolchain configuration in the patchwork automation as before.
> 
> Cheers,
> Conor.

Where do you see this error? On Patchwork I see a success [1].

[1] https://patchwork.kernel.org/project/linux-riscv/patch/20231017-module_relocations-v4-2-937f5ef316f0@rivosinc.com/

> 
> > 
> > Changes in v3:
> > - Add prototypes to test_module_linking_main as recommended by intel
> >   zero day bot
> > - Improve efficiency of ULEB128 pair matching
> > - Link to v2: https://lore.kernel.org/r/20231006-module_relocations-v2-0-47566453fedc@rivosinc.com
> > 
> > Changes in v2:
> > - Added ULEB128 relocations
> > - Link to v1: https://lore.kernel.org/r/20230913-module_relocations-v1-0-bb3d8467e793@rivosinc.com
> > 
> > ---
> > Charlie Jenkins (2):
> >       riscv: Add remaining module relocations
> >       riscv: Add tests for riscv module loading
> > 
> >  arch/riscv/Kconfig.debug                           |   1 +
> >  arch/riscv/include/uapi/asm/elf.h                  |   5 +-
> >  arch/riscv/kernel/Makefile                         |   1 +
> >  arch/riscv/kernel/module.c                         | 207 ++++++++++++++++++---
> >  arch/riscv/kernel/tests/Kconfig.debug              |  35 ++++
> >  arch/riscv/kernel/tests/Makefile                   |   1 +
> >  arch/riscv/kernel/tests/module_test/Makefile       |  15 ++
> >  .../tests/module_test/test_module_linking_main.c   |  85 +++++++++
> >  arch/riscv/kernel/tests/module_test/test_set16.S   |  23 +++
> >  arch/riscv/kernel/tests/module_test/test_set32.S   |  20 ++
> >  arch/riscv/kernel/tests/module_test/test_set6.S    |  23 +++
> >  arch/riscv/kernel/tests/module_test/test_set8.S    |  23 +++
> >  arch/riscv/kernel/tests/module_test/test_sub16.S   |  22 +++
> >  arch/riscv/kernel/tests/module_test/test_sub32.S   |  22 +++
> >  arch/riscv/kernel/tests/module_test/test_sub6.S    |  22 +++
> >  arch/riscv/kernel/tests/module_test/test_sub64.S   |  27 +++
> >  arch/riscv/kernel/tests/module_test/test_sub8.S    |  22 +++
> >  arch/riscv/kernel/tests/module_test/test_uleb128.S |  20 ++
> >  18 files changed, 548 insertions(+), 26 deletions(-)
> > ---
> > base-commit: 4d320c2d9a2b22f53523a1b012cda17a50220965
> > change-id: 20230908-module_relocations-f63ced651bd7
> > -- 
> > - Charlie
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
