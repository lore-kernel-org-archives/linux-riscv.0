Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38240C982D0
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 07:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PDXzsPwGPWSFFzP7ZHdN91CVFv6VUwVTrTMr3Wxfc1M=; b=gqCVgtihwz8RZd
	M1Cbm/w+n9Gst/pQ5trWim+2t8DbytxvLCFMyWaR4vwYbL2v5K70yA6VjBlqjIquMlj/wWLOW5yeW
	604zHHE+1yL+9Tkzoi9QkRflSs+v7jpYcxXkGG6mCXuKvUa4wjkcjr3hX5GvR+iGH9hAVR6IIVNLu
	hIv+UmQbxjbZOW9q9zB/vhFqZyZ35uNQUmkYf/eIHJhe7Dxarq1TE+k+b3qORt8W0PFUIHOcVkcDB
	wNnmrt4TiXZRCZCu5e/7fjO18A+s6U309ta/O9Iw5qAdCifD/X/Crj1mkYpiYVv1aUKdQgV4Zg+dx
	MLk5tDHRtqgzoBzg9nyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8BpZ-0000000H174-17hT;
	Sun, 20 Sep 2026 07:19:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8BpV-0000000H14e-1PZL
	for linux-riscv@lists.infradead.org;
	Sun, 20 Sep 2026 07:19:19 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K54p22162420
	for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 07:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UHFLhSSjFeK/2Qgt8PRoHcg0OoUbDpRSGGwb1qbscJE=; b=Ic5MB7VAwC36ZUUy
	bcXInZp7ieo9Xs39FShMA4Jn8xyDoivece3lPN9XccWYNIKwSIrf//vGWTrYS7aQ
	sRLjVjkR82o/wGFq8kDASk9LHbnkMDvusfdBbBPF93opeT8I5zFBRwxtJLFDkcvl
	1mJQeFyiy2QEMa7CoVLK/hZHE9868BgAgVZMy14oicWW5uVEle1iOzTT8GXpxwT5
	Vvy4pRS549EWrgegn3jvkrSJhonkSdcucdlzYAtoJcMmQfEGul89R+akhg1jIuMT
	h2bojKvPMLOZ9PjFFTq9StVz8pRDVApDQdYhA24I60YxtxvVWGBV/JQzpTxs4+TL
	FtNrBQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskjk2ce3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 07:19:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6f75c1219so44765395ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 00:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888756; x=1790493556; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UHFLhSSjFeK/2Qgt8PRoHcg0OoUbDpRSGGwb1qbscJE=;
        b=It3eO1HDNrbsw9iRlZoqL73l6p9BjQshISLjf6RGe5qv0zpeP3IKZTfcyBUkZcaAtT
         LqfB9fvYy9n9BT8M4w6GN/rfycpr8Ep9GqiQ7f5LK7jbkJPZpvdHQoleHbk5qdvaITDk
         P2y+6LJ+k8tk6ckxbRzOkmRpx0KwuPG35IIzjNI6kBOGxXZJ7AQ3S0epS+kC9BJxNm6e
         ucpqDj5TLdFgCProP+VT0pVArGC9oABnR/j5Ehmww10qgsk2hBPmdYK735TYvNKNIE4B
         xg7st+gLSqNN0gdsQz5SVdL4e55VW9fqFtU0uPhQWuhSLCwBa6NALsA2GtCZ3RGdL0du
         syVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888756; x=1790493556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UHFLhSSjFeK/2Qgt8PRoHcg0OoUbDpRSGGwb1qbscJE=;
        b=scmTf/cPippBo2/6V24SbaUbPJ7paiZZWFh3+P4uWJ7p/7ikosoKfs8rGKgMSZd+Ka
         LYnuBv7wSbdyPFZtOCU6K+AvA7w26GzAHNl6oQUmy0cceDfJDpU/Aegiyn+pBluCj85q
         gtOisycvdNcH+kHuJ/rhNXHh7lznt9ABTJFuOy/HpDOsEUum1OnfCAmmopC72qApud96
         IrvrAO2Cet0dks7QO4F8QvhpDN7rSW9ysPqPceD9JGkuV0xc2I3pwOcaC5zbb8PV6JoM
         XgSS7t1irkI/R/4+NVaKVqdZJfuf0d36gYbMMVy4ysucQZOkD81ZRJwUK24K/KMXi/aJ
         2+Cg==
