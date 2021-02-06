Return-Path: <SRS0=2LT1=HI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0829C433DB
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Feb 2021 00:52:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD06F65015
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Feb 2021 00:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD06F65015
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=Mal7BrfrexYn8s2dbU9YJqHsDtXgOjKj0Nqmk0YAkIs=; b=uwuX+UVfDYHib4oDksTXcnbQW
	/QO0SKrWxVTWVT025FXvnCeRl5PX1ztUYwNjM3Y5rHW0cgzn14qdq0pXnjizSiReX8KodNL2TUQWM
	6oSgxPUg8gJeTlfaQP9pC8GKItbZSGtC7oJvFLUtpHM0NWuqlzTbknZix6ezZV2iQEtm3WdjdfdLL
	DpfZBOnViIXI+ASJdRlAp/Sm8Rlf7kKabvMkQoTkz3bDjCYfMPudohPaJlB6ihnJBTnn7ecyCn1EA
	YW1XJPp0Vy2OkQPg+oEU7b3XHIPEFjmWkiJn/DENdn1Ca08rkJvRJJy+xxoxHCf3cz4MqyXLGx/3M
	w8ZViKs+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8Bpn-00057P-13; Sat, 06 Feb 2021 00:52:23 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8Bpj-000572-E9
 for linux-riscv@lists.infradead.org; Sat, 06 Feb 2021 00:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612572739; x=1644108739;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=7wD0yh08VXXJODt4TFZHVOnX1+dejfzwegHecSxQNmo=;
 b=j5CLLJpxRDIvSuhEQ497735t9h0iu8D69Ub7YBObSHtH2nT2KaOnOS1x
 IrTN1VYGjTGSqoqnJVrIY5eLl3VPYd1LITRtovi6t4vWRgB2kglB1iRPv
 qwQhoAEKcg88L5nT5emhxWOPpunmmwTh8sBZDUHf99lltx5lJ2cuEaOlZ
 UKogT14pPwXu8XAmdiYzrKBgl/MsPZoq4lMj5g6A2a0mom2Sfa+IXflkh
 fQvX4xf7TXFML5Ic0DJnDnndN4cvIllE3DN02JLBkYSX1MpiAjW+t0MgX
 W2CkpjojiIHM8KKjX7dyjmcEioWOpSoFN1XMv8Z6nyWiEKs0cSmjJVCzm w==;
IronPort-SDR: UaYf/gZw5b7GTu6SUQEh1z9DVrS2wyPpUUjmZ2LoSavI/srlgn4kjxf21mzm6livJFk8ks+KiK
 eWk223MKZLF7TqitT3ar/pxW+ZGgHeh6uZ03XPgApgSGM7XpKPpv3rmAcSGXTG4cT10A5mPCqH
 mEiGQDJYXXbjHQN/U5caRq2590G14F2IpPxQ/r4clBpkrRtc2E8EjgEk55WYI7SScObKu/izU1
 02dtjQTPeuEVvvsgtKqmuLao9IoWcQ56oI1ALLJ8FIzagcLmVolWpF7TZyAcc5cLo7Eg+2etpU
 VJM=
X-IronPort-AV: E=Sophos;i="5.81,156,1610380800"; d="scan'208";a="163714612"
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hgst.iphmx.com with ESMTP; 06 Feb 2021 08:52:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQUnsME38iI4mnIcONMU/hSTwh2j7vp97lS8RtEU/CVq4LUjT9M10qxlFtk41KOcl+Nj4bw4DOC1DrImoyhUZeRf/43EWf/bP3eDkQnWpFRnl9h3FVfA2naev0/N0Ihe6lroaq0lZY59I3yS4tx9FxYu1RFW02hHkfL7rOnVxZ0bFx26p7CcSiF6eoOnAopBvOQrzjdTfWaEC75Fbo98taDL+drQCjcyvmSfvBeOytN75lqJE7657wpCgXN0VpR9PTIfcEVMKujQltwP1lgzkahohe156uMar0thI+5wB0p3zJkknAB0AeiD+idzXhcOFhKgem2IB0UrLAqRT+6Eog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wbbw7BS2OiX3x+sFDTsuypcbZSAY804UJwsJzmwGqEk=;
 b=aGJ0QH0wCwiJ7g6+iPlTma7AEcYQIZNIXyRsbAzT+TwJAOFzXDUk7XeH+KqfY8OwyDKbr/k5zj70r45WGxDno64JntYENtwRUkVXaNs3L5GVkk3yxs1JXiU1GJT4EbgjQOUKZdCveIj0Yvdl/Y+TmZ/BxJgStCGcyc7pnAKLiU5uW3uY0Q7sydsaFLlB5yjj5UgKaBvjPtYOxiKmEwXfmbzv2dFg0Ic8WPyH3WXEuQ0fzUpia62IewbiCs+ixhrBLhuoTawW9+/RNqMQaVxyEnSBgCNWQOyzzHVb0LWchedi+IbVQAtS03KbKTtkd30zh3CoI099n9ktehpWMG4lgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wbbw7BS2OiX3x+sFDTsuypcbZSAY804UJwsJzmwGqEk=;
 b=jUuguoe7hxpCUxUQA1txz4y519KJl1ZagZBQIlg+a23RxA67YJDdAK7YY1wUNrNJ3QctuVN823VH8sXWK3t7aON8E6qsgF+axx1SBICCVREmdbzxedJuxkDK15Ney4WgQrKp+NNqa297KYRLvnDECkMCsjeoykLMzCoAPGF6SZU=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6846.namprd04.prod.outlook.com (2603:10b6:208:1e4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Sat, 6 Feb
 2021 00:52:12 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%7]) with mapi id 15.20.3825.025; Sat, 6 Feb 2021
 00:52:12 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Sean Anderson <seanga2@gmail.com>, "robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH v14 07/16] dt-bindings: fix sifive gpio properties
