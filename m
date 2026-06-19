Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E9FCD4F26
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jun 2026 09:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ehK9/nBa55hcFvnt0gpFD/CVVHWOSLKxH8Nbdd8/Oo=; b=aJxpP7ktEcXcER
	b2wIcJpKVQhaDBfrmr+YZCezk3iDYwMiR7gbNRuPJoqaYugqUCq0NZ5QQ3ZhCZNLst6XEEjzxOtdg
	gc+lUICfZ9EFykvBZ3oGQzCI8LLELqmYAG9NuGvhdkxS26ndASm3jSHlN7E8zsY4Oin88oEw1k4Bz
	5JVAMOOrRmgkQPBOGMuneAfSROziktjkD4FjfIJ8+jwC0ACClDhg/0uzQtBP3PeML5Y67/c3cojzr
	vR4k0XeDivgptrRbskZl+h+FR6POKRyIQfCZPntx/yd0bSYeDuvKIMYII+WjEVcTbUazAhBaz95v+
	gYUh7ybuLvMEq89rSxaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waVG7-00000002Csk-47mu;
	Fri, 19 Jun 2026 09:11:31 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waVG5-00000002CsP-1XjS
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jun 2026 09:11:30 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781860286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RIfoWaacn1j1keFUpfv7cq8r1Vqo+v4r6QHtoFYB1q8=;
	b=VizLUnBjMdIgKs2XmBKN7cBuZinuAF6LM0tX7EHDkHYFeIhk+JIUpPNAwUvdZkh47TaW1z
	fbrG8/KnwdkvQM2krnGZH3fxqWuz/e0fAouYfEk9Yh5i5xmkdUNNiAAGiDzg0ueIsSdYIJ
	TDU57R6JaArTTvGZUhtybwccJr9pNLqHn+jzlDVkAl8PZAk1oYO0EnXv+R4Iy6IdDRE9k8
	g4JeUqJ/Y5ImZnpEfp9rm9aNjIocuQr9OK9wNVRtTovp4p5D1vkY6OVRnt4PwEYjHA9CLi
	sh4+Cppp6OOj5Ox8S1pdnQxcgkt4ee/TQPy+UZzKVqNRXIIcyDF39g/z2yIkTA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781860286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RIfoWaacn1j1keFUpfv7cq8r1Vqo+v4r6QHtoFYB1q8=;
	b=iQTZzYjlH6RqSXpcVRhyBe654toIAB4mzrZT+mlg39kOpbr+CCEcSlwmeKO/K33IkJhP1b
	MKh9YEaDIUJEYQBw==
To: Matthew Bystrin <dev.mbstr@gmail.com>, Jiakai Xu
 <xujiakai2025@iscas.ac.cn>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Matthew Bystrin
 <dev.mbstr@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v2] riscv: stacktrace: fix stack-out-of-bounds in
 walk_stackframe()
In-Reply-To: <DIM3B5ZM2WCI.27FLMTRS5IYNN@gmail.com>
References: <20260517143704.659416-1-xujiakai2025@iscas.ac.cn>
 <DIM3B5ZM2WCI.27FLMTRS5IYNN@gmail.com>
Date: Fri, 19 Jun 2026 11:11:25 +0200
Message-ID: <8733yi6gjm.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_021129_571469_6DAD9FD7 
X-CRM114-Status: UNSURE (   3.79  )
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

"Matthew Bystrin" <dev.mbstr@gmail.com> writes:
>> +	high = (unsigned long)task_pt_regs(task);
>
> After noticing end_of_stack() function I'm not sure task_pt_regs() is the best
> candidate for the boundary. Let's see what maintainers are going to say.

end_of_stack() is the lower bound of the stack, that's not what we want.

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
