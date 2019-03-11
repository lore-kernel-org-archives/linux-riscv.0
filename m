Return-Path: <SRS0=WyFe=RO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A209BC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 15:27:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73C3520657
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 15:27:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QKcVEpgj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ImTL5S72"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73C3520657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GMn3xycD6aL4SWlAuL0jXu3icslQ1GDtx6n36dgP5YU=; b=QKcVEpgj2SFP25cERrM2eLqBV
	n6q3KEzUYouQZB2iy6JWadwzT03KN+ZnK5lDkxGf7PRLdl1ht3D5Ghd7gY6UhX250dxk6x+V9/pg3
	CDU+1hdjVbHVZvwjlvT3DAZGpb2VrjcGA6SICLcC+j1kJelkELWQ1xqRkuz2K2d3q2z7v5HUCXBQL
	Nz/cBikk3Y3kw80DqCKevlIPPJXlPNx00l78odJ1oZCrTI1ri48vhowXBM4FjsfBnL1vq3JvviAiY
	8Wp3h7km9i2SccRZjL+/cz/vdt4T3l3u0mjcYir5x2xzKTPG4e9CwJpScJ2+KGLTDYhfMucMhB56x
	V7Ji7udeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3Mps-0003Yh-HM; Mon, 11 Mar 2019 15:27:28 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3MpD-0002cO-Nz
 for linux-riscv@lists.infradead.org; Mon, 11 Mar 2019 15:26:51 +0000
Received: by mail-io1-xd33.google.com with SMTP id v10so3025442iom.8
 for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2019 08:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=0ttit7/wQ8izHC2qLTEC3mkGjM7cekN5ykWDUHguJcM=;
 b=ImTL5S726jZ2G6bz1i7QcxHwStGvz57d//TBZUMkJLeL+odEOHC591xg4McHLiXZYk
 6xl5bsPQhBeQK0s5TSxIEL0ii4qiLHDgf5nD699AZPf4oNuxSS81rr6cKuWWTpnofhez
 hf1KTuNASLIUS+TdeBwoHIpFAMiB/+MXTpona0zTbowhPTreQB/fItp3m2Q8hTlOlJFj
 qJxtrCyT+Ef/6gxyIMMON9++7scLeG7eT1kyUpsp/EL0eEJf2JKC5eiyFGTxvvtQRgOy
 J731Y/HlWIhb9lagEJAm1IKTfqnNeZVYzhLECSOmIMOC6Gl/qocjOcD7rgekn2cDZt0D
 daRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=0ttit7/wQ8izHC2qLTEC3mkGjM7cekN5ykWDUHguJcM=;
 b=ZjdxILt20FpdYVkv4Hf2Ad21jIG7n+vSX2qVjtmZkknsOKp4HmODBnNraQbWe+pcTe
 11XsqwSYXrongCVT7BQOeOgiAJ7QUy2dRY1r+x/h+FivRsWcUdiu2Dz2CLrjfbFny9tU
 /riUgLNnm6c89swfBmAkS9h72gzp/JjpsEan16Nh2qFRPSkUS1bfaxEQbn+ZV77d4Sex
 ldrV8Ww7VCfpvCFlHLxIXT0VgfNBrm66BocVv+tgeV55byq6Q4G5Wcc60EQHMfGQhfXA
 TJ5ToLKL88CitTPDv7TdnRqy5eZon4sIebTdWO0HnH/Ovl4IlcEJEc8BX0YlwlJQ78UO
 g32w==
X-Gm-Message-State: APjAAAU3BIOzF/IUCThE+9phZhgCF/igYVaswHsp1veDK5u2zcf1mV9H
 PkxwQO6kZekbpIfQWZK77lv7OQ==
X-Google-Smtp-Source: APXvYqytPiGcihgkHZQqC7a5OAu5V0O2+jsEMZ0afwCy5cMqPXoZFeBxZKk81/MdMzoAx9H/w3qT9w==
X-Received: by 2002:a5e:a908:: with SMTP id c8mr4620388iod.292.1552318006294; 
 Mon, 11 Mar 2019 08:26:46 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 197sm324114itz.24.2019.03.11.08.26.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 11 Mar 2019 08:26:45 -0700 (PDT)
