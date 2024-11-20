Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D617D63939
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Nov 2024 13:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqcT2LTKpOZYkt+m/G8P4lBGWmNElThVJxwISFdXV4A=; b=BpAGYW3Sx/V/VQ
	3crFe1D3nbb/zJZQRBlcIf/EPjvUEyWFbGEaLanne36Ulf3cGoqrs2oNyHfeiMZDsmnryh9KFXnGh
	psgqyB1Y7J5UafvhRNiSrNo1TOOjcHd5XONnKqi7iWVV4e0Q5Lqs+IrFvS5k4VyPcpXq31aToDgd2
	/7Sn5FTffQ9lUIFjuqWX+U08+bSrr4xcaLVCnwK9HkEhdy6AaJ4hJEqfaoOpQJaK24iatMaYOp7rw
	tiaURjCn2VpRYMJDKwdtIMYcLLduvfbnhmMYo+z1QVb6MF9GG7QJR7c8aHXZP4KZw9SwWikaiBmeG
	NovqWHBRzNelsazecgnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDl8A-0000000FRW1-2CvZ;
	Wed, 20 Nov 2024 13:52:30 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDl87-0000000FRUY-1RPm
	for linux-riscv@lists.infradead.org;
	Wed, 20 Nov 2024 13:52:28 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a9f1d76dab1so1116557466b.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Nov 2024 05:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1732110744; x=1732715544; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oF1WJd5o8NNk5bxo210yPA8z3YQUEtaEDUj0L4ZArio=;
        b=fYf+Ze3PU1HRwIX/Xb8Uux6PUFBtFxqRpwOatEHmTNudhrGQfKnpOyynicHxvUT8nm
         mWfE2Lqy1Or8XP1AaD2TC3oRKxVqJJhVrz7I3vvbJ+TxF9u18UgPPs7WoFKhOyOsGxvA
         tpAq7GAn/1u42fMLS+A+WE6XtPw9S6TPkEOjFz7X8cc2afrV6e1arrp2DdhtTbsICfRk
         8iG43ZbQH4ePxihYOaNrMlZInkcy3W9WXmPNuEKxc60ny7+UVET99e8UqiUteY4tco1N
         ax0oJjdBvYgTfH/cH2/n9Txok//BT4SxqlBzqxVBvVlI4RaRiQjieGLUKuiIEHHSudR/
         qROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732110744; x=1732715544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oF1WJd5o8NNk5bxo210yPA8z3YQUEtaEDUj0L4ZArio=;
        b=AmrVS0JaOfZMnUYHWNPfDSImxjx3SMGyyWREjEhBvhe2vMMWYsD/kg6ytIqLFLMba7
         m8RdHKpfsea84ZYtIi5FAemLSk5C4I5v1rGhFVbCCFPZWNUA62beSic5DkbbF4ujqLVr
         UA6CgYCC1TaafxEYUSR7LpyWAejfuffCEscUcivDtdBiJKChsZQSudqpNdvcUk7jmASR
         O4iu+TvUOweuMbRVeY4nU6oNb3POuCWJ6bvUF8sqvmb9paHNNPKjHyoSAoSlyLAbxOqB
         VH0XHyHZ+PVRhU4WZQhLBEjbFPyeRGwD8Zik2uhwT/ccfhWtYgqT60hrBM+uOX7COXG/
         zdBA==
X-Forwarded-Encrypted: i=1; AJvYcCWcpiPZ+C2WGze6DZrgNUmLTgIp29EM7UowjF/HL2k9TAoL1iwzbus/ElP0zHfaLZSnCey+YiGd0nkiNg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzvjoNFhJbjTS6IewLIpTcBvdiDmrQFCSKC+eLhrpU5Ssvx0NgB
	7OLpfGuguc/mQ2mrh4OV2xHE7acAg/YYRfrsr9ed0u9q0wRKn6JM1qYbc2krHP4cVAf4LeUEd2I
	PapnfH3ZTiTYcrWIXFbKvpkOU41fEXbkecR6OeQ==
X-Google-Smtp-Source: AGHT+IHQbSPmIRk+nyxcCDhL6psKoFpre2KnuKJw0d51DE1Qt3M4MVBURAlZdsR8Cf/ZQ8CcHiCj6EIuYVVKQP3ds8U=
X-Received: by 2002:a17:906:dac8:b0:a9a:6b4c:9d2c with SMTP id
 a640c23a62f3a-aa4dd761c7dmr250067266b.59.1732110744083; Wed, 20 Nov 2024
 05:52:24 -0800 (PST)
