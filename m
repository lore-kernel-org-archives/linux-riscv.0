Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413E1C43334
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jul 2022 13:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Lm1aCX4jITdf4gB+Zs7JSHv/3ihhNRswbwlRJa/j7M=; b=ke57Pzum9pzl+T
	kwkDv2lzwqPVy4WXJILiknT9jej3ObhAOi6TWrq1oHrJfgnYYF/EYN3fMK+Y4eKD2iAf4AXN2akkc
	W+rhpIj4228ne8hrkKvLhQ06vzYnmIDBFL/yJfeWPuqWszQ1IBpT/RrNiC2LlMfuH4Dmx9VDKMWAV
	j/wl2xSL0Pzkb4DpDgjeKmErc0LxZLZZlET7NiOqL4Qw9h9LA3GdCU/DzmtNwWJcxBPO1cc0NO1nj
	WIuxltCMdMqTAf0ZN+xHA21ssiilKq8gMFzffi3wgjVqPC0NBmwkk+IzVoy48jT91wUpGVkUcJILB
	pqr1D0ONpYl+nENAO30g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCi40-00GKFU-AC; Sat, 16 Jul 2022 13:42:32 +0000
Received: from smtp83.cstnet.cn ([159.226.251.83] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCi3w-00GKDQ-QE
	for linux-riscv@lists.infradead.org; Sat, 16 Jul 2022 13:42:30 +0000
Received: by ajax-webmail-APP-09 (Coremail) ; Sat, 16 Jul 2022 21:42:26
 +0800 (GMT+08:00)
X-Originating-IP: [124.16.96.42]
Date: Sat, 16 Jul 2022 21:42:26 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5r2Y5bqG6ZyW?= <panqinglin2020@iscas.ac.cn>
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org, 
	xuyinan@ict.ac.cn
Subject: Re: Re: [PATCH v2 1/4] riscv, mm: detect svnapot cpu support at
 runtime
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2022 www.mailtech.cn cnic.cn
In-Reply-To: <YtKwjmbQmIMm4gEo@xhacker>
References: <20220716085648.4156408-1-panqinglin2020@iscas.ac.cn>
 <20220716085648.4156408-2-panqinglin2020@iscas.ac.cn>
 <YtKwjmbQmIMm4gEo@xhacker>
MIME-Version: 1.0
Message-ID: <1e77fd92.12c97.182073f0555.Coremail.panqinglin2020@iscas.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: swCowAAnh2BCwNJiIHELAA--.23W
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiCQwJDGKY1n4FBAAB
	sS
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_064229_242414_03CDC2F7 
X-CRM114-Status: UNSURE (   3.31  )
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

&gt; &gt;  
&gt; &gt; +config SVNAPOT
&gt; &gt; + bool "Svnapot support"
&gt; 
&gt; Do we add an config opition for each isa extension? That's not
&gt; necessary. I think we'd better remove this CONFIG option and keep
&gt; unified Image in mind.
&gt; 

I am also not very sure about necessity of this. Maybe we should allow user to disable
Svnapot support manually? As this support may introduce extra overhead in functions
like pte_pfn. So should such option be reserved for setting it off manually? If it should not,
I will remove it in a newer version.

&gt; &gt; diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
&gt; &gt; index 9e2888dbb5b1..84ad32075637 100644
&gt; &gt; --- a/arch/riscv/include/asm/errata_list.h
&gt; &gt; +++ b/arch/riscv/include/asm/errata_list.h
&gt; &gt; @@ -20,7 +20,8 @@
&gt; &gt;  #endif
&gt; &gt;  
&gt; &gt;  #define CPUFEATURE_SVPBMT 0
&gt; &gt; -#define CPUFEATURE_NUMBER 1
&gt; &gt; +#define CPUFEATURE_SVNAPOT 1
&gt; &gt; +#define CPUFEATURE_NUMBER 2
&gt; &gt;  
&gt; &gt;  #ifdef __ASSEMBLY__
&gt; &gt;  
&gt; &gt; @@ -93,6 +94,27 @@ asm volatile(ALTERNATIVE(      \
&gt; &gt;  #define ALT_THEAD_PMA(_val)
&gt; &gt;  #endif
&gt; &gt;  
&gt; &gt; +#define ALT_SVNAPOT(_val)      \
&gt; 
&gt; I believe SVNAPOT can be supported w/o ALTERNATIVE, static key mechanism
&gt; would be much simpler.
&gt;

Thanks for the hint, will implement it with static key mechanism in a newer version.

Thanks,
Qinglin

&gt; &gt; +asm(ALTERNATIVE("li %0, 0", "li %0, 1", 0,    \
&gt; &gt; +  CPUFEATURE_SVNAPOT, CONFIG_SVNAPOT)   \
&gt; &gt; +  : "=r"(_val) :)
&gt; &gt; +
&gt; &gt; +#define ALT_SVNAPOT_PTE_PFN(_val, _napot_shift, _pfn_mask, _pfn_shift) \
&gt; &gt; +asm(ALTERNATIVE("and %0, %1, %2\n\t"     \
&gt; &gt; +  "srli %0, %0, %3\n\t"     \
&gt; &gt; +  "nop\n\tnop\n\tnop",     \
&gt; &gt; +  "srli t3, %1, %4\n\t"     \
&gt; &gt; +  "and %0, %1, %2\n\t"     \
&gt; &gt; +  "srli %0, %0, %3\n\t"     \
&gt; &gt; +  "sub  t4, %0, t3\n\t"     \
&gt; &gt; +  "and  %0, %0, t4",     \
&gt; &gt; +  0, CPUFEATURE_SVNAPOT, CONFIG_SVNAPOT)   \
&gt; &gt; +  : "+r"(_val)      \
&gt; &gt; +  : "r"(_val),      \
&gt; &gt; +    "r"(_pfn_mask),     \
&gt; &gt; +    "i"(_pfn_shift),     \
&gt; &gt; +    "i"(_napot_shift))
&gt; &gt; +
&gt; &gt;  #endif /* __ASSEMBLY__ */
&gt; &gt;  
&gt; &gt;  #endif


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
