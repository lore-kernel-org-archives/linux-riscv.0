Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23D3C4167D
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 14:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bHBt4gkQQqlHHAcR10uyoHzAQZy29ZiGI1mdJPKUepk=; b=txdvMaA9BF/hrF
	MRVhTzTxDa/XOqzfzP8CuyPZv0XHWd30BCsVINB+kWzDhLBpS7/m/iNbLs+LheUpLqpTP7tzUgj8r
	0xJLFsGMVNNe7Jg1WxpR+b41BPe/z0C80Ba8ClX+ufxxrbYM54POmE71agaOHTn7CE/5NSGBU1sqG
	SgtJEAwlj0Bas31lR6xBHq5k2jA4qPO54NGIIupHUMhD4hWClnrS9fzu7gTOmXV6qMsjS4mKdEDRd
	pVbIh3OOS1Fw3BO89cDkA9Dt5NRN6uI4CXaTEqCuXI2Iysp/Ho7JDS37GW6Lp2dpaM/CXVSvF1NST
	BdE02exMK4N/pdHmY3bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0NEy-001k7j-0J;
	Tue, 07 Nov 2023 14:39:40 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0NEt-001k5a-20
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 14:39:37 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-670e7ae4a2eso56071136d6.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 06:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699367972; x=1699972772; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yWUxtco4+SHtMfDkrQFL/rv2xiDn8sNB7VvrAl+j00=;
        b=Rrw/njA5ZJzj5IIU3XFXg1kBUpvRvuAtqBSrtejf3Qw3AOAVPRjLri9eRi7U3c+J6T
         aUzyIzOa/wWjGmxRxi2cDuAsB+fandFKT8fbybVqxag68vOlKVh4Jep4w4+24DGLJxlY
         mWdGhti9vRUh7dFtyJFRU82YbR33S3iiX3//m3hAOn6iGogNiig954VKqPjs1ywbOsk9
         5ykjxA2BCxJfWzBe/GgcXzMsFAXMDyNfTDp42r14zA7k6UyC0TYoH5Ao6EzzVEHdPydf
         wxmJW//0XKMJgkuO9v2E6xxRG+QWiKpTwlyBgdoSpATWSg7mIgztJKVdgB5HCZorSwIu
         pK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699367972; x=1699972772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9yWUxtco4+SHtMfDkrQFL/rv2xiDn8sNB7VvrAl+j00=;
        b=PWIRL/dup5MB2D6gegYYhR8gMV4hj14uNhcNcXiqUpmNTwveDfukVnNnO+Q8pnfRES
         JygDxmlhCLAekqbUunVvFRGnEvB50VfOg6fJPbMOxy2a2jkKEKF83hX/mjucpqixSwtm
         JzUijWUx/nalQsKRGGGuOl9+5z2jpUHoRgCVExhwHZDJrktFkBDnsO1jOuP4GVlz91oI
         1gZB8YAyf87BTLTl74HjZCDXbe5qfSFWdqbN0EX+uDDpZj7Nh2poUVFJiNlvnUNGph0k
         zoIPp9wqVCToCz0A8On32xVfonmc0PDcjDgHClPeH0HKbNm68S4F94rt2FR9JyYr5EEY
         C/hg==
X-Gm-Message-State: AOJu0YxN9gZnh9CD6rYrkmQw1sk1ign6I3theWIYt6UcAOqOl86NmS0R
	Kfc1sPfwNxtN0TdgFFAs015GOaZbZ0ycomZhaZpUAA==
X-Google-Smtp-Source: AGHT+IENouhYwfq0zksB9smEGLB+VMdhNNrCcscvQWBkeUX0Zkluj03/Xo1edckn4e3jUv+DeKenqbsHwG9y+w7RhbQ=
X-Received: by 2002:a05:6214:5297:b0:66f:abb4:49ff with SMTP id
 kj23-20020a056214529700b0066fabb449ffmr3397127qvb.7.1699367972171; Tue, 07
 Nov 2023 06:39:32 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-34-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-34-pbonzini@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 7 Nov 2023 14:38:55 +0000
