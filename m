Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D436C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 18:03:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60E5E20840
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 18:03:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rlJupP+p";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="PxXMKJzi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60E5E20840
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1JYBhDrMyP+JHymWoyUXlAMaDRGfhvmhkBV//54J37g=; b=rlJupP+pOHbrC7
	9pH21dVy8Ju1E255L8RW5kX76LYH0L0UiJ8ogvoz06Kk7ciZZs+D+/vimdGqx5A/40z95Z7MtYEYn
	HWrccKZGx/9Wj3+QrDMvmaLKtQksc4y3UXjPj81+6lQIxgt39dkUEH7gDwDfbOmiD4QTfxd222dwJ
	O9aH9cjFoym4vTA4A7T8TaYLdQer0bqLRxRRYiKobRLIIAlcDfZTG8ttHrKqjrkbxn3Wo145p329z
	Or3Wo/zSvK6GUe8kp+XVft1YYDJCXAhIQjPc1Zue7lZxi6sfqSWYlIoJYUH5GMSUP7LGbWCe/sK5/
	SYTnrpham6HAARR5FGQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLXbL-0004ra-Ne; Sat, 10 Nov 2018 18:03:19 +0000
Received: from mail-it1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLXbI-0004qw-PA
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 18:03:18 +0000
Received: by mail-it1-x142.google.com with SMTP id p11-v6so7116014itf.0
 for <linux-riscv@lists.infradead.org>; Sat, 10 Nov 2018 10:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=02hbfiqyzj3si0jEa+BiQxfX+8CzkjezNbWr91jpwdY=;
 b=PxXMKJzideJIvct5k1ZHxnKT1h2MpcC7L9cWRZOSuk8KrgxOoONCP/p7zaqISrGN7v
 7wuh9i94A7+McqUbWYEYbp4UKMcsmc7ataPzPE7PzU6EfEDfrv9C/oyr3KGNn90Cp27s
 b9pD4awGI7Iz1rLooIDnu2zl4arwcmFx52YNSGXgtxSggD15T2FqgZddhBeWb5tcPqnq
 eiq8xukSU+rXCd1N23uSjGRt8ZiJFdikC67kCy3efEVOT3UyGtxcRYzwC8wczZqtpfgD
 ePYhx+qgDFCaLDpTbubrbOgXaOelWnPub8IXNH5ACXokuop3Sg7vlha8qocsR19FIdbf
 JpJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=02hbfiqyzj3si0jEa+BiQxfX+8CzkjezNbWr91jpwdY=;
 b=RfjHeWb//C41EfTw6ni1zQwDMIE5VDLkFSqCO33yyvenru0zFBWRnnIiG6i6/GIyQy
 e0lV/e6Hy1m9ZFjrbau49lTHi1iy0kaJDBavgXWi5ldGcEAaOw+Zkg44lEotVUmHDIXl
 4oTlDJzoGqDl077ApJ0TM2texpzttHom4yOzDNiDuMuEYolI2HC6q3Pi80rbZO9AGnJP
 7SYIFC3jtgJKF0btb8qhlgbjQj/igz5IFSSbEbzBt8A0AlqHQY20jd2tqpfmuf+csb6b
 lj3b5ogcwyvgWhrqVr3J0A2zSQPEL7ZatRxVlVm9+Kf8ZSz3WtAmyKw3kOgqfvrIlBc0
 +TGg==
X-Gm-Message-State: AGRZ1gJAa9fldXQVsXM94ISEs9gPP6bvFOh3p73NDTs9/o/0yaMNAE+a
 zmYQYXXg/EOiNZlCT73aeNbOSfVdGGwZJQ+Edv1sgA==
X-Google-Smtp-Source: AJdET5d8zzD2H86lbr9OHOJeOombyHa3kQAqkOtR3JUz5fOiiHO1CuPbNQqQ4PFwvTL8Ox1GuiKFcggMH5OoSNbiLrE=
X-Received: by 2002:a24:39d8:: with SMTP id
 l207-v6mr6085633ita.103.1541872985736; 
 Sat, 10 Nov 2018 10:03:05 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <CAOesGMjVFGLfqVqmsK6V88cdTxmN_CAEhDey8nxKOeTYHC69jA@mail.gmail.com>
 <CAPweEDwDApbFofs689xvPBjoqODCeMyaYQWpgo3CuqSjQjYTvw@mail.gmail.com>
In-Reply-To: <CAPweEDwDApbFofs689xvPBjoqODCeMyaYQWpgo3CuqSjQjYTvw@mail.gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Sat, 10 Nov 2018 10:02:53 -0800
Message-ID:
 <CAOesGMic7iV69zeBFPDo6P+WwSGcogKG1DE-rOS_U9VCoC209A@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: lkcl@lkcl.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181110_100316_817107_CC874AB1 
X-CRM114-Status: GOOD (  10.46  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Christoph Hellwig <hch@infradead.org>,
 Damien.LeMoal@wdc.com, olof johansson <olof.johansson@gmail.com>,
 alankao@andestech.com, abner.chang@hpe.com, atish.patra@wdc.com,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 Alexander Graf <agraf@suse.de>, zong@andestech.com, rminnich@gmail.com,
 sw-dev@groups.riscv.org, paul.walmsley@sifive.com, mick@ics.forth.gr,
 Alistair.Francis@wdc.com, linux-riscv@lists.infradead.org,
 Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110180253.7kn6xhdKfUjhcLziKo0ECOsPuov0y8ts23jmXjPxpvs@z>

On Sat, Nov 10, 2018 at 9:47 AM Luke Kenneth Casson Leighton
<lkcl@lkcl.net> wrote:
>
> On Sat, Nov 10, 2018 at 5:42 PM Olof Johansson <olof@lixom.net> wrote:
>
> > The case of console is in this case pretty simple: It's intended for
> > early boot for very simplistic environments (before the rest of the
> > kernel is up, etc). Keeping the SBI console around beyond early boot,
> > and somehow trying to optimize for it for those use cases is a
> > misdirected effort; that's what native drivers are for.
>
>  spike (which is only around 7,000 lines of code) doesn't have native
> drivers, and qemu is too heavy-duty to consider adding custom
> extensions and experimental research onto.
>
>  with nothing in spike *other* than the serial console, it's the only
> way in and out.

I'll repeat myself:

"trying to optimize for those use cases is a misdirected effort".
Trying to optimize your experience on spike at the cost of simplicity
for everybody else is the wrong thing to do.


-Olof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
