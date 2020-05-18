Return-Path: <SRS0=JdoE=7A=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B484FC433E0
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 May 2020 09:15:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83C8F20643
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 May 2020 09:15:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b6/X61sR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="mF5mi/Ab";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="U7JsjEKb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83C8F20643
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x1Qz6zUFuTDII6Nlah4t/E49pwHMft0wv/9mf8WZvm8=; b=b6/X61sR2/mqIOwVVVJHQN8A3Q
	NDQrSO4VQy2BBg0wPu9FnoPxnHpQ7rMmLyPpQDXGujocY993MFyEnNFH67/9wNYGCb/ZuiMuYRZWL
	1+/OKalHeKbxoNq6HonvsQHkksPEfJJa/+vRdm60Xy+0B0DxqRv6y49mbZX1zFlvVVj8ho9LU4njc
	6iqwFsXU6IZLwiKckuVr4D21zloDYQFIbYkEWTUr97jusIBMexOStz6K190QygBSFZOkjyXrtfa26
	MrbE9zi+DdvrZWZg3+X/M2VOY5G/4EtSZGSJhNHi2/8zMthDRqZ2QOwP0NoYRXs9MBTqkLkFnW7mr
	D4eUV+Xw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jabrl-0000bn-BK; Mon, 18 May 2020 09:15:21 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jabri-0008Db-9o
 for linux-riscv@lists.infradead.org; Mon, 18 May 2020 09:15:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1589793318; x=1621329318;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Kkx0VsavL/mGzZm5BNs3kwfCDw/LGSGsVxpUXxhdWwc=;
 b=mF5mi/AbKzjME/phRUAP7TYAWhYMf3bgAn3/W0SMd7PN7xyGWBmW5QCT
 +SfrLzoJehnJwmYXnmOa3t/MhsuMAyTIHhiLmOkhkorvcWTCXiipQTZOe
 dSM+qfdxkeeEUiwNCFnbws2A8TIghLdpYgc6wBmx/GfMoHQSjxkEgWiGL
 kJfktM5zW05X079rfSYbkXYpjTUjK7tviqkfej6/HvEU/zopgt6W/GsH0
 39o3TYCO6nLROKdQvOZRfEPbd4lzSyqPOUuHhrnulAzEYotLSH16yoqo6
 oXNN+gUmvguJOPB/ZlW0dgUUMopUch+/psJNjTYj3jSMneYfubY/OQq5S w==;
IronPort-SDR: u9ns62/6Z7F2v45ev6GUdGYssgZJA8IkKETapqu7ILCiRv8D8voj+WIdz5R9rOJ1pGVbt0voJ2
 3QJ8rvVG/gVeMwyI7fUPxPvuJFrKffBDXzzituwO4AUkO5vROj43k/UQTcSQZXh5Z7SS0svFD8
 cdY8acAXVm7vdtBZbiSLVDJZIT8xVIk/VpeK2l51Whr1Hlc+0LhtW86IV4rID453JBtbbg4i1g
 6zDk7zxvjyibHGXc1K+rFQDjkViFnJKFu8+DyN6nU5FZdY8QAPIS8b/7yQq07Se4617/IGuY2M
 iwA=
X-IronPort-AV: E=Sophos;i="5.73,406,1583164800"; d="scan'208";a="139365892"
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
 by ob1.hgst.iphmx.com with ESMTP; 18 May 2020 17:15:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htO+SNb8pPkU34+mOfyDEoHqB+58M1+g/iSgCodnclopdu6sqWX9AMseTfRVKLP4WXOxmL+bnhJsH/zcnim9XcNiudXSxAGon3fW9y9NB5s/iLmHcQXx+ZxdBwh7zjVhp8rpoNGrGRt8dQMJRZZXh61p6JVEuBMHpsz7W8V7hgusSJpstv+nvJ5fsDJWrtJYBtJ97WwC4TWTh/xDpYkOpA/GqkgOfk6BEt+DYWA495I9J9XeZkOqut0cxUGCtrAQQkdlZZNNvD9fyHib5Oar64M6l17JckPK5OFPRFohpGDpiBvtlQUJpAj1Y2YBHdouGifFMZ9WVxWAm4OfFd3EqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1Qz6zUFuTDII6Nlah4t/E49pwHMft0wv/9mf8WZvm8=;
 b=Xe0uES67NjUUZDODOTSzcTbNYCWZTNyVgVJu/suUL6A/Ssm4lrBpKCJKbuTNicDmrL9i5gvNJrG+l+6YIgqlji819YI/I7xCPrkCcMW2kfQ3Vzhshnd5t5OQWmer/HJqoCMf8MOw5H3Fb1GzmI85rng+DGexp2B2tUPY20uOreiZ9jpxvDJf2pjy3pwYbG4+jCX1usi6/zPPI9O+f6/gKzC0nPLKVHzg53aUWbWLJnFwutu0BQrOog52knr0NkwJN1wCMRmAy+i5vwQJxXyK926AoiQRELciMK5+dfLJk1IRcSZDZRPNhgZoiN5lYfwBO7kINJhRbm5mhRU7ieftuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1Qz6zUFuTDII6Nlah4t/E49pwHMft0wv/9mf8WZvm8=;
 b=U7JsjEKbCGDIppJ/9VNktuDox+Cmb9mZW6bHMBGl5cVcxmeg/r3NgRbMD1WqSgHbP3z0H5LbOseQyXj3dydPaS0l6d3CR1n//nkcpyCmjeYdUuLtZZ8uuCEkU/GWHAndiE3/W8uyOa+u+5dzLzpfiMAi5EhNc/jUAfiF8CQDl1U=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM6PR04MB4155.namprd04.prod.outlook.com (2603:10b6:5:a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Mon, 18 May
 2020 09:15:12 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::f8b3:c124:482b:52e0]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::f8b3:c124:482b:52e0%5]) with mapi id 15.20.3000.033; Mon, 18 May 2020
 09:15:12 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 0/3] More improvements for multiple PLICs
