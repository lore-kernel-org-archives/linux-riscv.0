Return-Path: <SRS0=EHGE=NX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF8DC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Nov 2018 12:34:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50E8820868
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Nov 2018 12:34:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZruSY42p";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="Cp1nenxM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50E8820868
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vY/pKvSLjDAu3bkErfMIhapfxKCBXpysDjSExV9FJ/8=; b=ZruSY42pnLJi73
	KBiHENFlkgAxIDDQ0jysnte/XpHnOf+qQJZV13IPYrqVEBazR0gs+DAz5baHEnGDdlMbKNxUQ7OM0
	m19h/HOyycgcZ3zHIWhh1tXmQPlN+u4PvCh7NuvrHsDXrnNA2G36v67rf7Aux+A4mK+ZyhdQCVX1U
	iv4hePkRlA/qUL47pCIJJ/KzEljRDWtT+UH6elj6PgLhUoNzBFLNH0/1O8vdHEO8M/7+FcTHfrR0F
	YtZChXbgAHeKpO7ix1kVrucBgtpu1gdKjmU0jdwBwP0+w3H1JZtXc4uo9TkKyE/JyiNplTu5IbAdo
	uw/mhVIvALM7+kKyMVbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gMBPu-0008Ii-VS; Mon, 12 Nov 2018 12:34:11 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMBPH-0007WG-45
 for linux-riscv@lists.infradead.org; Mon, 12 Nov 2018 12:33:33 +0000
Received: by mail-wr1-x441.google.com with SMTP id j17-v6so9115080wrq.11
 for <linux-riscv@lists.infradead.org>; Mon, 12 Nov 2018 04:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mxm/KaMXvT8Da/hEWc3PaitzyuswF/hYKIpA34uqooE=;
 b=Cp1nenxME6xAc86TcP0Ddsvc6qVwB3bUNOthi8wCCVeYxFnKnCT6TCot0OmCS6ga9y
 g9AjJYafC+0+649fzZEyukSbuD2H5F2oK3URWz+TcUkZVwgI52R7VjuMbWfclIAAFex0
 zKwr4HpWnSuGkUpLnlCrkfMcS+qPkUoZCRwcRgnobUcPvoxXnYjkPBK6H/5SV4A8+B3P
 /9fZxMDXOy17Dx5ub9ZUy1PYWsjbM9N0f8ipqsmljk9mu0xuHtKGPYNAnFSvcUC4cgcP
 FOL5FCsLSBGZAqb+Y/YPBuOHDAINIgiSagmvfqI6x8Rx8CD39qJDzjEdVY3GpirX7/Jd
 P4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mxm/KaMXvT8Da/hEWc3PaitzyuswF/hYKIpA34uqooE=;
 b=IvW91APAK6tloZejoqQOUFIV+tf7euK4uUB9DEzoERzAXruw0fa+tAL/NmsXRtNcyT
 0Fq5DhE6RGyKjHvTaUVCiTszLx9PFDRrGiqYPaSnTIGsN+ZcTLsGaZMc9hcVKAnIFXo6
 UwB7BqZUyq7BqxyX3GnKJILKApehPytCBISJMD1r2hgvNLu4f4YGRLe7z1T2JYva9MPn
 I44e7BdcVoJV92SM7a+PQ0MPnG8XcTqozPMng8juHan8HfW3UD5Js9qyuyyC3+TJAEpT
 tFTUoHZ18eDqvo4SDa4XSU8htvkIh/lPjVAYrt4DO2bqzMg1NWdqFd0graLo9JaepnIR
 1emg==
X-Gm-Message-State: AGRZ1gInqikhD2C1nz4TPLSW5QUknXrek9VxeHEZv3Y3NyCL0cUKIiTs
 6KzQUH7utHS1Zm1H4NCIF8GA9PD10CVFqSd6eq1SbQ==
X-Google-Smtp-Source: AJdET5c1wbXO6MMpWlHs2uETqeWeZ4GWdiQizqlVptUahZhmV2sKT0/ZR98T59mRCBsHBQCTd6lo0MK2WFgptClgPz8=
X-Received: by 2002:a5d:5544:: with SMTP id g4-v6mr812975wrw.222.1542025998895; 
 Mon, 12 Nov 2018 04:33:18 -0800 (PST)
MIME-Version: 1.0
References: <20181022114517.22748-1-anup@brainfault.org>
 <20181022114517.22748-3-anup@brainfault.org>
 <20181109084338.GB6508@infradead.org>
In-Reply-To: <20181109084338.GB6508@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 12 Nov 2018 18:03:09 +0530
Message-ID:
 <CAAhSdy20zU=GeaePQfYW_FKH-wmsYgvK3-6ouc3S8QpwWH-Z+w@mail.gmail.com>
Subject: Re: [PATCH 2/4] irqchip: sifive-plic: More flexible plic_irq_toggle()
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181112_043331_176542_F9AFAF7D 
X-CRM114-Status: UNSURE (   7.77  )
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
Message-ID: <20181112123309.D7DgIuj4XY-t8ODyzWb5ygExeOV4KjroF7-l9LbPVnE@z>

On Fri, Nov 9, 2018 at 2:13 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> > -
> >  struct plic_handler {
> >       bool                    present;
> > -     int                     ctxid;
> >       void __iomem            *hart_base;
> >       raw_spinlock_t          enable_lock;
> >       void __iomem            *enable_base;
> >  };
> > -static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
>
> This does not match the changelog at all.

My bad. I should have put this change into separate patch.

I will refactor this patch.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
