Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C854ACA1013
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 17:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YL2dCJe6k+74tmrdI8j4STfSeqzPJtPqLhL92Nq9/ok=; b=PSX78OuBzMtpGk
	f1oY8LB1UFa6/6cCKS5d9XYJ7/VycfWtqji35Y+huV6Sb09nyE6eqcZ85l5Aq9nhAoMG9rRQHUZ24
	jh0fDMLqFS4Klgsi3XhWMswJz9EzAPt7AqO3uDiOqJ2FCkaOQY+1i/MyBCL3CynRv6NDmMKnqRXqF
	v40N7w4PWuRlyXE6t/6L+NK3xUTysamA9as/Yux7qSne4KNuqrhASjoODpXzbzjEHnhDvptmPjmkU
	KDounauADil3wPERoy12dMW/SqTOTYakGO9QvFcshSwqHxSwIr9/9njqeT0W3Q8L3VxE5VHyWkVJH
	w15knqLB5YmSo3mog7NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzIWA-00000000lqX-2M9f;
	Thu, 18 Sep 2025 17:34:02 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzIW7-00000000lp2-33HH
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 17:34:00 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758216834; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jQ4Z/FhppDPJRcR308Tfk3OtC4kU9/BoPy/iN5RHx2Z9lVLsihsl6Ypd5PhDxferk6ZfWWtZBCwcDMdbvWdB571xMEJBBDRQMQXt++Dpjz7umlpKfSCU6nhBkwBejK3dv691rjNwUdCvegS+8X7A/R1iCd87gyWH6+fp7pjvhC8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758216834; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lEFxTFHiyI2q/oDLkp6vLKAusartnU5WLpPBBCAmUB4=; 
	b=XL0LoWTCect3d6Ld7kol6d0cVSQxdghvMQ68o3EpiECEDamc+4hemSM+XT8WEhas7Kgz1q+gaNlwvd7jHF13xqYw9ccp7N0m+LtemC8KGEyVNs4D63d4KG9vaLL4zRoLBbiPwYvC68dEAz0A8gl06RqifFcdXV4adfqtX8LNPEI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758216834;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=lEFxTFHiyI2q/oDLkp6vLKAusartnU5WLpPBBCAmUB4=;
	b=UUX3oyxl32yNEYujg2yPxxXKznw0246z9eigktItrIPWUPNddSJa6IySPM0PWpng
	Lks207vEty3vTFFkW7ryb72EyJgKyifzvr+LcwIzy+iQiXOHGBoLtPV4ME+Pf/HSyqH
	dB2WvL8EUY7DD4XxU7OJSHGBLPuvCv7svs8dj7WH6cusy6PsB/qvGycacDMJ1a7lS9r
	7gN7YhoTN0VHY+WV4lZCsNGzWmFnp6jSg1hvojsS8Sw1VGP91IZrwIQ1j08XrxTzGxf
	AACyr2yBjtbNirZlegdshDwW3g77maPfpkSxG0zlreiKZX99eugecBzK53L9DfrHH45
	u7+u+k0xcg==
Received: by mx.zohomail.com with SMTPS id 175821683282116.852562929362648;
	Thu, 18 Sep 2025 10:33:52 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 2/2] pmdomain: thead: create auxiliary device for rebooting
Date: Fri, 19 Sep 2025 01:33:23 +0800
Message-ID: <20250918173323.340738-3-uwu@icenowy.me>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918173323.340738-1-uwu@icenowy.me>
References: <20250918173323.340738-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_103359_824863_C14EBC05 
X-CRM114-Status: GOOD (  10.94  )
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

The reboot / power off operations require communication with the AON
firmware too.

As the driver is already present, create an auxiliary device with name
"reboot" to match that driver, and pass the AON channel by using
platform_data.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
Changes in v2:
- Rewritten to use devm_auxiliary_device_create.

 drivers/pmdomain/thead/th1520-pm-domains.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pmdomain/thead/th1520-pm-domains.c b/drivers/pmdomain/thead/th1520-pm-domains.c
index 9040b698e7f7f..5213994101a59 100644
--- a/drivers/pmdomain/thead/th1520-pm-domains.c
+++ b/drivers/pmdomain/thead/th1520-pm-domains.c
@@ -173,6 +173,16 @@ static int th1520_pd_pwrseq_gpu_init(struct device *dev)
 					adev);
 }
 
+static int th1520_pd_reboot_init(struct device *dev,
+				 struct th1520_aon_chan *aon_chan)
+{
+	struct auxiliary_device *adev;
+
+	adev = devm_auxiliary_device_create(dev, "reboot", aon_chan);
+
+	return PTR_ERR_OR_ZERO(adev);
+}
+
 static int th1520_pd_probe(struct platform_device *pdev)
 {
 	struct generic_pm_domain **domains;
@@ -235,6 +245,10 @@ static int th1520_pd_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clean_provider;
 
+	ret = th1520_pd_reboot_init(dev, aon_chan);
+	if (ret)
+		goto err_clean_provider;
+
 	return 0;
 
 err_clean_provider:
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
