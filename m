Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5543EC6FD1F
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 11:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bCS6+9UaDOchIUg1IOSZD26PeN8BfrRLJXhCni8wHBg=; b=RtWwKyoKGwtIXW
	ltoH2WMrV2tXuYkMyGbE1amLYhYGMmmUrTINa2DREFkrbfAGx+Bn79tcplV6D3/pY4wsoj8qqVfCh
	fAPGL/eCEZd10W4Eyw4+s42EwAzaRUPdmV3g/ePV/XEIKB3m0iK7UHAwdUo4LVpdXKzfnJCS4djq+
	64fdXaiV8Qv2LMt0ZfJAV6EmyEHVPn3lRLbu4gAf2GhoPHNBidjGyd2C4d6b7tBgPULoC29P55xZu
	ndilB3shobTibNJsHRQvvaSjW1QwFK+BU57w+UtY7WapEaGcmfRnCErulWiCuPfrrh/i8cEBSt0Wf
	0jVf0HBt2Ua09sLKfpCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcldc-00GDY2-0Z;
	Thu, 16 Mar 2023 11:19:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcldZ-00GDWz-1y
	for linux-riscv@lists.infradead.org;
	Thu, 16 Mar 2023 11:19:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678965553; x=1710501553;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=2cs7QT5UIUryD57eq89rn/JbdMBAqlJScWcDsPOn+bs=;
  b=p5SmwX1yEmtEpKNgoqLB6XG1hVDgzFcuvGnhYvcr7B+XhdeQNA58eETK
   QJ7wdUk8NkI5QewZkg/6XhrE/1UHAj8DRp897qAYknYBgwsp4oyRGYEvO
   EGFM8r7aX7ZQSwEyix2uunZFQlQBPIZ2+ImF9KErJDCS1YiNlR0UZ62/6
   KYzOFyUtEpcm0hKg6xHgHgX25EDg0qBRFMaLFE8eqCJz3GgaE1qKitQna
   EMpRtvWLnfrvq6J2dZZzyfbeyiBvDerk1veM8j8Y776gxQBIl2S2dWuuR
   djrkqsDB5qi2ULTVGW8U1J/ZxDlsnZOkxjAF2wAHgsH1PisjV4oMKlqsk
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673938800"; 
   d="scan'208";a="142360063"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Mar 2023 04:19:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 04:19:08 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 16 Mar 2023 04:19:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxlQVj4Rs2neVKavlbmsbRyPqmlPYsDqpnJlZBrsI4NS7HIZvkttWo63k/5dBTWfdzLkBH7eE2nHatHD15VZFCsgaiG2wW+W+du/EOpBrjuiDJw0auuZwnc3hwbEWSLHENSE3PD0pspLnESmSht05Ro/bm/CoH5r405qB8gUnNLMoBlFGPakLXYrDHLXo/5yWliuEaksa+IVFV6j7YT2hu/ogS8QLRcyxPlc4qIE2R+aNfDtk2qEyzAf19Ftqof+u9rp71CyOX2nl3IU2BLSPQOykrqAfH0B+xdTagwmI7fsCVORHFrn7yxc7L2x7N9LVXZ4aYaCmq9OeCMwcpVg6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2cs7QT5UIUryD57eq89rn/JbdMBAqlJScWcDsPOn+bs=;
 b=VoMg+K+jWUeHFcn/u/i5dQxtdC/MZIOl6YU+vWvrxVjwEqNb5+w50/StHVuE9IsqPp/Udp9uFdkAFk3Z2oV7x69UX1DqNQFWQr/wocdqbYIzTm+6kPJXuInq+lZ5RTbu3KmiX8Od9+GjfrUcj8R6DcXAoCyQv4aGIviw5oZLogDQChKh2zAOoB+Nd4DNdAQbx8RYr19zcf+Vb0oke69T8ikU9xXI2LzFWoo6HvEO/NZ263p7EWqyL3+5t/jXKibUZyJUSOvVucMQfgD/jDXNy4J3DkZzvPdi3dV82G1dKmLEUjVOCKhdc/AS8BmKnLd29EaD7QAxPWSxytDREvpV3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2cs7QT5UIUryD57eq89rn/JbdMBAqlJScWcDsPOn+bs=;
 b=ELWIG5mTx9wNPelX7dg00rlQoAozmJgqWe2zY1jGOL0B0ZoQVfg/PQ059cpQ6tiRfKdkAP5opplqEreSmBCoM5dSUXQ4dT3WEin8envK0I/zEedRNIB0qKYgayIcr5f+3EjhkEmvlMsIUrr0q+lbxIkBAEtgUeLBKNwyYW7tV2A=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by SA2PR11MB4937.namprd11.prod.outlook.com (2603:10b6:806:118::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Thu, 16 Mar
 2023 11:19:06 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32%5]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 11:19:06 +0000
