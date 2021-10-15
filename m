Return-Path: <SRS0=nroh=PD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340BEC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 09:28:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3FB0610D2
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 09:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3FB0610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5y2XhMK3vwrohs3gkBnxru1VTqAm7lizQFgZEi8IuPo=; b=4dWHFC+wqcQX2oseuk3ZAUpURs
	be36uF5deM+6Z0RlLrOXqLF77nY/ahnk1v31hRm1RzF0y7SAp4JSAplqxPUXxaZlJ/U3gd3wQmO62
	CDV2uwqzz61l8YfnfZtaXk7xs/dCmAEr5FKpdaxz/FgbydLcGZ28Dzl8Sk+1w6hJ4jwHUUMw/2hWG
	y1Hkh6Bk4UifJbmX1vKjhgXGa7M+kEQRxChBN/+2nCxRUh294lfxNpqcyN8ChEkNr0RyK6ju7tn+J
	/+G5IFK4BLDuS+tSzhgL+8J+0PCzlTwIFmYj+IZkHOcYBjF83N3SmeYadKHNpfhh1E68qYYbahLOp
	1SLdxHaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbJVa-006HK2-DJ; Fri, 15 Oct 2021 09:28:10 +0000
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbJGb-006BpH-Em
 for linux-riscv@lists.infradead.org; Fri, 15 Oct 2021 09:12:43 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=31; SR=0; TI=SMTPD_---0Us6AJpi_1634289146; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0Us6AJpi_1634289146) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 15 Oct 2021 17:12:28 +0800
Subject: Re: [PATCH v3 1/2] ftrace: disable preemption between
 ftrace_test_recursion_trylock/unlock()
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
 <YWktujP6DcMnRIXT@alley>
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Message-ID: <3c87e825-e907-cba0-e95f-28878356fc71@linux.alibaba.com>
Date: Fri, 15 Oct 2021 17:12:26 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YWktujP6DcMnRIXT@alley>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_021241_739989_BB6043F0 
X-CRM114-Status: GOOD (  39.75  )
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

