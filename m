Return-Path: <SRS0=WUGv=KU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C4AC2B9F8
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 08:01:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6ABC2600D3
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 08:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6ABC2600D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=YKSvzYRiGCe3by+4VF6SdNaeZLc0gnsxRdOh+2VhLm4=; b=ddyPYrZrUs/489
	6dVcNQOrRRpydjnZexPDJCRFk5oH4z1SfCaTdMbCOKZuo2R+vXC3Jof/czcMwqOwoqevoPRWO6DLt
	SPRVsfRBiEhyTzJPzxTGXwOoTHnBFzEPu9OUTQYfxa7/KpTb8v1z1ldDNAhyxWS1BAoXBYBtU9lkX
	y8QyZXBkYx/loKpFLJSfBPdBH+56pZCejfZ7BqahYWWujkH4hp+Al232PJtoOjbwzRmLzevST32f+
	N4leWDR2vGqRpnkV+K52miWGHfO/TDh4umlGPOokyQMj2z7Syn6WhRnCxnG46cZTZaAgPvBhVyeRR
	gmT0kEIhlwS+WDXVCsbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llS01-0040ei-Ls; Tue, 25 May 2021 08:01:13 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llRzu-0040co-BN; Tue, 25 May 2021 08:01:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1621929665; x=1653465665;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=pbigpCX8/qrzdKrZfSBoq6CC4r+aHHsXkMU2s56zKJY=;
 b=oK67qRoTIP00VXSS5aPJvDLyt0HajxKA3Wmpd1aNx60P7ydaOfOXUVb0
 +1z255h0DWQT12dFnc4fp6+Q/xRai8dAU/ESi6/jA6r/m7wpR8nKy2Uho
 BNm5p2WEk+h3Rik7XDg9f1DGE3Lmb/0CI1I15EW0LYnz1jXKasg0MT3oy
 dWpneTMZWp+3lYpq/Bk9qTkHFQx4kHEJpvgEadPIZ7F+lRSpyYaF+ZN4L
 LVmxZ1KrlcWArbGFB1yae3E0vrdB8auxHchE6Q5Domp+RbP6BaYoT0M9j
 /lJhglBne19j5zJGJFg8RRqZEuw+U5436WQIk4cPBq4BpgCanSdvTve6I A==;
IronPort-SDR: QHjzdW5EFe5chYEQdl6q8PP5VzM8G+AQPhy6Yi72v6M7ozQ8c+CLW3kqOoHej5v/j2+ZJqLN4+
 9VraZLV4ElnXzzz8EsgXmDOJMsW/BRhwv3/wWm09jJekON5Qdf0zAmMBDK9uQgJLcaayjhvcxF
 NW2u6sFqs5A8ZoyV+dxvYHd/+3jyA16/lnHo/AuFDvvdvqNrP0a9WANa+kPP/pdBFpLEB8l83E
 AHMHHZ8Y2/CviMeMYSYW+c+uSZa/9d3dt81EoKWVH1gJd/rzIz4sm0Vh3imKiCakqfr2NVBQ+a
 EZg=
X-IronPort-AV: E=Sophos;i="5.82,327,1613404800"; d="scan'208";a="174008586"
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2021 16:01:01 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m56DENmyAnDqcaDPU2Qm24cvuDun6oc957bgYhERhY92oAharW9nsIEUiG0m/KA2C9Q0y1sBfkw3DzRcFpivhaSzC6iml3Bd/uKf4xgQIP6qBlZiOkVHsJzpV+bM3g9ilJKRjjlfVa9JAY5ahEsohqNz1lw+Htd6JMnU6xyH2IDIhZYSNPRrb1l0srGjl2RW7inVYubKYkohZec4EULy2rPUtbrtgx9IaCmWUbpY5+nm/2i2DfH5Nw7QPEOlN1ywUQ/S1chs0UqjePi+90ZBoOxlXOwhlUC8H219R169K2ndo2xCIy2uPZ+UfSiPrTAvnUt/UJYD90C94Id6iUnANA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+A5slVtRdabLl5SY8i2KizzFk1srTS7swphq0J/g2co=;
 b=nfkaCXMNUSL+fdHFhSQXpdNaxUgXg35IS9O7vhuAfGVYOmomdB1ckXcj67bEBfRfMxbghndkdDwT9iHBijTGJ7WC6+pafsEA0qi1bG0VrLWoi5IBvHVXgBJaiWEcpKNZx6BPhnDot0DG8IEDUIyuWu30ihzbvXQRc1jxrr4YwKoOROollKs+7ijDjl5dI1CC/z3eUusNgkbVJlhR0wFbj2Hd4zeZ5mc49Myfr98rCn3bzRGwdrr4MfuLhmM1zCtsmRcGkMiV2vpZ02xuUnh/JYn21v5T0mMsBFWREmJlLzazrQOu4BmgWSMNATypusMIzAGT70/WhApAZTD+MDvP+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+A5slVtRdabLl5SY8i2KizzFk1srTS7swphq0J/g2co=;
 b=N454iR7JUWwyhGkZy55fXR1Vzzoxc8G++chCUWnVrR1GJECCqsK9V4hFtFwp3vy8MtJjv7cv4CCVkhV/Zz+9e1rqSshGn874Dr6noSHrj8N5mZ6fsIySOxCmJGX9f1qQSGNcrQdUbpzBN+wKtTL+4q07wRSlEmUGd/i13PAXFeA=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by DM6PR04MB5996.namprd04.prod.outlook.com (2603:10b6:5:122::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Tue, 25 May
 2021 08:01:01 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::64f9:51d2:1e04:f806]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::64f9:51d2:1e04:f806%9]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 08:01:01 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: Palmer Dabbelt <palmerdabbelt@google.com>, "guoren@kernel.org"
 <guoren@kernel.org>, Anup Patel <Anup.Patel@wdc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net"
 <corbet@lwn.net>, "graf@amazon.com" <graf@amazon.com>, Atish Patra
 <Atish.Patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "anup@brainfault.org" <anup@brainfault.org>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "kvm-riscv@lists.infradead.org"
 <kvm-riscv@lists.infradead.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-staging@lists.linux.dev"
 <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v18 00/18] KVM RISC-V Support
