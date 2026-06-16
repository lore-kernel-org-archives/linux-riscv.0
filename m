Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE62CD98DA
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 13:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5Ba6fVWnVZ9YGvsBhglLEN84/9dkVLeI4qBLs9vIqQ=; b=mIAuxgqLdgyj9ykjFUZ/qItKUJ
	8fQUWSIeCxflK4c6YFlD4vumTC/pEmen4Fha1t0tH0pM4EmdZYYoTL6L1cC5x2LjccykOSPfOHdFb
	GiTJ7NTKBkmSoaqaWZYa7Iwu4MoMFcfSi67vU5H6kuuHS81CqQlFZihke0V25mFb8S8v4C9GRmQBQ
	FX4FvalsQEgUMi+6aWELLA9aSOvl+hVE+ijQs1/KmPNveZsUPOBv3CtLsEWKHJ8BU8Pmhm8uR/FDN
	UnuA7U+Fiuli87BjBOKmFnmtG2yHw/gNZBsQUQtCtEO5w/5ziyNAS4tRTc3+9RhJ8fe5YGpT9pqcy
	1T2fXv4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZTbP-0000000Foo7-0y4W;
	Tue, 16 Jun 2026 13:13:15 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZTbK-0000000Foma-47YS
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 13:13:13 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9E0DuBf96JZkkmK5Hg++NskVSILbsCcyEZOXqhBthHU=;
	b=os/ptCz2VFlDM8YHnUy1o9aLibmW0ZIaOUjlp4LDeF21B0lCQck4WzMmPjMlGKODqmUqY7eQ/
	wa0jx8iA8p7Z1K7eQioXtEEpGwyp23Pz3BIpmAohk5ibtG/Ky8abGIXMX4NCTT4ppx05VSEexwp
	btkXIa6Rccro3Dp3pmTlyKE=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gfnHg0bwwz12LF5;
	Tue, 16 Jun 2026 21:03:59 +0800 (CST)
Received: from kwepemo100005.china.huawei.com (unknown [7.202.195.212])
	by mail.maildlp.com (Postfix) with ESMTPS id 9441540569;
	Tue, 16 Jun 2026 21:12:50 +0800 (CST)
Received: from [10.67.121.59] (10.67.121.59) by kwepemo100005.china.huawei.com
 (7.202.195.212) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 16 Jun
 2026 21:12:49 +0800
Message-ID: <a2483bf9-0a78-43df-ae03-b017bc72c380@huawei.com>
Date: Tue, 16 Jun 2026 21:12:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][v2] ACPI: processor_idle: Mark LPI enter functions as
 __cpuidle
To: lirongqing <lirongqing@baidu.com>, "Rafael J . Wysocki"
	<rafael@kernel.org>, Len Brown <lenb@kernel.org>, Sunil V L
	<sunilvl@ventanamicro.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Sudeep Holla <Sudeep.Holla@arm.com>,
	<linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20260616072617.2272-1-lirongqing@baidu.com>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <20260616072617.2272-1-lirongqing@baidu.com>
X-Originating-IP: [10.67.121.59]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemo100005.china.huawei.com (7.202.195.212)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_061311_482217_2342181B 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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


On 6/16/2026 3:26 PM, lirongqing wrote:
> From: Li RongQing <lirongqing@baidu.com>
>
> When function tracing or Kprobes is enabled, entering an ACPI Low
> Power Idle (LPI) state triggers the following RCU splat:
>
>    RCU not on for: acpi_idle_lpi_enter+0x4/0xd8
>    WARNING: CPU: 8 PID: 0 at include/linux/trace_recursion.h:162 function_trace_call+0x1e8/0x228
>
> The acpi_idle_lpi_enter() function is invoked within the cpuidle
> path after RCU has already been disabled for the current local CPU.
> Consequently, ftrace's function_trace_call() expects RCU to be
> actively watching before recording trace data, emitting a warning
> if it is not.
>
> Fix this by annotating acpi_idle_lpi_enter(), the generic __weak
> stub, and the RISC-V implementation of acpi_processor_ffh_lpi_enter()
> with __cpuidle. This moves these functions into the '.cpuidle.text'
> section, implicitly disabling ftrace instrumentation (notrace) along
> this sensitive path and preventing trace-induced RCU warnings during
> idle entry.
>
> Fixes: a36a7fecfe60 ("ACPI / processor_idle: Add support for Low Power Idle(LPI) states")
> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> ---
LGTM,
Acked-by: lihuisong@huawei.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
