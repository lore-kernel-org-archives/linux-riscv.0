Return-Path: <SRS0=Oyqu=FB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3017AC5519F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2020 18:30:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEABD21534
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2020 18:30:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uRbUZnQ1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEABD21534
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/SoV9t8m0ATOz1ddSY3KFcAXaDEjg707hwZ3WVFxqy8=; b=uRbUZnQ1ZPMdIZopsSC3rbJ+HY
	NumT4Wtb4lbx4X2NQvXq2qv35bp+9dk6DwXxE9tOU2UA2h02hvXKiQXYXZrQY6n7JMp6gdM5Igs7h
	ZwisTAGHS7snkSB0obQHsSVIZThzs5uaAS/gt8Sd8+iyXS3LuK88TnLz+gmAPsUfYKbyaPdsGmAEH
	wUO/hLTDPSuMIGYeCNDkRF7dWypUZQpumYR+6t6i76acIg157agJsSPevtKPthcNx7JUNtJLVckwK
	RGXG9wmqVaO/1yL5sp7dhOUYWFtszTG30gFvkEWsFqLetmOn1iziuajs6hcPP+Nkc7p9jqZl0lgYm
	Bd4hWiYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiiVf-00086j-AJ; Fri, 27 Nov 2020 18:30:19 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiiVc-00085k-FM
 for linux-riscv@lists.infradead.org; Fri, 27 Nov 2020 18:30:18 +0000
