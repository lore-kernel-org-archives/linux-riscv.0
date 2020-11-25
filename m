Return-Path: <SRS0=npMT=E7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A2CC56202
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 11:04:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F7EA20665
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 11:04:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VQFFcpU0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="hFqRUCkk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="fmbnxcLu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F7EA20665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=qkV4q15YQaZaUSBcvPIOqnITteoHCyHRgwJNTa9/IaU=; b=VQFFcpU0osu/r5C+gbodVL+A3
	0K5f/A2AfkKjN85VIVg5+iR8ntsWJB5VT8MStecLo5MwIghmFe7qv1WDTjey5BwyMlsedMRwQFZZ7
	At8lldHDc6/w14uvC20/OuMmhhFLQZ8ag4B9TfR3HFZe+yjfJQ72M5GxxJ18mnUwxSRHdhpv4WQ4J
	ixEmEUDCJo6yQZLPsRMGZb2wgEgvy3KqovSipiTqQ/mtm55vhGvClgBHmGgqxuttIAsXPXxMPyomX
	SxgFueUMhIJU+SLKGSqzX2NkzZYg/1hD+ooJnF8a2df0pOiCY4r0uSKMWRiTNk6q6jDLNDKlrzUWt
	9OOeRo5hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khsaq-0006UR-Ol; Wed, 25 Nov 2020 11:04:12 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khsam-0006TX-8U
 for linux-riscv@lists.infradead.org; Wed, 25 Nov 2020 11:04:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606302248; x=1637838248;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=W82LwDquxfH8iB/lXVAGqyVlLx9MIoyJKrVAzJXi/rY=;
 b=hFqRUCkk/EDvY2DiR7s67CgA9gShdVO2uO3DxyqRung6LTnaK1maP1ZH
 NhzTNHZH5M3dR5qN8HmZZlUYWwCcTF8avVZVZXkntbBqfA4RkKzVI+jjl
 i1Bh+6tM1y2cICCOCVmJ5qsfIxzvneas1uIEJyVKeeomdJefuC8sE7qo9
 98FT5KsiC6ev8LOsdw/NGpkFzTqrkOm7r4LToXd9i/RuVMjwHbGGLWpLh
 Qfg491CiORNbrUgxB00ek97sVqU78QbcEqWH7ERHwPRvmk0dnHVa5X3RD
 sOh67cYToRCT45LgZrTLqkRckr5JxhLjjuMrp0B8FCxloETzoXvPLz9lc Q==;
IronPort-SDR: B2kJH400YpOw5OM0aaU5+NtyhT8uUqFjs4HYIK/MNO4FdmAbgnpdN7Xxn9xRMVf8B05SXclOWJ
 y8NNgMoYpqGTCtm96mGWnfHDlXQDgf0VnZY3rLSwgAXX9Cw6f0qfXpCQIxuJac900ZM1Ecg+Tm
 g1AvdxKxYqrUAq3c2eSAzLorHWoXtosN4VX4BnPdHwEkg5dR/+A+GSeHxv6wNQiZo/eLGGn0zl
 Ut8R5ZxcJgoL+HYWQyA3om4GvpN20UOhp1WGCf716V7h/ab4L+RR/S6ECjQsDLQWifsANsM0w2
 C5I=
