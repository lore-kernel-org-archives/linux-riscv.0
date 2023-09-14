Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196BCEEAA77
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 21:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y38TXfrZLPU1acRMsxkNHTYoDpHnA0fARbq2HEVmB3A=; b=LFk6yesMeUu1wL
	Dmxp37t8kLLX5+mFH/hqTs59PU/MBfR1OLsvsQkcGu6BmXXwpKbAlUxjJzCTW52u4PvDp+C/PLQoP
	uugUVb9itIkRcfeMK1Ca+GGD39ZruZRqzPC/uweJYqxj6IHdV1kd48XWV8e43dTnBBqjUH+sgt/nR
	OiViICV6mRibSi16X2N8THn6XXOfRh3wuhyc1+xul2kEP9d3hJR8/ZYm4+mQCrJzBE/C8NKs2HUBu
	GO1LpzOdks3v3sSIPNPYOUmF8IKs/KKoVUrb0ynSfZjCY5dRQgpw7L/11QDdqSEMv5YqgwknVwXPh
	SRi+4jzdqlyw3fypsasw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgtT2-009H47-1v;
	Thu, 14 Sep 2023 21:01:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgtSz-009H35-0P;
	Thu, 14 Sep 2023 21:01:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66C031FB;
	Thu, 14 Sep 2023 14:02:09 -0700 (PDT)
Received: from [192.168.178.6] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FEF53F738;
	Thu, 14 Sep 2023 14:01:28 -0700 (PDT)
Message-ID: <4a2d20ca-092e-843b-b5a4-45d4a6aef02c@arm.com>
Date: Thu, 14 Sep 2023 23:01:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/4] topology: add a new arch_scale_freq_reference
Content-Language: en-US
To: Vincent Guittot <vincent.guittot@linaro.org>, linux@armlinux.org.uk,
 catalin.marinas@arm.com, will@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, sudeep.holla@arm.com,
 gregkh@linuxfoundation.org, rafael@kernel.org, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, bristot@redhat.com,
 vschneid@redhat.com, viresh.kumar@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org
Cc: conor.dooley@microchip.com, suagrfillet@gmail.com,
 ajones@ventanamicro.com, lftan@kernel.org
References: <20230901130312.247719-1-vincent.guittot@linaro.org>
 <20230901130312.247719-3-vincent.guittot@linaro.org>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <20230901130312.247719-3-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_140137_218500_5A2D13CD 
X-CRM114-Status: UNSURE (   5.02  )
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

On 01/09/2023 15:03, Vincent Guittot wrote:
> Create a new method to get a unique and fixed max frequency. Currently
> cpuinfo.max_freq or last item of performance domain are used as the max
                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

IMHO better `highest (or last) performance state` (struct em_perf_state)
... maybe easier to grasp?

[...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
