Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B66C072A2
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Nov 2023 01:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8HG5Qh5yonxN+0OJAFwqUKSzBOegE0UQXb1AmWuPXm8=; b=4zu4PDIaNws6fk
	4FgDWf3y6Rx6um9fBhD78KeKQU0dzxTnPlMQWjIjFn+WfILsFCrFifD62ZacbLzRXgkQgi+OpPNfo
	npFzcevB4Lu4qRHhaS+sbUZgwBcZlEiO7yoCWgE+He4hoe/BeD3yWsGAyXvbjs+8o0gL9uXVsLbHq
	B43fWeJ8JWR2ScAiWdsc01+WO1oak9Gq0EkbtazVZ22pynwgMccQ9qgnQ+imaY5j+6QYJOYWnAOyt
	nWoH/dD1Y/rv2xk5osa+5rEhOetLDnpMDI+JX8RQ8kAFoixz2s5J7bHhj7q5omMFEULb7jn61frKd
	9SpgNNnlL40bDcM7h1HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r49s0-007el3-2Z;
	Sat, 18 Nov 2023 01:11:36 +0000
Received: from mail-bn8nam12olkn20803.outbound.protection.outlook.com ([2a01:111:f400:fe5b::803] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r49ry-007ekS-0x
	for linux-riscv@lists.infradead.org;
	Sat, 18 Nov 2023 01:11:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vq1SXw+euepTop9tSZahioNjg3uUg3zTmVDKNkF4tqgcP5e1ddG1YVscfLu2mjz6uVg1CXcM/VyYtHeunkT55KTE8SuA+JthzMd0wOGTK+aUmW0m/Hr4B2pUs/4vN0sKtWIATZ4RIiNMXMrL/wvB+PJFL4HH4msuDlHw32vxr4toUA5XEqyR70pV6DnU6TRzjS3c0grXaXZ145Iw0O6llTyxwxh1RawD6+etX3eyRgwA6pFaCrxjz6sJv6bDo96aaNx8orURBCsjoOCl6u0DFFD1EPvxaD9xuFsZPBPu8fTnpnuAAToBaLxrhruSFm9puRxhelbflCVqdSbbDkazrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DmTJi34iK8HL+4QtFUrV4nOMjkffzblzpTD+rwDAt8=;
 b=Ye8eVuIvRdh+T6oJLI7NxpPBTO6ocvvUONDBWHPGKJKas8+vO6bZTe0kwBeI1KBtj3iACE7IyIhhHino9cRk+CpWS+q553H3rQXDcZQcb6PxgZ8/ywYxP9aXD+jBcX1+yRIKeshTjMNZDJZizqmMW+dSYPZpFRzvHnLzdD1O5V+s82hb2rfO5wF4OuSeo3Wu36oq+3DzSQjkdpKezgqaPiv4ai528lWQO+ixIwpXxKImufOKSmD5obVv6HItAWtT3iAh3o6Mls/hWOMlzzr0OmAuBEzGuR6Qrhr1pusFV6vjpy8zlAm5lK1X0QUkci3mcWuZUpWisBnmdTyr4jHu+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5DmTJi34iK8HL+4QtFUrV4nOMjkffzblzpTD+rwDAt8=;
 b=KkrwWqV5DrMVeArAC9ufOoVq+oPeQvDzkVqxpTzrKchT9NNe2Nbs63tLIj3lcKKwcGmwioLT4R3nY1ou/r8mHX4hNvL4li8ZHBUvSfOHT2esvq0kHbbZGx2oGbHVPr9BDqeB0eb1vOb/aTqkJtUcHYhrB8d+M8r78VRen+LDC7I7eA9LwYgTDLaUjIGwJGiNWt8RKXMboHugtq7MAd+JD0jGmHbfG3kS+0lMzkdzOkmh01nMY8AMSMjOzv9kgdnE1g6YLWEt1QJmKJFG/o+W/+Z2+chsnompgGQNkjK6LC08MpE6syHwjlHs4FdJXUnQq8vIQmwKGbg2Gio9H9kMIQ==
Received: from PH7PR20MB4962.namprd20.prod.outlook.com (2603:10b6:510:1fa::6)
 by DS7PR20MB3968.namprd20.prod.outlook.com (2603:10b6:5:3a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Sat, 18 Nov
 2023 01:11:28 +0000
Received: from PH7PR20MB4962.namprd20.prod.outlook.com
 ([fe80::84ba:de35:b4b5:8eaf]) by PH7PR20MB4962.namprd20.prod.outlook.com
 ([fe80::84ba:de35:b4b5:8eaf%4]) with mapi id 15.20.7002.015; Sat, 18 Nov 2023
 01:11:28 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Conor.Dooley@microchip.com
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Guo Ren <guoren@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: timer: thead,c900-aclint-mtimer: separate mtime and mtimecmp regs
Date: Sat, 18 Nov 2023 09:12:04 +0800
Message-ID: <IA1PR20MB4953EB3FABA3A0DDC6EC9D5DBBB6A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <cd5e88b0-db70-663a-6436-e892f589e3a3@microchip.com>
References: <cd5e88b0-db70-663a-6436-e892f589e3a3@microchip.com>
X-TMN: [jr10hnC1yrr2CWTkE20zEeGusQKg/yl0kOlPzcXizW4=]
X-ClientProxiedBy: TYCP286CA0168.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::18) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231118011205.67697-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR20MB4962:EE_|DS7PR20MB3968:EE_
X-MS-Office365-Filtering-Correlation-Id: 04543c87-0bbe-4bd4-12ae-08dbe7d349b1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UG/ZBHEo7RzxXLY1JI1TS5DP9VKTd4BHf8rczURAb+wZac/gXEsUGO5Pn66/Agm6hEF0+JlZl3/2EFomVexiIFhkb9HDJpap5ptykr1/VVIyJd2xX1xJ9ULQGwLAPOxQNP9C0jCFR0x1o7wukZ/jgsf1GmqYpYh9ygaaoXPp1i+8yetR8N61SVx8+cZfs+vTQGx9mGENifO8QNdgUPRABTNpbw2H0QGA4EbEg98uh3KnrLDKI75RfwJ29gX+qUXmhbhydMU3oUXNb/XPS8kWyQ31YTxg8ubj7zDfblab7V8IbBa2JGLxy8q/rDxkKQ3CHSuwk3PeGb8LN3/gFBe1lA0ZfS0Xx3F7DGrVcVZAdAZAV+jORjSX81yhr9TcfPV4kStnrFyD0ZPqs2rhu6MNDDsTVgh4s7sdzaDSHmAoiC5Zzlm9a1uGCZQdOuA2miHI743YVayrGv39Ab06DEowD/rJ8SCCbOAAmuNRcg/tIIjyyHCvN9O4Oe/w0R3DsivLkmPliwKiqKcjIculjQTAn6yi29JfLFIVmB0ZotBcJsKuZWD7tBRHsxS5/cU/EDEo3Gv8fD2ZthZlz9r2vIhSU0+8L7BQJ9MtWRUyN7lWT1PuR1CNMvSnv1h3jI1a+QM2
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+ZI3f8mAD6oQjanObljGHaMbrdoKVrgtm/pS77l1dkvJOGCl9M9iq72sPUw3?=
 =?us-ascii?Q?hPexxIUEvhbge73lpieA18Crao0YNneb81EykBw8S86ZHZeSc+rsX7EU3/es?=
 =?us-ascii?Q?bIpOaGiZXnHkdlcfsN5s8cSsRJ4CZSpBdKl96zvXJyDB3J6MjD2jwyIwBSHK?=
 =?us-ascii?Q?732s8GBuKsM3ePDdmJ720pJu+NK0fJyy3SF/gedSy9nfVeQVxLX6x9ScYv8b?=
 =?us-ascii?Q?Ht3Ox4VrllVkPRJcfJDLh+sHjqtbBd6ZvroPHEIn7/T6a4X+nTXfQNcy8rGX?=
 =?us-ascii?Q?znGS01acPUBFoazkw5EcoSY0L7vX+ic6qiuDWlKTDKWd13EKl4ZK3LL04mOv?=
 =?us-ascii?Q?Y8Mo451VZyKD0mg17PnsxyG6O201/H6NaeVqTgWf1XyXnZ8q08ZiZXgFn152?=
 =?us-ascii?Q?4MzgwJG3oOum8pYZQIkS5VDh9j5N9H8TqbYunBEXHsFjWtuQaUEBEgnoJNQx?=
 =?us-ascii?Q?qPdNZFlzlCLu99awyGrIHvEP52BPNEIAFGefClRXiyprzN6Axfk7L91xUe56?=
 =?us-ascii?Q?FrGJ6H3IqSYbvYem56VeZrfuXXaKJdWg4Hpx2D0d+Q/+uhXXABkRNiyXBVcQ?=
 =?us-ascii?Q?qqmoQiswHevNjgrQSsPzblNMiEvOIspF5SecqD59k/NlX3Z+YpHyTyDBodl3?=
 =?us-ascii?Q?auXbTsuhHg5ySB+otRVHBHuyOFe/NVKxayp873MNyWpfxf7Mbazn4Cd+m/KT?=
 =?us-ascii?Q?YUb8KUgK+hpYsaVlZntH+Hb6sYWJWLa43CcLdWQN9ev9C2evvUYhcXXorpuv?=
 =?us-ascii?Q?jUj3IyoGI5jVlTwo30Ktl5ewIrAbOW+Un2Xmb4QXY41MY5/EhbFAQSfQemcR?=
 =?us-ascii?Q?O5UEEKb9kRtTZnJdWkgk8pW9lfl/o0mFXuaVdsy+LHj3Hu2g5JDqnSW40xFw?=
 =?us-ascii?Q?gtLw4AAjx0oIihMOxKZuEmzgizjLHLc5zA+JXVH7o3/vC7ScJ4gSEHtOXtsA?=
 =?us-ascii?Q?ztNNxXoJnBrHBlUlTFvgD71s3Qq3PF0YtFxlDMUArYpiBpfiNCb2pog/c45r?=
 =?us-ascii?Q?qG6pZknWiQOR9rxCJO6aqjLBcOVNSGrehENaNYi1NQ+3Xo28WVepiB7Z3EV6?=
 =?us-ascii?Q?DfhtPMn6NGbwtv/4jsq/V9Ugrr5oiR3OOrTQvb4Xo+UOTimQ96vw6ZesT6Ow?=
 =?us-ascii?Q?jDd6AQGfhHR7IRUSyc1ODQjesX+m7xq495R4gx/i/SXxA2Ugc58i0T1J1cCf?=
 =?us-ascii?Q?b/xpmliLuOLxLfLpKfriGqPs77vG3urHUIeriRnz5FGO3Zlup+sULp/MuXk?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04543c87-0bbe-4bd4-12ae-08dbe7d349b1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2023 01:11:28.1406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR20MB3968
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_171134_543868_9FB0436B 
X-CRM114-Status: UNSURE (   5.80  )
X-CRM114-Notice: Please train this message.
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

>> Thanks for your clarification. If I understand you correctly, the binding
>> should have all registers that ACLINT has. But for specific use case,
>> it should only contain supported registers and omit unsupported. Please
>> correct me if I misunderstood. Thanks.
>
>Yes.
>

Thanks, I will prepare a new binding for this.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
