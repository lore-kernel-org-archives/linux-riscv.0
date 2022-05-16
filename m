Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15881C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 16 May 2022 09:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TzzDvcZOxiILNT77F9yWSvyBzPXXxifdLiOE0J13/Jo=; b=j6nt/DpJOLMy+8
	bun9+6IvkCv+aO3iVuZYGg4xKeMCZsxx6FM8AxEvRxkN0M0V8E7sVV9GsSLyW8z97uJ7L4M1fS+Ra
	EZoED1D713CLSGU8mpMqobrOvZHTJVML58XP88uNAW4RZQ+iAvrtcFJbuKWi8poNcTFcC0iteWy2z
	nsplRfz9HD2/eJDY17WcQrxyVaSRgiS/WaCqmR2+uhuO2ZvojcosMjAiyOqP3scc6u+kVq4hvHFc2
	wLuPlBOWdmG2DExPhrod2AxOKAolqPwDNYYlncHmh8IA3Msw2+s1iIBZjRrFzbLkG6mWFX46PFtiF
	rKeY+4Zdv8dixlj9w4Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqXK3-006xIk-CH; Mon, 16 May 2022 09:47:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqXJz-006xH0-H4
 for linux-riscv@lists.infradead.org; Mon, 16 May 2022 09:47:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1652694443; x=1684230443;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=bTmgfokK/guhzQhV06npQ0Wx+DGXJ3E3m+fg0nIFsI4=;
 b=S8DjD4aApdkeeyQW1VZr2yus7QFcJL5trcierTcnfeZhtB0PBNbNUK2V
 oEWFZGWpr/kRklyK4t73fsRaImuHJsirCmI+Fmyf9zby+Eh5oCao4j/5+
 /GCue9TpW5xx4QrVCSy8RM6DEHO3eDi/wSuQkCq9urRtkfaM+fBYwY9E7
 Wn0thvCQRMfS8mrEiW6hJVzPXEpICwb2FW6SeMyWUzvIy2+JHolG1lH+a
 hYWgEAxo32q6P2JX0WrrhPiRMX21KvMHsodOwVnyo9h0MvatTSodLxfMm
 egOUGfXh+O5vyzGdWSF+xOEEMztmol72iKQ300z7w1o+txb5rF1DppxwS A==;
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="173520729"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 May 2022 02:47:20 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 16 May 2022 02:47:19 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 16 May 2022 02:47:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JhaOO3xh6bNeyJ91JRcerCX85P/eUhPrz7JNpZ8ks3E2kllLr178tNSs23A7gpkxOdj49VjiuZ3HeToiI+B7va+VcKNlkME6E6ruT6T2qABK5uzbmUQ2o3DbKLKa1q6Q/jVTRYq8KAj+VyhMdB4lDhnu2icgg5rtYZaPzMshStM8gQPl16m9CEWOzA770ZQf7Qtt1tb6Ej/tHIaILVFHIjqHiAhcsNKnEmB41F4uBd1qjUhTMGWn0Wgw60kuYHicBxusp0yflacovQj9KZNhi1W5fG0r2OPJeXRBAjuHyoBSJkIvM6OcwffhC7YyGo8xHQLh4zjcMuFOWjAgfrolOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTmgfokK/guhzQhV06npQ0Wx+DGXJ3E3m+fg0nIFsI4=;
 b=h3NZnE4+d+ayTz3y2jRBX4yvnY8uV3hynSwHatoAY3BPCOQOO1hDKeaQYuC8tNz3TG/SKKzVuO7m/R1ipABuOJkQ1asPcb2kmj1X/bqDXNoOaENXn0A5QdJySUZS0KlShpcZadBd1D5v1XaAeAbQRjUbxFWuDrfKjLL0p3oz+C3KxSp29crgWijgc+tq14hwBROY7rdrNP/3sEwAUHc3gPx3Qp6UGoUTf/IWzjcD2/SwxRwQTrpE6W4Brk8T0/cp8OWhnSKrZzIZQ2nQ8bX3RZC/MHPMp76UfASEg5bvMbNkOrQMcv0q6y8f0c6ddPNCocm644jsTxBo0j/mPluXew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTmgfokK/guhzQhV06npQ0Wx+DGXJ3E3m+fg0nIFsI4=;
 b=akSed/wf07rXY/4Tg8X3gmdRWeWd80yogg39k4D4kFxCS1+/WbyYCt4c9psh7DX4J0JDcJJqRVMwb3cBA8lkyE6cq8k5gzItUR7dcCl7DjbdH0aWqSaTdBHqDTzeFsrUIZdRRrKCs/BFwcLn/s5EW2ovlkh4SEYkKWiCzr4J+eQ=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by BYAPR11MB3750.namprd11.prod.outlook.com (2603:10b6:a03:f9::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Mon, 16 May
 2022 09:47:14 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::d10f:cc33:cfd8:365e]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::d10f:cc33:cfd8:365e%8]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 09:47:14 +0000
