Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CAFC021B5
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 14:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=39zFO2nt8AnK/V0GLiA5Fhe8TSknaLaOOsXkN84hEhU=; b=VrQcL8o4VrqA2r
	JT0sjXFeQ1n7Sv89kxWblrn12dzSCmN0w+8oEx3zgoOK69locAKK4mrmVhpqMjKs4b+LyomvruShV
	ZwE5QBjx78X3el/ews+z6u0KxYDc64HoTzXOHFKCihUAkwSpFioiVhTXo7N3p/9zNp2vMUfkFiXWU
	FPBpNaMGsnrN9E6gnxM6x7VfBJvhzKJQVeWALbrWZBeaTzbWXSCTxjj4Lt+AxPSET4i9mcndiKe+y
	/m+1wdO+S7JYyEFaeF1Hi+dEF8M0xnLJOCBpYOoJQGRrvbVusq3ATOSaqbYql8FiguDHLdh0/KqX2
	7aB8ArW0n2BejosgcPQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkhe-0000000D9zD-35VV;
	Wed, 19 Feb 2025 14:05:30 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkfN-0000000D8rB-1YKr
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 14:03:10 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250219140308euoutp0144a5f10d0efd8af494b9b5b317be0b83~loPELXeQj1474014740euoutp01e
	for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2025 14:03:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250219140308euoutp0144a5f10d0efd8af494b9b5b317be0b83~loPELXeQj1474014740euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1739973788;
	bh=EdvSPG0aTGEerG1id4Po+DTUsE3oYtJMQsLjc8PkF8w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I02Tw+9LgqgfJQ8I4qkgqwECW1o/MactUFZm01jqXxaBPtxke8h6DJeIHNPqsW/fJ
	 gUbQLPWtIOrxY0XxKrp8slXhWd8WTwNXAmkKaec1b7llDln2Gf+GhNwhtkEP6xsfkC
	 b+PEY6sxgOCGWX7u6qU4ofvS1OADEhHOy3CBoGhc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250219140307eucas1p1c6a84d284a3a04bea9294e39e599ee2c~loPDnRMzX2958929589eucas1p11;
	Wed, 19 Feb 2025 14:03:07 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 70.92.20397.B94E5B76; Wed, 19
	Feb 2025 14:03:07 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250219140306eucas1p19ba425ddb1e499ef1014b1665be9de8e~loPC-I9dm2959629596eucas1p1w;
	Wed, 19 Feb 2025 14:03:06 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250219140306eusmtrp1ec43711384f27f7669e7aa91969e9e21~loPC_QGtN2416524165eusmtrp1k;
	Wed, 19 Feb 2025 14:03:06 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-fa-67b5e49bbc66
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id CC.86.19920.A94E5B76; Wed, 19
	Feb 2025 14:03:06 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250219140305eusmtip202e3744d867b53ebe1ebfdcde8cac016~loPBrPQqO0094500945eusmtip25;
	Wed, 19 Feb 2025 14:03:05 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
	wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
	matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
	m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, Michal Wilczynski
	<m.wilczynski@samsung.com>
Subject: [PATCH v5 13/21] drm/imagination: Add reset controller support for
 GPU initialization
