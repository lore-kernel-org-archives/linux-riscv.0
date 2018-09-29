Return-Path: <SRS0=lSM2=ML=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D03C43143
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 29 Sep 2018 07:06:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3F582073F
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 29 Sep 2018 07:06:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZJ2oRoAc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="IeJyw2BF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3F582073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=po7ZEA8ztRKDJQBm09/zNcS+FpsFIcweBQ5pIhVS20Y=; b=ZJ2oRoAcX0QmYv
	QuWw4e9yBdrA7gA0MwWsQM8beEZwBEmcmbqyjYcWFvyF9IInuP0EDkFWQDLePleWmJ91W25zeglFX
	uhkll4tGvjSA3krynMFgcKxEGhx1JLTodb+YRFURFZQajoWeIoq3ks6HUCmj8fR/hx8a3/ogU4Eqs
	FIx4KZIT2/XGs05s8M4n0vd+PnmGZkHbIOcm2x5zDyW0ZC3f9BQWfbWkOQH0b+fzcdTcsb55iUFMN
	586JzdYhSM1PxozMwiUQpjME4MQhivfZwEsnOcOQ7iX4t9FKExK2uZsehkogYDKgPWhmOvOaguId2
	G4dvnh5C3HQ8My4ZeIbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g69Kf-0004FX-7l; Sat, 29 Sep 2018 07:06:29 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g69Kc-0004Dy-Bg
 for linux-riscv@lists.infradead.org; Sat, 29 Sep 2018 07:06:27 +0000
Received: by mail-wr1-x444.google.com with SMTP id u12-v6so8490207wrr.4
 for <linux-riscv@lists.infradead.org>; Sat, 29 Sep 2018 00:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PxZ34R8u0YcbHaqttHc8byjj9EW0gSodxQpNWy+NBXk=;
 b=IeJyw2BFZ1Zwwg8Ii3/hDH4Wc5j+u5G7bm63DKyr1xw5xoaIhLDak7zHFtSRNAidny
 6WT9zAy3TrsVkV96Vh4WqqOAid8lOzYFUW4RHEsStBRiDNG+rHQql5aMTa8p62mdJhLl
 bsq6CwoEor2Xbs0YkWv13VmKti7abUiLCd/0gr/1GnSuco4X5C546klQMfQEcZS5fEnN
 0/oZ9AvT6JnKVBapYpYW3hXemin542L0d1HmTd6zzdAELkvA21GuHUA/F1maK6Zvchmx
 l966aB2QLw4QEBXe19kuPQ8JDfD+YA1nsDF6HTFThvma32WxIl4lMOucDmXmvwE6et0v
 se/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PxZ34R8u0YcbHaqttHc8byjj9EW0gSodxQpNWy+NBXk=;
 b=JA/ngtGZYN8B+doBJrmAY7FiZDZX1yYD3qfZcg0pNx2RX6G172YWNzfWhgLu+3DeyR
 z3CN90XS9xpoqFAYMGyqtPq7wpU/HJBZ6Zf759PXAZFMGiTGlLn5cba+wwfMU6nxmy/E
 FfjPB7Hk7Z4wDk7GJezqTQzSLnP3Vq6SWOkLzG42JFK0CH8r7AZjvTFdelrSFU1J15kG
 2BSxE2qMJXWwN+1oNRzb78mrBYCCiEeZ3FWeI8DYWTPbX8/ul7MztKX9bRYMl4655f72
 RwmDVxASW/ILjvp4chfN/8ECCkBZGX3c85aip6OFqgwtIEv/JcTs68rDs4ZCe0VEWzb4
 IKLw==
X-Gm-Message-State: ABuFfohEPW3cpZvzxNZouywvfFQgzeNEd9wYe1vH5wbYZkdTkdi5x8I1
 DFEK1Y4JnzIpBo7+mKHgxnJwkFIzm+sPBJ8UeFM/rQ==
X-Google-Smtp-Source: ACcGV61Pp3aT6OSlTe6FaG8iNrph4l1mnX/L5m2FzHT85cMKFsCG30wsSrk+wTEcyKmeC7vxvdDravRecTOIY0IkU1w=
X-Received: by 2002:adf:8447:: with SMTP id
 65-v6mr1105286wrf.251.1538204774107; 
 Sat, 29 Sep 2018 00:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <20180910133418.GA12330@infradead.org>
 <mhng-0f237369-b7fb-47cd-a610-be4c577c3c4f@palmer-si-x1c4>
In-Reply-To: <mhng-0f237369-b7fb-47cd-a610-be4c577c3c4f@palmer-si-x1c4>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 29 Sep 2018 12:36:03 +0530
Message-ID:
 <CAAhSdy0nmy=vX74e08BOPqC_pyEnRrPz06gTWz8LivOkQscYuw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] RISC-V: Make IPI triggering flexible
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180929_000626_399354_0E8D7210 
X-CRM114-Status: GOOD (  16.81  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180929070603.z5W2WG6SklNzPG1FqKtpyaYvlPeSrkEtDjIucqhXB1E@z>

On Sat, Sep 29, 2018 at 7:15 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Mon, 10 Sep 2018 06:34:18 PDT (-0700), Christoph Hellwig wrote:
> > On Thu, Sep 06, 2018 at 04:15:14PM +0530, Anup Patel wrote:
> >> This patch is doing two things:
> >> 1. Allow IRQCHIP driver to provide IPI trigger mechanism
> >
> > And the big questions is why do we want that?  The last thing we
> > want is for people to "innovate" on how they deliver IPIs.  RISC-V
> > has defined an SBI interface for it to hide all the details, and
> > we should not try to handle systems that are not SBI compliant.
> >
> > Eventuall we might want to revisit the SBI to improve on shortcomings
> > if there are any, but we should not allow random irqchip drivers to
> > override this.
>
> I agree.  The whole point of the SBI is to provide an interface that everyone
> uses so we can the go figure out how to make this fast later.  If each platform
> has their own magic IPI hooks then this will end up being a mess.
>
> We've got some schemes floating around to make the SBI fast (essentially an SBI
> VDSO), I'd prefer to push on that rather than adding a bunch of complexity
> here.

Yes, I have already removed the IPI triggering part from this patchset.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
