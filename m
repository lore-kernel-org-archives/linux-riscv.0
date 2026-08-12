Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B223C5CFDB
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 23:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9eDU+woj2af/NFfufDLJgXi2RSMa1HrwLQHUbWYzVII=; b=isw0v6HlGD26hV
	3AiRxkCWzyaY1MzlDNGvCcvc8F2Orgv4pfrZotHCoYw8r9TJU6OxOITUCiDcnQV/AgJa1PK0lF3z4
	YE/GR8Gm5hbCb35qPXBa6klElchZBWM+QPiW/BQxyCZVq74zh62a2pkBIALwU0F4hf88AQ5pHANXM
	rBzQd95xmK1IJQ1SzutXBW3napHGr6jn0RDC0ufEMULGaM/19oWt+Ie7xqt2dw9jlGZ4wPv6j0/+W
	4/CsFrsT3uMXnrjwxrkSfYIYgKcJQ5p5401zH74QaCcgbj5nNL+1ry3knhoC3GvXzyRI7+zSttEvf
	GxZp8+byRnh/5aX/ZBtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuITz-0000000H9cc-1lm6;
	Wed, 12 Aug 2026 23:35:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuITx-0000000H9ax-0Eru
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 23:35:38 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNLoXw942328
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 23:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CLx6LxcsDwB3ZjIhypvrn1AGWZ6LjrH8hIxTnjXB4Bk=; b=YojOx9aQmonhxXUs
	6qzKycVFk4bAjBdLEmZipaYboaKQWt88q/4+/5TgEQvkMXZZActak186vWiRqIUp
	cpp+RUIPLKXwjbXleKwSz8za+0LTBk167S4yKBTZRaoVGiFFq2QqnjefQSqkg6h5
	magLE5etM3/hOeOMeIg1BnnYPVclMDj7qTqGZnfe7AshOT12gzW/AI0HFQeaFnyc
	d1BhNqd6iGrSNBbfx1xM5F1kSm/9R5FENsfbU1ys1LE4ZX2u/vZ37fKhWyA0NpdX
	cBiYcUBv3GEK5KB91oxrZkg32srJDVnUsdqIwsONcXGGtURLgGF+bX0gbm18oCcH
	r5lQOg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0xx1rts3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 23:35:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cee894b3d8so3421105ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 16:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577735; x=1787182535; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CLx6LxcsDwB3ZjIhypvrn1AGWZ6LjrH8hIxTnjXB4Bk=;
        b=jvGw9i9fYtCebD791oXsjYKGM4KK5euPZ5Kjqpi1D7ZIx/YHxePkb89D8PZRs9a38p
         GZ+/arpjMxM9w/YtMM3J1t3lwxtVeReG/toJWuUeZWDtiD3APlPeHzzSdOCI3E0xuwLX
         z65GxS6K8ViXntK/k3moyeTZjVX8Gljt44fId5Y/b/+fk9Wx6ESfUPArXiTEhorvZfxm
         R8GiZzcBfjd+VGn0eLpDcBSCNFf9Rjb7yCP5XnU52RPACyyhzBDMiAvoQWIWswXX7rYV
         dn6wz5RHx0xVe8oAe5L0xXFYRzj8VTN7a+/E2nakN/pN7x9J8iswaxhKy2k68q8P6Ydm
         rraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577735; x=1787182535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CLx6LxcsDwB3ZjIhypvrn1AGWZ6LjrH8hIxTnjXB4Bk=;
        b=TfN6vKFAKqnhOY057j8T5FpQAJOsTn4mqkfojTtCUoyeMNN32eGDGembUjLy14nWPo
         YFcWZTKkAuEb2x1vBc94wIa5r2eNeNVkY0saqAjha0rTuumbrfWajQn6EL+Vg3n/ESsw
         ApNCalT/w4+MqTBW2fZQneCd70EYrJF9B/DOTgPsKUMGL3rkMBq8B9ot0+flx1HZFc+P
         5VxeJ/zFCqCr+U6cEwheyREcUINqspI18mjTa0i+N/HLydJ2rB7T1B8tCHQmVumsnkSz
         H4npjm7V3zzTj7JYD1JY3Fnqt7l+bDpyfMWF8n9NGqxDAsmLMvaJyLLVi6WMICiVo+Pr
         jWIA==
X-Forwarded-Encrypted: i=1; AHgh+RqVs3kTZXX+ti6uSI96aUHgqoathM3CRZ7qLu5ORYFtNNkf0i0OrbSA5/TFpbk9hjzvFxJLPrpep9Pruw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwanXrXAqi7sshwLFBzaiQtcbYmPHwGbPCReTfwG8ujigWMNtPy
	eb3rpWNbfhP745mEtez6Di/602Ni/g+ObhA5x4RWwN6cFcPhqo21IDlFrn/BdA/ol/D8TDTjfki
	6x4rGrH9ucKWoSqK3Sk0N+PjrqvCvtdiCXshJ8HMPaSA02bHVAysMVgGOp1RASVUF1fQwkd0=
