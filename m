Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41545C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 08:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3OoKAaPO5oMBlf8LlOkaT6mcTq99qu34jd1sPCDGPBs=; b=gJ4F2WVt7EU8Mh
	j0OBWPjchh1k5VDPAFAl/D5N5LJEdY16vdATgTWS3kS/MIqh3HU+5ZXx7GpMAEH670m3DRHaXvkYc
	gWSAoe9Ejbc3DMdcyv70IXg78xJV3uEru7Szguh0sJJKYxiOG2NbcEVhJbWFHN+HnWRETIS369G4O
	U6mjE+oXfSX42r+Fr1pYH5zqNpRnyn7C0wcBqUDoWGXDLOX+4KSIixXHZATJSd+U52QjkmLdXLT68
	rXYPoTLqbFN2Hy4paXIjXmjgHNmQyyrKLYW3cpOwamMCUJMGIUYphOWBk2ILVGNJB00jevegGvIUO
	3ZZENy9p3HChgC6HYClw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oERMw-002Maj-JF; Thu, 21 Jul 2022 08:17:14 +0000
Received: from mail-os0jpn01on2079.outbound.protection.outlook.com ([40.107.113.79] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oERMr-002MVu-Ps
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 08:17:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGNo9aXeDl2M0kETeDyK1B5mJcZAfPhnBWJNu8ItkuzN0i+7o9MKs+qd5QOvw43FgPB2wpnWQf8AnNwhqy82O1WVmXDNJXn7XDziMR85M5Kr0csVS/NIL/eXSOxf/tAp4JpMxaUOc1s09ZMVlqHPpOKRxTSpDK6UMNiQVo2HC499rv2E6tya3rHancIRuk8LuCoC3LdbmjtWrgOIFotjL08k4eR3vnUWteasJ21Pm0G7Y+c3/nfcQlfrP0Shi/yHXA1br6Y9GHtZFSOLwi/95PeFX+mlNkvmejl/9sm5dWFWVjlRXYH/IDH1vr1xzk2CH/wY7d7QxHiD6lqWgEJP3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9f5EyPSVGRCnTO/FvJJUSnILkxjxD+/XIC+G5nLTO8k=;
 b=Bn0XZYI1wJDJEIQdwcssERIpZC+wX+mVl9Xs9rk8/+prx01okdD6upKMHDqxncnkHkHXKmt9TQxwkrkobhPqeWFcCkk87x0tAOM03lTbLXQxvmskeMig1foOgjabIHatSlKSoqoVoX/0jUifomtzDJ4S+d1eTCdKPStMmDrx9yXvidkcwi/dObBhT9qwjyYe6fJYlEbrQv7rixplZslcotRco2scYsyyOm0fnIys1DoSaZJckyB3emdZtlbblX6cIOhMfzLYdhD+sGSlFUG39lOZW4CLDE4n/8VsBEXV+i4Oa9GoJpCu4NeA/8/0udTduuTpFtdTndglzHcdjxVWtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nec.com; dmarc=pass action=none header.from=nec.com; dkim=pass
 header.d=nec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nec.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9f5EyPSVGRCnTO/FvJJUSnILkxjxD+/XIC+G5nLTO8k=;
 b=hC3KcyyBwGHfigrVUMBtxMSFGKd9DvKUPzrHPMl3RWdEzWr3hwO8syeLwfdz7sxyl/FLB1xcP7pekEHkeIidynuRe80W/icYKxIBRjd0TjvKJB3OKg9r2xO/io95Cb1ubnebJzXve2EUqxxKflhCWNuA2FaUmfzIDGRCBNKvH3c=
Received: from TYYPR01MB6777.jpnprd01.prod.outlook.com (2603:1096:400:cc::9)
 by OS3PR01MB6322.jpnprd01.prod.outlook.com (2603:1096:604:f4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 08:17:03 +0000
Received: from TYYPR01MB6777.jpnprd01.prod.outlook.com
 ([fe80::7c2f:2e0d:ff2a:b7cc]) by TYYPR01MB6777.jpnprd01.prod.outlook.com
 ([fe80::7c2f:2e0d:ff2a:b7cc%9]) with mapi id 15.20.5438.024; Thu, 21 Jul 2022
 08:17:03 +0000
From: =?utf-8?B?SEFHSU8gS0FaVUhJVE8o6JCp5bC+44CA5LiA5LuBKQ==?=
	<k-hagio-ab@nec.com>
To: Xianting Tian <xianting.tian@linux.alibaba.com>,
	"crash-utility@redhat.com" <crash-utility@redhat.com>, "mick@ics.forth.gr"
	<mick@ics.forth.gr>, "heinrich.schuchardt@canonical.com"
	<heinrich.schuchardt@canonical.com>, "guoren@kernel.org" <guoren@kernel.org>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"hschauhan@nulltrace.org" <hschauhan@nulltrace.org>,
	"huanyi.xj@alibaba-inc.com" <huanyi.xj@alibaba-inc.com>
Subject: Re: [Crash-utility][PATCH 1/8] Add RISCV64 framework code support
Thread-Topic: [Crash-utility][PATCH 1/8] Add RISCV64 framework code support
Thread-Index: AQHYmlGj4powNYA/NkqxPO0QiH0HAK2If98A
Date: Thu, 21 Jul 2022 08:17:03 +0000
Message-ID: <8f6d9af6-36e0-1fe4-17fa-ef5f04130619@nec.com>
References: <20220718025346.411758-1-xianting.tian@linux.alibaba.com>
 <20220718025346.411758-2-xianting.tian@linux.alibaba.com>
In-Reply-To: <20220718025346.411758-2-xianting.tian@linux.alibaba.com>
Accept-Language: ja-JP, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nec.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a4ac3c1c-d121-4490-f0d0-08da6af16479
x-ms-traffictypediagnostic: OS3PR01MB6322:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  um61N3PMjSuvt4TMECIfc3qhy4mWKmqazN7jiDszIO0LoYbRIi6NDqBPQdcZFrtVFoWVHEQm66pQcXeoantgB0Ubsy3cAsHtQAzv0A2cHFIXZrGldUeoohat0BVFH4JBeF0xCccE9gqGBFgfhbo7IdC3Q5ZevNsriQQmfzSZXE2XTZTF6nNPpEvA+SQVBdRmhUCBryPDOja4OGRNuk8Iv6iN2Zeg5Iayglr9l5tLU8Vb051KaIEvUqlkFzA2BmTiiEhWuN+3X78fjNjyvfjhQCsbJMolGHAuYpU6dA4mj/9cyP/0K5M5yWyjXLoGvo/8fg+6YGOXKYKclDPJYRgPia+vcTUiGFSO01Z1JyBeOavSqAKwym90v2v5LzqUjXIu2pUMGlR+B8df/dY0feAZsqfORUwq/Mg6BgAvDX9uSXDeJn95ccUFI42LMcTxcBn5zDQGS51F70q0LDHqTX+1bETieRRhJMI0iWyynjBx6eew52Rfny+opsCNlufwPB6z/fjkeJopzNsWnTsayb8DcAKW8OaYSJONrYmAqFVq42HJUoOJ1aJ6+0R542oWhXFGTOLMT0zILffGE3u/JC6aobdcK5FSSf6zsMZ3Z4hGhR7vnFAM3Kw3GiwYipAdB5ag45ZQEcdX3BVfbbek/QT3Uy2yjnNyin28g3YGK+tRzQ0pZuERNmoUEv4aSLvdrLsYCSICqsug8UnnBMK5Ut2URzAw8cy2w6ssCSkiwsFhpNYNNU04lcF1kvRh1KMO5NuYUM+bCO9h6ESyUAvnM7KCkYyqsiUjmldDaym4Frzm00mUVAF/4pcDsFYFx6YZs485cCWEX9qNFkNUyYNiPut8lfXvrvOJSGQY866jUvCkggk=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB6777.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(53546011)(38100700002)(55236004)(6506007)(8936002)(41300700001)(38070700005)(5660300002)(2616005)(6486002)(122000001)(478600001)(82960400001)(71200400001)(4326008)(30864003)(66446008)(76116006)(66946007)(83380400001)(64756008)(316002)(26005)(110136005)(54906003)(8676002)(6512007)(2906002)(31686004)(66556008)(36756003)(66476007)(86362001)(31696002)(85182001)(186003)(2004002)(45980500001)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aHlzbUk3allkRVUwNjIwZzRQNWdBV0FPdW1Fc3dnZG51VUxOZFk3ZzBRb3kz?=
 =?utf-8?B?V2N6YWpUUGorTzVoS0xXb0dDcXhLcElZcHVoYkVKbUFkTlFmaDlIa0d0eVVv?=
 =?utf-8?B?MUtOUjhwak16c1VkMnVJUDJOTS82OUxDTFBBWm44cHE5NHlhNy9wc2hpOUFy?=
 =?utf-8?B?aldoT29Sb3IvYmVwSDUrTlZKNmw2Zi9tcWxhdCtyc3RDK3hpVjJwcmg3TnYr?=
 =?utf-8?B?U2trUkdiYm1YMWs2UHVQekhSZVRqS3ZKbEwzL1RDOHdIUVJOdVkvYVFSVS9r?=
 =?utf-8?B?WUhmQ0kzdUNLZ25KcFlPVmV2M21paU00cjk3UTAxSG5ESDJ1TTc2YlBYRWhB?=
 =?utf-8?B?WG5DMTY0M1Ewc2lVY2VDZXR1NkwrNXBZeTFqZGt2T0FMdjFxalliZUI1ckNZ?=
 =?utf-8?B?SktqZGFIejRoTGRxbkczajZyRlhRSG9MNW13RmZtVFl3MEZjQU1KSFkxbWFF?=
 =?utf-8?B?R3JHNEVnZ1JzNlZqMVE4cXF2L3pLVnRLdXZreWRPU0dESlFBN3A2S0lmQ3l4?=
 =?utf-8?B?dlh3SmgvbkR0cnl2OCsxRHovNjFTaHp2QkFTVlNvUFlnTjRzUS9iRFpVcDU2?=
 =?utf-8?B?REErU2hncWJPMTRDbzk4Qk1DU3pZY2Fnb0xvQTdESTduUm1CN05PU2dld0Vy?=
 =?utf-8?B?SkRUWFRXQjdEdjRkNTVmRjA4VGJ0dGlETS9vTXVHNm5HNG1sRnpXT3pFaVdQ?=
 =?utf-8?B?NE42ZWlncmVuTjNBb1RFSUpPN0pFVWVteSt5RzliUVd6aHZnRzA1UFhFNVhD?=
 =?utf-8?B?eHZuSTZ2TU5OWEZCazdmK2RtSGVIamJjTGwrVjJxOWxyRHhXaEkrSndrc00z?=
 =?utf-8?B?ekMxc1Zla0o3dmVJYVBXWHBzaHZwY2ptUWhydUR2OGxxMzJySldkMUxzWjJD?=
 =?utf-8?B?RG9EOW5XUmRDeFVpT3cxVnVHc3daWFJzN1lOTmdIQk9JZmlCeTZ0eVNId0tZ?=
 =?utf-8?B?dGdrMk5MMHhpUDZ4MkJBTER2Y1M1VmdMWVZyL1RSYlpnelV5aU1WS01mU3FR?=
 =?utf-8?B?eEh5TlJGZ256L3pDdm5STnVrT2JxcitPeTNyK2NpdjNIU3YzKzZFTU92R0Jy?=
 =?utf-8?B?cW1xeGREUWxlSUx4N1kxckExUkVmdlVlMlg1bU95dGtFc3Z6N3hkN21Bbks1?=
 =?utf-8?B?aEtKc0hjRmN3aGlMc1Q4Y2ZLblJIRHpHRHdPSVFDbFdVWEFGeUErYnRMZFNk?=
 =?utf-8?B?emJtakxSL3lYNHI4M293clhWWEM5bGRoMERKRUNudTlYa2FKQVRsazhMaUNX?=
 =?utf-8?B?RlJkTnF2MzdOY016eUFYcWpNZ0xESUhKeW93RDBzT29zMG5SNXZ6OGtXZ3Bo?=
 =?utf-8?B?dDBiVS9iUzRtMmNHNlpzNUxCODBJL2dMc1ZZQ3hweFQ2aDBnaFVCMkdMeGZS?=
 =?utf-8?B?aEs2WDI2MjNhdHNDYWh6bjA1UzROSTc5UndRcU9YZUN3QlQvQWNZQmsyVEtR?=
 =?utf-8?B?cFhkS1RYclUvQWRKNnhFMWJsRExZRVgrSExnOXA1MGc4akFacUl5d0FQQndP?=
 =?utf-8?B?UGVWUEhsTUYyV2Zodkc4RDBla3VManZqeVdGankya1NCUlJ2VG5mZDM2U3JK?=
 =?utf-8?B?a3NOdVh4UmduZlRYL01CdmdHWUJOYWFUK2FwMWlzaFg3VUhCNndwL05sSnFp?=
 =?utf-8?B?UzljQWNlbmpYZmt4NGxXZEMvNjFEKzg0Umd4RzIvYSswSXNoV2NSenhxTnoz?=
 =?utf-8?B?TmpIalZxRFRoR1VUdC81RTJheFIxZ1NrU3VzYkY5b3dSYkdRQWt6Z2o2MlVJ?=
 =?utf-8?B?UlJtR0tsNWZndnpSNkVsbk94OFFZVGRxY1JSbFNYNXduSUtwMDR2RHVNNzhK?=
 =?utf-8?B?bjNjRGxiazduKzE4QllRL0crc3VFWGM2c0lxbnNPcjBtVjVYMlNDZUJYVFVB?=
 =?utf-8?B?VkFLbFEwL3pLUEh1ZDdLNEVsdkQ3L1A5K2lKRmxIc01NeW5nekV2eVNCUmVX?=
 =?utf-8?B?UkM3OUkwR2JsdnJNVUI2NnhCNjIvaWtacGhpMU9aZTVLWC9uLy92R1ZKc2pt?=
 =?utf-8?B?eFZtT3pDU1B0Um0xRXpFR0hJMVVyQUttcU44cjdGclNyM05ZN1NsQWhRbFNY?=
 =?utf-8?B?WE02d2t2ZEdvU1ZHcEhnTENzSCtaZGdFNVJyemZuc3lDWlRFSXgvMWVncDEr?=
 =?utf-8?Q?m6f0sKjvqjY5utQLQWIag+zs1?=
Content-ID: <B3FFA6468CB8F849ADB436375570552F@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB6777.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ac3c1c-d121-4490-f0d0-08da6af16479
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 08:17:03.1409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e67df547-9d0d-4f4d-9161-51c6ed1f7d11
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FUPr+KcIDcdQajeFIZoAyzIPggdXt4Ulty6UFLpitO7Rjx6mPYoP0urEMUJCmd7EaIF24cxgYOk67OTAV+T6mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6322
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_011709_997101_7965D003 
X-CRM114-Status: GOOD (  17.79  )
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

On 2022/07/18 11:53, Xianting Tian wrote:
> This patch mainly added some environment configurations, macro definitions,
> specific architecture structures and some function declarations supported
> by the RISCV64 architecture.
> 
> We can use the build command to get the simplest version crash tool:
> 	make target=RISCV64 -j2
> 
> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
> ---
>   Makefile            |   7 +-
>   README              |   2 +-
>   configure.c         |  39 ++++++++++-
>   defs.h              | 155 +++++++++++++++++++++++++++++++++++++++++++-
>   diskdump.c          |  11 +++-
>   help.c              |   2 +-
>   lkcd_vmdump_v2_v3.h |   2 +-
>   netdump.c           |   9 ++-
>   ramdump.c           |   2 +
>   riscv64.c           |  56 ++++++++++++++++
>   symbols.c           |  10 +++
>   11 files changed, 285 insertions(+), 10 deletions(-)
>   create mode 100644 riscv64.c
> 
> diff --git a/Makefile b/Makefile
> index 162c2ba..54ebb43 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -64,7 +64,7 @@ CFILES=main.c tools.c global_data.c memory.c filesys.c help.c task.c \
>   	kernel.c test.c gdb_interface.c configure.c net.c dev.c bpf.c \
>   	printk.c \
>   	alpha.c x86.c ppc.c ia64.c s390.c s390x.c s390dbf.c ppc64.c x86_64.c \
> -	arm.c arm64.c mips.c mips64.c sparc64.c \
> +	arm.c arm64.c mips.c mips64.c riscv64.c sparc64.c \
>   	extensions.c remote.c va_server.c va_server_v1.c symbols.c cmdline.c \
>   	lkcd_common.c lkcd_v1.c lkcd_v2_v3.c lkcd_v5.c lkcd_v7.c lkcd_v8.c\
>   	lkcd_fix_mem.c s390_dump.c lkcd_x86_trace.c \
> @@ -84,7 +84,7 @@ OBJECT_FILES=main.o tools.o global_data.o memory.o filesys.o help.o task.o \
>   	build_data.o kernel.o test.o gdb_interface.o net.o dev.o bpf.o \
>   	printk.o \
>   	alpha.o x86.o ppc.o ia64.o s390.o s390x.o s390dbf.o ppc64.o x86_64.o \
> -	arm.o arm64.o mips.o mips64.o sparc64.o \
> +	arm.o arm64.o mips.o mips64.o riscv64.o sparc64.o \
>   	extensions.o remote.o va_server.o va_server_v1.o symbols.o cmdline.o \
>   	lkcd_common.o lkcd_v1.o lkcd_v2_v3.o lkcd_v5.o lkcd_v7.o lkcd_v8.o \
>   	lkcd_fix_mem.o s390_dump.o netdump.o diskdump.o makedumpfile.o xendump.o \
> @@ -438,6 +438,9 @@ mips.o: ${GENERIC_HFILES} ${REDHAT_HFILES} mips.c
>   mips64.o: ${GENERIC_HFILES} ${REDHAT_HFILES} mips64.c
>   	${CC} -c ${CRASH_CFLAGS} mips64.c ${WARNING_OPTIONS} ${WARNING_ERROR}
>   
> +riscv64.o: ${GENERIC_HFILES} ${REDHAT_HFILES} riscv64.c
> +	${CC} -c ${CRASH_CFLAGS} riscv64.c ${WARNING_OPTIONS} ${WARNING_ERROR}
> +
>   sparc64.o: ${GENERIC_HFILES} ${REDHAT_HFILES} sparc64.c
>   	${CC} -c ${CRASH_CFLAGS} sparc64.c ${WARNING_OPTIONS} ${WARNING_ERROR}
>   
> diff --git a/README b/README
> index 5abbce1..5ac5b60 100644
> --- a/README
> +++ b/README
> @@ -37,7 +37,7 @@
>     These are the current prerequisites:
>   
>     o  At this point, x86, ia64, x86_64, ppc64, ppc, arm, arm64, alpha, mips,
> -     mips64, s390 and s390x-based kernels are supported.  Other architectures
> +     mips64, riscv64, s390 and s390x-based kernels are supported.  Other architectures
>        may be addressed in the future.
>   
>     o  One size fits all -- the utility can be run on any Linux kernel version

For README, please append a description of x86_64 binary for riscv64
dumpfiles here:
---
   o  On an x86_64 host, an x86_64 binary that can be used to analyze
      ppc64le dumpfiles may be built by typing "make target=PPC64".

   Traditionally when vmcores are compressed via the makedumpfile(8) facility
---

> diff --git a/configure.c b/configure.c
> index 5188851..0d216d1 100644
> --- a/configure.c
> +++ b/configure.c
> @@ -107,6 +107,7 @@ void add_extra_lib(char *);
>   #undef MIPS
>   #undef SPARC64
>   #undef MIPS64
> +#undef RISCV64
>   
>   #define UNKNOWN 0
>   #define X86     1
> @@ -122,6 +123,7 @@ void add_extra_lib(char *);
>   #define MIPS    11
>   #define SPARC64 12
>   #define MIPS64  13
> +#define RISCV64 14
>   
>   #define TARGET_X86    "TARGET=X86"
>   #define TARGET_ALPHA  "TARGET=ALPHA"
> @@ -136,6 +138,7 @@ void add_extra_lib(char *);
>   #define TARGET_MIPS   "TARGET=MIPS"
>   #define TARGET_MIPS64 "TARGET=MIPS64"
>   #define TARGET_SPARC64 "TARGET=SPARC64"
> +#define TARGET_RISCV64 "TARGET=RISCV64"
>   
>   #define TARGET_CFLAGS_X86    "TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64"
>   #define TARGET_CFLAGS_ALPHA  "TARGET_CFLAGS="
> @@ -158,6 +161,8 @@ void add_extra_lib(char *);
>   #define TARGET_CFLAGS_MIPS_ON_X86_64  "TARGET_CFLAGS=-m32 -D_FILE_OFFSET_BITS=64"
>   #define TARGET_CFLAGS_MIPS64          "TARGET_CFLAGS="
>   #define TARGET_CFLAGS_SPARC64         "TARGET_CFLAGS="
> +#define TARGET_CFLAGS_RISCV64         "TARGET_CFLAGS="
> +#define TARGET_CFLAGS_RISCV64_ON_X86_64	"TARGET_CFLAGS="
>   
>   #define GDB_TARGET_DEFAULT        "GDB_CONF_FLAGS="
>   #define GDB_TARGET_ARM_ON_X86     "GDB_CONF_FLAGS=--target=arm-elf-linux"
> @@ -168,6 +173,7 @@ void add_extra_lib(char *);
>   #define GDB_TARGET_PPC64_ON_X86_64  "GDB_CONF_FLAGS=--target=powerpc64le-unknown-linux-gnu"
>   #define GDB_TARGET_MIPS_ON_X86     "GDB_CONF_FLAGS=--target=mipsel-elf-linux"
>   #define GDB_TARGET_MIPS_ON_X86_64  "GDB_CONF_FLAGS=--target=mipsel-elf-linux CFLAGS=-m32 CXXFLAGS=-m32"
> +#define GDB_TARGET_RISCV64_ON_X86_64  "GDB_CONF_FLAGS=--target=riscv64-unknown-linux-gnu"
>        
>   /*
>    *  The original plan was to allow the use of a particular version
> @@ -404,6 +410,9 @@ get_current_configuration(struct supported_gdb_version *sp)
>   #ifdef __sparc_v9__
>   	target_data.target = SPARC64;
>   #endif
> +#ifdef __riscv64__
> +	target_data.target = RISCV64;
> +#endif
>   
>   	set_initial_target(sp);
>   
> @@ -457,6 +466,12 @@ get_current_configuration(struct supported_gdb_version *sp)
>   			if ((target_data.initial_gdb_target != UNKNOWN) &&
>   			    (target_data.host != target_data.initial_gdb_target))
>   				arch_mismatch(sp);
> +		} else if ((target_data.target == X86_64) &&
> +			(name_to_target((char *)target_data.target_as_param) == RISCV64)) {
> +			/*
> +			 *  Build an RISCV64 crash binary on an X86_64 host.
> +			 */
> +			target_data.target = RISCV64;
>   		} else {
>   			fprintf(stderr,
>   			    "\ntarget=%s is not supported on the %s host architecture\n\n",
> @@ -497,6 +512,10 @@ get_current_configuration(struct supported_gdb_version *sp)
>   		    (target_data.target != MIPS64))
>   			arch_mismatch(sp);
>   
> +		if ((target_data.initial_gdb_target == RISCV64) &&
> +		    (target_data.target != RISCV64))
> +			arch_mismatch(sp);
> +

Please add the case where target_data.target is X86_64.  Otherwise,
the "sticky" target for build on x86_64 will not work:

$ make

The initial build in this source tree was for the RISCV64 architecture.

In order to build a crash binary for the X86_64 architecture:
  1. remove the gdb-10.2 subdirectory
  2. perform a "make clean"
  3. retry the build

make: *** [Makefile:252: all] Error 1

>   		if ((target_data.initial_gdb_target == X86) &&
>   		    (target_data.target != X86)) {
>   			if (target_data.target == X86_64)
> @@ -660,6 +679,9 @@ show_configuration(void)
>   	case SPARC64:
>   		printf("TARGET: SPARC64\n");
>   		break;
> +	case RISCV64:
> +		printf("TARGET: RISCV64\n");
> +		break;
>   	}
>   
>   	if (strlen(target_data.program)) {
> @@ -777,6 +799,14 @@ build_configure(struct supported_gdb_version *sp)
>   		target = TARGET_SPARC64;
>   		target_CFLAGS = TARGET_CFLAGS_SPARC64;
>   		break;
> +	case RISCV64:
> +		target = TARGET_RISCV64;
> +		if (target_data.host == X86_64) {
> +			target_CFLAGS = TARGET_CFLAGS_RISCV64_ON_X86_64;
> +			gdb_conf_flags = GDB_TARGET_RISCV64_ON_X86_64;
> +		} else
> +			target_CFLAGS = TARGET_CFLAGS_RISCV64;
> +		break;
>   	}
>   
>   	ldflags = get_extra_flags("LDFLAGS.extra", NULL);
> @@ -1374,7 +1404,7 @@ make_spec_file(struct supported_gdb_version *sp)
>   	printf("Vendor: Red Hat, Inc.\n");
>   	printf("Packager: Dave Anderson <anderson@redhat.com>\n");
>   	printf("ExclusiveOS: Linux\n");
> -	printf("ExclusiveArch: %%{ix86} alpha ia64 ppc ppc64 ppc64pseries ppc64iseries x86_64 s390 s390x arm aarch64 ppc64le mips mipsel mips64el sparc64\n");
> +	printf("ExclusiveArch: %%{ix86} alpha ia64 ppc ppc64 ppc64pseries ppc64iseries x86_64 s390 s390x arm aarch64 ppc64le mips mipsel mips64el sparc64 riscv64\n");
>   	printf("Buildroot: %%{_tmppath}/%%{name}-root\n");
>   	printf("BuildRequires: ncurses-devel zlib-devel bison\n");
>   	printf("Requires: binutils\n");
> @@ -1613,6 +1643,8 @@ set_initial_target(struct supported_gdb_version *sp)
>   		target_data.initial_gdb_target = MIPS;
>   	else if (strncmp(buf, "SPARC64", strlen("SPARC64")) == 0)
>   		target_data.initial_gdb_target = SPARC64;
> +	else if (strncmp(buf, "RISCV64", strlen("RISCV64")) == 0)
> +		target_data.initial_gdb_target = RISCV64;
>   }
>   
>   char *
> @@ -1633,6 +1665,7 @@ target_to_name(int target)
>   	case MIPS:   return("MIPS");
>   	case MIPS64: return("MIPS64");
>   	case SPARC64: return("SPARC64");
> +	case RISCV64: return("RISCV64");
>   	}
>   
>   	return "UNKNOWN";
> @@ -1697,6 +1730,10 @@ name_to_target(char *name)
>   		return MIPS64;
>   	else if (strncmp(name, "sparc64", strlen("sparc64")) == 0)
>   		return SPARC64;
> +	else if (strncmp(name, "RISCV64", strlen("RISCV64")) == 0)
> +		return RISCV64;
> +	else if (strncmp(name, "riscv64", strlen("riscv64")) == 0)
> +		return RISCV64;
>   
>   	return UNKNOWN;
>   }
> diff --git a/defs.h b/defs.h
> index 9b1b69a..42ffba3 100644
> --- a/defs.h
> +++ b/defs.h
> @@ -76,7 +76,7 @@
>   #if !defined(X86) && !defined(X86_64) && !defined(ALPHA) && !defined(PPC) && \
>       !defined(IA64) && !defined(PPC64) && !defined(S390) && !defined(S390X) && \
>       !defined(ARM) && !defined(ARM64) && !defined(MIPS) && !defined(MIPS64) && \
> -    !defined(SPARC64)
> +    !defined(RISCV64) && !defined(SPARC64)
>   #ifdef __alpha__
>   #define ALPHA
>   #endif
> @@ -118,6 +118,9 @@
>   #ifdef __sparc_v9__
>   #define SPARC64
>   #endif
> +#ifdef __riscv64__
> +#define RISCV64
> +#endif
>   #endif
>   
>   #ifdef X86
> @@ -159,6 +162,9 @@
>   #ifdef SPARC64
>   #define NR_CPUS  (4096)
>   #endif
> +#ifdef RISCV64
> +#define NR_CPUS  (256)
> +#endif
>   
>   #define NR_DEVICE_DUMPS (64)
>   
> @@ -3484,6 +3490,63 @@ struct arm64_stackframe {
>   #define _MAX_PHYSMEM_BITS       48
>   #endif  /* MIPS64 */
>   
> +#ifdef RISCV64
> +#define _64BIT_
> +#define MACHINE_TYPE		"RISCV64"
> +
> +/*
> + * Direct memory mapping
> + */
> +#define PTOV(X)										\
> +	(((unsigned long)(X)+(machdep->kvbase)) - machdep->machspec->phys_base)
> +#define VTOP(X)	({									\
> +	ulong _X = X;									\
> +	(THIS_KERNEL_VERSION >= 0x50D00 &&						\

Please use LINUX(x,y,z) macro.

> +		(_X) >= machdep->machspec->kernel_link_addr) ?				\
> +		(((unsigned long)(_X)-(machdep->machspec->kernel_link_addr)) +		\
> +		 machdep->machspec->phys_base):						\
> +		(((unsigned long)(_X)-(machdep->kvbase)) +				\
> +		 machdep->machspec->phys_base);						\
> +	})
> +#define PAGEBASE(X)		(((ulong)(X)) & (ulong)machdep->pagemask)
> +
> +/*
> + * Stack size order
> + */
> +#define THREAD_SIZE_ORDER       2
> +
> +#define PAGE_OFFSET		(machdep->machspec->page_offset)
> +#define VMALLOC_START		(machdep->machspec->vmalloc_start_addr)
> +#define VMALLOC_END		(machdep->machspec->vmalloc_end)
> +#define VMEMMAP_VADDR		(machdep->machspec->vmemmap_vaddr)
> +#define VMEMMAP_END		(machdep->machspec->vmemmap_end)
> +#define MODULES_VADDR		(machdep->machspec->modules_vaddr)
> +#define MODULES_END		(machdep->machspec->modules_end)
> +#define IS_VMALLOC_ADDR(X)	riscv64_IS_VMALLOC_ADDR((ulong)(X))
> +
> +/* from arch/riscv/include/asm/pgtable.h */
> +#define __SWP_TYPE_SHIFT        6
> +#define __SWP_TYPE_BITS         5
> +#define __SWP_TYPE_MASK         ((1UL << __SWP_TYPE_BITS) - 1)
> +#define __SWP_OFFSET_SHIFT      (__SWP_TYPE_BITS + __SWP_TYPE_SHIFT)
> +
> +#define MAX_SWAPFILES_CHECK()   BUILD_BUG_ON(MAX_SWAPFILES_SHIFT > __SWP_TYPE_BITS)
> +
> +#define SWP_TYPE(entry)		(((entry) >> __SWP_TYPE_SHIFT) & __SWP_TYPE_MASK)
> +#define SWP_OFFSET(entry)	((entry) >> __SWP_OFFSET_SHIFT)
> +#define __swp_type(entry)       SWP_TYPE(entry)
> +#define __swp_offset(entry)     SWP_OFFSET(entry)
> +
> +#define TIF_SIGPENDING          (THIS_KERNEL_VERSION >= LINUX(2,6,23) ? 1 : 2)
> +
> +/* from arch/riscv/include/asm/sparsemem.h */
> +#define _SECTION_SIZE_BITS      27
> +#define _MAX_PHYSMEM_BITS       56 /* 56-bit physical address supported */
> +#define PHYS_MASK_SHIFT		_MAX_PHYSMEM_BITS
> +#define PHYS_MASK		(((1UL) << PHYS_MASK_SHIFT) - 1)
> +
> +#endif  /* RISCV64 */

