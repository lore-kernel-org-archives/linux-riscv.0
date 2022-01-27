Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4941C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jan 2022 10:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lAnR2W7GJ2nTK7vd/wjW55e20iax0TVGazB9Q0+LsMc=; b=FxfXoGvIsRU+4V
	n/tvxuKXsJFrd/6/Qeu7zJwGXp3ZVLbrs3m8ewXXd9injakOCsJboWC74eVZTtdXY1uV1NdSZ4orF
	WcrobGy+nIZjwcva8nPaBYFUSCbueY+0rZJUVjWCFfmwgvgHZftTwGk7DT1QsEaVdd0cGMrks8o/k
	GFYtrxWG/V8LnhWeG9VA07QHCr4lnZgRGLD87biHvJuUbirx3SdIpp6jIIWAXeknwD7i6N19cvtGx
	OrXY5EW8futpvS1jT6heQfM8SsEHqgEkwoL/clvarFVxu+9kfov+T9Fm97hgR5uDRDYp3DGmLilgR
	H5JBmJrLzH/NNJUYMXvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD1fu-00F3rd-TU; Thu, 27 Jan 2022 10:06:43 +0000
Received: from mail-psaapc01on2067.outbound.protection.outlook.com
 ([40.107.255.67] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD1fp-00F3nT-6i
 for linux-riscv@lists.infradead.org; Thu, 27 Jan 2022 10:06:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iF2dSsEoSypiIHQLjPDrbFrHx+FO+S+iYQWGAYF+VORImGpHn+gbTLnNsPag57j/gVE8LOaydVUGgp1U9Cd/eg0haHi4Heod9Jk2bb53tm02llSoEopFt4wK9noEwRg/NRNjlUJWNajKRRSrgd1axcHIs+ayvlO3KOIk9wTU0DOtXFOt46X+0phDkDTQKMPBc0jr1YiQHzKyFf7C8KzjWr6Ld5kL8iOT9RvE3P//Cbja5QTauk2IWryJiJGgMSJm5mKk6fTTlXwdfBQkn+RsRBv/+q/UQAa0vG4Lfnsd0rCfGYBOuxFcMzFYPGSgQdT3vmw7uv02q+JQ40U8i3q9/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9eDdlRodNT1smNfCpngsTKKNuv2Rs4JoL87AsmEEyuw=;
 b=JrWDEn3AjC9/LexaugIoeCydknGub+YDv5MebZgOxPioOCQEjGOPBc6GdpAXvtMwk3jFUrivKS8mkMc7hOjFXbmFk/wGd6etnFSzoOXtnaFNFCYoUxoaKVdTBsJ0SgzzPIIPxv2z99jdLEfhBYdWq37l/I5OFgdlxobohGbijZHcVWBX86RtfoRZ00XcjYyKYk5mxfp6nUPsvSjigDT3JqOVW1eKm6GQmiWToyxMHkHki2T7kRkav9/qPrlI3/No2uSnyxW2fOwWt/Fs191K4lf2Rz0KRIkPeRlzN4k+x/MMPXCgc5mHb/4EapHn2p9q9gH1eD3HyUVfoeyQw+hN0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9eDdlRodNT1smNfCpngsTKKNuv2Rs4JoL87AsmEEyuw=;
 b=aiG1Ww1Pc5/tKNJ1M8Ia8P9qXxvV0JLKK7jtbYpUTg/URk6+Mx9yAqxpp0CtU1bejg/TDag8o7exaTUFdT7YJQjkT0wmljIq4R4e1sXF3rReaTUDeZxbG4QDS0oaqECLpEo+NfVISaLENrkd7zIH/VGb3kMzeYu8FKwd1WAc7+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SG2PR02MB5379.apcprd02.prod.outlook.com (2603:1096:4:177::10)
 by TY2PR02MB4239.apcprd02.prod.outlook.com (2603:1096:404:100::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 10:06:31 +0000
Received: from SG2PR02MB5379.apcprd02.prod.outlook.com
 ([fe80::10d3:b8b1:21ac:d260]) by SG2PR02MB5379.apcprd02.prod.outlook.com
 ([fe80::10d3:b8b1:21ac:d260%3]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 10:06:31 +0000
From: hanchuanhua <hanchuanhua@oppo.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: jszhang@kernel.org, alexandre.ghiti@canonical.com,
 wangkefeng.wang@huawei.com, zhengqi.arch@bytedance.com,
 ebiederm@xmission.com, liushixin2@huawei.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 hanchuanhua <hanchuanhua@oppo.com>
Subject: [PATCH] riscv: mm: Remove the copy operation of pmd
Date: Thu, 27 Jan 2022 18:06:22 +0800
Message-Id: <20220127100622.11856-1-hanchuanhua@oppo.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: HK2PR02CA0172.apcprd02.prod.outlook.com
 (2603:1096:201:1f::32) To SG2PR02MB5379.apcprd02.prod.outlook.com
 (2603:1096:4:177::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c95856c-0d50-4c74-d47b-08d9e17cb0e4
X-MS-TrafficTypeDiagnostic: TY2PR02MB4239:EE_
X-Microsoft-Antispam-PRVS: <TY2PR02MB42392B796981F35C808F5737DF219@TY2PR02MB4239.apcprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +g0OGmQNX233IHgTnW2ESEoYp651zKr8MLTwMSlIyeskWLIIXrwMZqmonJfHKayrAQWReOA7dP2xKlCTkF+p9LgLPTvENwc2HnR/N5FDobNfM3Ow6H03LPFI2oWuHEsdm9680xYrZ4Jc50ciXqqdOEYZVe1/0tHNnGaJ887G/qNWasEbZnhIEOgB5uETB2zHvnyIFyZHugRLGaUpSeps/kcF9EG0VhM8pgl+SR9evsbaXAHWWauNbqz23fyq9mgOtZAEk//cuQwrrE41OaJoJT3v0+6O9tJlfSX1BKkHRNYfweUngqlAFAikch14oDhnKnofVfuGzdMLlIglvVFVoewOhJvvRO/lt2BQK4nkFJJIdU1n4nykRH5jkaDnhgbzNYDKNkk87KD23jJM1/SGu4cXPIndlL7eU7HuxEh2iWBdFjm8WD1eC+ulV+7PExI24PI0GsZODXN7ArwUF3C5BhXKv7v3MwtJQWPrBcnJYRq0K/BxEv1+wgOBja8QhqAMue5eU6udU7kRmEGczUAGEzcO2c+VF58l3oCbBABVzXj2KSg4qrzgapMWK7ot8gVpa97tQAeMyaaqO/Q/QsPfnbdNwviX8AnBMpB9g/EiomPRAKfwTaANTqzSxHKKeO85hdnZaXRJAxgw2JtmpuLPRNEPyHERxEkZYHfaNw+elLT5Ovdtm+EtLb3q2zoImR0Cf7ZSjt2M74BpWZpGoihWdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR02MB5379.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(66556008)(107886003)(86362001)(4326008)(66476007)(36756003)(8936002)(7416002)(8676002)(5660300002)(2906002)(316002)(186003)(38100700002)(83380400001)(38350700002)(508600001)(52116002)(6506007)(6666004)(6512007)(6486002)(2616005)(26005)(1076003)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HxsJ+RcVkQzlBaXhPlv7IV6jk4AlGCLGvg4qgZXf1nI61rDGDpoUePuR8Ln3?=
 =?us-ascii?Q?kexo257J1gm/bfQPbXm7Kgj77MPD+E5SZEAHk32lKjXQ6DRQhswDH9kS+1ha?=
 =?us-ascii?Q?rCWHjLaYPJB2kTL1nPplLB6hYfH2l8KETusTHr33kk6b4/vO0fThyiOvmsF1?=
 =?us-ascii?Q?Xn9zPyJbJldeH6+hDCZ57KkmRGXy8lQFww1rsw9LvdqPWUBhFyKIYYrcO31/?=
 =?us-ascii?Q?feULa9KppfQsG7wnKL38lmHrYW3CdmTC27jLN0exyyEgKZMziCE1+jxau3Y4?=
 =?us-ascii?Q?3SvZb3mHeC15zOTtd+BNAy1dSeGE1QEJOE9J87vZkOXQVUoyP0wf8kIuxITL?=
 =?us-ascii?Q?w8r5qwDNyPdFFM+v6JsOOJgKVfcloEv3kuRYXR++tbVSoZPGdo5ZNkDTIR1i?=
 =?us-ascii?Q?tcvfhuQ5u4SN39atyKTvzQgy3If6sPrj5MGoZ0Xd1wbh5mtRQue/EddkY6q9?=
 =?us-ascii?Q?InUFPekNKmMHKmyVsS07tQARZfNqtes9ox21OvLMR0a72kosKCeNnaudCudH?=
 =?us-ascii?Q?hTLG3Ioqs0nQzm6/I450hdzGtyRX2lXBeeY9pHB7HjILLnTHmMzityFmQQa1?=
 =?us-ascii?Q?sBD0O44wUmiJSYo6o2rBd7qe4sM71ZxmrfJgs2bMQP4/6hDTWycl2mIBLYmL?=
 =?us-ascii?Q?9vbk6isVSP9lOU94l7i7F5FvizdsjHwi8vQE7c60R42Q0dA6SyyW2PR6/mLq?=
 =?us-ascii?Q?tZihkJ5JB41XejKoPg1AgispqcdgQ9+R8ShXeg9pN0XTU+J1vfle8CmJX6I3?=
 =?us-ascii?Q?pl7G1MROhGkKGzjApBK8ATrU5cWfX1YTbfEfG77LmyPMCafbZJ5fHjZk1yzx?=
 =?us-ascii?Q?64R19yRT0PyKNThXYe7tEQp1XJaKvT2JS79p3pejszAtFXLMLFrhAzteW+o9?=
 =?us-ascii?Q?vJh2eDR/IEXg9hYt++KTF5B88bm2x65ssB0+kCYBRNLfDfQyEC+myogM6zHk?=
 =?us-ascii?Q?FkjZCd0grNRiZQBOKfGZBBJFC05hNbPMjCSoBJ33Dqf4RMzq5B/Zi8OidW90?=
 =?us-ascii?Q?HNZgly0MfEkVW3pOJ3nQFOS3x3tkGLVIdPAWDk8q8cma9281KGl9rX9VQPFe?=
 =?us-ascii?Q?NEwTolcQL/VD1vD82qvJXJXVWX/qloj1GOhfNAvHQlyoCpBJv50181CQ3Xg4?=
 =?us-ascii?Q?iWtx4RgYqVdKVx5wu4TdTc0uJ4s8m9KIiTm95iTrpx4EnT/78JkFNWUDWnc5?=
 =?us-ascii?Q?TNWnzbuVeZln/0dOiWtJP640e2DknSdXGssO81UMAA2uzRDt/vkOuek6dgs+?=
 =?us-ascii?Q?cC9qNt415qIdXce8gUoWpWyGwu/y8/KhNjpwC9ri3D+hffjWJViYdtyCyGo0?=
 =?us-ascii?Q?gkvqsN2OuTPFlhtvDccLBbtMnvH7199vDbaHUpvhkerLkxW32InktUM+HfP4?=
 =?us-ascii?Q?G19bk0BcZRee3pWglOs+9bMjG1eVqEWZ4fz6ZFN5kjRbQkfLP0vK9PF1wnOr?=
 =?us-ascii?Q?LL3DS0GlqQW7lfvNlt0O/TeaSJighWYeupLEdKxtCL8hjM9B7CTz413R407t?=
 =?us-ascii?Q?MYeqI7z/T8wxdj7b1O9MzNab869uVV3hwyT3s0AyAWd80+qO6dx0jfyO2iVr?=
 =?us-ascii?Q?BSR96lMrzAUO2LIX7B9F5W8vpYqnP7VcYwlQwarr0UUmOcj5H+99LOuqlQm2?=
 =?us-ascii?Q?bfr65ZbZlDLODF9SyxDxmEk=3D?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c95856c-0d50-4c74-d47b-08d9e17cb0e4
X-MS-Exchange-CrossTenant-AuthSource: SG2PR02MB5379.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 10:06:31.1178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPQInN3Sz7ZVGluKz+dYF+x6Z7Qv7H6sxNm6HkiV1oopILlMldDnuJgq/nqfg4HDJwNnoAHQD/5c0LHpj0d5gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR02MB4239
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_020637_490361_8D104C25 
X-CRM114-Status: UNSURE (   6.65  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

U2luY2UgYWxsIHByb2Nlc3NlcyBzaGFyZSB0aGUga2VybmVsIGFkZHJlc3Mgc3BhY2UsCndlIG9u
bHkgbmVlZCB0byBjb3B5IHBnZCBpbiBjYXNlIG9mIGEgdm1hbGxvYyBwYWdlCmZhdWx0IGV4Y2Vw
dGlvbiwgdGhlIG90aGVyIGxldmVscyBvZiBwYWdlIHRhYmxlcyBhcmUKc2hhcmVkLCBzbyB0aGUg
b3BlcmF0aW9uIG9mIGNvcHlpbmcgcG1kIGlzIHVubmVjZXNzYXJ5LgoKU2lnbmVkLW9mZi1ieTog
aGFuY2h1YW5odWEgPGhhbmNodWFuaHVhQG9wcG8uY29tPgotLS0KIGFyY2gvcmlzY3YvbW0vZmF1
bHQuYyB8IDEwICsrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDcg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9mYXVsdC5jIGIvYXJjaC9y
aXNjdi9tbS9mYXVsdC5jCmluZGV4IDRlOWVmYmUuLjQwNjk0ZjAgMTAwNjQ0Ci0tLSBhL2FyY2gv
cmlzY3YvbW0vZmF1bHQuYworKysgYi9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMKQEAgLTEwMiw5ICsx
MDIsOSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgYmFkX2FyZWEoc3RydWN0IHB0X3JlZ3MgKnJlZ3Ms
IHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCBpbnQgY29kZQogc3RhdGljIGlubGluZSB2b2lkIHZtYWxs
b2NfZmF1bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIGludCBjb2RlLCB1bnNpZ25lZCBsb25nIGFk
ZHIpCiB7CiAgICAgICAgcGdkX3QgKnBnZCwgKnBnZF9rOwotICAgICAgIHB1ZF90ICpwdWQsICpw
dWRfazsKLSAgICAgICBwNGRfdCAqcDRkLCAqcDRkX2s7Ci0gICAgICAgcG1kX3QgKnBtZCwgKnBt
ZF9rOworICAgICAgIHB1ZF90ICpwdWRfazsKKyAgICAgICBwNGRfdCAqcDRkX2s7CisgICAgICAg
cG1kX3QgKnBtZF9rOwogICAgICAgIHB0ZV90ICpwdGVfazsKICAgICAgICBpbnQgaW5kZXg7CiAg
ICAgICAgdW5zaWduZWQgbG9uZyBwZm47CkBAIC0xMzIsMTQgKzEzMiwxMiBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgdm1hbGxvY19mYXVsdChzdHJ1Y3QgcHRfcmVncyAqcmVncywgaW50IGNvZGUsIHVu
c2lnbmVkIGxvbmcgYQogICAgICAgIH0KICAgICAgICBzZXRfcGdkKHBnZCwgKnBnZF9rKTsKCi0g
ICAgICAgcDRkID0gcDRkX29mZnNldChwZ2QsIGFkZHIpOwogICAgICAgIHA0ZF9rID0gcDRkX29m
ZnNldChwZ2RfaywgYWRkcik7CiAgICAgICAgaWYgKCFwNGRfcHJlc2VudCgqcDRkX2spKSB7CiAg
ICAgICAgICAgICAgICBub19jb250ZXh0KHJlZ3MsIGFkZHIpOwogICAgICAgICAgICAgICAgcmV0
dXJuOwogICAgICAgIH0KCi0gICAgICAgcHVkID0gcHVkX29mZnNldChwNGQsIGFkZHIpOwogICAg
ICAgIHB1ZF9rID0gcHVkX29mZnNldChwNGRfaywgYWRkcik7CiAgICAgICAgaWYgKCFwdWRfcHJl
c2VudCgqcHVkX2spKSB7CiAgICAgICAgICAgICAgICBub19jb250ZXh0KHJlZ3MsIGFkZHIpOwpA
QCAtMTUwLDEzICsxNDgsMTEgQEAgc3RhdGljIGlubGluZSB2b2lkIHZtYWxsb2NfZmF1bHQoc3Ry
dWN0IHB0X3JlZ3MgKnJlZ3MsIGludCBjb2RlLCB1bnNpZ25lZCBsb25nIGEKICAgICAgICAgKiBT
aW5jZSB0aGUgdm1hbGxvYyBhcmVhIGlzIGdsb2JhbCwgaXQgaXMgdW5uZWNlc3NhcnkKICAgICAg
ICAgKiB0byBjb3B5IGluZGl2aWR1YWwgUFRFcwogICAgICAgICAqLwotICAgICAgIHBtZCA9IHBt
ZF9vZmZzZXQocHVkLCBhZGRyKTsKICAgICAgICBwbWRfayA9IHBtZF9vZmZzZXQocHVkX2ssIGFk
ZHIpOwogICAgICAgIGlmICghcG1kX3ByZXNlbnQoKnBtZF9rKSkgewogICAgICAgICAgICAgICAg
bm9fY29udGV4dChyZWdzLCBhZGRyKTsKICAgICAgICAgICAgICAgIHJldHVybjsKICAgICAgICB9
Ci0gICAgICAgc2V0X3BtZChwbWQsICpwbWRfayk7CgogICAgICAgIC8qCiAgICAgICAgICogTWFr
ZSBzdXJlIHRoZSBhY3R1YWwgUFRFIGV4aXN0cyBhcyB3ZWxsIHRvCi0tCjIuNy40CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpPUFBPCgrmnKznlLXlrZDpgq7ku7blj4rlhbbpmYTk
u7blkKvmnIlPUFBP5YWs5Y+455qE5L+d5a+G5L+h5oGv77yM5LuF6ZmQ5LqO6YKu5Lu25oyH5piO
55qE5pS25Lu25Lq65L2/55So77yI5YyF5ZCr5Liq5Lq65Y+K576k57uE77yJ44CC56aB5q2i5Lu7
5L2V5Lq65Zyo5pyq57uP5o6I5p2D55qE5oOF5Ya15LiL5Lul5Lu75L2V5b2i5byP5L2/55So44CC
5aaC5p6c5oKo6ZSZ5pS25LqG5pys6YKu5Lu277yM6K+356uL5Y2z5Lul55S15a2Q6YKu5Lu26YCa
55+l5Y+R5Lu25Lq65bm25Yig6Zmk5pys6YKu5Lu25Y+K5YW26ZmE5Lu244CCCgpUaGlzIGUtbWFp
bCBhbmQgaXRzIGF0dGFjaG1lbnRzIGNvbnRhaW4gY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIGZy
b20gT1BQTywgd2hpY2ggaXMgaW50ZW5kZWQgb25seSBmb3IgdGhlIHBlcnNvbiBvciBlbnRpdHkg
d2hvc2UgYWRkcmVzcyBpcyBsaXN0ZWQgYWJvdmUuIEFueSB1c2Ugb2YgdGhlIGluZm9ybWF0aW9u
IGNvbnRhaW5lZCBoZXJlaW4gaW4gYW55IHdheSAoaW5jbHVkaW5nLCBidXQgbm90IGxpbWl0ZWQg
dG8sIHRvdGFsIG9yIHBhcnRpYWwgZGlzY2xvc3VyZSwgcmVwcm9kdWN0aW9uLCBvciBkaXNzZW1p
bmF0aW9uKSBieSBwZXJzb25zIG90aGVyIHRoYW4gdGhlIGludGVuZGVkIHJlY2lwaWVudChzKSBp
cyBwcm9oaWJpdGVkLiBJZiB5b3UgcmVjZWl2ZSB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNl
IG5vdGlmeSB0aGUgc2VuZGVyIGJ5IHBob25lIG9yIGVtYWlsIGltbWVkaWF0ZWx5IGFuZCBkZWxl
dGUgaXQhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