X-IronPort-AV: E=Sophos;i="5.78,368,1599494400"; d="scan'208";a="153377713"
Received: from mail-mw2nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.107])
 by ob1.hgst.iphmx.com with ESMTP; 25 Nov 2020 19:04:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cORGYl0wFOtCnndiy9Ob4cCHPgVUtbDASqoes779nj/Xgavxbbhj7liWI+4AbDLIQbqtE0gy0Rm1bQ1W1Jp/lwiUgOj2EyBgKxxF9eMjqP3HfoPN90PDnFep/a/4/OUYXReTlA6igrHEle9GvulWYMRV02qQAIFSGCIqcR2O1c1/jFcwkL+lJXGo4AmFMVLsB7VVnPXvG7/Tl7DBVB0ZYThM0Vm+bAuGjg2mxeqCBp6OdhTVt8+Pm9nLVcRd0RwA4GrTlGFHfE9SU/lFq+YGUORz2Ymn7eb4mJWk+IV4Kj7Fl24MooYA0edxX6WWIqhcmejlg8roEQGzWNt1As6Gcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Is4ObZmaghzYf1QcIxdJjQVJ/cdAfMa4mXpF300q2gg=;
 b=Xh3oYsKBjUSpto0QdgQa3p+sp/faEBQ1zUdG4M26WYz2YWN4zso4G5ruBYcHqT1YUK00+U4BY1TpmPhaobzb9B/EkYCJRyD+XPh6tenBdcLY0IQLq95sd4naEcJFdyLFdzUAnOF7AKZZ6BqFXDm1+sgGzY4qx5ddn31DfI0jDeiI+OtuclahPAkX9CU9Kkstdutq6hoKmRRXKtIQnSaIev294pNxnFNEQHN6EjkhSWY44isu+ScwZ6bnePNtl0beI/VcZj1/7gU4mRTuDI/km3XXNRdq/bGe8MD+s4riCTt9X88c5yG9q9z/RiO1TGPTMczuBipIiu2ti3F9XtsKbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Is4ObZmaghzYf1QcIxdJjQVJ/cdAfMa4mXpF300q2gg=;
 b=fmbnxcLuL0QQt+EqIhB2TfGgeKpUxCRYu+iAS8fPwI+/8wZIngCujdDWeFekOhK28G858SRQNbA2pcvVeNIiKkd6D3TTnpn3zH3IYbN/zAtM0aEzw0xUOd6XZJbNRGvXT69faKobpyLn9fyUlS+BWKfvPofur7MZEVm64VvOuVY=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6855.namprd04.prod.outlook.com (2603:10b6:610:a2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Wed, 25 Nov
 2020 11:04:01 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3589.022; Wed, 25 Nov 2020
 11:04:01 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] riscv: defconfig: k210: Disable CONFIG_VT
Thread-Topic: [PATCH] riscv: defconfig: k210: Disable CONFIG_VT
Thread-Index: AQHWwpO1HQiFqsmnr0WJzbSNTitMeQ==
Date: Wed, 25 Nov 2020 11:04:01 +0000
Message-ID: <CH2PR04MB65224683CD7E6C63D60D05BFE7FA0@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201124185738.3541314-1-geert@linux-m68k.org>
 <CH2PR04MB652231C5B82E9F8184F496D8E7FA0@CH2PR04MB6522.namprd04.prod.outlook.com>
 <CAMuHMdW9dySq3y_Uixv8_7e+Pe2VKw4iGV36mx-DbX6-yzk-Gw@mail.gmail.com>
 <CH2PR04MB652268FD0FB44AA5DF36ACFBE7FA0@CH2PR04MB6522.namprd04.prod.outlook.com>
 <CAMuHMdXEzo4EOw_=MgskNXPrbkP4Ui+dHKZ5iyJ04h453BUAhQ@mail.gmail.com>
 <CH2PR04MB6522E6443C6E12CD28FD1A30E7FA0@CH2PR04MB6522.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:7477:1782:371:aeb9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2bedcff4-abca-49da-961e-08d89131d097
