Return-Path: <SRS0=jumX=K5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C9A7C47096
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jun 2021 10:03:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23BB661242
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jun 2021 10:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23BB661242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=g4J5BqutaPHhGJIlCKkKCx1AJfWDijDYFjOCidqyUt4=; b=Vibz/iiQCybFj/
	cDIm6zCtrhd5TZsuFHEZ1XX+VAfAYSrFGWLAiBOQjILF5QVLRrV87o/xq9V0X6F3KdR8M/wYsBTt7
	tM3WNfC9A8leLTpeATgAJ6MnkxQjCfGXTQYOKAEY001TkCQstHzN2LZ+9OVWF13A+sEzbFgx1GNDh
	9rO1UV26govRshVI+LHolW1tiPmqggr4AtwRlsvLmNkwMOtLmpRMgr3Jkbe/F7w8s/rsgMvAmAnGg
	uxYzU9+Xg+BkORRIbG/TxKIyh8ZczGKzRbF1+RIvU7OCZObvfqTMaiXj4jArAI4IVxx5DI3rL64+d
	/OUpoz+a22oKNkx3Y64g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lokCB-007zMZ-NV; Thu, 03 Jun 2021 10:03:23 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lokC7-007zIs-Lo
 for linux-riscv@lists.infradead.org; Thu, 03 Jun 2021 10:03:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1622714600; x=1654250600;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=LiYzP/z5U6ZzhBF41v/Tug5NJAqIj/52gBXx4B15wJE=;
 b=H5EGdpmnSFWEUOI3yY0VRn0LC65a0/og25NZL7zviP7uug/HblGUOJXs
 tBFwJVihGYUo8TIVtprlNgRavO9QFn+rlOgFk+kQzsbtC87BktwknUMwk
 u/B/1mfAkjpzZlfB/RFuZqpYqBiUfYVhofzCEdc1cfgOW/3OxAQldxctr
 UYU1+WClpP8ljdjqRsx6CvKV9Ay1CSwtkeMZf2wp15cOiy1XUa4XdkW0y
 Mc5S/oOVqKrkhxyvKVNqFsuuzBxfz717smNmnYXYRS38wzPUI6Y8QdGhK
 hcSQ8KK4/6C/rU0r4k7XgP1U1AGEYKqgRSB8T85IJg8hX+GIlVL1QSoKp A==;
IronPort-SDR: ooCM1a3wU9wy0LRR46V2lbxOf2MC42Z9ahBcXySj9Z8j8b34Mqyslvlb75TpPARFjy+0f9Bw6x
 9pOeh4ogUCsyJPogtaK6ag8FXkxCqjVzlrbs2vN2j3ry2xhQrrrCCQEaLYmjp/uDxckzdnBL7o
 wGuOZp2y0vZ2M43mS2uXbJBiOaX8lE2XtN9K3YYekW3y+d5I7YRQ+MVRZddx+55Wc33UNtLAsO
 zRWpsAJKmKFT1f0hLOPgE9A+GF7Y4F6dJ1k3dxsYwmWVHblsZV/bVhYfKBq7RLz7gxQtyxjNj2
 Sc0=
