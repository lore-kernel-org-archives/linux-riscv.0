Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40506CDB47E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 09:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f/6j6sM53vhNtzSuUBjdXxfmLu0RxgtIYOTfyJQHpQQ=; b=4Cq3/P6eEFmSHh
	ESxcYsi83anVFhTF/7UjjC/ktTzpjRcvJgJhBxsda4jsLjPRocRBfeSJODqrORtrRxXoQtfMGus9v
	mCj+O3DnNtNC4cVvAgS76b5JsOQnd1rpwYs9DCrPFWdrAcYg/EOsApBaWFaWGBEbyCEVGd8+9bdzt
	mWULnt8m9NJ9g1sRlUg5DEHXbXgHsgg38ITySX216tQJ3mez2GeJY1iNqjbz94+ssayC/NmdPIqMm
	i4TIMff8gwdvoO4GH/hptUyyXUSj3P9ZSBKy6ysFbR7cJQW+6JRUMwr9Epz970PJFKqVeqVaoW3kB
	2LPYUupPxpTsQ7O3VABA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrEpt-0030MF-0V;
	Fri, 13 Oct 2023 09:52:01 +0000
Received: from mail-mw2nam12olkn20822.outbound.protection.outlook.com ([2a01:111:f400:fe5a::822] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrEpp-0030LS-27
	for linux-riscv@lists.infradead.org;
	Fri, 13 Oct 2023 09:51:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+fUkkF8mPAaToH5yvZNsYlV+t4NaGCsun9wsvmKtxSe4YiUreBZt4SP+5QdHmGeSXvwBLTtiVUAbRARJn3FVlnU7AcvPryI8P/zi6nrQMuxVofoFrR54c3gnb5xOrnLv7q11FHGIEzvTYmetpwYmI+RtOBRy8GHMdfhcvJ7zwsqsCjtkBZWcurrSSFAn9oKK7oIBmfa7OnkuXbibCihHKOcXkfTqjWvJqxAvYm4BZmV5lzBRi43Z5R9RBmh4zwu0+tvkWw3Wh5MMpBYU9+qF/1RlDYMgFom4/zCgjlptp2Dr0gCgP9nT+FHc5du3WirNXMhyC8J9jzsikfVEmsgvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdUhtnFwQ5SAjimxKkgV4+fKDHq15nSkE2BizISvknI=;
 b=lkn1FLhX7eqZ7oqyKgG6UJbroNyhg/UfvWxRonKFUJNfht4QiQdyACjT/kgii4F0+CvwyuiinIprciDdwNpu1JLeKN6haLzx//lf8Ut3HJ4kX8R3I5v0JHZpXAljL4FaKiJJG15HWNH3+ovIu+DbhgFc219NElCmDASiCTZhznXrzroaGtrtFTYLcB+kUwRqvjG5gYjvYNAwcuId8qgkSC1BYjR+3ujWUiEmHApCndgSTd+c/6IG0pSvzLONetU3dr8pcvkyGL7jPoDITpRkb6NbZmoxZi5qWTwso/2xMAFL1zZxPZ41I5bRx1ylzRMzi7rbAADAtqMWl+tIPWopyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sdUhtnFwQ5SAjimxKkgV4+fKDHq15nSkE2BizISvknI=;
 b=S1bWmX35F5LUjMFGfzyAVJqE5cybJdMNY/FDQLOcHUYT36mDsXffRgKIyADr9TxxII2Hj1yEMb0aROw2a0n79QR+//GAgZ5op2vV81c8tPy6XkyVcL1GMdrL/Zu9vE92pK8SOZpuFglpzvq31n8mUlCgh64tyXPwPwkcHIoJt5UxtuSkZGSZTTwF5YoWygjqsdOeyT9EuxDgW3hn1fNiGL+hF1v0XTsHJ239XnHZsdmv41ZWUjl1IOtzTxAnCdyKujggIlsIxn1PMYpQPv7lbQjb+hszzacLAvqiKQ4HneyJ2oIpAah5V/mfkX/RbZGqnKc07Jp6A0YJ7sg/1jtj/g==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CO6PR20MB3681.namprd20.prod.outlook.com (2603:10b6:5:344::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Fri, 13 Oct
 2023 09:51:49 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263%5]) with mapi id 15.20.6863.046; Fri, 13 Oct 2023
 09:51:49 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Conor Dooley <conor+dt@kernel.org>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 6/7] riscv: dts: sophgo: Separate common devices from cv1800b soc
