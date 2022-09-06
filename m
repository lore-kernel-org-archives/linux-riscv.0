Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397B1C38145
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 06:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sv/zZqgdVzhJoiBhpuUOcPDzOgEloHubUVFVqrGN2tE=; b=tFhwWumB89lde3
	EsA3XzUqZP7z+ts+A8RbgtodB+AhQlxY+N/JJcKKdUV04nRJ8u3e2HhMTfCNyDFV+aF/YmylZT+Zn
	xjxBj6JKN5P8xVH+NqTBYckNWRQzjS+6CUOrg+cvqm84pGx+58mV69b+3yqJrpGLY3ZRR+jxCkzn7
	PhvgaIAZUlcd4XCem4P5tvdWaVXKxK8b4bMjRRPmPY187TEAVeoawweCjDk6rTiZdDWNG9/NTD8HP
	9GndMMAdU9tlv5H2jSbHSv1RdZpDMciA4GKqBq0dqBpjmA8/SL9cQ4yfJb8foo/HVkp2QMVElCVaW
	GinDpvYLSgEE/pgzYFRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVSKa-00AWUj-MY; Tue, 06 Sep 2022 06:45:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVSKW-00AWRW-9l
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 06:45:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662446704; x=1693982704;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=emPm42/hs2kQKkNailqR+Nqi5ZEYPcvAvXshTUWIy+E=;
  b=Uqn1LQkQVfnoO47W33TRKWkmT7DOjZVi9xad2dd3cy+V37TcdWYphTky
   3Y0lwX4hGnG88etIQAejVhR8PZKEVqnEkjhRgzqVBFZ6Qp+0Ehz1cwIe1
   98OZlWh/9tkwKw23Pz7F+nZt2VtRyaDKeF9ij3WyydSGAProOo8gJPHiZ
   7LJ2FmDE3LsJyagn2G9we2uIp4oeQgvHcgSIFYlRdoZFgvplOydj22YOS
   Q3hYHiyN91bVj2HUloaOZTFQDr9mb5gXw4fmGbNGGmttx53A6VkH9BHZX
   dRN2HQSQa2EIvycfdRfOYN0zJH01nWzDppAgQnV8LXRb1ksDIsnuZ1Y3L
   g==;
X-IronPort-AV: E=Sophos;i="5.93,293,1654585200"; 
   d="scan'208";a="189553796"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Sep 2022 23:44:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 5 Sep 2022 23:44:58 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 5 Sep 2022 23:44:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ngyjOidYMB18V1YaT2J312WtA0d4QqvW5a4yJUCO6+qQWPHlclUY9ub29A2D8EcZBIXlztS9MVy1qbH6FqXkrYi/eeQzq8Cm86OsRZ2j6v+vBv6yCSeeZ/nWboY3IMD77a7HxU2Owx1JXRvF5BmuQ7N1m5Ilmbw6BJ++vLXuu+CdC0MkTWgh2U7SUREhyQky2srUD35uaK+zLgJ2PjJjt1TviqTddt45sRxqZ8Sj0qf/EDuyJ+E/ge6HmuJqXOHcFqn3g0L7dh/N33DwFufPr8psruwuQd2jDOOgRC0ppmqVQoQOxu/DFyCbKWlxcJCo8JM7Bw0utEP5czKBD0e0wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emPm42/hs2kQKkNailqR+Nqi5ZEYPcvAvXshTUWIy+E=;
 b=n63T27wyIZflUeX1MTKoz1HbBb1jZPUf2JxSuae9ChmaQe5V+9kEPPgoYYC3heqIyToZ5aTaGK3SJax1HTzQq53bsc7nrrQonWo1daiSytBLmvejBLQEsWq4ct4aLT+sOzczb/0bgXPeXppj+bRgUcHCCPHaeGNfQoePUATMhB8bJXcuV7jWbswFLcaBtuc8BjeM3xk+DjYqhz2NlzQMZAoLJuYP4tR1W08NFpZgNcRCshyocJm81pNApd9zKML44iwzf8y+U5jI/43zCLOpCnxIPQ4wbRMYzqXu7BMy75+s9QiJXgDLcYHp3fVRoDwKf7nGWtMVV8oLSmOMDZReog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emPm42/hs2kQKkNailqR+Nqi5ZEYPcvAvXshTUWIy+E=;
 b=CK3pa64jKqTymc+iI92Quk1hjfIyVk6XyocqGPVXBazeawzaCrR0df+ib+TZ9wyz3Rjo/R3FtRbyLGqlPHrSCf3R01BcpmlKMrQOEkW7pqBqs0JnsW9VG2R2W/Ef47uF5ui87Z/Kjoll24Kyxl//w5fDvFoh0prWSF+zNu91Xfs=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by PH8PR11MB6830.namprd11.prod.outlook.com (2603:10b6:510:22e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 6 Sep
 2022 06:44:53 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 06:44:53 +0000
