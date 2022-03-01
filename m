Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAF4C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Mar 2022 00:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wusyJsgH0IuY/IpdX3L957cnCazMGw3vCfELOfDuT1o=; b=m7W7++EHJrpcEF
	fpsxaTqYhOworxGzjCtQp2Hxo19kSRUBjD8V7zfNqQoCq6MObLVo1NLMAaort9ED64dDDzNpS+8/r
	RRTPQEtmE5fi6aGYNMxHrDW72t0Jli9LKni7ggGabJqZm06MKzxKoxe6r3bumGuQ10X7N+jgy57Cf
	xrWTemOtxUn33nWjPpDAhYKFjvVTyr5GVudUUEQuVHuox3pgak0/bMq4x0+Iu0dvd2Hc7P1Vz+CyS
	CQgK0g2lrFJ/4T9Hxvat4oUiejivWK7W43YHdmjahBx+zpJtzj5Lv0GF/JU712nYNHQ1pDrNtbdci
	RWnl3rXgMec4xlLF0xKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOqk9-00EXD8-Vl; Tue, 01 Mar 2022 00:51:58 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOqk7-00EXCJ-6m
 for linux-riscv@lists.infradead.org; Tue, 01 Mar 2022 00:51:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646095912; x=1677631912;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=PW7/rJwR3mv6nUDZ2ipmgFutk9psTCicdEXXevnAT7k=;
 b=HaokI8FmdWvzmtCLNM4aO49EvVWQL8T4Rlq2dmN1Ol4bghfgNGF6iQwA
 b9H3JRA/cuR6ax5KBCVyeV/T6mRgT1WoINbfr3pCM0Zo5AC6T8tpN3Fjt
 QA7uGkUN/y/yj5j8E3LoAqtyC6gA8wrNEOx2F4RnYW05A4XVH7EVQifXw
 3oGXq4kXynsZuhEO4azZVtpwrm5CiKfEL1N2xqVxqEJfgnsPp6AlE91iW
 lYHl9ItiaGfitaar21C1SVrorrCM86S81TMtn6+8zEsQfOxK/R3Crp4YC
 F6Yo571NV0azfmpe5JVLuZTqri6W76N63u8cXebEBseibd3LGZ3Ar2VU4 w==;
X-IronPort-AV: E=Sophos;i="5.90,144,1643644800"; d="scan'208";a="198988110"
Received: from mail-mw2nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.102])
 by ob1.hgst.iphmx.com with ESMTP; 01 Mar 2022 08:51:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIU3XHoT17dQ6OEX/IbEgCjprxTxoUBh9os7TlWyc9OsogtoHfULaSezaip4AK6y+5yV5FrTp6CB4Z65NqguNg9YQ6wScLhpjyWlX1f85aAH14U6XB2wO2d56LGwvDSQ4VIStW2k8jTZzwrSGrRoodbu7XFHrXqojM+C20bHouXYiZnYD1qNa5h19ypARa1m/vE+4xOTxFGazYa6UZee6+JkbL6xZDtsYpL8HFd98e0Z5oj3TQWFha+p1VE7cHlrMkqxcvesxLwJNlzWJlikoUIdVGIUlDp4ZKjCnfSVBYn54ydKEKS5JdMEkOXtqhAlOCi6TrJJqYbzcYdBP/aOlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKSPDSctxWWi8K2bAgTCi+0UISklrxZW1yQe6AQAdw0=;
 b=MwTMODCl1zRzLeEO+ijZLPggYHIl09ShpuZECR4sxZhQquXDdSvQd+tk8s0EicfUraRh+/H2WbKr7UF5cw/6Ua/0uQ2MGU2NrsaePEYtodpSvCSs9lEKr1LYVTyLq3R+eiFXuA2IPWXjdBpfVwE3OQ2KJ4+Qhy8r2xxrpFt4t2bCFSaNc9Hv2pWA4kC2REGLYFmgTU8spqDEDoh6nMtu2alucrYPcgRHjePGb7zKlmh3kcAAHqlNkMqbc+zulkINq54VS+e4+bpJlvuKGB5aOxCqu4jdkBnZYomVdXqDEEsuLRCGhpCNRmu41842oYlQ6AXf+sxD4ftfIqLjxq7wqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKSPDSctxWWi8K2bAgTCi+0UISklrxZW1yQe6AQAdw0=;
 b=OYW6StZYlrhBCFlC4feboW+NJz172aSt5vYT6O9gSVo35rYKGuRnA91Qok9rWeSE8cWbOPm38UttFq5iNY6/5IPAGhI2klM/1EggxIVP7cQZ71Z+49T/Ibp9sfDA20RGGQ86QDup4jddptg3Sikwc40rkubrOA1oVZ+4lcVL49w=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by DM6PR04MB4604.namprd04.prod.outlook.com (2603:10b6:5:23::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Tue, 1 Mar
 2022 00:51:52 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::f025:4f23:8e46:b2ed]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::f025:4f23:8e46:b2ed%2]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 00:51:51 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: Niklas Cassel <Niklas.Cassel@wdc.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: [PATCH 0/2] sifive-plic minor improvements
