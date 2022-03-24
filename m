Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BA2C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Mar 2022 09:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XtvvfgZNwqMZtOMlJInkfbqjEbnETJRi4kgKHJp/RlE=; b=3hQpVR6dl+P6C8
	1Xt1xqejCnJ9IMT+KlS82ta4wRoStqRlrPcsJoJPQYEeedHwalSWaSkouhClycQ6l7X3RCrhzhbOx
	BV6x7kv2WYPiTMADGRD8O2fXIMuyF8YgaKXUrVfMWDpaY8LYdlkY/BIsAjt4E0O8mjeFWmP2+j/fN
	H7Bggs95sGwDZCJn7MEx4iWjrpZlGNQOPWzlGv5HGSd2bEwi0RRolywH+38IO39ZWXBBqo4gkEWHx
	QN2glE9Gws+tfNpY5RN63UAO3bdAX/jW25+CG7uvoEkiVmAY0yMIcpViLi0TyHRTD7BmVThAHJOO+
	1lZ2ubZtIB5wp6j1DZrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXJuX-00G8x1-N4; Thu, 24 Mar 2022 09:37:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXJuT-00G8wL-Dz
 for linux-riscv@lists.infradead.org; Thu, 24 Mar 2022 09:37:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1648114657; x=1679650657;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=y3UPW/SDXedR90NbtEX+BLz6j5obhBVZubDTYoHcgBQ=;
 b=sM2NbbWO235njB2Wq4oJekX2oFU1gCiAN/UeEaRfGNwsnPPrZXvxyjF7
 7pRzREgJ/w6d8RHl9f9YATgjW3y8nThAT5b0bFRjblOjdXRozJFaAmPuw
 jZ4Pzy1eE9GOFw7hYEEvVPU3yi1YnCP6IAsdqZlUovFDsB4+r/2+aJhn7
 WDIIXNOcbnR0V5r3z5GWp4gWpS44bqKHva02bypUXciwdr+VShqLMvHwc
 /ln1sE7J1f6NI1Fntttxa9mj2IFcJtUW8GOHq4TI0yG0eWvopFuGRj7wm
 bjJMDSAJVl4BEHWPc/LDsrvdeAvrpG8nY9Ur9GOcupMYV7FYIY5LVgjYj Q==;
X-IronPort-AV: E=Sophos;i="5.90,206,1643698800"; d="scan'208";a="166958635"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Mar 2022 02:37:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 24 Mar 2022 02:37:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 24 Mar 2022 02:37:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jkv2jun2pUhy3DVeMXPwU994f0px9K/7PuSm5i2RSoMerPpv0KfxdYMfXujvblP6+FpxQpnhcmnCfO2JxfZCJinciBloLb063TgqFeXk/82QwIfPS5n40bmwP7Ivwl7KSB2/Ox/LJdC3iRIKgckUrP8ntHPtYNfmFSfjQapmrSQ7tmuAx4yoi71nFzbxepKAz+xHOWS3s1esWbIYAOJhpc36sZIZIhMqq3ia8kLRb82e8iFft5X7OuM9giD/0sqiWajWjYW+h2DEdby/TjrIKxiabQW/St7sqV7I4MBQLfVEz0LmuMRMQkndy6wddkUm7ICnd2s50gEWVH5fv/OjcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3UPW/SDXedR90NbtEX+BLz6j5obhBVZubDTYoHcgBQ=;
 b=XrPaBKqIZbTuw2YX5jnwqekbWuYBVuWnzCXs44JXOuADxHlkCeVNcTrUFr2agOAKChhFqhBZeMwfSd7lzsmGQDDa5JF27zPgJvfZOUdeKxzkottuPI7pQYpKH8U9fxPxMzifnqyxqnBlLGNvlk1Z+YrjFLQGmfFb+Hzhge5TFA7i1h5UVHOzQMeCdwNxNLMHuQN/8IvBfSGo1txBkYEw3Jtb++jmHTPmOGErgDAHp6uXEV/bz21qDBxUU2GJy9E6D7clM8qT32r9vyh3BLFf2yrj9KVnAbI/OAD7HfC828MoAzvOrfYfMqD3DH6WzUltyJ6K4+cupXpQBCFWBhUngg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3UPW/SDXedR90NbtEX+BLz6j5obhBVZubDTYoHcgBQ=;
 b=rN3ta8ekrKuXzk+F6Q3TN/psaqyJcLSaQ5Q+I4IRe4rTkmhZjK3CdTVW7B8jvbN15iWcwJndHiz5IB5B5H7ulTqVZqNOBBUjmPwuMrBp3Hi6x/ZqpodxcEBTvMVEb+NrgGbQavEtVGC8E65FcApkax4+QqFl5KaOxfQb3yp3YoI=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by SA0PR11MB4526.namprd11.prod.outlook.com (2603:10b6:806:96::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Thu, 24 Mar
 2022 09:37:29 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::dc95:437b:6564:f220]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::dc95:437b:6564:f220%7]) with mapi id 15.20.5102.017; Thu, 24 Mar 2022
 09:37:29 +0000
