Return-Path: <SRS0=TuAZ=JO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF26C433ED
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Apr 2021 04:55:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73DFB60FE8
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Apr 2021 04:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73DFB60FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=W272bJZYQ7t9IMTLz2jnCJqthCUM8afTQI4kDVqwjsw=; b=QZwnqNunuuBVCDLZA0+gxDStZ
	r49xWjl0Dn3W77na0h+gQ31Y7fjOrqls8hcg8cJE8TmdKl+Fi2OhDf2w+ORqAJQ5P3waqcMUyBaSW
	Az1cT2o3gNLaLF8RrlhLyivpwSORCtBV5aFIApH46eULH5YTG1noDWwHHV0XZs7nJ6luP7w02yyFH
	vsZ90Neggm1aIKatK6FkfoA+SBu/IEG+pgUUkEhz2U4k7qObIbOyG3s5x6fy0KCdFA6iTLckAuObt
	2difpRdpl+yNac66lDZWLHUmjcUn/5Oh/dciiZoEyWHfyGgTdzQm38pQH6YCpj/k9QQ48CVoTG3vZ
	lhilbi5WA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXcz6-004M61-Ra; Sat, 17 Apr 2021 04:55:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXcz0-004M4R-LA
 for linux-riscv@desiato.infradead.org; Sat, 17 Apr 2021 04:55:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-Type:References:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description:In-Reply-To;
 bh=T2sCMaUE1/cWze9dXa3TpHaUmoq5FDI639SJhAj0tbU=; b=3HpztfrOFPF3IenxpVHF/Bxxlv
 yTCpsSlyi3SJbxsIe9KA0zVpwYXQxYNfLZRS5O4nw9QZ2gnJTwSYvpZpNMfyLItViUxB20EoeLBgI
 uFhKGLj+ZjZOfwdUsAr3lZCp58NrJ3RUeEKdnxY5BsU08nXTt0NdQ2k7zN4zJvbhBc7PgL3yaqiGT
 HDu9RSlT3QE+qlEgTeHSRddB5h8a1K8oyizrir6PBk67s/ex8bRZ9YPp0HINeQfApMav29hVrFfM6
 WS2prJxBLq+yI5pfZM6QXzQdUR1zITJxv9tbuIndtUabf4tGyKsTiwH7e5UJb4mZRxT74pjj2eWQ3
 BDqOtarQ==;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXcyv-009s8O-4n
 for linux-riscv@lists.infradead.org; Sat, 17 Apr 2021 04:55:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618635296; x=1650171296;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=dQ8uiIH8ssTMY3EsZAjOxdddiKBhzGH5HF6aokDxNVE=;
 b=eqk35hs8PPGDg4lQrRaBahRC6g9kYIenew75d8qGoGxFKFCuvwmzInlG
 y4udX4BsLYRIT7qhhhDVcrcZ65aiJbtSzT220bu/oEP+2l+sjgOAqyq1C
 /iC4++StQ+aiZ5CRMDkWcRUGUFum38LJPQBm4qnp8GDPs7o26bav8ND6d
 3sK+mvmeYDgNfgMPzqxx/pPmhP3xw2iFeKA0CRyolyNf7wyfmHIQe2/L1
 RQ4ZUcsVh6/+SQRmi/CxxLOYtTKTdo9TNu+IiIyP32NVxR1e2wgTvyfMq
 Fm5WH+VzzVrO3OGq2xz+PlUFtzxgHNhdaSjkC0gRNYlyugCcQ/Th+edNQ g==;
IronPort-SDR: kDsutdlwSJ9A53cPXRtdZjGZ2MezIonDAADgHwmQ55pBEjOqHd+2zBao3aXpfQojNXSNZlXnKA
 f2h2QNt2cgcndycQ5hKU8kF5QGsI0weavXlxDvfmKWCgN8jvthxq5Gf5liyq+glSFOR3rXh48/
 R+Y2lZ1dHZfu9Y5hlsVgeG12QHIhg7eHKBik3xeh87A0Zrljy+gFS/GONpX87T1tqny5s1KwkX
 keJhioME2AftTazaW5MtWnIh/7NEe2iNRiaH4UYMYbGi7ZJ5Xx8+//1/CCM/nYkf3rI1rr/HH9
 Bss=
