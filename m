Return-Path: <SRS0=JPO6=RN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137E4C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 10 Mar 2019 20:50:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C788A20652
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 10 Mar 2019 20:50:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R0v4/aGf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="Vn0xHqEr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C788A20652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=onVmBVoqmIq4DUZMswEJk66Be3PcZptTN9z9+8IEAQw=; b=R0v4/aGflT4zAx
	+1+NMsv+5OrsixoU6Qu3LWUdRuEvynTag4jcMnG+4u9GcJO9umxPUtLT4i6wvD1eOYGxqLsT9TZsV
	6d7D84cFo6JYfkyNkH14bWxWdzLSZUNhgWHFAXalSYroWvUJOYmcyF4mPlVhqkEzd1atF7ayxequq
	irWX1LWjg7z3/CptLovnFxdyW4wJ7XEnOspJfypTtQ5sFEREchW1fT8sREcFA/lnQ+T6t+DZMh0m2
	sh6FUKa2RjQREo9hCL1PthXhHoGube0ijJx/snFKt5HmjyJdB6no5yESvKAD4e+suP4npOgAvarlp
	GlBMXyUowy5Ae9x2E0sA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h35Oc-0008R6-Id; Sun, 10 Mar 2019 20:50:10 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h35OZ-0007sR-FY
 for linux-riscv@lists.infradead.org; Sun, 10 Mar 2019 20:50:08 +0000
Received: by mail-wr1-x442.google.com with SMTP id t6so2880631wrw.7
 for <linux-riscv@lists.infradead.org>; Sun, 10 Mar 2019 13:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MqYe7hwkxoDoSXRy9JR2oHaENNM1Q/KKM54U+nwPsKg=;
 b=Vn0xHqErBYNSCCc1++oRKB+L/sw7yKwKa71dEF82ZupR4z1c4B/Fk53HLGacvDHZfX
 Eb8Ti/GMx9KtjbZ/0vJnpIM2Xa5LufvhJX//zdhkTC8pGlliJ6TC2Ot+5UZDap/obRe5
 DlgvSI9OJJfhnCkqhLwuacRYInDDxFvkvWO4BZF+h6sitXJxSKeCrsONrwMzYm8CYhOu
 xAzSUQEhm/D+zyaXcDSjL19/kvD7Al3zI2cfeccMF+HRfcWtVgwle5qghU4B5/aGIx6u
 PGme2HyNMpF+816w/LNMey1kVSTf662Msvs0OXKHf9+Esc0Sycku2CJ8qtuO2W8c5kPh
 fDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MqYe7hwkxoDoSXRy9JR2oHaENNM1Q/KKM54U+nwPsKg=;
 b=S9drajTPvgHAcL4dnD4aedBIXgdbWFDq6sev/oPIZbzfty1M88CjQjjl1Z3MXroFOy
 h9QxJHIguhwYbpUaW7sTIN0xES6vjnkArWVyUHQZfV/XSYtOVxqdOkvwh2rLldVNK6SK
 GbSfVCIhy5s/urpo8IN3TTdkFFC1owI6ulPjQmiruB4q/6IOZyjA+URnE82GmBIIIIjz
 prAJUMCyhLMWw0+nSsY3mXeub4tKpYuGZ0HVn44m3ArNdhTucKwB9G+VHQK5PeYNIfBd
 JtItccxDBE/GAb5E7cHzkgyI4GXFC7829YFMs8kXmB1xLTAJEYxv8gFxRwML3xa0jtoM
 dJMw==
X-Gm-Message-State: APjAAAU3lmE8Whqa8P09pSd2XhCWG2TPN4OcAX+/dVEePintya8IzVSF
 XhL65VJBk6zlxg8NBI/HvP8sM89bdTOfQw2zy9Su2w==
X-Google-Smtp-Source: APXvYqwdCSPHXnx8UzWXbR/YeiYzQQr4hGBQ8WI8KeNM67gHZ7NVJwWTYrQNAnEAQYyijHGgJozAcXHfky3VawYaSxg=
X-Received: by 2002:a05:6000:1152:: with SMTP id
 d18mr18798913wrx.128.1552251005301; 
 Sun, 10 Mar 2019 13:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <LO2P265MB08471CC8597FD60691334624D64C0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
 <20190308143928.GC32707@infradead.org>
 <04cbcd8e-77b4-b3fa-8f9e-3aa07db781fc@garyguo.net>
 <20190308163125.GB310@infradead.org>
 <CAAhSdy3n4F6EE0RYwozH2U2W+WMGJ_eVYs7-ny8Y2szoUeaksQ@mail.gmail.com>
 <20190308171804.GA27005@infradead.org>
 <CAAhSdy1HBgn99x3V4=ytYEzf3cTiwT1ogBs193ZxFTVxTDbgsQ@mail.gmail.com>
In-Reply-To: <CAAhSdy1HBgn99x3V4=ytYEzf3cTiwT1ogBs193ZxFTVxTDbgsQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 Mar 2019 02:19:54 +0530
Message-ID: <CAAhSdy18xNqbbQvBLj8pHB=vWM8KqhUfNN-6Bw7J4J2ONB8i=g@mail.gmail.com>
Subject: Re: [PATCH 3/3] riscv: rewrite tlb flush for performance improvement
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190310_135007_539755_32C79D6D 
X-CRM114-Status: GOOD (  10.23  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Gary Guo <gary@garyguo.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 11, 2019 at 2:16 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, Mar 8, 2019 at 10:48 PM Christoph Hellwig <hch@infradead.org> wrote:
> >
> > On Fri, Mar 08, 2019 at 10:20:49PM +0530, Anup Patel wrote:
> > > For your information, the IPI triggering is also done using SBI call
> > > so we are not saving much by not using SBI calls for remote SFENCE.
> >
> > Not yet.  But all the usual implementation just implement IPIs by
> > MMIO writes to the CLINT.  Which could easily be delegated and we'd
> > save the trap.
>
> True but CLINT is not the defacto way triggering IPIs. Other SOCs will
> have their own way of triggering IPIs. That's why is it is abstracted via
> SBI call.

There are also use-cases to run two separate OSes on same SOC
without virtualization. In such cases, both OSes cannot have access
to CLINT for triggering IPIs.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