Thread-Topic: [PATCH v14 07/16] dt-bindings: fix sifive gpio properties
Thread-Index: AQHW+U9T59FA/s8Z20mcfAvTuPFEfg==
Date: Sat, 6 Feb 2021 00:52:12 +0000
Message-ID: <BL0PR04MB651496C3B638E46E178CAC2FE7B19@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
 <20210202103623.200809-8-damien.lemoal@wdc.com>
 <CAL_JsqJNqKrsB3LJvBpNmY6H3V1c5x4duqB_0p8YKit4+ZYRBw@mail.gmail.com>
 <89cccbae5add85c7bd811f3819ea3db7061e928d.camel@wdc.com>
 <CAL_JsqJeF364bPSNQLGujNHDkA7x8H_H7YXQFNZQ7vDzdAevcA@mail.gmail.com>
 <c9d273c87815a89be314e4e824a365313be0d677.camel@wdc.com>
 <CAL_JsqKnAQ+ngNkaKkDAO5Bqd=ZwNm5A4VhxvuVZxgLdxxxpSg@mail.gmail.com>
 <6351faa35c175d38e033ce433780c03c141c0ddf.camel@wdc.com>
 <c170e192-9e3f-5682-5a7f-ac9fc573fd9d@gmail.com>
 <f0b7df37e67151dab5699923549de6b3fbe30367.camel@wdc.com>
 <1726dceb-868e-68a1-38df-2f80ee233ed1@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:50f7:ee01:712b:bf92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5cd97d2a-ab96-4233-753d-08d8ca397088
