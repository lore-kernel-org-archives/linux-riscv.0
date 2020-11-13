Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DBBC4742C
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 07:40:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 200C5208D5
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 07:40:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KIym8poi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Vzbl15qB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="JsMqKw4T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 200C5208D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=xn9LF/+7yyRfVQkZYepPicHw0YGERk+WMJx/zOucTFY=; b=KIym8poix3V5fA3CDO57vlivy
	pB2U8izXNA3aHHEowvNj3msFM9m/t7LZv5GFGF/kI+cMfjms24fk9IUeRN/fbXU5zL6X3kbNknUmk
	B6pMjk0MvovhvIZRiEiicIWXACrJsj+vvtrDcO57/fd3/0vtOVnC5VuXrL+3obkpDd+tJ8P+3uQ8M
	7KNa0K+KQNYyIPJeVqwKkK023dbkHUuL7y9eH92B9r7qEI8ugSf+xatMbKd368zeGTnPyU7gMCLoQ
	uXK9vvlBvwzod4cy2Nc5Z4Fecet0tuZBYXKaNxZuQrql/kVCx89RnBoyAmdx2eoPM5KPIhKtsD7Z+
	t0i3eNipw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdTh4-0006V5-DE; Fri, 13 Nov 2020 07:40:26 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdTh0-0006U6-Ot
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 07:40:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605253222; x=1636789222;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=CuMaPGMoZMdGALz7qo+A5eeimKc9mAGbf2liKkZ0v4M=;
 b=Vzbl15qBHYeVoUOFfw+csBnnKA1DZaXByfA4U0MuLivmjoa+Kbfx4+Xh
 yV8Ri6ZS0cFqri+a+h/WRnFEFGqg3vMfEdiScNxBXhxSzmwRJ/aUVjU6l
 MAIaPP4qurE3R98nd4tu/+eskE2wfChwrsKP9I+BFQlRALqKhrzrokDEC
 w81w+GXwT1tgrXFLJTLpib1JClqXRzPu0Q+HnHkJEVXIlndmyrOdfctAb
 b/VkyAYh8Qz67GfvLs8EC4wzLMhAf52tUhSSbx7UDBFOl95Jm9EE2vP77
 6Ha6Tbx66aVqdvqv1LFQ7qaoblI3xm7GYbKfVzNV57A3iLSLh5wz1hFrx Q==;
IronPort-SDR: R7BnWmvOHrk3h3mBIExnCejTJ+tRNAZjkkmgZvs0ytDz6BfMU1/qI64tmvlLkSF1lx5dpp6Aee
 j3aC2HEFtafVmA9g5fHHrKNOFpgBSywlUN5qs0bcwKg9GT62FAFUcJGftGUijVd3LAT9SvIbra
 ks3bDg1MSLAwwd6ocr1l1ahD29T61XvcuTtQKVANKpKJJM4d0TFjySxqgpiZD9g5q1kF323U+x
 8osZx/fafQCnL+R2QsK/uiNCEjPIpKM7W/8WUVJZTL/6dXkc+DFJrlik1ozsaAwvjCrMGE2Boe
 Els=
X-IronPort-AV: E=Sophos;i="5.77,474,1596470400"; d="scan'208";a="157036052"
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hgst.iphmx.com with ESMTP; 13 Nov 2020 15:40:19 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJOe/nthXA4UJfS+Xn3i4W0fQWtZPO4oyt3EvxjU6JHjHa0NgWi4gdrsLCxxoZejg69temwinu7RsA6CUZEmgyMpFu+H/MKAokddLlvC9QZwTJ34V/4tTDwtlHvFNjASTtB2Ei2iMac8lLuWybuLSgr4U93FMRgxPw7uGNjXcek4bTVz+sxWwVFG7qrYi2BgZz09/0GZ4EgjJIBhzSctTZT1ufnUi+j2lIFE5cjlyH/ZWoNhd68T8JUiKc5G9wokzkzBtCQtjswtsxzbknNrVNSFLTmNGssZZlmJrwYYq9m8p4up1TSiqBtJgTY/Eh6Wlcrv6u8dHGSNPdIcYU5DQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CuMaPGMoZMdGALz7qo+A5eeimKc9mAGbf2liKkZ0v4M=;
 b=SdKjzQ1SAFaAjTOEL+//fmBYNaMb93EuTrybEBnH7coV0CueRwFxpFaSSjCl0rx321PjsEHVrVnuvP8W7SSDjHwb4SpdJ6NsLTsiNR2Sp48aQ20qyXq9BHEjgWe6z1rXRl7aswlk7LhcM5p/8uxhldQ1PMhwUuFrXTZQIv7w+bj8OhMTO2hBP5lkfPQGuOHTP83ClHpBbLFIRhZJFLXZghkr1RmhZz0wDXTGVCpRlVQbHtZ6B1DYr9GORSuj6YxP+313R4bDRPfY9eHOOWa37Dy+Z91m3b5x0wl9h/ibA5ILoivAGdELRljthWcBag/CWSoD+KiEOfUW7L87irm2RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CuMaPGMoZMdGALz7qo+A5eeimKc9mAGbf2liKkZ0v4M=;
 b=JsMqKw4Tyoam4P+x9J5+0U4m/HvvPsQxmDAi5eVsiezeYRd7iKJcpn7zHBBrOjhF+qX86jmp4ZqfMq5bBXLFsKjIWhuQADbPXp8aj5nWfa1OtMfr7BsNAXP+NfjPgajKlIedu8HQCb0D/YfYYxoVmVweWKtZLpmJm8mkBw+MOTY=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6701.namprd04.prod.outlook.com (2603:10b6:208:1ef::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 07:40:17 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.032; Fri, 13 Nov 2020
 07:40:17 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Stephen Boyd <sboyd@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Rob
 Herring <robh+dt@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 08/32] riscv: Fix kernel time_init()
