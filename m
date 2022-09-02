Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57071ECAAD5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 16:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJWdBuhzFPoQJV6t/xd+bdnYnziwbl5I/xzoKMvwfSA=; b=dSIOcYeNpA2q/H
	tRyDWIatc2OedLs+oGXnyUf3JGkcjVhouvchlyaFOPkEvzUQcf4dob4sqqW1N83gTKA/8voYhM1PY
	ZDfN0Z7mxK22EnS5GmrOg8yTfQJHx2Fj+onMYAQyUhQYSVGQxMxwiaNLFsgxLZe4phRfaJd8mAUoS
	Kz0qLZsDRJ9Ryu0NS7hnDRWi7HO7pM8D6ynjjDalyP7f19FCvh6Y7C8azKE0S+Vyvln/FbBlzevFE
	g1ueRedxlEpmva9R3AF5Mf3y6uKnYuX3nJQeg6kn8+T0uVIrvKEd1aYJgbG7/ZaBZjixY5wuKCCaW
	CRaSXoAudi1BfTtNmu6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU9vv-007QNm-MU; Fri, 02 Sep 2022 16:54:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU9vs-007QHZ-3x
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 16:54:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662137657; x=1693673657;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=s0qgJowurzjwW/4luTZ81mFVcfdf8g9Iq6xDDXJ2Vv4=;
  b=RTv3fxibz4SO+By5GHWhlt+lWYH8aC1ZhcHq0rsCUTbJMy/7j8qw/0cd
   +qtfcVy5K4EOwruh+TNJdG5SU/r8RBTvBrf7/iSvBqHUvftl2X/GK7bd8
   hDyKzWT62FdNYOCUO4+ae3rBvKHfBFxOZVZ8+SQDjwzM6Q+2kjmMFXVLF
   QuuEJLe9NXHzVCOnzyzya18sFsvha2DLE2TVQzAuOW8eg/O8GB6JgQC32
   mS1I937UFxjCYXI9Jp+TsZ8O9q4dCDY2bGAqeZ9c6dZBNmXqTUindkS0t
   g4HxbQ7VeAKfeV6IsVuYhLlvRmEDecz78FjRcTsFifGd6UjN0LmaBXjzg
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="178825732"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2022 09:54:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 2 Sep 2022 09:54:14 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 2 Sep 2022 09:54:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5dbilC9J6wYdgxvkasLYev1YVYALP9avbAjWohSBkqxGxUgpCy479TQ0YTK7vTaW7SNNjkhssQelqPFIeJbRlWwkeKoYTMkXPXL+bKKnXjD+ggVzsFDYfYaSpqg+GTTVJvWXvoYNWmnfsYYicZ83FvaOP5LZoJevHatTRMLwLgMyyt7lCk2Pk9IN4hTbbPvAq1ftXwO7D6WKjwwOESQshKZCikdIFnkQjT9ARJVoFtRW8mhUF0IyQE2Trr7k+eYuBPnaLH/7pZuNQx2GclougHB9z1WZ4TAruBLKNFYOC/ObS2g4z9nalxlkVejaZAUlJFFxr2XqBLBsFblHWjEtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0qgJowurzjwW/4luTZ81mFVcfdf8g9Iq6xDDXJ2Vv4=;
 b=lUCrR8EsKEzLP4ajjfkXuCheXI2TyygEDN8fa86VPjTe5cA0vaMmKMnoX1kvvpUtF7Js13/m0iNifqHY3r7VBxjUVsD2XxPVO4kRc2WTliyxRBfTxaFReNWFrHBDV1uAWTlMdfBi2l5rT84aVKrneb9iYa9j6qlcWcby93pWW24hiLmd/OKnAOyoiqIrtPQoThWQLO6d//2RGrN0AqxNE6RLfgqNf063eOz8pydwoN8bSrDHwHf6O3dxxrTr+kZocO6eJAQrngq6wk4pMlGoGxIWpdbE+I5TmkrNmSDyCBctB+mTLE8A84Sf6M1Vy8qHuxjJFQ0UCGVxFkgsTOX65Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0qgJowurzjwW/4luTZ81mFVcfdf8g9Iq6xDDXJ2Vv4=;
 b=kZPTPubiHFxbBZdLULoOuCF9Wq3QOq8njxYJgkDntO/WbjDNymQVVGSg/HwksbKSQv9zver+pkr3LmWoUaunqYXaX9I0ohOt3cZn8/PjLPXdcOT0ABxU7UytY4+aQgB8xeRhfyUBFzsga7paiSchsVta6OK4x618SFYUaC2q22c=
