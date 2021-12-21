Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC2E3C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 12:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vW873nobOFkI3DidIxnyrP/IcK8n+jhvvqzJI70yJ+0=; b=j7fHzrPMnZtGxN
	r4tFPzgJGkN7whNTxCVl13YcQU76Hj62sB7QJNdZzDGnwbTtbk9pUnG1V7EsfS70haIT0dqlgWvOt
	/Csau2AaXIT1edCIrk7TDICgq+2jj/fxcxYhTG6VO/9dGSaBTNA+xThsyiREXkFNFyifcQ/CdorLN
	02W8CLjlLUVpH0HwRlSwtHmMcsR5gqKneeRYyVZmdXKL/4FTlVpVIaTYCgtX6Qqe1lnJheC3hA/5d
	MKSuW9BoDBnU6rmvT8qUyEKpm/13QXY8Bz6jqCsCVkbqDcoPgApSSdCKJeCNs0kfW4xCOJhp0Fisg
	yX27prO/IqomeZQ42arw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzehS-006pp2-VD; Tue, 21 Dec 2021 12:57:03 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzehP-006pnt-Jt; Tue, 21 Dec 2021 12:57:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1640091417; x=1671627417;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=vCDR08EkVWCyfREMZVRbpXQ96JyqSJUHc5EuPrIA77U=;
 b=XaasDyFiSaSYPnPZuRg4hDdmIyldJ44ge/6d4eZ2OKZhXdeR3zAhDrKr
 GbjcHunVD1ioBxP+Ru7bDa5BWb3a+RBNBSGey1saavBCtiGYc+0dZg4wK
 1Cxwa8AKoTkIEnYiA0KMrCy9tx3Kr55ym4QhkwhCEINFXxWFRDkVMFkzR
 NwXPrmnH8mfagAcfTVOq6JJpVKmddnxgEH2DuNIbof2paDE46r2xJCkli
 wGv+m8B64Koxdmu5BIJL7zVAiRT1+Hww8q2eV941woS5nA6FFhka5zdRs
 5u9pJPRQWCxfGz3HjUhdXTv8VDmAwc7TrewiobXLoaoje4t7dZsWWPKLw A==;
X-IronPort-AV: E=Sophos;i="5.88,223,1635177600"; d="scan'208";a="188760856"
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hgst.iphmx.com with ESMTP; 21 Dec 2021 20:56:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdDyD5iRuqBlrhTnBa55O4R5dyR+aIHp76No1PKC/9SGYD9d3ZBA1YLBv02wlfM2iZt87/HJuxLJi9LW3WKHkGqfCOzstPkyWJ4P0ssNyeXkom3yMxOFS+D0D91VKdlfxmWDA9dGohVDpcDoW7NVnsL7423GgTQSFFeDcOh0+M+kOwe//eO8Ps7IwwAjUujdf8wXDtrs8z3w/G+Eih0FSXU8xK9cligyBkyLB7+EdALHdwPvmn8YKlvGPyXnnq64vzyH4zrvB7DNFwTkuuPljbyQj63zemK67DyuZdszWySzXZQj+F8JX1i7qZ5PNojeMY+k6x4a7wy8qvmYN+cNMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZ9bck7R1BjHfbQAj/TtWLXvHofTe1xHXbVQBDizXDU=;
 b=PSA8U8P/7KguTMEmf7G8R9mssRW109xAjw62UDdTzb4nLIG3bHoSBt8iiiPYdXEWaJe9YZhKzcovKuOFCf+EXo0X0Bvc7sLnz4Lu2DDRfM8JQQNO4cYILsrpjMFX/uVnSzZAjptqWlWHeNmHC/UDN33LhSGJhuHR9YVuHt+/Ow4FA0hh9zcQZb+7x0JeFe1fRpQ/xk2+tyBAS6i6LTxVnLqai8RIP2gBjHYb22JLyAka7QGpkJ5ho8dsVL8OIMRtaMoltHrfNCzMepTHZIB5pDKthv52lDLpay0m3C1YSnn5zXmQQtBuoPOTsa5IfsuI7Jh3u2hyl8+BPP1jfhhWiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZ9bck7R1BjHfbQAj/TtWLXvHofTe1xHXbVQBDizXDU=;
 b=BKLmpvWm0MjLttlhGN/LNTQFotE8YLvqBX/pG6+jukKLdbkMqGLa8L1+dpa52HKL6LeCkE7TrHbH/1f3RT+FZlStStNpxPu/5LfLUSs4i6/iK755Ks8E3Se18EE4jH4tt/WiKi7pNxKbH914VMfayJjQZWXHEpXIw41hJuN3gEM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8266.namprd04.prod.outlook.com (2603:10b6:303:151::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Tue, 21 Dec
 2021 12:56:51 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c%4]) with mapi id 15.20.4823.017; Tue, 21 Dec 2021
 12:56:51 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>
