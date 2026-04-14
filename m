Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70E5F531EA
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 04:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PQ/C76zhgMPXhzqM7yoGCEwn/tFbewfPymcOhF6fS34=; b=jVb9uOyMWoW+Ev
	EG0CrilWE2NFaKfMAB+jH8q6m2yRjP6F8eRPpmJrxG/yoHQo/u9TrKfyzBX7ctp6Z1Q5TvZ9xaGJk
	7MztgDF3jcAV+yqr8GTN4xmX3rV0+uTcC4rieKrotKxFWWjwFYR4GODyruFY+ddSs+9dWSMz6PkTg
	+CM7J1yFHqdUdfOcolliQ7s1KSKBtvcFMd2ygp3XlOESUcaMBuZRunjmdGTMA/YeaKIm9THkeXylx
	qDijpGrV3OOBsIG77BukcuVb9KhlcX3FdBG8bmdSFrktO0xFIoBjUC2FsW25P5ouZaWpYS42ewBhI
	+XFEOnyHqjlSezTDGkKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCVBK-0000000Ggvk-3LfD;
	Tue, 14 Apr 2026 04:15:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCVBH-0000000GgvJ-3u4Z
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 04:15:21 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLEChs3426105
	for <linux-riscv@lists.infradead.org>; Tue, 14 Apr 2026 04:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a/woYn48HqzdPePM0rQiSSsluq0n6ehxvhfKt7aRHD4=; b=M5euSdxshyyMGMZh
	uIMkUwircBdJcbnqF+7nk6kkUBlTIDGabCoIWzI71CFSDbvXh/wODxVdA204LEWH
	FNepaEWPO43tXDzpb0fBuAyFivIRXnnmsiPuLKRuGiybvWulP9jHoNJzkszq2yIz
	Tjj8CPaKOoGiyHKEHvuAe5eCDweVZhHZ0sZ0FSgWddR+Yulza0TVQYLclf/wPagp
	dUNGFcbxpniJHILm+7Lh0uRIu6QLD/55RNkOYVXUbhZMxWVl5wBqV1n+DCsVglBr
	FLYHP5Ga+uTenOnPuIpZkON9r6EU7wOfd7ice6u43mvFW+52jcd2+ts5e9frf1bZ
	yjaLEw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87f8y84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 14 Apr 2026 04:15:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35da1c703d1so5840606a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 21:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776140118; x=1776744918; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a/woYn48HqzdPePM0rQiSSsluq0n6ehxvhfKt7aRHD4=;
        b=Hedzn+QCayTDt2iIHthEOXlhIHnK5V9f0vwU1Tr+3dTH1Tf5IupQ9RTcNHmgeBcm9E
         7dsKQ/hJgte6oJzhi2S/mWS1EeU/p2eO6drh8s56NrLVovEphFG2ds2kaBS1KzNBm4Vi
         uYFkhs/0MvnZTWfORvOaBI2ry4JaZw4Uz01dG3xwF+RK52ALDn3Fn5ZU73lsm2OY/prj
         eOTYVp7/WFpzywj6+8IdJoKQPg9OSNKdAFKMllRGxk9+HtjIxDDXyvN4vAjijC1pO6bO
         9I3Y6c9g6YvkgUcSLjwaY/vfIY9XGHQGMR5TV9rGZWKnup+L2cuRrqjwS68rGYzny/ei
         uiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776140118; x=1776744918;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/woYn48HqzdPePM0rQiSSsluq0n6ehxvhfKt7aRHD4=;
        b=DeWE4YUq0cS6GnqhBlBSeasImSBnO7oftumEFwf05Rp68mhXueLxYstQ+a2rjfNWAV
         NLwyhuIv8e5z+J2q1NJpqQ2SZWL41CKrSFbeu+E72bcTrTc8UTtzcozd0caw13NieSYu
         h39w6ExYooKiiEpCdwz4Y/531BzgB2tipef04IQO7PfEcETaAFsmPES/SLARaFiXGs42
         XPE4pbs2ej/L9wzSRW1GbQHF2gt6bzm+kLU1F4lO7flBb2vs4Waml0Z+pepze7ZvaqTd
         dE/9xGZgV/8167Uw7mPA34haskWBt4z7EatM6JjnZ7e/SODMYvFsApIXo1AyCRFcfm8w
         Kh2A==
