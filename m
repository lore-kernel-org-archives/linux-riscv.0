Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F7BC88E53
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 07:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XZxy7G3R5gaSZEQgHavw0khd/Mfy4r7EmNBcoMpzHK8=; b=0bz9qhPPD4gfln
	cEMRsf2lWfuffAY4VeG/vD+nDso64wfkNe13rGpOudmlVoJn/TGdjoywksWbdw545tM9CP7ptXUbX
	VMikyOiuVfGLTlnzVwhFC3lXj27RvgfyUUNQXFRTTHZLO7IV7TBJw7iTnhjSN1pm6oN3nW7s5tiY0
	TLQjkbQ4+mIwHAaE6uEtXn70yDC1huARzDw9UhtC8O7V/TzeFJMobJpBJA6B8NCofwTQvXhWAdYx6
	S1BJVhLxWUCh4Cw71UfpxYXcPrLsfU4gpTjQPRG1u5gGDTQDslJckmQvGSd3zQkUpZivAcyb6FJjE
	JhIcU3PvfLhKsaLAgRYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NPa-00000005RYX-2AZk;
	Tue, 15 Sep 2026 07:17:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NPY-00000005RX3-2Kdp
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 07:17:01 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z7tl2249667
	for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 07:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	03K3JYYH/TI0gehAvshcmsYiXcqyxVgQVe7B5LINZPE=; b=h7TFToeBWimVbRuK
	QFPpndcbP6SgGwsJyKfEaPXsul2JrcVBIcNFDWAU16XnldGTBc/GnZiRK2vnSLG6
	7wwbPz3Wi2NAWZJWM1SFV/31iEand/ozc9DpAHEuoJJJiq7MoakcfNWWz4F/gLkw
	tPRbOx/qtbg8DYZMg/wdPXij9j5fRp9/tM8DXvW4qXY4hLE5WWDzpFPNEGSshlNW
	AB+Yt4Zk1gDUeT3FhDXzcABfz8gDLhqrmO66IAkBcoOvmIjea+R6QT0P46JWH03a
	dyXCdgZ4Qt58mXkX6gF+Ff6/kXnNy4jfm3r/JmOgM2kODDnJXtCHhW6kcb37OFiz
	r+ohfw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpye70ghp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 07:16:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39512608fb1so9852490a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 00:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456618; x=1790061418; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=03K3JYYH/TI0gehAvshcmsYiXcqyxVgQVe7B5LINZPE=;
        b=XVrEcCrpQcNEFp93HwpDLfiqZsr0klYtrkSUF8LTjl5JK7mO3LZpXxfSXnl+9igxvD
         +AUiGulPRMYuWlnQ5Ytx6ledvzFM1RfZM6VlQ2A9YlrYNdbCTcPrudgvJER3HGHqpQE4
         JQMXi9YfNiTFDz2q+E/bSz1PcDGLFARxhaAHKvrLSZkSIGyQ6ADoamjaCKMQXp8MARep
         w5JzLM3WjXe6a4P7K+YPne2CraKNAftsuP2tRRb8+AY92Pvvn1BBWCXApuCTfAonqJ1S
         rCBLG2M/kHvO2NNw71NZPVOGxjhqQTNS20LOViUT/yH4FE90c5GFgFwnaOzSKcf8pvZR
         i0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456618; x=1790061418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=03K3JYYH/TI0gehAvshcmsYiXcqyxVgQVe7B5LINZPE=;
        b=Sf7wc/2xqzx/faS+EhBzny39Ubwed98yn774L59QecXGCPOLi/8IgHtXl+PozPi2vS
         /WlrN81F9P4ByI+X7wlAYad47eZBYKctyntox8lkUju99j1HKwb5mu3GWlNYGH7zD2Xk
         cqu4KTXWk7MvdHAmxeSjq7wlCQVGLBKzpXUkLn/Iq/0mTQGV70b/HZ7bhwT9ZJL+c/8Q
         /GCNHXiLEBV9HXVH2gAixmjZfenN5M+RIn5l/b5qqa/8qXu9GoCfZz57/4QsUP7ApnMT
         wS6mhpUJRYnWTZ+QsGACyn3ekmy3tFVWix5iP24antETkGZXlxHOnyL8CeY5me29o95G
         8UyA==
X-Forwarded-Encrypted: i=1; AKwUvByZV1nqB1M23I9jU8HTNhjsciww5nC1mfvdqgnP480sJOAUstZmss/++aROabQmoKRdMBdImIj+UmfQKg==@lists.infradead.org
X-Gm-Message-State: AFuF++khqBZaiJet1YVwIHmUqRTQwlcF4mo++Rnws2vkBakwqEDVk8Rb
	+s4DBiVIGQjCMVdYHeA02//6h1qROPkjgFNWjzUFBgWPnPNMM2g2/Kgu/e0aQbrswdf3weCIOKv
	Z83ux8qVe563Y8yGOTe4JNk3YikYhLdnF/Tf2Hgg6g3ZuEQrRuSieBU4jutXjepuN/h0eICM=
