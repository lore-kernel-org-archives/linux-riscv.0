Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D02C98321
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 15:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iZ+UqO+WNJATayKRpZBDbl7G/9indgQVbHwCgxZunaY=; b=l1rdvUH9sj5bLp
	M1fddKX9qnoLyhQeXqudwQmbPvDhIci1vUsHDahkB9ZUDPBd7ZlD588J3RTlu/o0/0VuIxsks2ZK5
	sVtgZrkirDX+50GuD9SJ8ZynDAqka4MozMppWw0bjihSyJgVvVfhRNAO8z1HIQcUtOYldV5yBqGSs
	tjYtf9BGuSEUq441EWAAX1PPZk6qsTrogRnaenI5RRaRxcNIy6GswBLGctcm9Oh23uK2pBdhvXIwA
	f5I3pAnDn2bJLqvlpVTIa8p/vkO+pUAbsEcAKxjgGJRNNCk5dwdN2eQ3H/IDvIj3JiB/Faom4FHaX
	4+RoC59DH6Zw3TV+ootg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7gF-0000000DkKF-2nT1;
	Fri, 25 Sep 2026 15:17:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7gD-0000000DkGy-2VRT
	for linux-riscv@bombadil.infradead.org;
	Fri, 25 Sep 2026 15:17:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=abif+hmZCq2aJp7kZ9wZQNQ7bgznM8RBFuowQzgUMro=; b=TQCBbuteGlQ6ViYu+WERcbmZiH
	TDJJRvy1MXDy1apoDkWMDg1IznmxlENQ1ecQlaN/DtEUtvzaCuBCvSd7jD7j63ATPcsxHckoTV7xA
	fTuFiCf/RVicV1XFjIR/iMIkQiEiUB8IXHf4UqXCL/nXI8rWSX87UgFLcp75yr2h8tLUuZJReUxbq
	6Ih1t7F1BXHxKx/qJBuBSrQucvFgNLo8r+4bRydtL3EdVKVVzUJpK1DHRj8NGdI5ZzOxmytRfShP0
	s0R5Osph+Lm7EWL2e08IvEA4XHctkNtA4S491X3PnbNTz1n6eCSeao0LGFP+6htCF998kMy4pC0Ox
	i73RqPLA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xA7g7-0000000H2nL-01dq
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 15:17:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PEAaxC600037
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=abif+hmZCq2
	aJp7kZ9wZQNQ7bgznM8RBFuowQzgUMro=; b=SgcxBI4/X265Y4JYJsiJ763BzGq
	v9e2VpINOshJJJsg6kmZlqqxFROv0Y7c0VPyvskjhCcNOHhwTrrJsGUPzY/r/dF6
	u0G8cOJ9frAP9B7lBwomFaDJHzmpzPkE0DaLlC+BcJ6ROrNLwDA8cvuyP9ayX5Cm
	is9gxGoRTbXyhDJ86N0JmeKhiVfTjfWCBtsEdEmJUQnN2U+WL7bTc7Xr+DPVS6Fb
	QX9cQv1D5wfoGKtCw/rWAt+l7k0Gi4rK075mTuuITXCWOHBZS9aOXCNeMxEo8q/g
	bEZyyfiaEXugJo7+cUKcMDeKzMGdG2+WV6cKGwo03lHKG0bxb2maPgx2EwA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvsw46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:33 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-980682ebf05so79268241.3
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 08:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349453; x=1790954253; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abif+hmZCq2aJp7kZ9wZQNQ7bgznM8RBFuowQzgUMro=;
        b=jzKoKhznSZOfGJa1bYEo1E5vDyY/Uafsd80qkXanMlnSQ0V8Qb45sMFewM7zhj3zFo
         RJws4G/C/0z3wJZBjjFSeBRUSpoMFVdD9FuTgE+9p6894anuPiBhaU08ed6pZ5t3sGvj
         9SyMoR8HRzA2B8IqW076Tuoyn0cvABJaVAggfFBKY7uyWIlJuSojaGb65zQgE2JmYYXO
         BbzL45L0NoJ69kO/opUBRQO7T/9hcz7r4sHdq5cpGmi6pGu3ebZz1U1L8xfKVVzOvZdg
         E/iTMph8k9Im7KcmFvrNgke4btCgRxk99Gzo35pWMEOeTn9n44y0U3qSu/RIhY+SNybp
         +a9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349453; x=1790954253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=abif+hmZCq2aJp7kZ9wZQNQ7bgznM8RBFuowQzgUMro=;
        b=kEHlrlVnj2gexC4YWwr7tFosgPvMKT6k0++91RdUhhBlKXaYDu9gjcpMLdJX+j9Lo3
         zvJPz7MXeNpeP2xkDhr1P0iF6QKwQ4M3gv/mQSgNWbOIFDjM/i1YHQdGakGSjX+X1dtI
         7R2ooQEkRi8yZzx3tp94LrNePd80uo6666h9Av0W/nlZ5BULB1JdmcEDio0ac3rY8eDp
         s8fsm67TbKynZAc3sMvlxAgeYDfJ0/Hdi/vPklvgN47eDCX+RnwwYrxvgN4x70XBHJqv
         VQUnj17HCGhJR4rOatGbF6JE8c+ubyf+4JTz2DpqdbooOdH6MBw9uFNvvkUXIY+902Rh
         uxSw==
