Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A7AC5CFDB
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 23:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCmwcF0EMsj+D69LV/W5obk860FeLNYhvMbC6XGEMEk=; b=1vzCAzxxsajtYZ
	aV+Sf27vOXXIVs+jWxHl4g7XkSH80aWEwSc82r0ku9JJJW/FsUdHEUYSW8qMHdAe71GYcIwN3G3y2
	xr2tg6GBwOTb0D+Dca7MuVl7eWrlwFpkgVYRMhRAvGiLK37Ht1+2YHlJScmnUCeu+M/FAgs6lat6v
	IZit+Zjt6wOhYYYJeKV4xgGpYTKACCVByAyhaGgeAvNfZH58gOYT4YuO8pyRcx2R6Ii2UhJ9C+sLT
	kLr5L83R9S2qUmlS25q9SnoKhCtcwNn57Xdb4On3Bh+3k5QLLQGUGZRx6v134yO9tYRjyif0eibgD
	kdhnKqy8ik4F/cQqGkjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuITT-0000000H9Qi-3yYH;
	Wed, 12 Aug 2026 23:35:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuITR-0000000H9QJ-3dmK
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 23:35:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNM3Hs720782
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 23:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VZukauZ47HvJdFZVxc8ahLUx1GK6vy1JZjQTVnh97zM=; b=XgbmcE3kmno2yVF5
	OgDlpziUjgc2s4Pnux/+xI+pw/fBuzSZu+e7STF67ioRB/qhciNp89BKWw1j7XnQ
	Is8JgiAsfN3doF7VqWM/3tvFWf0LwrxLk9xhkMshI9f6WfGLqm4GiuAgR4iKydFd
	vYqmKlk0o3yoE42CTrUx6I5dG7Bb8F+VsS2ijs4xFElW+mN+olEftCbm+QjHj7Yd
	nJF8lNdq797/6Il32defJqQ52pdBu2wZClXzGrpD/ohFhf00Myazxu6pjKYpGJvS
	31LMCAmnEQrs0LNe1hsKnBNfnLpTBYaSRv5mWRSZ5EosnsDYJdDZFeme+1x/un/7
	loyPKA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0p3d3kmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 23:35:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cee1ec30f2so22943625ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 16:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577704; x=1787182504; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZukauZ47HvJdFZVxc8ahLUx1GK6vy1JZjQTVnh97zM=;
        b=Bzv2RlPETyzdbllSotRymIu+C8CjKPQZ7gQtsPsfJ5D3z83B/NzpNFHizQj8G/zN6a
         ZV1Y66Lan3bt70TTe14L8wWuxYNOsoMIZmMlfOMLvanouPM7qi5CMB0/u4EdNy2JvMJt
         ol7F239Yt06PFIucC4uEcfT+fCJc7mLjH1lI8PGz/yvwFs6rnOzuRzBgDcJEvDq525EI
         +chS6CNytZmdiE2S8pz4EYKBmO/uDw++On5tf67YJoI1jjbxwS6qZqL9Qja4293iCEAw
         WTEjKQoMzlLr43L9uDk8tHdeoa4PkHRleJCP0zgIiatg1nRGOaZiWQ3RnJx5Q3vJOn8A
         BpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577704; x=1787182504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VZukauZ47HvJdFZVxc8ahLUx1GK6vy1JZjQTVnh97zM=;
        b=lpqAPyuYydI8MhGKj+Fl92UEPExYRgiBZnTgJ/gazRojGWn4vz7vfcs8st9x/gDzYS
         6fEdxm9beOGUtAHceAIjwNWY/z/svDoh90r6sgodKwRcQqQ71oaw+AimzwsWSql1tOxP
         F/Sl6m6ZZTSyQUOOuRU/yHNJEMqOHtobh3+OjmdB+cfzblTOH+/PahzTiK+6Id9w5wiD
         YdBB+nmGtWurXZCwQRtUIgLug3q+biIndfxdmHh2fB4ICn7wyTIkj/53jQ3n2xgJktm0
         oDsrJvkHlPhB3N2KuSA67/hjNywOLkeGfwUfiMAP8L1oCjnHhHecXmJ+cdx4IhnElC4E
         UM1Q==
X-Forwarded-Encrypted: i=1; AHgh+RoFdN4nzLJwWybcX6blw+b/YX3fm/l5NsPdeYD7GfTk3wUnnKUnFyKx/t2togzO0KSohBPASvQdT/BqRw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzbq0Q2B20MheR7HigDMMhfvFDKa81l7avIVcstDYfys9gLn40M
	KS6Xgyhm4t+ESyLWjNOCHkgsLNhMuASH0LEdZudRNR5/kAtZSIaFSdJD3Hcp4LAcymW02igDglh
	vdtB6S+hb146RRwJHWu2yuAFVARjJwXu9NqHYlPq82ZlLiYoz/Hl0c+BPu3sh4S+x6qZtbwE=
