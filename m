Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B38C2BA1A
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 22:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U24AlziNoXQCB6MBkbq2GcnpkfsXdP+zRZ6AIJXXO4w=; b=m9YEi7Pfq7jJTk
	89k8ww6jqqItHWMaEaRcnnk4LPVYR4yyuc1BoNApNtNghsyeDEWNIUttGP41XaD+sRz7P0+xQme32
	0KAtVmiq81LMJjlrDOb3gcbeWT4BtRFvmqvwdR1RmSiUnCTL1zXHiTkyJede0kcB+hCLeHLfO1Ime
	O9mEmFQdmkSse0sm3sjdPEVGMjKffWS+Pd4zJ+3kWlxnSVP7zurKrhvwo+6nyeFeBGHR5Rs7/Wmsv
	9/j37Xx15vyn+fqD9zskaJoHY3+k/4h5YJjC8/2zwq1na+e8RwtYk7IIHOwPsGrgEvWxG5zDqE2U4
	LKPtNYc8kOAEnbx6U1iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJhaE-0000000Go4P-34Pw;
	Tue, 18 Jun 2024 22:45:46 +0000
Received: from mail-mw2nam12olkn20810.outbound.protection.outlook.com ([2a01:111:f403:2805::810] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJhaB-0000000Go2N-2E8Q
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 22:45:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khprN3lFd3Zxj+x1wlofHUhHLcmsfIwhqC4BYXneXOhO4EmaYdeKLi0OYbtHWXzO3GaGiBoAnZ1RMpUguYOi6e16H1Qwc1AiU957YV43hhfeddQ6vtoCk+TkIM/NFtAFqI12iDtfXQDMoaTpNmSN5sR2jUOBUZFc67Da/OjWoyyNQ3dG1Vjmz+VMaQG9xsEZEdovudQcuEwCBmXgBwFNaGBnJjwJWh2B1TaJKmiiTQVMXfQeknDSuzIfnNSpWX488UTYorBgKreMZYueFKJbwC/oKQdzA7smKCiWgsqwNvRejFGg0lXu77dwW8aDk1fEse5Ke+IgX5w9xFMKmOPuzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ii/q9LuHGDLjgryoHF03gTIJ7Haq4xyDCL+1qIfRKkI=;
 b=BeF1pJV6G0iaWFdMAzRJ30FXhv8e9K4rqeMSekYZ5g0eP/z1tVBBy6YnABS8S2NKo9Qw5Z8SM9WpS57A97xw1jdZ+kBsSneJ9P0B9CwQFp4X5+hkIiarBNgZQem4/JX1z1HnpAhWSpMxLwzyf5597jvZypwssjpBCbhmNCRoob1VgHTuZlMujobITDp6eqKlPW+MeLMpXAwDaopxyap7+j1+nW6R2s/bPsxzjLk9I0UxEQxrgjwlaebvJ2p53pOf4D4QI7MUDXz6URK83Rb0CRN2OOeGm20fTE+ijQ424Bgefw79kGpi81s+K3UvJPgpmodg7APyXxZH0rwxEQX2EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ii/q9LuHGDLjgryoHF03gTIJ7Haq4xyDCL+1qIfRKkI=;
 b=DGi7bul527aGY2wwzQW8fHeK6s+YYzybfKAlFgm8Fo98UFH2vWo8eayKft2sGoH+90rd5mdU6uxu/7E7sNXv2oClPGXlAYd3JIKwo5XeOJuugeLh5Hv1llOuEefl+WY3N88sRPgCItNenrHWIjZCfJApR6PSny0GYSMSyNSJ5PEM4YefzcXJVahkS1ggEQhk8+N3Ezc6dQ8nh7jczUzMnAhMgEy13IOFDfN3h3G4JzQnqnz/mivGi2HuQdwsaiJ+9SsTMdcVLjgcGxbgiu92wapiVQZpsusG8oflUycFhJanDsbt3CybkKS928vQojX15KODvjrjwedkkUwOGOiPEQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SA1PR20MB4394.namprd20.prod.outlook.com (2603:10b6:806:22a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 22:45:33 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%6]) with mapi id 15.20.7698.017; Tue, 18 Jun 2024
 22:45:32 +0000
