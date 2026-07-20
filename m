Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7198C4451B
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 09:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=murH3LIhVEreBWPO3SlpoWPMW5klhmEonYbYYnFFEv8=; b=1oYlBkIbnoARR/
	0Cvwaryot9vh5klcquyVLnMVQW/ebr50Byn55SvLrzk0zZ1h/8KbLH1ky+GBDhDcIoTE447FdLRuf
	G7BtO4e7IjqFMfKF9AVSQBd/ZESKYq0csNVlRxwSXXudSYYkXwl/NSX0c/e5Je17awxXSz4MMH99R
	dZWbp+9N2iPxlToS7nhCV8Z0aX83Jibn2dnsWSZU9ZnkayxZNKjSUXSrZFwZWaV4OYJmPP1+umBux
	uG2A+xVxJS+Dz0nmmnqaMDUksEZ8wW4yI9Wjy5zOAKHgsh1tJGbW/RmtphTDZgv13+MR/Sa9q8bHC
	05XzfMNSSM8cFZ83o/UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkS4-00000006LCz-2pmI;
	Mon, 20 Jul 2026 09:38:20 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkS2-00000006LBj-2Zy5
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 09:38:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CoYfpADeF09gqPUI6MOhrnMGCDtgewG+dZVGNsjdmwXjnpPIRYST+dVNhEvOSbXuNeoJSQdOfTn9S/3Va3mQXipV+Kgt1wdJWsaBULhU4/qjhUbBj1wFoEMUC0/uztTxhLAiyMNS+sw5gVz5P6TIuHAtM1thi4NI9zzBweIRofI3stjLCD05vsSAapQlDCEUTJXLpUAwnySdBowvSfTLSlzUhEeKI1Ht6b2SnFMK0wy1qtvFf+RrHWCzJjNjX9U+ohT2mfL9q9hrWecRqXt562JFbuep9juHHftTxNiN3FtAPVnwzH9rN3kAFa7zBcjdQC5azDtqBHeRsQRwQ2d7gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Y4Hea6DLgCH3wmYdHi0DHjDOICOMuEMBxXx781GU8s=;
 b=GA4MRDIhOj8xc+uFk5koCICEcDpX8pprVzoCo2Krjf8gq9ZJad7hq+DormRG9tIkxtZUnKWSUumUiMYD7Y1o7plij81G1hcLcHz8d1mVrjOPgDc6rLcdGyBD/jA9cr5ZBBuS+h6nrMk2lWBkBcIMbny2wfriOTSPWmDrxFb96d3WxYIMm1UL8leVgi5WC0B7LJYb1H8SD3HSnTCWAZ7OetGOHh1639F6WANplXZT0tp45NqHzvB6GdwKm04w0osa1lYWHHe/R72atmOVLdLU4BzikfNsCpc/DPh8+jYLqTgVM4QzeTTmWWgN13BaKYdhTmIEL86m7zOXZ/nrw3dOFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=transsion.com; dmarc=pass action=none
 header.from=transsion.com; dkim=pass header.d=transsion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=transsion.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Y4Hea6DLgCH3wmYdHi0DHjDOICOMuEMBxXx781GU8s=;
 b=Ahbf0TWrMh4yOirZiZmzVKvJE3mkvIgI5JiMithzI56o4Lzsah/n08vPXIHII0F1FY9HuWIiRh27Xjl/iHFo6NymxyNsgba1ymxE6xcFzSJM9S2FxhGcDUfBdj5QKl95Btvq7YfNbZgSR62nxaJCQGB/A7CfXmgJCZiwj6TjY/8=
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 (2603:1096:820:c7::13) by TYSPR04MB7923.apcprd04.prod.outlook.com
 (2603:1096:405:8f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.6; Mon, 20 Jul
 2026 09:38:03 +0000
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3]) by KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3%3]) with mapi id 15.21.0245.009; Mon, 20 Jul 2026
 09:38:03 +0000
From: Hongyan Xia <hongyan.xia@transsion.com>
To: "mingo@redhat.com" <mingo@redhat.com>, "peterz@infradead.org"
	<peterz@infradead.org>, "juri.lelli@redhat.com" <juri.lelli@redhat.com>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
	"dietmar.eggemann@arm.com" <dietmar.eggemann@arm.com>, "rostedt@goodmis.org"
	<rostedt@goodmis.org>, "bsegall@google.com" <bsegall@google.com>,
	"mgorman@suse.de" <mgorman@suse.de>, "vschneid@redhat.com"
	<vschneid@redhat.com>, "kprateek.nayak@amd.com" <kprateek.nayak@amd.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
