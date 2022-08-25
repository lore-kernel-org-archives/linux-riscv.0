Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6103AECAA25
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Aug 2022 18:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PxYscvhzLHn7F+2N7CLkYt8866DoUTSvEwm4364ZixE=; b=yIwF+QoH+jth/p
	Ru67Md9xOsVVhn4KnUtC3tTsknveyeKMcIzIdzpmrQ+hryG4W6CixIsEWtGBeVnvr/Pu1uWMtk5S4
	FWbRVRy2vIXQnW/ZhUhgTngDCLFX+nLagrtMZSCwpgUcIrmjvqPFFNq8AaKY4Rz9dLH9dLDfaaT1/
	sVXrRfd5hR35WmHNbjbOCnVtrUEaMyVRkQ+F7/a9UByzENGszo0Uc2X7nR7n83w+8IgJ5mCeKhlRC
	hbjOFcayLjIkLHhzTQ8eL8xAgIF1IdDv7NYFzIcP3saRzIJU41ra/0mF/zY7NLDmhMD04Oamz+SMo
	y1bzmM0wyJ7Z3AABWTjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRHQd-000gHc-Ij; Thu, 25 Aug 2022 18:18:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRHQZ-000fzD-Rh
	for linux-riscv@lists.infradead.org; Thu, 25 Aug 2022 18:18:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661451483; x=1692987483;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=bK6gjjaEEA5qrsGTu0b9hQW7RzU+tRw50L/Qf40MVp8=;
  b=Y4scfOdZDqFEm53tzEcibpJoOCmvg/8WEmnu0dW4NwRUaszNZ/inJ6Ec
   DLfuOn+/+wPuuO9Yv6cX0HkIrU7nt2q0rnEp0qDMXPUUIDxpvoLJ0ZLIv
   y4VPBad94L9Vkdd/600Uw2l8hMaWdziXrpDCn7zO6YXDZTjps8HUlCPqr
   iI7Uj4l4BC2mxKfRkZUODeG7ZLpzLOcE+tnrKuiGIrCBzUfgV1ZLO4WBD
   BjG+2cLrCvcMmFE/uUU1hLYoOqEr0Q+TQPkfn0MWc8vYfxOJt+0ZkVfaP
   8A/FbQP1UrWy1+gqwQuMAf7fa5q3uWahEXJh/njbHeVqsWguvOIOqhIa1
   A==;
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; 
   d="scan'208";a="188072185"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Aug 2022 11:17:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 25 Aug 2022 11:17:50 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Thu, 25 Aug 2022 11:17:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ectPUNczRzTn9B5wNaZwUkwf6SYFMx89qRPCpR7sCb8x8IEM9YBnqvB826UdRDGKZQGVwLAv0AGOsAcvzMMy5iw72UWy+0U6E2dQDA1Qs9ixS/whqG2Y1Dap14jUMERjw3gl/qSdvLC0ve4h6rV+zkqzPtm2rtTa54ovantYiWV6rLDhUsZbyusUNK4bRYTbwgcrsP8E6ddKRch1r5db7j7ftlj8jI7nbFVNj42eNqBPyDrW7hbVdC4xSmKdfupPXjHKjGO1g5Wc1/F0gVXFDM51NgPQnhOWTJ/gyXP+0MaOs/6vHyQkoJnF9ZyyDJKtBwI+Qb4qOofjz7/Jyh/stA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bK6gjjaEEA5qrsGTu0b9hQW7RzU+tRw50L/Qf40MVp8=;
 b=Uf2AX8ePaNtLUZofVP5N+4aKD1FOZ8WRtgRRrlqKWn+8YOimnINQAUMyxLCVLiXERSMd/2kO3YHIIH5jGPc1J2Mdn5tVkSm5nlhuloImdOBdLhoRNDOiD/XFDf3auV/HuQx726LCTv8ax5g7fibced8yX2X/jwz+dKN6uwA0icFae5/EsMYjcsrukeKoTP8iIs8SrtZX9WpqA4rNpg7QHbgkqO0ycCDEEQQ376wm9G2VMaHivjZPN6YRwdVJWV8igm0x6pAY98OEn7UFNFWKaNsy+V7Y1TnjnMIdWljgyZRjPj204ngQeZ8gt172zpnyETZXKbznvu6ceUBNQArKeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bK6gjjaEEA5qrsGTu0b9hQW7RzU+tRw50L/Qf40MVp8=;
 b=YIdiSOmfimkGMPWlkfGEBVYgR4/QvtkfQmdU5fwDCnqLR5QfzDcgo+BDT+UdBVDkGWewu0Iv18Jz1rmi4hPp0qAoG1gagihBc0/7nhpGOQL9Kb71nIS36A52QUn/ZxI8ZOdiCAYLR1/fBa5H/VLMHXsBuLgfEA6cNPV9T+TZDF0=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM6PR11MB2827.namprd11.prod.outlook.com (2603:10b6:5:c8::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 18:17:45 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 18:17:45 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@dabbelt.com>
CC: <linux-riscv@lists.infradead.org>
Subject: [GIT PULL] Microchip RISC-V devicetree fixes for 6.0-rc3
Thread-Topic: [GIT PULL] Microchip RISC-V devicetree fixes for 6.0-rc3
Thread-Index: AQHYuK75xCerVlTauUK5wzOX3HqAkQ==
Date: Thu, 25 Aug 2022 18:17:45 +0000
Message-ID: <c6b6cc45-f758-908d-9d27-4dbad29f50e1@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e68df8a-33ee-406a-260a-08da86c61bfc
x-ms-traffictypediagnostic: DM6PR11MB2827:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IKoWzJWHXrFkyitL+CLka7ZcT5VuEEo2QMUs6uBnjOES299Zj9D4lr/e4PUUmGEY54+ftsToFjo04FUMbHBHZ1IEmxpU3Qnb1vbkJKhR63CIxPOcJQ0GT27NRwcZnQBztB9757QBMWRFyHzz3LPapqRBHqB09sAJS35cNUhMUk0G7mLripRp3NTC5QGRB50BfpPLuXM24/pxixy6/BbGg8sIg4BR8judRfQBXW233YeibvptExQGSQR2wdY7GpE/nxCB8/UQ4pU7/Q1OZlf9sPZdmhpARFcPCM0eCRab6oGV6cwF+bhyE1lbBLmFZDR35Qj+JmWxHTLRMvFWeetMMQjFmWscpY+ISUwsuBP51Si+P0USOfklut1d6nfGnuR7d4oXIi4hf7k6xgevElqNFQtBGIPJ8E2atSr6qK6ikgrZuIiZOeKL7HqzYxH6x6oCcMUxDs7G93H4W9TlvoTuj9TjMnevqF+kMXRiVlz1dQHQFOmFETIQRBkr3MnERenyiVc3Rya5kFw+0Hqvc97MZhKPKlFuwDdbCMJiKnWM03QFRv4gO9BSbrQ2jdEq4/VhPRH2JQIXEFZDLIoc5w/FhMTbnApocJYRqQFdgCaakuUx0jxIyudZZBXebJI8QvW9mfnlPTaSmkTaSzhWVHENzeH7pwR9OB7c+mWz01PeRHebZngrD5zsHSRCqQnHjMvSNFw0T/aqptkJQt6M5oVBnhXkOCAkMyxo/Ipkr1cRolBIRk3xAWWQN/8Xv20dL33nM2F+zSuoklyxJqS0ieBCf6XGsrGRoLoazlYQEvQGky4JGmLsCYRWNQ/II2PjuQsunLSfoguSesvE/HWdLAEIZkI6GL5XR4ek7cull8J6uUjy5iifDz/TkLvpRchjJBuh8zJdgmNtLsmvb8IFvyjyFg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(396003)(39860400002)(376002)(346002)(83380400001)(38070700005)(31696002)(86362001)(122000001)(38100700002)(66476007)(6486002)(966005)(478600001)(4326008)(91956017)(66946007)(76116006)(8676002)(64756008)(66446008)(66556008)(8936002)(41300700001)(31686004)(5660300002)(316002)(71200400001)(6916009)(36756003)(26005)(186003)(6506007)(6512007)(2906002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TCtOSGI3MkVjSUtYSEdZUjhqUlYwNHNQK2VFaDBNQ1ZKbDdsM3hSOGpya3Qy?=
 =?utf-8?B?aWRVREk3TnhkQlQyWXo1T0lPMkErckJIRGpZVWFnbzJXZVMyVjA1bXB2U2sr?=
 =?utf-8?B?M2g5OFREcHp6TWI1MWViNmpnOVNwUkZhejZET2p5eWJqKzdlWWE4bThuTjlL?=
 =?utf-8?B?TkZkTTZjVmY5T2tKNngvUmFCVmNHak5abk9DM0kwTndtZDVzNkdwdVVlUUtT?=
 =?utf-8?B?THBnS1IrZ3JoMG43eFkwN0lmS20yK3I0Q3F3UTZmMEFaVnJJSEc0QlAyTFpS?=
 =?utf-8?B?N0N2VkxzVGgzem9pVllmdmFoaUtpL2Q2Mmt2WDhDRXF4eTJ2b2h3UDc2ZHRW?=
 =?utf-8?B?MkFqZVVvcXppNjFDQWw5U1ZvTFhpYUNPYzJIVU1Oc0d3UlE1TkMxd3dNb2lS?=
 =?utf-8?B?TWhCbGZXbzNEK1c0NXBpeWhDQjlRNitpNW8vaXZNaXZySmI0YjBtZkFKN1R1?=
 =?utf-8?B?VE4vM1lTbWswY3RTbHJZbFcyOHlGM0tPM2R4b3FvVEJvQWRRMkNOcnc3T3NZ?=
 =?utf-8?B?TUZ6UXJDZHIyaks0YzZCYTZpS0dWc1FuTC9ISm5tem55cCtEUXNkRUVlUEVk?=
 =?utf-8?B?MXFZOEdDSDA0V0VNT01sM2xDejRSdmxaVzNRc1dZSW9GNk5jY2ExcS9Ucy9G?=
 =?utf-8?B?N3NNaDJnN3pEY2ZaV21QNVlIR0FwTGJkTFBzSjFpeHdhM1dDbWErdVdXbjVj?=
 =?utf-8?B?REd5M241NWI2QmlybkhyeFRhc0cwdlBWbkJ4NVQyamMrL2VtVksrZVQ5KzE4?=
 =?utf-8?B?RGRkYmJVeVY3MzVveUZhelZucFArWkxWWVNsNUtZejZFTVhkckdqQmxhdFBt?=
 =?utf-8?B?Mzk4VW9mUDBwOEgvYzFWb01kWmE1STlSUS9jMi9ldm5JYlN4OXJFY3N6TTJq?=
 =?utf-8?B?NTFZUzJsaHdNZlJVY291L0VSVTUwRFA1cDZvS0JFVit3aTJlTGplUk9ES2dX?=
 =?utf-8?B?eHJJcW02THpkdyt0M09LQVloNmNidW8wMEJJQUlndHVta1g2VUd0RE1hemp2?=
 =?utf-8?B?MTRqR3B5NTJ3MjVEY0xKb2crS1A2VmlGTUlJQ3cwKy9nYjc4d3hucFZ5VHdR?=
 =?utf-8?B?YWVkY1BMT0diUCtzNzU5VzFheFg1Vms4bFkxTGhiRnd5azJVOGkrL2JJempm?=
 =?utf-8?B?VjYzNmhpZFd0RUljNDMrSXdlL2s1L0pwZTFxY3lWbDBiU2FibFZ5dlFsRTFk?=
 =?utf-8?B?MXUreGZrbUxEb2V5Y251ZGpjOE5JTHhOZm5HNGRONFdzR0s5OURwdk50SUlm?=
 =?utf-8?B?UWtEaFBMYU1zcmE5UVB4OVh4WWpDZ0VLbW5XQ0creENUL1hndy9rSXJDdjh1?=
 =?utf-8?B?TURGakFTWHpkeVVNcndhWTEyd1hEb3dmaXd0RVMzSTQ1T3FCWkFwTU9ZUjNw?=
 =?utf-8?B?NHlnSUYyeW5FTGtFK1ZkcXRhZHVIMFlFQjdUMnFZWWlQNWhEb0hRWjk0b0Rm?=
 =?utf-8?B?dHpnakdMdXZSamVLWHZ3d2wwTmJVTFhhSWhkOURwb0FjNURNOE5DdHpKby81?=
 =?utf-8?B?VFRmN2tsSkJ2NklEYTM3NE1QZlU3YTJhcUg5V2RXN0FocVZlUlk2Z3hmTXNO?=
 =?utf-8?B?NERMVTRTUUVyWTVsMWIyZ3N5MkhxeGEydXgrVFZBeGlNNkIvaW0yQVBKV01h?=
 =?utf-8?B?L2FrcUZtYU1JOXIzV3FZTUxXOFUrcEtoVjJSOVhFSGMyNXozSEg1NS90Nkcv?=
 =?utf-8?B?akpLb05IQmhpVTdTVWhjSGY1UHZORlRBK3lnWUtVdGEydnh5WHdoSnQyL1cw?=
 =?utf-8?B?ZFhGMDU3amJvQXlhSlBkSCsvT0NWN2hlamdEUnhpZ0tzcmRPQzBzejYwUVNk?=
 =?utf-8?B?K2hzMHd0UW8rM1ZUR1BGdVNZNk1NOVk0bVNDLzk3SUNvUDlqTSs3VENhQnZR?=
 =?utf-8?B?ZisvK2xhWk5LejRUelNlRXpURldyeGNBSFQ2OTZUbzJYRWtIT0ZBdm9sNExh?=
 =?utf-8?B?M3JlcEJDUEhyZklSK20wdmk5d3ZkK05sbmFpeTdIekpDU1FQWjZBeFFneTV6?=
 =?utf-8?B?S0RxY1hrd25vVUZzSmVKdWtYWGpIRnhIeHhXUjQxeXRab3RwRVZ3TEk3Q3ky?=
 =?utf-8?B?Q2FoRDZQdlZVVGlLWUVMWUwyVDdMZ3lHUTNFejZ4WnJSMjJ3YnAxYWhveHEr?=
 =?utf-8?Q?kKbW/wOoSEVYXkjHhL5UhWgzx?=
Content-ID: <E176D213EA68E6479D2B29A113B4A2B0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e68df8a-33ee-406a-260a-08da86c61bfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2022 18:17:45.7346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aoegFD4LrH6KA8imLhkOxyCGL36alOE9pDFBDzNthuCBrHjt3+Hvj3RH0DjkIGSScqPGMTwnpIkOxPC+BPfcMK82eRj3zlo5PMTv6CFR5t8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2827
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_111804_263760_6A79B28B 
X-CRM114-Status: GOOD (  12.33  )
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

Couple fixes here for -rc3.. Notably the patch from Heinrich as it
stops the console being /flooded/ by error messages from the l2
cache controller's interrupt handler.

Unfortunately, that fix brought with it another dtbs_check warning
for which I have submitted patches:

https://lore.kernel.org/linux-riscv/20220825180417.1259360-1-mail@conchuod.ie

On track for zero warnings in v6.1 though, patches are applied for
the others in the pci tree.

Thanks,
Conor.

The following changes since commit 69dac8e431af26173ca0a1ebc87054e01c585bcc:

  Merge tag 'riscv-for-linus-5.20-mw2' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2022-08-12 18:39:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/dt-fixes-for-palmer-6.0-rc3

for you to fetch changes up to e4009c5fa77b4356aa37ce002e9f9952dfd7a615:

  riscv: dts: microchip: mpfs: remove pci axi address translation property (2022-08-23 22:15:55 +0100)

----------------------------------------------------------------
Microchip RISC-V devicetree fixes for 6.0-rc3

Two sets of fixes this time around:
- A fix for the interrupt ordering of the l2-cache controller. If the
  driver is enabled, it would spam the console /constantly/, rendering
  the system useless.
- General cleanup for some bogus properties in the dt, part of my quest
  for zero dtbs_check warnings.

On that note, the interrupt ordering adds a dtbs_check warning - but I
considered that fixing the potentially useless system was more of a
priority.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (4):
      riscv: dts: microchip: mpfs: fix incorrect pcie child node name
      riscv: dts: microchip: mpfs: remove ti,fifo-depth property
      riscv: dts: microchip: mpfs: remove bogus card-detect-delay
      riscv: dts: microchip: mpfs: remove pci axi address translation property

Heinrich Schuchardt (1):
      riscv: dts: microchip: correct L2 cache interrupts

 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts | 3 ---
 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts | 3 ---
 arch/riscv/boot/dts/microchip/mpfs.dtsi           | 5 ++---
 3 files changed, 2 insertions(+), 9 deletions(-)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
