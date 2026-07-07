Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB37BC44503
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 08:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0I0ng9qQU/P+R5FfuGPU/Ndn1L5NysVixQRU+IRdb8=; b=MFQgynRftYZrOH3obGCNcWRUzl
	u45WI+JeFMG6T3goouvva5UFqpY5WhrcLkWL7IW7SIEEcQ0Iqpui6EB6pf29iAYxitYFurvckJU+H
	7MspFaUpFeL0B/w8tb48jcGjyhwZiAnApT/c/umrnf1B364zk2mRSAr2Ih/msMf+nL6QyO+Z2j6dO
	/GmbjFjGUISTZBXUs1vzFcqOpJ/Tq/idZb9RajJBpDyvdIJw6e2PaVaBCogPgMso8WCiYpr5YocLd
	zAshJcC49w8XuZ58o8ycx1AZoWXXPFagjJ5iLD01cl6ozufkU0KWQJLM6dZF6RyaPIkE8RhuLzAwE
	mhZ7ZXXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1Ts-0000000EWvy-2zIQ;
	Tue, 07 Jul 2026 08:48:40 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1Tp-0000000EWsM-0p9t
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 08:48:38 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4759b4f0897so1727172f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jul 2026 01:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783414115; x=1784018915; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B7IpEGimiq97mBhe4ez+EoRJVMiEWH0AXP6PlEke+J8=;
        b=DHe3OsZ4QV5NK6RxhpP8XI2xs02HTHC8mPb5GTV7R3jKBHKMbnQpf3/VSxS9BbnMXu
         opQmu/GqHRBgND/F0XfPzhjrT77s2YDQlJc8DDokCJM0Ou52GGQElu/++jcRLKh3a516
         8Lv99GQxBxDYi3T2TOSt/ZPLk04ytiHorqt8SAyruiG9mbKk0Gg9xLn1W5BAoUNnhGhQ
         w0t4q0bBDsviGJWYPAKj0Pp6+fsxPxgeb3H8CqP6HIdigmsxS38VgbVbTIaIgFrIgmNr
         Rx5MitIOIkHYXkQr/32T9nDR3sMSaXnVuENmJO8VgK4nJRvSYa0A3qb3PK4UJTOMNo0O
         7O9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783414115; x=1784018915;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7IpEGimiq97mBhe4ez+EoRJVMiEWH0AXP6PlEke+J8=;
        b=T5UYLgL69IeYzc1YuaRKHyuW3FhhtarRa5ImfqUG7eeNccbfEBC8Ohz3beRhAFNyNy
         5hrlXqKDP3YOyHDhZ/ecy/YMpMLUh5JaMfoDdTyjmQc1R82071lGQSm975TisUr1z/av
         I5gX+PEae7nxXVwyjS5xflrFmj63L2YCV1x8wdHAMn1LrO/5uo8kYljBJQRSzVH2hiHS
         zThD0wGOhwWw1e36o82BkOqH3kO/9Rj6QAd6xHP9wY1hriVB3pvrtLTbAwAQOM1iKGK0
         KW7tCvWqme/SnuXyvaoYb9XEJTpC0qlqbW00wcOkrr+0nMjKdfLfCIdFO074AqW5bdLM
         dvLw==
X-Forwarded-Encrypted: i=1; AHgh+Rp6GSpY9kIIY9sZQmlLk4sj28bJnb1hSAiK7V5Mc1wHQZ/9Zw9fVpoWVy9g0wYeuQWaYw8+vqxUcx++KA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvQaMhU/hOqqwX5Ul9prrikRI22BRJRfnJm0HUoFcrUBpOUi4k
	T0ubn5RBu8wnhHkH+KmXx/AzyfY5i0a+PsfrRuiMb1hE2+TwzZ20Pnhe/4X4jEWmOkI=
