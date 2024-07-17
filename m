Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F246DC3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 05:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WPmdHKiBzRFNVLw0kv3/3d7iZ311jm2kL0S5Frv+n8Q=; b=K5vXf8ZQJhwcDe
	++gIt5oDxKRW1D1U7w+u3WlAuiRnHY4DPzJQoFpEzEMJWsWfA/JWcmHhzNIe8SS5i8x44cJC3gQhf
	Htj0ll84XE8gImhRapWdQChaBXAntPztdR6s/In9rOhZdChB3+jLhncX6Trx/TmbxAaH9nXzlQGzr
	ipmibeiCcJtljQ4AR0yv+6U+gqbJ7uNDukLVHWPSWr5a/6monHn6xW2PKY/jTVu7gyUkkzTqhnqym
	VC3U84N+xZbsFi5SsOk/ZRGpiwTz6Ek6aijPj2nVlgDOL2sjIsxQ8uR0VsDWUJlsf/OSwVYylDmxv
	wntnucS7LmuO28LbpUhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTxFw-0000000CiOd-1oM1;
	Wed, 17 Jul 2024 05:31:12 +0000
Received: from mail-eastasiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d401::] helo=HK2PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTxFs-0000000CiNw-36bt
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 05:31:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODwMn5p6beZ8s+M164C3FS5DbQmXYVTRiFGMNgBWpwPtAJUyaWkWlSDrmNmsg0ru9pKfxhhorVt/QerGPDm0wADr6S3rfxVqmPeO/HKYn5mRV/AnwLqjWQDhMtzixr9WPYUjengCVBihleo7PAiXzOs9nJwuUR8zOKkH3IKdbvbdXaZix6FcOMeDEPxNEHZPoJItI5Looa7Fh4PKpYVmi40Z3WG+vSRG5jY6cpFVxN9p6GKQe+HbdXmUg7eG1u9gKlkmi7isvO8IVEGeZlkdd7Rg9KlpoCWYCEpz3+nuu/FIn7EKSIwW8grlJqfiQourWR4R2e+D1GkVE1ixl5tIrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mQbfvDMzXKCrOCCAddXpt/BV5ngupcDJrK6rwENnuU=;
 b=u5rnQQhD2AzMcQGbiRtimCXEAllGDAZ1qru4WL82fVr2PIefokmt4udUlDKzDwqvgAWS7DgyGvhcdYVMW64cWvARZdwBuH2kHPtJZdULrSgqrDUFo9TOZdYginlt5Y0mwVplPFswKAY/2ydboFDnjUbFFMdyreFSYbyHwKaTzaHmjC+X5+vbAHwRsqk/feUHM66z225hGwOS73Fx4gCeE2lVLjd3pVg7zLWONAuubutcUrcjo8o98CL1lWiq7CFzzQ1CBuYLtcTF92dBrmMr+McuOdZTbQlvq825gG9yvZerETr44y1/4VXwOZvO5z3kuKaFKN5jNEQbtNmXwfF7iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mQbfvDMzXKCrOCCAddXpt/BV5ngupcDJrK6rwENnuU=;
 b=PtNDpQi1iaWPV9dqreLDzsEbWBpnllXmmIcfVzUEGw/noK+dX/qV31bSOt4/tlWRfdeDuBYLdsz560FX/s4xI4fzpJs/7+5XjfYYzt4uloRXIZt76xl/wP4ScD5is+aCJAWQB8RCjW07nJRb442rl/ee7zo1qb1vOLlQhMKCrcPOzvl3dXU6IXd+tFngjIFGRPXxQSo00/1wGw+iPjEpTeIbEKixMy2y2biL2+3GvPyKLKxMWo37jQV31m4GbGr4Mba++RHQ2FWn8vwlvHcoYGxHWiODDCPmsblQkjGTSf1psgk6dTmdEq0dDgqjBSDShEJA4VHcVIWg0Q0LJS0g3g==
