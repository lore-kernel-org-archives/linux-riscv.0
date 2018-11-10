Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17887C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 17:43:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD7E120854
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 17:43:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GBmHF8tG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="plud3BPy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lkcl.net header.i=@lkcl.net header.b="AXT9W1oY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD7E120854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lkcl.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HMzUWR4O0FA/vHYciF8Zxid4mqyIFT9iJj45RsEIzoE=; b=GBmHF8tGfnScs4
	UAVM0iRbtqY7NFfZ7U6/5bLaCeaAeo8F09ppC9cIgBK3wUmFG0KB3DCkiXdrFzdUBvoMWWYncOQMp
	47MQthJqleRixVvAmrv0Z9c5xM5MpkOfbGz/OlPxlxJF65A1n7Fw9IWoGsTx5NEDKBZj5MJEl/NQP
	cr7lT6tES+36ytwOTOOpd0HV1jbRpxS0rc8ERXVWNdQWfA6yCXmx2SXY2MNoSpkCnQrMXngSL2/Za
	GN+X0LPaqvybW9H2zsQAtaCVwC7vG6yt597jhZiwM+j/br0+QAyAyDPo3jYQ9DAvP4QYYmRxWzk0u
	65zPapWaWFjgCWDPpTWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLXI7-0005WC-OB; Sat, 10 Nov 2018 17:43:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLXI7-0005Vu-02
 for linux-riscv@bombadil.infradead.org; Sat, 10 Nov 2018 17:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XdBhzLXBD5MsGGeRVjc/5S98w1F6/IPwcy9jZtlDuAs=; b=plud3BPysUpN2z8Ss6MP52Zob
 TV4FTbqpp7ixqdSzFaDXZQS5xQECmtZUkcHnQ8XmU3KQ5zEdWQUDiISd3MkzVKFwQ2PZUih/EZlZ6
 w/f4Ee0ydfKf7D2UDRbruoTPC0//cfIXyPMtss8HyBkgz7NZvZEVuKAqRnOkArcqyarf8Rwmq/m3F
 I0NbNLygHgMIS8QDkCKAVw9m7H2RhMav3n1dnYshC9pg6HyBURZ3whqamOSIKKtALiqB9ZowflEzj
 LqKrIs9Ac4OopgAYDtzWEZY069q8srq0Ix2ah5jvOA9BWaao2qeoe4oTjY4FeAzkjnN11zPOgISXW
 4jxQe8Qrw==;
Received: from lkcl.net ([217.147.94.29])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLXI4-0001K4-8U
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 17:43:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lkcl.net;
 s=201607131; 
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
 bh=XdBhzLXBD5MsGGeRVjc/5S98w1F6/IPwcy9jZtlDuAs=; 
 b=AXT9W1oYt9UEHWBLB1Lv4wzL+ac64yg3ptgq1aKP6bjUSR94m5v3zsJ1EFxPw+DPtvQDvm3o7kbq3zL+qtt7qWDJcSzbd4N70ye++S9wrE/kwzBC+JaBCkdwfn6thlVyzLedzu+JNORV92L7XbeimT3zbtpRDCW9TcYu5pYfQDU=;
Received: from mail-lj1-f169.google.com ([209.85.208.169])
 by lkcl.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <lkcl@lkcl.net>) id 1gLXHt-0008Cn-GI
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 17:43:13 +0000
Received: by mail-lj1-f169.google.com with SMTP id x85-v6so4231588ljb.2
 for <linux-riscv@lists.infradead.org>; Sat, 10 Nov 2018 09:42:52 -0800 (PST)
X-Gm-Message-State: AGRZ1gI7lNIqT4VFdwDs1s/fmJOWx9RH6H7zg9FZXL8Ai5ln5IxDmKvO
 FUxIYglTcHCTq0AQHHeIXhP0/gdZenUJ/6QhwR0=
X-Google-Smtp-Source: AJdET5fbzYj7cUum03P/BaxO/GMJqBiUs54/Vna25FKIkO1/oFn1MPjsMPy/tpCGl/FWev3QAvbLTFIa5z/Recs/Uy0=
X-Received: by 2002:a2e:2281:: with SMTP id
 i123-v6mr7219396lji.154.1541871767176; 
 Sat, 10 Nov 2018 09:42:47 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <CAEz=sokxTJk=0EnRnLeG6LkaZiW-Dr4nmz=2JDgZm893NM-adQ@mail.gmail.com>
In-Reply-To: <CAEz=sokxTJk=0EnRnLeG6LkaZiW-Dr4nmz=2JDgZm893NM-adQ@mail.gmail.com>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Date: Sat, 10 Nov 2018 17:42:35 +0000
X-Gmail-Original-Message-ID: <CAPweEDzZGEi87o5bBPeU6c7qHCtCJNcOHL0Uz1uUOPQak56X_Q@mail.gmail.com>
Message-ID:
 <CAPweEDzZGEi87o5bBPeU6c7qHCtCJNcOHL0Uz1uUOPQak56X_Q@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: Samuel Falvo II <sam.falvo@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181110_174324_314525_FCB1AB59 
X-CRM114-Status: UNSURE (   7.78  )
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
Cc: mark.rutland@arm.com, hch@infradead.org, Damien.LeMoal@wdc.com,
 Olof Johansson <olof.johansson@gmail.com>, alankao@andestech.com,
 abner.chang@hpe.com, atish.patra@wdc.com, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 zong@andestech.com, ron minnich <rminnich@gmail.com>, sw-dev@groups.riscv.org,
 paul.walmsley@sifive.com, mick@ics.forth.gr, Alistair.Francis@wdc.com,
 linux-riscv@lists.infradead.org, Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110174235.4FEINuQxt7t2PZX7kWYeFOv4fz2tDUpPS8og_ZY9S8U@z>

On Sat, Nov 10, 2018 at 5:39 PM Samuel Falvo II <sam.falvo@gmail.com> wrote:

> on sat, nov 10, 2018 at 8:46 am ron minnich <rminnich@gmail.com> wrote:
> > which is why i'm a bit unhappy to see this (to me) cancerous growth in
> > proposals for m- mode code. ppp in firmware? really? multiple serial
>
> i'm inclined to agree with the overall sentiment of the concerns
> raised herein (omitted for brevity), but i feel that it might go a bit
> too far.

 it's also not an appropriate argument.  nobody sensible would port a
POSIX pppd from userspace into boot-level firmware.  the argument also
ignores the dozens of other advantageous potential use-cases.

l.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
