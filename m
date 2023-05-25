Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14622C7EE2D
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 13:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hm+KUqpQndLddS2FivwH8f83eCkI0ehF2EEG+teT64c=; b=G5TeHK7U6JSfvXSwU+zpVmvq/u
	AitnYsQ+HGlCMbWF643CYT+ucN0WTq/V+Cjli2rny2R5zNPxLiVAqkVwWi0H3tAW2GTyuUCZzZ2aC
	O5jdoxcxZwBw+HHKqlvcJOZxlaOLQSwsnJQJswQp2df+J990tjBo8UgIAVm4lQEuL9zwIfF9DB0ds
	hmNNOEL09f9CRRBEW6w1pL8dwWDARQ67e0dJlcT3Bjy/qXRwy3FSmlxFeyser9ECW956Cv0PAgax7
	ojPTY4TlTadaMXVrQN2cq7oQc90GRlLf5fTZMnrz5BuY8MuV2J+W43qOSObUvs0jOtYgrSx55Evxh
	CKfzKhdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2BAl-00GkX8-2b;
	Thu, 25 May 2023 13:38:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2BAk-00GkWq-28
	for linux-riscv@bombadil.infradead.org;
	Thu, 25 May 2023 13:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7/MPnMSTTqvi1h2V28m7HvVkRafCnNib35+NgbBtu4I=; b=pawI1ad/AjxY45lvIaCGFZFxxy
	1jJZq7OR52yYLi4YdtAx+JhFZrmmo8WHdwhd94T5/MFMZk6tHijqUfKZG+da29lUQ8wO/Hrg4tpaW
	arJV1Tj/EyPILNXIeoJnEMzP3ZKmmbIXfjR2TNeRPVlTfgcaniN41ys0q2JOdFDNDFgTP0ZIWOn90
	aJF+H9FKrnQi6KUpVNBSAR1slcE6BSvZKC+cClIgCFrR6JF9Xa18gChzMqNVmw36+S/Z6T32IqDDX
	0Lv99667Zvc68fmQh76e9mAJPapMoNi71m0a9xHoN2EFlh5bYVsEArIQEFTQ6oSJYzTCoRCKk0/yT
	Artcg41Q==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2BAg-006YEw-0s
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 13:38:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685021906; x=1716557906;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7/MPnMSTTqvi1h2V28m7HvVkRafCnNib35+NgbBtu4I=;
  b=Zm3VLMeE2HySFx2jQc3zqCPgKWWy8BQbzzGMyOmd+HlDw2u/oEhe4Nu3
   6SQ1hWpZQG8Y4QXzYUvCO629ZCSrD+pJUXg611yHttXfPD1jVeim/lg0I
   yeUDDTqnr4lH5Hpa0roRLKnbCE6gMBxJ/kHkNiRlSgi8zYJxtPf9IkqKT
   IcGhAS1c7ua67qzWRM81UCP6UQ9+MvA0VffeCwTouJbDi2+WGWbFNlk1o
   6FG3ZLYrOsE4Tv1fKdrwOu6/ousVcN1yqLpD7RgUhZnNuBLf0QQKBqey8
   dUpBv/XC4i95CgzWwjrWrayDhjbaNkRB5sN1CWCgUSTWlLqWBGygr4jjy
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; 
   d="asc'?scan'208";a="153913613"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 May 2023 06:38:08 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 25 May 2023 06:38:08 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 25 May 2023 06:38:05 -0700
Date: Thu, 25 May 2023 14:37:43 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Anup Patel <apatel@ventanamicro.com>
CC: Atish Patra <atishp@atishpatra.org>, Alexandre Ghiti <alex@ghiti.fr>,
	<robh@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>,
	<jeeheng.sia@starfivetech.com>, Anup Patel <anup@brainfault.org>,
	<linux-kernel@vger.kernel.org>, <palmer@rivosinc.com>,
	<leyfoon.tan@starfivetech.com>, <mason.huo@starfivetech.com>, Guo Ren
	<guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Song Shuai
	<suagrfillet@gmail.com>, <linux-riscv@lists.infradead.org>, Andrew Jones
	<ajones@ventanamicro.com>
