Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4146C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 15:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6hRqAX5I6b/CaqcMRE4VYuSHRqCpripVmS0F4hYQMQc=; b=BA8Snwz0cMoHIh
	/pg0GU8SoR+21vlzEEzz34AJAl1NQJ3++eBTYoqAUTGFw65ns2wUwz3VKDdvF4gDowoQedoO/og53
	W1DzSBJD8trjuX6pKZXZWMa2qRjMMLpCkuHP9oBv4BgM4ylBe0oQuPwxJK9eamxFRhqYsC9LFuZN8
	nNOHAHgcjS63CQFhUXHiUWWGUkFMIsK+1RCXCTOeCPTF6Zi3KEZJ7oRFHLRS+uCjFEP2cD8qBlhA7
	lXHNOR/UdmREKsn8s39KBbzsP5Ig5KxJbM7zW6FPYDOXHBPqI/1DVmmcqGbadBpMAvHr0FT6UdqZ9
	jb9rlPaB+SOQRz8GADwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1TaC-00929V-1Q;
	Fri, 10 Nov 2023 15:38:08 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Ta9-009291-2G
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 15:38:07 +0000
Date: Fri, 10 Nov 2023 16:37:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1699630677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DtCmYFiatElkO9y5KJxzlZ3bhwtcwZ5MOJ/Nac3o9bM=;
	b=yyJxdzVKR8JPShmo9rQO3xa0vuryxjmzHgV51vH9vsdNvVjune1oStb++sMq0E+98nbma5
	AvfGEfyaqMdGxsMX1T6ge0knjbhpkDYHNCXt9LXhHKgfjARGLKpwrXs+jfbW7TZ0Jwen9S
	Fw+1UWTNvhuKYMTVyINvXoIDvRK6LpqCjaHyMR5A1i1fyUDcbzQIqq/G0cgVV4j0T1hogD
	Y7rcij+WuyloFkHCuGN/xH70f9KaWe7rvSK0q0j+ukViQrqRnL5vNjfoN4+Z44ymZl71vU
	MJjgU9R8BKZeQ1bNg4+ScY836lGk+tLHOox/brYF/a/vPydjUb1sIAcoKufbxA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1699630677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DtCmYFiatElkO9y5KJxzlZ3bhwtcwZ5MOJ/Nac3o9bM=;
	b=Xc+t2kAveeECrq69ysvQagO7+AlErsqO4Ospw7DRzR3IUMAMXUUFiYOQhGTFIJ8Wz33X1G
	AlNX9wHex0MO+6Bw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: jszhang@kernel.org, tglx@linutronix.de,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, tobias.schaffner@siemens.com,
	Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH RT v2 0/3] riscv: add PREEMPT_RT support
Message-ID: <20231110153756.f-SECYpA@linutronix.de>
References: <20231031143521.441-1-jszhang@kernel.org>
 <mhng-fee5ae9b-0e8c-45f0-a1c7-84459fa718ab@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-fee5ae9b-0e8c-45f0-a1c7-84459fa718ab@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_073805_908761_54AA5402 
X-CRM114-Status: UNSURE (   6.29  )
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

On 2023-11-06 13:58:56 [-0800], Palmer Dabbelt wrote:
> In case you guys wanted to take this.  I'm also happy doing a shared tag or
> something, no rush on my end.

I just released v6.6-rt14 with this included. I backported that patch
from Evan Green and hope for the best ;)

#1 from the series can't go upstream until the lazy-bits are merged.
#2 from the series can't go upstream until PREEMPT_RT can be enabled
   globally.

I'm going to keep them for now. 

Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
