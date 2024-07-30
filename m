Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05986C3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 08:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=smYbJdTeEgLk3Gj4Q10AZBKzvMWlM5VmOjslN6dcKy0=; b=qStMUb5D0aJsGF
	ME2ZuEzwy1JF9qcG1osSj17B08B4vs0wcE4DgQil8UhrJkaFzXbeNLMzyoDczjJg6kHSsoo7cPgzc
	L7pSAl61XL79307oVNcTQU3PiJTrwQ+eEiPMRhNS5VJonrVK78rxj2btyXqa0tGSXlw3rdFsWXxe0
	7U+HfVyF3vIhWLKA/dmMfUvb5GB+xZMrdH9IFcGu7/V1K8f4rn6j3p1pIJjB6e93VoJGuBEKjfgwy
	2SKCs5PmgUz8mKIhorEig44QT6AMyY+oBEwjxSOuLXNTRkRPzsyFcCIg1DDqN5OTYZJLUqTwrdJmX
	tVup6phEiqRKLaxVE+Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYiT9-0000000ELdp-403l;
	Tue, 30 Jul 2024 08:44:31 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYiT7-0000000ELcD-1ccn
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 08:44:30 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7a1da036d35so267152985a.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jul 2024 01:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722329068; x=1722933868; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9Z8X5Ur6Rsa6ibm6mJESwNAG5xBw8yZz7oNWy7yEQ0=;
        b=M/SPGKFAlesy9SAHS8DxxLKPNP53lvuGMnseq5oyzia+wMuneJtsaf0jMH/KHNXSFw
         jfNWHcbU3487iYl2PDNotYSGfeCH2G6Ypq5pXAlQvGuPNzqb2VqEzrwY74W1Lf1GpSBt
         9Gr9wm7LkaIImE+P9vK2IO+AnzTH/Q7lz6uJZy11+/zy7hnJ/rN8+YpvKyHikUG7v2Nh
         upqDAIUmf1KZi17G845bgDq2iF038RsBvjaBqKnnOgAelEfNdFiTymise9/uA9wdLfWI
         PSbL4kVoPYBg91nISnsssX45OkFHH1eybo/PS3zxg9cYXBdWLyG3x/cSpZON4qfyqe8M
         yttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722329068; x=1722933868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9Z8X5Ur6Rsa6ibm6mJESwNAG5xBw8yZz7oNWy7yEQ0=;
        b=KMdL4rdwV841ZNl2CcY+Bl85gzhZCAK1/ZhQXmP8yEc6XrM93KZOsW32PDRuGXWxkk
         ulqCX0RBnyowIvqrpGFPbDPEpUbBuNi80obaSN4UycpQeDQCXD+uPAczc7z4CoLp8LfT
         ak0WsO7Xevz2q2x+zkEzuf27IkeGd08k+J42SaPrHBrgltltVXtu5bcFUXdcljqAUdyB
         Sr2sFTZfOsBRmxtkhczKcBRsdv1tThZgd0NE891XdtehIJ4IEUfeK6BuT3Z/UEndJ+xN
         CPE3lqjOklTlbcvoH+OfYGKrVUYuwmmourM+A4rM7FSUPcwvWJzKSEPyECNjhKeMkNxs
         wmXg==
X-Gm-Message-State: AOJu0Yz57M0LSz/M2+HSZa8PRHCke51Ebs0DiBg57I3y3oBEr2Yq07Xc
	RmHwDKD/qLsJypWL8bJ9+hS7hNJgY0YQAOZV3cGWxhbFMziqqmQNAlRQoSaiG0EUlOidiX1SoiX
	udtKG6OzzDAyYU+TklGjYMZVfHrlzd+RctJb/0w==
X-Google-Smtp-Source: AGHT+IF6pSDZRcuI8UOjMmmGb/r5CZ13qlBfJEvjHj524MWPSKJ+lHN8ZSGpcY+epryewRGd3voPyD3rfCPugLFzS04=
X-Received: by 2002:a05:620a:28d2:b0:79d:5565:5120 with SMTP id
 af79cd13be357-7a1e526aee0mr1325025085a.34.1722329067673; Tue, 30 Jul 2024
 01:44:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240702102637.9074-1-mchitale@ventanamicro.com> <mhng-38c26ef6-8d45-4dd1-9c3a-f71f34f1ef81@palmer-ri-x1c9>