MIME-Version: 1.0
References: <20240927-dev-maxh-svukte-rebase-2-v2-0-9afe57c33aee@sifive.com>
 <20240927-dev-maxh-svukte-rebase-2-v2-3-9afe57c33aee@sifive.com>
 <CAAhSdy0ncLTAjEE1s-GWL95sscxwQFsKn1rXyA1_VVfk1bQBiw@mail.gmail.com>
 <CAHibDywpKUE7r4UfcudDSBZCM=JAC5s40uf+PwQE+oMvZy4aVA@mail.gmail.com> <CAK9=C2WEU53TD+tnWRLC1iLRf+j607s=bZXevkogTnr-cmhPGw@mail.gmail.com>
In-Reply-To: <CAK9=C2WEU53TD+tnWRLC1iLRf+j607s=bZXevkogTnr-cmhPGw@mail.gmail.com>
From: Max Hsu <max.hsu@sifive.com>
Date: Wed, 20 Nov 2024 21:52:13 +0800
Message-ID: <CAHibDyxWBHeKOx=sT63EmEwhwyAYMQ3TE2tkOSK8V45PhjztPA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/3] riscv: KVM: Add Svukte extension support for Guest/VM
To: Anup Patel <apatel@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@sifive.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, Samuel Holland <samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_055227_412310_DD6C74D0 
X-CRM114-Status: GOOD (  29.03  )
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

