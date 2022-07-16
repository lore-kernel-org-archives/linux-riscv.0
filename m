Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589F1C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jul 2022 18:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KgRtn3jZ4Czw3FIBlynAtB90aVE7odbtNoPTbtfgFbQ=; b=BPTKwjSM613PPe
	Vm+cmc4uaiJwrswLq5WKUEMXut3fZym0gnfPWy1cTeDSXpQ9vbARKKU2d9vUWbkMy+7Y25w3K7wzR
	HNJ6+xHcgKkLh5tnoyaiwlPDBBYHhoMBmBQAxEeZP9E7jy3lqBhA1Zg4VfLlKM9HkWe3DMFC28+1v
	srjuVypoCmST7V3f0lNC93ZdQ85P9rhqKLazpwUgU0cRvutjB4Lp3QY4xwGje9IMeNWZOcnhsgfF9
	sdezI0SuvubYvlPQLZQo39bVrGXQAQZkh23nB9/qH+BqZrsuHztv4MUUEHNW97rZLEBn5hzNV4ijz
	+SU8PZK2DOtwO2rdYPLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCmag-00Hb6m-Ii; Sat, 16 Jul 2022 18:32:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCmad-00Hb4v-7o
	for linux-riscv@lists.infradead.org; Sat, 16 Jul 2022 18:32:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657996351; x=1689532351;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=DBdE/T4jEDXibmfNe9B1Cbvda1zSNYbG+eftQST1O5s=;
  b=oIwF+fefbkX25zF9kmcOm6mV4pNpS/BpPf48bKyRf8/0TpVsdxgbvy6q
   lRsu49CjrlVGdG/2A/NZ6DKBxQBI/xUiFMqsrSBTDXNWImcZgMlg6s6aD
   rGm1Dz1HPjSYilif+K70ptlZftTu+ztYzjI1HqrmWD+tjjcHVxq31spTU
   quR8vwoRYlo2SJLwtT95+LbOUVQEBsd6vEO0eQScuVi3qIQ6FJVK7E1Kd
   EZCaAQETJk02fXW90C+ktmYuzrEUlEGizIRwxOO0U1pNhFz5IMsIqzXyx
   B8Ry/kOPm24Ncx/ui6/e01LyDvp+cKJdOMPut//JQGUuqiOIsrCeo8njX
   g==;
X-IronPort-AV: E=Sophos;i="5.92,277,1650956400"; 
   d="scan'208";a="172418989"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Jul 2022 11:32:26 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sat, 16 Jul 2022 11:32:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Sat, 16 Jul 2022 11:32:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZ++VIWAVklED7RDzEkrUjx7wzMz99nb5xq982cxvv7PUxBsypORgozpS7mcKbWnKWxGIRkBxWxXYKwFBOHbsnmPiAV3eNvZz6hsywmVQR6B6ABhL1OKwwGAPHlQZ2C1H1w2bCtpP5RYq7k5+Q+47N+lIcZW9E4vMBJDL8NpeKYP6Pxqbupylxh5w6pqPTya7PKqHw1l4l6uWrE1p5VsC3+yqJTDyyc37ZNEP3TsVNFWYDXCVQc6sy+ZO4OyM4q+Wvd8qkYo2WnJWk7mED8peCSdWQ2uCa873IK9IamgytkME6swlO7R723oq+PO7ch2iq+XHlCetDvcLnbKnK/pVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBdE/T4jEDXibmfNe9B1Cbvda1zSNYbG+eftQST1O5s=;
 b=E3mKSkSlNWSaN9NliY0we6gF/m2VxMirXC8mO5YT9pjhG5pV95gTMxxMSkcoevLZrhrUlmB24JQV4gUxww9tvHksbCzKI9HfYQe7GN0DodbsqPm7RprWKB+jT1JodSHgaYhcDlV3LQ7r9ckU0U2zmfKBG6tZpkG8YUmpo/k66u7Ne2c/2Yw9CWLr4w1cVq8oLmhXZOv1itPGtWLJEnuARrOwLK+FMSlFcwlh1AOiAey4Moip50CxTMN2+0YlJxktDQw0EyfffzINh0zhtKxWKlttvtPg5+aybYvIgPC0MNVm5ySrCsCRotSjho9113PRU1fFj2vkztEsXU9c6MlqEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBdE/T4jEDXibmfNe9B1Cbvda1zSNYbG+eftQST1O5s=;
 b=B37EO4NVFNlsSpchu/qoubw1hK1AHpNTni6EoBKpaNaJy57xgM3XL5MvJj4nIOwBXrOJsI6dBbhTS5UCB4af1yC07zi0Y/z3J2dZ7+yDAujFl2cn7lMUZxorKiQcRlevElZ2ADh1Qrv17cnW0CXDWAYBwmaIrBGus7kOkFQV/wQ=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY4PR11MB2039.namprd11.prod.outlook.com (2603:10b6:903:22::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Sat, 16 Jul
 2022 18:32:20 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b%7]) with mapi id 15.20.5438.021; Sat, 16 Jul 2022
 18:32:20 +0000
