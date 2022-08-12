Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CE2C00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 07:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2sIqhsZPCzycaZD2bLRw15iCa3aNqQcFj9kYB3mugj0=; b=aXttICt8SpETZ8
	uJ4Hm5c9YFjzYfHH4Dr3h6IGTktv6mIIyzV8X1++vTm51NpTZ+hqdYS6Bbxq21KF07EbfXOagv73o
	63Lvnc6xCPWKy069VIfnlbSa+UuO40zzW7Fl148x0AMzqL+7zIfNID9S3Mzzw5otfWfwI4jpqUREL
	ml3P62ITl8Grv+UYhxo8wi9OsRr0ozKZm+b+lSZb2Q5mAh/9eFCqscnrpadlvCgOO9RKPtwGOm2cs
	nU6KAauVxOW+dpyQ27PBR00ETjrOPEHCKd3n6nLbasCwWWRrWOeNK2zk3jfmF+b2ViOV8RiMWQ4tb
	KnT4FHJNbAinmfwfJ6zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMPWa-002BcL-US; Fri, 12 Aug 2022 07:56:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMPWS-002BKK-Cq
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 07:56:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660290960; x=1691826960;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=SjIklEgkfB0/p+eI4wjYG6fgOsd0lXrNoCdLu4WgGqU=;
  b=fp2FJMdDYHZvN7+GhK78FSRrhAqwakDpe3O9iICWU6zaWbpSKJLKPSQO
   okig265foI056/x2/c33vNWyuqUCQGjj74CYWlOsf29fzGDv5anQL/+Ml
   HmfikH5snDwGW0Fei5y/wZINyx+9+/9olFQ2wlYFeKB1F+yVM9usmDIyc
   nQt/HMcchTB86GyXbFG1Ub/CIIYQr+UsE84Ah4RRlCWJNHWFtfBIEXqxa
   rtxUUK+VEuuZWf2asGNlCsfcQWbTVOHw7ZQosHwQYs5rimmkffMGGuNH3
   PcO8bMlQbGPLHkRWdWE58ULCfJkhm/TzrRHmjN02eGZ5J57bkmWwYfP/h
   g==;
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; 
   d="scan'208";a="172142500"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Aug 2022 00:55:57 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 12 Aug 2022 00:55:56 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 12 Aug 2022 00:55:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lIYzgg4Fwk5Hg0y2CnQrgugA0/rug58HTL+ZZPWZpedMhyZpnyY/Bt+61PukTyYBqFBhZW3W71NG4Rz+i9qCWxICaji7xODdRec2cM8dFiG+U1Q6aHifo8Ax/UcvSW+49j612H3YNutLyCcmAY4W43m2o0bB465x3oq/0qgV+zbv5A033dvHBUVXuQbMQxEbzX45lHCT2Glka3GbGifbQN4dmEIWupbGokb/8to3UsdRevHNzbAInM4KuAURZ9U7sR1nnqrQOgWVHgIs2FRZZlXWcMk3n7kRdWWM5uPjWVCh07wAPz4GOKufFZXBDE7OHhJiKWQiAxX/I9Zzcy+q/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjIklEgkfB0/p+eI4wjYG6fgOsd0lXrNoCdLu4WgGqU=;
 b=MN3W9rhq/WMJ25g/1ahW52/aGmIjoKgYSrySWijNphlvwfWdwsk0g9SzhjXlbEJ2I0KvPEI6W/piCrHQmgC4f1UVgaHNjWV9tfdDXlOrnfMtE1klI+O6M/24XbnAvLPPr5V49UKuB2D2HAeQe/r59UnDhqsgRn614G0COmTyTSQWKadVDT++Jv9lWJuE8TYTiyZ7GjYQNUlR1H/c/sP33dPodylIswNDahbAmb0IcD5t4YPu0i3H37xy8Ww7dr7OGZM9qS0O15DkC1GqoNl7biVr9bP8XA4MABcaRaBw2h3vGMfMqpvXUAQSs1Aqo7RsbjThMoeKau33yBaUs8i0IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjIklEgkfB0/p+eI4wjYG6fgOsd0lXrNoCdLu4WgGqU=;
 b=nKlhkAFiTgwHJMohWOP67H7EwESCgRxRGfRFB65zNkBtBM31JGh3dtJjdko8yHyXo0m8A3kZ1ZoV1ltLshckqHxgno5b7ZCeCsst9KXDlFC2sqW3s04iV1tRzNa4vGTGbR6TABLdOMMTJN2ci3kcZEn2gjliWEMIdTtOl5wxzzM=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BYAPR11MB3734.namprd11.prod.outlook.com (2603:10b6:a03:fe::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Fri, 12 Aug
 2022 07:55:50 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Fri, 12 Aug 2022
 07:55:50 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <mail@conchuod.ie>,
	<Daire.McNamara@microchip.com>, <bhelgaas@google.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<greentime.hu@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<lpieralisi@kernel.org>
CC: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 3/4] dt-bindings: PCI: microchip,pcie-host: fix incorrect
 child node name