From: <Conor.Dooley@microchip.com>
To: <geert@linux-m68k.org>
CC: <hch@lst.de>, <sfr@canb.auug.org.au>, <linux-next@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: linux-next: Tree for May 3
Thread-Topic: linux-next: Tree for May 3
Thread-Index: AQHYX5FrH/BqiZa6/06OwkWdFdBwha0Wk2YAgAAKyQCAAAevAIABXEcAgAE9tgCAAAeAgP///8QAgAA4D4CABNswgIAC+esA
Date: Mon, 16 May 2022 09:47:14 +0000
Message-ID: <b930a399-fe49-7fe0-d4cd-34d7b71a9cf4@microchip.com>
References: <20220503172926.08215c77@canb.auug.org.au>
 <3f94c9a8-c927-5cc0-7d67-4b21c3d9dbaf@microchip.com>
 <9a424be9-380f-f99c-4126-25a00eba0271@microchip.com>
 <20220509141122.GA14555@lst.de>
 <dd946220-eaf6-773a-06b4-307cda466c9c@microchip.com>
 <505d41d1-1bc8-c8bc-5ebb-8a2b7934f3de@microchip.com>
 <20220511062232.GA32524@lst.de>
 <102578f2-5c10-e9c2-c1ef-e76ba90d011e@microchip.com>
 <20220511064832.GA761@lst.de>
 <2c0e2fbe-4e45-4acc-c2a7-4f4dcf9161a3@microchip.com>
 <CAMuHMdVJuErxg16jFQEJhMwTgAt2AcHOGck1REZY6j0OpWwH+w@mail.gmail.com>
