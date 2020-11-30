Return-Path: <SRS0=EtLq=FE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C2FC64E8A
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 13:17:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24F8C20727
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 13:17:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NVcgq8lp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="TLpYC2TN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="ISiM7dpK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24F8C20727
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nbzk5JHr5Sy0vqnWjXejBvnSQrip4yLUqhSA3kHbVp0=; b=NVcgq8lpKT7yDD9p6qvPlCy9c
	eEJBT+LWpsLpgoEWlSPmRs3XPCQVUU7wLlmadeJ5KTMK7HSRprvr4I1wdkW9ksj1eU25aPMRR7AMm
	fiS9qoXdpJh3LEyk7jgPE3DoUaMhHFb5YXDYN+cvTRjuryQIuLa5gDrGaSQn77RjrVXubeQKsGJ2W
	WOfeO2Aq+mPLJGV0Vcm7gh/4A7XdfkgdZgnFIIBW/Hqpxm+/zCe5GWMIhFllz4fZymTyT+mTv6b5E
	Xg3SSvwDD6lD5GAOhz9CIxu5qNAeVrbMk7wwk9v3Gs5xAPb8kz+22z8xQt8VLqKYHdLNzIj3MnAJp
	5iQAinaNw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjj3h-0007oO-JI; Mon, 30 Nov 2020 13:17:37 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjj3K-0007fg-GX
 for linux-riscv@lists.infradead.org; Mon, 30 Nov 2020 13:17:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1606742234; x=1638278234;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=BoVnVpP5SVGmOeo9GGU5ax7rd1jbk81yMBmlN/9ZIvE=;
 b=TLpYC2TNbCbU31DAU2EI2V62DWu6fA/iQNwKhhxm3I+s1MkVZlzPiUGK
 HrEl65vds2NOPPc2XyFkuvW6bvrlOqCJmqAUVVbY3fMe+NXHTexRa9pZb
 nYAj+4zbfBM9jJTbTwxemsgQitzAiut/JlRT6T98Bhf/W+01S0vONicQZ
 nUA34xWK/hNz4yowF3JjJp5Th9n562sB83lFKMjVHiYGFJXwCQIj+W/M2
 vh2IXA8BrTtwVHG91dgVKg6g2hLhbZJ6Jh5iWvyYY1ccXlueIzpWglf7v
 bJkda7hHf+4x4szoV041gU2/uijiLPEfBeDQirYcsmx3DaMLlOVziX06g g==;
IronPort-SDR: NjqX59UsmBIg1VjsMhciqN5zTBEs3HwnATxOy2GighZCOp13FTA17XXhJRggkuORmcxEihNpFv
 l2eNxSXusJBxg6dICkC3f3rtJZn9jzjKpLlDddFuBxGLcSBptZIZbuWv3Sof9wxf/fcXJKP2CF
 9/YMjrKM+Aji1jQbhpNqkvbUuB8OAvx+iRYw2Bz2PcJRw2xNP4S+2k0JRkcSHQz/CEKmbNkDmu
 pscbjHOYzFzLgaLIwSPyQ/kzjxPPwAGhtapQDt8tlGJG7qz7vt3ZsK5eWohPsSpmtlVe4/8Ooi
 trU=
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; d="scan'208";a="105468636"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Nov 2020 06:17:11 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 30 Nov 2020 06:17:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Mon, 30 Nov 2020 06:17:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OvfihjAIg0BbVYiiAyLl1pOuhzoa9LfEPIpKDJWvGtwiLqTe26q+dzrkQNmf977rRTsA7C5esEOGsbva1H69e59l4PLpUEg+4jyXxAoTUGb0I6lIBuBbBI4iYt4T1FrpYe2LWVAl/xupZA3i7xYJsslO/xTC45BLVOTOXIHJ9ueSNqsTwxrCd1bMOob/GijwNXGNbQPEwQzPGl3j9T97cYgt04FdaQ+PnHk5Wq0GBxUqa8UHRb+t5w5ui9onDo+TcOeF4tWA83qG7zth3aXUQF4CLJCBNtIwhx860im48N+Aa8r0fwLCsJL8UNdTe9Y5+4IqUYoBTCWoH9wQNIUjQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BoVnVpP5SVGmOeo9GGU5ax7rd1jbk81yMBmlN/9ZIvE=;
 b=hJNYZ1nYJ0skMjj59dGVIiYkgh4RDiClmGp6jCV+KYIO2rH0aOm6erPQ2N/C85TBjPfD+Fh38N56woZmdKjqgLHBeaC/sGyHJhGE+1ph1t9+uqegt9N4J+iubzyl94MIRq4P7Rjr/IeZuZ9iL1CGZA0Rhe8lOPpAD8Opn9aelhfrzL6E4RrLdpmgt8tE1ZHbT7rEJ7F1/cm5pGn9jqHEjfezCl9rbiqwPXtvTjsK+lDkCIXETiTDss34xY6blC6Vy3OhLDtpVPSxNTOHwPwtljjPnDUdugZWGoEsY5cAlV5Y9bDuyvSdaXMPMNNQe5x1q6vQ3BilzdkTipJBFoDG7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BoVnVpP5SVGmOeo9GGU5ax7rd1jbk81yMBmlN/9ZIvE=;
 b=ISiM7dpKeMtqPuPZMGFUp+u0sPj181JwTrGyD6gTZSiVvK7Nbi2zuHPAlYORvX/NPqwNMGpZsgVtfvEVZuq0VNgViKDk2tCFysG+BSQKWGYVxAOHZzHkFWTol74KO3vutTOPwAES1zIPBFfgpDizvHSiSUPnVGyRsw2jiyqoaRU=
