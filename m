Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AFE9C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 09:48:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DCB960EC0
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 09:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6DCB960EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YU/KtiytaNfhiGADdcnIMDo6NgNn6KSn/dDPpXzj34I=; b=Lj/NNdVswyvmNtiHh+qKynaWKo
	hNnJSrRoDnFkWYOkczXBh7sGvwigbSMuNjDJwqM6IgML1TXN+bYEezC7snS06R1c+w2TqkYa5mnLF
	PH75ED1lq55ddyhV0C49Bu8lM+4+Y0r/JEmFfvAJKKa+HXhtnypg7stYtvsuXdeHKeDW7EVwtiAtI
	9l90KMhIDAHvvrmibSqKcRJ0OZFA3ugDCSIbCYGWre/TTBqHRbQRZhGaG/9A29vgQTtHu6zupgc7x
	14O4iF6F81iLyyVUSi4EPYfldtCsH2phOfzhWVUUPBlpzLNIVI89GC3FU/lF0B8x30jG6pWKA4F2o
	s8Kq7SLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfJ4G-001MKj-JX; Tue, 26 Oct 2021 09:48:28 +0000
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfJ44-001MCm-HG
 for linux-riscv@lists.infradead.org; Tue, 26 Oct 2021 09:48:18 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=30; SR=0; TI=SMTPD_---0Utm5zog_1635241690; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0Utm5zog_1635241690) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 26 Oct 2021 17:48:12 +0800
Subject: Re: [PATCH v5 1/2] ftrace: disable preemption when recursion locked
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
 Masami Hiramatsu <mhiramat@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Nicholas Piggin <npiggin@gmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, live-patching@vger.kernel.org
References: <3ca92dc9-ea04-ddc2-71cd-524bfa5a5721@linux.alibaba.com>
 <333cecfe-3045-8e0a-0c08-64ff590845ab@linux.alibaba.com>
 <alpine.LSU.2.21.2110261128120.28494@pobox.suse.cz>
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Message-ID: <18ba2a71-e12d-33f7-63fe-2857b2db022c@linux.alibaba.com>
Date: Tue, 26 Oct 2021 17:48:10 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <alpine.LSU.2.21.2110261128120.28494@pobox.suse.cz>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_024816_767926_EA6BADB7 
X-CRM114-Status: GOOD (  17.46  )
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

