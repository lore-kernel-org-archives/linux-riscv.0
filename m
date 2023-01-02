Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6B7C4708D
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jan 2023 18:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jio++cf7OXVpyLv63wUp7bYMs8tEuM0nl7Y4mOVU020=; b=nQ3fJFiN4Y5klo
	xAgAXJ6dBVXcKXWz80vvZUEPGJ/CA2BFRg3PUHOnLZYdsMwnJzNmLpHdYRO9+zad8ZoBG8jI9gRyu
	FmpmoQFDgptA7dOm4m1J19/vhkunO8T1NkkxQ5Y5sDHL0741mItmWdAqiCSv5z1AO3b9wdFGQ/H4e
	3M1hcvcRidQRU63Tmdq5CHSQmyFUiuPUZ8DQd/7IzgHFpNDqgBjujrbFL+Q0UfkHejRNZKwzVSXDy
	VkEJZ8GvHu8B1LqstvE+QzrWyWgiPTnhe4GJF0dY8JsVQQpaUFQKuKSeJ66GK7HRACPdeBu4Q9uy3
	zeUL+1z2ji5ikgqnteTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCPB7-00DL7K-D3; Mon, 02 Jan 2023 18:04:53 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCPAd-00DKzM-Ss
	for linux-riscv@lists.infradead.org; Mon, 02 Jan 2023 18:04:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8112FB80DD8;
	Mon,  2 Jan 2023 18:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F46C433F0;
	Mon,  2 Jan 2023 18:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672682661;
	bh=j7GhxuoC4d5Rgo238pOIh+9KGGQvHQFTsqT3DN6rD9k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mO6+7DMaE9SeMM1SEmk6PB0bL35j8ffcbmNIVqEpVqPTinU64GLKqLFZJJQFcbL+b
	 TdQrQeOTQRsrQqWBGQSL6TzQfk1tWoQ85Q4zd/1lxSslQHysqJU6OMaPzDgGzwywi2
	 khZBn6FRrTmbKDKXmcN4kNtwKwgdNfj7W5AnDymhDgNf9JyVTAo3SPt+wl5wjNsgCi
	 lqnUxK8eCCGhJQ4Lym3beGAry2Pd8OcrYhSjGPB05sA1GcAD7O2pnZc43OTuDxWOxV
	 EmZ15VRIrzcDfGPJWkQONCFEJL00SMtFskxuLe7xZtcryqGMi2vmCKnYbev3z6G+u2
	 M0jSxCgaeDutw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Chen Guokai <chenguokai17@mails.ucas.ac.cn>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mingo@redhat.com, sfr@canb.auug.org.au
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 liaochang1@huawei.com, Chen Guokai <chenguokai17@mails.ucas.ac.cn>
Subject: Re: [PATCH v5 7/9] riscv/kprobe: Prepare detour buffer for
 optimized kprobe
In-Reply-To: <20221224114315.850130-8-chenguokai17@mails.ucas.ac.cn>
References: <20221224114315.850130-1-chenguokai17@mails.ucas.ac.cn>
 <20221224114315.850130-8-chenguokai17@mails.ucas.ac.cn>
Date: Mon, 02 Jan 2023 19:04:18 +0100
Message-ID: <87r0wcvmn1.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_100424_306962_1566DE7F 
X-CRM114-Status: GOOD (  14.10  )
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