Received: from MWHPR11MB1247.namprd11.prod.outlook.com (2603:10b6:300:2a::11)
 by MWHPR1101MB2094.namprd11.prod.outlook.com (2603:10b6:301:4e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Mon, 30 Nov
 2020 13:17:05 +0000
Received: from MWHPR11MB1247.namprd11.prod.outlook.com
 ([fe80::8073:14fc:edb1:4c78]) by MWHPR11MB1247.namprd11.prod.outlook.com
 ([fe80::8073:14fc:edb1:4c78%4]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 13:17:05 +0000
From: <Conor.Dooley@microchip.com>
To: <Damien.LeMoal@wdc.com>, <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 3/6] dt-bindings: add bindings for polarfire soc mailbox
Thread-Topic: [PATCH 3/6] dt-bindings: add bindings for polarfire soc mailbox
Thread-Index: AQHWvpYmzf/iqbxifkGhZlQXpkWFUKnguQQA
Date: Mon, 30 Nov 2020 13:17:05 +0000
Message-ID: <6618812d-fd10-8935-03b2-75165460840b@microchip.com>
References: <20201119170432.18447-1-conor.dooley@microchip.com>
 <BL0PR04MB6514991EB7AC9B0139BEF513E7FF0@BL0PR04MB6514.namprd04.prod.outlook.com>
In-Reply-To: <BL0PR04MB6514991EB7AC9B0139BEF513E7FF0@BL0PR04MB6514.namprd04.prod.outlook.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [89.204.252.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33d35c9e-f360-42e5-5fd2-08d895323b8a
x-ms-traffictypediagnostic: MWHPR1101MB2094:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB2094231E92DFEAD6BE1EEBFF98F50@MWHPR1101MB2094.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xfv970qtzs9yqKcjrA20LMiNiItj4u4+wDjTA8+8msxyLZqn59FH0DXB5a1ATOZiZWSF12Vtej6HdXjxNc4rXLaCQaNMzQLPEoQUbKc5gDdVLlQV5kW1nywMQYUoa28evsYU/2aXL9o8OSGpa2LCzc015Srn8SlL6o1iElb0eFCZEWB6rBQtQq3wmfF5qGF/YE+XXe4mTtwk8krmikQi4sPoLooHPgVEz5GIaF3ZnJKUMnkC0YZo7nJn52veSkQUjuho7tev0F3DMgSZ7YvJdiGVvD0hb115xMp9C4eX/JbSyQ53EHLSdBl5CbDvKZIZhkUJWjFUn+pKBUvVxbzK/Jgzb/o+oTMUQue4DaxDaMTg60761II+SMWvaGwN0QGTjOngAA9jvRsQv6eK+L/DqPh7bkwdCirnVBcomTgD8gIFCG1aNgrnLpeD8BWrH0ilGlXMgnKIRGIUP+dWwjc7Qw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1247.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(396003)(39860400002)(136003)(346002)(71200400001)(8936002)(53546011)(316002)(31696002)(2616005)(83380400001)(6506007)(478600001)(8676002)(5660300002)(66476007)(6512007)(107886003)(66946007)(64756008)(186003)(31686004)(86362001)(7416002)(76116006)(4326008)(36756003)(15650500001)(26005)(54906003)(6486002)(66446008)(2906002)(66556008)(110136005)(91956017)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UjJXNXNSZE04cTJXb09uQWlob0lyUXZ2b3dMNjdUNDRzRGhQZUNLdnN2eHhH?=
 =?utf-8?B?eTNPZjNqWjNVWnBVL3ZPQmx5NXR3NG9KcU1RM0tUR29QOGE1eldTakI0UDg0?=
 =?utf-8?B?TlpkQW9XcWY2VFBIYUg4SCtZTmdDa21OV0U1dTkwcStaUWJubGF0WUVFVkhX?=
 =?utf-8?B?ZmZQb002blpraENaVzRoeTkzMGVKWFcrVHZGU2M1emNVWkJjZUhqMlRzK003?=
 =?utf-8?B?b1JkVVpYVE9aNXB4d0tiM1ROYkNqRDROZTR3Q29MdHVGOFcyQ21OZUhGa1NX?=
 =?utf-8?B?L0FTaUY5WjdtWVRVVm9JbG1ZT3ZzTm9KUnlvZzZjRVlUaWpSZjJUOHVuK3B3?=
 =?utf-8?B?RFlhTVQxeC91UVQxRVZ3N3c0WWpjWGFYMDFZa0RQazZ5UTNRbWJjZ1JjOEg3?=
 =?utf-8?B?VnVqTjB0d1BPY3ZrNUhXckVaeVhHUWYrYWZSUEFDRUtHOGM2Z1I4MVBoVThi?=
 =?utf-8?B?S0ZLSmhLKzFjSUZpVzlrc0c1cXM4U3AzYjJXQXF2U3c3cHMwcVRjeHFUd0pR?=
 =?utf-8?B?cnIzQlVtQVd4VzNjUkdXVDdxOUp1MC83TUkvaFA0dzNTeVVadm1QTGxFZU1E?=
 =?utf-8?B?Q1VudUJiMmxEdmx6RE1zcnZ5TzhmWmxYMG53VW9QM3dQckV1cy9ZblYzT3RQ?=
 =?utf-8?B?RjVUb1pTSW5IbnExTVJpbEZXek1tbS8rTllkVWxPZnl1M1IrV3lBdXdMeWNQ?=
 =?utf-8?B?Z3NVcVNNZ0M5ZmJmRTdHRmdSUWtqSzdhSHVUWXpZanU5RFdFc01CNHBlVk1l?=
 =?utf-8?B?ZERxUTZkeXRaejJMQXJTVTBwZmRNVDdBL1F4UytreUs2VWZlRDFyS1lIeGJl?=
 =?utf-8?B?clhuaERPQXNJZWxmUnVGMmZmQWFsZjduWm9Ed3RobTg1Mk5DQkpYekFiVy94?=
 =?utf-8?B?NStBcnc5MnpaZ0VBSnlXYzdSZnVmWk5wMnhuNmJNVnh0OXAxWWV3QWpkbDU5?=
 =?utf-8?B?ODBhMFdsbnMvbHZXWHVWL1FxcU9QaE9Yb3ZxVGxob2UyTG96K2Frem42NkI2?=
 =?utf-8?B?ejE4RHNoSUhYOHZneDFqOGlmZXFidnZqbS9YWmtzdFNNT2NlWUNDbzFkMlpV?=
 =?utf-8?B?Ylo2U1htaTJNdEpRTXNOckZiUERYZjRxMXhRZTFEVmQ2Z0dOVjRuc0pFRmpM?=
 =?utf-8?B?OWNoa2NSeDhKOG9mL0V5VFZKZTdHZG9jTXNMcDUrdThuaGRyekFCS2NqOUhh?=
 =?utf-8?B?VUI4dHFvQnNYSmtMZ3g0VUFyVG5UNFJuZ3FnYVpQakI4c2dlNFNNOU5OYVZw?=
 =?utf-8?B?NCt5V0w4SUhOT0s3ZkZxbDMxQmRMUVpWSTViRzV3L3MzN05rQWhiK0g2Yi90?=
 =?utf-8?Q?mhvPjzpwe0t04=3D?=
Content-ID: <FC71195A31CF254395A0C5D6FF5D7740@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1247.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d35c9e-f360-42e5-5fd2-08d895323b8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 13:17:05.1753 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b3TJqi/W/r3p6hPtG0wDUGKCpxx2msKrN9+WevIJb5ay2JiJ0haE0T8EG19tD5hdd8tYAx5lfyLTiGaL9+SuCrmwVyKVFEAnh5Zq0lw+myU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_081714_887788_BBD925A3 
X-CRM114-Status: GOOD (  17.81  )
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
Cc: Cyril.Jean@microchip.com, david.abdurachmanov@gmail.com,
 Daire.McNamara@microchip.com, Anup.Patel@wdc.com, Atish.Patra@wdc.com,
 Lewis.Hanly@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 20/11/2020 00:14, Damien Le Moal wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>
> On 2020/11/20 2:05, conor.dooley@microchip.com wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Add device tree bindings for the MSS system controller mailbox on
>> the Microchip PolarFire SoC.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  .../mailbox/microchip,mpfs-mailbox.yaml       | 46 +++++++++++++++++++
>>  1 file changed, 46 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
>> new file mode 100644
>> index 000000000000..5d6ccaa13dc2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
>> @@ -0,0 +1,46 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/mailbox/microchip,mpfs-mailbox.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Microchip MPFS mss mailbox controller
>> +
>> +maintainers:
>> +  - Conor Dooley <conor.dooley@microchip.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: microchip,polarfire-soc-mailbox # PolarFire
>> +
>> +  reg:
>> +    items:
>> +      - description: mailbox data registers
>> +      - description: mailbox int registers
>> +    maxItems: 2
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  "#mbox-cells":
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupt-parent
> This one is not listed as a property above.
> Did you run "make dt_binding_check" ?
I did, causes a fail if it is listed as a property. I'm going to remove it entirely in V2.
>> +  - interrupts
>> +  - "#mbox-cells"
>> +
>> +unevaluatedProperties: false
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    mailbox@37020000 {
>> +      compatible = "microchip,polarfire-soc-mailbox";
>> +      reg = <0x0 0x37020000 0x0 0x1000>, <0x0 0x2000318c 0x0 0x40>;
>> +      interrupt-parent = <&L1>;
>> +      interrupts = <96>;
>> +      #mbox-cells = <1>;
>> +    };
>>
>
> --
> Damien Le Moal
> Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