Message-ID: <CA+EHjTw4C-3E+V0WsC68DtKRjqCt+d7M=q3STM48fKHiy4GvSw@mail.gmail.com>
Subject: Re: [PATCH 33/34] KVM: selftests: Test KVM exit behavior for private memory/access
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
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
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_063935_686775_DCEA7F26 
X-CRM114-Status: GOOD (  23.72  )
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

T24gU3VuLCBOb3YgNSwgMjAyMyBhdCA0OjM14oCvUE0gUGFvbG8gQm9uemluaSA8cGJvbnppbmlA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBBY2tlcmxleSBUbmcgPGFja2VybGV5dG5nQGdv
b2dsZS5jb20+Cj4KPiAiVGVzdGluZyBwcml2YXRlIGFjY2VzcyB3aGVuIG1lbXNsb3QgZ2V0cyBk
ZWxldGVkIiB0ZXN0cyB0aGUgYmVoYXZpb3IKPiBvZiBLVk0gd2hlbiBhIHByaXZhdGUgbWVtc2xv
dCBnZXRzIGRlbGV0ZWQgd2hpbGUgdGhlIFZNIGlzIHVzaW5nIHRoZQo+IHByaXZhdGUgbWVtc2xv
dC4gV2hlbiBLVk0gbG9va3MgdXAgdGhlIGRlbGV0ZWQgKHNsb3QgPSBOVUxMKSBtZW1zbG90LAo+
IEtWTSBzaG91bGQgZXhpdCB0byB1c2Vyc3BhY2Ugd2l0aCBLVk1fRVhJVF9NRU1PUllfRkFVTFQu
Cj4KPiBJbiB0aGUgc2Vjb25kIHRlc3QsIHVwb24gYSBwcml2YXRlIGFjY2VzcyB0byBub24tcHJp
dmF0ZSBtZW1zbG90LCBLVk0KPiBzaG91bGQgYWxzbyBleGl0IHRvIHVzZXJzcGFjZSB3aXRoIEtW
TV9FWElUX01FTU9SWV9GQVVMVC4KCm5pdDogVGhlIGNvbW1pdCBtZXNzYWdlIGlzIHJlZmVycmlu
ZyB0byBwcml2YXRlIG1lbXNsb3RzLCB3aGljaCBtaWdodApuZWVkIHJld29yZGluZyB3aXRoIHRo
ZSBsYXRlc3QgY2hhbmdlcyBpbiB2MTQuCgo+IEludGVudGlvbmFsbHkgZG9uJ3QgdGFrZSBhIHJl
cXVpcmVtZW50IG9uIEtWTV9DQVBfR1VFU1RfTUVNRkQsCj4gS1ZNX0NBUF9NRU1PUllfRkFVTFRf
SU5GTywgS1ZNX01FTU9SWV9BVFRSSUJVVEVfUFJJVkFURSwgZXRjLiwgYXMgaXQncyBhCj4gS1ZN
IGJ1ZyB0byBhZHZlcnRpc2UgS1ZNX1g4Nl9TV19QUk9URUNURURfVk0gd2l0aG91dCBpdHMgcHJl
cmVxdWlzaXRlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEFja2VybGV5IFRuZyA8YWNrZXJsZXl0bmdA
Z29vZ2xlLmNvbT4KPiBbc2VhbjogY2FsbCBvdXQgdGhlIHNpbWlsYXJpdGllcyB3aXRoIHNldF9t
ZW1vcnlfcmVnaW9uX3Rlc3RdCj4gU2lnbmVkLW9mZi1ieTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8
c2VhbmpjQGdvb2dsZS5jb20+Cj4gTWVzc2FnZS1JZDogPDIwMjMxMDI3MTgyMjE3LjM2MTUyMTEt
MzYtc2VhbmpjQGdvb2dsZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUGFvbG8gQm9uemluaSA8cGJv
bnppbmlAcmVkaGF0LmNvbT4KPiAtLS0KPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL01h
a2VmaWxlICAgICAgICAgIHwgICAxICsKPiAgLi4uL2t2bS94ODZfNjQvcHJpdmF0ZV9tZW1fa3Zt
X2V4aXRzX3Rlc3QuYyAgIHwgMTIwICsrKysrKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDEyMSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9rdm0veDg2XzY0L3ByaXZhdGVfbWVtX2t2bV9leGl0c190ZXN0LmMKPgo+IGRp
ZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vTWFrZWZpbGUgYi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vTWFrZWZpbGUKPiBpbmRleCBmZDNiMzBhNGNhN2IuLjY5Y2U4
ZTA2YjNhMyAxMDA2NDQKPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vTWFrZWZp
bGUKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vTWFrZWZpbGUKPiBAQCAtOTIs
NiArOTIsNyBAQCBURVNUX0dFTl9QUk9HU194ODZfNjQgKz0geDg2XzY0L25lc3RlZF9leGNlcHRp
b25zX3Rlc3QKPiAgVEVTVF9HRU5fUFJPR1NfeDg2XzY0ICs9IHg4Nl82NC9wbGF0Zm9ybV9pbmZv
X3Rlc3QKPiAgVEVTVF9HRU5fUFJPR1NfeDg2XzY0ICs9IHg4Nl82NC9wbXVfZXZlbnRfZmlsdGVy
X3Rlc3QKPiAgVEVTVF9HRU5fUFJPR1NfeDg2XzY0ICs9IHg4Nl82NC9wcml2YXRlX21lbV9jb252
ZXJzaW9uc190ZXN0Cj4gK1RFU1RfR0VOX1BST0dTX3g4Nl82NCArPSB4ODZfNjQvcHJpdmF0ZV9t
ZW1fa3ZtX2V4aXRzX3Rlc3QKPiAgVEVTVF9HRU5fUFJPR1NfeDg2XzY0ICs9IHg4Nl82NC9zZXRf
Ym9vdF9jcHVfaWQKPiAgVEVTVF9HRU5fUFJPR1NfeDg2XzY0ICs9IHg4Nl82NC9zZXRfc3JlZ3Nf
dGVzdAo+ICBURVNUX0dFTl9QUk9HU194ODZfNjQgKz0geDg2XzY0L3NtYWxsZXJfbWF4cGh5YWRk
cl9lbXVsYXRpb25fdGVzdAo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9r
dm0veDg2XzY0L3ByaXZhdGVfbWVtX2t2bV9leGl0c190ZXN0LmMgYi90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9rdm0veDg2XzY0L3ByaXZhdGVfbWVtX2t2bV9leGl0c190ZXN0LmMKPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMmYwMmY2MTI4NDgyCj4gLS0tIC9k
ZXYvbnVsbAo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQvcHJpdmF0
ZV9tZW1fa3ZtX2V4aXRzX3Rlc3QuYwo+IEBAIC0wLDAgKzEsMTIwIEBACj4gKy8vIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKPiArLyoKPiArICogQ29weXJpZ2h0IChDKSAy
MDIyLCBHb29nbGUgTExDLgoKbml0OiAyMDIzCgpOaXRzIGFzaWRlOgpSZXZpZXdlZC1ieTogRnVh
ZCBUYWJiYSA8dGFiYmFAZ29vZ2xlLmNvbT4KVGVzdGVkLWJ5OiBGdWFkIFRhYmJhIDx0YWJiYUBn
b29nbGUuY29tPgoKQ2hlZXJzLAovZnVhZAoKCgoKPiArICovCj4gKyNpbmNsdWRlIDxsaW51eC9r
dm0uaD4KPiArI2luY2x1ZGUgPHB0aHJlYWQuaD4KPiArI2luY2x1ZGUgPHN0ZGludC5oPgo+ICsK
PiArI2luY2x1ZGUgImt2bV91dGlsLmgiCj4gKyNpbmNsdWRlICJwcm9jZXNzb3IuaCIKPiArI2lu
Y2x1ZGUgInRlc3RfdXRpbC5oIgo+ICsKPiArLyogQXJiaXRyYXJpbHkgc2VsZWN0ZWQgdG8gYXZv
aWQgb3ZlcmxhcHMgd2l0aCBhbnl0aGluZyBlbHNlICovCj4gKyNkZWZpbmUgRVhJVFNfVEVTVF9H
VkEgMHhjMDAwMDAwMAo+ICsjZGVmaW5lIEVYSVRTX1RFU1RfR1BBIEVYSVRTX1RFU1RfR1ZBCj4g
KyNkZWZpbmUgRVhJVFNfVEVTVF9OUEFHRVMgMQo+ICsjZGVmaW5lIEVYSVRTX1RFU1RfU0laRSAo
RVhJVFNfVEVTVF9OUEFHRVMgKiBQQUdFX1NJWkUpCj4gKyNkZWZpbmUgRVhJVFNfVEVTVF9TTE9U
IDEwCj4gKwo+ICtzdGF0aWMgdWludDY0X3QgZ3Vlc3RfcmVwZWF0ZWRseV9yZWFkKHZvaWQpCj4g
K3sKPiArICAgICAgIHZvbGF0aWxlIHVpbnQ2NF90IHZhbHVlOwo+ICsKPiArICAgICAgIHdoaWxl
ICh0cnVlKQo+ICsgICAgICAgICAgICAgICB2YWx1ZSA9ICooKHVpbnQ2NF90ICopIEVYSVRTX1RF
U1RfR1ZBKTsKPiArCj4gKyAgICAgICByZXR1cm4gdmFsdWU7Cj4gK30KPiArCj4gK3N0YXRpYyB1
aW50MzJfdCBydW5fdmNwdV9nZXRfZXhpdF9yZWFzb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+
ICt7Cj4gKyAgICAgICBpbnQgcjsKPiArCj4gKyAgICAgICByID0gX3ZjcHVfcnVuKHZjcHUpOwo+
ICsgICAgICAgaWYgKHIpIHsKPiArICAgICAgICAgICAgICAgVEVTVF9BU1NFUlQoZXJybm8gPT0g
RUZBVUxULCBLVk1fSU9DVExfRVJST1IoS1ZNX1JVTiwgcikpOwo+ICsgICAgICAgICAgICAgICBU
RVNUX0FTU0VSVF9FUSh2Y3B1LT5ydW4tPmV4aXRfcmVhc29uLCBLVk1fRVhJVF9NRU1PUllfRkFV
TFQpOwo+ICsgICAgICAgfQo+ICsgICAgICAgcmV0dXJuIHZjcHUtPnJ1bi0+ZXhpdF9yZWFzb247
Cj4gK30KPiArCj4gK2NvbnN0IHN0cnVjdCB2bV9zaGFwZSBwcm90ZWN0ZWRfdm1fc2hhcGUgPSB7
Cj4gKyAgICAgICAubW9kZSA9IFZNX01PREVfREVGQVVMVCwKPiArICAgICAgIC50eXBlID0gS1ZN
X1g4Nl9TV19QUk9URUNURURfVk0sCj4gK307Cj4gKwo+ICtzdGF0aWMgdm9pZCB0ZXN0X3ByaXZh
dGVfYWNjZXNzX21lbXNsb3RfZGVsZXRlZCh2b2lkKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3Qga3Zt
X3ZtICp2bTsKPiArICAgICAgIHN0cnVjdCBrdm1fdmNwdSAqdmNwdTsKPiArICAgICAgIHB0aHJl
YWRfdCB2bV90aHJlYWQ7Cj4gKyAgICAgICB2b2lkICp0aHJlYWRfcmV0dXJuOwo+ICsgICAgICAg
dWludDMyX3QgZXhpdF9yZWFzb247Cj4gKwo+ICsgICAgICAgdm0gPSB2bV9jcmVhdGVfc2hhcGVf
d2l0aF9vbmVfdmNwdShwcm90ZWN0ZWRfdm1fc2hhcGUsICZ2Y3B1LAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBndWVzdF9yZXBlYXRlZGx5X3JlYWQpOwo+ICsK
PiArICAgICAgIHZtX3VzZXJzcGFjZV9tZW1fcmVnaW9uX2FkZCh2bSwgVk1fTUVNX1NSQ19BTk9O
WU1PVVMsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRVhJVFNfVEVTVF9H
UEEsIEVYSVRTX1RFU1RfU0xPVCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBFWElUU19URVNUX05QQUdFUywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBLVk1fTUVNX0dVRVNUX01FTUZEKTsKPiArCj4gKyAgICAgICB2aXJ0X21hcCh2bSwgRVhJVFNf
VEVTVF9HVkEsIEVYSVRTX1RFU1RfR1BBLCBFWElUU19URVNUX05QQUdFUyk7Cj4gKwo+ICsgICAg
ICAgLyogUmVxdWVzdCB0byBhY2Nlc3MgcGFnZSBwcml2YXRlbHkgKi8KPiArICAgICAgIHZtX21l
bV9zZXRfcHJpdmF0ZSh2bSwgRVhJVFNfVEVTVF9HUEEsIEVYSVRTX1RFU1RfU0laRSk7Cj4gKwo+
ICsgICAgICAgcHRocmVhZF9jcmVhdGUoJnZtX3RocmVhZCwgTlVMTCwKPiArICAgICAgICAgICAg
ICAgICAgICAgICh2b2lkICooKikodm9pZCAqKSlydW5fdmNwdV9nZXRfZXhpdF9yZWFzb24sCj4g
KyAgICAgICAgICAgICAgICAgICAgICAodm9pZCAqKXZjcHUpOwo+ICsKPiArICAgICAgIHZtX21l
bV9yZWdpb25fZGVsZXRlKHZtLCBFWElUU19URVNUX1NMT1QpOwo+ICsKPiArICAgICAgIHB0aHJl
YWRfam9pbih2bV90aHJlYWQsICZ0aHJlYWRfcmV0dXJuKTsKPiArICAgICAgIGV4aXRfcmVhc29u
ID0gKHVpbnQzMl90KSh1aW50NjRfdCl0aHJlYWRfcmV0dXJuOwo+ICsKPiArICAgICAgIFRFU1Rf
QVNTRVJUX0VRKGV4aXRfcmVhc29uLCBLVk1fRVhJVF9NRU1PUllfRkFVTFQpOwo+ICsgICAgICAg
VEVTVF9BU1NFUlRfRVEodmNwdS0+cnVuLT5tZW1vcnlfZmF1bHQuZmxhZ3MsIEtWTV9NRU1PUllf
RVhJVF9GTEFHX1BSSVZBVEUpOwo+ICsgICAgICAgVEVTVF9BU1NFUlRfRVEodmNwdS0+cnVuLT5t
ZW1vcnlfZmF1bHQuZ3BhLCBFWElUU19URVNUX0dQQSk7Cj4gKyAgICAgICBURVNUX0FTU0VSVF9F
USh2Y3B1LT5ydW4tPm1lbW9yeV9mYXVsdC5zaXplLCBFWElUU19URVNUX1NJWkUpOwo+ICsKPiAr
ICAgICAgIGt2bV92bV9mcmVlKHZtKTsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgdGVzdF9wcml2
YXRlX2FjY2Vzc19tZW1zbG90X25vdF9wcml2YXRlKHZvaWQpCj4gK3sKPiArICAgICAgIHN0cnVj
dCBrdm1fdm0gKnZtOwo+ICsgICAgICAgc3RydWN0IGt2bV92Y3B1ICp2Y3B1Owo+ICsgICAgICAg
dWludDMyX3QgZXhpdF9yZWFzb247Cj4gKwo+ICsgICAgICAgdm0gPSB2bV9jcmVhdGVfc2hhcGVf
d2l0aF9vbmVfdmNwdShwcm90ZWN0ZWRfdm1fc2hhcGUsICZ2Y3B1LAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBndWVzdF9yZXBlYXRlZGx5X3JlYWQpOwo+ICsK
PiArICAgICAgIC8qIEFkZCBhIG5vbi1wcml2YXRlIG1lbXNsb3QgKGZsYWdzID0gMCkgKi8KPiAr
ICAgICAgIHZtX3VzZXJzcGFjZV9tZW1fcmVnaW9uX2FkZCh2bSwgVk1fTUVNX1NSQ19BTk9OWU1P
VVMsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRVhJVFNfVEVTVF9HUEEs
IEVYSVRTX1RFU1RfU0xPVCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBF
WElUU19URVNUX05QQUdFUywgMCk7Cj4gKwo+ICsgICAgICAgdmlydF9tYXAodm0sIEVYSVRTX1RF
U1RfR1ZBLCBFWElUU19URVNUX0dQQSwgRVhJVFNfVEVTVF9OUEFHRVMpOwo+ICsKPiArICAgICAg
IC8qIFJlcXVlc3QgdG8gYWNjZXNzIHBhZ2UgcHJpdmF0ZWx5ICovCj4gKyAgICAgICB2bV9tZW1f
c2V0X3ByaXZhdGUodm0sIEVYSVRTX1RFU1RfR1BBLCBFWElUU19URVNUX1NJWkUpOwo+ICsKPiAr
ICAgICAgIGV4aXRfcmVhc29uID0gcnVuX3ZjcHVfZ2V0X2V4aXRfcmVhc29uKHZjcHUpOwo+ICsK
PiArICAgICAgIFRFU1RfQVNTRVJUX0VRKGV4aXRfcmVhc29uLCBLVk1fRVhJVF9NRU1PUllfRkFV
TFQpOwo+ICsgICAgICAgVEVTVF9BU1NFUlRfRVEodmNwdS0+cnVuLT5tZW1vcnlfZmF1bHQuZmxh
Z3MsIEtWTV9NRU1PUllfRVhJVF9GTEFHX1BSSVZBVEUpOwo+ICsgICAgICAgVEVTVF9BU1NFUlRf
RVEodmNwdS0+cnVuLT5tZW1vcnlfZmF1bHQuZ3BhLCBFWElUU19URVNUX0dQQSk7Cj4gKyAgICAg
ICBURVNUX0FTU0VSVF9FUSh2Y3B1LT5ydW4tPm1lbW9yeV9mYXVsdC5zaXplLCBFWElUU19URVNU
X1NJWkUpOwo+ICsKPiArICAgICAgIGt2bV92bV9mcmVlKHZtKTsKPiArfQo+ICsKPiAraW50IG1h
aW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKPiArewo+ICsgICAgICAgVEVTVF9SRVFVSVJFKGt2
bV9jaGVja19jYXAoS1ZNX0NBUF9WTV9UWVBFUykgJiBCSVQoS1ZNX1g4Nl9TV19QUk9URUNURURf
Vk0pKTsKPiArCj4gKyAgICAgICB0ZXN0X3ByaXZhdGVfYWNjZXNzX21lbXNsb3RfZGVsZXRlZCgp
Owo+ICsgICAgICAgdGVzdF9wcml2YXRlX2FjY2Vzc19tZW1zbG90X25vdF9wcml2YXRlKCk7Cj4g
K30KPiAtLQo+IDIuMzkuMQo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
