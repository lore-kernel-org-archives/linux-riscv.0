Return-Path: <SRS0=3Ayx=L2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F907C11F68
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 16:01:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5787C613F7
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 16:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5787C613F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XPvnWpMB8XFIUudhBzTKQ0yUjw4k31WEtoxWwdfwK6g=; b=c0zfNDML0E6V9G
	B65wuTLZ1YHo2RULlyXJA4MYf1NwMptzjVDy74ZH0MLjx0KDH1acjneaYUjDagQUExooIgyM7VAbN
	UPhU9gbnXtlryDaOEc5k3gAHuERCdQJtY34MxblaZT8TMpxOaKB517k+VOMvTZ5f+fdqoU6CBpTdU
	KIw3vvfHoVhuIk3wjLQl19APRkGWDzfmRCEHV/jp7dB6tVYPn8wOaB3ag9t8NJ9WI9i8sEQTinK7q
	gZSNnPeyedvHsye1uJKxYnwfZNeDY6wKWYzVV5ASdTCpcks8CggNdIaCDyOJA7G7dcbZoS7wOHS6d
	vKYLbRctPGGa3yS9t90w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzLb2-003U69-US; Fri, 02 Jul 2021 16:00:52 +0000
Received: from smtprelay0249.hostedemail.com ([216.40.44.249]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzLap-003U3Q-Rv; Fri, 02 Jul 2021 16:00:41 +0000
Received: from omf08.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 5E8CE181D207E;
 Fri,  2 Jul 2021 16:00:33 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf08.hostedemail.com (Postfix) with ESMTPA id 850751A29F9; 
 Fri,  2 Jul 2021 16:00:25 +0000 (UTC)
Message-ID: <7379289718c6826dd1affec5824b749be2aee0a4.camel@perches.com>
Subject: Re: [PATCH V7 01/18] perf/core: Use static_call to optimize
 perf_guest_info_callbacks
From: Joe Perches <joe@perches.com>
To: Peter Zijlstra <peterz@infradead.org>, Zhu Lingshan
 <lingshan.zhu@intel.com>
Cc: pbonzini@redhat.com, bp@alien8.de, seanjc@google.com,
 vkuznets@redhat.com,  wanpengli@tencent.com, jmattson@google.com,
 joro@8bytes.org,  weijiang.yang@intel.com, kan.liang@linux.intel.com,
 ak@linux.intel.com,  wei.w.wang@intel.com, eranian@google.com,
 liuxiangdong5@huawei.com,  linux-kernel@vger.kernel.org, x86@kernel.org,
 kvm@vger.kernel.org,  like.xu.linux@gmail.com, Like Xu
 <like.xu@linux.intel.com>, Will Deacon <will@kernel.org>, Marc Zyngier
 <maz@kernel.org>, Guo Ren <guoren@kernel.org>,  Nick Hu
 <nickhu@andestech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org,  kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org,  linux-riscv@lists.infradead.org,
 xen-devel@lists.xenproject.org
Date: Fri, 02 Jul 2021 09:00:22 -0700
In-Reply-To: <YN722HIrzc6Z2+oD@hirez.programming.kicks-ass.net>
References: <20210622094306.8336-1-lingshan.zhu@intel.com>
 <20210622094306.8336-2-lingshan.zhu@intel.com>
 <YN722HIrzc6Z2+oD@hirez.programming.kicks-ass.net>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 850751A29F9
X-Stat-Signature: shha9bwa3wcuy6qog6sh3abeec4qbbut
X-Rspamd-Server: rspamout03
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18c3UUJH2LcjAG65GSZ68xha895S86OjZI=
X-HE-Tag: 1625241625-20610
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_090039_990149_3848C779 
X-CRM114-Status: GOOD (  11.09  )
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

On Fri, 2021-07-02 at 13:22 +0200, Peter Zijlstra wrote:
> On Tue, Jun 22, 2021 at 05:42:49PM +0800, Zhu Lingshan wrote:
> > diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
[]
> > @@ -90,6 +90,27 @@ DEFINE_STATIC_CALL_NULL(x86_pmu_pebs_aliases, *x86_p=
mu.pebs_aliases);
> > =A0=A0*/
> > =A0DEFINE_STATIC_CALL_RET0(x86_pmu_guest_get_msrs, *x86_pmu.guest_get_m=
srs);
> > =A0
> > =

> > +DEFINE_STATIC_CALL_RET0(x86_guest_state, *(perf_guest_cbs->state));
> > +DEFINE_STATIC_CALL_RET0(x86_guest_get_ip, *(perf_guest_cbs->get_ip));
> > +DEFINE_STATIC_CALL_RET0(x86_guest_handle_intel_pt_intr, *(perf_guest_c=
bs->handle_intel_pt_intr));
> > +
> > +void arch_perf_update_guest_cbs(void)
> > +{
> > +	static_call_update(x86_guest_state, (void *)&__static_call_return0);
> > +	static_call_update(x86_guest_get_ip, (void *)&__static_call_return0);
> > +	static_call_update(x86_guest_handle_intel_pt_intr, (void *)&__static_=
call_return0);
> > +
> > +	if (perf_guest_cbs && perf_guest_cbs->state)
> > +		static_call_update(x86_guest_state, perf_guest_cbs->state);
> > +
> > +	if (perf_guest_cbs && perf_guest_cbs->get_ip)
> > +		static_call_update(x86_guest_get_ip, perf_guest_cbs->get_ip);
> > +
> > +	if (perf_guest_cbs && perf_guest_cbs->handle_intel_pt_intr)
> > +		static_call_update(x86_guest_handle_intel_pt_intr,
> > +				   perf_guest_cbs->handle_intel_pt_intr);
> > +}
> =

> Coding style wants { } on that last if().

That's just your personal preference.

The coding-style document doesn't require that.

It just says single statement.  It's not the number of
vertical lines or characters required for the statement.

----------------------------------

Do not unnecessarily use braces where a single statement will do.

.. code-block:: c

	if (condition)
		action();

and

.. code-block:: none

	if (condition)
		do_this();
	else
		do_that();

This does not apply if only one branch of a conditional statement is a sing=
le
statement; in the latter case use braces in both branches:



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