X-Gm-Gg: AR+sD109DvPVQuoU7fMx58uPPwLQeWarQEYDU4hLU2UdKJ+VI04gK1KFchDD9hUVKvh
	20JtpRc+C9Ne1Xedtle0wZSXGTf66RELxdcGmGglPe/8mxA11Jx7AB6DhbmXuViTDHHw6aSbTlO
	lqx7bfGOthowCzbJR2xEIpjNzsSY1pu7ejoCyLoG9sPIqCeg1F7fyR596Xz7yEMk2Tkb53wN5T5
	mWyDDbTpgFaZdQ8NqN+66EgE14fz9YlBk1qwxqTBqaoyZ+XZUBdM/oMV/1on1+1BoPIRFUgnoq8
	gfaw47QUoyrRSv/OJ89/7RfQvqJ72ltfjJr9xdSbY8sF1KphtLeDoURr87M2pA==
X-Received: by 2002:a17:902:ccd0:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2d37d885316mr17937215ad.9.1786577703772;
        Wed, 12 Aug 2026 16:35:03 -0700 (PDT)
X-Received: by 2002:a17:902:ccd0:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2d37d885316mr17936685ad.9.1786577703298;
        Wed, 12 Aug 2026 16:35:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:35:02 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:47 -0400
Subject: [PATCH v6 01/11] riscv: Add B to hwcap and hwprobe
MIME-Version: 1.0
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-1-c985af3256b8@oss.qualcomm.com>
References: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
In-Reply-To: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5494;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=rQ+MWjWO+EMEHxCEjEwBmDuvMFGXiD82W1SseEILmGg=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZmF2P/ZD8X91TymcaCo0Dbar1zd70u322ebFU8Ojl
 6ydrXk6SlkYxLgYZMUUWQ4fbcne+son2vc55w+YOaxMIEMYuDgFYCJe/gz//Rz6A+/4iz27vGf7
 jz3lTz+uSJNt3ruvMu7LpEO2N590NjL8rxS8eubzvF3zuy5ZHm+vWpD0XqQ4dc4zL59Nv0Rs2G8
 lcwIA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-ORIG-GUID: 7XN0ImqyRf3ZdPyNvNnrA5sg_PZgnxKT
X-Proofpoint-GUID: 7XN0ImqyRf3ZdPyNvNnrA5sg_PZgnxKT
X-Authority-Analysis: v=2.4 cv=UfNhjqSN c=1 sm=1 tr=0 ts=6a7d0328 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=XYAwZIGsAAAA:8 a=mioeM4dCHJ9OQqhfmfYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX6GXqsHVLADwa
 vWq38xdTvYumkWhESl77Rm5DiHV8AnHOW3obhy0G7eaAiop9RtE7J/mQHmmI62IKF40yxiLNs5F
 KOvfbzNnNV16ZYVv1WmubjQogf3cQ+oTFT405IyYOWZY0HskJPPs1UT4RMOYOg8ltKiqEGi6z5m
 k6nUl8EV3gjOqvV3XNkViT/sWkV/r/uQsGqKURC5VlSsi45569rw7rOPSyflNzH9xkJOfpeuyxV
 m8YhdSnO3J3caKeYhLKbk4n1T8W/elaMy+CnmwCFl/UteVu2eH4oU8H7dhl9Mmhh4jvxUECEmty
 48HbHlsJV9iZeZiS1eZi/1p1ogdNEy0oPKRprPS64iFrnur05AXaobF2UYVuC9L34xbnl0UeSGi
 I1yOj7C2/wDXwyunEARvsEx5CeCTRlFEjVYBoIM92vG4F6MiF+m9EaDP18RgqYcLG1SucwzuFnk
 xsqI04FuLfxZhL5+w2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX06eEMq+rnr2J
 dXCU90LJjteLz/c5iiPwUK8vbK2mSnQ06UJDAoGeTbFAzpsrbr2CUqQcINisOgWJRB8q127J68Z
 GLduzKVYzSf5wRoZ4JWRH+atob5TJfQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_163506_032957_3F5590C4 
X-CRM114-Status: GOOD (  19.67  )
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

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