Date: Wed, 19 Feb 2025 15:02:31 +0100
Message-Id: <20250219140239.1378758-14-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219140239.1378758-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTZxTG997e3nthqVyrG6+VjIiis2yAuGxvsmWTzM07YxYX3IyaZTbz
	WmB8raUDiRNIoaJrBWVTLArCRGoVm2Jb+Ya1SHFosXwU/KDDjbnRoYgtTljEQS9u/nfOe37n
	ec6TvBRPaCFEVEJKOitLkSSFEYG4pWPK8XrpiFkaXVodijoHKjFk/kdLovPNDgyVtzv4yN1j
	wlDf5DiBLvx+nUR/NufiyKU7SSJlh4FAo1o3gSbUbj7qbThBIK+mHSCLN49ANe1DJDJMlmOo
	YsKMo9N1DQCpDpzhI+fPH6AhdyeORnvVPKTSBqGnTXUkmnEZcVR6v5VEprHDfGSv2YryWr/H
	173CjA/mk8zY6CjO2Ap8JNP86BTO1GuHSEZdfxUwtfoDBHPb1UQwZVc+YX75zo4xF09nM3k1
	HRhT+CSaGW/pJ5hDJj1gepQD5Gbh9sB3drFJCd+wsqh3dwbG5/51DE+zrsx8XHYJywGPQw+C
	AArSb8ALThs4CAIpIa0D8EbhZT7X+AA8W1COcY0XQI3Hgz9bUTuneNygGkC70YhzzRiAx6vy
	yTmKoGPgcHW5X2sxnY/D/Mu5fhce/QeAlpETxBy1iN4J+x5M+TdwOhyWtJv9HgJ6HXSev4Vx
	fqGw9adrs34UFTD73uIUcchCeOX4iB/nzSJKc6n/JEjXBEL3xEM/D+n1sPtOACezCHrsJpKr
	Q2BXsXo+TiocNs/hc/VeWK+2z9dvw9uOaWJOhkevhoaGKO45Fubcd2Kc+gI4eG8hd8ECeMRy
	bN5UAAtUQo5eCX9Qa/4zdegs85kYeK1til8Elmmfy6J9Lov2f99TgKcHwaxCnixl5WtT2IxI
	uSRZrkiRRn6ZmlwLZr9214x9sg7oPBORVoBRwAogxQtbLFBlm6RCwS7JnixWlvqFTJHEyq1g
	KYWHBQsqW/OlQloqSWe/Ytk0VvZsilEBohxMlZbrtIprxBs2a9/aezN2Vb0y5sXrvwoybH9n
	n5vclBMXEWs0hFdUCXpe2PGpdOn2rKLicCO2o7ik0VudlNC8zB2jj6Ea42O2gsyX1sPpVxNc
	ot43K4v3j5at3p/e9F54t37bvuz0W1umLf27gwfP6u929WqHa7uMPQbbjaC+z7yPPmxcte/j
	brBkRqzBymyZkVlXB+QrSvYUVRz1HNUrHi53haYU/NZw8ulH/Vn3VBpfXCdMvevLhjrxRsP7
	bYVTDxJFaze1qLcoLrXUnrmY2Nem2Vh17slhcXt0hJn37fKbcUav8vPEH6NEAxsidn8d8vKS
	QyFBr/k820pEbZ41dzJmVoTh8njJGjFPJpf8C6sgBLVJBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsVy+t/xe7qznmxNN2j9YGhx4voiJoutv2ex
	W6zZe47JYv6Rc6wW9y5tYbK48vU9m8W6pxfYLV7sbWSxuLZiLrtF87H1bBYvZ91js/jYc4/V
	4vKuOWwWn3uPMFps+9zCZrH2yF12i/Vf5zNZLPy4lcViyY5djBZtnctYLS6ecrW4e+8Ei8XL
	yz3MFm2z+C3+79nBbvHv2kYWi9nv9rNbbHkzkdXi+Npwi5b9U1gc5Dze32hl93jz8iWLx+GO
	L+wee78tYPHYOesuu0fPzjOMHptWdbJ53Lm2h81j3slAj/vdx5k8Ni+p92hZe4zJo/+vgcf7
	fVfZPPq2rGL0uNR8nT1AKErPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/O
	JiU1J7MstUjfLkEvo/H1dJaCQ2oVP+ZtZ2pg/CHfxcjJISFgItFz8SdzFyMXh5DAUkaJw1f+
	MUEkZCSudb9kgbCFJf5c62KDKHrFKDHh+nFGkASbgJHEg+XzWUFsEYHFLBJ791WCFDELvGWU
	uD5zI1i3sECcRMOsDnYQm0VAVWLGka1gcV4BB4mLa25DbZOX2H/wLNAZHBycQPF9F6VAwkIC
	9hLn+u6zQpQLSpyc+QSslRmovHnrbOYJjAKzkKRmIUktYGRaxSiSWlqcm55bbKhXnJhbXJqX
	rpecn7uJEZheth37uXkH47xXH/UOMTJxMB5ilOBgVhLhbavfki7Em5JYWZValB9fVJqTWnyI
	0RTo7InMUqLJ+cAEl1cSb2hmYGpoYmZpYGppZqwkzut2+XyakEB6YklqdmpqQWoRTB8TB6dU
	A9M65WqOB12273Wvnot6dSH+s8GrvKTHhyfJa008EHWaednb1Vr/p5yT0kyZJ7AyL8xb6HWG
	P8f005FhvEXMgu/bp6SYp+e7t4qZqrr58G77rvyvcPKhNoVvbir9+/JLVzz/nfbsg1aECpdY
	VlOF58u9Sg+37G9sfCn293jS1RYl1mAxlbP3DRdMjerf8FXpX6GT8lSbcN15MyY4CgXN8Z1x
	6SF3wOXvPQatvn3Nevea9lwzeN7KPcuK+6jo23PP625wLniX8UBS/MnF1Hs9/Mpy2yWKkj4p
	vO6Xq/D2NXeZ4mtnenvumRyNeWq2TaJ+7T7LH1xiedJ9YfLmMqWruYtONVz2uXfD1mhHhASL
	shJLcUaioRZzUXEiAMn5+F24AwAA