Subject: Re: Bug report: kernel paniced when system hibernates
Message-ID: <20230525-postnasal-monopoly-98adb96ffaa1@wendy>
References: <CAHVXubgse4Lw7ucg52FkQW4c=QrNo56BXsRZ_nkCHAAPxUXUig@mail.gmail.com>
 <CAHVXubj92O_dwGShOJgrYezqk2pA2NtFyhNFbAPyhn7=PztK6Q@mail.gmail.com>
 <20230517-preacher-primer-f41020b3376a@wendy>
 <CAHVXubhMLgb54_7zV2yFuGPoMKCkUXwozHbDvghc7kQqNLK-JA@mail.gmail.com>
 <CAAhSdy3tKAk1xjinwnSWan0ivdDapcLvSb+hGNynPFZMUsoB9A@mail.gmail.com>
 <fe8d716c-fb4f-1f3f-6c69-de1d8b9fb6af@ghiti.fr>
 <CAK9=C2X1BjZCHfYM33pZQtavu7yRqxwsypWL5OWj79bJrnDMQg@mail.gmail.com>
 <CAOnJCULpa-TJuG=TtCDOxOdUviZzWheLE-GMiU1r7GWaKn0nuQ@mail.gmail.com>
 <20230525-guacamole-swimmer-68048a73baac@wendy>
 <CAK9=C2WUyLxZwQO37cN-i+V+A3yxmEoaj=uE8yR8nseYTDW7oQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK9=C2WUyLxZwQO37cN-i+V+A3yxmEoaj=uE8yR8nseYTDW7oQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_143826_992677_0F17AB89 
X-CRM114-Status: GOOD (  23.45  )
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
Content-Type: multipart/mixed; boundary="===============0497850774144916337=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0497850774144916337==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JrOGZxtEPS2oo1aX"
Content-Disposition: inline

--JrOGZxtEPS2oo1aX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 25, 2023 at 06:51:28PM +0530, Anup Patel wrote:

> > We should only rely on this node name for known bad versions of opensbi
> > IMO. Going forward, if something needs to be reserved for firmware, the
> > firmware should make sure that it is reserved by using the property for
> > that purpose :)

> There is no issue with OpenSBI since it does the right thing by marking
> memory as reserved in the DT. This real issue is with the kernel handling
> of reserved memory for hibernate.

I don't think we are talking about the same thing here. I meant the
no-map property which OpenSBI does not set.

> Like Atish mentioned, not just OpenSBI, there will be other entities
> (like TSM) or some other M-mode firmware which will also reserve
> memory in DT/ACPI so clearly kernel needs a SBI implementation
> independent way of handling reserved memory for hibernate.

> > > Another option is to use compatible string or label property to indicate
> > > that this memory region is not to be saved/restored during hibernation.
> > > This can be documented in RISC-V DT bindings as well as the booting guide
> > > doc that alex was talking about.
> >
> > Sure, a dt-binding for sbi reserved regions doesn't immediately sound
> > like an awful idea... But we still have to work around the borked
> > firmware - be that disabling hibernation or using the mmode_resv node
> > when we know that the version of OpenSBI is one of those with the
> > problem.

Did you skip over this? I was agreeing that defining a common binding for
sbi reserved regions was a good idea.

--JrOGZxtEPS2oo1aX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG9kpwAKCRB4tDGHoIJi
0p+GAQCn1Y7yJhVNQl0WAf2V+rgtzqGw5oM5zSzgGijoW2F4KQD/X+ycRbX3wKqC
IsL+AdtJs3lRjPV4gheoUkWsJcmvAA8=
=S5k1
-----END PGP SIGNATURE-----

--JrOGZxtEPS2oo1aX--


--===============0497850774144916337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0497850774144916337==--

