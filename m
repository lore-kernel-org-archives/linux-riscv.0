Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC6FC27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 05:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jciVSVOeil9jNcf2cY7oxrMNmv5IFJwhbEJgzN7F6f0=; b=sqR65A6jdtwpI/
	RyGtLNUjEiXxn+bqJTHhPEDAOIwXyHUQExN5I9+Gw97hWH3Re8KhQNbhD0NUTIwAbDECUMYT0VbVW
	nq+mifI9/W3L7aL8e/IT+z9Oab1x0xuCW7pyUpdVMxJEl8lbcZeTwVpVuCKK/eeA20Px11WhELZNN
	kbppOy4D3WUeHAYBOV78ermOhH/VZejLsB3CVWzdEYm838gqUCDRngW06WbQG0KOZvlFU3DIzK0hI
	ti9X42RQm9J4YJ1JDsH7RVIr7mSvMqH/OmG/kgnsj8fmzEvwdsreI6+2kdt7BSgfztxTZR2vGyDIR
	kwEd4uFfTGGDYzJ09h9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHG8a-0000000B5nZ-2GQG;
	Wed, 12 Jun 2024 05:03:08 +0000
Received: from mail-dm6nam11olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2c15::800] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHG8Y-0000000B5mx-0FoE
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 05:03:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLnGJSefuzrgTlfkjvRMhIPM/vRf5qES2BV7dAo4679D7W8ql1p1c8CNdj2Z0wboMTc0blyUiDSZOxGxNyIfoCqkZVFs7Unuf3M/pyCgECoPSt9nucB4aV4bhraLewqVy8daLcOLSH4SSSYWQPSaj1ZpPpFenHfaJfsIZG/ujEsLTAwEMwXoGoy6VwgjR7bH6eDtBbD6NORpORwwSqpT7ly4/6PZ9Mn5xDCrfRWyQ/ROrhynuKnWatdEJ/krjVghx4S5QRnYd43WPvrm9vl8qBf8/FtZecFCbbghwpQw+xyQn13THRf/MfqA+eYjT424fvxVsqc84o9FzTtLQlNiRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFKv6QnuP10CTCd02udQUEEL9HKsaIiLGoiRE/5xQLY=;
 b=leEQFnJiemsYuHvsfV5jm8p44iev88PxhrVqwMGB1UQ1RUHmpshR0ci5uWnXkyzp6luuUCuAfnocsoQvS9BmOTKAgqFoc1CUijOy+YTvdaGit7FmhnZt9mcHs/kLVZBnEHWAGatqa7R4J7pnH3W2gxdf/NU1tXOkCaW5rtvTY6exLGDDLKYQMQ2Yg1P67KvSPqRZNfFCDZ5G0iJbd/+93iFhy82RMUhx9UP33Wqw+673j+46FEGPSIXC/qFB8Dsiq0/ZnlLmkE66XfaIhjvCnGsxa9Tmcw5MZuqyyhdUwwwqaRHwr5ucNKjaoyNIVTx8QCyIVWGB0jGB9LaLYFwGnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFKv6QnuP10CTCd02udQUEEL9HKsaIiLGoiRE/5xQLY=;
 b=IfXUYS1f2WZk+/r7PHBMw/UP7e5xkA1BIyufpGRmZkLoUEC6JKhjMYlbjOW/kiUa+L4hX22rKFAabDJdKtMg6zL71mk1UPzUQGOQklcWfU70/AX1Q7OmlsrRSNxDJsoGDQXCvp2rWEi7+vsYeXEi0Q+9ypQOPOr0UwM26Q8G2LTa/H4I2uYT9Y9QBkwLNGMaQ6oV61ATutgCSauMCZtS4Sm585IkmFA26AM9ikF0CYcTYCqf/5kBkAgDG6CtmhI5p39enO2PrPk0HzjfLKb6DjeRK8g7HBBLNcE7dIdGjUhBxrz1igdzUUTc7XkhC9A4lYQHd+fAypeE2WEwxsYjvw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DM6PR20MB3347.namprd20.prod.outlook.com (2603:10b6:5:2ad::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Wed, 12 Jun
 2024 05:03:00 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%6]) with mapi id 15.20.7633.036; Wed, 12 Jun 2024
 05:03:00 +0000