Date: Fri, 13 Oct 2023 17:52:03 +0800
Message-ID: <IA1PR20MB4953434E04427C0940C8DCF5BBD2A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231013-catchable-wince-f24060feb639@spud>
References: <20231013-catchable-wince-f24060feb639@spud>
X-TMN: [jmbAMZ5P/utnlsLSxNUi/rQ+zQ8EjqALq4ef7AcCN8o=]
X-ClientProxiedBy: TYCP286CA0145.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::9) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231013095204.153065-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CO6PR20MB3681:EE_
X-MS-Office365-Filtering-Correlation-Id: a7fd5791-c06d-4df0-1301-08dbcbd204bb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n0FNKMnyB22jP+iY8IZleiIaGmi2SP4ROGFB1rY222YkbxVn8kvETCgjBziEUJUI8wfGRdld0vTCO1gZeQwIWKqOHHLuqo/PWbkt7+GtyQmREC4JFxHCcduj8hFrOdoCjgU7FJGi7zNQsYUqSM0G4/mhVHyKtPLjiKoTO9R+ysuoLhBHryl5q9c/R9HSUJb1q6nhWDd9kXnmQWMkc6ubj/f13o0dsnKfIQvnxMNOBI/lLEeT0GSETRtSuJRIP5bAibvixOTcTJWCdLDS9/gzEpXq2BWl2BdIYkjzp7YLEIZX+xjIpg/etXfICK7xbcNsT5ChP7vP2jf97Kn76SRlrXR9rCd23FeI65Vng8RB26krpAWD25n6ix/pRuUadaAODKlQAaf2FwBLN4rZFEH4LNkgjSg2WWSI28upYnoHFYhEHFg9ga59sh9R4zRTzM1c9EoKbzaQjHCgPULCbiSDQcYES9lL9pEzO1q5Wbo1Iy6YvhT3FAuG2jPlVATLY4+AeCfeLM9REP/ZCJWjEeJa3ZI7wonsI/DmyJxwpzjF8RKNFDacRWzYDMHXZc7Kfi47/nKHdswGJ6432XuuKVN3M7piQ4la8Py5h4D0NpekrQlO9ygb0habUmIIlsYIS7O3
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8pZfrdqRm1v43ZFew9xoEZoZanVV0n4ASnHDTPIKjQi+z6u+6WAZDEEoys9M?=
 =?us-ascii?Q?XgAXt3o6TKmIn1rFqWYgJWt8Y3cqP48/ZBHGX2ZwHRjZy9BeAESbrDxtdMoc?=
 =?us-ascii?Q?lenO7hCZa5ueZl9ghElhIg4qzBc+3qesZX58W0x32YNMEm017Y7MgpBkyYbE?=
 =?us-ascii?Q?xiXIiGpBWH/gg900KSFVBiMSu4dMAC+JeY8ZQ7UbSpxsH3v/dEqtesqOjROe?=
 =?us-ascii?Q?keap4xRTS+pQL8DQexnlR66MZdHHPraRFEBpDZjwmIHIs0TtZ8rR6LLL74Nr?=
 =?us-ascii?Q?EGHNo+5ssEPx0kGPj5HzezwTKGHb6FqQOJVcoZMJw3VSClh/hgXP6EjP4Xg+?=
 =?us-ascii?Q?gDAtEwce0W0H6YnC0JBbJISm63pxr4pn1kcOEOF+jlSeZ0lRd12rZYfuWG2y?=
 =?us-ascii?Q?Etk8Gyzvb66sEkVFPqnKYSycEY+u1ScfuVH/e9C69ErZxVaa2Hsg/oI6EZFp?=
 =?us-ascii?Q?PI31H9TzpgVDzhMyb6k1K8owukKdtF8afCy5W4mtnhVsPNqxKov3mKkgCi6C?=
 =?us-ascii?Q?7yUDo2HovnrUnPQnHrxr45yypgXAsQc6dgEQHgPa9G63F27ue3Pj5e22xoGO?=
 =?us-ascii?Q?V3lXFYk/25UR3WcFQaRQDCLTJgMzfhmJ7G6o3S4tcmPGrOraW/LyNcT6R/Wc?=
 =?us-ascii?Q?ra75XE0JwpQOOWT5U5jBaNprSpl+Mwb45PAABVT6nY7qLGO9jeQHkzsN7jNe?=
 =?us-ascii?Q?ll39EiGbL63eZ3ST8uIR2ifIEX2sAM74CQqSciCJsnL8fDWevgAHGcHT6fp0?=
 =?us-ascii?Q?zn38HJq/wQsUHsEhzLXweibOwIDoYyXLyGm5pOOrr3W1o4nPitjQXMI6/NIh?=
 =?us-ascii?Q?GKk913yGL9J0P+1TuEI5i5sjRVKT1UyL1QHwkSvFb2KRnbTHiFJ5PUMocxNL?=
 =?us-ascii?Q?RijMHa2abN2JgNNaynxRZo4dPO7vXRuWHM5e8L4kZjDPoOiHWBhVeMw/YpNU?=
 =?us-ascii?Q?4R9/NbabSWA/q/3R637Yekj5y2+hyp/9N2Fm29wipIaEFEV9W2PIP8kcn9yI?=
 =?us-ascii?Q?k/SehXSWk7jHrqk7qQUCLajL3ZmH166ItAD1A/D3qb9mA2zzkcNGERRyFjbv?=
 =?us-ascii?Q?4tiXixLhAFzhFpqXALvLZMUXo428OhTRyQd0cL7bvsSRJWC7mHHkyYe3XgFp?=
 =?us-ascii?Q?LCnKMTX6bOH2UuUDyIYntYpu3dx9PcEtYNgPx2NY/0vyvXt3Lbv9i23wKj4R?=
 =?us-ascii?Q?sCoIah2NnLcizpkRrRdBZFdinYgNRW+0qz1XjZvwQw1x3XixD4S1F+V2dTk?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7fd5791-c06d-4df0-1301-08dbcbd204bb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 09:51:49.6664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR20MB3681
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_025157_705481_AF1725F7 
X-CRM114-Status: GOOD (  24.40  )
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

