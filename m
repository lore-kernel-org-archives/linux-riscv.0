Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F12C83F25
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 13:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KvQU3Fl03yDny4Q3IJS8ojM1tJHRtHmBEQSnf5E8AHk=; b=vjRrUf491qQrHH
	R94Mx0KOPyE+eI5ZmtLq0V60cFVj2StWQiXxjFMG7so+ozJEiGKHppEzpB9tEw0cb7G4JA6U/KCpz
	RhIm/tGE19eO6++0RiZIGLDV2JZBEery+rQfhKOVvgEjjt7QkpShlnMS0wcBlsrTpR0dZnvRo5QrK
	Wy0Ws8QkBKzbTvhRR4LOXX+Stq8xv6V+r4ZPGxgzK7f+h5/GXbyCy1Xx/yzaWdZ666Zn3MvpR2pjW
	dkQVASC5OIkU0cSziXNrh5nbWV+6FrPl2x+aTG0pB9Z1Dux4ZkmFvDaOrC1OGVAH0DQBlH/yhpR4E
	+iAX3kLTmOcpQz/vHycQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjfRa-00000002F0t-2nzh;
	Thu, 29 Aug 2024 13:44:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjfQn-00000002Eoh-28ws
	for linux-riscv@bombadil.infradead.org;
	Thu, 29 Aug 2024 13:43:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:To:From:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aggf7neS26jWKW+YIQkenH6/dZMQMCyhYknOlHKaKGE=; b=b8JU3arE7zRIsQPzeA6gpwwlvB
	qNMn7RINg1WVwHLReXs3icazzu75L3jaWd8MmhaHxHbMmqqx8qj83IiHrQqXtqgmInMdGjajCU8sx
	P98Wn2rjnrYgxKU8vmHf4bGhTQSRs4C1x1XQrKknyzXj5sCksIdHGPnjFaTKf8bWAT1Z2lKIWTzXn
	vlTfYAOIKYr5VBEHPhW8FJ8o9zWHsghPq1LSCr6VAjX44Em2RW3cUU3yYck+uwI81ZMjdoyfSHKtS
	z+aV1L0z9OchGrVtX8WJvMPp0uTQprWQroMSUiEA2i+KG4ylJyKw/KwxIh2F518wQ09ygYEd1+J5U
	z7lgvS0g==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjfQk-0000000BReb-1UVw
	for linux-riscv@lists.infradead.org;
	Thu, 29 Aug 2024 13:43:20 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1724938987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aggf7neS26jWKW+YIQkenH6/dZMQMCyhYknOlHKaKGE=;
	b=2/IeRB1udgz4p/pcCGc4UXSK9YP6TdSt3W2cdcUezsQDh+7EcnPjfzF/HyuFC0wa1MuHme
	pF4BZhAikgZHgi0clgSyrrZqEQu+Xa6sCwl8pEDhE7/iPCA+V1V2vJWi/6R15lBwbmCkru
	bci5WWK2Bd3hCii45vkheTFIxUgsg9NEoxiC+xaFbBD1QPPWOCtPYNA4B0dN7SCS0aAPXS
	SzPBQZDbbjcwSmZA8XaCc12t6gmA+/Guz3Qyk942yu1dXqgUsLd+WDcExOdAOem/kS40j/
	i6lX2n9LoJKzq24FJwBbl38f61+fTKaCIbWYuT5OaW0/HP+wzhgsBp1B/gZDlQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1724938987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aggf7neS26jWKW+YIQkenH6/dZMQMCyhYknOlHKaKGE=;
	b=juGiuoXIPzeyd6G33VQMgMjLiCRqDX7VGyrH4FIb3jszoPFwGaNtXSGD53P39IycO9hqRh
	2FCHfRTeae/j+hDQ==
To: Nick Hu <nick.hu@sifive.com>, greentime.hu@sifive.com,
 zong.li@sifive.com, "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek
 <pavel@ucw.cz>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, Conor
 Dooley <conor.dooley@microchip.com>, Samuel Holland
 <samuel.holland@sifive.com>, Nick Hu <nick.hu@sifive.com>, Sunil V L
 <sunilvl@ventanamicro.com>, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] time-riscv: Stop stimecmp when cpu hotplug
In-Reply-To: <20240829033904.477200-3-nick.hu@sifive.com>
References: <20240829033904.477200-1-nick.hu@sifive.com>
 <20240829033904.477200-3-nick.hu@sifive.com>
Date: Thu, 29 Aug 2024 15:43:06 +0200
Message-ID: <87o75ba1hx.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_144318_593140_5039087C 
X-CRM114-Status: UNSURE (   3.98  )
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

On Thu, Aug 29 2024 at 11:39, Nick Hu wrote:

clocksource/drivers/timer-riscv: is the proper prefix

Thanks,

        tglx
        

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