In-Reply-To: <mhng-38c26ef6-8d45-4dd1-9c3a-f71f34f1ef81@palmer-ri-x1c9>
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Tue, 30 Jul 2024 14:13:52 +0530
Message-ID: <CAN37VV6DMpsRWnH-1tN2AfT8HXbEFh2We4Yw0XYkuCNvF75o4w@mail.gmail.com>
Subject: Re: [PATCH v8] riscv: mm: Add support for Svinval extension
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, alexghiti@rivosinc.com, 
	samuel.holland@sifive.com, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_014429_455219_86E33C2E 
X-CRM114-Status: GOOD (  32.55  )
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

T24gV2VkLCBKdWwgMjQsIDIwMjQgYXQgODoyMOKAr1BNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
ZGFiYmVsdC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCAwMiBKdWwgMjAyNCAwMzoyNjozNyBQRFQg
KC0wNzAwKSwgbWNoaXRhbGVAdmVudGFuYW1pY3JvLmNvbSB3cm90ZToKPiA+IFRoZSBTdmludmFs
IGV4dGVuc2lvbiBzcGxpdHMgU0ZFTkNFLlZNQSBpbnN0cnVjdGlvbiBpbnRvIGZpbmVyLWdyYWlu
ZWQKPiA+IGludmFsaWRhdGlvbiBhbmQgb3JkZXJpbmcgb3BlcmF0aW9ucyBhbmQgaXMgbWFuZGF0
b3J5IGZvciBSVkEyM1M2NCBwcm9maWxlLgo+ID4gV2hlbiBTdmludmFsIGlzIGVuYWJsZWQgdGhl
IGxvY2FsX2ZsdXNoX3RsYl9yYW5nZV90aHJlc2hvbGRfYXNpZCBmdW5jdGlvbgo+ID4gc2hvdWxk
IHVzZSB0aGUgZm9sbG93aW5nIHNlcXVlbmNlIHRvIG9wdGltaXplIHRoZSB0bGIgZmx1c2hlcyBp
bnN0ZWFkIG9mCj4KPiBEbyB5b3UgaGF2ZSBhbnkgcGVyZm9ybWFuY2UgbnVtYmVycyBmb3IgdGhl
IG9wdGltaXphdGlvbj8gIEFzIHBlciBoZXJlCj4gPGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC9taG5nLWY3OTliZDJiLTdmMjItNGMwMy1iZGIyLTkwM2ZhM2I1ZDUwOEBwYWxtZXItcmkteDFj
OWEvPi4KCk5vLCBjdXJyZW50bHkgdGhlcmUgYXJlIG5vIG51bWJlcnMgYXZhaWxhYmxlIGZvciBj
b21wYXJpc29uIGJ1dCB0aGUKcmF0aW9uYWxlIGZvciB0aGUgb3B0aW1pemF0aW9uIGlzIGRlc2Ny
aWJlZCBpbiB0aGUgc3BlYy4gVGhlIGV4dGVuc2lvbgppcyBtYW5kYXRvcnkgZm9yIHRoZSBSVkEy
M1M2NCBwcm9maWxlIGJ1dCBhbnkgcGxhdGZvcm0gdGhhdCBkb2Vzbid0CnN1cHBvcnQgdGhpcyBl
eHRlbnNpb24gd2lsbCBub3QgYmUgaW1wYWN0ZWQgYXMgdGhlIGNvZGUgZXhlY3V0ZXMgb25seQpp
ZiB0aGUgc3ZpbnZhbCBleHRlbnNpb24gaXMgZW5hYmxlZCBhdCB0aGUgYm9vdCB1cC4KPgo+ID4g
YSBzaW1wbGUgc2ZlbmNlLnZtYToKPiA+Cj4gPiBzZmVuY2Uudy5pbnZhbAo+ID4gc3ZpbnZhbC52
bWEKPiA+ICAgLgo+ID4gICAuCj4gPiBzdmludmFsLnZtYQo+ID4gc2ZlbmNlLmludmFsLmlyCj4g
Pgo+ID4gVGhlIG1heGltdW0gbnVtYmVyIG9mIGNvbnNlY3V0aXZlIHN2aW52YWwudm1hIGluc3Ry
dWN0aW9ucyB0aGF0Cj4gPiBjYW4gYmUgZXhlY3V0ZWQgaW4gbG9jYWxfZmx1c2hfdGxiX3Jhbmdl
X3RocmVzaG9sZF9hc2lkIGZ1bmN0aW9uCj4gPiBpcyBsaW1pdGVkIHRvIDY0LiBUaGlzIGlzIHJl
cXVpcmVkIHRvIGF2b2lkIHNvZnQgbG9ja3VwcyBhbmQgdGhlCj4gPiBhcHByb2FjaCBpcyBzaW1p
bGFyIHRvIHRoYXQgdXNlZCBpbiBhcm02NC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXl1cmVz
aCBDaGl0YWxlIDxtY2hpdGFsZUB2ZW50YW5hbWljcm8uY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEFu
ZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gPiAtLS0KPiA+IENoYW5nZXMg
aW4gdjg6Cj4gPiAtIEZpeCBsaW5lIHdyYXAKPiA+IC0gQWRkIFJCIHRhZwo+ID4KPiA+IENoYW5n
ZXMgaW4gdjc6Cj4gPiAtIFVzZSBleGlzdGluZyBzdmludmFsIG1hY3JvcyBpbiB0aGUgaW5zbi1k
ZWYuaAo+ID4gLSBSZW5hbWUgbG9jYWxfc2ludmFsX3ZtYV9hc2lkIHRvIGxvY2FsX3NpbnZhbF92
bWEKPiA+Cj4gPiBDaGFuZ2VzIGluIHY2Ogo+ID4gLSBSZWJhc2Ugb24gbGF0ZXN0IHRvcnZhbGRz
L21hc3Rlcgo+ID4KPiA+IENoYW5nZXMgaW4gdjU6Cj4gPiAtIFJlZHVjZSB0bGIgZmx1c2ggdGhy
ZXNob2xkIHRvIDY0Cj4gPiAtIEltcHJvdmUgaW1wbGVtZW50YXRpb24gb2YgbG9jYWxfZmx1c2hf
dGxiKiBmdW5jdGlvbnMKPiA+Cj4gPiBDaGFuZ2VzIGluIHY0Ogo+ID4gLSBSZWJhc2UgYW5kIHJl
ZmFjdG9yIGFzIHBlciBsYXRlc3QgY2hhbmdlcyBvbiB0b3J2YWxkcy9tYXN0ZXIKPiA+IC0gRHJv
cCBwYXRjaCAxIGluIHRoZSBzZXJpZXMKPiA+Cj4gPiBDaGFuZ2VzIGluIHYzOgo+ID4gLSBGaXgg
aW5jb3JyZWN0IHZtYSB1c2VkIGZvciBzaW52YWwgaW5zdHJ1Y3Rpb25zCj4gPiAtIFVzZSB1bmlm
aWVkIHN0YXRpYyBrZXkgbWVjaGFuaXNtIGZvciBzdmludmFsCj4gPiAtIFJlYmFzZWQgb24gdG9y
dmFsZHMvbWFzdGVyCj4gPgo+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+IC0gUmViYXNlZCBvbiA1LjE4
LXJjMwo+ID4gLSB1cGRhdGUgcmlzY3ZfZmlsbF9od2NhcCB0byBwcm9iZSBTdmludmFsIGV4dGVu
c2lvbgo+ID4KPiA+ICBhcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMgfCAzMiArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCsp
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyBiL2FyY2gvcmlz
Y3YvbW0vdGxiZmx1c2guYwo+ID4gaW5kZXggOWI2ZTg2Y2UzODY3Li43ODIxNDdhNjNmM2IgMTAw
NjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMKPiA+ICsrKyBiL2FyY2gvcmlz
Y3YvbW0vdGxiZmx1c2guYwo+ID4gQEAgLTYsNiArNiwyNyBAQAo+ID4gICNpbmNsdWRlIDxsaW51
eC9odWdldGxiLmg+Cj4gPiAgI2luY2x1ZGUgPGFzbS9zYmkuaD4KPiA+ICAjaW5jbHVkZSA8YXNt
L21tdV9jb250ZXh0Lmg+Cj4gPiArI2luY2x1ZGUgPGFzbS9jcHVmZWF0dXJlLmg+Cj4gPiArCj4g
PiArI2RlZmluZSBoYXNfc3ZpbnZhbCgpICAgICAgICByaXNjdl9oYXNfZXh0ZW5zaW9uX3VubGlr
ZWx5KFJJU0NWX0lTQV9FWFRfU1ZJTlZBTCkKPiA+ICsKPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQg
bG9jYWxfc2ZlbmNlX2ludmFsX2lyKHZvaWQpCj4gPiArewo+ID4gKyAgICAgYXNtIHZvbGF0aWxl
KFNGRU5DRV9JTlZBTF9JUigpIDo6OiAibWVtb3J5Iik7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRp
YyBpbmxpbmUgdm9pZCBsb2NhbF9zZmVuY2Vfd19pbnZhbCh2b2lkKQo+ID4gK3sKPiA+ICsgICAg
IGFzbSB2b2xhdGlsZShTRkVOQ0VfV19JTlZBTCgpIDo6OiAibWVtb3J5Iik7Cj4gPiArfQo+ID4g
Kwo+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBsb2NhbF9zaW52YWxfdm1hKHVuc2lnbmVkIGxvbmcg
dm1hLCB1bnNpZ25lZCBsb25nIGFzaWQpCj4gPiArewo+ID4gKyAgICAgaWYgKGFzaWQgIT0gRkxV
U0hfVExCX05PX0FTSUQpCj4gPiArICAgICAgICAgICAgIGFzbSB2b2xhdGlsZShTSU5WQUxfVk1B
KCUwLCAlMSkgOiA6ICJyIiAodm1hKSwgInIiIChhc2lkKSA6ICJtZW1vcnkiKTsKPiA+ICsgICAg
IGVsc2UKPiA+ICsgICAgICAgICAgICAgYXNtIHZvbGF0aWxlKFNJTlZBTF9WTUEoJTAsIHplcm8p
IDogOiAiciIgKHZtYSkgOiAibWVtb3J5Iik7Cj4gPiArfQo+ID4KPiA+ICAvKgo+ID4gICAqIEZs
dXNoIGVudGlyZSBUTEIgaWYgbnVtYmVyIG9mIGVudHJpZXMgdG8gYmUgZmx1c2hlZCBpcyBncmVh
dGVyCj4gPiBAQCAtMjYsNiArNDcsMTYgQEAgc3RhdGljIHZvaWQgbG9jYWxfZmx1c2hfdGxiX3Jh
bmdlX3RocmVzaG9sZF9hc2lkKHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4gPiAgICAgICAgICAgICAg
IHJldHVybjsKPiA+ICAgICAgIH0KPiA+Cj4gPiArICAgICBpZiAoaGFzX3N2aW52YWwoKSkgewo+
ID4gKyAgICAgICAgICAgICBsb2NhbF9zZmVuY2Vfd19pbnZhbCgpOwo+ID4gKyAgICAgICAgICAg
ICBmb3IgKGkgPSAwOyBpIDwgbnJfcHRlc19pbl9yYW5nZTsgKytpKSB7Cj4gPiArICAgICAgICAg
ICAgICAgICAgICAgbG9jYWxfc2ludmFsX3ZtYShzdGFydCwgYXNpZCk7Cj4gPiArICAgICAgICAg
ICAgICAgICAgICAgc3RhcnQgKz0gc3RyaWRlOwo+ID4gKyAgICAgICAgICAgICB9Cj4gPiArICAg
ICAgICAgICAgIGxvY2FsX3NmZW5jZV9pbnZhbF9pcigpOwo+ID4gKyAgICAgICAgICAgICByZXR1
cm47Cj4gPiArICAgICB9Cj4gPiArCj4gPiAgICAgICBmb3IgKGkgPSAwOyBpIDwgbnJfcHRlc19p
bl9yYW5nZTsgKytpKSB7Cj4gPiAgICAgICAgICAgICAgIGxvY2FsX2ZsdXNoX3RsYl9wYWdlX2Fz
aWQoc3RhcnQsIGFzaWQpOwo+ID4gICAgICAgICAgICAgICBzdGFydCArPSBzdHJpZGU7CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
