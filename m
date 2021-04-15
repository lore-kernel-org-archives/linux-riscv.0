Return-Path: <SRS0=wvp3=JM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 662C7C433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 08:57:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E137A610E6
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 08:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E137A610E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uYlI1Ka8G5NhL6zc1mTZCN/0sKOAJPbMmXhsMyDteCA=; b=CvwmZjpiA8l8q/yyNrvwUkDzoY
	m2SVqJdHbTFkIz7lH0uljgo064qufys0khpep2ITno+/ZrQM7xtXPIessa3bYehcqXW+fJ/XxFLGn
	e3zp4wIL3RzpJdd9q3NQ9lPAZRPI1tN9MWY8ABRabOqGgQ3U2s7RLDXumzbDxRI8NvRiV+Xg+G2gK
	U68qNZGZaZoS3k/v6Sfmyf+5ED1iPBRB5aPmQRQ530Z8T9+ZBWI2gFB/5gmV23ZHuusD0O4aj0e6z
	YoqBHV8cyr6R0QKNOHpinfJGfe4EBzaXl6nGTlFSiJem3nATfOMpYo55R14PwN1urZMrBgaxM6zQo
	gXsCma/w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWxoE-00FQoh-Eg; Thu, 15 Apr 2021 08:57:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWxoB-00FQoA-Ld
 for linux-riscv@desiato.infradead.org; Thu, 15 Apr 2021 08:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=GYHvVW02IMw+rcLYHdJoXdAQ5WtAS4Z9hUwNzo8cT8A=; b=1H0DCs0pJBN+ss+PAbKO6Wg3vf
 b5yL2TUGZY487TAHlVFrjYvmEU9mOw7uoHkZibd/0zmz6sLmie2TVTU3zM2hrvTdxOv0qKhBUW77u
 ZiwZMnOIaOGy1TCihyMfpI91GfOIeWp7ovMmSUJD2kCixRnq9l/G1/o1jf47POPB3tRWFkKAV/9sw
 /ybbDdYGkNZIBWDhl94f8AGuG6eCqXlLvFFYGZGs5sLlICf8bQog5XkH+J8iGn70ToAxAq1N4gAVT
 EGt+sCTXAxJJvwRMqlZ2LPh/UYONCT7/HhCxTU+dmnUo3QgsiO3TePiQUyk12irrf/XxHygnMyF46
 opxUaBGg==;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWxo9-008P4C-5c
 for linux-riscv@lists.infradead.org; Thu, 15 Apr 2021 08:57:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618477026; x=1650013026;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=iiDxyQQVApQCyXfItWhX1Y3j3ChdqoLMwidUMbY+ZH8=;
 b=V/G+3+ZEdyh23r2ivIk5iXR10EVjyemT1MpnKASUktRtVO6Kkytx0ISR
 PegaWTbU1rE2NXylQ8eqM3Hwx5t7XybCnpwY2HZ6oRJZIlsbjB9NkktaN
 cwEnxmNIGs+E2N8HCppt6HSr5aPxSulAS08CTG0SQNq5AvX6xj808G2ZY
 /T2wvWvaqeAFeYHXnCxyvzTwrUAzjvAlhVP/wz2H83DmihJfc+d2d9W1a
 Xq/oGHvTkwLXx147LhCZKit0BQt8Fn3SAJB+gfhiMTRPu/D+noHDbQaNP
 iuy8WAPRFU58cM9xmgXZbzcXgd2GjX518AvvzsMfiFmODFzTW6PBfMAY+ g==;
IronPort-SDR: XB2EKXTKTuufBFjn4rMGPkgFhmQ3g471Ix+sh9fzAFmPtrFbhOidfJM+UKmbVdU1HJ2YZdAswD
 D9Npjo9IrzYwL/9nfHIT7cHRxJ4ptD1lfjWEad1kDTHoQy4AiN1btpLA+rUIkEeZgDECl8wQbW
 nf33TK9H2e16wS6/rbwaidh5aEGD/zc8xz6kK0wTMH+gHWelIXg9f/3V6PKzqGsAl7I0obc3Jr
 WtMAun9IHQ2K72M8r+3lfCpuNBZ+RKxyVj+V2T5P/NLHu7m7R87B068M99u7VmsuDmtwhBQfwK
 Sv8=
