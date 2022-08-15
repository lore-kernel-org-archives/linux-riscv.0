Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0616BC00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 22:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PmRDdPnTbhC1cUDhN2igNXffSmI+N/7yW5LL+nAhZAE=; b=5DnieZJ3hy9MxO
	jR711VHr3Py4ljVEd/T/ddKxmWTHN2ZpxepCTWoOwG+YqMJLh3PZIx2R/GMpPmjUSTyJH0AVgy3Oi
	MKs7dbpmv+Ne1fEQnV6M73Ed1BA0x/SSnucMBuCH9lOpjsr+wXyMMYMPX+Ql68mw7HSZn1TSVDimX
	iMDJEv5Nu04WyH8BYI3wnPqE4mXN+2ndujy1NQozzofv1IYnUe6N9A32p21TG5oJ1W7BrncEjGJN5
	SUngMhvwivpf3Ot949lsdf6lMI+hQ9QNvWSEFv/+otpkkOF7CJxAmnYrEOtdzX6C5o31MTBBypxqc
	VhUNqy1+ITEGDQ8kIOtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNiMW-006TgC-DS; Mon, 15 Aug 2022 22:15:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNiMS-006TdU-RH; Mon, 15 Aug 2022 22:15:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660601704; x=1692137704;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=8ErtX1O4mXAC+uorKTtJDEULLX7NBRq1qAhebU/zdRc=;
  b=vxV7c/PZVg6q7q2AIW7jvtB/is7vAPit/JtHeXlzFEfybJ0IyzJOpEHP
   fOcbXOtV62G56+lVGRRxCFNgmb45ga7SkTuGovawSmwp5VwAMM+qcuOXn
   dYbtW1t7bdF+12vWV5Ba/MaDX60vMQ9oWLKafUGYIoI+PL1dqrOk/7099
   g/FF+miTyOM3eRCFDW2XfHhirIWO+Ewn983UmVsmatly/45cQ+J13tGPk
   +vYZNfs18yhkMFMkbqFgXq8HqRXj5c45rzJ6M/EWhQxKHLle2K2eYMhnd
   6CCWI0kyb+XlZCJIloazljSl3ffMyjGcWCy3LKkDBiia9yTXWgJXgPgKm
   w==;
