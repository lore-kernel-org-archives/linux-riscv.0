Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E62C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 11:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s0iJK3HNef9qgTpEPIn2zgaNUJTOQCAS6MqzG758JyA=; b=h5nR6B4MLbt0vS
	11IyDtKt80jAQovKBBoci5xbb5YslDd9nXidylxOa6EPf35YKNpI7D40jIpMbHlb6bnLJ7Ne5vqbR
	Af2Ylk7icQbeH5z/7Bt3GCfTASibHL8PcLW4HZVF44x66NtGqMJ360xv9ICsxEI3zA05+HncQBWhE
	LhYO6wRJcmwpemcJ6rftrrDzGqe4nXpljyNUe6qoR8Rq0T267YDfPH/OsqhBp9Sm+9NUpbIT3LPaV
	EK33V+spkPTL0MalqnHn1Rqb0IsK0zRSvMYpncnSUx6KocV8G8h0ZByR3t9z0wHtLBIiJA3nnjbUk
	D0xnMoBtjpgjLAVjtN6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5mkY-000RI4-Hr; Mon, 27 Jun 2022 11:17:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5mkV-000RH6-LU
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 11:17:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656328668; x=1687864668;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=08Nj5VXaLPwFgPUWUVRdRAsWD/HK6zHKQzzSjMS+vw4=;
  b=ES0+FS4HiENTdETh9zDHHTbH2ClgAuofL66qE2xkj5AOQ56WEtMntaUV
   kx3fR5M0Vye39mYvpgU/YcSSO/JaN2QpimR93v/qrTLjqZWmv/yqyF3KY
   Me6zSUczHx2JJxCj7WBBGCZgqg3dzwCPmv+AzioY/fGyH7zjPmMllhuWc
   xHhF/ssCqP7LPoIqqCpdaq+5z9uvmCyBn32+tOE2+GiQhrB+Vv5ekDCui
   /dK4akrq/dlAnkAQ8Z07BSskBJC9Dbm2UBTkHvv8zr63L4EzwbmwB1uLW
   NV+Wn9AHCv+yZbe+aXiXp5914RWwtypAC3E4F6OD2Olk6Kf8Io/VKggrg
   w==;
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; 
   d="scan'208";a="162185528"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jun 2022 04:17:47 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 27 Jun 2022 04:17:44 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 27 Jun 2022 04:17:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXGGdurY3hNO8p5Y1F5S1z10q/vKyXdLrrFkPfPqPyR5XeDYxXtnpghcxt51i87m+olrYxaIKBvOLp477ty7VFcPs+NSkTO6BPdiB+TG/WFG+M5CD1CqCr99/yNHCdK0Y8/UZy2l9FRN6Z11n28R6OTJkfQ4lGC7VtHxmF/xRBzTIMXQL1W0VwcN6ziEOVIZABrOoUMKdiZZK6CilYR5VkZ7QM0axdumSHzOhNMmba6q94WFP8GRmlKgpBQdSiXn0seouqZ/aU18vDsSe+EaxX+fxJBtWxAQbZZr3q+lw0yitbLaHi7ctcDZYdYt7CLlXt54vEhb40UGqH5WRou7cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08Nj5VXaLPwFgPUWUVRdRAsWD/HK6zHKQzzSjMS+vw4=;
 b=fZE0lxQdJQvkmWTzCWYB2Ike46YG9viHZQV70i4UdbzjojZRAeD4mkTZmHfiMHkoA0nxlarnE47tNJU7wGTPxYy8PDjOnbaY4+7V/ljqx0DLaLvO0jg8u1SRje1bWwtwKR7hxfv0hQyf6euA3tMibAgbPP9QzyL/1yRG/hAI++sYwFuwG+0umENOA+v6wylrKFVhkJ0tKjYxlKI2QKzMODgQgM4PTTG1yBB50c3GAjbudxfanvMnsp/+zHupnVIP88uP1+ta2j2S7JEm16oHVOAjjx1w0RoXAbR4LV3BXC+PuE46DLZRvuEPCu8vQvtYx9k0HKxpiHRMSxvJqEhrxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08Nj5VXaLPwFgPUWUVRdRAsWD/HK6zHKQzzSjMS+vw4=;
 b=OVciAV/loyxxtiOntWPoZmxJrD8P/SCUq37x3oxfyrU7w0HmGpdyJNczsqYySSdfc7Oj8THDGBm0VGPDyUK8kurijh+GzXvpUXkmxAsbUi1PuaNISFm502wf02Hfxf4lGpDop0O/lEFFUFzutfG1Bt+ZZH/EVf/VI3piIaxRO60=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SJ0PR11MB5917.namprd11.prod.outlook.com (2603:10b6:a03:42b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Mon, 27 Jun
 2022 11:17:39 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 11:17:39 +0000
From: <Conor.Dooley@microchip.com>
To: <mkl@pengutronix.de>
CC: <netdev@vger.kernel.org>, <davem@davemloft.net>, <kuba@kernel.org>,
	<linux-can@vger.kernel.org>, <kernel@pengutronix.de>, <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH net-next 16/22] riscv: dts: microchip: add mpfs's CAN
 controllers