Thread-Topic: [PATCH 0/2] sifive-plic minor improvements
Thread-Index: AQHYLQaKA0BmT8wmEkK51vXTMDWgyg==
Date: Tue, 1 Mar 2022 00:51:51 +0000
Message-ID: <20220301005142.3038702-1-Niklas.Cassel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.35.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73627f6d-d564-4fc1-bb95-08d9fb1dacb4
x-ms-traffictypediagnostic: DM6PR04MB4604:EE_
x-microsoft-antispam-prvs: <DM6PR04MB46049267FE84F5A3124A7E80F2029@DM6PR04MB4604.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7ml+QzKkZoTsec0LMqZ1J34QLEX2/yDq7Yftmo9yIuP1fLLc7JZj5H5wpT541VN1GPN4wrGyBUqE3ErZl2wX9L/IqmkTIa2QGsUFJ2RA9VyQ3L/RzAjy8kPEwR4jkFmTVPMYLal85IUsFzVNYGH5CVsDqOytUQCv7KRqkwfH1Jqv07Tw1B1uy4Vegn42L3Jvhy+uwqjYPpp+mt1Hq3OcRhbZ+O/qf1/TXB7x9O1EX8Ma5zSD1IIIi7RCrt71yQATeff2KGLsrtPhA5iwDStdByD2TSHpE5QWRu03+BX3l/lPWk6SOIeSTBtZVKw5pbMm8EeXUP5RfTwT91O9vNyt66IBTr68dht4bfkAlGl3RzMtRJhpTDjXNyfTEnDTjB4Rx9Nf3E3sU/RgpeS7GA981+axu/EQAg3Qe3HU8nhhatrNm8Ws8BgiLDY0L51D62EM8AHbWDoaVeXLDdr5ruqG9y0CWSscbJugjiqyqsTHf+flpHBo8bZW4X+ghhKtf6Cd3P2CedF/3+JxY/YpSDyK1lenEVfiTZBImbN+0S/cbgsir4q9JRHEMv50qR3pouh8IKm3smVH1D8ErbcOGi0Ga321Aev7NIaSOepDmwF6QJLFEs2xkhcyXV3iKthCxwj1CkJOd/3nOJJ8Bkp1DOm0K2AmQClZkJAHPpx/ZfkRZw5USjkE5GVet3IrlSeshm8HIZEtNHwL+6mWi2q20FGQ7Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7158.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(26005)(2616005)(66446008)(64756008)(71200400001)(66476007)(66946007)(66556008)(54906003)(86362001)(6486002)(1076003)(508600001)(91956017)(83380400001)(76116006)(36756003)(8676002)(122000001)(4326008)(6506007)(82960400001)(8936002)(6512007)(38070700005)(5660300002)(4744005)(110136005)(38100700002)(316002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?CNslOZWDdXvpvB1VZczhj6NyBRl1jVXRdN8a70D1erxupNmRcS7Ggxqnzv?=
 =?iso-8859-1?Q?MQXauLZnWa5aladC6YXWSi8sRVO72jIWHoGDGtayf0QWamggOskob7O5Kt?=
 =?iso-8859-1?Q?jt5XsWz/nTqaz6STCMpEAkRRd/9k0RxoKDqWY10mBnPpHPpKTjrCd5348w?=
 =?iso-8859-1?Q?2hOsMMeq1+u2lg1AsA0ykQSKDVmRR/ypBABkd82AU7JJyNcsZt90Hkp7nh?=
 =?iso-8859-1?Q?u9alilS4shyje5HXORolinHNKxd2IUJpEnFbuN9NRiRx53pMdbgtKbsP/D?=
 =?iso-8859-1?Q?f5vA53thwSk/7mOVrZ4ezu2RrSkTDmlYHPxzzvUJ+uQSWCU2icIgfc32yy?=
 =?iso-8859-1?Q?LhiZ6wVFA69aqVV2+xYTPV56d7iTp3kqvFPTNs6Bdmo/73s9irn44f0vz1?=
 =?iso-8859-1?Q?DPhu468ksGVv/XCPbev23joP7Bhr4oXcAZh5+DlhzDUtKPkrGs8kNvRDNp?=
 =?iso-8859-1?Q?N0SH8nev+Q8OT06ZAMGthEOVL2yzeqN9WkOU8nhmIZvFwWzSFtV4z/9xiu?=
 =?iso-8859-1?Q?MppB7HBg7axuEbfMgSHhhYDOXYwrs8DiekTn8bTt7k8A6URzs/w3vHIirs?=
 =?iso-8859-1?Q?55qeo6B8+z1yMrTAPy9nQccn/5AWrH5xSOQa4L6BLlDszPOZlB9RzSuyZO?=
 =?iso-8859-1?Q?THja/0W24TOWC8vYp4hCoPkixBezI2IRXYQuwEqJmllf2MorgHt9phLhzj?=
 =?iso-8859-1?Q?oZcR7k20ZttubP3KN4CRD6xZhYGFxRJ2rYoUycFHmSfbf6+o4ulAk3ZXOk?=
 =?iso-8859-1?Q?pAyfCkFoTBXbH19DteMUvR0hM3UPYBoZYYguGKjbnU4/CuvVgACZ2RTvkj?=
 =?iso-8859-1?Q?fPZyObvnbizK0+2I9JVU7EYLBh1DfdVpYF7C6ZEQtMCOZQTwc+GISP6pGc?=
 =?iso-8859-1?Q?4Z2k6Q2CO4clX2fO0lQ478ZA17PTCWpNMu8KKjWkY9yKxZ9qw3+IQDFK+2?=
 =?iso-8859-1?Q?sHCA+s2ibn/5RsumuWVG+W7lqNpwqGC/2fSD7bvkhPZMKXueXZ1AMFtiyc?=
 =?iso-8859-1?Q?FpMnqcgr2DYNCxLHrMaXdn/iHnF43CgY/z0cBmrh5tenPjNRlVQVAedNZ6?=
 =?iso-8859-1?Q?YlDNvDnErUd2w4uLdcbnp7kbwAk4Pcj9Pl39v/Mh9jr+gVH3xL1pS3m5rc?=
 =?iso-8859-1?Q?sY/9ttJ2YenLiLeFt165Ek6g7n/kTkDyxx+TYceFAjhJaBnrk8TrfA1Rl+?=
 =?iso-8859-1?Q?wH4hGff+sRmFStAXNBp+b4+hblqHXHYh/3UIugnDv6TcCjekuUgtLw+AA4?=
 =?iso-8859-1?Q?Lm26Mrq8GK3UGxgrKMylW2rv3ZLK4dd/AGu1guPdJ7fqaWq9o/WmmyC86t?=
 =?iso-8859-1?Q?fx0+Y01zQT2xxN0tymHN/2kNdX8LxNnp8rRrJWJk6FSIWr+fJvYVy1Zs36?=
 =?iso-8859-1?Q?YDm0D+splSGgBLQov3yqCoczMpSQDP2YlalIehDzBxTSB8MqdqcpighFsJ?=
 =?iso-8859-1?Q?fW34LZrkuTZz7Xd/hA6rRZ1PNXaIHEmmLfFesO9/zB4xZkZLoLDSsbZNKv?=
 =?iso-8859-1?Q?MOFDHnjWULgxnocPSJxSAoyAnfHbxwaeXFodrKguWLjkOpX2o6II5cWxvm?=
 =?iso-8859-1?Q?m3VRf6hOoI+siiwSui0KzKwd5KkL7HTU5UASu+isKUdPkvGH+HvjbpJp1C?=
 =?iso-8859-1?Q?iIbOoRHAdk1T8WcDH84wRMRYhygJIVK0PTvs+RYi9ew0+XFFAIq4r7Xdiw?=
 =?iso-8859-1?Q?9pK82kCx7E3w2hnTPaA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73627f6d-d564-4fc1-bb95-08d9fb1dacb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 00:51:51.8847 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dlVkcefgcf/npUWhSba42dGvdbcLlvJh4EPFYT2hLsllSTLyJDcGT0vO2vLUeOzi6931FGNKLs+33Jn0YwI56g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4604
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_165155_282196_D240A329 
X-CRM114-Status: UNSURE (   8.89  )
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

From: Niklas Cassel <niklas.cassel@wdc.com>

Hello there,

This small series has two small improvements for the sifive-plic
interrupt-controller driver.

Thankful for reviews.

Kind regards,
Niklas


Niklas Cassel (2):
  irqchip/sifive-plic: Improve naming scheme for per context offsets
  irqchip/sifive-plic: Disable S-mode IRQs if running in M-mode

 drivers/irqchip/irq-sifive-plic.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

-- 
2.35.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
