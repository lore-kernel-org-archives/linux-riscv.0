Return-Path: <SRS0=Nd4X=PE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1620CC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Dec 2018 05:28:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D71DD214C6
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Dec 2018 05:28:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IM/HVlUs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="2LHTUQma"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D71DD214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tj7asieSzqwDkA5PYagiiXb22kGXtAzAkolRwNTizKo=; b=IM/HVlUsta/T5H
	ZuR7Dm9c4Ti5CvJsiHuUp741WkflVS53GWcDr//dnkp9vCsTc3J9xEZCryWXxejVqxOUqmx/TG9+C
	GKnxEuh/YjgUB8zix8vqOqBWx2EMkVlgLFR6//uDfTBNSbLOuk8C1YNxD99DEoVMfNJ3Ogz9iQW13
	WtgQdrDI4jZZYB+xq4vNdE83dj54VgXdzo2pPLzxKoEvz2VWFH/VzdBzjpCj5q12AD62sNgUNthbt
	6mntr+5yHFQ0KiposHomXR2vIwHn73IVUQ8x4RuwlkUgaG3CJgE7PSL1PxvYA1+hGXbodWUxaXhod
	8cBybKF9CsG9SPCXXU/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gcODB-0006Vj-RL; Thu, 27 Dec 2018 05:28:01 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gcOD6-0006U5-UT
 for linux-riscv@lists.infradead.org; Thu, 27 Dec 2018 05:28:00 +0000
Received: by mail-wr1-x441.google.com with SMTP id 96so17258476wrb.2
 for <linux-riscv@lists.infradead.org>; Wed, 26 Dec 2018 21:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sZzhCcAgXuw19vxX6fyr918Uz0Jrox7YQDyO5SQd/Ks=;
 b=2LHTUQmaZpLDzZob5MnpMtup26i4+NRGqEbSMZsqZo7CDD/MQP/e0Fr2NGvDG0zLNR
 jrHYViSl5KaV7af3Cgd5dYXSHlkn9TgsisDtKl3htS4XaJGJsuiC/NhVRw+pHy3DMYSK
 AC1FHjY8Gu7MDzCsY0R6skLZJuEnmxgDuSK4pdNDkcPyGtsZ0CPk0hHrXXREXOAewZGp
 Y3adL0QmZMGKp0w1I3GttHgRlCoxeqxfb4fHV8acs/PiSRHVaRg2zKjMntzAD0M1CU2v
 KIO9CvxjYJF4AxVuwaEly8Obu2us0lSlXbCLTO1k7aFPa7JN5wb+7sRWqoQBMqdP/Zy1
 wIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sZzhCcAgXuw19vxX6fyr918Uz0Jrox7YQDyO5SQd/Ks=;
 b=fsENzNF/afXGvkfI+YDUgAR6KsE+ueecp3/fDNT1wUEq/XRq/fLgDVADwxjAml35Nf
 XxC8yoRx39acgBgiDf77Okt2dgN3q8EGsPZhL1UxG+H4OcJkaNYqchoLkM4pr8SQ9wpS
 VVdPkCezbKOWOLSfmi45ZUcvmx7nwbnALsTZcUo4S0vvVUdbhGwDj+gD+SqBJLI7K0ve
 2+l4sdYTzZWa1Uy15N/bjwnTuxAeh/0/E0oBgonHRTPF4JCwFeQLvllT7sn8149fi/Dc
 +D9Rr30ibdrv1wG6Q4lxy/Duq3wzIhQxAGdjafankNr/Wrzf3Fv4TQZKRxBUHJjhX+2B
 Nq8A==
X-Gm-Message-State: AJcUukff78bcIXKafG9HyjYZKliLZ+pia8lKXdVjt69e2NwIZW9UYCIy
 U7w5guHo+v7JU//5tn5OyZPqDBxsufGqGA6AVh1MIg==
X-Google-Smtp-Source: ALg8bN5X4qQIE8YqMXg0ioz1s2ZXK0l2gAFN+G6fxA1BZnHy/bwupJfks8PTyvW4bjzCL08SxQsPreuvhhM6Q87abHI=
X-Received: by 2002:adf:91a3:: with SMTP id 32mr18886340wri.99.1545888463992; 
 Wed, 26 Dec 2018 21:27:43 -0800 (PST)
MIME-Version: 1.0
References: <20181130080207.20505-1-anup@brainfault.org>
 <20181130080207.20505-4-anup@brainfault.org>
 <20181217182719.GC7086@infradead.org>
 <CAAhSdy3i+ap2J0By3nRqK6yvb8oD4-+2QwUO9PH9GM+0odKqSA@mail.gmail.com>
 <20181219162836.GA9224@infradead.org>
In-Reply-To: <20181219162836.GA9224@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 27 Dec 2018 10:57:33 +0530
Message-ID: <CAAhSdy2a6gs8o50afS_EpncinQvdUu--=a1PP5XfY8ZcJkWS2g@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] irqchip: sifive-plic: More flexible
 plic_irq_toggle()
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181226_212757_013784_69499D65 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

On Wed, Dec 19, 2018 at 9:58 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Tue, Dec 18, 2018 at 02:20:10PM +0530, Anup Patel wrote:
> > Actually these functions should not be inline because plic_toggle() uses
> > raw_spin_lock() and plic_irq_toggle() uses for-loop.
>
> So?  It still inlines the all of two instances into each caller
> for slightly different but related work.  Not sure it is 100% worth
> it, but probably more than the one to move the calculations to init
> time..

Not just at init time but these functions will also be used when
irq_affinity is changed by IRQ balancer at runtime.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
