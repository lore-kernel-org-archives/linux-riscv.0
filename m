Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F31606A31D
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 14:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3+EETh6j;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k9/ujuDA;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MCeGRUPp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F2f2A9+oyYz8nQUe1EX7s1CnZyWw7VM+Bn/sHXUnLIU=; b=3+EETh6jwbI2st
	OeJgAKlOGhwZfRRdx/xaGaK3elfoMuxV0ZQgAGDaxbksFKLLUzWX9GqCieSWvLNm9dNktSUwXn0Y+
	Ee4OudKGMYdyaTy+xDO04J/R5Gh6NWwDORqAVwCDZldY5bvOfIBVy4HPa3wZNROekrBgevwWzxN0h
	oftkn0FcvbU+ffB+Wlp6jCZM3jQHzFf5VZF0iSvBIWSAxubbbymeoz1hO5IidiGrehfmssY5RbVSS
	2GakTnRrr9xbYvzj2+2pRAYNKhOsoVMhfujCJxHQBwFMb/bAFJyNUb3yuutJZSAzTJorb1IQM0p6K
	CpNruTYVka3VnryjAv6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAjS-00000009vS0-0CRQ;
	Tue, 20 Oct 2026 14:22:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAjP-00000009vR5-3XEf
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 14:22:25 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDAFYH1575857
	for <linux-riscv@lists.infradead.org>; Tue, 20 Oct 2026 14:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OhKbLmH/U5h+DRXoocMXRS
	3RpkfDcegtUNpnfl07C+c=; b=k9/ujuDAy9xB7YYT8IPwOZDExcU2OVYrbR850V
	0uC0mFvZvwJsaEU8IkhYV6jjqt16CCXbf2+k+qbLaTZde1RQMlreaK2AxBnYkTrW
	LkAV+KpMqssR6SIb/9dBWuhc1FG1Wy3IkGIEaAQCQgikvyn2+jxNahA+1kS3f/TO
	ByFrnK/yKHBcUesKBJrzYO/3Xer1ljAmlC7ABJUMEjSMYH2PFsQxvveCa6b8PkzQ
	33YA+VSOEVmMjvVnFIZIn8JrRa6ozfSp8/dASkVgWNi/Szgzo1PyDtlRQiEvWRju
	6BlwKwz1yrTriVLGGfjBhGRB0yQgvz0arQgEBxtZftDN5e+Q==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2vty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 20 Oct 2026 14:22:22 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98909a978b9so470993241.2
        for <linux-riscv@lists.infradead.org>; Tue, 20 Oct 2026 07:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792506142; x=1793110942; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OhKbLmH/U5h+DRXoocMXRS3RpkfDcegtUNpnfl07C+c=;
        b=MCeGRUPpW+FYH/BEQXSxrrc63MycR6PIdTggVbEOSurgR8KpP8W5bEN/UpTRkKBi/b
         4YM7Rcg7CcKHF45++5IoWq4s+wLprvnFKmDfU/l3eHPJ9q5LAuCNLlwRZsHhcRM4sB4T
         rcMrKsQuQeHyqsMZoMK10QIHJ3Fel9hy6aj8uE7eFxt1dsppdzZx97RvkNkd3BPyw81q
         nPj6tCDjJbLUUB6ItPH3Lhv/PqH4Cs9s3CEib+wP32HJ/lnIDf2+2kvqgROBzUOJwyHL
         5Den4aWtggud3zPi54VA2xk0rhhyeiD8OHP7T+kSSH4ag5fNoEnuZtzCiseoOLmVZmR4
         yFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506142; x=1793110942;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OhKbLmH/U5h+DRXoocMXRS3RpkfDcegtUNpnfl07C+c=;
        b=rhqh5pUMonH3g/pI1VLeHhTbVKYVq2SAXhqEd1Ote/T49H7p5y9NkgZBFzOkzgUjnk
         YiGMpRZhik/puZToU7nCYdZ+QuNgYh4uFqts9JYISv21zLLTv8h2f4JM1XNTAJBelZ47
         ypnePn10N6UmAuFZ5sfOOaXtI6lEJxc4h1eSsohq+2Bzw9WPy1G1oqtvjMdeqX/uYX0K
         ylHc/LtCNW3oV3ee6osA3g9UXE2K9/+J55gGIcKik+oSaAddqLGs4h3AFs1w90K6oemW
         l5ygudSfljINjMywoPttvlzjA1o9Dtp6wuXPE717k6QwRMEYs4foSEo3EXl8Wh2+tPU2
         uqEA==