From: <Claudiu.Beznea@microchip.com>
To: <Durai.ManickamKR@microchip.com>, <Hari.PrasathGE@microchip.com>,
	<Balamanikandan.Gunasundar@microchip.com>, <Manikandan.M@microchip.com>,
	<Varshini.Rajendran@microchip.com>, <Dharma.B@microchip.com>,
	<Nayabbasha.Sayed@microchip.com>, <Balakrishnan.S@microchip.com>,
	<Cristian.Birsan@microchip.com>, <Nicolas.Ferre@microchip.com>,
	<davem@davemloft.net>, <linux-kernel@vger.kernel.org>, <edumazet@google.com>,
	<kuba@kernel.org>, <richardcochran@gmail.com>, <linux@armlinux.org.uk>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <netdev@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <pabeni@redhat.com>
Subject: Re: [PATCH 2/2] net: macb: Add PTP support to EMAC for sama7g5
Thread-Topic: [PATCH 2/2] net: macb: Add PTP support to EMAC for sama7g5
Thread-Index: AQHZV/kfhGtRrWuiNUaQfhG/DfxxRA==
Date: Thu, 16 Mar 2023 11:19:06 +0000
Message-ID: <c21d29c0-b443-14cc-3c43-dd604a3a9ea1@microchip.com>
References: <20230315095053.53969-1-durai.manickamkr@microchip.com>
 <20230315095053.53969-3-durai.manickamkr@microchip.com>