From: <Conor.Dooley@microchip.com>
To: <mick@ics.forth.gr>, <palmer@dabbelt.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>
Subject: Re: [PATCH] RISC-V-fixes: relocate DTB if it's outside memory region
Thread-Topic: [PATCH] RISC-V-fixes: relocate DTB if it's outside memory region
Thread-Index: AQHYPfD9vlSdDPqFi0CW4KmZ/C3YmqzOSr8A
Date: Thu, 24 Mar 2022 09:37:29 +0000
Message-ID: <ebaa9b4e-9e37-e2f4-2bee-37d324e7302b@microchip.com>
References: <20220322132839.3653682-1-mick@ics.forth.gr>
In-Reply-To: <20220322132839.3653682-1-mick@ics.forth.gr>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d320fda-24a7-4ffe-49cc-08da0d79ea06
x-ms-traffictypediagnostic: SA0PR11MB4526:EE_
x-microsoft-antispam-prvs: <SA0PR11MB452626385672FEC8FCDB2D1998199@SA0PR11MB4526.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iilojRwX+LK4A3lzWOgYzayyys9OAoTdUKMsXjtEz3UKQcNRQqKvow/W0ewB6Cy/DUGc6MTFTaBDGR7esBslKmhHIN6E8ASHULyXwHgT0fQMnFHafSYq0yccVLSCh1AORGPjmxRPZs6q+ONw8Gq21VsMnvACZBETH7x52tQECs5y8KV8JzH/kSa8l10bFrEHfEBPTDdYrHNRbyg7KDgmHOEWysfMBGMYJBNzBsTgLSPVC0LX09PqYzczytPhA/rDcAJFUJfNfP01KllZIsUZHFulmDtr7VnSCofY6214wq8xhSVyawsagtJBOcThIiUrUSQhPY/sGArjT3DDaTsXEYh1+xJYVZ4xFi5FCbltnb2uC0GkxusYJgPClUkav+daDyd9j0TPNcVXJqA3OLJyrP9Sb1Cts+yQ4G+b4IFSpTtCGGWCmHZCw/lWK6y2b5W8696P046IqMG+gJZ2Nd+RmwBC6yKsBNxh+YlEja84DsKyuD8p/Vlb7gcGZ+Zc8xMSAhlSpjISqwzhUnjr4M2LsVv4FKDS1pu5UXZ/hQYNcyIvrRKksLWMaGHQOWbPPictAGoh/UycAWQisooUs33ocWN7LsO6ve3h4+NcmoJIIjsouIEdbtiONDDmBekV1sgQOWTfXQkqWwo9ZoOU1d+KdP5NsHVEiMQpot8XDrz7Te/ivmoEwRw73RVt9ZS2MwZLh5iqtqpSSY00nthg1M5ZfWiiPKeNaHFLgDFC2dkV0pcaBZbXpy//tBj6RS9Gca0BBbwya+HZy5lyaXjEnlUwog==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(2906002)(71200400001)(36756003)(38070700005)(6506007)(6512007)(8676002)(316002)(91956017)(110136005)(66446008)(54906003)(66556008)(64756008)(66946007)(66476007)(26005)(76116006)(38100700002)(508600001)(186003)(6486002)(5660300002)(2616005)(8936002)(31686004)(83380400001)(31696002)(122000001)(86362001)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3BEeSt0UVRxQ0pwcGdUSHNMcUlHcU05amtuNEJiVHl3ZUoza1kvWi93Y0tx?=
 =?utf-8?B?ODJPU3cvWTNLTzFCT3IvclgxNjlNak5lNnc0VWpjcWpzQVlMbGl2RzBLLzZT?=
 =?utf-8?B?U2N2d0ErYWtJUDg2UkFZc3hJUFdHRGhjM3BnUzR4a1VLVmlvSXg1NHVqSi8x?=
 =?utf-8?B?enBTa3U3d0FEYTNQWk05b0p3clNZNVZQTTBoU3g2cGxBNHVCWE9QN2ZNMTgx?=
 =?utf-8?B?NForRmErODRVTXhWSDYvckdEaEt6UXRlend4SlBGMFlhSmprWFYzSit5RGlP?=
 =?utf-8?B?cU1pUmk1dW16VFVEVE9KSHY4NXlleHNSZVNBOWRKTVMzcFpQMU92U2VZbmh2?=
 =?utf-8?B?T2hzdGhQMzJQMDVPZlQwOVlad3dCMyt1dlhYOHBmSnFzWGNic2pncjFIY3lp?=
 =?utf-8?B?TFNoVWo0MDMyNlNldE54S2Vub0t5SWRtS1V5ZXF3aW1uUjVIbXZ5Z3ZyMUxM?=
 =?utf-8?B?Q2FJd3dqUjI1OXdzYSs3VjZ2M3IyMUZjQk45NXBVUFA2cU0vN0JKVXhKWWs2?=
 =?utf-8?B?K3hqc29VRXJTTnBRNThqTUFDa3RJZXNqeDJnbkphalJ5V1BVMXp1N2hBSnpn?=
 =?utf-8?B?dUNwKzVOYWJWeTNjUHExYUpNY1RRaHMxbXdtRzRTMzRRMzZEZkNRWVdmZUFJ?=
 =?utf-8?B?djZSTmhYQVhGMFQ0R3hydmNvMDFnQk9ydldnM3NhYUZIQlFMSDQ1cUY2NTUv?=
 =?utf-8?B?Tm41SjBFZGoxL0V0Vys5TGJYcXBjOXpLQkIrWmk4U0RrR1hvUzdDTitSYjE5?=
 =?utf-8?B?dUtucHhDZy9ncTNTRVJUamNFYUNWNGxJZDlRekROM3ZUSFdvMG5BNUN6M3lx?=
 =?utf-8?B?MzdUVzJxQkRHUjZXMWc3a3NYT2htTXljNURGSnIzVHdSOXlvVCt2R2JoeTlC?=
 =?utf-8?B?eGUzZ3VNM29JNkpuS1ZzZUZMUmhlRFI4TWxjK0hVQ2IwdjRVTGJLZjlnRVZv?=
 =?utf-8?B?bmJoUytNcUxwd2FsVGxiNzdYUUNYOVUvbTBJN2RjTnR4dE44ZnZQd1JrUkZ2?=
 =?utf-8?B?OVpVWmczSFBLWVdNTTAxL2ZwNHBkOVUrdDdGKzhnM1NjcGJOOUJrZVEwcFQ0?=
 =?utf-8?B?bFdaOHhjV1JaOG9XdHFadmVJRldyaExVUlhHbmxyb0Q1ZTFXa3V3T2ppVEhH?=
 =?utf-8?B?RHdQZmVXZHQyVkRKRXAxNHNoTUVxRzRiWHpMR0dNSXZCMVF0N1BkNUNYSVhr?=
 =?utf-8?B?VnlXRkFlYnovd0t0N05FdXA4VDN5S3RNWERPeTdPTkYyOENpOWF4Sk5PWmtH?=
 =?utf-8?B?SXFMOXZhYkFGMFlBNXNtSHBvck9oKzJVSGUvaVpjTW5hT1J5NTBxb1pVem9q?=
 =?utf-8?B?K0Zkek9xU3M5Wm4yQkEzMzcvblozTHZWM1J2bFlrZ3kwenladzlXdGw0MDRa?=
 =?utf-8?B?cWlmcit3dGxDL3FpbEgzSjFyT1MzR2ZPNGliTXRNZkc0WnVhN09JZy8wUXVY?=
 =?utf-8?B?empGaExhVVZDWk16aVN4c1VQZ3h4RzJJV2k3L2ZyaFJGNGFhc095VVVtYWtl?=
 =?utf-8?B?TGd4VFpleTJOK1VCOHp2Ui9MNkFuMElaQndxcmszMTE2ZHNSSmp3azNXV1FY?=
 =?utf-8?B?cjJ6b3ZnL1E3em51UVhqSmJnbnJoSDlwNS9NQmFQWUZ5Z2h4cHpVcUM3Vlpi?=
 =?utf-8?B?NjZYSjlvUlYzUVZxYjBCYkdlcEFqZkdjRnZBMlh2M2s0amdSVTFuMjloR0Vy?=
 =?utf-8?B?bTdHS1czYURqYW5Velc1bTZUNVBrbGpUamZNSWhPejJ0OWFFc3V5UHFCSzJ6?=
 =?utf-8?B?aWVoaEd1YjFFUEJQalNvRUx6ZGN1TzhiWEFjeXduVDNRZXNEd0VCeEhRM2Rs?=
 =?utf-8?B?Q3dWSExEK1dzVXVPdGE0ZWxqbUlheStQRVgzZDZGMmQ4R1EyU1B3RjltbnRn?=
 =?utf-8?B?NXVlUXh2SXduai85ZFp3U3ZBTzZ1dWR4SmpiNklBeTlsWVQrTi9KVjJ0b3Bt?=
 =?utf-8?Q?kePjb4zuadxoWg1tDhrUqg1HtEGYpuNx?=