X-Forwarded-Encrypted: i=1; AKwUvBzFkXCnrJAC/YLfoOd4xw4bEEn+oo8IQUdQGLEVenuXrjX+bCS4K8h1LBZcdFwXzYk9S8xi+omQWED5Pw==@lists.infradead.org
X-Gm-Message-State: AFq9FYLT85cE5GA2MsIHzPAqItPWMqLF3UQbJbv3R6AiCTS0vTZAHWNv
	dQ/wNumY8CpKveynZa+tjNQtc2DdM+tQk+xZiViDu3qQrceTJa+H6d4WZS4dfhdgLsjz/ly9NeD
	tZEamkj9DuucG2AY5dI+IJcN82JTwT+G82EX6wnBI0RgFhpSQV+bXdOTwt7ds56Ry0TfAkv0=
X-Gm-Gg: AYBFou2dlunfHc+9SmH5AC083bd0wFiJ17PAYkugcx018x36r5Uze9moH0GFxLDiidM
	Dh2h4970TO8tpWEPHBp+pZNOTUleu2L4Xg2usr45Z56Ri/lx3S6daR2zVBHScnaoeZ4UipTOXq1
	mFk1FK80ZFNJnOI9PRDnLGha361o33jG2eKat4o5ifva7jruwCKm2pFS11+VBVfL+2TCSi/WAMo
	cdic2mTlx09B98tBoo1rqTRczQ2yXUTrNm6zZNBkRg3b9llFbKt0IYQaoyrqoQBOYNRntlc/WZj
	GmP1JLKwp/ieqNwUXCH5oTGrwrWbzTWLnJHe+3EEuDmHXlElBJ1V9agCTKyMp5VkuC/daYoyctj
	fuBdLyiU3dQd0u4p1MzsMRiWri0KOiB8xHTLIQSPq2JHy1f/Xm0oxCmHMvPuGNCXNGZiqxp+4XI
	CSYVdUp0jHk1V990k2q/EesOdTnq7szNRqCgjm6pBTNNymWPyYLtU=
X-Received: by 2002:a05:6102:161e:b0:7c8:18a2:f769 with SMTP id ada2fe7eead31-7cc364a10eamr2449269137.0.1792506141704;
        Tue, 20 Oct 2026 07:22:21 -0700 (PDT)
X-Received: by 2002:a05:6102:161e:b0:7c8:18a2:f769 with SMTP id ada2fe7eead31-7cc364a10eamr2449251137.0.1792506141142;
        Tue, 20 Oct 2026 07:22:21 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d0fb:daf1:3106:3697])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2c9e9c3sm69275725e9.3.2026.10.20.07.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:22:19 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 16:22:18 +0200
Subject: [PATCH] cpuidle: Fix UAF of removed CPU PM domains
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261020-cpuidl-psci-fix-v1-1-d8ab9ac3b56d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABl512oC/x2MQQqAIBAAvyJ7bkE9CPaV6BDuWgthohSB+Pek4
 wzMNKhchCvMqkHhR6pcaYCZFIRjSzuj0GCw2jqjrcaQb6ETcw2CUV70JpINnowjB6PKhYf+j8v
 a+wfaV39UYQAAAA==
X-Change-ID: 20261020-cpuidl-psci-fix-91fd2c9d16d6
To: Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 0eDYvxF3-Z17dEM3ImIyD1n70KoO1JH6
X-Proofpoint-ORIG-GUID: 0eDYvxF3-Z17dEM3ImIyD1n70KoO1JH6
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad7791e cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=D_0iQ9w6F8GnD4LBNHQA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfX5fBHkSEhZ89l
 4KfEilDYqNegLuPyNBYC5Ii/bcFWAG5qVniRS9ACbmc0vXCE542vMxtaeasPmdLhLDbnJ9moQl8
 fFvuOd+/iqEQ5X6hGMXaU5wPgIl7ZeffA0P1cI8I4hqBsXDwoeH9z0mKJ9IcxREEMppov7gCwOj
 iBK3nfojRhKjnxXpYfsecUqgqTy1tPHMeLk0SeeNZ0oujMO3fR47N4zXYt80+zOkc3LdS2m6kwO
 4il3+o174AAxycK43M56+sh4ZIw5BSveQ2M4XJ5gn1ateE5dyXv0jP0fnfI5dRuE6LrXg5D2+2j
 BmxRZzv9pRBqZHCQOerMKyYoDun617vcIdHrMl7mrdcB1XgADdNV4FfLNebUWVDtgOSEYSBHI81
 eQCfIXapr3S3pNf/ssb+NumBUDo6dNng7IQ0qrFgXJzqrHiB5v0uQlJqXYACJnIXirYVC6P4qXE
 iiyKmWbSIH+E6XZTQiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfX1hLyc8U7XpZD
 rdapb5cMF1hwvgiphfi4Vpz/3iAGYwZMxxPT3SzVmCCrZ7kx7dJvh3LnstDPyjeJrDkxKDBjlDg
 J3rjrICvRdS5Jkajs8N8M2FL58oSqMs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_072224_010471_DCAC05FF 
