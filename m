Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE43CA0EFA
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 23:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJeVousS8+7JZC+beE4fQSS6OTWYubL/SE7u+rvT+sE=; b=s1MRgvPwhCwudm
	MQrhzf+Q5TlWPVc+Jvyvga2l8fQRHhzLwoCRYgh2r7mpCc1qQavRHXqtjWADwnjahugnUe4Uf8mXl
	2txT0IRYOEa3xOYfPUnDe+13U/cgob7E/wjpA7Y7q3XKZvc4t4tBDD0F/ZhHuuTa/sWvtNLWnpwEz
	JWJBL3jPDvhIOJMKHnytN2ccRVa0LTe4kebQb1CdpcCwG/ju96O6St7OaZZIO648/2FVQn/LmtkcJ
	/jzFoD58x5DcOLb7KV3wFMB3PwP7S0EnNLaf0aZsaBfxrotLfM3wTqhF/q2XYLZFadIqe6h2h3x4B
	IaE2fNrI5B0PzfRjy0kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upEWE-00000000ufQ-19YC;
	Thu, 21 Aug 2025 23:16:30 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up9Mr-000000006KO-09Fh
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 17:46:31 +0000
Received: from [192.168.0.104] (unknown [114.241.87.235])
	by APP-01 (Coremail) with SMTP id qwCowAB3pKhrW6doTDMdDg--.21682S2;
	Fri, 22 Aug 2025 01:46:19 +0800 (CST)
Message-ID: <4dba27c4-e7a5-4ffc-8073-08a83c68e527@iscas.ac.cn>
Date: Fri, 22 Aug 2025 01:46:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vivian Wang <wangruikang@iscas.ac.cn>
Subject: Re: [PATCH v2 4/5] riscv: bitops: Use __riscv_has_extension_likely
To: Yury Norov <yury.norov@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Charlie Jenkins <charlie@rivosinc.com>,
 Xiao Wang <xiao.w.wang@intel.com>,
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Vivian Wang <uwu@dram.page>
References: <20250821-riscv-altn-helper-wip-v2-0-9586fa702f78@iscas.ac.cn>
 <20250821-riscv-altn-helper-wip-v2-4-9586fa702f78@iscas.ac.cn>
 <aKcwtXDJKRf4O_tF@yury>
Content-Language: en-US
In-Reply-To: <aKcwtXDJKRf4O_tF@yury>
X-CM-TRANSID: qwCowAB3pKhrW6doTDMdDg--.21682S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCryUJFyftFykZrWxWw4kZwb_yoW5CF15pr
	9ayFyDKF4kJw1UCF97Ar1xAF1Fy393W3yfGrZIgr98JF12yw1Sgrn0k3WF9ryIyFWv9ryU
	uF4xG343Aa17CaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU56yI5UUUUU==
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_104629_436367_835DBF5C 
X-CRM114-Status: GOOD (  18.68  )
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