Thread-Topic: [PATCH v18 00/18] KVM RISC-V Support
Thread-Index: AQHXTGAgKECmO/ER7EehkQtXersO1g==
Date: Tue, 25 May 2021 08:01:01 +0000
Message-ID: <DM6PR04MB7081843419AFCECABA75AD74E7259@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <mhng-b093a5aa-ff9d-437f-a10b-47558f182639@palmerdabbelt-glaptop>
 <DM6PR04MB708173B754E145BC843C4123E7269@DM6PR04MB7081.namprd04.prod.outlook.com>
 <YKypJ5SJg2sDtn7/@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:9d12:5efd:fc6d:4ecd]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9355121c-ce25-4381-ae9a-08d91f533ce8
x-ms-traffictypediagnostic: DM6PR04MB5996:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR04MB599669A65BDA821D3A1602BBE7259@DM6PR04MB5996.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g6x7AP/iLDXf80hkssDE1SvUmBBHrFIVkou05jQnHJJ/YbURAhQUYoZx+glkEkEmeB96W+bmMQg9TwIq0j/XWQ0Srqv89W2zJcFC5fxY9FfnivHaI3AdIZYrXKIH8+gF2/cpwNGl35ZENzJAgWp/hQCthylSb++1E3zTSf0VRodqKY+YyB5mJfXCSg7o8m6SyHtCpGxDfO/U/LXWTJWS0k7Tx1/GlDcxjFMmO/4Kl1yJIhujj5dYwXdZT/68P8Ksq5qnQ7iVoSOtNNugEOtY/x8cmmqi+od3L3ZVVNSi1zXwy2XvJ2iHdmLZ+qIYI3q9MKaWJE01W3WT2jUQulj8XFikc6n6an0rgdFw3jn1asq8qRbr4sNzG9iZsOGMyPv5NHnJHnkHnaJ+0BW2jQN4V4BZEzLbkkG/WMHrT72R6u+f2B2vmJGcY+WaiHB6VGkfCe0LesmVB5SPw1mWZzsnzmGC2w0BrOEMSq/co5Q9V1AdoQFIP38jzzMA0qHtylU4zeznjuzK4lqBlgKEKekAPRWHy7C0pV4E6urqNOJF1k8LV/fJgnR7WgjQZmm/Lf7hPpbxTpFDs9oDimYnaw2GsFcU+TnrJKO4lg7wn2lELFY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39840400004)(376002)(136003)(396003)(33656002)(4326008)(91956017)(122000001)(8676002)(8936002)(66946007)(76116006)(6506007)(53546011)(66476007)(2906002)(38100700002)(64756008)(66556008)(478600001)(7696005)(66446008)(83380400001)(52536014)(55016002)(6916009)(9686003)(7416002)(54906003)(316002)(186003)(86362001)(71200400001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?tgTSZoUB5Qtj69Kb22l5bqquU3HGvA6Cue/vjPpbCdUbHF/a59RlAxQM++Us?=
 =?us-ascii?Q?xP1q9OqlF+hYqf9idTh60qbbgV+f/ANP5qEF/eYWtVX4nlfaTDvzJw+sHiJ4?=
 =?us-ascii?Q?3FkbV+KY22XhssyMwZAKMG5kH0ihbZqZhk9svzrTXwM+IKJ4m5fKTgbwwn2O?=
 =?us-ascii?Q?Wn8s/AUwES7A5CkxzTv+dx4b232qnvD2khpvLtqJx2X4AlumIkCCll5DzR96?=
 =?us-ascii?Q?1y/g5nMG1zAhRAXq34qZ2JyZvmT0OKWkKGWvGQvg4flH5tDh5u0CD5ZAWJsG?=
 =?us-ascii?Q?ObPmhk1swAT53yY9vNuEvtHgWI/5u6bFq4H2Nsyusc8aaIlzcXPKJE/FWg/k?=
 =?us-ascii?Q?1kljtTg/yOpzxnxQph2fQoNtxmgGZQ34IvKn7zeIEUxv88xoti44WrFDerUJ?=
 =?us-ascii?Q?sEC589VJKvyraLjVS5WnTLcZiO9chFYSgZkqnP7o9wBpV7bNdxj67iyJB3+V?=
 =?us-ascii?Q?Ho+ohkP79GIQmSHGqeehjDehREMRNF2yK54LGSXc394yTKn2okizOgdS9stL?=
 =?us-ascii?Q?CgCGfHPLQjq9SHkJ5yBV9daePYxxxWhUefbSdcfxcMYQlIvamHkimYF9HCfA?=
 =?us-ascii?Q?QXirr5zjaUVeP0zw29g8W+DTWs3E/Va6OmSLZ3I1Il8pRQV1tDQCgF3P6WBk?=
 =?us-ascii?Q?AX+kh6TwN6rcLxZY1ItBYQ+wzeoQ/IWhplG6urR17QAqBTDZ8DR9UkrBypeg?=
 =?us-ascii?Q?x5F8hqwtW9Qn73qAmGDu/abnJNQV4alCtEeM8gBU+6YLwLyooih56u49x2DM?=
 =?us-ascii?Q?q1St6YJND6Bgo4htpKvT3waI+kz4nAaOCzdTsKvfMWi/r1NO9uzjvP22QD++?=
 =?us-ascii?Q?Gilrw89MNdWzYtnB83vbjTjW5MpA7wGlXd3w/BY5DmJs5Xj534g6oY8qInGq?=
 =?us-ascii?Q?kwSQrdDpbcxdIbdHw8KLQD/nLe854Dwy9r0tQq7opGcRjGCKJKR5shJuWDeT?=
 =?us-ascii?Q?czsHqWX2rU/pf5jgKeQ/Dj9jQyFk4/aKjk8tEWDLwocAEoNhB0Tv5AUqHLlg?=
 =?us-ascii?Q?ByHsucujT6w8MPlsfVxPkeG+ayuhJ3zsKZ6zCgon9suYK18FigvoUnsFOLQG?=
 =?us-ascii?Q?N+kvW3UgIqtbUOKUTRy4D7XxiFk4yd/O5pP27Lsxun8s5d5gqzS+QoSDk7ly?=
 =?us-ascii?Q?MyE1OobZvayzX5YkzuyqkdxWGGaANBYteWKqt+A+TQhrUlDVP6pv7jUNZnQw?=
 =?us-ascii?Q?RgNqndXOyO5BO30JcfkoYwMHk/wEjC69O2kVPnixZ+WODG8FV4doupk+Lys2?=
 =?us-ascii?Q?f2wfWBLKlKKnDmCHcj9+LgCHqgAz8X+9HnpZzXnfbl4vYHTfk0fCiZRicxhi?=
 =?us-ascii?Q?o3gTyfnrA7T4H43Y5MtlpnB+Xu99/4rS/JYpJmROBujbsbFZ72tfU9fUxkGp?=
 =?us-ascii?Q?oLtWareuoBF97G+y8VCkgRim0bM662MJzzN0JD/HMdFEW3btgw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9355121c-ce25-4381-ae9a-08d91f533ce8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2021 08:01:01.3706 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: khNl1E77Z884NdL90degL8CQ/jcQq8lLBf/ptl/jnl1oONyWN3s8nPMdQ394YqUqMIAC7Iof1//bKeEbA0MA9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5996
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_010106_485045_B5A988EE 
X-CRM114-Status: GOOD (  42.27  )
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

On 2021/05/25 16:37, Greg KH wrote:
> On Mon, May 24, 2021 at 11:08:30PM +0000, Damien Le Moal wrote:
>> On 2021/05/25 7:57, Palmer Dabbelt wrote:
>>> On Mon, 24 May 2021 00:09:45 PDT (-0700), guoren@kernel.org wrote:
>>>> Thx Anup,
>>>>
>>>> Tested-by: Guo Ren <guoren@kernel.org> (Just on qemu-rv64)
>>>>
>>>> I'm following your KVM patchset and it's a great job for riscv
>>>> H-extension. I think hardware companies hope Linux KVM ready first
>>>> before the real chip. That means we can ensure the hardware could run
>>>> mainline linux.
>>>
>>> I understand that it would be wonderful for hardware vendors to have a 
>>> guarantee that their hardware will be supported by the software 
>>> ecosystem, but that's not what we're talking about here.  Specifically, 
>>> the proposal for this code is to track the latest draft extension which 
>>> would specifically leave vendors who implement the current draft out in 
>>> the cold was something to change.  In practice that is the only way to 
>>> move forward with any draft extension that doesn't have hardware 
>>> available, as the software RISC-V implementations rapidly deprecate 
>>> draft extensions and without a way to test our code it is destined to 
>>> bit rot.
>>
>> To facilitate the process of implementing, and updating, against draft
>> specifications, I proposed to have arch/riscv/staging added. This would be the
>> place to put code based on drafts. Some simple rules can be put in place:
>> 1) The code and eventual ABI may change any time, no guarantees of backward
>> compatibility
>> 2) Once the specifications are frozen, the code is moved out of staging
>> somewhere else.
>> 3) The code may be removed any time if the specification proposal is dropped, or
>> any other valid reason (can't think of any other right now)
>> 4) ...
>>
>> This way, the implementation process would be greatly facilitated and
>> interactions between different extensions can be explored much more easily.
>>
>> Thoughts ?
> 
> It will not work, unless you are mean and ruthless and people will get
> mad at you.  I do not recommend it at all.
> 
> Once code shows up in the kernel tree, and people rely on it, you now
> _have_ to support it.  Users don't know the difference between "staging
> or not staging" at all.  We have reported problems of staging media
> drivers breaking userspace apps and people having problems with that,
> despite the media developers trying to tell the world, "DO NOT RELY ON
> THESE!".
> 
> And if this can't be done with tiny simple single drivers, you are going
> to have a world-of-hurt if you put arch/platform support into
> arch/riscv/.  Once it's there, you will never be able to delete it,
> trust me.

