Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8358C83F07
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 13:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FA/ifRNNDE03gPaHOKqvcizMzknX+cr5t1WJHgKald8=; b=FUehAu1naH3yqu
	LxoKp7cjZtUtea+WHVl0Ri32plDvYVFGSHJk0xROD6FLvyigTN6xwyPCfnHADV89RB0sJkyECSazm
	J3cEWj1XWadziIWsh3OZcfPQ1E8kEpAerxjJDGdxA0KRE3gLtAfP5+KIpZpXWhQtKgBNUOHbES0mv
	A/EKEkr88Coh9QRWyMX0g5SDZhshSMlmaJd7DyVNNW8mGTi3N0gRQmZi0+CxDKpnbFgUi+trchy9E
	iE7+Hw4iaJh5yYV2lUeqEqf8fxayu42S0gbaX+S4FVuVo5/j4Hr3Hzel9GitPPYXQFMi/knOBm2kJ
	52BmdLAOWLb2hxGhS6eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxrp-00000008WsO-24Ds;
	Wed, 02 Jul 2025 13:51:17 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwv6-00000008N6n-0RWJ
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 12:50:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751460636; x=1782996636;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k/4MLllN69R+xjMZxq8j8APH8ytlW29jw6oqQSxzlYA=;
  b=CAV7bxeszNFk4dSmoCITdCBJleMaMFj+gNZuNiVBubNmOBNMShRroIxa
   L67diduI3RZMEl9OU/yeiAMAXz+ENH6ID6r5MBN65TcFJ+nxh4nk644Xg
   Yzg5beuAuhtJBLlA809t7l7NXVMmfdErjvwhHSWe40NHi2Hwui9UNcAcd
   ynsmVZJ/qSAPZLCUEr/AlhgZe6lTbhA8wIrE/338MMZV8ArmQbqbZI2f+
   lShp5fVD/pP+pjpq2yFZCHgaJ5jJzOjINAg4ybr4s+lK2T5wCXYk8HPf3
   TcmoePIJ485mnoln3A1BTSpcj4CbpOCswE8dQbttSvVplAZ9HnSzvmbZi
   A==;
X-CSE-ConnectionGUID: nNq0wD49TH66SMNu3B1MVQ==
X-CSE-MsgGUID: bhva3Ai8SoSG1fAol1WXRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57560432"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="57560432"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 05:50:35 -0700
X-CSE-ConnectionGUID: 2SXMN1wlSqaPTHE7KCqoTQ==
X-CSE-MsgGUID: PT5eXKRhSI68wWiVyTInkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="153519699"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 05:50:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uWwut-0000000BvBY-3cPP;
	Wed, 02 Jul 2025 15:50:23 +0300
Date: Wed, 2 Jul 2025 15:50:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v7 07/24] mailbox: Add RISC-V SBI message proxy (MPXY)
 based mailbox driver
