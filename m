Return-Path: <SRS0=dvb3=PQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEAE3C43444
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 04:17:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2062206B7
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 04:17:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mrN9UhZv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="laMpxcBL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2062206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:
	Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:To:Date:
	From:Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=34mmBDo+/E6iNwhrvV01/X/UYhRcZKz1wE36DxIId3I=; b=mrN9UhZvF+Uu0cd8r5hpTiAOW
	3XerMXiRceutrsHPBARnODpZTM9wPA2ghPrcQZUPChaEAN5yX/TQL6S+KkqvZ3cvvMeH3FEsu8RYO
	R2SUT/FA+qgTeoDxTe02FMpSqHLCconi49WIM7oyYYi1w/34w3AGYbe9n1D5zbFB7bKiUBGbRW5kM
	uX53sIbbCjEHVaSDtU70ckhwrvGng2tfOcHyPG55a1Y3pkrVHPRfK/6xFCEdNn/Zily66RAMTivYD
	Q1VNq6kmIaSVQMwfe4NuQ0COX5+LIuMe05ygr6LtSTnoYWcp4tCf9E51PBQeZxNu3q7VpARs6h6Bj
	h+32lgFVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggipf-0003Z2-E4; Tue, 08 Jan 2019 04:17:39 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggipc-0003Yb-4h
 for linux-riscv@lists.infradead.org; Tue, 08 Jan 2019 04:17:37 +0000
Received: by mail-pl1-x641.google.com with SMTP id u6so1211289plm.8
 for <linux-riscv@lists.infradead.org>; Mon, 07 Jan 2019 20:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version:content-id;
 bh=KNahZzpC9tDVnt4XEqVQ70Gren/Y4tr/5PuxZjAepVI=;
 b=laMpxcBL8D56mj4RBAzt6QFRg4DQJKcRXSGdrEvO6oF3KART5PGHqnkNxpuFfnS9Jn
 /URwU7Bz52zNJTNU060pwioV0a6hQR4uYV5sVWFYd5clkanW0sw8eWaSkUAl/DuMNo1x
 DBWrplb66+Fl2twgNIH9EkOnCoMChEDHIL2gA8xIaEN1A52BrILXI42gCszXY5uzUHC8
 zUv1Z/+IzuDEmH2gypBGboJqdanWChpf8bQkIkaFiiRgSC8+5ZWYScrUrulnUHaUs7hw
 2eWJgkYneLu+HQcX/v2Rx3FSrzT3XZoTjKF2W4dZ4jArBYuxMXcZn1TYrj8djpp1Jla8
 /rpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version:content-id;
 bh=KNahZzpC9tDVnt4XEqVQ70Gren/Y4tr/5PuxZjAepVI=;
 b=ZMjeQ5XqL7GXFYuJHXsnWI3pdoJ4HsHreP31yD7aaavtO0/oNWbEjTMQnvxgh8xRAN
 96fjXLpWZkTafivLVFGv8gQJHxW1VmV40wLpzTqaKuq4ZeTEdRU00fJWltiawyyqlK1B
 u73BnKIk5WK6TwgBXrd4Bxo/QI74ObEuwqnJqbVxQaJdOkLG8wm67nkYXa+s7Da7Ad70
 Ob2y4X8Ah0uyWLpP6d16tY4HdFVlOceb4FvMfYXJo1eCtbWRwT2CMoZ6poGhsuRL4tMl
 gitg+H0WWB5Fq+sHd2nA2bYhbSsahOJ/w/o5Su6g1kGZ1h4uakzsw7b9xFJxi58qyQ1A
 FkDQ==
X-Gm-Message-State: AJcUukcbG2UXAZTLrIoWlRHyCA3cXKP7K5OXIe3CeXpzLPJCbetdeWSA
 Y9x51ixzfPiAsx99kwq7tIZKwg==
X-Google-Smtp-Source: ALg8bN7O6LgVBeX4WyNI56C0b5p9t+yOb5B2x7qWFYTFjb44Le3138OsulUyUd6zy5wmUTXVvja2LA==
X-Received: by 2002:a17:902:4:: with SMTP id 4mr246254pla.20.1546921053795;
 Mon, 07 Jan 2019 20:17:33 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id s2sm130937322pfa.167.2019.01.07.20.17.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 07 Jan 2019 20:17:33 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Mon, 7 Jan 2019 20:17:32 -0800 (PST)
To: satish kumar <gsatish.ldd@gmail.com>
Subject: Re: [PATCH] RISCV:IRQ: Adds Err column to /proc/interrupts
In-Reply-To: <CAK1XJzWreGAXY+1x=DGwcfea2Bz51DrYidXJGLiJg3g0UYRWPw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1901072013320.14547@viisi.sifive.com>
References: <1546696272-19152-1-git-send-email-gsatish.ldd@gmail.com>
 <alpine.DEB.2.21.9999.1901062233110.7801@viisi.sifive.com>
 <CAK1XJzUHgkSe9GODaUHH89b4XD0zW0EvO5RMzt5f7hpWiVsfNg@mail.gmail.com>
 <alpine.DEB.2.21.9999.1901071036170.11080@viisi.sifive.com>
 <CAK1XJzWreGAXY+1x=DGwcfea2Bz51DrYidXJGLiJg3g0UYRWPw@mail.gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1560531810-1546920877=:14547"
Content-ID: <alpine.DEB.2.21.9999.1901072017030.14547@viisi.sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190107_201736_247859_F23A3BA9 
X-CRM114-Status: GOOD (  14.14  )
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
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1560531810-1546920877=:14547
Content-Type: text/plain; CHARSET=ISO-8859-7
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <alpine.DEB.2.21.9999.1901072017031.14547@viisi.sifive.com>



On Tue, 8 Jan 2019, satish kumar wrote:

> On Tue, 8 Jan 2019 at 00:09, Paul Walmsley <paul.walmsley@sifive.com> wro=
te:
> >
> > On Mon, 7 Jan 2019, satish kumar wrote:
> >
> > > On Mon, 7 Jan 2019 at 12:04, Paul Walmsley <paul.walmsley@sifive.com>=
 wrote:
> > >       On Sat, 5 Jan 2019, G SatishKumar wrote:
> > >
> > >       >       This patch adds extra row showing error count to output=
 of
> > >       >       /proc/interrupts using seq_printf().
> > >       >       seq_printf() API is used when printing to /proc/ files =
as a
> > >       >       helper functions to return formatted output from =A1pro=
c_read=A2
> > >       >       callback.
> > >       >
> > >       >       It adds Err: row to /proc/interrupts
> > >
> > >       Why?  It's always going to print "0" with this patch.  Does the=
 missing
> > >       line break something?
> > >
> > > It adds extra info in the /proc/interrupts which provides  error coun=
t.
> > > It is used for printing information.
> >
> > If this patch kept track of interrupt-related errors, I'd agree.  But i=
f
> > it always prints 0, as it currently does, then there doesn't seem much
> > point?
> Yes, it does. This patch gives information of Interrupt error count
> in all cases .

NAK from me until either

1. the patch is modified to increment the IRQ error count when a bad IRQ=20
occurs, or
2. someone finds a common userspace tool that breaks if the "Err:" field=20
isn't present

- Paul
--8323329-1560531810-1546920877=:14547
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1560531810-1546920877=:14547--