X-IronPort-AV: E=Sophos;i="5.83,244,1616428800"; d="scan'208";a="171091076"
Received: from mail-dm6nam08lp2049.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.49])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jun 2021 18:03:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+Y+l3XGGUReT3uX7uXIU0B9gLev8KVbZ5a5J15jsKQBhK0QNXD7HuXbYY6Dbfl50H2wbhO+mCvO2q1f+BxPRrLwqzteEMOBiSes4y1AIz0FZNTJP3C8PmVeEdUutyFfSdBm0XEtOG3pswT4SQ3DllTF8Ckg5YpVauXBhXL4L3FtJFZhR+buMmvkmGN3TXWhBqQcJ46rPNqsOJkCItAz9eOk7euP6clnT1dhygX0nvDCL/vNXZ4vB1JLOsV3/IZLyLBuuXcUxNWs81AD9sx4b/Mag/6JHYwGFgZZa9xRk6AKIupL71mv3es+vdbe1uv4T0QCSSNEgIMyvIIEqFnxGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5V6MY3rcwik0w+TqTRtwnSfqQ6SYWGlEtZZA7gI+Uk=;
 b=XnSTKpArbimkqVdJGeLgWqDjw5e8zavj0EVCZJQWklAHVu7+mNnYW0P4Iq2MArfKGLlOTmyeL7PS0bzYIXWKxM5p7GuN82zhr+7RH239QcA9zwPUPUbA+cvgfLXT2so6qtsQdRUfI+Azo2/M1/SwwKWEAHUuftDYkI0B/qtkxTUaqUhlBOp+0npb9MX2wmWrZYwqaajP2WQH6C36e1Tsd/IyKxj5JeIrd/2DtYMozPs141w/gCSQiWDADkcpcKqrdezZ8EL3FEZB6jcwLEkIMH+Wzbv0czRAjdHH6Z6q5zq0vInC6YLPLVc4aH+bEQFdRHxoD4m+rf2t4TU4WOt7hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5V6MY3rcwik0w+TqTRtwnSfqQ6SYWGlEtZZA7gI+Uk=;
 b=iZChNBvwxsfiRpILsiuvbzC8W/8jFxTrwMHnwzjDxUfOZFMLRwSZYL511mBnCU9B2EdWIAb2FJAQJUpjCsFOYlrkObOrGAo/clImY0OpYI/H+X0mbj130/duoOiqGz+rw+9LdMRmqYMDJ1Xx6QZ3ETsSqZjDF60AvMaAAn/Y1PY=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by DM6PR04MB5595.namprd04.prod.outlook.com (2603:10b6:5:16b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.26; Thu, 3 Jun
 2021 10:03:15 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::64f9:51d2:1e04:f806]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::64f9:51d2:1e04:f806%9]) with mapi id 15.20.4173.030; Thu, 3 Jun 2021
 10:03:15 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Palmer Dabbelt <palmerdabbelt@google.com>, Stephen Boyd
 <sboyd@kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: drivers/clk/clk-k210.c:717:6: warning: variable 'reg' set but not
 used
Thread-Topic: drivers/clk/clk-k210.c:717:6: warning: variable 'reg' set but
 not used
