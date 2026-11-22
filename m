Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15499606A320
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 14:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n/v83ZDc;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Ydh0MMpk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9sRTFbPhuo+g9B9SLjdaVXBPpa7tABFuFZgDjaOcRbM=; b=n/v83ZDcyGSD0qNX10K5/o5tjA
	Zlpp/GVzh17CL2FxBmxTaKZ4a5oHdJrp4duuiB2qRGCmThsqUUI+RNP5fEbXlP77Umps/5neGsR0w
	ieF/dk7gYoxdceA/PQDHeqBw0WrvR5TonQu83rWK08TkWbfF0mp79MS0pnrUu53xp4TbW2mTTOoLM
	yT5c9ldBHg+N56wI+pch4DWuKFkwB7zj+j1PIYGfSl++3HJr52xHKVhX1fvoKWoSOTMah/49c5cPK
	szKFHk2RSmDnn/DHgxMfq2lIrWAOo7H2B7ZrWHKT3WpkL/xjie8V1rUFMf2PAGZLtsY9JTayOcq35
	DjO2mqLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV8kk-00000001DBT-4BN9;
	Sun, 22 Nov 2026 14:41:15 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV8kh-00000001DB3-1Ufy;
	Sun, 22 Nov 2026 14:41:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xAcSCnoumi3anK2y9C4hWr9jeIrDjNFoHGW8XJQavk3Y0F6Sp0HUHu336hf4O9AzyIw9n4NMaxcmX/cuhocR+FNvdlb1rjk0EabztXWVYyeTLYTcPjTWa9anxasVfSyvHg35bfaZMAVgCS4nlFA7UdQlAqFO3Ha3NH6PpabdDin7/tYabiRMH5J77voKVXPEIpuORwuMIGfQGq+yldE/DjrqhVlPq3o8I23R/qnqzwvf69/Cwcphl7pETvfB6QD3e3WB0A8foxauaJMuUiMQYL5fpt8DM2WOw0tU81XEuzp/eVTqbMb4XBGduB1DVzUSbDTxhfUJg8oR8kR2ScLaow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnAKYgqrvM16DX2DZX48gINNW86siVsv/X5KlED2o1Y=;
 b=M1zQB1rzmFH+HskAvlQbz+CGd6aTKcQNhkC7MkrRIdDtIDsLCuU4srJJDd2U+sY/6n9qVgxvy71/4ftGscknwmOnFYR8v5e1qXfoIb9fy9Go6IsDFzZOyS3xCPTI6rqMupPIOY5VNtO+rD2FddCLCXT82Z9FWbQaB7FN4cLUMZiz+8GYpe2IsXYRw4JTfb8BXDeXkc1yu4Id/75Uf3MLg7aZAao/xzOvPRzEPfL82m2UhSUN0+EkKYhcqvd1pMYCXMvV8kwKVJvPGyGRkJ4/OagABvAdATUoIEaweQG++BzX8uqwYv7Kj7rWyTTHHsdSLfTQGWt3pwPS9JsiBC+WiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnAKYgqrvM16DX2DZX48gINNW86siVsv/X5KlED2o1Y=;
 b=Ydh0MMpkTIKE4KwXhOZN7ZrfUIxYAsK0ERvdO+m9pOuz6nOYo9fRBqktP7xnCNEJwI+TNcYByb5w+GKGLNyYyEmJzLj+iFbqNQWpJV70REP/32ZwTOmw9c0B2vX96kp/5LwHYlcOSQPGckmemDeUHTGcgX1IA8ORHVwaSCHVwGMTJlMGsY1fO8AnEv69yEGfphbmPhcaHidERVgqY/SBJ1IT0sdLYYeTyIga6Vmrrw/L+8uCBQFS9qrwLlg4sf5esTpx3G/g6aQ9oq+1IQfcB/VXV7cwqpT0yNLzR/6OQTQvyRMTEUfcpJ350NRKYcg+cyQwaHLHJJgoEuW/FcJWXw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by BL3PR12MB6428.namprd12.prod.outlook.com
 (2603:10b6:208:3b7::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Sun, 22 Nov
 2026 14:41:04 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0639.012; Sun, 22 Nov 2026
 14:41:04 +0000
Date: Sun, 22 Nov 2026 10:41:02 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev, Mark Rutland <mark.rutland@arm.com>,
	Bill Wendling <morbo@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	linux-integrity@vger.kernel.org, patches@lists.linux.dev,
	Piotr =?utf-8?B?S3LDs2w=?= <piotr.krol@3mdeb.com>,
	Ross Philipson <ross.philipson@gmail.com>
Subject: Re: [PATCH v3 03/11] efi/libstub: Have efi_kaslr_relocate_kernel()
 handle extra_size
Message-ID: <20261122144102.GA1095675@nvidia.com>
References: <3-v3-22d1a1eb7d2e+17de-arm64_drtm_jgg@nvidia.com>
 <243c6d70-7c81-4ad3-9a67-eb8cfbf454d9@app.fastmail.com>
Content-Disposition: inline
In-Reply-To: <243c6d70-7c81-4ad3-9a67-eb8cfbf454d9@app.fastmail.com>
X-ClientProxiedBy: IA1P220CA0033.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:460::13) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|BL3PR12MB6428:EE_
X-MS-Office365-Filtering-Correlation-Id: f017e04e-aa46-4a7d-18f2-08df48a6a273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|261026121527099003|261022115727099003|261022075727099003|261021121427099003|261102123227099003|11063799006|5023799004|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: UST02b/nPdOVXlmbDFMIukgKWb3CVlIsvaMBsBlgod4AQ1S2jd7Dqd68S7hQF7baxyJ3JlgetS8q6qIlr6+/nROmlxLsa66rV3rxcFK0V08L2LgMWMm0eqr7nJdSCRo9xPC/cq+hYdhs5kS5SwlR7FYh1DKRrJ3uWJEWvUvJ8rPzvhnCg9fqDgkClRIHjKEkpCWyM4QiZNy1wNHHuO/nYz9EHvXpodDMn0vKeMdxgIYiNBKyHs0XDvNJA9mush9Cz+Qx+Jej6H8ODGrZfwk2QXucM7Kg+2M4rNRvJEs60dumbTMAmVwV/fKDblPA77Mq5A2UG2XoysRtmGhfnqdOX1wK5zSDw3PQRHq7l5locefxEgfC54Snf1KxUY/YOEJFdqSvAsDfEwTfQqEim7mvObFP+bjn5zfR7Dsa8hzkbc0XEDOs2GlBqUWNJ6Vyy3Ic4VtBBcJBBmJjAsXtPPooEQ8E7UmRAfYfFras4yNUzDh4Zb3YOeVc5xD2ERfeD1IpRhZp+YLJjh+lxB0MUDY01yhhL+jMMFrLFrAyOrJjwbsyhJws5A4q6Db9F85sFnno2q7O/8ptNey+DFEryQUVaCBNE0LMaSPDM7Sixqt2ArvYDEp3Dzmrdi6WGELAbM9TBsnco0BJ43mEbqNN9GBUQLPLnlh5lGmSp5Eui+9a57w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(261026121527099003)(261022115727099003)(261022075727099003)(261021121427099003)(261102123227099003)(11063799006)(5023799004)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FBQlZTKR7uunA9w/OS7dxtFoCDNEr7CEsH+YwR6RX7+nJOlBhkDwO422Ypqq?=
 =?us-ascii?Q?6fXEggBLTvbprP9NSC5zL1lp0sViWaS6y+YkFwxnM2vFp8ksiF0hctmHIHdC?=
 =?us-ascii?Q?SKasRbFPS6beNNdlrMgNZKHvjKagHTwrBRtkGxg+e7uK0iZzYJ9sMbVRVX05?=
 =?us-ascii?Q?3QBPjjEbREwkYXItEymj5yVzWbTNUT7Q729U+nZ3Wjx71AsXIFxllTS7fzA2?=
 =?us-ascii?Q?DIUxlGk4Q/iQbm5sjNAC4/vzWznufH2CTjk6M+a8Nh1WY4dvFFrHfobRZAZP?=
 =?us-ascii?Q?TWjw87XQFlMWEJyNTZSlEVU808/qgAOblBCezjTzd0Dz/iNDt1l7VL6DGIVh?=
 =?us-ascii?Q?7+/ci8ac+S8mJpUKWVzpxIGjFOfRHi5mJQkp4l4bb0THNYw8p4uLDIijcnfG?=
 =?us-ascii?Q?4ODivF7IF4eRD7yXws998eM0ss21rKPqoQNaM0NhTY8PdnQ+tF/QCKNYOIkI?=
 =?us-ascii?Q?QVmI9zs4eOjgGQ3ICb6en+ebZuWIHFP2kUa4tjNtVKZ0JmmOtWnnwXJNXdtn?=
 =?us-ascii?Q?Ul+K1iXmzxAvGfiuSNqzKGtKxNTOkFUm04smyyx4IeNYxy0GDmAIK7VGgAzq?=
 =?us-ascii?Q?8tvCkg6Qnw2CbAVXl7fv6H2ktH2wnJWZTjDNETNcFUduqU+gpXhgGKpjzZ4u?=
 =?us-ascii?Q?gf9rg7Xm1vppyFIjKizOPST3QVrNIisTlFNFFBvIR3ZfNNiyXy1sABnfitvN?=
 =?us-ascii?Q?U7e3zsXCJ1bukZp18xq+ruzQTgJyuamWaBHZz6jRW9Xu36GYYVSbDL/2YDqD?=
 =?us-ascii?Q?P0n09KZ2vA5YDMOWfzZ9ibqqitf+e+Hvv+RL0nVtLtclNrGDeAp6UkXiruQm?=
 =?us-ascii?Q?0j2/1CmJ9Uy//oGZu8KkJp0nsJa9lAX/lw8YYk6gX0NCyz/AgX3ac6X7expN?=
 =?us-ascii?Q?hqgnyjMmEX5REH+kKbrjjaTJQgG9GCADGh1bBbnerWPY+wrRK8wXC9AsxYPX?=
 =?us-ascii?Q?B+1qaHIzE3IbBN7RvXPJdDoucxbltSbegG3/6VxxXgWeaFzgc//YmO83hyhu?=
 =?us-ascii?Q?i5stqVAnbTccD8kdbG3lCxNV9fc8XUs/xf43F/uW3arTT8KghTMQ/0jJ9u3x?=
 =?us-ascii?Q?MKpBQQ7IuGenLNSpdAI1qpetb+ftEaRq4+Peg2MELrvqRfFOznDXAGBRwh38?=
 =?us-ascii?Q?omlvOzouJ89ZQ0CMwzKQEhF3A2jxhYq117gJMfSMUeHvZ1XEsnIRHYxTHPV3?=
 =?us-ascii?Q?lesO9Scir0fia7//seIpgm0ESLF5eyCCcwlAYLdGZNpklvEmwbNXYme2IxpQ?=
 =?us-ascii?Q?8TemWOD+XGiON1t8uGaJigoYdvtKwzrO6CIR3SxeSal/Y+KLyYQOC2+fJ50w?=
 =?us-ascii?Q?OwR+YfIdviEQCxm5UrnQoAsb3+7mXA2we2tCz3T5P+fc/lRocbx3bb9rPlNw?=
 =?us-ascii?Q?gbE3MV25fVLeLOwll/shj/qhLuLhmtt2NBEMy5KMe43ElXV4fiZXPrIlD2tZ?=
 =?us-ascii?Q?MIdwXuaGjO1DM5gr4GpkwAXVqDk/zFaBBsh1dUJIPiju+X/cJe5Tv0bv0CeD?=
 =?us-ascii?Q?2CWZLVx/Xxto0Heny/sKFHvpDXXWHIiWAXWUby8rHa4BcXYwdqj4n0l0kR9K?=
 =?us-ascii?Q?gc7D1xRG0I8KzlT3330XfrwRVQxFmLWEM4ZL99vazE5i7TZc11ZWaz0He0Rb?=
 =?us-ascii?Q?MiV9Z+8RrxUxdy829qGk3EfpZn6IJ5++Zx+BCN3kyGpPRSmAn/UFOQPn9Pzv?=
 =?us-ascii?Q?uZTgkrgPT4IBwP0NiIUbiJiCViIgb8ylPRLRsVxqHQa072UI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f017e04e-aa46-4a7d-18f2-08df48a6a273
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 14:41:04.2658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/SZf6WK8apuREzbN/rb9hWwxgYjYcY7Yc5kOXgSNKqoRUYtsZakt8K1sXGpKdGw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6428
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_064111_408863_78C510BE 
X-CRM114-Status: GOOD (  10.89  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 21, 2026 at 12:33:58AM +0100, Ard Biesheuvel wrote:
> Hi Jason,
> 
> On Fri, 20 Nov 2026, at 18:51, Jason Gunthorpe wrote:
> > extra_size is additional memory required that must be immediately after
> > the image.
> >
> 
> Given how extra BSS memory is essentially free at boot, is there no way
> we can establish a worst case upper bound for this memory, and just add
> it to the image unconditionally for DRTM capable kernels?

It doesn't look like it, at least not without reducing support. The FW
can request some arbitrary amount for its own private usage during the
launch.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
