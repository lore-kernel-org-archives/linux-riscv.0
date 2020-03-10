Return-Path: <SRS0=s16l=43=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148AAC10F27
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2020 11:58:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D827E2464B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2020 11:58:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CQ3AaUDI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="lNAHNZVG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D827E2464B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OQiy11R8ysMEMVGnnlAJfpm5twl5UBWdAasXal19OYo=; b=CQ3AaUDIy8MTqp
	4APoWwT3ndA3BnYhxaOEqIxt515zjsjRH4O4O0Y8it6x3Kwb7rW/qYeHjgDGnN01Z3cA2Hc+tl9CW
	g7rUzXQ/ml799e2uipOMUHi2tvnR+1iNSAE1WGfT1phPa4InB6vPv5TwU0Rl27rMMzynJD30QXnoB
	BIeQUgutBmkicUVziLLwVg2UJcAEoHIZoUQAq+JPFPgDDVZ9xFXfn4oKai01wCBgj4TNoNzFWrzSu
	650KoLkjTUUtttuIOjLL6ma/C9UjNEDk6qzL24UkLDJSM8FLiPIsFEXpVkktv2jmF2UIHDezXaXpd
	nW8xaLrvseP6xghymHtw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBdWS-0005Vt-KF; Tue, 10 Mar 2020 11:58:08 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBdWP-0005VV-VX
 for linux-riscv@lists.infradead.org; Tue, 10 Mar 2020 11:58:07 +0000
Received: by mail-wm1-x341.google.com with SMTP id m3so1038797wmi.0
 for <linux-riscv@lists.infradead.org>; Tue, 10 Mar 2020 04:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OQiy11R8ysMEMVGnnlAJfpm5twl5UBWdAasXal19OYo=;
 b=lNAHNZVGXmPO35wIINL++rLZX/jYpmztZgeD1jSNPV6Jlc2eykKFHZ5oQKQ2hWxyBP
 huSBKGQ13oew6/XIInKAYKNJ1GYvSO87HEvPRPMeAuur5AQeghPUVL5yajtSKn6bLcfv
 2N/iRxSo7EAdMkGB1bdsDVouVmllVu8irasDTyNsDzOgCec7ky5SstDeFoHo3ri6IZ2p
 G0jMtN+NODGTkB9YD0H447dKAI2mjDq9Ef9oOmtEuMp8SIDo+FSf+FS7vfMnErMZc56i
 kCwNaWR0psN2jdB9u6n6ksOItDwDiVIJ5e96T1YlKCyFsdTKFEnHpN8bfjZwOBMU5kth
 e/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OQiy11R8ysMEMVGnnlAJfpm5twl5UBWdAasXal19OYo=;
 b=K0Y48vhKMCKLYUueRTBonecRe4C/epu4HigbtlH3gw6+Ok95e80G4ru9kOBjbBMXv4
 Wtqo1a70bw/wmurAoZRAsXLJoAfHTB5LCTd/iYx+MB3Iqxqkc9VOsoKu7rPncS+aV1q1
 51qi3lY0L++MqDOPEefFNRuMfjgiU+BFIQRQkTVkniRJ57Nj32By3vloREsKlxR54YRZ
 FLtboQ4zzXv4GcWzjuaUk1OuJZ4RoRedlOBnHhCBJpaV+8NXgb+iQnxczB9+19pkOyqu
 +Ir4Ln8EiEwCDnxW2iu595JJDj4VltS94ZrLUs3LiM1RU7vGHqgK0fvnb7mV7AGYsB3m
 jkww==
X-Gm-Message-State: ANhLgQ09zYodp2XmvBZ2Zawy7n5nTFO0/xXF2hdUvOnQPmDMSDvJPX5i
 JHnM20f9BzCSv2Db/RwrlZ3VirJO9xUJ+qg5HPQj0B8CeZ8=
X-Google-Smtp-Source: ADFU+vskX+jRObHtqozavxpi6rHnvu1BAyDctR2GYm1m3OykqFIMf7pilcQrBc32lRRcbc5mkSLG7EBZYzYDLFFPdRk=
X-Received: by 2002:a7b:c4d8:: with SMTP id g24mr1927337wmk.78.1583841484223; 
 Tue, 10 Mar 2020 04:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <20191125132147.97111-1-anup.patel@wdc.com>
 <20191125132147.97111-2-anup.patel@wdc.com>
 <mvmh7yx4z2u.fsf@suse.de>
 <MN2PR04MB60611C6CE40C024E336C8ADC8DFE0@MN2PR04MB6061.namprd04.prod.outlook.com>
 <mvmmu8objdr.fsf@suse.de>
In-Reply-To: <mvmmu8objdr.fsf@suse.de>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 10 Mar 2020 17:27:51 +0530
Message-ID: <CAAhSdy0Ctq=qF-tYwwBMoW6LbddDt7+oDDT6SgdAR2HCKqbAgg@mail.gmail.com>
Subject: Re: [PATCH 1/4] RISC-V: Add kconfig option for QEMU virt machine
To: Andreas Schwab <schwab@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_045806_042152_11F9611D 
X-CRM114-Status: UNSURE (   7.33  )
X-CRM114-Notice: Please train this message.
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Christoph Hellwig <hch@lst.de>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Mar 10, 2020 at 3:51 PM Andreas Schwab <schwab@suse.de> wrote:
>
> On M=C3=A4r 09 2020, Anup Patel wrote:
>
> > Perhaps selecting DRM and NET_9P from SOC_VIRT will help. Can you
> > try and send patch ?
>
> No, the config option should be removed.  It is useless.

It's not useless. Going forward, we are adding SOC kconfig option for
each supported platform.

In case of SOC_VIRT, we over-selected all required VIRTIO drivers.
Instead, we should only select essential drivers from SOC_VIRT and
enable the rest of drivers via defconfigs.

Regards,
Anup