X-IronPort-AV: E=Sophos;i="5.82,228,1613404800"; d="scan'208";a="164566675"
Received: from mail-bn8nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.173])
 by ob1.hgst.iphmx.com with ESMTP; 17 Apr 2021 12:54:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8SGudBaGzy6cTMWmbSUgXKh3xFQ8GLhTRvLU6pvmA7EHcCVXocy90W5tzqaf/LZC8qChnnewr8Ov+aw/JLaiE9G6/eODGprg1ZVqtd8c7gH495LCG8mJxkXo2T4GQ+Wvy1uiHjG0fvq3V3pniYps4dkqxZif1iy9oieNwLZgATw7TfsZA6pqA695DyDYZotgRubPg3QHbtBmH8U1tS8Fal3xHcCD9q2yVRtk5nN7CTGcy7RoDvYtoZyGctJ9mpJxOYQS4N5IytYQnrPzw+nEmWRTPjwZQBmDCbcHqMPAyIGQaB+eMkoQgRCzPoa87pwmllB16aPoQbze0VNjGwQTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2sCMaUE1/cWze9dXa3TpHaUmoq5FDI639SJhAj0tbU=;
 b=BotUuFltRYNV7bRRiYel8x1VxoiS9SHhFHtJE2w4GUzN6JgnaWWiWLod8JJUPl9bF+mgUKuGRwGbGbpTvhUsAgOTz8N35pGNqHR/HkRU27K3BlhpP4TIfqDPYKv8lNM141ShHvmu05b3fnqRw180DeOLRqPL8fRLbu5v/oFscM0Ts5alugXANoqz8ypXdwiT6el73AaGotzvbt06WtfmjoxJ3ouIonjwk265gsBRCfkNpEVPZCayQmq4QfKVi2FQBLU6wvfIxZcy3LO/m2AQG1wH8eLKU01H3ZmwrqG/o4mVB8Ckh/ZKYoN3fa8nXTI+SViwME+uzNDT6Cq/twdxtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2sCMaUE1/cWze9dXa3TpHaUmoq5FDI639SJhAj0tbU=;
 b=IHXiCQd3XZCykXf+OIvn0uvyVkXptQZgqAz/JjSzmW037h/4NsUAOcvrsQh8voxFDpyE7O/9F70TmO1P9PCUDyIlaUqWtB/eqRcU/FAGtL3l6lIxcAq+AP04aJdLTlSrB9Ghg7AtXvVzYIZcVyEUNe122uUPVCdFfpRRk8XEcQQ=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB4916.namprd04.prod.outlook.com (2603:10b6:208:58::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Sat, 17 Apr
 2021 04:54:48 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::8557:ab07:8b6b:da78]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::8557:ab07:8b6b:da78%3]) with mapi id 15.20.4042.019; Sat, 17 Apr 2021
 04:54:48 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Greg Ungerer <gerg@linux-m68k.org>, "uclinux-dev@uclinux.org"
 <uclinux-dev@uclinux.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Anup Patel
 <Anup.Patel@wdc.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v4 1/2] binfmt_flat: allow not offsetting data start
Thread-Topic: [PATCH v4 1/2] binfmt_flat: allow not offsetting data start
Thread-Index: AQHXMyZv8axGA7lx3kGvgyyYuv6fjQ==
Date: Sat, 17 Apr 2021 04:54:48 +0000
Message-ID: <BL0PR04MB651453DC7A8BE4E050B11893E74B9@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210417011009.54569-1-damien.lemoal@wdc.com>
 <20210417011009.54569-2-damien.lemoal@wdc.com>
 <5227b984-f415-98b5-dae8-0cf84a71bb46@linux-m68k.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:5123:b3e2:5e6d:7875]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54ac5b46-3b7a-4ac8-f63f-08d9015ced83