Thread-Topic: [PATCH net-next 16/22] riscv: dts: microchip: add mpfs's CAN
 controllers
Thread-Index: AQHYiIwO2RhNbJRj0UuhSQdJJDIbva1i2XoAgAAE2YCAAD+SAA==
Date: Mon, 27 Jun 2022 11:17:39 +0000
Message-ID: <a1b84760-821f-a279-ca2c-b22d5f1a99fa@microchip.com>
References: <20220625120335.324697-1-mkl@pengutronix.de>
 <20220625120335.324697-17-mkl@pengutronix.de>
 <ff40e50f-728d-dba3-6aa2-59db573d6f76@microchip.com>
 <20220627073001.2l6twpyt7fg252ul@pengutronix.de>
In-Reply-To: <20220627073001.2l6twpyt7fg252ul@pengutronix.de>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10588e6e-e810-4c58-a957-08da582ea592
x-ms-traffictypediagnostic: SJ0PR11MB5917:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wz/OOtUxDwiDK3zyB2T3ia+cubnXhoUUVkxQc9O7UF/0HoTiN9XoGZycfp5fzehM5svcCcXsOqzHF4qK9VeAZu3/8st2fWNWm3gHHHVcNtPg/Pv3jDTonslLQgpTFqWBu9UzSmIssFg110jKMXqvhqaR/BjC+2e2iPY6c0WjQoCjgYkuqc+0Y3ulz3nVOs9dy5dXPru91tI3oIuIndDgJPXyw3Ep9a6m3wtZBAWCF4GZa/SjoQnkcMnJXy0wUDsLQA6md+5oQ9DlEbZs7L1eBUwvVLKK54iibUvF3/L9tfnWBAJ5GumGUHip2AHO3DlItKe5KLh1a4LhFonbinj78asjq5PVKVzhAWYU5vZT+M2oA4zCbYlb4mFb6/V1otupW9/zIweGBB/B44Q30H/YwkfByCfvl8IMYJQPmsRFjPD5AXEzFl+w8QvOFcrrubZEh3A+tqwZSFAtYNEeoMgRV11/hQRHWFS2KWs/8GH/hq6Ykcn6NauUoEVQqf077j8r/tX9Fe7Ys4t2kd88E9SpJ0sUngvFFyidWZQCBLwzRa5P1HlpxJUHW6mJq+BeBpp13kpRnZ2cVIAz3pRWSTWY3rBvvytvVKEHuuWajw3Y8sjA12+aBeeLZSHFATisQ8JMxOMzZJyLZF7Vicl60uEEainJpugfW8YNqnDaElMWsl2YbMWe+AP80w7QWxL7zVGfWdGEsUrCBx0Vb5H4uBylsIyIM+RYj6zFZYJeajxEjgVC0xhiEqwHj5+gpxurFRu6hnuMUwoPpVjjSJFq07ugV8q4MLesfzifYhoIT+p/7/EFLtC8DdasKutwkBWouW2Xs7Z0qfWaKyNQcAXvUDPZTqBuuTwAjLfhBmpx/JWA3MhiFg99PRH/JJu9BUjS1l3wS/iKThwRDidNhGUlUlTn1w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(136003)(346002)(39860400002)(376002)(36756003)(6506007)(66446008)(8936002)(76116006)(186003)(38070700005)(2906002)(26005)(6512007)(478600001)(38100700002)(91956017)(966005)(71200400001)(53546011)(66476007)(8676002)(31686004)(122000001)(6486002)(31696002)(54906003)(66556008)(86362001)(41300700001)(64756008)(6916009)(2616005)(5660300002)(4326008)(66946007)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2JGQ3AwVGMvY3d4a0ljR05maFJtaG1nUXR0MlhPWnUyeEJBZzYxc2h1VW5m?=
 =?utf-8?B?YUwrUm9jY3lnNlF3Sm8xd0hzNWtCMHZQZGZ2RlZXcUUwWjdUWUk3M2tNb1M1?=
 =?utf-8?B?bUtaRk50bVpQbnhKWlVRQWR0aGdmOUZaZGhKS3dKeGdDQ0FZNmpudE82T04x?=
 =?utf-8?B?a1FOK3BPSTdCeWU5dzFCaVBxV2hVOWxVQ0RvSFNsYzZhS3VZcWJzOTBva1lD?=
 =?utf-8?B?cUx6Y08xRE1DdmVjeHNMVVd0RTJnRll6WWM1WGN5bDBDZFkxbVUrdStjR2JG?=
 =?utf-8?B?eHlORGJpOFplcnRGK01wVHhIemkydlkzSDZMU1Nqa1BJa0dwWGYyTTVPQzk2?=
 =?utf-8?B?cDhSSWZ0Um1JNkQ5R0c2c2VFVnJYVWhySmIzUTB0VXVWUDNtKzg4b0xhdEpl?=
 =?utf-8?B?bHpmZWhDdUgwN1RjMjczQkRVTkJ2bS96cUxhOWJyS0lrZFFHaExJb2t4NCs1?=
 =?utf-8?B?VVFxMTFIZWJpNVorRVhxVUVwbURxWE10SUEyUWRVV0dQTVZua2tDQXFxRisv?=
 =?utf-8?B?dzBRcEY5WVorUVRZTTZvRHZlV09xZHdYN05UYlVIZWhLbGkrOGNVdU1XY0ly?=
 =?utf-8?B?cEZCdEpZdWI3S3B4MktpMzVvVW9vYjBPYVZzbTZkaVV2ck95UXJvcys3RkxU?=
 =?utf-8?B?N3lqa0tjRDVRdHdVK2RIVHg5bUtBN1JWT0lyWDBMdHErWTdwdGFZRk96eTNY?=
 =?utf-8?B?c0Fmd3FaZkkrRnFsK0w4WmxxNHp0M3BycGcyWHlZMVVubzduc0xpUlRvc0FG?=
 =?utf-8?B?SUVsQVgySkhXTHJlcVJwd1FvcGhFYkV1VnBSaHBHOEdvazRHcjA5dXlwdTR6?=
 =?utf-8?B?OTE0TDFrenlSTVNIZjVZdVgycWxSUEZQRy9CNVJGZGM2LzNZZWxLVXIyR1NS?=
 =?utf-8?B?cHNjREJPNlA5UmxwdVdYVFc5dVo1ditCb2RkNmJUdWYrNG8ydG5CRHZxcnQ2?=
 =?utf-8?B?cUs1UU9oZ3E1Ulk0NjZDbnViVEtDRXFhUWprejlTVmo1OHdrdkpTcnpENklG?=
 =?utf-8?B?T0t1RUtiT0tSMSsrQU9hdU9BejNFVXBBOXgzWEZVQnlDUlNoQTcrL1J1R0ZR?=
 =?utf-8?B?T1lSRzZrNm9HK0RmUDVRcVBkMG5iSGg5bmwwS3dYUWFMbmhJV1dFOE1JcUNu?=
 =?utf-8?B?anJPd3UremJYK2lzQ2F1OGlBRy9WbnhHT0xBemI3VFZIcUkzOURORFVGR2Ir?=
 =?utf-8?B?Y2RuYmcyOFU4c3NJOGQvUFNyWEdiMUZyQngrdTNUWE1HUjZBVFYzRkF5YUpX?=
 =?utf-8?B?QUZOR3dkcGRKQ3BhYmpHbktmNDV6N245SFZOUHV5Q0JzY005THhGMS9pbUNG?=
 =?utf-8?B?RFJOeXpBM0N1TUpUTGlWM0JCL2tBd3VSQTNzR21EZXUxSHNIaTI3ZU1BTk9o?=
 =?utf-8?B?eXgxZTAwSjdtQ01wVDRnVkI2YU5SblViYzJieFNnWlNodTRXVkVXZGRVSGZw?=
 =?utf-8?B?WlR0Nm4wWGRXZnlPZDJwUWFDM1BUaTNPZDRyVWo5bklzUVI5Z3RyV0hXaVQx?=
 =?utf-8?B?bzBJcjJqWFQyMDcrRDFxaGJySzF6N0JKR3RWN0RqMjdPVGJwOXd4YjBjbEtG?=
 =?utf-8?B?T3hlTzROdXEyYjJwNmorelozVUtOSjI2VU1CNW1VWDFzdEZhRHFMaWpmM2Js?=
 =?utf-8?B?azI2TEdZQW1IRWlnR0VZQTY2WC9sS04wNjRBb0UyaFlQT2pNaCtWUkhielRw?=
 =?utf-8?B?Q29RR1lkZ3JGeTNmSGZ0RmN1NmNtNXlPaCtvdWF5ajFiMFArVjVWWE0wd0w1?=
 =?utf-8?B?SzhDdnVib3J2aTlvRmtwMjZJK25KTmN2eG0xVG03OSsvWk9tV0JZMXlTQ1VE?=
 =?utf-8?B?cm82NEFyYmNxSWtTWkRQMGJZd3o5OTRQTm40Snd5QWFpZmZLOE52NTlBUmJq?=
 =?utf-8?B?bFgxYkd1TFpVams0UFM3b0tDQXdXSGYxeS9sV1BORVlTVncyWW5CNHFCVzVn?=
 =?utf-8?B?Uml6U3ltZFgrT3BodGkxWENzWTVaSzh5aGtucGVsZ252WkNudzBoM2ovNC9G?=
 =?utf-8?B?QVRjbXJVc2xITEkvRmJNN01xTjZpdkk4bHJ0a2t6b3ZRejg4S01KNmZlZlla?=
 =?utf-8?B?V1Zhb3VoTldlOXJFNEdJUUpOSFdGWEtSTWhDTDZTOGlnQnJtME5EZE5EeTU5?=
 =?utf-8?Q?8cGyy1ioqprdjHYLRIZBxhfCt?=
