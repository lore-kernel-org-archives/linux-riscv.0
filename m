Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D416AEB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 10:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ju3xjfpI4XGnFLtP3DCj4JWo85+Xtw0qruVhevt0ir0=; b=xvawzGTWNy3U+3
	lnjiKJ2O5cxfRnelsvM2H3fFTVWEU8mp+F5mOC9MgjVukAIIkP3+N6aQnYB6944K55ua7kdF50Tjt
	cgcJo25RYbeMahpeB0dU0NmAQr4EXVdQgtvUuW27FkD01B5xoaQSJPf2ytmNAWT+2228Z6XyYxMR7
	CRR6ku9RVv3EjHapGkFLRCpU4b6/ZJl5jG/wOGLM4u3NaQ06BZjqXAPxYHjHfW4jqM/hxiGFynAZw
	DgHgMe0YsD0i6g0X3X5Jm7xxV1YfF7hlUPPeapI93OSXFiTaE7FAYMQnI19o3uNmj/6Ehf8Z5xUZY
	mfkc7cADwU3GwAVphJxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGdJR-00Ct67-1u;
	Tue, 04 Jul 2023 10:31:13 +0000
Received: from mail-sn1nam02on2061d.outbound.protection.outlook.com ([2a01:111:f400:7ea9::61d] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGdJN-00Ct4n-0O;
	Tue, 04 Jul 2023 10:31:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Owv4yTsdDdXVUkGLtPEYCg48QKy3eQ62+Dfm4f1/+LdLbtIS0YjQTiDMODhyQIyJhpaqupvahtCWvGa7Y0GZO9kbWh6cbSBF6fLLo2LZjziO41K7r13pINfDKjKDD4d+ACzweNKt15QSUnPcmijM3i1jVGdTS9rjFvqikC15mpwtZAuhdff7oVnDY+zurk2N6HUKiWPBJ5c6/Ri7KR1/xqcuPhE5endYFLOLWeh2LM8cK+m7nE6uyiGGL1wgyF1N9vq996/oCJVbGO07+Hd+WeS703zcjexKZiMqAqbVtcgThsVvVUW29uellD0S2zwuxm+D2gCR5dG6YLwmTRjIvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6Ki/oDE73OM2g24kGgjiV8glv9v3VhsD3MghY96r4M=;
 b=INegiR0LQ8IdzHvw3dcLM1XHmQwiQjgsgvkPd6ik9ihEyZsPXKK03jB+Cp129PXhHqAZs25jBWL1a+fIudiYXpqGwMHce0dwWX3Yde82jaL2+HY6K4KtN9uqJHOgtQu5yxrVL92J5oEdPclWUef5rJtmlua6++OgxQkoLOU+/hddCnhqMwGRDWuo2VHgQQZ/Sc7ur+0/1DLykVCLzhl4/QE4WoXmwjH7D7uxhtdWyPvtkBsRt1xojYtmRz8Wfmbg5mv0qB61ZWY/NeMSoP/vTxWydcxKWZZOPucddYYiRu4nZ3H9ZE7xZkBLYAlFAGYm9BVCM/Ci7pNRBy4Ki09XIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6Ki/oDE73OM2g24kGgjiV8glv9v3VhsD3MghY96r4M=;
 b=HS4CN+3utxELqT81Gc0WRXIc6jITo6UP4avHd3xPYFQQEpXcSC8uHjBUU4lQbDhNbg0Ujo8QLY/k4aOWL2DArUq2tiaAa5EtB2i0HjGepRqFfGeysSztmHUnTDiPk76kCrMpbz4HzspC7frZs1t1rEP3L5jULR6Cf9keWDY6X2C6XSVcnjrf9RgqsIraZYs0489IKePThsLK43Tbfmn886ZR9xLhdN7TpRjXmPisPrC7pHEztt11ws0ihUK/ePhZzuCkkBBcRjFEdw9FWYkirQsH4mz6lzSKp0nXKfjReQRZtHOk1aR+pFegtQJ39PoELVQ1pNeY2G1jjelXK7C+qA==
Received: from MW4P221CA0020.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::25)
 by PH7PR12MB8106.namprd12.prod.outlook.com (2603:10b6:510:2ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 10:31:04 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::d4) by MW4P221CA0020.outlook.office365.com
 (2603:10b6:303:8b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Tue, 4 Jul 2023 10:31:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.44 via Frontend Transport; Tue, 4 Jul 2023 10:31:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 4 Jul 2023
 03:30:53 -0700
Received: from [172.27.1.49] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Tue, 4 Jul 2023
 03:30:47 -0700
Message-ID: <5621fe4a-5c21-b407-91a1-4cc299f5abb0@nvidia.com>
Date: Tue, 4 Jul 2023 13:30:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [linux-next:master] BUILD REGRESSION
 296d53d8f84ce50ffaee7d575487058c8d437335
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Andrew Morton
	<akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>,
	<kunit-dev@googlegroups.com>, <kvmarm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-bluetooth@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-parisc@vger.kernel.org>, <linux-rdma@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<netdev@vger.kernel.org>
References: <202307032309.v4K1IBoR-lkp@intel.com>
From: Shay Drory <shayd@nvidia.com>
In-Reply-To: <202307032309.v4K1IBoR-lkp@intel.com>
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT022:EE_|PH7PR12MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e39ff4d-e360-4728-e8d7-08db7c79c4c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Dg1qCc2ry6ECA1DeFK0AJNkukvr5SGvJUuu2Rc/EXg/nkPf1U6wqU8GA3nNoha245s/tZ4H9sB+ynensGCbCTW7vQQRrmpovDizSt8fig3pTU3prn2qxQnv1NxY2LvPwSFPWs7tqJvFqFlOmPejF7sn3jX3GpzFPxXaNZeaZN5oFuDa6KAF3xD6Wzk61XVgjICVN3Fk74W4SWQTFyB+DycJTK79YGKjHxZZQZ313TOSeI9WGkIyCkKcGmqaFgo7SO1kKJTBwXCDKWONm6+rz/DNvKIaG0tASDCj4+Ia01ZpyyB1DTboQJnLuBPMvlDElWeFeQPJ9gpC5B1QgAN5UFSig0HCPKWKXmR1uPGroeyKn+sHTL/qzT21zY46prAfPemcmyJZoDpnMZMulhsPJtErnW5ofKTkQSrMRlkeZbYQV3AXLz/4R8BdLMmLqBtiC16h7WuDajf98C+go4ExFMa6dVGbAjJ/yw7RXa/n+sCw26z3N9p8T2/wf7lxIQFvoDrF1hodAaA2GVz6UTHYMew4SbKRbXX/VkRYToUO5q6DhKhF2tkyiHtBTvSn4R+7JWDQ9aimDD/xsnBuPiaAh9vh6jDKgTReBm4phdBMaJ02xiG5qnIsV5JJJt0giv2HblD0ocQ+UBJeit/JKmDXPn37M6qICNo4K4/H5D41w9qsULAerbp1WAkfqTadJSvPUNlGrtmbXdOEMawhAHam/xplHW2taeQoO+aXSCgWFV+TNlSgXRWfMP0oj6j9DUuCfJhPicOwkKBiqOC5zu31Oyv5JYVmJhJDQqB8mvJXYMAe/HIJoTIgCky7SAcoVu+0
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199021)(36840700001)(46966006)(40470700004)(6666004)(16526019)(186003)(966005)(31686004)(478600001)(4744005)(7416002)(26005)(5660300002)(47076005)(36756003)(2906002)(2616005)(86362001)(83380400001)(336012)(82310400005)(31696002)(426003)(82740400003)(36860700001)(70586007)(4326008)(7636003)(70206006)(316002)(8936002)(16576012)(110136005)(54906003)(41300700001)(356005)(8676002)(40480700001)(53546011)(40460700003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 10:31:03.6023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e39ff4d-e360-4728-e8d7-08db7c79c4c3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_033109_244578_6FD4AECD 
X-CRM114-Status: UNSURE (   4.00  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 03/07/2023 18:11, kernel test robot wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> branch HEAD: 296d53d8f84ce50ffaee7d575487058c8d437335  Add linux-next specific files for 20230703


[...]

> Unverified Error/Warning (likely false positive, please contact us if interested):
>
> drivers/net/ethernet/mellanox/mlx5/core/lib/devcom.c:98 mlx5_devcom_register_device() error: uninitialized symbol 'tmp_dev'.


This *is* a false positive. there is a comment explaining it.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