CC: Jiazi Li <jiazi.li@transsion.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: [PATCH 0/3] Remove deprecated static key API in scheduler code
Thread-Topic: [PATCH 0/3] Remove deprecated static key API in scheduler code
Thread-Index: AQHdGCt1MgU70l3+6UuRJEnuTS3haA==
Date: Mon, 20 Jul 2026 09:38:02 +0000
Message-ID: <cover.1784538478.git.hongyan.xia@transsion.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=transsion.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0401MB6196:EE_|TYSPR04MB7923:EE_
x-ms-office365-filtering-correlation-id: d5709c3b-af0e-4bdc-0ab8-08dee6429849
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|7416014|10067099003|56012099006|11063799006|38070700021|6133799003|18002099003|921020;
x-microsoft-antispam-message-info: 8d3Tga55aPULXS0MTINFb+JIVCGs3vR2Q1TqhkVn9Zis/pROuD/rKPy0J8Bzd2lB9iGXw/OduSAn5PKTt7e4h5y1n7icimzTieiIVQUF65Y9QqEy6+2brnM3LCR3XxU4o6zZo3PTXHYY8EQnZOgr992aMlPIv1JyhxV+dj4IIFr9pTjLCtytdqAfk4rlQ/Tq8OeoiN4GPBtmiSl0+oq+JVAdKziqKlTLSdse36Zf8teCcB7WuKDP/OtVgdfD/oK+b9Iz2+s42odKGx1utivNouBijHzNo6NZbWJHpUuqV0gGwfJbbsj+ELKLU0hXpnlg/fzK5eexgCNQaPM9JeeYA2dqzvCnV8GaaFxg09/asBd5QwEdeIi9TJ9OOrfuCK5R6GD1LYPJfb9fcdquO9VGA1cUfI1HqPzzw7C6jmiRdHNE5ewlzIMGeRXvC165RXv2J1zQWk5MNM/Ehy6i/OlVkOSv8MqODX89+xlqqs1tGFXIN2AzbfguBgu7RuYkWrGnNmzcvhqvx0wGUSh0UYDvL9BIXSL6NrbzOv3fec/UurJXTjqDQONp9gkO9LkzrupUtRRKaxbrmGdF6XrkIFjeiEMzVDXuYj4jbWI3mlxeiK62zyCUgFsDpnt5rSYyYdRqHi3XuqwS0G7cbhBYw2y7/yvV+jXAmBlyUSCmenxhQm4ADFJSZj4Ppjf0aU4M9YzhqcgFqqiJPWTyoU4gYLMPW8V3c/GuMd3q7Uk3Z+63bW8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0401MB6196.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(7416014)(10067099003)(56012099006)(11063799006)(38070700021)(6133799003)(18002099003)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7esjBn5p1AqHCyA3nbFT9VcF2liGEtAxCELtiZ3h/SiCs9DxzHO80T6qsN?=
 =?iso-8859-1?Q?jfsSBTj5voH6Vg+hLmMTyphdK2XOhgxU4bVP94bsisKHsDxZHv/Vgs+jGd?=
 =?iso-8859-1?Q?Hovt5NGbFreGLdbMoSwdl02e2PQcIip04g3iiRP13ZBbsXDd4Fz4U4tvsg?=
 =?iso-8859-1?Q?xRRODQ5WT/kK834K3YNWU/Z2nk7Azbk1200DEBfiC4H1b4rWTCV5cv8IKm?=
 =?iso-8859-1?Q?yjhBBHndFV36EKarwATL/vu6Hp2LM6J7APon9BC9G3Elt1+BfkmiuCJmbj?=
 =?iso-8859-1?Q?9v3PpZiIXSRtUvPUDMFeTt4u3TaBCS8GURqwQJ3RtbBtaPgjU3E3/HPCb6?=
 =?iso-8859-1?Q?Qg9Maog+oMwXU2JWHjt3U0OM72bLcg/QsmiOaER6x4RdjNA90fAdKvmJFo?=
 =?iso-8859-1?Q?WIiy/ciYrjbkYUATR/lLyK8n2Ec/YFP083c3lWCFwAcnlzTdLQYzL9eMen?=
 =?iso-8859-1?Q?z+EpF4ysK79gCztjFJPd/9Zf9CZDJMnOuHo/P5O+G7HBgMsLl6Xs7nrIm/?=
 =?iso-8859-1?Q?feSxOrqhjHeuW8rpk8KgfMRmKEyOQ/a/cmPiRlY/Fs5ywnyvHsW0hThG8K?=
 =?iso-8859-1?Q?ecvG48uZJC7ykF4t/kgkoSA3KydJCalYdwmsZiv3GZhD5IQMfhMNMT4sYC?=
 =?iso-8859-1?Q?VehDjCTOso69jtIGKQF9xAyLmFs2vnySR7rpMTRLCJKCyKjm9JITdnNoE9?=
 =?iso-8859-1?Q?QZQvg3zpX3MlSf7coLmANS8OyIZnp5/3m1NxJ7lY+q7JekDwnkAc58O4/C?=
 =?iso-8859-1?Q?a1cWFeEG7s7UWpZJaLyzeISxNngmL7jVZC12BuX9mUTBz3JLO4lVtNpDWW?=
 =?iso-8859-1?Q?dEPI7nNbLsmpaUyYu55/gWeBYAVAeshV9zDV9vXLbaEhJPlTHxrS5D1JDm?=
 =?iso-8859-1?Q?DOx6KJTmW8otfTh0/+MfDdbfIDgJJOYJ1aOLmCioQ9WFoYzLJp5oXjfcxK?=
 =?iso-8859-1?Q?i9Wz4T0M+t3T6FtRPWf6wEWNkotgltRoaIVwfkldbfgJPUZoQgqVFu6Xey?=
 =?iso-8859-1?Q?BWgD5U1FQAS0IBVH/KPA6WUFTxGqvQenT5Z7w5L09scBJlYC7VQHZ0cjDn?=
 =?iso-8859-1?Q?+7hs0gPv4rShZCdnsB/HkiMe+rmwK6JJI2xP5N9Cwfjqqyo+1yiAnzCWyY?=
 =?iso-8859-1?Q?XYsDsp4gopxjhvGReqvqZnqZRtLhpqm7uDiOZa+PWS31mYeLFU3VA1pjy1?=
 =?iso-8859-1?Q?vnIAATi0QXzt4IxWTsuYfyFKMs1lbS6LADT6crVXIRTAUYXYiKVD/54vGw?=
 =?iso-8859-1?Q?8QMiHpmD7vJAOfiu++G8GCt3I/0Fv/7bI+FqB13jdeGgzDywCvsUbWxzYB?=
 =?iso-8859-1?Q?nNhtbPaf0ZbypSaHnzRoGQ6+xjADKRZFAIr6fuI8BV+aAslvDJhHTLmwuz?=
 =?iso-8859-1?Q?TI23RIfpYgWNwN8ruRs4Ra2FdaR27gvO2/VehYs/uPKHrck7HvFVi5L6Vm?=
 =?iso-8859-1?Q?4RqlMfr2D6yhll5KvRvOg9jx99vXnFJuLs1swBSRZa8GgYEj5t2/4B/NYP?=
 =?iso-8859-1?Q?GA6MVjnxHN2lRftiESbwV86EHN7Y1m3z8ZVrj2u8BtsJXmi6rl2WDLtDiR?=
 =?iso-8859-1?Q?Yxr4yXPHnUXpOAU0E6CJVqpRZX+sYuz+UJnU/3BiShXqzNte88dj5GRlWj?=
 =?iso-8859-1?Q?J7WUtmQS8RCbuoTXC1vOo0Pa0qqbU4C9g3CbJ1qQvzpO7dFXO2FBB0G87C?=
 =?iso-8859-1?Q?OTfmivhgJ9peqjRJJL2o7BAgWlw5bZPtt/vxE1DFuhSWgvBADLwZOfTAvn?=
 =?iso-8859-1?Q?f2xNua7IHEw7oNK2rcoWLYU8aQau0Y1Gf0YsV7joZxrH4/asQcclPadgav?=
 =?iso-8859-1?Q?eWgtClp5Yw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: transsion.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0401MB6196.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5709c3b-af0e-4bdc-0ab8-08dee6429849
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 09:38:02.9791
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: isFDUoKs3MnBZid8sB8HUcA3I7KIDhT/TXTuRgeNnlF2Uwah+HukIBgVKP4nt2kcDAFy6Pr2L6NvQKg6fPHXjCIJb8s5DA4JEEvWhJPdj7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7923
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_023818_694249_0ED048C5 
X-CRM114-Status: UNSURE (   8.04  )
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