Cc: Sean Christopherson <seanjc@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH] KVM: selftests: Fix compile error for non-x86
 vm_compute_max_gfn()
Date: Tue, 21 Dec 2021 18:26:17 +0530
Message-Id: <20211221125617.932371-1-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: MA1PR0101CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:21::12) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e5e9112-57dc-4a53-5e6c-08d9c4815b07
X-MS-TrafficTypeDiagnostic: CO1PR04MB8266:EE_
X-Microsoft-Antispam-PRVS: <CO1PR04MB8266A952D52FF08AA10ECBAC8D7C9@CO1PR04MB8266.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2oUsnXsKWzpQLO7oO9KeURsqcx+5pwj+82MxQfePFytTkvXdhAIS2UwmwzezBQEYl3Uwy6ddiUC9CdvONcczVQbLzLM/06BKyHJ4rAAEnXgkKUKtpYbbxfC/vDpCWZB61Uops5n8/GHEqi67N4WsEgcnvyv2YJgyHdh2ZnyYoAsiipGHehcnCkJ/l25pMBGqOnL8BUwpaTZLxrL4vBNkRFieObbG2Nyil52BjsmVBqYf+3UKlJ/Qzd6i4mtUNYvu+h7dihcU/oqCp420CAf+OLaV55s2+3WYbsi2FkBQQvDXXU5uVSr3OO28MT9pk2gbAuU47zRmtYVeCuzabKMpWG2VmmSXNItQmr668o6/Utax85XmR2dOxPq7okz05gXrQXgqqKXHAZfh5KlY7X2giJmEnAFoXM45lK80O6r9Qih26PRJNkp1MCpfyDAnieFpyHq8c1o5EMymO1EnweZgreQH57x0fnbToAHxLihq/nv4qHX7p2DiDlHm+0ds08jU0vgJXe9zKJK1WnJoDg3i7U0jd/6eBeE/urUG/YMA+RLCgAHLCj4XcEDQqE1PV6zFNvYLmeYAjJAW87lHipoMwPX52CW3JpVVkyCiyPp4Bakb0TERx7RYhnIF7NFThq+ZsgRTWdrdNTP+4R+p13vxtOq4pwOWFNQSZOfrOUIkYbCv1Y0O7AYuCUYBA9pPaUY4kQGEkQupc48Hf55lNBcr3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(44832011)(110136005)(6486002)(1076003)(4326008)(316002)(26005)(2616005)(83380400001)(8936002)(7416002)(82960400001)(6512007)(186003)(5660300002)(6506007)(508600001)(8676002)(36756003)(66946007)(52116002)(38100700002)(38350700002)(2906002)(66556008)(66476007)(86362001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rug1//6RS0KglDChVEQzJuYKRyJEwwss1OBqh7c/FzblA25iy1f+Zs7lapBT?=
 =?us-ascii?Q?oBy/5uJ+Aj7e7PU2cb/RBmS+SIAyqE/0f2RXg72IcZNomXXnKJTK6UXzhLgw?=
 =?us-ascii?Q?V53mAbDC+Jd7dnt7Og79RfCz3+QunI1w4kfD+iH8GjBLap2NHSDx9pNNmuY7?=
 =?us-ascii?Q?Zed67u3Urb89e7hYxFKaLgR6HRnX05IbcSkODgg2OqYWNWgtDF6F1V36j2RZ?=
 =?us-ascii?Q?QU/TdwksZd5nlR3nuh/fBznvMsin1Pg9GgOPOKcbEzOk4V3visgbB5YDoewj?=
 =?us-ascii?Q?Fre+vEsXK8sTFceywildxTaqsptuRvufT7HYJSZofneuFURMNNKTXhkh9bLo?=
 =?us-ascii?Q?mD30KG4n60pBZyyTyt/6+Qq7eBp0D2AqSbGOh44xCroZ5jrjkc9m+b+B+LmD?=
 =?us-ascii?Q?ZsiI3qP2Q3mBJ+L8+KMKGA8ZM3IdLzIJXY87+DShqxmXnygAo63NESlngHt1?=
 =?us-ascii?Q?pUKFoaMH00QYptoETg8aRsh3aGwi0fVk3bVI6Pfh0rEvAt60b49j1oC8rLIM?=
 =?us-ascii?Q?jpfw1Pu7WDIINcGMO+gElWkHgsDZgBEuQ1Xoba1jVqiuQ3n4tgiH22M208ts?=
 =?us-ascii?Q?10T171Ufysz1x8ea/pt3ek23zFIZ54OSMvuzl8SbdIFOpueLStsG/psR3xUg?=
 =?us-ascii?Q?8HDa2NWP2tyKWvqvR2XYwU+Qwe2Efruu/SZFB/NCFAkeOFpJhF/QNsNDtlgm?=
 =?us-ascii?Q?+b8hoY6Kk/DS0cbZI9vmDIzs75svPzxunaGMTOyi6Yewv+BjBCtBtn8HgMZR?=
 =?us-ascii?Q?un7Fuw3iYHxWLurY+AZgw1StC4yXMVV2t9+BUu/zgo3HPa/sfDr4rIhRQBPN?=
 =?us-ascii?Q?QkmlwJGo1KHh0YydcEhY6nYGXFkyE6gNBMzxIR+CdRnuYCvnsxjx0u40Y2Xa?=
 =?us-ascii?Q?h1CxH8IB3g8N3bvE33PagmvPD8Je6WbRqyMpdPKBgg6Um1/XpxWiG3iJYZQE?=
 =?us-ascii?Q?Vne6Qt9lq4s1gPX1IxoZqVqMEddY9gx2woga4XTO/N/eU72e1DbilYmiozg0?=
 =?us-ascii?Q?PyGAXPqp1siGFA64jx0Ev26UmYHo6sW+0zdieqLomlknNCrQim+j26WYIfxw?=
 =?us-ascii?Q?kUQB19tVNuBGd4VECpupgkpFfJYgEKEbQpZRYzEtWxYRIH0xL5ytVjZcozu4?=
 =?us-ascii?Q?Gcmp5WcKR3D6tFysDa0ZGkrWtp50baDiZIYD+3miM6NYlzZ4KDp7AOyl70uP?=
 =?us-ascii?Q?06oBiorn4uZH/eenhV7zrvADF2rsyXTpO7pHKVwjLjLzydGSKVkwADAxByn/?=
 =?us-ascii?Q?7VeH2oNZogRnpFnN9wYiT9LNd4iG24PK23wjpq9fhrNCAyRJdtekFPOYluWu?=
 =?us-ascii?Q?0BNqYgHXiJqSlZwVo/nYXt7t9mRBisQqgh/PO3pPJ/IT+29X9S14ZgYcJJR9?=
 =?us-ascii?Q?15IXLCi0myIhskNzmq3cxqkl/h1kjwD0F5sL0ZJJunOwTu+TxkYglN6PdtZL?=
 =?us-ascii?Q?qH54BrOwjkeS/+bFZGyNFL69E/ELAPm7EL24iarCi+aQjjyURtie4FLK5nDO?=
 =?us-ascii?Q?wCNxDaO9XzNGv3JQ+Pj4OPHHlXmWJTLUMhBsIbsiYifmruVIMeQ4zRnxKwcB?=
 =?us-ascii?Q?YvsIB8lmCjkOXy0X6QbbKDng3aCUHF+7O+5K6OP6aSYhC7x8Xe5CExz6g6j5?=
 =?us-ascii?Q?q9wQ/J2QA9jO9qvn2+L9j70=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e5e9112-57dc-4a53-5e6c-08d9c4815b07
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 12:56:51.0420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Yl5l6TK+zn0mVHDrzRjqzlyJbaBFxvKW1d7LVrcaEzxCFOC58saKY4eAfCwwdgvmLoLnWzY/tPhyc95+q8LmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8266
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_045659_764250_EC6904FA 
X-CRM114-Status: UNSURE (   9.90  )
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

The inline version of vm_compute_max_gfn() in kvm_util.h directly
access members of "struct kvm_vm" which causes compile errors for
non-x86 architectures because lib/elf.c includes "kvm_util.h" before
"kvm_util_internal.h".

This patch fixes above described compile error by converting inline
version of vm_compute_max_gfn() into a macro.

Fixes: c8cc43c1eae2 ("selftests: KVM: avoid failures due to reserved
HyperTransport region")
Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index da2b702da71a..2279e340ca58 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -74,10 +74,8 @@ enum vm_guest_mode {
 #if defined(__x86_64__)
 unsigned long vm_compute_max_gfn(struct kvm_vm *vm);
 #else
-static inline unsigned long vm_compute_max_gfn(struct kvm_vm *vm)
-{
-	return ((1ULL << vm->pa_bits) >> vm->page_shift) - 1;
-}
+#define vm_compute_max_gfn(vm) \
+	((unsigned long)(((1ULL << (vm)->pa_bits) >> (vm)->page_shift) - 1))
 #endif
 
 #define MIN_PAGE_SIZE		(1U << MIN_PAGE_SHIFT)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