CgpPbiAyMDIxLzEwLzE1IOS4i+WNiDM6MjgsIFBldHIgTWxhZGVrIHdyb3RlOgo+IE9uIEZyaSAy
MDIxLTEwLTE1IDExOjEzOjA4LCDnjovotIcgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDIwMjEvMTAvMTQg
5LiL5Y2IMTE6MTQsIFBldHIgTWxhZGVrIHdyb3RlOgo+PiBbc25pcF0KPj4+PiAtCXJldHVybiB0
cmFjZV90ZXN0X2FuZF9zZXRfcmVjdXJzaW9uKGlwLCBwYXJlbnRfaXAsIFRSQUNFX0ZUUkFDRV9T
VEFSVCwgVFJBQ0VfRlRSQUNFX01BWCk7Cj4+Pj4gKwlpbnQgYml0Owo+Pj4+ICsKPj4+PiArCWJp
dCA9IHRyYWNlX3Rlc3RfYW5kX3NldF9yZWN1cnNpb24oaXAsIHBhcmVudF9pcCwgVFJBQ0VfRlRS
QUNFX1NUQVJULCBUUkFDRV9GVFJBQ0VfTUFYKTsKPj4+PiArCS8qCj4+Pj4gKwkgKiBUaGUgemVy
byBiaXQgaW5kaWNhdGUgd2UgYXJlIG5lc3RlZAo+Pj4+ICsJICogaW4gYW5vdGhlciB0cnlsb2Nr
KCksIHdoaWNoIG1lYW5zIHRoZQo+Pj4+ICsJICogcHJlZW1wdGlvbiBhbHJlYWR5IGRpc2FibGVk
Lgo+Pj4+ICsJICovCj4+Pj4gKwlpZiAoYml0ID4gMCkKPj4+PiArCQlwcmVlbXB0X2Rpc2FibGVf
bm90cmFjZSgpOwo+Pj4KPj4+IElzIHRoaXMgc2FmZT8gVGhlIHByZWVtcHRpb24gaXMgZGlzYWJs
ZWQgb25seSB3aGVuCj4+PiB0cmFjZV90ZXN0X2FuZF9zZXRfcmVjdXJzaW9uKCkgd2FzIGNhbGxl
ZCBieSBmdHJhY2VfdGVzdF9yZWN1cnNpb25fdHJ5bG9jaygpLgo+Pj4KPj4+IFdlIG11c3QgZWl0
aGVyIGFsd2F5cyBkaXNhYmxlIHRoZSBwcmVlbXRpb24gd2hlbiBiaXQgPj0gMC4KPj4+IE9yIHdl
IGhhdmUgdG8gZGlzYWJsZSB0aGUgcHJlZW10aW9uIGFscmVhZHkgaW4KPj4+IHRyYWNlX3Rlc3Rf
YW5kX3NldF9yZWN1cnNpb24oKS4KPj4KPj4gSW50ZXJuYWwgY2FsbGluZyBvZiB0cmFjZV90ZXN0
X2FuZF9zZXRfcmVjdXJzaW9uKCkgd2lsbCBkaXNhYmxlIHByZWVtcHRpb24KPj4gb24gc3VjY2Vl
ZCwgaXQgc2hvdWxkIGJlIHNhZmUuCj4gCj4gdHJhY2VfdGVzdF9hbmRfc2V0X3JlY3Vyc2lvbigp
IGRvZXMgX25vdF8gZGlzYWJsZSBwcmVlbXRpb24hCj4gSXQgd29ya3Mgb25seSBiZWNhdXNlIGFs
bCBjYWxsZXJzIGRpc2FibGUgdGhlIHByZWVtcHRpb24uCgpZdXAuCgo+IAo+IEl0IG1lYW5zIHRo
YXQgdGhlIGNvbW1lbnQgaXMgd3JvbmcuIEl0IGlzIG5vdCBndWFyYW50dGVkIHRoYXQgdGhlCj4g
cHJlZW1wdGlvbiB3aWxsIGJlIGRpc2FibGVkLiBJdCB3b3JrcyBvbmx5IGJ5IGNoYW5jZS4KPiAK
PiAKPj4gV2UgY2FuIGFsc28gY29uc2lkZXIgbW92ZSB0aGUgbG9naWNhbCBpbnRvIHRyYWNlX3Rl
c3RfYW5kX3NldF9yZWN1cnNpb24oKQo+PiBhbmQgdHJhY2VfY2xlYXJfcmVjdXJzaW9uKCksIGJ1
dCBJJ20gbm90IHZlcnkgc3VyZSBhYm91dCB0aGF0Li4uIGZ0cmFjZQo+PiBpbnRlcm5hbGx5IGFs
cmVhZHkgbWFrZSBzdXJlIHByZWVtcHRpb24gZGlzYWJsZWQKPiAKPiBIb3c/IEJlY2F1c2UgaXQg
Y2FsbHMgdHJhY2VfdGVzdF9hbmRfc2V0X3JlY3Vyc2lvbigpIHZpYSB0aGUgdHJ5bG9jaygpIEFQ
ST8KCkkgbWVhbiBjdXJyZW50bHkgYWxsIHRoZSBkaXJlY3QgY2FsbGVyIG9mIHRyYWNlX3Rlc3Rf
YW5kX3NldF9yZWN1cnNpb24oKQpoYXZlIGRpc2FibGVkIHRoZSBwcmVlbXB0aW9uIGFzIHlvdSBt
ZW50aW9uZWQgYWJvdmUsIGJ1dCB5ZXMgaWYgYW55b25lIGxhdGVyCndyaXRlIHNvbWUga2VybmVs
IGNvZGUgdG8gY2FsbCB0cmFjZV90ZXN0X2FuZF9zZXRfcmVjdXJzaW9uKCkgd2l0aG91dApkaXNh
YmxpbmcgcHJlZW1wdGlvbiBhZnRlciwgdGhlbiBwcm9taXNlIGJyb2tlbi4KCj4gCj4gCj4+ICwg
d2hhdCB1bmNvdmVyZWQgaXMgdGhvc2UgdXNlcnMgd2hvIGNhbGwgQVBJIHRyeWxvY2svdW5sb2Nr
LCBpc24ndAo+PiBpdD8KPiAKPiBBbmQgdGhpcyBpcyBleGFjdGx5IHRoZSBwcm9ibGVtLiB0cmFj
ZV90ZXN0X2FuZF9zZXRfcmVjdXJzaW9uKCkgaXMgaW4KPiBhIHB1YmxpYyBoZWFkZXIuIEFueW9u
ZSBjb3VsZCB1c2UgaXQuIEFuZCBpZiBhbnlvbmUgdXNlcyBpdCBpbiB0aGUKPiBmdXR1cmUgd2l0
aG91dCB0aGUgdHJ5bG9jaygpIGFuZCBkb2VzIG5vdCBkaXNhYmxlIHRoZSBwcmVlbXRpb24KPiBl
eHBsaWNpdGVseSB0aGVuIHdlIGFyZSBsb3N0IGFnYWluLgo+IAo+IEFuZCBpdCBpcyBldmVuIG1v
cmUgZGFuZ2Vyb3VzLiBUaGUgb3JpZ2luYWwgY29kZSBkaXNhYmxlZCB0aGUKPiBwcmVlbXRpb24g
b24gdmFyaW91cyBsYXllcnMuIEFzIGEgcmVzdWx0LCB0aGUgcHJlZW10aW9uIHdhcyBkaXNhYmxl
ZAo+IHNldmVyYWwgdGltZXMgZm9yIHN1cmUuIEl0IG1lYW5zIHRoYXQgdGhlIGRlZXBlciBsYXll
cnMgd2VyZQo+IGFsd2F5cyBvbiB0aGUgc2FmZSBzaWRlLgo+IAo+IFdpdGggdGhpcyBwYXRjaCwg
aWYgdGhlIGZpcnN0IHRyYWNlX3Rlc3RfYW5kX3NldF9yZWN1cnNpb24oKSBjYWxsZXIKPiBkb2Vz
IG5vdCBkaXNhYmxlIHByZWVtdGlvbiB0aGVuIHRyeWxvY2soKSB3aWxsIG5vdCBkaXNhYmxlIGl0
IGVpdGhlcgo+IGFuZCB0aGUgZW50aXJlIGNvZGUgaXMgcHJvY2NlZWQgd2l0aCBwcmVlbXRpb24g
ZW5hYmxlZC4KClllcywgd2hhdCBjb25mdXNpbmcgbWUgYXQgZmlyc3QgaXMgdGhhdCBJIHRoaW5r
IHBlb3BsZSB3aG8gY2FsbAp0cmFjZV90ZXN0X2FuZF9zZXRfcmVjdXJzaW9uKCkgd2l0aG91dCB0
cnlsb2NrKCkgY2FuIG9ubHkgYmUgYQpmdHJhY2UgaGFja2VyLCBub3QgYSB1c2VyLCBidXQgaW4g
Y2FzZSBpZiBhbnlvbmUgY2FuIHVzZSBpdCB3aXRob3V0CnJlc3BlY3QgdG8gcHJlZW1wdGlvbiBz
dHVmZiwgdGhlbiBJIHRoaW5rIHRoZSBsb2dpY2FsIHNob3VsZCBiZSBpbnNpZGUKdHJhY2VfdGVz
dF9hbmRfc2V0X3JlY3Vyc2lvbigpIHJhdGhlciB0aGFuIHRyeWxvY2soKS4KCj4gCj4gCj4+PiBG
aW5hbGx5LCB0aGUgY29tbWVudCBjb25mdXNlZCBtZSBhIGxvdC4gVGhlIGRpZmZlcmVuY2UgYmV0
d2VlbiBuZXN0aW5nIGFuZAo+Pj4gcmVjdXJzaW9uIGlzIGZhciBmcm9tIGNsZWFyLiBBbmQgdGhl
IGNvZGUgaXMgdHJpY2t5IGxpa3kgbGlrZSBoZWxsIDotKQo+Pj4gSSBwcm9wb3NlIHRvIGFkZCBz
b21lIGNvbW1lbnRzLCBzZWUgYmVsb3cgZm9yIGEgcHJvcG9zYWwuCj4+IFRoZSBjb21tZW50cyBk
byBjb25mdXNpbmcsIEknbGwgbWFrZSBpdCBzb21ldGhpbmcgbGlrZToKPj4KPj4gVGhlIHplcm8g
Yml0IGluZGljYXRlIHRyYWNlIHJlY3Vyc2lvbiBoYXBwZW5lZCwgd2hhdGV2ZXIKPj4gdGhlIHJl
Y3Vyc2l2ZWx5IGNhbGwgd2FzIG1hZGUgYnkgZnRyYWNlIGhhbmRsZXIgb3IgZnRyYWNlCj4+IGl0
c2VsZiwgdGhlIHByZWVtcHRpb24gYWxyZWFkeSBkaXNhYmxlZC4KPiAKPiBJIGFtIHNvcnJ5IGJ1
dCBpdCBpcyBzdGlsbCBjb25mdXNpbmcuIFdlIG5lZWQgdG8gZmluZCBhIGJldHRlciB3YXkKPiBo
b3cgdG8gY2xlYXJseSBleHBsYWluIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIHNhZmUgYW5k
Cj4gdW5zYWZlIHJlY3Vyc2lvbi4KPiAKPiBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgdGhlIHJl
Y3Vyc2lvbiBpczoKPiAKPiAgICsgInVuc2FmZSIgd2hlbiB0aGUgdHJhY2UgY29kZSByZWN1cnNp
dmVseSBlbnRlcnMgdGhlIHNhbWUgdHJhY2UgcG9pbnQuCj4gCj4gICArICJzYWZlIiB3aGVuIGZ0
cmFjZV90ZXN0X3JlY3Vyc2lvbl90cnlsb2NrKCkgaXMgY2FsbGVkIHJlY3Vyc2l2ZWxseQo+ICAg
ICB3aGlsZSBzdGlsbCBwcm9jZXNzaW5nIHRoZSBzYW1lIHRyYWNlIGVudHJ5LgoKTWF5YmUgdGFr
ZSBzb21lIGV4YW1wbGUgd291bGQgYmUgZWFzaWVyIHRvIHVuZGVyc3RhbmQuLi4KCkN1cnJlbnRs
eSB0aGVyZSBhcmUgdHdvIHdheSBvZiB1c2luZyBmdHJhY2VfdGVzdF9yZWN1cnNpb25fdHJ5bG9j
aygpLApvbmUgd2l0aCBUUkFDRV9GVFJBQ0VfWFhYIHdlIG1hcmsgYXMgQSwgb25lIHdpdGggVFJB
Q0VfTElTVF9YWFggd2UgbWFyawphcyBCLCB0aGVuOgoKQSBmb2xsb3dlZCBieSBCIG9uIHNhbWUg
Y29udGV4dCBnb3QgYml0ID4gMApCIGZvbGxvd2VkIGJ5IEEgb24gYW55IGNvbnRleHQgZ290IGJp
dCAwCkEgZm9sbG93ZWQgYnkgQSBvbiBzYW1lIGNvbnRleHQgZ290IGJpdCA+IDAKQSBmb2xsb3dl
ZCBieSBBIGZvbGxvd2VkIGJ5IEEgb24gc2FtZSBjb250ZXh0IGdvdCBiaXQgLTEKQiBmb2xsb3dl
ZCBieSBCIG9uIHNhbWUgY29udGV4dCBnb3QgYml0ID4gMApCIGZvbGxvd2VkIGJ5IEIgZm9sbG93
ZWQgYnkgQiBvbiBzYW1lIGNvbnRleHQgZ290IGJpdCAtMQoKSWYgd2UgZ2V0IHJpZCBvZiB0aGUg
VFJBQ0VfVFJBTlNJVElPTl9CSVQgd2hpY2ggYWxsb3dlZCByZWN1cnNpb24gZm9yCm9uZXRpbWUs
IHRoZW4gaXQgd291bGQgYmU6CgpBIGZvbGxvd2VkIGJ5IEIgb24gc2FtZSBjb250ZXh0IGdvdCBi
aXQgPiAwCkIgZm9sbG93ZWQgYnkgQSBvbiBhbnkgY29udGV4dCBnb3QgYml0IDAKQSBmb2xsb3dl
ZCBieSBBIG9uIHNhbWUgY29udGV4dCBnb3QgYml0IC0xCkIgZm9sbG93ZWQgYnkgQiBvbiBzYW1l
IGNvbnRleHQgZ290IGJpdCAtMQoKU28gYXMgbG9uZyBhcyBubyBjb250aW51b3VzbHkgQUFBIGl0
J3Mgc2FmZT8KCj4gCj4+Pj4gKwo+Pj4+ICsJcmV0dXJuIGJpdDsKPj4+PiAgfQo+Pj4+ICAvKioK
Pj4+PiBAQCAtMjIyLDkgKzIzMywxMyBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIGludCBmdHJh
Y2VfdGVzdF9yZWN1cnNpb25fdHJ5bG9jayh1bnNpZ25lZCBsb25nIGlwLAo+Pj4+ICAgKiBAYml0
OiBUaGUgcmV0dXJuIG9mIGEgc3VjY2Vzc2Z1bCBmdHJhY2VfdGVzdF9yZWN1cnNpb25fdHJ5bG9j
aygpCj4+Pj4gICAqCj4+Pj4gICAqIFRoaXMgaXMgdXNlZCBhdCB0aGUgZW5kIG9mIGEgZnRyYWNl
IGNhbGxiYWNrLgo+Pj4+ICsgKgo+Pj4+ICsgKiBQcmVlbXB0aW9uIHdpbGwgYmUgZW5hYmxlZCAo
aWYgaXQgd2FzIHByZXZpb3VzbHkgZW5hYmxlZCkuCj4+Pj4gICAqLwo+Pj4+ICBzdGF0aWMgX19h
bHdheXNfaW5saW5lIHZvaWQgZnRyYWNlX3Rlc3RfcmVjdXJzaW9uX3VubG9jayhpbnQgYml0KQo+
Pj4+ICB7Cj4+Pj4gKwlpZiAoYml0KQo+Pj4KPj4+IFRoaXMgaXMgbm90IHN5bWV0cmljIHdpdGgg
dHJ5bG9jaygpLiBJdCBzaG91bGQgYmU6Cj4+Pgo+Pj4gCWlmIChiaXQgPiAwKQo+Pj4KPj4+IEFu
eXdheSwgdHJhY2VfY2xlYXJfcmVjdXJzaW9uKCkgcXVpZW50bHkgaWdub3JlcyBiaXQgIT0gMAo+
Pgo+PiBZZXMsIGJpdCA9PSAwIHNob3VsZCBub3QgaGFwcGVuIGluIGhlcmUuCj4gCj4gWWVzLCBp
dCAic2hvdWxkIiBub3QgaGFwcGVuLiBNeSBwb2ludCBpcyB0aGF0IHdlIGNvdWxkIG1ha2UgdGhl
IEFQSQo+IG1vcmUgc2FmZS4gV2UgY291bGQgZG8gdGhlIHJpZ2h0IHRoaW5nIHdoZW4KPiBmdHJh
Y2VfdGVzdF9yZWN1cnNpb25fdW5sb2NrKCkgaXMgY2FsbGVkIHdpdGggbmVnYXRpdmUgQGJpdC4K
PiBJZGVhbGx5LCB3ZSBzaG91bGQgYWxzbyB3YXJuIGFib3V0IHRoZSBtaXMtdXNlLgoKQWdyZWUg
d2l0aCBhIFdBUk4gaGVyZSBvbiBiaXQgMC4KCj4gCj4gCj4gQW55d2F5LCBsZXQncyB3YWl0IGZv
ciBTdGV2ZW4uIEl0IHNlZW1zIHRoYXQgaGUgZm91bmQgYW5vdGhlciBwcm9ibGVtCj4gd2l0aCB0
aGUgQVBJIHRoYXQgc2hvdWxkIGJlIHNvbHZlZCBmaXJzdC4gVGhlIGZpeCB3aWxsIHByb2JhYmx5
Cj4gYWxzbyBoZWxwIHRvIGJldHRlciB1bmRlcnN0YW5kIHRoZSAic2FmZSIgdnMgInVuc2FmZSIg
cmVjdXJzaW9uLgoKQ29vbH4KClJlZ2FyZHMsCk1pY2hhZWwgV2FuZwoKPiAKPiBCZXN0IFJlZ2Fy
ZHMsCj4gUGV0cgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
