Return-Path: <SRS0=uiah=DN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB71C41604
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2020 17:54:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2BB7206CB
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2020 17:54:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VtHiF3PK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sifive.com header.i=@sifive.com header.b="sRXcjr9W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2BB7206CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pir54IDRUzYv0aqI3rVVjYEgknivE3nCEHUZgx7hAjk=; b=VtHiF3PKcOgdKZXXl2+KvIbgGd
	zsXyxr3X5j1dr1aBULnZN+Y8F2pB1HqLfE8vEIO4hVLrgoPU5YHHvZHQRabNq9R1LMluWaPQurVk1
	7Wu6UpK6TmUFzv6Ho9D8CIGJL+QMowmgfZs59qfxV2q0gi/xXogr7/9S1cxwdurz/MWfo7oIQWyqT
	g0ZBCa5guUGCUV8uBCb+S68cJinmj4MWqHoOw4UXiBx+TTsWKrinzKGVX2y2zVx0E76Ofr/3RirPq
	2d98yShQ2aL1HNIv8YeQKL9WZaDnV/oJHXhZvNBwjbg1C7dUbC0X5eqRN98f+JnGGo0sAJOHYmWM7
	YNJ9q6nQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPr9r-0001c3-Vh; Tue, 06 Oct 2020 17:53:52 +0000