x-ms-traffictypediagnostic: BL0PR04MB4916:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR04MB49164015646C9F4504203683E74B9@BL0PR04MB4916.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mjC8Ov9cvZO/hDkxbIIb8z/kXvyn+6qAsiGB4WjiccW1PGPLI5nWIdN4tbzgjzCYD3TGgqvrvaOGBNp3xBFZv3eyq9maxrw4fRFky/738znfsO7JEUPzNFueuBYuGNcogxISqc0vKfn3smGrfHQsXPBpGc0fw6eGCk7dtMv5vpnTjPe5meWFLvHrZw2vGqoa0IEIcOe+j+XtM1NC97WowRDf0PimtqcLWSHPt3ZN3dcJXmKR06qcYkyHYSN5xa6sNNlYF+UQ8o3Lk3T26Kd88bqXVj7QMg//+jNPO80CWD4n2fv+PbSZJ95PpYbkNg7tr7pglKnibXLhfnBWSor9PahWS7blWztyauw+oZ36FYVO6N4sH4Be+7AwLaKjh36W+Y6+wn+4VgsHfdLtCIRswW03btgccZf4vgliRLzDquKV2CIWq15ywmPtzw5tSj3Vh04FWjhLRSdmjFH23DGMcoUWEs92bRUkEdYCGvDZF/T6hjIFyU/g+M9ZPeA2ho+YTpGt/0u4wGBOCm9ICz2ZQBbgNMQMIytwH7++8nx8cxLhJZv1V+Qfhj7tv6ACHIRSM116iiDgzPdZy5b3OFNyX2yYSKn3FtpdzE8MfTVTwy8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(91956017)(66946007)(52536014)(66446008)(110136005)(83380400001)(9686003)(54906003)(2906002)(86362001)(4326008)(66476007)(55016002)(122000001)(478600001)(76116006)(66556008)(8676002)(8936002)(71200400001)(5660300002)(6506007)(38100700002)(33656002)(186003)(7696005)(53546011)(64756008)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?fvRbiL/AN/le5jaODVtWeceVNf+GSHtSG9YMOWBLTCJrTmKwKI2kE256y9Ey?=
 =?us-ascii?Q?3GHC9hRaklBthnrhoLkZ61p3Sc543hPfAoUtmZarVQdX6Z7T1LKKtnXCyBEb?=
 =?us-ascii?Q?JSSaohY2bJpFnX/Zw7AO+wELMxusLHWbVbylpGvG3Keszcv0eSakjz5W0pDM?=
 =?us-ascii?Q?UE277Ko3wHIdJm5CXPlsd2QKbEC7/zSqu9+tqfFDwIEOkOswWkoM3ByTQQcF?=
 =?us-ascii?Q?mI5mxGLyaTAzQ7btxU3H2Ajtdwq68jn4HkBxHktUp5oqR2lOxo9vrwV69HID?=
 =?us-ascii?Q?qFyLA+1pTWFLhJncgT80tLWPy1vXX5htZ0QXcEouG7Er3dUXj0s9kStayWSp?=
 =?us-ascii?Q?v1Uoi5I109pIzioh9qiuAb1Qq8RyNXxyRufoOIJVd0TRDwhdrMnuTYAf+mx1?=
 =?us-ascii?Q?t+x23hFzbOKdp3to6XfdC2LWKKirlilGc8EBsFiH+4CORESujdvqV9sc/EoU?=
 =?us-ascii?Q?xRbHK5iarKKndZf1pEUk7ZqxSKp9eqPn+HGFgiTudGc/zY1F9veO/Qefw0Fh?=
 =?us-ascii?Q?ClEUeOrhasHxOzabZ4dqt8IGjDaCALGKHKBq+/LyWmVxk7p5u8Ngpn95H5xW?=
 =?us-ascii?Q?R2BGlEheX+hiGvSX+U2zAiOvf/doPK8nc6QLUk/AiVQUYKeT9INgDJfrGhE0?=
 =?us-ascii?Q?2LX0y3Uu0WkNjpOGfZXa98l/SY+Smuc4fgINjHhpxybl2AJefpByNjELrdx5?=
 =?us-ascii?Q?TyOUxlicwSciI6DkF7ObLS8ibu65X+e39TjJHitAwBZH9GPQ9UGskPw55GI4?=
 =?us-ascii?Q?D17BgRyA/5wbkSznArTOEs4qflgErAXRw/VH36zzLqti8ryh19cfkzpxbtya?=
 =?us-ascii?Q?lKTVEM5KCzoUXlw8amHK367achu86nBAAbnwYv4kEvq25YnT2WpFzXLcFKC6?=
 =?us-ascii?Q?wSis1+F08nZscY3grykQp8oOXd/xjYBrQsYHvtO2GYgaVADxCtpu5KL78icM?=
 =?us-ascii?Q?q3izrNivRpzXVdFzvATIumlpU4LDNCTyrGBSf6czoOU/cUQZJFMnwB5vc32b?=
 =?us-ascii?Q?TFSFal2+SKh3svpznPdVx0y6k8hCrhzPVDW9ZuvZ6ciX9D2T2rC8qlWYKiVa?=
 =?us-ascii?Q?8YgsmJR3NL+O0SrlrYtg+pYYfUidMSKe/TUebqDuniOfsqcVx/hPMSQhDL7r?=
 =?us-ascii?Q?XogJyqxZVigLWNqyr8J96Rjwm2dwzWS/Q4wxVCwtQLwPMufnUE4WTY0PHt7R?=
 =?us-ascii?Q?AecGcuDCd7LhJHL5xTQng/kPF4AmozGD107R3YXYhFx1xGU1Q5Ko4fMZeirr?=
 =?us-ascii?Q?a+5yNWQth/W6JnMv/MsUZivj/T6ka53RZ2z8q4Gt0Yd79Ak6gGjZCrlmaX1d?=
 =?us-ascii?Q?drmNutrtmzTVcMUNC2hC9Q6RKope8iw9zNBqs5n9ou6jz7Rw30PNRDfLKh1n?=
 =?us-ascii?Q?wvKirJwhqPac+3j1R6KNjI4+PDoVFUC9xsMgNZ733sZLbVfT+g=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54ac5b46-3b7a-4ac8-f63f-08d9015ced83
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2021 04:54:48.0614 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BtxYKuNYVogSNl9CHNGP36XGvE06gntIoSRMnCQDuqtjftQ+2v+MU0EbvcFH/Alls76MbW0zwEuoHZt3qr9QLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4916
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_215457_413400_B556A865 
X-CRM114-Status: GOOD (  21.23  )
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

