Return-Path: <SRS0=nroh=PD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77957C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 03:13:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0986661073
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 03:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0986661073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Jc8HH6D2/iL6bHpH4+HvwdCipAW4furLKrWuvaqekYs=; b=OFjvrspF7rcPkY/zbogEWH8BCH
	sZ0dFdBRrHFjBZw+fYYob9Z02J6mEYN7zJQNnnwcCngcZXohhgpGKKQzUnHeZ+ypxjhflVTJPxB56
	Tg3vfjnczzWlFinqNn14fmZDBURsWU2jFBOSZhI/KZiQ56SiekBLn+QVf79R3S/x3cf0LVVbfCN0q
	x0snEaqJgQXpToOaO2/ySimsl53r2LInRu0dwCpfSlyvNBQ1ZS8htA2hHcgD2tsmDEfPg+Ja966fL
	611WNAD80HcXxI6TrCnSmxnUENa6wFvYoz1EnQHkSu4kvKX4XpDR5Ws9IYq++is60kAlaRau9s1qr
	CgSW25+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbDen-005IIi-5S; Fri, 15 Oct 2021 03:13:17 +0000
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbDek-005IH5-2w
 for linux-riscv@lists.infradead.org; Fri, 15 Oct 2021 03:13:15 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=31; SR=0; TI=SMTPD_---0Us2T5JW_1634267588; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0Us2T5JW_1634267588) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 15 Oct 2021 11:13:09 +0800
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
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Message-ID: <5e907ed3-806b-b0e5-518d-d2f3b265377f@linux.alibaba.com>
Date: Fri, 15 Oct 2021 11:13:08 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YWhJP41cNwDphYsv@alley>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_201314_359267_F6DA35C0 
X-CRM114-Status: GOOD (  39.77  )
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