Received: from DM6PR11MB3258.namprd11.prod.outlook.com (2603:10b6:5:e::27) by
 DM6PR11MB4091.namprd11.prod.outlook.com (2603:10b6:5:197::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.16; Fri, 2 Sep 2022 16:54:08 +0000
Received: from DM6PR11MB3258.namprd11.prod.outlook.com
 ([fe80::c8cf:c82e:e86e:2db6]) by DM6PR11MB3258.namprd11.prod.outlook.com
 ([fe80::c8cf:c82e:e86e:2db6%6]) with mapi id 15.20.5588.010; Fri, 2 Sep 2022
 16:54:08 +0000
From: <Daire.McNamara@microchip.com>
To: <helgaas@kernel.org>
CC: <robh@kernel.org>, <kw@linux.com>, <krzysztof.kozlowski+dt@linaro.org>,
	<heinrich.schuchardt@canonical.com>, <aou@eecs.berkeley.edu>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<Conor.Dooley@microchip.com>, <devicetree@vger.kernel.org>,
	<david.abdurachmanov@gmail.com>, <lpieralisi@kernel.org>,
	<Cyril.Jean@microchip.com>, <robh+dt@kernel.org>,
	<Padmarao.Begari@microchip.com>, <linux-pci@vger.kernel.org>,
	<bhelgaas@google.com>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v1 3/4] PCI: microchip: add fabric address translation
 properties
Thread-Topic: [PATCH v1 3/4] PCI: microchip: add fabric address translation
 properties
