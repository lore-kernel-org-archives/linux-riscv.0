Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162FEC4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H83T1fttCU+2DA0WWky6arTAViwS/S/ir7CL3JR7NyM=; b=LXZgXcJPxy5WfC
	SIUuR4gGy5Zt7DocnWETjpLv8+oKDPVGHYFH7AuUAyY2YV9CTm7nqF43WldblZoRn79wDYM7LYDYV
	VB0jvPqfQT+riUDvkqDFGTa/stFEqoylWfXMZktkZ0Egw8HYpAwkHRAhHcEUhLxeLP+D1j5F2F3Eh
	QA90Fk3nwG1XZwa45e47axFndpqo8yqUPxqDvXDdb894iJ7Q5hziT+LJufTW9A8MAJ+ubkQeNSKGZ
	e3LTx+Yedeuc4RgFJ25gXPnNmNejD9rUzxf3Oe0Irm28wUEVl6uLJj4GB9raTSv7a876EnQ1Nwzxs
	whwemBkX634j/jfr/rAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzxks-00GNrf-1F;
	Mon, 06 Nov 2023 11:26:54 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzxko-00GNpn-2Z
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 11:26:52 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-66d1a05b816so30584766d6.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 Nov 2023 03:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699270010; x=1699874810; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcdCS6aA0hU/P/1Lxpxkfas8L67FF+zkKmd2vDLbKHk=;
        b=3lNLRha5HgwzxPxgUoKVVU6nB/Rv4WrMV96MC4zN9BCGfvgk60dk9gk6slG+AuyB8Z
         UZMnM6HGJ5jEVSlWhMZ/VKB855EDZ6qSVUD5tvQpqe9lS3sxcC80+Q6G1rna9kjfA6s9
         GsfVv2AzUime4IKwAC1xBAj59nSuydR4vNSDCkFVzXLNRIQtMK2BY5vDbr9siRorRN1M
         d9dZED+UJnLLl+loApZsKGZHhTy2MF6Y0gASMLbVDCVjt+Us1NBeTUmLT+75YpeE5Y8T
         QhGUdL/B849CdlzsHxxtiEY7vmELmop7zF4jSjucbm7Q09W9ue07CPVeRvwNbv4s+9zv
         /qlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699270010; x=1699874810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bcdCS6aA0hU/P/1Lxpxkfas8L67FF+zkKmd2vDLbKHk=;
        b=YIINA+5LRqQ0gKhH0Lu+alkTJ5onipnBqkT582cSJc3DhtY+yNzOOnLNyUuKw5m5Jt
         UJBi5CD4M+rkQvwPkIAkJwmwAg6obd6IBPf8A3DAlXZb53Mj8JZnZhEdLg3N/85m1d+2
         uRo0zocrajwTDsopon3BQVVR7+P6wWQaDw9Uk50r0R9wdPj4NYZRsNy9MIF1hrvlOAUr
         CrgT3+akrejv6IoaH0lXol5zwp0X1tB1WcdrAJT3sdJxi3V6jYwPei87L5WXHBGojIKb
         +EnCCdfWWVht/A0S2IkhK4mg2aZ86OnYYm/3DU+g50gs/dZQBrL33f210FS9CJlDS/Vo
         MhbA==
X-Gm-Message-State: AOJu0YzuPmCVAiMQnXKUI0fSdcvtxOsYXwKe2hk58hx/abGWjE81VhVO
	U8ThOfIxLJoVawsp781kqhJFovXMoy3bToZReeokew==
X-Google-Smtp-Source: AGHT+IFasxLYHHudhBN/+4eIX1OsOhIRfSB2CWnjQO7Y6r4dz1/Ca+R2Pv6YHi7+A5fsQfNYO2/OlOsYvWwG9CsrzMM=
X-Received: by 2002:a05:6214:2506:b0:658:26d7:72e0 with SMTP id
 gf6-20020a056214250600b0065826d772e0mr20208405qvb.4.1699270009660; Mon, 06
 Nov 2023 03:26:49 -0800 (PST)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-28-seanjc@google.com>
In-Reply-To: <20231027182217.3615211-28-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 6 Nov 2023 11:26:13 +0000
Message-ID: <CA+EHjTyjeKymYaJ3kTpVzRFPLKxeDEf9B-DGo7xif_FPN1dFBQ@mail.gmail.com>
Subject: Re: [PATCH v13 27/35] KVM: selftests: Add helpers to convert guest
 memory b/w private and shared
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Xu Yilun <yilun.xu@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_032650_835081_FA4B3193 
X-CRM114-Status: GOOD (  19.82  )
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