X-Forwarded-Encrypted: i=1; AFNElJ8HdaaoOfb6reaA0l+WchdDiTroP+uSQ7PnpKtBcmmOIVvA4VjTevnJPeYQssko/Yyx+MentOZnLP8tdg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvLMSNaPYZHpV0UxnK55U1dpCvrKxb74oQOZoBL+VSNS2Bm4xD
	D0Y1exVPoOkWg0f1yPHrwXrGnoSq4cTx8e3V0dqSQ5NUcgefPgt/pU6Nzg9Wc426hQK5NhxjPIo
	XaJskkK6P2kRg5CZndHpRz5g7rz3GFQ+yhbWDjm1oog44mvTVR+4QFyzEUL7iDJqDkBGtppI=
X-Gm-Gg: AeBDiev7gM2xWJqe19goBVlq0qSdeIb4n7Qz9wWFeYhrPSnCV4VSlSEKeQbWjMBRKta
	AprXDxCR3WFF8g4tHUDMj330mPvtATYymQPlvmhIbXLQ7LjzHDXStVhTkqp7jxveJY3Up3TC+I5
	j6+8guZWf1sBvFjnLXaEbG929ag1FWp/0ezqHrCoqsA5hej7a1dssgHluGBwzmylKE2bCaYFMyt
	LZIIqfdlxSUIc8Op78dK2LKKVJ3IrVLFe71Fo0NBhHnOAy48PT7qhiBcwZYL3Riak3sVJ/jecR6
	WLvCU8zpVNXvRJVzS1+jAN0RYiQuemSd81aS6cQzT0PApo6ID8s0HLLmjh1mVpgGTnsj2LpDibb
	sH5OOOcXBcY9NZA0/TuQ9Tkn2NkcFNkqwwRUX1szSZSvqmfWZDMWkEQcqdUjj8P5l8lM2Zvbg59
	RPwyvLAkqjYg==
X-Received: by 2002:a17:90b:3e8a:b0:35d:a542:2dbf with SMTP id 98e67ed59e1d1-35e428320a8mr15517435a91.20.1776140117638;
        Mon, 13 Apr 2026 21:15:17 -0700 (PDT)
X-Received: by 2002:a17:90b:3e8a:b0:35d:a542:2dbf with SMTP id 98e67ed59e1d1-35e428320a8mr15517384a91.20.1776140116994;
        Mon, 13 Apr 2026 21:15:16 -0700 (PDT)
Received: from [10.133.33.35] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e5755ea3csm4411935a91.1.2026.04.13.21.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 21:15:16 -0700 (PDT)
Message-ID: <d7c5e64b-967c-46a0-875a-43bc592e1b69@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 12:15:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/12] Add Linux RISC-V trace support via CoreSight
To: Zane Leung <liangzhen@linux.spacemit.com>, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, palmer@dabbelt.com,
        pjw@kernel.org, gregkh@linuxfoundation.org,
        alexander.shishkin@linux.intel.com, irogers@google.com
Cc: coresight@lists.linaro.org, peterz@infradead.org, mingo@redhat.com,
        namhyung@kernel.org, mark.rutland@arm.com, jolsa@kernel.org,
        adrian.hunter@intel.com, kan.liang@linux.intel.com, mchitale@gmail.com,
        anup@brainfault.org, atish.patra@linux.dev,
        andrew.jones@oss.qualcomm.com, sunilvl@oss.qualcomm.com,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        anup.patel@oss.qualcomm.com, mayuresh.chitale@oss.qualcomm.com,
        zhuangqiubin@linux.spacemit.com
References: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDAzNiBTYWx0ZWRfXyjpiFzftPeGd
 Y4x1MWgUmnwrfQC8tWdkephsYOtyyhoHANrP7pRatz7fW7BlMzEnybO1K60PtetiG27t7cv6qsR
 tYgvujkAr/0yTopznzUTnOrIDjkYWzoUi2PQ1gcfEnK2cbP6T/Wn7v/pCMfrz+6A1bEKX+OtIUB
 7IgHG84A2GrXBrJoSVZYCLSW5/2P6l81pYmxM8I2bSItCI8V0P/IxvIBLAc6e9Gnvj6qloFwpJG
 1wdauBE8158jIEstGkl4J3DlsRXnSzJzO9CmVhQhfZ+lq3R/b71Whx66Tkz3xf94S0Sl0psBBaF
 j8b7yhOqlDfMGxweemCgaHsMxXxuaSaZmsvy7KVgh5pD8AFpd2Ymgn6BlNOLLwVdGv6A3Nx0zRn
 NmiqVbDUttST9efC1xZwMHdzB+TVH9ulq0RFUACewOu4fkuoVMW0WoO/UxwWqvWm4etOQ+eO2ol
 aGVl5Ul7J80MzLOAJIA==
