Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AA2C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 16:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z1+88EQC/CWRHwS2oozas1XBwntmdnGLA7zFquVdcx8=; b=V/n2XyGgQBTRYS
	4psiPUlsZ44+QsUEPymo7RvCEpYjxtH9O7UGASY6zrA/0lSMJs8vQDyzOArTpn1Mvc4bNMX02dNGl
	GkpDj8DKeas6EkYe82QTzjk18JIG+aml2k9m2yNUOG/cQ10qDbElbJkVK/oT3SYB0h2WlChS3vweM
	8TvhXGokyUOYhDdnb817oUZDIZJm1yAhD1lQTv5eUFBcNhFwo6e8Jmyy69fU2dluGPt5sQuTOqO/f
	ZPGhhefCB6wxaHuQhS1NpsjHcvSWoCWwCBXRYGVo9n8AbcKX+O+GW1tix9r1bBFKNYmJB8ZlzzTdN
	2PIE6qBh9lE4ll7HkC3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oybk3-000PLX-B8; Fri, 25 Nov 2022 16:39:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oybk0-000PHj-EX
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 16:39:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2FCE462535;
	Fri, 25 Nov 2022 16:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D942EC433C1;
	Fri, 25 Nov 2022 16:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669394389;
	bh=jx7YAZQQ7nQQsbp1quyVRbsFLa3/xg05WiJWtHPdKHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ti3tcdu1R1NnbGKN5pQ7wyNEDruOhpvneZayJHyyZcRL4ll+540ANujMrSzp69PCv
	 SfUXQdzpjRAZB2U3It0OdJuhMPSh/oDcbRCy27Dwa6IRAoDk9tdssLzGOppXXwYVte
	 w9lI2SteD6Ev36ebEvw/mEzhJK3P7qIcmUPLYVyorvmexl2OzKie+VJKGLPerTSRBG
	 5ejJTPaLiI4CYCpMqm4CBq2RPYwjfIp2r2+Y8wM4r+p+LH3w8SH8GDWFE4UlUEBpQe
	 QJCCVyHbH6b54wz/TL1xj47vHH3FjP/52y4H5UkhHVu4vjDnB0riIxu+gaAlntovpz
	 6XvK02OlbXAEA==
Date: Fri, 25 Nov 2022 16:39:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, emil.renner.berthing@canonical.com
Subject: Re: [PATCH 7/7] RISC-V: add zbb support to string functions
Message-ID: <Y4Dv0Vfz6AAg/X19@spud>
References: <20221110164924.529386-1-heiko@sntech.de>
 <14728581.RDIVbhacDa@diego>
 <Y3/xGhkbf6qEr+5r@spud>
 <3259590.VLH7GnMWUR@phil>
 <20221125074933.2xuyaeuk5kmi5miw@kamzik>
 <CAEg0e7h9skbWPVDsz9CdB8dATN5XM9eT-uPY0A7xRZmX=qTU6A@mail.gmail.com>
 <20221125152821.ytipefad7oxv733t@kamzik>
 <CAEg0e7g132REPxisSFJZorXbSqzb4q1Tj7FC8G9pDMymt0qZuw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEg0e7g132REPxisSFJZorXbSqzb4q1Tj7FC8G9pDMymt0qZuw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_083952_575572_6DF9252C 
X-CRM114-Status: GOOD (  13.32  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 25, 2022 at 05:35:39PM +0100, Christoph M=FCllner wrote:
> On Fri, Nov 25, 2022 at 4:28 PM Andrew Jones <ajones@ventanamicro.com> wr=
ote:

> > /*
> >  * Each sub-list is sorted alphabetically.
> >  */
> > #define S_EXTENSIONS                                                   =
 \
> >         __RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),        =
 \
> >         __RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),                =
 \
> >         __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),          =
 \
> >         __RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> >
> > #define Zi_EXTENSIONS                                                  =
 \
> >         __RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),            =
 \
> >         __RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> >
> > #define Zb_EXTENSIONS                                                  =
 \
> >         __RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZICBOM),               =
 \
> >
> > static struct riscv_isa_ext_data isa_ext_arr[] =3D {
> >         Zi_EXTENSIONS
> >         Zb_EXTENSIONS
> >         S_EXTENSIONS
> >         __RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
> > };
> =

> It might be worth to look how Binutils are grouping them:
>   https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblob;f=3Dbfd/elfxx=
-riscv.c#l1261
> =

> They also group extensions together but use the following groups:
> =

> const struct riscv_supported_ext *riscv_all_supported_ext[] =3D
> {
>   riscv_supported_std_ext,
>   riscv_supported_std_z_ext,
>   riscv_supported_std_s_ext,
>   riscv_supported_std_zxm_ext,
>   riscv_supported_vendor_x_ext,
>   NULL
> };

I think in this case, Drew's differentiation between Zi & Zb is an
improvement :)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