T24gRnJpLCBPY3QgMjcsIDIwMjMgYXQgNzoyM+KAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IEZyb206IFZpc2hhbCBBbm5hcHVydmUgPHZhbm5h
cHVydmVAZ29vZ2xlLmNvbT4KPgo+IEFkZCBoZWxwZXJzIHRvIGNvbnZlcnQgbWVtb3J5IGJldHdl
ZW4gcHJpdmF0ZSBhbmQgc2hhcmVkIHZpYSBLVk0ncwo+IG1lbW9yeSBhdHRyaWJ1dGVzLCBhcyB3
ZWxsIGFzIGhlbHBlcnMgdG8gZnJlZS9hbGxvY2F0ZSBndWVzdF9tZW1mZCBtZW1vcnkKPiB2aWEg
ZmFsbG9jYXRlKCkuICBVc2Vyc3BhY2UsIGkuZS4gdGVzdHMsIGlzIE5PVCByZXF1aXJlZCB0byBk
byBmYWxsb2NhdGUoKQo+IHdoZW4gY29udmVydGluZyBtZW1vcnksIGFzIHRoZSBhdHRyaWJ1dGVz
IGFyZSB0aGUgc2luZ2xlIHNvdXJjZSBvZiB0cnVlLgoKdHJ1ZS0+dHJ1dGgKCj4gUHJvdmlkZSBh
bGxvY2F0ZSgpIGhlbHBlcnMgc28gdGhhdCB0ZXN0cyBjYW4gbWltaWMgYSB1c2Vyc3BhY2UgdGhh
dCBmcmVlcwo+IHByaXZhdGUgbWVtb3J5IG9uIGNvbnZlcnNpb24sIGUuZy4gdG8gcHJpb3JpdGl6
ZSBtZW1vcnkgdXNhZ2Ugb3Zlcgo+IHBlcmZvcm1hbmNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogVmlz
aGFsIEFubmFwdXJ2ZSA8dmFubmFwdXJ2ZUBnb29nbGUuY29tPgo+IENvLWRldmVsb3BlZC1ieTog
U2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
U2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Cj4gLS0tCj4gIC4uLi9zZWxm
dGVzdHMva3ZtL2luY2x1ZGUva3ZtX3V0aWxfYmFzZS5oICAgICB8IDQ4ICsrKysrKysrKysrKysr
KysrKysKPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9rdm1fdXRpbC5jICAgIHwg
MjggKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA3NiBpbnNlcnRpb25zKCspCj4KPiBk
aWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUva3ZtX3V0aWxf
YmFzZS5oIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUva3ZtX3V0aWxfYmFz
ZS5oCj4gaW5kZXggOWY4NjExODJjMDJhLi4xNDQxZmNhNmMyNzMgMTAwNjQ0Cj4gLS0tIGEvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUva3ZtX3V0aWxfYmFzZS5oCj4gKysrIGIv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUva3ZtX3V0aWxfYmFzZS5oCj4gQEAg
LTMzMyw2ICszMzMsNTQgQEAgc3RhdGljIGlubGluZSB2b2lkIHZtX2VuYWJsZV9jYXAoc3RydWN0
IGt2bV92bSAqdm0sIHVpbnQzMl90IGNhcCwgdWludDY0X3QgYXJnMCkKPiAgICAgICAgIHZtX2lv
Y3RsKHZtLCBLVk1fRU5BQkxFX0NBUCwgJmVuYWJsZV9jYXApOwo+ICB9Cj4KPiArc3RhdGljIGlu
bGluZSB2b2lkIHZtX3NldF9tZW1vcnlfYXR0cmlidXRlcyhzdHJ1Y3Qga3ZtX3ZtICp2bSwgdWlu
dDY0X3QgZ3BhLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dWludDY0X3Qgc2l6ZSwgdWludDY0X3QgYXR0cmlidXRlcykKPiArewo+ICsgICAgICAgc3RydWN0
IGt2bV9tZW1vcnlfYXR0cmlidXRlcyBhdHRyID0gewo+ICsgICAgICAgICAgICAgICAuYXR0cmli
dXRlcyA9IGF0dHJpYnV0ZXMsCj4gKyAgICAgICAgICAgICAgIC5hZGRyZXNzID0gZ3BhLAo+ICsg
ICAgICAgICAgICAgICAuc2l6ZSA9IHNpemUsCj4gKyAgICAgICAgICAgICAgIC5mbGFncyA9IDAs
Cj4gKyAgICAgICB9Owo+ICsKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBLVk1fU0VUX01FTU9S
WV9BVFRSSUJVVEVTIG92ZXJ3cml0ZXMgX2FsbF8gYXR0cmlidXRlcy4gIFRoZXNlIGZsb3dzCj4g
KyAgICAgICAgKiBuZWVkIHNpZ25pZmljYW50IGVuaGFuY2VtZW50cyB0byBzdXBwb3J0IG11bHRp
cGxlIGF0dHJpYnV0ZXMuCj4gKyAgICAgICAgKi8KPiArICAgICAgIFRFU1RfQVNTRVJUKCFhdHRy
aWJ1dGVzIHx8IGF0dHJpYnV0ZXMgPT0gS1ZNX01FTU9SWV9BVFRSSUJVVEVfUFJJVkFURSwKPiAr
ICAgICAgICAgICAgICAgICAgICJVcGRhdGUgbWUgdG8gc3VwcG9ydCBtdWx0aXBsZSBhdHRyaWJ1
dGVzISIpOwo+ICsKPiArICAgICAgIHZtX2lvY3RsKHZtLCBLVk1fU0VUX01FTU9SWV9BVFRSSUJV
VEVTLCAmYXR0cik7Cj4gK30KPiArCj4gKwo+ICtzdGF0aWMgaW5saW5lIHZvaWQgdm1fbWVtX3Nl
dF9wcml2YXRlKHN0cnVjdCBrdm1fdm0gKnZtLCB1aW50NjRfdCBncGEsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50NjRfdCBzaXplKQo+ICt7Cj4gKyAgICAgICB2
bV9zZXRfbWVtb3J5X2F0dHJpYnV0ZXModm0sIGdwYSwgc2l6ZSwgS1ZNX01FTU9SWV9BVFRSSUJV
VEVfUFJJVkFURSk7Cj4gK30KPiArCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCB2bV9tZW1fc2V0X3No
YXJlZChzdHJ1Y3Qga3ZtX3ZtICp2bSwgdWludDY0X3QgZ3BhLAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1aW50NjRfdCBzaXplKQo+ICt7Cj4gKyAgICAgICB2bV9zZXRf
bWVtb3J5X2F0dHJpYnV0ZXModm0sIGdwYSwgc2l6ZSwgMCk7Cj4gK30KPiArCj4gK3ZvaWQgdm1f
Z3Vlc3RfbWVtX2ZhbGxvY2F0ZShzdHJ1Y3Qga3ZtX3ZtICp2bSwgdWludDY0X3QgZ3BhLCB1aW50
NjRfdCBzaXplLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIHB1bmNoX2hvbGUp
Owo+ICsKPiArc3RhdGljIGlubGluZSB2b2lkIHZtX2d1ZXN0X21lbV9wdW5jaF9ob2xlKHN0cnVj
dCBrdm1fdm0gKnZtLCB1aW50NjRfdCBncGEsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVpbnQ2NF90IHNpemUpCj4gK3sKPiArICAgICAgIHZtX2d1ZXN0X21l
bV9mYWxsb2NhdGUodm0sIGdwYSwgc2l6ZSwgdHJ1ZSk7Cj4gK30KPiArCj4gK3N0YXRpYyBpbmxp
bmUgdm9pZCB2bV9ndWVzdF9tZW1fYWxsb2NhdGUoc3RydWN0IGt2bV92bSAqdm0sIHVpbnQ2NF90
IGdwYSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQ2NF90
IHNpemUpCj4gK3sKPiArICAgICAgIHZtX2d1ZXN0X21lbV9mYWxsb2NhdGUodm0sIGdwYSwgc2l6
ZSwgZmFsc2UpOwo+ICt9Cj4gKwo+ICB2b2lkIHZtX2VuYWJsZV9kaXJ0eV9yaW5nKHN0cnVjdCBr
dm1fdm0gKnZtLCB1aW50MzJfdCByaW5nX3NpemUpOwo+ICBjb25zdCBjaGFyICp2bV9ndWVzdF9t
b2RlX3N0cmluZyh1aW50MzJfdCBpKTsKPgo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9rdm0vbGliL2t2bV91dGlsLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0v
bGliL2t2bV91dGlsLmMKPiBpbmRleCA0NTA1MGY1NDcwMWEuLmExNDBhZWU4ZDBmNSAxMDA2NDQK
PiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL2t2bV91dGlsLmMKPiArKysg
Yi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL2t2bV91dGlsLmMKPiBAQCAtMTE3Niw2
ICsxMTc2LDM0IEBAIHZvaWQgdm1fbWVtX3JlZ2lvbl9kZWxldGUoc3RydWN0IGt2bV92bSAqdm0s
IHVpbnQzMl90IHNsb3QpCj4gICAgICAgICBfX3ZtX21lbV9yZWdpb25fZGVsZXRlKHZtLCBtZW1z
bG90MnJlZ2lvbih2bSwgc2xvdCksIHRydWUpOwo+ICB9Cj4KPiArdm9pZCB2bV9ndWVzdF9tZW1f
ZmFsbG9jYXRlKHN0cnVjdCBrdm1fdm0gKnZtLCB1aW50NjRfdCBiYXNlLCB1aW50NjRfdCBzaXpl
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIHB1bmNoX2hvbGUpCj4gK3sKPiAr
ICAgICAgIGNvbnN0IGludCBtb2RlID0gRkFMTE9DX0ZMX0tFRVBfU0laRSB8IChwdW5jaF9ob2xl
ID8gRkFMTE9DX0ZMX1BVTkNIX0hPTEUgOiAwKTsKPiArICAgICAgIHN0cnVjdCB1c2Vyc3BhY2Vf
bWVtX3JlZ2lvbiAqcmVnaW9uOwo+ICsgICAgICAgdWludDY0X3QgZW5kID0gYmFzZSArIHNpemU7
Cj4gKyAgICAgICB1aW50NjRfdCBncGEsIGxlbjsKPiArICAgICAgIG9mZl90IGZkX29mZnNldDsK
PiArICAgICAgIGludCByZXQ7Cj4gKwo+ICsgICAgICAgZm9yIChncGEgPSBiYXNlOyBncGEgPCBl
bmQ7IGdwYSArPSBsZW4pIHsKPiArICAgICAgICAgICAgICAgdWludDY0X3Qgb2Zmc2V0Owo+ICsK
PiArICAgICAgICAgICAgICAgcmVnaW9uID0gdXNlcnNwYWNlX21lbV9yZWdpb25fZmluZCh2bSwg
Z3BhLCBncGEpOwo+ICsgICAgICAgICAgICAgICBURVNUX0FTU0VSVChyZWdpb24gJiYgcmVnaW9u
LT5yZWdpb24uZmxhZ3MgJiBLVk1fTUVNX1BSSVZBVEUsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICJQcml2YXRlIG1lbW9yeSByZWdpb24gbm90IGZvdW5kIGZvciBHUEEgMHglbHgiLCBn
cGEpOwo+ICsKPiArICAgICAgICAgICAgICAgb2Zmc2V0ID0gKGdwYSAtIHJlZ2lvbi0+cmVnaW9u
Lmd1ZXN0X3BoeXNfYWRkcik7CgpuaXQ6IHdoeSB0aGUgcGFyZW50aGVzZXM/Cgo+ICsgICAgICAg
ICAgICAgICBmZF9vZmZzZXQgPSByZWdpb24tPnJlZ2lvbi5ndWVzdF9tZW1mZF9vZmZzZXQgKyBv
ZmZzZXQ7Cj4gKyAgICAgICAgICAgICAgIGxlbiA9IG1pbl90KHVpbnQ2NF90LCBlbmQgLSBncGEs
IHJlZ2lvbi0+cmVnaW9uLm1lbW9yeV9zaXplIC0gb2Zmc2V0KTsKPiArCj4gKyAgICAgICAgICAg
ICAgIHJldCA9IGZhbGxvY2F0ZShyZWdpb24tPnJlZ2lvbi5ndWVzdF9tZW1mZCwgbW9kZSwgZmRf
b2Zmc2V0LCBsZW4pOwo+ICsgICAgICAgICAgICAgICBURVNUX0FTU0VSVCghcmV0LCAiZmFsbG9j
YXRlKCkgZmFpbGVkIHRvICVzIGF0ICVseCAobGVuID0gJWx1KSwgZmQgPSAlZCwgbW9kZSA9ICV4
LCBvZmZzZXQgPSAlbHhcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHB1bmNoX2hv
bGUgPyAicHVuY2ggaG9sZSIgOiAiYWxsb2NhdGUiLCBncGEsIGxlbiwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmVnaW9uLT5yZWdpb24uZ3Vlc3RfbWVtZmQsIG1vZGUsIGZkX29mZnNl
dCk7Cj4gKyAgICAgICB9Cj4gK30KPiArCgpOaXRzIGFzaWRlOgoKUmV2aWV3ZWQtYnk6IEZ1YWQg
VGFiYmEgPHRhYmJhQGdvb2dsZS5jb20+ClRlc3RlZC1ieTogRnVhZCBUYWJiYSA8dGFiYmFAZ29v
Z2xlLmNvbT4KCkNoZWVycywKL2Z1YWQKCgo+ICAvKiBSZXR1cm5zIHRoZSBzaXplIG9mIGEgdkNQ
VSdzIGt2bV9ydW4gc3RydWN0dXJlLiAqLwo+ICBzdGF0aWMgaW50IHZjcHVfbW1hcF9zeih2b2lk
KQo+ICB7Cj4gLS0KPiAyLjQyLjAuODIwLmc4M2E3MjFhMTM3LWdvb2cKPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