SGksIE1pcm9zbGF2CgpPbiAyMDIxLzEwLzI2IOS4i+WNiDU6MzUsIE1pcm9zbGF2IEJlbmVzIHdy
b3RlOgo+IEhpLAo+IAo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC90cmFjZV9yZWN1cnNp
b24uaCBiL2luY2x1ZGUvbGludXgvdHJhY2VfcmVjdXJzaW9uLmgKPj4gaW5kZXggYWJlMWE1MC4u
MmJjMTUyMiAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9saW51eC90cmFjZV9yZWN1cnNpb24uaAo+
PiArKysgYi9pbmNsdWRlL2xpbnV4L3RyYWNlX3JlY3Vyc2lvbi5oCj4+IEBAIC0xMzUsNiArMTM1
LDkgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBpbnQgdHJhY2VfZ2V0X2NvbnRleHRfYml0KHZv
aWQpCj4+ICAjIGRlZmluZSBkb19mdHJhY2VfcmVjb3JkX3JlY3Vyc2lvbihpcCwgcGlwKQlkbyB7
IH0gd2hpbGUgKDApCj4+ICAjZW5kaWYKPj4KPj4gKy8qCj4+ICsgKiBQcmVlbXB0aW9uIGlzIHBy
b21pc2VkIHRvIGJlIGRpc2FibGVkIHdoZW4gcmV0dXJuIGJpdCA+IDAuCj4+ICsgKi8KPj4gIHN0
YXRpYyBfX2Fsd2F5c19pbmxpbmUgaW50IHRyYWNlX3Rlc3RfYW5kX3NldF9yZWN1cnNpb24odW5z
aWduZWQgbG9uZyBpcCwgdW5zaWduZWQgbG9uZyBwaXAsCj4+ICAJCQkJCQkJaW50IHN0YXJ0KQo+
PiAgewo+PiBAQCAtMTYyLDExICsxNjUsMTcgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBpbnQg
dHJhY2VfdGVzdF9hbmRfc2V0X3JlY3Vyc2lvbih1bnNpZ25lZCBsb25nIGlwLCB1bnNpZ24KPj4g
IAljdXJyZW50LT50cmFjZV9yZWN1cnNpb24gPSB2YWw7Cj4+ICAJYmFycmllcigpOwo+Pgo+PiAr
CXByZWVtcHRfZGlzYWJsZV9ub3RyYWNlKCk7Cj4+ICsKPj4gIAlyZXR1cm4gYml0Owo+PiAgfQo+
Pgo+PiArLyoKPj4gKyAqIFByZWVtcHRpb24gd2lsbCBiZSBlbmFibGVkIChpZiBpdCB3YXMgcHJl
dmlvdXNseSBlbmFibGVkKS4KPj4gKyAqLwo+PiAgc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lk
IHRyYWNlX2NsZWFyX3JlY3Vyc2lvbihpbnQgYml0KQo+PiAgewo+PiArCXByZWVtcHRfZW5hYmxl
X25vdHJhY2UoKTsKPj4gIAliYXJyaWVyKCk7Cj4+ICAJdHJhY2VfcmVjdXJzaW9uX2NsZWFyKGJp
dCk7Cj4+ICB9Cj4gCj4gVGhlIHR3byBjb21tZW50cyBzaG91bGQgYmUgdXBkYXRlZCB0b28gc2lu
Y2UgU3RldmVuIHJlbW92ZWQgdGhlICJiaXQgPT0gMCIgCj4gdHJpY2suCgpDb3VsZCB5b3UgcGxl
YXNlIGdpdmUgbW9yZSBoaW50IG9uIGhvdyB3aWxsIGl0IGJlIGNvcnJlY3Q/CgpJIGdldCB0aGUg
cG9pbnQgdGhhdCBiaXQgd2lsbCBubyBsb25nZXIgYmUgMCwgdGhlcmUgYXJlIG9ubHkgLTEgb3Ig
PiAwIG5vdwpzbyB0cmFjZV90ZXN0X2FuZF9zZXRfcmVjdXJzaW9uKCkgd2lsbCBkaXNhYmxlIHBy
ZWVtcHRpb24gb24gYml0ID4gMCBhbmQKdHJhY2VfY2xlYXJfcmVjdXJzaW9uKCkgd2lsbCBlbmFi
bGVkIGl0IHNpbmNlIGl0IHNob3VsZCBvbmx5IGJlIGNhbGxlZCB3aGVuCmJpdCA+IDAgKEkgcmVt
ZW1iZXIgd2UgY291bGQgdXNlIGEgV0FSTl9PTiBoZXJlIG5vdyA6LVApLgoKPiAKPj4gQEAgLTE3
OCw3ICsxODcsNyBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgdHJhY2VfY2xlYXJfcmVj
dXJzaW9uKGludCBiaXQpCj4+ICAgKiB0cmFjaW5nIHJlY3Vyc2VkIGluIHRoZSBzYW1lIGNvbnRl
eHQgKG5vcm1hbCB2cyBpbnRlcnJ1cHQpLAo+PiAgICoKPj4gICAqIFJldHVybnM6IC0xIGlmIGEg
cmVjdXJzaW9uIGhhcHBlbmVkLgo+PiAtICogICAgICAgICAgID49IDAgaWYgbm8gcmVjdXJzaW9u
Cj4+ICsgKiAgICAgICAgICAgPiAwIGlmIG5vIHJlY3Vyc2lvbi4KPj4gICAqLwo+PiAgc3RhdGlj
IF9fYWx3YXlzX2lubGluZSBpbnQgZnRyYWNlX3Rlc3RfcmVjdXJzaW9uX3RyeWxvY2sodW5zaWdu
ZWQgbG9uZyBpcCwKPj4gIAkJCQkJCQkgdW5zaWduZWQgbG9uZyBwYXJlbnRfaXApCj4gCj4gQW5k
IHRoaXMgY2hhbmdlIHdvdWxkIG5vdCBiZSBjb3JyZWN0IG5vdy4KCkkgdGhvdWdodCBpdCB3aWxs
IG5vIGxvbmdlciByZXR1cm4gMCBzbyBJIGNoYW5nZSBpdCB0byA+IDAsIGlzbid0IHRoYXQgY29y
cmVjdD8KClJlZ2FyZHMsCk1pY2hhZWwgV2FuZwoKPiAKPiBSZWdhcmRzCj4gTWlyb3NsYXYKPiAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