Thread-Topic: [PATCH 3/4] dt-bindings: PCI: microchip,pcie-host: fix incorrect
 child node name
Thread-Index: AQHYrcGmPPWvz8b1R0CJioNPNiP+dq2q4qEAgAADqQA=
Date: Fri, 12 Aug 2022 07:55:50 +0000
Message-ID: <272557c5-3e30-a873-40af-16a65c3043b2@microchip.com>
References: <20220811203306.179744-1-mail@conchuod.ie>
 <20220811203306.179744-4-mail@conchuod.ie>
 <721ccb76-c162-30ee-68cc-3316a2d62554@linaro.org>
In-Reply-To: <721ccb76-c162-30ee-68cc-3316a2d62554@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b92a0b8-c8d7-4e98-353a-08da7c3812bd
x-ms-traffictypediagnostic: BYAPR11MB3734:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xna1oKEJg2caH81/LUEhg51Jjj8RUCVOQqB6vhkPBxnkGq7U81G/ur8h/qX17GrU+QSfqtLAPa/Wx4qGi38Laug64o4HVMCRxLed321oeRBVG7oa+9vza64df7hHgRsasqZdBjub+OxZXZJWI3Rd/DSqViP0jgMBB6U0vobuZx0x9M9FdzoJuyW7gAUBWnDW+OXQPlCNsWcn+ieH8nGHkDn0UkM+tO9bkm6hGCzE9DbqyHeSKqS5r5JnPgB7xPk/fiQ30eb4BS17SIx7UsNcD9W2eHat8lFOhyKYVIPe/nkALTdYRerX0MqIEAjyrR6EN9psNwfhdDM5ZAqdPgh8SIn9CwHz3IgH3NdbbKfZBxw7xVATUjdkDn+0BL5vqUafuGBhz/ALMY0Ur1T8DeHG11GmZ2iUNOSG4OJIQ/ENR7obM8w7XM/7UseQ/8/VzcZGuWWve5+HGS+TY6gQnAGwOl3rtdXGFn2oADMlw8Nvp0G5jqfZYGhIkBbH3uLIFLKNjOVODYaHyrgfCpaF49lNTPY+Rsr/cH8ausVF6D4sI4FiakB02k1qZkOPZ1pTSNmTs3yFmb+WWYx1p51xE4COkL88sBndS2UxKdVja8CIGFYogdUjS6DDYASUYsAcLpXxatIaVdMe/ibIXBV5MjUmkk5QMndVDQY2VNNUgtWyatT4V8zFIAQF0JSNj3Zeyo+rk6jmFlzfDa+0Td5pKx6mjtwTnA0eHf7bgjpmDv3pRbGWXFik5K2/T5Ph290JT/bUAzLjlhOpXZ0x7kqDZERYhcMN89h4HDK1t8pK0PF5+5RQSN41r1mrjuNiUuWlOxq//zhoda9C9+qlBi+aiI4dHQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(39860400002)(376002)(346002)(396003)(966005)(316002)(64756008)(38100700002)(4326008)(8676002)(66556008)(83380400001)(478600001)(36756003)(31686004)(54906003)(76116006)(91956017)(66446008)(110136005)(66946007)(6486002)(26005)(31696002)(86362001)(2906002)(5660300002)(921005)(8936002)(7416002)(6512007)(6506007)(41300700001)(71200400001)(122000001)(38070700005)(2616005)(66476007)(53546011)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SGxSdWlRTGJRdCtZZkorTDZRdnpwdVczK3JqY0hpbit2TlNQR1ZRTFNTWmpm?=
 =?utf-8?B?SCtzamFFQnYwdVl0cnphT2hRVllrV2hwdGtQVmZHck4xQWY5RWR1OVJ1QmJi?=
 =?utf-8?B?ZTFMR1kyMjVuMmFOSWtnWlVFNHNaNHBDMmJTcFZ6YWRoeFR3a1pXTDN5dnVO?=
 =?utf-8?B?MkdBL2ZMV1pNOGdwblZNOEExSzViL1RJazF4MDJNeTVkb2FhSFAwQXQveVlF?=
 =?utf-8?B?akFQK0dGY0hGNHgyM3hqSU9INTRCQTUrNEUrdUNHU3o3NmtMZWRLaENUNzc3?=
 =?utf-8?B?MVNoaHd0U2s2MlpFKzdXTVd1Yy84V1JWTDZoNXJUNlFoWGhGT2JFcW50WmxR?=
 =?utf-8?B?dDNKbjZ6YjY2S1RMOGV5V0JGNHd2M01oMG1VcXFVRDBueWpvUm5aam5EOXBl?=
 =?utf-8?B?QXpER0FyN0NrdktPOS93QTJjSTJIWDVON1RrRFFEajFpSm10MFM3Nkd0Nzg5?=
 =?utf-8?B?a0dDSE5lTzdWcjdnM0FLcXR0MnFOK1A4TENuby9pQWdjMEY4VFE4VWk3b09U?=
 =?utf-8?B?Y1Bnc0FId0k2cU5hYnVpSy8rbjdnRGhGcnpZT1l2MFllRmZUWExuTGZsYUpS?=
 =?utf-8?B?MmJhZi9yTEFpaVRac09SeHErYWtBOTkzb1pCYWIzRWpaN2pacWZTdFBhODha?=
 =?utf-8?B?QjJjVjlvOFRlRjBTZVU1Y08vUHNYZGo3aCtXQmF6a0tialR4cFpqWGJwT1ZU?=
 =?utf-8?B?eU15K2l6NXd5Wjl1YnpOZGVNTldhMi9qSmhrRTJEdzladDBpakpZYVFRMkRk?=
 =?utf-8?B?cEh4ZEJpcG9oTEt1U05zRmNjTTk5eTdwbGpvRUQwbjZHZWRTNDN1MHRMMVNu?=
 =?utf-8?B?TVFKM3V2UkFPYkFjT0x6RXFvSGpqaWF2cUdmT2xYV0sxVHVENGppS21kRnNP?=
 =?utf-8?B?VWVobUc1TUF0VXppeFYvTWZuQ1Q4Y1ByUjVHb1ZlNmZFZ1Z3eE9Ya0pKWlhl?=
 =?utf-8?B?aW83YVNVanpRN0VTSG5uQmJYMnN1YWdpRUhCYWg4UGtnOEswTU5YUFk1RlVa?=
 =?utf-8?B?eUFVMlJSSTFySk90bEhURkVXYVNNSkRxMnFGWDVuT2wvdm1KcXpOOHFpbUMz?=
 =?utf-8?B?a3A3QVZWUnkwSzh6ZDB0Y0lrMHBaRzFTM3hlVzNaTCsyV2dpK2E5S2l1WkZj?=
 =?utf-8?B?NzVqRmFja2RWSDB3QjBxSmdmcDdGOWRvMGZYaG1SR1pYYnZ3NWEzNHFkbHVF?=
 =?utf-8?B?NGxTdzRTYkp0U0NHNEdicjlCUHNYMmU2QWQyZEVHdUJRc0diZFBNNFlXUjdK?=
 =?utf-8?B?T3FOaDdrQkFXMkV0QU56V2lIYzkwU2lCRytKcUNsdHQvM1AycHBQOTRBV1Vt?=
 =?utf-8?B?VDJocmlsVFpEU0pubitvaUxTbG84QWthQVNoNi9SZ3lsQ3N4dlhvQ1dFTzds?=
 =?utf-8?B?WVdXbXNXYlNmUlkxeW9iNmNTUHlUaHFHUUNVbUx1dzkwKzRFVnhZOW56Nmtt?=
 =?utf-8?B?MjRNQTJybHZPTkQrVjh3VDN4YWtGcGRPQ2d2ckY1SnhvNVVpSExFK3VlKzE4?=
 =?utf-8?B?cUx3Mk9OcGJYSnFacjBYZFB5OWlIc1FBS25IOTUwcVdhOC9LWVVVMHRsWUNn?=
 =?utf-8?B?QmRRWnl1OTFVMTAvaGxFenFhSEN1c1hGcGxlVWhnL0ZhWkZ6cVY4YzR5Z0dR?=
 =?utf-8?B?ZGhqM3dqaG5XWjFMRHAxVUwxMWtKZzdkL3NJWVBHd2g2ak9wbjN0ZHhWaDJt?=
 =?utf-8?B?cXd3TDVMUnlyc3RObzN0UmVkYXdoN1MxVHQyL1ZTa2RIajYvbVB2dmswQVRM?=
 =?utf-8?B?TWpBMW1BaGlLSnFuWGhmOHQrWFlldG1lVHV5MTl2VEZaTVREaklYeExobktv?=
 =?utf-8?B?azlmdStQOGl6Q2JmRDhjb3VLbGF5dFJDcVA2aU9SckxPUUhzQW9QWTRjTUcx?=
 =?utf-8?B?NDB2eVRWUzNVallFdStOMGxpT2l5NGFXdS9mR2FkWnhBdHFKNHlkMU9TZTVP?=
 =?utf-8?B?bnVTOTBUVWtFNUFBRVdhbENteVQ2MlB4WDJybG5QTmNIdjhBTUFxRXJVamFN?=
 =?utf-8?B?V0FmQlBjU0s5K3hhNW5WaDJMcXVmdUtoZS9VRWlQR0M4YjB0MmdlNGRyeGp6?=
 =?utf-8?B?UnU3STRUMGJkeHBQbzcvZ3RPZ3FnZ3V3SCt4TFFVNmE3TkJFMzZqdHVSWW0w?=
 =?utf-8?Q?fs8gCoBE6wtW6xP2LWnBsHQ23?=