X-Authority-Analysis: v=2.4 cv=DaYnbPtW c=1 sm=1 tr=0 ts=69ddbf56 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lv0vYI88AAAA:8 a=ug8Fspz1yd9VzR5AxhoA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-GUID: W-DzQWrbqvTm4qdays3wl7EQotV1nOFc
X-Proofpoint-ORIG-GUID: W-DzQWrbqvTm4qdays3wl7EQotV1nOFc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_211520_030493_3BEE6DD4 
X-CRM114-Status: GOOD (  15.75  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 4/14/2026 11:41 AM, Zane Leung wrote:
> From: liangzhen <zhen.liang@spacemit.com>
> 

I dont think you have looped relevant maintainers and reviewers for the 
Coresight subsystem.

Thanks,
Jie

> This series adds Linux RISC-V trace support via CoreSight, implementing RISC-V
> trace drivers within the CoreSight framework and integrating them with perf tools.
> The K3 SoC contains RISC-V Encoder, Funnel, ATB, CoreSight Funnel, and CoreSight TMC
> components, which can be directly leveraged through the existing CoreSight infrastructure.
> 
> Linux RISC-V trace support form Anup Patel:
> (https://patchwork.kernel.org/project/linux-riscv/cover/20260225062448.4027948-1-anup.patel@oss.qualcomm.com/)
> which currently lacks ATB component support and guidance on reusing CoreSight components.
> 
> The series includes:
> - RISC-V trace driver implementation within the CoreSight framework
> - RISC-V Trace Encoder, Funnel, and ATB Bridge drivers as CoreSight devices
> - RISC-V trace PMU record capabilities and parsing events in perf.
> - RISC-V Nexus Trace decoder for perf tools
> 
> Any comments or suggestions are welcome.
> 
> Verification on K3 SoC:
> To verify this patch series on K3 hardware, the following device tree are required:
> 1. RISC-V Trace Encoder node (8)
> 2. RISC-V ATB Bridge node (8)
> 3. RISC-V Trace Funnel node (2)
> 3. CoreSight Funnel configuration for RISC-V (1)
> 4. CoreSight TMC configuration for trace buffer (1)
> 
> /{
>          dummy_clk: apb-pclk {
>                  compatible = "fixed-clock";
>                  #clock-cells = <0x0>;
>                  clock-output-names = "clk14mhz";
>                  clock-frequency = <14000000>;
>          };
> 
> 
>          soc: soc {
>                  #address-cells = <2>;
>                  #size-cells = <2>;
> 
>                  encoder0: encoder@d9002000 {
>                          compatible = "riscv,trace-encoder";
>                          reg = <0x0 0xd9002000 0x0 0x1000>;
>                          cpus = <&cpu_0>;
>                          out-ports {
>                                  port {
>                                          cluster0_encoder0_out_port: endpoint {
>                                                  remote-endpoint = <&cluster0_bridge0_in_port>;
>                                          };
>                                  };
>                          };
>                  };
> 
>                  bridge0: bridge@d9003000 {
>                          compatible = "riscv,trace-atbbridge";
>                          reg = <0x0 0xd9003000 0x0 0x1000>;
>                          cpus = <&cpu_0>;
>                          out-ports {
>                                  port {
>                                          cluster0_bridge0_out_port: endpoint {
>                                                  remote-endpoint = <&cluster0_funnel_in_port0>;
>                                          };
>                                  };
>                          };
>                          in-ports {
>                                  port {
>                                          cluster0_bridge0_in_port: endpoint {
>                                                  remote-endpoint = <&cluster0_encoder0_out_port>;
>                                          };
>                                  };
>                          };
>                  };
> 
> ...
> 
>                  cluster0_funnel: funnel@d9000000 {
>                          compatible = "riscv,trace-funnel";
>                          reg = <0x0 0xd9000000 0x0 0x1000>;
>                          cpus = <&cpu_0>, <&cpu_1>, <&cpu_2>, <&cpu_3>;
>                          riscv,timestamp-present;
>                          out-ports {
>                                  port {
>                                          cluster0_funnel_out_port: endpoint {
>                                                  remote-endpoint = <&main_funnel_in_port0>;
>                                          };
>                                  };
>                          };
>                          in-ports {
>                                  #address-cells = <1>;
>                                  #size-cells = <0>;
> 
>                                  port@0 {
>                                          reg = <0>;
>                                          cluster0_funnel_in_port0: endpoint {
>                                                  remote-endpoint = <&cluster0_bridge0_out_port>;
>                                          };
>                                  };
> 
>                                  port@1 {
>                                          reg = <1>;
>                                          cluster0_funnel_in_port1: endpoint {
>                                                  remote-endpoint = <&cluster0_bridge1_out_port>;
>                                          };
>                                  };
> 
>                                  port@2 {
>                                          reg = <2>;
>                                          cluster0_funnel_in_port2: endpoint {
>                                                  remote-endpoint = <&cluster0_bridge2_out_port>;
>                                          };
>                                  };
> 
>                                  port@3 {
>                                          reg = <3>;
>                                          cluster0_funnel_in_port3: endpoint {
>                                                  remote-endpoint = <&cluster0_bridge3_out_port>;
>                                          };
>                                  };
>                          };
>                  };
> 
>                  cluster1_funnel: funnel@d9010000 {
>                          compatible = "riscv,trace-funnel";
>                          reg = <0x0 0xd9010000 0x0 0x1000>;
>                          cpus = <&cpu_4>, <&cpu_5>, <&cpu_6>, <&cpu_7>;
>                          riscv,timestamp-present;
>                          out-ports {
>                                  port {
>                                          cluster1_funnel_out_port: endpoint {
>                                                  remote-endpoint = <&main_funnel_in_port1>;
>                                          };
>                                  };
>                          };
>                          in-ports {
>                                  #address-cells = <1>;
>                                  #size-cells = <0>;
> 
>                                  port@0 {
>                                          reg = <0>;
>                                          cluster1_funnel_in_port0: endpoint {
>                                                  remote-endpoint = <&cluster1_bridge0_out_port>;
>                                          };
>                                  };
> 
>                                  port@1 {
>                                          reg = <1>;
>                                          cluster1_funnel_in_port1: endpoint {
>                                                  remote-endpoint = <&cluster1_bridge1_out_port>;
>                                          };
>                                  };
> 
>                                  port@2 {
>                                          reg = <2>;
>                                          cluster1_funnel_in_port2: endpoint {
>                                                  remote-endpoint = <&cluster1_bridge2_out_port>;
>                                          };
>                                  };
> 
>                                  port@3 {
>                                          reg = <3>;
>                                          cluster1_funnel_in_port3: endpoint {
>                                                  remote-endpoint = <&cluster1_bridge3_out_port>;
>                                          };
>                                  };
>                          };
>                  };
> 
>                  main_funnel: funnel@d9042000 {
>                          compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>                          reg = <0x0 0xd9042000 0x0 0x1000>;
>                          clocks = <&dummy_clk>;
>                          clock-names = "apb_pclk";
>                          out-ports {
>                                  port {
>                                          main_funnel_out_port: endpoint {
>                                                  remote-endpoint = <&etf_in_port>;
>                                          };
>                                  };
>                          };
>                          in-ports {
>                                  #address-cells = <1>;
>                                  #size-cells = <0>;
> 
>                                  port@0 {
>                                          reg = <0>;
>                                          main_funnel_in_port0: endpoint {
>                                                  remote-endpoint = <&cluster0_funnel_out_port>;
>                                          };
>                                  };
> 
>                                  port@1 {
>                                          reg = <1>;
>                                          main_funnel_in_port1: endpoint {
>                                                  remote-endpoint = <&cluster1_funnel_out_port>;
>                                          };
>                                  };
>                          };
>                  };
> 
>                  etf: etf@d9043000 {
>                          compatible = "arm,coresight-tmc", "arm,primecell";
>                          reg = <0x0 0xd9043000 0x0 0x1000>;
>                          clocks = <&dummy_clk>;
>                          clock-names = "apb_pclk";
>                          out-ports {
>                                  port {
>                                          etf_out_port: endpoint {
>                                                  remote-endpoint = <&etr_in_port>;
>                                          };
>                                  };
>                          };
>                          in-ports {
>                                  port {
>                                          etf_in_port: endpoint {
>                                                  remote-endpoint = <&main_funnel_out_port>;
>                                          };
>                                  };
>                          };
>                  };
> 
>                  etr: etr@d9044000 {
>                          compatible = "arm,coresight-tmc", "arm,primecell";
>                          reg = <0x0 0xd9044000 0x0 0x1000>;
>                          clocks = <&dummy_clk>;
>                          clock-names = "apb_pclk";
>                          arm,scatter-gather;
>                          in-ports {
>                                  port {
>                                          etr_in_port: endpoint {
>                                                  remote-endpoint = <&etf_out_port>;
>                                          };
>                                  };
>                          };
>                  };
>          };
> };
> 
> Verification case:
> 
> ~ # perf list pmu
>    rvtrace//                                          [Kernel PMU event]
> 
> ~ # perf record -e rvtrace/@tmc_etr0/ --per-thread uname
> Linux
> [ perf record: Woken up 1 times to write data ]
> [ perf record: Captured and wrote 0.191 MB perf.data ]
> ~ # perf script
>             uname     137 [003]          1           branches:  ffffffff80931470 rvtrace_poll_bit+0x38 ([kernel.kallsyms]) => ffffffff80931492 rvtrace_poll_bit+0x5a ([kernel.kallsyms])
>             uname     137 [003]          1           branches:  ffffffff809328a6 encoder_enable_hw+0x252 ([kernel.kallsyms]) => ffffffff809328ba encoder_enable_hw+0x266 ([kernel.kallsyms])
>             uname     137 [003]          1           branches:  ffffffff80932c4a encoder_enable+0x82 ([kernel.kallsyms]) => ffffffff80932c36 encoder_enable+0x6e ([kernel.kallsyms])
>             uname     137 [003]          1           branches:  ffffffff80928198 etm_event_start+0xf0 ([kernel.kallsyms]) => ffffffff809281aa etm_event_start+0x102 ([kernel.kallsyms])
>             uname     137 [003]          1           branches:  ffffffff809281e6 etm_event_start+0x13e ([kernel.kallsyms]) => ffffffff8092755e coresight_get_sink_id+0x16 ([kernel.kallsyms])
>             uname     137 [003]          1           branches:  ffffffff8092820e etm_event_start+0x166 ([kernel.kallsyms]) => ffffffff80928226 etm_event_start+0x17e ([kernel.kallsyms])
>             uname     137 [003]          1           branches:  ffffffff801c3bb4 perf_report_aux_output_id+0x0 ([kernel.kallsyms]) => ffffffff801c3bd6 perf_report_aux_output_id+0x22 ([kernel.kallsyms])
>             uname     137 [003]          1           branches:  ffffffff801c3c5a perf_report_aux_output_id+0xa6 ([kernel.kallsyms]) => ffffffff801c3bf0 perf_report_aux_output_id+0x3c ([kernel.kallsyms])
>             uname     137 [003]          1           branches:  ffffffff801c3c40 perf_report_aux_output_id+0x8c ([kernel.kallsyms]) => ffffffff801c3aea __perf_event_header__init_id+0x2a ([kernel.kallsyms])
>             uname     137 [003]          1           branches:  ffffffff801c3b42 __perf_event_header__init_id+0x82 ([kernel.kallsyms]) => ffffffff801c3b4a __perf_event_header__init_id+0x8a ([kernel.kallsyms])
>             uname     137 [003]          1           branches:  ffffffff801c3bb0 __perf_event_header__init_id+0xf0 ([kernel.kallsyms]) => ffffffff801c3b58 __perf_event_header__init_id+0x98 ([kernel.kallsyms])
>             uname     137 [003]          1           branches:  ffffffff8004c658 __task_pid_nr_ns+0x0 ([kernel.kallsyms]) => ffffffff8004c696 __task_pid_nr_ns+0x3e ([kernel.kallsyms])
>             uname     137 [003]          1           branches:  ffffffff8004c71e __task_pid_nr_ns+0xc6 ([kernel.kallsyms]) => ffffffff8004c6a4 __task_pid_nr_ns+0x4c ([kernel.kallsyms])
>             uname     137 [003]          1           branches:  ffffffff8004c6e4 __task_pid_nr_ns+0x8c ([kernel.kallsyms]) => ffffffff8004c6e4 __task_pid_nr_ns+0x8c ([kernel.kallsyms])
> ...
> 
> liangzhen (12):
>    coresight: Add RISC-V support to CoreSight tracing
>    coresight: Initial implementation of RISC-V trace driver
>    coresight: Add RISC-V Trace Encoder driver
>    coresight: Add RISC-V Trace Funnel driver
>    coresight: Add RISC-V Trace ATB Bridge driver
>    coresight rvtrace: Add timestamp component support for encoder and
>      funnel
>    coresight: Add RISC-V PMU name support
>    perf tools: riscv: making rvtrace PMU listable
>    perf tools: Add RISC-V trace PMU record capabilities
>    perf tools: Add Nexus RISC-V Trace decoder
>    perf symbols: Add RISC-V PLT entry sizes
>    perf tools: Integrate RISC-V trace decoder into auxtrace
> 
>   drivers/hwtracing/Kconfig                     |    2 +
>   drivers/hwtracing/coresight/Kconfig           |   46 +-
>   drivers/hwtracing/coresight/Makefile          |    6 +
>   drivers/hwtracing/coresight/coresight-core.c  |    8 +
>   .../hwtracing/coresight/coresight-etm-perf.c  |    1 -
>   .../hwtracing/coresight/coresight-etm-perf.h  |   21 +
>   .../hwtracing/coresight/coresight-platform.c  |    1 -
>   .../hwtracing/coresight/coresight-tmc-etf.c   |    4 +
>   .../hwtracing/coresight/coresight-tmc-etr.c   |    4 +
>   .../hwtracing/coresight/rvtrace-atbbridge.c   |  239 +++
>   drivers/hwtracing/coresight/rvtrace-core.c    |  135 ++
>   .../coresight/rvtrace-encoder-core.c          |  562 +++++++
>   .../coresight/rvtrace-encoder-sysfs.c         |  363 +++++
>   drivers/hwtracing/coresight/rvtrace-encoder.h |  151 ++
>   drivers/hwtracing/coresight/rvtrace-funnel.c  |  337 ++++
>   drivers/hwtracing/coresight/rvtrace-funnel.h  |   39 +
>   .../hwtracing/coresight/rvtrace-timestamp.c   |  278 ++++
>   .../hwtracing/coresight/rvtrace-timestamp.h   |   64 +
>   include/linux/coresight-pmu.h                 |    4 +
>   include/linux/rvtrace.h                       |  116 ++
>   tools/arch/riscv/include/asm/insn.h           |  645 ++++++++
>   tools/perf/arch/riscv/util/Build              |    2 +
>   tools/perf/arch/riscv/util/auxtrace.c         |  490 ++++++
>   tools/perf/arch/riscv/util/pmu.c              |   20 +
>   tools/perf/util/Build                         |    3 +
>   tools/perf/util/auxtrace.c                    |    4 +
>   tools/perf/util/auxtrace.h                    |    1 +
>   tools/perf/util/nexus-rv-decoder/Build        |    1 +
>   .../util/nexus-rv-decoder/nexus-rv-decoder.c  | 1364 +++++++++++++++++
>   .../util/nexus-rv-decoder/nexus-rv-decoder.h  |  139 ++
>   .../perf/util/nexus-rv-decoder/nexus-rv-msg.h |  190 +++
>   tools/perf/util/rvtrace-decoder.c             | 1039 +++++++++++++
>   tools/perf/util/rvtrace.h                     |   40 +
>   tools/perf/util/symbol-elf.c                  |    4 +
>   34 files changed, 6320 insertions(+), 3 deletions(-)
>   create mode 100644 drivers/hwtracing/coresight/rvtrace-atbbridge.c
>   create mode 100644 drivers/hwtracing/coresight/rvtrace-core.c
>   create mode 100644 drivers/hwtracing/coresight/rvtrace-encoder-core.c
>   create mode 100644 drivers/hwtracing/coresight/rvtrace-encoder-sysfs.c
>   create mode 100644 drivers/hwtracing/coresight/rvtrace-encoder.h
>   create mode 100644 drivers/hwtracing/coresight/rvtrace-funnel.c
>   create mode 100644 drivers/hwtracing/coresight/rvtrace-funnel.h
>   create mode 100644 drivers/hwtracing/coresight/rvtrace-timestamp.c
>   create mode 100644 drivers/hwtracing/coresight/rvtrace-timestamp.h
>   create mode 100644 include/linux/rvtrace.h
>   create mode 100644 tools/arch/riscv/include/asm/insn.h
>   create mode 100644 tools/perf/arch/riscv/util/auxtrace.c
>   create mode 100644 tools/perf/arch/riscv/util/pmu.c
>   create mode 100644 tools/perf/util/nexus-rv-decoder/Build
>   create mode 100644 tools/perf/util/nexus-rv-decoder/nexus-rv-decoder.c
>   create mode 100644 tools/perf/util/nexus-rv-decoder/nexus-rv-decoder.h
>   create mode 100644 tools/perf/util/nexus-rv-decoder/nexus-rv-msg.h
>   create mode 100644 tools/perf/util/rvtrace-decoder.c
>   create mode 100644 tools/perf/util/rvtrace.h
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
