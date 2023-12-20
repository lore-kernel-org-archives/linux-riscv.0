Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57713C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 13:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09QpjFyASFU5XgwhBYWKi8J2aono/LGUTCvvzo2ypvM=; b=yddMETzZCe6geLuHMwJDLK3fXI
	xlH5iqyX79/bsDfVSbnj41pjOazZ8+VWwxkKPPljnuU7zbEBECRSrxcQufFWy+eICGbuZIyMprxfr
	hm+Cfkv9ygkY/IJeBhQtPci2dbir6AbnqjmbXIymIXshxwixnJBFunBucTqtlBunczHw+bIT24ikA
	COoLlq/XBJt+VZcFkyLky6LVgavgX6hqdCZ/z3lJL6hEVUZrXEcOFdgR0iHXn3BPOVNoi420q5tMZ
	Uvb/4N+/0Ys21rkkatB4TEZ84vC2TRFRmGc6MxTANuffQsjCQRMdzkiFcY693m0iccOOaB0KCQZMl
	ZzhYLu+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFwyJ-00HZd4-1G;
	Wed, 20 Dec 2023 13:50:51 +0000
Received: from mail-bn8nam04on2061f.outbound.protection.outlook.com ([2a01:111:f400:7e8d::61f] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFwyG-00HZcW-0T
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 13:50:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aa78YqT0N3l3B8Et0D88xyxnoDnBOdbbaL5zL2Wgwmr4TzKsCfi3OseMyDJj99Ic3y6Uzuy8MwKsqhewPtoO5bOczmXvPMHssZYLaZ5kX+kBGPI76t1x1aYb9Kl2Ep80Mqtu+5Ct5oB8xSoOVMR3bsop1sXweFjB6qfh7PQUNGB0o/NexpErQ079Xg7EB2a0wZOyTpv9GC3RYous/QgY3SqibojxfFKrhE9mJnsg+KqtgvKbVouTTAyJBYjffvqaS9aEKYFKHvf0DXBk1wyw7bIdMbWS0sS4ip1Qenw1lbq9yR/RlnqWGqScKC4s6rgKJMXDkyFEBlGIDenSNDhxVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RgU78en2tu6hHaWMx9N9++V/Dj3wGdpbUBbJwCu9+jk=;
 b=Zqo2gqjFqgMN0Up4g5B7ZEmSK0nPcOuDzhPBYUHsAIecm47Swey+ukH2gY9hpgEp2EZCemPeHrr1a7I5tVAi5eTA96LRakaPwQGVC39t14H109FUcYstvXm69Y3DZei4A1MniDXLuZaobJAjeNzFChWuRr7m906DbPNfDl13K8Hwx6X8MxUcMbSRt5Co2lYwb3pgEqDW6cpSWS60nE7lfWrAhkSNTenypn0YxQCxSCyxBOQVlpvkCOd+SWBciq2rsMicIOwriAvtItuUyCLv9ZktE3PwVeR1/qvxyDYlMvRA0WQGxIP+QF8+O+NXqXVK/BIXdGE+mm30oUKBorg6YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RgU78en2tu6hHaWMx9N9++V/Dj3wGdpbUBbJwCu9+jk=;
 b=0Nx97b2EXwio8J6avwDvsG8GKCoQGGtRG5TWaJRN4X+zhLk3Nf1sj9ajr5F+XUq7v/ID6GEP7jYKGXIZGtdMV93LBZUNrgNmEabH8HijcowNcHov9hQ7nS9ZA9dA1xaPK/neCO3+YzRYeoXoDMtz6dx6dgKcNw/xuX2corrr9To=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4758.namprd12.prod.outlook.com (2603:10b6:a03:a5::28)
 by PH7PR12MB6857.namprd12.prod.outlook.com (2603:10b6:510:1af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Wed, 20 Dec
 2023 13:50:40 +0000
Received: from BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::39a2:42da:ea20:3349]) by BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::39a2:42da:ea20:3349%5]) with mapi id 15.20.7091.034; Wed, 20 Dec 2023
 13:50:39 +0000
Message-ID: <e9d531bf-a0f5-407d-9d73-97c966b89fd7@amd.com>
Date: Wed, 20 Dec 2023 14:50:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: riscv: cpus: Add AMD MicroBlaze V compatible
Content-Language: en-US
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com,
 git@xilinx.com, Conor Dooley <conor+dt@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