X-Gm-Gg: AfdE7cnTs8Wg+wi+hYI8B4KS/sNdOjLaFT+T1eVcOiLGUA/H9y1WNgrYIWZDABsUO8e
	7EMWGbvNyEi6/apsRgglkMKjiordZmK9MFY0NWDcnjJ8D27O6A9LWSOA+5I80MyOYjJJnVj3m8w
	KWlfSnFXQCytEW0bdlnB4MZseASCkDyBhvxUAJGQqLe8WwIdAfqPKIQ0xBTE/aZ3HtnhvXuhjtB
	CGNKnV+X8wtV2Kdt+zYrV7RsgkpVRA8aPrVTOq1lf0PXfdGZO60aOL+lEyc+BwuQcRLtrfkPNRk
	pEHkCMRdMd2SaFWpMOO7/nX48gC4F8iV4zdYMiPKnYeoClnVlsNL6PWGkyILa14S5vY8yMglZic
	Iy5q9Mrm+z6O5kT0K6UafrifbicYAz9cOMZvCxpHaIn0j0F08S65thLVFikUU4cZNp7o2EqMa76
	BfPnpaLdkcsnC/aVw0uGIo2cnt9dCBCeVWFe7ce/voeisa3xOFaToF9sndrnD+xRdgXhRTsNaOt
	9Or
X-Received: by 2002:a05:6000:25c2:b0:46a:234:d2e with SMTP id ffacd0b85a97d-47de670a006mr4350047f8f.38.1783414114474;
        Tue, 07 Jul 2026 01:48:34 -0700 (PDT)
Received: from localhost (p200300f65f47db0437b4d928ee3eb6f8.dip0.t-ipconnect.de. [2003:f6:5f47:db04:37b4:d928:ee3e:b6f8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa039ad21sm31630429f8f.20.2026.07.07.01.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 01:48:33 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:48:32 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Drew Fustini <fustini@kernel.org>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra <atishp@rivosinc.com>, 
	Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>, 
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor+dt@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dave Martin <Dave.Martin@arm.com>, 
	Fenghua Yu <fenghuay@nvidia.com>, Gong Shuai <gong.shuai@sanechips.com.cn>, 
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn, James Morse <james.morse@arm.com>, 
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	liu.qingtao2@zte.com.cn, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Peter Newman <peternewman@google.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Tony Luck <tony.luck@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, 
	Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>, 
	yunhui cui <cuiyunhui@bytedance.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, devicetree@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 8/8] riscv_cbqri: Add CBQRI capacity allocation
 platform driver
Message-ID: <aky9S8A5dgIJjd7b@monoceros>
References: <20260706-dfustini-atl-sc-cbqri-dt-v4-0-e75c20201d64@kernel.org>
 <20260706-dfustini-atl-sc-cbqri-dt-v4-8-e75c20201d64@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260706-dfustini-atl-sc-cbqri-dt-v4-8-e75c20201d64@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_014837_252648_E6C09BA8 
X-CRM114-Status: UNSURE (   8.55  )
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
Content-Type: multipart/mixed; boundary="===============6363702538808487585=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6363702538808487585==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qztydshr4q4j5sd4"
Content-Disposition: inline


--qztydshr4q4j5sd4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 8/8] riscv_cbqri: Add CBQRI capacity allocation
 platform driver
MIME-Version: 1.0

Hello,

On Mon, Jul 06, 2026 at 04:06:18PM -0700, Drew Fustini wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users for this header file. Only use those
<linux/device-id/*.h> that you actually need (if any).

Thanks
Uwe

--qztydshr4q4j5sd4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpMvV4ACgkQj4D7WH0S
/k6v2AgAl2287/4HQdpHnTug1nV07MMobHFzJ3S4RVStcbqDYYzz13jQz2rZa6De
h3bwnHtKRaWt0KGFus+38vYwJklCFYLbhQN03osh+8lbz0SZFCR2LhqYZ4NqRYpL
7YE7uJZZ0+PC0e8/9zRxAzCm3uUzdWf40hTy2rY73zLaieF5wf3ouGQ9zNNfNT/4
DQhLEXEErGBrZ+bCPvOmHXL8AOtqXFSDLgdQKssqT/pBoQMkcf9ng4DtpeDDwHzc
a6UBUrgNPUSGvwxHGh7hOFxnOUwrrFaQiks6LKJ3T4MLICtMMHBwBulmJXRQKkzz
JEHzbEDCw5lqHMYE4K+SFmz38WjUUA==
=eLlr
-----END PGP SIGNATURE-----

--qztydshr4q4j5sd4--


--===============6363702538808487585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6363702538808487585==--