Thread-Topic: [PATCH 08/32] riscv: Fix kernel time_init()
Thread-Index: AQHWtN4Q9ZnQv+4b30qO975eAugUlw==
Date: Fri, 13 Nov 2020 07:40:17 +0000
Message-ID: <BL0PR04MB6514621FDC804DAD854AFA06E7E60@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-9-damien.lemoal@wdc.com>
 <160525270249.60232.12874105352298232293@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:1511:21c9:a204:82eb]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 51110be5-8cff-40ae-466d-08d887a75d8d
x-ms-traffictypediagnostic: MN2PR04MB6701:
x-microsoft-antispam-prvs: <MN2PR04MB6701F2FF70B49D320C917A5DE7E60@MN2PR04MB6701.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y5ochi7xuK2AERwFUfBz7wx9wuOMHBCbIAzs4Ik1BSkiJcN0CBnzJMfPOhIYcY3g2CCMx8xPt98gTsL/ihjmobyB0YTtbjbmHGSmLG2x6HMNdlllu8+tHZU2DDvRWCQEEt+zmY6O/NVNyzT0M4MA7zVMbOctL1BQgbuRwGOQvJ3CIo78gZ6+1BJQzmwpRgrnvHVAjseZ6ZfSAoO5cU8EnEYG1RBHcJKP6p/5TK0bV+beWAJ8Eo3F2fzsGOm1x15lQovD0K/TrR7dogQFXSxO5ECOrhz8gNnqn8MMT2GytJyhGru5JgiR3nCsjRBSCSnTe8yUvQh/+5s+6D80+QWRfA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(366004)(86362001)(316002)(8676002)(9686003)(2906002)(8936002)(55016002)(478600001)(71200400001)(7696005)(6506007)(53546011)(110136005)(64756008)(4326008)(83380400001)(91956017)(5660300002)(33656002)(52536014)(66556008)(66476007)(66946007)(66446008)(76116006)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: jkEs812rAaborVGLeM4VmfTJxJXSZUaj3caN61QTggLZ1qxfZ4XzAbLTkIVokw1RRHzmxwt4SUuVHjKd2DW5TXg2W6e1LwPVnSwMm7WeE6DEjmktEjtOvkJoKqZirgxnkdF1npw5oL9rOj7idnR2KrwcAVvVNaoteFJ/meF6/7uaX+8AQyYOA0QKwjaGbgjQW7USiwestxe+IlCYsacyCf470MvgNVeoWGm16SiXnSbmCYipamrsAr04/nUkxo7JrV1RxrhrWE3xQb22wQkgFYgh06M3GXWRKzR9ON8Dj7x1qzD4zIljzqE1AzhB5F6edRoFC23mFYkJA4zMiklEy2zY+vojV/Ayz8xNlxGxqGbZ6775ub0uvmAQXi9LTRT1nfWHFiw0c9phH8UNk/BK+amGhaKGYbqaW/9M0q6jyquu5i8P/AQ21ifB3YORvWMOAOLmV6KUFn3bR8t2oT0jJoXg1Nlh/WTIMB3QMdSRW3urZVK+kdiHB0tXDeorTiKVeQJOROWrdGae8LI2OXSnkZmYg1megKwpR3ChUJ8KFJzy+CPpDnPTUsbuBnHHwZaNLdwLUcHz98nS//wUuljp7P61EVnoT15yOJFL8LHtD5N4TR+20hkUfxizwR9WN5NqD9iuV743mj4u/GPsUOlWUyYk8lE64aq8ynbjL19rTeo/+3Os4Aru1MLBPvh1B40jvlWICofvzNfaHGt2Qlywag==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51110be5-8cff-40ae-466d-08d887a75d8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 07:40:17.0289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BcNiJgSWcm19JA8DavMNQFzxeOZSDt5bAbTM8oZKWDShApuqD8P4tBvna+qdFehx956egV/OLvz/4f+LTIMsoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6701
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_024022_942640_93EBA47B 
X-CRM114-Status: GOOD (  19.30  )
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
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/11/13 16:31, Stephen Boyd wrote:
> Quoting Damien Le Moal (2020-11-07 00:13:56)
>> If of_clk_init() is not called in time_init(), clock providers defined
>> in the system device tree are not initialized, resulting in failures for
>> other devices to initialize due to missing clocks.
>> Similarly to other architectures and to the default kernel time_init()
>> implementation, call of_clk_init() before executing timer_probe() in
>> time_init().
> 
> Do you have timers that need clks to be running or queryable this early?
> This of_clk_init() call is made here when architectures need to call
> things like clk_get_rate() to figure out some clk frequency for their
> clockevent or clocksource. It is OK to have this call here, I'm just
> curious if this is actually necessary vs. delaying it to later.
> 

I think the clocks could be initialized later, but at least the CLINT will
depend on one of the clocks, same for the CPU frequency information. So need
checking.

What this patch fixes is not the need for a super early initialization though,
it is that _nothing_ was being initialized without it: the clock driver probe
function was never called with the current riscv time_init() as is. I looked at
other architectures and at the default kernel time_init(), and mimicked what was
done, that is, added of_clk_init(). Is there any other way to make sure that the
needed clock drivers are initialized ?

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