Date: Wed, 12 Jun 2024 13:02:31 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Jisheng Zhang <jszhang@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Chao Wei <chao.wei@sophgo.com>, 
	Chen Wang <unicorn_wang@outlook.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Inochi Amaoto <inochiama@outlook.com>
Subject: Re: [PATCH 0/2] riscv: sophgo: add pinctrl support for cv1800b
Message-ID: <IA1PR20MB49530084D4517A42CE0556F6BBC02@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <20231113005702.2467-1-jszhang@kernel.org>
Content-Disposition: inline
In-Reply-To: <20231113005702.2467-1-jszhang@kernel.org>
X-TMN: [TqeGbXL6tm4W0h2yUT2cDn7PKlfwU05QN4WwpEP0mgo=]
X-ClientProxiedBy: PS2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:300:56::17) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <sbxcazj7ymzvzrwrsmfnq3vhasrpsrkqpvkitarxld56uu67o3@bsva6u5ctyih>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DM6PR20MB3347:EE_
X-MS-Office365-Filtering-Correlation-Id: 16d8bc40-7f13-47de-81ee-08dc8a9cee32
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199020|440099020|3412199017|1710799020;
X-Microsoft-Antispam-Message-Info: 9EHfD1X1xfAWbe2AsulPaqyY87rXtTOizmyqIS5mAL76E5X5VD6ORIrgW2z8eyUON5bEIVTkSMOxTn4hCIQkO5OTnzIu0h1JD8W9oAuOMOaVIhMYOQ5HnrVbuQR5oCbbyeTXKWT32ycnzGRIrDveHTqYbZL1uFuyZAF7PrXBgPnOFns03lf7QgrRPyP8a+GzBd4NaWXLXo5eOvuiOhtDhOyWY+KOJMawcLo8RqtPxIW1J/KvTaAlv9zfkmxnGsOR7YxzQvLuXJ1Lvq9mn7zF7hIK8Dwx3lkD6ylkbXEY4HlsFHxpKj+wIcliaCakyKtkkceblsbS+8YoZ/ORjV7Mli0J7p2sxJAWSl0ipKXEAZ0FQn1qbGS23P4fMQL9b2ogATZicBfw8dtTF2SAEQiRHOtI46iVUhrQfmWnWPaEbvQ/O7pndkVddjlF44t+oeul7GFNuR5pEuoO5gwQi9/113GyTOj1KCM3LVQx9/XfMkEnzBOX0mNdmLJh36otPvxauKQsv1rgUP40BZquKqMPoepgzGBwxcnG/jqVDSIMc22QDMjguJInC2B503fLM2MWs9Fu9IkoZS0+8Y0RobL6M6FTUMWRleClbFHOXOYdUEiX9oLJT8N1fhlxPKzgQsDx
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y6Fx9icOfE0HBrO3lVB6yTxHcBcE6iVyRDcuG7bzgITNTVszNZBfmG/RfJPJ?=
 =?us-ascii?Q?xVfznfZJWU6D74iH26zIiFaaeM9q+J0pq7Miws8mzb4o3ct2ekvgwhIoX5kv?=
 =?us-ascii?Q?CJkZUIWnrFLb5d/ze0jUldVDo+pAhLdq0Aac2a66SgN79B3chXSSyKFUwZEr?=
 =?us-ascii?Q?GGqvueKQmQB2wKjlws/98oes1KrApCJGQ+oH2mE4C0ix/X9PmB8eWRpLBl6i?=
 =?us-ascii?Q?LB0GCpG1vZ8cBnOdBqYrnTHI3sAW0TUK+qn5wN9eY2Fjqnrr8p6YFioP2bQ2?=
 =?us-ascii?Q?4u90KMSNpSw55+WQ5vrEo3wvai94Bp89ydoy3RZyflrfxdEQNad64iplMRik?=
 =?us-ascii?Q?Jf9AHbuAk4y7XlLwBqjcZ9tBSeFhmImyZvouEwV/XEtmm8gziBZHZ9q2+OFX?=
 =?us-ascii?Q?u+T31DCtFlVtjU/5DLvuG9qu3SvTI8oga7Akhec4V6jpoB27KCmy2fODRyIJ?=
 =?us-ascii?Q?lzhpDLB0dH0otZQ/StNLV64BnZy+xU4Lt9nGkDsJvdaaNrxyro/OYxGYDva6?=
 =?us-ascii?Q?3QN6+bzHCb6CwsFRAx6deiuxUOxLfVLKnk15AQEwzfSQqeBJQrvfpHrgTyBs?=
 =?us-ascii?Q?kDO6ta64uxstgFXJFElOP1hmQ2S7GXe9KDef2rax99Kq5N6Beep3Y+N/o3kh?=
 =?us-ascii?Q?J39Ik07YR0fSpG3WrjGvFR6dLrTMMZlmxB9wbXIEEOZwtnk8D4nuq3eENgbu?=
 =?us-ascii?Q?bwScZdjBKrDIX52UFFoch4rmuz93WrRysE56+QbeF2+YQk+2QT6pmyvcMrxB?=
 =?us-ascii?Q?7q7W5nfJB3/cdZOyAkCfi40vGFg8Wad3VskdOnc0oSXPqFi1UUGVn+uNv1Qk?=
 =?us-ascii?Q?o9HwQuIgXihvOA1y/73SLLUzA29JIt0S6/I4YNDQXmtt1/L5CXH4yhks3fPH?=
 =?us-ascii?Q?851jqlySwgnzEbsFvcGiptoc168DlQvgkuXiDT13M1IivDgtr8TegIv/uleh?=
 =?us-ascii?Q?AeCHAccv2S4PxlEe0IwVZxS/3pdZoL/8UW0ALTqCbAaGKgaJaDNBfUbR6Otv?=
 =?us-ascii?Q?whSAYODyU1Qbtdx+AESKOtLWnKk7h6OQc57ExZfLyHoc9buFNhZiML56Grcu?=
 =?us-ascii?Q?A8fjWjsHfMPEjt8EHH66f3U3YqopB9Q46edhZTSc2y5eYqlYKzmZfjWI3RVd?=
 =?us-ascii?Q?TVhGTJ5GvtqDFdLuqbJNnqYopDYdVqhgHPxF9Rcc6MkjxXxZXf2vCpXXWXAY?=
 =?us-ascii?Q?WRIf8u1+uxwIKlgkXIgB3peLq2pqb2x8ziRZ0EWst6OcD3bypzUZKs3LEiJc?=
 =?us-ascii?Q?9vEYAyvi8+SANxYEILUP?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d8bc40-7f13-47de-81ee-08dc8a9cee32
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 05:02:59.8716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR20MB3347
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_220306_219486_6CBA2366 
X-CRM114-Status: GOOD (  10.24  )
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

On Mon, Nov 13, 2023 at 08:57:00AM GMT, Jisheng Zhang wrote:
> This series adds pinctrl support for cv1800b reusing the
> pinctrl-single driver.
> 
> Jisheng Zhang (2):
>   riscv: dts: cv1800b: add pinctrl node for cv1800b
>   riscv: dts: sophgo: set pinctrl for uart0
> 
>  arch/riscv/boot/dts/sophgo/cv-pinctrl.h       | 19 +++++++++++++++++++
>  .../boot/dts/sophgo/cv1800b-milkv-duo.dts     | 11 +++++++++++
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi       | 10 ++++++++++
>  3 files changed, 40 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sophgo/cv-pinctrl.h
> 
> -- 
> 2.42.0
> 

Hi, Jisheng,

Could you rebase this patch for the latest kernel?

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