Date: Wed, 19 Jun 2024 06:45:16 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Yuntao Dai <d1581209858@live.com>, jassisinghbrar@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	unicorn_wang@outlook.com, inochiama@outlook.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: mailbox: add Sophgo cv18x SoCs mailbox
Message-ID: <IA1PR20MB4953CE25C805EB66EFFDC36DBBCE2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <SYBP282MB2238DE0DA19C6EF411B2356CC4CE2@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
 <SYBP282MB22389FD1E07BBDC6FE1D90A0C4CE2@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
Content-Disposition: inline
In-Reply-To: <SYBP282MB22389FD1E07BBDC6FE1D90A0C4CE2@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
X-TMN: [nI8tfW0HyD3MLek8dSfcPHoIqWHxOodhJq0HuA2nTf8=]
X-ClientProxiedBy: SG2PR02CA0112.apcprd02.prod.outlook.com
 (2603:1096:4:92::28) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <c7u3cviibnvkuoklzecw4f5ksojeumy2wtasc2j5fmvhmt7s4t@gtkqj3slm7a2>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SA1PR20MB4394:EE_
X-MS-Office365-Filtering-Correlation-Id: a68ceefa-9300-4f52-17fd-08dc8fe85c71
X-MS-Exchange-SLBlob-MailProps: RlF2DIMZ1qWqSQaTqn7+1FJ7I9anhJr8hA5zuZwi1/uB23qX7c5WUISxkBaggbhDy83GBGsz+5JnsHU7wUin6yIdHfwr1AjmZebwMjktGiJi5fZ6dDD8DjxNm7/zW8DFgkRmvMDeZnHcveHyhSQS1OBCrW2ubXwz83FBmM0uNkXvCPVVHP7HuJFom8fQGJcBPcFvPUK/sn+B4+LQqVmRLhzqohF76znCTT6GZulOJLSI2VgImpmIBk5RTAj52XAYBH+5sZb/ef7oSuJ2vSfpzN80YmPpYc9/H64o5I7vTL7N4JhLwZDbS1JWIMRXurPArOURYbTZruJTqRvTk/IgKrubZ056vK6Ac9INPX+diuXCzFlLHh0V8wN97i6TqthsV6jGWd2V/L9HpxD7+M86W/w2iq6j3kO8ajxVdEa9pv2w0JMsCmwhrWaJB4vFsak2hOdO7J2o7AhbkP5CCwBaFRC3og1U1V2AX8mimXc0avmmAvGpsxCFpK2yRYVd3NEy1oBpvCUx9zM/C4icQIiN8VOicHZfZWuL0s8uniZj5PHutagPOIMhmrX4H3a7BCTDu2Bfn/Ec435zft1p/nupivqtYbD9GkeYutcESt2ApUjcWm/KoAZ5vMr+WMWYcyv4fp2yvoB7ChPaGy8JJs5bk0OGF3NNfvPGARpBx/cf6d5TGLlUnNf1N8LMYlxpcSA5zpaQr1ykPVpJvJYYezOAY+OKkZhyWXl71W0H4eacdr0424gI9wv4YTBwPAJwy6m8D294QCIuvWCkoV6w8uYUNk0jRA0b3vXj/atw6v1PVoNlkq0sxZRcZoCNCcaOtzUE5y/QHXJloeUdFQ81tDagWYRtyhw7HzdM
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199025|4302099010|3412199022|440099025|1602099009|1710799023;
X-Microsoft-Antispam-Message-Info: 1jRHTx8M6Hm+NbOrzM5nG4wm36AAp7ENN5mb1R+1OfZ1rubvvoO4RQJ4GU/BnDh8LMqzgepFcW207QyTCchS5drmfBOKbHWRXU9CZuc+jjTa+5dwyP/XU3AEVZO+AuXUNJxO8FXvyxwcXvE6aKV9X1vN2li8dWR5yKzIaM3RW5Ew9an1/qX/dgQ7aMiFEyrbNxtFRr9+EjZdMn5EIgIhdyEEtnzsqpz8eEsj2y21fIkd1vC8HqEgz7HVolfi7iPnQ1C6+ACqnqjPBFohph7qMd+SaRIq6AuLIbRhHUqAuIHIx3h4v+ySGJEO+MTPXOlAvNMTS4aGxXbXBY66Ehymn2hT36lywpfZ+oxW5QFaLSB/eA7Gg9pNoRqaQtPXJsz17qFRSSftSpvuEhngLPESHfkYvXTWCNocNaVpXZ1zBkQIR3sW8zCxf2Gelv9g5eeB8VQWjqqd17/u9+TckJsh0hZm1S0i6MH4pprYnf0HP62Xufd20BsMh3TInWyr6Lr6TNnaaNFv4A35KQCAUQgaiLLYftPnq/CLjtsejXiceElhH83Ewkx7Iykcsq46Uz88nSSmCR5GF1fdvV+F55JvqMdoUPinFHN/yM22QF5FaTmIyTplmr2HR7KnufCsf4JnGGj8vCJBxLk+kZGk/k+BJy99zxmVBKv2kAa08RQJ+lXGijXBp6x2UVAd4CUQ8Q1q7w6eMQ1XLnIgX++iFTKQ0yFv5CldHy9qfTMlVoc64u4=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eLw7ejHCh4702yjxCiAE6EZooE2CInoHBDkTzWOLtlDgySgfhIW8kgQvhv6O?=
 =?us-ascii?Q?CCBSr/DuNf49hEDrMd+tcJJsWqiMW43JwvfDnUGkKN9+/3hygkL1vH780GHw?=
 =?us-ascii?Q?OdEMDZFx6iHN99o4iEktJko3hcDTsX10P+/kOyBdoDd5l+g2cLTkzzXqzOqf?=
 =?us-ascii?Q?+zeno5CC6JEYHXtpQ3f94SJhsGqzXX88tf18pT6IuqEEzOP+7tjOoREugus8?=
 =?us-ascii?Q?7myW3lM4IudU44MXyOHEKDm1G4057iIrQqA4BTLzURD24GxrxR2aVbk+oQYI?=
 =?us-ascii?Q?V6Shm75g5PuHg9Ci06EZlcpTyXuUN4OoD+wXPOcwhjLus8BcDfUWFd5Banp/?=
 =?us-ascii?Q?RfZ581tU+Ykl0D5OTENQmbhFlup/t4glVn0NusMAuWIV2wD8P8KbZ6VfT7YY?=
 =?us-ascii?Q?Cu8BrzIaWm1VKAGaAdBVzZIV03nGF2l8YB9kRcC0tQJfUWU+1eNFl/TYVxCC?=
 =?us-ascii?Q?Aswp8oGMgWMYOWWjYm+ID/Jn1F/osGf7bLy4QFGqlcY75LFb4bm8BRDTMp68?=
 =?us-ascii?Q?xpwwN46sm0KppxfKhiUuafNpyx0o29L0NeTaPCTAWMxqbctnKTMLzhkRgeX0?=
 =?us-ascii?Q?nWvDZuKI08dqh2GTwY8WNtc2KU7KJx69SW5uE/ipCJvqBlIV+rrfFs0Qi4/x?=
 =?us-ascii?Q?ECx3keCBUL3VVrNohblcBg3mhNQ/P5QCAsHeI+Tja0JrRqF/rsn9bBDtRkLk?=
 =?us-ascii?Q?XVBMIq8yzM6zzhn/f69lYBG64f2Nk0yGqM3ZSy62EYUQTYHYadO2mTzEI3j9?=
 =?us-ascii?Q?2pC/2whaNSq1xMP1ngPEV3Xq+kLJg6NON+/9F0rY5wunjhDPKYiw4accSFlf?=
 =?us-ascii?Q?ww9+qjoy/5MPQSO3cxzIJth5s/HBtHngdqk1soVVFt10CuAx+HHpfRGq79ua?=
 =?us-ascii?Q?HV5E4Do0xd0uGPOqPi0+oy4U5BEsR3MoTpssi7oxoZ2fgiGSEnFujyCLgmne?=
 =?us-ascii?Q?1rsB/byVf3kV5veUpFWVDEiFI7dLLVaGEC0PRVtuHM0WmTgeSG9m3lL8Taoh?=
 =?us-ascii?Q?t3AFbhStfHqiRWdyyyeHMcGLOSUpySjXpOGZqY2BF8tDCAV24Ucef3R8HWAM?=
 =?us-ascii?Q?cQ7YK/L1yvauS2dP+EDIPj1tsMW3z7cHmTE4AgSsQwGiCIJ4/qkCiTCUKSOm?=
 =?us-ascii?Q?hvuhykYJQgoIEL9nraDQ+Bw7HiICsCdFsRvJdygn4Gic5j6lY6v8VBw1Vke4?=
 =?us-ascii?Q?YdDmMjIacUVji/yfbs5I8K7oY55sxW4xZ+xR09wk51EYGZFD45S7/mGiZDyf?=
 =?us-ascii?Q?BHUa1utZ6MxfMsLwYPzl?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a68ceefa-9300-4f52-17fd-08dc8fe85c71
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 22:45:32.8690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR20MB4394
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_154543_877586_ADFCBB77 
X-CRM114-Status: GOOD (  16.28  )
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

