Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 884A7C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 17:36:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4745F205C9
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 17:36:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l/IcepQS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="yUQZnI0A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4745F205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M/SzZbX2J1fN+eFaCOF5bLgJs9D5XnJ2yQ/Td+RLcEE=; b=l/IcepQSMqREr/
	nui8yseb3sf9PDNW416l4p2Gsfq3Lcf2dicGE2yaX4sYTS8mJOF6ScYBEdaspUFcGKjvjS2wKPfxz
	QUJkCNEwSslpn3p2Dubn9j4S5FdrZfYPzqe16npQNgmR0aN0yF14QLQwjZBi2DxUxTuUtkN9rDn20
	rjgwx919PMpANKJB7lbXeluu9b9n4Di7fCV5fjt8euyTgsGYH+B++3TJTwjIeHSpPL5f5QNsYmcsc
	iH1f4gClxUzGwjRoT734X83I2RBE5HWlhZzP/mK/YQB59Uz5B+HwGbA+5QbTPEd5MiGpWMNWGF1Pq
	uEat3mf6gpYJC99MZZ9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8TW2-0007WG-1D; Mon, 25 Mar 2019 17:36:06 +0000
Received: from mail-eopbgr110137.outbound.protection.outlook.com
 ([40.107.11.137] helo=GBR01-CWL-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8TVR-0006ay-7N
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 17:35:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWnC49J5Oc0gQrrbEtj4JNG+otazyrUikQhJ18e02YQ=;
 b=yUQZnI0ADyGVtJU/77+Qlrgi65v0FDFu3gN4NYmqSWxyQld1OBwK/3xkYZElNDY4Aj9dPFAuzgPZ/MjgfBDGWhcHGwWlUYHN4/j0AQ8aHyDJIkh7GRxrmftIbUV4DkV6TfFThbFMDQphXlydfKkTd8zN6Dmf8L+aaK2FONvTyFc=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB1279.GBRP265.PROD.OUTLOOK.COM (20.176.143.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.18; Mon, 25 Mar 2019 17:35:23 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1730.019; Mon, 25 Mar 2019
 17:35:23 +0000
From: Gary Guo <gary@garyguo.net>
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 4/4] RISC-V: Allow booting kernel from any 4KB aligned
 address
Thread-Topic: [PATCH v3 4/4] RISC-V: Allow booting kernel from any 4KB aligned
 address
Thread-Index: AQHU4uxsjUx4ErEWrEG6lqC2BuMQvqYcOP6AgAATU4CAACR7gIAAFbOAgAAV5YA=
Date: Mon, 25 Mar 2019 17:35:22 +0000
Message-ID: <e12f6bc2-c993-1dbf-37b8-9562870806f1@garyguo.net>
References: <20190325092234.5451-1-anup.patel@wdc.com>
 <20190325092234.5451-5-anup.patel@wdc.com>
 <20190325113935.GD27843@infradead.org>
 <CAAhSdy2dds7pp8=XX+zbKbMoWbgjPxP6r4aMZJeHyqHV2MP4CQ@mail.gmail.com>
 <20190325145919.GB14826@infradead.org>
 <CAAhSdy2je-_=AHPawbV-8cUR0P7WvqDZ5wNdEmDVQkR-a88Eog@mail.gmail.com>
In-Reply-To: <CAAhSdy2je-_=AHPawbV-8cUR0P7WvqDZ5wNdEmDVQkR-a88Eog@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0356.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::32) To LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8c::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2001:630:212:238:3697:f6ff:fe55:55b1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bdcaedef-de87-4d1a-f480-08d6b148424a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB1279; 
x-ms-traffictypediagnostic: LO2P265MB1279:
x-microsoft-antispam-prvs: <LO2P265MB12795E08DD1AA197482E7278D65E0@LO2P265MB1279.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0987ACA2E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(366004)(346002)(396003)(39830400003)(199004)(189003)(99286004)(52116002)(486006)(446003)(476003)(76176011)(14454004)(46003)(2616005)(6916009)(11346002)(2906002)(36756003)(256004)(71200400001)(71190400001)(6116002)(86362001)(5660300002)(186003)(316002)(93886005)(31696002)(229853002)(6512007)(2351001)(6436002)(8936002)(81166006)(81156014)(6486002)(25786009)(31686004)(8676002)(4744005)(68736007)(6246003)(97736004)(2501003)(305945005)(106356001)(53936002)(105586002)(7736002)(508600001)(102836004)(6506007)(386003)(53546011)(5640700003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB1279;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZCnPDlbhEjohQZqBotyn5zmz5lG6VJrUCVjIwG6hCCK6DU2XvwZblm1vZE2xG3tgJ2UEzGZ7FCbD0rdssFY2ujVfIDU8ZeIsWHKQ7/s1klDZZkd6EcMsMfqaGOXO4J3lbkBtSAI7yDSy+iTlHhPd7lY81VF1bn1ScIYnE6wUUsZsRYTRt6f5o/jtYDDil+0ybdrq2sNy5c5Tnj41P4QtoGna7nldQS1QEGXpGWVbCRffWnzDd9SpXbNL/t33DvylNo4Vp1rX69RQk+LRPo15Ybcxb2afarpTLWnx0BZ9Bdw5JKTh+4rmmhwnScppfjC0wSaoB2PGm68FXSWlu0OUGR2jW4Qhq2HQlEeeqx8NTHGfQ4y9DwxVmy8MrAfbaRBHqImr5KY8er3mFYEEFiGCdpLQ+Uj5W514ulZoA9/SAwo=
Content-ID: <DF7F218FA58BEF45BB1B60683EE49177@GBRP265.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bdcaedef-de87-4d1a-f480-08d6b148424a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2019 17:35:22.9855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB1279
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_103530_143977_51EBC078 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 25/03/2019 16:16, Anup Patel wrote:
 > 1G mappings will give better performance compared 2M mappings.
 >
 > This will be very useful for performance hungry system with lot of RAM.
 >
 > This patch selects 1G or 2M mapping at runtime based on load address
 > alignment.
 >
 > Regards,
 > Anup
 >

Not always the case. In general, if set-associative or direct mapped 
TLBs are used, then either
1) separate TLBs are used for different granularities. Usually very few 
entries will be there for 1G mappings. E.g. Intel CPU's D-TLB has a 
separate array of 1G page TLB which is only 4 entries.
2) a smaller-granularity PTE is "faked" by page walker and inserted into 
the TLB. E.g. Intel CPU's I-TLB can't hold 1G entry at all.

In either cases the performance won't differ by much. In fact if 1) is 
used there are cases where performance can be negatively impacted by 
using larger pages.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