X-Gm-Message-State: AFuF++l7llNeH7mffM26SycwOJGShgUuatZ8b4r2T9tI2GFyPOh0RtD9
	EhXI5gBbRdDixupN9nnyy9hGJC0j+8CKOi7pk1kBi3WySMkGIwfwJeE7L+1OeEs+k/pdvb4Hmm9
	LzcRxW32pH++P15CO9zKOuxpVKvsN01vFfwoc61jZkJUQD8VSl+FtauGtW4A6+CjuL8Yw5h0Bpr
	sLNxE=
X-Gm-Gg: AYBFou0hfSxXQj5HqbuDjxT8RLy+N55KevIMqTE1LGbfe7LHKBvRPPiD0GbMBG8RXUl
	2B9fcEb6QXzCcD9TttyXLfa9UI+v1yWq2/NjGuwVqu8f/XongV3Iv4zW3Z36TrP6zXEycZI2mqK
	E9T9cRxAJlzfFeBf+g9AHONKtlsnUCvoG8cGjbs1g1yWGeWnnROdcjPPhIvcnJ8MO3RxDs1IvMT
	blzIiIk0+TyBg+4Hqof1uaWrlEWo+VaQazukJmGshpBFIlWGRtzHq0i403SdpFi/9qnwF6mg617
	o/0glKka0+5qpiqIg3ZUwzuGnYR4e+CKIkAYKZNxW2styZyJCP1rNdYnDEKACbcFezWAnCFnjYM
	0g5lZQIk4FJvB9gCevoaQbEx7Ox1d8YO1SFqUoQ==
X-Received: by 2002:a05:6102:3ed4:b0:7a1:f7d2:e80a with SMTP id ada2fe7eead31-7af1eaeabd3mr2588549137.18.1790349452798;
        Fri, 25 Sep 2026 08:17:32 -0700 (PDT)
X-Received: by 2002:a05:6102:3ed4:b0:7a1:f7d2:e80a with SMTP id ada2fe7eead31-7af1eaeabd3mr2588526137.18.1790349452318;
        Fri, 25 Sep 2026 08:17:32 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355c65sm7978559f8f.19.2026.09.25.08.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:31 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v6 16/16] selftests/vfio: Allow building on RISC-V
Date: Fri, 25 Sep 2026 17:16:59 +0200
Message-ID: <20260925151659.419512-17-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: VlDbQzDsRt5RSb-y1sr76nB0nNZjR_qX
X-Proofpoint-ORIG-GUID: VlDbQzDsRt5RSb-y1sr76nB0nNZjR_qX
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab6908d cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=SRrdq9N9AAAA:8 a=2eipm_--ddBYp9jzNeMA:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX+wSLY8KfI2jz
 6H79MxCe6bg2BbsmmPRM5WWhZ5+s282P0s1gDd9jQfTn833yQDZH69Asr80glS3LcVnHsmB8pok
 ZhiK8jUqIA3JrQfQkzLfDeREVc5LME8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX0+g/F7p4MZbg
 uJMHHvFJuzMteZ0yv5gtPi9v3SloGDPMQbRh7/JIdyndW+AYwNzMsGYSYukkvyuKtq3aPhB+s69
 aYsgVLeooB4rFi229VxihOEoTDfuIwXtIQOhKgMq1AD8XWYFw9WknaY+ENn5cZJYZZ5CuLHgXSp
 1p1oIkb6zY22C1P66UjSmNvzWDFNY7agw0Aic5Fd3Kyio1A9Zzj1Y2VON9FKp9Wb/NTQU/makIi
 EKw43iQTliB18JnIJE88TXRlxeae2u8/5iyiOcHoObBO0YdVItS3BaAZVCQstiHmJhbi2ngRzPz
 07Of2uhTG73aDOPTqNMG11ktTprUPkvz2lFGrc2aXf1OEyKfJMRxSF0v2J0tpvMDcXsMKZ1c9zF
 bakj6ZeC8vUl/Sh5BZjvxXs6b6/fHuU6ygVQ4GNf2PmQ0dlGPmNElGIxQknSego7hK4Fff0rs7L
 JkZwNta0Lw/mXED+YBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_161735_322363_CB982DFC 
X-CRM114-Status: GOOD (  12.45  )
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

The generic VFIO selftests, including iommufd coverage, require no
RISC-V-specific source changes. Top-level kselftest builds normalize
riscv64 to riscv, while direct builds may use riscv64. Include both
names in the architecture filter.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 tools/testing/selftests/vfio/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
index 2c32c48db509..2c7d8ea81b61 100644
--- a/tools/testing/selftests/vfio/Makefile
+++ b/tools/testing/selftests/vfio/Makefile
@@ -1,6 +1,6 @@
 ARCH ?= $(shell uname -m)
 
-ifeq (,$(filter $(ARCH),aarch64 arm64 x86 x86_64))
+ifeq (,$(filter $(ARCH),aarch64 arm64 x86 x86_64 riscv riscv64))
 # Do nothing on unsupported architectures
 include ../lib.mk
 else
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