On Tue, Jun 18, 2024 at 11:12:33PM GMT, Yuntao Dai wrote:
> Add devicetree bindings documentation for Sophgo cv18x SoCs mailbox
> 
> Signed-off-by: Yuntao Dai <d1581209858@live.com>
> ---
>  .../mailbox/sophgo,cv1800b-mailbox.yaml       | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.yaml
> new file mode 100644
> index 000000000..e1868aaf2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/sophgo,cv1800b-mailbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo cv1800b mailbox controller
> +
> +maintainers:
> +  - Yuntao Dai <d1581209858@live.com>
> +
> +description:
> +  The Sophgo cv18x SoCs mailbox has 8 channels and 8 bytes per channel for
> +  different processors. Any processer can write data in a channel, and
> +  set co-responding register to raise interrupt to notice another processor,
> +  and it is allowed to send data to itself.
> +  Sophgo cv18x SoCs has 3 processors and numbered as
> +  <1> C906L
> +  <2> C906B
> +  <3> 8051

Are you sure the 8051 use the same mailbox layout?
IIRC, only the small core use this mailbox.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - sophgo,cv1800b-mailbox
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    const: mailbox
> +
> +  recvid:
> +    maxItems: 1
> +    description:
> +      This cell indicates the mailbox controller is running on which processor
> +
> +  sendto:
> +    maxItems: 1
> +    description:
> +      This cell indicates the message sends to which processor
> +
> +
> +  "#mbox-cells":
> +    const: 1
> +    description:
> +      This cell indicates which channel is used
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - recvid
> +  - sendto
> +  - "#mbox-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    mailbox: mailbox@1900000 {
> +        compatible = "sophgo,cv1800b-mailbox";
> +        reg = <0x01900000 0x1000>;
> +        interrupts = <101 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "mailbox";
> +        interrupt-parent = <&plic>;
> +        recvid = <1>;
> +        sendto = <2>;
> +        #mbox-cells = <1>;
> +    };
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