Received: from mail-bn8nam12on2086.outbound.protection.outlook.com
 ([40.107.237.86] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPr9o-0001bD-QY
 for linux-riscv@lists.infradead.org; Tue, 06 Oct 2020 17:53:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ON8Kp19+OBH0wVXvrzdLTqxu+/HgLwj9fnMTNCpYlBppEC/KYNBtiTXQLExiObfPte+lDLHov3R2FHxpzyWeGqdZ7KSb6gKIFnIUdZ32RhC5ioLRjaAKVNvFIQ5Rs54OaWwqLadZqdbqiq9QW882IFl1iT4Kqxyxwfv1rsx7cZgOIX7CbXYZd9AkaAyWomuguCZdHAprINcx4lZwaeWMTi0txkXqQYKl1e8B4qwIStvFzTthztKk3kTMZnm/kO9xE7QOZa3lgt7PBO7OkYCc/yf6wZ9RnRUl8z81h6VdQcyGJ3rRutHYiM3d8dcJ31DdnpOp4yWs5OojcxeJDhEOyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xzvQzoeJAURCGGTEcaOwH5QzvrGzSG/unJ8EVpdmy8=;
 b=Bg+gcZcd0gNmyUSRvOhuc4/CqUbiaZRWnWjcJeOptuo+yYliigOSwL8Qcxt/fdxzw1I1lbxAZl2v8HFYoFtto8/ThAmkB3Ud7ne4ufW/tPIHG9sCXXBl1veFT0H+te0e4U8zkaVK0u3WMBHwLoYa7ywkVfu6V9tL8WuI0f1AcJ5fyEKxWCegZZvxDgGrC1HkwAOAzMCgrNKtMMsn3JKpX/BOzUTy6KXkII4rcunttiBcnBHpkQR4WJqBdB1xxkYn+6n1USkwn4NZCpSpmknovvliwDJdwM4XYmHiO9xBpD8ct/nApIzbh7H7NBD5v0yhTaLwnM3vtBw+283kEtIhmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xzvQzoeJAURCGGTEcaOwH5QzvrGzSG/unJ8EVpdmy8=;
 b=sRXcjr9WzqoUidAhqIc/9Q9gW1Mlo+6CVbHFBMOlHS9c3KvdTJmez4mIV+L+HJjt4gJlibJCOJ1yeeY9/yXvIK9TyCmTXBtyLvGSJH+ds7Wd8immeIPQMkP1uBzB/kUBKgxLL6RlWm8rlH606lYn7ZPBq51aCKwkfu1aXL/5JuQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=sifive.com; 
Received: from DM6PR13MB3451.namprd13.prod.outlook.com (2603:10b6:5:1c3::10)
 by DM5PR1301MB2043.namprd13.prod.outlook.com (2603:10b6:4:33::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.15; Tue, 6 Oct
 2020 17:53:45 +0000
Received: from DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::a48a:1f7c:267c:876]) by DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::a48a:1f7c:267c:876%7]) with mapi id 15.20.3455.021; Tue, 6 Oct 2020
 17:53:45 +0000
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] fix i2c polling mode workaround for FU540-C000 SoC
Date: Tue,  6 Oct 2020 10:53:15 -0700
Message-Id: <1602006796-273724-1-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [64.62.193.194]
X-ClientProxiedBy: BYAPR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:40::21) To DM6PR13MB3451.namprd13.prod.outlook.com
 (2603:10b6:5:1c3::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from gamma15.internal.sifive.com (64.62.193.194) by
 BYAPR04CA0008.namprd04.prod.outlook.com (2603:10b6:a03:40::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3433.35 via Frontend Transport; Tue, 6 Oct 2020 17:53:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c861f8dc-e8f2-41cf-e1a4-08d86a20c535
X-MS-TrafficTypeDiagnostic: DM5PR1301MB2043:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1301MB20433E45558FB202CB22F1E1970D0@DM5PR1301MB2043.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hTfmaE+kKytch7GbREkWDuRYnjrdDoxZfLALz9YiaLkgABkKPRVc0tWi/bHeWAazTpObsqjVPub4xHps7P3Y1kL7LKbYR2WpI46RyFpJ5KZY0epr7nTNiH+qAnwD+BdvFr3jUDqLZNoKnxhtP3NHEq5uehc5w3OCu2dteGYHMCP4Flibe0EbWPLpOKT7fcGmfuFi/lABS8jnAGHoSsw1cRHu8zWXt/0WMJmnrllNf26BLX6XbFvVd8RISD/WSEd46WHmIdD7GU+HLFmHuilFdvBeVBDU5piqfzKKDscejB3DTkLhA0eDbXsQx4p3DGZWiILtts3gouG76KdHcVaaYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR13MB3451.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(376002)(366004)(396003)(136003)(346002)(52116002)(107886003)(36756003)(7696005)(5660300002)(66476007)(478600001)(66556008)(83380400001)(2906002)(66946007)(83170400001)(8936002)(4326008)(8676002)(42882007)(6486002)(2616005)(956004)(16526019)(6916009)(186003)(26005)(6666004)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 7Pb9L1+wgPiOr6wpsCoEX5RFX+CTP39v38hYunZi9i3ucGIpxi9eZwQeDKXTYN3iLY1isVKOgg+23QMVwKy4WdvWm3ejcFBvwrlEiqu3drqqX5armcm/5Y9L18RGwoRo0Z/XmjDA0l5nBuzG90C3BEE2+h1jqSgTHViqduiqh+qkUvIsBtjHUpHbDBBkyZUR/KoKbYeQ5TjjAN3DNPy7qlsvjqbdmPLgaF2IHHE7kJUViKLUjirE/UwcSIzB0LmgM3veN3+kqHXmFUtzZu1FFtGF/QeuLUat5+6bt85y6SvWkaMzZ950LvKWsFGNVJ2s4gbNiV2D3Bu9WCn16t2xgbot35aKn4C2QzbRbcY7E2khzGSpr+0O/C2XuyuLUscuc6gB+WnGL88xwr5mxaGpjV5Be0r4NvPf10f+DmrTl/MDiVURP3WcQma/lUDnVABFSvV0VX+INr2+xFsvDVDC/7HvQfWjzUSfd+ZoSqU/U6QWRI9n6qdWvOeljqJjZWAQEG5m5SGrVYFBCejYm01/FqsojRDkHJUJHPWnVKfotu9x5kRxXeMn8cWp8sP9INVHA/IXKyIEzYTyHNdRjy8zr/bvzWgj+LB1nZqCYRLgkTEozlg1IT8q2oglewP+zvZ2NM1YKs+Go9FLICtR/oJohA==
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c861f8dc-e8f2-41cf-e1a4-08d86a20c535
X-MS-Exchange-CrossTenant-AuthSource: DM6PR13MB3451.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2020 17:53:45.4744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 83h7gjvrBCX8qqubAEIhOad67OGwuUDk2dj9ip+aerqlfkYMbCpOe8x4245Xmj/S141XExPVBEa9WPhz178/Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1301MB2043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_135349_070804_54A199F8 
X-CRM114-Status: GOOD (  10.13  )
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
Cc: andrew@lunn.ch, peter@korsgaard.com, aou@eecs.berkeley.edu,
 palmer@dabbelt.com, linux-i2c@vger.kernel.org, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The polling mode workaround for the FU540-C000 on HiFive Unleashed A00
board was added earlier. The logic for this seems to work only in case
the interrupt property was missing/not added into the i2c0 device node.

Here we address this issue by identifying the SOC based on compatibility
string and set the master xfer's to polling mode if it's the FU540-C000
SoC.

The fix has been tested on Linux 5.9.0-rc8 with a PMOD based RTCC sensor
connected to I2C pins J1 header of the board. Log for reference

# uname -a
Linux buildroot 5.9.0-rc8-00001-gf806864 #2 SMP Tue Oct 6 09:51:24 PDT 2020 riscv64 GNU/Linux
#
# i2cdetect -y 0
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- 57 -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 6f
70: -- -- -- -- -- -- -- --
# i2cget  0 0x57 0 b -y
0xa9
# i2cset  0 0x57 0 0xa5 b -y
# i2cget  0 0x57 0 b -y
0xa5
# i2cset  0 0x57 0 0x5a b -y
# i2cget  0 0x57 0 b -y
0x5a
# i2cget  0 0x6f 0 b -y
0x00
# i2cset  0 0x6f 0 0x5a b -y
# i2cget  0 0x6f 0 b -y
0x5a

Without the fix here, it's observed that "i2cdetect -y 0" turns the 
system unresponsive, with CPU stall messages.

Sagar Shrikant Kadam (1):
  i2c: ocores: fix polling mode workaround on FU540-C000 SoC

 drivers/i2c/busses/i2c-ocores.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
