Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EA0C76196
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Apr 2023 11:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YBPDki1pTKaCc+XN8+6cgLLZmolvAONvWXF4g1o4TGw=; b=aqZNLjW/lLlv9Q
	a85fBWQosyy5Qp5c+KmeS4NKn//BdGdhJx3DfH8qOGQCJwCJwsF/085TJkXsEedhUxMSjNvdsHflH
	bDqN1lTU2IyhGmLEMvqVtjBx10cSBulgrx00SqfSllFJO6YqZ7k5wQ4Bl7Ey7Coa2j+TQFk5nyoRG
	xDMlxitBHuMBHUwnkM4xYlhY9J7YBjNYWXxJLyisJvnKOF0qBavd1BIuoFXGIxgopGP9Fu+3Vav1D
	oYBHkoflD14KGJpqnA4pyhKpUr9xB2z8H9Qkr7xgjF2mwupjAUXHox1SV32W9Sc0uzYQgjq/COzRi
	wt0+lqF5Txst4QoyOSPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piva6-00CL12-04;
	Sun, 02 Apr 2023 11:09:06 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piva0-00CL08-38
	for linux-riscv@lists.infradead.org;
	Sun, 02 Apr 2023 11:09:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680433740; x=1711969740;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qy1VzfYLHBP3sZ5cpWHlZKVBdBbBuMg+V60NMwbAF6Q=;
  b=Sn/M51vVku/1nV6zYp7sWuCIYXr5OlluIjPQg4nxxVsDnrmheynA16ht
   r4qtbpjo0G7aDcdscPSr8CasdBCGjygdjeuiSf1CbKqmRJqkv60lSsNoM
   KYSwt7Jcoy+qzRXzpdQX9dTt9MPe10dZ3sEyuGQ8H2czAhnfl+KOYD0aa
   5L5GCWwtp+etqPWcZhtTZxlumXd3n1KoPZCd0m/ZLio4QQNRVCUJ4zOyk
   eytDISlY8UfN6559cAfYQVp4PHwYLs4nQxDz3coKu5GtdyWsTMDF7fD0R
   Y/+Pg2dMx/K+uWEm1FQ5QNvhzVl+a5P7y3xbpQDKRGEhc1xjexGR2widz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="344276947"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; 
   d="scan'208";a="344276947"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 04:08:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="809548056"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; 
   d="scan'208";a="809548056"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orsmga004.jf.intel.com with ESMTP; 02 Apr 2023 04:08:54 -0700
Date: Sun, 2 Apr 2023 18:57:18 +0800
From: Xu Yilun <yilun.xu@intel.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-fpga@vger.kernel.org, conor@kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>,
	Tom Rix <trix@redhat.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] fpga: add PolarFire SoC Auto Update support
Message-ID: <ZClfjuLa/pRATwCp@yilunxu-OptiPlex-7050>
References: <20230331071823.956087-1-conor.dooley@microchip.com>
 <20230331071823.956087-7-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230331071823.956087-7-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_040901_094084_EABE648B 
X-CRM114-Status: GOOD (  51.85  )
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

On 2023-03-31 at 08:18:22 +0100, Conor Dooley wrote:
> Add support for Auto Update reprogramming of the FPGA fabric on
> PolarFire SoC, using the fw_upload mechanism a la the
> intel-m10-bmc-sec-update driver.

I'm not an expert of MTD and have several concerns about the mtd
writing part:

- This seems a generic case that writing a file content into the
  driver restricted offset on mtd.

- Seems the firmware update interface could be created for mtd device,
  like the nvmem interface?

- I assume the purpose of the fw upload interface is to protect
  unexpected writing from user. So how to protect the mtd be
  written by other user interfaces like mtdchar/block or nvmem?


For other parts:

- directory block check, fw upload don't touch this block, so why check
  it in fw upload process.

- image verification, no matter pass or fail, fw upload is actually done,
  the flash is written and no way to rollback. So may remove from fw
  upload process.