Thread-Index: AQHYvteiyC8N/dtDyUyl60vya8pnLq3MWjUAgAABVoA=
Date: Fri, 2 Sep 2022 16:54:08 +0000
Message-ID: <3dfc10ec5e852988c624445ad08cc430451d14fc.camel@microchip.com>
References: <20220902164920.GA349565@bhelgaas>
In-Reply-To: <20220902164920.GA349565@bhelgaas>
Accept-Language: en-IE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26fed14f-6f8b-43ea-d92a-08da8d03c0da
x-ms-traffictypediagnostic: DM6PR11MB4091:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0pp89vBuEa/JxZ3wJ8VL34VoJsrfnZErJvEJOT+qFdWbSKrP9WKkbsuC6wREr+tt0a0uW9dgVYBsDSlsKZqDa/AlPoWz3svtvTEGkADWlBN+q5LrDvcOpw6VCRrMHRQk6VruF6w5W1ISjTDIursPmQGIjSGYYMrVuii04uAPXhYihmT7caoUBmR1P0e8tG1Txh4s1e6RQIHHzGW8xnODd+JdN+01wsSwCPpG4krGwtu+QzvCM0VeI6wcZFe1tmUzEDm/aWAdFio6g2a6bRhQpD4QtIPfLy/UN9feIRTxFLZkB3LcFtx6TziDTZuXDEdIguHFs4HXolRayNAWnbnGkTe0N1+Dv+yhv87x0ucNWvbTYZxjvhe9c7akdOYpB1nfJL9bmIyHQjGn6ZhcN2iAOidTLli7gTd9eXUTJuCShWGmZElufHhHmfYhA1xSdzxtGNsUrDcHO3EEhlV+jWEe9Fjj/0wOZItltB+mucLAfrOxl+r/NPy6LbKDSKEX1K/SdQe+gTdwLon7sWN3U3nJZMMATUh0DwwBstVjNcpJe1uT7gT626bBSrTp6i2bj5JM5euSYkL3e8/EoY4DhH7RUapJnwZvGlZcswhSnQXNASd5uSJDh+hhdvgoLcEewFs7zatZG3ABvNYvYhqGo7EgslB2NrhybyCjrCszXMDTIK6jSE1RjvTqPQFqf0R6EG8Fh2BFeg5YStbBPZuQclCCeyz/Yum3y2dj9qMb3BYKlQO9baMTReWr1JkYTwGM9/Sk0wXEU+dfOwNVllkPUU6uSw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3258.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(366004)(136003)(346002)(396003)(64756008)(66476007)(478600001)(91956017)(71200400001)(316002)(8676002)(76116006)(54906003)(6916009)(4326008)(6486002)(66556008)(8936002)(66446008)(38070700005)(5660300002)(7416002)(2906002)(66946007)(86362001)(38100700002)(26005)(41300700001)(6512007)(122000001)(6506007)(2616005)(186003)(36756003)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWJCQXVWd3hZeUVhUXV6c1VUVllMVU9OVUxLWVh0cDllSnc2V1dwaVVCZVZU?=
 =?utf-8?B?V01NU3ljczFHMW9nOXp0clZqUHRJWmVWUGhtcG5ERmRZQXd2ZTVxaXZ1MzJ2?=
 =?utf-8?B?am9Nci91WXR0TWh5MTVpWE4yb0NlTnBsQm5jMmM4NkNqcTgwQ0luRFY2elU2?=
 =?utf-8?B?eGFRSFRYOVlrVXJCQ0Exb0x0cW5rRlgyZnNVbzZUbzVOR2hEaU96R3F4TS9Y?=
 =?utf-8?B?cVJKNmF2YmRTMktPOCtBaVE4RGRZRHJKVjlEM3Ewc0JWSW5zU1p5eDlHalNp?=
 =?utf-8?B?WDN0bFUrN1cwOGxHNEpUbHVrZlgxeXp6ODlVenAwei9BSU9USmR4N1I5K1A2?=
 =?utf-8?B?dkF2TjF5Zm12VmlkUXRHaHJJR2VFREl4Ynl2TkJRVmRmaWt5WlluUDRMaEtH?=
 =?utf-8?B?UGhsWjR5Zm9Gd05rWDdhV25Ea1ZpQm4yNWZBbklDYXJuMThKaDd1alVXQUx4?=
 =?utf-8?B?L2xJWVF3YWNEaUdneFlZWTRHOE5XMUs1eFNoM0FtU05LWGtZRnhzbVQvRW5u?=
 =?utf-8?B?TFJpNGR3dmltN1BPSmpCVzVVOHJ4NjRnTDdUb2h0TEJSVk0vN3lidnFIQWNr?=
 =?utf-8?B?a3I0WVB3WlZvTzBwQ21xM2dmdGpxcXpmSWErSXR2VldYZzBNWk9PSzlFaVY2?=
 =?utf-8?B?bTN3akx4WS84NnFlaU43RHgwQWswVExUdGtWTEsvSzBVQmIySFV0OXQyRHpl?=
 =?utf-8?B?cWt3RW1sRUZzWkROWUlQNEZ2M1I4UWdlVnZvd0ZjU2dEbmtqS2NzcjI2U01S?=
 =?utf-8?B?OS9ZVHBMQkFoOUgycCtZNzR3bWllNGdzMnFRd0xFR1hOYmx6R3ZwOVV3Qnpx?=
 =?utf-8?B?ems0UWJTRkhLQ2xFTTNkMFNSc01JMWxaeE13bVFGYzFldXlrbStmaFMwb052?=
 =?utf-8?B?RURXWUViNlovWXpZc2ZBbWQ1cTl3L3RTK2d4MWEzWlJqRU5aNDRoaWl3czhu?=
 =?utf-8?B?MEdZQU85NXVpeXRhOXB2R3hydFQvOTRFYWkrVUV4dlhlNjFtL0p2OVZSM2Nr?=
 =?utf-8?B?bGQ4QVViRlRTUHJvQytvUTExMUhBYUJVVmQyUDFqNGlqWmoyR1J6TnQ4U3A5?=
 =?utf-8?B?Y29yQW5UOUwwTGxtRzcrbHBQZlE1OVRweVpmc0lVcklGd1FqQldQZm4yNmps?=
 =?utf-8?B?OGV0UzNnOXNHYVR1VWJJZUcxY2pKaGVoQmZQYTV0MlY2NzZGOGhwbHBwYWxw?=
 =?utf-8?B?Nk03QWc3NklZdnlUUzdhY2VNNG5EVzh5K2Rya3lJMUJ6K09KczBibFM3djJJ?=
 =?utf-8?B?dXRwS2dDZENqbTdrcGwrUUdRTHI2a0RqaU9kbnByaGtRaHFqMXBHR1U5ZWpm?=
 =?utf-8?B?Q3NZcjVHQktxY0tDM1Mzcm4zNzNvbFJlbWFDZUVhOFl4ZDFwZHRyUTZPL1Jo?=
 =?utf-8?B?YldVcVd0SktEZFN6bFVvZmNiajMyN3h1UitGWUEzcitoR3JpOHVjRzdMNG5r?=
 =?utf-8?B?dHJ4QkswNktnalBoODFjVGFBNFJXVUtMRDRNcEJNTVBzeHcrZE56TjNuelRR?=
 =?utf-8?B?U0RBcFRJdUNYMmVtMDQvNEZqcURxUk85UllpQTFJWllLcTZ1ZEVrSmk0aFQ0?=
 =?utf-8?B?T3lxY2dGQ1JRYnBQWVJoUUtJZVVVUitpRjVjMTFXYVRsRlFJZDRGdjE3dGpH?=
 =?utf-8?B?R3BMMktSYUtEUHI2eXc3R0toNkpGdjdaclhHUUxreEdoRzJUU0tjRjVmLzNV?=
 =?utf-8?B?cTA5UmhYRWtlb2l2Q2VSclpFWVlLcmFndVhZUEpHdlJKUW0waTdnUzZLM1Jk?=
 =?utf-8?B?S0N2WmdZdjk3aERWcE50ZXlLdlcvMXQzTVlCMktPRm1YTm1wMm1ZMm4vUVdm?=
 =?utf-8?B?dlRCNFVjdThyK1pwZHpHWlUxZDdQM0E4S0ZtNi9YdStDRHFjTnhRK0R6SmxT?=
 =?utf-8?B?ZDJZSzJzNUpBdnh6bEhMbysxV2RScjRmd2o1Vndka2hjOGNsTmJ6YWJNZlRB?=
 =?utf-8?B?eEtNK1FsVnF6bEFKRXdxbHpTUWhaMUVKWHNreGxjalgyWFRIZ3pJTXVsQmgx?=
 =?utf-8?B?ekhkamNVKzJDWUoyVjdxSEM2VEhPTHRhaFBqbW50eXV1WUY0ZlBmcTNvL0xS?=
 =?utf-8?B?UHlFTFhSam8zayt1am0vSmRpcGFVQ3dISHlpZnhXVjJQNXdDMlNIellqZWc2?=
 =?utf-8?B?TEFVK3JNVHZhY2pQeHA2aXFvbVFCRnUrTGMwekJZeG9kQkNrUjlEOHV3RjlC?=
 =?utf-8?Q?fp36iv3WU9awJ/BtS7hLcMU=3D?=
