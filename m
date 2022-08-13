Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE76C19F2D
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Aug 2022 17:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZwLQ6H1ww5aGQOLePlIBwgnOqvWnS5zw2r2wYf+bn8=; b=xj3oPBQC1bzpJv
	9aZeaeT89SkV6rvcp577JBK2RN8hCNVpi4e6LM6wb8xD1Qg5QXSfhW7dGzcsTaBC+5nX1UJvZGxlG
	4g837WCjRZMSPHwPhhr0oIaMvDB5BcMnoZG/5XVBQUwxz9SsQnu7vbSvENuUBy2Bv73m2t/zWtCt7
	rsYKYf3a7Z9JwgwTYAtkRxEsl4oeC49ZTsH5obb4cXfO0vMutypMD7uirWP3CqyyhzpQ3le+Qt7X2
	NcFGSmvoLb1HbCkQgswjlSn/P6fGDM7irAJelE7IuTQsxB4xJAEduhWdI0qHS0KUyhmDT0RvdkgJn
	TUHlmj1Nx1shp1Vl+dCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMuYN-00G1ph-Lz; Sat, 13 Aug 2022 17:04:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMuYK-00G1mr-9a
	for linux-riscv@lists.infradead.org; Sat, 13 Aug 2022 17:04:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660410240; x=1691946240;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=v/v5hhpqCTAJwW16hrMw41qZiMeTD6Objei1Wk683L4=;
  b=gTlfzXFyZxD2gjLbpjdu+vJbp3fEZwepL9DkPhENFR2trbbOAhbv7f08
   dQrSRt7W0A+a3r2ybLoIQ1JUX0FTu68kYZXR+6TBNcj3AYeJ26diYUbNO
   K0bX6MYzcjDBegbHu09OdQcy6by9NmtSR6RlowJGv/+1+82EcNjuC1/Y3
   WCM6hfP7nBElEOq0TOPhiMUFzUsvD7Z5JjOm/GVVEHILe3O7FkPKsQy6h
   8bYsV0SGySOTQFww3qsKi6iQ99TAIt7Fzk8VQ3UNDvQBC25XdxOk9RAeL
   yjJ6puXCtmLVj8ARS/4ShhB5cDxsAY8McEfX1Fc+IK1M8F5UaORw9L7WV
   w==;