Received: from SEYPR01MB4221.apcprd01.prod.exchangelabs.com
 (2603:1096:101:56::12) by TYZPR01MB4847.apcprd01.prod.exchangelabs.com
 (2603:1096:400:285::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 17 Jul
 2024 05:30:49 +0000
Received: from SEYPR01MB4221.apcprd01.prod.exchangelabs.com
 ([fe80::b674:8f70:6e29:3756]) by SEYPR01MB4221.apcprd01.prod.exchangelabs.com
 ([fe80::b674:8f70:6e29:3756%5]) with mapi id 15.20.7762.027; Wed, 17 Jul 2024
 05:30:49 +0000
Date: Wed, 17 Jul 2024 05:30:41 +0000
From: Haylen Chu <heylenay@outlook.com>
To: Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Conor Dooley <conor@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: thermal: sophgo,cv1800-thermal: Add
 Sophgo CV1800 thermal
Message-ID: <SEYPR01MB42214130E7A922314CF44C3BD7A32@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
References: <SEYPR01MB422158B2766DA03728AD90CBD7A22@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
 <SEYPR01MB4221281561CCE511A5094D28D7A22@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
 <MA0P287MB2822445DD34485B94D22E7FFFEA22@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <20240716-cloning-canopy-a6799dc7f3b9@spud>
 <MA0P287MB28228BA5CC8B6F61A4C237E9FEA32@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <IA1PR20MB4953D97AE6DAD99C386CB7DFBBA32@IA1PR20MB4953.namprd20.prod.outlook.com>
 <MA0P287MB2822A2F07F21FC5445EF8946FEA32@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <IA1PR20MB495329786AD07F076BBD6867BBA32@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Disposition: inline
In-Reply-To: <IA1PR20MB495329786AD07F076BBD6867BBA32@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [QJcw9foGKnQo2ASlSQASHCrnWOHlqjoa]
X-ClientProxiedBy: SG2PR01CA0121.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::25) To SEYPR01MB4221.apcprd01.prod.exchangelabs.com
 (2603:1096:101:56::12)
