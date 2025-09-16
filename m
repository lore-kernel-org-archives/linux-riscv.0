Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2BACAC592
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 18:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lqJBgdEvm73hkOVL5RkD0jE9cU5L3nYu3yshKi/7xBE=; b=bkiUy9vku8Votde4WPeGVgus3L
	/8jq0PJfgCN7YckbY0EfSuoP7JJnoTLnhXaQ6/+ZsLaYhc6Gk21YA8QUi2obPCbtErR0q46pZXocp
	hckKctp4VxzO03sYnAKf5oqseg9VVTl6IDOcqjuel1NY0yyspX63wdLg8CqAUOyfo5ciFL3I8FM+M
	PPWhwAQGe1bUpmzJtDrWlxgpzaC3cxExqBwWR1QY8ai+wy7pIRpfmhlCv0/skmqm2lqu3nALbcud1
	7A1FMdmNOE3kl7krj99UhS0idmkXqV4Fg7+ooUTzJDY5IhvZw5b9xZop4KjsCpfTp9FJNpB3YgJrc
	DmsGhB9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyaJs-00000008kSr-1cpT;
	Tue, 16 Sep 2025 18:22:24 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyaJq-00000008kSJ-2TAc
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 18:22:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758046935; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Fgmxy5E0ctPoUJ0TQE/08pxAMYnLVrXTw7LKxUKJ7ojdELpTU/z0co0en1NIgJMULH0Qw8h4+2nfgH+mh1rqrSq36gagG4+AdpOqQTMJ9hDycHUBlJ4ZrR0lyJLa15CfifY3awyHaX+S4wDUq01TUjrZQdyezZvFa1UpQ31Wbck=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758046935; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7Zdii59csrnw3oi5ffFxtLKvVki1YW4SPTo2ODMbysE=; 
	b=MRoCBPim5HmBrnxux4dCjIGrmDWO0r2yFkYacDKteYAxdciY1fbUDoYZO87RfCUQ2yn6luHHNjJwHUJOt2QgROpdQ4nfBhxHXLPOOXVl2VHy+6eBReLjLj+fWoOtgUrpY1SuhMis9KnaaiyNYB5t4ckVg6FR/PQq4Cfx7qW3FUc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758046935;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=7Zdii59csrnw3oi5ffFxtLKvVki1YW4SPTo2ODMbysE=;
	b=Q0ir9bX+SO+wQd5fWvphLUM732R6TjiMCLpEUNOyMS/1kQlZjFSatb8BT8slE0Kz
	01M1ZMVj49hErooVHSeLf5L+tAx6y4VDGhdfsdhXFGQ5ujUXCkb1CmhmFaAJnKhHOnM
	GVYzkxm1MBsf+v41brHLs+TAg6psMB5ZFajS84cA=
Received: by mx.zohomail.com with SMTPS id 1758046932947661.3912322672463;
	Tue, 16 Sep 2025 11:22:12 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id C8C84180733; Tue, 16 Sep 2025 20:22:02 +0200 (CEST)
Date: Tue, 16 Sep 2025 20:22:02 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/2] driver: reset: th1520-aon: add driver for
 poweroff/reboot via AON FW
Message-ID: <i6slr5csro54ys5g7diqyacq4deidwm6f2nhpm2uwmgjlu6tyn@otrbpij4vdya>
References: <20250818074906.2907277-1-uwu@icenowy.me>
 <20250818074906.2907277-2-uwu@icenowy.me>
MIME-Version: 1.0
In-Reply-To: <20250818074906.2907277-2-uwu@icenowy.me>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/258.4.7
X-ZohoMailClient: External
X-ZohoMail-Owner: <i6slr5csro54ys5g7diqyacq4deidwm6f2nhpm2uwmgjlu6tyn@otrbpij4vdya>+zmo_0_sebastian.reichel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_112222_665541_7C3FEBC5 
X-CRM114-Status: GOOD (  27.87  )
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
Content-Type: multipart/mixed; boundary="===============3103059066362697975=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3103059066362697975==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="32snbj5fo7anp2ks"
Content-Disposition: inline


--32snbj5fo7anp2ks
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] driver: reset: th1520-aon: add driver for
 poweroff/reboot via AON FW
MIME-Version: 1.0

Hi,

