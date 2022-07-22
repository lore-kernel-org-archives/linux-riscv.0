Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72ABFC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 12:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IhDfFeBSDtGzZt0wLpgQA+/7KfV/TYdpNhaoZNatRxI=; b=vdVpMLYFM92ISkywmKrJVsDbLW
	gcvjdYJXosLneK43eTmRm/xVBLuRGAfjqkPKE2/9vQ3qg3vBnTJ18iopyB6pec0iisGPAx/VI8kuc
	7si78ybegpagsclTpItVU/drk9yeGuGYRAyLwncD46jg+CUJgHgF5EZo+cbaFqozp74ln2zMR1Wp/
	pSykqevLZA7+JLl/UOCx/HqBQ7ITuuicE4DmpMPdgDEzm62/1Xn6DKhKgRQZ33gbFie0iP3v6r8q7
	rPv5fvCnzws8CroHmEvl/N5XRkkv/djvFoCwx8Fi4CuKN4Uc7RMUm3dZDz7dsuwM45OUA6mqtr79u
	hFo7F0bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEs68-004WYJ-O5; Fri, 22 Jul 2022 12:49:40 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEs64-004WPd-40
	for linux-riscv@lists.infradead.org; Fri, 22 Jul 2022 12:49:38 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0VK557-E_1658494167;
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VK557-E_1658494167)
          by smtp.aliyun-inc.com;
          Fri, 22 Jul 2022 20:49:28 +0800
Subject: Re: [PATCH 4/5] riscv: Add modules to virtual kernel memory layout
 dump
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 anup@brainfault.org, heiko@sntech.de, guoren@kernel.org, mick@ics.forth.gr,
 alexandre.ghiti@canonical.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, crash-utility@redhat.com,
 huanyi.xj@alibaba-inc.com, heinrich.schuchardt@canonical.com,
 k-hagio-ab@nec.com, hschauhan@nulltrace.org
References: <20220717101323.370245-1-xianting.tian@linux.alibaba.com>
 <20220717101323.370245-5-xianting.tian@linux.alibaba.com>
 <87wnc5xxsj.fsf@igel.home>
From: tianxianting <xianting.tian@linux.alibaba.com>
Message-ID: <cef36a7e-f652-3c65-2627-5147291b83ea@linux.alibaba.com>
Date: Fri, 22 Jul 2022 20:49:27 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87wnc5xxsj.fsf@igel.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_054936_432643_F5B2F056 
X-CRM114-Status: UNSURE (   6.30  )
X-CRM114-Notice: Please train this message.
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

CuWcqCAyMDIyLzcvMjIg5LiL5Y2INjoxMCwgQW5kcmVhcyBTY2h3YWIg5YaZ6YGTOgo+IE9uIEp1
bCAxNyAyMDIyLCBYaWFudGluZyBUaWFuIHdyb3RlOgo+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4+IGluZGV4IGQ0NjZlYzY3MGUx
Zi4uMmM0YTY0ZTk3YWVjIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L21tL2luaXQuYwo+PiAr
KysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+PiBAQCAtMTM1LDYgKzEzNSwxMCBAQCBzdGF0aWMg
dm9pZCBfX2luaXQgcHJpbnRfdm1fbGF5b3V0KHZvaWQpCj4+ICAgCQkodW5zaWduZWQgbG9uZylW
TUVNTUFQX0VORCk7Cj4+ICAgCXByaW50X21sKCJ2bWFsbG9jIiwgKHVuc2lnbmVkIGxvbmcpVk1B
TExPQ19TVEFSVCwKPj4gICAJCSh1bnNpZ25lZCBsb25nKVZNQUxMT0NfRU5EKTsKPj4gKyNpZmRl
ZiBDT05GSUdfNjRCSVQKPj4gKwlwcmludF9tbCgibW9kdWxlcyIsICh1bnNpZ25lZCBsb25nKU1P
RFVMRVNfVkFERFIsCj4+ICsJCSh1bnNpZ25lZCBsb25nKU1PRFVMRVNfRU5EKTsKPiAjaWZkZWYg
TU9EVUxFU19WQUREUiA/Ck1heWJlIENPTkZJR182NEJJVCBpcyBiZXR0ZXIsIGl0IHNob3dzIG1v
cmUgaW5mb3MoNjRiaXQgZGVmaW5lZCwgMzJiaXQgCm5vdCkuIElmIHVzZSBNT0RVTEVTX1ZBREQs
IHBlb3BsZSBtYXkgZG91YnQgd2hpY2ggY29uZGl0aW9ucyAKTU9EVUxFU19WQUREIGlzIG5vdCBk
ZWZpbmVkPwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
