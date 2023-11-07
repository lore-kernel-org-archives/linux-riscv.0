Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A7EC4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 08:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/lFwYoDRO6pjPBRZO1NTuzNKaCZxZdUhX9OBZP4NXQA=; b=JjKiXbFa/1R0U/
	JsrpaApLJlXESye3hcTdjsEY8Ai8wE/587H++AEi+86kIYmlzQQCNkhkjiFGQdpNw90y3QKzT/VL2
	LefWXSvxTLjQw+fuyYgecGibwxbIhbXbY/gJSBpY+Pyfm54D6KGOqaGLgmzJng1N6U2jCV4FgFQqQ
	JkA7p5t0SSCRRQrlEjkfXOi6OEZGfuR0xn+WbEdBgcWmMmwb+xLv8jq08x8SNcEe3XOaYlq+gj8Uj
	W1UdQ4GE1iFSkpQ75mdDota1oRD0nLO3gW/d9NAOqtOdx/V6e0V8SkvEfig+DmCt8kQZLipAH+66Q
	UYbyP/0WH54lTG5YRIrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0HdT-000qCD-0S;
	Tue, 07 Nov 2023 08:40:35 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0HdQ-000qBD-0p
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 08:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699346432; x=1730882432;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=I8tGhUXLWWrLD890xaAmbDYLt1oGcpJHGYjbpwXvLAc=;
  b=e9dgjF0OJg8Shac8dQt6lqUB32QVGU9NqYMGB1c9Q33WrGOYn/lwab8V
   pP3RSwc68GBatUMUNJkSPK2LEbwHigIFPnzTRkVS6wSk098kSLG9Vgr2f
   gQMWSU3opBTs/1uGC0SXgDQsBMhwNpGtBA+F+TZ6N97WS821373ZOmJSD
   8ae40pnL+Vg8/V00BynTMrrMphQXdG5GXmKg54xglgU5GOAHjQRvlcc+r
   5hXcs63sUxX0OclvmQGxZnfEj+aqZVDqmghE0HZVpUkBt+t3o3AT/E3rr
   HFEMnV5HJPV2PbZATXuNQRy434e4lc4b6dlmmpmWSrP//VkQ/N/fhpwtw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="455943628"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="455943628"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 00:40:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="879731828"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="879731828"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Nov 2023 00:40:01 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 00:40:01 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 00:40:01 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 00:40:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSZUcbAASb42vKMHJLZ3MttE8cDy3xTfc3iiN18fDX+p5KTCq8ljoz5r886/QUzx1IZtnvo5yqHiLbwIqRRoHHMehWAsc0sNy0qL4PF8Lxv0GxzULNJF3VYJcKl5Xa/+Oai6Jn3njRfnTiiC6Sh+tPGB624bBfGx6MArYme+FGRpxTxM/Duyd42v+tL1h+cC8FIdagJ4+1aKCYvIdidRhJWmqYN0hfhctwu2turhaloUSdWjaWFjJx/wE8y9OObevllt/RARfkaaU16l3l4AfHZvjflgv4iGoncULlga6KjXJW30mcsDAZUY4d2BIEHKo/S/Xx7N65ll7L8LjFf5PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8tGhUXLWWrLD890xaAmbDYLt1oGcpJHGYjbpwXvLAc=;
 b=V8ARbdwUSWsPTIo2eIt6EKs7G7EqZAOiRvi3mTnRWCA4Rb1wAIUvuFJjpo9EVmA5eLnA+HBkpGqSeYpbxLClIH6+W02uj+o9OUReeLJSnPIvC2eXL/qXuH7dAAP4p7fbEEN5zycp0JlvUNPrIvJD35vluYohVNMQdpv8eEgf8bbcB+fxVpeyEvjKAxjUebqOjD7AxsfmKoulx5BlZWvPbNbnNGK9GccsD7BU0uQdDrfrNfSGSVMd/e5yptrjBxmZ0a45dLfDaf2eSGXqG0vq8NJxyC64ROS1eGzAXFdSYXY4kzS4a7SssG9x7NkK5X+Nhpx1Wc6whYpoM1MuRyE3vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SA2PR11MB5050.namprd11.prod.outlook.com (2603:10b6:806:fb::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.28; Tue, 7 Nov 2023 08:39:54 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57%4]) with mapi id 15.20.6954.029; Tue, 7 Nov 2023
 08:39:54 +0000
