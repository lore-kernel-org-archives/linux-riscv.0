Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4557C282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 11:53:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A20B2222B5
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 11:53:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t3mjXX3g";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="aDcvDnlF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="disqatNf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A20B2222B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cGMibF77PbfbE6p4RQVggLIRVn6NtWWI9JULK2QLb/0=; b=t3mjXX3gb4Gvw6
	IzC9ieFqBptM87+R5ugEBdTfoRDsoK1l8RyAFLZZDEMMRbdhI/ayXjCZp+uCS2Zoae+6QiaaVwk7u
	WwbFGwJfxQEGCr82/pXqN7vTNbrtkxYEcpthxEOCYOJGPvOWOmIHAirWZbzWH7EiUAYv1LAV7ZbIY
	X4zheEjonAkRDlG+rGhb/DVktgA1/XJlbcxqSESgdcK/follIEoGg3WuTWtXogxycHCiNKG3QxIXQ
	NOufAs3w0/YF0yjNa3ws/c5udWInFROK8Q2KPqaWc2TZZxXcoAjVeIAMsp2cdAoRP0nS8TMXFYKf2
	lUsmSy7fUeZ9aB7c8xxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtt6s-0007ZL-9T; Wed, 13 Feb 2019 11:53:50 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtt6h-0007MC-SJ
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 11:53:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1550058820; x=1581594820;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=n4HsWbY6PtWEOqNkL+lbNCKI+vn6uFaeg9En2ez1jGc=;
 b=aDcvDnlF2Ie9jVCkUJ6tLU9fVzfBPPl4NJIfurF6N/V5YHkUNKlKHKw3
 ss/fuy1M6C313zJcvxlQ5u4Mgg3WijQClLovFlLn88mQwyqY002nBRuYr
 fTYJrxMHu9ixphgLxyF5s9HovCmnfZmfYmyUV4M57/o2ZKG2PnkMhnBet
 XqsME/CvXLEgxSImgqIbZZcFdJbocRCHeTbct8mX0zFY/zIvWAmaSepGN
 sJRytSTnN8gbl4MYUCt5/TOx1JVkFyk7Zf1cqpNKYFp7vVwcTXXoo+XUZ
 hVfR8Gx4nfW2X8BUAzocWXVaghEVOMgTcK/8k4PngDXcBz+HSLr2kJKat Q==;
X-IronPort-AV: E=Sophos;i="5.58,365,1544457600"; d="scan'208";a="102883416"
Received: from mail-dm3nam03lp2052.outbound.protection.outlook.com (HELO
 NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.52])
 by ob1.hgst.iphmx.com with ESMTP; 13 Feb 2019 19:53:30 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORjdPgfjjiHahYQCWRdYiHhyvcQfC6xEio27FLv5DQM=;
 b=disqatNfLygF/hqbIljSnhHcvlecBa5QLQ/fSN/nUxEt/+a9O3MbcCU0w5Bxg1LIMSiuoJqQmrhpVewEe/jv2rshXb3M4KKakJhWE8OTb692ugpJi2XGwRYwM5eFNSs4sHUcPHWJ4BrrCQIKQgnvxor6nmCq2yFZqgaJQpPKC38=
Received: from DM6PR04MB6059.namprd04.prod.outlook.com (20.178.226.89) by
 DM6PR04MB6171.namprd04.prod.outlook.com (20.178.227.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.19; Wed, 13 Feb 2019 11:53:28 +0000
Received: from DM6PR04MB6059.namprd04.prod.outlook.com
 ([fe80::d006:5be7:c3f:ba6c]) by DM6PR04MB6059.namprd04.prod.outlook.com
 ([fe80::d006:5be7:c3f:ba6c%2]) with mapi id 15.20.1601.023; Wed, 13 Feb 2019
 11:53:28 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v6 0/5] Fixmap support and MM cleanups
