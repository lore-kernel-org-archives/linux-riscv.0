Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B77CA0EE6
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Aug 2025 07:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IO/Ufh1uKbg7nlM0APNQczqzFSpSjkFXIVYhY+/ZCnQ=; b=UEuR/RvqlyxS6/
	7Lm19zdWXas8fkZ6LK0kRJNIGfIOZCkoFCH0Oo/VPVg5QWK5YcvpH22Qs1S3BkaLe5EwYJKaoHK0S
	cjZLyH5DPnztOjW/5GybQuNuu5fGOzPgn4/V+Cbw59Zln/r0jvQk8DQj/6JLlC9SvHVENVoF5Kma0
	LQW1Es5KHxyVOzlIIbgHQTghBqPpadwKc+3VE6M0Vel/oKXcQ1g1lng+gXZX3kjTHe2E13aN9OY9B
	LkiRPzdrl9VH+21tV1Jb03+CyRH+Q09OwkTZ94zLDJd3krr60/A2VbVHqJm3MbHpupjDBUl3P5ETt
	okFB1Ee24YL87/6/+JhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unBf1-00000004EZl-3woN;
	Sat, 16 Aug 2025 07:49:07 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unBez-00000004EYg-2SAu
	for linux-riscv@lists.infradead.org;
	Sat, 16 Aug 2025 07:49:06 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755330537; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QrGGBxLbY7j0af7Z/MtfX8YwtrA4ZAbdmEkt7Lh9BpooB/rk1Bqyf1c7/UKu6SYYyBNxJjLm+FBLftOASEYSUENqIofa9tLPw4JGdTmDkDtAxsEZsfc7FuwFfibov8Prs4mSIz4JGO7hAhLhLT7BtxlzZ7rrAj/bTHx/Zlj7nVc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755330537; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=e7Ngx6Rt/JpIvo0R+kAwIonCUQ/vaWPqz6Ke56ZQkT4=; 
	b=PY/0ctaNQ30JiKmPvDZmdLQBayxyYpFuxB08IMAHspmnH+JCxYotVeicwV2EVnsi0cZlu0rXRD/RlZ7PnGeflqYRen289qwC9bQCRWMjldp53g8kXgJY5W4i8GHtkDSjp9pDfY7eWrWZ0P9o4oWqCW0OGgcjiLkQWjDDUstp1Ok=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755330537;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=e7Ngx6Rt/JpIvo0R+kAwIonCUQ/vaWPqz6Ke56ZQkT4=;
	b=lL0bvAeDZfX7fEYqdGfkrtBSvD2+IDHQLz0TwEMaQhSQRQE1+zOG2LL2Lvf9+fQ3
	xK5xF+z9vIPyPsCb/2+kJBKormNUcWmP6mxE9ETl12k6dNFqJA9fhhEQEhib0a+0BU3
	N4FVkZcfpEmD/Id3iFDYKPBac+u9y5mj4c5Uv7h+U7pWOyNP5Uq3CLbgSLpUkGtHg5c
	U7zVSKk5HKYHk23cg+gUqUuvNmXxLIAeRE3oKhwR6zCkcB1dhk16R3hJpQ9c4KyN7uN
	JCMaf0wqt1U1y2jM0wzrIzAQhnqk1AaEKZEQgPNwMdHTcqn0NaOPKvPluS+g8o/a7V4
	p4RUkXSdEA==
Received: by mx.zohomail.com with SMTPS id 1755330536462939.8814640628641;
	Sat, 16 Aug 2025 00:48:56 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 2/7] drm/etnaviv: add handle for GPUs with only SECURITY_AHB flag
Date: Sat, 16 Aug 2025 15:47:52 +0800
Message-ID: <20250816074757.2559055-3-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816074757.2559055-1-uwu@icenowy.me>
References: <20250816074757.2559055-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_004905_685507_7895E4DF 
X-CRM114-Status: GOOD (  11.44  )
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

In the GC620 on T-Head TH1520 SoC, the SECURITY feature flag isn't set
but the SECURITY_AHB feature flag is set.

In this situation, the VIVS_MMUv2_AHB_CONTROL register isn't available,
but the GPU otherwise behave like secure ones and require commands to
load PTA.

The 6.4.6.9.354872 driver from T-Head asserts SECURITY_AHB feature flag
is set when SECURITY one is set, so it could be assumed that the
situation that only SECURITY is set do not exist.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index cf0d9049bcf1e..7431e180b3ae4 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -559,7 +559,7 @@ static int etnaviv_hw_reset(struct etnaviv_gpu *gpu)
 		control |= VIVS_HI_CLOCK_CONTROL_ISOLATE_GPU;
 		gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, control);
 
-		if (gpu->sec_mode == ETNA_SEC_KERNEL) {
+		if (gpu->identity.minor_features7 & chipMinorFeatures7_BIT_SECURITY) {
 			gpu_write(gpu, VIVS_MMUv2_AHB_CONTROL,
 			          VIVS_MMUv2_AHB_CONTROL_RESET);
 		} else {
@@ -797,7 +797,7 @@ static void etnaviv_gpu_hw_init(struct etnaviv_gpu *gpu)
 		gpu_write(gpu, VIVS_MC_BUS_CONFIG, bus_config);
 	}
 
-	if (gpu->sec_mode == ETNA_SEC_KERNEL) {
+	if (gpu->identity.minor_features7 & chipMinorFeatures7_BIT_SECURITY) {
 		u32 val = gpu_read(gpu, VIVS_MMUv2_AHB_CONTROL);
 		val |= VIVS_MMUv2_AHB_CONTROL_NONSEC_ACCESS;
 		gpu_write(gpu, VIVS_MMUv2_AHB_CONTROL, val);
@@ -853,7 +853,7 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 	 * On cores with security features supported, we claim control over the
 	 * security states.
 	 */
-	if ((gpu->identity.minor_features7 & chipMinorFeatures7_BIT_SECURITY) &&
+	if ((gpu->identity.minor_features7 & chipMinorFeatures7_BIT_SECURITY) ||
 	    (gpu->identity.minor_features10 & chipMinorFeatures10_SECURITY_AHB))
 		gpu->sec_mode = ETNA_SEC_KERNEL;
 
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
