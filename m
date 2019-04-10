Return-Path: <SRS0=ShlG=SM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 957FCC282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 04:11:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D48E20850
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 04:11:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Frj50O94";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="Pqji4CEp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D48E20850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z0o7jHLM9ezBKqdsQGtRyQ/gfpKb9x0+h5Sg/yJc8tE=; b=Frj50O94tIJBAq
	SbfN7c9yK+oEGgc/usarajl8BFX170TuVUO9sHZ5dM0ucP6nOLgcvMkDimKmU/mBh8cwE7etJvRSV
	PALbXZHHhWqwQ127FuFYQ3DXVwnHu8nF9ZqyavQIYLsgVw83g6+9b7TL/QuFXZoLeR/dbGRa43WEi
	HlyahVfFEBA0ysOZ+CXrVB+ew0or3A0byy6xhlvQo+4LrbI954p57rI6oC24hdSRtAtMBIpKtmqJ7
	whs9XRHV70/T15PE1JmelvczXLEDtr92dGwgU8scEZ/4lJPLglQ0DUr71Hc8sn/t2avLs1sUqcnI2
	vbmRcj/ZwUO+URiRMqbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hE4Zh-0004Ba-7Y; Wed, 10 Apr 2019 04:11:01 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hE4Ze-0004AV-M0
 for linux-riscv@lists.infradead.org; Wed, 10 Apr 2019 04:11:00 +0000
Received: by mail-wr1-x443.google.com with SMTP id q1so1159950wrp.0
 for <linux-riscv@lists.infradead.org>; Tue, 09 Apr 2019 21:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IewjcLSJnQrO08PbnPGd5ADILHnS1hScA5/IGBONAXw=;
 b=Pqji4CEps5vlS2C6w+QeTo4oa1s6i51fB1ohQC71pRVe8DUty81aas0k1RLuJjLOz3
 hsmYd2AwdQQ5COgc4BSDA/KMlV4//yjuOJ34RMxWLnXu4eGLgMheoTPgX2Sgogf/9aFc
 kq1FFXy+xBgXjV0IjUv/sh6ImN/BZLKR3V57+4v4L8lmrEdJ1ins4kdd6y6S3izGSKJM
 gKczDPHxKbwymzhWWwVZLNcZ/2YODkHYhNaVVfsg6nzGlHWE8GUhRPMOCaMAqsdQvU5G
 JCxCj1/eWVnYPca7XH0s3qb17fEdW9a1ctt1mhmg79q8vg0vhr1LLiy4pn1uPLpMaCzA
 ScJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IewjcLSJnQrO08PbnPGd5ADILHnS1hScA5/IGBONAXw=;
 b=l2ZFp05NMHWNQ0lPxU4oNx0/nu/vYx0ez3EkCIqYqI3K9eOcnafbYMuh9rF5S+JpvA
 qdIs6D1XAykVTR4y6Vga8sNCurliyujaNLz9W1Qpt0Z1j1Uq/kKQ2DiJ6P68nR1PmH9J
 eul54m9HcPLwr9eb4svEueWbkRhRg33RApS0AIEts9n/R9+L0kYz2txVSnmOllOncRS1
 +2bUJHwLzcS8oeYDYfhTOGdcZ5otYH4nyZieAHbHs5ekxON59hprFWO3NQQOYiPbp2h2
 WOCodSxfJenVyAWhDynpaJc+K6tZrK60EAL9Bp081Ii26/G49T8hNbIGPoEZ2y6HujMl
 RfDQ==
X-Gm-Message-State: APjAAAWtc823jB1A+IwAxftps7VGTTKnUos3iuRXtc5GciDRLuYjW3a9
 BFwQt8K2jTg2rvX2WQ2meh4UL2alOb3RYsJeduEsyA==
X-Google-Smtp-Source: APXvYqwHi/MEm58V/UYsSMUvFmagM6orEbnr7iNRXhTqA0TJ7rvNFCPTMzDWiPRQgeRH/m8CJPklWAr7BuxjdYcrzI4=
X-Received: by 2002:adf:e610:: with SMTP id p16mr24936946wrm.64.1554869454862; 
 Tue, 09 Apr 2019 21:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190312220752.128141-3-anup.patel@wdc.com>
 <mhng-3d9a3b8a-2d5d-4db8-b8b0-4ef410a9ad52@palmer-si-x1c4>
In-Reply-To: <mhng-3d9a3b8a-2d5d-4db8-b8b0-4ef410a9ad52@palmer-si-x1c4>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 10 Apr 2019 09:40:43 +0530
Message-ID: <CAAhSdy2MQmPte7=YaVw5Ae5vWgQYcHX-zGiEBXP1a15=CkXzwg@mail.gmail.com>
Subject: Re: [PATCH 2/3] RISC-V: Make setup_vm() independent of GCC code model
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_211058_769384_785665E6 
X-CRM114-Status: GOOD (  16.47  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Apr 9, 2019 at 10:17 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Tue, 12 Mar 2019 15:08:16 PDT (-0700), Anup Patel wrote:
> > The setup_vm() must access kernel symbols in a position independent way
> > because it will be called from head.S with MMU off.
> >
> > If we compile kernel with cmodel=medany then PC-relative addressing will
> > be used in setup_vm() to access kernel symbols so it works perfectly fine.
> >
> > Although, if we compile kernel with cmodel=medlow then either absolute
> > addressing or PC-relative addressing (based on whichever requires fewer
> > instructions) is used to access kernel symbols in setup_vm(). This can
> > break setup_vm() whenever any absolute addressing is used to access
> > kernel symbols.
> >
> > With the movement of setup_vm() from kernel/setup.c to mm/init.c, the
> > setup_vm() is now broken for cmodel=medlow but it works perfectly fine
> > for cmodel=medany.
> >
> > This patch fixes setup_vm() and makes it independent of GCC code model
> > by accessing kernel symbols relative to kernel load address instead of
> > assuming PC-relative addressing.
>
> I think we ended up with a cleaner solution as 387181dcdb6c ("RISC-V: Always
> compile mm/init.c with cmodel=medany and notrace"), but let me know if I missed
> something here.

Yes, please ignore this patch. I have dropped it in latest version of
this patch series.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