From: <Conor.Dooley@microchip.com>
To: <ajones@ventanamicro.com>, <linux-riscv@lists.infradead.org>,
	<palmer@rivosinc.com>, <heiko@sntech.de>
CC: <anup@brainfault.org>, <atishp@atishpatra.org>, <nathan@kernel.org>,
	<jrtc27@jrtc27.com>, <lkp@intel.com>
Subject: Re: [PATCH] RISC-V: Clean up the Zicbom block size probing
Thread-Topic: [PATCH] RISC-V: Clean up the Zicbom block size probing
Thread-Index: AQHYwbm7PdCg7Qi43Eq1f0jf76itqq3R8wkAgAABxIA=
Date: Tue, 6 Sep 2022 06:44:53 +0000
Message-ID: <d68a5ee4-f008-5dd2-1a25-ea172656b3b0@microchip.com>
References: <20220906062657.924852-1-ajones@ventanamicro.com>
 <20220906063816.wyivlqenrh3ipdlg@kamzik>
In-Reply-To: <20220906063816.wyivlqenrh3ipdlg@kamzik>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa7fb426-8be0-4427-9249-08da8fd34dd3
x-ms-traffictypediagnostic: PH8PR11MB6830:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t/18ofAuNy66cKhQ73ZVyESHMkNnHZ1fmqup+Maq09nqqKeR5IMU5p5jBvpPmbvTp5ygwaoyKaLE6FQZ2o/INzAS39cB1FGTFJKKW2880vsgVssNqY/ixVOLkyKZ9VO69DXfctKGzRIFEzw996wOXGt7dRthPmLnwrekRDoCHhk2N0fXV+feQ7f0ian86sww2QuqQfv8xJw2zUUxeSBAq/5Hcp9ChEaUNRTmUqvKDOEtq4iuREwgSwcs4qgrTNlon97BOv/h51l4wvCfiCyKhxQBITHGw77Q3IgJMHifb1LKi3jFl9hPBk3Zb5d3HIvMCDZ+Ij+xT+5wiwr5cDt+23NKwgSRUKfvGRfFMfoZl5uUwZnWy+5Il201gy2wtk7YNN/S+oFjeUDhf2SlVVH0aExotzeaYx4FSr8HRSaQMQjOdZe89ArlxukxLoiYmhzERrIRLfT3npKVWpctiUY+DzsBQ6LkzenZnXHoaO3T1roh6JInyz7nmd4z3Eymw+JIH6gyfhPowLX/2Ocl18tCRQra3rHTUlZcQjyaLvK9IXZdeSTwyy05sINSZXFjKImTG+FeQ5+yxRkQSIb2Mq5eYOtd26wSGmF6cjR9rWa/DrL6mlVfeB9IpqremCpAMo4yi1PPDo432KzVcyRUEZej7CXMA5duWVjEXLAptTxs0EYYuV8fEG5zSPOwFA4vtiar6I8ZbVw7xt42hSHXwhjFsn4D9SbewQfbQ56sPr32VN5Uy5TXW0wMrQaGd6FGOYlnYdhbc9O5uzvJsIbHjXnwS+wUhPqdCwkBKFGwHqkn75JHYOhxNozAyFcv2NIDNqcgThs4FH12DJgHXfz6h9XFmA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(376002)(366004)(396003)(346002)(66476007)(91956017)(110136005)(122000001)(6486002)(38100700002)(8676002)(66446008)(71200400001)(41300700001)(31686004)(8936002)(4744005)(316002)(478600001)(64756008)(4326008)(5660300002)(76116006)(66946007)(36756003)(2906002)(54906003)(66556008)(186003)(86362001)(6512007)(53546011)(31696002)(38070700005)(2616005)(26005)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WkhXTUNlam1GdFdDbTdpWExZdHkrdVpuNEFRaW5TbDN4bFh4Qnpmb2ZKdWtG?=
 =?utf-8?B?YlFlS2xXOU9nbzZqWXN0SlVkb2NOSjFkb1FkNm5jRzlQdnhlNUJMRWRJbmJD?=
 =?utf-8?B?TWhtbkh5MkdkbXZiTlowUUVBUkJSc3pqTGQwZUtCMTUyNzRKRWhFakJnajhM?=
 =?utf-8?B?dVMxWVZ4U09CaXJBYTl0VlZtSVg1Z2VqTWZvVTI1aDN1VGJwUExidEJaeGw1?=
 =?utf-8?B?Um51VlZLcmFuYlIrNnFUY1ArRkErM0tmblVVRmpBeno4dTlSYzMvZU13OHFa?=
 =?utf-8?B?MExzTkdLVURxNlVrcjNqQndxMGx5N0lsbnpRSHVQaHJkQndsSVVaY0JrSDlI?=
 =?utf-8?B?R2pteVZLaHA0aEJoamFVMVhHYlhNWEJjZnlaUkp5VWlSdXhPWWpHaDZxcXFw?=
 =?utf-8?B?NFhWRnE5Y09uUlJhTDBIYTFSWnZjMW5kcDNBM2tDM1lydy8wYmlCbDlrdFc2?=
 =?utf-8?B?VlpBOFdCVHQ5eEtnQTgwQVlpMUx0RDAxQit6OHRiNHFYYW0zNkpvd2hYU3F6?=
 =?utf-8?B?U2Q4VXVab2t1TE1kMW9sYUtENWZDdGhZQzg3OTZiTDVaK1VCOWx3T3FHOGtM?=
 =?utf-8?B?VVJkalJKK05UOE5YZGgvOUY5MjBOODkrcDA3TWxMTnFrMXpMQ1NuMzNldklF?=
 =?utf-8?B?bVl4ZVd3SGVxbDEyczlVcUZqdkVBUVJkVXpPM1lOZVhYVlIwUGZhb1BJT1Fy?=
 =?utf-8?B?UkdHRGx4WXZsYjJUdE1BY04vNWhsczVtSDVmSEhTcGY3aVlRMHVxMkR4Z2dk?=
 =?utf-8?B?cHd4SGJDNDFLcWJuc1V5T3hrTDJmOTJvRTJGekcxcm93M296NjdoY1dPRWl4?=
 =?utf-8?B?UUl4MkdFc204YTlQeU5jdktOaFlJKzlCcWVWNDFMY29iUVZXd3pJYWJmcUVt?=
 =?utf-8?B?dmlpY0phM0JZdk9SUGhSQ2J5OUJmT3hYaisyRmRsWlpvS0RVTzQyT1V4bmN6?=
 =?utf-8?B?SjdLVkZTUnZsZGN2YUNoank3NkUrdFd5aHB3NVExQ2pJaysxOHN6UnRZbmFv?=
 =?utf-8?B?Q2o3M2V0d1ppajV5c0hmL25BWVFiSXhnRmVwbDhFMU9LWEZ0TjlFbjhVOGxP?=
 =?utf-8?B?YTg5ZDUzT3dnZ2JncnhFSUFkd0xmWWlQSGo0UjZ5THp4dlh5Rm1sKzRGYzVU?=
 =?utf-8?B?dG01OEVqeDV2aWVnNFVYMlMvSUs2TkhPdTZLdHVsTTlFMkJiS1lsUFlVS1FP?=
 =?utf-8?B?OHo5bHdWTzd6YVF4NWNkbEhRT08rdE5ORCsrM2ZSQXZqcktFYWtuTHBna00y?=
 =?utf-8?B?OVhzVU5nd1dzRHp0L0MyNlRnZVJVVmJNY2Z6UFVmNTFVdWM5ZTcvQ0tYWkhk?=
 =?utf-8?B?am14bysxazhLTGc3YXhQZDFtQjY0MEZpUXFnTWhYTHorU0dXKytSRTBKaFJ0?=
 =?utf-8?B?cHVSWTJnUDAvOUdFYytGMm8rSXdJcG1Dc21RTnd2ZnExQmFtNVh2and5Si9o?=
 =?utf-8?B?M1B4VFlwOVR2aS8rRFlJeTVQWll4ZkwwbWpEZWlXVGd6NTJoY3RORERiV25k?=
 =?utf-8?B?dGRjblNiM0lNa2lIaU51ZXc3TDBqU2psTmtwUlNXMzBLNFdSblhIaS82djVY?=
 =?utf-8?B?WDRzdXhZTk1FbS8zbnp2a25Oa0ZrazBPR1VCVGFTTmlSWk1vd2x1NGtJSFlC?=
 =?utf-8?B?OXcyZU1BNWR5OVNDSnVSSkxVTzVxT0pNVW5LQUo2eWgyZHVINm9ZUWJIbmdt?=
 =?utf-8?B?N0Q2SUxDQ1hHMmJrRm1IRGtGcWd4c2NuaVMycCtOZWtneUlNL1liS0V6UlI2?=
 =?utf-8?B?YjBQc0RZdkhyTFhHNHVGcEZMODRvdmVWTDFtckVkZjJaZEwybWVURURZb0ZS?=
 =?utf-8?B?cUovdUZYYW56eGRyK1NXempkMTRpRFEvYW15cUVkbFRRTXEzSnNqU1h2V2N4?=
 =?utf-8?B?TldPbU16aDJDYkhKbnBFTUROWlM5c3RWdzRYNEpTeHIrVFJZRmN1enBpMnVN?=
 =?utf-8?B?QjZjU0pURTVsWllnSkZuS0hNQVFYZWN6VlBqVHVIRUtNUjQzcFFucTNvVFBS?=
 =?utf-8?B?WXRjRVVKcWZrdVlHYVFaZWUvL29DSkdtRDcvQnJBdTQ5bEZuOWFDWll6bzlF?=
 =?utf-8?B?bWMxdnJBT2VBbnNhTWlxTmY1RS9iZjRpZU1jcmhBL3Bwck1mWWYxcTh2eWt1?=
 =?utf-8?Q?WGLhZD9SfzAFDa865vXau5Y73?=
Content-ID: <D832C38F69CA53488291D978EA886AA3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa7fb426-8be0-4427-9249-08da8fd34dd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 06:44:53.2304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vjpd1HBDpJmzylGF40Yx31VcCCSIBqApvo1C/djsadZUsiH195yQyX5IVb61SL6Q/GDtUP4LJhP8EJKjKApNYZX3A3kCWUrGMAilDOEGG0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6830
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_234504_553229_9D6E19F3 
X-CRM114-Status: UNSURE (   8.33  )
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

On 06/09/2022 07:38, Andrew Jones wrote:
> 
> Darn, of course this doesn't compile independently of Anup's move change.
> I should have done the move first as Heiko suggested.
> 
> I'll try again by posting both Anup's move change and this patch
> rebased on Anup's.

Should prob mark the patches as v3 when you do

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
