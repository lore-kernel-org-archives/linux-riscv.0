Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6944FC5DF90
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 21:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wUGQ9eLJbq0wtOADsTEssVOLahcYW1rhpXyHi/LmZg4=; b=YgAixh+/fMaG+I
	iNq30yQm7XesrMZ81SWn2uq4Hraav3VPNuJ75/dWH2O92ZNzuaJ+yx64zwz9k7/m1JV6twLwUwuJw
	pt4Qrv4iJFqFYZZ1B5JsJNG07iA8gMWK1crfGFk4mpnNcg56V5tv0UNEaDjk0FDMJThiyqSb+rnMs
	GJvYuAD/ggJXMebtYmt0BhlMnjejcqCiePcYELF5vFfAlaTuJ8EXe765IddNpNiUhv0eDgFd9boMw
	fTmaXB/7qjIZzBYJCgIXe5o+KxBRUED51bfkmfIoaudlKiJKM5KrxuJU4C8xmxESjCgWKnZB0fOni
	QInwNrYamDcTk9FpRQjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAXE-0000000CEWX-41Wq;
	Thu, 20 Aug 2026 21:42:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAX0-0000000CEAl-2l9T
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 21:42:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK8SCl4032343
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tbgIUP+EDw3
	sWeepA+z7ePuoKcChKiy9NO4RbTUL07c=; b=EacQiHVoRe5JOFS9PFLa+VifEXQ
	9fhK5Rtcm5Hnk/nbOdXnpdYwDmW6Z/U4Vq72uZk4mFoNkndyYkfYS87I1tcrxAjb
	L9Ob08t3uMDHjpFrawpsw8RmB7mdYoV9iPyZYECdlw56AkyELDkmQ/12yxDgHFZ5
	QGe6o/MlajQwI+LfMd9n4G3+e9oez5y+7N4JA9PuPFIe+ajz8GV+pUOp51bdt4K5
	E7zNYCArJnl5Y0xd1UilGROQ0Q9S2hYoOiX/tGVXeQ8y4DiAtaYyWX4BzoV/FeVK
	k+DFqobjnmM+mYUI9gqfGn0WqyL5BLv1nF61p9/YHyGR27T8PAoLgD34VFQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xbvbcba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c01ff996dso4041861cf.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 14:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787262157; x=1787866957; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tbgIUP+EDw3sWeepA+z7ePuoKcChKiy9NO4RbTUL07c=;
        b=b21ul5GOqCZ8lDo49eB0TuMLFhYdCZTGg/PAiDATR0YYTjDf6eYu8xV0EbpX/Yxjds
         E8bOBmGTKNADEwiCiGF8jokzU66OUN7o22hZ/17WVBSmY+T/bZldZtPCx0kmwShcn5DG
         XNavXTDFocLdCBvsyhRTdM5R8SnAPv40N+kAxvO2syV9TFXMDfn/gBI6vz4O7CXucGWR
         2/kPkJH2+gO3NtEFzBim3DRb5gChOtdCztipIqKgNcU5VitgtUlRld16yEOafeUQtW1b
         QeI2OHQWAnIcPFqKjyEuZAEJA6nEueB1t9K8uDEC8lxgmiDYa6o7ooCRDeAT5SKanLRD
         M2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787262157; x=1787866957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tbgIUP+EDw3sWeepA+z7ePuoKcChKiy9NO4RbTUL07c=;
        b=FSzw5iangf43ip2G7VvDYXgX8m4Bf80XDheV+FloWSzw7ycKCmoxfoKmQWzWTZJ4bV
         1yrF61K6zyP+sC5s2zFYaQVsRvBj2HcerxLm+FuHV9bvj7j0J9knwTuyp9nJb9E1SDjz
         4y3IplN4ZuDN9RTyxPmJtdK+af6Kk9Bg+k74V+1cCEneBNPiG0cUlW0RnwyXvVKSx1wL
         R55sPwu6ztAqsk55/btTqIzkhC1XoTjq/+yAp3JWC07wbzzy+Ii1iKJJNs0zWPnOzEO8
         LmCZC3xs7j9+4CCJfYg5JIeowncYMA77fCi1hoko9i/d3URrvuKhQlQjy4Tv5I/GPu8v
         1C2A==
X-Gm-Message-State: AOJu0YxZl3Nny004PvEg2A9FuJh3+U4ypDWpkjgmjGXuXtYbhlsNZvNU
	zIY5BGKoBogLQpVAh22EgXmJRhCHWlD82bpKFZHiDL2VVEgNluw18MvUrRrfOQuP/qbWZri6HnI
	rG3zNl3vc1OYyjxCCkZpQu9hdoI7kpEyaisarszi219brQMldQDWLrHlmy/PdGdAU7j/t6QxVda
	s97i8=
