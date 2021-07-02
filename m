Return-Path: <SRS0=3Ayx=L2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 098B8C11F68
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 16:57:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0461613EE
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 16:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0461613EE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RiD3aaGtp4W+xKyRvLZ2NR3B87UIB+ikHca8czNhVZ0=; b=C8SjpTiUR46VE5
	EXLSu7rKS5bsyk/fNAUAA7PiOR2Ozf47eM71ApY7BMIFn5/2REWw0pHyoYLFlxB5vVpTc1RsjloVV
	u31QpqjcSaUVoFbiQK7ubK0K7J4qGp6htIjSO/hnExJMbJV6amo+Um11w+YnabtBcabfiSE+Dcq26
	NhpKN/aBwjC6XNqt+sCWyK53lF2PMVwI6ACZCO3JU3+QfLginxIukT9zfXq2knriUboAiaGTD/Uzq
	M1u/jMmcp+QytjCEI/AwcGJTu5yAHAox4mvSp/01be9m8/vs6+a+1k+EoOKTLTn4g+pCQa5G3Sgwi
	PEVxnsZZyMrCMlaZyoPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzMTc-003a8W-IP; Fri, 02 Jul 2021 16:57:16 +0000
Received: from smtprelay0041.hostedemail.com ([216.40.44.41]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzMTQ-003a6W-TV; Fri, 02 Jul 2021 16:57:06 +0000
Received: from omf04.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 1BBDF837F27E;
 Fri,  2 Jul 2021 16:57:01 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf04.hostedemail.com (Postfix) with ESMTPA id D6515D1517; 
 Fri,  2 Jul 2021 16:56:52 +0000 (UTC)
Message-ID: <7a2ef915bd08a1c0277b9633e20905c0ca62c568.camel@perches.com>
Subject: Re: [PATCH V7 01/18] perf/core: Use static_call to optimize
 perf_guest_info_callbacks
From: Joe Perches <joe@perches.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Zhu Lingshan
 <lingshan.zhu@intel.com>,  wanpengli@tencent.com, Like Xu
 <like.xu@linux.intel.com>, eranian@google.com,  weijiang.yang@intel.com,
 Guo Ren <guoren@kernel.org>,  linux-riscv@lists.infradead.org, Will Deacon
 <will@kernel.org>,  kvmarm@lists.cs.columbia.edu,
 kan.liang@linux.intel.com, ak@linux.intel.com,  kvm@vger.kernel.org, Marc
 Zyngier <maz@kernel.org>, joro@8bytes.org,  x86@kernel.org,
 linux-csky@vger.kernel.org, wei.w.wang@intel.com, 
 xen-devel@lists.xenproject.org, liuxiangdong5@huawei.com, bp@alien8.de,
 Paul Walmsley <paul.walmsley@sifive.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>,  linux-arm-kernel@lists.infradead.org,
 jmattson@google.com,  like.xu.linux@gmail.com, Nick Hu
 <nickhu@andestech.com>, seanjc@google.com,  linux-kernel@vger.kernel.org,
 pbonzini@redhat.com, vkuznets@redhat.com
Date: Fri, 02 Jul 2021 09:56:51 -0700
In-Reply-To: <20210702163836.GB94260@C02TD0UTHF1T.local>
References: <20210622094306.8336-1-lingshan.zhu@intel.com>
 <20210622094306.8336-2-lingshan.zhu@intel.com>
 <YN722HIrzc6Z2+oD@hirez.programming.kicks-ass.net>
 <7379289718c6826dd1affec5824b749be2aee0a4.camel@perches.com>
 <20210702163836.GB94260@C02TD0UTHF1T.local>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: D6515D1517
X-Stat-Signature: yfcchsbgyrrjqd9annscud3jta5gtkxi
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/FrPSf3Ewjv8gI9yMKoa9Lq2JHlpGAS2Q=
X-HE-Tag: 1625245012-826405
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_095705_099294_1EDCE06F 
X-CRM114-Status: GOOD (  24.30  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 2021-07-02 at 17:38 +0100, Mark Rutland wrote:
> On Fri, Jul 02, 2021 at 09:00:22AM -0700, Joe Perches wrote:
> > On Fri, 2021-07-02 at 13:22 +0200, Peter Zijlstra wrote:
> > > On Tue, Jun 22, 2021 at 05:42:49PM +0800, Zhu Lingshan wrote:
[]
> > > > +	if (perf_guest_cbs && perf_guest_cbs->handle_intel_pt_intr)
> > > > +		static_call_update(x86_guest_handle_intel_pt_intr,
> > > > +				   perf_guest_cbs->handle_intel_pt_intr);
> > > > +}
> > > =

> > > Coding style wants { } on that last if().
> > =

> > That's just your personal preference.
> > =

> > The coding-style document doesn't require that.
> > =

> > It just says single statement.  It's not the number of
> > vertical lines or characters required for the statement.
> > =

> > ----------------------------------
> > =

> > Do not unnecessarily use braces where a single statement will do.
> > =

> > .. code-block:: c
> > =

> > 	if (condition)
> > 		action();
> > =

> > and
> > =

> > .. code-block:: none
> > =

> > 	if (condition)
> > 		do_this();
> > 	else
> > 		do_that();
> > =

> > This does not apply if only one branch of a conditional statement is a =
single
> > statement; in the latter case use braces in both branches:
> =

> Immediately after this, we say:
> =

> > Also, use braces when a loop contains more than a single simple stateme=
nt:
> > =

> > .. code-block:: c
> > =

> > =A0=A0=A0=A0=A0=A0=A0=A0while (condition) {
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (test)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0do_something();
> > =A0=A0=A0=A0=A0=A0=A0=A0}
> > =

> =

> ... and while that says "a loop", the principle is obviously supposed to
> apply to conditionals too; structurally they're no different. We should
> just fix the documentation to say "a loop or conditional", or something
> to that effect.

<shrug>  Maybe.

I think there are _way_ too many existing obvious uses where the
statement that follows a conditional is multi-line.

	if (foo)
		printk(fmt,
		       args...);

where the braces wouldn't add anything other than more vertical space.

I don't much care one way or another other than Peter's somewhat ambiguous
use of the phrase "coding style".

checkpatch doesn't emit a message either way.
-----------------------------------------
$ cat t_multiline.c
// SPDX-License-Identifier: GPL-2.0-only

void foo(void)
{
	if (foo) {
		pr_info(fmt,
			args);
	}

	if (foo)
		pr_info(fmt,
			args);

	if (foo)
		pr_info(fmt, args);
}

$ ./scripts/checkpatch.pl -f --strict t_multiline.c
total: 0 errors, 0 warnings, 0 checks, 16 lines checked

t_multiline.c has no obvious style problems and is ready for submission.
-----------------------------------------

cheers, Joe



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