X-Microsoft-Original-Message-ID: <ZpdXAfkrR3I4tUTX@ketchup>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR01MB4221:EE_|TYZPR01MB4847:EE_
X-MS-Office365-Filtering-Correlation-Id: f593cce5-6716-4ec3-335c-08dca6219dba
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|19110799003|8060799006|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: ufpSefTorHm62mIjaki5YTgdfelpAAV+YQPCcqK9WT4xq7zE31GRN2R1BLt+ZfXOLwsofw/DXLmBttyTZO4xhnpsJvzaYIwygXWK/o/7Rw7JpYj5k0W86YFqU8m8lTzd4LcretFCYgoWIScvmZUucTqMu8BjDzjb0/0eB9+FYA0x4WnpCO/XKjfMqdgT8tgs/ft3SUHcBKHDtWKfmRwkWNSJXyzoii+nrHOproJCwkbl34MrQ8XyBJNW3b8N9Jb3eSGGbf/WAwYPZ8HsGaE06ih4zSrVKxvPVTT4RPKTPXGqaObDNAwWtzteqx6Rzj2PHNGgGmtYImH3EqDa37+X6iLexu00jaoE8gh3bE1WlKewLlwkjW8bX76uKXEDCZOBH6V5+Yuo+qRsr692H6q0LP6g+wSW0jwTifrt9nIYIlmY7egVhpjVT7GgVHsJ1FSeEfyrI+pEO/i3rdQgv3hE6AGdI5DpLpfTitNlEOmIC/kStpQyAnQwfYVB17DbryNmQKuTtCQ/UGFMexRy7eGMz1PKLz3U1e+fmx2Z8UOxolPVQLPDFXEdJET0RSnkibhyLABBgUrEFnFFJATyRKUXKDwbVGyroRHvg7fzZshpg/ASUXEPkhSI+iKViF0SHeh+PdJmPKGSWlplaZxQ6fSmqA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z9wnxujlhSysiTrGGuQajDF6m+XGZlsitm/p/F+IWCuW0949pPbhJrHaGh+9?=
 =?us-ascii?Q?4WCGM9FlNGYBfC1q4nkdXKp40msRj/Q9kIcyjNyOrUvJxhTOhfIa0j9BrXeL?=
 =?us-ascii?Q?HlT4lqS7qEVfWoMc4LaEdrdO94w7genzGFSx+fq4ANvjZ07eEyk/8/5i53yN?=
 =?us-ascii?Q?E0RUlCEucv22yXf5/nnBtxfPaoD8fwL6XW7FFylckSzNSl555l/cZkvsoPxl?=
 =?us-ascii?Q?RIJKL7kkDAoVjkeQ4DmQ1sNxejGYG0l6XhOqeZs0UVuQK1ssdjPIh4UMq9PB?=
 =?us-ascii?Q?K9TDChHzERonKekVTz2LF1RJCesejGcTaGCR0+NWCwaWt9qnXWTQu+fhsOE/?=
 =?us-ascii?Q?cPvKIeCkuwtCKT6my2XyOreZOjHt/Kv/rJ6NRZdzJhDHcTuqdlfBxDePxFb6?=
 =?us-ascii?Q?3Zcj6pWhIssfl1EGMBPOB72PtbToVuzVlMe7hFdF2YBLzHLqMUampax9ZGr4?=
 =?us-ascii?Q?ohehyXhuFLdNJo74BfoG6HEErbSOKgcy302xssfZhdQP6Kn78ySGRofMxh6k?=
 =?us-ascii?Q?G8vZTXSsr+/+y+IpWfw56WAO+ustyFSHk+ljn1uDwwmd1Doq3HNzX5vWEsyq?=
 =?us-ascii?Q?ePILHcAzZeOxvRgC9y9JCfWRyfqhqebc3xPjiAT57JMMBqtodKAemjDxjFkt?=
 =?us-ascii?Q?W1Z06AMABbOu95dpYP/tRTSq0W2iDxSGMPZidPsEHIUVKW734rAEGk4BqAJ7?=
 =?us-ascii?Q?8EtLRj2rbEOfHhFbwZ0n+85+Lyjrz2KY/txPukZ5PNUvwKQHQ13vhG3h+Mdz?=
 =?us-ascii?Q?sS1nHpdwmOe92ejLSrSwLxmpiuxklpVxu3730FbciKSoD7LYwOykhCXrvhoi?=
 =?us-ascii?Q?LgsCn8uqpmA671OBQ3INVCwbx448X158e8Lg//Ycp4Gy/PhJtGozVTQEVXTC?=
 =?us-ascii?Q?lV6yfOVYCL32cxqIPXQ0ZJqKf7G8PCPowHfT49NK68SSc72zZL5CzTlMmyin?=
 =?us-ascii?Q?6Pfe+xg3CfpLF8DzGs3OipyLGkOhXN07rCthgqCcP0b2/7Do7ZhrSq1kKXXz?=
 =?us-ascii?Q?FaMmbJFttJ6qkEWq2kXqxy7mRcFD5wZeaymVC0HjoDU/+KPrtE+GcnVLkLq/?=
 =?us-ascii?Q?m/cTx8N/NIJdEvKK27V6T2QkVk343W3GPUgCLrM/6CrpF5OZbeKDXb7C8dc6?=
 =?us-ascii?Q?czwJnTj/91IzwlseMU7jT9hWanp53HYdTNOXkNtNKrHiukQv/4Nt0ryu9DCN?=
 =?us-ascii?Q?991k/UwjqtUKTD0z/dJi6KUxfcHVmYyGt1vOiu67akC9WdOvK3hQWfCUNbg?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f593cce5-6716-4ec3-335c-08dca6219dba
X-MS-Exchange-CrossTenant-AuthSource: SEYPR01MB4221.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 05:30:49.1603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR01MB4847
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_223108_817256_0033B014 
X-CRM114-Status: GOOD (  17.80  )
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

On Wed, Jul 17, 2024 at 10:27:35AM +0800, Inochi Amaoto wrote:
> > And allow me clarify, what I said "a compatible that matches an actual SoC
> > and use it everywhere" means to define "sophgo,cv1800-thermal" just as
> > Haylen did and use it for all cv18xx SoC chips.
> > 
> 
> I know it. But there may be something like the pinctrl. They share the same
> logic, but have different data and layout. In fact, I am sure the thermal 
> is not suitable for this case.

But for the thermal sensor, they are exactly the same, I don't think
it's worth to add compatible strings for each SoC. Even though later
SoCs do come with a different design, we could add a new one with
little pain.

Best regards,
Haylen

> > Anyway, as Conor suggested, we'd better not use wildcards (char 'x') in
> > compatibles.
> > 
> 
> Yeah, I agree.
> 
> > Thanks,
> > 
> > Chen
> > 
> > > > Or we can add ones for each SoC and have a fallback to cv1800.
> > > SoC specific compatible means most of the SoC have different part
> > > for this peripheral. For safety, it may not use the fallback
> > > generic compatible.
> > > 
> > > Regards,
> > > Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
