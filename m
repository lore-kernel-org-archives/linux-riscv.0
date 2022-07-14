Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D5AC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 09:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+j+XIawonF4WSyhR1tbtKRn9LpkwWNvEdXpozY7GtE=; b=C+L6dNjA4dHwVhWcKs0vnc+NS9
	FUnOcH32LO3rQc+hmTXXRnwk1u7JA+WTSsRt2VdAyEKBnMcOWkou8OQNpdzwWSz6FGOs3Vol0Ysym
	sbyYCSNzYysPKQMs1JEL1gJOgpH3qLPQaq4UbjnrRfU8qR6JXZyInAXgT/o6m7L4OQCHYiWIRNVW7
	xMCcVniIaGebSSL8HR3dg8jJtZDKHTr2UlPuF3yi94AdE7m9DyG7CBAddPrlY9wCuB9TY2e3IRUjs
	leMgv2SLdSwQSgJ+ei48YZlaHd9YDMSZPsSpjYFofYQIXpIRkMmLvdk2TdlbOxWkrztvaKZzCbgIC
	Jv/ZeBcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBuyY-00Cjst-36; Thu, 14 Jul 2022 09:17:38 +0000
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBuyU-00CjoA-0G
	for linux-riscv@lists.infradead.org; Thu, 14 Jul 2022 09:17:36 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R561e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0VJIm16b_1657790247;
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VJIm16b_1657790247)
          by smtp.aliyun-inc.com;
          Thu, 14 Jul 2022 17:17:29 +0800
Subject: Re: [PATCH V2 2/2] riscv: Add modules to virtual kernel memory layout
 dump
To: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>, Guo Ren
 <guoren@kernel.org>, Anup Patel <anup@brainfault.org>,
 Nick Kossifidis <mick@ics.forth.gr>, Mike Rapoport <rppt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 huanyi.xj@alibaba-inc.com
References: <20220714025901.359695-1-xianting.tian@linux.alibaba.com>
 <20220714025901.359695-3-xianting.tian@linux.alibaba.com>
 <CAK8P3a3-jKEs+uGL=_kjmfzao6DYgmrkO+YWtNhv5O+hFw_qog@mail.gmail.com>
From: Xianting Tian <xianting.tian@linux.alibaba.com>
Message-ID: <f706ddff-8444-bba1-a98a-23a1333cc70a@linux.alibaba.com>
Date: Thu, 14 Jul 2022 17:17:26 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3-jKEs+uGL=_kjmfzao6DYgmrkO+YWtNhv5O+hFw_qog@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_021734_243659_BF479810 
X-CRM114-Status: GOOD (  10.39  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CuWcqCAyMDIyLzcvMTQg5LiL5Y2INDoyNCwgQXJuZCBCZXJnbWFubiDlhpnpgZM6Cj4gT24gVGh1
LCBKdWwgMTQsIDIwMjIgYXQgNDo1OSBBTSBYaWFudGluZyBUaWFuCj4gPHhpYW50aW5nLnRpYW5A
bGludXguYWxpYmFiYS5jb20+IHdyb3RlOgo+PiBBcyBNT0RVTEVTIGlzIG9ubHkgZGVmaW5lZCBm
b3IgQ09ORklHXzY0QklULCBzbyB3ZSBkdW1wIGl0IHdoZW4KPj4gQ09ORklHXzY0QklULgo+IERv
ZXNuJ3QgdGhpcyBjYXVzZSBhIGNvbXBpbGUtdGltZSBlcnJvciBvbiAzMi1iaXQ/CkkgdGVzdGVk
LCBydjMyIGNvbXBpbGUgaXMgT0suCj4KPj4gICAgICAgICAgICAgICAgICAodW5zaWduZWQgbG9u
ZylWTUVNTUFQX0VORCk7Cj4+ICAgICAgICAgIHByaW50X21sKCJ2bWFsbG9jIiwgKHVuc2lnbmVk
IGxvbmcpVk1BTExPQ19TVEFSVCwKPj4gICAgICAgICAgICAgICAgICAodW5zaWduZWQgbG9uZylW
TUFMTE9DX0VORCk7Cj4+ICsgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHXzY0QklUKSkKPj4g
KyAgICAgICAgICAgICAgIHByaW50X21sKCJtb2R1bGVzIiwgKHVuc2lnbmVkIGxvbmcpTU9EVUxF
U19WQUREUiwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgKHVuc2lnbmVkIGxvbmcpTU9EVUxF
U19FTkQpOwo+IFRoZSBJU19FTkFCTEVEKCkgY2hlY2sgcHJldmVudHMgdGhlIGxpbmUgZnJvbSBn
ZXR0aW5nIGV4ZWN1dGVkLCBidXQKPiB1bmxpa2UgYW4gI2lmZGVmIGl0IHN0aWxsIHJlbGllcyBv
biBpdCB0byBiZSBwYXJzYWJsZS4KVGhhbmtzLCBJIHdpbGwgdXNlICNpZmRlZiBpbnN0ZWFkIG9m
IElTX0VOQUJMRUQKPgo+ICAgICAgICAgICBBcm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