Q2hlbiBHdW9rYWkgPGNoZW5ndW9rYWkxN0BtYWlscy51Y2FzLmFjLmNuPiB3cml0ZXM6Cgo+IEZy
b206IExpYW8gQ2hhbmcgPGxpYW9jaGFuZzFAaHVhd2VpLmNvbT4KCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9vcHQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9v
cHQuYwo+IGluZGV4IDI1OGEyODNjOTA2ZC4uYmMyMzJmY2U1YjM5IDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9vcHQuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3By
b2Jlcy9vcHQuYwo+IEBAIC0xMSw5ICsxMSwzNyBAQAo+ICAjaW5jbHVkZSA8bGludXgva3Byb2Jl
cy5oPgo+ICAjaW5jbHVkZSA8YXNtL2twcm9iZXMuaD4KPiAgI2luY2x1ZGUgPGFzbS9wYXRjaC5o
Pgo+ICsjaW5jbHVkZSA8YXNtL2FzbS1vZmZzZXRzLmg+Cj4gIAo+ICAjaW5jbHVkZSAic2ltdWxh
dGUtaW5zbi5oIgo+ICAjaW5jbHVkZSAiZGVjb2RlLWluc24uaCIKPiArI2luY2x1ZGUgIi4uLy4u
L25ldC9icGZfaml0LmgiCj4gKwo+ICtzdGF0aWMgdm9pZAoKU3VwZXItbml0LCBidXQgSSByZWFs
bHkgcHJlZmVyICpub3QqIGJyZWFraW5nIGZ1bmN0aW9uIG5hbWUgYW5kIHJldHVybgp2YWx1ZSwg
Zm9yIGdyZXBhYmlsaXR5LgoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVz
L29wdF90cmFtcG9saW5lLlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvb3B0X3RyYW1wb2xp
bmUuUwo+IGluZGV4IDE2MTYwYzQzNjdmZi4uNzVlMzRlMzczY2YyIDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9vcHRfdHJhbXBvbGluZS5TCj4gKysrIGIvYXJjaC9yaXNj
di9rZXJuZWwvcHJvYmVzL29wdF90cmFtcG9saW5lLlMKPiBAQCAtMSwxMiArMSwxMzcgQEAKPiAg
LyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSAqLwo+ICAvKgo+ICAgKiBD
b3B5cmlnaHQgKEMpIDIwMjIgR3Vva2FpIENoZW4KPiArICogQ29weXJpZ2h0IChDKSAyMDIyIExp
YW8sIENoYW5nIDxsaWFvY2hhbmcxQGh1YXdlaS5jb20+Cj4gICAqLwo+ICAKPiAgI2luY2x1ZGUg
PGxpbnV4L2xpbmthZ2UuaD4KPiAgCj4gKyNpbmNsdWRlIDxhc20vYXNtLmg+Cj4gICNpbmNsZHVl
IDxhc20vY3NyLmg+Cj4gICNpbmNsdWRlIDxhc20vYXNtLW9mZnNldHMuaD4KPiAgCj4gIFNZTV9F
TlRSWShvcHRwcm9iZV90ZW1wbGF0ZV9lbnRyeSwgU1lNX0xfR0xPQkFMLCBTWU1fQV9OT05FKQo+
ICsJYWRkaSAgc3AsIHNwLCAtKFBUX1NJWkVfT05fU1RBQ0spCj4gKwlSRUdfUyB4MSwgIFBUX1JB
KHNwKQo+ICsJUkVHX1MgeDIsICBQVF9TUChzcCkKPiArCVJFR19TIHgzLCAgUFRfR1Aoc3ApCj4g
KwlSRUdfUyB4NCwgIFBUX1RQKHNwKQo+ICsJUkVHX1MgeDUsICBQVF9UMChzcCkKPiArCVJFR19T
IHg2LCAgUFRfVDEoc3ApCj4gKwlSRUdfUyB4NywgIFBUX1QyKHNwKQo+ICsJUkVHX1MgeDgsICBQ
VF9TMChzcCkKPiArCVJFR19TIHg5LCAgUFRfUzEoc3ApCj4gKwlSRUdfUyB4MTAsIFBUX0EwKHNw
KQo+ICsJUkVHX1MgeDExLCBQVF9BMShzcCkKPiArCVJFR19TIHgxMiwgUFRfQTIoc3ApCj4gKwlS
RUdfUyB4MTMsIFBUX0EzKHNwKQo+ICsJUkVHX1MgeDE0LCBQVF9BNChzcCkKPiArCVJFR19TIHgx
NSwgUFRfQTUoc3ApCj4gKwlSRUdfUyB4MTYsIFBUX0E2KHNwKQo+ICsJUkVHX1MgeDE3LCBQVF9B
NyhzcCkKPiArCVJFR19TIHgxOCwgUFRfUzIoc3ApCj4gKwlSRUdfUyB4MTksIFBUX1MzKHNwKQo+
ICsJUkVHX1MgeDIwLCBQVF9TNChzcCkKPiArCVJFR19TIHgyMSwgUFRfUzUoc3ApCj4gKwlSRUdf
UyB4MjIsIFBUX1M2KHNwKQo+ICsJUkVHX1MgeDIzLCBQVF9TNyhzcCkKPiArCVJFR19TIHgyNCwg
UFRfUzgoc3ApCj4gKwlSRUdfUyB4MjUsIFBUX1M5KHNwKQo+ICsJUkVHX1MgeDI2LCBQVF9TMTAo
c3ApCj4gKwlSRUdfUyB4MjcsIFBUX1MxMShzcCkKPiArCVJFR19TIHgyOCwgUFRfVDMoc3ApCj4g
KwlSRUdfUyB4MjksIFBUX1Q0KHNwKQo+ICsJUkVHX1MgeDMwLCBQVF9UNShzcCkKPiArCVJFR19T
IHgzMSwgUFRfVDYoc3ApCj4gKwkvKiBVcGRhdGUgZnAgaXMgZnJpZW5kbHkgZm9yIHN0YWNrdHJh
Y2UgKi8KPiArCWFkZGkgIHMwLCBzcCwgKFBUX1NJWkVfT05fU1RBQ0spCj4gKwlqIDFmCj4gKwo+
ICtTWU1fRU5UUlkob3B0cHJvYmVfdGVtcGxhdGVfc2F2ZSwgU1lNX0xfR0xPQkFMLCBTWU1fQV9O
T05FKQo+ICsJLyoKPiArCSAqIFN0ZXAxOgo+ICsJICogRmlsbGVkIHdpdGggdGhlIHBvaW50ZXIg
dG8gb3B0aW1pemVkX2twcm9iZSBkYXRhCj4gKwkgKi8KPiArCS5kd29yZCAwCj4gKzE6Cj4gKwkv
KiBMb2FkIG9wdGltaXplX2twcm9iZSBwb2ludGVyIGZyb20gLmR3b3JkIGJlbG93ICovCj4gKwlh
dWlwYyBhMCwgMAo+ICsJUkVHX0wgYTAsIC04KGEwKQo+ICsJYWRkICAgYTEsIHNwLCB4MAo+ICsK
PiArU1lNX0VOVFJZKG9wdHByb2JlX3RlbXBsYXRlX2NhbGwsIFNZTV9MX0dMT0JBTCwgU1lNX0Ff
Tk9ORSkKPiArCS8qCj4gKwkgKiBTdGVwMjoKPiArCSAqIDxJTU1FPiBvZiBBVUlQQy9KQUxSIGFy
ZSBtb2RpZmllZCB0byB0aGUgb2Zmc2V0IHRvIG9wdGltaXplZF9jYWxsYmFjawo+ICsJICoganVt
cCB0YXJnZXQgaXMgbG9hZGVkIGZyb20gYWJvdmUgLmR3b3JkLgo+ICsJICovCj4gKwlhdWlwYyBy
YSwgMAo+ICsJamFsciAgcmEsIDAocmEpCj4gKwo+ICsJUkVHX0wgeDEsICBQVF9SQShzcCkKPiAr
CVJFR19MIHgzLCAgUFRfR1Aoc3ApCj4gKwlSRUdfTCB4NCwgIFBUX1RQKHNwKQo+ICsJUkVHX0wg
eDUsICBQVF9UMChzcCkKPiArCVJFR19MIHg2LCAgUFRfVDEoc3ApCj4gKwlSRUdfTCB4NywgIFBU
X1QyKHNwKQo+ICsJUkVHX0wgeDgsICBQVF9TMChzcCkKPiArCVJFR19MIHg5LCAgUFRfUzEoc3Ap
Cj4gKwlSRUdfTCB4MTAsIFBUX0EwKHNwKQo+ICsJUkVHX0wgeDExLCBQVF9BMShzcCkKPiArCVJF
R19MIHgxMiwgUFRfQTIoc3ApCj4gKwlSRUdfTCB4MTMsIFBUX0EzKHNwKQo+ICsJUkVHX0wgeDE0
LCBQVF9BNChzcCkKPiArCVJFR19MIHgxNSwgUFRfQTUoc3ApCj4gKwlSRUdfTCB4MTYsIFBUX0E2
KHNwKQo+ICsJUkVHX0wgeDE3LCBQVF9BNyhzcCkKPiArCVJFR19MIHgxOCwgUFRfUzIoc3ApCj4g
KwlSRUdfTCB4MTksIFBUX1MzKHNwKQo+ICsJUkVHX0wgeDIwLCBQVF9TNChzcCkKPiArCVJFR19M
IHgyMSwgUFRfUzUoc3ApCj4gKwlSRUdfTCB4MjIsIFBUX1M2KHNwKQo+ICsJUkVHX0wgeDIzLCBQ
VF9TNyhzcCkKPiArCVJFR19MIHgyNCwgUFRfUzgoc3ApCj4gKwlSRUdfTCB4MjUsIFBUX1M5KHNw
KQo+ICsJUkVHX0wgeDI2LCBQVF9TMTAoc3ApCj4gKwlSRUdfTCB4MjcsIFBUX1MxMShzcCkKPiAr
CVJFR19MIHgyOCwgUFRfVDMoc3ApCj4gKwlSRUdfTCB4MjksIFBUX1Q0KHNwKQo+ICsJUkVHX0wg
eDMwLCBQVF9UNShzcCkKPiArCVJFR19MIHgzMSwgUFRfVDYoc3ApCj4gKwlSRUdfTCB4MiwgIFBU
X1NQKHNwKQo+ICsJYWRkaSAgc3AsIHNwLCAoUFRfU0laRV9PTl9TVEFDSykKPiArCj4gK1NZTV9F
TlRSWShvcHRwcm9iZV90ZW1wbGF0ZV9pbnNuLCBTWU1fTF9HTE9CQUwsIFNZTV9BX05PTkUpCj4g
KwkvKgo+ICsJICogU3RlcDM6Cj4gKwkgKiBOT1BTIHdpbGwgYmUgcmVwbGFjZWQgYnkgdGhlIHBy
b2JlZCBpbnN0cnVjdGlvbiwgYXQgd29yc3QgY2FzZSAzIFJWQwo+ICsJICogYW5kIDEgUlZJIGlu
c3RydWN0aW9ucyBpcyBhYm91dCB0byBleGVjdXRlIG91dCBvZiBsaW5lLgo+ICsJICovCj4gKwlu
b3AKCkEgbm9wIGhlcmUgd2lsbCBiZSBlaXRoZXIgYSBjb21wcmVzc2VkIG5vcCBvciBhIG5vbi1j
b21wcmVzc2VkLApkZXBlbmRpbmcgb24gdGhlIGJ1aWxkIChDLWVuYWJsZWQgb3Igbm90KSwgcmln
aHQ/IE1heWJlIGJlIGV4cGxpY2l0IHRvCnRoZSBhc3NlbWJsZXIgd2hhdCB5b3Ugd2FudD8KCgpC
asO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