x-ms-traffictypediagnostic: MN2PR04MB6846:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB684614D07B42AB3D8714E43EE7B19@MN2PR04MB6846.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KI3Dup+93CB4GUUr/Y1vSbpc1OAPNfUE59fcBVIq5HcchMwBC+bAZS8GwqYfhDUKrW/nlnsyo4M98Hp4lQ7OEr0sj61OJBj0YnKlKzY+7Q4Bntg0oPjIoyuP+VFFwd7Xa2F8i0e/+d/lkNUF3nKglZH8kDJfSVzxccErVSQIW+FOSURYl6X7nv4ehZUtxrl8JeHAy/oKxK7qze2mifkPETkT9jjHZU8/FC0H7uzdSHmDmfGcVQ45NgOotKSGZ4crW3FSAvc7/sLzAg+faBwPA20XIj6cFgDWwZ0NHMLujmLgY02nObK7Xdf+9lBzttfnE4lPBjXx72bvJb0FQbWyeJrH5RN5MbVsVyFTAI+zS4WagMMNTABhBziJCM9KRM8ks0KYjCcsSGgfjZrMGoe5qHjFbIrvqjJpWGkSPEjW/Xh0UsS5Wg2TBWk/oRdY3nStv/dWAKrT1yXlVbNN5jdQGDgAeb3RqUTMNdm6ryeYXaMqQtySZfMydeCKQ+g0x2EcAv7gbl9ELmw5YePQ9cHVLA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(346002)(396003)(136003)(376002)(316002)(71200400001)(5660300002)(8936002)(66946007)(83380400001)(66476007)(7696005)(52536014)(33656002)(54906003)(86362001)(2906002)(110136005)(66556008)(6506007)(76116006)(8676002)(53546011)(91956017)(9686003)(64756008)(478600001)(66446008)(186003)(4326008)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?uSeDqXRAMBYuxA5Y/vqx89bOK92R9YhYAiyigZT+9w/hjgwwtuiZtPSRsLuK?=
 =?us-ascii?Q?HA+NqFA1Kggax5a/PPt/G4yNDFgsVl/UeYJ6toDZHAxsGGlE+689cd8yafJJ?=
 =?us-ascii?Q?Wq98WAWfRT6uUUmPJam1BR1sjdxRLt0VAcdiqecKXo/j9LkRDlb2C8TANuHw?=
 =?us-ascii?Q?GBSJ/EHb7uID+/98zV0wUWoucA0fitzHe7m1J7Eans/O1jazgVux0HAfzl4+?=
 =?us-ascii?Q?QJj/uLyyBzDehP/TpLe2hpxjPsFVrpfF2YqLWDn8cnoDvE1YQlrlKzO/preb?=
 =?us-ascii?Q?/C/9HmTh7SAZjzPU+oCBcvXHwfC3ZPc33Nklk2J8X3+5HMGau4OXH4uTxR5T?=
 =?us-ascii?Q?uOh18IoguWMYT3cgr6jvDAmSUOqmE/N2xQMwWshg+O4HcjCT3bVosTkPkj0y?=
 =?us-ascii?Q?UMku+lNX5PQL9O/Yavqg3JswqcVkV+LIrJCIVl/9ltDKjHjw20ddZOJ4aiA/?=
 =?us-ascii?Q?YllbxcxKBBMhY/I9YaOJMRQCto5yzVSwZZjiM+Bk5y/L9uKH6XIqBqvTk80G?=
 =?us-ascii?Q?NUsjHoa5XvpAPg4+JrjjhHEY0k8hIuJw1pVM0Ny3UR4MlHhPCDAiinNUGDNh?=
 =?us-ascii?Q?tAzSmpMnqE0u2pAyGiUqumWhMWNfOmDrpVsZtJ3W5NfaSdejUKXVJ39ik9qc?=
 =?us-ascii?Q?lCAu/YcC+tat+E0GzikpmeDcZl5aMdEEXrAFKq1rJtoCIXgHsu/KqKsy0Pgk?=
 =?us-ascii?Q?EXksaoQeNGRZMRCCTtd2bCLhgSFRwovF/BUEWTRN49Tq5k/9fHShLpghJGTv?=
 =?us-ascii?Q?XC4Lzo3jKDXOKs9fkarpxr5gqNOP5oh3/njZVLHainZ/YVAH5HDikrAmZIDE?=
 =?us-ascii?Q?m9ZCB9mR9z2012YKf2n0jMomHFszsbE5/oVmotNJ5xnvb7L8xARLBs7GLS7e?=
 =?us-ascii?Q?2HdTHWIJ98kmld49Nmeyli0cvuVUrBfT9jPDSkeDHD1FDnjOukkWR+vrRk3H?=
 =?us-ascii?Q?6kJ+yr9je1T/yVatQx8d7DryweHTdzqS3SusjqdtZwKV7zfOOHSUoczhqTgM?=
 =?us-ascii?Q?bnan95eQUkDdargX3UI+JKW1XgzOskKLDLlTe2l89Cwkrj+hd7duUJ+da2pH?=
 =?us-ascii?Q?HSkNv46TScRw+9uVBdwxDvdNZ5fSXHh0bpMM1DYmwpAf1TrmdLXDuOe6HK24?=
 =?us-ascii?Q?F36MGldBG5BSD89n4YD5MxsWuwD/merBzjYNWidznNmoEz9G0yXmpOjMN2Vn?=
 =?us-ascii?Q?2G2kI/MMtsf6oEiOBb9Mp1Vx2RsSm53SUyK3fuxd338ZgAQznVDEREzqhBns?=
 =?us-ascii?Q?sEfsNkYEvmmOIWzql9dfMFfZnAm5k/VJzQBAmvYebzbQwfopiDZ19w/13EhR?=
 =?us-ascii?Q?kShs7PaGw9puWu3tpSr9EmLdN1MUcRYrZ8zcvaoJcylxZXScwRvAi+aJ22XT?=
 =?us-ascii?Q?oZ8kcBUECDJ1q2qfxZD9JofX7e+oME2qLY22L5MhRGtm2oLOPA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd97d2a-ab96-4233-753d-08d8ca397088
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2021 00:52:12.2086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KXW9sLa/LBQNQdc2yFBFd1sODvb92JrAkhm0rLDcq8VXMUGVOR+qbqBHWNX+a/56aKEz3Pepy2eirbhaeS8PKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6846
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_195219_779234_30B29982 
X-CRM114-Status: GOOD (  18.44  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Anup Patel <Anup.Patel@wdc.com>, Atish Patra <Atish.Patra@wdc.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021/02/06 9:31, Sean Anderson wrote:
> On 2/5/21 6:32 PM, Damien Le Moal wrote:
>> On Fri, 2021-02-05 at 17:55 -0500, Sean Anderson wrote:
>>> On 2/5/21 5:53 PM, Damien Le Moal wrote:
>>>> On Fri, 2021-02-05 at 14:02 -0600, Rob Herring wrote:
>>>>> On Wed, Feb 3, 2021 at 6:47 PM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>>>>>>
>>>>>> On Wed, 2021-02-03 at 14:41 -0600, Rob Herring wrote:
>>>>>>> On Wed, Feb 3, 2021 at 6:52 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>>>>>>>>
>>>>>>>> On Tue, 2021-02-02 at 13:02 -0600, Rob Herring wrote:
>>>>>>>>> On Tue, Feb 2, 2021 at 4:36 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>>>>>>>>>>
>>>>>>>>>> The sifive gpio IP block supports up to 32 GPIOs. Reflect that in the
>>>>>>>>>> interrupts property description and maxItems. Also add the standard
>>>>>>>>>> ngpios property to describe the number of GPIOs available on the
>>>>>>>>>> implementation.
>>>>>>>>>>
>>>>>>>>>> Also add the "canaan,k210-gpiohs" compatible string to indicate the use
>>>>>>>>>> of this gpio controller in the Canaan Kendryte K210 SoC. If this
>>>>>>>>>> compatible string is used, do not define the clocks property as
>>>>>>>>>> required as the K210 SoC does not have a software controllable clock
>>>>>>>>>> for the Sifive gpio IP block.
>>>>>>>>>>
>>>>>>>>>> Cc: Paul Walmsley <paul.walmsley@sifive.com>
>>>>>>>>>> Cc: Rob Herring <robh@kernel.org>
>>>>>>>>>> Cc: devicetree@vger.kernel.org
>>>>>>>>>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>>>>>>>>>> ---
>>>>>>>>>>    .../devicetree/bindings/gpio/sifive,gpio.yaml | 21 ++++++++++++++++---
>>>>>>>>>>    1 file changed, 18 insertions(+), 3 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
>>>>>>>>>> index ab22056f8b44..2cef18ca737c 100644
>>>>>>>>>> --- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
>>>>>>>>>> +++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
>>>>>>>>>> @@ -16,6 +16,7 @@ properties:
>>>>>>>>>>          - enum:
>>>>>>>>>>              - sifive,fu540-c000-gpio
>>>>>>>>>>              - sifive,fu740-c000-gpio
>>>>>>>>>> +          - canaan,k210-gpiohs
>>>>>>>>>>          - const: sifive,gpio0
>>>>>>>>>>
>>>>>>>>>>      reg:
>>>>>>>>>> @@ -23,9 +24,9 @@ properties:
>>>>>>>>>>
>>>>>>>>>>      interrupts:
>>>>>>>>>>        description:
>>>>>>>>>> -      interrupt mapping one per GPIO. Maximum 16 GPIOs.
>>>>>>>>>> +      interrupt mapping one per GPIO. Maximum 32 GPIOs.
>>>>>>>>>>        minItems: 1
>>>>>>>>>> -    maxItems: 16
>>>>>>>>>> +    maxItems: 32
>>>>>>>>>>
>>>>>>>>>>      interrupt-controller: true
>>>>>>>>>>
>>>>>>>>>> @@ -38,6 +39,10 @@ properties:
>>>>>>>>>>      "#gpio-cells":
>>>>>>>>>>        const: 2
>>>>>>>>>>
>>>>>>>>>> +  ngpios:
>>>>>>>>>> +    minimum: 1
>>>>>>>>>> +    maximum: 32
>>>>>>>>>
>>>>>>>>> What's the default as obviously drivers already assume something.
>>>>>>>>>
>>>>>>>>> Does a driver actually need to know this? For example, does the
>>>>>>>>> register stride change or something?
>>>>>>>>>
>>>>>>>>> Please don't add it if the only purpose is error check your DT (IOW,
>>>>>>>>> if it just checks the max cell value in gpios phandles).
>>>>>>>>
>>>>>>>> If I remove that, make dtbs_check complains. Looking at othe gpio controller
>>>>>>>> bindings, they all have it. So isn't it better to be consistent, and avoid make
>>>>>>>> dtbs_check errors ?
>>>>>>>
>>>>>>> That would mean you are already using 'ngpios' and it is undocumented
>>>>>>> (for this binding). If already in use and possibly having users then
>>>>>>> that changes things, but that's not what the commit msg says.
>>>>>>>
>>>>>>> Not *all* gpio controllers have ngpios. It's a good number, but
>>>>>>> probably more than need it though. If we wanted it everywhere, there
>>>>>>> would be a schema enforcing that.
>>>>>>
>>>>>> If I remove the minimum and maximum lines, I get this error:
>>>>>
>>>>> I never said remove minimum/maximum. The suggestion is either add
>>>>> 'default: 16' or remove 'ngpios' entirely.
>>>>>
>>>>>> ./Documentation/devicetree/bindings/gpio/sifive,gpio.yaml:42:10: [error] empty
>>>>>> value in block mapping (empty-values)
>>>>>>     CHKDT   Documentation/devicetree/bindings/processed-schema-examples.json
>>>>>> /home/damien/Projects/RISCV/linux/Documentation/devicetree/bindings/gpio/sifive
>>>>>> ,gpio.yaml: properties:ngpios: None is not of type 'object', 'boolean'
>>>>>>     SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.json
>>>>>> /home/damien/Projects/RISCV/linux/Documentation/devicetree/bindings/gpio/sifive
>>>>>> ,gpio.yaml: ignoring, error in schema: properties: ngpios
>>>>>> warning: no schema found in file:
>>>>>> ./Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
>>>>>
>>>>> ngpios: true
>>>>>
>>>>> or
>>>>>
>>>>> ngpios: {}
>>>>>
>>>>> Are the minimum valid values for a key. (Though not what should be done here.)
>>>>>
>>>>>>
>>>>>> If I remove the ngpios property entirely, then I get a hit on the device tree:
>>>>>>
>>>>>>     CHECK   arch/riscv/boot/dts/canaan/sipeed_maix_bit.dt.yaml
>>>>>> /linux/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dt.yaml:
>>>>>> gpio-controller@38001000: 'ngpios' does not match any of the regexes: 'pinctrl-
>>>>>> [0-9]+'
>>>>>>           From schema:
>>>>>> /home/damien/Projects/RISCV/linux/Documentation/devicetree/bindings/gpio/sifive
>>>>>> ,gpio.yaml
>>>>>
>>>>> That's not upstream, right? Then fix it.
>>>>>
>>>>>> Now, If I change the property definition to this:
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
>>>>>> b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
>>>>>> index 2cef18ca737c..5c7865180383 100644
>>>>>> --- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
>>>>>> @@ -40,8 +40,11 @@ properties:
>>>>>>        const: 2
>>>>>>
>>>>>>      ngpios:
>>>>>> -    minimum: 1
>>>>>> -    maximum: 32
>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>>> +    description:
>>>>>> +      The number of GPIO pins implemented by the controller.
>>>>>> +      It is 16 for the SiFive SoCs and 32 for the Canaan K210 SoC.
>>>>>> +
>>>>>>
>>>>>>      gpio-controller: true
>>>>>>
>>>>>> Then all is OK.
>>>>>>
>>>>>> Which option should I go for here ? If we want to avoid a dtbs_check error, as
>>>>>> far as I can see, we can:
>>>>>> 1) Remove the ngpios property and remove its use from the DTS, which is not
>>>>>> nice in my opinion
>>>>>
>>>>> Again, it depends if there are users depending on it. A user being a
>>>>> GPIO driver somewhere, not a DTS file. The GPIO driver in the kernel
>>>>> doesn't need it. So u-boot? BSD?
>>>>
>>>> The Linux driver uses the number of interrupts for the number of gpios but
>>>> upstream U-Boot uses the ngpios property. So I will change this to use
>>>> "default: 16" as you suggested.
>>>
>>> There is no reasonable default for this hardware. I would much rather
>>> you keep the schema as-is, or at least go with the second option.
>>
>> Since the SiFive official doc seems to say "16" as the number of gpio for this
>> controller, we could assume that to be the default. No ? But I agree that
>> clearly, the implementation can be hacked to have any number of GPIOs...
> 
> Keep in mind that those docs are for SiFive's particular instantiation
> of that IP, not for the IP in general. Although some parameters (e.g.
> dsWidth) have defaults, width does not.

OK. Then I think the simplest is to keep the minimum/maximum. Many binding docs
use that anyway.

Rob, any objections ?


> 
> --Sean
> 
>>
>>
>>>
>>> --Sean
>>>
>>>>
>>>> Thanks !
>>>>
>>>>>
>>>>>> 2) Use the modification proposed above
>>>>
>>>
>>
> 
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