X-IronPort-AV: E=Sophos;i="5.82,223,1613404800"; d="scan'208";a="165539862"
Received: from mail-bn3nam04lp2058.outbound.protection.outlook.com (HELO
 NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.58])
 by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2021 16:55:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+NTCJlK4GxX6jBKtXLahUjdi287dOLN14dZ5KHitHkOhE+FAYrrN8bsgfEFDoN7bcuOEa2ziHlUkcW95u0yMU9PtAJX0+Vw6JjWInnfm6CZ95j68wm4wfqBDvpgCMaq2ex/GFqM8skw/V/An1H2sOxLs+GZRBNaZTEUB8tTw8o1m3be9Mvzry9mTJVQNUJBT0QS3uNCO7LNZRQZwnC6FeVIEMHHeE0eT8czCbv7GJOdioLUs4AK7tFjobLtnwMz90HfJINRJEfhYL8mYRMIrpYJnP609gRtu4VN3CyposNTW2ihRN5ZGNpHZvlrb4cfzScJ//lPVcA1VKtjqx7msw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYHvVW02IMw+rcLYHdJoXdAQ5WtAS4Z9hUwNzo8cT8A=;
 b=Jjzae76kvEIRR05LutznbXPKs2xDJ2rs8uU9ovc1WZTpMAEDuQZ22bC0JYOUb//YOBg7RzhHFoF575LkKIfE95gRkv+LbEIQE65XKBYCe20ChRBtx+JtpW1NzeWeBA30m+hcFFOTDvUU7zwpKVgQ83cL671SF3eyeidKaJr3uB5pN6fKsN4QBzSwaMXpAdXUn3QhlkOeU2DqyWLzoqL4SC9e5IFglxy9GHUn0Os9KgDkuE++k/gCQgIq1RE3wDdeFP22K1BBV2vEuhVMguHYwtWCQpUYXKFWwnx5pLelRTedM/tFeR+sTh/vLNBxJrqMQoNgK0g5drravC4pEhw7eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYHvVW02IMw+rcLYHdJoXdAQ5WtAS4Z9hUwNzo8cT8A=;
 b=zomaerw/ybr2iLCkYdQit6mud3LPPeTBKnPEAgHnXtj0mNY8Wbtk9GA8+5UyhuSGBMMQXvM2aauCVSkbDf6lLKIpXnlMiK3ZWNf7PUOHhl3yGtSsp/3YAIN9Ueyafn/HQ9SPuIXYrlN0NX1urP0CHUy0x3caxi7FzZ586OnaqFQ=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM5PR04MB0828.namprd04.prod.outlook.com (2603:10b6:3:fa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 08:55:47 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::38c0:cc46:192b:1868]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::38c0:cc46:192b:1868%7]) with mapi id 15.20.4020.022; Thu, 15 Apr 2021
 08:55:47 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 stable@vger.kernel.org
Subject: [PATCH] RISC-V: Fix error code returned by riscv_hartid_to_cpuid()
Date: Thu, 15 Apr 2021 14:25:22 +0530
Message-Id: <20210415085522.108624-1-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [122.167.44.95]
X-ClientProxiedBy: MA1PR0101CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::27) To DM6PR04MB6201.namprd04.prod.outlook.com
 (2603:10b6:5:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.167.44.95) by
 MA1PR0101CA0065.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:20::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Thu, 15 Apr 2021 08:55:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08ce1bba-3502-445c-d0f2-08d8ffec42ce
