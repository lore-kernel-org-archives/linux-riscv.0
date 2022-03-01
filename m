Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D87DC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Mar 2022 17:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tFSP6Zi9T5jclwMzpeyRQKWhI+jNot4/KfqtJCFMIrE=; b=WD6tRurq2sQxkD
	9YzoOU0VgCoErSSsBlXfT9wk4GMFVQA+AsazDKHFIzs1SZ93NH29hS6HXRh/tHO76MjHOf8I0ym/5
	U9AMH25TWLP7xjqlCe0Vw94VFJY5mMoeXhLJ554Cx5gQf83YG9Toev8YaicY4Hf+ClsbK+xufErDF
	TgzK/O83M1c6HRqcyC1Cnea30JdOAoA/TgHqIdE6uhq9dIEmquiRd9T5zoYN+N5Tx7dUSQQOifBGk
	Gk4T/4ucWqPvcwGe+QWvp4EuvbxW7+sLUZAAUpnuCEib1q4UjcVWfGm225qDI9gzWU9OjaAV3bpTD
	b/kkaaeJBJY6kk1s9OdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP644-0002g3-Fh; Tue, 01 Mar 2022 17:13:32 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP640-0002ep-JJ
 for linux-riscv@lists.infradead.org; Tue, 01 Mar 2022 17:13:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646154808; x=1677690808;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=ynZcyDwAxNkjw7+e2KJIUirOFP8pe0bh1jfoTvOUny4=;
 b=XRI4C/cRZxFVQcs8dDxFSWpBfPgm8YtQdJ9JDcDg1cM3lToT7AQb1LNX
 sdwZCU/I1xdTtflyh++VqQwW3dkE5Jqag1un/ZG1cfucFLE2DVdSqlL6L
 p9AvSPgoOd5l+MEmzL/Jz+YBi9OF6BgtUHo7oLcleR16vqOVVCZolqGLp
 TtiL0MMuMI2bO9hWRzpMy4Gtrii3oDyGtbB0CR6bZG3T7iV78WeY6VWtx
 P2V2+otDHt0+z4XVhu/vz+g8MNCAo1vIpNoeOKNX1865G5H50b9cPzWUN
 vxaGPaqSJ6El9LQ5Nb4TPoJaFodesOiw61mdY1uznslYv104ds5dZwNPv w==;
X-IronPort-AV: E=Sophos;i="5.90,146,1643644800"; d="scan'208";a="306119287"
Received: from mail-mw2nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.102])
 by ob1.hgst.iphmx.com with ESMTP; 02 Mar 2022 01:13:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJyQiB2byj96T6W8J3FWHHVeFrap8PvwiaW8LmJxPLiTHQh0X3+9+YM4cqPrm83dSIqyiTJJETjkaK4DSIGxB01G8DAwQ3eHSOfFB5hkxdqerU/2WEFwe9S7Ec/OgSHV1QZ9RY6AlcAxWfkOSaH2RpF4B4Xe3sXEL8erfjdGUTFk99RgmlL/qLtyHf6dhazVCKEmsyKCp83toGO83kv83cCFW2MVfK1tC/prrVYBE3JJxrCxnQnsjfYVgmbqbN2teqQFVfAoS0pUnIv4QY03sIaxGtKQbxVWckS/uphK0c53cvIpcTfXVAmkkuc0kwCZ8xxbwVWLMoYnqnbpBeUfrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLXGwrvsxxtfuqpYH2mOY3uroUtwOhqtoSiwTX6go2Y=;
 b=j7GSZAigabtQ4zAuJFpWQ3EM1lqu0LU+RjI/kZzup79RdFMcxyYUL+cAWmVCL0bZhPnXirYPGq3cYyGnO1LWD23IMbyIZpwiQotKrZzS+bclg6ysM+roeTddBI9Sm5G1jM5LzCBkfy+t6HGNitcQuMIUwth0J0AABn15bECixmCMFKaQGlelfrZlu6GJmtfwXYFOuzvswyB1p/83wL/FE3T4sBI3gyqandlob/VO2MwIWR8r8M2nNj3cZAJ13VC1cKm/NDOikKLa6sLiYYc11u/WeEBb7f6WUy9u52luxQQ+jDdGtYH+JkGzIhJOyV2EHOyuwYP1v97HWZwqfAc7ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLXGwrvsxxtfuqpYH2mOY3uroUtwOhqtoSiwTX6go2Y=;
 b=ac5Fxk3K8EvpemsQBoeFTeZ2X/gQFT6bKo9nDqhAlJ6O/NTGmDhOXiW+GLGoXuLiP2wXm9UDCwuNGez8EaDUerOqlM9p9Go/f+Kjd0WfwWFNcURhuWipf8mre2AgyRH+7UWs53iJa7oLg5BM+qXOgBNOR3pXy86OQzhaf6k4NGg=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by BL0PR04MB4609.namprd04.prod.outlook.com (2603:10b6:208:4a::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Tue, 1 Mar
 2022 17:13:23 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::f025:4f23:8e46:b2ed]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::f025:4f23:8e46:b2ed%2]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 17:13:22 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: "damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>,
 Niklas Cassel <Niklas.Cassel@wdc.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: [PATCH v2 0/2] sifive-plic minor improvements
