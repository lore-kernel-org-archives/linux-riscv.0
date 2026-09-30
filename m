Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78831CA5FBB
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 07:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iXQCwHCULsuUSLgfgpDANO7j1ObaTyM/9NJ8ekjwNrQ=; b=20bXmy/xRbpaCg
	XxvWVgdnIixqLosXO9DAwWFxK5Xd+5CKkpRWrhSlwXDyFeUBF2SonHkVTk6P8XCWQ8rt3z6L01+s8
	9TFIGl9rK1lYLm7z8OCM8JPV4CKlSHjHIqwPNbdDtyVJXvlmrxm09Jly2CeiH9ifuhrYlzBxyOwbc
	h5KQ1ybe1lWbx6njFw9EdSe4ktk8Wg3LIVnulp/oNwLK3c2POWARpFY1N9c34z+hC0cOXZU+dUB8u
	rpsjVIQvG7KB0HzOj7sW3lw0vPcj0sD4Jwrbuop9np+EJSBIRi/dZNUQIl5Oni1nm/E34cTuIJVKg
	+JOV36QiqfhX6tfnrUeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBorP-00000005Hq0-0Hhg;
	Wed, 30 Sep 2026 07:36:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBorN-00000005HpF-2m8V
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Sep 2026 07:36:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=fKstkWLUrx4wDSe5VKjYKV5ITPt2O1+R063Pee1ttkY=; b=e7fNfumnfh+V4HnFRFysh3+vJO
	Nzo8aNy8FmRFAOt82Gl06wYBXBJnI7+cTuqAUB7U6zVU8dP9NC3VD/e5eZvJsQXcZk+Zlwx5Eh3jS
	UZV2DLiUWQw9D5ANcjzq1YcUgGoowa7vcz4pQPeeL2X5VU/wJ0f9l0hLYFOVvVRVJDwFXfpS8ddva
	4iKTf1hXU/7UibQu/zQIh5QoOzz/qgL58hE8eaAvblRU3UkqZUSZC/6l4Q6ou8vKOwOmkFpq21r7a
	WyL+d7qxFLNqUAKPjrqkktKFdt3NeSfC89f2MGzi7Lz2QJ5YXZK5wVdVl0AFo2rqVvMn0GXQunOku
	upCILlMw==;
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBoqz-00000003TgC-2dLl
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 07:35:53 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.54])
	by APP-05 (Coremail) with SMTP id zQCowABHtD7Eu7xqdFHBCQ--.5968S2;
	Wed, 30 Sep 2026 15:35:33 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Dominique Belhachemi <domibel@debian.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [RFC PATCH 0/2] drm: add a noncoherent mapping checking helper
Date: Wed, 30 Sep 2026 15:35:26 +0800
Message-ID: <20260930073528.3369325-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CM-TRANSID: zQCowABHtD7Eu7xqdFHBCQ--.5968S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw18XFW7uFWrKrykWF43trb_yoW8AF4rpF
	4akFW3trWUGFWfXrnxAw4jkw4ru3yxJayIgrn3J34DZw4YvFy7XryxGF18WFyDJr1xWF12
	vFZ0kryIkw1vvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-Originating-IP: [112.94.101.54]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_083550_483602_D01350FD 
X-CRM114-Status: GOOD (  10.43  )
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
Cc: linux-riscv@lists.infradead.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patchset tries to address the lack of uncached mapping support on
several SiFive-core-based SoCs, currently targeting JH7110 but EIC7700
would have the same problem (although it uses DC8000 display controller
instead of DC8200 and real display support is pending).

Because other users (either SoCs with Xuantie cores, which have
Xtheadmae extensions or non-RISC-V SoCs) of the driver have proper
writecombine support, a helper is added to check whether coherent
(cache-bypassing) mapping is available. This helper currently returns
true for all architectures except RISC-V, and checks whether
pgprot_writecombine() is a no-op on RISC-V.

The patch really enabling manual cache maintenance for the verisilicon
driver is picked from Dominique, and reworked to check both
dma-noncoherent property and the platform's mapping capaibility.

Tested on VisionFive 2 with the display enablement patchset at [1] (and
its dependency).

Also tested on Lichee Pi 4A (TH1520, which has Xtheadmae), operation is
not affected, map_noncoherent isn't set and Xorg says kernel dirty
updates aren't required.

[1] https://patch.msgid.link/20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com

Dominique Belhachemi (1):
  drm: verisilicon: support non-coherent DMA framebuffers

Icenowy Zheng (1):
  drm: add a helper function to check availbility of coherent mapping

 drivers/gpu/drm/verisilicon/vs_cursor_plane.c |  9 ++++++
 drivers/gpu/drm/verisilicon/vs_drm.c          | 32 ++++++++++++++++++-
 drivers/gpu/drm/verisilicon/vs_drm.h          |  7 ++++
 .../gpu/drm/verisilicon/vs_primary_plane.c    |  9 ++++++
 include/drm/drm_cache.h                       | 21 ++++++++++++
 5 files changed, 77 insertions(+), 1 deletion(-)

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
