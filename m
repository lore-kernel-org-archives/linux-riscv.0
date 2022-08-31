Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F18ECAAD3
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Aug 2022 07:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z/Yhak2RYzxf+uy52ix46UahwZVRhjaP4C3dXz7qKI0=; b=HWonTcliZZpruo
	zMluWPnWc7dWdNIssFsqbnBJj0JrjrD0t55F7q5uWDUGGXeHMGFI7nwvJbn+UnlEo45eb6qL1Hd60
	Qe1vTwgue0GX33dQB8dVqUWFdEQX9v15qB8rrUrS1Wu+IM6Ojfz0b/sr2hQf9lepoeOwd17A93YCp
	dBPKLwvg9KT+fT6H/Tr9P4TNkaf9iM9a4qJnvYELd3ybTc2SsnxMWcNwXsiP4s+oJWT8NhRxNlVGW
	DLBI/X+29erS8QBX3CMrQpiA5xZqeOb7P+S8r0vmCYDmOFU3qy7BoOX5WzHU3JDdas8guoA9z84+n
	COoif/yCF90qSkT0r6DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTI5F-004ZrF-9j; Wed, 31 Aug 2022 07:24:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTI5A-004ZoM-0M
	for linux-riscv@lists.infradead.org; Wed, 31 Aug 2022 07:24:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661930655; x=1693466655;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=BknXojE3EvEn/JdWQqBQO3djvTcfFiJ8xS3DUgMeskM=;
  b=IY9iVUIshgtDgkwbxduYDixEc/HZK2W3iwaWHAz5lCp+GephJKri1WuT
   t++QLB6zM/od/cHg3WJ8CYCmdAnRP0HBNjbgzkcDTdwQDL+EACJXfxTK5
   OfFzjCc6KEYpckkPRRYVIAOo/plcrB9C6qwaNu5Ujst1+FhtQK4B66jY3
   fkWdh0IkngTa6xAJdrGTRwPfupD1EP9cI9vvXOaEJj/FSPZ7ArbLCBifE
   rpjjPIA7h7oO158b9wQnKaxH+xqtU6y0AHr7obE6VFvZSTXtR2ztuk55Y
   Ax0iNnsdtRvDSX+52SzMkN1Z8Xs6rR5wapxfZdu8cxTHX2JBXy3Ik1M6d
   g==;
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; 
   d="scan'208";a="174949287"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Aug 2022 00:24:12 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 31 Aug 2022 00:24:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Wed, 31 Aug 2022 00:24:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5fWoSLf3cCDt8J/Av9qlG8FlhiSIDqzRcEnivmu6IdBt2XoVdQ74hLsR4awVWrFy5w2d4wF2C4hzb4KHhzeljVlxocG4lWwMH3LNPnXP5GsP3+EvDAMT3tP63dCF37GQNC8ka26/to6bIyHrQquwsAKa2yQ+dcpf+OCHeSgUj7QS/cYc7sg6xThRGUdFtp5MCRDxppITmiZJP3xK8rxLeblG5WxWDGo1wErT3UFL/ZaXrkNvHMCscq+YqAYSUdbWN9KqqGJQDcqH3vDADZis0wJl0CztHaihGKFrojYhGoFmMcfQdka2KeiLZ8s1tmZwUPkzF7iAp3QyIoPrUQTAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BknXojE3EvEn/JdWQqBQO3djvTcfFiJ8xS3DUgMeskM=;
 b=oCr0w3aOzbKESCTokv+vGu1/UVTXhVytWd/bTUAAjFF/+JZwdqH46inHPf6iNpQc4WSWUk50uuKIGMae+6d/cRPI5Bpe1gQvCW+y8CpR/K4sI3TxTN+EUMTcymHEz42rNinODUVn4WHrXQCF4qpfA1adIGC6xlA0+DoMVVRwsFB2Q8+v48UTAw8lcz8QZ2aaesoGdYXrDw9ksaWGxyocBbUvWo/CJEi2sjzYGxoUzuSH2ZscmaaCIYCnY8z+HKEsxXRPo1h2EqeooLKkJM8IeOoY6r3fBejhnu9t6wFkTKTob51S2fw0fif9I/UKhSXPhXM3xheen1FUqVZsfkX1Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BknXojE3EvEn/JdWQqBQO3djvTcfFiJ8xS3DUgMeskM=;
 b=tiI4drsDDNHzwWgh936WnFFAicOdbpbWoar7tXKMNAd47DVFxfnjsN9Bl62lJdN0/wIIeyWiuI0KPiURyaqekIU3w5vR+/ATPGeWq6R0rrCx3//lEjejdtvZY2rlWtb3mP9ZN8yM4FEobCPkfW6luTwmoWsjyFc0sk5bEQVrQ4g=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM6PR11MB2554.namprd11.prod.outlook.com (2603:10b6:5:c8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 31 Aug
 2022 07:24:09 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 07:24:08 +0000
From: <Conor.Dooley@microchip.com>
To: <chenguokai17@mails.ucas.ac.cn>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <rostedt@goodmis.org>,
	<mingo@redhat.com>, <sfr@canb.auug.org.au>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<liaochang1@huawei.com>
