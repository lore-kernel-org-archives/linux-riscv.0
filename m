Return-Path: <SRS0=WRFO=IO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2976C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Mar 2021 10:43:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4766864F7F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Mar 2021 10:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4766864F7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+RxPBxLiKAPQqsIseg1oHWrBdjG03H9D0KA31jhnEpU=; b=oOj3I97NkTdl9tc+beEeRTq3YO
	zOp9ctSCKR2CFrWTvJWjX4qOuE59PAT4HtCJnSSWApRqAQOvqVOFRvHxyyD2kF2UrmNbh31AgNaaV
	RQ9Wy/LNMPLA+4UkvDMS5NV6UrJkrM1vDqc00bEdP3XyXQ/Dff9DcuKTk8rXor9mmtz0GFH9bJSRK
	+SIELuhQpZTYrVf+1uHFdTE+wR51IUC+1nLLzfk+0aT7bBjkF/bbpsfCBncMGLNdGWGQqr0eTfT1e
	A0/748bD8xuD00C4AnMKHfcEpwcu9uTyn4iJKaW0uKehNfCpA64pmNErQg0d9bQhm64/UPLQiuA0p
	lmG/YEAQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM7A1-000R0M-DK; Tue, 16 Mar 2021 10:42:49 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM79Y-000QpM-F5; Tue, 16 Mar 2021 10:42:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1615891340; x=1647427340;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=N5zIhRLYkCREDThRnYT0hmTkQiInVHuBNuKMv1X44MI=;
 b=VtsaXDzO+SU6IC0+hDNTMv30lBt0Cd4Ke2tJXI5UiJFRsZf8u4tY2041
 kkeDgg42fPv6RbVN7MwxF1gWotp95sXz/FvBDf8qMAB+eA6swrSrnFYZz
 wJVaC8S0OuFUtxpvOb61P/dM7iIUL7RiSF742EV/dzh3X4qW63yVV7jAw
 6SE7tpG71esGNZHe58jotcmn+z31PPeFn++Zh6MV5bW/47id/6NHtv/c9
 3QnZliuvZ+IIJAbiP1xZztB1VLTk0eHJA4CFR8GYapFGWdD2KJLf/Nsha
 QC0OMUgQKOCmbmJycCxZ2m4H1m1QfU5nz6vQiEbJALwmY2+xWw3/vE4kZ A==;
IronPort-SDR: BkSvWF74mUvEMaeS3aoJd9kEdiRDEftgveSGw+bq18xDCn7dK7ix90asP2xxJfNMIwtku8Y59Z
 1cccaMVcNc6BV/sME0gfk7R+v6xPiiSK8ZVRZoQiT+2pzdhaL4LGSLPXKbjzuXrIS/9VksgwKr
 htG7b7KISiw0hzCD21baqhaYmjlfJFw0ArRUjR6eZvEBPYhWFr2zVB6QQOJfT1oOwGxwt8FO3c
 o2rbOwdb2K5pRXwZfm/LwG8b0W5DsKuMaqk92W9j7hVxfCTKl33tSeWXENWhAdXi2QhGmrE6es
 bjA=