From: "Wang, Xiao W" <xiao.w.wang@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Samuel Holland
	<samuel.holland@sifive.com>, David Laight <David.Laight@aculab.com>, "Evan
 Green" <evan@rivosinc.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: RE: [PATCH v10 4/5] riscv: Add checksum library
Thread-Topic: [PATCH v10 4/5] riscv: Add checksum library
Thread-Index: AQHaDRWIMTgHgrwMs0Sn2tmOLE3QH7BugYvQ
Date: Tue, 7 Nov 2023 08:39:54 +0000
Message-ID: <DM8PR11MB5751D86C9588FB838F49218FB8A9A@DM8PR11MB5751.namprd11.prod.outlook.com>
References: <20231101-optimize_checksum-v10-0-a498577bb969@rivosinc.com>
 <20231101-optimize_checksum-v10-4-a498577bb969@rivosinc.com>
In-Reply-To: <20231101-optimize_checksum-v10-4-a498577bb969@rivosinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SA2PR11MB5050:EE_
x-ms-office365-filtering-correlation-id: 8d54575e-8900-4893-24ba-08dbdf6d1d81
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bQybMhP2eeV3TO1ac35PVa0OP0Gj6SyopqdbR9q1dGx7Yh3GQBDezoefJYFQa0nWqN5Y429yTesfw8N2X65UFRrLdb7zqEv+cnpWQ19jNBvupI7gC0pESqUCcqhD8EDRYnpAApi991DRy6ANc578K1I1wgZ2pvxWo8bDUp547rGd6xEVdLqf0Hllj4exlfbvJKYnE6KT2ZjAlinJtUjYhjf5/9H3+O1bHJLhau0u3N29Z7qbBmTXtk1F5TA0eDa73aTHJLuibTkug/0k1DiQA7VLYEKGQWTir2Si4zS/plpg5+BHNH2fOgxOrn5DNqofdjWZdHpmCcF9IPzyWP9G6apvfMPdLw1ZG+lkZuhAgN9G6brVefm7kjpl693HPJ9eVpwJNffxJ7bSNiFW5R82JDwyMPVHVtBkqev7t8SwVmXStud7HVzwMxYTjiCqDtIknpzuLqtWVNrrGLnWEig4/FrPNZzlkLUW6UQ6Oslf34K79n4asMcx15R4YsxqMpDTvuiFhdhGfsp6VoF5m37FJwKHrVLYuasFCpDFiHXjYO+oMyu2wXWOB/Vm2BN9daixAVXGODxIbEdozQyz9MTrwvE1Y7r3okSlRNdsoQfoReA1/OPP6ds1AUJbdin/8KYE
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5751.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(136003)(376002)(396003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(26005)(53546011)(110136005)(83380400001)(9686003)(66946007)(76116006)(478600001)(55016003)(6506007)(71200400001)(52536014)(4326008)(8676002)(8936002)(66556008)(66446008)(66476007)(64756008)(54906003)(316002)(7696005)(7416002)(41300700001)(38100700002)(122000001)(82960400001)(5660300002)(30864003)(86362001)(2906002)(38070700009)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QTV2ZEkyeE1SUWYvMmtHQ2MwUFIvV0MxaUR2RHllemhiWkZoYmlWejI2MVE4?=
 =?utf-8?B?SmFoNkZ3Y0VOcE4weituclV0ZjlOTzdXYUMwRGF3RXlhZEhqTCt1bDJRNmhn?=
 =?utf-8?B?WCt0Z2dSdWp4YlhUV0ZzZTgwTWJjZ1o2TW5EeDdwdGcwT3VQV3BuU0M1dHgx?=
 =?utf-8?B?aTl4Y05PcXcxTXJ1OWxWMWpIQVRqOXh2dzhZcllQZlEwRnVyNDFXZW9mbG0x?=
 =?utf-8?B?Wno2NVUvMlErZTl3UWpvT0NiaTlyd2c0YnlaRGNJNE9uTDh5UjFtS1hvRWts?=
 =?utf-8?B?Z2Mwa0NpWXppdzZXMW96bitmRVFBb2gzOG90MHplZWVMN3c4OFVwZ2R0b2xn?=
 =?utf-8?B?OWJrNEJ4Y2V4NWFJTW1ad0Vva2Njc0lSQlR4R0RjaHNOaFc2TzBwLzYrNy9a?=
 =?utf-8?B?WWFNZG5qbXRZLzNRK3R3dklHUlExK2k1YlhVM1Y1TlpUTk9aMFoyMUVRUTh2?=
 =?utf-8?B?ZStpaE9vSGswTU5kNERJcUcrc0RUcHNKc2dXOUtCNUl4Tm1tQmptMkoxV1hB?=
 =?utf-8?B?MFVCM3BialZPSlRSa3l5V3VLZkp5TWlRbmFzV1hKSmRQaGJMYlJ3ZUF6cTBx?=
 =?utf-8?B?Wld6aVNiMHpYZDRIaldHdEVFQVl1T0VwalZWUDhvYXpVTzVaSTNWbG9pbUNs?=
 =?utf-8?B?QXF4KzhQWmN3NmE4ZThMR1ZncEVyODI0Z3BncGpGUW5NN29acGdCSDk1bldZ?=
 =?utf-8?B?R1haRmZuT2tnYWNiVGVKMUVDejNhYVFQb2FYTHdvdEFyZmVaQVhGOWpxZjRE?=
 =?utf-8?B?NHV3MmVheXBkQk54azN1Mkk2MlpqWHJSYUZtcU1rdFVlN1VROWk0cUtuRU92?=
 =?utf-8?B?YnNqSlQzcDNGaER5bDVFcjdWcmxhK00vRDAzUTR1UHZodUl0bmhaZktzRXg2?=
 =?utf-8?B?TWNpVzl0VGtOY1VleUtXa3p1citMU09qUEJhcW9sZE1Cd3l2Zklhd0hteXl2?=
 =?utf-8?B?eUZWaHM2Y1hnS0huK0dLWHR6ZnYyMDhHcE9oVlEvMTlqcUZxaEthcXRvK0hO?=
 =?utf-8?B?eVljVWhCWm9wVjdPcXhSMXZuMnNRTktqcy9Ea0NXaU5xSWVNRkZUdmtOd0pO?=
 =?utf-8?B?bVBxRWVzb2psTHhTMjZiTmw4cTh6cFpBREozRFhsUWhjYk4zZDVLY3cxaDlY?=
 =?utf-8?B?QW4zNG9kdnUzbjBzTjhVVER3VmpzaFRDT1NhZFBmZndHMElBbFFvaUlIOXhS?=
 =?utf-8?B?djB6SGU0SlJ0VVRYdGR5RHNoVkEyQUlzSjNJazVjRU1nTThVdGpTeHZQZnQ4?=
 =?utf-8?B?UDZnWmtjcFdLVlRaa1FSM0JadWo0ZlhVd3JoWVhxS2RaQmJMTFlSZjdjTkxN?=
 =?utf-8?B?aVFmOHBha29aU1J4RFNxMkpEcHI3TWV6RjhBMGdQUkQ2TjFaY3hPUnNtbFBZ?=
 =?utf-8?B?YU1aN0ZNZkxjNGwzNUwwZlhnNk1xUndrL3VJcnNQZExZNVNtOUNjMndMUkNK?=
 =?utf-8?B?Z1NVckVENGRnMWhOc2o1eEthNitVd3ZZWHZSYk5QcGNIZzMvNTJLN2wxYTBV?=
 =?utf-8?B?c0dvb2xneWRyanFqRTkyVXBXNmRwSDNMZDhzblpzN3ZMYnpweSsyQzUxWFdU?=
 =?utf-8?B?WFRkd2dQL2xJWEw4YlZSTUNsdFhIaE0wUTlvZzZnUzJEaGR6dGpQZ28zUGVj?=
 =?utf-8?B?Y1lqaEt5MFYxYTdGTTYyZytCRE5MSmNwTHplY2JGOFpmN2lrSSs1akJpeGl2?=
 =?utf-8?B?Z1Voak4yb3Y5a0daYTBYWXBSTzBUS0loeERGa0FPa2x3WTVJWDRONXdObFF0?=
 =?utf-8?B?SGFSNk5Mb1RWYVcvbzhqdGoya01mY2dTR3h5U0NrMXdDL2RsdzkwcFRnVExa?=
 =?utf-8?B?ZVc2QmZYT0ZlaWMvUDA4bTByTUxPeC9LQXdnQTViT3FEeFVnTDdzQUptREtr?=
 =?utf-8?B?Y3hBb1BadVBWdHM5NjNzTldUSmZ1UFJ5YmRtMlNkNGJlQTFGdDV2eE5xTlYx?=
 =?utf-8?B?YVFYK21ZcTErTTZIdUgxNHc3NHVrZkF0Ni9GZ3dBdjNuSEI0aFVtT3JMN2hJ?=
 =?utf-8?B?K05LNHZ4VWlVSzVmckJ3MG1OV3VGbXJ6NzhTR256WUlJYkdtSzhxMnhZRlJp?=
 =?utf-8?B?dmVzTXFvZEVnTnVtMCtYeDlYQnpjWUVNY1NVUnY4L3RUV3BKaGxoR3Rqbk9W?=
 =?utf-8?Q?idUmWJoKzViUveSoqxwHUXnrq?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d54575e-8900-4893-24ba-08dbdf6d1d81
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2023 08:39:54.2017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d8QxvnQR5zP2PA3PdE/eNoXR39bFuc3iSRiLHWC+DKkiY9Xsbb7XqCOeFBJI88jY0ZTjrjCacO3pQ6vGbn4vQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5050
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_004032_389416_F40D0D59 
X-CRM114-Status: GOOD (  21.94  )
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



> -----Original Message-----
> From: Charlie Jenkins <charlie@rivosinc.com>
> Sent: Thursday, November 2, 2023 6:48 AM
> To: Charlie Jenkins <charlie@rivosinc.com>; Palmer Dabbelt
> <palmer@dabbelt.com>; Conor Dooley <conor@kernel.org>; Samuel Holland
> <samuel.holland@sifive.com>; David Laight <David.Laight@aculab.com>;
> Wang, Xiao W <xiao.w.wang@intel.com>; Evan Green <evan@rivosinc.com>;
> linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> arch@vger.kernel.org
> Cc: Paul Walmsley <paul.walmsley@sifive.com>; Albert Ou
> <aou@eecs.berkeley.edu>; Arnd Bergmann <arnd@arndb.de>; Conor Dooley
> <conor.dooley@microchip.com>
> Subject: [PATCH v10 4/5] riscv: Add checksum library
> 
> Provide a 32 and 64 bit version of do_csum. When compiled for 32-bit
> will load from the buffer in groups of 32 bits, and when compiled for
> 64-bit will load in groups of 64 bits.

The csum_ipv6_magic() API is also provided in this patch for 64-bit , but not
mentioned in the commit log.

> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/include/asm/checksum.h |  11 ++
>  arch/riscv/lib/Makefile           |   1 +
>  arch/riscv/lib/csum.c             | 326
> ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 338 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/checksum.h
> b/arch/riscv/include/asm/checksum.h
> index 3d77cac338fe..f8f8e437a88a 100644
> --- a/arch/riscv/include/asm/checksum.h
> +++ b/arch/riscv/include/asm/checksum.h
> @@ -12,6 +12,17 @@
> 
>  #define ip_fast_csum ip_fast_csum
> 
> +extern unsigned int do_csum(const unsigned char *buff, int len);
> +#define do_csum do_csum
> +
> +/* Default version is sufficient for 32 bit */
> +#ifndef CONFIG_32BIT
> +#define _HAVE_ARCH_IPV6_CSUM
> +__sum16 csum_ipv6_magic(const struct in6_addr *saddr,
> +			const struct in6_addr *daddr,
> +			__u32 len, __u8 proto, __wsum sum);
> +#endif
> +
>  /* Define riscv versions of functions before importing asm-
> generic/checksum.h */
>  #include <asm-generic/checksum.h>
> 
> diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> index 26cb2502ecf8..2aa1a4ad361f 100644
> --- a/arch/riscv/lib/Makefile
> +++ b/arch/riscv/lib/Makefile
> @@ -6,6 +6,7 @@ lib-y			+= memmove.o
>  lib-y			+= strcmp.o
>  lib-y			+= strlen.o
>  lib-y			+= strncmp.o
> +lib-y			+= csum.o
>  lib-$(CONFIG_MMU)	+= uaccess.o
>  lib-$(CONFIG_64BIT)	+= tishift.o
>  lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
> diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
> new file mode 100644
> index 000000000000..3221d4520bbb
> --- /dev/null
> +++ b/arch/riscv/lib/csum.c
> @@ -0,0 +1,326 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Checksum library
> + *
> + * Influenced by arch/arm64/lib/csum.c
> + * Copyright (C) 2023 Rivos Inc.
> + */
> +#include <linux/bitops.h>
> +#include <linux/compiler.h>
> +#include <asm/cpufeature.h>

It seems generally we separate the header including codes for <linux/*.h> and <asm/*.h>,
We can follow the style.

> +#include <linux/jump_label.h>
> +#include <linux/kasan-checks.h>
> +#include <linux/kernel.h>
> +
> +#include <net/checksum.h>
> +
> +/* Default version is sufficient for 32 bit */
> +#ifndef CONFIG_32BIT
> +__sum16 csum_ipv6_magic(const struct in6_addr *saddr,
> +			const struct in6_addr *daddr,
> +			__u32 len, __u8 proto, __wsum csum)
> +{
> +	unsigned int ulen, uproto;
> +	unsigned long sum = csum;
> +
> +	sum += saddr->s6_addr32[0];
> +	sum += saddr->s6_addr32[1];
> +	sum += saddr->s6_addr32[2];
> +	sum += saddr->s6_addr32[3];
> +
> +	sum += daddr->s6_addr32[0];
> +	sum += daddr->s6_addr32[1];
> +	sum += daddr->s6_addr32[2];
> +	sum += daddr->s6_addr32[3];
> +
> +	ulen = htonl((unsigned int)len);
> +	sum += ulen;
> +
> +	uproto = htonl(proto);
> +	sum += uproto;
> +
> +	/*
> +	 * Zbb support saves 4 instructions, so not worth checking without
> +	 * alternatives if supported
> +	 */
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> +	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> +		unsigned long fold_temp;
> +
> +		/*
> +		 * Zbb is likely available when the kernel is compiled with Zbb
> +		 * support, so nop when Zbb is available and jump when Zbb
> is
> +		 * not available.
> +		 */
> +		asm_volatile_goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
> +					      RISCV_ISA_EXT_ZBB, 1)
> +				  :
> +				  :
> +				  :
> +				  : no_zbb);
> +		asm(".option push					\n\
> +		.option arch,+zbb					\n\
> +			rori	%[fold_temp], %[sum], 32		\n\
> +			add	%[sum], %[fold_temp], %[sum]
> 	\n\
> +			srli	%[sum], %[sum], 32			\n\
> +			not	%[fold_temp], %[sum]			\n\
> +			roriw	%[sum], %[sum], 16			\n\
> +			subw	%[sum], %[fold_temp], %[sum]
> 	\n\
> +		.option pop"
> +		: [sum] "+r" (sum), [fold_temp] "=&r" (fold_temp));
> +		return (__force __sum16)(sum >> 16);
> +	}
> +no_zbb:
> +	sum += ror64(sum, 32);
> +	sum >>= 32;
> +	return csum_fold((__force __wsum)sum);
> +}
> +EXPORT_SYMBOL(csum_ipv6_magic);
> +#endif /* !CONFIG_32BIT */
> +
> +#ifdef CONFIG_32BIT
> +#define OFFSET_MASK 3
> +#elif CONFIG_64BIT
> +#define OFFSET_MASK 7
> +#endif
> +
> +static inline __no_sanitize_address unsigned long
> +do_csum_common(const unsigned long *ptr, const unsigned char *buff, int
> len,
> +	       unsigned long data)
> +{
> +	unsigned int shift;
> +	const unsigned long *end;
> +	unsigned long csum = 0, carry = 0;
> +
> +	end = (const unsigned long *)(buff + len);
> +
> +	/*
> +	 * Do 32-bit reads on RV32 and 64-bit reads otherwise. This should be
> +	 * faster than doing 32-bit reads on architectures that support larger
> +	 * reads.
> +	 */
> +	while (ptr < end) {
> +		csum += data;
> +		carry += csum < data;
> +		len -= sizeof(long);

"len" is not used in below code, so the above line is unnecessary.
Can we consolidate the two parameters of "buff" and "len" into one parameter "end"? 

> +		data = *(ptr++);
> +	}
> +
> +	/*
> +	 * Perform alignment (and over-read) bytes on the tail if any bytes
> +	 * leftover.
> +	 */
> +	shift = ((long)ptr - (long)end) * 8;
> +#ifdef __LITTLE_ENDIAN
> +	data = (data << shift) >> shift;
> +#else
> +	data = (data >> shift) << shift;
> +#endif
> +	csum += data;
> +	carry += csum < data;
> +	csum += carry;
> +	csum += csum < carry;
> +
> +	return csum;
> +}
> +
> +/*
> + * Algorithm accounts for buff being misaligned.
> + * If buff is not aligned, will over-read bytes but not use the bytes that it
> + * shouldn't. The same thing will occur on the tail-end of the read.
> + */
> +static inline __no_sanitize_address unsigned int
> +do_csum_with_alignment(const unsigned char *buff, int len)
> +{
> +	unsigned int offset, shift;
> +	unsigned long csum, data;
> +	const unsigned long *ptr;
> +
> +	/*
> +	 * Align address to closest word (double word on rv64) that comes
> before
> +	 * buff. This should always be in the same page and cache line.
> +	 * Directly call KASAN with the alignment we will be using.
> +	 */
> +	offset = (unsigned long)buff & OFFSET_MASK;
> +	kasan_check_read(buff, len);
> +	ptr = (const unsigned long *)(buff - offset);
> +
> +	/*
> +	 * Clear the most significant bytes that were over-read if buff was not
> +	 * aligned.
> +	 */
> +	shift = offset * 8;
> +	data = *(ptr++);
> +#ifdef __LITTLE_ENDIAN
> +	data = (data >> shift) << shift;
> +#else
> +	data = (data << shift) >> shift;
> +#endif
> +
> +	csum = do_csum_common(ptr, buff, len, data);
> +
> +	/*
> +	 * Zbb support saves 6 instructions, so not worth checking without
> +	 * alternatives if supported
> +	 */
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> +	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> +		unsigned long fold_temp;
> +
> +		/*
> +		 * Zbb is likely available when the kernel is compiled with Zbb
> +		 * support, so nop when Zbb is available and jump when Zbb
> is
> +		 * not available.
> +		 */
> +		asm_volatile_goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
> +					      RISCV_ISA_EXT_ZBB, 1)
> +				  :
> +				  :
> +				  :
> +				  : no_zbb);
> +
> +#ifdef CONFIG_32BIT
> +		asm_volatile_goto(".option push			\n\
> +		.option arch,+zbb				\n\
> +			rori	%[fold_temp], %[csum], 16	\n\
> +			andi	%[offset], %[offset], 1		\n\
> +			add	%[csum], %[fold_temp], %[csum]	\n\
> +			beq	%[offset], zero, %l[end]	\n\
> +			rev8	%[csum], %[csum]		\n\
> +		.option pop"
> +			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp)
> +			: [offset] "r" (offset)
> +			:
> +			: end);
> +
> +		return (unsigned short)csum;
> +#else /* !CONFIG_32BIT */
> +		asm_volatile_goto(".option push			\n\
> +		.option arch,+zbb				\n\
> +			rori	%[fold_temp], %[csum], 32	\n\
> +			add	%[csum], %[fold_temp], %[csum]	\n\
> +			srli	%[csum], %[csum], 32		\n\
> +			roriw	%[fold_temp], %[csum], 16	\n\
> +			addw	%[csum], %[fold_temp], %[csum]	\n\
> +			andi	%[offset], %[offset], 1		\n\
> +			beq	%[offset], zero, %l[end]	\n\
> +			rev8	%[csum], %[csum]		\n\
> +		.option pop"
> +			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp)
> +			: [offset] "r" (offset)
> +			:
> +			: end);
> +
> +		return (csum << 16) >> 48;
> +#endif /* !CONFIG_32BIT */
> +end:
> +		return csum >> 16;
> +	}
> +no_zbb:
> +#ifndef CONFIG_32BIT
> +	csum += ror64(csum, 32);
> +	csum >>= 32;
> +#endif
> +	csum = (u32)csum + ror32((u32)csum, 16);
> +	if (offset & 1)
> +		return (u16)swab32(csum);
> +	return csum >> 16;
> +}
> +
> +/*
> + * Does not perform alignment, should only be used if machine has fast
> + * misaligned accesses, or when buff is known to be aligned.
> + */
> +static inline unsigned int do_csum_no_alignment(const unsigned char *buff,
> int len)
> +{
> +	unsigned long csum, data;
> +	const unsigned long *ptr;
> +

kasan_check_read() missing here.

> +	ptr = (const unsigned long *)(buff);
> +
> +	data = *(ptr++);
> +
> +	csum = do_csum_common(ptr, buff, len, data);
> +
> +	/*
> +	 * Zbb support saves 6 instructions, so not worth checking without
> +	 * alternatives if supported
> +	 */
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> +	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> +		unsigned long fold_temp;
> +
> +		/*
> +		 * Zbb is likely available when the kernel is compiled with Zbb
> +		 * support, so nop when Zbb is available and jump when Zbb
> is
> +		 * not available.
> +		 */
> +		asm_volatile_goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
> +					      RISCV_ISA_EXT_ZBB, 1)
> +				  :
> +				  :
> +				  :
> +				  : no_zbb);
> +
> +#ifdef CONFIG_32BIT
> +		asm (".option push				\n\
> +		.option arch,+zbb				\n\
> +			rori	%[fold_temp], %[csum], 16	\n\
> +			add	%[csum], %[fold_temp], %[csum]	\n\
> +		.option pop"
> +			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp)
> +			:
> +			: );
> +
> +#else /* !CONFIG_32BIT */
> +		asm (".option push				\n\
> +		.option arch,+zbb				\n\
> +			rori	%[fold_temp], %[csum], 32	\n\
> +			add	%[csum], %[fold_temp], %[csum]	\n\
> +			srli	%[csum], %[csum], 32		\n\
> +			roriw	%[fold_temp], %[csum], 16	\n\
> +			addw	%[csum], %[fold_temp], %[csum]	\n\
> +		.option pop"
> +			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp)
> +			:
> +			: );
> +#endif /* !CONFIG_32BIT */
> +		return csum >> 16;
> +	}
> +no_zbb:
> +#ifndef CONFIG_32BIT
> +	csum += ror64(csum, 32);
> +	csum >>= 32;
> +#endif
> +	csum = (u32)csum + ror32((u32)csum, 16);
> +	return csum >> 16;
> +}

The algorithm part looks good to me.

BRs,
Xiao

> +
> +/*
> + * Perform a checksum on an arbitrary memory address.
> + * Will do a light-weight address alignment if buff is misaligned, unless
> + * cpu supports fast misaligned accesses.
> + */
> +unsigned int do_csum(const unsigned char *buff, int len)
> +{
> +	if (unlikely(len <= 0))
> +		return 0;
> +
> +	/*
> +	 * Significant performance gains can be seen by not doing alignment
> +	 * on machines with fast misaligned accesses.
> +	 *
> +	 * There is some duplicate code between the "with_alignment" and
> +	 * "no_alignment" implmentations, but the overlap is too awkward to
> be
> +	 * able to fit in one function without introducing multiple static
> +	 * branches. The largest chunk of overlap was delegated into the
> +	 * do_csum_common function.
> +	 */
> +	if (static_branch_likely(&fast_misaligned_access_speed_key))
> +		return do_csum_no_alignment(buff, len);
> +
> +	if (((unsigned long)buff & OFFSET_MASK) == 0)
> +		return do_csum_no_alignment(buff, len);
> +
> +	return do_csum_with_alignment(buff, len);
> +}
> 
> --
> 2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
