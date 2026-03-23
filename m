Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E36D58CB0
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 01:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tDEnmMlmo299GXh/kiO0/QkZvwqCsOJJ9orYeueXJog=; b=ggsxJ/39fSNAQc
	1s2/4IZ5eGQ9LJeF2cZ7M/VOxY0c7KmfKxxAVd1UFLd6tuRC6wLu6Blo+xS39ZPBjGKifqg0b8rYK
	1rw/JNeTrwwT3uk9PDSAsZ+92/Be18IqztJ4Im/vXzr98zJFvjOcWuIEhCUzCpNGmjvKviMUifAH3
	BjrU5H+SkTeRU7OmlK4ObPEd1QVyK4V+aV1I8JP7wR1i1B0H4xIdgpH3JdkcCV4nIb9qwbSKOi8H0
	h2mmo01WTtIXvj+Ji8/Cjjjx51nlsEhOaJUy0V8oEdjd/in+zki5u649m/sl2mumPqVJR6I/pfluS
	fY+CGhsn+EKJYDQ1qClA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4UYm-0000000FsQV-2VDq;
	Mon, 23 Mar 2026 01:58:28 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4UYi-0000000FsQ9-20K4
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 01:58:27 +0000
Received: from [10.213.22.113] (unknown [210.73.43.101])
	by APP-03 (Coremail) with SMTP id rQCowACXueAtnsBp4nSBCw--.51109S2;
	Mon, 23 Mar 2026 09:58:06 +0800 (CST)
Message-ID: <347c918e-6682-455c-ba08-096d9b7b89e4@iscas.ac.cn>
Date: Mon, 23 Mar 2026 09:58:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: patch: Avoid early page_to_phys()
To: Paul Walmsley <pjw@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, "Mike Rapoport (Microsoft)"
 <rppt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
References: <20260310-riscv-sparsemem-alternatives-fix-v1-1-659d5dd257e2@iscas.ac.cn>
 <6ec5d4d4-f171-d41b-2705-a051bcb794e9@kernel.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <6ec5d4d4-f171-d41b-2705-a051bcb794e9@kernel.org>
X-CM-TRANSID: rQCowACXueAtnsBp4nSBCw--.51109S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF1xur1DJr1rWFyDCw1Dtrb_yoW8Crykpa
	yfua1rKFyFqr48JwnFyw18ZFWUWrsY9rWrWF1Iqrn8Z34jvw40vrn293y7ua47Aw1kK3yj
	ya13ZFyYv3WDZ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvjb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r1q6r43MxkI
	ecxEwVAFwVWkMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8
	ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUgp
	nQDUUUU
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_185824_894041_8E49F2EB 
X-CRM114-Status: GOOD (  10.04  )
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

