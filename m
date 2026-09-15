Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4610C88E75
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 07:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8WaLAwI9eZ5LHKDmqh13GwIMRApvNPH5Y3Yu4vhabfY=; b=xbgH2/0m2O3kL8
	NcnXZEELZ46oKB7Pv6VN5xCRfrmaaupRjaWSgHuBg9HFZhTdlK8X42frWA9EQds+cFXVqz/1vyHYK
	DtWSmAJlfVYoyAg0+2ZpjtcccEy6bGrNYxBrSsoW0dxyTBAJ33RXHIj/x5kFJH+RRUMv8TgClAhst
	I5J2OGX/x23rjs12HPpm9tN0XMyo4YzH58dOQkgTCbdozx1Xwjn6gc3itEMuH2mMJ9G43l2rbCfEh
	VkZSsHkBcfUk3YkW/hBVtqkRmXLLNqH3tEJ1tDcFhKxV5qtZQy0I2CslkL4ma1RfM9DB5Rs/o23vZ
	7OVUqOGyXyhocZOfUKHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NPm-00000005RfO-3MEm;
	Tue, 15 Sep 2026 07:17:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NPl-00000005Rdy-1UEy
	for linux-riscv@bombadil.infradead.org;
	Tue, 15 Sep 2026 07:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=A12QGBXThDHXy9BHdQjUCypSnvxRfAI6MUwDrx/7tNw=; b=Qmv8KbEjmW7BaEhfmAPlip6SP6
	JSUVJCxI2WIONWRmMejml9KUWPFYQyCKVKhlLLU+H2Tlg0XwdRt32QYtpHGJp0adB7UvQNkfgQWpq
	vCJ4Sfx8+ZYc/cOC9uE6DMFsQ0yIPGjSBnIMd6X6wz2wDBtxUHHTYFx6l8kfcDMa/ZpMioJhgURvx
	GLjwHLF2Q1jlZz2kp8cTxvNx3P8ZaoNXwPUkaF3p6bqVe5jiVO+y2Sdj5TRgwvshP0Q17OBLIRW0S
	xf5BRJ14YgE9YV3M/CR8rCJiAfZiKZodNvvkyV8inkf6Yw6n30QgwD5Ih2mr0VfdNZjMdyK8UeZTJ
	4oIvL34g==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6NPh-00000006MJ8-1Rse
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 07:17:12 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZRhM1661526
	for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 07:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A12QGBXThDHXy9BHdQjUCypSnvxRfAI6MUwDrx/7tNw=; b=d9GXO6vFu7CucDWZ
	0lxtLdT4AErXo3u3joBcOp4v7idv2k0bs914FxscUfsFgcZdbJEL/CUISE88od/F
	kK90OmWBZ9bGRk1OgO+hq8v7joViyzryV1i6F9xetmrhL+8av6WT4aM1/sLyJWvI
	fWF5ly52VrwkopcnRdueC90ouiBdBCYgg5WS9WbITGWB3YhtVtED2TIcXFvvuiDJ
	BQkU3nh4aQoE8OzlBfqh97VBeenu1vQiqlSYCOji7F0lXnVqGQqFRDa0e9Clq4CY
	LFcGp0BjhfmHKPO/RVhazf4bg77TFhRPV9tjPUdjQqc8BK5Gw9h1WMBMFG3wpmnX
	5xKQ5g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpergcg3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 07:17:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e087a17dfso390573a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 00:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456627; x=1790061427; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A12QGBXThDHXy9BHdQjUCypSnvxRfAI6MUwDrx/7tNw=;
        b=B1bQA6yFdiE4jv3fMaMg7f71OP5xDl4S2LM5HzgqO9sG29NgPht3Jg+ecXOC1kxDaf
         CBw4aWphkJ5+U4q32/D55wotUEPR6zW3Yp2plyha6qo++pcELNLWGhqxIj2Ru93tMD/x
         mvX7grVt4RfQIMqoNLPzYHGmTLhko2KsSxdLTWz1euZSztvJvnACjVo0uAuaCBjvmr6o
         vPj9OIxTxtCDgOSULjT5kxcj/Lae4tj90SjWuV4r6eaDxJx3nFUeJJP4li0koHzaeU6H
         3/5Yv24oDv2arotdqdquCbHod496vYCQi92esQhRNK/+lnFa53LpAs5H6CTc0mCf90ZS
         bVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456627; x=1790061427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A12QGBXThDHXy9BHdQjUCypSnvxRfAI6MUwDrx/7tNw=;
        b=UB4RTaAG9ncT/QnrIPFWVCrjRQ+o9RnZiCUOYMTBBoQxHHg9Zrf+BYSaXCriGbZc8W
         zInnBDaQoUbirIjfmFtvCv6hgMYkI08dCQn1Ysc+khriaNnACls6dz8Xwy5KWfCYXbmm
         1AyRHhn0KADSkpniZeemphJH9ZgT7a0/XQHO1PXm9rXgA61Lz5R3F60j/YqhS6DfT5CT
         +OtUHuEQRxJZXVML9PM9gs2RSl+43vH6gQeRATno32Dgf5u0o52CT4OhqQtLTEWBSSX2
         uxHw030lwSTmJ1BIsjfAs13Z1zq1/njL0nje5DxOrHH5tEUpUs5KraztAvBWjOAi8VBN
         XJXQ==