Thread-Index: AQHXWFvRoJxiJ4iKDEyXDkfjZQlCcg==
Date: Thu, 3 Jun 2021 10:03:14 +0000
Message-ID: <DM6PR04MB7081C0499CCCA8C9B9E36610E73C9@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <202106031749.dSbBjn30-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:467:7587:9599:cace]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc7b77c3-24bf-4a96-6446-08d92676cdce
x-ms-traffictypediagnostic: DM6PR04MB5595:
x-microsoft-antispam-prvs: <DM6PR04MB5595ACE5C06C79A7D3588ABCE73C9@DM6PR04MB5595.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:20;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oNZ3cue0dmWK9DDvYFVj9VInyWzjw+wEDcM+NeHHERdpylaVFMJeZGnavXeegaUDmajAkjaJy2v+cbzF+HvZBE5NDoqp4OtfeuHEEpbVyEYlm1F8j9ujCCPdAYWUPnNLGx8RGKutaXsUHEpYVj4lR9qPDcqDu3z6nBJaB5o9iRr6LHTmrjAeEN7Idg7isxws1+ayIZ8aWmpp5nH6OxNU6cDTom5uiCgMJKoJIiZKXXLKWRAkmIXxuXhNfBvTkVwLMuHskmmOAY40AHW4GpCWi2cOp5nIXBj/DGpIKm+xsdMvBZy0tAUQ3WrZk9I15s/Zl+knTp4ex5EVGlJz+9mTCA12YQ/mq4ha7yaVvaHTjgaqTRqCK0URdBYeiQOpA7IYeGJSCDTJStvsONg6r0DdiIqOYkxFheMatm5An/PwMkGOjxkK10WzmrTp95IhacFjOtVQ1Ya7JBZoCgh2OgQ8XYbgRGXIw61PiRQJEkfCpR+BQkU5+R4zxDByhmtnY66d0RWxD6DDFTHAUor1PFua9vWRt8RdsVwA46pqEW7GVmzgkeD1Vt05zesEcBVVl5t0IDMmDwEwENbB4ccpsw9Lji72p/XM2sjrNJ/QejfXjj0YbgLucTiAS42GT0vjAHp10nSEU85s5zBczEmHi3xf+e+RbQKSHPwLOzgIapUiu00xWKjnLL5NoYHgVV3lx1zeoesLn2tgXsFW59aAUsEgH07htyn4oHilqhpwXSf3BDr6ifisuiW1wSBzlAkr3HXE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(8936002)(9686003)(4326008)(2906002)(33656002)(86362001)(478600001)(966005)(55016002)(66476007)(122000001)(91956017)(8676002)(6506007)(5660300002)(186003)(52536014)(64756008)(66946007)(316002)(53546011)(71200400001)(7696005)(76116006)(66446008)(83380400001)(66556008)(38100700002)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?TTBPFtUb0tSLHpL5RPuzdqNu46OmmpSVrjrOF4+1OZWBiiWfyZEIaD1+xLhr?=
 =?us-ascii?Q?6CGEMqb+fZ+vZ2qjlHAPNPYsMkOWz80jfSWjY9SSgG2yyhUYHtdxrNOqeVpD?=
 =?us-ascii?Q?RtQPOdW1lZlckKOr4AQUe6U+ev8HMIbCeaUxuJWH6pGsZbB9lFnFyxjC7xqS?=
 =?us-ascii?Q?gMD3pIvrWjSlA3GQtbQsF/EDJyQlbPjtGBXhO7zPNJEzzWKJAMDPfHkjIOSX?=
 =?us-ascii?Q?A1q1ubE7BwQHtTa+ut+WcJvHpuTmu8QI2V5n20Pica6bysSx7B0dhrzHz17Y?=
 =?us-ascii?Q?2z6t/xzpcJYnK5LRsQSmVbU/x1FM35KnFV/VQcYUG2G5JTkwzVJb+rPZXwGK?=
 =?us-ascii?Q?tA1rP9PeldJeRS0rNE3XgANL/nU2h8iA7OFe+D5rgssv6HpET6ETetO6cXXu?=
 =?us-ascii?Q?okWjCg15jfzGRC+FBgki5kaUIx1XBsGEcJe+MFmi13AaV3kzPesc7SWXOpcC?=
 =?us-ascii?Q?B3kyMFmgh01gzMJf2PtPyLYQM1eD7qV/QOiP9PMfXN1SYqBYAplf/iHZ/DXs?=
 =?us-ascii?Q?zGT/7kn2o48OOukGtEYxlf/2irtd0HGDyMPHbtVZBWtEmJMm6Dvu26MWfTiC?=
 =?us-ascii?Q?wkHDx2WYDwreircYcevftBnrnmrsKFK9Rp+Dsrx+vgOpqyCrgNK62UzIV7Bu?=
 =?us-ascii?Q?pEt7MsNKlqtkNBGfy6BWoA+5zbeGdJQH37GloJjAsXOG0Z0vzwtG1hwQw0KV?=
 =?us-ascii?Q?QY9b8D7RF4njB2lqbPT28QiQGA1mU7T+ya01YAVOxrAp2/mUwy8Rr3NQDzQe?=
 =?us-ascii?Q?2nfaNKmC1bugwnxUlOkHjCGHDWOGVMFcrML8RAbz+xgNdB68sOQhc4VWQnJi?=
 =?us-ascii?Q?vOJhUdBhwhEVopEzJ+5+pjYqb6yq+F3zKewnzmp9Aa/dA9cb3+i1hfgpdcvh?=
 =?us-ascii?Q?WNV3VwWAus7S2CKh2xgbAfKanjnLDLU7dvdPJASl47CCFCQesMg1IvuC2wa3?=
 =?us-ascii?Q?eSevTgNrAd5NGxCKm+tzdN8r4qWeWKpGBE+RILxLYjzVFX0FyQORk/iDC05/?=
 =?us-ascii?Q?dLTkE04W0yoYVAeMQ3DmnXDNWPQrPJ5vz/d+d/3Gkrc0OWuwRlCZfM+VTwqb?=
 =?us-ascii?Q?sgWiR1X+/w12yvGnQMBIWf5/JH2ShGju6fEyEx+MpU5XVt9z9MdxCoBl7YLV?=
 =?us-ascii?Q?zmhgE4Qus4oeGfNeHlcG3Zo+0SLJVgkr3u1MsqwbA/oJb7Fhs/1+BBLvAnP6?=
 =?us-ascii?Q?/8ZVXKV/YVNd6+3BfbleaiPkdFFohxVZ5Cb7gZoSxL/UYl+1W50fYebw0IF1?=
 =?us-ascii?Q?+veeiTIz2KQD0E7W6tD5Q/sTAZj7T2pSSbmW3CJWYugb8s0GV/KgLyRqAFSm?=
 =?us-ascii?Q?3Sj4gQQQhV93lGKlZet2wci+X/nGFyuwcMAsDPGdpzFL0VuvPGBHoS8Aw/gx?=
 =?us-ascii?Q?gSMVplYmXV4mMpG66yb2f5tdwhHi3jjjIPYgqIX1JCFR6CcXJg=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7b77c3-24bf-4a96-6446-08d92676cdce
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 10:03:14.9551 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6mlxLHJv4EDatrJ4VTYYMoxgAvlRBlfDEi32TD3MScnFZj0KiarcoBcaIP2QV+th5dRJcPFCSsnyyjSKfBZqwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5595
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_030319_858416_99D3BE8E 
X-CRM114-Status: GOOD (  16.77  )
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

