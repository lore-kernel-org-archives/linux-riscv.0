Return-Path: <SRS0=2lO5=O3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC60BC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Dec 2018 08:25:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55B8D214C6
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Dec 2018 08:25:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dIhw5IUx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="ckuzd2hi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55B8D214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=10JYXm3DVYy+kwjjD+TRMqzpqojBVNScn3n/AXPsQAk=; b=dIhw5IUxPDA3AX
	eFTIX0xynCkKeuXBQQ/QkqL/rC/+WnIG1sUlx3a2LIoV80zwkpI+8Pt5CVP68G09kfPmpzVoYuafv
	qPcU1RSGLn0aDhs7KQSibvLmwnWCho67DO+iFpgwxcbCXsiH4w+pc7tsHOEhcK9tlBFf39u9q/jvS
	OMiNn4RabFVYTA5NRKTCEIMRG0YEdT1FsI7I/eiNoC/OTPgFK6kH/ThckdQuNxv9kUzBsCq28qqVG
	TcSU42cvhBm785h9sN2R/+eJJaeALxz98D2f3EbliSSWkBYvUJyeHn1ccLXCX8olqdGETOtDtvWn8
	Ip3LeuBIR0hHb322Nzzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZAhN-0003jx-SA; Tue, 18 Dec 2018 08:25:53 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZAgu-0002L6-2v
 for linux-riscv@lists.infradead.org; Tue, 18 Dec 2018 08:25:44 +0000
Received: by mail-wm1-x343.google.com with SMTP id p6so1506660wmc.1
 for <linux-riscv@lists.infradead.org>; Tue, 18 Dec 2018 00:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IpykpJoy63zv5Qr2sa4YjvLcDK9nBwqseXtSqQ+mgA4=;
 b=ckuzd2hi1aO4C8vNbcH8WxP+w7qciNjsquy0ycxsGqWOI6gOBgVIjVsQFl6ZSWQVGs
 lWwHW3bTLXqVisGxPiE7aBUIiVdI+837SUHideezgE207xsd/2/kLnpW8MteUDN2czcn
 y2pOL5akqm2QyqUN56z4gTA9xBjpfEh8qRdvJnKolRUHnuNXCOgDZNf9ysTBluFn4DbE
 IQUqgG5rZsVbpyIaIMTj68UDbNv1B//FsMx4v7xa3mYtvYseeTsSV8qNXFnV8+EyrEb2
 /YCC20RwHcB3p7U0NcG116a4U5Vix0bff50v5bt27uB+wHPeJBv1D+eNYVyg4yZwV7XZ
 bgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IpykpJoy63zv5Qr2sa4YjvLcDK9nBwqseXtSqQ+mgA4=;
 b=Y78+A7/IPgwU1QfxTJvJw0VNmf5+SW+/TZoVx8gHujswKZ3MNi2LYdZ/tthHAxin5X
 0qJJxJWInODCwqzrPUP/GX5Lvw2NPTI0geMZsHaMfMIevYmZ23Nhdf2D3BprLCvOIxpK
 ZyM78MGbhoWb3BL/9VVCwwGIQnu+V8ppaSMrWCqlHk/gPZf0hKSIkhRIasPblzJslfDg
 u2zy6jFArLPSlr+PkNhSBlKaMZL1OT/0LCl6cnD3QY98SaXxYg3ZVRrxkMXybDeh28FW
 XSgAZpv56NjjcF7yffAoFNglRd/C8LY1ELQZe8mF1mOo3QC9U8mZ+BcR3s89n0VWbYEZ
 K8Zg==
X-Gm-Message-State: AA+aEWZRJ+vMWx7grPb43WH8xc3OCk0Tme0VlU8+aWVbix1tPwPhIBm1
 8exGMT+PCrzXgUX3PEJNFqzeAYKhzL6FwGe2E1Loog==
X-Google-Smtp-Source: AFSGD/Xp7ENy9UfdLu8zRnlO/IIwh2pr5bRJHzoRtpL31TWpNg0VyqLScnkpaYCx3/pvVXpDDqt+B2rDV0m3mLJp3yw=
X-Received: by 2002:a1c:a3c3:: with SMTP id m186mr2205887wme.16.1545121511510; 
 Tue, 18 Dec 2018 00:25:11 -0800 (PST)
MIME-Version: 1.0
References: <20181130080207.20505-1-anup@brainfault.org>
 <20181130080207.20505-3-anup@brainfault.org>
 <20181217182415.GA7086@infradead.org>
In-Reply-To: <20181217182415.GA7086@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 18 Dec 2018 13:55:00 +0530
Message-ID: <CAAhSdy0_m-TfBYTEBw_k5+n9WC8c_ASg0A=_0S2TPHppCFCWgw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] irqchip: sifive-plic: Add struct plic_hw for
 global PLIC HW details
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181218_002524_650674_096AE43C 
X-CRM114-Status: UNSURE (   8.59  )
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

On Mon, Dec 17, 2018 at 11:54 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> > +struct plic_hw {
> > +     u32                     nr_irqs;
> > +     u32                     nr_handlers;
> > +     u32                     nr_mapped;
> > +     void __iomem            *regs;
> > +     struct irq_domain       *irqdomain;
> > +};
> > +
> > +static struct plic_hw plic;
>
> Please use local variables instead of a single instance struct.
> And only add these variables in the patches where you actually need
> them.

I am sure it will be useful in-future but for now I will
remove the struct instance.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
