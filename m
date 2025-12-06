Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0F2D3B7D8
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 18:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kGb98+6KeYHwzbOjAJP6Vux9kIRfa9x00iMiCSuLGnQ=; b=FCbckKFDeh1Cpq
	w4CxemOHvFrnTl4E6j8qxSUjV1D9I32Qc2RfqN8/3+Kg/GjgWcURVQ5IPkkfMaV8dwSDMQyvuBiXo
	C3FPCi0+UdHCX+gUcsdLFzNoCxakm7QWtNR1YFS0mqUnIFdg6LS/PHftcuCQf7ENq4HtQApmEsv9U
	gs2Lo84+iMSEldXL9B3WtaYaVjPRprMEv8OB9kZ2hMnqWeUGGT2MWQD5POV3AuTIm0EnGKdF5LGHv
	pra78LYDYVvZ5NTas5LNAfPGvT1kJHFNwETd0giNVoSNFsRz8GiLM0GV2I7KDy2j/mlz3gIjwJrtj
	1jdCnZhugF6panJEloGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRwq6-0000000B7YA-1K4k;
	Sat, 06 Dec 2025 18:17:02 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRwq3-0000000B7Wz-1MYy
	for linux-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 18:17:01 +0000
Received: from [192.168.0.116] (unknown [114.241.82.59])
	by APP-03 (Coremail) with SMTP id rQCowAB3_tALczRp1lJkAw--.48747S2;
	Sun, 07 Dec 2025 02:16:45 +0800 (CST)
Message-ID: <35bacd20-c7e8-4a3f-be79-aa52701fc257@iscas.ac.cn>
Date: Sun, 7 Dec 2025 02:16:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] rust: add a Kconfig function to test for support
 of bindgen options
To: Asuna Yang <spriteovo@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Jonathan Corbet <corbet@lwn.net>, Jason Montleon <jmontleo@redhat.com>,
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
 <20251204-gcc-rust-v5-v5-3-2d4f20d86c24@gmail.com>
 <1a6bb8cd-cc08-458f-a6f6-cdfefd327320@iscas.ac.cn>
 <9687109b-dc93-4535-848c-e5f22aeb8e9d@gmail.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <9687109b-dc93-4535-848c-e5f22aeb8e9d@gmail.com>
X-CM-TRANSID: rQCowAB3_tALczRp1lJkAw--.48747S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr17JFWUCryrJw43XF1DWrg_yoW8AFyxpF
	18Wa1jva1kJ3W8t34v9Fy0qF15Kw18WrW2k3s5W342van8Ww1kKr1IyF1ak393XFy0vr42
	vFsrKF90yan09aDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IUneBT5UUUUU==
X-Originating-IP: [114.241.82.59]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_101659_732070_3B7893C7 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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