X-IronPort-AV: E=Sophos;i="5.81,251,1610380800"; d="scan'208";a="272971720"
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hgst.iphmx.com with ESMTP; 16 Mar 2021 18:42:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dEb1I+00fava8IyI3uP3rkrGp/hRsXR4g4mZZkTucIijT7v3O0qftlWMuafXXeQVmVpU7eA9AbMp61vm0N2ctQf22lU52lgDKL7vbgHCciLU6VRBGw/AobZJkss/bO1h4rPsznq+VjwgjAhSSClxzlEgbzMUOcqOUqtuEWzHve3zWJC1LpeO93RKFHlzMMnbFJ4jF+aE61p2EA2sslRCxRK3XJjy/W+kfh0W8u4POhO3OLUObf97bWmT18wxmAseecV5e9HMNLUcT+56MF2TvvSNjghUn0f5MeJOg6WPKcCfDsyl2OUzePRbSqWcYcJXMZ39RrY2k3xnakxQQBj61w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIZ2lvYIKlcBMPnaCb3UtxuRffPA1IZZl7eFg1BKYrY=;
 b=Jo0m65+XvCYfeM5Js3BC9c7wSzbdge3aLsAk0LhB3yYPZfe/rjx9FDT0aI0gtnGJvOyEEHO4/1kc+lGsrl5pa+P76MX+ZNoaYLVeFAxGPF94x7NzazvYuUuwVMUIgxeyhKcm+lo3RZ5vaJyuzy9yWDxBm3m6TiojjB6I0NA7ztCdyy7D7O24IrkdE7+TyyBlbmbS9yX6PMiYz/2yJd+BjowX3RyFkagB0V4mvXtg3WiYlzkFTK9RhojScph/t+DiVGign56L83DzZRyW9ERLlDUe4aErUOTTTYroaqpQbFJb6/EhFVOqXycS6kfNkj1ZUssG3n61SZ6cIk6SrLKY+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIZ2lvYIKlcBMPnaCb3UtxuRffPA1IZZl7eFg1BKYrY=;
 b=v8KIWoziEJhlUIpD8367sbCS+5E9b6ulTLh82fGqBan1IReFBQ+ANa02sB9/gANOwwduov7+6xtNFfIVCk6oWfdBvOWf1nlucrqnc8nffnXL5eBXgzvefHLpEoX/VnIZAixWu4DWlb09CtTGW+KlECgTK/RyM7ve4gjc1jUzvcs=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM6PR04MB6377.namprd04.prod.outlook.com (2603:10b6:5:1e6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Tue, 16 Mar
 2021 10:42:09 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::38c0:cc46:192b:1868]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::38c0:cc46:192b:1868%7]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 10:42:09 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>
Cc: Sandeep Tripathy <milun.tripathy@gmail.com>,
 Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Liush <liush@allwinnertech.com>, Anup Patel <anup@brainfault.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Anup Patel <anup.patel@wdc.com>
Subject: [RFC PATCH v2 0/8] RISC-V CPU Idle Support
Date: Tue, 16 Mar 2021 16:11:32 +0530
Message-Id: <20210316104140.878019-1-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [122.167.218.45]
X-ClientProxiedBy: MA1PR01CA0136.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:35::30) To DM6PR04MB6201.namprd04.prod.outlook.com
 (2603:10b6:5:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.167.218.45) by
 MA1PR01CA0136.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:35::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Tue, 16 Mar 2021 10:42:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a5590ac3-024c-4c1a-cb21-08d8e86826ac
