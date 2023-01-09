Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF9DC54EBD
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 11:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RE9hxkisrZTOkQ7Kp+4KBIdR+a+qTGhrJ/6O2nimJSQ=; b=DktwIjDFp8qDypkTaIXWzTB0TS
	kdt/PmK8Q4LMK4ggEIkn46lDezKSolPi36flEVjpq3Ssx7CvIO3hYv93N7RMFyegxwUo+CKGci32G
	aXBl2tev/g6VW6hQOHyFmYt+dmAn9KcUIMA+fDjOARHsfxQ98epuOP2/rS7l2G48r8yDm4TlIxp2s
	h5COpjwxzQF1VhqvG9G3jBjepY4pYT+Fmmx5DeJ3ZBG2B+FMmL3x550cHS/YhzdLUSLorn6OoWfiK
	p5IMbUP7XIkQUu5MM+UcNYz0xtv35k4gyxOLijcrGgFyANn2vyYGcLFglZL7rV2ffAmn2qiQHQUcp
	+ObexBOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEqnW-0018M5-Fp; Mon, 09 Jan 2023 11:58:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEqnS-0018Kp-Uv; Mon, 09 Jan 2023 11:58:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673265514; x=1704801514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CVmhaM3jEhg8fncm+fzD91Uf6V70xL+ZewS2UOQLFbM=;
  b=YatuvaEm4q+bS1JdSgsJZjvN7piXbCZ/wTQftKw6RbnVUR1HVEHHbbcD
   70/H2JAesUPr4X7Pxd1uVWyB0Lowrr7Z9OrQw/S/ALO6I8FfYH4xP3T5c
   4K6sSvnqGB9WONFusMTSgcgtrBSGJ+cGNlZs/jLv2e5LssnKBBQ3mEzhz
   eJ2E7OsiCKpRVbdaeeLyPc9gdGQKY0xei0yquSPXlJKmqHzJ9Q0Vypf1b
   n94GwZao7QInH7tjJmGJD6bCwwSLhG8aA7lOZtTKW9rGLW420YD/IuDMP
   h7TlerYkqqUjMqEbjFv/4AnwCwolrh7bkMOIfIYdS1wB+ddyRfqYM+pva
   w==;
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="asc'?scan'208";a="131447965"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jan 2023 04:58:30 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 9 Jan 2023 04:58:29 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 9 Jan 2023 04:58:27 -0700
Date: Mon, 9 Jan 2023 11:58:05 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Conor Dooley <conor@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<atishp@rivosinc.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<apatel@ventanamicro.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<opensbi@lists.infradead.org>, <samuel@sholland.org>
Subject: Re: [PATCH v4] dt-bindings: riscv: add SBI PMU event mappings
Message-ID: <Y7wBTQM7BY8P4Oc4@wendy>
References: <20230108215047.3165032-1-conor@kernel.org>
 <20230109092715.bwomqoeosif43lr2@orel>
 <Y7vpxW1AeEOhcxUf@wendy>
 <20230109104029.3cwbngqiydlpl7z2@orel>
MIME-Version: 1.0
In-Reply-To: <20230109104029.3cwbngqiydlpl7z2@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_035835_120286_53CF26A8 
X-CRM114-Status: UNSURE (   7.80  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============7044583487011192609=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7044583487011192609==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8XoNT0OmVvQCfAv6"
Content-Disposition: inline

--8XoNT0OmVvQCfAv6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 09, 2023 at 11:40:29AM +0100, Andrew Jones wrote:

> Maybe just replace 'platform specific hooks' with 'in a platform specific
> way'? I'm mostly just hung up on "hooks" (pun definitely intended), as
> this document lives in the Linux repo and there aren't any hooks.

Yes Captain,
Peter.

;)

--8XoNT0OmVvQCfAv6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7wBTQAKCRB4tDGHoIJi
0i22AQCCB18ZFTC5gZ6XV+3/PdQCzJYQyvuE7kzMeGmJc/c2QQD/c7OWy8G4QbAx
AkwR/Nzg4U0fhRCkp3VKOyyD4bOI3Q0=
=vhFw
-----END PGP SIGNATURE-----

--8XoNT0OmVvQCfAv6--


--===============7044583487011192609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7044583487011192609==--

