Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8E2C982CC
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 07:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CYbuYvL5OedP9YfNcQs+rs3y29jKFttWpKHbXqGC0XM=; b=JwaedeRGpOYZIe
	pboC0Rn0V7jIyAv0JgwkgqWk06UKKnrfbVq8SUyYuvCZuuN6WushrUPf8WwK21F5Z2PYP93rVblOY
	HM6WSl9NY4ho0nwmE+K8KVCMyB7pWY5OEBeZJqKGiw3v3qEQFIsc+OThgBJUzbexeA3BUq/vCFX8n
	0DtNff9E1j86Diw8gaTIVMZWtb19Hg086/sZZxy1MZQkRTbqgHYI1dydi4TmDQ0SPHBP2NXa4irop
	gmvjhH/I00Pvl44zxKiYYrdLHyIgkcShhhBrhC/eksjx0Abdgth3srkbucjcnQHLb+a4jzaQ7+hgF
	84XAYVfBiqGYBAlwfQtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8BpA-0000000H0zH-3rAl;
	Sun, 20 Sep 2026 07:18:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Bp7-0000000H0yg-40Py
	for linux-riscv@lists.infradead.org;
	Sun, 20 Sep 2026 07:18:55 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K55i2e762056
	for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 07:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NtVhaCBTcHcgnJGiMK+DPEueNRTd7gSRrfmajcTx3LM=; b=GFXElVjwanpHlUhf
	PTvWyA8QaBwiJEFwp1wARnqbKtUkawjlIDLJUa1gO5GacEimCFbUP/wO3SQiNtSZ
	DfZcXfSVud8w1h8vh8VddfZQrH8ZylQcZYKsQjY728WwaN4a7JPskiM17zL7USeK
	W32XXnFdlAhiL/EIOiZTCeT76m3MvAL0TATOGMmVSgmogrPELM14A2qlfMJiZML/
	HF864qxWmON26Zv594zjfpJXkH7dwTDxSJpJ9dplyWJPpasgzPnbeLgbHtnoVkRi
	2LVkLI4zSo0K48XiL+TgrRYrLb3IImLgxbImh6vfzXg34r8KGBIPTB6v34GbADuM
	7wCicg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskp9tawn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 07:18:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dd188e16a2so24062935ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 00:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888732; x=1790493532; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NtVhaCBTcHcgnJGiMK+DPEueNRTd7gSRrfmajcTx3LM=;
        b=XS9tF1JsfijCDp9G1Smk0YuUIuzIg30zfZhSWsh2A0AH3RdfQWQcAooNPDB0zi9epC
         noVlhsjM3Z5BhdQVZZczCjTVwRa/+tiUCwVZax0V0e1Fw1ipiEe9kofkE7i9TZ8G630y
         q3JkXCuZjJH8KdX1Hfxe3MAFftOB5B1OYAbMSBraRtTi3gJd58JnZfVakLcRFmGiPum9
         Xr+ueDiWJcil0OO5JeAXrpsnLKn2zjoQYAE50pMZ8yYErfPZmDXOyrc1Pzek9wz72U0y
         hVXbsoTbJj96/LYYwGRzMdCs246NtWdVgg1raQWmKHYLCkqKv5ME4L5LQmGTIYFdIrDm
         jHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888732; x=1790493532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NtVhaCBTcHcgnJGiMK+DPEueNRTd7gSRrfmajcTx3LM=;
        b=gRv2GMceqpuWOrt0a5j3ca9o7VJ8XXeu3Yt5EIqJdsqhaZqzvMe8MVT/lJJL1pAbnp
         oO4PjUz/sIS+cVKUursLUDOXTp2SmaFZIia0LXhSgIn2qndSkHvjqWOwDO3+9BUloHuj
         b1MLsjNWjbuv+DVVv7UcSaSRa9Dhn0i06JefinpI2zdZmokf9WcdbCSIbDAP6w8bUcAO
         ugOLE/qV6g3NMoksKSD3NNDBmq5ArbCJJ9wYqzCyKbMNIXEppbANtMLFSfim6PLKbeYn
         N+H2iG8L+BLkgRm/hsaF7+X90/aMJW27r+mcF9ncnnKJLufwSwi8qdBXAASpeN+PedBF
         ZLyA==
X-Forwarded-Encrypted: i=1; AKwUvBxD0oGyPcB7fQOYPNYe7Ep/BBQnHdI+LoOy4aK4DLupIToeZ0Y3cUdjctFC40NAB9ma+ZZYrp8KOJKxhA==@lists.infradead.org
X-Gm-Message-State: AFuF++nOMkqzwEwJGbxKJDmsryu20o63nARs/NzZSww3Y8jNKTyrjMQ4
	jQvRaI0pMy4kuv2vV40g/vqORM7lrnOJMQ5u9tsG477HhQBns3gfsRwLKiZvHtbMxiSSZ5k09BY
	1gcDmGLc7k6NaxiL+XZV/3jqcMQW+E1aS/um4/BRBeEiTILJ7lpQGmOWcvkYDivMrAuIrZB4=
X-Gm-Gg: AYBFou1QEXG6v9EWH/FGOWY4an6OxHqJrGKqoZ74EtfxTVBwxJBrRJYxZCPatY3w2vD
	F+G2FK0OyybU6HTij3dH/6qVJlzqcqXfVvHEv+re1k6Y+9ff/yLSsNOEjL8VzlZkpvM30U2vhQN
	gMjP2fywTgFHZMJ91ubcPUaxTLrogh98/xoS3WMmUidQV9BdHvo+ehSatP4z2CvemyXWywfWfcE
	rssI+w/jq/+VIktXQiOtbrPQyYxrhYDAF7LwhDu6+wnF0VqyO26ufF1En2AXmVVWng0IJdVcdBP
	n4QD+KskTdsknKSUHeqHq57HosN+V+OoPO1Rv9KQr9PJS4bI9Z7GTBhH/wA=
