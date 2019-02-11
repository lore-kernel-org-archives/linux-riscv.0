Return-Path: <SRS0=4uv/=QS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B5BBC282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 20:03:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A6A820836
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 20:03:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UEdD0xvL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=wavesemi.onmicrosoft.com header.i=@wavesemi.onmicrosoft.com header.b="ArtJpm0W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A6A820836
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hqC5nAhU20y/pd/G8X7HKEwPLzKlqGvzsTFOoAEGA5I=; b=UEdD0xvLDLt7oB
	wX0Z1BK/5wqh0qh7mCeWv/BZHOGQau78oH17KeG28DlwcoFhrGG+yyeVFZow1U3SXZtxGFVEnoCzr
	8uI6TGiv03TRUz9HI1xMoxc++0PGvmGVeiXNSJitmEdZwyQ64n/PYTAj6/DpIocOMonpNTbxGaysK
	oX8mLraB7XXj6o8wBVKUMAmhQRSEE+SomKbPZwBdksl7x49c3bexYSAjCWwVov/5M1u9C0j/JBoFs
	AfNqojY4V5txH5px4HYkxM8svCnJUlK8hBrH57e62F1l5Br/yFvymSitQYOKJWlubo1oFpImNeIgI
	MROfObmo25MpOKDyghrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtHnf-0001OY-Hj; Mon, 11 Feb 2019 20:03:31 +0000
Received: from mail-eopbgr740098.outbound.protection.outlook.com
 ([40.107.74.98] helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtHnb-0001O2-Dy
 for linux-riscv@lists.infradead.org; Mon, 11 Feb 2019 20:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=600UzmL2YudGCfAJOC32KYHmKJ7ao9Vn+twuUS/X1R0=;
 b=ArtJpm0WTxebPnhHCl1CcSKXlHZtyYjL1GukDZyDyRFuHKtOOklaji3ig80ctB9zb29vv5ueiU91NsY1uuJjqAE2AJvPUQNW5A1pvKTJQyH6esjt8nt7rGS2tm/4u00tg1HeRPLB0Sef5pI8hIfDIn5P/N5K0IaFRfOla49Oqbg=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1760.namprd22.prod.outlook.com (10.164.206.163) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.21; Mon, 11 Feb 2019 20:03:22 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::7d5e:f3b0:4a5:4636]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::7d5e:f3b0:4a5:4636%9]) with mapi id 15.20.1601.023; Mon, 11 Feb 2019
 20:03:22 +0000
From: Paul Burton <paul.burton@mips.com>
To: Michael Clark <michaeljclark@mac.com>
Subject: Re: [PATCH 3/3] MIPS: fix truncation in __cmpxchg_small for short
 values
Thread-Topic: [PATCH 3/3] MIPS: fix truncation in __cmpxchg_small for short
 values
Thread-Index: AQHUwcO4vpEKEcxAykiWUulx6meNb6XbBiWA
Date: Mon, 11 Feb 2019 20:03:22 +0000
Message-ID: <MWHPR2201MB12772F5893AA8BEF53CB27F1C1640@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190211043829.30096-4-michaeljclark@mac.com>
In-Reply-To: <20190211043829.30096-4-michaeljclark@mac.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0034.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::47) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:24::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [67.207.99.198]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR2201MB1760;
 6:ADuv8opraC8Yd3gmOyrezixw3lZr48ZB08edd0W6GPr4vG/8dIOi8hA8G09mmbD5xsBeLCB/zWV3KEFSf5lPxdW/CLMhjk37dKWn2Rt82guKvuQs1QDqER0C9b23xVJv+vrPqYro790zcEUYz++WRIPrxbdZJ+eRvreOxGB3Rt71kWE4Nm7cvpg/kwcrBk+DG4aefQGPnjuQrddhWpkSqSVlUpClmVoJtoIrpNGkG/AxwuYF51AHx+/Uc3CZhlfJQU6Hu8F56mIFZmf4fljb8vIO5hBwGAR6SZQ7c76bsLQ19G9WlwAIPt/OJC9zoW+Wx5gQs3nmw14+dKdP4VKIVOumO5tq6dNEnmX5tHwZy6TFqXEwWqZY5BSs7FulQqum4QeZWAWIj0PYcV/lBYvcZBQBG80+MYJjnruZe+95e7Qee8qiYDoHHe+NAgFmH+bh2k5fyAGtBZlw4I1GZQG7nQ==;
 5:SdfXcnMjDyk9TE58e7PeGtjBPqZmAUSMZqGVGnQQ2dn5GCmjzCHpWWIVcYCsRq1EbFmN0WwRF8AE/bczBujWESkXvrUuR5JU68goohjAoWGwRCskU5jLtuWjiZDelqnBJB9KtQa5AwzhHTeYBJ5km7HMjQz2SmXDNcE2zMmISoCpWiazulA1jQoBpwpOx4OQk3Teu6VMhPb15ya+qZsAcQ==;
 7:oRuw1PmVwUO2uGelL4Rpo6/idk2ppMhLVisTk85UFWnRhFSBGvY4fkr5nJIFwxkWy7lOWBoIEpvF4DpQVZvFm5tHeRoIIGtPVWqpn5u5ykl95wGSW7cpWBxduNG0zQfUlHyOhc0Hj7CE25NyIOuYQg==