Content-ID: <3131DE56252FC946B89B85145A5DCC37@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b92a0b8-c8d7-4e98-353a-08da7c3812bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2022 07:55:50.0124
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XDpfRc1JsIpU/MMp7wKy1Z7JZq1aWjkL81COEPN7IOq9/TWGjQKVRrg08qJC4ymGtHGXlvhQx3YSzga+4XS4iD7KZKk1lyOxR/rI030yrRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3734
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_005600_582380_10543AF7 
X-CRM114-Status: GOOD (  27.67  )
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

On 12/08/2022 08:42, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 11/08/2022 23:33, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> v2022.08 of dt-schema improved checking of unevaluatedProperties, and
>> exposed a previously unseen warning for the PCIe controller's interrupt
>> controller node name:
>>
>> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@2000000000: Unevaluated properties are not allowed ('clock-names', 'clocks', 'legacy-interrupt-controller', 'microchip,axi-m-atr0' were unexpected)
>>          From schema: Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
>>
>> Make the property in the binding match the node name actually used in
>> the dts.
>>
>> Fixes: dcd49679fb3a ("dt-bindings: PCI: Fix 'unevaluatedProperties' warnings")
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>> This is another one Rob where I feel like I'm doing the wrong thing.
>> The Linux driver gets the child node without using the name, but
>> another OS etc could in theory (or reality), right?
> 
> Yes and we had such cases when renaming device nodes caused regression.
> My interpretation is that node name is not part of ABI, so anyone
> depending on it made a mistake and they need to fix their stuff. I think
> actually that is really poor coding and poor solution to parse device
> node names and expect specific name.
> 
> Other folks interpretation is that we never break the users of kernel,
> regardless what is documented in the ABI... so it depends. :)
> 
> Here however it is not a device node name, but a property name (although
> still a node). Bindings require these to be specific, thus such name is
> a part of ABI.

Yup, pretty much aligned to my thoughts on this.

> For your case, I wonder why it was called "legacy-interrupt-controller"
> in the first place? Node names - also for properties - should be
> generic, so generic name is just "interrupt-controller".

I don't know. It's what we had in our internal tree prior to upstreaming.
"We" don't rely on the name for the Linux driver, so I am not really that
bothered if we change the binding or the dts.

> 
>> ---
>>   .../devicetree/bindings/pci/microchip,pcie-host.yaml          | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
>> index 2a2166f09e2c..9b123bcd034c 100644
>> --- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
>> +++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
>> @@ -71,7 +71,7 @@ properties:
>>     msi-parent:
>>       description: MSI controller the device is capable of using.
>>
>> -  interrupt-controller:
>> +  legacy-interrupt-controller:
> 
> 
> Best regards,
> Krzysztof
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