Subject: Re: [PATCH] arch/riscv: kprobes: implement optprobes
Thread-Topic: [PATCH] arch/riscv: kprobes: implement optprobes
Thread-Index: AQHYvO/eaHU6+YdQhkeJ6FHUUeiIQa3Im1yA
Date: Wed, 31 Aug 2022 07:24:08 +0000
Message-ID: <882e9efc-7222-c3af-e37b-f339789e94c0@microchip.com>
References: <20220831041014.1295054-1-chenguokai17@mails.ucas.ac.cn>
In-Reply-To: <20220831041014.1295054-1-chenguokai17@mails.ucas.ac.cn>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d0f750f-8e2e-4f86-a483-08da8b21cb3f
x-ms-traffictypediagnostic: DM6PR11MB2554:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z3W6O5obhCmURf29cCdpyeIlAXJXS5NGYdlTKixT6268rM9sSqv0EsY98nbVvJW3iJH99PEM00P6kkVj18XN3wa/Nj+h3PSgkQo5MaMrwlEiOJigsmfgzwNj0CRT/b3iKy1Pjc0u0m8K41szq+AS78MjLuS+XAz//OJ5cR+cXFmxYDHzpQx57j31ycVQ7FbFe+7ScvR3wtYU6Vrcc3eGef8+fpA4yFz672Dcl5+MHoPfc7ztH82zmdCnyhg7De6OjcMpis9ft3kEwKOJIkYjgu99ffCGOfmwKdL+jfd5BrWRWi5ERAlRPFpdrKznrlqFK+ecDGOCK6KhSXIjAqWlfxIumX/UKgAIyNShFpX5NCLi5DQMUk+FyL38ArrWtOUw3J4xbcdyHbg8wWHAn9R/ZJFAeMDashhaKBj4P03MiT8zZpVZI4L/TyFKC2P1L8uGcfH8Q53u6S1WsjkuLCZHzte+M06EhwaHhGEy65vhFpmufPrshakzGP+OhhKdbZSuEUP5wg4zmX9/PNTqapfT7tr0fZnSzKt2/ALpn0poLnEGtfK2mB26jXO3jVMRCib0Zqg4vwzlZaEnIpV8GjL/IxF6JIKBvTYMqoYlLyiGg8/0S1RYG3DRR9RfcMzzN245QFHhC0MagAQfT3C1nSCj7qLjZ6I8j4KsbH7N1t4ZnZK5IlMjy2LAFfQul5yQwTPRe/Tbbnhnff8GzM9U0fmwF/oW1zPJCU+C8Q+DNN2XxFvUmFh5H9Rm8cvooqySwZcxbFb/2eKGh9+DnnC2O3PsVgeGs1Sweea0QHzTu80uI3a1MyP+H2rp70nBkXfhZm6Maose5r3E1xK+YassKxkFtA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(136003)(396003)(346002)(39860400002)(66556008)(64756008)(6506007)(91956017)(41300700001)(110136005)(478600001)(7416002)(30864003)(2906002)(66946007)(66476007)(966005)(66446008)(76116006)(31696002)(53546011)(6512007)(4326008)(26005)(6486002)(8676002)(2616005)(8936002)(83380400001)(186003)(86362001)(5660300002)(38070700005)(38100700002)(122000001)(36756003)(54906003)(316002)(31686004)(71200400001)(43740500002)(45980500001)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0FZMWlhdzFlLzN1SXNqU2NFUVllNFZGQWlFNkdrYzF0cmozbzgvYXVxQlFw?=
 =?utf-8?B?NHF0dmZySFJyV1FlQkRad0hUbDZCNkRFNDNGZlRTSXZGaVdtMjQram9BN2Jn?=
 =?utf-8?B?amNTVytnVmc2ZWdiU3pqa2JQNWhLejdISUhxTHhSK0x5d1ArOW9zNXZYeFFl?=
 =?utf-8?B?TW0xZmZIanBxU0pGeXNibVhHYU1pR2ZJcHlOTnhnVmo0OXVLQnRJN1NXMnpC?=
 =?utf-8?B?YWFaeE43dzU1L0NzWGM0cnZtOVMvN3lHcmJiSkZ0MGxILzFRcmJYVEg4L0ZP?=
 =?utf-8?B?cEJTY2VLOTBkdFNTTGc1c2g0SCtRZDNwd0xpOHJvR3UxSDhkcnVaRmkwdDZB?=
 =?utf-8?B?dnZuNUtHK1JJRlFqRC9QMnhnWkhkTDU0QXJZSmZ1c3FkZHhMY2FpSjM1NWxo?=
 =?utf-8?B?MFpPN2VCcmpLclU3ZlZRdFBvS1BxL1NaYlV3YW9rekpvN2VjMWtmVWljV211?=
 =?utf-8?B?THBENlpoQ2dWcStkNnRxeG5QYWdxcUdHOStPaDNlS3lMbjN1bkRkbVVwTk9L?=
 =?utf-8?B?bDM1N0N1c3VjR1dKTHRQVjZ4R0lvTitQUWZxaVl3aG1UODN2d2RsYWpwVWxm?=
 =?utf-8?B?NEEwT0ZTMXRTaW9IMWZ1TWo0M3VvYW9HNzB4RjFWVWdjUDErT2tVV3lVcEln?=
 =?utf-8?B?YVdYQ29sQVBuSHZQczhzV2pxTzdNWGg1YjExR3NFcU51cGc5NUNuS2UwWGJx?=
 =?utf-8?B?eDBtUnV6QUgzMFBuSUo0M2lsVXAyZmwxcjBONkNsdjBKZlZXeVRqRzY3MDM1?=
 =?utf-8?B?WkJSVDVBV0VZYVNTMmU1QTVHM0ErTWJuMG9BalVHYzA3WXU3aFRrNGNWOE1q?=
 =?utf-8?B?UzJZNjl1M3hWUnd5em1oQnJWZ2NQMGIvdG51ZHpTKzhvbEM4Z2oxTkVTNHRS?=
 =?utf-8?B?bWRodEJrZmZSY0VPSkVUSElIK0lxcGpmRlI0UFczVjhZN1ZaOFVEK1l5cXBq?=
 =?utf-8?B?d3RYcXB4MVUvL3pUcTliaGUxZGxtbDhId25QdzBTb3ovcWJtSnBLdDVzZmx6?=
 =?utf-8?B?WXE1N1J3ZDJDSy9xZTBDY0x6dGhrb21BNlcydXVMckNPZFF3Rk9ORnlQdisv?=
 =?utf-8?B?dFNpSTRSK0w3aDNPUmlHVVlTaGxJcm1BUnJBZ1dYQWF4c0hvK0ZwWk5wb3Bu?=
 =?utf-8?B?dDB0TXQrR08ydk1qV0NIbmZUazVmRjFORDZJSFFWdFQ2REJLMmJZaFM0bVdl?=
 =?utf-8?B?MENxbjAyZVFmRkswQzBoQWxQMHdXektydEowbnBNbEV1Sms4OHFqdTJTM1NV?=
 =?utf-8?B?WkY4cnBoU1VnMjBNbVhHQTJNM0k1Kzg5RVF3bktGb01LUTRGNGQ3czBYWFN5?=
 =?utf-8?B?TlRCWlA5bVFFNTEzMk5vQ2V2QzdqL1ZqRE1xdmRLcHY0d2lWVk1hVzR4aTMw?=
 =?utf-8?B?TlR5ZVd3T0t0L1FPTDlPRkxJUFl3eWZqSG5FV0hOaWxNbUNHVzNDTm4xSXJu?=
 =?utf-8?B?Y3hQVzRObld0N0ZqN1hRWW9nYnhIMDVCQnlEcmdtSUt4Ti9IR0xQR2V0L3lv?=
 =?utf-8?B?K3JvRzE5VEErV3JmejU1UmJ2SGlDNitzdUMydEQvaW9Zci9mcnlKbkhHWXpu?=
 =?utf-8?B?ZXkyRW81WlNzZFB5cUdLTjZHRHYwM1JaUG1nSmd0bk8wR3AzZjluU2xJTWw0?=
 =?utf-8?B?Z0RlOHNOY3pQU1JJYzJMYlB3dUJpVGd2Z1VQaW5pRnE2Q0VIblJ6ak9BU2ww?=
 =?utf-8?B?OFNGTHRDcFNxbXZVQWx3bUIyS1ZrUVNKUkFGckRRVm9FSHJQc0JPREJ1eFpa?=
 =?utf-8?B?WjBHcm56LzRvV1BFWk55Tk9TdGFWWi8xU05hTEM5bEVMck1mdzdJV2xiZnRi?=
 =?utf-8?B?MzRGUmFVTUFJeVdNRWt0OVNEeXVISjBFUVN4SCs0c282TFVsZEIyTVlsQ3JT?=
 =?utf-8?B?citKbmY3T1hqVFdVT2FhL1d1dzJLOG1LT2ZwWVhjS0drUm8vYmZ6UklwVVQ5?=
 =?utf-8?B?ZUJNV0k0WmJNdjRnb0czOGkrbXZ1NmU5eWx2YWR5ZlhXcDZwSC9lVXJrL3hh?=
 =?utf-8?B?eHdSVVlqQmFKb1l0b2hueFVZRCtlNWtLbVI1TithdFlJZXVWWlo3NEt5d1Z0?=
 =?utf-8?B?aDdLb3E3NlpoSHk2Q1E4TklXT1lWZHZDM3kvelg5YjI2MVp0MWJ0eEswbVhI?=
 =?utf-8?Q?sbHUWNVRRT8GpZhKctHr5v4X3?=
