Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80A1C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SgGgrwEfXk2S6p7XseUjGeZmLck8fOZqQIePIEH/VGU=; b=hzD6iboJBgu+RO
	LNnY/2KQ8ELRQ6q98zsg2yFE7sl0/X0gqhUSGhXZYnwrXeOhx1n8an6lQ9TpOaEilV7xuUWli/hA9
	TFEwWmlGdeZIG7VRiBFYYa9Fa1ASlxL2Bkr87aMoi8qU6F2qfgmHkbSc8oLLdJgrXz3H1utu1DNza
	ThMpwbDzte7Y4OVLKvNMHf0XpI4o4G8vzxQxtOwetMjMXfW8Pu5WN+yGuCP9ylLU8uGCNBFZyoP3H
	XAjoKlvuytkl3YPyU27xqLrM6TeLhJ13XR+abGhTnP9sFAoSRMpWllwjLyPELpo9PW+tn6a4vZWuG
	9CmyxXvSo09Ss5Svssuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzy2M-00GSML-0a;
	Mon, 06 Nov 2023 11:44:58 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzy2J-00GSHJ-0k
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 11:44:56 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5a7af20c488so52160757b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 Nov 2023 03:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699271092; x=1699875892; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DX7ek6JbnQBP3kmz+KR8GNUYI0kM1PtX+UUHfn3vax8=;
        b=xq6/jlfohX8FisyYFjG1xSUQYoC9AkNwir+14aIVYyUS52bdAdjWP7uz3efQ9ByZ3S
         0xrEY3ZspyRN1RkqxiMfctl8i9tuvhwNjDpeGFiHT2etSUyegAf0LPySYt4YVdfdmXkx
         hGukxTtmqHFtnLIayehKX9VxN3RN8p/WyYSPV48tquMDC913BVWQ0WoocF+wZis/tJhz
         ZSVE5CBSSILL5MZ3twPWRfsaHthoM1wBJLOelUURzf+mSm1kh8zdgTgCj2rhAl3+JwAC
         QiEFTgdg7rjwMsRshwyYtbgybr4Mqaf7PDZzFwOhvLfPQ3aaL6ReJY96frhme00ap88M
         WJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699271092; x=1699875892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DX7ek6JbnQBP3kmz+KR8GNUYI0kM1PtX+UUHfn3vax8=;
        b=Oqe1sHJBz3cj4Cf5BKC9q1joU9ssjuUAree8wLPO5VqrsvuDg4pIy070qTFTVYswKz
         co+cNHWSzYn7Z+ZAEoRCxiWhuNI2s4owF2BhPDVNVAUtwUzHrYzyo6clOfksVMDptBUg
         raoL6fw22fMzOiavt8oXDI7hlHLJ+DiNMWZBsOcxVo6ocZjdWDI8BCBBnnjdUoorDmNS
         tCIFq7/PGkzADkMDIZAOvjoNXwuOCKPY1OtuvATTEKzT6+H/MoGmvxeNm65s2cnKMt8D
         XTLAnMaoKb79bLcNsTzfix1rw9oZhV1WNkvpakbs6YZ1zM1D5NIChTtkdd7AJ/0Soa0d
         Xdqg==
X-Gm-Message-State: AOJu0YwZNRqoxLPUtIyXDpuQjmCzZNnLf6sggXuXiXi0FQapeotrJBHH
	Ts5/4UWQJu1zMueakpeDXagUYjLZ7nFR8c1nCxHMcQ==
X-Google-Smtp-Source: AGHT+IERnN25ZpQWhSoveHYhjH1bHINt0TuAVLiTz7wZcF5ueihZgXoSAZV3dV6i7b/f23cd983VPNMQFTyQCDpDsN0=
X-Received: by 2002:a0d:ccc5:0:b0:5a7:e4fe:ea3 with SMTP id
 o188-20020a0dccc5000000b005a7e4fe0ea3mr10768851ywd.22.1699271092440; Mon, 06
 Nov 2023 03:44:52 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-27-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-27-pbonzini@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 6 Nov 2023 11:44:16 +0000
Message-ID: <CA+EHjTymGLsfHvdP4fPOFWTtaRwbtbCOBZ0XOC3gsX+nYm-cZQ@mail.gmail.com>
Subject: Re: [PATCH 26/34] KVM: selftests: Add helpers to do
 KVM_HC_MAP_GPA_RANGE hypercalls (x86)
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
X-CRM114-CacheID: sfid-20231106_034455_274534_745A26BB 
X-CRM114-Status: GOOD (  14.42  )
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

