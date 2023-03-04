Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8164BC64EC4
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Mar 2023 16:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zYOkXhVbYeI+b+ffx2kWM1cENDAk01Atiz0Mpdj0VDg=; b=mDZ/9zPBO37f0B
	7EWplODdM4S098AOoeMH0PJ/hOvRxDV7LnvWM5uqszVjsZ2idHfG3Z+RsfPEGOrb9s4xtxgaJ5Z5Q
	Sv3rnpGSvzfg7xecaP1Fav0tRkukkoesHLRsYi/4QOOv34fL5jVK+utPLzCai8yw9V94VJSNN7Wgh
	8JABjUIFsIaQzQhHZRYm0g3rpVLsWMtJEcNUy/06RHFJ85CB5lVlmku0EUjCQGygEuvT2KanlO2np
	rVzZWSN5DXyI5CPd1QbP3Chrow8pVswNv/vGqyNE6rS/9mL8kXHzp/0vx4E/+eZjCYsGtkgeo19GS
	iLmqFQFZYqxqNrAcQ82w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYV4W-009GFt-75; Sat, 04 Mar 2023 16:49:24 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYV4R-009GDU-RQ
	for linux-riscv@lists.infradead.org; Sat, 04 Mar 2023 16:49:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677948559; x=1709484559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=oyUVS+CbRs7zDJU/fz0SVmtIUsDVafhPl+Q9WcGOhYo=;
  b=kbByi2Vu4ouHkwZ3GwXAjOukm7r3Qn841Qtek3bWfq84Kxd9jKgpioup
   DEDqz6rM5ozYINsODZVEq7Kkf/5ir41lkjfdtGqAuWijkwKTEJkM/Ln4g
   8y/0yE+APQd+dQIvmg9jRzODB/pN3j1Itu0QILfp2OrsVj8AqmgxYzYdp
   yfUxNezunDxUuztqxoIs9tkYOkZqUQ71lbqwUrmFpX4F5cXBacf/fZNW+
   rvoUa852NjHGvZHnkRLugFgeIejqwJh5LtzCYxcWqxBKVff0pcQT+qf15
   1t9E3liu08fLKJjYfvJf6glbQ66siJT9bPnNUHXgqCUf8KWl4RA8UYOM6
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="335300716"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="335300716"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 08:49:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="625683844"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="625683844"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orsmga003.jf.intel.com with ESMTP; 04 Mar 2023 08:49:08 -0800
Date: Sun, 5 Mar 2023 00:38:00 +0800
From: Xu Yilun <yilun.xu@intel.com>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>,
	Tom Rix <trix@redhat.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fpga@vger.kernel.org
Subject: Re: [PATCH v1 5/6] fpga: add PolarFire SoC Auto Update support
Message-ID: <ZANz6NLgSja2pfYa@yilunxu-OptiPlex-7050>
References: <20230217164023.14255-1-conor@kernel.org>
 <20230217164023.14255-6-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230217164023.14255-6-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230304_084919_972159_7CEFD3BE 
X-CRM114-Status: GOOD (  44.32  )
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

On 2023-02-17 at 16:40:22 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> =

> Add support for Auto Update reprogramming of the FPGA fabric on
> PolarFire SoC.
> =

> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/fpga/Kconfig                 |   9 +
>  drivers/fpga/Makefile                |   1 +
>  drivers/fpga/microchip-auto-update.c | 495 +++++++++++++++++++++++++++
>  3 files changed, 505 insertions(+)
>  create mode 100644 drivers/fpga/microchip-auto-update.c
> =

> diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
> index 6ce143dafd04..0cdd6978a440 100644
> --- a/drivers/fpga/Kconfig
> +++ b/drivers/fpga/Kconfig
> @@ -257,6 +257,15 @@ config FPGA_M10_BMC_SEC_UPDATE
>  	  (BMC) and provides support for secure updates for the BMC image,
>  	  the FPGA image, the Root Entry Hashes, etc.
>  =