X-Gm-Gg: AR+sD13gwx7dsquuIlyAWyAcM3pJnIqQnbUi0hHeOaXQcHbJYjutnsXhSR84iTf8xma
	0Spv/nQ+vzDVsftyFCarHz9HgGt7c2Q4xWA0T/wjD5DVCfg/yzuiX76XNWcSoIAgCZ0AHMa87GY
	RkNBeJVISOpV2eD1KKvCRSiv4o7rsGfsYdoaFnIikwUOLt7fQmtnPFl1lIExzYis9s9oBf2gQMo
	pYGEcObeMx5xrRzssbgi0YzxapR7yb7aDg/UY15ffji92IRCNStrMvRl9M+qLrYUGJQDrKTE6yk
	gruOjJL1JNr+z1R7SbxkfgKpXCsgS2tnEbqvMr4mSyMnky4+NSaSNhRahYeBag==
X-Received: by 2002:a17:902:d2cc:b0:2ca:d172:7228 with SMTP id d9443c01a7336-2d37e855129mr13704565ad.11.1786577734762;
        Wed, 12 Aug 2026 16:35:34 -0700 (PDT)
X-Received: by 2002:a17:902:d2cc:b0:2ca:d172:7228 with SMTP id d9443c01a7336-2d37e855129mr13703945ad.11.1786577734295;
        Wed, 12 Aug 2026 16:35:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:35:33 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:51 -0400
Subject: [PATCH v6 05/11] riscv: dts: spacemit: k3: Add Zic64b ISA
 extension
MIME-Version: 1.0
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-5-c985af3256b8@oss.qualcomm.com>
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
        Guodong Xu <guodong.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6883;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=+dp9Vtps27IuWUP3AnoeGjUrH0F9t/YAsGiT2Ps0DtE=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZtGHGjGn45+ZfZUUtp/T9rgyOard5u8NuS7v5Xpq3
 C+LZlh3lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwERWBTH8jxTsX6fpeUG6OqiY
 s96jVm+yWoN/uL7RA4GuA+4P7qW8YfhncLre/61C3KsnPEEtH5vWTd9yNPbZw9AF01i8FFfXewr
 zAwA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-GUID: JE7D4SWMD6e3NRGTOREryMTPGHAPRKvH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX6NYCqASSht4F
 u9nGFRLUFbrkcxX7x3vRsH/20k5KmG3xFBir9ds6TBQVNLTkCrcu25+Xn3nyogzvtxuk86TwyXL
 HaEbe98tC44+OX0pJCB01lTw2Af2mXyy/EYmMDu+kgCkp1sfjLIqp2YqrLXnb9guS2JiYVAVase
 yC3TFkA1FGmsjXO8VsUelgD3pCyQdpSck3sLKN17MbeAwmHeR4yfZiht65jkJtyoHipyDO4SR0j
 eBlNvLslYhDNpEzolk7PvTfDR1mrkShxUJN59urwvWa6GmfcjZhZ/nxUher7chYBEblHWZACQIp
 +0gld3Z6f1sWNcftCIc49jqHUnmuaDsGbJXnDL3bpj2XP/zXF7mDTC8RzDALDpBYLm2adBqMP/g
 u1qJjjld1c6Jxogzq2EhZsACxK/RpxAPVnUW9JT4gMEfoiBaFlRze7HLMDHGK9KWIEvPlF3MBXb
 CJ+o6Su01J8Z3HrBh2A==
X-Authority-Analysis: v=2.4 cv=J6KaKgnS c=1 sm=1 tr=0 ts=6a7d0347 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UGsqu9ZSYe-JSgDVrOUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX11nUb2NkRBXH
 kA2g/5OYg1zhLz74osMipY8C04wsrgYqh04Vi31aSn5waVVTn9TiJg4j9b04gndBOA5Ubfmlxmh
 mekdYUjNbJVGdrnco9BQP6olfmv8icg=
X-Proofpoint-ORIG-GUID: JE7D4SWMD6e3NRGTOREryMTPGHAPRKvH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_163537_221985_A70E0168 
X-CRM114-Status: GOOD (  10.44  )
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

The K3 X100 cores have 64-byte cache blocks, already described by their
cbom/cbop/cboz-block-size of 64, so they implement Zic64b, a mandatory
RVA23 extension.  Declare it in each core's riscv,isa-extensions.

Reviewed-by: Yixun Lan <dlan@kernel.org>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v6: No change.
v5: Collected Reviewed-by from Yixun Lan.
v4: No change.
v3: New patch.
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 48 ++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 19fc9b49668e..9a03b72e271c 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -35,9 +35,9 @@ cpu_0: cpu@0 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -76,9 +76,9 @@ cpu_1: cpu@1 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -117,9 +117,9 @@ cpu_2: cpu@2 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -158,9 +158,9 @@ cpu_3: cpu@3 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -199,9 +199,9 @@ cpu_4: cpu@4 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -240,9 +240,9 @@ cpu_5: cpu@5 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -281,9 +281,9 @@ cpu_6: cpu@6 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -322,9 +322,9 @@ cpu_7: cpu@7 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
