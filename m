Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED7AC7115A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 15:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=976GCsgURMqPH+T9pmqltlJo4O0jzgc3nAXcHYMZ4IA=; b=BWLAJv35vtduhN
	APV0vsxg6w9t3KL9RlGjs7BQF4F1tC+Vg5cigjooHyV8xqlutgLt9RNVzxJLC2B7gMNEuHjqBbX6G
	jXZhpNuFZl7I2cr9Md/ZPy7zTDT3tKPRSKUuushZKOAlmF5fGcfjiMFZQgDOpwYE5Pidl+1lRnp4b
	oETjVOiLS46eiEC7Yl+qrje+vKkQcRYV+fit/Krg6bBwNlkZu0FXdUwA7MpknQzJj+b8i7sS4UcYH
	v1hPLJyfriVMQB8Uxe/7y4LbaRaPC/W/67Qeb8M92JhaXoIvdh4PdHaJiyYHNY4QvRqTa32HaqN99
	mjKg64jpJGv+8cWMylWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRuVz-0000000AYvg-2hC8;
	Wed, 18 Jun 2025 15:15:51 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsnq-0000000AHVs-0Xec
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 13:26:11 +0000
Date: Wed, 18 Jun 2025 15:25:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750253165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CrmXcjccpvR3JsjjRbQO8esdz+YjnJsjPBMr/5ljKuk=;
	b=v4rrBPmY0y9Q9KqckJ0bZUWRYJA+tYkQ4vmwBty9N1OWDs80b30BR1t/YeJ4ZRiYW6x/73
	8iQVjbKhJpqGGT1MjFF8yu4cWeDp3cVSH3Uhr5nLRP7yyVf3HfX7MI5iKuUtKDX96yV0zD
	3AlvrBnXM7/MWXDYgj+3/Q6zFxNP5ARGiaQO7D8tP6NqZAH+lkje7Pso6rPUepBMN0o00g
	LQrXe7f3B4D6M3uOdV3MHMNPLNWOFsNAaTfZ1UlD3C0wyPPURUccQpqMFM2A7jYlp/kRD0
	6HpnyOS0xOvbq/Mde5DUPx9bK9SLXvqXIKEi5ueKa3hpsaCJf/dapyXOkwMH1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750253165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CrmXcjccpvR3JsjjRbQO8esdz+YjnJsjPBMr/5ljKuk=;
	b=/ukVHmO4vYst3N3m+/mEfXIzYvCU07w0VEWgAPyuPKCf65kbqqE6EdM0FxeqQ3dsEPEhRA
	Onuz4A+OnolDZPAw==
From: Nam Cao <namcao@linutronix.de>
To: rtm@csail.mit.edu
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Subject: Re: futex(0x1ffffff81300000) on risc-v -> mm panic
Message-ID: <20250618132559.J2jP-TbE@linutronix.de>
References: <77605.1750245028@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <77605.1750245028@localhost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_062610_308528_1486D14B 
X-CRM114-Status: UNSURE (   5.91  )
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

On Wed, Jun 18, 2025 at 07:10:28AM -0400, rtm@csail.mit.edu wrote:
> This program on risc-v:
> 
> main(){
>   futex((void*) 0x1ffffff81300000, FUTEX_WAIT, 0, 0, 0, 0);
> }
> 
> results in:
> 
> BUG: Bad page state in process a.out  pfn:81500

I cannot reproduce this issue. Can you please share your .config?

Also, your kernel seems to have some commits on top. Are you sure none of
those is the reason?

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
