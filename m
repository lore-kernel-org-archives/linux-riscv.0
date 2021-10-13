Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DFBC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 01:53:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7668060F23
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 01:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7668060F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wnzkioRrfts6oyIMHSGfRG5XUem0eu6r2aoS8SUv4QY=; b=O/W8I5RmXeHFCyKdbFt8GJltoM
	jhiMtSNTXiTqjs7jByUzMYD/T3gOetIHH9lOOn/KZwuX1MPpKE1aXohpoFxw65AffGKktJZmgsJIb
	2EkHUvfm1kEZYd8y3lps10Cr6rOoqNrWxMIYHqcu/QArzqNQ0M+ZjS53JfocOp+3v3umPvdCtt7TX
	knsnpzGVFLlCsYK7r+Vb2BH6C38EZrhFlAx5pH0gtLfZY1rLNvBGXwdPV8AFVuhaK4s4erbXGYCNz
	a+BdCCsUN7hksuUyi6wNmj/xw9P4SV7ncDxjmArGGNFjQAWhV82orhhBcCI/gQzoAPqeLowRP+79A
	hHikhL7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maTSE-00EbcR-Hb; Wed, 13 Oct 2021 01:53:14 +0000
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maTS8-00EbZA-P2
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 01:53:12 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=31; SR=0; TI=SMTPD_---0UrdeUV._1634089981; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0UrdeUV._1634089981) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 13 Oct 2021 09:53:02 +0800
Subject: Re: [PATCH 1/2] ftrace: disable preemption on the testing of recursion
To: Steven Rostedt <rostedt@goodmis.org>, Miroslav Benes <mbenes@suse.cz>
Cc: Guo Ren <guoren@kernel.org>, Ingo Molnar <mingo@redhat.com>,
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
 <20211012082920.1f8d6557@gandalf.local.home>
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Message-ID: <6ca59cdd-e378-b8c6-7ac6-472568f1af97@linux.alibaba.com>
Date: Wed, 13 Oct 2021 09:52:16 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211012082920.1f8d6557@gandalf.local.home>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_185308_994107_01F0221B 
X-CRM114-Status: GOOD (  15.43  )
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