SGkgQW5kcmV3IGFuZCBQYXVsLAoKT24gMy8xOS8yNiAwMTo0MiwgUGF1bCBXYWxtc2xleSB3cm90
ZToKPiBPbiBUdWUsIDEwIE1hciAyMDI2LCBWaXZpYW4gV2FuZyB3cm90ZToKPgo+PiBTaW1pbGFy
bHkgdG8gY29tbWl0IDhkMDllMmQ1NjlmNiAoImFybTY0OiBwYXRjaGluZzogYXZvaWQgZWFybHkK
Pj4gcGFnZV90b19waHlzKCkiKSwgYXZvaWQgdXNpbmcgcGh5c190b19wYWdlKCkgZm9yIHRoZSBr
ZXJuZWwgYWRkcmVzcyBjYXNlCj4+IGluIHBhdGNoX21hcCgpLgo+Pgo+PiBTaW5jZSB0aGlzIGlz
IGNhbGxlZCBmcm9tIGFwcGx5X2Jvb3RfYWx0ZXJuYXRpdmVzKCkgaW4gc2V0dXBfYXJjaCgpLCBh
bmQKPj4gY29tbWl0IDQyNjc3MzljYWJiOCAoImFyY2gsIG1tOiBjb25zb2xpZGF0ZSBpbml0aWFs
aXphdGlvbiBvZiBTUEFSU0UKPj4gbWVtb3J5IG1vZGVsIikgaGFzIG1vdmVkIHNwYXJzZV9pbml0
KCkgdG8gYWZ0ZXIgc2V0dXBfYXJjaCgpLAo+PiBwaHlzX3RvX3BhZ2UoKSBpcyBub3QgYXZhaWxh
YmxlIHRoZXJlIHlldCwgYW5kIGl0IHBhbmljcyBvbiBib290IHdpdGgKPj4gU1BBUlNFTUVNIG9u
IFJWMzIsIHdoaWNoIGRvZXMgbm90IHVzZSBTUEFSU0VNRU1fVk1FTU1BUC4KPj4KPj4gUmVwb3J0
ZWQtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRl
Pgo+PiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjAyMjMxNDQxMDgtZGNh
Y2UwYjktMDJlOC00YjY3LWE3Y2UtZjI2M2JlZDM2ZjI2QGxpbnV0cm9uaXguZGUvCj4+IEZpeGVz
OiA0MjY3NzM5Y2FiYjggKCJhcmNoLCBtbTogY29uc29saWRhdGUgaW5pdGlhbGl6YXRpb24gb2Yg
U1BBUlNFIG1lbW9yeSBtb2RlbCIpCj4+IFN1Z2dlc3RlZC1ieTogTWlrZSBSYXBvcG9ydCA8cnBw
dEBrZXJuZWwub3JnPgo+PiBTaWduZWQtb2ZmLWJ5OiBWaXZpYW4gV2FuZyA8d2FuZ3J1aWthbmdA
aXNjYXMuYWMuY24+Cj4gVGhhbmtzLCBxdWV1ZWQgZm9yIHY3LjAtcmMuCgpJIGhhdmUgb25seSBq
dXN0IG5vdGljZWQgdGhhdCB0aGlzIHBhdGNoIHdhcyBjb21taXRlZCB0byBib3RoCm1tLWhvdGZp
eGVzLXN0YWJsZSBbMV0gYnkgQW5kcmV3IGFuZCByaXNjdiBmaXhlcyBbMl0gYnkgUGF1bC4gSXMg
dGhpcwppbnRlbmRlZD8KCldoaWxlIHdlJ3JlIGF0IGl0LCBQYXVsJ3Mgc3ViamVjdCBjb3JyZWN0
aW9uIGlzIGNvcnJlY3QgLSBpdCBzaG91bGQgaGF2ZQpzYWlkIHBoeXNfdG9fcGFnZSgpLCBub3Qg
cGFnZV90b19waHlzKCkuIE5vdCB0aGF0IEkgY2FuIGJsYW1lIHRoaXMgb24KYW55b25lIGVsc2Us
IGJ1dCBhcHBhcmVudGx5IEkgd3JvdGUgaXQgd2hpbGUgbG9va2luZyBhdCB0aGUgYXJtNjQgY29t
bWl0CndpdGhvdXQgbm90aWNpbmcuCgpUaGFua3MgYW5kIHNvcnJ5IGZvciB0aGUgaG9wZWZ1bGx5
IG1pbm9yIGluY29udmVuaWVuY2UuCgpWaXZpYW4gImRyYW1mb3JldmVyIiBXYW5nCgpbMV06IGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2FrcG0vbW0uZ2l0
L2NvbW1pdC8/aD1tbS1ob3RmaXhlcy1zdGFibGUmaWQ9YWM1ZjJjMTI1NmVkZThiMGFjYjI2NjFm
NjQ0MTUzMGQ1M2Q4ZjEyNgpbMl06IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L3Jpc2N2L2xpbnV4LmdpdC9jb21taXQvP2g9Zml4ZXMmaWQ9M2E4NzY1MDFm
ZDlhYWFlOTg0NTAyNmYwNDYzNzljOTUwNzM2NWJiNQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