Thread-Topic: [PATCH v6 0/5] Fixmap support and MM cleanups
Thread-Index: AQHUw5K7Sd9cwkKSdkeSEs3Lm+eGsA==
Date: Wed, 13 Feb 2019 11:53:28 +0000
Message-ID: <20190213115301.103989-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR0101CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:21::17) To DM6PR04MB6059.namprd04.prod.outlook.com
 (2603:10b6:5:129::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [49.207.52.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f46e3c01-e6d3-4c6c-00ac-08d691a9de05
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:DM6PR04MB6171; 
x-ms-traffictypediagnostic: DM6PR04MB6171:
x-ms-exchange-purlcount: 1
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; DM6PR04MB6171;
 23:8uCJuyNc8AhRPLAyZ9hq17lKBfhbduqI6ejON/m?=
 =?iso-8859-1?Q?3yYNqYtOdtzSmcpX2exq5rMu86YvsK0JSbKaufsuXQxYCqVIZdezP1k2Kg?=
 =?iso-8859-1?Q?6fGh7KHPzMKWVOV0913gZsXnE4gSa0uofFNy6hZq85IAZvkokGyl2E256l?=
 =?iso-8859-1?Q?lmbGYLdUd4XHVpcK0iBBS7ceiIlHuZUMUy5M2JadMMiAPt8aQpdL/43R4q?=
 =?iso-8859-1?Q?7v8zhAcnGNqt4MiGsvmWvuf8cGA2+6Y1tXhX+TaCJ7gKL/CeVINne9IFDw?=
 =?iso-8859-1?Q?wzW5QVA+bqd1WythZtZbA5C3Q3hXssIl+oNEhIy3qET6e8FyadjP+/EB+K?=
 =?iso-8859-1?Q?1RQCfzvBhoHCHK63sZjLzkGlspKgXVoJequg2qVRES9bWBDwWPXyovs0wh?=
 =?iso-8859-1?Q?4/SCUjaXf9UjgfiXgrLb1PC7pEYVlNziKO/UZIXdTh9Xy6qKBDvRuXweIk?=
 =?iso-8859-1?Q?Wdra79KFyO8iAQNwoV1IQa7IiOKf0n9hfYcUgAjR54E9gw0XAJ+K1vVhHw?=
 =?iso-8859-1?Q?fghUBSNmhjqjitEQrtlqbIEEH2Y5CqG5kVpSGqz0ob8tevLrmYdlNXmb0B?=
 =?iso-8859-1?Q?r7uRaeTPAYaNvo0hkSVY+tp27YheDAuBTYG44VqcITMYRETZETU/Mx6v6F?=
 =?iso-8859-1?Q?WVaY3i4hH8qwhsE+SYhB10OcxsA1T2bMAK/culHkJIzZsFmhFA+CFPMAuI?=
 =?iso-8859-1?Q?MBsqs0zYpwT6o7AnuuYPKO7VaO/wZ6NTsF3le/+XfZAoRvHr+5Leh7b9sL?=
 =?iso-8859-1?Q?5dN/yemIPQ8VtCM/QAuVrtbVnIPhs2VB7rjgcxAKEj+4mXWYp1bLyWKX+n?=
 =?iso-8859-1?Q?2J+ppi6ymQZ8ZWpJOFpAskXWu/1ecbbEn8XVY61/u7SezerWUlqviZzd0q?=
 =?iso-8859-1?Q?ACDMiOp8ZsEukRsqsaMLd6BTv17H7g7NPYDa5cAPPh7bgJ+7pQ3yOCrRPE?=
 =?iso-8859-1?Q?5n4QYirsQSW9OzWSeqaIykiZasbR1G7uC929cGK75u3i3kyLRSeclUC4AR?=
 =?iso-8859-1?Q?TkEX6cZNeNXgnwz5aBVaOfEdUztzKettLYGWhQYI99sfTxE4ZfYdzrsM8U?=
 =?iso-8859-1?Q?IOtc0mMc8HMiORZZf+PBQT0SAuNodI9t9uT56gSCy8CckwKxdSyuH1OYqD?=
 =?iso-8859-1?Q?6pP9jZIigOR2b7E3ggmNeuPNdFf3P8ENob/ZETjsTsr/zo29qKSmfVFfJM?=
 =?iso-8859-1?Q?gqyuY7emX8YazOmaHPMVZVBgeIwFoC3ml+/0EU8U/prFV14Gt8yDGjm3xI?=
 =?iso-8859-1?Q?6PXO4Cs8y+K75ML7ySHJHvpkWs+zTmk3P+4PLECOygGEhvR0HXFOYFGFS9?=
 =?iso-8859-1?Q?hwRTa1ClURaJWXGtSheuYiC?=
x-microsoft-antispam-prvs: <DM6PR04MB6171BB1CE1B2E39B40ACBD228D660@DM6PR04MB6171.namprd04.prod.outlook.com>
x-forefront-prvs: 094700CA91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(346002)(39860400002)(136003)(396003)(199004)(189003)(54534003)(52116002)(6306002)(4326008)(66066001)(71190400001)(316002)(8676002)(6436002)(106356001)(6486002)(6116002)(71200400001)(105586002)(3846002)(53936002)(386003)(44832011)(6506007)(6512007)(256004)(55236004)(97736004)(8936002)(54906003)(478600001)(72206003)(305945005)(26005)(102836004)(966005)(186003)(68736007)(1076003)(14454004)(81156014)(81166006)(7736002)(25786009)(99286004)(36756003)(2171002)(486006)(86362001)(2616005)(50226002)(110136005)(476003)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB6171;
 H:DM6PR04MB6059.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 05kL4ZpM3b5nDWY6JlaFz+n6HDAsi+GFM+4GrsdW4weZpwuMVAz8XJR5DM7MHJecgKqBcXjA88KB47BWRpoGD9s+Fdbr+LVhSkccTcpNg6F8WoMLe3yrHPfVW7YhP3Gm0/yYEdmQdGJ+voESBmQ3LslhQeWGhuBXYaRvyct0TBPjzH3CotgbOXz+Ss53pLkA4Oq2gH3EUY6up1NNLVZIb4t/QOiOxh/nnYQv/CfiMD/yG6F167hOXCyU8Xn2grgVLzdBK42+CPRLIBZC00OcCUMxIKEEe3pG28Dq4jCtnMQI9mMyKnHTpn6CtlFReCh2PDS1ss/6gQaIA9gqx6D7tosS5A1/wxEllEVDodqEWu6A14Iuq2Cf+BG+FjO0A4WmLb2fPhErm30NPPGTfq9V1VhEcspk0osZ2GPkTzmeFYM=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f46e3c01-e6d3-4c6c-00ac-08d691a9de05
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2019 11:53:25.0824 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_035340_268903_506E92DD 
X-CRM114-Status: GOOD (  14.58  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patchset does:
1. Moves MM related code from kernel/setup.c to mm/init.c
2. Implements compile-time fixed mappings

Using fixed mappings, we get earlyprints even without SBI calls.

For example, we can now use kernel parameter
"earlycon=uart8250,mmio,0x10000000"
to get early prints on QEMU virt machine without using SBI calls.

The patchset is tested on QEMU virt machine. It is based on
Linux-5.0-rc6 and can be found at riscv_fixmap_v6 branch of:
https://github.com/avpatel/linux.git.

Changes since v5:
 - Drop PATCH1. Instead move setup_initrd() to mm/init.c along
   with setup_bootmem()

Changes since v4:
 - Use free_reserved_area() instead of memblock_free() in PATCH6

Changes since v3:
 - Re-worked and simplified PATCH6

Changes since v2:
 - Fixed commit description of PATCH6
 - Ensured commit description of all PATCH use upto 72
   characters per line

Changes since v1:
 - Use more characters per line in changelog of PATCH3
 - Removed #ifndef __ASSEMBLY__ from PATCH5
 - Use more characters per line in commets of PATCH5
 - Added PATCH6 to implement keepinitrd kernel parameter

Anup Patel (5):
  RISC-V: Setup init_mm before parse_early_param()
  RISC-V: Move setup_bootmem() to mm/init.c
  RISC-V: Move setup_vm() to mm/init.c
  RISC-V: Implement compile-time fixed mappings
  RISC-V: Free-up initrd in free_initrd_mem()

 arch/riscv/Kconfig               |   3 +
 arch/riscv/include/asm/fixmap.h  |  44 +++++++++
 arch/riscv/include/asm/pgtable.h |   1 +
 arch/riscv/kernel/setup.c        | 130 +-------------------------
 arch/riscv/mm/init.c             | 156 ++++++++++++++++++++++++++++++-
 5 files changed, 207 insertions(+), 127 deletions(-)
 create mode 100644 arch/riscv/include/asm/fixmap.h

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
