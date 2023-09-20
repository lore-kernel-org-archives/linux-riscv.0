Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E098CE79B1
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 10:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQEtBVzEqIlN3KfxvngrxFsOR27PEESXKUPGD80kHeY=; b=fL1Ui5ECnw8EePWj+Faey49Eeb
	XJmoNRCDVKl5D7+qN9O+HaTjsETbwjoX8rFilgEmuH/1XZv7IuUfM5XBMT6AFdos01SXvRoS67osM
	pjqtdjcFZHpQVHIaLYwo2dEJCcPDWDbQUwbeJH9u9zZMOkM414wf7iGMFfzL7rmKDEAj8bPrzPBDD
	SegfMEk5j9LNjYsj6BE+OfuJrTVWHPLrc4i5dCqBn9pIrsLglkcA0/5WusR/O3EIdv2NI2k9oQmcL
	wKFzU95Dtr2FHc+Gw1S3VUGIb3HFyN6W3L+PmfAc9DuDMs5qvdfSDgLPqK0jCil1NSb7LWRkzsjG0
	50YZbZDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiu1T-002XSG-0D;
	Wed, 20 Sep 2023 10:01:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiu1Q-002XR8-0v
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 10:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695204089; x=1726740089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hhGYfJjGh/XnmWB/G+1RMEq82v8g0lovgNTL7upK1Pc=;
  b=t5zktrK7sAoc3lWrSnOMrRk8WcG1xRZcePK4pJBqokLr0NaxQX3XO+nS
   dPUbnx40igB9CqxPh++7KR5xD6SK0zU0sTJ5dbHTt8p2rsUJntD2udJxc
   BtShJihhuuIE5+AtoKjJEU7KDDSe1xUvSc9rYYBQpEoH7+Vy+wl/sYnTe
   +F50IlolKhhsQ6sSGQA0SWsOumNlYC/QK6TzHTzM4B2X+jcNpQlz+JAbH
   e22ZuczKKrKxNTACzjbOTGJEeIYxV/HOoWEfBcDE7UXZRk8u0GAmVT3sG
   5qkKy0gKUD10kUbyU2DxMzDX+PaIdSQDPXN5FHO0Ak3TSRUW9kaWfTvYE
   g==;
X-CSE-ConnectionGUID: R+NA1OHjSiydIprkI9bNjQ==
X-CSE-MsgGUID: ujjYxhtJQdi9rsEYxZFB0w==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="asc'?scan'208";a="5625564"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Sep 2023 03:01:26 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 20 Sep 2023 03:01:25 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 20 Sep 2023 03:01:22 -0700
Date: Wed, 20 Sep 2023 11:01:05 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Chen Wang <unicornxw@gmail.com>
CC: <aou@eecs.berkeley.edu>, <chao.wei@sophgo.com>, <conor@kernel.org>,
	<devicetree@vger.kernel.org>, <emil.renner.berthing@canonical.com>,
	<guoren@kernel.org>, <jszhang@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <robh+dt@kernel.org>,
	<xiaoguang.xing@sophgo.com>, Chen Wang <wangchen20@iscas.ac.cn>
Subject: Re: [PATCH v2 00/11] Add Milk-V Pioneer RISC-V board support
Message-ID: <20230920-muppet-wad-ee76f3112651@wendy>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <cover.1695189879.git.wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_030128_338119_0C9CF3F4 
X-CRM114-Status: UNSURE (   8.91  )
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
Content-Type: multipart/mixed; boundary="===============5951608051688043079=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5951608051688043079==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wxKIZ4cRRsBMAedi"
Content-Disposition: inline

--wxKIZ4cRRsBMAedi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 20, 2023 at 02:33:48PM +0800, Chen Wang wrote:
> Milk-V Pioneer [1] is a developer motherboard based on SOPHON SG2042 [2]
> in a standard mATX form factor. Add minimal device
> tree files for the SG2042 SOC and the Milk-V Pioneer board.

Please run dtbs_check with W=1 set & fix the below issues:

