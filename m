Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E84C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 01:55:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 624D060E76
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 01:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 624D060E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=n9fa+R0qhNj8CfTpf4Ii+vYKtAInGf04GBezoP1kQfI=; b=AOdOwUGfWW9Xgx7gk78tnrt6ut
	5Lif55391kHOOl15FcQbLaTbE8Po+SivFqRZUgXh5SvCAVdGQ61KTNn+OvdVyRQyh0XcqXeXQYCnH
	ntXeCK56vCV8rY2o2ejP36Uc0Ce5tChNmTxjMERPLKlRwJdkDPj6cWfA4GQuY/mpaTp4/1mvU6knA
	/WsQIFs6szh/RtBw2tF2d2OZvhcgmIECFoYrpDO6TA4yXVQ5oyYDwJaBzK0+1xOZwE+3/eopZfrg0
	uJUYv2to/ARV3D04aPF8g2ZeBbkTz5E6tL1EFlNzKdohe0GRUtKgSJOJ8oLygmxk2UcfzM1lY1NiQ
	bH1ddVvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfY9x-003XPW-NS; Wed, 27 Oct 2021 01:55:21 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfY9u-003XOw-9r
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 01:55:20 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R441e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=30; SR=0; TI=SMTPD_---0UtpFhNO_1635299711; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0UtpFhNO_1635299711) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 27 Oct 2021 09:55:13 +0800
Subject: Re: [PATCH v5 1/2] ftrace: disable preemption when recursion locked
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Miroslav Benes <mbenes@suse.cz>, Guo Ren <guoren@kernel.org>,
 Ingo Molnar <mingo@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Nicholas Piggin <npiggin@gmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, live-patching@vger.kernel.org
References: <3ca92dc9-ea04-ddc2-71cd-524bfa5a5721@linux.alibaba.com>
 <333cecfe-3045-8e0a-0c08-64ff590845ab@linux.alibaba.com>
 <alpine.LSU.2.21.2110261128120.28494@pobox.suse.cz>
 <18ba2a71-e12d-33f7-63fe-2857b2db022c@linux.alibaba.com>
 <20211026080117.366137a5@gandalf.local.home>
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Message-ID: <3d897161-7b74-944a-f2a0-07311436fbd9@linux.alibaba.com>
Date: Wed, 27 Oct 2021 09:54:13 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211026080117.366137a5@gandalf.local.home>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_185518_526646_010B2118 
X-CRM114-Status: GOOD (  17.69  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAyMDIxLzEwLzI2IOS4i+WNiDg6MDEsIFN0ZXZlbiBSb3N0ZWR0IHdyb3RlOgo+IE9uIFR1
ZSwgMjYgT2N0IDIwMjEgMTc6NDg6MTAgKzA4MDAKPiDnjovotIcgPHl1bi53YW5nQGxpbnV4LmFs
aWJhYmEuY29tPiB3cm90ZToKPiAKPj4+IFRoZSB0d28gY29tbWVudHMgc2hvdWxkIGJlIHVwZGF0
ZWQgdG9vIHNpbmNlIFN0ZXZlbiByZW1vdmVkIHRoZSAiYml0ID09IDAiIAo+Pj4gdHJpY2suICAK
Pj4KPj4gQ291bGQgeW91IHBsZWFzZSBnaXZlIG1vcmUgaGludCBvbiBob3cgd2lsbCBpdCBiZSBj
b3JyZWN0Pwo+Pgo+PiBJIGdldCB0aGUgcG9pbnQgdGhhdCBiaXQgd2lsbCBubyBsb25nZXIgYmUg
MCwgdGhlcmUgYXJlIG9ubHkgLTEgb3IgPiAwIG5vdwo+PiBzbyB0cmFjZV90ZXN0X2FuZF9zZXRf
cmVjdXJzaW9uKCkgd2lsbCBkaXNhYmxlIHByZWVtcHRpb24gb24gYml0ID4gMCBhbmQKPj4gdHJh
Y2VfY2xlYXJfcmVjdXJzaW9uKCkgd2lsbCBlbmFibGVkIGl0IHNpbmNlIGl0IHNob3VsZCBvbmx5
IGJlIGNhbGxlZCB3aGVuCj4+IGJpdCA+IDAgKEkgcmVtZW1iZXIgd2UgY291bGQgdXNlIGEgV0FS
Tl9PTiBoZXJlIG5vdyA6LVApLgo+Pgo+Pj4gICAKPj4+PiBAQCAtMTc4LDcgKzE4Nyw3IEBAIHN0
YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCB0cmFjZV9jbGVhcl9yZWN1cnNpb24oaW50IGJpdCkK
Pj4+PiAgICogdHJhY2luZyByZWN1cnNlZCBpbiB0aGUgc2FtZSBjb250ZXh0IChub3JtYWwgdnMg
aW50ZXJydXB0KSwKPj4+PiAgICoKPj4+PiAgICogUmV0dXJuczogLTEgaWYgYSByZWN1cnNpb24g
aGFwcGVuZWQuCj4+Pj4gLSAqICAgICAgICAgICA+PSAwIGlmIG5vIHJlY3Vyc2lvbgo+Pj4+ICsg
KiAgICAgICAgICAgPiAwIGlmIG5vIHJlY3Vyc2lvbi4KPj4+PiAgICovCj4+Pj4gIHN0YXRpYyBf
X2Fsd2F5c19pbmxpbmUgaW50IGZ0cmFjZV90ZXN0X3JlY3Vyc2lvbl90cnlsb2NrKHVuc2lnbmVk
IGxvbmcgaXAsCj4+Pj4gIAkJCQkJCQkgdW5zaWduZWQgbG9uZyBwYXJlbnRfaXApICAKPj4+Cj4+
PiBBbmQgdGhpcyBjaGFuZ2Ugd291bGQgbm90IGJlIGNvcnJlY3Qgbm93LiAgCj4+Cj4+IEkgdGhv
dWdodCBpdCB3aWxsIG5vIGxvbmdlciByZXR1cm4gMCBzbyBJIGNoYW5nZSBpdCB0byA+IDAsIGlz
bid0IHRoYXQgY29ycmVjdD8KPiAKPiBObyBpdCBpcyBub3QuIEkgcmVtb3ZlZCB0aGUgYml0ICsg
MSByZXR1cm4gdmFsdWUsIHdoaWNoIG1lYW5zIGl0IHJldHVybnMgdGhlCj4gYWN0dWFsIGJpdCBu
b3cuIFdoaWNoIGlzIDAgb3IgbW9yZS4KCkFoLCB0aGUgcmV0dXJuIGlzIGJpdCBub3QgdmFsLCBJ
IG11c3QgYmUgZHJ1bmsuLi4KCk15IGFwb2xvZ2l6ZSBmb3IgdGhlIHN0dXBpZCBjb21tZW50cy4u
LiBJJ2xsIHNlbmQgYSB2NiBmb3IgdGhpcyBwYXRjaApvbmx5IHRvIGZpeCB0aGF0LCBwbGVhc2Ug
bGV0IG1lIGtub3cgaWYgdGhpcyBpcyBub3QgYSBnb29kIHdheSB0byBmaXgKZmV3IGxpbmVzIG9m
IGNvbW1lbnRzLgoKUmVnYXJkcywKTWljaGFlbCBXYW5nCgo+IAo+IC0tIFN0ZXZlCj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