X-CMS-MailID: 20250219140306eucas1p19ba425ddb1e499ef1014b1665be9de8e
X-Msg-Generator: CA
X-RootMTR: 20250219140306eucas1p19ba425ddb1e499ef1014b1665be9de8e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140306eucas1p19ba425ddb1e499ef1014b1665be9de8e
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
	<CGME20250219140306eucas1p19ba425ddb1e499ef1014b1665be9de8e@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_060309_684843_A1526F83 
X-CRM114-Status: GOOD (  25.50  )
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

All IMG Rogue GPUs include a reset line that participates in the
power-up sequence. On some SoCs (e.g., T-Head TH1520 and Banana Pi
BPI-F3), this reset line is exposed and must be driven explicitly to
ensure proper initialization.  On others, such as the currently
supported TI SoC, the reset logic is handled in hardware or firmware
without exposing the line directly. In platforms where the reset line is
externally accessible, if it is not driven correctly, the GPU may remain
in an undefined state, leading to instability or performance issues.

This commit adds a dedicated reset controller to the drm/imagination
driver.  By managing the reset line (where applicable) as part of normal
GPU bring-up, the driver ensures reliable initialization across
platforms regardless of whether the reset is controlled externally or
handled internally.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/imagination/pvr_device.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_device.h |  9 +++++++++
 drivers/gpu/drm/imagination/pvr_power.c  | 22 +++++++++++++++++++++-
 3 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 1704c0268589..ef73e95157ee 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -25,6 +25,7 @@
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/stddef.h>
 #include <linux/types.h>
@@ -120,6 +121,21 @@ static int pvr_device_clk_init(struct pvr_device *pvr_dev)
 	return 0;
 }
 
+static int pvr_device_reset_init(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct reset_control *reset;
+
+	reset = devm_reset_control_get_optional_exclusive(drm_dev->dev, NULL);
+	if (IS_ERR(reset))
+		return dev_err_probe(drm_dev->dev, PTR_ERR(reset),
+				     "failed to get gpu reset line\n");
+
+	pvr_dev->reset = reset;
+
+	return 0;
+}
+
 /**
  * pvr_device_process_active_queues() - Process all queue related events.
  * @pvr_dev: PowerVR device to check
@@ -509,6 +525,11 @@ pvr_device_init(struct pvr_device *pvr_dev)
 	if (err)
 		return err;
 
+	/* Get the reset line for the GPU */
+	err = pvr_device_reset_init(pvr_dev);
+	if (err)
+		return err;
+
 	/* Explicitly power the GPU so we can access control registers before the FW is booted. */
 	err = pm_runtime_resume_and_get(dev);
 	if (err)
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 6d0dfacb677b..f6576c08111c 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -131,6 +131,15 @@ struct pvr_device {
 	 */
 	struct clk *mem_clk;
 
+	/**
+	 * @reset: Optional reset line.
+	 *
+	 * This may be used on some platforms to provide a reset line that needs to be de-asserted
+	 * after power-up procedure. It would also need to be asserted after the power-down
+	 * procedure.
+	 */
+	struct reset_control *reset;
+
 	/** @irq: IRQ number. */
 	int irq;
 
diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
index ba7816fd28ec..5944645bf1b2 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -15,6 +15,7 @@
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/timer.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
@@ -252,6 +253,8 @@ pvr_power_device_suspend(struct device *dev)
 	clk_disable_unprepare(pvr_dev->sys_clk);
 	clk_disable_unprepare(pvr_dev->core_clk);
 
+	err = reset_control_assert(pvr_dev->reset);
+
 err_drm_dev_exit:
 	drm_dev_exit(idx);
 
@@ -282,16 +285,33 @@ pvr_power_device_resume(struct device *dev)
 	if (err)
 		goto err_sys_clk_disable;
 
+	/*
+	 * According to the hardware manual, a delay of at least 32 clock
+	 * cycles is required between de-asserting the clkgen reset and
+	 * de-asserting the GPU reset. Assuming a worst-case scenario with
+	 * a very high GPU clock frequency, a delay of 1 microsecond is
+	 * sufficient to ensure this requirement is met across all
+	 * feasible GPU clock speeds.
+	 */
+	udelay(1);
+
+	err = reset_control_deassert(pvr_dev->reset);
+	if (err)
+		goto err_mem_clk_disable;
+
 	if (pvr_dev->fw_dev.booted) {
 		err = pvr_power_fw_enable(pvr_dev);
 		if (err)
-			goto err_mem_clk_disable;
+			goto err_reset_assert;
 	}
 
 	drm_dev_exit(idx);
 
 	return 0;
 
+err_reset_assert:
+	reset_control_assert(pvr_dev->reset);
+
 err_mem_clk_disable:
 	clk_disable_unprepare(pvr_dev->mem_clk);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
