Return-Path: <SRS0=nw+9=RD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D40CC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Feb 2019 12:20:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31F3B214D8
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Feb 2019 12:20:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dc08Hogx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="JYF2mVKb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31F3B214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l+MpABjEK3GOadSKoVfzLFP4SpPRV1gp0pJSdsDfFI0=; b=Dc08Hogx/VsoUCAcuyuumOpaB
	CmZ7oxZgwnMtZGLPqgeLc1ELuR118vEw2vSsL6TrfeagE45oisZ6SwUhlTtHgVtDCUkJa223iqis1
	I6h4sRE8y/CUbic2Ayn3PKGQrwxoUXwyLsFr0LH3Y7uyShDcGSMKVGNY5oPRJtYO4id9wUEc87W+w
	aN8AuAcNK809D6mm36BvFingfySLr8Gwk5IDY/vrL+ANzjvF2aoxUqvw93YVRLQwq3PZauO3vYLGh
	hibaiamPy+fJaTDLRP23z2M0RSnIT28oFA98pvRjFtezhSns1Adu17HswCPlK49K6oJBgh8qsanZ7
	P1iks1jzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzKft-0000pq-Ta; Thu, 28 Feb 2019 12:20:29 +0000
Received: from mail-it1-x136.google.com ([2607:f8b0:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzKfr-0000pX-E7
 for linux-riscv@lists.infradead.org; Thu, 28 Feb 2019 12:20:28 +0000
Received: by mail-it1-x136.google.com with SMTP id f186so7632878ita.0
 for <linux-riscv@lists.infradead.org>; Thu, 28 Feb 2019 04:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=ffY/2jIMWPT6RRgg/iMHd59fWbwe8QDlDlvtaPFICmc=;
 b=JYF2mVKb6Ivc60Cs0EdxbogBvYjM2oRs5oAzG+kBZ3pVIBn0e2ApY6VyBveGlg2oQJ
 GGYU+ktxSBDq21RsTf/43GsjW4YngV5ptmlTqyplRFjGLIVTSrbM0Mq2JeFpuf8J/Pj4
 p+ZssimVd3fOtjlpE/smOg9lYHcniy97jNvCPbOyTW73PDVhdFpbIjq7Xhl39DeufBsR
 EaLpo2ydGbHTfF+W05Vo+ZOxlZOs8IBkYkp0950ptCa7E/0qOY1vdyFe2CNUOWHhp5gy
 VEq/nDb3ZOYSx9kvjy6niWk1Y2i/MY53rT0D4TMzsz2uXVwTMPQ8AodkMc5KMSAEmCss
 oU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=ffY/2jIMWPT6RRgg/iMHd59fWbwe8QDlDlvtaPFICmc=;
 b=FzAkeKoyfCqEjtzAKMN15NCljyHIukYSd57uQb32c3oXfafVZr6yD0FBmb1B6iZwsL
 2YAGj+0LJ9L/osXHKnCvT6surHf9H6D/ZOSywxGSnh3ONZ2DqixzcZeadYtD136wonT6
 hE0QKwouTpn1dp7bcS5OfVe2xSAf9fz9HciARA4GD0QDAPKVhBHSY+MDt0AltwCFk3to
 Xz2DT0h5ccVAlrNHUuFSyZlTz6KfgaKVBVVBpvjFGq4rZgiEH5miVmFj/sjZlOTJRkHg
 UF/uiwGz81GsA3OsZOpdLTagvY9952G+IlW1gbMP8vyJVVu3aXC5zm/1kboOKXxTt0lU
 QrpA==
X-Gm-Message-State: AHQUAuazIYknygYae+qFByz+p+cF8A9DMeM5oI3D1bvf3sDLTmeOV0VM
 ifqYMJTmTv4LecJiaeQcpBGYNg==
X-Google-Smtp-Source: AHgI3IYKrGmDUNy+k1Me6j8cd1Xl82OiA+ZHsWMj035t5HDhrsMEIkIsKg732fLjpDWO4yjSjdA7sA==
X-Received: by 2002:a02:e04:: with SMTP id 4mr4410852jae.75.1551356424610;
 Thu, 28 Feb 2019 04:20:24 -0800 (PST)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 e5sm2709103ite.33.2019.02.28.04.20.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Feb 2019 04:20:23 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Thu, 28 Feb 2019 04:20:23 -0800 (PST)
To: Christopher Lameter <cl@linux.com>
Subject: Re: per-cpu thoughts
In-Reply-To: <0100016916c7cda0-9622bc7c-b8db-4967-83e6-43692aa58ec8-000000@email.amazonses.com>
Message-ID: <alpine.DEB.2.21.9999.1902280418110.10847@viisi.sifive.com>
References: <mhng-840b0a81-50e1-4783-a784-638195b9305b@palmer-si-x1c4>
 <0100016915bc54e5-22f89b41-21e8-4133-9550-e85f4223ea32-000000@email.amazonses.com>
 <2acd8a4393d4e9c526bcfa4aca63e4cf@mailhost.ics.forth.gr>
 <0100016915ec5184-5c0a50db-1b61-428f-ae2c-d23ce8d465d5-000000@email.amazonses.com>
 <CAJ+HfNidsF3Lnx4s4sG+=Zmt95JYScg+BKB5=u6wMUoSkHo5FA@mail.gmail.com>
 <0100016916c7cda0-9622bc7c-b8db-4967-83e6-43692aa58ec8-000000@email.amazonses.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2068049845-1551356423=:10847"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190228_042027_492172_1311B0A3 
X-CRM114-Status: GOOD (  11.93  )
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
Cc: Nick Kossifidis <mick@ics.forth.gr>,
 =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>,
 Paul Walmsley <paul@pwsan.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2068049845-1551356423=:10847
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 22 Feb 2019, Christopher Lameter wrote:

> On Fri, 22 Feb 2019, Bj=C3=B6rn T=C3=B6pel wrote:
>=20
> > > The problem is that the register needs to be referenced by the amo
> > > instruction. Can amoadd increment an address relative to a scratch
> > > register?
> > >
> >
> > It cannot. So, we'll end up with (at least) a preempt disabled region..=
=2E
>=20
> If we need to do that then we already have so much overhead due to that
> processing that it may not be worthwhile. lc/sc overhead is minor compare=
d
> to switching preempt on and off I think.

Is it strictly necessary to disable and re-enable preemption? =20

On a UMA system, it might be preferable to risk the cost of the cache line=
=20
bounce than to flip preemption off and on - assuming there's no other=20
impact.


- Paul
--8323329-2068049845-1551356423=:10847
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-2068049845-1551356423=:10847--