X-CRM114-Status: GOOD (  17.41  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

psci_pd_remove() and sbi_pd_remove() release the generic_pm_domain as
soon as of_genpd_remove_last() hands it back. That object embeds a
struct device, and other code may still hold a reference to it at
that point.

of_genpd_add_provider_simple() publishes &genpd->dev as the owner of
the provider DT node, so fw_devlink turns every "power-domains"
phandle pointing at that node into a device link and takes a
reference on the supplier. of_genpd_del_provider() drops those links,
but devlink_dev_release() only queues the final put_device() on
device_link_wq, because tearing a link down needs an SRCU grace
period. The genpd kfree() therefore runs while that reference is
still outstanding, and the queued kobject_put() later reads the
kobject out of freed memory.

On a Arduino Uno-Q board the PSCI domain probe defers once, which runs
the cleanup path on every boot:

  CPUidle PSCI: failed to create CPU PM domains ret=-517

  BUG: KASAN: slab-use-after-free in kobject_put+0x3ec/0x484
  Read of size 1 at addr ffff0000c152603c by task kworker/0:1/11
  Workqueue: device_link_wq device_link_release_fn
  Call trace:
   kobject_put+0x3ec/0x484
   device_link_release_fn+0xa4/0x1bc
   process_one_work+0x7d8/0x1be4
  Allocated by task 1:
   dt_idle_pd_alloc+0xbc/0x4d8
   psci_cpuidle_domain_probe+0xb0/0x574
  Freed by task 1:
   kfree+0x250/0x5cc
   psci_cpuidle_domain_probe+0x2a8/0x574

Flush device_link_wq with device_link_wait_removal() before the
kfree(), so that the outstanding references are dropped while the
domain is still alive.

Fixes: 3b7b8acacf37 ("pmdomain: core: Add common ->sync_state() support for genpd providers")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/cpuidle/cpuidle-psci-domain.c | 13 ++++++++++++-
 drivers/cpuidle/cpuidle-riscv-sbi.c   | 13 ++++++++++++-
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index b9e4ad7d43a3310a76ce62018dff0af1488e33d2..f68f5f0afe67e51b0b777fde30eeeead301be140 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -113,8 +113,19 @@ static void psci_pd_remove(void)
 		of_genpd_del_provider(pd_provider->node);
 
 		genpd = of_genpd_remove_last(pd_provider->node);
-		if (!IS_ERR(genpd))
+		if (!IS_ERR(genpd)) {
+			/*
+			 * The lifetime of @genpd is under our control.
+			 * However, it embeds a refcounted struct device that
+			 * may still be referenced by consumers. fw_devlink
+			 * consumers release their references asynchronously
+			 * via device_link_wq, so flush that work before
+			 * freeing the domain. Otherwise, a pending
+			 * kobject_put() may access freed memory.
+			 */
+			device_link_wait_removal();
 			kfree(genpd);
+		}
 
 		of_node_put(pd_provider->node);
 		list_del(&pd_provider->link);
diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index a13e90bb43bd3f130732079e14017953e5811849..56b6515cbbed0b6f9023242d51bcd3e8b4f2ac24 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -429,8 +429,19 @@ static void sbi_pd_remove(void)
 		of_genpd_del_provider(pd_provider->node);
 
 		genpd = of_genpd_remove_last(pd_provider->node);
-		if (!IS_ERR(genpd))
+		if (!IS_ERR(genpd)) {
+			/*
+			 * The lifetime of @genpd is under our control.
+			 * However, it embeds a refcounted struct device that
+			 * may still be referenced by consumers. fw_devlink
+			 * consumers release their references asynchronously
+			 * via device_link_wq, so flush that work before
+			 * freeing the domain. Otherwise, a pending
+			 * kobject_put() may access freed memory.
+			 */
+			device_link_wait_removal();
 			kfree(genpd);
+		}
 
 		of_node_put(pd_provider->node);
 		list_del(&pd_provider->link);

---
base-commit: f49a343b305c0b6c19a3b50c0bbf10bcd0e2e8fd
change-id: 20261020-cpuidl-psci-fix-91fd2c9d16d6

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
