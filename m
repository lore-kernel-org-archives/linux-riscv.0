Return-Path: <SRS0=gGBx=QO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C8DBC282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Feb 2019 22:56:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A1D621907
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Feb 2019 22:56:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q9M+ayC7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="AxfCfeoC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="csVZtuZm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A1D621907
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ogHxJf19dm+u1xJN7yoyyzp+X9SJauTS9fse4su6XEw=; b=q9M+ayC7f40WAf
	GNdAnVpSEokEin5cIgAiErQFtDtuQ8b9rmCuesaFqCvSXwZrBSB7bahg2CjiBjp+R3/ekr5r5Vt4e
	QnaiiZ/3AIWWViMir9RTP56mH1eQVWf8xqPEUPLiNLdC2Y2duoNGF04FYX2QFRe0E67e+CT91Mxjz
	b4Jp2clIxsrAsv5ACgOmv6XNTQ4MUpf7A0xJ2b3feksqSGDgFNMae34pYgsIQbN1WJDWsptk06GPH
	6xovWMKNEx3AcFBydqOWk1xExKAAIJFvbzUnO6uhrn828XMJZbEQECcDaqQiAJtWYp8gFZLT/VCPa
	7Co88NB7CYdpy2crWRJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grsaT-0003a4-Lc; Thu, 07 Feb 2019 22:56:05 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grsaP-0003ZF-MZ
 for linux-riscv@lists.infradead.org; Thu, 07 Feb 2019 22:56:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1549580162; x=1581116162;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=bAgIes9qzu/+Hic2bD4VpuITtCedzFPrpoMftcCUGlE=;
 b=AxfCfeoCro3nnoqsu59FSHJNW2wufy7ozzoTMJFIQqqDmWNO7wsF7QVI
 u2cYdkIeANw5HDhrren61BHPlJIrQGNmNGoZ6jEbXAE6vm4uHIcel0cpI
 eo4R94xbv7AKTPwOxWQjWIr/N/gvBZ8XL9fsEKqhRGzW8Rc+niIlqSqdx
 iuTd38pi2mVyliH7KMPpuZ3GNuiklBXqqCvKFSrNLNC+YEGBG+pwHhghv
 Bi51lvcpGbm1SgNZ2+cPBfVxyxNpeDe7LuJ958ZTWiG6dsGtN0jszq0Qs
 +/rDUzEzmjPvivns9jk6JnZiPFsxsqCLD7+ceCO7JQVFCgNeHwx3aVW4l g==;
