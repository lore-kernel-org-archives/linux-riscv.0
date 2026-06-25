Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9D5CDE000
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 12:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=StZ/ltK++FD3/N1XJThGQUw46F9mpCbMB8u4KqaL+sI=; b=ZtFBaXkSp6X5Yr
	Ct47bOSVrzIWN1TGsUpNzSOc1PkaQXx2kT8NcA7IAhk8uiGjAl1xxhZy3t3iBdQI7r7/HKBV5+RNs
	0rQgG1PUAd39K5+cMxsMv7jE5W4FLE/vRvEmrcVXVFSxXFoJQ5WW4dbhlC+0qH8YNwXvAx/CdaCjA
	Giat+sqYPD4kwN6ARPz6Yl0UlTVe7Nr8QpRl1DRffuzr7Jn307aQb4sklbsmGynDLQnMIhBvXTU3U
	BV4vVAZdnaXveWoRoqWwwmbqO2YkrwtmYtiUX3bhLVFagqQSSc671xE4997rsya83lRvgpa1YtGtD
	JdDHVVolP5KXm2FF1IeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wciv9-00000009AAr-0C4F;
	Thu, 25 Jun 2026 12:11:03 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wciv6-00000009AAJ-0eKg
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 12:11:02 +0000
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gmHTg6X5fzLlVM;
	Thu, 25 Jun 2026 20:01:43 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id E98264048B;
	Thu, 25 Jun 2026 20:10:49 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemf200017.china.huawei.com
 (7.202.181.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 25 Jun
 2026 20:10:49 +0800
Message-ID: <53600467-51b6-438a-8d5f-fc11ed911c28@hisilicon.com>
Date: Thu, 25 Jun 2026 20:10:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ACPI: RISC-V: Fix false warning in cppc_read_ffh() for
 same-CPU reads
To: <wang.yechao255@zte.com.cn>, <linux-acpi@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260609192856874Y8AaPpKL5TnmbgiWI8DI3@zte.com.cn>
Content-Language: en-US
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <20260609192856874Y8AaPpKL5TnmbgiWI8DI3@zte.com.cn>
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_051100_353822_923E8B48 
X-CRM114-Status: UNSURE (   5.94  )
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
Cc: aou@eecs.berkeley.edu, alex@ghiti.fr, rafael@kernel.org, viresh.kumar@linaro.org, zhenglifeng1@huawei.com, pierre.gondois@arm.com, palmer@dabbelt.com, pjw@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 6/9/2026 7:28 PM, wang.yechao255@zte.com.cn wrote:
> From: Wang Yechao <wang.yechao255@zte.com.cn>
> 
> Commit 997c021abc6e ("cpufreq: CPPC: Update FIE arch_freq_scale in
> ticks for non-PCC regs") changed the CPPC Frequency Invariance Engine
> to read AMU counters directly from the scheduler tick for non-PCC
> register spaces (like FFH), instead of deferring to a kthread. This
> means cppc_read_ffh() is now called with IRQs disabled from the tick
> handler, triggering the warning.
> 
> This is the same fix as commit df6e4ab654dc ("arm64: topology: Fix
> false warning in counters_read_on_cpu() for same-CPU reads").
> 
> Fixes: 997c021abc6e ("cpufreq: CPPC: Update FIE arch_freq_scale in ticks for non-PCC regs")
> Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
Indeed.  Thanks for the fix.

Acked-by: Jie Zhan <zhanjie9@hisilicon.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