T24gU3VuLCBOb3YgNSwgMjAyMyBhdCA0OjM04oCvUE0gUGFvbG8gQm9uemluaSA8cGJvbnppbmlA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBWaXNoYWwgQW5uYXB1cnZlIDx2YW5uYXB1cnZl
QGdvb2dsZS5jb20+Cj4KPiBBZGQgaGVscGVycyBmb3IgeDg2IGd1ZXN0cyB0byBpbnZva2UgdGhl
IEtWTV9IQ19NQVBfR1BBX1JBTkdFIGh5cGVyY2FsbCwKPiB3aGljaCBLVk0gd2lsbCBmb3J3YXJk
IHRvIHVzZXJzcGFjZSBhbmQgdGh1cyBjYW4gYmUgdXNlZCBieSB0ZXN0cyB0bwo+IGNvb3JkaW5h
dGUgcHJpdmF0ZTw9PnNoYXJlZCBjb252ZXJzaW9ucyBiZXR3ZWVuIGhvc3QgdXNlcnNwYWNlIGNv
ZGUgYW5kCj4gZ3Vlc3QgY29kZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFZpc2hhbCBBbm5hcHVydmUg
PHZhbm5hcHVydmVAZ29vZ2xlLmNvbT4KPiBbc2VhbjogZHJvcCBzaGFyZWQvcHJpdmF0ZSBoZWxw
ZXJzIChsZXQgdGVzdHMgc3BlY2lmeSBmbGFncyldCj4gU2lnbmVkLW9mZi1ieTogU2VhbiBDaHJp
c3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Cj4gTWVzc2FnZS1JZDogPDIwMjMxMDI3MTgy
MjE3LjM2MTUyMTEtMjktc2VhbmpjQGdvb2dsZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUGFvbG8g
Qm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KPiAtLS0KClJldmlld2VkLWJ5OiBGdWFkIFRh
YmJhIDx0YWJiYUBnb29nbGUuY29tPgpUZXN0ZWQtYnk6IEZ1YWQgVGFiYmEgPHRhYmJhQGdvb2ds
ZS5jb20+CgpDaGVlcnMsCi9mdWFkCgo+ICAuLi4vc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3g4Nl82
NC9wcm9jZXNzb3IuaCAgICAgIHwgMTUgKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxNSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL2luY2x1ZGUveDg2XzY0L3Byb2Nlc3Nvci5oIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL2luY2x1ZGUveDg2XzY0L3Byb2Nlc3Nvci5oCj4gaW5kZXggMjViYzYxZGFjNWZiLi5h
ODQ4NjM1MDNmY2IgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2lu
Y2x1ZGUveDg2XzY0L3Byb2Nlc3Nvci5oCj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
a3ZtL2luY2x1ZGUveDg2XzY0L3Byb2Nlc3Nvci5oCj4gQEAgLTE1LDYgKzE1LDcgQEAKPiAgI2lu
Y2x1ZGUgPGFzbS9tc3ItaW5kZXguaD4KPiAgI2luY2x1ZGUgPGFzbS9wcmN0bC5oPgo+Cj4gKyNp
bmNsdWRlIDxsaW51eC9rdm1fcGFyYS5oPgo+ICAjaW5jbHVkZSA8bGludXgvc3RyaW5naWZ5Lmg+
Cj4KPiAgI2luY2x1ZGUgIi4uL2t2bV91dGlsLmgiCj4gQEAgLTExOTQsNiArMTE5NSwyMCBAQCB1
aW50NjRfdCBrdm1faHlwZXJjYWxsKHVpbnQ2NF90IG5yLCB1aW50NjRfdCBhMCwgdWludDY0X3Qg
YTEsIHVpbnQ2NF90IGEyLAo+ICB1aW50NjRfdCBfX3hlbl9oeXBlcmNhbGwodWludDY0X3QgbnIs
IHVpbnQ2NF90IGEwLCB2b2lkICphMSk7Cj4gIHZvaWQgeGVuX2h5cGVyY2FsbCh1aW50NjRfdCBu
ciwgdWludDY0X3QgYTAsIHZvaWQgKmExKTsKPgo+ICtzdGF0aWMgaW5saW5lIHVpbnQ2NF90IF9f
a3ZtX2h5cGVyY2FsbF9tYXBfZ3BhX3JhbmdlKHVpbnQ2NF90IGdwYSwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQ2NF90IHNpemUsIHVp
bnQ2NF90IGZsYWdzKQo+ICt7Cj4gKyAgICAgICByZXR1cm4ga3ZtX2h5cGVyY2FsbChLVk1fSENf
TUFQX0dQQV9SQU5HRSwgZ3BhLCBzaXplID4+IFBBR0VfU0hJRlQsIGZsYWdzLCAwKTsKPiArfQo+
ICsKPiArc3RhdGljIGlubGluZSB2b2lkIGt2bV9oeXBlcmNhbGxfbWFwX2dwYV9yYW5nZSh1aW50
NjRfdCBncGEsIHVpbnQ2NF90IHNpemUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1aW50NjRfdCBmbGFncykKPiArewo+ICsgICAgICAgdWludDY0X3Qg
cmV0ID0gX19rdm1faHlwZXJjYWxsX21hcF9ncGFfcmFuZ2UoZ3BhLCBzaXplLCBmbGFncyk7Cj4g
Kwo+ICsgICAgICAgR1VFU1RfQVNTRVJUKCFyZXQpOwo+ICt9Cj4gKwo+ICB2b2lkIF9fdm1feHNh
dmVfcmVxdWlyZV9wZXJtaXNzaW9uKHVpbnQ2NF90IHhmZWF0dXJlLCBjb25zdCBjaGFyICpuYW1l
KTsKPgo+ICAjZGVmaW5lIHZtX3hzYXZlX3JlcXVpcmVfcGVybWlzc2lvbih4ZmVhdHVyZSkgIFwK
PiAtLQo+IDIuMzkuMQo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