On 2021/04/17 13:52, Greg Ungerer wrote:
> 
> On 17/4/21 11:10 am, Damien Le Moal wrote:
>> Commit 2217b9826246 ("binfmt_flat: revert "binfmt_flat: don't offset
>> the data start"") restored offsetting the start of the data section by
>> a number of words defined by MAX_SHARED_LIBS. As a result, since
>> MAX_SHARED_LIBS is never 0, a gap between the text and data sections
>> always exists. For architectures which cannot support a such gap
>> between the text and data sections (e.g. riscv nommu), flat binary
>> programs cannot be executed.
>>
>> To allow an architecture to request no data start offset to allow for
>> contiguous text and data sections for binaries flagged with
>> FLAT_FLAG_RAM, introduce the new config option
>> CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET. Using this new option, the
>> macro DATA_START_OFFSET_WORDS is conditionally defined in binfmt_flat.c
>> to MAX_SHARED_LIBS for architectures tolerating or needing the data
>> start offset (CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET disabled case)
>> and to 0 when CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET is enabled.
>> DATA_START_OFFSET_WORDS is used in load_flat_file() to calculate the
>> data section length and start position.
>>
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>> ---
>>   fs/Kconfig.binfmt |  3 +++
>>   fs/binfmt_flat.c  | 19 ++++++++++++++-----
>>   2 files changed, 17 insertions(+), 5 deletions(-)
>>
>> diff --git a/fs/Kconfig.binfmt b/fs/Kconfig.binfmt
>> index c6f1c8c1934e..06fb7a93a1bd 100644
>> --- a/fs/Kconfig.binfmt
>> +++ b/fs/Kconfig.binfmt
>> @@ -112,6 +112,9 @@ config BINFMT_FLAT_ARGVP_ENVP_ON_STACK
>>   config BINFMT_FLAT_OLD_ALWAYS_RAM
>>   	bool
>>   
>> +config BINFMT_FLAT_NO_DATA_START_OFFSET
>> +	bool
>> +
>>   config BINFMT_FLAT_OLD
>>   	bool "Enable support for very old legacy flat binaries"
>>   	depends on BINFMT_FLAT
>> diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
>> index b9c658e0548e..1dc68dfba3e0 100644
>> --- a/fs/binfmt_flat.c
>> +++ b/fs/binfmt_flat.c
>> @@ -74,6 +74,12 @@
>>   #define	MAX_SHARED_LIBS			(1)
>>   #endif
>>   
>> +#ifdef CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET
>> +#define DATA_START_OFFSET_WORDS		(0)
>> +#else
>> +#define DATA_START_OFFSET_WORDS		(MAX_SHARED_LIBS)
>> +#endif
>> +
>>   struct lib_info {
>>   	struct {
>>   		unsigned long start_code;		/* Start of text segment */
>> @@ -560,6 +566,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>>   	 * it all together.
>>   	 */
>>   	if (!IS_ENABLED(CONFIG_MMU) && !(flags & (FLAT_FLAG_RAM|FLAT_FLAG_GZIP))) {
>> +
> 
> Random white space change...
> Don't worry about re-spinning though, I will just edit this chunk out.

Oops. Sorry about that. I should have better checked :)

> 
> 
>>   		/*
>>   		 * this should give us a ROM ptr,  but if it doesn't we don't
>>   		 * really care
>> @@ -576,7 +583,8 @@ static int load_flat_file(struct linux_binprm *bprm,
>>   			goto err;
>>   		}
>>   
>> -		len = data_len + extra + MAX_SHARED_LIBS * sizeof(unsigned long);
>> +		len = data_len + extra +
>> +			DATA_START_OFFSET_WORDS * sizeof(unsigned long);
>>   		len = PAGE_ALIGN(len);
>>   		realdatastart = vm_mmap(NULL, 0, len,
>>   			PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE, 0);
>> @@ -591,7 +599,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>>   			goto err;
>>   		}
>>   		datapos = ALIGN(realdatastart +
>> -				MAX_SHARED_LIBS * sizeof(unsigned long),
>> +				DATA_START_OFFSET_WORDS * sizeof(unsigned long),
>>   				FLAT_DATA_ALIGN);
>>   
>>   		pr_debug("Allocated data+bss+stack (%u bytes): %lx\n",
>> @@ -622,7 +630,8 @@ static int load_flat_file(struct linux_binprm *bprm,
>>   		memp_size = len;
>>   	} else {
>>   
>> -		len = text_len + data_len + extra + MAX_SHARED_LIBS * sizeof(u32);
>> +		len = text_len + data_len + extra +
>> +			DATA_START_OFFSET_WORDS * sizeof(u32);
>>   		len = PAGE_ALIGN(len);
>>   		textpos = vm_mmap(NULL, 0, len,
>>   			PROT_READ | PROT_EXEC | PROT_WRITE, MAP_PRIVATE, 0);
>> @@ -638,7 +647,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>>   
>>   		realdatastart = textpos + ntohl(hdr->data_start);
>>   		datapos = ALIGN(realdatastart +
>> -				MAX_SHARED_LIBS * sizeof(u32),
>> +				DATA_START_OFFSET_WORDS * sizeof(u32),
>>   				FLAT_DATA_ALIGN);
>>   
>>   		reloc = (__be32 __user *)
>> @@ -714,7 +723,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>>   			ret = result;
>>   			pr_err("Unable to read code+data+bss, errno %d\n", ret);
>>   			vm_munmap(textpos, text_len + data_len + extra +
>> -				MAX_SHARED_LIBS * sizeof(u32));
>> +				  DATA_START_OFFSET_WORDS * sizeof(u32));
>>   			goto err;
>>   		}
>>   	}
>>
> 
> Thanks, otherwise looks good.
> 
> Acked-by: Greg Ungerer <gerg@linux-m68k.org>
> 
> I will push this into my m68knommu tree, for-next branch.
> I just carry the flat format changes in that tree now to make my life easier.

Great. Thanks !
Are you taking both patches or should Plamer take the riscv Kconfig change
through his tree ?


> 
> Regards
> Greg
> 
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