X-Received: by 2002:a17:903:2f06:b0:2dd:8e7d:90f7 with SMTP id d9443c01a7336-2ddb1adb4a8mr123699575ad.9.1789888732346;
        Sun, 20 Sep 2026 00:18:52 -0700 (PDT)
X-Received: by 2002:a17:903:2f06:b0:2dd:8e7d:90f7 with SMTP id d9443c01a7336-2ddb1adb4a8mr123699205ad.9.1789888731774;
        Sun, 20 Sep 2026 00:18:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df346152d7sm13908655ad.16.2026.09.20.00.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:18:51 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 03:18:21 -0400
Subject: [PATCH v8 01/11] riscv: Add B to hwcap and hwprobe
MIME-Version: 1.0
Message-Id: <20260920-rva23u64-hwprobe-v2-v8-1-5f14bc5c23d3@oss.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
In-Reply-To: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org, Andy Chiu <tchiu@tenstorrent.com>,
        Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5580;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=evoTi1l8TpbQki9A+dpnP8+0GHQmhiwP30MSnsIzMwE=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqz1HSd+6XopHV763+TV93Q2qfnS/fbZKWsqP4fZci7de
 d4s9vuhjlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZjIT02Gv5JaqWuX7lb+wCxk
 Od1r99EFz/lzv4YqKz1Yw+GUl31t+lFGhgb5Y5rpFRsnCok8urNe4GXuU60vv49t/bC22eaM9Mk
 f5SwA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-ORIG-GUID: Ej0hWmFifEWKvZY3C5aLraT5LG27qBxE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwMyBTYWx0ZWRfXzAyVT3CtnEuf
 lfc4Wj0LcwL56x9078lqEW37obUSi5hjqPIwU3dbQGStYOgVklcKl2xMdsUdtfG54MZnfWAJCW6
 b8sNMMjq2iQls1UnBSo3F1tH67VrL4Gwkw1WpXVRn54YPbFxgPaXtHCIlADQ2v78OHondvtJHjA
 ta8K4JM+OzJCKbAGWJLyd1mnPd6YIvjHeJbTNrzvuDq8Zx6ndzoObxXRSBTDGn/HQV8wcV6OxGb
 d6vQHw8rOq1/URBC+LHpPeehFAzxcEmFPb+KLcAFvfDjfWK/Ktn1YDlyeJLJdxExj+vjNTaOVJr
 wVYDyoRTwOR7Tdb2+L7cw2O5kY2j3L5NyTRJlmKbTkn1PJAWjc27n2lKhV2zkLgpkvrrCXXUKUK
 AhdPSD/dr6nzmf7TBnlIkFyvakPk9FcUBeAUsQYf8oIH8rttEnHKPzFbDvJb1wkNGtA/2R4YPYt
 n0ckKKEEcvEYq15w8bg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwMyBTYWx0ZWRfX9YrE4wC/6zAf
 YIZA1xRtV23V7C+o2QvbVkSWfIUJXdXMM7c6rLTqzq01TQOxQ744yw4n0cz3+mtCOO1J+HeSnP6
 k9AySoswCIXRf4En16SQiaxdCWOsgU0=
X-Authority-Analysis: v=2.4 cv=BKAmP1QG c=1 sm=1 tr=0 ts=6aaf88dd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=XYAwZIGsAAAA:8 a=mioeM4dCHJ9OQqhfmfYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: Ej0hWmFifEWKvZY3C5aLraT5LG27qBxE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_001854_016677_77B25A49 
X-CRM114-Status: GOOD (  19.93  )
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
v8: No change.
v7: No change.
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
index bb1e0cbab36f0..69a3fc0a29b71 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -423,3 +423,7 @@ * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
   * :c:macro:`RISCV_HWPROBE_EXT_ZA64RS`: The Za64rs extension is supported,
     as defined in the RISC-V Profiles specification starting from commit
     b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_B`: The B extension is supported, as defined
+    in version 1.0 of the Bit-Manipulation ISA extensions, and implies the
+    presence of the Zba, Zbb, and Zbs sub-extensions.
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index f8db798b2654b..6a693210b2519 100644
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
index c52bb7bbbabe9..96b7cf854e090 100644
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
index e6a394fbe7fce..9323feb7c3c81 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -122,6 +122,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICCIF	_BITULL(3)
 #define		RISCV_HWPROBE_EXT_ZICCRSE	_BITULL(4)
 #define		RISCV_HWPROBE_EXT_ZA64RS	_BITULL(5)
+#define		RISCV_HWPROBE_EXT_B		_BITULL(6)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 61d21f7148305..beb766420b5bc 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -484,6 +484,12 @@ static const unsigned int riscv_c_exts[] = {
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
@@ -532,6 +538,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_D, riscv_ext_d_validate),
 	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
 	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
+	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts,
 					  riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
@@ -1161,6 +1168,7 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap[RISCV_ISA_EXT_F] = COMPAT_HWCAP_ISA_F;
 	isa2hwcap[RISCV_ISA_EXT_D] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap[RISCV_ISA_EXT_C] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap[RISCV_ISA_EXT_B] = COMPAT_HWCAP_ISA_B;
 	isa2hwcap[RISCV_ISA_EXT_V] = COMPAT_HWCAP_ISA_V;
 
 	if (!acpi_disabled) {
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 7818e1d32622d..c03c6e08dd4d0 100644
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