Message-ID: <aGUrD2Ht1idIlDCd@smile.fi.intel.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-8-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250702051345.1460497-8-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_055036_224460_C31661BD 
X-CRM114-Status: GOOD (  34.22  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 02, 2025 at 10:43:28AM +0530, Anup Patel wrote:
> Add a mailbox controller driver for the new SBI message proxy extension
> which is part of the SBI v3.0 specification.

...

> +#include <linux/cpu.h>
> +#include <linux/errno.h>
> +#include <linux/init.h>
> +#include <linux/mailbox_controller.h>
> +#include <linux/mailbox/riscv-rpmi-message.h>

+ minmax.h

> +#include <linux/mm.h>
> +#include <linux/module.h>
> +#include <linux/msi.h>
> +#include <linux/of_irq.h>
> +#include <linux/percpu.h>
> +#include <linux/platform_device.h>
> +#include <linux/smp.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +#include <asm/byteorder.h>
> +#include <asm/sbi.h>

...

> +static void mpxy_mbox_send_rpmi_data(struct mpxy_mbox_channel *mchan,
> +				     struct rpmi_mbox_message *msg)
> +{
> +	int rc = 0;

Is it useful? I mean can you assign msg.error directly in each case?
(Just asking)

> +	switch (msg->type) {
> +	case RPMI_MBOX_MSG_TYPE_GET_ATTRIBUTE:
> +		switch (msg->attr.id) {
> +		case RPMI_MBOX_ATTR_SPEC_VERSION:
> +			msg->attr.value = mchan->attrs.msg_proto_version;
> +			break;
> +		case RPMI_MBOX_ATTR_MAX_MSG_DATA_SIZE:
> +			msg->attr.value = mchan->max_xfer_len;
> +			break;
> +		case RPMI_MBOX_ATTR_SERVICEGROUP_ID:
> +			msg->attr.value = mchan->rpmi_attrs.servicegroup_id;
> +			break;
> +		case RPMI_MBOX_ATTR_SERVICEGROUP_VERSION:
> +			msg->attr.value = mchan->rpmi_attrs.servicegroup_version;
> +			break;
> +		case RPMI_MBOX_ATTR_IMPL_ID:
> +			msg->attr.value = mchan->rpmi_attrs.impl_id;
> +			break;
> +		case RPMI_MBOX_ATTR_IMPL_VERSION:
> +			msg->attr.value = mchan->rpmi_attrs.impl_version;
> +			break;
> +		default:
> +			rc = -EOPNOTSUPP;
> +			break;
> +		}
> +		break;
> +	case RPMI_MBOX_MSG_TYPE_SET_ATTRIBUTE:
> +		/* None of the RPMI linux mailbox attributes are writeable */
> +		rc = -EOPNOTSUPP;
> +		break;
> +	case RPMI_MBOX_MSG_TYPE_SEND_WITH_RESPONSE:
> +		if ((!msg->data.request && msg->data.request_len) ||
> +		    (msg->data.request &&
> +		     msg->data.request_len > mchan->max_xfer_len) ||
> +		    (!msg->data.response && msg->data.max_response_len)) {
> +			rc = -EINVAL;
> +			break;
> +		}
> +		if (!(mchan->attrs.capability & SBI_MPXY_CHAN_CAP_SEND_WITH_RESP)) {
> +			rc = -EIO;
> +			break;
> +		}
> +		rc = mpxy_send_message_with_resp(mchan->channel_id,
> +						 msg->data.service_id,
> +						 msg->data.request,
> +						 msg->data.request_len,
> +						 msg->data.response,
> +						 msg->data.max_response_len,
> +						 &msg->data.out_response_len);
> +		break;
> +	case RPMI_MBOX_MSG_TYPE_SEND_WITHOUT_RESPONSE:
> +		if ((!msg->data.request && msg->data.request_len) ||
> +		    (msg->data.request &&
> +		     msg->data.request_len > mchan->max_xfer_len)) {
> +			rc = -EINVAL;
> +			break;
> +		}
> +		if (!(mchan->attrs.capability & SBI_MPXY_CHAN_CAP_SEND_WITHOUT_RESP)) {
> +			rc = -EIO;
> +			break;
> +		}
> +		rc = mpxy_send_message_without_resp(mchan->channel_id,
> +						    msg->data.service_id,
> +						    msg->data.request,
> +						    msg->data.request_len);
> +		break;
> +	default:
> +		rc = -EOPNOTSUPP;
> +		break;
> +	}
> +
> +	msg->error = rc;
> +}

...

> +static void mpxy_mbox_peek_rpmi_data(struct mbox_chan *chan,
> +				     struct mpxy_mbox_channel *mchan,
> +				     struct sbi_mpxy_notification_data *notif,
> +				     unsigned long events_data_len)
> +{
> +	struct rpmi_notification_event *event;
> +	unsigned long pos = 0, event_size;
> +	struct rpmi_mbox_message msg;
> +
> +	while ((pos < events_data_len) && !(pos & 0x3) &&

0x3 looks like a magic used for the non-aligned data.

> +	       ((events_data_len - pos) <= sizeof(*event))) {
> +		event = (struct rpmi_notification_event *)(notif->events_data + pos);
> +
> +		msg.type = RPMI_MBOX_MSG_TYPE_NOTIFICATION_EVENT;
> +		msg.notif.event_datalen = le16_to_cpu(event->event_datalen);
> +		msg.notif.event_id = event->event_id;
> +		msg.notif.event_data = event->event_data;
> +		msg.error = 0;
> +
> +		event_size = sizeof(*event) + msg.notif.event_datalen;

Do you trust the source? This may wrap-around...

> +		if (event_size > (events_data_len - pos)) {
> +			event_size = events_data_len - pos;
> +			goto skip_event;
> +		}
> +		if (event_size & 0x3)
> +			goto skip_event;

...and these checks be skipped. Is it a problem?

> +		mbox_chan_received_data(chan, &msg);

> +skip_event:

I think this may be replaced by a continue inside if you make a loop to be
do {} while (). But it's just a thought, you can check if it gives a better
readability after all.

> +		pos += event_size;
> +	}
> +}

...

> +static int mpxy_mbox_probe(struct platform_device *pdev)
> +{
> +	u32 i, *channel_ids __free(kfree) = NULL;

It's not recommended. Can you split channel_ids to the actual scope where it's
used? Somewhere...

> +	struct device *dev = &pdev->dev;
> +	struct mpxy_mbox_channel *mchan;
> +	struct mpxy_mbox *mbox;
> +	int msi_idx, rc;
> +
> +	/*
> +	 * Initialize MPXY shared memory only once. This also ensures
> +	 * that SBI MPXY mailbox is probed only once.
> +	 */
> +	if (mpxy_shmem_init_done) {
> +		dev_err(dev, "SBI MPXY mailbox already initialized\n");
> +		return -EALREADY;
> +	}
> +
> +	/* Probe for SBI MPXY extension */
> +	if (sbi_spec_version < sbi_mk_version(1, 0) ||
> +	    sbi_probe_extension(SBI_EXT_MPXY) <= 0) {
> +		dev_info(dev, "SBI MPXY extension not available\n");
> +		return -ENODEV;
> +	}
> +
> +	/* Find-out shared memory size */
> +	rc = mpxy_get_shmem_size(&mpxy_shmem_size);
> +	if (rc)
> +		return dev_err_probe(dev, rc, "failed to get MPXY shared memory size\n");
> +
> +	/*
> +	 * Setup MPXY shared memory on each CPU
> +	 *
> +	 * Note: Don't cleanup MPXY shared memory upon CPU power-down
> +	 * because the RPMI System MSI irqchip driver needs it to be
> +	 * available when migrating IRQs in CPU power-down path.
> +	 */
> +	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/sbi-mpxy-shmem",
> +			  mpxy_setup_shmem, NULL);
> +
> +	/* Mark as MPXY shared memory initialization done */
> +	mpxy_shmem_init_done = true;
> +
> +	/* Allocate mailbox instance */
> +	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
> +	if (!mbox)
> +		return -ENOMEM;
> +	mbox->dev = dev;
> +	platform_set_drvdata(pdev, mbox);
> +
> +	/* Find-out of number of channels */
> +	rc = mpxy_get_channel_count(&mbox->channel_count);
> +	if (rc)
> +		return dev_err_probe(dev, rc, "failed to get number of MPXY channels\n");
> +	if (!mbox->channel_count)
> +		dev_err_probe(dev, -ENODEV, "no MPXY channels available\n");
> +
> +	/* Allocate and fetch all channel IDs */
> +	channel_ids = kcalloc(mbox->channel_count, sizeof(*channel_ids), GFP_KERNEL);

...here.

> +	if (!channel_ids)
> +		return -ENOMEM;
> +	rc = mpxy_get_channel_ids(mbox->channel_count, channel_ids);
> +	if (rc)
> +		return dev_err_probe(dev, rc, "failed to get MPXY channel IDs\n");
> +
> +	/* Populate all channels */
> +	mbox->channels = devm_kcalloc(dev, mbox->channel_count,
> +				      sizeof(*mbox->channels), GFP_KERNEL);
> +	if (!mbox->channels)
> +		return -ENOMEM;
> +	for (i = 0; i < mbox->channel_count; i++) {
> +		mchan = &mbox->channels[i];
> +		mchan->mbox = mbox;
> +		mchan->channel_id = channel_ids[i];
> +
> +		rc = mpxy_read_attrs(mchan->channel_id, SBI_MPXY_ATTR_MSG_PROT_ID,
> +				     sizeof(mchan->attrs) / sizeof(u32),
> +				     (u32 *)&mchan->attrs);
> +		if (rc) {
> +			return dev_err_probe(dev, rc,
> +					     "MPXY channel 0x%x read attrs failed\n",
> +					     mchan->channel_id);
> +		}
> +
> +		if (mchan->attrs.msg_proto_id == SBI_MPXY_MSGPROTO_RPMI_ID) {
> +			rc = mpxy_mbox_read_rpmi_attrs(mchan);
> +			if (rc) {
> +				return dev_err_probe(dev, rc,
> +						     "MPXY channel 0x%x read RPMI attrs failed\n",
> +						     mchan->channel_id);
> +			}
> +		}
> +
> +		mchan->notif = devm_kzalloc(dev, mpxy_shmem_size, GFP_KERNEL);
> +		if (!mchan->notif)
> +			return -ENOMEM;
> +
> +		mchan->max_xfer_len = min(mpxy_shmem_size, mchan->attrs.msg_max_len);
> +
> +		if ((mchan->attrs.capability & SBI_MPXY_CHAN_CAP_GET_NOTIFICATIONS) &&
> +		    (mchan->attrs.capability & SBI_MPXY_CHAN_CAP_EVENTS_STATE))
> +			mchan->have_events_state = true;
> +
> +		if ((mchan->attrs.capability & SBI_MPXY_CHAN_CAP_GET_NOTIFICATIONS) &&
> +		    (mchan->attrs.capability & SBI_MPXY_CHAN_CAP_MSI))
> +			mchan->msi_index = mbox->msi_count++;
> +		else
> +			mchan->msi_index = U32_MAX;
> +		mchan->msi_irq = U32_MAX;
> +	}
> +
> +	/* Initialize mailbox controller */
> +	mbox->controller.txdone_irq = false;
> +	mbox->controller.txdone_poll = false;
> +	mbox->controller.ops = &mpxy_mbox_ops;
> +	mbox->controller.dev = dev;
> +	mbox->controller.num_chans = mbox->channel_count;
> +	mbox->controller.fw_xlate = mpxy_mbox_fw_xlate;
> +	mbox->controller.chans = devm_kcalloc(dev, mbox->channel_count,
> +					      sizeof(*mbox->controller.chans),
> +					      GFP_KERNEL);
> +	if (!mbox->controller.chans)
> +		return -ENOMEM;
> +	for (i = 0; i < mbox->channel_count; i++)
> +		mbox->controller.chans[i].con_priv = &mbox->channels[i];
> +
> +	/* Set the MSI domain if not available */
> +	if (!dev_get_msi_domain(dev)) {
> +		/*
> +		 * The device MSI domain for OF devices is only set at the
> +		 * time of populating/creating OF device. If the device MSI
> +		 * domain is discovered later after the OF device is created
> +		 * then we need to set it explicitly before using any platform
> +		 * MSI functions.
> +		 */

> +		if (dev_of_node(dev))

Do you really need this check? What about ACPI?

> +			of_msi_configure(dev, dev_of_node(dev));
> +	}
> +
> +	/* Setup MSIs for mailbox (if required) */
> +	if (mbox->msi_count) {
> +		mbox->msi_index_to_channel = devm_kcalloc(dev, mbox->msi_count,
> +							  sizeof(*mbox->msi_index_to_channel),
> +							  GFP_KERNEL);
> +		if (!mbox->msi_index_to_channel)
> +			return -ENOMEM;
> +
> +		for (msi_idx = 0; msi_idx < mbox->msi_count; msi_idx++) {
> +			for (i = 0; i < mbox->channel_count; i++) {
> +				mchan = &mbox->channels[i];
> +				if (mchan->msi_index == msi_idx) {
> +					mbox->msi_index_to_channel[msi_idx] = mchan;
> +					break;
> +				}
> +			}
> +		}
> +
> +		rc = platform_device_msi_init_and_alloc_irqs(dev, mbox->msi_count,
> +							     mpxy_mbox_msi_write);
> +		if (rc) {
> +			return dev_err_probe(dev, rc, "Failed to allocate %d MSIs\n",
> +					     mbox->msi_count);
> +		}
> +
> +		for (i = 0; i < mbox->channel_count; i++) {
> +			mchan = &mbox->channels[i];
> +			if (mchan->msi_index == U32_MAX)
> +				continue;
> +			mchan->msi_irq = msi_get_virq(dev, mchan->msi_index);
> +		}
> +	}
> +
> +	/* Register mailbox controller */
> +	rc = devm_mbox_controller_register(dev, &mbox->controller);
> +	if (rc) {
> +		dev_err_probe(dev, rc, "Registering SBI MPXY mailbox failed\n");
> +		if (mbox->msi_count)
> +			platform_device_msi_free_irqs_all(dev);
> +		return rc;
> +	}

> +	dev_info(dev, "mailbox registered with %d channels\n",
> +		 mbox->channel_count);

Working driver doesn't need to issue a message.

> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
