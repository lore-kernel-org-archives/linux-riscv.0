Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83ABEE4996
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 15:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oAq3jQ4S10li8JGD7R/1eGX1zC0c0v2YIwDmWjQ9ALA=; b=fD+Sab1ZLSyY2M
	C4p4HqAu+/maAcqZiD5nZYmHxrxDG2dBa4JjRDKot6y6/aE5UpPDzC0YpQQ10caj5eSTFQy/HYt7j
	QWpkUmpym1XGb0Hp2TrMvJf3zSMrlButF1uzKL+lGQ2UX6lQ+7dOirxk2Y71P+U7fVY+N4sfZ3GPz
	PhWEdN+maWMXcePnYs1szEoj6zlVgkXoP9s2B3wsElvn5L27TPAjhvTQM+6cgVFfpAxFMvGKJO3Z/
	RfjPrzeAHipAJMsuUYrLuJR0+z8r6zc0rSkpblxwdUGQxPu1gxqFERjzF96CjdujLirjaLc7Ce6kc
	j+GZJ2ZDmMzC3xPkJYWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYSxo-00GIyC-07;
	Tue, 22 Aug 2023 15:06:36 +0000
Received: from mail-dbaeur03on2060e.outbound.protection.outlook.com ([2a01:111:f400:fe1a::60e] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYSxf-00GIqG-2e;
	Tue, 22 Aug 2023 15:06:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfrtkIHD41BdedViPMyVzl+Hx3DX+Q5alc3k43j05cI=;
 b=KNOT4WQr2ip1eJmqTzufkPODbARBuwPqAGEyg6jwpkUvQuj4hpohkJYoQs4aBWGNs+kCbeSXxznfj+zGXGBCf8g7HLr3Enjotltdm9WrXEcSlyi/WfjklvG65BbEF8OcU8vJTeatsxO/PJ4bBqUjSnqV6qdc+zHyL2aebdW5uTM=
Received: from AM6PR08CA0023.eurprd08.prod.outlook.com (2603:10a6:20b:b2::35)
 by PAWPR08MB10133.eurprd08.prod.outlook.com (2603:10a6:102:35f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 15:05:50 +0000
Received: from AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::7a) by AM6PR08CA0023.outlook.office365.com
 (2603:10a6:20b:b2::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25 via Frontend
 Transport; Tue, 22 Aug 2023 15:05:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT038.mail.protection.outlook.com (100.127.140.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6723.15 via Frontend Transport; Tue, 22 Aug 2023 15:05:49 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175"); Tue, 22 Aug 2023 15:05:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d37bb38f735fa9d8
X-CR-MTA-TID: 64aa7808
Received: from 44561ca60c7c.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 31AF0FB9-91C9-4605-8271-7B75269EFF6E.1;
	Tue, 22 Aug 2023 15:05:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 44561ca60c7c.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 22 Aug 2023 15:05:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fLmSz49N4qNR5r0qm1oDSblwsc8ngBADluagQFCnQzg6tDu95KIShybBbukcLSpFGdJK+2kOsRVTFLOgSYqqzl0/gUxCEaG0Fpl2X5UShTkYZs30CnrvrV/elyUWl5QUhAi5XvE/ONduBFMRg3bpv5Zpj6lU5pb6D7qecDNUsa/RZuutI4kK6I3mlnJxqXjc7IlN/hKYdMLt0yESjnr1OvuHI9JSHb0Xak+FQUMr+qrL3he5uFk3JMp7jvDOdi9x+xceVRBSBqRdjpYIu/+eGowkzlXgtnAgxk+l5Xo/XLey+RcNN7NNFk8EdEjYO7wsH8sQsP08pOlgqIsl5GPWFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BfrtkIHD41BdedViPMyVzl+Hx3DX+Q5alc3k43j05cI=;
 b=Ok8nPlgNTEmmtAwEG3R3clvatLK6DtXq5BTK43DZIYItmOAvdWWx1NuhwB/d5q1X8mv75I+2rwPKjF5qFuXqTdGiXYYnKvImc3kYeomlPznbW46YFDUCoWnOEth+x48Gb1d508XXW3+5dqfjExWnIdbUGGdvERB5lBaxFq10gxSuNRwu7gpDFCNmI9sLICYDUwHEWTdllKjQbIAh2UEwxHY6idVbEswpF2h8LVByveNYaoCUXIWssFzMY0DbPtxIvFXS7h9rYZ1+XPpJWkPiugiuJw04Hym8pllNokQmX4iMO26VMXI93/vN6NLU8NcfMYi9wMz7zVkAuJvruN4b2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfrtkIHD41BdedViPMyVzl+Hx3DX+Q5alc3k43j05cI=;
 b=KNOT4WQr2ip1eJmqTzufkPODbARBuwPqAGEyg6jwpkUvQuj4hpohkJYoQs4aBWGNs+kCbeSXxznfj+zGXGBCf8g7HLr3Enjotltdm9WrXEcSlyi/WfjklvG65BbEF8OcU8vJTeatsxO/PJ4bBqUjSnqV6qdc+zHyL2aebdW5uTM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB9PR08MB7179.eurprd08.prod.outlook.com (2603:10a6:10:2cc::19)
 by AM8PR08MB5732.eurprd08.prod.outlook.com (2603:10a6:20b:1d4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 15:05:39 +0000
Received: from DB9PR08MB7179.eurprd08.prod.outlook.com
 ([fe80::adb0:61cb:8733:6db2]) by DB9PR08MB7179.eurprd08.prod.outlook.com
 ([fe80::adb0:61cb:8733:6db2%7]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 15:05:39 +0000
Date: Tue, 22 Aug 2023 16:05:15 +0100
From: Szabolcs Nagy <Szabolcs.Nagy@arm.com>
To: Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: "H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 04/37] arm64/gcs: Document the ABI for Guarded Control
 Stacks
Message-ID: <ZOTOqxBFqselqN8U@arm.com>
References: <20230822-arm64-gcs-v5-0-9ef181dd6324@kernel.org>
 <20230822-arm64-gcs-v5-4-9ef181dd6324@kernel.org>
Content-Disposition: inline
In-Reply-To: <20230822-arm64-gcs-v5-4-9ef181dd6324@kernel.org>
X-ClientProxiedBy: SN1PR12CA0070.namprd12.prod.outlook.com
 (2603:10b6:802:20::41) To DB9PR08MB7179.eurprd08.prod.outlook.com
 (2603:10a6:10:2cc::19)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DB9PR08MB7179:EE_|AM8PR08MB5732:EE_|AM7EUR03FT038:EE_|PAWPR08MB10133:EE_
X-MS-Office365-Filtering-Correlation-Id: 96514747-3ef3-4e1e-5133-08dba321457e
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: YcQqMwk4Dn5hMK+j4004Cs80OkhHHW6XQ7wOn41UvxizXAzqHevZO8vajBB9wd6zzuuO/XQSS10lQO09TMQVDfSDBHBMpeq2o9AcXLqwGMhvEe259I03oqU8PCZLDkXX7/q5VmGxHru6Ld/j3nQdfeSuVbb0v/VTe4Oel4cmS6F+InXhLkK/b7NTmpC8KttkbWlKmZqw2oVUOsEEqCrrtQEidefpZtXNy9KIpjRUeqSvWgHBPTG5Gi6fTShgUV9cDG9/fcX48UQWgPQEKZx4cw3Xm4STZn3TeyCdClt+bArIyIJjvq2HvPUugHEITSgPWmv4xqWU//JPcnpFnImaZkWXRUcM8HVs8sbB4DyljPhGEq2up1Q6LH+2jaWwxQ2WMp0gl9YjzDNvbOG8LmC1P+CSbh9Qcc7eJ1m3Eozz9YA34eQ3RIhTLhzbrwj8KQ5NBQSGflJATJtHpcqvxZE0j2J0Giy3lpuIkx/KGdBXOPWWhqaJXm6IYDh3OhS3lNHR+R90aZLBTTfQqmmMKnvBjSFYJbV/kf9nv7lPuPWQ1ET3jxTMhDbfJXF8/T8g/2buoK3RXkbc81lJdh/FBpyIgpbsuuRHu/CPZzRpVKK6CwQ=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7179.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39860400002)(346002)(366004)(1800799009)(186009)(451199024)(54906003)(66476007)(66556008)(6512007)(316002)(66946007)(110136005)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(921005)(478600001)(6666004)(38100700002)(6486002)(6506007)(4744005)(2906002)(7416002)(86362001)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5732
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d3ed07dc-d070-4514-981c-08dba3213f11
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tHKaPw6IdwY/uj2wWQNzY+ZgzjrV66rGGCVMyknzUt7izagcXIwtC63hq1xHo6WZaKinAqT7a31g5HbJ/IrffNe4JR8hO9Uw2U6YIszED0Cid7mgVoED6Z+ZajEUrXRdHfJhZrHKMTAETViKFZxjeThcoMHYMZ2jIJVzaVPhHs644g/EfJxlmk6xUL6m71/6/cASwnQ8sxI4z1olb4BCT1911QXh+VlQ8daHfZoZq6mBFayTdNQft2OSU6FvtanU/TTdC2BCXYGpZtS8y6O7qYmtWL8K9aAKWQRmqG8eG0lpdqpYK5Z7W6CHHXFn2f1mgbigCNbRJ/9+kWAwPWiLU2qBPd1YQ96ObCRgCqyN6z1vovN0EhN4BFD8QdMDAeRWq0p1S5ZbQrPy9XnEpO1PbMeDTRgEmFHsCfJxoT0L9cm/1wYb0RrnH6iN7y7qfDOLYKZEa+GGsJT0vv55pBt6YnHM5OrpwhrJ5Um6eDM7gzOUSwFKMYYUe9upFuWic73l+WG/U3U5wuR0JGU0OshaFdYRBGvl9wgHD3yRlN2ecRqtGp4TugUF/H4MGLHPQcgKX8H8CGKA9fOPKwR5YSx1hnpYQrPIagKiP0iaObp52lMPC3DZiz12uUPPtpUhKU/XpxGtty9fnvs16Tan35XE0zN4fHdK9fL/hDwP752nMdhXScMei1/T2wMs6VTUbD/vwQgyVXHXO3V3wux8D6xI+/QsquRfj0mZCcpiW4msu29yjSaCNh/zVow77+aCFcnx
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(39860400002)(346002)(1800799009)(186009)(451199024)(82310400011)(46966006)(36840700001)(40470700004)(54906003)(6512007)(70586007)(316002)(70206006)(110136005)(450100002)(8676002)(8936002)(2616005)(4326008)(36756003)(40460700003)(41300700001)(82740400003)(356005)(81166007)(921005)(478600001)(6666004)(6486002)(6506007)(40480700001)(4744005)(2906002)(47076005)(36860700001)(86362001)(336012)(5660300002)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 15:05:49.7430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96514747-3ef3-4e1e-5133-08dba321457e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_080627_885386_DA0A3FF3 
X-CRM114-Status: UNSURE (   9.50  )
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

just nits.

The 08/22/2023 14:56, Mark Brown wrote:
> +3.  Allocation of Guarded Control Stacks
> +----------------------------------------
...
> +* Stacks allocated using map_shadow_stack() must be larger than 8 bytes and
> +  must be 8 bytes aligned.

"the size must be multiple of 8 bytes."

> +
> +* An address can be specified to map_shadow_stack(), if one is provided then
> +  it must be aligned to a page boundary.
...
> +5.  Signal return
> +-----------------
...
> +
> +7.  ptrace extensions
> +---------------------

section 6. is missing

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