Spaces and tabs for indent are mixed in this ifdef block, please use
tabs usually if you have no intention.

Thanks,
Kazu

> +
>   #ifdef X86
>   #define _32BIT_
>   #define MACHINE_TYPE       "X86"
> @@ -4532,6 +4595,10 @@ struct machine_specific {
>   #define MAX_HEXADDR_STRLEN (16)
>   #define UVADDR_PRLEN      (16)
>   #endif
> +#ifdef RISCV64
> +#define MAX_HEXADDR_STRLEN (16)
> +#define UVADDR_PRLEN       (16)
> +#endif
>   
>   #define BADADDR  ((ulong)(-1))
>   #define BADVAL   ((ulong)(-1))
> @@ -5126,6 +5193,9 @@ void dump_build_data(void);
>   #ifdef MIPS64
>   #define machdep_init(X) mips64_init(X)
>   #endif
> +#ifdef RISCV64
> +#define machdep_init(X) riscv64_init(X)
> +#endif
>   #ifdef SPARC64
>   #define machdep_init(X) sparc64_init(X)
>   #endif
> @@ -5606,6 +5676,9 @@ void display_help_screen(char *);
>   #ifdef SPARC64
>   #define dump_machdep_table(X) sparc64_dump_machdep_table(X)
>   #endif
> +#ifdef RISCV64
> +#define dump_machdep_table(X) riscv64_dump_machdep_table(X)
> +#endif
>   extern char *help_pointer[];
>   extern char *help_alias[];
>   extern char *help_ascii[];
> @@ -6682,6 +6755,86 @@ struct machine_specific {
>   
>   #endif /* MIPS64 */
>   
> +/*
> + * riscv64.c
> + */
> +void riscv64_display_regs_from_elf_notes(int, FILE *);
> +
> +#ifdef RISCV64
> +void riscv64_init(int);
> +void riscv64_dump_machdep_table(ulong);
> +int riscv64_IS_VMALLOC_ADDR(ulong);
> +
> +#define display_idt_table() \
> +	error(FATAL, "-d option is not applicable to RISCV64 architecture\n")
> +
> +/* from arch/riscv/include/asm/ptrace.h */
> +struct riscv64_register {
> +	ulong regs[36];
> +};
> +
> +struct riscv64_pt_regs {
> +	ulong badvaddr;
> +	ulong cause;
> +	ulong epc;
> +};
> +
> +struct riscv64_unwind_frame {
> +	ulong fp;
> +	ulong sp;
> +	ulong pc;
> +};
> +
> +#define KSYMS_START	(0x1)
> +
> +struct machine_specific {
> +	ulong phys_base;
> +	ulong page_offset;
> +	ulong vmalloc_start_addr;
> +	ulong vmalloc_end;
> +	ulong vmemmap_vaddr;
> +	ulong vmemmap_end;
> +	ulong modules_vaddr;
> +	ulong modules_end;
> +	ulong kernel_link_addr;
> +	ulong address_space_end;
> +
> +	ulong _page_present;
> +	ulong _page_read;
> +	ulong _page_write;
> +	ulong _page_exec;
> +	ulong _page_user;
> +	ulong _page_global;
> +	ulong _page_accessed;
> +	ulong _page_dirty;
> +	ulong _page_soft;
> +
> +	ulong _pfn_shift;
> +
> +	struct riscv64_register *crash_task_regs;
> +};
> +/* from arch/riscv/include/asm/pgtable-bits.h */
> +#define 	_PAGE_PRESENT	(machdep->machspec->_page_present)
> +#define 	_PAGE_READ	(machdep->machspec->_page_read)
> +#define 	_PAGE_WRITE	(machdep->machspec->_page_write)
> +#define 	_PAGE_EXEC	(machdep->machspec->_page_exec)
> +#define 	_PAGE_USER	(machdep->machspec->_page_user)
> +#define 	_PAGE_GLOBAL	(machdep->machspec->_page_global)
> +#define 	_PAGE_ACCESSED	(machdep->machspec->_page_accessed)
> +#define 	_PAGE_DIRTY	(machdep->machspec->_page_dirty)
> +#define 	_PAGE_SOFT	(machdep->machspec->_page_soft)
> +#define 	_PAGE_SEC	(machdep->machspec->_page_sec)
> +#define 	_PAGE_SHARE	(machdep->machspec->_page_share)
> +#define 	_PAGE_BUF	(machdep->machspec->_page_buf)
> +#define 	_PAGE_CACHE	(machdep->machspec->_page_cache)
> +#define 	_PAGE_SO	(machdep->machspec->_page_so)
> +#define 	_PAGE_SPECIAL	_PAGE_SOFT
> +#define		_PAGE_TABLE	_PAGE_PRESENT
> +#define 	_PAGE_PROT_NONE	_PAGE_READ
> +#define 	_PAGE_PFN_SHIFT	10
> +
> +#endif /* RISCV64 */
> +
>   /*
>    * sparc64.c
>    */
> diff --git a/diskdump.c b/diskdump.c
> index 2c1f9be..28503bc 100644
> --- a/diskdump.c
> +++ b/diskdump.c
> @@ -622,6 +622,9 @@ restart:
>   	else if (STRNEQ(header->utsname.machine, "aarch64") &&
>   	    machine_type_mismatch(file, "ARM64", NULL, 0))
>   		goto err;
> +	else if (STRNEQ(header->utsname.machine, "riscv64") &&
> +	    machine_type_mismatch(file, "RISCV64", NULL, 0))
> +		goto err;
>   
>   	if (header->block_size != block_size) {
>   		block_size = header->block_size;
> @@ -780,6 +783,8 @@ restart:
>   		dd->machine_type = EM_AARCH64;
>   	else if (machine_type("SPARC64"))
>   		dd->machine_type = EM_SPARCV9;
> +	else if (machine_type("RISCV64"))
> +		dd->machine_type = EM_RISCV;
>   	else {
>   		error(INFO, "%s: unsupported machine type: %s\n",
>   			DISKDUMP_VALID() ? "diskdump" : "compressed kdump",
> @@ -1751,7 +1756,8 @@ dump_note_offsets(FILE *fp)
>   			qemu = FALSE;
>   			if (machine_type("X86_64") || machine_type("S390X") ||
>   			    machine_type("ARM64") || machine_type("PPC64") ||
> -			    machine_type("SPARC64") || machine_type("MIPS64")) {
> +			    machine_type("SPARC64") || machine_type("MIPS64") ||
> +			    machine_type("RISCV64")) {
>   				note64 = (void *)dd->notes_buf + tot;
>   				len = sizeof(Elf64_Nhdr);
>   				if (STRNEQ((char *)note64 + len, "QEMU"))
> @@ -2558,7 +2564,8 @@ dump_registers_for_compressed_kdump(void)
>   	if (!KDUMP_CMPRS_VALID() || (dd->header->header_version < 4) ||
>   	    !(machine_type("X86") || machine_type("X86_64") ||
>   	      machine_type("ARM64") || machine_type("PPC64") ||
> -	      machine_type("MIPS") || machine_type("MIPS64")))
> +	      machine_type("MIPS") || machine_type("MIPS64") ||
> +	      machine_type("RISCV64")))
>   		error(FATAL, "-r option not supported for this dumpfile\n");
>   
>   	if (machine_type("ARM64") && (kt->cpus != dd->num_prstatus_notes))
> diff --git a/help.c b/help.c
> index 99214c1..253c71b 100644
> --- a/help.c
> +++ b/help.c
> @@ -9512,7 +9512,7 @@ char *README[] = {
>   "  These are the current prerequisites: ",
>   "",
>   "  o  At this point, x86, ia64, x86_64, ppc64, ppc, arm, arm64, alpha, mips,",
> -"     mips64, s390 and s390x-based kernels are supported.  Other architectures",
> +"     mips64, riscv64, s390 and s390x-based kernels are supported.  Other architectures",
>   "     may be addressed in the future.",
>   "",
>   "  o  One size fits all -- the utility can be run on any Linux kernel version",
> diff --git a/lkcd_vmdump_v2_v3.h b/lkcd_vmdump_v2_v3.h
> index 984c2c2..7fa70b9 100644
> --- a/lkcd_vmdump_v2_v3.h
> +++ b/lkcd_vmdump_v2_v3.h
> @@ -37,7 +37,7 @@
>   
>   #if defined(ARM) || defined(X86) || defined(PPC) || defined(S390) || \
>   	defined(S390X) || defined(ARM64) || defined(MIPS) || \
> -	defined(MIPS64) || defined(SPARC64)
> +	defined(MIPS64) || defined(SPARC64) || defined(RISCV64)
>   
>   /*
>    * Kernel header file for Linux crash dumps.
> diff --git a/netdump.c b/netdump.c
> index ff273b4..4ec12a0 100644
> --- a/netdump.c
> +++ b/netdump.c
> @@ -300,6 +300,12 @@ is_netdump(char *file, ulong source_query)
>   				goto bailout;
>   			break;
>   
> +		case EM_RISCV:
> +			if (machine_type_mismatch(file, "RISCV64", NULL,
> +			    source_query))
> +				goto bailout;
> +			break;
> +
>   		default:
>   			if (machine_type_mismatch(file, "(unknown)", NULL,
>   			    source_query))
> @@ -2935,7 +2941,8 @@ dump_registers_for_elf_dumpfiles(void)
>   
>           if (!(machine_type("X86") || machine_type("X86_64") ||
>   	    machine_type("ARM64") || machine_type("PPC64") ||
> -	    machine_type("MIPS") || machine_type("MIPS64")))
> +	    machine_type("MIPS") || machine_type("MIPS64") ||
> +	    machine_type("RISCV64")))
>                   error(FATAL, "-r option not supported for this dumpfile\n");
>   
>   	if (NETDUMP_DUMPFILE()) {
> diff --git a/ramdump.c b/ramdump.c
> index a206fcb..d2bd7ff 100644
> --- a/ramdump.c
> +++ b/ramdump.c
> @@ -188,6 +188,8 @@ char *ramdump_to_elf(void)
>   		e_machine = EM_MIPS;
>   	else if (machine_type("X86_64"))
>   		e_machine = EM_X86_64;
> +	else if (machine_type("RISCV64"))
> +		e_machine = EM_RISCV;
>   	else
>   		error(FATAL, "ramdump: unsupported machine type: %s\n",
>   			MACHINE_TYPE);
> diff --git a/riscv64.c b/riscv64.c
> new file mode 100644
> index 0000000..c7df857
> --- /dev/null
> +++ b/riscv64.c
> @@ -0,0 +1,56 @@
> +/* riscv64.c - core analysis suite
> + *
> + * Copyright (C) 2022 Alibaba Group Holding Limited.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +#ifdef RISCV64
> +
> +#include <elf.h>
> +#include "defs.h"
> +
> +void
> +riscv64_dump_machdep_table(ulong arg)
> +{
> +}
> +
> +/*
> + *  Include both vmalloc'd and module address space as VMALLOC space.
> + */
> +int
> +riscv64_IS_VMALLOC_ADDR(ulong vaddr)
> +{
> +	return ((vaddr >= VMALLOC_START && vaddr <= VMALLOC_END) ||
> +		(vaddr >= VMEMMAP_VADDR && vaddr <= VMEMMAP_END) ||
> +		(vaddr >= MODULES_VADDR && vaddr <= MODULES_END));
> +}
> +
> +void
> +riscv64_init(int when)
> +{
> +}
> +
> +void
> +riscv64_display_regs_from_elf_notes(int cpu, FILE *ofp)
> +{
> +}
> +
> +#else /* !RISCV64 */
> +
> +#include "defs.h"
> +
> +void
> +riscv64_display_regs_from_elf_notes(int cpu, FILE *ofp)
> +{
> +	return;
> +}
> +
> +#endif /* !RISCV64 */
> diff --git a/symbols.c b/symbols.c
> index bee1faf..ea9e83e 100644
> --- a/symbols.c
> +++ b/symbols.c
> @@ -3743,6 +3743,11 @@ is_kernel(char *file)
>   				goto bailout;
>   			break;
>   
> +		case EM_RISCV:
> +			if (machine_type_mismatch(file, "RISCV64", NULL, 0))
> +				goto bailout;
> +			break;
> +
>   		default:
>   			if (machine_type_mismatch(file, "(unknown)", NULL, 0))
>   				goto bailout;
> @@ -4002,6 +4007,11 @@ is_shared_object(char *file)
>   			if (machine_type("MIPS64"))
>   				return TRUE;
>   			break;
> +
> +		case EM_RISCV:
> +			if (machine_type("RISCV64"))
> +				return TRUE;
> +			break;
>   		}
>   
>   		if (CRASHDEBUG(1))
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
