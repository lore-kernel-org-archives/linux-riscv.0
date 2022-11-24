Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F18C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 13:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b9q5pk+CefiRRpUjeZNpqAvyjVNAE7p7/lRuEwFmYiI=; b=e2Ov9aPUqzHPbj
	kRkbmow20RMtlSgNn6vUZ6BdytdWGin1+u5tTO5yaSXt7xah7Q9TBdIW+9W5F3YsvAjSOco0iX7x7
	1RBA3wHcjy67Mr+Ixwetx+AsIGo7XhGGKcYh0ch0GOPd+Sz3OqoHo8fOt5ExOtzaEJHT5MysRL2xV
	8imeoB38M01eFh4N5bWcqMQxCoRjr3y0WNwshPNnXkKeV4XzFXY0D0NLLWz5hCsc7vxiRSZJqXYrN
	kLm3abok0oqDbio9kl7FriBcFciQzBp+QWFT08V+V03V2j0hjGY2yMHYIje0aHUREhU0ROhOWKAWd
	51Kd5z1HPQfTqXPimi/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyCfT-0090Qy-BK; Thu, 24 Nov 2022 13:53:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyCfN-0090K8-43
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 13:53:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669298005; x=1700834005;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=iJYwQQbsEFPUK7ZmqDMRO9t/URWDUHZSWtb8FdSzfbk=;
  b=vkgBnqHBUyPUqxy/TQ6T5WKY5zlvc010TosV7oHlO9/wCLA/8QXMZ5xJ
   jojYV/9z1J6LHgZrukcn+GQ+Mu9f7pdWRofJ2qJ/YJOL17DZCmZYn+q2D
   USS/vyXYvLEnT+atT2McQmyscFCeyES5vuapEFCvak6a1QOXAj7lJfKff
   6rYjbOtPK+g6sjvzokHU6MDy1ofKFYkfTWD/aCJLpcEkJi5/vnghiki7V
   McV3fvRM7ra+/l7DIUDcuEmU4t9GTVNPN2z/veP2CHaF0fz7+uB2Hg/KK
   JKk9KNa3SOuJlv7QXwUskZ7JnG7CAoHNePcSvj0ihZFKqaxZjpcIusJzR
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; 
   d="scan'208";a="188521747"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Nov 2022 06:53:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 24 Nov 2022 06:53:18 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 24 Nov 2022 06:53:16 -0700
Date: Thu, 24 Nov 2022 13:52:58 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
CC: <linux-riscv@lists.infradead.org>, Conor Dooley <conor@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Andrew Jones <ajones@ventanamicro.com>, Guo Ren
	<guoren@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: riscv: fix single letter canonical order
Message-ID: <Y393OvlAa+h8Dyek@wendy>
References: <20221124130440.306771-1-conor.dooley@microchip.com>
 <20221124130440.306771-3-conor.dooley@microchip.com>
 <7034611.lOV4Wx5bFT@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7034611.lOV4Wx5bFT@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_055325_267977_55AFE869 
X-CRM114-Status: GOOD (  13.75  )
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

On Thu, Nov 24, 2022 at 02:42:20PM +0100, Heiko St=FCbner wrote:
> Am Donnerstag, 24. November 2022, 14:04:41 CET schrieb Conor Dooley:
> > I used the wikipedia table for ordering extensions when updating the
> > pattern here in foo.
> =

> 	    ^ foo? :-)

God damn it! I wrote foo, left nvim to check what the fixes tag would
be, came back and added it below but did not update this part of the
commit log...

> > Unfortunately that table did not match canonical order, as defined by
> > the RISC-V ISA Manual, which defines extension ordering in (what is
> > currently) Table 41, "Standard ISA extension names". Fix things up by
> > re-sorting v (vector) and adding p (packed-simd) & j (dynamic
> > languages). The e (reduced integer) and g (general) extensions are still
> > intentionally left out.
> > =

> > Link: https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-unpr=
iv-pdf-from-asciidoc-15112022 # Chapter 29.5
> > Fixes: 299824e68bd0 ("dt-bindings: riscv: add new riscv,isa strings for=
 emulators")
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> =

> So I have compared the new pattern to the isa manual,
> and it looks like the order checks out, so
> =

> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