On 2021/06/03 18:35, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   324c92e5e0ee0e993bdb106fac407846ed677f6b
> commit: c6ca7616f7d5c2ce166280107ba74db1d528fcb7 clk: Add RISC-V Canaan Kendryte K210 clock driver
> date:   3 months ago
> config: riscv-randconfig-r033-20210603 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project d8e0ae9a76a62bdc6117630d59bf9967ac9bb4ea)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c6ca7616f7d5c2ce166280107ba74db1d528fcb7
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout c6ca7616f7d5c2ce166280107ba74db1d528fcb7
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from drivers/clk/clk-k210.c:8:
>    In file included from include/linux/io.h:13:
>    In file included from arch/riscv/include/asm/io.h:149:
>    include/asm-generic/io.h:556:9: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            return inb(addr);
>                   ^~~~~~~~~
>    arch/riscv/include/asm/io.h:55:76: note: expanded from macro 'inb'
>    #define inb(c)          ({ u8  __v; __io_pbr(); __v = readb_cpu((void*)(PCI_IOBASE + (c))); __io_par(__v); __v; })
>                                                                            ~~~~~~~~~~ ^
>    arch/riscv/include/asm/mmio.h:87:48: note: expanded from macro 'readb_cpu'
>    #define readb_cpu(c)            ({ u8  __r = __raw_readb(c); __r; })
>                                                             ^
>    In file included from drivers/clk/clk-k210.c:8:
>    In file included from include/linux/io.h:13:
>    In file included from arch/riscv/include/asm/io.h:149:
>    include/asm-generic/io.h:564:9: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            return inw(addr);
>                   ^~~~~~~~~
>    arch/riscv/include/asm/io.h:56:76: note: expanded from macro 'inw'
>    #define inw(c)          ({ u16 __v; __io_pbr(); __v = readw_cpu((void*)(PCI_IOBASE + (c))); __io_par(__v); __v; })
>                                                                            ~~~~~~~~~~ ^
>    arch/riscv/include/asm/mmio.h:88:76: note: expanded from macro 'readw_cpu'
>    #define readw_cpu(c)            ({ u16 __r = le16_to_cpu((__force __le16)__raw_readw(c)); __r; })
>                                                                                         ^
>    include/uapi/linux/byteorder/little_endian.h:36:51: note: expanded from macro '__le16_to_cpu'
>    #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
>                                                      ^
>    In file included from drivers/clk/clk-k210.c:8:
>    In file included from include/linux/io.h:13:
>    In file included from arch/riscv/include/asm/io.h:149:
>    include/asm-generic/io.h:572:9: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            return inl(addr);
>                   ^~~~~~~~~
>    arch/riscv/include/asm/io.h:57:76: note: expanded from macro 'inl'
>    #define inl(c)          ({ u32 __v; __io_pbr(); __v = readl_cpu((void*)(PCI_IOBASE + (c))); __io_par(__v); __v; })
>                                                                            ~~~~~~~~~~ ^
>    arch/riscv/include/asm/mmio.h:89:76: note: expanded from macro 'readl_cpu'
>    #define readl_cpu(c)            ({ u32 __r = le32_to_cpu((__force __le32)__raw_readl(c)); __r; })
>                                                                                         ^
>    include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__le32_to_cpu'
>    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
>                                                      ^
>    In file included from drivers/clk/clk-k210.c:8:
>    In file included from include/linux/io.h:13:
>    In file included from arch/riscv/include/asm/io.h:149:
>    include/asm-generic/io.h:580:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            outb(value, addr);
>            ^~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/io.h:59:68: note: expanded from macro 'outb'
>    #define outb(v,c)       ({ __io_pbw(); writeb_cpu((v),(void*)(PCI_IOBASE + (c))); __io_paw(); })
>                                                                  ~~~~~~~~~~ ^
>    arch/riscv/include/asm/mmio.h:91:52: note: expanded from macro 'writeb_cpu'
>    #define writeb_cpu(v, c)        ((void)__raw_writeb((v), (c)))
>                                                              ^
>    In file included from drivers/clk/clk-k210.c:8:
>    In file included from include/linux/io.h:13:
>    In file included from arch/riscv/include/asm/io.h:149:
>    include/asm-generic/io.h:588:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            outw(value, addr);
>            ^~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/io.h:60:68: note: expanded from macro 'outw'
>    #define outw(v,c)       ({ __io_pbw(); writew_cpu((v),(void*)(PCI_IOBASE + (c))); __io_paw(); })
>                                                                  ~~~~~~~~~~ ^
>    arch/riscv/include/asm/mmio.h:92:76: note: expanded from macro 'writew_cpu'
>    #define writew_cpu(v, c)        ((void)__raw_writew((__force u16)cpu_to_le16(v), (c)))
>                                                                                      ^
>    In file included from drivers/clk/clk-k210.c:8:
>    In file included from include/linux/io.h:13:
>    In file included from arch/riscv/include/asm/io.h:149:
>    include/asm-generic/io.h:596:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            outl(value, addr);
>            ^~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/io.h:61:68: note: expanded from macro 'outl'
>    #define outl(v,c)       ({ __io_pbw(); writel_cpu((v),(void*)(PCI_IOBASE + (c))); __io_paw(); })
>                                                                  ~~~~~~~~~~ ^
>    arch/riscv/include/asm/mmio.h:93:76: note: expanded from macro 'writel_cpu'
>    #define writel_cpu(v, c)        ((void)__raw_writel((__force u32)cpu_to_le32(v), (c)))
>                                                                                      ^
>    In file included from drivers/clk/clk-k210.c:8:
>    In file included from include/linux/io.h:13:
>    In file included from arch/riscv/include/asm/io.h:149:
>    include/asm-generic/io.h:1005:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
>                                                      ~~~~~~~~~~ ^
>>> drivers/clk/clk-k210.c:717:6: warning: variable 'reg' set but not used [-Wunused-but-set-variable]
>            u32 reg;
>                ^
>    8 warnings generated.
> 
> 
> vim +/reg +717 drivers/clk/clk-k210.c
> 
>    710	
>    711	static int k210_clk_set_parent(struct clk_hw *hw, u8 index)
>    712	{
>    713		struct k210_clk *kclk = to_k210_clk(hw);
>    714		struct k210_sysclk *ksc = kclk->ksc;
>    715		struct k210_clk_cfg *cfg = &k210_clk_cfgs[kclk->id];
>    716		unsigned long flags;
>  > 717		u32 reg;

Palmer,

I do not think this driver is the real cause of this error. Did something change
recently with risc-v mmio readl()/writel() ?

>    718	
>    719		spin_lock_irqsave(&ksc->clk_lock, flags);
>    720		reg = readl(ksc->regs + cfg->mux_reg);
>    721		if (index)
>    722			reg |= BIT(cfg->mux_bit);
>    723		else
>    724			reg &= ~BIT(cfg->mux_bit);
>    725		spin_unlock_irqrestore(&ksc->clk_lock, flags);
>    726	
>    727		return 0;
>    728	}
>    729	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