Content-ID: <B75DFD07EBC5DB4CA843E2E5E80D2606@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10588e6e-e810-4c58-a957-08da582ea592
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 11:17:39.5625
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kxTiwAsiWszriPHGYkpqw3K7OrxY1kzHRpC8h+1EINLhEWPOGkfqmemnn2Gi1dkhd1QNQknQpcAhwchtJjDgzs6yh7z5MRWD8GFHsJWHcCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5917
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_041747_835604_C6239960 
X-CRM114-Status: GOOD (  11.28  )
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

On 27/06/2022 08:30, Marc Kleine-Budde wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> On 27.06.2022 07:12:47, Conor.Dooley@microchip.com wrote:
>> On 25/06/2022 13:03, Marc Kleine-Budde wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> PolarFire SoC has a pair of CAN controllers, but as they were
>>> undocumented there were omitted from the device tree. Add them.
>>>
>>> Link: https://lore.kernel.org/all/20220607065459.2035746-3-conor.dooley@microchip.com
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
>>
>> Hey Marc,
>> Not entirely familiar with the process here.
>> Do I apply this patch when the rest of the series gets taken,
>> or will this patch go through the net tree?
>
> Both patches:
>
>  38a71fc04895 riscv: dts: microchip: add mpfs's CAN controllers
>  c878d518d7b6 dt-bindings: can: mpfs: document the mpfs CAN controller
>
> are on they way to mainline via the net-next tree. No further actions
> needed on your side.

dts through the netdev tree rater than via the arch? Seems a little odd,
but it'd be via my tree anyway and I don't mind & unless Palmer objects:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
