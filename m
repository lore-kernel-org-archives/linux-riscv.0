Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649F7E6F08B
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 12:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dq3QRonUQ/XUfS95Y/nrfvuWRq0uAhMw2/JQjYdZmxY=; b=nc3qYNkIkNiPed
	jxVmtl8IZhXQPllpQD1pkdJZl6urdVIFLZBF/WB/iACj/XG6fxoF8ZypeLBlwhXUkLtgf94oMzRd2
	w7w6rKBRaFUN76PNrZdtJVAY9heHGC2+G1D0LSVVouTZ8l0T+WAbsmQOkhVW42gvXYYxANYvjR5+B
	5ZAaUoOh7LdGU9KP0AxOfmVH7n+N/+U5JZk6PjDWoe66poi3SsQGc1vzwXEMZqmls1fUT/euWdnG3
	Wxq/9EVpwsHh9H5veHUHvAnPWc6K69t+ecidLyzXrW4YQTfGR3Q2fdOqmHezgP3FkOLkZB+lnyqem
	bI2hnColIx1NUAM8OCog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1nI-0000000FUxj-1eFk;
	Tue, 23 Dec 2025 12:47:16 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1nE-0000000FUx1-1fSr
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 12:47:14 +0000
Received: from [192.168.0.114] (unknown [114.241.82.59])
	by APP-03 (Coremail) with SMTP id rQCowABXcNc7j0pp_E60AQ--.39070S2;
	Tue, 23 Dec 2025 20:46:52 +0800 (CST)
Message-ID: <30975f96-db5f-4072-a371-4ac252139e4e@iscas.ac.cn>
Date: Tue, 23 Dec 2025 20:46:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] rust: generate a fatal error if BINDGEN_TARGET is
 undefined
To: Mingcong Bai <jeffbai@aosc.io>, Asuna Yang <spriteovo@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Jonathan Corbet <corbet@lwn.net>, Jason Montleon <jmontleo@redhat.com>,
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>,
 Kexy Biscuit <kexybiscuit@aosc.io>, Xi Ruoyao <xry111@xry111.site>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
 <20251204-gcc-rust-v5-v5-2-2d4f20d86c24@gmail.com>
 <6bd26802-e3ce-43e2-b28d-f23e13492458@aosc.io>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <6bd26802-e3ce-43e2-b28d-f23e13492458@aosc.io>
X-CM-TRANSID: rQCowABXcNc7j0pp_E60AQ--.39070S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF1kCryxAryxWrWDGr47CFg_yoW8AF1rpa
	1xG3Z0yr4kGrW8Cwn2y3yDu34Ykrn5KrWUJas5J3y2grZ0gay8tr4xtF13WryDWF1ku3yF
	vwsI9a4fGrZ0vw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxUv4EEDUUUU
X-Originating-IP: [114.241.82.59]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_044712_813768_74A92D3B 
X-CRM114-Status: GOOD (  11.90  )
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

