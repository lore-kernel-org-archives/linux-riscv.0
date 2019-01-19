Return-Path: <SRS0=HQJf=P3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21155C61CE8
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 05:26:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D73E72086D
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 05:26:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TD5jO/0u";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="EKUexgRx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D73E72086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rj1e+p1b5VoU6xuAqUVdfNZRjQ52DBxyjST50qRGsJs=; b=TD5jO/0uS4ZjfT
	UvENtcgfE2JkPz8o/VxJr9H1kl1cyYu8NzdwtA/pYE7uOHlXqClay2Ipq2528qA5MPHY6wIcMiiZa
	XSI9tYMNBgi0zN2IQ2QQ1blYGDy3Cz9LElVCzE4UrIFy3kbn+t5YB5p90/Rk2zf36QgpDhufLqjwP
	rYdrNOOXXm/vuNlvoDXgroscwxPFG1kw+xvC10iLowJxtg1GChm3SHk5xfOeqfuIcdapkjze7Y04C
	A3m9ozch5/bNw23j8c2VvuateS/+w1MpMRLh1jDG2AD1pPMXSQWIKt3a+eSf3FevYO6gYmZznYDh4
	GELZQeQ0qWz+2u53OZtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkj98-0002wQ-Mq; Sat, 19 Jan 2019 05:26:18 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkj94-0002vp-MY
 for linux-riscv@lists.infradead.org; Sat, 19 Jan 2019 05:26:16 +0000
Received: by mail-wr1-x443.google.com with SMTP id c14so17525344wrr.0
 for <linux-riscv@lists.infradead.org>; Fri, 18 Jan 2019 21:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S5WLHKm1UldARquTGB6XuPGzuMNSMkWoRTMN9CVKI/w=;
 b=EKUexgRxQOa3l+/0BWMsjZDhFsahNG3htOdWMBQshY+zSyrbzlNtNVuLI8l1NMF64f
 ZuI9t8ruKJ6eIB6sUfg3Fu1I1XGrEOitLDS/vEB0xEy3gpMSTF4Yi6oTZyyNnREehEWr
 yhxzE6Viob6I87vxJH8ssA4IWjfqieA//B9EC2QWcAcYnUvaWafo91M/rWjiwUhnqMJK
 ABbzoU5leiZkmBka2yAUBTgX2aabrK+bZqYHdPyCxYJpSYEa9KB/0MDmCTKKs3yvswP5
 55wCnt3VKdJhCQg3nn3LVnEdF2cZKtNOmrl9oys0wX73P5ibXAnriFnhT4a/cbsfi7Er
 qeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S5WLHKm1UldARquTGB6XuPGzuMNSMkWoRTMN9CVKI/w=;
 b=A9PgDWPDM8m9PiLtNuJt4wTjspCeaIktSJTZtl7Tl9XIyuRCfoxvIiVTnu8EIbZVyz
 4KcDWG1EfNEuf0zJUd8CP7b7Eru/yH+TiCwapndqkxQdC5TdxwutPyxsVE5dkeKQggx3
 CMv0UV4Sqb6szWTln1ORnm29qk5l4ZsphBFxKsDESPOKBzOkRqckhqxRxoZ7J8Raxngz
 zzndqHitDyHWYXp3in/VoA+nSYBPxXDMabZQAPEEyqfq7ImO9hC7nvDT6hhXNOOkNFKz
 7HOOO5e9yU5jY+2JzPCnR/wtNjcDV/BHSAWKGU7Wji0y11T3Zq9B6e6RC/n+/YHTgv2F
 vfQQ==
X-Gm-Message-State: AJcUukcKpT41QJqFJzOzl8/hmbO8qJ1NvN9rKpCPhmWAhIrER0162g3S
 tIgsJ1pJiXiwfO8vvOUOZ+gvQYKm2Ddo8zr6R56YvZ3z5Ho=
X-Google-Smtp-Source: ALg8bN5V+6YkMLC8pakrEPq8SJekNxg23yM0DzsOQo9orwLdyQ2JYB31GJ9nrRjDaMLL15Fy665TkIML85jGj1BAs7c=
X-Received: by 2002:adf:f5d1:: with SMTP id k17mr20570188wrp.59.1547875570759; 
 Fri, 18 Jan 2019 21:26:10 -0800 (PST)
MIME-Version: 1.0
References: <20181227111821.80908-1-anup@brainfault.org>
 <20181227111821.80908-5-anup@brainfault.org>
 <20190115155600.GC13095@infradead.org>
In-Reply-To: <20190115155600.GC13095@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 19 Jan 2019 10:55:58 +0530
Message-ID: <CAAhSdy2Oe44Mw66rphPHGU69DN1bnyhXH3xjrQ6DvLNsVVqgSw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] irqchip: sifive-plic: Differentiate between PLIC
 handler and context
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_212614_737020_59C7B786 
X-CRM114-Status: GOOD (  11.85  )
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

On Tue, Jan 15, 2019 at 9:26 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Thu, Dec 27, 2018 at 04:48:20PM +0530, Anup Patel wrote:
> > We explicitly differentiate between PLIC handler and context because
> > PLIC context is for given mode of HART whereas PLIC handler is per-CPU
> > software construct meant for handling interrupts from a particular
> > PLIC context.
> >
> > To achieve this differentiation, we rename "nr_handlers" to "nr_contexts"
> > and "nr_mapped" to "nr_handlers" in plic_init().
>
> Not sure what this differenciates that we previously didn't.  As far
> as I can tell it just is a slight naming cleanup.

There is a disconnect between PLIC documentation and PLIC driver.

If we have 8 HARTs then we can have 16 PLIC contexts whereas PLIC
handlers (SW construct) are always same as number of HARTs. In other
words, there will be separate PLIC context for M-mode and S-mode of a
HART.

Linux runs in S-mode so we can only use PLIC context meant for S-mode.
This means per-CPU handlers in PLIC driver only handle PLIC S-mode
context of a HART.

This patch makes PLIC driver more readable and matching PLIC HW
documentation by differentiating between PLIC handler and PLIC
context.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
