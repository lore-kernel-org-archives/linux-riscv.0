Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAF9C54F51
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 01:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i6uLDXuuEDG39GTGPT2M4WKelGWjcndffBQrSX5/EDQ=; b=F36R2cs5M1nK6n
	58cMB9T/K/yQiAAgbDoUyNuuaiEtCVSjuIqhGcfOwIKRG+ShUrVM7lbbdqp7xwpviuZ2hsjjlGATZ
	bw/A4lqSPyAXiYnwgivO2Qrt9AVfF0qZxP3hj8sdJhjrzP4L2uIeQFRxcCLctBu2eom7BBuHP8PfY
	wbkR8l3CfK6a1+Wn3BK8NgBmp8nN00RegQBZLb9eyVl8MDQK3kMSlDFLoHAQWCDsGPVAqsR0TQQ18
	GAlSedorpgUE/CTYz5p4kbBg9GZPHNEzAD8PXyKuleIaJLYw/ZAZCn4+jUz8R5k+JA3/Pau9kA7so
	JHbv7ddnDU6Sxo3gA3QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wotCE-00000006bwp-3whH;
	Wed, 29 Jul 2026 01:34:58 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wotCB-00000006bvf-0VRR
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 01:34:57 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=vIARaXCCSFuDF80uBMKFCFUJTb39fi5OYeDbjxvPuB4=;
	b=B73LjcntGv/Sh+1VigVSU1HKzJCXEyTExQRV7X1hK8N4iztFGPvtV13o7SE/vFb7w/7VBAisO
	qZ6nmZ2UXhSl3lSfH1H8oSLB6kyhuRVvWPxMpRs7MMdIHlgnNn/Q3ntUp1JrchYMbuEfVrE4uqW
	u7TjGZw1AO9jcTZKYzsmnB0=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4h8vlV6LV9zKm4b;
	Wed, 29 Jul 2026 09:25:10 +0800 (CST)
Received: from kwepemo100005.china.huawei.com (unknown [7.202.195.212])
	by mail.maildlp.com (Postfix) with ESMTPS id 2E649402AB;
	Wed, 29 Jul 2026 09:34:40 +0800 (CST)
Received: from [10.67.121.59] (10.67.121.59) by kwepemo100005.china.huawei.com
 (7.202.195.212) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 29 Jul
 2026 09:34:39 +0800
Message-ID: <f4bf4615-d54f-4c08-b736-42b36d4645e8@huawei.com>
Date: Wed, 29 Jul 2026 09:34:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: acpi: Handle LPI architectural context loss
 flags
To: Peixin Xie <peixin.xie@linux.spacemit.com>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan
	<dlan@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, Oza Pawandeep
	<quic_poza@quicinc.com>, Will Deacon <will@kernel.org>, "Rafael J. Wysocki"
	<rafael.j.wysocki@intel.com>
CC: <linux-acpi@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <spacemit@lists.linux.dev>,
	<stable@vger.kernel.org>, <lihuisong@huawei.com>
References: <20260728-riscv-acpi-lpi-timer-v2-1-5a30e0021ec9@linux.spacemit.com>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <20260728-riscv-acpi-lpi-timer-v2-1-5a30e0021ec9@linux.spacemit.com>
X-Originating-IP: [10.67.121.59]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemo100005.china.huawei.com (7.202.195.212)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_183455_633325_87908C4F 
X-CRM114-Status: UNSURE (   7.79  )
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


On 7/28/2026 7:47 PM, Peixin Xie wrote:
> Commit 4785aa802853 ("cpuidle, ACPI: Evaluate LPI arch_flags for
> broadcast timer") replaced the generic nonzero check for LPI
> architectural context loss flags with arch_get_idle_state_flags().
> RISC-V does not implement the helper, so it falls back to the stub
> that returns 0. Consequently, CPUIDLE_FLAG_TIMER_STOP is not set when
> an LPI state loses the hart timer context, preventing cpuidle from
> using a broadcast timer for that state.
>
> Implement the RISC-V helper and map the hart timer context loss flag
> to CPUIDLE_FLAG_TIMER_STOP.
>
> Fixes: 4785aa802853 ("cpuidle, ACPI: Evaluate LPI arch_flags for broadcast timer")
> Cc: stable@vger.kernel.org
> Acked-by: Sudeep Holla <sudeep.holla@kernel.org>
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Signed-off-by: Peixin Xie <peixin.xie@linux.spacemit.com>
> ---
LGTM,
Reviewed-by: Huisong Li <lihuisong@huawei.com>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