T24gMTIvMjMvMjUgMjA6MDksIE1pbmdjb25nIEJhaSB3cm90ZToKPiBIaSBBc3VuYSwKPgo+IOWc
qCAyMDI1LzEyLzQgMTU6NTQsIEFzdW5hIFlhbmcg5YaZ6YGTOgo+PiBGcm9tOiBBc3VuYSBZYW5n
IDxzcHJpdGVvdm9AZ21haWwuY29tPgo+Pgo+PiBHZW5lcmF0ZSBhIGZyaWVuZGx5IGZhdGFsIGVy
cm9yIGlmIHRoZSB0YXJnZXQgdHJpcGxldCBpcyB1bmRlZmluZWQgZm9yCj4+IGJpbmRnZW4sIHJh
dGhlciB0aGFuIGhhdmluZyB0aGUgY29tcGlsZXIgZ2VuZXJhdGUgb2JzY3VyZSBlcnJvciBtZXNz
YWdlcwo+PiBkdXJpbmcgdGhlIGJ1aWxkIHN0YWdlLgo+Pgo+PiBUaGlzIHBpZWNlIG9mIGNvZGUg
aXMgY29waWVkIGZyb20gYHNjcmlwdHMvTWFrZWZpbGUuY2xhbmdgLgo+Pgo+PiBCZWZvcmUgdGhp
cyBjb21taXQsIGVycm9yIG1lc3NhZ2VzIG1pZ2h0IGxvb2sgbGlrZToKPj4KPj4gZXJyb3I6IHVu
a25vd24gYXJndW1lbnQ6ICctbW5vLXJpc2N2LWF0dHJpYnV0ZScKPj4gZXJyb3I6IHVuc3VwcG9y
dGVkIGFyZ3VtZW50ICdtZWRhbnknIHRvIG9wdGlvbiAnLW1jbW9kZWw9JyBmb3IgdGFyZ2V0Cj4+
ICd1bmtub3duJwo+PiBlcnJvcjogdW5zdXBwb3J0ZWQgb3B0aW9uICctbWFyY2g9JyBmb3IgdGFy
Z2V0ICcnCj4+IGVycm9yOiB1bnN1cHBvcnRlZCBvcHRpb24gJy1tbm8tc2F2ZS1yZXN0b3JlJyBm
b3IgdGFyZ2V0ICcnCj4+IGVycm9yOiB1bmtub3duIHRhcmdldCB0cmlwbGUgJ3Vua25vd24nCj4+
IHBhbmlja2VkIGF0IGJpbmRnZW4vaXIvY29udGV4dC5yczo1NjI6MTU6Cj4+IGxpYmNsYW5nIGVy
cm9yOyBwb3NzaWJsZSBjYXVzZXMgaW5jbHVkZToKPj4gLSBJbnZhbGlkIGZsYWcgc3ludGF4Cj4+
IC0gVW5yZWNvZ25pemVkIGZsYWdzCj4+IC0gSW52YWxpZCBmbGFnIGFyZ3VtZW50cwo+PiAtIEZp
bGUgSS9PIGVycm9ycwo+PiAtIEhvc3QgdnMuIHRhcmdldCBhcmNoaXRlY3R1cmUgbWlzbWF0Y2gK
Pj4KPj4gQWNrZWQtYnk6IE1pZ3VlbCBPamVkYSA8b2plZGFAa2VybmVsLm9yZz4KPj4gU2lnbmVk
LW9mZi1ieTogQXN1bmEgWWFuZyA8U3ByaXRlT3ZPQGdtYWlsLmNvbT4KPgo+IFVuZm9ydHVuYXRl
bHksIHRoaXMgYnJva2UgYnVpbGQgZm9yIE1JUFMgYW5kIFBvd2VyUEMsIG5laXRoZXIgb2Ygd2hp
Y2gKPiBoYXMgc3VwcG9ydCBmb3IgUnVzdC4gSSBhbHNvIGZlZWwgYXMgdGhvdWdoIGl0IG1pZ2h0
IGJlIHBvaW50bGVzcyB0bwo+IGFzayBhbGwgYXJjaGl0ZWN0dXJlIHRvIGRlZmluZSBCSU5ER0VO
X1RBUkdFVCwgZXNwZWNpYWxseSB3aGVuIHN1Y2ggYQo+IHRhcmdldCBzcGVjaWZpY2F0aW9uIG1h
eSBub3QgZXZlbiBleGlzdCB1cHN0cmVhbSAoaW4gUnVzdCBvciBldmVuIGluCj4gTExWTSkuCj4K
PiBBcyBzaG93biBpbiB0aGUgZmlyc3QgcGF0Y2gsIHRoZSBvcmlnaW5hbCBNYWtlZmlsZSBkaWQg
bm90IHJlcXVpcmUKPiB0aGlzIGRlZmluaXRpb24gZWl0aGVyIChwbGVhc2UgZG8gZW5saWdodGVu
IG1lKS7CoAoKTG9va3MgbGlrZSB0aGUgcnVzdC8gc3ViZGlyIGlzIGNvbmRpdGlvbmFsIG9uIENP
TkZJR19SVVNULCBzbyB0aGUKb3JpZ2luYWwgcnVzdC9NYWtlZmlsZSBkaWRuJ3QgaGF2ZSB0aGlz
IHByb2JsZW0uCgpGaXhpbmcgdGhpcyBzaG91bGQgYmUgYXMgc2ltcGxlIGFzIG1vdmluZyB0aGUg
Y2hlY2sgaW50byBydXN0L01ha2VmaWxlCmluc3RlYWQuCgpWaXZpYW4gImRyYW1mb3JldmVyIiBX
YW5nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