T24gOC8yMS8yNSAyMjo0NCwgWXVyeSBOb3JvdiB3cm90ZToKCj4gT24gVGh1LCBBdWcgMjEsIDIw
MjUgYXQgMDU6MTY6MzRQTSArMDgwMCwgVml2aWFuIFdhbmcgd3JvdGU6Cj4+IFVzZSBfX3Jpc2N2
X2hhc19leHRlbnNpb25fbGlrZWx5KCkgdG8gY2hlY2sgZm9yIFJJU0NWX0lTQV9FWFRfWkJCLAo+
PiByZXBsYWNpbmcgdGhlIHVzZSBvZiBhc20gZ290byB3aXRoIEFMVEVSTkFUSVZFLgo+Pgo+PiBU
aGUgImxpa2VseSIgdmFyaWFudCBpcyB1c2VkIHRvIG1hdGNoIHRoZSBiZWhhdmlvciBvZiB0aGUg
b3JpZ2luYWwKPj4gaW1wbGVtZW50YXRpb24gdXNpbmcgQUxURVJOQVRJVkUoImogJWxbbGVnYWN5
XSIsICJub3AiLCAuLi4pLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBWaXZpYW4gV2FuZyA8d2FuZ3J1
aWthbmdAaXNjYXMuYWMuY24+Cj4+IC0tLQo+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9iaXRv
cHMuaCB8IDMyICsrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+ICAxIGZpbGUgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYml0b3BzLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2JpdG9wcy5oCj4+IGluZGV4IGQ1OTMxMGY3NGMyYmE3MGNhZWI3YjliMGU5MjIxODgyMTE3NTgz
ZjUuLmY3MGNjYzBjMmZmYjg2YTZmZGEzYmMzNzM1MDQxNDNkMGM2YTEwOTMgMTAwNjQ0Cj4+IC0t
LSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYml0b3BzLmgKPj4gKysrIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9iaXRvcHMuaAo+PiBAQCAtNDcsOSArNDcsOCBAQAo+PiAgCj4+ICBzdGF0aWMg
X19hbHdheXNfaW5saW5lIHVuc2lnbmVkIGxvbmcgdmFyaWFibGVfX2Zmcyh1bnNpZ25lZCBsb25n
IHdvcmQpCj4+ICB7Cj4+IC0JYXNtIGdvdG8oQUxURVJOQVRJVkUoImogJWxbbGVnYWN5XSIsICJu
b3AiLCAwLAo+PiAtCQkJCSAgICAgIFJJU0NWX0lTQV9FWFRfWkJCLCAxKQo+PiAtCQkJICA6IDog
OiA6IGxlZ2FjeSk7Cj4+ICsJaWYgKCFfX3Jpc2N2X2hhc19leHRlbnNpb25fbGlrZWx5KDAsIFJJ
U0NWX0lTQV9FWFRfWkJCKSkKPj4gKwkJcmV0dXJuIGdlbmVyaWNfX19mZnMod29yZCk7Cj4gU28s
IG9uIHRoZSBwcmV2aW91cyByb3VuZCB5b3Ugc3BlbnQgcXVpdGUgYSBsb3Qgb2YgdGltZSBleHBs
YWluaW5nIGhvdwo+ICd1bmxpa2VseSgpJyB2ZXJzaW9uIGlzIGhhbmR5IG92ZXIgJyFsaWtlbHko
KScsIGFuZCBub3cgdXNlIGp1c3QgdGhlCj4gbGF0dGVyLiBJIGZlZWwgcmVhbGx5IGxvc3QgYWJv
dXQgaG93IHRoZSBjb2RlIGdlbmVyYXRpb24gc2hvdWxkIGxvb2suCgpJdCdzIG5vdCAiaGFuZHki
LiBUaGUgb3BlcmF0aXZlIHBhcnQgaXMgImhhc19leHRlbnNpb24iLCBhbmQgYm90aApmdW5jdGlv
bnMgcmV0dXJuIHRydWUgaWYgdGhlIGV4dGVuc2lvbiBpcyBhdmFpbGFibGUgYW5kIGZhbHNlIGlm
IG5vdC4KRnVuY3Rpb25hbGx5OgoKwqAgwqAgaWYgKGxpa2VseSgpKSA8LS0gZXF1aXZhbGVudCAt
LT4gaWYgKHVubGlrZWx5KCkpCsKgIMKgIGlmICghbGlrZWx5KCkpIDwtLSBlcXVpdmFsZW50IC0t
PiBpZiAoIXVubGlrZWx5KCkpCgpXaGVyZWFzOgoKICAgIGlmIChsaWtlbHkoKSkgPC0tICoqb3Bw
b3NpdGUgb2YqKiAtLT4gaWYgKCF1bmxpa2VseSgpKQogICAgaWYgKHVubGlrZWx5KCkpIDwtLSAq
Km9wcG9zaXRlIG9mKiogLS0+IGlmICghbGlrZWx5KCkpCgpBbGwgdGhlIGFzbSBnb3RvIGRpc3Bh
dGNoIHN0dWZmIHdvcmsgbGlrZSB0aGlzOgpzdGF0aWNfYnJhbmNoX3tsaWtlbHksdW5saWtlbHl9
LCAoYXJtNjQpCmFsdGVybmF0aXZlX2hhc19jYXBfe2xpa2VseSx1bmxpa2VseX0sCl9fcmlzY3Zf
aGFzX2V4dGVuc2lvbl97bGlrZWx5LHVubGlrZWx5fS4gTWF5YmUgaXQncyBjb25mdXNpbmcsIGJ1
dCBpdApzZWVtcyB0byBiZSB0aGUgY29udmVudGlvbi4KCkFuZCwgY29kZWdlbi13aXNlOgoKQUxU
RVJOQVRJVkUoImogJWxbbm9fYWx0XSIsICJub3AiLCAuLi4pIC0+IGxpa2VseSgpIEFMVEVSTkFU
SVZFKCJub3AiLAoiaiAlbFtoYXNfYWx0XSIsIC4uLikgLT4gdW5saWtlbHkoKQoKU2luY2UgdGhl
IG9yaWdpbmFsIGNvZGUgaGFzIHRoZSAibGlrZWx5IiBwYXR0ZXJuLCB1c2luZyAiaWYgKGxpa2Vs
eSgpKSIKcHJlc2VydmVzIGl0LiBXaGF0ZXZlciB0aGUgY29kZWdlbiB3YXMsIGl0J3Mgc3RpbGwg
dGhlIHNhbWUuCgo+IENhbiB5b3UgcGxlYXNlIHNoYXJlIGJsb2F0LW8tbWV0ZXIgcmVwb3J0IGFn
YWluc3QgdGhpcyBwYXRjaD8gQ2FuIHlvdQo+IGFsc28gc2hvdyBhbiBleGFtcGxlIG9mIGNvZGUg
Z2VuZXJhdGlvbiBiZWZvcmUgYW5kIGFmdGVyPyBIYXZlIHlvdQo+IHRyaWVkIHRoZSAndW5saWtl
bHkoKWAgb25lPyBIb3cgdGhlIG91dHB1dCBsb29rcz8KClRoYW5rcyBmb3IgdGhlIHRpcCBvbiBi
bG9hdC1vLW1ldGVyLiBJJ2xsIHRha2UgYSBsb29rIHRvbW9ycm93LgoKPj4gIAlhc20gdm9sYXRp
bGUgKCIub3B0aW9uIHB1c2hcbiIKPj4gIAkJICAgICAgIi5vcHRpb24gYXJjaCwremJiXG4iCj4g
WWVhaCwgbm93IHRoZSBkaWZmIGlzIG11Y2ggY2xlYW5lci4gVGhhbmtzLgoKVGhpcyBpcyB3aHkg
dGhlIGNvbmRpdGlvbiBhdCB0aGUgdG9wIG5lZWRlZCB0byBiZSAiIWhhc19leHRlbnNpb24iLiBT
bwp0aGUgc3RydWN0dXJlIGNhbiBiZToKCsKgIMKgIGlmICghaGFzX2V4dGVuc2lvbikKICAgICAg
ICByZXR1cm4gc3dfdmVyc2lvbjsKCiAgICBtdWx0aV9saW5lCiAgICB6YmJfdmVyc2lvbjsKCklm
IEkgdXNlZCAiaWYgKGhhc19leHRlbnNpb24pIiB0aGUgY29kZSB3b3VsZCBuZWVkIGJlCgrCoCDC
oCBpZiAoaGFzX2V4dGVuc2lvbikgewogICAgICAgIG11bHRpX2xpbmUKICAgICAgICB6YmJfdmVy
c2lvbjsKICAgIH0gZWxzZSB7CiAgICAgICAgc3dfdmVyc2lvbjsKICAgIH0KCkFuZCB3aGV0aGVy
IGl0IHdhcyAibGlrZWx5IiBvciAidW5saWtlbHkiIGhhZCBubyBiZWFyaW5nIG9uIHRoZQpzdHJ1
Y3R1cmUgb2YgdGhlIGNvZGUuCgpWaXZpYW4gImRyYW1mb3JldmVyIiBXYW5nCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
