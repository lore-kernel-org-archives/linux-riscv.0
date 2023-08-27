Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81508C71153
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 01:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uv3T7RrWsFO3rzC+5rLactiWHaIgEq6VTf1Xn6g+AJk=; b=hePSQbueaN6RXSXTJKFI6XdQJx
	vHC6zypKRp9K6lpUxqLZkQtce+9o1q+YVrrFxPTcFvbQytKVkP//dj6YaU/AfP9Pp03tjoBZS4vl5
	gsNYeVSb1f8gPLPhkk9hc4IYz6/AnmJf6bMK4QB6+ZEFoWd9g3N5vXFRWHaGe6HGJ7D5ireO1Zf8T
	awp0YkRhvA1YM8D2Mbi8GBbZAEDE6VLNy08qeIaxQb1W5FWHZFhJ31C6zQtnIJvT77W1nZ1f8JL0k
	/UP3mhwlYroMwSNkKCtF+IDENdJE68yVBLiPXnhGDucesJw4WYyJD8Sw/wElq18Dj2U4rpgi6d0YS
	WDHqJgkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qa4ve-007Nxk-2v;
	Sun, 27 Aug 2023 01:51:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qa4vb-007NxF-0i;
	Sun, 27 Aug 2023 01:51:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 02C6C61E6B;
	Sun, 27 Aug 2023 01:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A1EC433C8;
	Sun, 27 Aug 2023 01:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693101057;
	bh=ZCVc6r7u+JhxCkLdGCWieqo8FnBkAYc1lRcRZGpjkUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F9RloBRehX/4Tfo7fxdp1fjNk5JCvXZxVh7cKaWoi9SGaDsCR0moFbRlZN8dfCulA
	 mL4mVtZfXHtDOCmUmq8+aUm2OYQXLSU6Voi0tg/34IsaL7RvY/5LltTN/eNeoNkqrf
	 CRt8zWqI8taHsWGYfmrVhpUFPAI1U58qlHAFg/nNQptxT3mAlwhjU1um3EGFCOkC8N
	 BWv7YOCtq3SH0y8oMwho1oh3ic9oUtmiQibVvZuJY02Rpdw/SqmKIuYAQULMPvQsWe
	 GhcqQcySL7SULLwVAznZvgY2YfQuPupHehOutz4wTcgJ0Yp9Eoe9hntt+Q/5G6Cfic
	 GTdRoR3mlESaQ==
Date: Sun, 27 Aug 2023 02:50:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Wei Fu <wefu@redhat.com>, Pei Chen <cp0613@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: allwinner: d1: Add PMU event node
Message-ID: <20230827-cricket-ooze-0bf6b7399da9@spud>
References: <IA1PR20MB49538F11DE1AF4A52B0F9F9ABBE2A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB49538F11DE1AF4A52B0F9F9ABBE2A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_185059_354396_CEA3E362 
X-CRM114-Status: GOOD (  20.37  )
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
Content-Type: multipart/mixed; boundary="===============3600962040196219709=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3600962040196219709==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="atGRTUxlIzGLipnB"
Content-Disposition: inline


--atGRTUxlIzGLipnB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 26, 2023 at 08:25:04PM +0800, Inochi Amaoto wrote:
> D1 has several pmu events supported by opensbi.
> These events can be used by perf for profiling.
>=20
> The event value and mapping can be found in the R1S0 version of C906
> documentation:
> https://dl.linux-sunxi.org/D1/Xuantie_C906_R1S0_User_Manual.pdf

Link: https://dl.linux-sunxi.org/D1/Xuantie_C906_R1S0_User_Manual.pdf

> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
> The meaning of T-HEAD events can be found in this pending patch:
> https://lore.kernel.org/linux-perf-users/IA1PR20MB4953DD82D0116EC291C2177=
7BBE2A@IA1PR20MB4953.namprd20.prod.outlook.com
>=20
> The patch above also provides a detailed example that shows how to setup
> environment and use perf with T-HEAD events.
> ---

Firstly, you need to move the PMU node out of the soc bus:

arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi:76.7-114.5: Warning (simple_b=
us_reg): /soc/pmu: missing or empty reg/ranges property
arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi:76.7-114.5: Warning (simple_b=
us_reg): /soc/pmu: missing or empty reg/ranges property
arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi:76.7-114.5: Warning (simple_b=
us_reg): /soc/pmu: missing or empty reg/ranges property
arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi:76.7-114.5: Warning (simple_b=
us_reg): /soc/pmu: missing or empty reg/ranges property
arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi:76.7-114.5: Warning (simple_b=
us_reg): /soc/pmu: missing or empty reg/ranges property
arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi:76.7-114.5: Warning (simple_b=
us_reg): /soc/pmu: missing or empty reg/ranges property
arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi:76.7-114.5: Warning (simple_b=
us_reg): /soc/pmu: missing or empty reg/ranges property
arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi:76.7-114.5: Warning (simple_b=
us_reg): /soc/pmu: missing or empty reg/ranges property

And secondly, and I dunno WTF the fix for this is, but what you've got
here is completely invalid as per the binding...
The fix for this might well be moving it out of the soc bus (I think I
fixed the same errors in QEMU's pmu node), but it shows that you didn't
actually test this :/ Please do so:

/tmp/tmp.SOQ8Wz6Pug/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dtb: =
soc: pmu: {'compatible': ['riscv,pmu'], 'riscv,event-to-mhpmcounters': [[3,=
 3, 8], [4, 4, 16], [5, 5, 512], [6, 6, 256], [65536, 65536, 16384], [65537=
, 65537, 32768], [65538, 65538, 65536], [65539, 65539, 131072], [65561, 655=
61, 64], [65569, 65569, 32]], 'riscv,event-to-mhpmevent': [[3, 0, 1], [4, 0=
, 2], [5, 0, 7], [6, 0, 6], [10, 0, 11], [65536, 0, 12], [65537, 0, 13], [6=
5538, 0, 14], [65539, 0, 15], [65561, 0, 4], [65569, 0, 3]], 'riscv,raw-eve=
nt-to-mhpmcounters': [[0, 1, 4294967295, 4294967295, 8], [0, 2, 4294967295,=
 4294967295, 16], [0, 3, 4294967295, 4294967295, 32], [0, 4, 4294967295, 42=
94967295, 64], [0, 5, 4294967295, 4294967295, 128], [0, 6, 4294967295, 4294=
967295, 256], [0, 7, 4294967295, 4294967295, 512], [0, 11, 4294967295, 4294=
967295, 8192], [0, 12, 4294967295, 4294967295, 16384], [0, 13, 4294967295, =
4294967295, 32768], [0, 14, 4294967295, 4294967295, 65536], [0, 15, 4294967=
295, 4294967295, 131072]]} should not be valid under {'type': 'object'}
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
/tmp/tmp.SOQ8Wz6Pug/arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-=
stu.dtb: soc: pmu: {'compatible': ['riscv,pmu'], 'riscv,event-to-mhpmcounte=
rs': [[3, 3, 8], [4, 4, 16], [5, 5, 512], [6, 6, 256], [65536, 65536, 16384=
], [65537, 65537, 32768], [65538, 65538, 65536], [65539, 65539, 131072], [6=
5561, 65561, 64], [65569, 65569, 32]], 'riscv,event-to-mhpmevent': [[3, 0, =
1], [4, 0, 2], [5, 0, 7], [6, 0, 6], [10, 0, 11], [65536, 0, 12], [65537, 0=
, 13], [65538, 0, 14], [65539, 0, 15], [65561, 0, 4], [65569, 0, 3]], 'risc=
v,raw-event-to-mhpmcounters': [[0, 1, 4294967295, 4294967295, 8], [0, 2, 42=
94967295, 4294967295, 16], [0, 3, 4294967295, 4294967295, 32], [0, 4, 42949=
67295, 4294967295, 64], [0, 5, 4294967295, 4294967295, 128], [0, 6, 4294967=
295, 4294967295, 256], [0, 7, 4294967295, 4294967295, 512], [0, 11, 4294967=
295, 4294967295, 8192], [0, 12, 4294967295, 4294967295, 16384], [0, 13, 429=
4967295, 4294967295, 32768], [0, 14, 4294967295, 4294967295, 65536], [0, 15=
, 4294967295, 4294967295, 131072]]} should not be valid under {'type': 'obj=
ect'}
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
/tmp/tmp.SOQ8Wz6Pug/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.=
dtb: soc: pmu: {'compatible': ['riscv,pmu'], 'riscv,event-to-mhpmcounters':=
 [[3, 3, 8], [4, 4, 16], [5, 5, 512], [6, 6, 256], [65536, 65536, 16384], [=
65537, 65537, 32768], [65538, 65538, 65536], [65539, 65539, 131072], [65561=
, 65561, 64], [65569, 65569, 32]], 'riscv,event-to-mhpmevent': [[3, 0, 1], =
[4, 0, 2], [5, 0, 7], [6, 0, 6], [10, 0, 11], [65536, 0, 12], [65537, 0, 13=
], [65538, 0, 14], [65539, 0, 15], [65561, 0, 4], [65569, 0, 3]], 'riscv,ra=
w-event-to-mhpmcounters': [[0, 1, 4294967295, 4294967295, 8], [0, 2, 429496=
7295, 4294967295, 16], [0, 3, 4294967295, 4294967295, 32], [0, 4, 429496729=
5, 4294967295, 64], [0, 5, 4294967295, 4294967295, 128], [0, 6, 4294967295,=
 4294967295, 256], [0, 7, 4294967295, 4294967295, 512], [0, 11, 4294967295,=
 4294967295, 8192], [0, 12, 4294967295, 4294967295, 16384], [0, 13, 4294967=
295, 4294967295, 32768], [0, 14, 4294967295, 4294967295, 65536], [0, 15, 42=
94967295, 4294967295, 131072]]} should not be valid under {'type': 'object'}
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
/tmp/tmp.SOQ8Wz6Pug/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.=
dtb: soc: pmu: {'compatible': ['riscv,pmu'], 'riscv,event-to-mhpmcounters':=
 [[3, 3, 8], [4, 4, 16], [5, 5, 512], [6, 6, 256], [65536, 65536, 16384], [=
65537, 65537, 32768], [65538, 65538, 65536], [65539, 65539, 131072], [65561=
, 65561, 64], [65569, 65569, 32]], 'riscv,event-to-mhpmevent': [[3, 0, 1], =
[4, 0, 2], [5, 0, 7], [6, 0, 6], [10, 0, 11], [65536, 0, 12], [65537, 0, 13=
], [65538, 0, 14], [65539, 0, 15], [65561, 0, 4], [65569, 0, 3]], 'riscv,ra=
w-event-to-mhpmcounters': [[0, 1, 4294967295, 4294967295, 8], [0, 2, 429496=
7295, 4294967295, 16], [0, 3, 4294967295, 4294967295, 32], [0, 4, 429496729=
5, 4294967295, 64], [0, 5, 4294967295, 4294967295, 128], [0, 6, 4294967295,=
 4294967295, 256], [0, 7, 4294967295, 4294967295, 512], [0, 11, 4294967295,=
 4294967295, 8192], [0, 12, 4294967295, 4294967295, 16384], [0, 13, 4294967=
295, 4294967295, 32768], [0, 14, 4294967295, 4294967295, 65536], [0, 15, 42=
94967295, 4294967295, 131072]]} should not be valid under {'type': 'object'}
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
/tmp/tmp.SOQ8Wz6Pug/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-pa=
nel-720p.dtb: soc: pmu: {'compatible': ['riscv,pmu'], 'riscv,event-to-mhpmc=
ounters': [[3, 3, 8], [4, 4, 16], [5, 5, 512], [6, 6, 256], [65536, 65536, =
16384], [65537, 65537, 32768], [65538, 65538, 65536], [65539, 65539, 131072=
], [65561, 65561, 64], [65569, 65569, 32]], 'riscv,event-to-mhpmevent': [[3=
, 0, 1], [4, 0, 2], [5, 0, 7], [6, 0, 6], [10, 0, 11], [65536, 0, 12], [655=
37, 0, 13], [65538, 0, 14], [65539, 0, 15], [65561, 0, 4], [65569, 0, 3]], =
'riscv,raw-event-to-mhpmcounters': [[0, 1, 4294967295, 4294967295, 8], [0, =
2, 4294967295, 4294967295, 16], [0, 3, 4294967295, 4294967295, 32], [0, 4, =
4294967295, 4294967295, 64], [0, 5, 4294967295, 4294967295, 128], [0, 6, 42=
94967295, 4294967295, 256], [0, 7, 4294967295, 4294967295, 512], [0, 11, 42=
94967295, 4294967295, 8192], [0, 12, 4294967295, 4294967295, 16384], [0, 13=
, 4294967295, 4294967295, 32768], [0, 14, 4294967295, 4294967295, 65536], [=
0, 15, 4294967295, 4294967295, 131072]]} should not be valid under {'type':=
 'object'}
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
/tmp/tmp.SOQ8Wz6Pug/arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dtb=
: soc: pmu: {'compatible': ['riscv,pmu'], 'riscv,event-to-mhpmcounters': [[=
3, 3, 8], [4, 4, 16], [5, 5, 512], [6, 6, 256], [65536, 65536, 16384], [655=
37, 65537, 32768], [65538, 65538, 65536], [65539, 65539, 131072], [65561, 6=
5561, 64], [65569, 65569, 32]], 'riscv,event-to-mhpmevent': [[3, 0, 1], [4,=
 0, 2], [5, 0, 7], [6, 0, 6], [10, 0, 11], [65536, 0, 12], [65537, 0, 13], =
[65538, 0, 14], [65539, 0, 15], [65561, 0, 4], [65569, 0, 3]], 'riscv,raw-e=
vent-to-mhpmcounters': [[0, 1, 4294967295, 4294967295, 8], [0, 2, 429496729=
5, 4294967295, 16], [0, 3, 4294967295, 4294967295, 32], [0, 4, 4294967295, =
4294967295, 64], [0, 5, 4294967295, 4294967295, 128], [0, 6, 4294967295, 42=
94967295, 256], [0, 7, 4294967295, 4294967295, 512], [0, 11, 4294967295, 42=
94967295, 8192], [0, 12, 4294967295, 4294967295, 16384], [0, 13, 4294967295=
, 4294967295, 32768], [0, 14, 4294967295, 4294967295, 65536], [0, 15, 42949=
67295, 4294967295, 131072]]} should not be valid under {'type': 'object'}
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
/tmp/tmp.SOQ8Wz6Pug/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dtb: soc:=
 pmu: {'compatible': ['riscv,pmu'], 'riscv,event-to-mhpmcounters': [[3, 3, =
8], [4, 4, 16], [5, 5, 512], [6, 6, 256], [65536, 65536, 16384], [65537, 65=
537, 32768], [65538, 65538, 65536], [65539, 65539, 131072], [65561, 65561, =
64], [65569, 65569, 32]], 'riscv,event-to-mhpmevent': [[3, 0, 1], [4, 0, 2]=
, [5, 0, 7], [6, 0, 6], [10, 0, 11], [65536, 0, 12], [65537, 0, 13], [65538=
, 0, 14], [65539, 0, 15], [65561, 0, 4], [65569, 0, 3]], 'riscv,raw-event-t=
o-mhpmcounters': [[0, 1, 4294967295, 4294967295, 8], [0, 2, 4294967295, 429=
4967295, 16], [0, 3, 4294967295, 4294967295, 32], [0, 4, 4294967295, 429496=
7295, 64], [0, 5, 4294967295, 4294967295, 128], [0, 6, 4294967295, 42949672=
95, 256], [0, 7, 4294967295, 4294967295, 512], [0, 11, 4294967295, 42949672=
95, 8192], [0, 12, 4294967295, 4294967295, 16384], [0, 13, 4294967295, 4294=
967295, 32768], [0, 14, 4294967295, 4294967295, 65536], [0, 15, 4294967295,=
 4294967295, 131072]]} should not be valid under {'type': 'object'}
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
/tmp/tmp.SOQ8Wz6Pug/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-pa=
nel-480p.dtb: soc: pmu: {'compatible': ['riscv,pmu'], 'riscv,event-to-mhpmc=
ounters': [[3, 3, 8], [4, 4, 16], [5, 5, 512], [6, 6, 256], [65536, 65536, =
16384], [65537, 65537, 32768], [65538, 65538, 65536], [65539, 65539, 131072=
], [65561, 65561, 64], [65569, 65569, 32]], 'riscv,event-to-mhpmevent': [[3=
, 0, 1], [4, 0, 2], [5, 0, 7], [6, 0, 6], [10, 0, 11], [65536, 0, 12], [655=
37, 0, 13], [65538, 0, 14], [65539, 0, 15], [65561, 0, 4], [65569, 0, 3]], =
'riscv,raw-event-to-mhpmcounters': [[0, 1, 4294967295, 4294967295, 8], [0, =
2, 4294967295, 4294967295, 16], [0, 3, 4294967295, 4294967295, 32], [0, 4, =
4294967295, 4294967295, 64], [0, 5, 4294967295, 4294967295, 128], [0, 6, 42=
94967295, 4294967295, 256], [0, 7, 4294967295, 4294967295, 512], [0, 11, 42=
94967295, 4294967295, 8192], [0, 12, 4294967295, 4294967295, 16384], [0, 13=
, 4294967295, 4294967295, 32768], [0, 14, 4294967295, 4294967295, 65536], [=
0, 15, 4294967295, 4294967295, 131072]]} should not be valid under {'type':=
 'object'}
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#