X-Gm-Gg: AYBFou1bT/xorVizuPDI8NL4724/G7iNs8yw8WC+1a+0AMvvVats9BaeWG1MflkxV3x
	Or3GInKDLnnEQnkhtjy3z7vY9QO5XN6FMSmGFePGnReWGBbQDw9VJPRZ9HqEGz3UDn7tvL7Zw05
	mqeTgFFfJwkrWwx1EfCPkQe8gkPyLcyyF0zrquvl7mGidGxdx4sOcj7AuvUJrNnFKd+zDd9ubDZ
	aIsx2LbOShdhYBDhX9Iv/zsEBMhWkLnGf7MgtJDLfchiFn4IpHsg3iSnkmI9PocmnjJQAPng7zp
	vfUjcDTkv+B5ZYzo+J/P4heEV72Jp3oQyRvfXgXflY1DM1wjggdXebCVSiUk
X-Received: by 2002:a17:90b:224b:b0:39d:e75d:f33 with SMTP id 98e67ed59e1d1-39dec09a541mr11810753a91.19.1789456618104;
        Tue, 15 Sep 2026 00:16:58 -0700 (PDT)
X-Received: by 2002:a17:90b:224b:b0:39d:e75d:f33 with SMTP id 98e67ed59e1d1-39dec09a541mr11810682a91.19.1789456617515;
        Tue, 15 Sep 2026 00:16:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:16:57 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:31 -0400
Subject: [PATCH v7 05/11] riscv: dts: spacemit: k3: Add Zic64b ISA
 extension
MIME-Version: 1.0
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-5-aa35ebd9ae96@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6899;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=eLTEdh5CFvwbPjheikZKqnmvnX76F42E2jbZEEV3dzQ=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVH7bcmypqkGf20YnN82XfLzHzWXatfrZ3c/4/mbBK7
 bfwhsKmjlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZjIq8kM/4xcN083UvR7p3P5
 35s7b14WS7no33dp35ez4dLNLnnl63EM/yytdwRN0bh8Kd42Kb7oQUhK4A6Ov3fjOpmrGL633XH
 pYwUA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfXwyBhz9Bpr6cQ
 ILVfpqfIKbMREp24thDI8VZxGqITbHzb1ia/SDUZGafaXAowfHxS/K52LOq2uJviN4i/mOXdgnC
 taaaKRHHGmbBASK7wZpjc774Go+kuMviQgVAyajLKTx5wNN4zlp50Zu+Cfu1v6hPTVfTYmLquR+
 GurPhYOWIgurYmKWPywX9HDqFVsEw/f9EqWkQ6fZXpmYDpjKDrhFmdolc7Agno1FUZ3PWLoKHbB
 RSXHMRnl5lHD//AxgsVP8ZiHUoKLTpyUhBK/DAhWpNkIurA2NROaPa+IS/RhzJ4AdTeMQ3jF/oe
 eRxQO3EjnRoj55FqWCe8kCIvaRhtjCfdDQGvMm1ymmlQSj++PHJPJ3/Wg6UTYibtuiKs9pe7Nxb
 1qotT/VQoS0dM9nGmj3sayNQWiwX22OrRX31d5qsJgFhQqtxKQ9dWl/VSsVMS0Y6iCfsTp5i5At
 sGIh+WPNYQ6fvTVvzmw==
X-Proofpoint-GUID: viRvxEsxiS8fSPtvYrY5LW_-wXKcMUMI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX5voWdudii7Er
 4PwDvjluBWGzQtQfH0ncLBYDLQC8kBtw7GL6EKsUMnoq+sxKJRJ72+7MteWfva37PhlnnOwCVIX
 FPScrEBMJJ5MMiRUnITMknPFJEPSod0=
X-Authority-Analysis: v=2.4 cv=fck4WEQF c=1 sm=1 tr=0 ts=6aa8f0eb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UGsqu9ZSYe-JSgDVrOUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: viRvxEsxiS8fSPtvYrY5LW_-wXKcMUMI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_001700_724828_93EDB508 
X-CRM114-Status: GOOD (  11.17  )
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
v7: No change.
v6: No change.
v5: Collected Reviewed-by from Yixun Lan.
v4: No change.
v3: New patch.
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 48 ++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index c3f2dce0969c..799f0f00288c 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -38,9 +38,9 @@ cpu_0: cpu@0 {
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
@@ -79,9 +79,9 @@ cpu_1: cpu@1 {
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
@@ -120,9 +120,9 @@ cpu_2: cpu@2 {
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
@@ -161,9 +161,9 @@ cpu_3: cpu@3 {
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
@@ -202,9 +202,9 @@ cpu_4: cpu@4 {
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
@@ -243,9 +243,9 @@ cpu_5: cpu@5 {
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
@@ -284,9 +284,9 @@ cpu_6: cpu@6 {
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
@@ -325,9 +325,9 @@ cpu_7: cpu@7 {
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
