Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208E3C43334
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 18:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2Hkp97Yb0mRmo2PPQn33q8//80z7zFJ8wF6glqY+/ws=; b=pgsjqQXLyp4B3r
	Exi1NiQsf8k53StsSp1zOvWbuAxZkErsbHLretrgb9vkIpKw0gzAVlNTPdBfVya6MS0+y60FNCfEi
	mJxyGBLk8ZB1wiQcOxozexbpGZlYbBmH8XfNlV4ICkRRWZkNsbCdP6rNa9sL6hhr/rHjWVwBxpJX3
	OPITOPln0O9gpX7CbI+9ZpkrzireXKkCiU7Wmrk2pumn2Gurs6juqcA38JsGZVZFVZ5bfd3cYOA+N
	3KRv+4VgRejyj6FZMUlV4Os7G1JU6/vIMs5VXnhQX9xCwr49ieOUnr10pnBmklP5NKk9+KxjoOtZt
	NftaqKt1UTZTISB1UdFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9sgU-005KLG-4x; Fri, 08 Jul 2022 18:26:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9sgQ-005KIo-Jc
	for linux-riscv@lists.infradead.org; Fri, 08 Jul 2022 18:26:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657304790; x=1688840790;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=Bb0qxDM//mJ/Gg0Dj8L5udEvUkRZBthexgoOCqqMDnc=;
  b=IvW0nxPcQKu48fVV6Nv+IIspColfHVCoksfNO0h1vq0XR2KFzU+aO7nZ
   yj85VIPmseSL/w3uIiUe4pfLSLFDVvTDrww+XXSdro2B0eautA1DsjUk1
   m5+FnftInnLEL4HHnLMoNw9zbC2b+UmObdDs/lFAnWWuxcoqznktYP4ZJ
   RzD1ABkRKqA8y0iYBoynbx+KNYBZVnZXNOV747H0Gj9EcOLMyb580WHJR
   ovyz+6gKSwNwYeO348vbz+E4cSX0qrr+PsDkowRgTmwOLCp9OAXSYpyjI
   SNcM0GMCjrj70mchxHIk0gCip5A5hyek4gP7wICGO3GlzJPaC55Ky/Dd/
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="171643278"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Jul 2022 11:26:26 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Jul 2022 11:26:26 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 8 Jul 2022 11:26:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7t9G8pQ1Dg1KKYn0iVC1evDpQ7h6lRtxnDFhSSm4JXcomazVqveQN6pCIvP2Gidwl/5b6pQHKm0l79z8z75X92IMrpsGOSuEVE8RmbCGRq6jQMPo6vFYXUcjij33AaAYqy+TlEXj9ZKWJy/CsYxJWjq/jyrskLK/RMgONP9CfcmxaOdveWaF8Yqm7/H/hSzn5Mpxa8csF0SDfBStT+1DNMhqZOTIYwv6SIDWZkbsJH4RiiO3w0fw3rCqRF7mA6pfNhvoiPCv61+jki0fPvRCDs/5H4gqzXZ9WlVMXTWIePhk3L2viJBNFA1KI9MMjxU8GEO16dZtV1L68HxaHbKMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bb0qxDM//mJ/Gg0Dj8L5udEvUkRZBthexgoOCqqMDnc=;
 b=RuKX5OJeuNMo7jPK9ex6etJGFeDru4mHG++n3gORBWcYo3WnEGtXonyj5szCIgOEUb3y0JJMd7BY1B4KU0Ctsq1dMBk1nqnCYLbox6uIu/QWV8ZahO2KV6QXWCUEnYkDvnWn1cTDn0ThOAp4oqhe73L2WUoLmK8DcOdY0kTzocfok0Q+wCe0owkMLeYEdGP4rhKZqZbR4t3vMDtrBBFvCP//mWMNjLdiQcdUkV7xmVCDaALbxzRVlqz1ixViLQw+brrb8R7yCS29aGk8S12PccSVmDB6upuc5lo6BzB75iifu0mPmhz+xSxPiskN21BYEqikLQA3ywLgZjEjwBkjZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bb0qxDM//mJ/Gg0Dj8L5udEvUkRZBthexgoOCqqMDnc=;
 b=EAp5w2+XulSkcH2sdSX0Ss0m1IIoPqLIE29t+vwXHlXlIHCJhAsWX4divxtz91kw3oAzENq+NG+7ANyR/HTtlnKHpsDnJ/mnij3flmF4m/owXc3yjiy7416Llpbm5k+b3bAgmq6OfjKkDOgp9bGjUSSMjtm09inO0rtUAbcXATQ=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by LV2PR11MB6069.namprd11.prod.outlook.com (2603:10b6:408:17a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 18:26:21 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714%5]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 18:26:21 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@dabbelt.com>, <palmer@rivosinc.com>