Thanks,
Conor.

>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/b=
oot/dts/allwinner/sun20i-d1s.dtsi
> index 8275630af977..d9031ccdec89 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -72,5 +72,45 @@ plic: interrupt-controller@10000000 {
>  			#address-cells =3D <0>;
>  			#interrupt-cells =3D <2>;
>  		};
> +
> +		pmu {
> +			compatible =3D "riscv,pmu";
> +			riscv,event-to-mhpmcounters =3D
> +				<0x00003 0x00003 0x00000008>,
> +				<0x00004 0x00004 0x00000010>,
> +				<0x00005 0x00005 0x00000200>,
> +				<0x00006 0x00006 0x00000100>,
> +				<0x10000 0x10000 0x00004000>,
> +				<0x10001 0x10001 0x00008000>,
> +				<0x10002 0x10002 0x00010000>,
> +				<0x10003 0x10003 0x00020000>,
> +				<0x10019 0x10019 0x00000040>,
> +				<0x10021 0x10021 0x00000020>;
> +			riscv,event-to-mhpmevent =3D
> +				<0x00003 0x00000000 0x00000001>,
> +				<0x00004 0x00000000 0x00000002>,
> +				<0x00005 0x00000000 0x00000007>,
> +				<0x00006 0x00000000 0x00000006>,
> +				<0x0000a 0x00000000 0x0000000b>,
> +				<0x10000 0x00000000 0x0000000c>,
> +				<0x10001 0x00000000 0x0000000d>,
> +				<0x10002 0x00000000 0x0000000e>,
> +				<0x10003 0x00000000 0x0000000f>,
> +				<0x10019 0x00000000 0x00000004>,
> +				<0x10021 0x00000000 0x00000003>;
> +			riscv,raw-event-to-mhpmcounters =3D
> +				<0x00000000 0x00000001 0xffffffff 0xffffffff 0x00000008>,
> +				<0x00000000 0x00000002 0xffffffff 0xffffffff 0x00000010>,
> +				<0x00000000 0x00000003 0xffffffff 0xffffffff 0x00000020>,
> +				<0x00000000 0x00000004 0xffffffff 0xffffffff 0x00000040>,
> +				<0x00000000 0x00000005 0xffffffff 0xffffffff 0x00000080>,
> +				<0x00000000 0x00000006 0xffffffff 0xffffffff 0x00000100>,
> +				<0x00000000 0x00000007 0xffffffff 0xffffffff 0x00000200>,
> +				<0x00000000 0x0000000b 0xffffffff 0xffffffff 0x00002000>,
> +				<0x00000000 0x0000000c 0xffffffff 0xffffffff 0x00004000>,
> +				<0x00000000 0x0000000d 0xffffffff 0xffffffff 0x00008000>,
> +				<0x00000000 0x0000000e 0xffffffff 0xffffffff 0x00010000>,
> +				<0x00000000 0x0000000f 0xffffffff 0xffffffff 0x00020000>;
> +		};
>  	};
>  };
> --
> 2.41.0
>=20

--atGRTUxlIzGLipnB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOqr+wAKCRB4tDGHoIJi
0oG1AQDlTw7tl1+4qmyrXx9JJNSL03Wrc1nEnVa0WuHKKgOyOgEA/rudVacHS53z
9tfrPLqeMZpBZX4PJ6N0CZ2DRrpLDQQ=
=uox5
-----END PGP SIGNATURE-----

--atGRTUxlIzGLipnB--


--===============3600962040196219709==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3600962040196219709==--

