Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962DEC00140
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Aug 2022 17:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dwQUOmLKep62z8/5Aq/adEGSjG1aX6R50Wk0JmWUaVs=; b=1Ndt6taiaftrd5
	KG78H9s6Q9JUm7umjmI4H3PEk5JUppiFDO+ZSTC0W3cT1RfzTI7sEZM0IZBVVf91sYhPDiyuBdEQB
	uJIlzy16k2/QLQdSMrIogJNeWf34bXAwGuas4WQz0JZ2gnva7cUthmVzWbSKofGEbs2IUkP6wv42/
	hU7on0jw0DJMmZXh54rCigHR6R7Vr6Mtm/gmubp/9dSGXK761hfb0WpPiEP7iMmcMFrnECi3wUOzr
	IhoxUskKrcwBjdfIIPthMsXMIQNLDFHKXoAq0dYbzXgFnVTdlG6nFK09LQYLxs1X/3PTFuRN6pOjs
	5id8WPOD9rB1vOXd67Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK1XU-00HF84-L9; Fri, 05 Aug 2022 17:55:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK1XS-00HF6B-3a
	for linux-riscv@lists.infradead.org; Fri, 05 Aug 2022 17:55:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1659722109; x=1691258109;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=MzuU92UJa5nub8eP4lCEvrdiFdBVL7Yy6IepG5sNMko=;
  b=dIhklOAvd0nOtUGon1eYWj+DMewiUbtrJKbGHYxM87CXdXlEnRSvD3Ep
   qTHe1RUx0TbYTpr9tzSsVngfWeFXpRmOhheq2yyUO/zAEA/IcPKSipgL2
   ZCN3lFMG4xK1B0KDiFztkK9NU5i5cGdfnfvM3FthuYjU/ouleL6GtPT/U
   QP1LIs9cs2SedhagSnjPlYcTvvSxAG2aH9vkYqwIE191AaOczw6hdquJe
   mJ2R9KheLg92UIBAYgCE1MA5hVdIxfyuqCAoJ2g08ITLaosy7h77hftM9
   7L2qCjxXNp0W2LGpuQ3r0R8k35gGBMLfqUZYuxgKpc0ng6mfTNIK2LojS
   A==;
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="171185926"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Aug 2022 10:55:06 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 5 Aug 2022 10:54:59 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 5 Aug 2022 10:54:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AoRjQfCw4i7lnmk7xdkw2HKXj4tMh8a/Rc5Sc9dx4VyEAXlllyH6iVdNJFi6Yv0Fi9QJZQh5X+BJRoKsdKp+uzN356tNnRZ9xO6dd/JnpSPMYkWZdGVi5HhLSXMmO9FGBwiAckv1uLt5r+XSbuOdYXBTJK7bPN+Jwv82CjIJXdEDiZotj9WqVTjBN0/ypxi19c1VhG07+1agYxULS5XA5D3eC2rgxI0V5KH7NVSZF8q5KxBhj+Nb6+VIAaLuRngR28Man5payqsRTmetgeOs3mLXuCZQwI7eVfcG3TBpws2Te4t4laHK5RtGpmPnh3kQI/5cl0PGiBS9foDS3ACtUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzuU92UJa5nub8eP4lCEvrdiFdBVL7Yy6IepG5sNMko=;
 b=hupu7VAR2P71vQRn1N9UDaK+I0lptlheRIkCiSQUA9RS5cLVTM4vqb3koDVIpOexrf0X0k3O4L4fp2fng0hJ/xyBAEp/27eDdjnchX/LI0N/yd24XFDr+mNqrZ+T4lHtbeUQk5Q3NVcJmSmkKEk2xANhce5wi1TJAx5H45v1c+QZeZsb7OGUP1CxEBKKJ9eokVfAnbFguHDwPvVgT91R8FOlFCSrPmqJN+iqesHDU72QdSpkx/IqG8GimmsYh/PAUVUFfLp6bWHnxnYR7BHkazh6rK3m5d7BlwbZ7+LgJxN4f2X7hWV37D3UEnwe5ngHi3DSvIPBz3nfPB4Abip7Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzuU92UJa5nub8eP4lCEvrdiFdBVL7Yy6IepG5sNMko=;
 b=ph6NpJrMmYj8Q2Kngrws+KJTp/LZ2k8pOnd+E/o+Hvy8FbmeDTxW6TkeC6AlkIWsZLK8FXSmGHXcKHDO9NmbnKIKYeYkkcOdqlcPNbYpY/90vumuXgu0t2FWeR/QSGCHoSmAkkEPjZ9+yrvKCL0M4R8T6tv5oEnxZ5Jiwnd2hLs=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM6PR11MB4721.namprd11.prod.outlook.com (2603:10b6:5:2a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 5 Aug
 2022 17:54:54 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 17:54:54 +0000
From: <Conor.Dooley@microchip.com>
To: <robh@kernel.org>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: DT schema warnings on Risc-V virt machine
Thread-Topic: DT schema warnings on Risc-V virt machine
Thread-Index: AQHYp1uUaUBjfKD6EUeU1KJXpPDQJa2daT4AgAMw+IA=
Date: Fri, 5 Aug 2022 17:54:54 +0000
Message-ID: <6de5ee22-9fc4-208e-b26f-d09754a27a81@microchip.com>
References: <20220803170552.GA2250266-robh@kernel.org>
 <673492ba-caad-bbaa-4952-0ad1dac6eda5@conchuod.ie>
In-Reply-To: <673492ba-caad-bbaa-4952-0ad1dac6eda5@conchuod.ie>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f2059e3-55fc-43ea-2fa4-08da770b9a44
x-ms-traffictypediagnostic: DM6PR11MB4721:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OX99Fu/cmQJPybFM59Vvwo7W67eY+EZWtus3674sgMcfBSgIbJfzNnbvtmanzotW1hZOsdaPyH7MbtWaZin+iJDlU1Hsn648M0r+1Lud9StC16E43GdIzaUrP/PaoTRbmEVvOECkKvgCmOR0SDhzob4yF1lRAXODvZmjB/sJ2AMpWM6vdktJhxuHb+NsPhKB2o5pVG9Z1TkPd8tnMkxxBkYyL6ge3NfkrUgkJaNzrobllfPoGeQLk4m8loK12JB9reWb+6JVe2cb/K7dWs1XTBHdLGlrLIDN9VPCRsanON2USKynfAhNl9yd1mcZGgNkJzM/SDbjY8hW9G26MxqXRVgbjD9K66ssGzHblUfZm5JmudH+2bnvWaL9NXaXUg2cqYZ6FvQijyGmJsLGZQxdQOu37c2jVSSOlaRuZb/XVFCILB9xIfF1MLcOGpfTX793b1L1bnZpT2E+Q490ayzVwtA+mtcG92+2yWcovKym/YPtpydvdkQT/Yf1ZgjwRBbWj9kRj/v5xGMrLrS+aYfdCirI2jArfdt9fz4fF/EXN0JQqgoiCYipKTwIqxW0FzwA9cLdLhi5jyhClGrTGnVWbaJ2C8Hv2duhrQuAW4i93QLvJm3Zi/ClSm+yjencyREQAeabZCKPS5CmR5CQN+bYtwxjSYxH5cmcp1zzOvuxwZGUnE+PkJklzTH/MLDW7HYc5cqVQpx9dj/vfUpTpfibXBF62Xfdkzz3F0MdyBjUhxhxVFqsBEihoNEdPMW0YOI9s1DOW3PjNfh2OWwaaw63NWIuITIA+7hjTRsdjmr6yQc/mJLEQ0maCTwSZnYIVVTAFz+K0qm6MEx8YSwto2S/5zLv17Rqfp1a+E+CGAFdfcprVa15VBAR0K5z0UVKsvMwHOw1oe94BmYsf2vpNYij/+cE0K/N4+uWT5jOS9ua1KJMvG1toqxj/mxVOLhaZDJZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(39860400002)(366004)(396003)(376002)(5660300002)(31686004)(2906002)(66556008)(91956017)(316002)(64756008)(66476007)(76116006)(66946007)(66446008)(8676002)(36756003)(110136005)(8936002)(6486002)(478600001)(71200400001)(966005)(38070700005)(53546011)(6512007)(41300700001)(86362001)(31696002)(6506007)(26005)(186003)(38100700002)(122000001)(2616005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUpFdXluV2VBTUQ2QXlOdkxPMWJUbGx0Q3RodWprVUxhbm9JcUpEWUNZV3Fl?=
 =?utf-8?B?MGZjUVUvN0JybUIweXJzNWNoN3BzeWVoMFp4cFZldTR4L0x4MWNCMVNWVFpj?=
 =?utf-8?B?ckd6dmRCNjlZbjVtelpYOUxsNzZSSmJtRG9PdmdmSzRDVkNGaWtKYVlKNzJi?=
 =?utf-8?B?WERUZ2dlbCs3QXRWelVxNG5ONjBUbjFtczgxanIzRXp6bDZJd0FkL1NrK20w?=
 =?utf-8?B?Q2VGVzQ5NXhOdFBMaDkvYUdGcXJ3cHpQUGI5Y3JMUHNWaDdPdnJDV1FYc2NS?=
 =?utf-8?B?YllzMzJmdlJ3d3dNcWg4UUFlR1Y3TnBtZVV0bXlQOUpzM0tBcnNCd3ZTMWxs?=
 =?utf-8?B?aUVEZ0ZSVmVXTXVwOHppWmsxNlEvdEJRMXlVSDdEUWJybWh4TDI1S2tBUU1t?=
 =?utf-8?B?MzkyUkJ1d0lrSWd2Y1ZVaVY5YlFYTVgycGRQeiszTEZWc1RuMHpsUG10Z3VH?=
 =?utf-8?B?dnAwK0hQZjQzdkFzSmJNa3h0V2I0VEFoY2dHZzlYZ1Q0V25UcGJacytUZ3NC?=
 =?utf-8?B?VDFHeC9WSUpjMXkrZXYvUHBHeW9md1NzeVVVOHVKZG1lRmJqQVJxMkRQSk1q?=
 =?utf-8?B?bVNRRTN3Nzh1RTUwaXZSTGM4cFRDaGFBMURzT3l5SUZPcm01aG9oUTFGdXAr?=
 =?utf-8?B?TnlTbFpBZWptMlROMXNLQ3lzMCt6L1BUOVpTc2lhaUc3OHVHYmpUNkNrSi9Q?=
 =?utf-8?B?Y05nUjVWd0Z4Y3dlNDN1bWFTSWROZFRBdllXK3VjU0hGdGNmbWRXalZ2QXBw?=
 =?utf-8?B?OWZEZXVaYmJXRFBMQVZlYW5pdmw2Tnk2Q2ZSQlFoTGU2Qm9JY0FVQUxTT2pZ?=
 =?utf-8?B?RWJYQmhBQTlxajl6M1JjQk5BTWRSeXlCV24wSm16MjJudXpydGlDcjBVeHhS?=
 =?utf-8?B?azNhSU51Q1JUdDFzRVFKemF2L2JTYVVsVkhKaGR1S2FIUlZYaVltUEd4am5s?=
 =?utf-8?B?YkUrZ21ZWW5WM20xM0VHNUdtWXlXZG5CV2dua2VXSlg3T2pWN3B2eFFGdU8y?=
 =?utf-8?B?RjZGVGZ5K1JsMDVuZGtNSTNENG5NQUYxOWN1ZzNPcjBDazJ6d0xDWTVHTUVO?=
 =?utf-8?B?MUFWeWl0YlpkRnNseExHWW8ybjYrUkRHZmhtY3dJMjRlQTJ6c0pUR2pYNSt1?=
 =?utf-8?B?Z3hpZlRZeUpDM0hEbUtOZnQwWWVJSXZBdGRmdjhPSUdrTVBwZXFKS3RTK2V0?=
 =?utf-8?B?QUF1dHg1QVpsSnlIelYxNHVRZytDWnlQQ3p1TGRwYUNFVVI3eFRoTnF0WHRP?=
 =?utf-8?B?R0Z4WmpGSHExU0tUWGFzbDNUUDFHakNyemJmS3lPdVVId0x0QlYvcGV5am9V?=
 =?utf-8?B?M2N1WVZXUFRzeU5sRHdINFVyaEhIVXRpOGxpR3JBZXNMdEZBelJtTS9Fc0xG?=
 =?utf-8?B?NWFJbkJrclNPd1BYcXpTN0FIV1BVRC9EZ1VHYmVHUzhPU0d6WjExbmJBUlZM?=
 =?utf-8?B?UVcxcWVwdjE3VUtpQzd4Tk9jeTZRdDk5MWxBZnF4TDc3STdlOFZIOXdDMXk1?=
 =?utf-8?B?SE5ObkdKVk13S3dQQjlESGFKVUNlaU1iUGE5U3NrRGcxUHJBdWlIVFlTTDh4?=
 =?utf-8?B?S3hHQTFhcUl0OVlJYnI1bjdoMWNQWlhrb21KZUt1K1F2WkI1ZVlBaS8weEVv?=
 =?utf-8?B?K3hZM1NJcTJzOUtadnJxbk1KajBQeEwxa2VxeWlmcndPMzd3MFRCL21yY0Iv?=
 =?utf-8?B?R0JVOEkvOVNLK2VKZ2tyT3Q5M0VYc2hxTjZ0UTQvb08xV1pYdG5Gc25SQVox?=
 =?utf-8?B?cVplcVo0VXI1ZXNoOFpKZktZcEVTZVFHL3JCZHNTbTJBOUd3Vi9zTHgvTDZz?=
 =?utf-8?B?TUJSRmpZY0M2bk1tVjE1YVNTSENOcWtVVzBzTzdrdU5qODNhdXVJeE5SdU9o?=
 =?utf-8?B?cVZLcmJNZEQ5NlJ5MDhVQTFxNnVHdm5GbTlSZzhYTWVHOXdLTktQdnlzdGdI?=
 =?utf-8?B?K0Zma1c5aGY0d0oyekg4YitYaU1pWE5USGpVMjg3MWYyeGpVTFBjV3kvRW5V?=
 =?utf-8?B?Zmh2c0E5c3VEYzNIOUV4OXhJNVROdW1aeDBKMVl2eHJMZC8wQjdyb0YyK0wx?=
 =?utf-8?B?YTJONlF6b3lRODVodms2RmdDbTdwRGM0MTVjVDRKVVo2a3V6eDcrb0dMd3g4?=
 =?utf-8?B?UDFjcDAwd2FCZTN5Znk1YjZGUFVEaGZLSXZkTnBKdXBaYUc1SjBvamN4Mlc1?=
 =?utf-8?B?K3c9PQ==?=
Content-ID: <BBF47FAF01544247ABC05874F0DDD076@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f2059e3-55fc-43ea-2fa4-08da770b9a44
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2022 17:54:54.2695
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: biGaUd8ds9W6EGQncoOBjp7XCU/L1ym50g8nNSIEU9pCiAOUXMONA2AscVQprs+gvGU0QdbyDNF1IpsMaVrWUNYah8bpEakm0IkT/S5/SeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_105510_267959_E67B12EB 
X-CRM114-Status: GOOD (  14.79  )
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

On 03/08/2022 18:10, Conor Dooley wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 03/08/2022 18:05, Rob Herring wrote:
>> Hey folks,
>>
>> FYI, I ran DT validation on the Risc-V 'virt' machine and these are the
>> warnings:
> 
> /sigh
> There was I thinking I was almost done with dt warnings!
> I guess I'll take a look Rob, thanks for the report.

FWIW, patches sent for QEMU:
https://lore.kernel.org/linux-riscv/20220805155405.1504081-1-mail@conchuod.ie/T/#t

and kernel:
https://lore.kernel.org/linux-riscv/20220805162844.1554247-1-mail@conchuod.ie/T/#t

Conor.


> Conor.
> 
>>
>> /home/rob/riscv-virt.dtb: cpu@0: riscv,isa:0: 'rv64imafdcsuh' is not one of ['rv64imac', 'rv64imafdc']
>>         From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/riscv/cpus.yaml
>> /home/rob/riscv-virt.dtb: soc: poweroff: {'value': [[21845]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-poweroff']} should not be valid under {'type': 'object'}
>>         From schema: /home/rob/proj/git/dt-schema/dtschema/schemas/simple-bus.yaml
>> /home/rob/riscv-virt.dtb: soc: reboot: {'value': [[30583]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-reboot']} should not be valid under {'type': 'object'}
>>         From schema: /home/rob/proj/git/dt-schema/dtschema/schemas/simple-bus.yaml
>> /home/rob/riscv-virt.dtb: uart@10000000: $nodename:0: 'uart@10000000' does not match '^serial(@.*)?$'
>>         From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/serial/8250.yaml
>> /home/rob/riscv-virt.dtb: plic@c000000: compatible: 'oneOf' conditional failed, one must be fixed:
>>         'sifive,plic-1.0.0' is not one of ['sifive,fu540-c000-plic', 'starfive,jh7100-plic', 'canaan,k210-plic']
>>         'sifive,plic-1.0.0' is not one of ['allwinner,sun20i-d1-plic']
>>         'sifive,plic-1.0.0' was expected
>>         'thead,c900-plic' was expected
>>         From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
>> /home/rob/riscv-virt.dtb: plic@c000000: '#address-cells' is a required property
>>         From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
>> /home/rob/riscv-virt.dtb: clint@2000000: compatible:0: 'sifive,clint0' is not one of ['sifive,fu540-c000-clint', 'starfive,jh7100-clint', 'canaan,k210-clint']
>>         From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>> /home/rob/riscv-virt.dtb: clint@2000000: compatible:1: 'sifive,clint0' was expected
>>         From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>>
>>
>> Also from the 'spike' machine:
>>
>> /home/rob/riscv-spike.dtb: cpu@0: riscv,isa:0: 'rv64imafdcsuh' is not one of ['rv64imac', 'rv64imafdc']
>>         From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/riscv/cpus.yaml
>> /home/rob/riscv-spike.dtb: clint@2000000: compatible:0: 'sifive,clint0' is not one of ['sifive,fu540-c000-clint', 'starfive,jh7100-clint', 'canaan,k210-clint']
>>         From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>> /home/rob/riscv-spike.dtb: clint@2000000: compatible:1: 'sifive,clint0' was expected
>>         From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>>
>>
>> There could also be other warnings from non-default configurations.
>>
>> To reproduce, dump the dtb and run:
>>
>> dt-validate -p Documentation/devicetree/bindings/processed-schema.json riscv-spike.dtb
>>
>> (processed-schema.json is from kernel validation run)
>>
>> Rob
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