> +config FPGA_MGR_MICROCHIP_AUTO_UPDATE
> +	tristate "Microchip PolarFire SoC AUTO UPDATE"
> +	depends on POLARFIRE_SOC_SYS_CTRL
> +	help
> +	  FPGA manager driver support for reprogramming PolarFire SoC from
> +	  within Linux, using the Auto Upgrade feature of the system controller.
> +
> +	  If built as a module, it will be called microchip-auto-update.
> +
>  config FPGA_MGR_MICROCHIP_SPI
>  	tristate "Microchip Polarfire SPI FPGA manager"
>  	depends on SPI
> diff --git a/drivers/fpga/Makefile b/drivers/fpga/Makefile
> index 72e554b4d2f7..a67903edf976 100644
> --- a/drivers/fpga/Makefile
> +++ b/drivers/fpga/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_FPGA_MGR_XILINX_SPI)	+=3D xilinx-spi.o
>  obj-$(CONFIG_FPGA_MGR_ZYNQ_FPGA)	+=3D zynq-fpga.o
>  obj-$(CONFIG_FPGA_MGR_ZYNQMP_FPGA)	+=3D zynqmp-fpga.o
>  obj-$(CONFIG_FPGA_MGR_VERSAL_FPGA)	+=3D versal-fpga.o
> +obj-$(CONFIG_FPGA_MGR_MICROCHIP_AUTO_UPDATE)	+=3D microchip-auto-update.o
>  obj-$(CONFIG_FPGA_MGR_MICROCHIP_SPI)	+=3D microchip-spi.o
>  obj-$(CONFIG_FPGA_MGR_LATTICE_SYSCONFIG)	+=3D lattice-sysconfig.o
>  obj-$(CONFIG_FPGA_MGR_LATTICE_SYSCONFIG_SPI)	+=3D lattice-sysconfig-spi.o
> diff --git a/drivers/fpga/microchip-auto-update.c b/drivers/fpga/microchi=
p-auto-update.c
> new file mode 100644
> index 000000000000..d90085f86b8b
> --- /dev/null
> +++ b/drivers/fpga/microchip-auto-update.c
> @@ -0,0 +1,495 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Microchip Polarfire SoC "Auto Update" FPGA reprogramming.
> + *
> + * Documentation of this functionality is available in the "PolarFire=AE=
 FPGA and