Content-ID: <0793EB7036045E43B4E19E9CE432213E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d320fda-24a7-4ffe-49cc-08da0d79ea06
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2022 09:37:29.4207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ErXRpiCU5wtW7utEUYjkONaJ7bcrEUyW3Z3L7ecCZ8ULecE5pCEef2XnxWwe4+d+GHPx5L+711q8MDnA6DheTK9PTKCND5fXb8qHhRmJxfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4526
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_023737_579271_E6F088A2 
X-CRM114-Status: GOOD (  26.45  )
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


On 22/03/2022 13:28, Nick Kossifidis wrote:
> In case the DTB provided by the bootloader/BootROM is before the kernel
> image or outside /memory, we won't be able to access it through the
> linear mapping, and get a segfault on setup_arch(). Currently OpenSBI
> relocates DTB but that's not always the case (e.g. if FW_JUMP_FDT_ADDR
> is not specified), and it's also not the most portable approach since
> the default FW_JUMP_FDT_ADDR of the generic platform relocates the DTB
> at a specific offset that may not be available. To avoid this situation
> copy DTB so that it's visible through the linear mapping.
> 
> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>

Albeit in a backport, I tested this on a PolarFire SoC based board.
So I guess, Tested-by: Conor Dooley <conor.dooley@microchip.com>

