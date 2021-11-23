Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CEAC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 05:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TLHoH9ZaDiJYTLKQ4zSTu1onNV2dvteduhs22kOLIdc=; b=anX9hScL0prUMz
	QnfOCcKghE511RZmFyVbg4WR7LUMiiaFgH3RjqKBW43CQetGLfqYvxFrJ+YhM1hko0wPSVs99cH+d
	a7DQGfWwhKos0wsjcoLDg7N2Wj7Ty5UDEjb171rISxNbyoSf08E0DEWM9Q3Jx2dw0s57bie75Dgvr
	4N5e4wsXxWsGgb/zOag1e2SphRZ+99bPuqK16FFxAyTb0LDGmjLqPAUQ+TD0s2Vqyfre7B/Srk2Qa
	Kcezu16vYEkSECRb1DJExNmyfapJyjOO6AjKxo1iUMPMHEgGQj2iPbxAx4Ez9FLOVGkZnocIzfgET
	tQPFHxgd59xtK4ZqR6rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpOFq-000ru7-1p; Tue, 23 Nov 2021 05:22:06 +0000
Received: from forward105p.mail.yandex.net ([2a02:6b8:0:1472:2741:0:8b7:108])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mpODq-000qwD-Ja
 for linux-riscv@lists.infradead.org; Tue, 23 Nov 2021 05:20:06 +0000
Received: from postback9j.mail.yandex.net (postback9j.mail.yandex.net
 [IPv6:2a02:6b8:c04:1d2:0:640:7751:c20b])
 by forward105p.mail.yandex.net (Yandex) with ESMTP id EAE7C2FD9A92;
 Tue, 23 Nov 2021 08:19:53 +0300 (MSK)
Received: from forward500j.mail.yandex.net (forward500j.mail.yandex.net
 [IPv6:2a02:6b8:0:801:2::110])
 by postback9j.mail.yandex.net (Yandex) with ESMTP id E6D673079330;
 Tue, 23 Nov 2021 08:19:53 +0300 (MSK)
Received: from sas2-40eae758d8fc.qloud-c.yandex.net
 (sas2-40eae758d8fc.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:b7ac:0:640:40ea:e758])
 by forward500j.mail.yandex.net (Yandex) with ESMTP id E16276CB640B;
 Tue, 23 Nov 2021 08:19:53 +0300 (MSK)
Received: from sas8-b61c542d7279.qloud-c.yandex.net
 (sas8-b61c542d7279.qloud-c.yandex.net [2a02:6b8:c1b:2912:0:640:b61c:542d])
 by sas2-40eae758d8fc.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 ZOzHQ9eGyR-JrB4e2fC; Tue, 23 Nov 2021 08:19:53 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1637644793; bh=Vb2AIuhJchGaauEfEDqk4E+0CG798zSz0ntMMkKJ6UU=;
 h=In-Reply-To:Subject:To:From:References:Date:Message-ID:Cc;
 b=j8zz7z03iX0mi4Ry5RFrtXPR1E+iaCmtCoeDAHInElipe4KoL/Xd/eF4Ol9dSL9rA
 y5hoUVGVnTbjeqeUhXyUPWRKe+2txKHqbhZx6f5sDv7YFllfBynADZ8ns8Ksj+AsAH
 PpwEQ+78vIOxT9IAXwxqvTkjroRUEDL41X3VgxiY=
Authentication-Results: sas2-40eae758d8fc.qloud-c.yandex.net;
 dkim=pass header.i=@maquefel.me
Received: by sas8-b61c542d7279.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id wptQ8kaY6P-JqxSJUkj; Tue, 23 Nov 2021 08:19:52 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Date: Tue, 23 Nov 2021 08:19:51 +0300
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: =?ISO-8859-1?Q?Jo=E3o_M=E1rio?= Domingos <joao.mario@tecnico.ulisboa.pt>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 atish.patra@wdc.com, anup.patel@wdc.com, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/4] RISC-V: Added HiFive Unmatched PMU events
Message-ID: <20211123081951.441e50e4@redslave.neermore.group>
In-Reply-To: <20211122152408.GB10739@joaomariovmubuntu>
References: <20211109102555.16381-1-joao.mario@tecnico.ulisboa.pt>
 <20211116154812.17008-1-joao.mario@tecnico.ulisboa.pt>
 <20211116154812.17008-5-joao.mario@tecnico.ulisboa.pt>
 <20211117142539.30fac060@redslave.neermore.group>
 <20211122152408.GB10739@joaomariovmubuntu>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_212003_545919_BA752EEF 
X-CRM114-Status: GOOD (  15.46  )
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

Hello Mario!

On Mon, 22 Nov 2021 15:24:08 +0000
Jo=E3o M=E1rio Domingos <joao.mario@tecnico.ulisboa.pt> wrote:

> On Wed, Nov 17, 2021 at 02:25:39PM +0300, Nikita Shubin wrote:
> > On Tue, 16 Nov 2021 15:48:12 +0000
> > Jo=E3o M=E1rio Domingos <joao.mario@tecnico.ulisboa.pt> wrote:
> > =

> > Hello Mario!
> >   =

> Hello Nikita!
> > > +  {
> > > +    "EventName": "UTLB_MISS",
> > > +    "EventCode": "0x0002002",
> > > +    "BriefDescription": "UTLB miss"
> > > +  }  =

> > =

> > I don't see such thing in FU740 v1p3 manual - am i missing
> > something ?  =

> You are absolutelly right, there is no reference to the L2 cache
> (Unified Cache) TLB misses event in the FU740 v1p3 manual. But
> considering that the FU740 is composed of 1 S7 and 4 U74 cores, I
> used the U74 core complex manual
> [https://www.starfivetech.com/uploads/u74_core_complex_manual_21G1.pdf]
> as the source for events. Did you test the utlb_miss event, and does
> it work in your board?

Thank you for pointing this out, it works indeed. Unfortunately not the
first inexactness in the FU740 v1p3 manual.

> =

> Best,
> Jo=E3o M=E1rio
> > =

> > Yours,
> > Nikita Shubin
> > =

> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv  =



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