CgpPbiAyMDIxLzEwLzE0IOS4i+WNiDExOjE0LCBQZXRyIE1sYWRlayB3cm90ZToKW3NuaXBdCj4+
IC0JcmV0dXJuIHRyYWNlX3Rlc3RfYW5kX3NldF9yZWN1cnNpb24oaXAsIHBhcmVudF9pcCwgVFJB
Q0VfRlRSQUNFX1NUQVJULCBUUkFDRV9GVFJBQ0VfTUFYKTsKPj4gKwlpbnQgYml0Owo+PiArCj4+
ICsJYml0ID0gdHJhY2VfdGVzdF9hbmRfc2V0X3JlY3Vyc2lvbihpcCwgcGFyZW50X2lwLCBUUkFD
RV9GVFJBQ0VfU1RBUlQsIFRSQUNFX0ZUUkFDRV9NQVgpOwo+PiArCS8qCj4+ICsJICogVGhlIHpl
cm8gYml0IGluZGljYXRlIHdlIGFyZSBuZXN0ZWQKPj4gKwkgKiBpbiBhbm90aGVyIHRyeWxvY2so
KSwgd2hpY2ggbWVhbnMgdGhlCj4+ICsJICogcHJlZW1wdGlvbiBhbHJlYWR5IGRpc2FibGVkLgo+
PiArCSAqLwo+PiArCWlmIChiaXQgPiAwKQo+PiArCQlwcmVlbXB0X2Rpc2FibGVfbm90cmFjZSgp
Owo+IAo+IElzIHRoaXMgc2FmZT8gVGhlIHByZWVtcHRpb24gaXMgZGlzYWJsZWQgb25seSB3aGVu
Cj4gdHJhY2VfdGVzdF9hbmRfc2V0X3JlY3Vyc2lvbigpIHdhcyBjYWxsZWQgYnkgZnRyYWNlX3Rl
c3RfcmVjdXJzaW9uX3RyeWxvY2soKS4KPiAKPiBXZSBtdXN0IGVpdGhlciBhbHdheXMgZGlzYWJs
ZSB0aGUgcHJlZW10aW9uIHdoZW4gYml0ID49IDAuCj4gT3Igd2UgaGF2ZSB0byBkaXNhYmxlIHRo
ZSBwcmVlbXRpb24gYWxyZWFkeSBpbgo+IHRyYWNlX3Rlc3RfYW5kX3NldF9yZWN1cnNpb24oKS4K
CkludGVybmFsIGNhbGxpbmcgb2YgdHJhY2VfdGVzdF9hbmRfc2V0X3JlY3Vyc2lvbigpIHdpbGwg
ZGlzYWJsZSBwcmVlbXB0aW9uCm9uIHN1Y2NlZWQsIGl0IHNob3VsZCBiZSBzYWZlLgoKV2UgY2Fu
IGFsc28gY29uc2lkZXIgbW92ZSB0aGUgbG9naWNhbCBpbnRvIHRyYWNlX3Rlc3RfYW5kX3NldF9y
ZWN1cnNpb24oKQphbmQgdHJhY2VfY2xlYXJfcmVjdXJzaW9uKCksIGJ1dCBJJ20gbm90IHZlcnkg
c3VyZSBhYm91dCB0aGF0Li4uIGZ0cmFjZQppbnRlcm5hbGx5IGFscmVhZHkgbWFrZSBzdXJlIHBy
ZWVtcHRpb24gZGlzYWJsZWQsIHdoYXQgdW5jb3ZlcmVkIGlzIHRob3NlCnVzZXJzIHdobyBjYWxs
IEFQSSB0cnlsb2NrL3VubG9jaywgaXNuJ3QgaXQ/Cgo+IAo+IAo+IEZpbmFsbHksIHRoZSBjb21t
ZW50IGNvbmZ1c2VkIG1lIGEgbG90LiBUaGUgZGlmZmVyZW5jZSBiZXR3ZWVuIG5lc3RpbmcgYW5k
Cj4gcmVjdXJzaW9uIGlzIGZhciBmcm9tIGNsZWFyLiBBbmQgdGhlIGNvZGUgaXMgdHJpY2t5IGxp
a3kgbGlrZSBoZWxsIDotKQo+IEkgcHJvcG9zZSB0byBhZGQgc29tZSBjb21tZW50cywgc2VlIGJl
bG93IGZvciBhIHByb3Bvc2FsLgpUaGUgY29tbWVudHMgZG8gY29uZnVzaW5nLCBJJ2xsIG1ha2Ug
aXQgc29tZXRoaW5nIGxpa2U6CgpUaGUgemVybyBiaXQgaW5kaWNhdGUgdHJhY2UgcmVjdXJzaW9u
IGhhcHBlbmVkLCB3aGF0ZXZlcgp0aGUgcmVjdXJzaXZlbHkgY2FsbCB3YXMgbWFkZSBieSBmdHJh
Y2UgaGFuZGxlciBvciBmdHJhY2UKaXRzZWxmLCB0aGUgcHJlZW1wdGlvbiBhbHJlYWR5IGRpc2Fi
bGVkLgoKV2lsbCB0aGlzIG9uZSBsb29rcyBiZXR0ZXIgdG8geW91PwoKPiAKPj4gKwo+PiArCXJl
dHVybiBiaXQ7Cj4+ICB9Cj4+ICAvKioKPj4gQEAgLTIyMiw5ICsyMzMsMTMgQEAgc3RhdGljIF9f
YWx3YXlzX2lubGluZSBpbnQgZnRyYWNlX3Rlc3RfcmVjdXJzaW9uX3RyeWxvY2sodW5zaWduZWQg
bG9uZyBpcCwKPj4gICAqIEBiaXQ6IFRoZSByZXR1cm4gb2YgYSBzdWNjZXNzZnVsIGZ0cmFjZV90
ZXN0X3JlY3Vyc2lvbl90cnlsb2NrKCkKPj4gICAqCj4+ICAgKiBUaGlzIGlzIHVzZWQgYXQgdGhl
IGVuZCBvZiBhIGZ0cmFjZSBjYWxsYmFjay4KPj4gKyAqCj4+ICsgKiBQcmVlbXB0aW9uIHdpbGwg
YmUgZW5hYmxlZCAoaWYgaXQgd2FzIHByZXZpb3VzbHkgZW5hYmxlZCkuCj4+ICAgKi8KPj4gIHN0
YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBmdHJhY2VfdGVzdF9yZWN1cnNpb25fdW5sb2NrKGlu
dCBiaXQpCj4+ICB7Cj4+ICsJaWYgKGJpdCkKPiAKPiBUaGlzIGlzIG5vdCBzeW1ldHJpYyB3aXRo
IHRyeWxvY2soKS4gSXQgc2hvdWxkIGJlOgo+IAo+IAlpZiAoYml0ID4gMCkKPiAKPiBBbnl3YXks
IHRyYWNlX2NsZWFyX3JlY3Vyc2lvbigpIHF1aWVudGx5IGlnbm9yZXMgYml0ICE9IDAKClllcywg
Yml0ID09IDAgc2hvdWxkIG5vdCBoYXBwZW4gaW4gaGVyZS4KCj4gCj4gCj4+ICsJCXByZWVtcHRf
ZW5hYmxlX25vdHJhY2UoKTsKPj4gIAl0cmFjZV9jbGVhcl9yZWN1cnNpb24oYml0KTsKPj4gIH0K
PiAKPiAKPiBCZWxvdyBpcyBteSBwcm9wb3NlZCBwYXRjaCB0aGF0IHRyaWVzIHRvIGJldHRlciBl
eHBsYWluIHRoZSByZWN1cnNpb24KPiBjaGVjazoKPiAKPiBGcm9tIDIwZDY5ZjExZTI2ODMyNjJm
YTAwNDNiODAzOTk5MDYxY2JhYzU0M2YgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gRnJvbTog
UGV0ciBNbGFkZWsgPHBtbGFkZWtAc3VzZS5jb20+Cj4gRGF0ZTogVGh1LCAxNCBPY3QgMjAyMSAx
Njo1NzozOSArMDIwMAo+IFN1YmplY3Q6IFtQQVRDSF0gdHJhY2U6IEJldHRlciBkZXNjcmliZSB0
aGUgcmVjdXJzaW9uIGNoZWNrIHJldHVybiB2YWx1ZXMKPiAKPiBUaGUgdHJhY2UgcmVjdXJzaW9u
IGNoZWNrIG1pZ2h0IGJlIGNhbGxlZCByZWN1cnNpdmVseSBieSBkaWZmZXJlbnQKPiBsYXllcnMg
b2YgdGhlIHRyYWNpbmcgY29kZS4gSXQgaXMgc2FmZSByZWN1cnNpb24gYW5kIHRoZSBjaGVjawo+
IGlzIGV2ZW4gb3B0aW1pemVkIGZvciB0aGlzIGNhc2UuCj4gCj4gVGhlIHByb2JsZW1hdGljIHJl
Y3Vyc2lvbiBpcyB3aGVuIHRoZSB0cmFjZWQgZnVuY3Rpb24gaXMgY2FsbGVkCj4gYnkgdGhlIHRy
YWNpbmcgY29kZS4gVGhpcyBpcyBwcm9wZXJseSBkZXRlY3RlZC4KPiAKPiBUcnkgdG8gZXhwbGFp
biB0aGlzIGRpZmZlcmVuY2UgYSBiZXR0ZXIgd2F5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBldHIg
TWxhZGVrIDxwbWxhZGVrQHN1c2UuY29tPgo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L3RyYWNlX3Jl
Y3Vyc2lvbi5oIHwgMTYgKysrKysrKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L3RyYWNlX3JlY3Vyc2lvbi5oIGIvaW5jbHVkZS9saW51eC90cmFjZV9yZWN1cnNpb24uaAo+IGlu
ZGV4IGE5ZjljNTcxNGU2NS4uYjVlZmI4MDRlZmRmIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGlu
dXgvdHJhY2VfcmVjdXJzaW9uLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L3RyYWNlX3JlY3Vyc2lv
bi5oCj4gQEAgLTE1OSwxMyArMTU5LDI3IEBAIGV4dGVybiB2b2lkIGZ0cmFjZV9yZWNvcmRfcmVj
dXJzaW9uKHVuc2lnbmVkIGxvbmcgaXAsIHVuc2lnbmVkIGxvbmcgcGFyZW50X2lwKTsKPiAgIyBk
ZWZpbmUgZG9fZnRyYWNlX3JlY29yZF9yZWN1cnNpb24oaXAsIHBpcCkJZG8geyB9IHdoaWxlICgw
KQo+ICAjZW5kaWYKPiAgCj4gKy8qCj4gKyAqIHRyYWNlX3Rlc3RfYW5kX3NldF9yZWN1cnNpb24o
KSBpcyBjYWxsZWQgb24gc2V2ZXJhbCBsYXllcnMKPiArICogb2YgdGhlIGZ0cmFjZSBjb2RlIHdo
ZW4gaGFuZGxpbmcgdGhlIHNhbWUgZnRyYWNlIGVudHJ5Lgo+ICsgKiBUaGVzZSBjYWxscyBtaWdo
dCBiZSBuZXN0ZWQvcmVjdXJzaXZlLgo+ICsgKgo+ICsgKiBJdCB1c2VzIFRSQUNFX0xJU1RfKkJJ
VHMgdG8gZGlzdGluZ3Vpc2ggYmV0d2VlbiB0aGlzCj4gKyAqIGludGVybmFsIHJlY3Vyc2lvbiBh
bmQgcmVjdXJzaW9uIGNhdXNlZCBieSBjYWxsaW5nCj4gKyAqIHRoZSB0cmFjZWQgZnVuY3Rpb24g
YnkgdGhlIGZ0cmFjZSBjb2RlLgo+ICsgKgo+ICsgKiBSZXR1cm5zOiA+IDAgd2hlbiBubyByZWN1
cnNpb24KPiArICogICAgICAgICAgMCB3aGVuIGNhbGxlZCByZWN1cnNpdmVseSBpbnRlcm5hbGx5
IChzYWZlKQoKVGhlIDAgY2FuIGFsc28gaGFwcGVuZWQgd2hlbiBmdHJhY2UgaGFuZGxlciByZWN1
cnNpdmVseSBjYWxsZWQgdHJ5bG9jaygpCnVuZGVyIHRoZSBzYW1lIGNvbnRleHQsIG9yIG5vdD8K
ClJlZ2FyZHMsCk1pY2hhZWwgV2FuZwoKPiArICoJICAgIC0xIHdoZW4gdGhlIHRyYWNlZCBmdW5j
dGlvbiB3YXMgY2FsbGVkIHJlY3Vyc2l2ZWx5IGZyb20KPiArICogICAgICAgICAgICAgdGhlIGZ0
cmFjZSBoYW5kbGVyICh1bnNhZmUpCj4gKyAqLwo+ICBzdGF0aWMgX19hbHdheXNfaW5saW5lIGlu
dCB0cmFjZV90ZXN0X2FuZF9zZXRfcmVjdXJzaW9uKHVuc2lnbmVkIGxvbmcgaXAsIHVuc2lnbmVk
IGxvbmcgcGlwLAo+ICAJCQkJCQkJaW50IHN0YXJ0LCBpbnQgbWF4KQo+ICB7Cj4gIAl1bnNpZ25l
ZCBpbnQgdmFsID0gUkVBRF9PTkNFKGN1cnJlbnQtPnRyYWNlX3JlY3Vyc2lvbik7Cj4gIAlpbnQg
Yml0Owo+ICAKPiAtCS8qIEEgcHJldmlvdXMgcmVjdXJzaW9uIGNoZWNrIHdhcyBtYWRlICovCj4g
KwkvKiBDYWxsZWQgcmVjdXJzaXZlbHkgaW50ZXJuYWxseSBieSBkaWZmZXJlbnQgZnRyYWNlIGNv
ZGUgbGF5ZXJzPyAqLwo+ICAJaWYgKCh2YWwgJiBUUkFDRV9DT05URVhUX01BU0spID4gbWF4KQo+
ICAJCXJldHVybiAwOwoKPiAgCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
