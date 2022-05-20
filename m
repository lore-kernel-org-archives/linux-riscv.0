Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7222C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 12:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=viWrBUzE8xhu6b/5q5I0xEEDucOk8+HX7KJsPphTCBM=; b=Fr9qsKTFMQ2DmQ
	Kgp9liGEtPn6Hbyy060T2tM9V7Bl2YFRmtRqesNMUgogWahWe5+r4Vn7XlNH0yFG+ZEXlLfS7bWSE
	LvAnHIHAoMTbl84q4KPiw8gaB7V7/TUG267oVFaKVzTQdpsnUrkHWhQe0uV2llhCbx+80+NkE1VQ0
	ri0eURuTlUaJibDcrSj8RdfsIVmY6Ln0JL1Gi+s/ltehCfUWO3JgjLUAPpzSK4qrLRPJMyXiWA43R
	5cbFsrWELXMrDwx+zHHLsdnCfFDY5ny9TCAIMuPVjrrrYHi/LqI8vJxEMt+ntqd8yb+fZeWriqy2I
	IgnsXLAiRzDZqGxHqQKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns1nL-00CKoX-Jr; Fri, 20 May 2022 12:31:51 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns1nB-00CKla-BQ; Fri, 20 May 2022 12:31:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AF1C1477;
 Fri, 20 May 2022 05:31:37 -0700 (PDT)
Received: from [172.29.1.145] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6CB23F718;
 Fri, 20 May 2022 05:31:33 -0700 (PDT)
Message-ID: <d4c7fd09-814a-e57a-fe8f-a3959472991b@arm.com>
Date: Fri, 20 May 2022 14:31:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/8] arch_topology: Don't set cluster identifier as
 physical package identifier
Content-Language: en-US
To: Sudeep Holla <sudeep.holla@arm.com>, Atish Patra <atishp@atishpatra.org>, 
 linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>, Qing Wang <wangqing@vivo.com>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>
References: <20220518093325.2070336-1-sudeep.holla@arm.com>
 <20220518093325.2070336-2-sudeep.holla@arm.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <20220518093325.2070336-2-sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_053141_478805_DE2740A0 
X-CRM114-Status: UNSURE (   4.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 18/05/2022 11:33, Sudeep Holla wrote:

You say `cluster identifier` which to me refers to
`cpu_topology[cpu].cluster_id`. But I guess you meant `cluster node`
from cpu-map DT node?

Otherwise you say we link (1.level) cpu-map cluster nodes to
`cluster_id\_sibling`? But then (1) we will never support nested
clusters and (2) why would we need llc support then?

[...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