References: <d442d916204d26f82c1c3a924a4cdfb117960e1b.1699270661.git.michal.simek@amd.com>
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <d442d916204d26f82c1c3a924a4cdfb117960e1b.1699270661.git.michal.simek@amd.com>
X-ClientProxiedBy: VI1P195CA0036.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::25) To BYAPR12MB4758.namprd12.prod.outlook.com
 (2603:10b6:a03:a5::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4758:EE_|PH7PR12MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: 8143bdb7-e81a-413b-81ed-08dc0162a6b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m2Kp6M5WAaKwrFBI69BYh5965eVi73jnjeZYH69nTsexk/q5DitMT8SQojlcf7DsvR8jccJNQTCR3vBTHP45J8UNwQcgY+5eA87s0ALpIf5xPUM/55sniu3naZTJRK5xv2jpisfZKTVzCc3qam41ge4xZ0wkOnbpSx5QQ4M3sodVCWfTTJhwaj1b+be7UFgkOomSCRF/zlSCEWE8onfoOjQFBhCy7C0a83/N15BCTvkD1bnGX9inQFg9bBgloZIxHJsKEQA6KZSQeGm89/Ia92VvinSMAXuEJSlhsGBocBUvvVWcPGQYtHJ9sknYw8Y6NqFjf658ZPy3HsfsNB4U47WpBUNBQxFdxrdIprys8O/nFbriSewdv/OOBWNvIrrmWY0xLVanGPYQqQyA/2f6DH+Zj4xwqpsjxyZLXSRyMeOUBSiXTcOzXib38R+2AGYaQFQQB7iXKmkPgFPhtWbsD1Y4gx065tqwy+ti76kewgCELts05NM+qgs1ako6x+mSoY8mUmemTQw5Pbj0qStYb4I8BF/fL/Fevof3jXIWiUU/LN4XxEPlK/3RLUimFU4pc6lhQhjVahcnnjSILjCgWYEOD2DuGDErV+VhnAEoEpacI36/YPqZUH2hMGYouoHMNvHDLHWF89k+KNAbuOTUfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4758.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(366004)(376002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(6486002)(7416002)(478600001)(5660300002)(6506007)(2616005)(53546011)(36756003)(6512007)(26005)(4744005)(86362001)(31696002)(2906002)(6666004)(44832011)(66946007)(8676002)(4326008)(66556008)(41300700001)(66476007)(54906003)(8936002)(31686004)(316002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjVmTWh3RFQrWFhUalVuSnl6QUlndGQwanJLR0xDVC9TclA5TmQwR3JTMlcw?=
 =?utf-8?B?aXZqQWpLenMrZzZ3MFJxZi9NTXNwZXVCc2ZpT0hMeUxVclNCOEJUckxUWk41?=
 =?utf-8?B?OFlhSmNycnJ3M1dVd0U2YnNRRlk4b3JjblNrbmJ3WnhmSEEyb3JHVzN4N1ox?=
 =?utf-8?B?Y09RVWVVUmRLWUFlRVRnMWFtUzhyZ2d5b2hjZ1NFTXZKK0d0aDNzM1ZFd0l0?=
 =?utf-8?B?bzh5TDJ5NXNic0dWelEwR2dVTnE3QlFCVGxvV1ZzVlh5c3B1b0pMQjVlZWg3?=
 =?utf-8?B?WUJOcFRPSUNyd2lqT1ZhcTQwYTAva1RFcmx5cmFHcjRpbnpSVXdHa25lY3Bl?=
 =?utf-8?B?RE9pOWhzZ1RLV1c5T0ZyNGJxRjVUdnBOdm5YQ2w3cFJNUXZNS0FpN3UxTCtO?=
 =?utf-8?B?eDNlSEtHUFh4QkVLeUJ4NkFsckRwZmJBekhDWnBqd2hvTWNwL0xubTM1Z21L?=
 =?utf-8?B?Z3kzWjFWRmN1cmdJOXhNaGxKN1NNeFdpTVNGS0lKT1R0OHEyTzNKRG5UaVFz?=
 =?utf-8?B?VVVoemcrSzNwQ2E4NDZGbEFyOElpQUt0UVhEZDlCdmFZY3ExbFpOMkpKeWN3?=
 =?utf-8?B?Zkt5N2MvRUZUSVRtb2lZWmFZZkZBNmVNaVBDb2ZVVVZ5NVZ5dGNyeHNicXhD?=
 =?utf-8?B?OW9YQ29Kb1AxVE5GZGVsREE3VGFzUGE4SUZGMEVqU3dMeXpQcnVjcWk4cTZx?=
 =?utf-8?B?anQ2bzNhVTBKQUFkSkVJbXhYdEpOZkhDK0wwMm5KKzI0ZU4zZStYWG40SnUv?=
 =?utf-8?B?bk9DSW9FcFRIYmtMc2huN1Z6RjdlWmhpMGgxODNCNWtMRTdzMUxRMWlQT2k1?=
 =?utf-8?B?QXoxZmJQVXRhWWd6V3Q1ZU83RzlvY0tjdCtmMDgyWnViUGJNZTlQNzhLZy9F?=
 =?utf-8?B?T3p3cWhVcEFXamM0cXEvM0VSNnBkcSthbUNuTGhLOXZ5VFNSMndKMjNXQVBJ?=
 =?utf-8?B?K0tEYzhCcU40NHNNQ3p5TkRLM1VnR0kxekwzNGkvcXNZVExrNm80VjNKYXZC?=
 =?utf-8?B?aUZ3SlB2bGFscDd1bVJERjZsNUd4ZHJlU3pUSU04OG02aks0blZLSndWRHVB?=
 =?utf-8?B?MjkvUE5sWlJQT1hiVGEwM3ZkL3BUY0tNLytNTHNIbjc1bGhKbnBndVRCK1Vp?=
 =?utf-8?B?eXJ0eDAwVGNhNU9SR2RpSXJaV25QaWltOC9zaGZoaUtnNW5tS2R5Q1hiOE5i?=
 =?utf-8?B?ZU4yVlJRblAxbkxBVDNZWmIyWWd1eFR0NG9yS3lQNXFyUzhENUNqNWlYRHZw?=
 =?utf-8?B?V0JHRjJVZmpJQlJrSzdDY3FiYkFwZExQa1YxSDQwODEreDlLbDhEcWxJQWs1?=
 =?utf-8?B?Tmg5ZUNpeTVDc3MzZllxdGZWUzZ5V3lzOFkrSU5OVVhCQUk1UmZML3g1czJY?=
 =?utf-8?B?YnZDSlA2V2ZXMVlJaUtrd3lzbVQzekJOaW9NazZzKyszQkdPdkhLMUFEUnlo?=
 =?utf-8?B?dVIvSE9CM2ZVcFIwdC95RnNsRjZHZ1Q2S2xIVXM5RVVPRHRpdlU5ODZXcHJ0?=
 =?utf-8?B?cnh3UlZZKzkyOW5mV00xTHZLbVQ0amJiQ0ZwVGp5NzgwLzF1NnJCL29XMXJv?=
 =?utf-8?B?MTVNU1ZzTGc2dUhDYXpxa3Z5bGlHVHlReThOSUJxZ2ZmanV6ZHZzQ0xtNWpT?=
 =?utf-8?B?Zm5TaGNDN2xTbk9LdjRLMm9tT0JBSTVsdzBRRVowcjY2OGhCKzdETm1ITU5J?=
 =?utf-8?B?TDlNYnZVbXFyWWljL3UzY2ExbHV6MWxKckhWWXNwRHZnTXFwNFlHTTB4VFhs?=
 =?utf-8?B?bFJ5d2RPMCs2TkhrTFNBMDZCSzg4V1VLR2tmN3IxR2VSZlJpN2pNSW93RWhW?=
 =?utf-8?B?Q1N1VVdtajFrZmI4cTUvSDlMRVBZMGgzdkZnL3dtWnZJaWYyTXhONmFOK2Mr?=
 =?utf-8?B?Y0FmZlJmZmZVMGFJSWNOZUI5ZjdXNEIrN01sZkdGcm8yc0NhMC95QitJOElj?=
 =?utf-8?B?dDIyRStSZ1loL0ZIK1psbXpjdVFNa1ZqWTU5WCtOK3RCLzNXM2ZqNE9CZ0NX?=
 =?utf-8?B?STZXaU0wYS96WjdqN3Jra0ZoNG1QQTN0OVdtOWJYK0FHODRhNDhjdG9FOHBB?=
 =?utf-8?B?cTM3d1VQcXVtKy9CQ204QXAxbVZCTnd1M1VHOFBWUTVBcU9yNlpLbmFnRkJo?=
 =?utf-8?Q?9RPWYc5PiHoQN0LmDAqNxmspW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8143bdb7-e81a-413b-81ed-08dc0162a6b3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4758.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 13:50:39.8383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nvj76ZHxgIElDTWSUk73KMdpqNKyJIB6clfifehMq0lHyEBGKd614Bowa4lJ6QsS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6857
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_055048_228529_21A6DD92 
X-CRM114-Status: GOOD (  11.21  )
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

Hi Conor,

On 11/6/23 12:37, Michal Simek wrote:
> MicroBlaze V is new AMD/Xilinx soft-core 32bit RISC-V processor IP.
> It is hardware compatible with classic MicroBlaze processor.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
>   Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index 97e8441eda1c..7b077af62b27 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -32,6 +32,7 @@ properties:
>       oneOf:
>         - items:
>             - enum:
> +              - amd,mbv32
>                 - andestech,ax45mp
>                 - canaan,k210
>                 - sifive,bullet0

Can you please queue this patch to your tree?

Thanks,
Michal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