X-MS-TrafficTypeDiagnostic: DM5PR04MB0828:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR04MB0828FCFB6890A09775D92EF78D4D9@DM5PR04MB0828.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V33uRKnVS2hGMefI/kBG4w5I3hm3dxN7LAw/Bvfx2y26lrWwxo9qal3zr9tv6efdQYC69wmj3f5UFDIstrmmz8ZgDEB70fmdUp0r5t4BX1E1fC/ridiRcdXY8qAbqaQp6naLAk6L0AQ2TCxdzlz9TeCGPaHvzlw+VqhoMRebtoTnP59RXlinfeoAqRbokTWERuQCxfZ9aKlNxUU3RKHTBiTQlriy8D4BQ5Uq5U5S7giAvEaaY8PteK3BEntAWG66OsCQItbCfJq8g6hN49MWNqFyjIeK2i4xJIEpOzsQQkdfFsQ8E535Pjw1c7nfwzDh3n8PyqFt+d/c1uhYCAru14X/bVILsW9NDdn2J3m0A8ZNdyopn9TDj638TiyNtKlv4XKdgtqFwAKrY5MhMCrNT9FKPeiOnmmVXj/8Vqu30NrN/v0g/R5XcDUQ0+GSk7IeNmhgIgUb7agTI+FrL1CD35BcbCk9ioq58wEu28sm44DSxAgPJ5vgIkVgAcye3lXxGuESdIpMJgnli5F8HFp0IFEJS/W2pRNqec4wwTx1nr5n51XflJ+FSQaGogEDsGOHRgVqmRnLRgR0ba7dn7kSHwMifFwiNk2nw+IqYEqbuFjLO/iKKCinMpGSAp/abSEg6o1fIZ686LvY7Hue5Me9Q7SCmmB+HEjYVtvkGD5u9+4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(6666004)(66946007)(316002)(66476007)(55016002)(54906003)(478600001)(8886007)(110136005)(5660300002)(66556008)(83380400001)(8936002)(4326008)(7696005)(4744005)(8676002)(86362001)(1076003)(26005)(186003)(36756003)(956004)(16526019)(2616005)(2906002)(38100700002)(52116002)(38350700002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Ckq9kmgNVBtvYVP7F3dWHHmT5Py4W3m5ZkCr1FiEU6DeW2yLBP9S9z5gR/HB?=
 =?us-ascii?Q?ORqLYzA6+QtZOmZyK4TgzFcnbDDB6MYimwWnxmnYgcxRoxhxSZx9d71IG9Pb?=
 =?us-ascii?Q?4MMyRL+UnpNE0kPV+RL8D9xvaSMOUbpoHucL7BDk0Jk88tDmHSALWbRMxhhu?=
 =?us-ascii?Q?F0k9jhsAKRsR0YVBK/v0LfAM+MkFzth49iIChvFhdsrEZVmBSmIHEV4Y7Zzd?=
 =?us-ascii?Q?j7phhmzKTwb9Y3vDTOGNkUEcXwbOeNbhi/f2tillHdCro9P5L0tBToliP1rM?=
 =?us-ascii?Q?ylSJVtOj+5FNinOvDJwFCxc8WStpmw6y9Jn7dVVUDlT+3zy6ctQ2WctQcmqo?=
 =?us-ascii?Q?KIv39IGO/lOBt0UMbYHYNkaf9+58Yu1E8eK32YQ3QxE1yWdyn1TCysxmqiaE?=
 =?us-ascii?Q?ZTNPtuBbIG6slUxq7rdb1271vRUsPmAazmMc7BB+ckW+KgxmVHh9N61d2404?=
 =?us-ascii?Q?GWNe5WXPAh/a9QCPsgtpcbVBc2tdth0OPlql53Jdp5QerDrWH6Jr1r6znrqY?=
 =?us-ascii?Q?aWaIRLRARlNN1feD/3thjh2eh8B0Gbf8PY/BQyYD4DrDKdfExHhmJDbUhcQW?=
 =?us-ascii?Q?5AydPHr8cOukiS5zPMqURVxb6sIgXkBF+LIQBAuYMEkz/RMonGcAvAuaCEL7?=
 =?us-ascii?Q?Aw7yhxE7xJOk2wdvI6uFrNGYLt2Wl4RWVUPTsyB7L9V+HeXdXUFnAJ4KG8cZ?=
 =?us-ascii?Q?kvarHMhGpnezpUsLUddFgjjKGoVqip4ZTPgpjdLnXfCRD9kiUDrm4HaHdAIo?=
 =?us-ascii?Q?n4AKljwvLsXP1Fd2Zmq/j7kjazF6gVdE+ni6Jd91KbEAKIV5HJhX/vyxVmZY?=
 =?us-ascii?Q?/xY6KESHl7o7cNTHEFLwIUo7h7fPftlsirgSrmdkx9vlUKjLw5mdKRss5Z6U?=
 =?us-ascii?Q?xUPFoTk7RfBVSZlEXRv79TrThUQk+SUrmQyhTB89G75st3u2j4gYvvU/3C+S?=
 =?us-ascii?Q?u6pycdXAeFel3TU6K8mlc9/tycD/J0Y2/zristIDxAhrVZKSJX8RyJJU/d6V?=
 =?us-ascii?Q?0NSC4SemQCwHeZFaCy3XPWGNKcLs1hod5bk63IIT2CG4+nLTq2WWy3+y1R1F?=
 =?us-ascii?Q?Kg9UlfNyG/O/IsGtOStdK0o/Ig/BDRQaYWG8H9Sg7YA+7xCkK47b6p652ugG?=
 =?us-ascii?Q?1nOPM3hQG8c3Z8e7+XcqsLgGYuGfM4k+B8NNyE4Hernb9V5wAX1Vm0ujNbo0?=
 =?us-ascii?Q?LPRcmtG1Eb2bXyt9ULyilY8W3kIbP7iVylxcG6rM89cBqIx0b87dsRHttTCj?=
 =?us-ascii?Q?3vTSHODLoiu8Y2d/jDMX4r46i4Ui5mGENl6jJEieAKS1gMM7Ck/HxLG4WE95?=
 =?us-ascii?Q?P/DEPtPukaXGBP6IHehSLHYl?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ce1bba-3502-445c-d0f2-08d8ffec42ce
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 08:55:47.5427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /s1rWd8BY39shLNyQJFj/dKYjRoswcZ/JZ8Ueu8GHQx1s2ZKGlooIqofnUKaaFEKgua/IGYI8BB0kmXR9WtW0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0828
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_015705_302593_4C8F6895 
X-CRM114-Status: GOOD (  12.30  )
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

We should return a negative error code upon failure in
riscv_hartid_to_cpuid() instead of NR_CPUS. This is also
aligned with all uses of riscv_hartid_to_cpuid() which
expect negative error code upon failure.

Fixes: 6825c7a80f18 ("RISC-V: Add logical CPU indexing
for RISC-V")
Cc: stable@vger.kernel.org
Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/kernel/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index ea028d9e0d24..d44567490d91 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -54,7 +54,7 @@ int riscv_hartid_to_cpuid(int hartid)
 			return i;
 
 	pr_err("Couldn't find cpu id for hartid [%d]\n", hartid);
-	return i;
+	return -ENOENT;
 }
 
 void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