Ck9uIDEyLzQvMjUgMjA6MzMsIEFzdW5hIFlhbmcgd3JvdGU6Cj4gT24gMTIvNC8yNSA1OjA2IFBN
LCBWaXZpYW4gV2FuZyB3cm90ZToKPgo+Pj4gKwo+Pj4gKyMgJChiaW5kZ2VuLWJhY2tlbmQtb3B0
aW9uLDxmbGFnPikKPj4+ICsjIFJldHVybiB5IGlmIGJpbmRnZW4gYmFja2VuZCBzdXBwb3J0cyA8
ZmxhZz4sIG4gb3RoZXJ3aXNlCj4+PiArIyBGb3Igbm93LCB0aGUgYmFja2VuZCByZWZlcnMgb25s
eSB0byBsaWJjbGFuZywgc28gbW9yZQo+Pj4gc3BlY2lmaWNhbGx5LCB0aGlzIGZ1bmN0aW9uIHRl
c3RzIHdoZXRoZXIgdGhlIGdpdmVuIGZsYWcgaXMKPj4+IHJlY29nbml6ZWQgYnkgdGhlIGxpYmNs
YW5nIHVzZWQgYnkgYmluZGdlbi4KPj4+ICtiaW5kZ2VuLWJhY2tlbmQtb3B0aW9uID0gJChzdWNj
ZXNzLHRyYXAgInJtIC1mIC50bXBfJCQuaCIgRVhJVDsKPj4+IHRvdWNoIC50bXBfJCQuaDsgJChC
SU5ER0VOKSAudG1wXyQkLmggLS0gLS10YXJnZXQ9JChCSU5ER0VOX1RBUkdFVCkKPj4+ICQoMSkp
Cj4+Pgo+PiBDYW4gcHJvYmFibHkgYmUgc2ltcGxpZmllZCBkb3duIHRvOgo+Pgo+PiAkKEJJTkRH
RU4pIC9kZXYvbnVsbCAtLSAteCBjIC0tdGFyZ2V0PSQoQklOREdFTl9UQVJHRVQpICQoMSkKPj4K
Pgo+IGJpbmRnZW4gaXMgc2Vuc2l0aXZlIHRvIGZpbGUgZXh0ZW5zaW9ucy4gSWYgdGhlIGZpbGUg
aXMgbm90IC5oIG9yCj4gLmhwcCwgaXQgY29tcGxhaW5zOgo+Cj4gcGFuaWNrZWQgYXQgYmluZGdl
bi9pci9jb250ZXh0LnJzOjU2MjoxNToKPiBsaWJjbGFuZyBlcnJvcjsgcG9zc2libGUgY2F1c2Vz
IGluY2x1ZGU6Cj4gLSBJbnZhbGlkIGZsYWcgc3ludGF4Cj4gLSBVbnJlY29nbml6ZWQgZmxhZ3MK
PiAtIEludmFsaWQgZmxhZyBhcmd1bWVudHMKPiAtIEZpbGUgSS9PIGVycm9ycwo+IC0gSG9zdCB2
cy4gdGFyZ2V0IGFyY2hpdGVjdHVyZSBtaXNtYXRjaMKgCgpUaGF0J3Mgc28gd2VpcmQuLi4gSSBj
YW4ndCByZXByb2R1Y2UgdGhpcyBpZiBpIHBhc3MgLXggYyB0byBiaW5kZ2VuLApsaWtlIHRoaXM6
CgokIGJpbmRnZW4gLS12ZXJzaW9uCmJpbmRnZW4gMC43Mi4xCiQgYmluZGdlbiAvZGV2L251bGwK
cGFuaWNrZWQgYXQgL2J1aWxkL3J1c3QtYmluZGdlbi11bndyYXBwZWQtMC43Mi4xLXZlbmRvci9i
aW5kZ2VuLTAuNzIuMS9pci9jb250ZXh0LnJzOjU2MjoxNToKbGliY2xhbmcgZXJyb3I7IHBvc3Np
YmxlIGNhdXNlcyBpbmNsdWRlOgotIEludmFsaWQgZmxhZyBzeW50YXgKLSBVbnJlY29nbml6ZWQg
ZmxhZ3MKLSBJbnZhbGlkIGZsYWcgYXJndW1lbnRzCi0gRmlsZSBJL08gZXJyb3JzCi0gSG9zdCB2
cy4gdGFyZ2V0IGFyY2hpdGVjdHVyZSBtaXNtYXRjaApJZiB5b3UgZW5jb3VudGVyIGFuIGVycm9y
IG1pc3NpbmcgZnJvbSB0aGlzIGxpc3QsIHBsZWFzZSBmaWxlIGFuIGlzc3VlIG9yIGEgUFIhCiQg
YmluZGdlbiAvZGV2L251bGwgLS0gLXggYwpGYWlsZWQgdG8gcnVuIHJ1c3RmbXQ6IE5vIHN1Y2gg
ZmlsZSBvciBkaXJlY3RvcnkgKG9zIGVycm9yIDIpIChub24tZmF0YWwsIGNvbnRpbnVpbmcpCi8q
IGF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGJ5IHJ1c3QtYmluZGdlbiAwLjcyLjEgKi8KClRoZSAt
eCBhcmd1bWVudCBzaG91bGQgZXhwbGljaXRseSB0ZWxsIChsaWIpY2xhbmcgd2hhdCBsYW5ndWFn
ZSB0aGUgZmlsZQppcyB3aXRob3V0IG5lZWRpbmcgYW4gZXh0ZW5zaW9uLiBJIGRvbid0IGtub3cg
d2h5IGl0J3Mgbm90IHdvcmtpbmcgZm9yCnlvdS4uLgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