In-Reply-To: <20230315095053.53969-3-durai.manickamkr@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB1953:EE_|SA2PR11MB4937:EE_
x-ms-office365-filtering-correlation-id: 6e7d4fd4-6813-410c-5736-08db26104190
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SeWtGH3IE2gIoMu0pymuSBDOkyNgoHxDH+uZswQy1yDDqfU4SCbOFxwXL7DtSWRYU2B1y0l197d1KbReadbjhnxLGGM8ctcPeIDtAeBLbNztkBHaYrtYGWIqGzZ0wdjZXE33RYnjkclErLwWSbGk5M2yT1d1PH1If4z2VxgMm05wBI3Nb6ApSXTkwcCxGvdct7mt7bT3Eoa2yOc76SQy2v2+tB3iKIgLJASVHzy07z+4gGsGNi3aXgeFaK1TYU6mNu/x5V40nfKEGqFax45SWU6nFracHSbhT4MBruNGXm+lT27yDc0XhKI+1BrNk3ckGgqFeqqFhkJoHsggTQ7qgdKHii4vHAjujPZdYMcgeaoTAz+MTa53w3IK8m9oAPx5JI94OzpQb8lN6tNMyq7IyGGoAI/hFRns/L99tcwABKLyY8BXgsUB623cJq7MF9Oj8ILfB4CPQlDGA+Qr+JjFYM3JvPLobfHXgK4XVL5bFtaTHRyEguiZaMnGq/jKaq/5aDU8po854K1+mDzMaMji52enOjI66xaZz96kT26cY6ibvS36Oou+xvfynEkaHsqVHDBxS8BTZDNECj34kYFLvJX7WozBiXlSWG//nNmpSZJCmDGTgcQNwl0t3lZRwvLvRDvTxTh5elBZJjfIrMSMh1DYb+l2FKyPAYLHilpSRjkjYinuDhsthVGm6dkmZbBnGZtpa3EUGMC02Ix1rxw+TanWdy0RHnNTeeyCJd3lPUkd4tGh/DDg7h5NDq0iyT7SSL9H7+WcK44CKWMM8gMYQSl8HCKUCG5BxKblXKyqxP5RNbBbyXRXeTD2/rGJ0hbe
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199018)(921005)(31686004)(86362001)(31696002)(38100700002)(83380400001)(122000001)(38070700005)(2616005)(53546011)(6512007)(6506007)(186003)(71200400001)(6486002)(110136005)(478600001)(26005)(66556008)(66946007)(66476007)(5660300002)(76116006)(41300700001)(91956017)(316002)(66446008)(64756008)(8676002)(2906002)(36756003)(7416002)(4744005)(8936002)(138113003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bkxJbmhwa2FFa3NRUkZSeHJHV0ZxTWgyZ2tOMTR5d2R6eWtsOWhtNDYydHBN?=
 =?utf-8?B?ZFBVVnpHUFNFWGZrV3dtNm1xZUk3cVdnUm9CSFNGQi9DWHVDOWFHYVRxMXph?=
 =?utf-8?B?cVU4ZWwxZGVEYVdNQXRuVWlCL2hBTGRUN2s2RlRsUVFBYitqa1pORWUwS2xV?=
 =?utf-8?B?L0tzRnF6eGJDYTNpYVUyd3NjNWhUUGpPclJtd3E5OTZKVDRIR1pvZzgrQVE2?=
 =?utf-8?B?bzIrVm9ZMGhvblI3QVdKRVV1c1lER3JjVjVxNm1DamVFZDdpVk50M25SbGJI?=
 =?utf-8?B?dUE2eEExVEdiT1dVRDg5OUFibUlRL2xqaUQ0K25BeXRwSGtWbmpSWHUyV2tR?=
 =?utf-8?B?K2g5RjZGejluL0dmeCtYZ1ZPVnRTMHZ5a3VqU3RjbHQ4V1ZRM3RCekw0SmRE?=
 =?utf-8?B?SkdMMUplUndLejlIUGhlZ2c5VGNzeG55V0xGNGJSWUMzYWYyU1V0QnNDMStT?=
 =?utf-8?B?ME5HZzhLNmNwaUttd2Q2SjJMY2JSNE1jTnF2ZlBCZjZ4UlNxeGVzbUZWWEJX?=
 =?utf-8?B?UFJnQkw1SVpDNjgxb1BSR01iNGhJTUlibW9OZm5WWUhlbWVEdkFtTVFSSGFm?=
 =?utf-8?B?R21jQ2lIbFVDZ0FkajhlK0xqa1kwYk1Oc2FuN2xJa2RuaFJ6UDQ4a1hlRVZO?=
 =?utf-8?B?ck5aSDNFQmdkaklVVjJ3eTBIUEE5WlRmeWl5T1ZiRTFoVUxmKzNEL1IvNVdZ?=
 =?utf-8?B?cms4b0hqSUZHYzFYMXFNT0YzWGc3Zi9NZTd0UWRtc0RXTWhuTTU3Z1JOUjFQ?=
 =?utf-8?B?ckV5NHJzL3JTNGRjaWlkSEhvb2NWSGJQb0JFT0pLMWh2NlU5UDNyeTFWWE1G?=
 =?utf-8?B?a1ovRzJEL1hha2Y1Y0duQ0JNeU9nemxURWcyakZTTk9CV1dVd1NJSFVma2hV?=
 =?utf-8?B?cE0vSmlNUFI0MGQ0RmI5TE5WQkRGdEZoMzJPbUhBQU05T25CN291ZjkzK1lh?=
 =?utf-8?B?OEV4UzJlTzB5bG93UVVhb0YxcGZCWmUzQm9GL2k5VDZBTGE1QVZrZkxwU2dS?=
 =?utf-8?B?Z3NNYnBTUmhTU1BZZmhTOWg1L2NjTS9hbldYblBSWFRQMnhRQk5obTN2KzV2?=
 =?utf-8?B?aDRyTFBYNjcva25tbk1iS1I0WXhhYjEvWGFvbmppVU9uY0JnZzVUY21mY2Ry?=
 =?utf-8?B?ek5oWnJMdXJXZlg3M09iVURvYTJwK0RmU3MwQ01nZis4bjNBdE5wYnRQVlQr?=
 =?utf-8?B?Vnh6aHNZdkVCazcxTGMwVEtqZ2IwSW1GajdkRmEzZkFBeDlzbzJLbW1qTkR4?=
 =?utf-8?B?akF6cHNkcDFQeTlqUTEveERWUGlHTUZTR0FiTUphZ2oxbHk2QkVnQVBWdkNr?=
 =?utf-8?B?TmZhZEJwV0tRa0t2YS9jMldOOE10cVlwcW1UdjBNV25ZaG04bDFKRVlWNlpJ?=
 =?utf-8?B?eGdISnB2azBnTzRBOXBCSzl6cE5vcDkyYzVjSnhQREwrRTg3NTNVR0F0SjU0?=
 =?utf-8?B?VGJFQnJlT2oxNDhSNkZlT1BkMmZSN1RnWTR1dkZVV1prWjJLSWUyVFZWYW83?=
 =?utf-8?B?b3hiaU10SUNrb2QwdmxJODJRcWYvb0NFNFIwNWRaZGdBNFN4ZjhPSHl4Ulhj?=
 =?utf-8?B?TE9wOVVwUzdBVlZTQWE0OXlIbGRYQTQ1djRmUlRZdEZIL1dXTlpxWkcva0d3?=
 =?utf-8?B?K3EwUngzR3g1blYwV1RhanFUNVVqVitwdFlLRklnb2VrOG1oZ0FNcEQzTXR0?=
 =?utf-8?B?MlRUUmYwUHZmTGxNNno0OXltazNXWnV2cmoyZGlTeXNGeHkrNER0YlpOZ0g3?=
 =?utf-8?B?bGJTL014ZU9RN2toTjZiWlJhSnNSRUFKUWVHRlpMV3V5T3lSMFladDRDNG5J?=
 =?utf-8?B?eGEwTWpLNkdjTW4xR1dzeEEwa1QrMnpoS1NSU3NOVWcrRUZSMXAwcDhoeFVQ?=
 =?utf-8?B?TWZZczBUNlozZGNlUjhlaFVCTTBUYVladnhQYWQ5bjNiZTFOM1VyaTd2Mnhv?=
 =?utf-8?B?R3pDNC9iVnZURGlneEpCRlNnZnpXRnZkY0dwZUVEUnVTMkwzRlRqSUsyMElp?=
 =?utf-8?B?Q3JyMFkremxZSDVvRmMrUVRqT1N3dGNlWVNRYjdQR3hKOGtkWVptVzRsdnJB?=
 =?utf-8?B?eWRLR3lIcU9CV25LY21ZYkp1T3d3aWt3SDJXZ25sdG9Pb3lPRDRLdGNjRDJ2?=
 =?utf-8?B?TmtKRWxWSm5LRHA3Y0dRblluL0hOZEN3VDVXcWdkV0FRVU9qZzhBZ3dSZzNW?=
 =?utf-8?B?NVE9PQ==?=
Content-ID: <E9CF919D73273742883E9322921C9469@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7d4fd4-6813-410c-5736-08db26104190
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 11:19:06.3742
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 75omBxq3RKzP/j8q9b6KwpOmKVZg+rUC/nGXzfnf5DRk9rIBaoVd9ozEnWxWuigtj/lJea6XE2G+vNAaO3bFsrNPLBqMYs+NAe5kBs5ozWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4937
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_041913_712401_59986CC0 
X-CRM114-Status: GOOD (  13.66  )
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

On 15.03.2023 11:50, Durai Manickam KR wrote:
> Add PTP capability to the Ethernet MAC.
> 
> Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>


> --->  drivers/net/ethernet/cadence/macb_main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index 27fc6c903d25..1dbee16fe90a 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -4853,7 +4853,8 @@ static const struct macb_config sama7g5_gem_config = {
>  
>  static const struct macb_config sama7g5_emac_config = {
>  	.caps = MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII |
> -		MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_MIIONRGMII,
> +		MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_MIIONRGMII |
> +		MACB_CAPS_GEM_HAS_PTP,
>  	.dma_burst_length = 16,
>  	.clk_init = macb_clk_init,
>  	.init = macb_init,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
