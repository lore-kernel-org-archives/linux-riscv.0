Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE5360A2620
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 09:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nnCMSsYv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4ICYaPKSNtf+J0PJrZ7I2rPyi4628tElJwIGuNWVsgk=; b=nnCMSsYvvYd1aPHtfRuhPi+ZI3
	CEpu9G04Mx8YeRL+/y/cSAlGDG0c6BWMikf+1TKRUIJcqvpJYQ3UH6X0J5Vh3fjGy1ctK/yV1UG/M
	aelE9WpaHpsN4ue7SStCVJoICK5VF6ZwNp9F1R6R9AmZSpbeu2JYC5pwmSTvmz5tH2RFKlJV+ICr6
	8dE6WZTxqrOURYpqFwv+tlsi6Mnt0ltYKP1ei8Z3fXBGamjYz9A752EPBTnWQJzfZPZHHk3Lxg5Xo
	MsswuP2nT5IzrmHPRAIG9odq52GsW4g70wLELeR2qDgG83EGf9C8qd3OR1Hub/tvnFby3utWm8owL
	kXGOYvEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWAs-0000000Ccum-3CIO;
	Thu, 26 Nov 2026 09:53:54 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWAo-0000000CcpT-10lI
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 09:53:52 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.207])
	by APP-03 (Coremail) with SMTP id rQCowACHlpeqAQhroXXXAQ--.21086S2;
	Thu, 26 Nov 2026 17:53:46 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Date: Thu, 26 Nov 2026 17:53:32 +0800
Subject: [PATCH] MAINTAINERS: matches th1520 in filenames for RISC-V THEAD
 SoC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-th1520-maintainers-n-clause-v1-1-c1315e68e5be@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTvQBJJYryIu0vjXjmiUTCpC6
 d2NuniLb/NWUhSB0qFbqeAlKo/cYHYdpTnmC1jOzWR7642xnutsnO35HiXXFopy5nSLi4IHF9w
 47RGG4KkdngWTvH/34+lvXcYrUv0uads+R/H+Y38AAAA=
X-Change-ID: 20261126-th1520-maintainers-n-clause-9575bf8e7976
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Icenowy Zheng <zhengxingda@iscas.ac.cn>
X-Mailer: b4 0.15.0
X-CM-TRANSID: rQCowACHlpeqAQhroXXXAQ--.21086S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF1xKF15Wr15uryfXF17trb_yoW8Kr1rpa
	13Cr4xAFykJF45Wa13ta42vr13X3W8ZrWag34DKa4kZFn09F13t34SkFs8WFWkJFW8ZFWa
	yF13Cr15W3W7Kw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUBmhwUUU
	UU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_015350_677227_580FCB1C 
X-CRM114-Status: UNSURE (   6.72  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

As more and more device binding / drivers are coming for TH1520,
indivudal filenames now bloats this MAINTAINERS entry.

Use N: to match th1520 in filenames instead of listing them.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 MAINTAINERS | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065d..fbf9094560a38 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24198,29 +24198,11 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 Q:	https://patchwork.kernel.org/project/riscv-thead/list/
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git
-F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
-F:	Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
-F:	Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
-F:	Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
-F:	Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
-F:	Documentation/devicetree/bindings/pwm/thead,th1520-pwm.yaml
-F:	Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
 F:	arch/riscv/boot/dts/thead/
-F:	drivers/clk/thead/clk-th1520-ap.c
-F:	drivers/firmware/thead,th1520-aon.c
-F:	drivers/gpu/drm/bridge/th1520-dw-hdmi.c
-F:	drivers/mailbox/mailbox-th1520.c
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
-F:	drivers/pinctrl/pinctrl-th1520.c
 F:	drivers/pmdomain/thead/
-F:	drivers/power/reset/th1520-aon-reboot.c
 F:	drivers/power/sequencing/pwrseq-thead-gpu.c
-F:	drivers/pwm/pwm_th1520.rs
-F:	drivers/reset/reset-th1520.c
-F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
-F:	include/dt-bindings/power/thead,th1520-power.h
-F:	include/dt-bindings/reset/thead,th1520-reset.h
-F:	include/linux/firmware/thead/thead,th1520-aon.h
+N:	th1520
 
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261126-th1520-maintainers-n-clause-9575bf8e7976

Best regards,
--  
Icenowy Zheng <zhengxingda@iscas.ac.cn>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
