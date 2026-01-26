Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28D6C88E41
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 02:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZ3okOwH1mg2d/8SP3I0U3LrK9F/9HoO1ckziufsw+M=; b=g/5klP91Zo6M5ptaExwMXCrOzo
	hSwQT5POthuir7T+iKpiN+7jKQPgALBNG3A1ORxuZ4mrCb9VfJc6ej3zcCE1SY0Z6TjDV9LcClYDf
	z6IXuAcDn1qVEy6TopSyQiSWesRtjDBMeYzfYxWbk4qSNIk69FiJnUn5hVJRmGNdOVhoqv0G9NnIi
	x/LjKPTi18w4EBxbVK/aaWGQzJjCC0WseTMOgdq+cMuMNWD/6fsQ5JX1O80y9y85Dm60LjDb6xRpv
	3Kb0kAVyc67WLzEE6RyYF6759u53JsSicE19rgVuy2QBsJ9f68G+TNUwtbROos9SKPkeOf1KKxJ8z
	z3mDUoIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkC5z-0000000Bm9Q-1ZeK;
	Mon, 26 Jan 2026 02:12:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkC5x-0000000Bm9F-3dlX
	for linux-riscv@bombadil.infradead.org;
	Mon, 26 Jan 2026 02:12:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uvGRCXcdboNxFwY0C5xyDG9u0U1RIwl+WZ1KAojT+Rg=; b=ilhD+S5P1jzKvDT0jB8F7YHVGp
	ddXfn2aRFCxcUORyD4xqcg9bIcFiVdjTeml6aqf/xdEjZr+JbwILrSxXrhWdvgnsUfIhgV+pj1duy
	gKRTrYwph8Ch23hhYVBfq8/eMU1rrH4uO2l8XQWh2lxcy03am2jos2Q/+6yGCxAB5QZhdW3qMUVuk
	AG1C5wKeaXx1ulItJIRN394kLLUB5HHsWgjbj4eLVIwce9p1MSQ2v0puWwDwPPseqyrAC+KMsX/PS
	e9vYeA027TDVBnmp6KliOk6A50HF9p/oShcdT4OpLymhT86zA/n4oBM/aC7YmMFaPk9lKT1kSTg0J
	u1+KHnLQ==;
Received: from mail.loongson.cn ([114.242.206.163])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkC5s-00000004Wqg-2uGh
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 02:12:47 +0000
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Axz8OMzXZpepUMAA--.41369S3;
	Mon, 26 Jan 2026 10:12:28 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJCxfcKFzXZp7TQxAA--.30120S3;
	Mon, 26 Jan 2026 10:12:23 +0800 (CST)
Subject: Re: [PATCH 1/1] KVM: Add KVM_GET_REG_LIST ioctl for LoongArch
To: Zixing Liu <liushuyu@aosc.io>, WANG Xuerui <kernel@xen0n.name>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: Kexy Biscuit <kexybiscuit@aosc.io>, Mingcong Bai <jeffbai@aosc.io>,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 rust-for-linux@vger.kernel.org
References: <20260125054322.1237687-1-liushuyu@aosc.io>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <4b504274-4241-0e3e-3ed3-7804b72b7ee8@loongson.cn>
Date: Mon, 26 Jan 2026 10:09:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20260125054322.1237687-1-liushuyu@aosc.io>
Content-Language: en-US
X-CM-TRANSID: qMiowJCxfcKFzXZp7TQxAA--.30120S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxXr4rurW3ArW7KF47ZryxJFc_yoWrGFyDpF
	W3C3ZIqrWFyr1Ik343ZwnxuF98Xrs2gw47ZFy3Ga4xAr4Yyr4FvF40krZrXFWrJ348CF40
	vF10gFyY9FWqv3cCm3ZEXasCq-sJn29KB7ZKAUJUUUUf529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
	twAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2-VyUUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_021245_589779_ED5C3B34 
X-CRM114-Status: GOOD (  26.74  )
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

