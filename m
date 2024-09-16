Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66222C3ABB2
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2024 23:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2fYAfpS5LmSiyOV36J4SpDrSTS9wHY6aUkmxm6Vl2AY=; b=3HoP82ZVUR9SFbl04jH2PK+9Cc
	iHuui/pKMoNBFsKDGktf1RJy5at0Dt2kvd61dDuBZzQfF2IX63Nc7nQGuPlI429WAm77RWJzZr5Ns
	mZI1OUjdIIqqcwbTcTBEhh6zPPgdUy13hHGhzahdIQ/AjTkFjdIyJ6dFq94Ee9A5Ttu5dMSEJfCXO
	r5krBrl0fjVmBAN89V0d44vNPNp6EotCuI2Gjv0Td+hDvI8bf4gn0PEPiRr3+vPJ2mLMKZd2LRBw/
	BrZw2H5P7gpAI8uO3pHe5TxZikjDQ6WwFPnzObze2gIWdYKoO7N/UhqL634/Ph0QQTgEuN8R4NgjZ
	qdlUo8oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqL82-000000054bg-1AGI;
	Mon, 16 Sep 2024 23:27:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqL7z-000000054b0-0f7y
	for linux-riscv@lists.infradead.org;
	Mon, 16 Sep 2024 23:27:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 62E78A42621;
	Mon, 16 Sep 2024 23:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2DD5C4CECD;
	Mon, 16 Sep 2024 23:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726529249;
	bh=6PKLP5nJxo69KdUzS/c24s9Y/dUih0IJZ1KEF4ZmamQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=iAV6xo0iNp0MNnGFcQQbXp7SYsOHyJ0KPYC2MgUOl4L7rRruOYQRpCUHTLqYPwVWR
	 toVgL7Tn/lnAXguoXU2PTJ+ZFPZSP7rTOWK6tfuezf3KiP6zeOxDqvoReiO3oqV86q
	 ZXGXMXAreybK9acny6W9zYaIqbbjHui1b8LddqBqRb6UvfjEcpjRAVQ2PZlNd+gNRf
	 9NNIaR0Z8ehr27T4meHJXHRrj3oNLIOx+oKM1QwQ37VYyJ9Pdinoy/xZzO44UWuj6z
	 iBiVEcEYmkhuLUBHt3kFbiEczD46PBLYlM2QUEqUZBHvMFymg5Lg45CH0VAX+H4q+L
	 0xjLHUC47im9Q==
Date: Mon, 16 Sep 2024 18:27:28 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Haylen Chu <heylenay@outlook.com>
Cc: Inochi Amaoto <inochiama@outlook.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, Chen Wang <unicornxdotw@foxmail.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <SEYPR01MB4221BDC11EE244C7D70C229DD7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
References: <SEYPR01MB4221829A2CD4D4C1704BABD7D7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
 <SEYPR01MB4221BDC11EE244C7D70C229DD7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
Message-Id: <172652924719.1569465.16339563931934185254.robh@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: spacemit: Add clock
 controllers of Spacemit K1 SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_162731_362097_813CD645 
X-CRM114-Status: UNSURE (   8.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Mon, 16 Sep 2024 22:23:09 +0000, Haylen Chu wrote:
> Add definition for the clock controllers of Spacemit K1 SoC. The clock
> tree is managed by several SoC parts, thus different compatible strings
> are added for each.
> 
> spacemit,k1-syscon.yaml is updated as well to allow clock controller
> being its subnode.
> 
> Signed-off-by: Haylen Chu <heylenay@outlook.com>
> ---
>  .../bindings/clock/spacemit,k1-ccu.yaml       |  71 +++++++
>  .../soc/spacemit/spacemit,k1-syscon.yaml      |   4 +
>  include/dt-bindings/clock/spacemit,k1-ccu.h   | 198 ++++++++++++++++++
>  3 files changed, 273 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/spacemit,k1-ccu.yaml
>  create mode 100644 include/dt-bindings/clock/spacemit,k1-ccu.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/spacemit,k1-ccu.example.dtb: system-control@d4090000: reg: [[0, 3557359616], [0, 4096]] is too long
	from schema $id: http://devicetree.org/schemas/soc/spacemit/spacemit,k1-syscon.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/spacemit,k1-ccu.example.dtb: system-control@d4090000: reg: [[0, 3557359616], [0, 4096]] is too long
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/spacemit,k1-ccu.example.dtb: clock-controller: 'spacemit,mpmu' does not match any of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '^(pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plgpio|st-spics|ts),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^al
 dec,.*', '^alfa-network,.*', '^allegro,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anvo,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blutek,.*', '^boe,.*', '^bo
 sch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bticino,.*', '^buffalo,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compulab,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csq,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^dell,.*', '^del
 ta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enclustra,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '
 ^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^focaltech,.*', '^forlinx,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '
 ^huawei,.*', '^hugsun,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.*', '^joz,.*', '^kam,.*', '^karo,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^koe,.*', '^kontro
 n,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*',
  '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^neonode,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^novatek,.*', '^novtech,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki
 ,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^pda,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phytec,.*', '^picochip,.*', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^r
 aidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raydium,.*', '^rda,.*', '^realtek,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^saef,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^sciosense,.*', '^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^siemens,.*', '^sifive,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinli
 nx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synology,.*', '^synopsys,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^teltonika,.*', '^tempo,.*', '^terasic,.*', '^tesla,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thing
 yjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '
 ^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/SEYPR01MB4221BDC11EE244C7D70C229DD7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