X-Forwarded-Encrypted: i=1; AKwUvBx97rirmpDygbQ4hviHwEbr16QuAt/fxcjEsc1lSZ9CNwXGiDwYYoUO2lzPreoJFmsTC4fLpErdfx3HIg==@lists.infradead.org
X-Gm-Message-State: AFuF++mfyBRfnj0EgwBT3scAgtH9B48yg2luRpXPrEUKr0dqDQeV58yn
	cBOUxW/IOV1GpY0ZYR+2z05KPytYlu+qfoUvaV2JElmw7jp0qVN1QYUVFIgBYDYXShVqMrEX0OM
	irGPXGAYhg1UCQBdtf9QREo492URR1Uebd0GRWGoiRLYIpVvyHySgBdj9AwjTdwAdskXF3L8=
X-Gm-Gg: AYBFou0xvh67QsiXsrtsMowJ+q9z+ucKyYBiCrjbvS86OfAoaDXD56BLksxmHsL5t8L
	AqKQOcxvFCw+ucA1Y4qsu4YOBRf9rbSTbFAoZ2xqtqSMPvDSy5Of31Tv/0idYIXVNQw3B2iOqFL
	721Kxrj+beBlEptWXLNxKr0/g9aaLptNW6fJVP5riwUpGMpry//lElefkTwbFXXlW3r5ni5/zdK
	vm8HfrU+S5vnGSYCvwHDBmhdD5BohR1MVCCrBzhC/hs+ymHMK096RgVmKxiHApI5IAdwQfZZYzA
	585XZIu2Qa4BFjlOc5hiR58GqH0sSgi6at+bx2LpzU6Vqt6wk7S6DhRLqkzS
X-Received: by 2002:a17:90b:4d07:b0:39d:f6a6:60d8 with SMTP id 98e67ed59e1d1-39df6a66122mr8234753a91.3.1789456626555;
        Tue, 15 Sep 2026 00:17:06 -0700 (PDT)
X-Received: by 2002:a17:90b:4d07:b0:39d:f6a6:60d8 with SMTP id 98e67ed59e1d1-39df6a66122mr8234683a91.3.1789456625915;
        Tue, 15 Sep 2026 00:17:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:17:05 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:32 -0400
Subject: [PATCH v7 06/11] riscv: dts: spacemit: k1: Add Zic64b ISA
 extension