CgpPbiAyMDI2LzEvMjUg5LiL5Y2IMTo0MywgWml4aW5nIExpdSB3cm90ZToKPiBUaGlzIGlvY3Rs
IGNhbiBiZSB1c2VkIGJ5IHVzZXJzcGFjZSBhcHBsaWNhdGlvbnMgdG8gZGV0ZXJtaW5lIHdoaWNo
Cj4gKHNwZWNpYWwpIHJlZ2lzdGVycyBhcmUgZ2V0L3NldC1hYmxlLgo+IAo+IFRoaXMgY2FuIGJl
IHZlcnkgdXNlZnVsIGZvciBjcm9zcy1wbGF0Zm9ybSBWTU1zIHNvIHRoYXQgdGhleSBkbyBub3Qg
aGF2ZQo+IHRvIGhhcmRjb2RlIHJlZ2lzdGVyIGluZGljZXMgZm9yIGVhY2ggc3VwcG9ydGVkIGFy
Y2hpdGVjdHVyZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogWml4aW5nIExpdSA8bGl1c2h1eXVAYW9z
Yy5pbz4KPiAtLS0KPiAKPiBGb3IgZXhhbXBsZSwgdGhpcyBpb2N0bCBjb3VsZCBiZSB1c2VkIGJ5
IHJ1c3Qtdm1tL3J1c3Qta3ZtIG9yIG1heWJlCj4gVmlydHVhbEJveC1rdm0gaW4gdGhlIGZ1dHVy
ZS4KPiAKPiAgIERvY3VtZW50YXRpb24vdmlydC9rdm0vYXBpLnJzdCB8ICAyICstCj4gICBhcmNo
L2xvb25nYXJjaC9rdm0vdmNwdS5jICAgICAgfCA2OSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCj4gICAyIGZpbGVzIGNoYW5nZWQsIDcwIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0IGIv
RG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0Cj4gaW5kZXggMDFhM2FiZWY4YWJiLi5mNDZk
ZDhiZTI4MmYgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0Cj4g
KysrIGIvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0Cj4gQEAgLTM2MDMsNyArMzYwMyw3
IEBAIFZDUFUgbWF0Y2hpbmcgdW5kZXJseWluZyBob3N0Lgo+ICAgLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gICAKPiAgIDpDYXBhYmlsaXR5OiBiYXNpYwo+IC06QXJjaGl0ZWN0dXJlczogYXJtNjQs
IG1pcHMsIHJpc2N2LCB4ODYgKGlmIEtWTV9DQVBfT05FX1JFRykKPiArOkFyY2hpdGVjdHVyZXM6
IGFybTY0LCBsb29uZ2FyY2gsIG1pcHMsIHJpc2N2LCB4ODYgKGlmIEtWTV9DQVBfT05FX1JFRykK
PiAgIDpUeXBlOiB2Y3B1IGlvY3RsCj4gICA6UGFyYW1ldGVyczogc3RydWN0IGt2bV9yZWdfbGlz
dCAoaW4vb3V0KQo+ICAgOlJldHVybnM6IDAgb24gc3VjY2VzczsgLTEgb24gZXJyb3IKPiBkaWZm
IC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gva3ZtL3ZjcHUuYyBiL2FyY2gvbG9vbmdhcmNoL2t2bS92
Y3B1LmMKPiBpbmRleCA2NTZiOTU0YzExMzQuLmI4ODRlYjljNzZhYSAxMDA2NDQKPiAtLS0gYS9h
cmNoL2xvb25nYXJjaC9rdm0vdmNwdS5jCj4gKysrIGIvYXJjaC9sb29uZ2FyY2gva3ZtL3ZjcHUu
Ywo+IEBAIC0xMTg2LDYgKzExODYsNTcgQEAgc3RhdGljIGludCBrdm1fbG9vbmdhcmNoX3ZjcHVf
c2V0X2F0dHIoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICAgCXJldHVybiByZXQ7Cj4gICB9Cj4g
ICAKPiArc3RhdGljIHVuc2lnbmVkIGxvbmcga3ZtX2xvb25nYXJjaF9udW1fbGJ0X3JlZ3Modm9p
ZCkKPiArewo+ICsJLyogKzEgZm9yIHRoZSBMQlRfRlRPUCBmbGFnIChpbnNpZGUgYXJjaC5mcHUp
ICovCj4gKwlyZXR1cm4gc2l6ZW9mKHN0cnVjdCBsb29uZ2FyY2hfbGJ0KSAvIHNpemVvZih1bnNp
Z25lZCBsb25nKSArIDE7Cj4gK30KPiArCj4gK3N0YXRpYyB1bnNpZ25lZCBsb25nIGt2bV9sb29u
Z2FyY2hfbnVtX3JlZ3Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICt7Cj4gKwkvKiArMSBmb3Ig
dGhlIEtWTV9SRUdfTE9PTkdBUkNIX0NPVU5URVIgcmVnaXN0ZXIgKi8KPiArCXVuc2lnbmVkIGxv
bmcgcmVzID0gQ1NSX01BWF9OVU1TICsgS1ZNX01BWF9DUFVDRkdfUkVHUyArIDE7Cj4gKwo+ICsJ
aWYgKGt2bV9ndWVzdF9oYXNfbGJ0KCZ2Y3B1LT5hcmNoKSkKPiArCQlyZXMgKz0ga3ZtX2xvb25n
YXJjaF9udW1fbGJ0X3JlZ3MoKTsKPiArCj4gKwlyZXR1cm4gcmVzOwo+ICt9Cj4gKwo+ICtzdGF0
aWMgaW50IGt2bV9sb29uZ2FyY2hfY29weV9yZWdfaW5kaWNlcyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsCj4gKwkJCQkJICB1NjQgX191c2VyICp1aW5kaWNlcykKPiArewo+ICsJdTY0IHJlZzsKPiAr
CXVuc2lnbmVkIGludCBpOwo+ICsKPiArCWZvciAoaSA9IDA7IGkgPCBDU1JfTUFYX05VTVM7IGkr
Kykgewo+ICsJCXJlZyA9IEtWTV9JT0NfQ1NSSUQoaSk7Cj4gKwkJaWYgKHB1dF91c2VyKHJlZywg
dWluZGljZXMrKykpCj4gKwkJCXJldHVybiAtRUZBVUxUOwo+ICsJfQpDU1JfTUFYX05VTVMgaXMg
bWF4IG51bWJlciBvZiBhY2Nlc3NpYmxlIENTUiByZWdpc3RlcnMsIGluc3RlYWQgb25seSAKcGFy
dCBvZiB0aGVtIGlzIHVzZWQgYnkgdkNQVSBtb2RlbC4gQnkgbXkgdW5kZXJzdGFuZGluZywgdGhl
cmUgd2lsbCBiZSAKbm8gbXVjaCBtZWFuaW5nIGlmIENTUl9NQVhfTlVNUyBpcyByZXR1cm5lZC4g
QW5kIEkgdGhpbmsgaXQgd2lsbCBiZSAKYmV0dGVyIGlmIHJlYWwgQ1NSIHJlZ2lzdGVyIGlkIGFu
ZCBudW1iZXIgaXMgcmV0dXJuZWQuCgpSZWdhcmRzCkJpYm8gTWFvCj4gKwo+ICsJZm9yIChpID0g
MDsgaSA8IEtWTV9NQVhfQ1BVQ0ZHX1JFR1M7IGkrKykgewo+ICsJCXJlZyA9IEtWTV9JT0NfQ1BV
Q0ZHKGkpOwo+ICsJCWlmIChwdXRfdXNlcihyZWcsIHVpbmRpY2VzKyspKQo+ICsJCQlyZXR1cm4g
LUVGQVVMVDsKPiArCX0KPiArCj4gKwlyZWcgPSBLVk1fUkVHX0xPT05HQVJDSF9DT1VOVEVSOwo+
ICsJaWYgKHB1dF91c2VyKHJlZywgdWluZGljZXMrKykpCj4gKwkJcmV0dXJuIC1FRkFVTFQ7Cj4g
Kwo+ICsJaWYgKCFrdm1fZ3Vlc3RfaGFzX2xidCgmdmNwdS0+YXJjaCkpCj4gKwkJcmV0dXJuIDA7
Cj4gKwo+ICsJZm9yIChpID0gMTsgaSA8PSBrdm1fbG9vbmdhcmNoX251bV9sYnRfcmVncygpOyBp
KyspIHsKPiArCQlyZWcgPSAoS1ZNX1JFR19MT09OR0FSQ0hfTEJUIHwgS1ZNX1JFR19TSVpFX1U2
NCB8IGkpOwo+ICsJCWlmIChwdXRfdXNlcihyZWcsIHVpbmRpY2VzKyspKQo+ICsJCQlyZXR1cm4g
LUVGQVVMVDsKPiArCX0KPiArCj4gKwlyZXR1cm4gMDsKPiArfQo+ICsKPiAgIGxvbmcga3ZtX2Fy
Y2hfdmNwdV9pb2N0bChzdHJ1Y3QgZmlsZSAqZmlscCwKPiAgIAkJCSB1bnNpZ25lZCBpbnQgaW9j
dGwsIHVuc2lnbmVkIGxvbmcgYXJnKQo+ICAgewo+IEBAIC0xMjUxLDYgKzEzMDIsMjQgQEAgbG9u
ZyBrdm1fYXJjaF92Y3B1X2lvY3RsKHN0cnVjdCBmaWxlICpmaWxwLAo+ICAgCQlyID0ga3ZtX2xv
b25nYXJjaF92Y3B1X3NldF9hdHRyKHZjcHUsICZhdHRyKTsKPiAgIAkJYnJlYWs7Cj4gICAJfQo+
ICsJY2FzZSBLVk1fR0VUX1JFR19MSVNUOiB7Cj4gKwkJc3RydWN0IGt2bV9yZWdfbGlzdCBfX3Vz
ZXIgKnVzZXJfbGlzdCA9IGFyZ3A7Cj4gKwkJc3RydWN0IGt2bV9yZWdfbGlzdCByZWdfbGlzdDsK
PiArCQl1bnNpZ25lZCBuOwo+ICsKPiArCQlyID0gLUVGQVVMVDsKPiArCQlpZiAoY29weV9mcm9t
X3VzZXIoJnJlZ19saXN0LCB1c2VyX2xpc3QsIHNpemVvZihyZWdfbGlzdCkpKQo+ICsJCQlicmVh
azsKPiArCQluID0gcmVnX2xpc3QubjsKPiArCQlyZWdfbGlzdC5uID0ga3ZtX2xvb25nYXJjaF9u
dW1fcmVncyh2Y3B1KTsKPiArCQlpZiAoY29weV90b191c2VyKHVzZXJfbGlzdCwgJnJlZ19saXN0
LCBzaXplb2YocmVnX2xpc3QpKSkKPiArCQkJYnJlYWs7Cj4gKwkJciA9IC1FMkJJRzsKPiArCQlp
ZiAobiA8IHJlZ19saXN0Lm4pCj4gKwkJCWJyZWFrOwo+ICsJCXIgPSBrdm1fbG9vbmdhcmNoX2Nv
cHlfcmVnX2luZGljZXModmNwdSwgdXNlcl9saXN0LT5yZWcpOwo+ICsJCWJyZWFrOwo+ICsJfQo+
ICAgCWRlZmF1bHQ6Cj4gICAJCXIgPSAtRU5PSU9DVExDTUQ7Cj4gICAJCWJyZWFrOwo+IAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
