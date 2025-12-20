Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52C8E668B3
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Dec 2025 17:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+CY4O+XPxhL+hjQTeysRhoq7z+PjcvFnnpCCZQkeRhQ=; b=It9iT2dEU9BwgI
	yPiDYDwhuLxs5BnnKBsW7g73qD3zgQazalMGWL3f5qh6qCa4fMfdrqRUeHKFQHe/Ekv+uPF8BVXTM
	bPQeeAgpg2givfA2ZBT+Kd3RQmjEelMiMLNJ7vU4mch9du2yh8A1fUGu9G/uPqO62RL/CpMqS2dgf
	sLXnlsfn4KtzD9wYuPpbyT0DxvwDUMpoavGlVyjgUzbxOUpey/A48/DKSZNVPH62It+eQPOOA4xbM
	8V/rOGkslPhqCpFtdiAzo4LdRPOKvEaclZPx4EQhbgDnVkRLr4ATWUkze9WVT8ZV4LpNeNAybq3tE
	sS0tXbJE2piFd0tHMFSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX0OX-0000000Bln4-0ATI;
	Sat, 20 Dec 2025 17:05:29 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX0OP-0000000BlmD-3b92
	for linux-riscv@lists.infradead.org;
	Sat, 20 Dec 2025 17:05:28 +0000
Received: from localhost.localdomain (unknown [223.166.92.103])
	by APP-05 (Coremail) with SMTP id zQCowADneQ1E10ZpEbtTAQ--.25750S2;
	Sun, 21 Dec 2025 01:05:19 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Maxim Mikityanskiy <maxtram95@gmail.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	linux-sound@vger.kernel.org
Cc: Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Han Gao <gaohan@iscas.ac.cn>
Subject: [PATCH] ALSA: hda: intel: Introduce msi64 parameter to override 64-bit MSI restriction
Date: Sun, 21 Dec 2025 01:05:01 +0800
Message-ID: <20251220170501.3972438-1-gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CM-TRANSID: zQCowADneQ1E10ZpEbtTAQ--.25750S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uw4rAw18uw4DAF1UXr1kKrg_yoW8WFW3pa
	1UCFW7tFsIqFZxGa1UKF48WFnaga93C343Ga95K34fX3Za9340q3W7KryfJFyxGFW8GryY
	9F1UZFy8Ww43Aa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-Originating-IP: [223.166.92.103]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBwoCDGlGu0YipgAAsV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_090522_264656_ABDC91F1 
X-CRM114-Status: UNSURE (   8.12  )
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

Sophgo SG2042 MSI driver does not support 32-bit MSI.
Introduce an 'msi64' kernel parameter to bypass NO_MSI64 for ATI/HDMI.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 sound/hda/controllers/intel.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 1e8e3d61291a..b4bad9e65235 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -121,6 +121,7 @@ static bool beep_mode[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] =
 #endif
 static bool dmic_detect = 1;
 static bool ctl_dev_id = IS_ENABLED(CONFIG_SND_HDA_CTL_DEV_ID) ? 1 : 0;
+static bool msi64;
 
 module_param_array(index, int, NULL, 0444);
 MODULE_PARM_DESC(index, "Index value for Intel HD audio interface.");
@@ -161,6 +162,8 @@ MODULE_PARM_DESC(dmic_detect, "Allow DSP driver selection (bypass this driver) "
 		 "deprecated, use snd-intel-dspcfg.dsp_driver option instead");
 module_param(ctl_dev_id, bool, 0444);
 MODULE_PARM_DESC(ctl_dev_id, "Use control device identifier (based on codec address).");
+module_param(msi64, bool, 0444);
+MODULE_PARM_DESC(msi64, "Force use msi 64bit.");
 
 #ifdef CONFIG_PM
 static int param_set_xint(const char *val, const struct kernel_param *kp);
@@ -1903,7 +1906,7 @@ static int azx_first_init(struct azx *chip)
 		chip->gts_present = true;
 #endif
 
-	if (chip->msi && chip->driver_caps & AZX_DCAPS_NO_MSI64) {
+	if (chip->msi && chip->driver_caps & AZX_DCAPS_NO_MSI64 && !msi64) {
 		dev_dbg(card->dev, "Disabling 64bit MSI\n");
 		pci->no_64bit_msi = true;
 	}
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