X-IronPort-AV: E=Sophos;i="5.93,235,1654585200"; 
   d="scan'208";a="186350212"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Aug 2022 10:03:59 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Sat, 13 Aug 2022 10:03:58 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Sat, 13 Aug 2022 10:03:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwfhSLfU2zwI+sNpCPfxb6ktw1LxHcHaBePa8fhCoV8A9ELRtwn4e1TotoNwwcfWdCQM2cXoA35Fgf8ePlbIjUddfSWR/fwtDv/okbXC8d/AoaxXfbNhzQ4tcW5AUgMo3dzqwYIEzQk13gznJs3vOHyh9CPM/iHzqBoZ6Fji4ECFNmbMaR4cOjDmABTAOusm/6N1MI1RpSUQDa+V33iZugNwsMWnSMtwA0nYfvJlHfe99kRscc76yeZYIBZ/lIzheBsj/LEQv1Dt57Cl0NDKV0ofTj50P2UZ0qB29LV/LdssY5FoNQpDUYc3ZHyjDFPqudhBK3YQjP5uIecLLjIgWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/v5hhpqCTAJwW16hrMw41qZiMeTD6Objei1Wk683L4=;
 b=dtVboSWTPxZd6nLaDsSnzAn5ODj31TtUqKG1IIpM5aYSKmksVrIKpr6l/68FybXW3Kn5rbIM+gWc5rioQpw+mnvnkOezf6NlMcjxImiRN8cmAkYMU+gZAar7BnXRhWglgTUg8U3Yso+CXGdz1bZpOXg3vhkGT+ipklY9ATQjW0GrU78q2zDS8mvXBvz5epouXwZmVNGgK+KfTdWSyEsEfrIPZ9Ob4cxlvgYnkoOE29HYqESL51jL9SBydPeGuVzZh+pC2/BYHj2kv7rX+lNWDQ7nMkl3UscSYEdHxgZSGzhCW8+SGTTweZuZ9yQCgdVeopyZdKQKnwgOxrvqh2DcsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/v5hhpqCTAJwW16hrMw41qZiMeTD6Objei1Wk683L4=;
 b=P0UIkngZhAAGsiGctFf3/cMoT73oleYWMVgOOrA2t+r/eYUyugl3SwSgi0iMHrg+/OWnbKi6ZudiCvrlMsAVAoecMBT1jzrgxTSOGp5z8qreptR/sebBBCxgHWP9G9WAUZZMTljUyqmI8HvYhDl7kkPrYjp8BdQxHGVxh1Gu0I4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY4PR1101MB2086.namprd11.prod.outlook.com (2603:10b6:910:1c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Sat, 13 Aug
 2022 17:03:54 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Sat, 13 Aug 2022
 17:03:54 +0000
From: <Conor.Dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
Subject: Re: randconfig linker errors
Thread-Topic: randconfig linker errors
Thread-Index: AQHYrmfEuq3Hqx3KP0WjIRTBQgQgD62tEIWA
Date: Sat, 13 Aug 2022 17:03:54 +0000
Message-ID: <da09ec95-0e98-eb59-f34e-dd336a57f61c@microchip.com>
References: <47c9157f-9f2c-6e6b-19e0-e4c4707b1a2c@microchip.com>
In-Reply-To: <47c9157f-9f2c-6e6b-19e0-e4c4707b1a2c@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d52db3c-a2d6-4d51-6314-08da7d4dcd99
x-ms-traffictypediagnostic: CY4PR1101MB2086:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t9uzsrGESkCKEmhUXKeQoC+Blz8a5hp/HE70PFo7bTbVuxYmjOfBaiQV1L1fFB0hfho+sG3VL80amR0X1NCZYUHf22xNapEW/+q45xdG7Q85/lQmhSKTyWBDPuc2zxQt75m9I0cltuF2KbkNPxP9wJKR/EIiIgvSgfKVUKhNuYPGLUmfOGvWvhaWHUVvYt6xuOSKL1+NXUGMkTneQLIE7Om1kddRywpb9jps4Y05ILesLlp5zJd9zNW5LtctFBo4s/YZK5We2WSWzL8qf7Q3vE9sfy9LKi4mO1wPG1BnCQzWBOq/OJ39ukwUEv7VwkkyZxeGtYs42pATqDPBlJ3hazsuG/pTFFK2BZea4gLLKhvDOCU/bT+D52JB+DYOmU/KjxQSAT/9n9tPINX7K875t8QT72mcKp6Nz98YERVALt/hpKHYM6SfVRufsG51QHo4SDrZmqHVJZQMYnTtk97qrWQMIuyOu+2TT0BAv3bv7FHTucXEE8pnqY0ShxaQzXFm9hoZOGLAzIY3y+Em65bSfGk9WivAI2j3n6/BSkQhoLB7WvHu3Uw0LGlxMMg3pYBDbr0tkbfl6jbx5wfYJKcGHKxFDKAPKSBdgScTbgE3ZGN8m0qlcotGCcCKBxU1WPL3BFwwWethWXiYS6Wiw1zkfgCbOfbJeK/8YiXkUWKXgnTcUcrkhhczqLnzvZXE1qaxOy985HLdGQxHswhXKCa+NsiQUAEHT9PRRMQNZVsPxwYSakfTEze4WnEbSmNKX3snutRcePhFdjeJPL4kVH0Z8RQOzaxXNairsUgeMr9yycWHawYrKPKjZWcoI0Axn6bOXhkBcKeZcu3SOE7DZD3Tm2pJPgJiBpKmgYeZF0NTQ6QAW867p1FoWlmjo5pwniTzxszZu5HIZO0MqT4Gp+D7gg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(39860400002)(136003)(376002)(366004)(6916009)(7116003)(8676002)(966005)(6486002)(41300700001)(5660300002)(186003)(31686004)(36756003)(6506007)(2906002)(53546011)(26005)(6512007)(2616005)(38070700005)(86362001)(31696002)(8936002)(3480700007)(83380400001)(76116006)(66946007)(66556008)(91956017)(71200400001)(64756008)(66446008)(66476007)(478600001)(316002)(122000001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUlHOFdUM1l3WXBxWEFhQVFHY2czRzhuUWJua2RrRThOUWI2LzdQaUlNNmtY?=
 =?utf-8?B?cURKYVZzS01vSEdvV2QvV2FkSlBVK0xBQ0VHRjkyREszTk8rN2wwSm45VnNF?=
 =?utf-8?B?VmtvWlV3ZjBmclRkZlRYRkJqZW9OMG5UcGhjS2wzWDg2bjFVN1QwOHVOamgx?=
 =?utf-8?B?OXZLME9Ed0RmdWMvaFlETU5qZW9jbE9wbGxZSkdTMFpTc3dqYUt1NUFJUUtB?=
 =?utf-8?B?SzBNSVpVdjl2dFJEbUlRWDlIbTg2VFVYK3E1RDloVXNiR3AxaEZTc09xcHpI?=
 =?utf-8?B?SllYUVlrclZkaWxwN0dpWHl5c1FJT3ZRV1V6TWRYLzZGV2pNMzlhU2JTMGlE?=
 =?utf-8?B?Mkc4N1ltOG9oZWZQRzBMSXpEalFRSTVPb0VNK3p2R0hhK1IyQitNNEI0V2xn?=
 =?utf-8?B?c3Q3RHEwN2FnVHV1NllhZWczS3hWOGxkUjhGRE1FREQyemtmOCtmbkUrUzUy?=
 =?utf-8?B?L0FWK011WjhCS1NUM0RHbUtFUlZqcWg5RlNlY3RreEpZYUpvY3BJM2Q3b2tr?=
 =?utf-8?B?Vlg0SWkyUnQxaDlUdDdRNkkxWjF6WVJwSWhpb0VwQzJnN2FQbWRQVEdoZ0Yy?=
 =?utf-8?B?ZnFucDV6dTRIejAxRlYxa2ZoWHU3K1J1ekd6ZG9jYlVEMXpsOWtsNjExRGc0?=
 =?utf-8?B?L054UnVvdE5OMHVrYU1rb3FXTlZNV0hlWSt4eUxFVE5KTGRwSHVvYWZhRitK?=
 =?utf-8?B?cVljdW9oSkxwSHBadHZtQnVhWFU0MFRtQVVZS0VURDdtb2cvVEdFdEFUbG8x?=
 =?utf-8?B?aEllcG4xVGUyZ0dtMWdDc3dRUVNMdUhjZlNhUlhqSTJqMEVsVW5mN2FBV0dr?=
 =?utf-8?B?ZWt0VFc3RVVtREd2VmRVNUNnK1NNUnlEdFJKWXlRUnBlaTVhK1A3cUwvc2JI?=
 =?utf-8?B?ZG1ETnZTbGNKbjVnald1bklBUkFSWklmMm9YUllzS1NTNlRhekJsdDgzbDRk?=
 =?utf-8?B?cGlwM1QrQ0JwSUxZbXBTaHRVbkl0Nm1xL0lWSHlRelpyb0trNG12NzZtQ1Ir?=
 =?utf-8?B?MWZIdktjMFBLd0FLVE9vOHhIcmFjVkpvR05uNXNGVzRNVWE4S1BWTllBUXFr?=
 =?utf-8?B?NlZ5N0J0L0dhNHUvNkNkZCsyeUt1b2Q4YjVqOFpZU1BzeTJIN1E2eU1aRnhz?=
 =?utf-8?B?SEJ6dUFTcnp4UXVjNGd0a0l1dFJrYzRySU1JRGJvaEsrbjE5WitLczdlaCtl?=
 =?utf-8?B?QXAvUGtONnhKcUZjVW9iUy9xSGRrdlhDem9GWnFNdXFtYjF5SkxjS3NQdzVH?=
 =?utf-8?B?Tm5nOFoxdTFiNVdGYU0rY3dySUNub1M5VTJFU3JDZnI4Wk9LZHltYmltaEhB?=
 =?utf-8?B?UWFjUDhnNmNkSEE2VW1rejZDNlV5MFdydGh0UUVhV0trdWdxaDBIdUp5Ukk4?=
 =?utf-8?B?UFA5Z21pMkJ4cU5MME9RNjhPSnRadFV0YWFVWjFKR3RCL2dXSEtHekQwdldw?=
 =?utf-8?B?MGI2ZXl1cUx4dnpqQ09NcmVGcUhRS3dSRmhLQksvMExjMnVMMzc0Y0ZJV3Jt?=
 =?utf-8?B?WDFsTkI2bEJkNzA3REZEZXBWTFZjQWV5TEdWSFBKaFIvVFA4dzhTY2VkMERD?=
 =?utf-8?B?UTRiYjVXdnNPdDlmRDNDTDQrSGJ6TlJTd3l3T2J1enZac1VPaG9KN2lhNnBw?=
 =?utf-8?B?NERyZkNibWNVMXFmanNRVHVpZ2VvZHd2TFNwYm1XUDVxWktKaWp2VmNHazR3?=
 =?utf-8?B?OEs1QjdGL0dCY3VDQWVCQk9lNVpSRnJKS2ttYW9mTEZEWUlNUFZnRC9VSXFl?=
 =?utf-8?B?TDBCc2JDSmJJUGV1SkJCd29FVzJpdU51WFFzeVFEZEYwMW1uS1QycjJSaFJk?=
 =?utf-8?B?UFE2RHEzdE5JdnlCc3dMYllQT0h0bXl6RVNqNHBpQ3FSd20vSm1KUjVBbDNt?=
 =?utf-8?B?UkE0S1k0ejNPZityZDNyd2RLelFwNFZOQUJqNmZBRU81WVpXSTVoc2tqdXFK?=
 =?utf-8?B?MnZyVDlrejRUdXNodUQ0OURLQTNZVXQxL1BGUzdsODFNOWN5b25aQmdjM01K?=
 =?utf-8?B?aHFBVXoxTVZ2M3pvSjh1UE9EYnFZNytoK0kyUUs0TDlxTXFjN2k3bjFOTmIx?=
 =?utf-8?B?R0QvVXlRYmM2Q1JjOEx3TVZMUkx4TzVicVEyQzhZOHZacURFaUdabkgvRjBz?=
 =?utf-8?Q?KomUOcXfZDPccA3uMy3vRSSbf?=
Content-ID: <389D532C6398994AB9E413E16C906C1E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d52db3c-a2d6-4d51-6314-08da7d4dcd99
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2022 17:03:54.1057
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eqfblzrfzxoOc7Ky8O8vLAYNR4Z2v4a7JE4MXcbAy4y+9kvgUtB0UVN+tIp6mBVnGK53gOvXFCX1AUfrJnJ52VJvLbkJpnWLl/zCSmYxiDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220813_100400_413952_6BCBA60B 
X-CRM114-Status: GOOD (  12.63  )
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

On 12/08/2022 17:22, Conor Dooley wrote:
> Hey,
> Seem to have run into some randconfig failures, which seem to be
> replicable as far back as at least v5.19, on riscv/for-next as of
> 5cef38dd03f3 ("dt-bindings: gpio: sifive: add gpio-line-names").
> 
> The base config is one I downloaded while looking at the LKP
> reported zicbom problem & I just pressed enter on all config
> prompts after that..
> 
> Linker errors are kinda beyond me, so throwing it up here :)

Will be fixed by: 
https://lore.kernel.org/all/20220807220934.5689-1-rdunlap@infradead.org/

> Configs are attached.
> 
> With GCC (riscv-gnu-toolchain 2022.03.09)
>   GEN     .version
>   CHK     include/generated/compile.h
>   LD      vmlinux.o
>   MODPOST vmlinux.symvers
>   MODINFO modules.builtin.modinfo
>   GEN     modules.builtin
>   CC      .vmlinux.export.o
>   LD      .tmp_vmlinux.kallsyms1
> riscv64-unknown-linux-gnu-ld: arch/riscv/kernel/compat_syscall_table.o:(.rodata+0x6f8): undefined reference to `compat_sys_fadvise64_64'
> make[2]: *** [/stuff/linux/Makefile:1165: vmlinux] Error 1
> make[2]: Leaving directory '/stuff/brsdk/work/linux'
> make[1]: *** [Makefile:219: __sub-make] Error 2
> make[1]: Leaving directory '/stuff/linux'
> make: *** [Makefile:153: random-config] Error 2
> 
> With clang/llvm 15:
> HOSTLD  scripts/mod/modpost
>   CC      kernel/bounds.s
>   CALL    /stuff/linux/scripts/atomic/check-atomics.sh
>   UPD     include/generated/timeconst.h
>   UPD     include/generated/bounds.h
>   CC      arch/riscv/kernel/asm-offsets.s
>   UPD     include/generated/asm-offsets.h
>   CALL    /stuff/linux/scripts/checksyscalls.sh
>   LDS     arch/riscv/kernel/vdso/vdso.lds
>   AS      arch/riscv/kernel/vdso/rt_sigreturn.o
>   CC      arch/riscv/kernel/vdso/vgettimeofday.o
>   AS      arch/riscv/kernel/vdso/getcpu.o
>   AS      arch/riscv/kernel/vdso/flush_icache.o
>   AS      arch/riscv/kernel/vdso/note.o
>   VDSOLD  arch/riscv/kernel/vdso/vdso.so.dbg
> ld.lld: error: section .dynamic file range overlaps with .text
>>>> .dynamic range is [0x760, 0x88F]
>>>> .text range is [0x800, 0x12B9]
> 
> ld.lld: error: section .text file range overlaps with _ftrace_annotated_branch
>>>> .text range is [0x800, 0x12B9]
>>>> _ftrace_annotated_branch range is [0x890, 0xBEF]
> 
> ld.lld: error: section .dynamic virtual address range overlaps with .text
>>>> .dynamic range is [0x760, 0x88F]
>>>> .text range is [0x800, 0x12B9]
> 
> ld.lld: error: section .text virtual address range overlaps with _ftrace_annotated_branch
>>>> .text range is [0x800, 0x12B9]
>>>> _ftrace_annotated_branch range is [0x890, 0xBEF]
> 
> ld.lld: error: section .dynamic load address range overlaps with .text
>>>> .dynamic range is [0x760, 0x88F]
>>>> .text range is [0x800, 0x12B9]
> 
> ld.lld: error: section .text load address range overlaps with _ftrace_annotated_branch
>>>> .text range is [0x800, 0x12B9]
>>>> _ftrace_annotated_branch range is [0x890, 0xBEF]
>   VDSOSYM include/generated/vdso-offsets.h
> llvm-nm: error: arch/riscv/kernel/vdso/vdso.so.dbg: No such file or directory
>   LDS     arch/riscv/kernel/compat_vdso/compat_vdso.lds
>   VDSOAS arch/riscv/kernel/compat_vdso/rt_sigreturn.o
>   VDSOAS arch/riscv/kernel/compat_vdso/getcpu.o
>   VDSOAS arch/riscv/kernel/compat_vdso/flush_icache.o
>   VDSOAS arch/riscv/kernel/compat_vdso/note.o
>   VDSOLD  arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg
>   VDSOSYM include/generated/compat_vdso-offsets.h
>   CC      init/main.o
>   CHK     include/generated/compile.h
>   CC      init/do_mounts.o
>   CC      init/do_mounts_initrd.o
>   CC      init/initramfs.o
>   CC      init/calibrate.o
>   HOSTCC  usr/gen_init_cpio
>   CC      init/init_task.o
>   CC      arch/riscv/mm/init.o
>   UPD     include/generated/compile.h
>   CC      arch/riscv/mm/extable.o
>   CC      arch/riscv/net/bpf_jit_core.o
>   CC      certs/system_keyring.o
>   AR      arch/riscv/kernel/probes/built-in.a
>   CC      kernel/sched/core.o
>   VDSOLD  arch/riscv/kernel/vdso/vdso.so.dbg
> ld.lld: error: section .dynamic file range overlaps with .text
>>>> .dynamic range is [0x760, 0x88F]
>>>> .text range is [0x800, 0x12B9]
> 
> ld.lld: error: section .text file range overlaps with _ftrace_annotated_branch
>>>> .text range is [0x800, 0x12B9]
>>>> _ftrace_annotated_branch range is [0x890, 0xBEF]
> 
> ld.lld: error: section .dynamic virtual address range overlaps with .text
>>>> .dynamic range is [0x760, 0x88F]
>>>> .text range is [0x800, 0x12B9]
> 
> ld.lld: error: section .text virtual address range overlaps with _ftrace_annotated_branch
>>>> .text range is [0x800, 0x12B9]
>>>> _ftrace_annotated_branch range is [0x890, 0xBEF]
> 
> ld.lld: error: section .dynamic load address range overlaps with .text
>>>> .dynamic range is [0x760, 0x88F]
>>>> .text range is [0x800, 0x12B9]
> 
> ld.lld: error: section .text load address range overlaps with _ftrace_annotated_branch
>>>> .text range is [0x800, 0x12B9]
>>>> _ftrace_annotated_branch range is [0x890, 0xBEF]
>   OBJCOPY arch/riscv/kernel/vdso/vdso.so
>   GEN     usr/initramfs_data.cpio
> llvm-objcopy: error: 'arch/riscv/kernel/vdso/vdso.so.dbg': No such file or directory
> make[5]: *** [/stuff/linux/arch/riscv/kernel/vdso/Makefile:53: arch/riscv/kernel/vdso/vdso.so] Error 1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
