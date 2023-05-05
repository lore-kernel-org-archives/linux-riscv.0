Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9468C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 12:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIg0QwVe+AtDn1iFIt5WYTqFe9CZITQ26J5R/phHAEc=; b=KINm0oFl2fifNwa1BWSc3ss7WT
	5rR2nga6Hu7VE0WBEKC9pWcOx5z9CGXxjgKaEYf3+lbMbFCAtVC7IKhypOG8cnwkN7z+NJKqeJlVn
	Ttjv2s5ihXNuY5nq1ePi4a6P4NuyarDEtKWbSHFgEQM/REO2FqVf+Ejhgn0MRPdMV8xGHlvOFxNe3
	Do6FQiqNGQWZsxn0YWIchHLMLvdZC0DjolBu9rPdjLMuOOue3S6+iYZcM+ptYzyuzkr6W6KYGIthF
	KFy2Hq/x+0nT2gv7RwQBoK95H7HIcGHJj9Jm/xk0+rC+N+bt+tgVXSovY5SZf0Mhf6PrytaNDODS0
	EG944VJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puuiG-00AtyU-2s;
	Fri, 05 May 2023 12:39:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puuiD-00AtxI-1y;
	Fri, 05 May 2023 12:39:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683290341; x=1714826341;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8xaX52aaPvTWMjYeqa0TqYNGO9iqMeWfTGMQ8/3Jsag=;
  b=t5zl1IeCZnBeIrWwIfrPEcrtFDTLkHa9wKAgupiytoJYXiByuPHKl1gJ
   QVRKLw1snRH8CnI6R4LM4orhd2eWarfrR6vlWNj9n4vyHgak3WO8Heiym
   pqcKCyX/5cShH2wG6t2hBpEqHiKx2CQr0cDcw0c9LX2t6BvlFJgEvu90a
   fvdal8iLYKD8DdT5h6n+5kXOZIBXfG3Ov5Lrg83Q3AZK/DQwM8I8KGc3S
   gpx5mkIfDXarwBxX+krLfOwugnoU1fLE+OB7IH807py6rqGL0OkhdKWOk
   sp53O3W2jFRPqrYTq0ZkE0B4a26QEK/Blru9mTUFeqa5xdIV9i3IVmRPq
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,252,1677567600"; 
   d="asc'?scan'208";a="223989201"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 May 2023 05:38:57 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 5 May 2023 05:38:57 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 5 May 2023 05:38:55 -0700
Date: Fri, 5 May 2023 13:38:36 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Walker Chen
	<walker.chen@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <vkoul@kernel.org>,
	<linux-phy@lists.infradead.org>
Subject: Re: [RESEND v2 1/6] dt-bindings: power: Add JH7110 AON PMU support
Message-ID: <20230505-magician-poet-724c96020c2f@wendy>
References: <3ed72340-accc-4ad1-098f-4a2eb6448828@linaro.org>
 <482e812a-05dd-105c-189c-e926b4be9d28@starfivetech.com>
 <089e24d1-588a-4a56-f00b-0b35d1d99295@linaro.org>
 <ea5b5534-8fc2-7c84-a011-c1b42c6ed7a0@starfivetech.com>
 <1ac26c1a-1726-515d-6598-849a07ed0b86@linaro.org>
 <5adda0ad-965c-fbf0-878c-9d41d28b5c39@starfivetech.com>
 <86693969-59bf-5bcc-42a3-b6e94a0d6f3e@linaro.org>
 <fcfc8ba4-40a7-da43-3375-712bd7e7f4d5@starfivetech.com>
 <20230504-worshiper-ongoing-5581e1f2c2c4@wendy>
 <2f473307-2219-61a4-fa66-5848fe566cf0@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <2f473307-2219-61a4-fa66-5848fe566cf0@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_053901_659177_4C9AC540 
X-CRM114-Status: UNSURE (   9.29  )
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
Content-Type: multipart/mixed; boundary="===============7505997991315246510=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7505997991315246510==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="joHxcNEPtN2DDJ9p"
Content-Disposition: inline

--joHxcNEPtN2DDJ9p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 05, 2023 at 09:29:15AM +0800, Changhuang Liang wrote:

> But if keep this "starfive,jh7110-aon-syscon" compatible. Which .yaml match to
> it? Use this series dt-bindings or syscon series dt-bindings.

There is no syscon series anymore, it's part of the PLL series now:
https://lore.kernel.org/linux-clk/20230414024157.53203-1-xingyu.wu@starfivetech.com/

I don't really care what you, Walker & Xingyu decide to do, but add the
binding in one series in a complete form. It's far less confusing to
have only have one version of the binding on the go at once.

Thanks,
Conor.


--joHxcNEPtN2DDJ9p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFT4zAAKCRB4tDGHoIJi
0j7sAQC3yBu80qw2HVfxwCss7YeMwglVk3XoMJwU5Edb0+UMYwD/TodA8cpmhYbt
lWKK0yqBI6MEjCP3wB/OBKkdc3DOeQI=
=SIb4
-----END PGP SIGNATURE-----

--joHxcNEPtN2DDJ9p--


--===============7505997991315246510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7505997991315246510==--