And a lot cleaner than using create_pgd_mapping in setup_vm_final to do it :)

Thanks,
Conor.

> ---
>   arch/riscv/mm/init.c | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 0d588032d..697a9aed4 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -206,8 +206,25 @@ static void __init setup_bootmem(void)
>   	 * early_init_fdt_reserve_self() since __pa() does
>   	 * not work for DTB pointers that are fixmap addresses
>   	 */
> -	if (!IS_ENABLED(CONFIG_BUILTIN_DTB))
> -		memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
> +	if (!IS_ENABLED(CONFIG_BUILTIN_DTB)) {
> +		/*
> +		 * In case the DTB is not located in a memory region we won't
> +		 * be able to locate it later on via the linear mapping and
> +		 * get a segfault when accessing it via __va(dtb_early_pa).
> +		 * To avoid this situation copy DTB to a memory region.
> +		 * Note that memblock_phys_alloc will also reserve DTB region.
> +		 */
> +		if (!memblock_is_memory(dtb_early_pa)) {
> +			size_t fdt_size = fdt_totalsize(dtb_early_va);
> +			phys_addr_t new_dtb_early_pa = memblock_phys_alloc(fdt_size, PAGE_SIZE);
> +			void *new_dtb_early_va = early_memremap(new_dtb_early_pa, fdt_size);
> +
> +			memcpy(new_dtb_early_va, dtb_early_va, fdt_size);
> +			early_memunmap(new_dtb_early_va, fdt_size);
> +			_dtb_early_pa = new_dtb_early_pa;
> +		} else
> +			memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
> +	}
>   
>   	early_init_fdt_scan_reserved_mem();
>   	dma_contiguous_reserve(dma32_phys_limit);
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