X-MS-TrafficTypeDiagnostic: DM6PR04MB6377:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR04MB63774F1D767C27797F80FEAA8D6B9@DM6PR04MB6377.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NKVig8TkkfiJgCeYoedVOxPHc7shZksFTxZt54GwawiWdH+ao/8kMRjq4DbqtdujdYZSVmHxbUbSMFjVK1+s2m1xYtR6tqpiAyxr8gJXZWdIyEkhwM2gQVrfv/Aj7rQld0e6G0PHS931AGEq5hNyDOEMHdTfJieOIfQLzG7bmpLnqrZWH3d+ggn90o4SGVLx9vd4H39WaDmcF5U2xM+jG9Vfil9A3MHfBiNZ4dgNAHCgdpiPbn0msnWt+7lhRZxtf/KivEtFKn30rQDAxOkxukrC/tS9tSgaCgdyQCm9O3D8yc0AP+p4B/q9W8Mgv6TMGRNoSnd6kjaiaQg0TyohyoU+AmVshB/FgpfdEc1y8YjOFqXH83wFTw8aR1bMn+QjuvmrK7oukjgIvLnkkUTIQ436ePieR2DjTMylOLyaDI1bjILJeh2bgwgjdKNjzoC28un+5tsP+mKbTdwHxDdp4AhuvdSSE0u/p2dAZEwBd5q3VV9oJk/yNX2kiroSA4spBvtSNgTUyaJ5PjAdgsjO/4/d3LeEKr9tum5rqvtV8W8PvMEcuIOYGBdUP2O8qSWix5lJrW63OW6zBYh8yCyVprESuSLJ3H1Laxqd8k699fndf/JlP5ZYiWM7XLfto2LGOZkjVBPfb2sDi4gRnrj6QA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(36756003)(44832011)(52116002)(86362001)(83380400001)(110136005)(7696005)(966005)(8936002)(66946007)(8886007)(55016002)(7416002)(186003)(66556008)(16526019)(66476007)(26005)(956004)(2906002)(2616005)(4326008)(6666004)(5660300002)(498600001)(1076003)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?TkyIQmBIQO1S2JlfFqvigcautQnSANzMECRRkwHyfUcTK3A6oDUFb8jBLeFD?=
 =?us-ascii?Q?wyp92JMtYRQOCVLS4zydk/yIRrInOxjnrowSGjUALAWYG2ks6QtcQFRJ4ciI?=
 =?us-ascii?Q?/iaRRs+cPHFaBtwu2BwXEBa08N4l7rt8rFqjDDKFPTys6LMaYdP4JlE46EZ3?=
 =?us-ascii?Q?53q/0EMj2dlcVZ3ztF8tzWEN51mzuPINIHp5Q5L7YaSIMudFfNyeBTYxVPtQ?=
 =?us-ascii?Q?2BoSwaZuc01+BiK/SzLsXVHwwzi6iLGla0aB48e7kRf3ztjZ+7f8viDzJELn?=
 =?us-ascii?Q?qakbx0NYTRCqUCvzZjhwKpsh0CPDCaJDvZQ/z/lAA4YFp+irqOQXflKMxKgW?=
 =?us-ascii?Q?0T3d1z0v9yZXLMZSAldAmtoZD1E2lHeewboghlQNohtacYV2PB08h1tbAkLw?=
 =?us-ascii?Q?FL0JKS2h5thyH0SYaLfDIS1uL1YUz4Jx7KXoUb10Acch3ANGAvDpcfvU/fNX?=
 =?us-ascii?Q?RQFNassl0elZknPGIlmrCtmU5cAVkAB7UBmnkkC/XQe5VDhDQlsoYTfG3nd1?=
 =?us-ascii?Q?mG9tL6REuXjtsw5qQ9tCkrhN8gGY0twmn7nchdp8uZqi8SIT6JZKHAmKoo8P?=
 =?us-ascii?Q?upHmcYC829D9+N5jTk/rDsrXs4cmoZyW1Z3qPb1wAA5cbaNKlkIhLOQLbtUf?=
 =?us-ascii?Q?9YQ6tT+uoAAVM+7VZc2+VxYeo2w2099Z7WJ4lUySi6TCfOH2JRwl+jbCx2ge?=
 =?us-ascii?Q?Zffx0132LAcPifZv6ePLhCjk2NB3SDqOETQuBBRcX6lC8dyKY22GGg2cqPC3?=
 =?us-ascii?Q?zf95vVtbDt4y3nvcv8Msj3DzDtqqjDOmLF7ehsXkupKjbYXXDBEtRhkgKd+d?=
 =?us-ascii?Q?2IVR0XNMK8cJwj/Zq9pUEb0vV3k7EBBY7PJNKN1XPaXU0Q0f551QeoXb5uX+?=
 =?us-ascii?Q?/lqQjZEiqvTqORyf7KWRHYJvbhOwj0hbQJkVzpugVUFgCTvbAp0V8FDxMWGK?=
 =?us-ascii?Q?9vbkSZ1/d6eix9IOAGuLMZFLkMJ2hBKYGQaqiAUvhiDnZmtSE3P0bv0ZJzxT?=
 =?us-ascii?Q?xnClqBTiCimSm+9BkYMHDm+Rn0c+ggNCCNfAwUvbfv6S/hw85c8k/db7fqdx?=
 =?us-ascii?Q?A2+8IToby4pqDxtmPTNSLzmJAwbbBJj5eiudQ8yE91kMv1IlZZKsxdgXyZgT?=
 =?us-ascii?Q?+/lnNUhsawteqbRXI+bM7tDoc2qOEn+OmnYfM3Z9Jqvse7/oZx9LxYDBzz9n?=
 =?us-ascii?Q?mQW5TvG7BetpCkDnENHHtnlJ865ifbC9LisZN7Wzqwjx8hg33BKS30ycmPSk?=
 =?us-ascii?Q?P+0sd3FNW1D7rhlnb/84QHSstBoVmKxWoQN+hw64oamWKk/58hp8i0UxsTbq?=
 =?us-ascii?Q?/U/ZhrEMC87y1abF3yCqT7By?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5590ac3-024c-4c1a-cb21-08d8e86826ac
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 10:42:09.8494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qyQC4ONe6kOmxz3ZMnz/xGeLrLFGEIeSlxM163+a2PyuAughux2+v/hdbYMnnxHTUHldymaNAk4t/+SvkbT0VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6377
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_104221_056741_27DAFF17 
X-CRM114-Status: GOOD (  14.78  )
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