From: <Conor.Dooley@microchip.com>
To: <maz@kernel.org>, <Lewis.Hanly@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <Conor.Dooley@microchip.com>,
	<brgl@bgdev.pl>, <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
	<palmer@dabbelt.com>, <linux-kernel@vger.kernel.org>,
	<Daire.McNamara@microchip.com>
Subject: Re: [PATCH v3 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Topic: [PATCH v3 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Index: AQHYmONENpwHvjgotEKXOSINBvKPca2AzRoAgABQpwCAACn4gIAAC0QA
Date: Sat, 16 Jul 2022 18:32:20 +0000
Message-ID: <a50d0f6e-0b35-4090-2ba6-9de680d23aa2@microchip.com>
References: <20220716071113.1646887-1-lewis.hanly@microchip.com>
 <20220716071113.1646887-2-lewis.hanly@microchip.com>
 <87r12l4aaj.wl-maz@kernel.org>
 <2d7f72d3e89686d3ba5cff5df8cfe443d04fc5f4.camel@microchip.com>
 <87o7xp3pz2.wl-maz@kernel.org>
In-Reply-To: <87o7xp3pz2.wl-maz@kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5bee46d8-2c75-44f5-b7b5-08da675984fa
x-ms-traffictypediagnostic: CY4PR11MB2039:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9i8DsdVrMxX5+FbyqggcjUg4J9yoMtLYpvXTYXsMZ/Sm4AgMWt3J62GbHKIj6ftbVGscuqd2GVKfcI2CoiBgoYF+sk1R3aCxoAXEMwviGkw7ZI+7rf3iS6OjFgJ4Txp+iIk1nVdU61A59iKay7265CpOezSW5HmyAf1JYC/JfrtxS/1TyiNjUDcxDjQZYtQE8BAPOx0NBDUcjMw2xQm9LXgPGmLOSdvUMD/grrO/7v47kJ09DvrQJOqk/F3rqsAVqjYhBjoK0OHPEq1NRBa0YchWVvdE93WAhqEc5BKz3FZa7VasyTYJdUuc7/eRzWd9vPYbZdhyp2h93PBSqM8A/cUYLBMbbwjx0oKb5ozHNvBDfKW95Z3qSDotED58/zvajv3oSqf57YZ9HpEWtxHhufny1XQHvAQP8fwJkI+cOC4Fm7ZKC1JJwDhBX0phbnmh9StJzuiAYl6xhXi4AYKXrpQv16wevLfemUO3f21qUzWBVGiBeJ2JghS/N0i+2RIGWymAB1ikb3Wx3sB7dhJiJ/Dpm+uu1BRmiEku2g9mUpjVbkCRpRlTap4e9wtppIlSE6wkTN9HVGIybQrUmMKK2BM8OHQYiqYV58JC+sDFguLzYQfYrQZxaJJDhPo5wDIxBEe7HVLzT7Tsi8bUUHpK6ESlJd4FOBy0TM/fRoL9PCo0swcBn8f1bwTgKzjhoFTYgWhCMpM1jhidvMZhkYQf96Cy+UJ5uF4ZmnXlhaYkVvAlkGxODK//9/awBZorwQZHpCJUT2sGm4xqMc8S+Dm/5rEtuhJnfZC3VEd5pyQUlsAhovNMbGmzVN4c/IugL/5EVU84QzGxs0Ash7uBkQIHlMVDQFD82Vy9fHp2btGwq9LvAijNi7/JCwcXUXxnk0vw
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(366004)(39850400004)(136003)(396003)(6512007)(8936002)(31696002)(6506007)(5660300002)(36756003)(26005)(66476007)(2906002)(64756008)(66556008)(53546011)(4326008)(8676002)(91956017)(38100700002)(66946007)(122000001)(38070700005)(478600001)(76116006)(86362001)(6636002)(31686004)(71200400001)(54906003)(110136005)(316002)(41300700001)(66446008)(6486002)(83380400001)(2616005)(107886003)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHJqalBFMWVTVXFjcExNY1VWZTFqVnBmOWR2N1ErdkNVWHdwZHdkS0tlSlVh?=
 =?utf-8?B?M0t2MzdzbEtqemhJUFplc0VWNk9ZVkhBUlUzY1V6VzJPZXRzV0ZKQmk3OGo1?=
 =?utf-8?B?MkJpbHN0Wi9lTVU2cmZFSWo4NE9WcEw1Vjl2bnNoVTNKcVlzOVBRV3dLNlhx?=
 =?utf-8?B?TDRVdlVFOVh1cmRONUluMDc2RDVMMDhvdXVyTzdFd3R1dGVKekN3Y3RIZ1A1?=
 =?utf-8?B?bVd3V3I5cENCWW56eG9NVmVJWThkaXkweHZ5aTkrMUZUWWI1SWhGRGIxUGRH?=
 =?utf-8?B?bU9tUFNtNjd2K2hSWU9QeGh4UE5NaVd2dWZSaERPNkJpVUg2Sk5zbnZBKytn?=
 =?utf-8?B?SS9zT2RGU3BTU2dRaGNKVUEvK05oTmVxYmVGMWhWb2JwSmtqSWZsT2tuR3Fh?=
 =?utf-8?B?VktHUzFkUVdCOUhCUFpNNDluRUg2SmdxM2lFamsxalJyV0RzSDBKME5JWE10?=
 =?utf-8?B?NjFOQWRDaVdwbHpHMkkzRklSMkg2ODJTRFFYTlZjeE1mWTNGeEYzL0tkYzJV?=
 =?utf-8?B?Q3ZOanRXMG5KamcvU1AyNnJuRzhwUDViaFcwQmhNUjBOb3FkTzRua05jcy93?=
 =?utf-8?B?YVlwZ0NvSHp1YU9ldlRCMm9qMlUxNSt6OUR3Y1NpdVVSR2xGblRCNXROYWx2?=
 =?utf-8?B?Yy9KSmZadXJtZ1AvTi9LT2prMDc4eDdyM2ZIV09GQ3c5MjNuYWVIU0FNUEZZ?=
 =?utf-8?B?ZXl3WGRPVTVGcGh5STRFL0Qwc3VvVFlBVHRRTEx2VmxORXZsWUdocC9sK0pN?=
 =?utf-8?B?aVpsOGhZaEdBS1Z3RGtkQXZnSGVtMWJzbmF1dVZQNzV0ZFpaOGlLMVlPNjE4?=
 =?utf-8?B?TEdCSUJkVlFBcmlyOHhOR1RyWHlML1ZFbGNBeXY1bkN3bUhRcWFuSElZRExB?=
 =?utf-8?B?RHFzc3pNS2YveWpUb0tCcjQyMnlKbFcyTDVqTlF0TjlYd2V5TFZsY0VGaVlr?=
 =?utf-8?B?anpBY1BMbFVnMDE2akI0TlZLbGxYSFhqZnFKU0FNSkR0aVNrT0MxRmpWRStU?=
 =?utf-8?B?NGdGSEJwY01FQ0UxK2RySWJ6eG5IaVk3TFlVcHp2cFRNY2RreFpFM1k4UHlt?=
 =?utf-8?B?aVA4K3VMbmFHSU0vdGhvSERTMEg5b01jcENVUUlFMnJXcWNFRXFRMk5ickox?=
 =?utf-8?B?ZC96MDdnNmJIbHkrUUEwVmd0Q2RZUFFrSVpwVkhJbjJ5bGdWVzZ2bHVadVRp?=
 =?utf-8?B?aUNDNUsxd3grRTgrQVJseGxrNmI2QkZVdnRqOGRDZVl5YlovdWRqaitISW9n?=
 =?utf-8?B?MExhaDY3MjdjYmRTbEdqd2FJcTJZMWNHZzU4UFc1Um1PaStFbHRyNmVmM1A3?=
 =?utf-8?B?TWV4dFRBdE1yeHFFTzBRTWp5U3owNzBOdVdOMjJ0U01NMEI4SU9YdGpFM2Jl?=
 =?utf-8?B?MEZHQVEzOVVaOVkxVzA2dzIvWlY0WUJlY1NBbXlxa2NReWJYVlIwbVliWWY1?=
 =?utf-8?B?aXgzK3FubjlGTWE2RjdFaEhVQmVCbmRUbWFlenNqSG04WE8yZEZHbFB4S0dH?=
 =?utf-8?B?SjVBUGNSeFQvQWFCNWlFU09lcnE1QVJNUW1MTlUwQ3NKYkZETDhMNlY5d3Ez?=
 =?utf-8?B?c28raExFdmt3eUhrd0FOMFIvajl6TnRLUVFzSDVSY3AyMkw4V1FZVFBYcHk0?=
 =?utf-8?B?RGNTczJkRWwyZGs1anFFdjVhSldQY0ZoMXRzbEoza3BvVFBNb1NJTGp0cEVX?=
 =?utf-8?B?VTk0K1d3d2dMUTFvQmZjeURJaFhmQk9ja2xha3Y3ZnBqVUkvZnJ0eXo4SXRl?=
 =?utf-8?B?UEpBWmZnVTJ4Nm5OYXdJRjFSYmxJWXE4K2FaZml3VFcrZlBEN3lXM0RON0M2?=
 =?utf-8?B?cThaM2REelpJOERKTHZyeTRVMDFlbUZlZVREeHdvMDlVUjF2WXI5bTlHSjMy?=
 =?utf-8?B?WHN3THVGVnRROERYbkV3T2JzbU5iVkYwMzhDbzZsYUdMbGZtMlJtdE5IQmhX?=
 =?utf-8?B?S3VDYkIyWUF3OFFHSzg2SVZHYyt5L1craFVhazdoaldPejAvOTN0RDYwdlY2?=
 =?utf-8?B?WGFqMDN3cGxuUXM1ejcrRGlqOHd0eDlOdWZSckdIY2piNzh2TU44ZWZWNStP?=
 =?utf-8?B?d3Exb0NDV1lxdmo2R3ltVkFpcmFJc0dPMmpiMHRYajZPOGZDNll4U09HT0hJ?=
 =?utf-8?Q?uEpztIoFN33nX3xbklnGisyDz?=
Content-ID: <0367F0EF16CA304BB166F1264AEB3C45@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bee46d8-2c75-44f5-b7b5-08da675984fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2022 18:32:20.6651
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xrHTI+gPadzCd6DcI9MbIAjXusu+ji8f9p663JMyK++D6UMDN1UCNzDB7vQi04OcugeOTNWk7sjpyRCj5ulXF2oj+oX1Qq8itrQdqbZ+mH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB2039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_113231_609469_7823222D 
X-CRM114-Status: GOOD (  16.60  )
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

On 16/07/2022 18:52, Marc Zyngier wrote:
> On Sat, 16 Jul 2022 16:21:48 +0100,
> <Lewis.Hanly@microchip.com> wrote:
>>
>> Thanks Marc,
>>
>> On Sat, 2022-07-16 at 11:33 +0100, Marc Zyngier wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you
>>> know the content is safe
>>>
>>> On Sat, 16 Jul 2022 08:11:13 +0100,
>>> <lewis.hanly@microchip.com> wrote:
>>>> From: Lewis Hanly <lewis.hanly@microchip.com>
>>>>
>>>> Add a driver to support the Polarfire SoC gpio controller.
>>>>
>>>> Signed-off-by: Lewis Hanly <lewis.hanly@microchip.com>
>>>
>>> [...]
>>>
>>>> +static int mpfs_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
>>>> +                                        unsigned int child,
>>>> +                                        unsigned int child_type,
>>>> +                                        unsigned int *parent,
>>>> +                                        unsigned int *parent_type)
>>>> +{
>>>> +     struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
>>>> +     struct irq_data *d = irq_get_irq_data(mpfs_gpio-
>>>>> irq_number[child]);
>>>
>>> This looks totally wrong. It means that you have already instantiated
>>> part of the hierarchy, and it is likely that you will get multiple
>>> hierarchy sharing some levels, which isn't intended.
>>
>> Some background why I use the above.
>> We need to support both direct and non-direct IRQ connections to the
>> PLIC. 
>> In direct mode the GPIO IRQ's are connected directly to the PLIC and
>> certainly no need for the above. GPIO's can also be configured in non-
>> direct, which means they use a shared IRQ, hence the above.
> 
> That's unfortunately not acceptable. You need to distinguish which one
> is which, and separate them. Your non-direct mode certainly requires
> special handling, and is not fit for a hierarchical mode.

Unfortunately, the configuration is not fixed on the silicon level. The
SoC has 3 GPIOs (with 32 lines each). The interrupt configuration looks
something like the below:
GPIO#             width    IRQ#
==================================
gpio0/2           14       [26:13]
gpio1/2           24       [50:27]
gpio0_non_direct  1         51
gpio1_non_direct  1         52
gpio2_non_direct  1         53

Depending on what the bootloader/firmware does, these can be configured
differently (done prior to linux starting). By default, 14 GPIOs from
GPIO0 are fed into their own interrupt lines & ditto for 24 from GPIO1.
The remaining GPIO0 & GPIO1 lines go into the corresponding non-direct
interrupt. If they bootloader/firmware configures something different,
a "direct" interrupt line can be switched to a GPIO2 line instead.

Something like the following (the interrupts are offset by 13 here, as
the global interrupts feed into the PLIC at an offset):

* global int  GPIO_INTERRUPT_FAB_CR
                0               1
    0       GPIO0 bit 0     GPIO2 bit 0
    1       GPIO0 bit 1     GPIO2 bit 1
    .
    .
    12      GPIO0 bit 12    GPIO2 bit 12
    13      GPIO0 bit 13    GPIO2 bit 13
    14      GPIO1 bit 0     GPIO2 bit 14
    15      GPIO1 bit 1     GPIO2 bit 15
    .
    .
    .
    30      GPIO1 bit 16    GPIO2 bit 30
    31      GPIO1 bit 17    GPIO2 bit 31
    32          GPIO1 bit 18
    33          GPIO1 bit 19
    34          GPIO1 bit 20
    35          GPIO1 bit 21
    36          GPIO1 bit 22
    37          GPIO1 bit 23
    38  Or of all GPIO0 interrupts who do not have a direct connection enabled
    39  Or of all GPIO1 interrupts who do not have a direct connection enabled
    40  Or of all GPIO2 interrupts who do not have a direct connection enabled

Since we can tell based on the interrupt number in the device tree
whether a line is in direct mode - can you suggest what the most 
appropriate irq structure for the driver?

Although for extending this driver to the "soft" IP core, it may be easier
to just create a "microchip,gpio-direct-mode-mask" property or similar and
use that to figure out what configuration a line is in.

Thanks,
Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