From: Hongyan Xia <hongyan.xia@transsion.com>

While working on something static-key-related I noticed we still have a
few sites calling the deprecated static key APIs. The old API with name
static_key_true and static_key_false are also super confusing. Move all
of them to the new API.

The first two are straightforward. The 3rd one is tricky and needs more
review. After this series, all deprecated APIs are gone except two lines
of code in SCHED_FEAT.

No functional change intended for the entire series.

Hongyan Xia (3):
  sched/fair: Move __cfs_bandwidth_used to new static key API
  sched: Convert paravirt_steal to new static key APIs
  sched/feat: Use the new static key API for sched_feat

 arch/arm64/kernel/paravirt.c           |  4 ++--
 arch/loongarch/kernel/paravirt.c       |  4 ++--
 arch/powerpc/platforms/pseries/setup.c |  4 ++--
 arch/riscv/kernel/paravirt.c           |  4 ++--
 arch/x86/kernel/cpu/vmware.c           |  4 ++--
 arch/x86/kernel/kvm.c                  |  4 ++--
 drivers/xen/time.c                     |  4 ++--
 include/linux/sched/cputime.h          |  6 +++---
 kernel/sched/core.c                    |  4 ++--
 kernel/sched/cputime.c                 |  4 ++--
 kernel/sched/debug.c                   | 10 +++++-----
 kernel/sched/fair.c                    |  8 ++++----
 kernel/sched/sched.h                   | 19 ++++++++++++++-----
 13 files changed, 44 insertions(+), 35 deletions(-)

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