In-Reply-To: <CAMuHMdVJuErxg16jFQEJhMwTgAt2AcHOGck1REZY6j0OpWwH+w@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de9a8729-fb08-4ff7-0311-08da37210ea1
x-ms-traffictypediagnostic: BYAPR11MB3750:EE_
x-microsoft-antispam-prvs: <BYAPR11MB3750A8E1D53F8F5383406ECF98CF9@BYAPR11MB3750.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LaBl2HuOmtccVMiem5eSYOU3mhcB7gK7IQ3Ns6bROf+vjBdKEaKQEgm6r/jP0c3IV705GgLxFDpVaTFOdYoLMyCe8Bij07/hjXulv+IwjXUB+eSfZgNopoaTH84dMHXMZWRy5IoX3i0hX6bAUweqYoiqKEIhrTVTU+yFK77Exd4en+YoKIEA1gxGepxR2mZLVbl8YgHDpLbgXQ5ZMKKBzOed5Gnq3teF6RUrGUxgbc6cAK83RL6sZqRAOsyLseXH6W4eL3b5l1wqvtdAokd50XjDzKXPpS7C0BmWbwhnTYfe03tDlZ6lmhnu+Hofnbh/KzAEFVQrlPnBL7ThF0+DMvQD1+bfuh7R5j9RymbPpA9akpaoqclXnWIY1oZNfNEduPZFKHusVt43wGCEtIigtA2Ou8aJMq8QV5vjVHLx8iBwZb81sQBa0mkNmv3qkzJ4Gh8rHa8fX9k63ffIcl985wZstwP4b+Cukk9uZaqEk/hd2ylNc+/f8Wf4JZ0i6/Q4ffzXdF45q9lb6Q8qcUus6hPgDszA6nvIkfzDkFHEnt+T7B1vhpan9fQSH5l5OO4LsACGvt9ZHZOFBZOmS8eG6uKX3G9DJWX/bksNJWHjbCQajbtk4g3JLezsUbILYSCq3zwVh33bPLq2KgkaVn09SFZMv5nriNNwbSGwKDLNREjRhwTt9lAWY1y97XawDqHd3VqrSD+9wjuDwAFoi4vph2day+ccvk2X/RvNJd9YanBBG7s1FQvB2zn25nF6JeU+NCe7UT0+o5y08JDY0Axq4Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5160.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(54906003)(8936002)(4744005)(6916009)(316002)(36756003)(186003)(26005)(8676002)(53546011)(122000001)(71200400001)(38100700002)(31696002)(31686004)(76116006)(2906002)(66476007)(64756008)(66446008)(5660300002)(66556008)(508600001)(38070700005)(66946007)(4326008)(6486002)(86362001)(6506007)(2616005)(6512007)(91956017)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXNZMmJoWjBLYzQzN1JCTytDODhTRGMvV2JoREloY3lkWkUvcDhrUHpGR0I0?=
 =?utf-8?B?cXNoZEdhVkF4akU2cnFzQlIyY3FxY29pNmpaMlZadWZYaDlCZlNaQVNxbjho?=
 =?utf-8?B?cXlCSjNQSHRsVDJrcS9NcFdndWdURVFQRWR2M3RHTkdWclF5UEdYTW1tcGcw?=
 =?utf-8?B?SmVqSzRzMHNHVlBXVDFNajJsaFJBNXNEU1U1RmxRTTM3STdVZUxueTdxbHJn?=
 =?utf-8?B?d0xkWW96QnpnclVGTFFsRUh5aE9CeVltTERZbXA3VjZHaHh2bjBiQXZyL1Nv?=
 =?utf-8?B?NktyelVXaUNHS3dZQmZkZ0xuSW9kaEQyQzZMOG03bnArMmVaamJmeHZvRzRN?=
 =?utf-8?B?UjBBZkYrNUVaM3BCTXZoSVdncTZ3eXduQ3UxT0FPYURWUGx0cTRMY2VQVi82?=
 =?utf-8?B?Qm5PWjVqT0J2T2d0T0pyamluQmY4MDZHdkJLM3dZdFc1YWYzcm9aOGllRzZZ?=
 =?utf-8?B?OGw1Y3ZGK3A4cTVNTWxjcHgvWmR1L3Z2ZUVkMXJJKzZ1d2Zad0dXMjJRWm5C?=
 =?utf-8?B?bGNqWTZVVzY5WjBaaXdweEhKaDdIL0syS0lvZmRUQWhBM2V0QXd5ODROeUMw?=
 =?utf-8?B?eFAybklXSFl4N1Q2YWRNUkpmbWRzQ1o2dFZwQzFzMERZdzJCOUNQOUJjVGJN?=
 =?utf-8?B?L1E3aVpSRjhXSHBweW5Wa2FkK1pseU93dFh0aWZkUnFZZTNDM3JTUVVETFFn?=
 =?utf-8?B?WFgxL0NZbnJ4NWVPZGFCQ0ZMdDFrVTRndyszeDJZRzRLd29CUThIaGJXTHhj?=
 =?utf-8?B?c1FTOHJRelJDd0xaL0hMU2NOWEJBNUZoMG9nYTBid2RydFR4amUvblU4NHV3?=
 =?utf-8?B?THJENWFIemY1ZXM0VnpjTFlGMWZoVis3L3hjQUlEZEp3dTJaZEdiM1p3bnEz?=
 =?utf-8?B?V1AyRGRhczlTRGFEZDgvUy92akRGeTc3Ti9lUWJ1dzhHUmxiOGVmQ2RUNU1B?=
 =?utf-8?B?L2xKTnl3TjJJSmtpQjllSVE0S1Z4RWlHbnRlY0ZUaVBRclo3TkgzUnk1bDBy?=
 =?utf-8?B?RW9NajBVM0E2ckd4L0tidEF0Rkdhbys0SVpHcmFtY0lkT0xzeXhHTzVUWXJJ?=
 =?utf-8?B?UzVwTXI1K3dFejBETm9UckxoQ3h3Si9Yc3BYQW1PcmtnMzcxME9iREJIYkN5?=
 =?utf-8?B?SmFhVDdnbTlUbmpsVVFaMjJSdmEwRkVVYzlHUEFrd1c1NTlyTUQzL2U0OGYz?=
 =?utf-8?B?MGt4eHdiREZHUTVLNWsyMUcwbFEzNGlvRTJGT2xYZGkrVjZkYTY3Q05kSFNp?=
 =?utf-8?B?VGpCaEhLcUF5YjRuWjVtUTB6MTZ3TU5RbTZpVkpOeXQwZUZmUzkwYzc5S3po?=
 =?utf-8?B?RkM5ZTV5bk5HV1NLZk9EMDErYlZpWFdJSURCUnJUcGJ6SG5ZZWZsNSt5Vk0w?=
 =?utf-8?B?Y3RFMy9HcmxMQUdya2tOM1NTUlJpR01HL1pCL2w0aHYrZUk4dm1EUGlUWWhF?=
 =?utf-8?B?dzZnVnJLRG1NMlR0VC90ZmtCZE10bzlDY3lCQmxabXVZbUxXWTg5UVBIOER2?=
 =?utf-8?B?dmpvNGtDM3pJZDZjSlMzMXdHaWl1WTU0cCthOURFUVozMW94TDR4bmNUZnF0?=
 =?utf-8?B?ejF2L2VlL2xBdFpzaHpzaTlMYVBDUk5IaE1nQlhlTlozRzFySzhLdlBtR0JQ?=
 =?utf-8?B?c1NHMmVBbDR6REZSaG0wdGw2UnU5WXdBakVzbkhUYjI3cjZEWTRMSUpXNllx?=
 =?utf-8?B?TVVQOGlUbGE3N2V2K1M2Wkd4blVZVGc2UkNicTN4bUZhT0plNkZQYTNiWmFs?=
 =?utf-8?B?S1Y2WEg4NTBabE1PZk5rSUhLL2hCT25YeHQ3ampWMzU0Z2ZVV1MyOVBTSk1U?=
 =?utf-8?B?Z1lTa2dPTHVRaFV0V29zcjZwbGJPRC9oa3dqVDMrazY5a3NqZXFRME9Xc0Vs?=
 =?utf-8?B?bmFDaEhWNDJMTUthTEpXUmtSQUNuam15czR3ZldMMTJpNUQvd1lMNEFOY3lq?=
 =?utf-8?B?amFVQXg4VkFiYkwvYTBZRDF5cEhQWmFsWVErZGoxd3UwdjQxQ1ZGR2lYZXZt?=
 =?utf-8?B?UWZ1c2Faa3hXWVRQR2F3blBCL1lSUnhXZmdoNFNWY2tmemtpdUlqT0FMcDhu?=
 =?utf-8?B?RkpUdWFlSU9sQ0llK1hac2YwVDcwRVNkQll1R3A5L3VLV3BVR3hPME8xbUtY?=
 =?utf-8?B?c1IwRDNjUWJXR3VZV1p1dWhwTWYzbEk3aXdRRmxtYkI0dnU0ZEt4L3RaTjYr?=
 =?utf-8?B?eXpCc2JpaTlQR1R3L3RMMG03c3ROUytsMjZ2eXkrYjkvOWlObGg0MXp1WGdk?=
 =?utf-8?B?Q0l3NFpwSVk2eHZoeUU0MUczK2ZqZGJRdlpVeTVSWlN1OW9ZcThVbG9LT0dC?=
 =?utf-8?B?enJFUlVmZ1cxUVp0akRQVFVocFVaTk5RaTlXNkhrcmkwb0pZRzN4QT09?=
Content-ID: <F52FFEA2F51095458A307BF3A0F15767@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de9a8729-fb08-4ff7-0311-08da37210ea1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2022 09:47:14.4603 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7sHquWSD3FfZbl3KjDzVicuPaGwanhhPwZgWiDnhXtla6lKXvM/72UkBATQXBUyjnlQQxRgNK4d6ty13sxNf1vakLdXaKIRO037zdNUWZgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3750
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_024723_624948_83BEE464 
X-CRM114-Status: GOOD (  11.72  )
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

On 14/05/2022 13:18, Geert Uytterhoeven wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Conor,
> 
> On Wed, May 11, 2022 at 12:13 PM <Conor.Dooley@microchip.com> wrote:
>> [    0.000000] Kernel command line: earlycon=sbi debug
> 
> That should work without the "=sbi" part.
> 
> I've used "earlycon" and "earlycon keep_bootcon" successfully on
> icicle before.

Yeah, honestly just entirely forgot I could do it without =sbi, d'oh.
Thanks for reminding me :)

The HSS is hogging the sbi console & that was what I was trying to kick.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
