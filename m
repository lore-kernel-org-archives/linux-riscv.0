Return-Path: <SRS0=X0/G=C7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27916C4363D
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2020 16:48:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BDAE2073A
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2020 16:48:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TuF9Chpr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sifive.com header.i=@sifive.com header.b="NynEKxhP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BDAE2073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6D0u0zIH6VKpW22aA2Cdmmhv/SOlPdl5qOXmglN2lCw=; b=TuF9ChprbRGtQzBCTKWtjOclNX
	gE7+21g3aXTJycopjzjpajLxghGgu4lXA5oKABy/qWvYlL8Sr3cp++JoGdEqhdGtbjOBIk8X9AJS3
	S7lCWUdjOfSB+qvjJ7B6ZdBR1Q8z0FMovVJBnKH0vXYsCwHmYmoyfQQCpVrWh6lI2ib8py0c/BpBA
	huMmeEyI6TgfWgy3lDdeU2pqecv9nO75KX+WDzD9uscRNvKIJGQkGZ7XP94q5HkcVppIG3iR68LXl
	BPEe3Twv/xaIAaddNZIp5sa3j1gnGPIK0dVOogDOWnIjBMMYBBzkH4V2UKVNkcnTZMbazWRxYO71o
	8nZIp8Kg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKlSy-0005Ti-F1; Tue, 22 Sep 2020 16:48:32 +0000
Received: from mail-bn8nam12on2069.outbound.protection.outlook.com
 ([40.107.237.69] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKlSv-0005T9-Im
 for linux-riscv@lists.infradead.org; Tue, 22 Sep 2020 16:48:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZdTHRAbRTCf1Cfdu805T3QcD0Sm+BUckPXcXQfGoJqJFyBdjrBwmb+nv7IA2lE62zajYiwgGj7vZ3Cyq2DOd5Ecis24dqkhURZEmT2ssXxaPDmUWJVSNdf39lycwM0TKqsNpIqYlj3xn5i0+5rD5bQdrCqHVEOjzHv7crZ+s2dz2eb7dZz11L3TLmxId8RpvwfGEWmv9hAF0DxcNDUydsKXadpOB2+pICUWPweReZ/e5g70UsdivupaWnu/KYwsEHkFVr1yO7OTqJ/RqcpZck3Y8UaibxXOavtwA0Ck+hgsup8L0nujORUNNwzgcvfoFk+DKCgBDGBtkxzwpjJDgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MV/5yaZe8hcmGPsm1eJSCCANnNI6ounAWOr9FyynnQ=;
 b=Z/g6DYA2O4ZVtjrmGI+RL0FrzR74I6tv0yMeyVhxq1btXLgQiFbooSFVRpMVvk2OPBRlxqyEHb6BNLRJ+aBAYqdSkkEr+6ENkhTSYEpULPY2boKawjkITgfncR6jeCRp6darVY/PnvMBnEKbkrIumY9l17E2OAmMe1Ss4MHLl5bPmQxToyxKk+JsqaMr6yRi3rnS6Mbbi02vfSymtHcySiEJoRVzn76tVKejVuaMK0hAfLHDdt7qQCKH7cIXi0Tsk/kDAATF6QtopMNfoaBCpX/f3nk4caCfoYIQWWV9DsiQs8h+kCvoV/ddfS82B7MTvgL7cO/Nj6tz/lVaI3jNMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MV/5yaZe8hcmGPsm1eJSCCANnNI6ounAWOr9FyynnQ=;
 b=NynEKxhPa9KPaGMvaPNPaH6VshLHWicUac17I8dhaJ6j2cUsL9QycFlr2mIFXU8TMPsEhrlNhw2qEaolRLtZdgzNeFPqC5Fdd1mhgVlWTPzSerGonLK35PT4rlMdL5XRILeDC/L9UrDKmdNEw0J05cSGUgdjPoOX1oo98ayjJzI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=sifive.com; 
Received: from DM6PR13MB3451.namprd13.prod.outlook.com (2603:10b6:5:1c3::10)
 by DM6PR13MB2666.namprd13.prod.outlook.com (2603:10b6:5:138::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.4; Tue, 22 Sep
 2020 16:48:26 +0000
Received: from DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::a48a:1f7c:267c:876]) by DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::a48a:1f7c:267c:876%7]) with mapi id 15.20.3412.019; Tue, 22 Sep 2020
 16:48:26 +0000