X-Forwarded-Encrypted: i=1; AKwUvBwrhwH2uugtfQFvMB3ALkA4rwNMAzN/f2aEL39jyD7x6vL6mT7R84fSzrJDXq9CUOyxfceLT9r6/hjotg==@lists.infradead.org
X-Gm-Message-State: AFuF++nCctukxaWko2ORL/9e7LdrU+AhnM/BdAeJ8IjBFBnu6Txm3JEt
	1+4bCgsZV/GUo3VVoJ1TB94PbESgQJcsgvL73wo9G0RNnaKdoapjMW4aTO89Pjv6luDpoX53bU8
	F7I3JcWLMe00mM6UeIoOUlHnnEFpJM7sPThM9F2k1HM20cDMm+hws8T0ohFsE2QinaMzE42I=
X-Gm-Gg: AYBFou0s9MHuxGGcnFJqsASQ4Mgf7Hve8YhVRMfwsQRpQrg4ltMSS+lPqo8sdQM10A3
	sQ2IN72YGuXQ5YimIfDnMN9Y5vW5NqD9DfSPgF4qBapSayq1sP9hG9Sj943+eAFWEEDLXb9oaie
	qVWB1beQreNNkMIgt/Rs8+PnJ7YTiGP1uwpK+5LaDtuNyHz6wda4meuu0p7o4o+moSYDgYN1gML
	HlFowYykH+Lo+rN1DUsA2rdoGLpZoAjVaLSB/pgY8OuyypDMtcJ+4dvLrXMHU/19yVLWRkSulxE
	yZRQH4P/64v/GDfHENWW57Ls+w/Fg9fPJN6oLBEFbzySeMGJdHkotVpWumQ=
X-Received: by 2002:a17:903:2349:b0:2dd:c100:3136 with SMTP id d9443c01a7336-2ddc100317fmr57726565ad.50.1789888756067;
        Sun, 20 Sep 2026 00:19:16 -0700 (PDT)
X-Received: by 2002:a17:903:2349:b0:2dd:c100:3136 with SMTP id d9443c01a7336-2ddc100317fmr57726175ad.50.1789888755494;
        Sun, 20 Sep 2026 00:19:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df346152d7sm13908655ad.16.2026.09.20.00.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:19:15 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 03:18:24 -0400
Subject: [PATCH v8 04/11] riscv: Add Zic64b to cpufeature and hwprobe
MIME-Version: 1.0
Message-Id: <20260920-rva23u64-hwprobe-v2-v8-4-5f14bc5c23d3@oss.qualcomm.com>
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
        Qingwei Hu <qingwei.hu@bytedance.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5864;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=m8QTnRAVXBgeltmWje4/RsUPIbOd9dsnEyfmYwjKXH0=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqz1HScj1nvMNWr43/+7IHyl/kW3yeedt5acYbzP1TR75
 Yy9d0OqO0pZGMS4GGTFFFkOH23J3vrKJ9r3OecPmDmsTCBDGLg4BWAiRVMYGXZcv8JS/sx9udwL
 /+iFm2Pda2L1UvVr+PMWafya02rDlM/IsE70cHZU3rUfS3gUblu39HHV5b8xrRQOSGM9t2P6g2t
 u3AA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=H6JOUOYi c=1 sm=1 tr=0 ts=6aaf88f4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=HwFc7jivAAAA:8
 a=968KyxNXAAAA:8 a=EUspDBNiAAAA:8 a=XYAwZIGsAAAA:8 a=fFnMLytXjIv02VNa_WYA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=kr7TZk85JJIQSqC0cl8G:22
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX5PNYUB4hXHm4
 KWpqEudgXQZzuRsrNJ/mwsme1QxpwPqvdTKOxBu9VR5uyasAKw9PcY9+vKSiO1p1/hh8miW8EoO
 JgcIBtle6O2bSR0crE1z3ysRtk2GMUEhetOtJMn8T/VYFsEYaCYlVdEtNBdZUgffSi677yGcMV8
 omp12F8fbK5efwdB3kNDXYMLj8lSR89MQ8FqXD+zMdZ6WyR6LZ3odBZ8nyq3FvqzGnsR7mbr/wX
 BO/nqSwLcR+QRP0IF/ybCifsPRIBvd1fp/nrifAQFI8VkPqG/xAWD+5skqhpAe0JrVlflssrqbY
 7OOjmEaLk+1Yf2JNs2lKSgvl9gE+DRyUDRJJWHVZad/aVu2jS30h9egrKR+WrieqhsUGux7deDT
 rCvKucFWwCMVtRRgpc5JuNh6pLQ0GaLGFuipjQb5AIygrHT60GtlFR7udS//JaYEEG5HJwksezI
 XWkPHwFtXOJ8oii8fsA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX5udMLRdgutEg
 o8qLOXu8YS1bqqpIx9ZRENAVYKBD9Wnqyx76Oa1suCbHs5sV8PUe7OvipiFd/RpH4LpVtEqw/c5
 wjbyfdc0gjVELfmQR3Rh3DqN5MPescs=