SGkgQW51cCwKCkZyb20geW91ciByZXBseSwgSSB0aGluayBteSBjb21taXQgbWVzc2FnZSB3YXMg
bWlzbGVhZGluZy4KVGhlcmVmb3JlLCBJIHdpbGwgc2VuZCBSRkMgdjMgcGF0Y2hlcyBhbmQgZXhw
bGFpbiB0aGUgZ3Vlc3Qgc2NlbmFyaW8gaW4gdGhlCmNvdmVyIGxldHRlci4KClRoYW5rcyBmb3Ig
dGhlIHN1Z2dlc3Rpb24uCgpCZXN0IHJlZ2FyZHMsCk1heCBIc3UKCk9uIE1vbiwgTm92IDQsIDIw
MjQgYXQgOToxOeKAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90
ZToKPgo+IE9uIE1vbiwgTm92IDQsIDIwMjQgYXQgMToxNOKAr1BNIE1heCBIc3UgPG1heC5oc3VA
c2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgQW51cCwKPiA+Cj4gPiBUaGFuayB5b3UgZm9y
IHRoZSBzdWdnZXN0aW9uLgo+ID4KPiA+IEnigJltIG5vdCBlbnRpcmVseSBzdXJlIGlmIEkgZnVs
bHkgdW5kZXJzdGFuZCBpdCwgYnV0IEkgYmVsaWV2ZSB0aGUKPiA+IGh5cGVydmlzb3Igc2hvdWxk
IGJlIGFibGUgdG8gZGlzYWJsZSB0aGUgU3Z1a3RlIGV4dGVuc2lvbi4KPiA+Cj4gPiBJbnNpZGUg
dGhlIHN3aXRjaC1jYXNlIG9mIGt2bV9yaXNjdl92Y3B1X2lzYV9kaXNhYmxlX2FsbG93ZWQoKSwK
PiA+IHRoZSBkZWZhdWx0IGNhc2UgYnJlYWtzIGFuZCByZXR1cm5zIHRydWUuCj4gPgo+ID4gU28g
dGhhdCBtZWFucyB3aGVuIHRoZSBLVk1fUklTQ1ZfSVNBX0VYVF9TVlVLVEUgcGFzc2VkIGludG8K
PiA+IGt2bV9yaXNjdl92Y3B1X2lzYV9kaXNhYmxlX2FsbG93ZWQoKSBpdCB3aWxsIHJldHVybiB0
cnVlLgo+ID4KPiA+IElmIEkndmUgbWlzdW5kZXJzdG9vZCwgcGxlYXNlIGxldCBtZSBrbm93Lgo+
Cj4gSSBkb24ndCBzZWUgYW55IGNvZGUgaW4gdGhpcyBwYXRjaCB3aGljaCBkaXNhYmxlcy9lbmFi
bGVzIFN2dWt0ZSBmb3IKPiBHdWVzdCBiYXNlZCBvbiBLVk0gT05FX1JFRyBpbnRlcmZhY2UuCj4K
PiBSZWdhcmRzLAo+IEFudXAKPgo+ID4KPiA+IEJlc3QgcmVnYXJkcywKPiA+IE1heCBIc3UKPiA+
Cj4gPiBPbiBGcmksIE9jdCAyNSwgMjAyNCBhdCAzOjE34oCvQU0gQW51cCBQYXRlbCA8YW51cEBi
cmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIEZyaSwgU2VwIDI3LCAyMDI0IGF0
IDc6MTLigK9QTSBNYXggSHN1IDxtYXguaHN1QHNpZml2ZS5jb20+IHdyb3RlOgo+ID4gPiA+Cj4g
PiA+ID4gQWRkIEtWTSBJU0EgZXh0ZW5zaW9uIE9ORV9SRUcgaW50ZXJmYWNlIHRvIGFsbG93IFZN
TSB0b29scyB0bwo+ID4gPiA+IGRldGVjdCBhbmQgZW5hYmxlIFN2dWt0ZSBleHRlbnNpb24gZm9y
IEd1ZXN0L1ZNLgo+ID4gPiA+Cj4gPiA+ID4gUmV2aWV3ZWQtYnk6IFNhbXVlbCBIb2xsYW5kIDxz
YW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IE1heCBIc3Ug
PG1heC5oc3VAc2lmaXZlLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2t2bS5oIHwgMSArCj4gPiA+ID4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfb25l
cmVnLmMgICAgICB8IDEgKwo+ID4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2Fz
bS9rdm0uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaAo+ID4gPiA+IGluZGV4
IGU5N2RiMzI5NjQ1NmUxOWY3OWNhMDJlNGM0ZjcwYWUxYjRhYmI0OGIuLjQxYjQ2NmI3ZmZhZWM0
MjFlODM4OWQzZjViMTc4NTgwMDkxYTJjOTggMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvYXJjaC9yaXNj
di9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L3VhcGkvYXNtL2t2bS5oCj4gPiA+ID4gQEAgLTE3NSw2ICsxNzUsNyBAQCBlbnVtIEtWTV9SSVND
Vl9JU0FfRVhUX0lEIHsKPiA+ID4gPiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pDRiwKPiA+
ID4gPiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pDTU9QLAo+ID4gPiA+ICAgICAgICAgS1ZN
X1JJU0NWX0lTQV9FWFRfWkFXUlMsCj4gPiA+ID4gKyAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9T
VlVLVEUsCj4gPiA+ID4gICAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9NQVgsCj4gPiA+ID4gIH07
Cj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcu
YyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKPiA+ID4gPiBpbmRleCBiMzE5YzRjMTNj
NTRjZTIyZDJhNzU1MmY0YzlmMjU2YTBjNTA3ODBlLi42NzIzN2Q2ZTUzODgyYTlmY2QyY2YyNjVh
YTE3MDRmMjVjYzRhNzAxIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVf
b25lcmVnLmMKPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCj4gPiA+
ID4gQEAgLTQxLDYgKzQxLDcgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGxvbmcga3ZtX2lzYV9l
eHRfYXJyW10gPSB7Cj4gPiA+ID4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoU1ZJTlZBTCksCj4g
PiA+ID4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoU1ZOQVBPVCksCj4gPiA+ID4gICAgICAgICBL
Vk1fSVNBX0VYVF9BUlIoU1ZQQk1UKSwKPiA+ID4gPiArICAgICAgIEtWTV9JU0FfRVhUX0FSUihT
VlVLVEUpLAo+ID4gPiA+ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpBQ0FTKSwKPiA+ID4gPiAg
ICAgICAgIEtWTV9JU0FfRVhUX0FSUihaQVdSUyksCj4gPiA+ID4gICAgICAgICBLVk1fSVNBX0VY
VF9BUlIoWkJBKSwKPiA+ID4KPiA+ID4gVGhlIEtWTV9SSVNDVl9JU0FfRVhUX1NWVUtURSBzaG91
bGQgYmUgYWRkZWQgdG8gdGhlCj4gPiA+IHN3aXRjaC1jYXNlIGluIGt2bV9yaXNjdl92Y3B1X2lz
YV9kaXNhYmxlX2FsbG93ZWQoKSBiZWNhdXNlCj4gPiA+IGh5cGVydmlzb3Igc2VlbXMgdG8gaGF2
ZSBubyB3YXkgdG8gZGlzYWJsZSBTdnVrdGUgZm9yIHRoZSBHdWVzdAo+ID4gPiB3aGVuIGl0J3Mg
YXZhaWxhYmxlIG9uIHRoZSBIb3N0Lgo+ID4gPgo+ID4gPiBSZWdhcmRzLAo+ID4gPiBBbnVwCj4g
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