From: Sagar Kadam <sagar.kadam@sifive.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 0/1] convert l2 cache dt bindings to YAML format
Date: Tue, 22 Sep 2020 22:18:07 +0530
Message-Id: <1600793288-3881-1-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [159.117.144.156]
X-ClientProxiedBy: SG2PR01CA0167.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::23) To DM6PR13MB3451.namprd13.prod.outlook.com
 (2603:10b6:5:1c3::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from osubuntu003.open-silicon.com (159.117.144.156) by
 SG2PR01CA0167.apcprd01.prod.exchangelabs.com (2603:1096:4:28::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3412.20 via Frontend
 Transport; Tue, 22 Sep 2020 16:48:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6258917-0790-4be6-bc85-08d85f175382
X-MS-TrafficTypeDiagnostic: DM6PR13MB2666:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR13MB2666DBC2ED5C782DF04806E8973B0@DM6PR13MB2666.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:628;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7lgtq36e06yeN2rII8tPzkX64zA7WcK6cPiv7HZU1M2UYuUi0iMvAgRAqyscwDkkuwUiP0OrstdbLX65pg9HuJ29MmQ6Y1pRgeH2TAPcwN/ix9T7BeDcH24Q07+22s/4RQonkapzQGDc0OHebrd/PckzE36Tdc8NqwHYz08aAU1zGxyCbJ/C87VVk9d25hJ6OrrVp2zEi1APxbfTJQfdDtIu3uJi9yE6Etb1QZJZZWeC+dPBtAZfypHs2xjwtbj/xVlhQebfzRtt159pH4qNKSQbvFEQuUGvwBGeOPUsQqT6ap7HeVifAAQsAd9GaXpR1ksxKiXc461CvbdFgPfOAMbYqSRsfnehIcGwN4q4b1JHEGZrbT/j5imQXIxbxiS0dx0a91VVTRZgqHE/PDbBRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR13MB3451.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39850400004)(366004)(396003)(376002)(346002)(52116002)(8676002)(66556008)(478600001)(83380400001)(66476007)(2906002)(6512007)(66946007)(5660300002)(107886003)(6506007)(36756003)(316002)(956004)(6666004)(8936002)(83170400001)(4326008)(42882007)(186003)(44832011)(2616005)(6486002)(16526019)(26005)(966005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: bKTrTG5RAzmaLV4rrh4x55aL0zdjS0hwJphHBP80Yg1dEYg+mwgkYzcF8MfrJsFewrarsn1lzyLif5xDzghEKlGQuIcmsUTmdecWL96FV3UqTJKf6jshjmlkx466sKhYIJI6uwTL8u9rKujfdg3k9DtHGriQd0TyQcxQDu7ba8Xwjqb0rF2uDU8Gz9kTQTIoieww13qRXmfBscbwIRPjGvZODfXKSWHD5MoZLXd4nNbG8FJSTTNnrlqek5p8ZSFrjit9y64JxAJote0WoV/hLYYs6vhUaWUIUJ+ihj6pES1olyRbNlP9mF6DtlGv7dl9d70zWasls3Z2umHFcdDJcCbtv+JwNpPjDO+G8H4Q9O2lx3wmup7F0B99FSXI3ur2VI+Bcp1AeRfZmPnh8pzR/GJvy7/bpDpm6vHcUNkg9UiQSsUOsX7J+KmVns90iyDnGkgrd8dPIGTadv+rcwguBeW2sqfSAWEZArsZNMa+P5gw0j7S6BIO1f8pfkQDToyvQL0pUAIWpd6SQHxPZd7Dq3i0832ENcD8Be25gfsayeVHyObE6p5vjfvswBbx8rtf5tlXPHpAB2VtBusTiNR+i45QjSN+W5scI5muIGrGS6PJRHXo66G2YxZxyIk28fMGeCXHfpWwxK8v3zQW6m7ucQ==
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6258917-0790-4be6-bc85-08d85f175382
X-MS-Exchange-CrossTenant-AuthSource: DM6PR13MB3451.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 16:48:26.7725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BA3z/MYTugMyenS7qNnVgaWekzZBSTNCtJCg5ONcFAuCDkfPONtH087G3oht0VZD4kcFx5zcrLbm84RA4bm21Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB2666
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_124829_829376_8560DDFD 
X-CRM114-Status: GOOD (  10.29  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, yash.shah@sifive.com, robh+dt@kernel.org,
 palmer@dabbelt.com, Sagar Kadam <sagar.kadam@sifive.com>,
 paul.walmsley@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch is created and tested on top of mainline linux 
commit 856deb866d16 ("Linux 5.9-rc5")

Reference log of "make dt_binding_check" is available here[1].

Just in case required the log of dt_binding_check without this patch
is available here[2]

[1] https://paste.ubuntu.com/p/d2bXwvpFz9/
[2] https://paste.ubuntu.com/p/X2TzBbCs3k/

Change History:
====================
v3:
-Incorporated changes as suggested by Rob Herring here[3]
 [3] https://lkml.org/lkml/2020/9/15/670
-Rebased patch on 5.9-rc5

V2:
-Fixed bot failure mentioned by Rob Herring
-Updated dt-schema and kernel as suggested

V1:
Base version

Sagar Kadam (1):
  dt-bindings: riscv: sifive-l2-cache: convert bindings to json-schema

 .../devicetree/bindings/riscv/sifive-l2-cache.txt  | 51 ------------
 .../devicetree/bindings/riscv/sifive-l2-cache.yaml | 90 ++++++++++++++++++++++
 2 files changed, 90 insertions(+), 51 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
 create mode 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