Sorry for the wrong title.

>Yo,
>
>On Mon, Oct 09, 2023 at 07:26:35PM +0800, Inochi Amaoto wrote:
>> Move the cpu and the common peripherals of CV181x and CV180x to new file.
>>
>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>> ---
>>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi       | 95 +------------------
>>  .../dts/sophgo/{cv1800b.dtsi => cv180x.dtsi}  | 19 +---
>>  2 files changed, 2 insertions(+), 112 deletions(-)
>>  copy arch/riscv/boot/dts/sophgo/{cv1800b.dtsi => cv180x.dtsi} (80%)
>>
>> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
>> index df40e87ee063..0904154f9829 100644
>> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
>> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
>> @@ -3,106 +3,13 @@
>>   * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
>>   */
>>
>> -#include <dt-bindings/interrupt-controller/irq.h>
>> +#include "cv180x.dtsi"
>>
>>  / {
>>  	compatible = "sophgo,cv1800b";
>> -	#address-cells = <1>;
>> -	#size-cells = <1>;
>> -
>> -	cpus: cpus {
>> -		#address-cells = <1>;
>> -		#size-cells = <0>;
>> -		timebase-frequency = <25000000>;
>> -
>> -		cpu0: cpu@0 {
>> -			compatible = "thead,c906", "riscv";
>> -			device_type = "cpu";
>> -			reg = <0>;
>> -			d-cache-block-size = <64>;
>> -			d-cache-sets = <512>;
>> -			d-cache-size = <65536>;
>> -			i-cache-block-size = <64>;
>> -			i-cache-sets = <128>;
>> -			i-cache-size = <32768>;
>> -			mmu-type = "riscv,sv39";
>> -			riscv,isa = "rv64imafdc";
>> -			riscv,isa-base = "rv64i";
>> -			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
>> -					       "zifencei", "zihpm";
>> -
>> -			cpu0_intc: interrupt-controller {
>> -				compatible = "riscv,cpu-intc";
>> -				interrupt-controller;
>> -				#address-cells = <0>;
>> -				#interrupt-cells = <1>;
>> -			};
>> -		};
>> -	};
>> -
>> -	osc: oscillator {
>> -		compatible = "fixed-clock";
>> -		clock-output-names = "osc_25m";
>> -		#clock-cells = <0>;
>> -	};
>>
>>  	soc {
>> -		compatible = "simple-bus";
>>  		interrupt-parent = <&plic>;
>> -		#address-cells = <1>;
>> -		#size-cells = <1>;
>> -		dma-noncoherent;
>> -		ranges;
>> -
>> -		uart0: serial@4140000 {
>> -			compatible = "snps,dw-apb-uart";
>> -			reg = <0x04140000 0x100>;
>> -			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
>> -			clocks = <&osc>;
>> -			reg-shift = <2>;
>> -			reg-io-width = <4>;
>> -			status = "disabled";
>> -		};
>> -
>> -		uart1: serial@4150000 {
>> -			compatible = "snps,dw-apb-uart";
>> -			reg = <0x04150000 0x100>;
>> -			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
>> -			clocks = <&osc>;
>> -			reg-shift = <2>;
>> -			reg-io-width = <4>;
>> -			status = "disabled";
>> -		};
>> -
>> -		uart2: serial@4160000 {
>> -			compatible = "snps,dw-apb-uart";
>> -			reg = <0x04160000 0x100>;
>> -			interrupts = <46 IRQ_TYPE_LEVEL_HIGH>;
>> -			clocks = <&osc>;
>> -			reg-shift = <2>;
>> -			reg-io-width = <4>;
>> -			status = "disabled";
>> -		};
>> -
>> -		uart3: serial@4170000 {
>> -			compatible = "snps,dw-apb-uart";
>> -			reg = <0x04170000 0x100>;
>> -			interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
>> -			clocks = <&osc>;
>> -			reg-shift = <2>;
>> -			reg-io-width = <4>;
>> -			status = "disabled";
>> -		};
>> -
>> -		uart4: serial@41c0000 {
>> -			compatible = "snps,dw-apb-uart";
>> -			reg = <0x041c0000 0x100>;
>> -			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
>> -			clocks = <&osc>;
>> -			reg-shift = <2>;
>> -			reg-io-width = <4>;
>> -			status = "disabled";
>> -		};
>>
>>  		plic: interrupt-controller@70000000 {
>>  			compatible = "sophgo,cv1800b-plic", "thead,c900-plic";
>> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
>> similarity index 80%
>> copy from arch/riscv/boot/dts/sophgo/cv1800b.dtsi
>> copy to arch/riscv/boot/dts/sophgo/cv180x.dtsi
>> index df40e87ee063..ffaf51724c98 100644
>
>Firstly, this form of diff really threw me, I was quite confused for a
>few minutes. A copy plus a pair of diffs doesn't really make much sense,
>when the operation being carried is an extraction of some nodes to a
>different file.
>

I was told to use -C/-M/-B to generate patch, and the git format-patch
give me this wired output if I use -C, using -M seems no change from v1.
The -B output is also disappointing. Maybe I need to generate agaion?

The v1 version:
https://lore.kernel.org/linux-riscv/IA1PR20MB495360B632D106BBB833D82ABBCFA@IA1PR20MB4953.namprd20.prod.outlook.com/

>> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
>> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
>> @@ -1,12 +1,12 @@
>>  // SPDX-License-Identifier: (GPL-2.0 OR MIT)
>>  /*
>>   * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
>> + * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
>
>Also, is moving around some bits of hw description really a
>copyrightable change?
>

It seems to be a mistake when I splitting the patch from v1.
This copyright should in the next patch.

>>   */
>>
>>  #include <dt-bindings/interrupt-controller/irq.h>
>>
>>  / {
>> -	compatible = "sophgo,cv1800b";
>>  	#address-cells = <1>;
>>  	#size-cells = <1>;
>>
>> @@ -48,7 +48,6 @@ osc: oscillator {
>>
>>  	soc {
>>  		compatible = "simple-bus";
>> -		interrupt-parent = <&plic>;
>>  		#address-cells = <1>;
>>  		#size-cells = <1>;
>>  		dma-noncoherent;
>> @@ -103,21 +102,5 @@ uart4: serial@41c0000 {
>>  			reg-io-width = <4>;
>>  			status = "disabled";
>>  		};
>> -
>> -		plic: interrupt-controller@70000000 {
>> -			compatible = "sophgo,cv1800b-plic", "thead,c900-plic";
>> -			reg = <0x70000000 0x4000000>;
>> -			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
>> -			interrupt-controller;
>> -			#address-cells = <0>;
>> -			#interrupt-cells = <2>;
>> -			riscv,ndev = <101>;
>> -		};
>> -
>> -		clint: timer@74000000 {
>> -			compatible = "sophgo,cv1800b-clint", "thead,c900-clint";
>> -			reg = <0x74000000 0x10000>;
>> -			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
>> -		};
>>  	};
>>  };
>
>What I wanted to comment on was this though - it seems that both the
>cv1800b and the cv1812h have identical plic and clint nodes, other than
>their compatibles? If that is the case, why create a cv1800b and a
>cv1812h specific file containing entirely new nodes, when overriding the
>compatible would be sufficient? Doubly so if the other SoCs in the
>cv18xx series are going to have identical layouts.
>
>I gave it a quick test locally with the below diff applied on top of
>this series - although I didn't make sure that I didn't re-order the
>plic & clint nodes, I just wanted to demonstrate what I had done.
>

Thanks for demonstration. AFAIK, what you said is true. the most devices
of CV180x and CV181x are the same, including plic and clint. The reason I
used a new one is to identify these two devices without making the
compatible string confusing.
Should I change the binding name of plic and clint to "sophgo,cv1800-xxx"
to mark there are the same series? I think this can avoid this confusing
dt nodes.

>Cheers,
>Conor.
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