Thanks,
Yilun

> =

> This driver only writes the image to the spi flash & performs
> validation on it, as the entire FPGA becomes unusable during the actual
> reprogramming of a bitstream. To initiate the reprogramming itself, a
> device reset is required.
> The SBI SRST extension's "cold reboot" can trigger such a device reset,
> by means of a "Tamper Macro" in the FPGA fabric, provided corresponding
> support has been enabled in the HSS (Hart Software Services).
> =

> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/fpga/Kconfig                 |  11 +
>  drivers/fpga/Makefile                |   3 +-
>  drivers/fpga/microchip-auto-update.c | 494 +++++++++++++++++++++++++++
>  3 files changed, 507 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/fpga/microchip-auto-update.c
> =

> diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
> index 0a00763b9f28..2838ce7ddafe 100644
> --- a/drivers/fpga/Kconfig
> +++ b/drivers/fpga/Kconfig
> @@ -257,6 +257,17 @@ config FPGA_M10_BMC_SEC_UPDATE
>  	  (BMC) and provides support for secure updates for the BMC image,
>  	  the FPGA image, the Root Entry Hashes, etc.
>  =

> +config FPGA_MICROCHIP_AUTO_UPDATE
> +	tristate "Microchip PolarFire SoC AUTO UPDATE"
> +	depends on POLARFIRE_SOC_SYS_CTRL
> +	select FW_LOADER
> +	select FW_UPLOAD
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
> index 72e554b4d2f7..0b1ba6db860d 100644
> --- a/drivers/fpga/Makefile
> +++ b/drivers/fpga/Makefile
> @@ -25,8 +25,9 @@ obj-$(CONFIG_FPGA_MGR_LATTICE_SYSCONFIG_SPI)	+=3D latti=
ce-sysconfig-spi.o
>  obj-$(CONFIG_ALTERA_PR_IP_CORE)		+=3D altera-pr-ip-core.o
>  obj-$(CONFIG_ALTERA_PR_IP_CORE_PLAT)	+=3D altera-pr-ip-core-plat.o
>  =

> -# FPGA Secure Update Drivers
> +# FPGA Firmware Upload Drivers
>  obj-$(CONFIG_FPGA_M10_BMC_SEC_UPDATE)	+=3D intel-m10-bmc-sec-update.o
> +obj-$(CONFIG_FPGA_MICROCHIP_AUTO_UPDATE)	+=3D microchip-auto-update.o
>  =

