Return-Path: <SRS0=3Ayx=L2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6851C11F68
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 16:43:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97C8B6141C
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 16:43:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97C8B6141C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3WTpmjtfLoEC0o8zJEzJM4JENQMy9WOiHMuCWpXTN1Y=; b=3wNxORqLFr6q1g
	qcI5gsH8cTjwCqSP8iWkA2AReVUy2y9kHqyJpYwWk3Hh+0j7H+xtLAe/4dVk5fki/iAiXp+hUhgSr
	mBCuSzOBOtfKKBmawipzLgpIhuJYd8lhEvnmzW8JQStdx9beUMrwaRa92n0IXWi/lTlAzbBa8kx3u
	fN4XaEBh2GflWoCLg34bEqZocUlHWRptEdWSTcHzoWdEU8DoX6HK8fhyeQz8V9NcgzJNYEWBxn7np
	xxWHC8itgl2N01Jig6p/55itDgGf3DQcJZDllOx5AO9D8OmSlNzMm8O9XdRH9Bo+fC3XC+OEPYvW+
	/ZBLUA0KUwiy/vkw6U8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzMFf-003YZh-3q; Fri, 02 Jul 2021 16:42:51 +0000
Received: from smtprelay0047.hostedemail.com ([216.40.44.47]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzMFQ-003YWg-N9; Fri, 02 Jul 2021 16:42:39 +0000
Received: from omf19.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id C507B180A9C91;
 Fri,  2 Jul 2021 16:42:34 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf19.hostedemail.com (Postfix) with ESMTPA id 10EBB20D764; 
 Fri,  2 Jul 2021 16:42:26 +0000 (UTC)
Message-ID: <34a668a0606092990326207d2acc5441592756d6.camel@perches.com>
Subject: Re: [PATCH V7 01/18] perf/core: Use static_call to optimize
 perf_guest_info_callbacks
From: Joe Perches <joe@perches.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Zhu Lingshan <lingshan.zhu@intel.com>, pbonzini@redhat.com,
 bp@alien8.de,  seanjc@google.com, vkuznets@redhat.com,
 wanpengli@tencent.com, jmattson@google.com,  joro@8bytes.org,
 weijiang.yang@intel.com, kan.liang@linux.intel.com,  ak@linux.intel.com,
 wei.w.wang@intel.com, eranian@google.com,  liuxiangdong5@huawei.com,
 linux-kernel@vger.kernel.org, x86@kernel.org,  kvm@vger.kernel.org,
 like.xu.linux@gmail.com, Like Xu <like.xu@linux.intel.com>,  Will Deacon
 <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Guo Ren
 <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org,  kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org,  linux-riscv@lists.infradead.org,
 xen-devel@lists.xenproject.org
Date: Fri, 02 Jul 2021 09:42:25 -0700
In-Reply-To: <YN88rE+cxb7HrEtI@hirez.programming.kicks-ass.net>
References: <20210622094306.8336-1-lingshan.zhu@intel.com>
 <20210622094306.8336-2-lingshan.zhu@intel.com>
 <YN722HIrzc6Z2+oD@hirez.programming.kicks-ass.net>
 <7379289718c6826dd1affec5824b749be2aee0a4.camel@perches.com>
 <YN88rE+cxb7HrEtI@hirez.programming.kicks-ass.net>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
X-Stat-Signature: ycuw4tc4dkddxofnskkdygh116nc5379
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 10EBB20D764
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18HOccKXnefKVhqRarv+ICfPC7oSScH3Ls=
X-HE-Tag: 1625244146-824246
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_094236_864905_C2058F55 
X-CRM114-Status: GOOD (  16.08  )
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

On Fri, 2021-07-02 at 18:19 +0200, Peter Zijlstra wrote:
> On Fri, Jul 02, 2021 at 09:00:22AM -0700, Joe Perches wrote:
> > On Fri, 2021-07-02 at 13:22 +0200, Peter Zijlstra wrote:
> > > On Tue, Jun 22, 2021 at 05:42:49PM +0800, Zhu Lingshan wrote:
> > > > diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
> > []
> > > > +	if (perf_guest_cbs && perf_guest_cbs->handle_intel_pt_intr)
> > > > +		static_call_update(x86_guest_handle_intel_pt_intr,
> > > > +				   perf_guest_cbs->handle_intel_pt_intr);
> > > > +}
> > > =

> > > Coding style wants { } on that last if().
> > =

> > That's just your personal preference.
> =

> As a maintainer, those carry weight, also that's tip rules:
> =

> =A0=A0https://lore.kernel.org/lkml/20181107171149.165693799@linutronix.de/

Right, definitely so.

But merely referencing 'coding style' is ambiguous at best.

btw:

ASCII commonly refers to '{' and '}', the curly brackets, to be braces
and '[' and ']', the square brackets, to be brackets.

It might be clearer to use that terminology.

belts and braces, etc...

cheers, Joe

----------------

+Bracket rules
+^^^^^^^^^^^^^
+
+Brackets should be omitted only if the statement which follows 'if', 'for',
+'while' etc. is truly a single line::
+
+	if (foo)
+		do_something();
+
+The following is not considered to be a single line statement even
+though C does not require brackets::
+
+	for (i =3D 0; i < end; i++)
+		if (foo[i])
+			do_something(foo[i]);
+
+Adding brackets around the outer loop enhances the reading flow::
+
+	for (i =3D 0; i < end; i++) {
+		if (foo[i])
+			do_something(foo[i]);
+	}



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
