Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C40EAC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 02:52:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67FAD6109D
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 02:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67FAD6109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=sHr7S+tRDVP4xPKnUAQmt2gpY1BRROlHwxMpr33LGVg=; b=2NhbFfB0Vjmb5gmePXlSB/UUB8
	U+3A2/uLQGSurJZ/t1Ne9kKK81luGCPpvHR9B10/CIWSEr9BECbLGNsrWeWpQTxEnGsnfgWPhpYVk
	iVgNRA7aOTxchUS1aqWkeR12AFEr3gg5s0Wuw6dzX6gq82sWJwgXnL+HnPQHpa4oQOUpbMuHq9bTH
	RUFOdKPG7852TdXDJNwwCJLYN4pV1kktaetXZ/WV6O9hRZFvNbIPBfmI0GzTwq1ZJzRnHtj7pKEWg
	0i78DbsUOLEXfiiVSDzicUd3liQda9uy0Qc0mOxME5cuTFzDuh4vj9A+lx8Asf+fwTS/Wh9Yy5VMG
	dT8NA4+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfCa4-000VMG-3E; Tue, 26 Oct 2021 02:52:52 +0000
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfCa0-000VL0-HH
 for linux-riscv@lists.infradead.org; Tue, 26 Oct 2021 02:52:50 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R691e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=31; SR=0; TI=SMTPD_---0Utj7nbU_1635216761; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0Utj7nbU_1635216761) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 26 Oct 2021 10:52:42 +0800
Subject: Re: [PATCH v4 0/2] fix & prevent the missing preemption disabling
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Guo Ren <guoren@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
 Joe Lawrence <joe.lawrence@redhat.com>,
 Colin Ian King <colin.king@canonical.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Nicholas Piggin <npiggin@gmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, live-patching@vger.kernel.org
References: <32a36348-69ee-6464-390c-3a8d6e9d2b53@linux.alibaba.com>
 <71c21f78-9c44-fdb2-f8e2-d8544b3421bd@linux.alibaba.com>
 <20211025224233.61b8e088@rorschach.local.home>
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Message-ID: <de35eedf-8558-233d-ca59-7c636bbb2da3@linux.alibaba.com>
Date: Tue, 26 Oct 2021 10:52:41 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211025224233.61b8e088@rorschach.local.home>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_195248_771180_76BCC717 
X-CRM114-Status: GOOD (  16.80  )
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

CgpPbiAyMDIxLzEwLzI2IOS4iuWNiDEwOjQyLCBTdGV2ZW4gUm9zdGVkdCB3cm90ZToKPiBPbiBU
dWUsIDI2IE9jdCAyMDIxIDEwOjA5OjEyICswODAwCj4g546L6LSHIDx5dW4ud2FuZ0BsaW51eC5h
bGliYWJhLmNvbT4gd3JvdGU6Cj4gCj4+IEp1c3QgYSBwaW5nLCB0byBzZWUgaWYgdGhlcmUgYXJl
IGFueSBtb3JlIGNvbW1lbnRzIDotUAo+IAo+IEkgZ3Vlc3MgeW91IG1pc3NlZCB3aGF0IHdlbnQg
aW50byBtYWlubGluZSAoYW5kIHlvdXIgbmFtZSBmb3VuZCBhIGJ1Zwo+IGluIG15IHBlcmwgc2Ny
aXB0IGZvciBpbXBvcnRpbmcgcGF0Y2hlcyA7LSkKPiAKPiAgIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC8yMDIxMTAxOTA5MTM0NC42NTYyOTE5OEBnYW5kYWxmLmxvY2FsLmhvbWUvCgpDb29s
fiBNaXNzaW5nIHNvbWUgY2hpbmVzZSBmb250IG1heWJlLCB0aGF0J3MgZmluZSA6LSkKCj4gCj4g
V2hpY2ggbWVhbnMgcGF0Y2ggMSBuZWVkcyB0byBjaGFuZ2U6Cj4+ICsJLyoKPj4gKwkgKiBEaXNh
YmxlIHByZWVtcHRpb24gdG8gZnVsZmlsbCB0aGUgcHJvbWlzZS4KPj4gKwkgKgo+PiArCSAqIERv
bid0IHdvcnJ5IGFib3V0IHRoZSBiaXQgMCBjYXNlcywgdGhleSBpbmRpY2F0ZQo+PiArCSAqIHRo
ZSBkaXNhYmxpbmcgYmVoYXZpb3VyIGhhcyBhbHJlYWR5IGJlZW4gZG9uZSBieQo+PiArCSAqIGlu
dGVybmFsIGNhbGwgcHJldmlvdXNseS4KPj4gKwkgKi8KPj4gKwlwcmVlbXB0X2Rpc2FibGVfbm90
cmFjZSgpOwo+PiArCj4+ICAJcmV0dXJuIGJpdCArIDE7Cj4+ICB9Cj4+Cj4+ICsvKgo+PiArICog
UHJlZW1wdGlvbiB3aWxsIGJlIGVuYWJsZWQgKGlmIGl0IHdhcyBwcmV2aW91c2x5IGVuYWJsZWQp
Lgo+PiArICovCj4+ICBzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgdHJhY2VfY2xlYXJfcmVj
dXJzaW9uKGludCBiaXQpCj4+ICB7Cj4+ICAJaWYgKCFiaXQpCj4+ICAJCXJldHVybjsKPj4KPj4g
KwlpZiAoYml0ID4gMCkKPj4gKwkJcHJlZW1wdF9lbmFibGVfbm90cmFjZSgpOwo+PiArCj4gCj4g
V2hlcmUgdGhpcyB3b250IHdvcmsgYW55bW9yZS4KPiAKPiBOZWVkIHRvIHByZWVtcHQgZGlzYWJs
ZSBhbmQgZW5hYmxlIGFsd2F5cy4KCll1cCwgd2lsbCByZWJhc2Ugb24gdGhlIGxhdGVzdCBjaGFu
Z2VzfgoKUmVnYXJkcywKTWljaGFlbCBXYW5nCgo+IAo+IC0tIFN0ZXZlCj4gCj4gCj4+ICAJYmFy
cmllcigpOwo+PiAgCWJpdC0tOwo+PiAgCXRyYWNlX3JlY3Vyc2lvbl9jbGVhcihiaXQpOwo+PiBA
QCAtMjA5LDcgKzIyNyw3IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCB0cmFjZV9jbGVh
cl9yZWN1cnNpb24oaW50IGJpdCkKPj4gICAqIHRyYWNpbmcgcmVjdXJzZWQgaW4gdGhlIHNhbWUg
Y29udGV4dCAobm9ybWFsIHZzIGludGVycnVwdCksCj4+ICAgKgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