Add B to hwcap and ensure when B is present that Zba, Zbb, and Zbs
are all set. Also expose B via hwprobe (RISCV_HWPROBE_EXT_B in
RISCV_HWPROBE_KEY_IMA_EXT_1) so that userspace can probe B directly,
mirroring the F/D/C/V pattern where each is reported via both hwcap
and hwprobe.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Add B to hwprobe]
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v6: Rebase onto riscv/for-next: define RISCV_HWPROBE_EXT_B in the
    _BITULL() style of commit 8da45c93dfa9.
v5: Collected Reviewed-by from Conor Dooley.
v4: No change.
v3:
- Indent the added hwprobe.rst entry to match the normalized style.
- Rebased onto v7.1-rc6: index isa2hwcap[] via RISCV_ISA_EXT_B to match the
  macro-ization in commit 41337097f2823.
v2:
- Rebased to v7.1-rc2
- Add B to hwprobe (RISCV_HWPROBE_EXT_B at IMA_EXT_1 bit 6) and
  document it in hwprobe.rst, so userspace can probe B directly.
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/asm/hwcap.h        | 1 +
 arch/riscv/include/uapi/asm/hwcap.h   | 1 +
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/cpufeature.c        | 8 ++++++++
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 6 files changed, 16 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 893e1a1215d2..fc68dea397aa 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -421,3 +421,7 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZA64RS`: The Za64rs extension is supported,
     as defined in the RISC-V Profiles specification starting from commit
     b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_B`: The B extension is supported, as defined
+    in version 1.0 of the Bit-Manipulation ISA extensions, and implies the
+    presence of the Zba, Zbb, and Zbs sub-extensions.
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index f8db798b2654..6a693210b251 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -11,6 +11,7 @@
 #include <uapi/asm/hwcap.h>
 
 #define RISCV_ISA_EXT_A		('a' - 'a')
+#define RISCV_ISA_EXT_B		('b' - 'a')
 #define RISCV_ISA_EXT_C		('c' - 'a')
 #define RISCV_ISA_EXT_D		('d' - 'a')
 #define RISCV_ISA_EXT_F		('f' - 'a')
diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
index c52bb7bbbabe..96b7cf854e09 100644
--- a/arch/riscv/include/uapi/asm/hwcap.h
+++ b/arch/riscv/include/uapi/asm/hwcap.h
@@ -21,6 +21,7 @@
 #define COMPAT_HWCAP_ISA_F	(1 << ('F' - 'A'))
 #define COMPAT_HWCAP_ISA_D	(1 << ('D' - 'A'))
 #define COMPAT_HWCAP_ISA_C	(1 << ('C' - 'A'))
+#define COMPAT_HWCAP_ISA_B	(1 << ('B' - 'A'))
 #define COMPAT_HWCAP_ISA_V	(1 << ('V' - 'A'))
 
 #endif /* _UAPI_ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index e6a394fbe7fc..9323feb7c3c8 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -122,6 +122,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICCIF	_BITULL(3)
 #define		RISCV_HWPROBE_EXT_ZICCRSE	_BITULL(4)
 #define		RISCV_HWPROBE_EXT_ZA64RS	_BITULL(5)
+#define		RISCV_HWPROBE_EXT_B		_BITULL(6)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index d2ec96843456..7f615d1a175b 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -471,6 +471,12 @@ static const unsigned int riscv_c_exts[] = {
 	RISCV_ISA_EXT_ZCD,
 };
 
+static const unsigned int riscv_b_exts[] = {
+	RISCV_ISA_EXT_ZBA,
+	RISCV_ISA_EXT_ZBB,
+	RISCV_ISA_EXT_ZBS,
+};
+
 /*
  * The canonical order of ISA extension names in the ISA string is defined in
  * Chapter 27 of the RISC-V Instruction Set Manual Volume I Unprivileged ISA
@@ -519,6 +525,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_D, riscv_ext_d_validate),
 	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
 	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
+	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts,
 					  riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
@@ -1145,6 +1152,7 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap[RISCV_ISA_EXT_F] = COMPAT_HWCAP_ISA_F;
 	isa2hwcap[RISCV_ISA_EXT_D] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap[RISCV_ISA_EXT_C] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap[RISCV_ISA_EXT_B] = COMPAT_HWCAP_ISA_B;
 	isa2hwcap[RISCV_ISA_EXT_V] = COMPAT_HWCAP_ISA_V;
 
 	if (!acpi_disabled) {
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index bd6ca7d769da..12ea4f39a838 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -207,6 +207,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		EXT_KEY(isainfo->isa, ZICCIF, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
+		EXT_KEY(isainfo->isa, B, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
