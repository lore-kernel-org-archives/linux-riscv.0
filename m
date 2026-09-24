Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D3AC9830E
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 14:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:To:From:Date:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vC2Blu1Ebj68lF5nHxIbn4QTZszVKvOt3EToDEOZgcg=; b=PlTWw80MQrhqH3S0fpL2PPSGaY
	o4GndMWSGvAGUD9fxdO+b9wXdqu53qk1S7YR0oW4yFchsuxqVYhbAJvll+bGNZT84mqrkFLp/F5w5
	r0YypLjzqiY1/KVbS4iClSRMkBlAIpfesmtAvoI60KT7HkLwz3absD6apmLYj5mz/nnBmJfAnCQ/i
	Z5Ehbgkjz9hQ0Zk96HlqbEi0U5ByZpN6yEZc+57+1hSPndYpNyHxZrhcrvZa2g5mmzKNrIxpuOH2M
	qDODFZt1O4c4nG6UE+t82keeUg9tPMcNe70/GlDs43aphtrbwwqzrZNFHkuhgq+9SyLFsVRuqw5HS
	U+PzrxmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9koI-0000000BJBx-1j6T;
	Thu, 24 Sep 2026 14:52:30 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9koF-0000000BJBQ-0qXc
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 14:52:28 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E67DC7A0084;
	Thu, 24 Sep 2026 10:52:24 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 24 Sep 2026 10:52:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790261544;
	 x=1790347944; bh=TPULziU45xEAp0z06O6r8EtQQ9b4bEJhIQ+F3+c0N0k=; b=
	qCGGgBcF5IrMEyA+2Vg3Cm1E4TN0DCP9l0ZTmvbmTQpBxMzMfwEywk1U6pJM68ms
	KWYSfKX8oegd1y2i2t94iD5cpdil9XOTIQECEt377ticstM0ZiPpNa5SbEJyAydN
	iOS8h7X3HHIMWfCxRmk8MrFyUrnL3yfnPHFgtbLwY9YuYLB+Bm9Il1pDBd0G5IJj
	JyqHTLVLj87oExE8G/2kC2p+ilYAjpk0CAsCxbCSUr56uuZCpBpLWH5oCb6ndmcW
	t7Uk90mzn3vm4kMOnJeNy2QJF7JfZAQBzJqXBsD5MxfjMzQe/Kuj4QTdiDrwBs73
	mmwAoWf49FBZrEbfqfqBBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790261544; x=1790347944; bh=T
	PULziU45xEAp0z06O6r8EtQQ9b4bEJhIQ+F3+c0N0k=; b=Lnvt/cX8OPHVhRXjS
	W/Z7Ege+fNqGWht47wQcp0bfNLTV5otXaFngN1vh3JKN4KeqVDPuy/+6T47T7iFn
	77Z6551Bp3CNiwMNW1FUUKciZAE2D1l9W/Bgs3loq401+syY10n19kw4YOUMPNiB
	H1BFPjBw3siZ5Qe9rrmixwv6UpF15NFOxBPoUz9EplvB1SqXdp5W5SlY11Sk0pgz
	Hb/076aK740Ind4M6T8DR5zsPShFxAEeT93FHVOtPdtCyXe2PdXfD2KtAsAf8X/B
	YT9aqgfAkeTpPHR/DZ3kALemLSKaufK0v5hHrbtSVJCCPAH1PrXosQlTyMlCi1Oo
	/IhJQ==
X-ME-Sender: <xms:Ijm1amU4MuGj2WbKrK--olIUbFKTwdbyODGljU6MCwyqO35qM1hQGA>
    <xme:Ijm1ataUt2_Y3AQwf7fLZ75BZWdkf8UH8foAJlOn_zNKBNs_xXkI9FJrWjgnetgsE
    ZKQHAICUi9hq5j59lMPicxieHQcL9-fQw6nkuYsL1djQl0U0ITche7P>