X-Gm-Gg: AR+sD110UC/qcz+0v63EdzbuvjTjjeb/wJiKmJGaA+lbBdQZwG0ZgeHM6fKtbyYA4QS
	i0ffqcDxHI0TW5C2nKJO9j5koUJSgosX8DjPWbKy+XdChxIzWRsc7+UcId37c/j06oPFzcz6NUk
	B5E3qgKlVJVFA/hdN/Jv4+w+s6oU8HT7vWyYGOHShydS31IbjIjI2/rDhSsUjqK/IRkJ9Qodl7N
	6nny7AC1obTc9fMgVTE5N9V2rdCUxeRzMlS/IIcDbbEHw3EglzV1bpGb34A2TXgNtu2ECos+NUX
	h0ArGN5gjieizJRpKTYqYsa3nImoBoDtLTQjpZHLaV4d6QVzlfkJmvwZD2Rd+ZeUmSpGRGrYcXm
	k7yCl/T4I
X-Received: by 2002:ac8:5fd6:0:b0:51c:f3e:7819 with SMTP id d75a77b69052e-52df5a96bdbmr10941021cf.39.1787262156916;
        Thu, 20 Aug 2026 14:42:36 -0700 (PDT)
X-Received: by 2002:ac8:5fd6:0:b0:51c:f3e:7819 with SMTP id d75a77b69052e-52df5a96bdbmr10940501cf.39.1787262156457;
        Thu, 20 Aug 2026 14:42:36 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b802dsm13402576f8f.17.2026.08.20.14.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:42:35 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v4 21/21] selftests/vfio: Allow building on RISC-V
Date: Thu, 20 Aug 2026 23:41:50 +0200
Message-ID: <20260820214150.545737-22-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=AMKAkK6n c=1 sm=1 tr=0 ts=6a8774cd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=bII3o_8rYgLKNe1Mop4A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfX5KlL59ARtW5N
 aSMaT6J2M5fCcSkd8cb+3XVLU1FgIJHV5EfbtFur75l2Z/hIkY823dP98PKBN1XVyYVrBcj/t6E
 0GO/CJ6pUlVYcfU/Raxa5TTHnTu0nAFPNdO8pg/cYEg26cW/vTX/NmHn6KjKdA/s0V5P9k9yb4S
 cvWOV5CcFb55jd8l94tyWcHfo0WY6FiCow4xexohS5qfPnDdjl8vLjZN1tSndqHBDUVKun26BdH
 CJKtYnIKG1hG8bsJLETnnUeatmmB6GSK6nSH/f6pxG6DDwf5fju7NX2mJtxMfbAC/m98+KA32g/
 maImItN+39cHyVPyAKQY+rrZxyEnwZrcHWvk1wF19AkeS710yokm6Kl/kto2cV/N1VVrw4V3z+9
 4HhAmGnF+0Ov3rLqRm2cwj6+BWxEWUI5mIuYan+MvpwePrrtvURx8UB/Qd0MiNrzZMjwLGWyd9Y
 lW9+hWRtWvoFs3253tA==
X-Proofpoint-GUID: SLa32iK4Weo_debo5V0icQjAqyWrZS5d
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfXyplHWAkmXbwn
 VyKHl4czFqdRkjNDLccEPnqVlwpiUjGNmL3lI3r0P55CZ8HMMjC5E7bOd/VaymZQfS18TurQsNc
 yeNwFz9Lu86t2Qg6jeQz4l6o6Bd3yO0=
X-Proofpoint-ORIG-GUID: SLa32iK4Weo_debo5V0icQjAqyWrZS5d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_144240_486080_A46E54CB 
X-CRM114-Status: GOOD (  13.18  )
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
RISC-V-specific source changes. Include riscv64 in their build list.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 tools/testing/selftests/vfio/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
index 2c32c48db509..c6c5764185ba 100644
--- a/tools/testing/selftests/vfio/Makefile
+++ b/tools/testing/selftests/vfio/Makefile
@@ -1,6 +1,6 @@
 ARCH ?= $(shell uname -m)
 
-ifeq (,$(filter $(ARCH),aarch64 arm64 x86 x86_64))
+ifeq (,$(filter $(ARCH),aarch64 arm64 x86 x86_64 riscv64))
 # Do nothing on unsupported architectures
 include ../lib.mk
 else
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