This series adds RISC-V CPU Idle support using SBI HSM suspend function.
The RISC-V SBI CPU idle driver added by this series is highly inspired
from the ARM PSCI CPU idle driver.

At high-level, this series includes the following changes:
1) Preparatory arch/riscv patches (Patches 1 to 3)
2) Defines for RISC-V SBI HSM suspend (Patch 4)
3) Preparatory patch to share code between RISC-V SBI CPU idle driver
   and ARM PSCI CPU idle driver (Patch 5)
4) RISC-V SBI CPU idle driver and related DT bindings (Patches 6 to 7)

These patches can be found in riscv_sbi_hsm_suspend_v2 branch at
https://github.com/avpatel/linux

Special thanks Sandeep Tripathy for providing early feeback on SBI HSM
support in all above projects (RISC-V SBI specification, OpenSBI, and
Linux RISC-V).

Changes since v1:
 - Fixex minor typo in PATCH1
 - Use just "idle-states" as DT node name for CPU idle states
 - Added documentation for "cpu-idle-states" DT property in
   devicetree/bindings/riscv/cpus.yaml
 - Added documentation for "riscv,sbi-suspend-param" DT property in
   devicetree/bindings/riscv/idle-states.yaml

Anup Patel (8):
  RISC-V: Enable CPU_IDLE drivers
  RISC-V: Rename relocate() and make it global
  RISC-V: Add arch functions for non-retentive suspend entry/exit
  RISC-V: Add SBI HSM suspend related defines
  cpuidle: Factor-out power domain related code from PSCI domain driver
  cpuidle: Add RISC-V SBI CPU idle driver
  dt-bindings: Add bindings documentation for RISC-V idle states
  RISC-V: Enable RISC-V SBI CPU Idle driver for QEMU virt machine

 .../devicetree/bindings/riscv/cpus.yaml       |   6 +
 .../bindings/riscv/idle-states.yaml           | 256 +++++++++
 MAINTAINERS                                   |   8 +
 arch/riscv/Kconfig                            |   7 +
 arch/riscv/Kconfig.socs                       |   3 +
 arch/riscv/configs/defconfig                  |   8 +-
 arch/riscv/configs/rv32_defconfig             |   5 +-
 arch/riscv/include/asm/cpuidle.h              |  24 +
 arch/riscv/include/asm/sbi.h                  |  27 +-
 arch/riscv/include/asm/suspend.h              |  35 ++
 arch/riscv/kernel/Makefile                    |   2 +
 arch/riscv/kernel/asm-offsets.c               |   3 +
 arch/riscv/kernel/cpu_ops_sbi.c               |   2 +-
 arch/riscv/kernel/head.S                      |   7 +-
 arch/riscv/kernel/process.c                   |   3 +-
 arch/riscv/kernel/suspend.c                   |  86 +++
 arch/riscv/kernel/suspend_entry.S             | 116 ++++
 drivers/cpuidle/Kconfig                       |   9 +
 drivers/cpuidle/Kconfig.arm                   |   1 +
 drivers/cpuidle/Kconfig.riscv                 |  15 +
 drivers/cpuidle/Makefile                      |   5 +
 drivers/cpuidle/cpuidle-psci-domain.c         | 244 +--------
 drivers/cpuidle/cpuidle-psci.h                |  15 +-
 drivers/cpuidle/cpuidle-sbi.c                 | 502 ++++++++++++++++++
 ...{cpuidle-psci-domain.c => dt_idle_genpd.c} | 165 ++----
 drivers/cpuidle/dt_idle_genpd.h               |  42 ++
 26 files changed, 1229 insertions(+), 367 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/riscv/idle-states.yaml
 create mode 100644 arch/riscv/include/asm/cpuidle.h
 create mode 100644 arch/riscv/include/asm/suspend.h
 create mode 100644 arch/riscv/kernel/suspend.c
 create mode 100644 arch/riscv/kernel/suspend_entry.S
 create mode 100644 drivers/cpuidle/Kconfig.riscv
 create mode 100644 drivers/cpuidle/cpuidle-sbi.c
 copy drivers/cpuidle/{cpuidle-psci-domain.c => dt_idle_genpd.c} (52%)
 create mode 100644 drivers/cpuidle/dt_idle_genpd.h

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