CgpPbiAyMDIxLzEwLzEyIOS4i+WNiDg6MjksIFN0ZXZlbiBSb3N0ZWR0IHdyb3RlOgo+IE9uIFR1
ZSwgMTIgT2N0IDIwMjEgMTQ6MjQ6NDMgKzAyMDAgKENFU1QpCj4gTWlyb3NsYXYgQmVuZXMgPG1i
ZW5lc0BzdXNlLmN6PiB3cm90ZToKPiAKPj4+ICsrKyBiL2tlcm5lbC9saXZlcGF0Y2gvcGF0Y2gu
Ywo+Pj4gQEAgLTUyLDExICs1Miw2IEBAIHN0YXRpYyB2b2lkIG5vdHJhY2Uga2xwX2Z0cmFjZV9o
YW5kbGVyKHVuc2lnbmVkIGxvbmcgaXAsCj4+PiAgCWJpdCA9IGZ0cmFjZV90ZXN0X3JlY3Vyc2lv
bl90cnlsb2NrKGlwLCBwYXJlbnRfaXApOwo+Pj4gIAlpZiAoV0FSTl9PTl9PTkNFKGJpdCA8IDAp
KQo+Pj4gIAkJcmV0dXJuOwo+Pj4gLQkvKgo+Pj4gLQkgKiBBIHZhcmlhbnQgb2Ygc3luY2hyb25p
emVfcmN1KCkgaXMgdXNlZCB0byBhbGxvdyBwYXRjaGluZyBmdW5jdGlvbnMKPj4+IC0JICogd2hl
cmUgUkNVIGlzIG5vdCB3YXRjaGluZywgc2VlIGtscF9zeW5jaHJvbml6ZV90cmFuc2l0aW9uKCku
Cj4+PiAtCSAqLwo+Pj4gLQlwcmVlbXB0X2Rpc2FibGVfbm90cmFjZSgpOwo+Pj4KPj4+ICAJZnVu
YyA9IGxpc3RfZmlyc3Rfb3JfbnVsbF9yY3UoJm9wcy0+ZnVuY19zdGFjaywgc3RydWN0IGtscF9m
dW5jLAo+Pj4gIAkJCQkgICAgICBzdGFja19ub2RlKTsKPj4+IEBAIC0xMjAsNyArMTE1LDYgQEAg
c3RhdGljIHZvaWQgbm90cmFjZSBrbHBfZnRyYWNlX2hhbmRsZXIodW5zaWduZWQgbG9uZyBpcCwK
Pj4+ICAJa2xwX2FyY2hfc2V0X3BjKGZyZWdzLCAodW5zaWduZWQgbG9uZylmdW5jLT5uZXdfZnVu
Yyk7Cj4+Pgo+Pj4gIHVubG9jazoKPj4+IC0JcHJlZW1wdF9lbmFibGVfbm90cmFjZSgpOwo+Pj4g
IAlmdHJhY2VfdGVzdF9yZWN1cnNpb25fdW5sb2NrKGJpdCk7Cj4+PiAgfSAgCj4+Cj4+IEkgZG9u
J3QgbGlrZSB0aGlzIGNoYW5nZSBtdWNoLiBXZSBoYXZlIHByZWVtcHRfZGlzYWJsZSB0aGVyZSBu
b3QgYmVjYXVzZSAKPj4gb2YgZnRyYWNlX3Rlc3RfcmVjdXJzaW9uLCBidXQgYmVjYXVzZSBvZiBS
Q1UuIGZ0cmFjZV90ZXN0X3JlY3Vyc2lvbiB3YXMgCj4+IGFkZGVkIGxhdGVyLiBZZXMsIGl0IHdv
dWxkIHdvcmsgd2l0aCB0aGUgY2hhbmdlLCBidXQgaXQgd291bGQgYWxzbyBoaWRlIAo+PiB0aGlu
Z3Mgd2hpY2ggc2hvdWxkIG5vdCBiZSBoaWRkZW4gaW4gbXkgb3Bpbmlvbi4KPiAKPiBBZ3JlZWQs
IGJ1dCBJIGJlbGlldmUgdGhlIGNoYW5nZSBpcyBmaW5lLCBidXQgcmVxdWlyZXMgYSBuaWNlIGNv
bW1lbnQgdG8KPiBleHBsYWluIHdoYXQgeW91IHNhaWQgYWJvdmUuCj4gCj4gVGh1cywgYmVmb3Jl
IHRoZSAiZnRyYWNlX3Rlc3RfcmVjdXJzaW9uX3RyeWxvY2soKSIgd2UgbmVlZDoKPiAKPiAJLyoK
PiAJICogVGhlIGZ0cmFjZV90ZXN0X3JlY3Vyc2lvbl90cnlsb2NrKCkgd2lsbCBkaXNhYmxlIHBy
ZWVtcHRpb24sCj4gCSAqIHdoaWNoIGlzIHJlcXVpcmVkIGZvciB0aGUgdmFyaWFudCBvZiBzeW5j
aHJvbml6ZV9yY3UoKSB0aGF0IGlzCj4gCSAqIHVzZWQgdG8gYWxsb3cgcGF0Y2hpbmcgZnVuY3Rp
b25zIHdoZXJlIFJDVSBpcyBub3Qgd2F0Y2hpbmcuCj4gCSAqIFNlZSBrbHBfc3luY2hyb25pemVf
dHJhbnNpdGlvbigpIGZvciBtb3JlIGRldGFpbHMuCj4gCSAqLwoKV2lsbCBiZSBpbiB2MiB0b28g
Oi0pCgpSZWdhcmRzLApNaWNoYWVsIFdhbmcKCj4gCj4gLS0gU3RldmUKPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