X-IronPort-AV: E=Sophos;i="5.56,564,1539619200"; d="scan'208";a="102039759"
Received: from mail-by2nam03lp2051.outbound.protection.outlook.com (HELO
 NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.51])
 by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2019 06:55:59 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDmbPF/UGOkqKSQkLbPjz1bpI2WuEDsLAQjFl4GOf2Q=;
 b=csVZtuZmfiIYFNmKhZSWXmQ8IakblB+wJ4kAmF4xsgIMulWPXpmbJ0FXXy0jAWT4VjFi0qsTW0FIHVWJCtLGnkJlqpHcGN6V9W3psrgELn1BPTciw06R7ksAIs07GxKEJrKUuL3/b8dhqT6OZO2VQEblHkaWOmwTtIrA+Hj5mM0=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
 MWHPR04MB0480.namprd04.prod.outlook.com (10.173.48.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1580.22; Thu, 7 Feb 2019 22:55:58 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
 ([fe80::f55c:272b:6401:1b8c]) by MWHPR04MB0401.namprd04.prod.outlook.com
 ([fe80::f55c:272b:6401:1b8c%10]) with mapi id 15.20.1580.019; Thu, 7 Feb 2019
 22:55:58 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: [PATCH] riscv: Partially revert "Remove stat64 family from default
 syscall set"
Thread-Topic: [PATCH] riscv: Partially revert "Remove stat64 family from
 default syscall set"
Thread-Index: AQHUvzhJp5Lyoz3DO0iX2Eth67GLnQ==
Date: Thu, 7 Feb 2019 22:55:57 +0000
Message-ID: <20190207225531.19219-1-alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR08CA0017.namprd08.prod.outlook.com
 (2603:10b6:a03:100::30) To MWHPR04MB0401.namprd04.prod.outlook.com
 (2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0480;
 6:Q1HSTVGbvySoqbrxQrSJ5f6F1/yGZ9UwjHkK9ID4KHTM/5E3/m4p83KquZ5aCXiPTL2FxtCx/IMLg1lj+DTgxmfYKWdcgE91sfah1bmiuJQdQs2aXiqqGJrwT+dxjJYQMB+yjquvBghQVCexEHFrYhhCvvkrv10qq7ukh1ypuNPdwb1ppOwyTeQWKkp+QXoDg91OdUOwMfdXFjvQUFC03FcSzF54hgpGTs2cHITCxe+XFcnraAzq9odpXFCmBRKb0ioxTKoShQYQI/naFXGRjQLeEfuo6aoL/QLL/nm4HkZLuSNB9TygO4L3lqjj1C7vof5vwCvQbR0v/f7xSVbG/mRlAnxBgPV59KBpvAlNPCWKE+YgIe0rk8bVzq1K9ZftBZtr+X4N1I4VFfW5aMVw6ZBLztf1OSeD55fh92/qdUyH6J3yphOcVXZlndKZrRx1BbD/3nPEGB3F8ENRRzkvIg==;
 5:JTEUj90M44dfMIudOrDzyfFGTVvO72EW7HozWHFgZ/CUSe4d+m5uk916NeHfIb48eFvFGueO3qz+MFR+lJHYVrNN0DhSlRp5c/yov1W+wPIrELZEuz0Yjf2grrhbscYR0srAbFw5jU2p4jbL0Id1XTYdDShgnGQoCawjSEMKaIQh2S/R9uebwip8U3U86BTvbKyR4nmjd1hQ2Xg+zonGzg==;
 7:rqT747W1Bdgxfh8NAntFZj8q+aR+RMDOQyD7LXKnFv5BoDkto5kJmgfBCAIcoCmY3aOD7QCZ+E+ufmpkmuUYspzpAnjqzUH/pBTWFQMyLf/ypgHMdnk97FE5al0gre59MqaM2yJ2UEOhD1SrjTO4wg==
x-ms-office365-filtering-correlation-id: 0d518c8e-6c99-4663-3d1d-08d68d4f6c08
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR04MB0480; 
x-ms-traffictypediagnostic: MWHPR04MB0480:
x-ms-exchange-purlcount: 1
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0480F0A0391C9B46280DDA3A90680@MWHPR04MB0480.namprd04.prod.outlook.com>
x-forefront-prvs: 0941B96580
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(346002)(396003)(39860400002)(366004)(199004)(189003)(8676002)(97736004)(106356001)(2351001)(26005)(256004)(102836004)(186003)(105586002)(53936002)(386003)(7736002)(2906002)(6506007)(2501003)(81166006)(81156014)(6306002)(305945005)(50226002)(36756003)(66066001)(99286004)(6512007)(8936002)(52116002)(54906003)(966005)(6486002)(6436002)(316002)(5640700003)(6116002)(3846002)(6916009)(25786009)(72206003)(4326008)(2616005)(68736007)(71190400001)(476003)(71200400001)(478600001)(86362001)(44832011)(1076003)(486006)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0480;
 H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dgTtLyzvGDdDKYGzaVKi2s/MXJrM0oAJxJKHhkLksKUxJ56fnkM+UGUrN0+AYEdimmAmf9QkSTp8m7IJIShV9oh4yHFwoSc5LTiHgOzasp53Q14w9YQtfWjbwMOuC/vubCtHtJvI8Lq29GBguBRO4HfmNmy1+fGzWaqmZP/wawQ7mnGEiq4cAVvKUzWr+0EdOU5xp5rdo7hbqVs5f6X4N4sKQ6P6k2BNP+5JYRzS+gojJPBSJG0cQs20Ky62fGgyhxU54vkJiaEMYiT/jAQYnWrmwo+Za3mf9rzOkrrOIELiRH1XCfmbkMvpPR0Yr1XJDdtZ2m9Lgy4lfZYyNW9dfn960mM1Feqi3NarjjNKiQEJAyweMzxr7ofx5SL9ngUzwUlWx3MWjjiSlHD6HQ/wCoyNiuWSVK04cLQK2q0NeNg=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d518c8e-6c99-4663-3d1d-08d68d4f6c08
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2019 22:55:57.2064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0480
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_145601_901998_3F6D4851 
X-CRM114-Status: GOOD (  14.43  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>,
 "palmer@sifive.com" <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

To fix systemd/sysVinit crashes enable __ARCH_WANT_STAT64.

systemd failed to start with this error for 32-bit RISC-V:
[    2.833864] Run /sbin/init as init process
/sbin/init: error while loading shared libraries: libsystemd-shared-239.so: cannot stat shared object: Error 38
[    2.933593] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00007f00
[    2.934120] CPU: 0 PID: 1 Comm: init Not tainted 5.0.0-rc4-yoctodev-standard #1
[    2.934589] Call Trace:
[    2.934919] [<c0048a30>] walk_stackframe+0x0/0xa0
[    2.935243] [<c0048c14>] show_stack+0x28/0x32
[    2.935518] [<c05fa418>] dump_stack+0x68/0x88
[    2.935788] [<c004de48>] panic+0xf0/0x252
[    2.936041] [<c0051780>] do_exit+0x7de/0x7fc
[    2.936387] [<c00517f4>] do_group_exit+0x2a/0x82
[    2.936674] [<c005185e>] __wake_up_parent+0x0/0x22
[    2.936982] [<c00475fa>] ret_from_syscall+0x0/0xe
[    2.937673] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00007f00 ]---

sysVinit had a similar problem as well. By enabling __ARCH_WANT_STAT64
for 32-bit RISC-V the problem disapears and 32-bit RISC-V is able to
boot.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
This was tested with this fork of glibc to enable 32-bit RISC-V support:
https://github.com/riscv/riscv-glibc/tree/riscv-glibc-2.29
commit: 04fdd476160a55792a75375ba2bf56c761f811c2

I'm not sure if this is a glibc problem or a kernel problem, but this
commit caused the breakage between the 4.19 and 4.20 kernel so I'm
sending out a patch. Let me know your thoughts

arch/riscv/include/uapi/asm/unistd.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/unistd.h b/arch/riscv/include/uapi/asm/unistd.h
index 1f3bd3ebbb0d..031b7d78e11c 100644
--- a/arch/riscv/include/uapi/asm/unistd.h
+++ b/arch/riscv/include/uapi/asm/unistd.h
@@ -20,6 +20,9 @@
 #endif /* __LP64__ */
 
 #include <asm-generic/unistd.h>
+#if __BITS_PER_LONG == 32
+#define __ARCH_WANT_STAT64
+#endif
 
 /*
  * Allows the instruction cache to be flushed from userspace.  Despite RISC-V
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