On Mon, Aug 18, 2025 at 03:49:05PM +0800, Icenowy Zheng wrote:
> This driver implements poweroff/reboot support for T-Head TH1520 SoCs
> running the AON firmware by sending a message to the AON firmware's WDG
> part.
>=20
> This is a auxiliary device driver, and expects the AON channel to be
> passed via the platform_data of the auxiliary device.
>=20
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>  MAINTAINERS                             |  1 +
>  drivers/power/reset/Kconfig             |  7 ++
>  drivers/power/reset/Makefile            |  1 +
>  drivers/power/reset/th1520-aon-reboot.c | 98 +++++++++++++++++++++++++
>  4 files changed, 107 insertions(+)
>  create mode 100644 drivers/power/reset/th1520-aon-reboot.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index daf520a13bdf6..e138a1e96ceea 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21730,6 +21730,7 @@ F:	drivers/mailbox/mailbox-th1520.c
>  F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
>  F:	drivers/pinctrl/pinctrl-th1520.c
>  F:	drivers/pmdomain/thead/
> +F:	drivers/power/reset/th1520-aon-reboot.c
>  F:	drivers/power/sequencing/pwrseq-thead-gpu.c
>  F:	drivers/reset/reset-th1520.c
>  F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> index 77ea3129c7080..8248895ca9038 100644
> --- a/drivers/power/reset/Kconfig
> +++ b/drivers/power/reset/Kconfig
> @@ -225,6 +225,13 @@ config POWER_RESET_ST
>  	help
>  	  Reset support for STMicroelectronics boards.
> =20
> +config POWER_RESET_TH1520_AON
> +	tristate "T-Head TH1520 AON firmware poweroff and reset driver"
> +	depends on TH1520_PM_DOMAINS
> +	help
> +	  This driver supports power-off and reset operations for T-Head
> +	  TH1520 SoCs running the AON firmware.
> +
>  config POWER_RESET_TORADEX_EC
>  	tristate "Toradex Embedded Controller power-off and reset driver"
>  	depends on ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
> index b7c2b5940be99..51da87e05ce76 100644
> --- a/drivers/power/reset/Makefile
> +++ b/drivers/power/reset/Makefile
> @@ -25,6 +25,7 @@ obj-$(CONFIG_POWER_RESET_QNAP) +=3D qnap-poweroff.o
>  obj-$(CONFIG_POWER_RESET_REGULATOR) +=3D regulator-poweroff.o
>  obj-$(CONFIG_POWER_RESET_RESTART) +=3D restart-poweroff.o
>  obj-$(CONFIG_POWER_RESET_ST) +=3D st-poweroff.o
> +obj-$(CONFIG_POWER_RESET_TH1520_AON) +=3D th1520-aon-reboot.o
>  obj-$(CONFIG_POWER_RESET_TORADEX_EC) +=3D tdx-ec-poweroff.o
>  obj-$(CONFIG_POWER_RESET_TPS65086) +=3D tps65086-restart.o
>  obj-$(CONFIG_POWER_RESET_VERSATILE) +=3D arm-versatile-reboot.o
> diff --git a/drivers/power/reset/th1520-aon-reboot.c b/drivers/power/rese=
t/th1520-aon-reboot.c
> new file mode 100644
> index 0000000000000..8256c1703ebe8
> --- /dev/null
> +++ b/drivers/power/reset/th1520-aon-reboot.c
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * T-HEAD TH1520 AON Firmware Reboot Driver
> + *
> + * Copyright (c) 2025 Icenowy Zheng <uwu@icenowy.me>
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/firmware/thead/thead,th1520-aon.h>
> +#include <linux/module.h>
> +#include <linux/notifier.h>
> +#include <linux/of.h>
> +#include <linux/reboot.h>
> +#include <linux/slab.h>
> +
> +#define TH1520_AON_REBOOT_PRIORITY 200
> +
> +struct th1520_aon_msg_empty_body {
> +	struct th1520_aon_rpc_msg_hdr hdr;
> +	u16 reserved[12];
> +} __packed __aligned(1);
> +
> +static int th1520_aon_pwroff_handler(struct sys_off_data *data)
> +{
> +	struct th1520_aon_chan *aon_chan =3D data->cb_data;
> +	struct th1520_aon_msg_empty_body msg =3D {};
> +
> +	msg.hdr.svc =3D TH1520_AON_RPC_SVC_WDG;
> +	msg.hdr.func =3D TH1520_AON_WDG_FUNC_POWER_OFF;
> +	msg.hdr.size =3D TH1520_AON_RPC_MSG_NUM;
> +
> +	th1520_aon_call_rpc(aon_chan, &msg);
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int th1520_aon_restart_handler(struct sys_off_data *data)
> +{
> +	struct th1520_aon_chan *aon_chan =3D data->cb_data;
> +	struct th1520_aon_msg_empty_body msg =3D {};
> +
> +	msg.hdr.svc =3D TH1520_AON_RPC_SVC_WDG;
> +	msg.hdr.func =3D TH1520_AON_WDG_FUNC_RESTART;
> +	msg.hdr.size =3D TH1520_AON_RPC_MSG_NUM;
> +
> +	th1520_aon_call_rpc(aon_chan, &msg);
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int th1520_aon_reboot_probe(struct auxiliary_device *adev,
> +				  const struct auxiliary_device_id *id)
> +{
> +	struct device *dev =3D &adev->dev;
> +	int ret;
> +
> +	/* Expect struct th1520_aon_chan to be passed via platform_data */
> +	ret =3D devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF,
> +					    TH1520_AON_REBOOT_PRIORITY,
> +					    th1520_aon_pwroff_handler,
> +					    adev->dev.platform_data);
> +
> +	if (ret) {
> +		dev_err(dev, "Failed to register power off handler\n");
> +		return ret;
> +	}
> +
> +	ret =3D devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART,
> +					    TH1520_AON_REBOOT_PRIORITY,
> +					    th1520_aon_restart_handler,
> +					    adev->dev.platform_data);
> +
> +	if (ret) {
> +		dev_err(dev, "Failed to register restart handler\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct auxiliary_device_id th1520_aon_reboot_id_table[] =3D=
 {
> +	{ .name =3D "th1520_pm_domains.reboot" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(auxiliary, th1520_aon_reboot_id_table);
> +
> +static struct auxiliary_driver th1520_aon_reboot_driver =3D {
> +	.driver =3D {
> +		.name =3D "th1520-aon-reboot",
> +	},
> +	.probe =3D th1520_aon_reboot_probe,
> +	.id_table =3D th1520_aon_reboot_id_table,
> +};
> +module_auxiliary_driver(th1520_aon_reboot_driver);
> +
> +MODULE_AUTHOR("Icenowy Zheng <uwu@icenowy.me>");
> +MODULE_DESCRIPTION("T-HEAD TH1520 AON-firmware-based reboot driver");
> +MODULE_LICENSE("GPL");
> --=20
> 2.50.1
>=20

--32snbj5fo7anp2ks
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmjJqsoACgkQ2O7X88g7
+ppT6hAAmwlFj8ocXSPVhmF7KbvyppRfxrJm4WmWJLMx2P38T0TScYKRRFbSOHiA
05BMM39pP5UmminoYfIuF7dQCNzUi3s3Z3kXKZcsgRtxEnZDbAK4UnMk+Z4WslQN
hBKG40WyAYXm63LLSl/errms4DalJlXy+0vTxMy5ygAB7rP8/NL7nCDrZ4FYnJt6
SXrzGxItZoSHJbXNiCaxKdqUvyhIWpvteh6F6qC9scl4BAUwHR0owXTqqQyoeA6w
Ikl4sD2KOFRfvfuTS+JooinIS+IPhp57ycLb3CuH5x/OhYxw2C9OCdXUKfwHMof9
TQDya+VNdWaRf5mX7gGd2mwbHHCBxM7/PuC25z3yAWDcCcTu+vpMcujNP6IxZXxN
BNVoxDMDYpHPPAYrBaCTur5KIokrIiOX6zQeb/UvEC3JAgUKB0Paz3X89lqI4TXH
/0Wx3EJM5j0Pduz0QKOr/IqmvlCU/KL3p61pYxd3NhyC4/htEPq660YoaPIhnJ4E
kSiKX6HMjITUc0OjpNexVZgcAqJGH7/52xH7rMolR2r1/pQfjcnnusIOG7MYw8NA
oXfxgVw9R7GqJujwWWg6q7/zk9IofFKPoHcgw2WH1beAC8GCRBAIwul/kHlQ/p7q
L3l6uTBHnN+1wzgfJL9jlYHSeYJ3CDcAd66geMHYqKGEOE5Lua8=
=T58L
-----END PGP SIGNATURE-----

--32snbj5fo7anp2ks--


--===============3103059066362697975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3103059066362697975==--