> + * PolarFire SoC FPGA Programming" User Guide.
> + *
> + * Copyright (c) 2022-2023 Microchip Corporation. All rights reserved.
> + *
> + * Author: Conor Dooley <conor.dooley@microchip.com>
> + */
> +#include <linux/debugfs.h>
> +#include <linux/fpga/fpga-mgr.h>
> +#include <linux/math.h>
> +#include <linux/module.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/of_device.h>
> +#include <linux/sizes.h>
> +
> +#include <soc/microchip/mpfs.h>
> +
> +#define AUTO_UPDATE_DEFAULT_MBOX_OFFSET		0u
> +#define AUTO_UPDATE_DEFAULT_RESP_OFFSET		0u
> +
> +#define AUTO_UPDATE_FEATURE_CMD_OPCODE		0x05u
> +#define AUTO_UPDATE_FEATURE_CMD_DATA_SIZE	0u
> +#define AUTO_UPDATE_FEATURE_RESP_SIZE		33u
> +#define AUTO_UPDATE_FEATURE_CMD_DATA		NULL
> +#define AUTO_UPDATE_FEATURE_ENABLED		BIT(5)
> +
> +#define AUTO_UPDATE_AUTHENTICATE_CMD_OPCODE	0x22u
> +#define AUTO_UPDATE_AUTHENTICATE_CMD_DATA_SIZE	0u
> +#define AUTO_UPDATE_AUTHENTICATE_RESP_SIZE	1u
> +#define AUTO_UPDATE_AUTHENTICATE_CMD_DATA	NULL
> +
> +#define AUTO_UPDATE_PROGRAM_CMD_OPCODE		0x46u
> +#define AUTO_UPDATE_PROGRAM_CMD_DATA_SIZE	0u
> +#define AUTO_UPDATE_PROGRAM_RESP_SIZE		1u
> +#define AUTO_UPDATE_PROGRAM_CMD_DATA		NULL
> +
> +/*
> + * SPI Flash layout example:
> + * |------------------------------| 0x0000000
> + * | 1 KiB                        |
> + * | SPI "directories"            |
> + * |------------------------------| 0x0000400
> + * | 1 MiB                        |
> + * | Reserved area                |
> + * | Used for bitstream info      |
> + * |------------------------------| 0x0100400
> + * | 20 MiB                       |
> + * | Golden Image                 |
> + * |------------------------------| 0x1500400
> + * | 20 MiB                       |
> + * | Auto Upgrade Image           |
> + * |------------------------------| 0x2900400
> + * | 20 MiB                       |
> + * | Reserved for multi-image IAP |
> + * | Unused for Auto Upgrade      |
> + * |------------------------------| 0x3D00400
> + * | ? B                          |
> + * | Unused                       |
> + * |------------------------------| 0x?
> + */
> +#define AUTO_UPDATE_DIRECTORY_BASE	0u
> +#define AUTO_UPDATE_DIRECTORY_WIDTH	4u
> +#define AUTO_UPDATE_GOLDEN_INDEX	0u
> +#define AUTO_UPDATE_UPGRADE_INDEX	1u
> +#define AUTO_UPDATE_BLANK_INDEX		2u
> +#define AUTO_UPDATE_GOLDEN_DIRECTORY	(AUTO_UPDATE_DIRECTORY_WIDTH * AUTO=
_UPDATE_GOLDEN_INDEX)
> +#define AUTO_UPDATE_UPGRADE_DIRECTORY	(AUTO_UPDATE_DIRECTORY_WIDTH * AUT=
O_UPDATE_UPGRADE_INDEX)
> +#define AUTO_UPDATE_BLANK_DIRECTORY	(AUTO_UPDATE_DIRECTORY_WIDTH * AUTO_=
UPDATE_BLANK_INDEX)
> +#define AUTO_UPDATE_DIRECTORY_SIZE	SZ_1K
> +#define AUTO_UPDATE_RESERVED_SIZE	SZ_1M
> +#define AUTO_UPDATE_BITSTREAM_BASE	(AUTO_UPDATE_DIRECTORY_SIZE + AUTO_UP=
DATE_RESERVED_SIZE)
> +
> +struct mpfs_auto_update_config {
> +	u8 feature_response_size;
> +};
> +
> +struct mpfs_auto_update_priv {
> +	struct mpfs_sys_controller *sys_controller;
> +	struct device *dev;
> +	struct fpga_region *region;
> +	struct mpfs_auto_update_config *config;
> +	struct mtd_info *flash;
> +	struct dentry *debugfs_dir;
> +};
> +
> +static struct device *mpfs_auto_update_debug_dev;
> +
> +static enum fpga_mgr_states mpfs_auto_update_state(struct fpga_manager *=
mgr)
> +{
> +	struct mpfs_auto_update_priv *priv =3D mgr->priv;
> +	struct mpfs_mss_response *response;
> +	struct mpfs_mss_msg *message;
> +	u32 *response_msg;
> +	int ret;
> +	enum fpga_mgr_states rc =3D FPGA_MGR_STATE_WRITE_INIT_ERR;
> +
> +	response_msg =3D devm_kzalloc(priv->dev, AUTO_UPDATE_FEATURE_RESP_SIZE =
* sizeof(response_msg),
> +				    GFP_KERNEL);
> +	if (!response_msg)
> +		return FPGA_MGR_STATE_WRITE_INIT_ERR;
> +
> +	response =3D devm_kzalloc(priv->dev, sizeof(struct mpfs_mss_response), =
GFP_KERNEL);
> +	if (!response) {
> +		rc =3D FPGA_MGR_STATE_WRITE_INIT_ERR;
> +		goto free_response_msg;
> +	}
> +
> +	message =3D devm_kzalloc(priv->dev, sizeof(struct mpfs_mss_msg), GFP_KE=
RNEL);
> +	if (!message) {
> +		rc =3D FPGA_MGR_STATE_WRITE_INIT_ERR;
> +		goto free_response;
> +	}
> +
> +	/*
> +	 * To verify that Auto Update is possible, the "Query Security Service

Why verify the possibility here, if Auto Update is not possible, the
Auto Update device should not be populated, is it?

> +	 * Request" is performed. Bit 5 of byte 1 is "UL_Auto Update" & if it is
> +	 * set, Auto Update is not possible.
> +	 * This service has no command data & does not overload mbox_offset.
> +	 * The size of the response varies between PolarFire & PolarFire SoC.
> +	 */
> +	response->resp_msg =3D response_msg;
> +	response->resp_size =3D AUTO_UPDATE_FEATURE_RESP_SIZE;
> +	message->cmd_opcode =3D AUTO_UPDATE_FEATURE_CMD_OPCODE;
> +	message->cmd_data_size =3D AUTO_UPDATE_FEATURE_CMD_DATA_SIZE;
> +	message->response =3D response;
> +	message->cmd_data =3D AUTO_UPDATE_FEATURE_CMD_DATA;
> +	message->mbox_offset =3D AUTO_UPDATE_DEFAULT_MBOX_OFFSET;
> +	message->resp_offset =3D AUTO_UPDATE_DEFAULT_RESP_OFFSET;
> +
> +	ret =3D mpfs_blocking_transaction(priv->sys_controller, message);
> +	if (ret | response->resp_status) {
> +		rc =3D FPGA_MGR_STATE_UNKNOWN;
> +		goto free_message;
> +	}
> +
> +	if (!(response_msg[1] & AUTO_UPDATE_FEATURE_ENABLED))
> +		rc =3D FPGA_MGR_STATE_OPERATING;
> +
> +free_message:
> +	devm_kfree(priv->dev, message);
> +free_response:
> +	devm_kfree(priv->dev, response);
> +free_response_msg:
> +	devm_kfree(priv->dev, response_msg);
> +
> +	return rc;
> +}
> +
> +static int mpfs_auto_update_write_init(struct fpga_manager *mgr, struct =
fpga_image_info *info,
> +				       const char *buf, size_t count)
> +{
> +	/*
> +	 * Verifying the Golden Image is idealistic. It will be evaluated
> +	 * against the currently programmed image and thus may fail - due to
> +	 * either rollback protection (if its an older version than that in use)
> +	 * or if the version is the same as that of the in-use image.
> +	 * Extracting the information as to why a failure occurred is not
> +	 * currently possible due to limitations of the system controller
> +	 * driver. If those are fixed, verification of the Golden Image should
> +	 * be added here.
> +	 */
> +	return 0;
> +}
> +
> +static int mpfs_auto_update_write(struct fpga_manager *mgr, const char *=
buf, size_t count)
> +{
> +	/*
> +	 * No parsing etc of the bitstream is required. The system controller
> +	 * will do all of that itself - including verifying that the bitstream
> +	 * is valid.
> +	 */
> +	struct mpfs_auto_update_priv *priv =3D mgr->priv;
> +	struct erase_info erase;
> +	char *buffer;
> +	loff_t directory_address =3D AUTO_UPDATE_UPGRADE_DIRECTORY;
> +	size_t bytes_written =3D 0, bytes_read =3D 0;
> +	size_t erase_size =3D AUTO_UPDATE_DIRECTORY_SIZE;
> +	size_t size_per_bitstream =3D 0;
> +	u32 image_address;
> +	int ret;
> +
> +	priv->flash =3D mpfs_sys_controller_get_flash(priv->sys_controller);
> +	if (!priv->flash)
> +		return -EIO;
> +
> +	erase_size =3D round_up(erase_size, (u64)priv->flash->erasesize);
> +
> +	/*
> +	 * We need to calculate if we have enough space in the flash for the
> +	 * new image.
> +	 * First, chop off the first 1 KiB as it's reserved for the directory.
> +	 * The 1 MiB reserved for design info needs to be ignored also.
> +	 * All that remains is carved into 3 & rounded down to the erasesize.
> +	 * If this is smaller than the image size, we abort.
> +	 * There's also no need to consume more than 20 MiB per image.
> +	 */
> +	size_per_bitstream =3D priv->flash->size - SZ_1K - SZ_1M;
> +	size_per_bitstream =3D round_down(size_per_bitstream / 3, erase_size);
> +	if (size_per_bitstream > 20 * SZ_1M)
> +		size_per_bitstream =3D 20 * SZ_1M;
> +
> +	if (size_per_bitstream < count) {
> +		dev_err(priv->dev,
> +			"flash device has insufficient capacity to store this bitstream\n");
> +		return -EINVAL;
> +	}
> +
> +	image_address =3D AUTO_UPDATE_BITSTREAM_BASE + AUTO_UPDATE_UPGRADE_INDE=
X * size_per_bitstream;
> +
> +	buffer =3D devm_kzalloc(priv->dev, erase_size, GFP_KERNEL);
> +	if (!buffer)
> +		return -ENOMEM;
> +
> +	erase.addr =3D AUTO_UPDATE_DIRECTORY_BASE;
> +	erase.len =3D erase_size;
> +
> +	/*
> +	 * We need to write the "SPI DIRECTORY" to the first 1 KiB, telling
> +	 * the system controller where to find the actual bitstream. Since
> +	 * this is spi-nor, we have to read the first eraseblock, erase that
> +	 * portion of the flash, modify the data and then write it back.
> +	 */
> +	ret =3D mtd_read(priv->flash, AUTO_UPDATE_DIRECTORY_BASE, erase_size, &=
bytes_read,
> +		       (u_char *)buffer);
> +	if (ret)
> +		goto out;
> +
> +	if (bytes_read !=3D erase_size) {
> +		ret =3D -EIO;
> +		goto out;
> +	}
> +
> +	ret =3D mtd_erase(priv->flash, &erase);
> +	if (ret)
> +		goto out;
> +
> +	/*
> +	 * Populate the image address and then zero out the next directory so
> +	 * that the system controller doesn't complain if in "Single Image"
> +	 * mode.
> +	 */
> +	memcpy(buffer + AUTO_UPDATE_UPGRADE_DIRECTORY, &image_address, AUTO_UPD=
ATE_DIRECTORY_WIDTH);
> +	memset(buffer + AUTO_UPDATE_BLANK_DIRECTORY, 0x0, AUTO_UPDATE_DIRECTORY=
_WIDTH);

I'm wondering why the image address should be written for every
updating? Seems it is only related to the flash size, not related to
the to-be-programmed bitstream.

> +
> +	dev_info(priv->dev, "Writing the image address (%x) to the flash direct=
ory (%llx)\n",
> +		 image_address, directory_address);
> +
> +	ret =3D mtd_write(priv->flash, 0x0, erase_size, &bytes_written, (u_char=
 *)buffer);
> +	if (ret)
> +		goto out;
> +
> +	if (bytes_written !=3D erase_size) {
> +		ret =3D -EIO;
> +		goto out;
> +	}
> +
> +	/*
> +	 * Now the .spi image itself can be written to the flash. Preservation
> +	 * of contents here is not important here, unlike the spi "directory"
> +	 * which must be RMWed.
> +	 */
> +	erase.len =3D round_up(count, (size_t)priv->flash->erasesize);
> +	erase.addr =3D image_address;
> +
> +	dev_info(priv->dev, "Erasing the flash at address (%x)\n", image_addres=
s);
> +	ret =3D mtd_erase(priv->flash, &erase);
> +	if (ret)
> +		goto out;
> +
> +	dev_info(priv->dev, "Writing the image to the flash at address (%x)\n",=
 image_address);
> +	ret =3D mtd_write(priv->flash, (loff_t)image_address, count, &bytes_wri=
tten, buf);
> +	if (ret)
> +		goto out;
> +
> +	if (bytes_written !=3D count)
> +		ret =3D -EIO;
> +
> +out:
> +	devm_kfree(priv->dev, buffer);
> +	return ret;
> +}
> +
> +static int mpfs_auto_update_write_complete(struct fpga_manager *mgr, str=
uct fpga_image_info *info)
> +{
> +	struct mpfs_auto_update_priv *priv =3D mgr->priv;
> +	struct mpfs_mss_response *response;
> +	struct mpfs_mss_msg *message;
> +	u32 *response_msg;
> +	int ret;
> +
> +	response_msg =3D devm_kzalloc(priv->dev, AUTO_UPDATE_FEATURE_RESP_SIZE =
* sizeof(response_msg),
> +				    GFP_KERNEL);
> +	if (!response_msg)
> +		return -ENOMEM;
> +
> +	response =3D devm_kzalloc(priv->dev, sizeof(struct mpfs_mss_response), =
GFP_KERNEL);
> +	if (!response) {
> +		ret =3D -ENOMEM;
> +		goto free_response_msg;
> +	}
> +
> +	message =3D devm_kzalloc(priv->dev, sizeof(struct mpfs_mss_msg), GFP_KE=
RNEL);
> +	if (!message) {
> +		ret =3D -ENOMEM;
> +		goto free_response;
> +	}
> +
> +	/*
> +	 * The system controller can verify that an image in the flash is valid.
> +	 * Rather than duplicate the check in this driver, call the relevant
> +	 * service from the system controller instead.
> +	 * This service has no command data and no response data. It overloads
> +	 * mbox_offset with the image index in the flash's SPI directory where
> +	 * the bitstream is located.
> +	 */
> +	response->resp_msg =3D response_msg;
> +	response->resp_size =3D AUTO_UPDATE_AUTHENTICATE_RESP_SIZE;
> +	message->cmd_opcode =3D AUTO_UPDATE_AUTHENTICATE_CMD_OPCODE;
> +	message->cmd_data_size =3D AUTO_UPDATE_AUTHENTICATE_CMD_DATA_SIZE;
> +	message->response =3D response;
> +	message->cmd_data =3D AUTO_UPDATE_AUTHENTICATE_CMD_DATA;
> +	message->mbox_offset =3D AUTO_UPDATE_UPGRADE_INDEX;
> +	message->resp_offset =3D AUTO_UPDATE_DEFAULT_RESP_OFFSET;
> +
> +	dev_info(priv->dev, "Running verification of Upgrade Image\n");
> +	ret =3D mpfs_blocking_transaction(priv->sys_controller, message);
> +	if (ret | response->resp_status) {
> +		dev_warn(priv->dev, "Verification of Upgrade Image failed!\n");
> +		ret =3D ret ? ret : -EBADMSG;

If verification failed, what happens to the written flash? Auto roll
back?

> +	}
> +
> +	dev_info(priv->dev, "Verification of Upgrade Image passed!\n");
> +//	/*
> +//	 * If the validation has passed, initiate Auto Update.
> +//	 * This service has no command data and no response data. It overloads
> +//	 * mbox_offset with the image index in the flash's SPI directory where
> +//	 * the bitstream is located.
> +//	 * Once we attempt Auto Update either:
> +//	 * - it passes and the board reboots
> +//	 * - it fails and the board reboots to recover
> +//	 * - the system controller aborts and we exit "gracefully".
> +//	 *   "gracefully" since there is no interrupt produced & it just times
> +//	 *   out.
> +//	 */
> +//	response->resp_msg =3D response_msg;
> +//	response->resp_size =3D AUTO_UPDATE_PROGRAM_RESP_SIZE;
> +//	message->cmd_opcode =3D AUTO_UPDATE_PROGRAM_CMD_OPCODE;
> +//	message->cmd_data_size =3D AUTO_UPDATE_PROGRAM_CMD_DATA_SIZE;
> +//	message->response =3D response;
> +//	message->cmd_data =3D AUTO_UPDATE_PROGRAM_CMD_DATA;
> +//	message->mbox_offset =3D 0; //field is ignored
> +//	message->resp_offset =3D AUTO_UPDATE_DEFAULT_RESP_OFFSET;
> +//
> +//	dev_info(priv->dev, "Running Auto Update command\n");
> +//	ret =3D mpfs_blocking_transaction(priv->sys_controller, message);
> +//	if (ret && ret !=3D -ETIMEDOUT)
> +//		goto out;
> +//
> +//	/* *remove this for auto update*
> +//	 * This return 0 is dead code. Either the Auto Update will fail, or i=
t will pass
> +//	 * & the FPGA will be rebooted in which case mpfs_blocking_transactio=
n()
> +//	 * will never return and Linux will die.
> +//	 */
> +//	return 0;

Why comment out this code block?

Thanks,
Yilun

> +
> +	devm_kfree(priv->dev, message);
> +free_response:
> +	devm_kfree(priv->dev, response);
> +free_response_msg:
> +	devm_kfree(priv->dev, response_msg);
> +
> +	return ret;
> +}
> +
> +static const struct fpga_manager_ops mpfs_auto_update_ops =3D {
> +	.state =3D mpfs_auto_update_state,
> +	.write_init =3D mpfs_auto_update_write_init,
> +	.write =3D mpfs_auto_update_write,
> +	.write_complete =3D mpfs_auto_update_write_complete,
> +};
> +
> +static int mpfs_auto_update_run(struct device *dev)
> +{
> +	struct fpga_manager *mgr;
> +	struct fpga_image_info *info;
> +	int ret;
> +
> +	mgr =3D fpga_mgr_get(dev);
> +	info =3D fpga_image_info_alloc(dev);
> +
> +	info->firmware_name =3D devm_kstrdup(dev, "mpfs_bitstream.spi", GFP_KER=
NEL);
> +
> +	ret =3D fpga_mgr_lock(mgr);
> +	if (ret)
> +		goto free_info;
> +
> +	ret =3D fpga_mgr_load(mgr, info);
> +	if (ret) {
> +		dev_err(dev, "Failed to write the bitstream\n");
> +		goto unlock_mgr;
> +	}
> +
> +unlock_mgr:
> +	fpga_mgr_unlock(mgr);
> +free_info:
> +	fpga_image_info_free(info);
> +	fpga_mgr_put(mgr);
> +
> +	return ret;
> +}
> +
> +static ssize_t mpfs_auto_update_exec(struct file *file, const char __use=
r *data, size_t count,
> +				     loff_t *ppos)
> +{
> +	int ret;
> +
> +	ret =3D mpfs_auto_update_run(mpfs_auto_update_debug_dev);
> +	if (ret)
> +		dev_err_probe(mpfs_auto_update_debug_dev, ret, "Auto Update failed");
> +
> +	return count;
> +}
> +
> +static const struct file_operations mpfs_auto_update_fops =3D {
> +	.owner =3D THIS_MODULE,
> +	.open =3D simple_open,
> +	.write =3D mpfs_auto_update_exec
> +};
> +
> +static int mpfs_auto_update_debugfs_setup(struct mpfs_auto_update_priv *=
priv)
> +{
> +	priv->debugfs_dir =3D debugfs_create_dir("fpga", NULL);
> +
> +	if(IS_ERR(priv->debugfs_dir))
> +		return PTR_ERR(priv->debugfs_dir);
> +
> +	debugfs_create_file("microchip_exec_update", 0200, priv->debugfs_dir, N=
ULL,
> +			    &mpfs_auto_update_fops);
> +
> +	return 0;
> +}
> +
> +static int mpfs_auto_update_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct mpfs_auto_update_priv *priv;
> +	struct fpga_manager *mgr;
> +	enum fpga_mgr_states state;
> +	int ret;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->sys_controller =3D mpfs_sys_controller_get(dev);
> +	if (IS_ERR(priv->sys_controller))
> +		return dev_err_probe(dev, PTR_ERR(priv->sys_controller),
> +				     "Could not register as a sub device of the system controller\n"=
);
> +
> +	priv->dev =3D dev;
> +	platform_set_drvdata(pdev, priv);
> +
> +	mgr =3D devm_fpga_mgr_register(dev, "Microchip MPFS Auto Update FPGA Ma=
nager",
> +				     &mpfs_auto_update_ops, priv);
> +	if (IS_ERR(mgr))
> +		return dev_err_probe(dev, PTR_ERR(mgr), "Could not register FPGA manag=
er.\n");
> +
> +	state =3D mpfs_auto_update_state(mgr);
> +	if (state !=3D FPGA_MGR_STATE_OPERATING)
> +		return -EIO;
> +
> +	ret =3D mpfs_auto_update_debugfs_setup(priv);
> +	if (ret && ret !=3D -ENODEV)
> +		return ret;
> +
> +	mpfs_auto_update_debug_dev =3D priv->dev;
> +
> +	return 0;
> +}
> +
> +static struct platform_driver mpfs_auto_update_driver =3D {
> +	.driver =3D {
> +		.name =3D "mpfs-auto-update",
> +	},
> +	.probe =3D mpfs_auto_update_probe,
> +};
> +module_platform_driver(mpfs_auto_update_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
> +MODULE_DESCRIPTION("PolarFire SoC Auto Update FPGA reprogramming");
> -- =

> 2.39.1
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
