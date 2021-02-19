Return-Path: <SRS0=LlRU=HV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34FFAC433E6
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Feb 2021 10:46:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80C9364EB7
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Feb 2021 10:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80C9364EB7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=distanz.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ykB2acXeY/XODQ3aWNAIum9hP6ZPe0EXYmsylttuIeQ=; b=q2UWL94axq57782nu9TWOIYzd
	nVajM9Vj6WzM4PQD+c3o+9AY/K5+9oMmqVDQzEfLmgns3txwi8US/q2sHctuhxaDhsdcYl/qAdKqJ
	kGAWj5RC5Qkl9CIEpXbyrjfFW2eCcw29WbgN9X3Wl4jQ+SYEvS1/AHitF0DvPt3n0CsEF5Expug1j
	+p9aWsl/RQaqeAq5qXsakcRtO+EnX9NMH3YsCxKyUJiWzOGgUwKdTu033xTv+chUBTJByX0ufFL6Z
	xlpNsrxD8SmxYQdghjgF+2aSWiePcSDeoPogV4FnLPr5tIvA5jO45KGjkyWher5/Y5rOLMxexGuDk
	rxXx1u7Ag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lD1nD-0001XW-Oh; Fri, 19 Feb 2021 09:09:43 +0000
Received: from sym2.noone.org ([178.63.92.236])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lD1nB-0001WH-4o
 for linux-riscv@lists.infradead.org; Fri, 19 Feb 2021 09:09:42 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 4Dhm415401zvjfp; Fri, 19 Feb 2021 10:09:37 +0100 (CET)
Date: Fri, 19 Feb 2021 10:09:37 +0100
From: Tobias Klauser <tklauser@distanz.ch>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] riscv: Disable KSAN_SANITIZE for vDSO
Message-ID: <20210219090937.f4pyhsjnr4f2xmkf@distanz.ch>
References: <20210216173305.2500-1-tklauser@distanz.ch>
 <mhng-f4076110-eb87-47b6-92fb-9170bbf39b7d@palmerdabbelt-glaptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-f4076110-eb87-47b6-92fb-9170bbf39b7d@palmerdabbelt-glaptop>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210219_040941_345174_B33CC936 
X-CRM114-Status: GOOD (  22.43  )
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
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu, dvyukov@google.com,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021-02-19 at 08:15:34 +0100, Palmer Dabbelt <palmer@dabbelt.com> wrote:
> On Tue, 16 Feb 2021 09:33:05 PST (-0800), tklauser@distanz.ch wrote:
> > Dmitry Vyukov reports:
> > > I've localized one issue with riscv/KASAN:
> > > KASAN breaks VDSO and that's I think the root cause of weird faults I
> > > saw earlier. The following patch fixes it.
> > > Could somebody please upstream this fix? I don't know how to add/run
> > > tests for this.
> > 
> > Verified the fix on a kernel with KASAN enabled using vDSO selftests.
> > 
> > Link: https://lore.kernel.org/lkml/CACT4Y+ZNJBnkKHXUf=tm_yuowvZvHwN=0rmJ=7J+xFd+9r_6pQ@mail.gmail.com/
> > Cc: Dmitry Vyukov <dvyukov@google.com>
> > Tested-by: Tobias Klauser <tklauser@distanz.ch>
> > Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> > ---
> >  arch/riscv/kernel/vdso/Makefile | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> > index 0cfd6da784f8..71a315e73cbe 100644
> > --- a/arch/riscv/kernel/vdso/Makefile
> > +++ b/arch/riscv/kernel/vdso/Makefile
> > @@ -32,9 +32,10 @@ CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
> >  # Disable -pg to prevent insert call site
> >  CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os
> > 
> > -# Disable gcov profiling for VDSO code
> > +# Disable profiling and instrumentation for VDSO code
> >  GCOV_PROFILE := n
> >  KCOV_INSTRUMENT := n
> > +KASAN_SANITIZE := n
> > 
> >  # Force dependency
> >  $(obj)/vdso.o: $(obj)/vdso.so
> 
> This seems reasonable.  Building the VDSO with asan results in a bunch of PLT
> entries for the VDSO stubs.  I don't see a sane way to resolve those, and it
> looks like this is what everyone else is doing.
> 
> That said, the commit text is a bit funny so I've written one of my own.  This
> is on for-next, as it's still the merge window.  Let me know if the text
> doesn't make sense.

Thanks for fixing up the commit message and adding the Fixes line. Makes
sense to me.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