Date: Mon, 18 May 2020 14:44:38 +0530
Message-Id: <20200518091441.94843-1-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0155.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::25) To DM6PR04MB6201.namprd04.prod.outlook.com
 (2603:10b6:5:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (106.51.27.1) by
 MA1PR01CA0155.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:71::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.25 via Frontend Transport; Mon, 18 May 2020 09:15:08 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [106.51.27.1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0b89fa1a-1088-4239-d64a-08d7fb0bf7cd
X-MS-TrafficTypeDiagnostic: DM6PR04MB4155:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR04MB4155C0BCE678283C0C6D72148DB80@DM6PR04MB4155.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sRjsiLnyx03V+XZcJG47jJKbHwF+pzK1g1OZKkC4Y+B8k5ZKLZwDLehow95pJV8xNvI60ZvrGt8E7k6NkLneuPjrRE0QNqN0HIjLA/KfbYITYVS9hTVnxA+/dGL5vWBeCAv0iyC/E3usvvj8qvKc5NZUbE0VNqSMfvpuHwATyFXAs1Vmvdl0do6y9ZES5VzP3EFF3ZDF8ibUtQUGhAsIt5CZvohLJ3qvfC/YLS3bHGimau1j5i/UO3WswgLYIYC1SstNbNht4WoDJ1gyJBeNgKstaRlFUadhiLIrvOOizQJbVI0U3Fp8rfG0PgmEjenZUhvPO8HabRl1dhGcheBzkQ86xDA40OS7rmpaL8+54I3hUzjjDjFpg8yTFvPRMPdJ4zRXXG38zZbmQx1vzYU6/0oIIQskaPf5mvyygOhN1T24UV4HSW6TEQ4o23ocFe+5CeJPIgGSOH2Zas1cgmOSyPTo6feXOYU1O0gOEkDW6R6mF2IKlqvIyheoO1HthXuYGvRxWAAVGYxB616ChKHpLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(55236004)(26005)(36756003)(316002)(1006002)(2906002)(86362001)(478600001)(6666004)(966005)(110136005)(54906003)(8886007)(2616005)(44832011)(55016002)(956004)(1076003)(52116002)(7696005)(16526019)(66556008)(186003)(66946007)(4326008)(66476007)(5660300002)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: J5HnEHsNhngGd7OSmwOopKrYtLl6dZMo2T0w6s/x+j/eb8EmO2Jg/AM4GFHEI9bjRWHefGoq+qEgF8FauJmNnW0fxqvs62L8urHYLuz4uUita1Hb3OY6JB8l1RSSpWTVTE3iHq9pTshuz0AjSXV8QYV3veEFjFh5/uNbii1TIp6nX8qHx/g+d2Ln77F98Lk5vUr0dVKMQMe3fmtbZSO+U6Z97LZdJ5kHmxXMNQ+HUCCBCA/UKISZCBTADrK8/k5PQI3eo1V16uFBFNmjQD26MgkeS5WWdc3D0+ySsL5vRjzaSAAfQ9eWswN39LqWO6MmjggBZlukhCS0UWCnSXtJZaq0WJ8wjYbibEAg0gwNz3qzaTPxN4JkMJJKsq/+bvKKFz+mbnGIOdPJE/s9EoE7RGoPyzlHE2BQtFB4ZK6XF0Xzd0ViOisvEm4k/677JnPjl129UGZEpiYQe1XCwQ0e5HjXo/OtCq8iNAbtPZDoZFk=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b89fa1a-1088-4239-d64a-08d7fb0bf7cd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 09:15:12.0706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HdS5qbjHmYDMUOiATND/M3jboExsXXk7zHJE+6rA46aozY1bArG70ezFZf4QvrsyTmz9RFRr2Xw+QamQgJhLDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_021518_436769_8ADC0269 
X-CRM114-Status: GOOD (  10.46  )
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
Cc: Anup Patel <anup@brainfault.org>, Anup Patel <anup.patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This series does more improvements for supporting multiple PLIC
instances.

PATCH1 and PATCH2 are fixes whereas PATCH3 helps users distinguish
multiple PLIC instances in boot prints.

These patches are based up Linux-5.7-rc5 and can be found at
plic_imp_v2 branch at: https://github.com/avpatel/linux.git

To try this patches, we will need:
1. OpenSBI multi-PLIC and multi-CLINT support which can be found in
   multi_plic_clint_v1 branch at:
   https://github.com/avpatel/opensbi.git
2. QEMU RISC-V multi-socket support which can be found in
   riscv_multi_socket_v1 branch at:
   https://github.com/avpatel/qemu.git

Changes since v1:
 - Re-arranged PATCHs to have fixes first
 - Added Fixes tag to PATCH1 and PATCH2
 - Use %pOFP in boot print to distinguish PLIC instance

Anup Patel (3):
  irqchip/sifive-plic: Set default irq affinity in plic_irqdomain_map()
  irqchip/sifive-plic: Setup cpuhp once after boot CPU handler is
    present
  irqchip/sifive-plic: Improve boot prints for multiple PLIC instances

 drivers/irqchip/irq-sifive-plic.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

-- 
2.25.1