X-Proofpoint-ORIG-GUID: GIZnbCcJ-9H6J_8ebHJqyb8Fod16nNGL
X-Proofpoint-GUID: GIZnbCcJ-9H6J_8ebHJqyb8Fod16nNGL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_001917_390349_692FBEEB 
X-CRM114-Status: GOOD (  21.56  )
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

From: Qingwei Hu <qingwei.hu@bytedance.com>

Zic64b mandates 64-byte naturally aligned cache blocks and is a
mandatory extension of the RVA22 and RVA23 profiles.  Allocate a
RISCV_ISA_EXT_ZIC64B id, parse "zic64b" from the ISA string with a
validate callback that requires each cbom/cbop/cboz cache block size to
be 64 bytes when it is present, and export it through hwprobe.

Link: https://lists.riscv.org/g/tech-unprivileged/topic/question_about_zic64b_and/119631059
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
Co-developed-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v8: No change.
v7: No change.
v6: Rebase onto riscv/for-next: RISCV_ISA_EXT_ZIC64B renumbered 110
    to 116; RISCV_HWPROBE_EXT_ZIC64B now uses the _BITULL() style of
    commit 8da45c93dfa9.
v5:
- Collected Reviewed-by from Andrew Jones and Conor Dooley.
v4:
- Credit Qingwei Hu's earlier Zic64b cpufeature patch: set him as
  author, with Co-developed-by (Guodong Xu).
- Validate only the cbom/cbop/cboz block sizes that are present; Zic64b
  does not imply the CMO extensions (Conor, Qingwei, Greg).
- Add a Link: to Greg's confirmation on the tech-unprivileged list.
- Add the missing blank line before the ZIC64B hwprobe.rst entry
  (Andrew).
- Did not carry Andrew Jones's v3 Reviewed-by: the validation was
  rewritten (present block sizes only) and the patch is now authored by
  Qingwei, so it warrants a fresh review.
v3: New patch.
---
 Documentation/arch/riscv/hwprobe.rst  |  4 ++++
 arch/riscv/include/asm/hwcap.h        |  1 +
 arch/riscv/include/uapi/asm/hwprobe.h |  1 +
 arch/riscv/kernel/cpufeature.c        | 19 +++++++++++++++++++
 arch/riscv/kernel/sys_hwprobe.c       |  1 +
 5 files changed, 26 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 69a3fc0a29b7..8454a6ae6fd1 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -427,3 +427,7 @@ * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
   * :c:macro:`RISCV_HWPROBE_EXT_B`: The B extension is supported, as defined
     in version 1.0 of the Bit-Manipulation ISA extensions, and implies the
     presence of the Zba, Zbb, and Zbs sub-extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZIC64B`: The Zic64b extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 6a693210b251..b103aaeafa47 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -123,6 +123,7 @@
 #define RISCV_ISA_EXT_ZICCAMOA		113
 #define RISCV_ISA_EXT_ZICCIF		114
 #define RISCV_ISA_EXT_ZA64RS		115
+#define RISCV_ISA_EXT_ZIC64B		116
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9323feb7c3c8..9a121ee3b436 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -123,6 +123,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICCRSE	_BITULL(4)
 #define		RISCV_HWPROBE_EXT_ZA64RS	_BITULL(5)
 #define		RISCV_HWPROBE_EXT_B		_BITULL(6)
+#define		RISCV_HWPROBE_EXT_ZIC64B	_BITULL(7)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index beb766420b5b..ef3133a52c0e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -136,6 +136,24 @@ static int riscv_ext_zicbop_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_ext_zic64b_validate(const struct riscv_isa_ext_data *data,
+				     const unsigned long *isa_bitmap)
+{
+	/*
+	 * Zic64b mandates 64-byte naturally aligned cache blocks; cross-check the
+	 * cbom/cbop/cboz block-size (when declared) device-tree properties to
+	 * avoid inconsistency.
+	 */
+	if ((riscv_cbom_block_size && riscv_cbom_block_size != 64) ||
+	    (riscv_cbop_block_size && riscv_cbop_block_size != 64) ||
+	    (riscv_cboz_block_size && riscv_cboz_block_size != 64)) {
+		pr_err("Zic64b detected in ISA string, disabling as a CBO block size is not 64 bytes\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int riscv_ext_f_validate(const struct riscv_isa_ext_data *data,
 				const unsigned long *isa_bitmap)
 {
@@ -542,6 +560,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts,
 					  riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zic64b, RISCV_ISA_EXT_ZIC64B, riscv_ext_zic64b_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index c03c6e08dd4d..8a38a4d37806 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -208,6 +208,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
 		EXT_KEY(isainfo->isa, B, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZIC64B, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