All very good points. Thank you for sharing.

> If you REALLY wanted to do this, you could create drivers/staging/riscv/
> and try to make the following rules:
> 
> 	- stand-alone code only, can not depend on ANYTHING outside of
> 	  the directory that is not also used by other in-kernel code
> 	- does not expose any userspace apis
> 	- interacts only with existing in-kernel code.
> 	- can be deleted at any time, UNLESS someone is using it for
> 	  functionality on a system
> 
> But what use would that be?  What could you put into there that anyone
> would be able to actually use?

Yes, you already mentioned this and we were not thinking about this solution.
drivers/staging really is for device drivers and does not apply to arch code.

> Remember the rule we made to our user community over 15 years ago:
> 
> 	We will not break userspace functionality*
> 
> With the caveat of "* - in a way that you notice".
> 
> That means we can remove and change things that no one relies on
> anymore, as long as if someone pops up that does rely on it, we put it
> back.
> 
> We do this because we never want anyone to be afraid to drop in a new
> kernel, because they know we did not break their existing hardware and
> userspace workloads.  And if we did, we will work quickly to fix it.

Yes, I am well aware of this rule.

> So back to the original issue here, what is the problem that you are
> trying to solve?  Why do you want to have in-kernel code for hardware
> that no one else can have access to, and that isn't part of a "finalized
> spec" that ends up touching other subsystems and is not self-contained?

For the case at hand, the only thing that would be outside of the staging area
would be the ABI definition, but that one depends only on the ratified riscv ISA
specs. So having it outside of staging would be OK. The idea of the arch staging
area is 2 fold:
1) facilitate the development work overall, both for Paolo and Anup on the KVM
part, but also others to check that their changes do not break KVM support.
2) Provide feedback to the specs groups that their concerns are moot. E.g. one
reason the hypervisor specs are being delayed is concerns with interrupt
handling. With a working implementation based on current ratified specs for
other components (e.g. interrupt controller), the hope is that the specs group
can speed up freezing of the specs.

But your points about how users will likely end up using this potentially
creates a lot more problems than we are solving...

> Why not take the energy here and go get that spec ratified so we aren't
> having this argument anymore?  What needs to be done to make that happen
> and why hasn't anyone done that?  There's nothing keeping kernel
> developers from working on spec groups, right?

We are participating and giving arguments for freezing the specs. This is
however not working as we would like. But that is a problem to be addressed with
RISCV International and the processes governing the operation of specification
groups. The linux mailing lists are not the right place to discuss this, so I
will not go into more details.

Thank you for the feedback.

Best regards.

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