MIME-Version: 1.0
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-6-aa35ebd9ae96@oss.qualcomm.com>
References: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
In-Reply-To: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
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
        linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=10167;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=/bdHVT19+Gg3CIpKwikMFbUnLqQOlahzHepUFXFmpKU=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVH7ZOvR11rk9k8deL1q+SHq1PE1FuLF/sd7j3+pqKD
 q2Js/oWdJSyMIhxMciKKbIcPtqSvfWVT7Tvc84fMHNYmUCGMHBxCsBE7BkY/un7p235fCFg3+F5
 rkV7LE/xTLoUaRWo7/TX/9b0L25cIiUM/4uaUhzawtb7XA7NkOA4laH+e8mfO4V3lvp4VV3f0H6
 jiAcA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa8f0f3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=tnVZVcqGRelvdznDbj8A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: DGHay-wMSOSHPjASUkuRDt4Xn4aUanIP
X-Proofpoint-ORIG-GUID: DGHay-wMSOSHPjASUkuRDt4Xn4aUanIP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfXxv+T47WM7Kn0
 FNfljoNrsm5evUfcEo5+mUMdXQr2M0C7FK7tGYr0qi48gpjpKt1+hX7d2XPcBSbqvFNANa5bOmb
 ReM51qZ7KtJXg4GF3J3m0qrpXjCB2gsxoxb08Cspdt293Uot+je1BfnCECBuix9V26Jx9M+e499
 Z12UiqtOQ5x++I9qH45KGYd7B1ye5d3tjhD80ssufyKvvOj1Fb+E4ZPvuOh2+yxQlqNNIsC6G/E
 JAHKd1mxUrtNMxIarRjSv483BPyPd2u3Ay9Bw7E15qJfR7FcQrqYHsVSxCeMffrkadB50ZahBNo
 zMGMMOMjJGL8HPZcbF/dXU6+DIShcySoxp+ak1gjgi4uqvSnDJCvR1Bcgj9WAPx7l/J0E/nfqDo
 hBCsjUHOx8Y6rQUtjqLX+1hICACBkM4XCryEXn2p++5m08NAppgE+WED9QqwyShWgtc+PzgiUSP
 VGtaTCm+nVP0Xak7WOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfXx+GC7oH/B9JH
 2eJSDeWubptzwEzgi6s5f7hUKRzHx2MQJuYRu3UJUtZOLFb54lqc/hqOPowtXKALNULrcLX/Kaq
 HwJeISXS0pATK93u62337kXNhgrlIas=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_081710_466792_20DBB1B9 
X-CRM114-Status: GOOD (  11.70  )
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

The K1 X60 cores have 64-byte cache blocks, described by their
cbom/cbop/cboz-block-size of 64, so they implement Zic64b.  Declare it in
each core's riscv,isa-extensions and in the deprecated riscv,isa string.

Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v7: No change.
v6: No change.
v5: No change.
v4: No change.
v3: New patch.
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 80 ++++++++++++++++++------------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd34114b..542bfc0d19f5 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -57,12 +57,12 @@ cpu_0: cpu@0 {
 			device_type = "cpu";
 			reg = <0>;
 			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -88,12 +88,12 @@ cpu_1: cpu@1 {
 			device_type = "cpu";
 			reg = <1>;
 			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -119,12 +119,12 @@ cpu_2: cpu@2 {
 			device_type = "cpu";
 			reg = <2>;
 			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -150,12 +150,12 @@ cpu_3: cpu@3 {
 			device_type = "cpu";
 			reg = <3>;
 			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -181,12 +181,12 @@ cpu_4: cpu@4 {
 			device_type = "cpu";
 			reg = <4>;
 			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -212,12 +212,12 @@ cpu_5: cpu@5 {
 			device_type = "cpu";
 			reg = <5>;
 			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -243,12 +243,12 @@ cpu_6: cpu@6 {
 			device_type = "cpu";
 			reg = <6>;
 			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -274,12 +274,12 @@ cpu_7: cpu@7 {
 			device_type = "cpu";
 			reg = <7>;
 			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