Received: from orion.localdomain ([95.114.158.11]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M7JvQ-1kqRD03URo-007mM0; Fri, 27 Nov 2020 19:30:06 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: gpio: add virtio-gpio guest driver
Date: Fri, 27 Nov 2020 19:30:03 +0100
Message-Id: <20201127183003.2849-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:KlCmQZvHdfBaCUHqRKaT6re3C34oARxYphCrc/eeYFy7UzQelPz
 OMTBekkCmahThZza1Kn3cKgP2SVRfnyNuzqRWyHhWWMyeP43yWOSKFkh65TvmTAkaHL0C1n
 GIeaDsY45+7+j8bNfDpMOS999iM+LwW476gZRNbgkZxrJFJB+xjXc+V55bMiF3ogd5IANxg
 pytDFCYx7SAQWmBNjy+YA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0G5lIlmZGP8=:NtRQwcruQEqLE4aAkZ/UDF
 D7SJ+yerzstNK1zscXFOvlJhJ+WXMuHP4bbSHuSwsu4aSfIy+yf7XdBdp9PQ0WAtG5puSi5Rg
 fAcl6TLSLCQDydGZcxR7+fO6CJUagd5Lbq0LfqrYDN5NTyc49alQbT0IEOcN5Nvv5ue3ei/VH
 0NHN7esE0I6YrtuQv9R9n27vi3uxcMxBdT8voHNaIxZYcRZQAfC2K2vYAn8P9IBdvFFT1HE5c
 gSOGRAvXbC9nyc9qwxhMZGwp+fbcTuo10HeJssBf1s4+w/zOgOnwlDgnMClPvo1QMjZROdghv
 eJIp/1ytoBD4YkJQOdzLjeQ4EIG3vXr8tNgLGEdl7+F/iSusR8plw2SbFrs1yasLXouXipXhY
 6Kc5vfRyMb+fcImhfFMG9zjXVN1NCwIFSMCcHtaFD/+3N35PezkBcnp+8FxoZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_133016_783818_3BADF872 
X-CRM114-Status: GOOD (  27.19  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, mst@redhat.com,
 virtualization@lists.linux-foundation.org, bgolaszewski@baylibre.com,
 linux-riscv@lists.infradead.org, info@metux.net, jasowang@redhat.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Introducing new gpio driver for virtual GPIO devices via virtio.

The driver allows routing gpio control into VM guests, eg. brigding
virtual gpios to specific host gpios, or attaching simulators for
automatic application testing.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 MAINTAINERS                      |   6 +
 drivers/gpio/Kconfig             |   9 ++
 drivers/gpio/Makefile            |   1 +
 drivers/gpio/gpio-virtio.c       | 332 +++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/virtio_gpio.h |  39 +++++
 include/uapi/linux/virtio_ids.h  |   1 +
 6 files changed, 388 insertions(+)
 create mode 100644 drivers/gpio/gpio-virtio.c
 create mode 100644 include/uapi/linux/virtio_gpio.h

diff --git a/MAINTAINERS b/MAINTAINERS
index a008b70f3c16..dfb8bfe09bbe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18588,6 +18588,12 @@ F:	Documentation/filesystems/virtiofs.rst
 F:	fs/fuse/virtio_fs.c
 F:	include/uapi/linux/virtio_fs.h
 
+VIRTIO GPIO DRIVER
+M:	Enrico Weigelt, metux IT consult <info@metux.net>
+S:	Maintained
+F:	drivers/gpio/gpio-virtio.c
+F:	include/uapi/linux/virtio_gpio.h
+
 VIRTIO GPU DRIVER
 M:	David Airlie <airlied@linux.ie>
 M:	Gerd Hoffmann <kraxel@redhat.com>
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5d4de5cd6759..e8414d82cf75 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1613,4 +1613,13 @@ config GPIO_MOCKUP
 	  tools/testing/selftests/gpio/gpio-mockup.sh. Reference the usage in
 	  it.
 
+config GPIO_VIRTIO
+	tristate "VirtIO GPIO support"
+	depends on VIRTIO
+	help
+	  Say Y here to enable guest support for virtio based GPIOs.
+
+	  These virtual gpios can be routed to real GPIOs or attached to
+	  simulators on the host (qemu).
+
 endif
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 09dada80ac34..2b12e75af123 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -160,6 +160,7 @@ obj-$(CONFIG_GPIO_TWL4030)		+= gpio-twl4030.o
 obj-$(CONFIG_GPIO_TWL6040)		+= gpio-twl6040.o
 obj-$(CONFIG_GPIO_UCB1400)		+= gpio-ucb1400.o
 obj-$(CONFIG_GPIO_UNIPHIER)		+= gpio-uniphier.o
+obj-$(CONFIG_GPIO_VIRTIO)		+= gpio-virtio.o
 obj-$(CONFIG_GPIO_VF610)		+= gpio-vf610.o
 obj-$(CONFIG_GPIO_VIPERBOARD)		+= gpio-viperboard.o
 obj-$(CONFIG_GPIO_VR41XX)		+= gpio-vr41xx.o
diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
new file mode 100644
index 000000000000..61e183cc26bf
--- /dev/null
+++ b/drivers/gpio/gpio-virtio.c
@@ -0,0 +1,332 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * GPIO driver for virtio-based virtual GPIOs
+ *
+ * Copyright (C) 2018 metux IT consult
+ * Author: Enrico Weigelt, metux IT consult <info@metux.net>
+ *
+ */
+
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/gpio/driver.h>
+#include <linux/spinlock.h>
+#include <linux/virtio_config.h>
+#include <uapi/linux/virtio_ids.h>
+#include <uapi/linux/virtio_gpio.h>
+
+struct virtio_gpio_priv {
+	struct gpio_chip		gc;
+	spinlock_t			vq_lock;
+	spinlock_t			op_lock;
+	struct virtio_device		*vdev;
+	int				num_gpios;
+	char				*name;
+	struct virtqueue		*vq_rx;
+	struct virtqueue		*vq_tx;
+	struct virtio_gpio_event	rcv_buf;
+	struct virtio_gpio_event	last;
+	int				irq_base;
+	wait_queue_head_t		waitq;
+
+	unsigned long reply_wait;
+};
+
+static void virtio_gpio_prepare_inbuf(struct virtio_gpio_priv *priv)
+{
+	struct scatterlist rcv_sg;
+
+	sg_init_one(&rcv_sg, &priv->rcv_buf, sizeof(priv->rcv_buf));
+	virtqueue_add_inbuf(priv->vq_rx, &rcv_sg, 1, &priv->rcv_buf,
+			    GFP_KERNEL);
+	virtqueue_kick(priv->vq_rx);
+}
+
+static int virtio_gpio_xmit(struct virtio_gpio_priv *priv, int type,
+			    int pin, int value, struct virtio_gpio_event *ev)
+{
+	struct scatterlist sg[1];
+	int ret;
+	unsigned long flags;
+
+	WARN_ON(!ev);
+
+	ev->type = type;
+	ev->pin = pin;
+	ev->value = value;
+
+	sg_init_table(sg, 1);
+	sg_set_buf(&sg[0], ev, sizeof(struct virtio_gpio_event));
+
+	spin_lock_irqsave(&priv->vq_lock, flags);
+	ret = virtqueue_add_outbuf(priv->vq_tx, sg, ARRAY_SIZE(sg),
+				   priv, GFP_KERNEL);
+	if (ret < 0) {
+		dev_err(&priv->vdev->dev,
+			"virtqueue_add_outbuf() failed: %d\n", ret);
+		goto out;
+	}
+	virtqueue_kick(priv->vq_tx);
+
+out:
+	spin_unlock_irqrestore(&priv->vq_lock, flags);
+	return 0;
+}
+
+static inline void wakeup_event(struct virtio_gpio_priv *priv, int id)
+{
+	set_bit(id, &priv->reply_wait);
+}
+
+static inline int check_event(struct virtio_gpio_priv *priv, int id)
+{
+	return test_bit(id, &priv->reply_wait);
+}
+
+static inline void clear_event(struct virtio_gpio_priv *priv, int id)
+{
+	clear_bit(id, &priv->reply_wait);
+}
+
+static int virtio_gpio_req(struct virtio_gpio_priv *priv, int type,
+			   int pin, int value)
+{
+	struct virtio_gpio_event *ev
+		= devm_kzalloc(&priv->vdev->dev,
+			       sizeof(struct virtio_gpio_event), GFP_KERNEL);
+
+	if (!ev)
+		return -ENOMEM;
+
+	clear_event(priv, type);
+	virtio_gpio_xmit(priv, type, pin, value, ev);
+	wait_event_interruptible(priv->waitq, check_event(priv, type));
+
+	devm_kfree(&priv->vdev->dev, ev);
+
+	return priv->last.value;
+}
+
+static int virtio_gpio_direction_input(struct gpio_chip *gc,
+				       unsigned int pin)
+{
+	return virtio_gpio_req(gpiochip_get_data(gc),
+			       VIRTIO_GPIO_EV_GUEST_DIRECTION_INPUT,
+			       pin, 0);
+}
+
+static int virtio_gpio_direction_output(struct gpio_chip *gc,
+					unsigned int pin, int value)
+{
+	return virtio_gpio_req(gpiochip_get_data(gc),
+			       VIRTIO_GPIO_EV_GUEST_DIRECTION_OUTPUT,
+			       pin, value);
+}
+
+static int virtio_gpio_get_direction(struct gpio_chip *gc, unsigned int pin)
+{
+	return virtio_gpio_req(gpiochip_get_data(gc),
+			       VIRTIO_GPIO_EV_GUEST_GET_DIRECTION,
+			       pin, 0);
+}
+
+static void virtio_gpio_set(struct gpio_chip *gc,
+			    unsigned int pin, int value)
+{
+	virtio_gpio_req(gpiochip_get_data(gc),
+			VIRTIO_GPIO_EV_GUEST_SET_VALUE, pin, value);
+}
+
+static int virtio_gpio_get(struct gpio_chip *gc,
+			   unsigned int pin)
+{
+	return virtio_gpio_req(gpiochip_get_data(gc),
+			       VIRTIO_GPIO_EV_GUEST_GET_VALUE, pin, 0);
+}
+
+static int virtio_gpio_request(struct gpio_chip *gc,
+			       unsigned int pin)
+{
+	return virtio_gpio_req(gpiochip_get_data(gc),
+			       VIRTIO_GPIO_EV_GUEST_REQUEST, pin, 0);
+}
+
+static void virtio_gpio_signal(struct virtio_gpio_priv *priv, int event,
+			      int pin, int value)
+{
+	if (pin < priv->num_gpios)
+		generic_handle_irq(priv->irq_base + pin);
+}
+
+static void virtio_gpio_data_rx(struct virtqueue *vq)
+{
+	struct virtio_gpio_priv *priv = vq->vdev->priv;
+	void *data;
+	unsigned int len;
+	struct virtio_gpio_event *ev;
+
+	data = virtqueue_get_buf(priv->vq_rx, &len);
+	if (!data || !len) {
+		dev_warn(&vq->vdev->dev, "RX received no data ! %d\n", len);
+		return;
+	}
+
+	ev = data;
+	WARN_ON(data != &priv->rcv_buf);
+
+	memcpy(&priv->last, &priv->rcv_buf, sizeof(struct virtio_gpio_event));
+
+	switch (ev->type) {
+	case VIRTIO_GPIO_EV_HOST_LEVEL:
+		virtio_gpio_signal(priv, ev->type, ev->pin, ev->value);
+	break;
+	default:
+		wakeup_event(priv, ev->type & ~VIRTIO_GPIO_EV_REPLY);
+	break;
+	}
+	virtio_gpio_prepare_inbuf(priv);
+	wake_up_all(&priv->waitq);
+}
+
+static int virtio_gpio_alloc_vq(struct virtio_gpio_priv *priv)
+{
+	struct virtqueue *vqs[2];
+	vq_callback_t *cbs[] = {
+		NULL,
+		virtio_gpio_data_rx,
+	};
+	static const char * const names[] = { "in", "out", };
+	int ret;
+
+	ret = virtio_find_vqs(priv->vdev, 2, vqs, cbs, names, NULL);
+	if (ret) {
+		dev_err(&priv->vdev->dev, "failed to alloc vqs: %d\n", ret);
+		return ret;
+	}
+
+	priv->vq_rx = vqs[0];
+	priv->vq_tx = vqs[1];
+
+	virtio_gpio_prepare_inbuf(priv);
+
+	virtio_config_enable(priv->vdev);
+	virtqueue_enable_cb(priv->vq_rx);
+	virtio_device_ready(priv->vdev);
+
+	return 0;
+}
+
+static int virtio_gpio_probe(struct virtio_device *vdev)
+{
+	struct virtio_gpio_priv *priv;
+	struct virtio_gpio_config cf = {};
+	char *name_buffer;
+	const char **gpio_names = NULL;
+	struct device *dev = &vdev->dev;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->name = devm_kzalloc(dev, sizeof(cf.name)+1, GFP_KERNEL);
+
+	spin_lock_init(&priv->vq_lock);
+	spin_lock_init(&priv->op_lock);
+
+	virtio_cread(vdev, struct virtio_gpio_config, version, &cf.version);
+	virtio_cread(vdev, struct virtio_gpio_config, num_gpios,
+		     &cf.num_gpios);
+	virtio_cread(vdev, struct virtio_gpio_config, names_size,
+		     &cf.names_size);
+	virtio_cread_bytes(vdev, offsetof(struct virtio_gpio_config, name),
+			   priv->name, sizeof(cf.name));
+
+	if (cf.version != 1) {
+		dev_err(dev, "unsupported interface version %d\n", cf.version);
+		return -EINVAL;
+	}
+
+	priv->num_gpios = cf.num_gpios;
+
+	if (cf.names_size) {
+		char *bufwalk;
+		int idx = 0;
+
+		name_buffer = devm_kzalloc(&vdev->dev, cf.names_size,
+					   GFP_KERNEL)+1;
+		virtio_cread_bytes(vdev, sizeof(struct virtio_gpio_config),
+				   name_buffer, cf.names_size);
+		name_buffer[cf.names_size] = 0;
+
+		gpio_names = devm_kzalloc(dev,
+					  sizeof(char *) * priv->num_gpios,
+					  GFP_KERNEL);
+		bufwalk = name_buffer;
+
+		while (idx < priv->num_gpios &&
+		       bufwalk < (name_buffer+cf.names_size)) {
+			gpio_names[idx] = (strlen(bufwalk) ? bufwalk : NULL);
+			bufwalk += strlen(bufwalk)+1;
+			idx++;
+		}
+	}
+
+	priv->gc.owner			= THIS_MODULE;
+	priv->gc.parent			= dev;
+	priv->gc.label			= (priv->name[0] ? priv->name
+							 : dev_name(dev));
+	priv->gc.ngpio			= priv->num_gpios;
+	priv->gc.names			= gpio_names;
+	priv->gc.base			= -1;
+	priv->gc.request		= virtio_gpio_request;
+	priv->gc.direction_input	= virtio_gpio_direction_input;
+	priv->gc.direction_output	= virtio_gpio_direction_output;
+	priv->gc.get_direction		= virtio_gpio_get_direction;
+	priv->gc.get			= virtio_gpio_get;
+	priv->gc.set			= virtio_gpio_set;
+
+	priv->vdev			= vdev;
+	vdev->priv = priv;
+
+	priv->irq_base = devm_irq_alloc_descs(dev, -1, 0, priv->num_gpios,
+					      NUMA_NO_NODE);
+	if (priv->irq_base < 0) {
+		dev_err(&vdev->dev, "failed to alloc irqs\n");
+		priv->irq_base = -1;
+		return -ENOMEM;
+	}
+
+	init_waitqueue_head(&priv->waitq);
+
+	priv->reply_wait = 0;
+
+	virtio_gpio_alloc_vq(priv);
+
+	return devm_gpiochip_add_data(dev, &priv->gc, priv);
+}
+
+static void virtio_gpio_remove(struct virtio_device *vdev)
+{
+}
+
+static const struct virtio_device_id id_table[] = {
+	{ VIRTIO_ID_GPIO, VIRTIO_DEV_ANY_ID },
+	{ 0 },
+};
+
+static struct virtio_driver virtio_gpio_driver = {
+	.driver.name	= KBUILD_MODNAME,
+	.driver.owner	= THIS_MODULE,
+	.id_table	= id_table,
+	.probe		= virtio_gpio_probe,
+	.remove		= virtio_gpio_remove,
+};
+
+module_virtio_driver(virtio_gpio_driver);
+
+MODULE_AUTHOR("Enrico Weigelt, metux IT consult <info@metux.net>");
+MODULE_DESCRIPTION("VirtIO GPIO driver");
+MODULE_LICENSE("GPL");
diff --git a/include/uapi/linux/virtio_gpio.h b/include/uapi/linux/virtio_gpio.h
new file mode 100644
index 000000000000..5a48b975bc7a
--- /dev/null
+++ b/include/uapi/linux/virtio_gpio.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _LINUX_VIRTIO_GPIO_H
+#define _LINUX_VIRTIO_GPIO_H
+
+#include <linux/types.h>
+
+enum virtio_gpio_event_type {
+	// requests from quest to host
+	VIRTIO_GPIO_EV_GUEST_REQUEST		= 0x01,	// ->request()
+	VIRTIO_GPIO_EV_GUEST_DIRECTION_INPUT	= 0x02,	// ->direction_input()
+	VIRTIO_GPIO_EV_GUEST_DIRECTION_OUTPUT	= 0x03,	// ->direction_output()
+	VIRTIO_GPIO_EV_GUEST_GET_DIRECTION	= 0x04,	// ->get_direction()
+	VIRTIO_GPIO_EV_GUEST_GET_VALUE		= 0x05,	// ->get_value()
+	VIRTIO_GPIO_EV_GUEST_SET_VALUE		= 0x06,	// ->set_value()
+
+	// messages from host to guest
+	VIRTIO_GPIO_EV_HOST_LEVEL		= 0x11,	// gpio state changed
+
+	/* mask bit set on host->guest reply */
+	VIRTIO_GPIO_EV_REPLY			= 0xF000,
+};
+
+struct virtio_gpio_config {
+	__u8    version;
+	__u8    reserved0;
+	__u16   num_gpios;
+	__u32   names_size;
+	__u8    reserved1[24];
+	__u8    name[32];
+};
+
+struct virtio_gpio_event {
+	__le16 type;
+	__le16 pin;
+	__le32 value;
+};
+
+#endif /* _LINUX_VIRTIO_GPIO_H */
diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
index b052355ac7a3..85772c0bcb4b 100644
--- a/include/uapi/linux/virtio_ids.h
+++ b/include/uapi/linux/virtio_ids.h
@@ -48,5 +48,6 @@
 #define VIRTIO_ID_FS           26 /* virtio filesystem */
 #define VIRTIO_ID_PMEM         27 /* virtio pmem */
 #define VIRTIO_ID_MAC80211_HWSIM 29 /* virtio mac80211-hwsim */
+#define VIRTIO_ID_GPIO           30 /* virtio GPIO */
 
 #endif /* _LINUX_VIRTIO_IDS_H */
-- 
2.11.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
