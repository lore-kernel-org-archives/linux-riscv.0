Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44A9CDB479
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 02:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=55cMOuSDYSt5UKnuA+EJM56NJazv0UY87RpJVdN3ApI=; b=dDoFwe20dxEbT8
	OZZVVB0QQ+/WfqWyYzXsq1TVz4I0PUol79AtxZsHEh7LwOaegeu260xyMy4w0tRNmmhaU5W0ZE2Q7
	GmepTjT1t6uL+goAR+vI9Jn2ey1fyjcerCzyY6Qsp4r9jB84ZznsnNZFY5P8mihs0tOV6tZ0YhIwk
	5GRoTjFtby3TL1Wn2JKNAXwJle85se5ZQBwadYzkc29Zb+DLgJfHJ4Mxm2qRSxZ2QLV0ziIsu6AV4
	3aBttZaGl1Gzo5PzUKbDABALNtzU6iYQQkIVDgYrAL+7FMXjUtfI5WMxL9ugm2HlK5RckTW+idZ5N
	lIqOTu8K0K7gM5E+sfzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcDhy-00000007467-3AO9;
	Wed, 24 Jun 2026 02:51:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcDhw-0000000745x-0F09
	for linux-riscv@bombadil.infradead.org;
	Wed, 24 Jun 2026 02:51:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=57BwPhw+2jsNM3qNr+qscKia+O/Fj9nJ6Gilcwg5foo=; b=G2Fil9Zw6Q0/HSaETQ7i+BwrVV
	6YfSQaasJLT2nn8/c8CV9WFkS9DsrJcE4lPCmDiZ8bMprHvOtCECMFoBmhWknGxKjhSK98/uRSqxN
	oOuu/EOX4qu4xFlWgGSC8HtkShSU00D05CPamBN+GVYPyL3naov4dGcinHhOD7LcMkBWyyQBXDHnQ
	u0RKq7d7NhKv4oWi5zrNqasWUGawMjgpujBxp+llzNFBTftdZ+VYvhMSawhsRPJCzO/l6WVx7hAyB
	jsaR1ALLYjGaYErfM48C0TO8oSJTKMQJw0VxX+8iFFXftzq/z0xYsm5lR8PeE6yV0eIiFin/OSWsn
	KoX12pHQ==;
Received: from mx14.baidu.com ([220.181.3.101] helo=outbound.baidu.com)
	by casper.infradead.org with smtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcDho-00000007Fmb-1kjq
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jun 2026 02:51:17 +0000
X-MD-Sfrom: lirongqing@baidu.com
X-MD-SrcIP: 172.31.50.46
From: "Li,Rongqing" <lirongqing@baidu.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: =?utf-8?B?562U5aSNOiBb5aSW6YOo6YKu5Lu2XSBSZTogW1BBVENIXVt2Ml0gQUNQSTog?=
 =?utf-8?B?cHJvY2Vzc29yX2lkbGU6IE1hcmsgTFBJIGVudGVyIGZ1bmN0aW9ucyBhcyBf?=
 =?utf-8?Q?=5Fcpuidle?=
Thread-Topic: =?utf-8?B?W+WklumDqOmCruS7tl0gUmU6IFtQQVRDSF1bdjJdIEFDUEk6IHByb2Nlc3Nv?=
 =?utf-8?B?cl9pZGxlOiBNYXJrIExQSSBlbnRlciBmdW5jdGlvbnMgYXMgX19jcHVpZGxl?=
Thread-Index: AQHc/WFvN8E7xRYeR0ymmalWbQVFC7ZLpvGAgAFVfsA=
Date: Wed, 24 Jun 2026 01:51:14 +0000
Message-ID: <731d81865e444be8a9bc07dd121975f3@baidu.com>
References: <20260616072617.2272-1-lirongqing@baidu.com>
 <CAJZ5v0j3Wnn3exbji-6PzwjCnOCJDe_pUJU9R25Bhvh1ZE3E5A@mail.gmail.com>
