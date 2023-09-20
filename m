Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879E5CE79AB
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 08:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcP7T7K3ekb8ElbfbvCWdNBkiLyb6Tn1RvIMx46obgc=; b=Qjx68hNrUpOY/6S12tU4Ec0Rr4
	DL43JWGIe1xuf1NSFaVOQUJvDlLw3IFLuOcfPJKz50oi103s2NXouXvOlJP66sTwRQ9REBXMPXlXB
	GrjWjlCrQs9lWeGkAh/iub3nupPv93kn/hIGDx+dKp4drX5VDU/Szh9rL0zQOjPCpzxLS5ckFQxam
	nNW8p4dRSbrokVMS+gUyQaq4Vg9BzO2JQi0JBcADim9mDH15ht8fi9R5GqVZXLZ71bNJfrh2hg8qM
	aOzLrgTLJAXlldLiFeqvVvlopiZW862MmdQIZEy7SEwq9PHZH04DNypNiyY9WB13HcXyp/tXFaJmf
	5Xt6Y3FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qisSg-002GRu-0I;
	Wed, 20 Sep 2023 08:21:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qisSd-002GRH-0K
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 08:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695198087; x=1726734087;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KE0nQg/amugrY0hU6X8yP1M4clGfXyQXmS4LTPcsBBU=;
  b=L0cxBYUztq/3GlSMhhJ1+qkpnThfqD6BWVAbQyqyflBP7OoPJq9tYyYR
   DeKpRH10HVCrPyCGjWX5kD9h0CI/lGbffcoGAqxqScXD/g7e5M1IZ4buQ
   HB0kjrU6hy+yj25RIEf982Cih+ONCBx836r6ociXgfdaZ7U+0HIxTQWef
   9Go1ROzAHXjOABtkIzHEED3UrzOoCVOaUVaOigoBLHkVHCX8egjYcztsW
   5R2tGuDRHF3QRiMTrsf2UPMjB8a5Eo4Hh22mv4nGYHb4tA8YBjc7qWqHB
   mONUZda1yv7xGIZGxJgm5pIqE2j2GtvJ3gvIkpkZl+NGEpgBqdk/WHWcb
   A==;
X-CSE-ConnectionGUID: WxPtBgV6QO2kh+eUWKaMkQ==
X-CSE-MsgGUID: xay10pjUQbOVRdsaCZWxXA==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="asc'?scan'208";a="5608330"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Sep 2023 01:21:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 20 Sep 2023 01:21:26 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 20 Sep 2023 01:21:23 -0700
Date: Wed, 20 Sep 2023 09:21:06 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Chen Wang <unicornxw@gmail.com>
CC: <aou@eecs.berkeley.edu>, <chao.wei@sophgo.com>, <conor@kernel.org>,
	<devicetree@vger.kernel.org>, <emil.renner.berthing@canonical.com>,
	<guoren@kernel.org>, <jszhang@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <robh+dt@kernel.org>,
	<xiaoguang.xing@sophgo.com>, Chen Wang <wangchen20@iscas.ac.cn>
Subject: Re: [PATCH v2 01/11] riscv: Add SOPHGO SOC family Kconfig support
Message-ID: <20230920-flashily-ibuprofen-bceba1e6e8a2@wendy>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
 <2c6db3d2db0d27d4b2b8364e0c03be3da292101e.1695189879.git.wangchen20@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <2c6db3d2db0d27d4b2b8364e0c03be3da292101e.1695189879.git.wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_012127_200499_A740F02E 
X-CRM114-Status: UNSURE (   5.54  )
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
Content-Type: multipart/mixed; boundary="===============0200151303958039626=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0200151303958039626==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xGlxnrW2N4qY4U7g"
Content-Disposition: inline

--xGlxnrW2N4qY4U7g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


--xGlxnrW2N4qY4U7g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQqrcQAKCRB4tDGHoIJi
0jESAP9r4e9cXEo8FMKa8sqvXhsg+g1Gkbdl1d/rDCx9LELHLAEA3hby1qa9SSEB
uVRcU35a6phce/xbF5nvjV1B9LxDxAk=
=Bija
-----END PGP SIGNATURE-----

--xGlxnrW2N4qY4U7g--


--===============0200151303958039626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0200151303958039626==--