Thread-Topic: [PATCH v2 0/2] sifive-plic minor improvements
Thread-Index: AQHYLY+nXoSholW7ZEy+8GZrbzQ/Ew==
Date: Tue, 1 Mar 2022 17:13:22 +0000
Message-ID: <20220301171317.3109161-1-Niklas.Cassel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.35.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb9c17d0-21ef-46d0-ff7d-08d9fba6ca69
x-ms-traffictypediagnostic: BL0PR04MB4609:EE_
x-microsoft-antispam-prvs: <BL0PR04MB46092EA5E64562EEE5D0B660F2029@BL0PR04MB4609.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gPpATipfrqYxshStJpjqYTgXcUync2YS5JARtIb7DGlFj5eWCA4P8Ii0UuwR8WgQk1Fe+lj69OgRozQ4ygfxDluqanaeGUlyx/fz5leuS0ZjA2WbxOzSw5rvv5XozKcSmjGKDB6qxE2tFSsF0aYGhzLXMTdESjdgwqg0AymPH1RXW7e9VBwxq77bpD6qHimQR7Yy6MRL8VDAighcF2mTpYgB+jvTamww0+zXtgc2hHP8CtJBOdMZNBzrUS7pvFQ9uHtWnG39+6hCAd13Fz7U8oM4Rvr2S4DOqqPytfUhcwcrmDEBe+3h4XXmOK5FhPgOVSegF/pBkOGbkIqlyXBUpya7d74bJV9x9Nx1nCWS2+C4Znu/1sVoxW0ZVZ6YQ+fvWk0v/Wa+zTAHR9S653FzCy2nFHM+00stcvArbQSvok6OAs9g7t9ICyxlOJqhQ7loTG2TCNob3pjPx+r+JrfX+K3xOM/sFrUz0TVDuuwBV9HCFVmVosIJ3Sdg7DOybg/rBN+G5Kuy0/UdA/NQepTKXgCM+9Ax7Fc9EnfHT7ZJPstqn+AsxcwO33cd8wGzWfSCD7ae1Ztcair2WbZKbRnsKTP99Jx/1fpan/cOnYKn/jNyc/uFOqf5z1dkWd6WaBDGzzlOyjcNBoHW8tvKLVnOfVhyFv74CQoBzWaJEYDLJlbOptGmyAp5VN4HgxAUOwM/hB009aDAH40ouESEYDTheA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7158.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(38070700005)(5660300002)(316002)(1076003)(86362001)(8676002)(64756008)(66476007)(66556008)(76116006)(66946007)(2616005)(4326008)(38100700002)(91956017)(2906002)(4744005)(186003)(26005)(66446008)(36756003)(82960400001)(6506007)(6486002)(8936002)(71200400001)(122000001)(508600001)(110136005)(54906003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?mjJjXi+c3xooGa0s5C2KX6G4uQgrLPESE0h/j12dG4adH9qNjvO4kiF/MW?=
 =?iso-8859-1?Q?knkct4VBHuvsSrnsUXUi9Ys2CaIqME+Kbi0ZeflPM0jICVLleKbizdDdN0?=
 =?iso-8859-1?Q?fdEBXGAip8++pmuuZEfc1eNWHsHAAo0i9yRWl6RoFLM+HIOxWNguSo21hb?=
 =?iso-8859-1?Q?iuDh+165LSEiPCaUSOzyyifxCV6wQlezBMWNxJZo5pM92hbryftXv1QQTh?=
 =?iso-8859-1?Q?XGXC6STnJ6mEKgVxSllFSSP/bSdn5pUwutlTAKOYYoNZmra3d8MliG+ZMB?=
 =?iso-8859-1?Q?j7EX5EycdnB5nGeQzlrvTS0lxPi4WwiBvHFG1845qTosD00rJ+lwFrqxAl?=
 =?iso-8859-1?Q?P4Lzy1lkI09GJLtG8L9rW7nlTYtw1slef97/YX6WADBzoWkMth19h+W0tl?=
 =?iso-8859-1?Q?HhgMcVKWDHO5nzkz6aKvVwWwvcXDNHzM0Uv9Zdu63uAwQT1uba3n191t9M?=
 =?iso-8859-1?Q?K+K4vf+ODDdnSpAWi8jU1KjrZcwqZfukj+uoliAlPPC9AW71lNnmXzcF+x?=
 =?iso-8859-1?Q?qcbLbdY5lClr9dt5pW0Lf3TjmUmdlI/u4YUIcq/FJqfLatgeYP+Nq1zxiv?=
 =?iso-8859-1?Q?DWRbymU6cMoAeR1f1Sd/v/NQiqN1u+pAX0mDspe+i4vADoODGSgGTzZOHy?=
 =?iso-8859-1?Q?O5SKgTuv8Wmp56dthkX5VvjFAwuQ15QmqUywbC/vqEFUx2ZDDn7s0ZVN+e?=
 =?iso-8859-1?Q?lGshzXry3XJWrFWEaJxFupiBdUmMXWBgQ2wkZbsEVQJNl1cT+YusW3j+av?=
 =?iso-8859-1?Q?vdUAeoYH/6NWPsLdiufNx8nBL+MeomNF4K7TrMg+nFh4MMUPSQ91CycTwm?=
 =?iso-8859-1?Q?hxEhyh8l4tovmNiG7s8ZUvPPk+LcNtpQJrhKvHvoWHVchC6gktBZQ1hD2I?=
 =?iso-8859-1?Q?ZNaVe0+XFm8NeuXAJ7og42qQ8QnogbMTtoNMKLJPGjg431q6VgnPwcIadF?=
 =?iso-8859-1?Q?xvQnX/rciZjoJ7Q15wt1Mc86Xesrs0YEoExhTdJITJyukXA6zQOC2TZVtS?=
 =?iso-8859-1?Q?GUv0OmShyEoX8J32D1jri1dZzYxEexYgv6n5bjRNuKONXVVhT/tIr5zn0f?=
 =?iso-8859-1?Q?buMqwcq2WceNm4f3BQEtK5RnSpdTlE8ZuuaKPoTkJqDh7MB94jhr651wgG?=
 =?iso-8859-1?Q?kCqyOdSiB2+s9EKxwO/IsglkWE2/XRoTX6UyEfwFsCRchH9wvb5gURUPfF?=
 =?iso-8859-1?Q?rFGne9i7mFUNejcxgtkT9JNzRDTsUpcD2PEEM1c+56NWAUnP93d8nN2nbG?=
 =?iso-8859-1?Q?wgdldNxJ+XYgZBKvcFPfe+Qh6ls3XMYR/u7A/xDj37oYLoPFGdltX3M2Zt?=
 =?iso-8859-1?Q?dBo3T+kCsFLuZUBRO3s0KonpfxKb7Mi1T2OrYNfTBNEhidus7g0spir0XY?=
 =?iso-8859-1?Q?phyClGQEs8ZoUz6zkhyfvEEva+bmSQRvpLXDOykoNNz2Pvc7PL+e2LvGBJ?=
 =?iso-8859-1?Q?3kqbeUWCwQW1xsNZQCBF7zETYxlM+BC3bpFr0gKOKl+Hj954d2xgO2aDoK?=
 =?iso-8859-1?Q?/2WS4bt2bnVJEZAI1zbzLo8IdGPWjyYGRQs9VQAzJV9YFIzm5ERmu6fwC4?=
 =?iso-8859-1?Q?DgIPjVKx7pFs6YSUzIWUxPJWAvn9JHnrzxvJ8w2V7Vg/jzrzT2Vrkht/WG?=
 =?iso-8859-1?Q?2dTtHqdtTPa/BCY8v3WgGdG3yVou5ogXoipxQ80jyojjYZO078j6xbodUv?=
 =?iso-8859-1?Q?sv38u+bO1AOOBV38uQyPA34kcVk4PeycoFRrb8Fq?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb9c17d0-21ef-46d0-ff7d-08d9fba6ca69
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 17:13:22.6991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IV/35FkPqjHlJMxvnwjWhkqy+hRqfKNwdb3QlkrmxyRAzBvUM4CA68xPmU/uDoL5LpauG+FFgMvddOszAbSXyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4609
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_091328_701065_1FBB6036 
X-CRM114-Status: UNSURE (   8.76  )
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


Changes since v1:
-Addressed review comments by Anup.


Kind regards,
Niklas


Niklas Cassel (2):
  irqchip/sifive-plic: Improve naming scheme for per context offsets
  irqchip/sifive-plic: Disable S-mode IRQs if running in M-mode

 drivers/irqchip/irq-sifive-plic.c | 40 +++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 12 deletions(-)

-- 
2.35.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