>  # FPGA Bridge Drivers
>  obj-$(CONFIG_FPGA_BRIDGE)		+=3D fpga-bridge.o
> diff --git a/drivers/fpga/microchip-auto-update.c b/drivers/fpga/microchi=
p-auto-update.c
> new file mode 100644
> index 000000000000..5fa920b659c6
> --- /dev/null
> +++ b/drivers/fpga/microchip-auto-update.c
> @@ -0,0 +1,494 @@
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
> +#include <linux/firmware.h>
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
> +#define AUTO_UPDATE_TIMEOUT_MS		60000
> +
> +struct mpfs_auto_update_priv {
> +	struct mpfs_sys_controller *sys_controller;
> +	struct device *dev;
> +	struct mtd_info *flash;
> +	struct fw_upload *fw_uploader;
> +	struct completion programming_complete;
> +	size_t size_per_bitstream;
> +	bool cancel_request;
> +};
> +
> +static enum fw_upload_err mpfs_auto_update_prepare(struct fw_upload *fw_=
uploader, const u8 *data,
> +						   u32 size)
> +{
> +	struct mpfs_auto_update_priv *priv =3D fw_uploader->dd_handle;
> +	size_t erase_size =3D AUTO_UPDATE_DIRECTORY_SIZE;
> +
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
> +
> +	priv->flash =3D mpfs_sys_controller_get_flash(priv->sys_controller);
> +	if (!priv->flash)
> +		return FW_UPLOAD_ERR_HW_ERROR;
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
> +	priv->size_per_bitstream =3D priv->flash->size - SZ_1K - SZ_1M;
> +	priv->size_per_bitstream =3D round_down(priv->size_per_bitstream / 3, e=
rase_size);
> +	if (priv->size_per_bitstream > 20 * SZ_1M)
> +		priv->size_per_bitstream =3D 20 * SZ_1M;
> +
> +	if (priv->size_per_bitstream < size) {
> +		dev_err(priv->dev,
> +			"flash device has insufficient capacity to store this bitstream\n");
> +		return FW_UPLOAD_ERR_INVALID_SIZE;
> +	}
> +
> +	priv->cancel_request =3D false;
> +
> +	return FW_UPLOAD_ERR_NONE;
> +}
> +
> +static void mpfs_auto_update_cancel(struct fw_upload *fw_uploader)
> +{
> +	struct mpfs_auto_update_priv *priv =3D fw_uploader->dd_handle;
> +
> +	priv->cancel_request =3D true;
> +}
> +
> +static enum fw_upload_err mpfs_auto_update_poll_complete(struct fw_uploa=
d *fw_uploader)
> +{
> +	struct mpfs_auto_update_priv *priv =3D fw_uploader->dd_handle;
> +	int ret;
> +
> +	/*
> +	 * There is no meaningful way to get the status of the programming while
> +	 * it is in progress, so attempting anything other than waiting for it
> +	 * to complete would be misplaced.
> +	 */
> +	ret =3D wait_for_completion_timeout(&priv->programming_complete,
> +					  msecs_to_jiffies(AUTO_UPDATE_TIMEOUT_MS));
> +	if (ret)
> +		return FW_UPLOAD_ERR_TIMEOUT;
> +
> +	return FW_UPLOAD_ERR_NONE;
> +}
> +
> +static int mpfs_auto_update_verify_image(struct fw_upload *fw_uploader)
> +{
> +	struct mpfs_auto_update_priv *priv =3D fw_uploader->dd_handle;
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
> +	}
> +
> +	dev_info(priv->dev, "Verification of Upgrade Image passed!\n");
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
> +static int mpfs_auto_update_set_image_address(struct mpfs_auto_update_pr=
iv *priv, char *buffer,
> +					      u32 image_address, loff_t directory_address)
> +{
> +	struct erase_info erase;
> +	size_t erase_size =3D AUTO_UPDATE_DIRECTORY_SIZE;
> +	size_t bytes_written =3D 0, bytes_read =3D 0;
> +	int ret;
> +
> +	erase_size =3D round_up(erase_size, (u64)priv->flash->erasesize);
> +
> +	erase.addr =3D AUTO_UPDATE_DIRECTORY_BASE;
> +	erase.len =3D erase_size;
> +
> +	/*
> +	 * We need to write the "SPI DIRECTORY" to the first 1 KiB, telling
> +	 * the system controller where to find the actual bitstream. Since
> +	 * this is spi-nor, we have to read the first eraseblock, erase that
> +	 * portion of the flash, modify the data and then write it back.
> +	 * There's no need to do this though if things are already the way they
> +	 * should be, so check and save the write in that case.
> +	 */
> +	ret =3D mtd_read(priv->flash, AUTO_UPDATE_DIRECTORY_BASE, erase_size, &=
bytes_read,
> +		       (u_char *)buffer);
> +	if (ret)
> +		return ret;
> +
> +	if (bytes_read !=3D erase_size)
> +		return -EIO;
> +
> +	if ((*(u32 *)(buffer + AUTO_UPDATE_UPGRADE_DIRECTORY) =3D=3D image_addr=
ess) &&
> +	    !(*(u32 *)(buffer + AUTO_UPDATE_BLANK_DIRECTORY)))
> +		return 0;
> +
> +	ret =3D mtd_erase(priv->flash, &erase);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Populate the image address and then zero out the next directory so
> +	 * that the system controller doesn't complain if in "Single Image"
> +	 * mode.
> +	 */
> +	memcpy(buffer + AUTO_UPDATE_UPGRADE_DIRECTORY, &image_address,
> +	       AUTO_UPDATE_DIRECTORY_WIDTH);
> +	memset(buffer + AUTO_UPDATE_BLANK_DIRECTORY, 0x0, AUTO_UPDATE_DIRECTORY=
_WIDTH);
> +
> +	dev_info(priv->dev, "Writing the image address (%x) to the flash direct=
ory (%llx)\n",
> +		 image_address, directory_address);
> +
> +	ret =3D mtd_write(priv->flash, 0x0, erase_size, &bytes_written, (u_char=
 *)buffer);
> +	if (ret)
> +		return ret;
> +
> +	if (bytes_written !=3D erase_size)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int mpfs_auto_update_write_bitstream(struct fw_upload *fw_uploade=
r, const u8 *data,
> +					    u32 offset, u32 size, u32 *written)
> +{
> +	struct mpfs_auto_update_priv *priv =3D fw_uploader->dd_handle;
> +	struct erase_info erase;
> +	char *buffer;
> +	loff_t directory_address =3D AUTO_UPDATE_UPGRADE_DIRECTORY;
> +	size_t erase_size =3D AUTO_UPDATE_DIRECTORY_SIZE;
> +	size_t bytes_written =3D 0;
> +	u32 image_address;
> +	int ret;
> +
> +	erase_size =3D round_up(erase_size, (u64)priv->flash->erasesize);
> +
> +	image_address =3D AUTO_UPDATE_BITSTREAM_BASE +
> +		AUTO_UPDATE_UPGRADE_INDEX * priv->size_per_bitstream;
> +
> +	buffer =3D devm_kzalloc(priv->dev, erase_size, GFP_KERNEL);
> +	if (!buffer)
> +		return -ENOMEM;
> +
> +	ret =3D mpfs_auto_update_set_image_address(priv, buffer, image_address,=
 directory_address);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to set image address in the SPI directory: =
%d\n", ret);
> +		goto out;
> +	}
> +
> +	/*
> +	 * Now the .spi image itself can be written to the flash. Preservation
> +	 * of contents here is not important here, unlike the spi "directory"
> +	 * which must be RMWed.
> +	 */
> +	erase.len =3D round_up(size, (size_t)priv->flash->erasesize);
> +	erase.addr =3D image_address;
> +
> +	dev_info(priv->dev, "Erasing the flash at address (%x)\n", image_addres=
s);
> +	ret =3D mtd_erase(priv->flash, &erase);
> +	if (ret)
> +		goto out;
> +
> +	/*
> +	 * No parsing etc of the bitstream is required. The system controller
> +	 * will do all of that itself - including verifying that the bitstream
> +	 * is valid.
> +	 */
> +	dev_info(priv->dev, "Writing the image to the flash at address (%x)\n",=
 image_address);
> +	ret =3D mtd_write(priv->flash, (loff_t)image_address, size, &bytes_writ=
ten, data);
> +	if (ret)
> +		goto out;
> +
> +	if (bytes_written !=3D size) {
> +		ret =3D -EIO;
> +		goto out;
> +	}
> +
> +	*written =3D bytes_written;
> +
> +out:
> +	devm_kfree(priv->dev, buffer);
> +	return ret;
> +}
> +
> +static enum fw_upload_err mpfs_auto_update_write(struct fw_upload *fw_up=
loader, const u8 *data,
> +						 u32 offset, u32 size, u32 *written)
> +{
> +	struct mpfs_auto_update_priv *priv =3D fw_uploader->dd_handle;
> +	enum fw_upload_err err =3D FW_UPLOAD_ERR_NONE;
> +	int ret;
> +
> +	reinit_completion(&priv->programming_complete);
> +
> +	ret =3D mpfs_auto_update_write_bitstream(fw_uploader, data, offset, siz=
e, written);
> +	if (ret) {
> +		err =3D FW_UPLOAD_ERR_RW_ERROR;
> +		goto out;
> +	}
> +
> +	if (priv->cancel_request) {
> +		err =3D FW_UPLOAD_ERR_CANCELED;
> +		goto out;
> +	}
> +
> +	ret =3D mpfs_auto_update_verify_image(fw_uploader);
> +	if (ret)
> +		err =3D FW_UPLOAD_ERR_HW_ERROR;
> +
> +out:
> +	complete(&priv->programming_complete);
> +
> +	return err;
> +}
> +
> +static const struct fw_upload_ops mpfs_auto_update_ops =3D {
> +	.prepare =3D mpfs_auto_update_prepare,
> +	.write =3D mpfs_auto_update_write,
> +	.poll_complete =3D mpfs_auto_update_poll_complete,
> +	.cancel =3D mpfs_auto_update_cancel,
> +};
> +
> +static int mpfs_auto_update_available(struct mpfs_auto_update_priv *priv)
> +{
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
> +	if (!response)
> +		return -ENOMEM;
> +
> +	message =3D devm_kzalloc(priv->dev, sizeof(struct mpfs_mss_msg), GFP_KE=
RNEL);
> +	if (!message)
> +		return -ENOMEM;
> +
> +	/*
> +	 * To verify that Auto Update is possible, the "Query Security Service
> +	 * Request" is performed.
> +	 * This service has no command data & does not overload mbox_offset.
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
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Currently, the system controller's firmware does not generate any
> +	 * interrupts for failed services, so mpfs_blocking_transaction() should
> +	 * time out & therefore return an error.
> +	 * Hitting this check is highly unlikely at present, but if the system
> +	 * controller's behaviour changes so that it does generate interrupts
> +	 * for failed services, it will be required.
> +	 */
> +	if (response->resp_status)
> +		return -EIO;
> +
> +	/*
> +	 * Bit 5 of byte 1 is "UL_Auto Update" & if it is set, Auto Update is
> +	 * not possible.
> +	 */
> +	if (response_msg[1] & AUTO_UPDATE_FEATURE_ENABLED)
> +		return -EPERM;
> +
> +	return 0;
> +}
> +
> +static int mpfs_auto_update_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct mpfs_auto_update_priv *priv;
> +	struct fw_upload *fw_uploader;
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
> +	ret =3D mpfs_auto_update_available(priv);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "The current bitstream does not support auto-update\n");
> +
> +	init_completion(&priv->programming_complete);
> +
> +	fw_uploader =3D firmware_upload_register(THIS_MODULE, dev, "mpfs_bitstr=
eam",
> +					       &mpfs_auto_update_ops, priv);
> +	if (IS_ERR(fw_uploader))
> +		return dev_err_probe(dev, PTR_ERR(fw_uploader),
> +				     "Failed to register the bitstream uploader\n");
> +
> +	priv->fw_uploader =3D fw_uploader;
> +
> +	return 0;
> +}
> +
> +static void mpfs_auto_update_remove(struct platform_device *pdev)
> +{
> +	struct mpfs_auto_update_priv *priv =3D platform_get_drvdata(pdev);
> +
> +	firmware_upload_unregister(priv->fw_uploader);
> +}
> +
> +static struct platform_driver mpfs_auto_update_driver =3D {
> +	.driver =3D {
> +		.name =3D "mpfs-auto-update",
> +	},
> +	.probe =3D mpfs_auto_update_probe,
> +	.remove_new =3D mpfs_auto_update_remove,
> +};
> +module_platform_driver(mpfs_auto_update_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
> +MODULE_DESCRIPTION("PolarFire SoC Auto Update FPGA reprogramming");
> -- =

> 2.39.2
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