X-ME-Proxy-Cause: dmFkZTFNCD4DWmQAaFWTOGsv/CF2h+xmNG1ovTwUC57jy09Mk/vbeUN1WVFCfkhb3zlhM7
    hNZwa6C1sfd+PQXMSgPkMwBe+zekbozFVQqoV10InDO71OTGq09Cm+Ap1pXO0JROvLBbmg
    keLSciWQ4tCYgATN4l44Sg3P6qxbDjofAzcORov/1+XjJKdCGqUdtd+yke7whuM4JXpe0X
    6yfwhj3sREnHjuqI0scuYPawe6FnO35ZY/nqpOD0IqV6ygxdzbsTR/J2hsbTMYl3F0qdji
    aDD+4Nth2ckN9YygQol+KcosXIGWQbEFRZHooVQmVAduCKTPJ/0Xt9WJU0reuqKWjGuDcY
    xBfA/RmigeRy8MXgr+/AyTUr28gzzQGauUNFfaipVoG0HTgfazJTvomVFASVN8SPc2anwV
    yPuIqYBc5o+hIH1J8gV3Pc9Qq95QJrE5wqUYUaYBUv7D9OP7DaWn6/Re09Ua7KxwcXjkr7
    SwBOVteOkn7nRl9O33sf0rQ5+2mGB+OqxD8Vv7IXtjFtboHavb7aIKUv9r8Uu0asaQ6Xrr
    UC5RaAJZ6+oen0FvvdCrNoukfpNM7XNzgT/jFBrepMovxt/rSH7MdW0FIh5J9zkeU2JwoG
    yb0Rts1n50atu72+z986+glU7SjE9M96Dz8IePd72PulXdL7/vq54QCZAZCw
X-ME-Proxy: <xmx:JDm1ahWjnrtAimoL0LAeJfkFcqLSoPVQ3nrcYM_mZEP7llpBcjw_vQ>
    <xmx:JDm1auI0OG6SP-6xzmGvN19l9sg5BaNx9EzfPBf35IiIklIVbCQY3g>
    <xmx:JDm1ah3Jb53UQVDIQxQvZv5-YmgsMSJDym7jSDQ_asjQXL9SSTbOTA>
    <xmx:JDm1arKweTTUxAVmrqa7J9RJNsGyWq1Uz1T8342HkWYkQ1Wht-VB5w>
    <xmx:KDm1asPDuVjh6ZoUctJfXw7ZadkhM__uBbuFWhizoCUiSQQn69Aj5kTr>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id A607332A0087; Thu, 24 Sep 2026 10:52:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Ax0R8qDxSViF
Date: Thu, 24 Sep 2026 16:51:42 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Qingfang Deng" <qingfang.deng@linux.dev>,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Thomas Gleixner" <tglx@kernel.org>, "Nam Cao" <namcao@linutronix.de>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <c0ab08f9-2258-41da-8fc5-0b95ae62ed1b@app.fastmail.com>
In-Reply-To: <20260923013913.357710-1-qingfang.deng@linux.dev>
References: <20260923013913.357710-1-qingfang.deng@linux.dev>
Subject: Re: [PATCH v3] riscv: use generic relaxed MMIO accessors
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_075227_526982_A79CAEC6 
X-CRM114-Status: GOOD (  10.67  )
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

On Wed, Sep 23, 2026, at 03:39, Qingfang Deng wrote:
> The relaxed MMIO accessors duplicate the generic implementation, as noted
> by their FIXME comment. Remove those definitions and their empty barrier
> hooks so asm-generic/io.h supplies them through the existing asm/io.h
> include path.

This seems fine.

> The M-mode timer uses the lightweight asm/mmio.h header before the
> generic relaxed accessors are available. Use readl_cpu() and readq_cpu()
> there, which perform the same accesses and endian conversion as the
> existing relaxed accessors.
>
> @@ -17,18 +17,18 @@ typedef unsigned long cycles_t;
>  #ifdef CONFIG_64BIT
>  static inline cycles_t get_cycles(void)
>  {
> -	return readq_relaxed(clint_time_val);
> +	return readq_cpu(clint_time_val);
>  }
>  #else /* !CONFIG_64BIT */
>  static inline u32 get_cycles(void)
>  {
> -	return readl_relaxed(((u32 __iomem *)clint_time_val));
> +	return readl_cpu(((u32 __iomem *)clint_time_val));
>  }
>  #define get_cycles get_cycles

I don't understand this bit: Why should these not keep using the
portable accessors? As far as I can tell, the readl_cpu() helpers
are just an implementation detail in riscv and could be removed
along with the custom readl_relaxed() variant, but with your
patch that becomes harder.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