Content-ID: <3285E135D52FB7449129E362B022351F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3258.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26fed14f-6f8b-43ea-d92a-08da8d03c0da
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 16:54:08.5864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ek02miPf+rLvCYIj1XWrStOPy6CObm61/y9otvKDclyBNQ0xJn4L5x5tKHZZ7oLvzvVvY0nBxLBzT/IzsJkuDhmsSFG92go3/2NQ++lLAtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_095416_197604_F4065B6D 
X-CRM114-Status: GOOD (  33.76  )
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

Thanks Bjorn for the feedback.  I'll follow up Rob's suggestion and see
how I get on!

On Fri, 2022-09-02 at 11:49 -0500, Bjorn Helgaas wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you
> know the content is safe
> 
> On Fri, Sep 02, 2022 at 03:22:01PM +0100, 
> daire.mcnamara@microchip.com wrote:
> > From: Daire McNamara <daire.mcnamara@microchip.com>
> > 
> > On PolarFire SoC both in- & out-bound address translations occur in
> > two
> > stages. The specific translations are tightly coupled to the FPGA
> > designs and supplement the {dma-,}ranges properties. The first
> > stage of
> > the translation is done by the FPGA fabric & the second by the root
> > port.
> > Use outbound address translation information so that the
> > translation
> > tables in the root port's bridge layer can be configured to account
> > for
> > any translation done by the FPGA fabric, for example,  on Icicle
> > Kit
> > reference design.
> 
> Can you please:
> 
>   - Make your subject follow previous convention, i.e., at least
>     capitalize "Add".
> 
>   - Add a blank line between paragraphs.  Patch 2/4 also lacks this
>     blank line.  Without the separator, it's just confusing because I
>     can't tell whether it's supposed to be a single paragraph that
> you
>     forgot to wrap correctly, or two paragraphs.
> 
> > Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> > ---
> >  drivers/pci/controller/pcie-microchip-host.c | 59
> > +++++++++++++++++---
> >  1 file changed, 52 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-microchip-host.c
> > b/drivers/pci/controller/pcie-microchip-host.c
> > index 7263d175b5ad..d78745eaa4b4 100644
> > --- a/drivers/pci/controller/pcie-microchip-host.c
> > +++ b/drivers/pci/controller/pcie-microchip-host.c
> > @@ -269,6 +269,8 @@ struct mc_pcie {
> >       struct irq_domain *event_domain;
> >       raw_spinlock_t lock;
> >       struct mc_msi msi;
> > +     u32 num_outbound_ranges;
> > +     u64 outbound_range_adjustments[32];
> >  };
> > 
> >  struct cause {
> > @@ -964,6 +966,37 @@ static void mc_pcie_setup_window(void __iomem
> > *bridge_base_addr, u32 index,
> >       writel(0, bridge_base_addr + ATR0_PCIE_WIN0_SRC_ADDR);
> >  }
> > 
> > +static void mc_pcie_parse_outbound_range_adjustments(struct
> > mc_pcie *port, struct device_node *np)
> 
> Wrap to fit in 80 columns like the rest of the file.
> 
> > +{
> > +     const __be32 *range;
> > +     int range_len, num_ranges, range_size, i;
> > +
> > +     range = of_get_property(np, "microchip,outbound-fabric-
> > translation-ranges", &range_len);
> > +     if (!range)
> > +             return;
> > +
> > +     num_ranges = of_n_addr_cells(np);
> > +     range_size = range_len / sizeof(__be32) / num_ranges;
> > +
> > +     for (i = 0; i < num_ranges; i++, range += range_size) {
> > +             u64 pcieaddr = of_read_number(range + 1, 2);
> > +             u64 cpuaddr = of_read_number(range + 3, 2);
> > +
> > +             port->outbound_range_adjustments[i] = cpuaddr -
> > pcieaddr;
> > +             port->num_outbound_ranges++;
> > +     }
> > +}
> > +
> > +static inline u64 mc_pcie_adjust_axi(struct mc_pcie *port, int
> > index, u64 axi_addr)
> 
> No need for this to be inline; it's not a performance path so the
> "inline" annotation is just clutter and makes the line too long.
> 
> > +{
> > +     u64 offset = 0;
> > +
> > +     if (index < port->num_outbound_ranges)
> > +             offset = port->outbound_range_adjustments[index];
> > +
> > +     return axi_addr - offset;
> 
>   if (index < port->num_outbound_ranges)
>     return axi_addr - port->outbound_range_adjustments[index];
> 
>   return axi_addr;
> 
> > +}
> > +
> >  static int mc_pcie_setup_windows(struct platform_device *pdev,
> >                                struct mc_pcie *port)
> >  {
> > @@ -971,14 +1004,28 @@ static int mc_pcie_setup_windows(struct
> > platform_device *pdev,
> >               port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
> >       struct pci_host_bridge *bridge = platform_get_drvdata(pdev);
> >       struct resource_entry *entry;
> > +     u64 axi_addr;
> >       u64 pci_addr;
> > -     u32 index = 1;
> > +     u32 index = 0;
> > +     u32 num_outbound_ranges = 0;
> > +
> > +     resource_list_for_each_entry(entry, &bridge->windows) {
> > +             if (resource_type(entry->res) == IORESOURCE_MEM ||
> > resource_type(entry->res) == 0)
> 
> Rewrap.
> 
> > +                     num_outbound_ranges++;
> > +     }
> > +
> > +     if (port->num_outbound_ranges && port->num_outbound_ranges !=
> > num_outbound_ranges) {
> 
> Ditto.
> 
> > +             dev_err(&pdev->dev, "Mismatches in outbound range
> > adjustment\n");
> > +             return -EINVAL;
> > +     }
> > 
> >       resource_list_for_each_entry(entry, &bridge->windows) {
> > -             if (resource_type(entry->res) == IORESOURCE_MEM) {
> > +             if (resource_type(entry->res) == IORESOURCE_MEM ||
> > resource_type(entry->res) == 0) {
> 
> Ditto.
> 
> I guess "resource_type() == 0" means config space?  I assume these
> entries came from devm_of_pci_get_host_bridge_resources()?  From
> gen_pci_init(), I guess there's an assumption that the resource at
> index 0 is ECAM space?
> 
> > +                     axi_addr = entry->res->start;
> > +                     axi_addr = mc_pcie_adjust_axi(port, index,
> > axi_addr);
> 
> How does this address adjustment work given that
> pci_host_common_probe() has already called gen_pci_init() to map the
> config space?
> 
> Hopefully you can use Rob's suggestion to just use two levels of
> ranges instead.
> 
> >                       pci_addr = entry->res->start - entry->offset;
> >                       mc_pcie_setup_window(bridge_base_addr, index,
> > -                                          entry->res->start,
> > pci_addr,
> > +                                          axi_addr, pci_addr,
> >                                            resource_size(entry-
> > >res));
> >                       index++;
> >               }
> > @@ -1005,6 +1052,8 @@ static int mc_platform_init(struct
> > pci_config_window *cfg)
> >               return -ENOMEM;
> >       port->dev = dev;
> > 
> > +     mc_pcie_parse_outbound_range_adjustments(port, dev->of_node);
> > +
> >       ret = mc_pcie_init_clks(dev);
> >       if (ret) {
> >               dev_err(dev, "failed to get clock resources, error
> > %d\n", ret);
> > @@ -1099,10 +1148,6 @@ static int mc_platform_init(struct
> > pci_config_window *cfg)
> >       writel_relaxed(0, bridge_base_addr + IMASK_HOST);
> >       writel_relaxed(GENMASK(31, 0), bridge_base_addr +
> > ISTATUS_HOST);
> > 
> > -     /* Configure Address Translation Table 0 for PCIe config
> > space */
> > -     mc_pcie_setup_window(bridge_base_addr, 0, cfg->res.start &
> > 0xffffffff,
> > -                          cfg->res.start, resource_size(&cfg-
> > >res));
> > -
> >       return mc_pcie_setup_windows(pdev, port);
> >  }
> 
> Not specifically related to *this* patch, but microchip uses the
> pci_ecam_ops.init() method to do a whole bunch of init completely
> unrelated to ECAM, which makes things really hard to follow.
> 
> It would be more readable to have an mc_pcie_probe() that does the
> mc-specific initialization and calls pci_host_common_probe() to do
> the
> generic stuff.  This is what apple_pcie_probe() does.
> 
> Bjorn
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