In-Reply-To: <CAJZ5v0j3Wnn3exbji-6PzwjCnOCJDe_pUJU9R25Bhvh1ZE3E5A@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.31.62.12]
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1782265879;
	bh=57BwPhw+2jsNM3qNr+qscKia+O/Fj9nJ6Gilcwg5foo=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type;
	b=Fg3YNpSF3gXuJ8VAB0eJroD2sQzoPvt2U2OeUFXylKxIAruWloIwbwjfkaTI6CLpY
	 wmkSHwinxsGlT6k9Zxwfx3Ur18gsRj7OluNSXqy+dLuPf3GzFLOj52sxVQC9aytGw3
	 KHUDPO7fA9yFaOPpsFu3rWbjS+JbpU0zl1vwSz8BW1E0tzz7s3DU57qBrzHnY9qErT
	 UYFGsfsJR5/QIwUoJqGCnLhh+N8JgIG3ZTeVzu1sMNRPpG1caM475GhThyYHCwDxDD
	 HMmhm7lsnZdgbV/Rsw9x0jfTd0a7bahIUG7UhQ+ofB/ovs836oyUDVHIZMQOy7HFrZ
	 7DKNNg4hSo0kQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_035114_131861_DC26118B 
X-CRM114-Status: GOOD (  19.36  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sudeep Holla <Sudeep.Holla@arm.com>, Huisong
 Li <lihuisong@huawei.com>, Paul Walmsley <pjw@kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> > The acpi_idle_lpi_enter() function is invoked within the cpuidle path
> > after RCU has already been disabled for the current local CPU.
> > Consequently, ftrace's function_trace_call() expects RCU to be
> > actively watching before recording trace data, emitting a warning if
> > it is not.
> >
> > Fix this by annotating acpi_idle_lpi_enter(), the generic __weak stub,
> > and the RISC-V implementation of acpi_processor_ffh_lpi_enter() with
> > __cpuidle. This moves these functions into the '.cpuidle.text'
> > section, implicitly disabling ftrace instrumentation (notrace) along
> > this sensitive path and preventing trace-induced RCU warnings during
> > idle entry.
> >
> > Fixes: a36a7fecfe60 ("ACPI / processor_idle: Add support for Low Power
> > Idle(LPI) states")
> > Signed-off-by: Li RongQing <lirongqing@baidu.com>
> > ---
> > Diff with v1: add __cpuidle to acpi_processor_ffh_lpi_enter
> >
> >  drivers/acpi/processor_idle.c | 4 ++--  drivers/acpi/riscv/cpuidle.c
> > | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/acpi/processor_idle.c
> > b/drivers/acpi/processor_idle.c index 390ab5f..4482cf2 100644
> > --- a/drivers/acpi/processor_idle.c
> > +++ b/drivers/acpi/processor_idle.c
> > @@ -1143,7 +1143,7 @@ static int acpi_processor_get_lpi_info(struct
> acpi_processor *pr)
> >         return 0;
> >  }
> >
> > -int __weak acpi_processor_ffh_lpi_enter(struct acpi_lpi_state *lpi)
> > +int __weak __cpuidle acpi_processor_ffh_lpi_enter(struct
> > +acpi_lpi_state *lpi)
> >  {
> >         return -ENODEV;
> >  }
> > @@ -1156,7 +1156,7 @@ int __weak acpi_processor_ffh_lpi_enter(struct
> acpi_lpi_state *lpi)
> >   *
> >   * Return: 0 for success or negative value for error
> >   */
> > -static int acpi_idle_lpi_enter(struct cpuidle_device *dev,
> > +static int __cpuidle acpi_idle_lpi_enter(struct cpuidle_device *dev,
> >                                struct cpuidle_driver *drv, int index)
> > {
> >         struct acpi_processor *pr;
> > diff --git a/drivers/acpi/riscv/cpuidle.c
> > b/drivers/acpi/riscv/cpuidle.c index 624f9bb..c76dbab 100644
> > --- a/drivers/acpi/riscv/cpuidle.c
> > +++ b/drivers/acpi/riscv/cpuidle.c
> > @@ -66,7 +66,7 @@ int acpi_processor_ffh_lpi_probe(unsigned int cpu)
> >         return acpi_cpu_init_idle(cpu);  }
> >
> > -int acpi_processor_ffh_lpi_enter(struct acpi_lpi_state *lpi)
> > +int __cpuidle acpi_processor_ffh_lpi_enter(struct acpi_lpi_state
> > +*lpi)
> >  {
> >         u32 state = lpi->address;
> >
> > --
> 
> Sashiko says that this change may not be sufficient to fully address the issue
> 
> https://sashiko.dev/#/patchset/20260616072617.2272-1-lirongqing%40baidu
> .com
> 
> and that appears to be a valid concern.

Should this fix be placed in a separate patch? CPU_PM_CPU_IDLE_ENTER_PARAM is also invoked by sbi_cpuidle_enter_state, which is itself already annotated with __cpuidle, so this appears to be a pre-existing issue in the RISC-V tree. It would be more appropriate to have RISC-V experts to fix it independently.

Thanks

[Li,Rongqing] 




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
