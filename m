Return-Path: <SRS0=HQJf=P3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B22C61CE4
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 05:01:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E5B52084C
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 05:01:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hSNrw8J3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="m/lMndz8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E5B52084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bF0nft/g2pWLkhsmrw0XiTXJb5n5EqZbNf5zqy7yJBU=; b=hSNrw8J3TBcsVL
	QM0Y1T+YvvMzpY3DvOk5I0cVhn0eGOT1xwr2bHkLusj85eCpcqroDjjGfajHVnBwNyGZ9OMMl4SY8
	gvY9zpDUcXHQl69a3Nxr+oxcjgWG8xWFDXAQkLMAads/RA+dVgw9Sa7I6YwoDQuupoJv+EZuGWtFi
	Z0PBf/CU+yOCjsdt2qcRlsRsLQT96cs6SUKyj3zWPz/sgqRxGqXtMmJ8eUmcbuh5/zT1i1RdiFO1e
	vFzLqFjqwLK+mQJHNrz+5wi3Y4D1/vIHhs3Pfi2SzxO6EXvVMt1qmvDQDK8BT6LzCpTjsGbQrQ0VO
	9P4pE8LisdjY1GXWBd8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkikn-0004QQ-8F; Sat, 19 Jan 2019 05:01:09 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkikk-0004Pv-IT
 for linux-riscv@lists.infradead.org; Sat, 19 Jan 2019 05:01:08 +0000
Received: by mail-wr1-x442.google.com with SMTP id q18so17410783wrx.9
 for <linux-riscv@lists.infradead.org>; Fri, 18 Jan 2019 21:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dd9uwnCge9rZcDt0ijTnyOKRUuOBLcXVaM7FFtHlqyk=;
 b=m/lMndz86n8qPCJkLnKM+2V8yp2QOlQoYKvQVfqIZxcqVyvkvqo3V3x8YgJZYVYwYV
 7Tjt0dCO75NQhDH89M+FgJhxwAynIsLjeh1DVqzpTfoBBP2g1gHFJtfzHb7O7oVulxSG
 l5/4AXsoG6yPYEcKDmhlbMk1ltUTZvZFtN5ONSsMcishoZZCNgRy3IdlfgRO108TunNv
 XS28d1OwAsoWpbgFUTfJVKH2mi+qxJ7S/4fPop0F1srTxVFmGJxm8HmAbXqKsKHwAQ9N
 WBr7MTlrgovfn0E3tTvvcloSTI3VRNatCOhn0CIPMsqQ74W+WkbWUsyyvLrtEwZ6M8++
 u70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dd9uwnCge9rZcDt0ijTnyOKRUuOBLcXVaM7FFtHlqyk=;
 b=bXGlo0xlKI999NKPWGNSVj0jWAJhI8Rkj1sy/ZhLC/3spu1YX0eQ0K3t3WhcM+iiAc
 4DqmqszJyzwLR9/GPYXeBFYsv4yNi9BkS53rvIKC7awB9Qr+uEvdwQs6b7kxW9CcT40x
 EkJuqmJYBykU6L7TB4cayDP2C64iuk44f+eITMfSBH8nzr1xkuD3LS30pHTYsZEHcv1q
 y6w83bbt61JMDHN46Y+SIrVYw3FkoCDv9EBzN2y+GWVQkIkCmHkPVw/V/p4BURtLttwr
 3gjN8r9X6JDiZhc9x/Qs2OyxFg5YBAInLZdK6Wee8I9rhxJoJGepfKe93VMVVYkA2h38
 ZXNQ==
X-Gm-Message-State: AJcUukfrWRbDasrNvSZn+PniLHFiJXpOTip+ezMmC/5fD3icEhUPzcQr
 44/EBLZRFkatMQjv9IqAydJLk6JDpRGDV2cLU/7H6Q==
X-Google-Smtp-Source: ALg8bN7bWIXwsYSaGJWRvj6S8+2Cbrr8+/RaHeRFtYs6v7G/Af1d+RcYGXBOCPbnaUs7FaZdKGco3N442YyvbCXZSM8=
X-Received: by 2002:adf:f5d1:: with SMTP id k17mr20507314wrp.59.1547874063225; 
 Fri, 18 Jan 2019 21:01:03 -0800 (PST)
MIME-Version: 1.0
References: <20181227111821.80908-1-anup@brainfault.org>
 <20181227111821.80908-3-anup@brainfault.org>
 <20190115155437.GA13095@infradead.org>
In-Reply-To: <20190115155437.GA13095@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 19 Jan 2019 10:30:52 +0530
Message-ID: <CAAhSdy1JOFW3f_xtZSjjHPzcHWoG5C50tXzm7U=Oav9GYD=j8g@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] irqchip: sifive-plic: Don't inline plic_toggle()
 and plic_irq_toggle()
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_210106_764507_E8FD30FF 
X-CRM114-Status: GOOD (  10.78  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jan 15, 2019 at 9:24 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Thu, Dec 27, 2018 at 04:48:18PM +0530, Anup Patel wrote:
> > The plic_toggle() uses raw_spin_lock() and plic_irq_toggle has a
> > for loop so both these functions are not suitable for being inline
> > hence this patch removes the inline keyword.
>
> That is a weird argument for a function which has by design exactly
> two callers and is in the hot path.  The alternative to the inline
> here would be to duplicate the code.

It's strange that you see it as weird argument. Both plic_toggle()
and plic_irq_toggle() are 5+ lines functions with loops. The loop
is clear in plic_irq_toggle() whereas raw_spin_lock() in plic_toggle()
expands into inline-assembly spin-loop because raw_spin_lock()
is a macro (not function).

Further looking at disassembly of both functions, these are 55+
instructions. I think we let GCC decide whether these functions
should be inlined or not rather than us explicitly making these
functions inline.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
