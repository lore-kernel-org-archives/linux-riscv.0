Return-Path: <SRS0=5JOk=4B=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F110C352A3
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2020 19:01:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DA4E2168B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2020 19:01:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ipj8eSli";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="FvsUf/SD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DA4E2168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dn/tfISxJoEgJnzBpyA8uxc0Qgp5ipdz2fWVodey7ek=; b=Ipj8eSli7zMa2QwBV0YazKoLm
	4m7GuWB7zV8yNb69AHXKbFU3JkblB0tW6k8p+BMPGIPxmz3fwPC7BehcX27ded/mdOXTg1E2BQt3E
	o1fkiMlqNdybY1Z2F4k/rmWj2Q+N/Fzgzu5os++8fkzHri/64YiGFh6ueCKFmxcrHY9/QwrvO6Hbl
	stGDDitn1uvLkz33BWmjQEx9xxxtMDHIkB5XqjF32+NTuogf+V+mlmOe7I3tKpkSEH4b4wl3NkcdT
	5wT9LP/Nh4UsfyEhhm6fNbVUzrzB7YPIQrSF1v5HFM3iXYyjBz6iistzK//UqIYCLJOoRjz4R9sBY
	Pv0qZtI9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2JkF-00065s-Tw; Thu, 13 Feb 2020 19:01:51 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2JkD-000657-9r
 for linux-riscv@lists.infradead.org; Thu, 13 Feb 2020 19:01:50 +0000
Received: by mail-wm1-x342.google.com with SMTP id q9so7441555wmj.5
 for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2020 11:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dn/tfISxJoEgJnzBpyA8uxc0Qgp5ipdz2fWVodey7ek=;
 b=FvsUf/SD1XtJK8Wv0KC5LO+bJJrBnNL1zUODU1QXFKPaNQRfcb558edoDGX+tpbCkK
 +kHZ2AmiXYJdzjGVZ00LnSFk8Mz48I2UBSQLZpTPhYwKkdZfCxRVfhkWF3lHzMiRqT5A
 QAyIyXJaxFK6g4ZVmDQhUxoYLDBpGhw8UUEZNVtncCvNnesYT0IpuRmG3hl/iH5sm/ZM
 lpYnUr5luOuM9iHi9pKW54m3c+9hX4bGfcXaoR6j2pj3gFk4kC34PNxxzVhDoteoij1K
 Y50hRut0NDEO83w2ngofXVI2FPnMAFURWMuwL2nDwkhFwz18DLA4KOa1QAnbLR5Whypu
 Am+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dn/tfISxJoEgJnzBpyA8uxc0Qgp5ipdz2fWVodey7ek=;
 b=cN39CGXi55sXFYxYXNDeXgB0maFvKL0YIb6rO6/ydK0ChlOYRpkZ61XOfloe0HwdKy
 bHzhUpscM5qcJDqCQjJqL/BE7HDaJ88AsENLt/AwoXuGmRKH6htqYP5RugGxSEkt2Jy7
 lxmkCA1D87FiQCzNrXbpt75cR9r2P+VMc+q30uCoFl5HSu9U455xyijep4nh+RbAvcJ9
 58+GIXHLiCvqv+Qi1MrIrNKHnBI2sO97m+2RaTrnoEeb+SGa9DijQGwmVaZfn46L8+dx
 wUBDOKN70i8D3Xhysoh3W6j5QEWlUOE4pl5ICYaFIyQHhuMD5DHKUZjo7C/wjAguyDgM
 Fx0A==
X-Gm-Message-State: APjAAAUX0CytcMk97ecCK3kOi8Fm9C6jeUSg+Rb1VcDq3QQyP1F5oNmo
 PKtpcPbmQQK6HsXTIWGPTdvJu8bxtwhVZ5BrzVLS
X-Google-Smtp-Source: APXvYqxifqjPohUlDkdJ9PNa3fGWK+UMVc1B6oEBOmY+Zk+EeWv0Eg5/XMUi08DvF5DxPv0oM1Wy2Tf0keasS3uVKtY=
X-Received: by 2002:a05:600c:2215:: with SMTP id
 z21mr7230678wml.55.1581620506752; 
 Thu, 13 Feb 2020 11:01:46 -0800 (PST)
MIME-Version: 1.0
References: <20200212014822.28684-11-atish.patra@wdc.com>
 <87ftfe3g4u.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87ftfe3g4u.fsf@nanos.tec.linutronix.de>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 13 Feb 2020 11:01:35 -0800
Message-ID: <CAOnJCUKPZ72aDibwxcWeYN7Bh8UyohmcVQqEiSe1fa7p+M8y+g@mail.gmail.com>
Subject: Re: [PATCH v8 10/11] irqchip/sifive-plic: Initialize the plic handler
 when cpu comes online
To: Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200213_110149_369940_6129D44C 
X-CRM114-Status: GOOD (  10.56  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, Allison Randal <allison@lohutok.net>,
 Vincent Chen <vincent.chen@sifive.com>, Kees Cook <keescook@chromium.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Atish Patra <atish.patra@wdc.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Borislav Petkov <bp@suse.de>,
 Mao Han <han_mao@c-sky.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 13, 2020 at 3:02 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Atish Patra <atish.patra@wdc.com> writes:
>
> > +static void plic_handler_init(struct plic_handler *handler, u32 threshold)
> > +{
> > +     irq_hw_number_t hwirq;
> > +
> > +     /* priority must be > threshold to trigger an interrupt */
> > +     writel(threshold, handler->hart_base + CONTEXT_THRESHOLD);
> > +     for (hwirq = 1; hwirq < plic_irqdomain->hwirq_max; hwirq++)
> > +             plic_toggle(handler, hwirq, 0);
> > +}
>
> > +
> > +static int plic_starting_cpu(unsigned int cpu)
> > +{
> > +     u32 threshold = 0;
>
> Pointless variable. Also you use PLIC_DISABLE_THRESHOLD down below, so
> please add a proper define for enable as well.
>

Sure. Will do that.

> > +     struct plic_handler *handler = per_cpu_ptr(&plic_handlers, cpu);
>
>         this_cpu_ptr*&...)
>
> The callback is guaranteed to run on the plugged in CPU.
>

Ah yes. I will change it to this_cpu_ptr. Thanks.

> > -                     threshold = 0xffffffff;
> > +                     plic_handler_init(handler, PLIC_DISABLE_THRESHOLD);
>
> Thanks,
>
>         tglx
>


-- 
Regards,
Atish