Content-ID: <B73C5498384D3F43B4AB52413608E7A2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0f750f-8e2e-4f86-a483-08da8b21cb3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 07:24:08.6317
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tlLj4gkN6o/IY2f5vsdVKelqL8aUklgYAE1S+TkG4p6WFWcmu75R4/A2xHB2oz+Kman4HrNyxjwKHxUo59VK1j+OtUZ8w1L0dam5UwKL9hk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2554
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_002416_349956_6DA4B0B5 
X-CRM114-Status: GOOD (  29.98  )
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

Hey Chen,

FYI there is a build warning with this patch:
arch/riscv/kernel/probes/opt.c:34:27: warning: no previous prototype for 'can_kprobe_direct_exec' [-Wmissing-prototypes]
    34 | enum probe_insn __kprobes can_kprobe_direct_exec(kprobe_opcode_t *addr)

Also, if you run scripts/checkpatch.pl --strict, it will have a
few complaints about code style for you too. Other than that, I
have a few comments for you below:

On 31/08/2022 05:10, Chen Guokai wrote:
> [You don't often get email from chenguokai17@mails.ucas.ac.cn. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> This patch adds jump optimization support for RISC-V.

s/This patch adds/Add

> 
> This patch replaces ebreak instructions used by normal kprobes with an

s/This patch replaces/Replace

> auipc+jalr instruction pair, at the aim of suppressing the probe-hit
> overhead.
> 
> All known optprobe-capable RISC architectures have been using a single
> jump or branch instructions while this patch chooses not. RISC-V has a
> quite limited jump range (4KB or 2MB) for both its branch and jump
> instructions, which prevent optimizations from supporting probes that
> spread all over the kernel.
> 
> Auipc-jalr instruction pair is introduced with a much wider jump range
> (4GB), where auipc loads the upper 12 bits to a free register and jalr
> appends the lower 20 bits to form a 32 bit immediate. Note that returning
> from probe handler requires another free register. As kprobes can appear
> almost anywhere inside the kernel, the free register should be found in a
> generic way, not depending on calling convension or any other regulations.

convention

> 
> The algorithm for finding the free register is inspired by the regiter

register

> renaming in modern processors. From the perspective of register renaming, a
> register could be represented as two different registers if two neighbour
> instructions both write to it but no one ever reads. Extending this fact,
> a register is considered to be free if there is no read before its next
> write in the execution flow. We are free to change its value without
> interfering normal execution.
> 
> Static analysis shows that 51% instructions of the kernel (default config)
> is capable of being replaced i.e. two free registers can be found at both
> the start and end of replaced instruction pairs while the replaced
> instructions can be directly executed.
> 
> Signed-off-by: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
> Signed-off-by: Liao Chang <liaochang1@huawei.com>

What does Liao have to do with this patch?

> ---
>   arch/riscv/Kconfig                        |   1 +
>   arch/riscv/include/asm/ftrace.h           |   2 +-
>   arch/riscv/include/asm/kprobes.h          |  28 ++
>   arch/riscv/kernel/probes/Makefile         |   1 +
>   arch/riscv/kernel/probes/opt.c            | 483 ++++++++++++++++++++++
>   arch/riscv/kernel/probes/opt_trampoline.S | 133 ++++++
>   arch/riscv/kernel/probes/simulate-insn.h  |   9 +
>   7 files changed, 656 insertions(+), 1 deletion(-)
>   create mode 100644 arch/riscv/kernel/probes/opt.c
>   create mode 100644 arch/riscv/kernel/probes/opt_trampoline.S
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d557cc502..a54e50de2 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -97,6 +97,7 @@ config RISCV
>          select HAVE_KPROBES if !XIP_KERNEL
>          select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
>          select HAVE_KRETPROBES if !XIP_KERNEL
> +       select HAVE_OPTPROBES if !XIP_KERNEL && !CONFIG_RISCV_ISA_C
>          select HAVE_MOVE_PMD
>          select HAVE_MOVE_PUD
>          select HAVE_PCI
> diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
> index 04dad3380..8b17a4c66 100644
> --- a/arch/riscv/include/asm/ftrace.h
> +++ b/arch/riscv/include/asm/ftrace.h
> @@ -35,7 +35,7 @@ struct dyn_arch_ftrace {
>   };
>   #endif
> 
> -#ifdef CONFIG_DYNAMIC_FTRACE
> +#if defined(CONFIG_DYNAMIC_FTRACE) || defined(CONFIG_OPTPROBES)
>   /*
>    * A general call in RISC-V is a pair of insts:
>    * 1) auipc: setting high-20 pc-related bits to ra register
> diff --git a/arch/riscv/include/asm/kprobes.h b/arch/riscv/include/asm/kprobes.h
> index 217ef89f2..6c5e10709 100644
> --- a/arch/riscv/include/asm/kprobes.h
> +++ b/arch/riscv/include/asm/kprobes.h
> @@ -43,5 +43,33 @@ bool kprobe_single_step_handler(struct pt_regs *regs);
>   void __kretprobe_trampoline(void);
>   void __kprobes *trampoline_probe_handler(struct pt_regs *regs);
> 
> +#ifdef CONFIG_OPTPROBES
> +
> +#define MAX_OPTIMIZED_LENGTH   8
> +
> +/* optinsn template addresses */
> +extern __visible kprobe_opcode_t optprobe_template_entry[];
> +extern __visible kprobe_opcode_t optprobe_template_val[];
> +extern __visible kprobe_opcode_t optprobe_template_call[];
> +extern __visible kprobe_opcode_t optprobe_template_store_epc[];
> +extern __visible kprobe_opcode_t optprobe_template_end[];
> +extern __visible kprobe_opcode_t optprobe_template_sub_sp[];
> +extern __visible kprobe_opcode_t optprobe_template_add_sp[];
> +extern __visible kprobe_opcode_t optprobe_template_restore_begin[];
> +extern __visible kprobe_opcode_t optprobe_template_restore_orig_insn[];
> +extern __visible kprobe_opcode_t optprobe_template_restore_end[];
> +
> +#define MAX_OPTINSN_SIZE                               \
> +               ((unsigned long)optprobe_template_end - \
> +                (unsigned long)optprobe_template_entry)
> +
> +#define MAX_COPIED_INSN 2
> +struct arch_optimized_insn {
> +               kprobe_opcode_t copied_insn[MAX_COPIED_INSN];
> +                       /* detour code buffer */
> +                       kprobe_opcode_t *insn;
> +};
> +#define RVI_INST_SIZE 4
> +#endif /* CONFIG_OPTPROBES */
>   #endif /* CONFIG_KPROBES */
>   #endif /* _ASM_RISCV_KPROBES_H */
> diff --git a/arch/riscv/kernel/probes/Makefile b/arch/riscv/kernel/probes/Makefile
> index 7f0840dcc..6255b4600 100644
> --- a/arch/riscv/kernel/probes/Makefile
> +++ b/arch/riscv/kernel/probes/Makefile
> @@ -3,4 +3,5 @@ obj-$(CONFIG_KPROBES)           += kprobes.o decode-insn.o simulate-insn.o
>   obj-$(CONFIG_KPROBES)          += kprobes_trampoline.o
>   obj-$(CONFIG_KPROBES_ON_FTRACE)        += ftrace.o
>   obj-$(CONFIG_UPROBES)          += uprobes.o decode-insn.o simulate-insn.o
> +obj-$(CONFIG_OPTPROBES)                += opt.o opt_trampoline.o
>   CFLAGS_REMOVE_simulate-insn.o = $(CC_FLAGS_FTRACE)
> diff --git a/arch/riscv/kernel/probes/opt.c b/arch/riscv/kernel/probes/opt.c
> new file mode 100644
> index 000000000..b9bcf6e12
> --- /dev/null
> +++ b/arch/riscv/kernel/probes/opt.c
> @@ -0,0 +1,483 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  Kernel Probes Jump Optimization (Optprobes)
> + *
> + * Copyright (C) IBM Corporation, 2002, 2004
> + * Copyright (C) Hitachi Ltd., 2012
> + * Copyright (C) Huawei Inc., 2014
> + * Copyright (C) 2022 Huawei Technologies Co., Ltd
> + * Copyright (C) Guokai Chen, 2022

Should this not be your University here?

> + * Author: Guokai Chen chenguokai17@mails.ucas.ac.cn
> + */
> +
> +#include <linux/kprobes.h>
> +#include <linux/jump_label.h>
> +#include <linux/extable.h>
> +#include <linux/stop_machine.h>
> +#include <linux/moduleloader.h>
> +#include <linux/kprobes.h>
> +#include <linux/cacheflush.h>
> +/* for patch_text */
> +#include <asm/ftrace.h>
> +#include <asm/patch.h>
> +#include "simulate-insn.h"
> +#include "decode-insn.h"
> +
> +
> +#define JUMP_SIZE 8
> +
> +/*
> + * If the probed instruction doesn't use PC and is not system or fence
> + * we can copy it into template and have it executed directly without
> + * simulation or emulation.
> + */
> +enum probe_insn __kprobes can_kprobe_direct_exec(kprobe_opcode_t *addr)
> +{
> +       /*
> +        * instructions that use PC
> +        * branch jump auipc
> +        * instructions that belongs to system or fence
> +        * ebreak ecall fence.i

Please use the full columns available to you for comments.

> +        */
> +       kprobe_opcode_t inst = *addr;
> +
> +       RISCV_INSN_REJECTED(system, inst);
> +       RISCV_INSN_REJECTED(fence, inst);
> +       RISCV_INSN_REJECTED(branch, inst);
> +       RISCV_INSN_REJECTED(jal, inst);
> +       RISCV_INSN_REJECTED(jalr, inst);
> +       RISCV_INSN_REJECTED(auipc, inst);
> +       return INSN_GOOD_NO_SLOT;
> +}
> +
> +#define TMPL_VAL_IDX \
> +       ((kprobe_opcode_t *)optprobe_template_val - \
> +        (kprobe_opcode_t *)optprobe_template_entry)
> +#define TMPL_CALL_IDX \
> +       ((kprobe_opcode_t *)optprobe_template_call - \
> +        (kprobe_opcode_t *)optprobe_template_entry)
> +#define TMPL_STORE_EPC_IDX \
> +       ((kprobe_opcode_t *)optprobe_template_store_epc - \
> +        (kprobe_opcode_t *)optprobe_template_entry)
> +#define TMPL_END_IDX \
> +       ((kprobe_opcode_t *)optprobe_template_end - \
> +        (kprobe_opcode_t *)optprobe_template_entry)
> +#define TMPL_ADD_SP \
> +       ((kprobe_opcode_t *)optprobe_template_add_sp - \
> +        (kprobe_opcode_t *)optprobe_template_entry)
> +#define TMPL_SUB_SP \
> +       ((kprobe_opcode_t *)optprobe_template_sub_sp - \
> +        (kprobe_opcode_t *)optprobe_template_entry)
> +#define TMPL_RESTORE_BEGIN \
> +       ((kprobe_opcode_t *)optprobe_template_restore_begin - \
> +        (kprobe_opcode_t *)optprobe_template_entry)
> +#define TMPL_RESTORE_ORIGN_INSN \
> +       ((kprobe_opcode_t *)optprobe_template_restore_orig_insn - \
> +        (kprobe_opcode_t *)optprobe_template_entry)
> +#define TMPL_RESTORE_RET \
> +       ((kprobe_opcode_t *)optprobe_template_ret - \
> +        (kprobe_opcode_t *)optprobe_template_entry)
> +#define TMPL_RESTORE_END \
> +       ((kprobe_opcode_t *)optprobe_template_restore_end - \
> +        (kprobe_opcode_t *)optprobe_template_entry)
> +
> +#define FREE_SEARCH_DEPTH 32
> +
> +/*
> + * RISC-V can always optimize an instruction if not null
> + */
> +int arch_prepared_optinsn(struct arch_optimized_insn *optinsn)
> +{
> +       return optinsn->insn != NULL;
> +}
> +
> +/*
> + * In RISC-V ISA, jal has a quite limited jump range
> + * To achive adequate range, auipc+jalr is utilized
> + * It requires a replacement of two instructions
> + * thus next instruction should be examined

Please use the full columns available to you for comments.

> + */
> +int arch_check_optimized_kprobe(struct optimized_kprobe *op)
> +{
> +       struct kprobe *p;
> +
> +       p = get_kprobe(op->kp.addr + 4);

Where does this 4 come from?

> +       if (p && !kprobe_disabled(p))
> +               return -EEXIST;
> +
> +       return 0;
> +}
> +
> +/*
> + * In RISC-V ISA, auipc+jalr requires a free register
> + * Inspired by register renaming in OoO processor,
> + * we search backwards to find such a register that:
> + * not previously used as a source register &&
> + * is used as a destination register &&
> + * before any branch/jump instruction

Ditto re comment width.

> + */
> +static int
> +__arch_find_free_register(kprobe_opcode_t *addr, int use_orig,
> +                         kprobe_opcode_t orig)
> +{
> +       int i, rs1, rs2, rd;
> +       kprobe_opcode_t inst;
> +       int rs_mask = 0;
> +
> +       for (i = 0; i < FREE_SEARCH_DEPTH; i++) {
> +               if (i == 0 && use_orig)
> +                       inst = orig;
> +               else
> +                       inst = *(kprobe_opcode_t *) (addr + i);
> +               /*
> +                * Detailed handling:
> +                * jalr/branch/system: must have reached the end, no result
> +                * jal: if not chosen as result, must have reached the end
> +                * arithmetic/load/store: record their rs
> +                * jal/arithmetic/load: if proper rd found, return result
> +                * others (float point/vector): ignore
> +                */
> +               if (riscv_insn_is_branch(inst) || riscv_insn_is_jalr(inst)
> +                       || riscv_insn_is_system(inst)) {
> +                       return 0;
> +               }
> +               /* instructions that has rs1 */
> +               if (riscv_insn_is_arith_ri(inst) || riscv_insn_is_arith_rr(inst)
> +                       || riscv_insn_is_load(inst) || riscv_insn_is_store(inst)
> +                       || riscv_insn_is_amo(inst)) {
> +                       rs1 = (inst & 0xF8000) >> 15;
> +                       rs_mask |= 1 << rs1;
> +               }
> +               /* instructions that has rs2 */
> +               if (riscv_insn_is_arith_rr(inst) || riscv_insn_is_store(inst)
> +                       || riscv_insn_is_amo(inst)) {
> +                       rs2 = (inst & 0x1F00000) >> 20;
> +                       rs_mask |= 1 << rs2;
> +               }
> +               /* instructions that has rd */
> +               if (riscv_insn_is_lui(inst) || riscv_insn_is_jal(inst)
> +                       || riscv_insn_is_load(inst) || riscv_insn_is_arith_ri(inst)
> +                       || riscv_insn_is_arith_rr(inst) || riscv_insn_is_amo(inst)) {
> +                       rd = (inst & 0xF80) >> 7;
> +                       if (rd != 0 && (rs_mask & (1 << rd)) == 0)
> +                               return rd;
> +                       if (riscv_insn_is_jal(inst))
> +                               return 0;
> +               }
> +       }
> +       return 0;
> +}
> +
> +/*
> + * If two free registers can be found at the beginning of both
> + * the start and the end of replaced code, it can be optimized
> + * Also, in-function jumps need to be checked to make sure that
> + * there is no jump to the second instruction to be replaced
> + */
> +
> +#define branch_imm(opcode) \
> +       (((((opcode) >>  8) & 0xf) <<  1) | \
> +        ((((opcode) >> 25) & 0x3f) <<  5) | \
> +        ((((opcode) >>  7) & 0x1) << 11) | \
> +        ((((opcode) >> 31) & 0x1) << 12))

All the numbers in here are quite meaningless to me.
Could you please use defines here?

> +
> +#define branch_offset(opcode) \
> +       sign_extend32((branch_imm(opcode)), 12)
> +
> +#define jal_imm(opcode) \
> +       ((((opcode >> 21) & 0x3ff) << 1) | \
> +        (((opcode >> 20) & 0x1) << 11) | \
> +        (((opcode >> 31) & 0x1) << 20))
> +#define jal_offset(opcode) \
> +       sign_extend32(jal_imm(opcode), 20)
> +
> +static int can_optimize(unsigned long paddr, kprobe_opcode_t orig)
> +{
> +       unsigned long addr, size = 0, offset = 0, target;
> +       s32 imm;
> +       kprobe_opcode_t inst;
> +
> +       if (!kallsyms_lookup_size_offset(paddr, &size, &offset))
> +               return 0;
> +
> +       addr = paddr - offset;
> +
> +       /* if there are not enough space for our kprobe, skip */
> +       if (addr + size <= paddr + MAX_OPTIMIZED_LENGTH)
> +               return 0;
> +
> +       while (addr < paddr - offset + size) {
> +               /* Check from the start until the end */
> +
> +               inst = *(kprobe_opcode_t *)addr;
> +               /* branch and jal is capable of determing target before execution */
> +               if (riscv_insn_is_branch(inst)) {
> +                       imm = branch_offset(inst);
> +                       target = addr + imm;
> +                       if (target == paddr + RVI_INST_SIZE)
> +                               return 0;
> +               } else if (riscv_insn_is_jal(inst)) {
> +                       imm = jal_offset(inst);
> +                       target = addr + imm;
> +                       if (target == paddr + RVI_INST_SIZE)
> +                               return 0;
> +               }
> +               /* RVI is always 4 byte long */
> +               addr += 4;
> +       }
> +
> +       if (can_kprobe_direct_exec((kprobe_opcode_t *)(paddr + 4)) != INSN_GOOD_NO_SLOT)
> +               return 0;
> +
> +       /* only valid when we find two free registers */
> +       return __arch_find_free_register((kprobe_opcode_t *) paddr, 1, orig)
> +               && __arch_find_free_register((kprobe_opcode_t *) (paddr + JUMP_SIZE), 0, 0);
> +}
> +
> +/* Free optimized instruction slot */
> +static void
> +__arch_remove_optimized_kprobe(struct optimized_kprobe *op, int dirty)
> +{
> +       if (op->optinsn.insn) {
> +               free_optinsn_slot(op->optinsn.insn, dirty);
> +               op->optinsn.insn = NULL;
> +       }
> +}
> +
> +extern void kprobe_handler(struct pt_regs *regs);
> +
> +static void
> +optimized_callback(struct optimized_kprobe *op, struct pt_regs *regs)
> +{
> +       unsigned long flags;
> +       struct kprobe_ctlblk *kcb;
> +
> +       /* Save skipped registers */
> +       regs->epc = (unsigned long)op->kp.addr;
> +       regs->orig_a0 = ~0UL;
> +
> +       local_irq_save(flags);
> +       kcb = get_kprobe_ctlblk();
> +
> +       if (kprobe_running()) {
> +               kprobes_inc_nmissed_count(&op->kp);
> +       } else {
> +               __this_cpu_write(current_kprobe, &op->kp);
> +               kcb->kprobe_status = KPROBE_HIT_ACTIVE;
> +               opt_pre_handler(&op->kp, regs);
> +               __this_cpu_write(current_kprobe, NULL);
> +       }
> +
> +       local_irq_restore(flags);
> +}
> +
> +NOKPROBE_SYMBOL(optimized_callback)
> +static inline kprobe_opcode_t
> +__arch_patch_rd(kprobe_opcode_t inst, unsigned long val)
> +{
> +       inst &= 0xfffff07fUL;

It'd be nice if these were defines too, so that it was clear to
the untrained eye what's going on here.

> +       inst |= val << 7;
> +       return inst;
> +}
> +
> +static inline kprobe_opcode_t
> +__arch_patch_rs1(kprobe_opcode_t inst, unsigned long val)
> +{
> +       inst &= 0xfff07fffUL;
> +       inst |= val << 15;
> +       return inst;
> +}
> +
> +static inline kprobe_opcode_t __arch_patch_rs2(kprobe_opcode_t inst,
> +                                                  unsigned long val)
> +{
> +       inst &= 0xfe0fffffUL;
> +       inst |= val << 20;
> +       return inst;
> +}
> +
> +int
> +arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *orig)
> +{
> +       kprobe_opcode_t *code, *detour_slot, *detour_ret_addr;
> +       long rel_chk;
> +       unsigned long val;
> +
> +       /* not aligned address */
> +       #ifdef CONFIG_RISCV_ISA_C

Please use IS_ENABLED() here if you can.

> +       return -ERANGE;
> +       #endif
> +
> +       if (!can_optimize((unsigned long)orig->addr, orig->opcode))
> +               return -EILSEQ;
> +
> +       code = kzalloc(MAX_OPTINSN_SIZE, GFP_KERNEL);
> +       detour_slot = get_optinsn_slot();
> +
> +       if (!code || !detour_slot) {
> +               kfree(code);
> +               if (detour_slot)
> +                       free_optinsn_slot(detour_slot, 0);
> +               return -ENOMEM;
> +       }
> +
> +       /*
> +        * Verify if the address gap is within 4GB range, because this uses
> +        * a auipc+jalr pair.
> +        */
> +       rel_chk = (long)detour_slot - (long)orig->addr + 8;
> +       if (abs(rel_chk) > 0x7fffffff) {

GENMASK please.

> +               /*
> +                * Different from x86, we free code buf directly instead of
> +                * calling __arch_remove_optimized_kprobe() because
> +                * we have not fill any field in op.
> +                */
> +               kfree(code);
> +               free_optinsn_slot(detour_slot, 0);
> +               return -ERANGE;
> +       }
> +
> +       /* Copy arch-dep-instance from template. */
> +       memcpy(code, (unsigned long *)optprobe_template_entry,
> +                  TMPL_END_IDX * sizeof(kprobe_opcode_t));
> +
> +       /* Set probe information */
> +       val = (unsigned long)op;
> +       *(unsigned long *)(&code[TMPL_VAL_IDX]) = val;
> +
> +       /* Set probe function call */
> +       val = (unsigned long)optimized_callback;
> +       *(unsigned long *)(&code[TMPL_CALL_IDX]) = val;

What is the benefit of using val here? I think the comments
are also pointing out the obvious here, no?

> +
> +       /* Adjust epc register */

The comments here mainly just say what you're doing & not why
it should be done.

> +       val = __arch_find_free_register(orig->addr, 1, orig->opcode);
> +       /*
> +        * patch rs2 of optprobe_template_store_epc
> +        * after patch, optprobe_template_store_epc will be
> +        * REG_S free_register, PT_EPC(sp)
> +        */
> +       code[TMPL_STORE_EPC_IDX] =
> +               __arch_patch_rs2(code[TMPL_STORE_EPC_IDX], val);
> +
> +       /* Adjust return temp register */
> +       val =
> +               __arch_find_free_register(orig->addr +
> +                                         JUMP_SIZE / sizeof(kprobe_opcode_t), 0,
> +                                         0);
> +       /*
> +        * patch of optprobe_template_restore_end
> +        * patch:
> +        *   rd and imm of auipc
> +        *   rs1 and imm of jalr
> +        * after patch:
> +        *   auipc free_register, %hi(return_address)
> +        *   jalr x0, %lo(return_address)(free_register)
> +        *
> +        */
> +
> +       detour_ret_addr = &(detour_slot[optprobe_template_restore_end - optprobe_template_entry]);
> +
> +       make_call(detour_ret_addr, (orig->addr + JUMP_SIZE / sizeof(kprobe_opcode_t)),
> +                       (code + TMPL_RESTORE_END));
> +       code[TMPL_RESTORE_END] = __arch_patch_rd(code[TMPL_RESTORE_END], val);
> +       code[TMPL_RESTORE_END + 1] =
> +               __arch_patch_rs1(code[TMPL_RESTORE_END + 1], val);
> +       code[TMPL_RESTORE_END + 1] = __arch_patch_rd(code[TMPL_RESTORE_END + 1], 0);
> +
> +       /* Copy insn and have it executed during restore */
> +
> +       code[TMPL_RESTORE_ORIGN_INSN] = orig->opcode;
> +       code[TMPL_RESTORE_ORIGN_INSN + 1] =
> +               *(kprobe_opcode_t *) (orig->addr + 1);
> +
> +       if (patch_text_nosync(detour_slot, code, MAX_OPTINSN_SIZE)) {
> +               free_optinsn_slot(detour_slot, 0);
> +               kfree(code);
> +               return -EPERM;
> +       }
> +
> +       kfree(code);
> +       /* Set op->optinsn.insn means prepared. */
> +       op->optinsn.insn = detour_slot;
> +       return 0;
> +}
> +
> +void __kprobes arch_optimize_kprobes(struct list_head *oplist)
> +{
> +       struct optimized_kprobe *op, *tmp;
> +       kprobe_opcode_t val;
> +
> +       list_for_each_entry_safe(op, tmp, oplist, list) {
> +               kprobe_opcode_t insn[2];
> +
> +               WARN_ON(kprobe_disabled(&op->kp));
> +
> +               /*
> +                * Backup instructions which will be replaced
> +                * by jump address
> +                */
> +               memcpy(op->optinsn.copied_insn, op->kp.addr, JUMP_SIZE);
> +               op->optinsn.copied_insn[0] = op->kp.opcode;
> +
> +               make_call(op->kp.addr, op->optinsn.insn, insn);
> +
> +               // patch insn jalr to have rd as free register
> +               val = (op->optinsn.insn[2] & 0x1F00000) >> 20;

Again, could you use some defines to make this more understandable
to mere mortals like me? ;)

> +
> +               insn[0] = __arch_patch_rd(insn[0], val);
> +
> +               insn[1] = __arch_patch_rd(insn[1], val);
> +               insn[1] = __arch_patch_rs1(insn[1], val);
> +
> +               /*
> +                * Similar to __arch_disarm_kprobe, operations which
> +                * removing breakpoints must be wrapped by stop_machine
> +                * to avoid racing.
> +                */
> +               WARN_ON(patch_text_nosync(op->kp.addr, insn, JUMP_SIZE));
> +
> +               list_del_init(&op->list);
> +       }
> +}
> +
> +static int arch_disarm_kprobe_opt(void *vop)
> +{
> +       struct optimized_kprobe *op = (struct optimized_kprobe *)vop;
> +
> +       patch_text_nosync(op->kp.addr, op->optinsn.copied_insn, JUMP_SIZE);
> +       arch_arm_kprobe(&op->kp);
> +       return 0;
> +}
> +
> +void arch_unoptimize_kprobe(struct optimized_kprobe *op)
> +{
> +       arch_disarm_kprobe_opt((void *)op);
> +}
> +
> +/*
> + * Recover original instructions and breakpoints from relative jumps.
> + * Caller must call with locking kprobe_mutex.
> + */
> +void arch_unoptimize_kprobes(struct list_head *oplist,
> +                                struct list_head *done_list)
> +{
> +       struct optimized_kprobe *op, *tmp;
> +
> +       list_for_each_entry_safe(op, tmp, oplist, list) {
> +               arch_unoptimize_kprobe(op);
> +               list_move(&op->list, done_list);
> +       }
> +}
> +
> +int arch_within_optimized_kprobe(struct optimized_kprobe *op,
> +                                kprobe_opcode_t *addr)
> +{
> +       return (op->kp.addr <= addr &&
> +               op->kp.addr + (JUMP_SIZE / sizeof(kprobe_opcode_t)) > addr);
> +
> +}
> +
> +void arch_remove_optimized_kprobe(struct optimized_kprobe *op)
> +{
> +       __arch_remove_optimized_kprobe(op, 1);
> +}
> diff --git a/arch/riscv/kernel/probes/opt_trampoline.S b/arch/riscv/kernel/probes/opt_trampoline.S

Thanks,
Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
