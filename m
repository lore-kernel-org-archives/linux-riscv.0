Return-Path: <SRS0=HZsE=GQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09460C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jan 2021 02:29:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90A5D2310F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jan 2021 02:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90A5D2310F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kHrjUUmJHYUv2NtcagSNrbXLRiKYnHttjvDEM1mj55k=; b=fZfKsv/YXBrjLCaOCrT+CRrFcK
	BsNRhPVGsMeJn2RrP4+3MY4l6fEy4H54TMK18GDRGgzWcvrEHbSgI51CX4fSNKJvSPVVjAmHsL3JL
	N5yc1Zafx8IY2oHe23U65d3Cem3+hGcWJPeRRGupHW7nVFJbW2enwKCknMEx895asyT3AOOFwm+om
	XE/Pu64/h2TwGXAB7r+dUSi/o5DTacDHCOvYcmWqf+8sxJvUuznW7SEfkJ/gtDb8gno33YFQf8sy0
	OK+77AI4jaNfqNtrw6IbC79AWJKo3AJNjuAk52CACaYXsp+VNZ6u8D/BDYP1vBRpJtq6n/x/5dYTB
	UPot3LyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzVul-0001nT-Mb; Wed, 13 Jan 2021 02:29:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzVuk-0001n1-H6
 for linux-riscv@merlin.infradead.org; Wed, 13 Jan 2021 02:29:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=4g8bpWRFFbze0eKjyeoZv0D3z0R2ISPPfm/xh72URvs=; b=b9+9MK+tPTyoygwLsd417VkrP2
 iOsc3LdPwO/4Fl52H29kf1z3cDH6KsPMoWV/yexK/DPSYkdNyZyMfh1IeNASS9YH/7y0zJdXecY6k
 2tfWfi3CPC7rasWVquEivXEP/NKFpmVD4/mStsaAiuPPlZOSz6HGMWQHOIez2/T3UGD5SvR2Y5NOx
 Fu33FoBNpO0dbsW8IY+qddTPevtULKY/kQh/cb1ZpC6IZd2v6v/uBuuHYl8+t8IqJRE+yjGlR8NWQ
 ZP9W/T/aDlXYImiGndn78j4/XtyCRZKas3xlyPrPSpd+C0cTQYBB75v/fpCydrj9BOvMxXp17QwY8
 xtgg95Pw==;
Received: from atcsqr.andestech.com ([60.248.187.195])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1kzVuR-005gia-JA
 for linux-riscv@lists.infradead.org; Wed, 13 Jan 2021 02:29:30 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 10D2Pffl039664;
 Wed, 13 Jan 2021 10:25:41 +0800 (GMT-8)
 (envelope-from nylon7@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.487.0;
 Wed, 13 Jan 2021 10:28:24 +0800
From: Nylon Chen <nylon7@andestech.com>
To: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/1] kasan: support backing vmalloc space for riscv
Date: Wed, 13 Jan 2021 10:28:21 +0800
Message-ID: <20210113022822.9230-1-nylon7@andestech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 10D2Pffl039664
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_022930_810393_DB89486F 
X-CRM114-Status: UNSURE (   5.49  )
X-CRM114-Notice: Please train this message.
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
Cc: aou@eecs.berkeley.edu, nickhu@andestech.com, alankao@andestech.com,
 kasan-dev@googlegroups.com, nylon7@andestech.com, nylon7717@gmail.com,
 aryabinin@virtuozzo.com, glider@google.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, dvyukov@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patchset is support KASAN_VMALLOC in riscv.

We reference x86/s390 mailing list discussion for our implement.
https://lwn.net/Articles/797950/

It's also pass `vmalloc-out-of-bounds` of test_kasan.ko

log:
[  235.834318]     # Subtest: kasan
[  235.835190]     1..37
[  235.845238]
==================================================================
[  235.847818] BUG: KASAN: slab-out-of-bounds in
kmalloc_oob_right+0xe2/0x192 [test_kasan]
[  235.850688] Write of size 1 at addr ffffffe0075d5a7b by task
kunit_try_catch/125
[  235.852630]
[  235.853212] CPU: 0 PID: 125 Comm: kunit_try_catch Tainted: G    B
5.11.0-rc3-13940-gb0bb4cd86282-dirty #1
...
[  241.835850]
==================================================================
[1154/67143]
[  241.840884]     ok 36 - kmalloc_double_kzfree
[  241.852642]
==================================================================
[  241.857261] BUG: KASAN: vmalloc-out-of-bounds in
vmalloc_oob+0xcc/0x17c [test_kasan]
[  241.861327] Read of size 1 at addr ffffffd00407ec1c by task
kunit_try_catch/161
[  241.864525]
[  241.865200] CPU: 0 PID: 161 Comm: kunit_try_catch Tainted: G    B
5.11.0-rc3-13940-gb0bb4cd86282-dirty #1
[  241.869887] Call Trace:
[  241.870972] [<ffffffe0000052d2>] walk_stackframe+0x0/0x128
[  241.873353] [<ffffffe000abcff0>] show_stack+0x32/0x3e
[  241.875457] [<ffffffe000ac0d46>] dump_stack+0x84/0xa0
[  241.877806] [<ffffffe000188926>]
print_address_description.constprop.0+0x88/0x362
[  241.881150] [<ffffffe000188e4a>] kasan_report+0x176/0x194
[  241.883604] [<ffffffe000189390>] __asan_load1+0x42/0x4a
[  241.885897] [<ffffffdf81f9f2f4>] vmalloc_oob+0xcc/0x17c [test_kasan]
[  241.889458] [<ffffffdf81f91e8e>] kunit_try_run_case+0x80/0x11a
[kunit]
[  241.892665] [<ffffffdf81f92e16>]
kunit_generic_run_threadfn_adapter+0x2c/0x4e [kunit]
[  241.896568] [<ffffffe000034ac4>] kthread+0x206/0x222
[  241.899219] [<ffffffe00000361a>] ret_from_exception+0x0/0xc
[  241.901700]
[  241.902497]
[  241.903257] Memory state around the buggy address:
[  241.905430]  ffffffd00407eb00: 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00
[  241.908661]  ffffffd00407eb80: 00 00 00 00 00 00 00 f8 f8 f8 f8 f8 f8
f8 f8 f8
[  241.911841] >ffffffd00407ec00: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
f8 f8 f8
[  241.915037]                             ^
[  241.916053]  ffffffd00407ec80: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
f8 f8 f8
[  241.919272]  ffffffd00407ed00: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
f8 f8 f8
[  241.922417]
==================================================================
[  242.073698]     ok 37 - vmalloc_oob


Nylon Chen (1):
  riscv/kasan: add KASAN_VMALLOC support

 arch/riscv/Kconfig         |  1 +
 arch/riscv/mm/kasan_init.c | 66 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 66 insertions(+), 1 deletion(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
