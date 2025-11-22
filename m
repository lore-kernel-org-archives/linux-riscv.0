Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAD6CF64B1
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Nov 2025 11:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oVtl+QJXV4B4zWOOc6KwWDd2oZBBvIcT3PLyZ15peE0=; b=SAJ5tASSXNzYAi
	85jNMWDmbUTFv6B4KrNoQEV9mCacCFdIIBa0ylc8N4SRdK6a9lTemMxDrrSpEZj0GcQRyLzwRcQuT
	/bXbMIe10GmKlIeNslN7UiB6Gbm9Juff1eCICZKE4bGaRRXLcnSsA3kbD3sDeW1nG6Wi6mEqHoNC0
	5+aJb5BdEjotrokaTgQ3DKwnBxvHLhRJnqSRbUoFq9Mu0u0W4v/jtcRAytHtbUM+1HHS4K7vaFt11
	JKwrfQeGGAmks8oh1nYP5O96kn0KHSPYsRyDgY6dp9td6w+J65BOkgHOEptdhRSb32fhTU1ySL6+q
	380IZG/DlbqRX+Rc8UdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMlQM-00000009Tvs-0OjR;
	Sat, 22 Nov 2025 11:05:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMlQK-00000009Tv2-1jHh;
	Sat, 22 Nov 2025 11:05:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=zxgMTK/rpJeW62sRb1TXMj768OjTRDF/xqa+/y0Pa8E=; b=Q2PBLQBi5oSoNFfWP8kA4vUvTJ
	vNtLx1nVZuzWxbncsVLv7Qz0EYG3aEbd7xNiaGeK0aao6h8jPYd64XzjFuTDGMEFPAfW68+G/b9aL
	fPbST/f9YK6bGDFYvGRPdi32E0INcotoXpCu8HaL6pzOlHfgG0I01G5cXiqIbKlP9x8vzvBoEOhF7
	TS4nMWfxJg52rerKOcZp4Jh2GqJjIHd0QYwmYkT4koRNy83eI+V6m8Odt449R4ek65ZGeseKkdLnS
	orrWNUqm+XNKJAXxdSpAV2PJnkO8RrSZlR98pKiMn1p0tXNkGtwjnWGohzAQwjiH5LhErvc7OjfaH
	VI5Vl0Ww==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMlQF-00000004FX9-2GgY;
	Sat, 22 Nov 2025 11:04:58 +0000
Received: from loongson.cn (unknown [36.44.121.68])
	by gateway (Coremail) with SMTP id _____8Cx77_EmCFpBO0mAA--.16101S3;
	Sat, 22 Nov 2025 19:04:36 +0800 (CST)
Received: from [192.168.0.111] (unknown [36.44.121.68])
	by front1 (Coremail) with SMTP id qMiowJDx_8O6mCFpg+Y7AQ--.35665S3;
	Sat, 22 Nov 2025 19:04:32 +0800 (CST)
Message-ID: <39617a3e-c476-abac-8425-bbcece769cdb@loongson.cn>
Date: Sat, 22 Nov 2025 19:04:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>, Will Deacon <will@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>,
 Ard Biesheuvel <ardb@kernel.org>, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
References: <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com>
 <33612d85-e70b-26da-8460-ea6b9064ce08@loongson.cn>
 <CAAhV-H5ZSTFDxvm-W1CrgEoQ5d_jw5yVsfetQ_J_qL5pqLtzgg@mail.gmail.com>
 <CAMj1kXGk0udgM67wrWqahqK8H0uE8emQj51SmJey+7fE-FTjdA@mail.gmail.com>
 <CAAhV-H4c=vdNWO0v_mYL2xZ9FYjDyRDvt6f_kV4d8Bh=CRJniQ@mail.gmail.com>
 <CAMj1kXEaxxcWTTANWeEMNjYDymdL5Fxy2B=XBF4RGtteEkfinw@mail.gmail.com>
 <421c08e1-255b-447b-b5e3-ee6544fbefd2@loongson.cn>
 <CAAhV-H5KsFShDJ_Cxu+1_ces8oojn8+S-7PLmE7aUj8gX5_GEw@mail.gmail.com>
 <32s3lvzfu6jkyho7qenrqbsm5wkgjnzn2imdp6tfwycmyxpzgu@kg5367uxmxii>
 <CAAhV-H47fzaKcMhgLWWOTxB+srBsg85-eK0LW1vQXQnvq32-+w@mail.gmail.com>
 <aRsH7RTpAah4g5Xr@willie-the-truck>
 <CAAhV-H4AasfFet_Gi_mVyte3RPMH3qBS73dBfF-=Gd7HJ6ZPEw@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
