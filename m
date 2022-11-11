Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4F7C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Nov 2022 14:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Mi7H+Lgos5pF6J7VIx0Q2x1MRLnuRTiJhpEaBg6dE8=; b=xwrlOcv48y7Qgj
	VQD7JBkdMAtJXkAEZWPxtjeZoN7YMrXH39AA7a7rqnJRP+Yw65UPOSihG6kwTYGBEMbXJ4TWS05Af
	l8CbYsumyLbcnm5Wj9tNCn8z9wo9BnE2VLeBgWzTsnOa6gxxpfKcDPw/3deiiWH+SAD99wVVNBJsC
	M81P5pR27oO5DN4TKa3ZVFBOqQ2KQmbB0Ud3javvubn3sf0EGDeQhU4NsOfdQDyhzthrqapcdA7R2
	PRvaz7j63VSRzOMVfzL0gHLNCpaQV3ckTT2d9ZFncccRFHc3ltbiiP6yzAQPd8GGUDSer136hjMaH
	YNDwqx57Y3WWYK9dkbAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otV4v-00GED0-8P; Fri, 11 Nov 2022 14:32:21 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otV4s-00GE8m-2T; Fri, 11 Nov 2022 14:32:19 +0000
Date: Fri, 11 Nov 2022 15:32:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668177132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sM3ULtPmMNa5Zsc2BrAAlowvN2+aHTb9kTu2ikkknUo=;
	b=VWAKqxoJrY9vNNwzf41tyM+ukCdpZeV5ss+lVBEXPQeB+D0kKLB9pUllUigOkp4eSXxB1D
	RvfC22wjGc1/QTNEjVfazYbqdKDNDDe4s5H9nfDE2AsKrt5M3pLN06rPu6wH9FmxXljTHl
	yjiFVqoUeQzhDqOaosmi6RqDNyFb3bKeqxxjvD0YV+u0lPvJwgdBoZFoDoRl50Qtth9UmO
	B50vpkimDeg7qASjqJARGce+mBUi1HvapsyPx9LVEvsx5A304NYc+F+L65S2Brh2nUckZN
	tYfHuyAY71Skw/aBSDgaMSsSDKMZUFX3TmjWjDUqfSaDtDsvcyIuuxWqwpY8tA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668177132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sM3ULtPmMNa5Zsc2BrAAlowvN2+aHTb9kTu2ikkknUo=;
	b=wBUQ8gsFyLG0esu/hMevTdnNN+Z/7s4k8ky59jFt1g+rppPJOejgcoJKQmQETQWFwm+5Wt
	yl8VkdyamIZdKDAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Conor.Dooley@microchip.com, jszhang@kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	anup@brainfault.org, atishp@atishpatra.org, tglx@linutronix.de,
	rostedt@goodmis.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/5] riscv: add PREEMPT_RT support
Message-ID: <Y25c626x6UPRtscs@linutronix.de>
References: <20220831175920.2806-1-jszhang@kernel.org>
 <4488b1ec-aa34-4be5-3b9b-c65f052f5270@microchip.com>
 <YxIAmT2X9TU1CZhC@xhacker>
 <ea5cdba4-7a79-56b3-f8d7-7785569dedd6@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ea5cdba4-7a79-56b3-f8d7-7785569dedd6@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_063218_295953_3D46B8D2 
X-CRM114-Status: UNSURE (   5.97  )
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

On 2022-09-02 13:29:23 [+0000], Conor.Dooley@microchip.com wrote:
> I'll give it a run through tonight or tomorrow & give you a full log
> of what I saw. There's some splats all over the place for me, but I
> can't tell if that's just knock-on from the other issues.

Is there an update to this or the series as a whole?

> Thanks,
> Conor.

Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