Date: Mon, 11 Mar 2019 08:26:45 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>, 
 Christopher Lameter <cl@linux.com>
Subject: Re: per-cpu thoughts
In-Reply-To: <CAJ+HfNh6bc1A8vskxqJ9CP11aPdTgrPS2SOgLGXMLyefogFLtw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1903110814130.11892@viisi.sifive.com>
References: <CAJ+HfNgSx49dRXDdJGovb=auAjSB703bN9tULjibW1OKHuHcPg@mail.gmail.com>
 <mhng-79f13983-1ea9-4f9a-949a-87dac2060f42@palmer-si-x1c4>
 <CAJ+HfNhmUdz4y81VNnTOsvyvSNw3i3E=qR+F0Qa7XThSOAiJ1A@mail.gmail.com>
 <010001696d414b3a-d35fa0a2-01fa-4e8c-be57-ff703610755a-000000@email.amazonses.com>
 <CAJ+HfNh6bc1A8vskxqJ9CP11aPdTgrPS2SOgLGXMLyefogFLtw@mail.gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1962381554-1552318005=:11892"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_082647_944587_63455306 
X-CRM114-Status: GOOD (  18.08  )
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
Cc: Paul Walmsley <paul@pwsan.com>, catalin.marinas@arm.com,
 Palmer Dabbelt <palmer@sifive.com>, will.deacon@arm.com,
 Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1962381554-1552318005=:11892
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

+ the ARM64 guys and lakml

On Mon, 11 Mar 2019, Bj=C3=B6rn T=C3=B6pel wrote:

> On Mon, 11 Mar 2019 at 15:56, Christopher Lameter <cl@linux.com> wrote:
> >
> > On Mon, 11 Mar 2019, Bj=C3=B6rn T=C3=B6pel wrote:
> >
> > > > Thanks a bunch!  I feel like the best option here is to just use th=
e AMOs
> > > > without disabling preemption and ensuring that all other accesses a=
re atomic
> > > > (via AMOs or LR/SC).  The only reason I can see that wouldn't be th=
e way to go
> > > > would be if it requires non-arch modifications, as if we go down th=
at path
> > > > we'll be able to handle the performance edge cases in the implement=
ation.
> > > >
> > >
> > > Hmm, you mean AMO *with* preempt_{dis,en}able, right? (No, interrupt
> > > disable, only preemption.)
> >
> > If you disable preemption then you dont need AMO anymore. In fact that =
is
> > the default fallback generic implementation. Just dont do anything and =
you
> > already have that solution.
>=20
> But the generic one disables interrupts, right?
>=20
> I believe the rational for RV is similar to ARM's; AMO+preemption
> disable regions is *slightly* better than the generic, but not as good
> as the IA one. Or am I missing something?

There's been a discussion going on in a private thread about this that I=20
unfortunately didn't add you to.  The discussion is still ongoing, but I=20
think Christoph and myself and a few other folks have agreed that the=20
preempt_disable/enable is not needed for the amoadd approach.  This is=20
since the apparent intention of the preemption disable/enable is to ensure=
=20
the correctness of the counter increment; however there is no risk of=20
incorrectness in an amoadd sequence since the atomic add is locked across=
=20
all of the cache coherency domain.  Christoph, would you disagree with=20
that characterization?

There are a few outstanding points that we're trying to talk through, but=
=20
it should be fine for an initial implementation to start with the=20
amoadd-based approach.

As far as the ARM LSE atomic implementation goes, I'm not an expert on=20
those instructions. If those instructions are locked across all of the=20
caches for the cores in the Linux system also, then they probably don't=20
need the preempt_disable/enable either - assuming our collective=20
understanding of the purpose of the preempt_disable/enable is correct.

All this is, of course, assuming there is no secondary purpose to the=20
preempt_disable/enable that we haven't managed to elicit yet.


- Paul
--8323329-1962381554-1552318005=:11892
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1962381554-1552318005=:11892--