CC: <linux-riscv@lists.infradead.org>
Subject: [GIT PULL] Microchip devicetree fixes for 5.19-rc6
Thread-Topic: [GIT PULL] Microchip devicetree fixes for 5.19-rc6
Thread-Index: AQHYkvg4LNVeea/w2U20A3b77W4ccg==
Date: Fri, 8 Jul 2022 18:26:21 +0000
Message-ID: <499f2802-8402-a466-d20f-5e9d8dfa2641@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9cc15a6e-1987-46a4-f9a1-08da610f5b73
x-ms-traffictypediagnostic: LV2PR11MB6069:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Tx9c2UB9mmIGXago+7fO41eGX8e8kb5W7kzOMzWGJcvnbLoLHyksFvmC1LJ6itVq9PXZ4TEID64noH1HmKimqexzfJAz2HW0NgRRr25yB24hKnVHY35QkCHBnOkOY+EmOggS8AfAWzFI8t+hx3QFyEvCEis5RCPMowgJB4G+I3xm0Pf88pW6x5ZU6lig7HmYS3e/UfvrpQeWCRfxv+xZrfzgqsOULsfMldW7kl2LIdJjW4TzVHVXeg43IOcEPSNg10WOx/GHXCTHQb837D1Cf7QvgqwdHiFOR9lPFmeROdVXf2GhdmT4Z+E9MEIdaneBJSCiqJ/fWC/EoFNjew4r1KUGc/basapW/CC/J1TCl0xgzqaGMl7G8+8z1Mxp7bGKlCH2BO7iP150/2apUkgQHKVmL02M3swnkPJ9FFF4q7foTimaI9XisUyp31rlirY5lGTllK4jswZ+EPp+SSNpvGsBFzHHNtAVxr/r3yzFmaXBXvkhWP7XL7hTj0zS7aPvsg8NZNkgP91blWoM6dEyrtXf8PUab/bL+AKX6npGpEutleXvZ74h0Q9+bvxUprlDVKPeFjgaGKjmjEjLA/lrZImdqvfko4fMapnQMC5r7OcR6s748IYap6uEddJ/RM+2PEn49dwLtfYdRALQbbt9K9o3RkleaKbzPuoKKYaZSX5DV4/0XNKx2Q63lfZojKkIj3Iv0lREhGPJVGZbYb9UIBZs/WJOkQFfrbm2z6FVOsuE3vy4GH6WqFvhgpUt3b7zc6ygnLzR31pwqzB2+/PMNj0JOxkeNJ3mMrag/vA/qKph87i9Ld+lV84tH+jzhLldrD5uNXwmJzZL5Gyjmlqvl1a6fzgb3YlqDk+4EOfEhBp0iOvCB3S49RTFNhnpxE8S
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(39860400002)(396003)(346002)(366004)(76116006)(2616005)(66556008)(26005)(8676002)(66476007)(64756008)(122000001)(31686004)(66446008)(91956017)(186003)(6512007)(6506007)(66946007)(4326008)(36756003)(110136005)(38070700005)(71200400001)(478600001)(31696002)(41300700001)(5660300002)(316002)(86362001)(38100700002)(2906002)(6486002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2RxUnhwazNoWGtybmVXOWc3dVZ4SXVYYjhpYmNQK05sZDg4VkgwbVEwMEdy?=
 =?utf-8?B?SEhvWVJsT0RRdlZiYWYzcCtCMVlHaUpsRGE2UGN4eUxabmMraWpCdTNYNmor?=
 =?utf-8?B?bThLWnlIZ2pyOFEwNmoyWllDUTMyWDlvTDhHSzFBZCtVbUczcHR0NEFGV3E5?=
 =?utf-8?B?a1J3YTNaUWMzeDZXc3k0MVV4Q0VqTXF6YzArTGp4eDFrTFpPenU4SlNQNEZR?=
 =?utf-8?B?SzdJUEJrNGhaWVUwZ0tpQlJRRVpvVktpanV6djJreGxrUTlWejB5OWpiUnpV?=
 =?utf-8?B?SllIQUdDYzdiQi9ROG1kVHBsTXNaTVJ2WitqSll0OW9tSmhxQ1FIQ2JHSUtU?=
 =?utf-8?B?OWRMTFoxTk9CajRpMmhJVmNHUmFNNTZuTDBhVU8xd2hyU1MxbjZDTFg0Qmtz?=
 =?utf-8?B?UE9KU1RBL0paS29NU3NTV1U5M2FOWHFjV2tlOXdEbFU4Z1FSNFRpZnpMaGJu?=
 =?utf-8?B?L2p3bDB1Smt1M0hPNEZhanBtQWFDV3NjUVdmaE95MXBScUtpUE80UzBJbDh3?=
 =?utf-8?B?TmNrYXRoYkVvWHdhdDgvbkNhZlZpT3dia2ZVR2tlR2FCanlYVFpjaVRySVh5?=
 =?utf-8?B?UndtLzZtUEtCMWNQVmF1Nzd2OFpGZTFGVUJHTmhRcXBFekdPd0ltSmptand4?=
 =?utf-8?B?ZDV0TkUzbVc5Qkd4QTFTd2s3ZDNhZzcxczZkMmNxMzFFeENySWttdm0yNm5l?=
 =?utf-8?B?OU1EaTJZYTJKdDl1bk1MOVh4bm5pRTNaVk1ibzVRM1ljMGxCeEdpbGVCSXRj?=
 =?utf-8?B?TkR0aytxdm41Y2UvelNmRlIrdTVnekpIb0t5bVZsSzN1aWxDK2EwcllEaERH?=
 =?utf-8?B?eFVONStsR0lnazQ4QllEaFE2T1N3dHpRMmxwVUMrMFpZTms5WWQ3WHhwZFZT?=
 =?utf-8?B?Z1hFWjJSNXVFczUyOEpJSlJvc05yZUJKRS96WUhrSGZVSklhNWJBdzM1TWF5?=
 =?utf-8?B?RXhrVnYreVZWa2ZZMUkrS0pZT3YzRVE3MTM1UTdMUlFRU2JaUVRIcnU4M2JX?=
 =?utf-8?B?MHVlc0t5cnFUQ1l6QS9adGh5UyszZ0dIc3VsaHg2d1M3cEpPdDJ1RlZzamo3?=
 =?utf-8?B?RnF4WlpFem42YUJmMkJDQm9uakZpaFYvNkVSL0lodjhHeWI0VEtZd2JpT21H?=
 =?utf-8?B?MVZlOVBydm1PRFFqdXJqZVNMb0EyRkhSNXNuRTV0THJETmVSQ3FydE9Na3ZO?=
 =?utf-8?B?SlVXOGxXT3JsUGhOVFRIVGVqamZHWEFxcVlaWEJsK0dTQ0xNZGVzVFBPK3B0?=
 =?utf-8?B?UmYwQis1bUVqcVBKcXJNUWkxNTdqbG90UEd5Mm9VajB5T00yWVY3QVhFUmV6?=
 =?utf-8?B?Z0lSd0ZIZDR0M05CN2FNZC9IQTZ1Q2o5eDRlM3ptRmlOd1V1dkREUnFqWDNv?=
 =?utf-8?B?cmF5M3FJZEhhb0MzR3hIRUVmWEEzNmIyVytuNlhoM2w0SEYwSmh1T1J1NGsx?=
 =?utf-8?B?UzQ1Z0ozN0JCbm5LeXVCMTFNZTN4QmkwYWFCMkhyeUszYTd6eXlLVjdsZmVO?=
 =?utf-8?B?RXUyRWx3bDJpS2FzMVl1RmxkZjZLTm5wV2VtZkhHSlZqVG5lZkpRTHNhZUYr?=
 =?utf-8?B?ZTZ0SWNMR1FsbHFYMjNQdTh4RU9WZ3BFdnFaMkU5ZFFrNElWeWh4dlc1WUYv?=
 =?utf-8?B?SzE4OGxPREVIYkExTEk2cjI2V3BDYktyQlB1SXJubnF3eEtHZzBzS29OWXVq?=
 =?utf-8?B?N2xjTjNqZUdiekFXMkhxMmtEYkxhM0JLUDZUd3Q1TkFqVWJLbExVTG9QSFdu?=
 =?utf-8?B?YUxLTU0wVGtoV3dacjZoVDY5NFAyMmhaZzZtUkRuY0JMejRaWFNudjBJU0NF?=
 =?utf-8?B?dkN4S1JaOXFXdGZmZGN0b0x1WWhUNGdzR2pTOHdJU2M3WjJzRVNQT3dpM3Vy?=
 =?utf-8?B?U0hPbkpHdnJmdWFTZkZ2M0hFT1ViTFJPMmprYWtKUlhxZGNseUNJdlBGQUtY?=
 =?utf-8?B?MFpDMUE2MEIrVGpqMWhRR3FRRXk0cEREa1NWVDZFTzVBMU43Nk56dSt4ZDhG?=
 =?utf-8?B?dGJ3clZvZUtBdFNkUDhlQVQwNXJYZ2Q2R3psRkJtM1NRdVZaV1BVaVpiWDFX?=
 =?utf-8?B?L1NmWi82eTF4blV4bWx5d1JRZnpxYXAxNU5iQ0RFV2VINHY5QWR1N1lJbzB5?=
 =?utf-8?B?OFA3MzdIaXhQd2xuUy9jOTZCaitPSGxlWXVDTTBLTy96K2syd0hXTHFXOHEy?=
 =?utf-8?B?c1E9PQ==?=
Content-ID: <BD95ACEB34A89947AE92AB8571075255@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc15a6e-1987-46a4-f9a1-08da610f5b73
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 18:26:21.2752
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wfEonCVTloxFPxf16iEKZX6izjIztBI3qzPGobBihAqU4Yu/leZxyE2XpH8PVM8MpdyCW1OZTzJlkWXnECZ/bHE1ntjvKIIdJETD7kDURQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_112630_902663_DF71FDFA 
X-CRM114-Status: UNSURE (   8.32  )
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

Hey Palmer,

Another single commit for fixes here. I have not queued the topology dt
changes - that's an optional property so I don't qualifies as a "fix".

Thanks,
Conor.

The following changes since commit 5e757deddd918edb8cb2fdb56eb79656ffc6dade:

  riscv: dts: microchip: re-add pdma to mpfs device tree (2022-06-12 19:33:52 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git tags/dt-fixes-for-palmer-5.19-rc6

for you to fetch changes up to efa310ba00716d7a872bdc5fa1f5545edc9efd69:

  riscv: dts: microchip: hook up the mpfs' l2cache (2022-07-05 16:54:03 +0100)

----------------------------------------------------------------
Microchip RISC-V devicetree fixes for 5.19-rc6

A single fix for mpfs.dtsi:
- The l2 cache controller was never hooked up in the dt, so userspace
  is presented with the wrong topology information, so it has been
  hooked up.

----------------------------------------------------------------
Conor Dooley (1):
      riscv: dts: microchip: hook up the mpfs' l2cache

 arch/riscv/boot/dts/microchip/mpfs.dtsi | 4 ++++
 1 file changed, 4 insertions(+)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