x-ms-traffictypediagnostic: CH2PR04MB6855:
x-microsoft-antispam-prvs: <CH2PR04MB6855227F077FEBCC12EBEC6EE7FA0@CH2PR04MB6855.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 672VHF+LZXwE68mjf1MzPizJa+4p2kbWzJhJfC3jgrZ2jikcWKqOoPnMv2se09g+KAsIYcsxxyhuaVuolywJMcLntEd6q+jBQKZUVicCS+kn7xevxeIrW7SZw2pUaUN/vqChK0AcQXvlhqy5oCbyMOy8USF6zIEdqs6WuTa/GoTeNntNOyKPsHqalXKCQ/Ss+fy0UUFEmAZtNvhvXxqRphbnSgSyA9GF+Wy1T8qTTGQyZgXTMNEaH00h9g4xAXc3JNFCp2IrpQpRgPec//oGW4Gvo5VI/5gq0ZbO5aNhzfJVQvW74XJm11yBLCxVm7jMIZ4naMcEkYxCIdBLFrxdJR82ONFPhZsU8YRQTl+SEh00nVjwkbbiVScFP/EWFgixBt84mM9cTUCF1m5d1hgoWw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(346002)(39860400002)(376002)(6916009)(9686003)(66946007)(76116006)(64756008)(478600001)(66446008)(53546011)(966005)(66476007)(316002)(91956017)(71200400001)(5660300002)(66556008)(54906003)(4326008)(52536014)(83380400001)(8676002)(2906002)(8936002)(186003)(6506007)(55016002)(33656002)(7696005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?DrnTPnqWUy7LgeoqgX9l80MP8JimP2VVqvUYU02sgQWROqu765DCxCZcHYVk?=
 =?us-ascii?Q?fVqLY2mjO7rvrYPYM5SHHUCmCLSay1nQMZM20Gybml3cUmSreN+VEzZj/822?=
 =?us-ascii?Q?1vhGghLqJjs+9jHku6bedBRM6f+O2Sph4hB3TQHY0NEDs0xE8515or8XC6zo?=
 =?us-ascii?Q?h8p4nh3ciYGnq2CwTrP0g/8YqYtgJaxuYZv04kdLKogyPHqYThsDf8PA8zhs?=
 =?us-ascii?Q?HruzvBQUAqqnCCRoRnfbvLyYg46EGS/bXRYDLsgIRs/o5NzbNCPxutX7L5mN?=
 =?us-ascii?Q?8VXmvj9sn1Ti983PVLEZ/ntYQ0wpffhse0ax17pf1BawRxqA+RBR8u/d5qo3?=
 =?us-ascii?Q?paCg80TNpZDF4k0zWnbE5ZQgA7Q/AKp9XlffJM0m1UwHbi9/ywrt0Y1Mh2n5?=
 =?us-ascii?Q?4AlUXxe1tl3qNbdg+x/wUlxOELndNtdzCR/DGxDjkD1SBI6yA6LbC0GVBh63?=
 =?us-ascii?Q?5EiyFAPYjN3EQ+m1ZbOCPtx5otlwTeCVBSdc28juFXPppFfsAq+XoOVkBMW8?=
 =?us-ascii?Q?p35uUiJZO0d5CKN5hJP76RKINfulSQ5Ntq0rMmbZLXRuyM85lwVJf2L7SePO?=
 =?us-ascii?Q?3IarAY79clmPFK26m+uOXIw8YOGF5f0Lhyw1yijVadlFCoEFrogQSQ2yvQ10?=
 =?us-ascii?Q?YZso6A8eGFvWqL/8HDqTjBTxpssqY3UMonkI7EVwbJkka5cHZYKzcrAX1SFR?=
 =?us-ascii?Q?ykOQH9tx7YFsyoNjJT0/lxO6JxIjnnHFgl347CwJiD0BHr/49BicCnTp5R9P?=
 =?us-ascii?Q?fAo1ln2Qw5n7HYyT0IyDsHbSfDJsWCcGpJOBIu2xutiNPAPFtqmr87gtHDhh?=
 =?us-ascii?Q?c8H5jToGucyVcPjiKY/yZ+g1I/4S4+KiSX3eTlMGbCgLnmCsZfGDrreNS+KF?=
 =?us-ascii?Q?26Z29imn9zugR/B1BPEgaxYt8JjecR7pIfi0JOorOJMmkZ/Jdn3EkX0IUORq?=
 =?us-ascii?Q?52TT+ocGCIblnVjFlWN4ZDcuqhzKMo22CixdL4eH8UDXQ1hfOrsBcxQRTJmz?=
 =?us-ascii?Q?q01Hd+4xDut8jFXcrBbOHCClkb2frh2znQh6k+BiYCzRYkurqAfinf8t15xK?=
 =?us-ascii?Q?UXxxujpp?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bedcff4-abca-49da-961e-08d89131d097
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2020 11:04:01.1477 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FQotpbhK7wCP5Di27EoSeO13EJnVKfkeXuLEpYWEuVU+5J7FQIJbiNBYtQ3IHLqvUIMl2gjsR8KE3iVMdD2MOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6855
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_060408_474157_6DC3E1CF 
X-CRM114-Status: GOOD (  21.57  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/11/25 20:00, Damien Le Moal wrote:
> On 2020/11/25 18:26, Geert Uytterhoeven wrote:
>> Hi Damien,
>>
>> On Wed, Nov 25, 2020 at 10:02 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>>> On 2020/11/25 17:51, Geert Uytterhoeven wrote:
>>>> On Wed, Nov 25, 2020 at 7:14 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>>>>> On 2020/11/25 3:57, Geert Uytterhoeven wrote:
>>>>>> There is no need to enable Virtual Terminal support in the Canaan
>>>>>> Kendryte K210 defconfigs, as no terminal devices are supported and
>>>>>> enabled.  Hence disable CONFIG_VT, and remove the no longer needed
>>>>>> override for CONFIG_VGA_CONSOLE.
>>>>>>
>>>>>> This reduces kernel size by ca. 65 KiB.
>>>>>
>>>>> Indeed, nice saving. Just tested, and all is good.
>>>>
>>>> I used my old script[1] to check the impact of disabling config options.
>>
>>>> I haven't done enough riscv kernel development yet to assess if I need
>>>> CONFIG_FRAME_POINTER or not.
>>>
>>> Disabling it significantly reduced code size for me. Since the series is more
>>> stable now, it is not really needed, so I disabled it in the defconfig.
>>>
>>> I was just fiddling with CONFIG_UNIX98_PTYS. Disabling it is OK with the simple
>>> busybox userspace (no telnet/xterm like app running). But it saves only about
>>> 1KB with my toolchain (gcc 9.3). So I left that one enabled. I am surprised that
>>> you see 16K size impact... How big is your image ?
>>>
>>> For me, it is 1.768 MB right now for the sdcard defconfig, with CONFIG_VT
>>> disabled and ext2 enabled.
>>
>> It might depend on how you measure.  "size" says 15 KiB impact for UNIX98
>> ptys, while bloat-o-meter reported less than 7 (my script uses "size").
> 
> I look at the size of the arch/riscv/boot/loader.bin file since that is what
> gets loaded in RAM and booted. It is significantly smaller than vmlinux file
> size. E.g. for the sd card defconfig, I have:
> 
> vmlinux: 2369920 B
> loader.bin: 1751250 B
> 
>> I'm at 1.88 MiB, with ext4 and without frame pointers.
>> I also got rid of the EFI partition support, and a few I/O schedulers:
>>
>> +CONFIG_PARTITION_ADVANCED=y
>> +# CONFIG_EFI_PARTITION is not set
>> +# CONFIG_MQ_IOSCHED_DEADLINE is not set
>> +# CONFIG_MQ_IOSCHED_KYBER is not set
> 
> I have all of these disabled. The schedulers are forced disabled in the sdcard
> defconfig.
> 
> I also noticed that it hugely depend on the compiler. Using the buildroot
> generated rv64 gcc 10, the kernel image goes up to almost 2 MB. So for the
> kernel, I keep using the bootlin precompiled gcc 9.3:
> 
> https://toolchains.bootlin.com/
> 
> Just noticed that they now have a 10.2 version available. Will try it out.

Correction: my PATH was actually pointing to the Fedora riscv64 gcc from the
distro rpm package which is version 10.2, not 9.3.

> 
>>
>> Gr{oetje,eeting}s,
>>
>>                         Geert
>>
> 
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