x-ms-office365-filtering-correlation-id: c5e29e7a-d85b-4db0-4771-08d6905bf97e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR2201MB1760; 
x-ms-traffictypediagnostic: MWHPR2201MB1760:
x-microsoft-antispam-prvs: <MWHPR2201MB1760C8B6D0E86FDD3A89F543C1640@MWHPR2201MB1760.namprd22.prod.outlook.com>
x-forefront-prvs: 0945B0CC72
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(39840400004)(396003)(136003)(366004)(199004)(189003)(66066001)(7736002)(186003)(26005)(4744005)(42882007)(6246003)(6916009)(52116002)(76176011)(478600001)(9686003)(305945005)(7696005)(386003)(6506007)(102836004)(3846002)(54906003)(4326008)(99286004)(476003)(11346002)(446003)(53936002)(486006)(44832011)(74316002)(6116002)(229853002)(2906002)(68736007)(106356001)(25786009)(8676002)(33656002)(105586002)(81166006)(6436002)(81156014)(14454004)(8936002)(71190400001)(71200400001)(55016002)(97736004)(316002)(256004)(266184004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR2201MB1760;
 H:MWHPR2201MB1277.namprd22.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oXM42BIGYodQPrRIM7SFXc6fXv/LjWwlfn/MuoKXWev/M8Ogbb3TWXGdC8AeZl8YvUKBVCR52gQfsXK25utvaXcCEOqOFII7MWXG3dnbTpYHI+dHK8Ne/jdWOpsRGQfwqkBpXsLzhYbR1hJNZ8xhTbqH1+EzLg2HphV2WX5QxB4N0GaDOcFg8GqkqaPtsuTJf/X0vi8BOuc0PEJ0qysq6B4tJhMF7r9oSr61tGrSnnWCNjat7xKCWLTpoZzjn41b6f+ZldkK+tLQIwS5BVjSEs/l8DCOb1aVzjoZK0AR6qdZUtKpumJ92fUF0TZl0lC6kr2VNTm8vSslapNpHZVJmEb8XQZFfbff7w5YcNdILBh/SiySGWbqG5e+n8iyWzQf+w2g+diUTK+8cTU4IDj4Rndkim/4tvQuPeJafZfoFPY=
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e29e7a-d85b-4db0-4771-08d6905bf97e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2019 20:03:22.1159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1760
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_120327_515569_45EDCDB5 
X-CRM114-Status: UNSURE (   8.12  )
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
Cc: RISC-V Patches <patches@groups.riscv.org>,
 Linux RISC-V <linux-riscv@lists.infradead.org>,
 Linux MIPS <linux-mips@linux-mips.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Michael Clark <michaeljclark@mac.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hello,

Michael Clark wrote:
> __cmpxchg_small erroneously uses u8 for load comparison which can
> be either char or short. This patch changes the local varialble to
> u32 which is sufficiently sized, as the loaded value is already
> masked and shifted appropriately. Using an integer size avoids
> any unnecessary canonicalization from use of non native widths.
> 
> This patch is part of a series that adapts the MIPS small word
> atomics code for xchg and cmpxchg on short and char to RISC-V.
> 
> Cc: RISC-V Patches <patches@groups.riscv.org>
> Cc: Linux RISC-V <linux-riscv@lists.infradead.org>
> Cc: Linux MIPS <linux-mips@linux-mips.org>
> Signed-off-by: Michael Clark <michaeljclark@mac.com>

Applied to mips-fixes.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