In-Reply-To: <CAAhV-H4AasfFet_Gi_mVyte3RPMH3qBS73dBfF-=Gd7HJ6ZPEw@mail.gmail.com>
X-CM-TRANSID: qMiowJDx_8O6mCFpg+Y7AQ--.35665S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxAF45tryxCw18uFyfCr1kCrX_yoWrJw48pF
	WjyFWqkr4DJr4fXwnrK3WUXFWYyr1fJrW8WF90vry8CrWqvrn7Xw4Fkr4j9FyDXr13Wr12
	vrW0qFyavFWUA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
	twAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUceOJUUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_110456_174713_52077D66 
X-CRM114-Status: GOOD (  22.26  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Q2M6IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4KCkhpIGFsbCwKCk9uIDEx
LzIxLzI1IDIyOjM2LCBIdWFjYWkgQ2hlbiB3cm90ZToKPiBPbiBNb24sIE5vdiAxNywgMjAyNSBh
dCA3OjMz4oCvUE0gV2lsbCBEZWFjb24gPHdpbGxAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IE9u
IFNhdCwgTm92IDE1LCAyMDI1IGF0IDExOjE2OjQyQU0gKzA4MDAsIEh1YWNhaSBDaGVuIHdyb3Rl
Ogo+Pj4gT24gV2VkLCBOb3YgMTIsIDIwMjUgYXQgMjowMOKAr0FNIEpvc2ggUG9pbWJvZXVmIDxq
cG9pbWJvZUBrZXJuZWwub3JnPiB3cm90ZToKPj4+Pgo+Pj4+IE9uIE1vbiwgTm92IDEwLCAyMDI1
IGF0IDAzOjAwOjAwUE0gKzA4MDAsIEh1YWNhaSBDaGVuIHdyb3RlOgo+Pj4+PiBPbiBNb24sIE5v
diAxMCwgMjAyNSBhdCA5OjE54oCvQU0gVGllemh1IFlhbmcgPHlhbmd0aWV6aHVAbG9vbmdzb24u
Y24+IHdyb3RlOgo+Pj4+Pj4gSWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgSSBzaG91bGQgbW9k
aWZ5IHRoaXMgcGF0Y2ggdG8gcmVtb3ZlIHRoZQo+Pj4+Pj4gY2hhbmdlcyBvZiBhcm0gYW5kIHJp
c2N2IGZvciBub3csIGRvIHRoZSBjaGFuZ2VzIG9ubHkgd2hlbiB0aGVyZSBpcwo+Pj4+Pj4gYSBy
ZWFsIHByb2JsZW0gb3IgcmVxdWlyZW1lbnQgc29tZSBkYXksIHJpZ2h0PyBJZiBubyBtb3JlIGNv
bW1lbnRzLAo+Pj4+Pj4gSSB3aWxsIHNlbmQgdjMgbGF0ZXIuCj4+Pj4+Cj4+Pj4+IE5vdyBldmVy
eW9uZSBpbnZvbHZlZCBhZ3JlZXMgdGhhdCB0aGUgZWZpc3R1YiBjb2RlIGlzIGNvcnJlY3QsIHNv
IHRoZQo+Pj4+PiBwcm9wZXIgc29sdXRpb24gaXMgdG8gZml4IHRoZSBjb21waWxlci4KPj4+Pgo+
Pj4+IEhtPyAgSSBkb24ndCBzZWUgaG93IGl0J3MgYSBjb21waWxlciBidWcuICBJdCdzIHJlYWxs
eSBqdXN0IGFuIG9ianRvb2wKPj4+PiBsaW1pdGF0aW9uLgo+Pj4+Cj4+Pj4+IENoYW5naW5nIGVm
aXN0dWIgY29kZSBhbmQgY2hhbmdpbmcgb2JqdG9vbCAoaWdub3JlIF9fZWZpc3R1YiBwcmVmaXgp
Cj4+Pj4+IGFyZSBib3RoIHdvcmthcm91bmRzLCBidXQgSSB0aGluayBjaGFuZ2luZyBvYmp0b29s
IGlzIGEgbGl0dGxlIG1vcmUKPj4+Pj4gcmVhc29uYWJsZS4gTWF5YmUgSm9zaCBoYXMgZGlmZmVy
ZW50IGlkZWFzPwo+Pj4+Cj4+Pj4gSSB0aG91Z2h0IHRoZSBjb252ZXJzYXRpb24gaGFkIGNvbnZl
cmdlZCBvbiB3aGF0IFRpZXpodSBtZW50aW9uZWQgYWJvdmUsCj4+Pj4gd2hpY2ggaXMgdG8gc2tp
cCBvYmp0b29sIG9uIGxpYnN0dWIgZm9yIGxvb25nYXJjaCwgYnV0IGxlYXZlIHRoZSBvdGhlcgo+
Pj4+IGFyY2hlcyBhbG9uZS4gIFRoYXQgd2F5IG9ianRvb2wgYmVoYXZpb3IgaXMgY29uc2lzdGVu
dCBiZXR3ZWVuIGxvb25nYXJjaAo+Pj4+IGFuZCB4ODYsIGFuZCBvYmp0b29sIGRvZXNuJ3QgbmVl
ZCB0byBpZ25vcmUgYW55IHByZWZpeGVzLgo+Pj4+Cj4+Pj4gU28gYmFzaWNhbGx5LCB0aGUgdjIg
cGF0Y2ggbWludXMgdGhlIGFybTY0L3Jpc2N2IGNoYW5nZXMuCj4+Pgo+Pj4gSGksIEFSTTY0IGFu
ZCBSSVNDLVYgbWFpbnRhaW5lcnMsCj4+Pgo+Pj4gV291bGQgeW91IG1pbmQgdGhhdCB0aGlzIHBh
dGNoIG1vZGlmaWVzIHRoZSB0aHJlZSBhcmNoaXRlY3R1cmVzCj4+PiB0b2dldGhlciAodGhleSBh
cmUgZXhhY3RseSB0aGUgc2FtZSBzdHlsZSBub3cpPwo+Pj4KPj4+IE1hZGhhdmFuIGlzIHRoZSBh
dXRob3Igb2YgQVJNNjQncyBvYmp0b29sLCBJIHRoaW5rIHlvdXIgb3BpbmlvbiBpcwo+Pj4gYWxz
byB2ZXJ5IGltcG9ydGFudC4KPj4KPj4gYXJtNjQgZG9lc24ndCAoeWV0KSB1c2Ugb2JqdG9vbC4K
Pj4KPj4gSSBkZWZlciB0byBBcmQgb24gYW55dGhpbmcgcmVsYXRpbmcgdG8gdGhlIGFybTY0IGVm
aXN0dWIuIFJlYWRpbmcgdGhlCj4+IHN0YXJ0IG9mIHRoaXMgdGhyZWFkLCBpdCBkb2Vzbid0IGxv
b2sgbGlrZSBoZSdzIGNvbnZpbmNlZCBhbmQgSSdtIG5vdAo+PiBzdXJwcmlzZWQgaWYgaXQncyBw
dXJlbHkgYW4gaXNzdWUgd2l0aCBvYmp0b29sLgo+IE9LLCBJIGtub3csIGJ1dCBJIGhhdmUgYSBj
b25jZXJuLgo+IAo+IEFyZCBzYWlkIHRoYXQgaGUgaXMgcmVsdWN0YW50IHRvIG1ha2UgY2hhbmdl
cyB0byBhY2NvbW1vZGF0ZSBhIGZsYXdlZAo+IGJ1aWxkIHRpbWUgdG9vbCBhbmQgdGhlcmUgbWF5
IGJlIHJlZ3Jlc3Npb24gcmlzay4KPiAKPiBTbywgSSdtIGFsc28gcmVsdWN0YW50IGFuZCBkb24n
dCB3YW50IExvb25nQXJjaCB0byBtZWV0IHJlZ3Jlc3Npb24KPiByaXNrLiBJZiBvbmUgZGF5IExv
b25nQXJjaCBoYXMgYSByZWdyZXNzaW9uLCB3ZSBwcm9iYWJseSBuZWVkIGFub3RoZXIKPiB3b3Jr
YXJvdW5kIHRvICJmaXgiIHRoaXMgd29ya2Fyb3VuZC4gQnV0IGlmIHRoZXNlIHRocmVlIGFyY2hp
dGVjdHVyZXMKPiBjaGFuZ2UgaW4gdGhlIHNhbWUgd2F5LCB3ZSBtYXkgaGF2ZSBhIGNoYW5jZSB0
byBzb2x2ZSBzb21lIGZ1bmRhbWVudGFsCj4gcHJvYmxlbXMuLi4KCklJVUMsIEpvc2ggZG8gbm90
IGxpa2UgdG8gaWdub3JlIHRoZXNlIEVGSVNUVUIgZnVuY3Rpb25zIGluCnZhbGlkYXRlX2JyYW5j
aCgpIG9mIG9ianRvb2wsIEh1YWNhaSBkbyBub3QgbGlrZSB0byBvbmx5IGxpbmsKbGlic3R1YiB0
byB2bWxpbnV4IG9ubHkgZm9yIExvb25nQXJjaC4KCkl0IHNlZW1zIHRoYXQgdGhlcmUgaXMgb25s
eSBvbmUgd2F5IHRvIGZpeCBvciB3b3JrYXJvdW5kIHRoaXMKcHJvYmxlbSwgcmVtb3ZlIHRoZSBh
dHRyaWJ1dGUgX19ub3JldHVybiBmb3IgcmVhbF9rZXJuZWxfZW50cnkoKQphbmQgdGhlbiBtYWtl
IGVmaV9ib290X2tlcm5lbCgpIGVuZHMgd2l0aCBhIHJldHVybiBpbnN0cnVjdGlvbiBbMV0Kb3Ig
YW4gdW5jb25kaXRpb25hbCBqdW1wIGluc3RydWN0aW9uIFsyXSB0aGF0IG9ubHkgdG91Y2hlcwpk
cml2ZXJzL2Zpcm13YXJlL2VmaS9saWJzdHViL2xvb25nYXJjaC5jLgoKU2luY2UgdGhpcyBpcyBh
IGlzc3VlIG9ubHkgZm9yIExvb25nQXJjaCBieSBub3csIHdoYXQgZG8geW91CnRoaW5rIG9mIHRo
aXMgbWluaW1hbCBjaGFuZ2Ugb25seSBmb3IgTG9vbmdBcmNoIGxpYnN0dWIgY29kZT8KVXNpbmcg
InJldHVybiBFRklfTE9BRF9FUlJPUiIgWzFdIG9yICJ3aGlsZSAoMSkiIFsyXT8KCk1heWJlIHRo
aXMgaXMgdGhlIHNpbXBsZSBhbmQgZGlyZWN0IHdheSBmb3IgdGhpcyBzcGVjaWFsIGlzc3VlCm9u
bHkgb24gTG9vbmdBcmNoIHNvIGZhci4gSWYgbm90LCBhbnkgb3RoZXIgc3VnZ2VzdGlvbnM/CgpP
biB0aGUgb3RoZXIgaGFuZCwgaXMgaXQgcG9zc2libGUgdG8gYWRkIEtCVUlMRF9WTUxJTlVYX0xJ
QlNfRklOQUwKYW5kIHRoZW4gdXNlIGl0IG9ubHkgZm9yIExvb25nQXJjaCBmaXJzdCBbM10/IEFu
eSBwb3RlbnRpYWwgcmlza3M/CgpXaGF0IGlzIHRoZSBuZXh0IHN0ZXA/CgpbMV0gCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xvb25nYXJjaC9DQU1qMWtYSC1ySzBiUnlIWGRKLWNyQXlNeXZKSEFw
SDBXUjdfOFFkOHZyU1BCTEsreWdAbWFpbC5nbWFpbC5jb20vClsyXSAKaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbG9vbmdhcmNoLzIwMjUwODI2MDY0NjMxLjk2MTctMi15YW5ndGllemh1QGxvb25n
c29uLmNuLwpbM10gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbG9vbmdhcmNoLzIwMjUxMTIyMDAw
MTAxLkdBMTk5NjM5MUBheDE2Mi8KClRoYW5rcywKVGllemh1CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