sg2042-cpus.dtsi:1600.25-1607.5: Warning (unit_address_vs_reg): /cpus/l2-cache@0: node has a unit name, but no reg or ranges property
sg2042-cpus.dtsi:1609.25-1616.5: Warning (unit_address_vs_reg): /cpus/l2-cache@1: node has a unit name, but no reg or ranges property
sg2042-cpus.dtsi:1618.25-1625.5: Warning (unit_address_vs_reg): /cpus/l2-cache@2: node has a unit name, but no reg or ranges property
sg2042-cpus.dtsi:1627.25-1634.5: Warning (unit_address_vs_reg): /cpus/l2-cache@3: node has a unit name, but no reg or ranges property
sg2042-cpus.dtsi:1636.25-1643.5: Warning (unit_address_vs_reg): /cpus/l2-cache@4: node has a unit name, but no reg or ranges property
sg2042-cpus.dtsi:1645.25-1652.5: Warning (unit_address_vs_reg): /cpus/l2-cache@5: node has a unit name, but no reg or ranges property
sg2042-cpus.dtsi:1654.25-1661.5: Warning (unit_address_vs_reg): /cpus/l2-cache@6: node has a unit name, but no reg or ranges property
sg2042-cpus.dtsi:1663.25-1670.5: Warning (unit_address_vs_reg): /cpus/l2-cache@7: node has a unit name, but no reg or ranges property
sg2042-cpus.dtsi:1672.25-1679.5: Warning (unit_address_vs_reg): /cpus/l2-cache@8: node has a unit name, but no reg or ranges property
sg2042-cpus.dtsi:1681.25-1688.5: Warning (unit_address_vs_reg): /cpus/l2-cache@9: node has a unit name, but no reg or ranges property
sg2042-cpus.dtsi:1690.27-1697.5: Warning (unit_address_vs_reg): /cpus/l2-cache@10: node has a unit name, but no reg or ranges property
sg2042-cpus.dtsi:1699.27-1706.5: Warning (unit_address_vs_reg): /cpus/l2-cache@11: node has a unit name, but no reg or ranges property
sg2042-cpus.dtsi:1708.27-1715.5: Warning (unit_address_vs_reg): /cpus/l2-cache@12: node has a unit name, but no reg or ranges property
sg2042-cpus.dtsi:1717.27-1724.5: Warning (unit_address_vs_reg): /cpus/l2-cache@13: node has a unit name, but no reg or ranges property
sg2042-cpus.dtsi:1726.27-1733.5: Warning (unit_address_vs_reg): /cpus/l2-cache@14: node has a unit name, but no reg or ranges property
sg2042-cpus.dtsi:1735.27-1742.5: Warning (unit_address_vs_reg): /cpus/l2-cache@15: node has a unit name, but no reg or ranges property
sg2042-cpus.dtsi:256.15-275.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@0: duplicate unit-address (also used in node /cpus/l2-cache@0)
sg2042-cpus.dtsi:277.15-296.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@1: duplicate unit-address (also used in node /cpus/l2-cache@1)
sg2042-cpus.dtsi:298.15-317.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@2: duplicate unit-address (also used in node /cpus/l2-cache@2)
sg2042-cpus.dtsi:319.15-338.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@3: duplicate unit-address (also used in node /cpus/l2-cache@3)
sg2042-cpus.dtsi:340.15-359.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@4: duplicate unit-address (also used in node /cpus/l2-cache@4)
sg2042-cpus.dtsi:361.15-380.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@5: duplicate unit-address (also used in node /cpus/l2-cache@5)
sg2042-cpus.dtsi:382.15-401.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@6: duplicate unit-address (also used in node /cpus/l2-cache@6)
sg2042-cpus.dtsi:403.15-422.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@7: duplicate unit-address (also used in node /cpus/l2-cache@7)
sg2042-cpus.dtsi:424.15-443.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@8: duplicate unit-address (also used in node /cpus/l2-cache@8)
sg2042-cpus.dtsi:445.15-464.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@9: duplicate unit-address (also used in node /cpus/l2-cache@9)
sg2042-cpus.dtsi:466.17-485.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@10: duplicate unit-address (also used in node /cpus/l2-cache@10)
sg2042-cpus.dtsi:487.17-506.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@11: duplicate unit-address (also used in node /cpus/l2-cache@11)
sg2042-cpus.dtsi:508.17-527.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@12: duplicate unit-address (also used in node /cpus/l2-cache@12)
sg2042-cpus.dtsi:529.17-548.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@13: duplicate unit-address (also used in node /cpus/l2-cache@13)
sg2042-cpus.dtsi:550.17-569.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@14: duplicate unit-address (also used in node /cpus/l2-cache@14)
sg2042-cpus.dtsi:571.17-590.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@15: duplicate unit-address (also used in node /cpus/l2-cache@15)

Thanks,
Conor.

--wxKIZ4cRRsBMAedi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQrC4QAKCRB4tDGHoIJi
0n49AP9Q2yOtEngC/IQEoTH7b+/RHwQ0bnUPOAVp+7LQiuslVwD/XwFBGvnj86pP
Txdr/b4hjIbPplTAAS+HgxEBIDyQzQY=
=6fL7
-----END PGP SIGNATURE-----

--wxKIZ4cRRsBMAedi--


--===============5951608051688043079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5951608051688043079==--