X-IronPort-AV: E=Sophos;i="5.93,239,1654585200"; 
   d="scan'208";a="176341821"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Aug 2022 15:14:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 15 Aug 2022 15:14:57 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 15 Aug 2022 15:14:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DsmezGIRrsad9phFZYe8StIefAfMTtAWiWc7CG7/j1pSI/02y1OtlFSQvXPCkPaiH9/nK+IdOyYS/Jb1Salfv9GHtTfSgwx3vZaCzQxpUxV6jvoeO0iPNPDCmnzEKDdJ7q4pqMyN0mH73aPTrI22USg7U7GFgDnL1/DN8OlkJRFCZ3A2lrULHIyYyPthE03J+RUrEkPpIMyDYSH08Bj/TQ1qqupaDIF3o+p2I2rT/gZ8Hov1c8x0ybpTPjlEdG/4VEuf08q+6aE0cMv2LlY5C3vLfSQBR+CaXPyHCmldV1Ik8WJa+TcbvWS9wFyanDbEF3Swj9+tW46uHB5A1ME6VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ErtX1O4mXAC+uorKTtJDEULLX7NBRq1qAhebU/zdRc=;
 b=fXUKygS00v1Xu4CVsJXNmV2NkZMx7cTdUgL+fs7TaLLQWLP5aCG8pX6+LXRs7kGT9CuTrcwWItT0US7hmlswliyq2D4yRGVY8Owm6ccfGMigxVFcMsCS1YueFwxQtKsb6e1FaZdckrmgRGoBhKIavs6HS2083s/E/XFy0tGaTTInnkZO9RElMaf8FV7Ra+pcSuMy0Goa3OXyETPntG//3TyPORgNuSwq0Rg1BIGFqCpDMPsq8u5bzVfhUb5LXub66WXsB9K8rnoHw8IhT4bMqJ/gaFCouLGUjxCaYhN2XpvYFDmSDQrj0TY+yRN80u2TLZdmADzOLeC81tPGU7pjLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ErtX1O4mXAC+uorKTtJDEULLX7NBRq1qAhebU/zdRc=;
 b=RA28NO+hNEyDH6dYQUO0R+fN189cpyfVhdURxTfoqGOjaplEApWp5Ja4hypBJ2a1lG1PiSRLRsxVG99qg3AjelVTDH2SPCs4l3/O9kGKpqyDJO8hYMIk51wXbDXJWGrCxP1K/AearSsVdSzqABH8RpZG15VGiWLSSa2uK6UFLfM=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN6PR11MB4132.namprd11.prod.outlook.com (2603:10b6:405:81::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 22:14:56 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 22:14:55 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>, <palmer@dabbelt.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <atishp@atishpatra.org>,
	<Brice.Goglin@inria.fr>, <gregkh@linuxfoundation.org>
Subject: [GIT PULL] Fix RISC-V's arch-topology reporting
Thread-Topic: [GIT PULL] Fix RISC-V's arch-topology reporting
Thread-Index: AQHYsPRyXnHNGxm8rkSgpyoSWfWKTw==
Date: Mon, 15 Aug 2022 22:14:55 +0000
Message-ID: <4849490e-b362-c13a-c2e4-82acc3268a3f@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5d1b57d-0904-416d-36ac-08da7f0b9556
x-ms-traffictypediagnostic: BN6PR11MB4132:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WMmHsoLRdLEsbD6Gtt8INdVdUJ2M/T13Wa2vAGCPWbrpFyyH1TmSqHwLQKz9nqt+yXFR2k7cti7HSkRxLqvY26XF9+0dagurlz3cROcRHeY8mDDQ4wk9FroDLsRN+hDxEn41A46FUxh8znCJki1i9dB+3xfgJNUShV2eSV41aCGN2npcfiAjFzyiAegTO7ERNaqs/567zuvf/M23FRe9xPU9N9HOiAv/14fAvQTm54tzpeqhn0/DjaX4xVJMTCfFQ5/vzZARvfy+uoBceLd+wvYb90sqPgUiNFCGUDYdnrp86NzilWaGQN0HEKChPChIeyphU92TyTvVhRBA2wutXQmfZIh8enkhTTbC9hjs87XTLRnALXbiefNskhr58YZaVSWw1LJErphPzudLwzcn68ZYFNHhgqPJNZ2GplxKjsybTHKMWwvnZcGUoKLkibqHHpGS5/eTDpYQ6qVIAkjSGtepeISzLf/vWyffO0DUCtyXFX8BrfAbcJQaLSu2tf+HK/64jhEhvg9BfdHeaRhEgKhDSZorsNmF/22u7OvEsmc92f+yjpQSNhbOdLweTTNSSRPhyLe2CEx9fYgzeC2lk+GC30qxRvasv2uutxBz/YEhQyzeOJv01Xe3SWD0T64DvWJOcyB1DjIsSqtPRqD55wn22rBwGOIaEd8NdF5cTzypIiyTNpupIEKIA/7D5tkqvInFX1kCNRII46/1B0kbSnnkHkSeE9LUEdVOYUanNN3L8Dccx9izHh2XbLiMM5VwyASHcQzoUd+vqi5Lyo8zWlWWwq6F+9kxl6p06P9N32EprhuL9K0+KYjKDrJvKBbbEpylGH0Ke728yoHiYZ+KMZ1TSHURooTlyn8qfSkERJZaOB8JSjSuyi1XhoVLot4XxYR3egn6JSfOpBz2F6iqd9uljFNGEkz3wLMwXF24zJajY2Nq1Pdcubf1pKgOQKS+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(136003)(39860400002)(346002)(376002)(6512007)(71200400001)(54906003)(2616005)(86362001)(41300700001)(6506007)(36756003)(186003)(26005)(83380400001)(91956017)(316002)(76116006)(4326008)(110136005)(31696002)(66946007)(66476007)(2906002)(66556008)(66446008)(64756008)(6486002)(5660300002)(478600001)(966005)(31686004)(8676002)(38070700005)(7416002)(122000001)(8936002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFZ5NDdGK2R5NHEycUdIRFhRS1lqWmRaeFQybnczWXNiWHdtTjFnQ3BFWm1V?=
 =?utf-8?B?S2FjTEQ0UkpQZFU0MFMvRERzNUlQR1VEeUVxM3VIbjZWbUVURVhDaVAzTjVl?=
 =?utf-8?B?VDRlTjA1NWdJby9NOWIwd3dFZzdXeDdVMGkwTnVCT2VYYmM4eVBTbkRYUW9Y?=
 =?utf-8?B?U081MFNlc3pGNGVOczQ2TmpMbnBrTUFMNkJtK3ZvOUxlcnJ6OFUrK1R3ZHNr?=
 =?utf-8?B?RVVKKzhRWXdwdHQzNGZEM3hCMnMxeVJ1cE8wTmg1ZWo4ZWxhUU1LaGhHY2J6?=
 =?utf-8?B?eU1UdFQ2N3kwWDROdFhwMDBoRGF0R0x6RytIUEN0em9uSVlod1BRcHlwZnMv?=
 =?utf-8?B?bE81bzd4N2VjUm5zL2dIOFZTWWZocjVQRG9hektYcmhWV25UYkR4OXdnRU9i?=
 =?utf-8?B?bk14bm1LOTlqdnJZV2Z2TTNBK3g3M1RZSW8vdWVoVmJWbDBBenpsTEZNQ0tP?=
 =?utf-8?B?NC9Jam5lbzV3M2tLOWpCYitET3VVNmJQem8wSm1QNjhtN2hOWENjTkpqZG9C?=
 =?utf-8?B?dTBQa0wvZDB6R1doanBSUXFZWHZGZGxhVzVyaUE5OXVGOWd1RDVmQjBsVGRI?=
 =?utf-8?B?T1BtaHZDOTNLTzZDaHppZVA1QWd6RlFBaCtVSU5rd3BHS1RRVnQyWWFIWjBp?=
 =?utf-8?B?UE1yWTRNaGlpc3FwSTBvUElQQ0tEc0h5eUVaeEV5bDJVN3B0Y2hpcGpWQ0Nv?=
 =?utf-8?B?cXBvTHpXSlZZcFpKNXk4Q0hWQmpUZ3g3c3JXK3RsMFgrRzBSTFhyZ2RhVzhj?=
 =?utf-8?B?Z2VscnRHS1VqQ2o4bll6UkN2YVl6cy9oK3NhVzE2dUo1dlZyanVLOENSVHVq?=
 =?utf-8?B?bVhEdWJ6aDAyTElOTWlEZi8wNERUV2wwbnlMVUVUVThtUWtsdTRzLzBrYldU?=
 =?utf-8?B?S29iUkNaQ3lrNEE3TGEyZllrYkErdTE4OWJjRnZaNDFZcTAxYlc4UG5QMy9w?=
 =?utf-8?B?M2hKWktuRVl0YU9JTzdtUE1TbWpMZlphRThGTXpGd0g4OHhSMm0yMHhpZE0z?=
 =?utf-8?B?alJ4b1NCeVJFcHk1ODh2dWRkYmxDQ21qNDRNeU50U25qdWREOFpFWFh0ais2?=
 =?utf-8?B?b3k1clpqVzVHbkZSMzVNa1d6TTdLVi8vU0JQY0NXcklQVmZmbnN5RHRTdkRh?=
 =?utf-8?B?djBlZW5WWTNDSEwzaXdsQlpsWlFvby9ITW9yZ2lUeUxoMzJ3cUlGczNGNUVK?=
 =?utf-8?B?bzNXK0xLaDN2MXg2NjFGUmhwa0hKVVN5eE1CemFFNDVWYllkMDFMSUpNK3hk?=
 =?utf-8?B?OVh0L2I0VEYrcFU4NVF1NkozckFjdTNuZENhc1hiN1h1SW9HMGNkakpmdC8x?=
 =?utf-8?B?WFZMWnJHWVcrMmVRdlF2UDhMaVM3RVhiSWUxc2ZyeXFtNDM3NWxLNVdwZjVV?=
 =?utf-8?B?OFdkZElNQm1mazhCYXhGc1dMM2pzQ3I2RkJVRDdZZkFZVHRXRGRNd3duMW1K?=
 =?utf-8?B?N3cvMEE4alRKQlJMcGpncm1jVTM2cHdQV1VEZnc4aEh0UW5xcHI4eWZ3KzdO?=
 =?utf-8?B?T0ptWHhVWmdCb2JJWUF6WFljVEdrblpMeDV0ak5BY0FOd1JrYnRjTEpqZHJW?=
 =?utf-8?B?djlBeGJneHdBQUZPTWgvMDU4ZmlXWjMyeDVjN2NLVHpvVWo1UzhVSktPc2RJ?=
 =?utf-8?B?akttY0xRUUNRVk03UkJYaXZFSW9wdXVFTUQxbEdRa0xHK2Y1RUhqVnE2SFZL?=
 =?utf-8?B?a2FkTkdJdWo4dlVyOS9OTUlaL25CNDZtRDRiRjRXbEUvU29PN1dZZ3BMY2xi?=
 =?utf-8?B?VUNaQ2N6dTZ6YUJzcDFGQzJIck84Ty8xdUNwaFE2OTVmTElDdVpuQmtMVGF1?=
 =?utf-8?B?enlkbVB5S2hwNHg5Tks5SWQ5ajJQT1cyRExvZnhVc2NlK2I3K0RLVVI4dXV0?=
 =?utf-8?B?enNuTmpkcGdGZTNENXhuYVN3bjZTUDI2YzA3RVNZbFhIQXhFZTBkZEpOTmxK?=
 =?utf-8?B?TWc0UzZORkI1M2QvRm9xL0QxelRkTStLdnhmRCt2bWNyM0JFOURLMmVIOStK?=
 =?utf-8?B?SEx6ODM1bWswNDFwZkswUDE0YlNPbXJYd1VhTXZrVWpDOUpGQzhVMEpIdm9q?=
 =?utf-8?B?M1hxVkg1cWpNdElVNFVWVSt5WUpEMUROdU9lMXhtT3pTbERPUDRsME5nWnly?=
 =?utf-8?Q?hgt6IydE2EUw0Ib9snlE4H2yi?=
Content-ID: <ABD5967021992B45B9DEAA94C532255C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d1b57d-0904-416d-36ac-08da7f0b9556
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 22:14:55.2857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UwfZj1ICuXsCaQkPnm7YsyiUuwnDMygi2Zbemb0/H853cIVBSkhhYm+8Uk/k3g42zBgVfau1E66GBfcGbyerxjql3HSaXfvNEZGjctMq15w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_151505_208178_49F3FDB4 
X-CRM114-Status: GOOD (  15.23  )
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

Hey Will/Palmer/Sudeep,

Catalin suggested [0] dropping the CC: stable for the arm64 patch and
instead making it a specific prereq of the RISC-V patch & making a PR,
so here we are.. I was still up when -rc1 came out so pushed it last
night to get the test coverage, but LKP seems to not have reported a
build success since early on the 13th so not holding my horses! I built
it again for both ARMs and RISC-V myself.

I tagged it tonight, so it's on conor/linux.git as riscv-topo-on-6.0-rc1
with the prereq specified.

Not sure if you want to merge this too Sudeep or if that's up to Greg?

Thanks,
Conor.

0 - https://lore.kernel.org/linux-riscv/Ytac7G1zlq6WW4jt@arm.com/

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-topo-on-6.0-rc1

for you to fetch changes up to fbd92809997a391f28075f1c8b5ee314c225557c:

  riscv: topology: fix default topology reporting (2022-08-15 22:07:34 +0100)

----------------------------------------------------------------
Fix RISC-V's topology reporting

The goal here is the fix the incorrectly reported arch topology on
RISC-V which seems to have been broken since it was added.
cpu, package and thread IDs are all currently reported as -1, so tools
like lstopo think systems have multiple threads on the same core when
this is not true:
https://github.com/open-mpi/hwloc/issues/536

arm64's topology code basically applies to RISC-V too, so it has been
made generic along with the removal of MPIDR related code, which
appears to be redudant code since '3102bc0e6ac7 ("arm64: topology: Stop
using MPIDR for topology information")' replaced the code that actually
interacted with MPIDR with default values.

----------------------------------------------------------------
Conor Dooley (2):
      arm64: topology: move store_cpu_topology() to shared code
      riscv: topology: fix default topology reporting

 arch/arm64/kernel/topology.c | 40 ----------------------------------------
 arch/riscv/Kconfig           |  2 +-
 arch/riscv/kernel/smpboot.c  |  3 ++-
 drivers/base/arch_topology.c | 19 +++++++++++++++++++
 4 files changed, 22 insertions(+), 42 deletions(-)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
