Return-Path: <SRS0=nroh=PD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83331C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 04:45:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E07A60FDA
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 04:45:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E07A60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MIqNfGu+S8iJCyfrfjETXrebn+iu8wAeZSzGjxnllWw=; b=jq7TjAXcI2IFeSI2SKDBlBliXz
	43RlF4L6KrCbD4EO8Off+KkZhKvHZNni+Ef7GcgiPXP6KcuMA9fNv66AWqOrYO9J6gUb24qhtfWYT
	NR0NA8M9EYYw7HNIidWnVtE350buIz7rks8NJPdVOZA+/+7VnJ1bXguTqfQCilT3r+FN5e3SX7M8c
	mZ27XSUe1U9o+xwrRT92scQDBPWi773MhS7YVJjatT+5gTIFqcd1ugl0tE1uos1oQe6EyP3dvxMfY
	X+8TPUE/7vSHJL3KIOjTodpq6oN0t8l0DPmdfOymq/Voz/xnjoY5wpppp8BCTt7gHNIBrZ4GKXu0F
	eOZJjiLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbF6D-005PsU-4g; Fri, 15 Oct 2021 04:45:41 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbF6A-005PrB-2O
 for linux-riscv@lists.infradead.org; Fri, 15 Oct 2021 04:45:39 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=31; SR=0; TI=SMTPD_---0Us3oYXy_1634273127; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0Us3oYXy_1634273127) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 15 Oct 2021 12:45:29 +0800
Subject: Re: [PATCH v3 1/2] ftrace: disable preemption between
 ftrace_test_recursion_trylock/unlock()
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Guo Ren <guoren@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Ingo Molnar <mingo@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Joe Lawrence <joe.lawrence@redhat.com>,
 Colin Ian King <colin.king@canonical.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Nicholas Piggin <npiggin@gmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, live-patching@vger.kernel.org
References: <609b565a-ed6e-a1da-f025-166691b5d994@linux.alibaba.com>
 <7e4738b5-21d4-c4d0-3136-a096bbb5cd2c@linux.alibaba.com>
 <YWhJP41cNwDphYsv@alley>
 <5e907ed3-806b-b0e5-518d-d2f3b265377f@linux.alibaba.com>
Message-ID: <a5bae9a5-9ab7-2660-caa6-facecb1dba32@linux.alibaba.com>
Date: Fri, 15 Oct 2021 12:45:27 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <5e907ed3-806b-b0e5-518d-d2f3b265377f@linux.alibaba.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_214538_291162_41AAFCB0 
X-CRM114-Status: GOOD (  12.59  )
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

CgpPbiAyMDIxLzEwLzE1IOS4iuWNiDExOjEzLCDnjovotIcgd3JvdGU6CltzbmlwXQo+PiAgIyBk
ZWZpbmUgZG9fZnRyYWNlX3JlY29yZF9yZWN1cnNpb24oaXAsIHBpcCkJZG8geyB9IHdoaWxlICgw
KQo+PiAgI2VuZGlmCj4+ICAKPj4gKy8qCj4+ICsgKiB0cmFjZV90ZXN0X2FuZF9zZXRfcmVjdXJz
aW9uKCkgaXMgY2FsbGVkIG9uIHNldmVyYWwgbGF5ZXJzCj4+ICsgKiBvZiB0aGUgZnRyYWNlIGNv
ZGUgd2hlbiBoYW5kbGluZyB0aGUgc2FtZSBmdHJhY2UgZW50cnkuCj4+ICsgKiBUaGVzZSBjYWxs
cyBtaWdodCBiZSBuZXN0ZWQvcmVjdXJzaXZlLgo+PiArICoKPj4gKyAqIEl0IHVzZXMgVFJBQ0Vf
TElTVF8qQklUcyB0byBkaXN0aW5ndWlzaCBiZXR3ZWVuIHRoaXMKPj4gKyAqIGludGVybmFsIHJl
Y3Vyc2lvbiBhbmQgcmVjdXJzaW9uIGNhdXNlZCBieSBjYWxsaW5nCj4+ICsgKiB0aGUgdHJhY2Vk
IGZ1bmN0aW9uIGJ5IHRoZSBmdHJhY2UgY29kZS4KPj4gKyAqCj4+ICsgKiBSZXR1cm5zOiA+IDAg
d2hlbiBubyByZWN1cnNpb24KPj4gKyAqICAgICAgICAgIDAgd2hlbiBjYWxsZWQgcmVjdXJzaXZl
bHkgaW50ZXJuYWxseSAoc2FmZSkKPiAKPiBUaGUgMCBjYW4gYWxzbyBoYXBwZW5lZCB3aGVuIGZ0
cmFjZSBoYW5kbGVyIHJlY3Vyc2l2ZWx5IGNhbGxlZCB0cnlsb2NrKCkKPiB1bmRlciB0aGUgc2Ft
ZSBjb250ZXh0LCBvciBub3Q/Cj4gCgpOZXZlciBtaW5kLi4uIHlvdSdyZSByaWdodCBhYm91dCB0
aGlzLgoKUmVnYXJkcywKTWljaGFlbCBXYW5nCgo+IFJlZ2FyZHMsCj4gTWljaGFlbCBXYW5nCj4g
Cj4+ICsgKgkgICAgLTEgd2hlbiB0aGUgdHJhY2VkIGZ1bmN0aW9uIHdhcyBjYWxsZWQgcmVjdXJz
aXZlbHkgZnJvbQo+PiArICogICAgICAgICAgICAgdGhlIGZ0cmFjZSBoYW5kbGVyICh1bnNhZmUp
Cj4+ICsgKi8KPj4gIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgaW50IHRyYWNlX3Rlc3RfYW5kX3Nl
dF9yZWN1cnNpb24odW5zaWduZWQgbG9uZyBpcCwgdW5zaWduZWQgbG9uZyBwaXAsCj4+ICAJCQkJ
CQkJaW50IHN0YXJ0LCBpbnQgbWF4KQo+PiAgewo+PiAgCXVuc2lnbmVkIGludCB2YWwgPSBSRUFE
X09OQ0UoY3VycmVudC0+dHJhY2VfcmVjdXJzaW9uKTsKPj4gIAlpbnQgYml0Owo+PiAgCj4+IC0J
LyogQSBwcmV2aW91cyByZWN1cnNpb24gY2hlY2sgd2FzIG1hZGUgKi8KPj4gKwkvKiBDYWxsZWQg
cmVjdXJzaXZlbHkgaW50ZXJuYWxseSBieSBkaWZmZXJlbnQgZnRyYWNlIGNvZGUgbGF5ZXJzPyAq
Lwo+PiAgCWlmICgodmFsICYgVFJBQ0VfQ09OVEVYVF9NQVNLKSA+IG1heCkKPj4gIAkJcmV0dXJu
IDA7Cj4gCj4+ICAKPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
