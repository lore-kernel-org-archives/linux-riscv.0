Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD3FDC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 01:51:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98A6661039
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 01:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98A6661039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WGKPAbwaTx+ldLrk9lNkNvt1tSApXnerIkejLKvb7Cc=; b=2i2E83It6XnQ8ouj6flBEsw2DD
	GBSJYMh81dRvd1NnJ6FfVghKCLtuXci6rufVKQWXIn55/nLiqoAq/uWTEhDlClGor56lh1odZwcs2
	SThu/ukNboJRJSy4h5QWypmhSr/w9s9gx1rLJIwexAeN/leKb66I/EWiRXJ2A9on7fDVZDIMvTeOO
	efU+xCyA870voXZPY6FNzA073Zr6CyJJlecE2Ns0COaTWb8ndl/eiigTE1O9CXTv9RMXJeTdiPhPh
	DwGNn8hSOmvmGmxfkfEh765wFki/0cXzLb+OV/ubqihFcgfFKw/xxQEKCdc/uN52HB/c3SLtXUD2f
	KoHRd2HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maTQE-00EbLk-No; Wed, 13 Oct 2021 01:51:10 +0000
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maTQC-00EbKe-6Q
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 01:51:09 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=31; SR=0; TI=SMTPD_---0UrdGa9a_1634089862; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0UrdGa9a_1634089862) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 13 Oct 2021 09:51:03 +0800
Subject: Re: [PATCH 1/2] ftrace: disable preemption on the testing of recursion
To: Miroslav Benes <mbenes@suse.cz>
Cc: Guo Ren <guoren@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
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
 Colin Ian King <colin.king@canonical.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Nicholas Piggin <npiggin@gmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, live-patching@vger.kernel.org
References: <8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com>
 <a8756482-024c-c858-b3d1-1ffa9a5eb3f7@linux.alibaba.com>
 <alpine.LSU.2.21.2110121421260.3394@pobox.suse.cz>
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Message-ID: <74090798-7d93-0713-982c-6f0247118d20@linux.alibaba.com>
Date: Wed, 13 Oct 2021 09:50:17 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <alpine.LSU.2.21.2110121421260.3394@pobox.suse.cz>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_185108_435200_236121A1 
X-CRM114-Status: GOOD (  12.20  )
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

CgpPbiAyMDIxLzEwLzEyIOS4i+WNiDg6MjQsIE1pcm9zbGF2IEJlbmVzIHdyb3RlOgpbc25pcF0K
Pj4KPj4gIAlmdW5jID0gbGlzdF9maXJzdF9vcl9udWxsX3JjdSgmb3BzLT5mdW5jX3N0YWNrLCBz
dHJ1Y3Qga2xwX2Z1bmMsCj4+ICAJCQkJICAgICAgc3RhY2tfbm9kZSk7Cj4+IEBAIC0xMjAsNyAr
MTE1LDYgQEAgc3RhdGljIHZvaWQgbm90cmFjZSBrbHBfZnRyYWNlX2hhbmRsZXIodW5zaWduZWQg
bG9uZyBpcCwKPj4gIAlrbHBfYXJjaF9zZXRfcGMoZnJlZ3MsICh1bnNpZ25lZCBsb25nKWZ1bmMt
Pm5ld19mdW5jKTsKPj4KPj4gIHVubG9jazoKPj4gLQlwcmVlbXB0X2VuYWJsZV9ub3RyYWNlKCk7
Cj4+ICAJZnRyYWNlX3Rlc3RfcmVjdXJzaW9uX3VubG9jayhiaXQpOwo+PiAgfQo+IAo+IEkgZG9u
J3QgbGlrZSB0aGlzIGNoYW5nZSBtdWNoLiBXZSBoYXZlIHByZWVtcHRfZGlzYWJsZSB0aGVyZSBu
b3QgYmVjYXVzZSAKPiBvZiBmdHJhY2VfdGVzdF9yZWN1cnNpb24sIGJ1dCBiZWNhdXNlIG9mIFJD
VS4gZnRyYWNlX3Rlc3RfcmVjdXJzaW9uIHdhcyAKPiBhZGRlZCBsYXRlci4gWWVzLCBpdCB3b3Vs
ZCB3b3JrIHdpdGggdGhlIGNoYW5nZSwgYnV0IGl0IHdvdWxkIGFsc28gaGlkZSAKPiB0aGluZ3Mg
d2hpY2ggc2hvdWxkIG5vdCBiZSBoaWRkZW4gaW4gbXkgb3Bpbmlvbi4KCk5vdCB2ZXJ5IHN1cmUg
YWJvdXQgdGhlIGJhY2tncm91cCBzdG9yaWVzLCBidXQganVzdCBmb3VuZCB0aGlzIGluCidEb2N1
bWVudGF0aW9uL3RyYWNlL2Z0cmFjZS11c2VzLnJzdCc6CgogIE5vdGUsIG9uIHN1Y2Nlc3MsCiAg
ZnRyYWNlX3Rlc3RfcmVjdXJzaW9uX3RyeWxvY2soKSB3aWxsIGRpc2FibGUgcHJlZW1wdGlvbiwg
YW5kIHRoZQogIGZ0cmFjZV90ZXN0X3JlY3Vyc2lvbl91bmxvY2soKSB3aWxsIGVuYWJsZSBpdCBh
Z2FpbiAoaWYgaXQgd2FzIHByZXZpb3VzbHkKICBlbmFibGVkKS4KClNlZW1zIGxpa2UgdGhpcyBs
b2NrIHBhaXIgd2FzIHN1cHBvc2VkIHRvIHRha2UgY2FyZSB0aGUgcHJlZW10aW9uIGl0c2VsZj8K
ClJlZ2FyZHMsCk1pY2hhZWwgV2FuZwoKPiAKPiBNaXJvc2xhdgo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
