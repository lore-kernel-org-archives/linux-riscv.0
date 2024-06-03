Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13719C25B78
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 22:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CORVsbvCm/wgZZICtuLPpcNJartHGWF9PsD4VVJBQuw=; b=ajsh/oTCDt29f9
	BewtMjIR1nKNYrK8iCN1qFXDSCHkKxFJV0VzYOpkE/yLeCeGZiWn4QUbpVk+7OZ5CHM0vX5jmD8oe
	mL137UuqMuR+DELGI3olYF/4gO2ne/c7QTMGJGGA81KWBXx7O0JjFJkuSg7+C3jx8qoSsVV7rsy7y
	NggK9M68YqD3D1l4dgZsNI5f4CurPdwXuCILffjzeA8FmHdkCeIl2I83GznrMShfe4eFchgx05UDH
	QESr/5Ntjos5kfK209xg6KYz9Xw4MyP+4+yINR12RSIzu4VfbrnY+n292EBoRXKsr/GPRyV94pe/w
	+BajEybiN5eqigjwG/yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEGRv-00000000XZT-0vUK;
	Mon, 03 Jun 2024 22:46:43 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEGRq-00000000XW6-3fDw
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jun 2024 22:46:40 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-43fe3289fc5so50541cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jun 2024 15:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717454796; x=1718059596; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwApvMmCxi6kRvhFpeZNrHVjs/fSYi202Vq8O0y7Pvc=;
        b=fGGi9PzL9s8Sl2CpbcEiJ3EhDOKeniMnRf+tvlz5+j6dBMVkm+zaJ/XE8FoElb1Pob
         Q2U2p4pbG+Qh1H8GqL5Spbf+5T4n95OoHzuZXuMEoQPgRSrq0RIrcr7mlgIUC7jXNyul
         q47zLJhvw6YGPb0Ks4cRK/h277Ewi2vu+SLLHao0luCelLsMOh3k0+fmBHQ7Vvbwypjr
         5hI+goY7Xlw1WlhbLntBuZryDT6075UCnZZM3sbTmetCOPrx3OA9rPvLQgCSD/Q9AjcW
         NzAErlr+3/7HRraCscR2coYw2H+2T8ucfTMmwfueoWHPZP5zJN/mU39CTLYY0TkUJieW
         JK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717454796; x=1718059596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zwApvMmCxi6kRvhFpeZNrHVjs/fSYi202Vq8O0y7Pvc=;
        b=eZGEi622wcuadC/N26wMngtE7xmPQ7jX3u9xdL4tJa0RALy4JL2MKsJ4ePZ58dcYOZ
         JPOdzJzLjTdYgWkFE+XZDKhkC40eZifiPEa5MSBHT3TgELwM3YI8y0q/Hkn/lNeJf9EC
         wpd6SwZdpz36cLrtNBawzpJSYSw+MmEQSSKR+D7UJ7ZjzuK9XP3rmiMTN6R8GbW+hMtX
         zepxf/7WMPdLKWdsVjCcTZFWCDnkritxvgfWeNOKM5YQZYk3RaV8Tx2/O5UCyoMAsNO7
         VPZO3aj0qAi6T5NQF4nOHJLvn/Tf++rWMXT0qRIeFck8YNmOvUlaknp8DsK0p20ZDP3S
         bc1g==
X-Forwarded-Encrypted: i=1; AJvYcCXOA6DoJQJ/wKZa8j1GB6Twh5nd0kL+NPncYcwhB8ERk6FRmDqo5GgliQZL0TBJzE6SEG8gY/NPjAi8nEWyHa58/vSymlAJIk7f3pdxIKMA
X-Gm-Message-State: AOJu0Yytz2ss7wCJZKKJTIARIftnz+qkIAeQRB8nmuZ2sqZ7K2J/icgi
	5irUixM707DsbLjKANg1ErxRlcoTjDgmuX25CMYlXZWM8u6CjhaA52wztuaatfEvanLtngq5C3v
	Lq7eXrm4ccUJqx74QmVrcLgxd7loKlEJplabI
X-Google-Smtp-Source: AGHT+IFNqO3Eeca3fb/gjbGejzk9epZFQKuRMTX94UERp2ub7SAJHzg0ElHPjQ2U8grOlDfvsiNhgYwFk5rOK4wQGMU=
X-Received: by 2002:a05:622a:59ce:b0:43f:ff89:dfb9 with SMTP id
 d75a77b69052e-4401bd281f4mr1732131cf.6.1717454795966; Mon, 03 Jun 2024
 15:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <ZlelW93_T6P-ZuSZ@google.com> <CAOUHufZdEpY6ra73SMHA33DegKxKaUM=Os7A7aDBFND6NkbUmQ@mail.gmail.com>
 <Zley-u_dOlZ-S-a6@google.com> <CADrL8HXHWg_MkApYQTngzmN21NEGNWC6KzJDw_Lm63JHJkR=5A@mail.gmail.com>
 <CAOUHufZq6DwpStzHtjG+TOiHaQ6FFbkTfHMCe8Yy0n_M9MKdqw@mail.gmail.com>
In-Reply-To: <CAOUHufZq6DwpStzHtjG+TOiHaQ6FFbkTfHMCe8Yy0n_M9MKdqw@mail.gmail.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 3 Jun 2024 15:45:59 -0700
Message-ID: <CADrL8HW44Hx_Ejx_6+FVKt1V17PdgT6rw+sNtKzumqc9UCVDfA@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
To: Yu Zhao <yuzhao@google.com>
Cc: Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ankit Agrawal <ankita@nvidia.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Bibo Mao <maobibo@loongson.cn>, Catalin Marinas <catalin.marinas@arm.com>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Morse <james.morse@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Raghavendra Rao Ananta <rananta@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_154638_947959_31D9C668 
X-CRM114-Status: GOOD (  49.46  )
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

T24gVGh1LCBNYXkgMzAsIDIwMjQgYXQgMTE6MDbigK9QTSBZdSBaaGFvIDx5dXpoYW9AZ29vZ2xl
LmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIE1heSAyOSwgMjAyNCBhdCA3OjA44oCvUE0gSmFtZXMg
SG91Z2h0b24gPGp0aG91Z2h0b25AZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgWXUsIFNl
YW4sCj4gPgo+ID4gUGVyaGFwcyBJICJzaW1wbGlmaWVkIiB0aGlzIGJpdCBvZiB0aGUgc2VyaWVz
IGEgbGl0dGxlIGJpdCB0b28gbXVjaC4KPiA+IEJlaW5nIGFibGUgdG8gb3Bwb3J0dW5pc3RpY2Fs
bHkgZG8gYWdpbmcgd2l0aCBLVk0gKGV2ZW4gd2l0aG91dAo+ID4gc2V0dGluZyB0aGUgS2NvbmZp
ZykgaXMgdmFsdWFibGUuCj4gPgo+ID4gSUlVQywgd2UgaGF2ZSB0aGUgZm9sbG93aW5nIHBvc3Np
YmlsaXRpZXM6Cj4gPiAtIHY0OiBhZ2luZyB3aXRoIEtWTSBpcyBkb25lIGlmIHRoZSBuZXcgS2Nv
bmZpZyBpcyBzZXQuCj4gPiAtIHYzOiBhZ2luZyB3aXRoIEtWTSBpcyBhbHdheXMgZG9uZS4KPgo+
IFRoaXMgaXMgbm90IHRydWUgLS0gaW4gdjMsIE1HTFJVIG9ubHkgc2NhbnMgc2Vjb25kYXJ5IE1N
VXMgaWYgaXQgY2FuCj4gYmUgZG9uZSBsb2NrbGVzc2x5IG9uIHg4Ni4gSXQgdXNlcyBhIGJpdG1h
cCB0byBpbXBseSB0aGlzIHJlcXVpcmVtZW50Lgo+Cj4gPiAtIHYyOiBhZ2luZyB3aXRoIEtWTSBp
cyBkb25lIHdoZW4gdGhlIGFyY2hpdGVjdHVyZSByZXBvcnRzIHRoYXQgaXQgY2FuCj4gPiBwcm9i
YWJseSBiZSBkb25lIGxvY2tsZXNzbHksIHNldCBhdCBLVk0gTU1VIGluaXQgdGltZS4KPgo+IE5v
dCByZWFsbHkgLS0gaXQncyBvbmx5IGRvbmUgaWYgaXQgY2FuIGJlIGRvbmUgbG9ja2xlc3NseSBv
biBib3RoIHg4NiBhbmQgYXJtNjQuCj4KPiA+IC0gQW5vdGhlciBwb3NzaWJpbGl0eT86IGFnaW5n
IHdpdGggS1ZNIGlzIG9ubHkgZG9uZSBleGFjdGx5IHdoZW4gaXQKPiA+IGNhbiBiZSBkb25lIGxv
Y2tsZXNzbHkgKGkuZS4sIG1tdV9ub3RpZmllcl90ZXN0L2NsZWFyX3lvdW5nKCkgY2FsbGVkCj4g
PiBzdWNoIHRoYXQgaXQgd2lsbCBub3QgZ3JhYiBhbnkgbG9ja3MpLgo+Cj4gVGhpcyBpcyBleGFj
dGx5IHRoZSBjYXNlIGZvciB2Mi4KClRoYW5rcyBmb3IgY2xhcmlmeWluZzsgc29ycnkgZm9yIGdl
dHRpbmcgdGhpcyB3cm9uZy4KCj4KPiA+IEkgbGlrZSB0aGUgdjQgYXBwcm9hY2ggYmVjYXVzZToK
PiA+IDEuIFdlIGNhbiBjaG9vc2Ugd2hldGhlciBvciBub3QgdG8gZG8gYWdpbmcgd2l0aCBLVk0g
bm8gbWF0dGVyIHdoYXQKPiA+IGFyY2hpdGVjdHVyZSB3ZSdyZSB1c2luZyAod2l0aG91dCByZXF1
aXJpbmcgdXNlcnNwYWNlIGJlIGF3YXJlIHRvCj4gPiBkaXNhYmxlIHRoZSBmZWF0dXJlIGF0IHJ1
bnRpbWUgd2l0aCBzeXNmcyB0byBhdm9pZCByZWdyZXNzaW5nCj4gPiBwZXJmb3JtYW5jZSBpZiB0
aGV5IGRvbid0IGNhcmUgYWJvdXQgcHJvYWN0aXZlIHJlY2xhaW0pLgo+ID4gMi4gSWYgd2UgY2hl
Y2sgdGhlIG5ldyBmZWF0dXJlIGJpdCAoMHg4KSBpbiBzeXNmcywgd2UgY2FuIGtub3cgZm9yCj4g
PiBzdXJlIGlmIGFnaW5nIGlzIG1lYW50IHRvIGJlIHdvcmtpbmcgb3Igbm90LiBUaGUgc2VsZnRl
c3QgY2hhbmdlcyBJCj4gPiBtYWRlIHdvbid0IHdvcmsgcHJvcGVybHkgdW5sZXNzIHRoZXJlIGlz
IGEgd2F5IHRvIGJlIHN1cmUgdGhhdCBhZ2luZwo+ID4gaXMgd29ya2luZyB3aXRoIEtWTS4KPgo+
IEknbSBub3QgY29udmluY2VkLCBidXQgaXQgZG9lc24ndCBtZWFuIHlvdXIgcG9pbnQgb2Ygdmll
dyBpcyBpbnZhbGlkLgo+IElmIHlvdSBmdWxseSB1bmRlcnN0YW5kIHRoZSBpbXBsaWNhdGlvbnMg
b2YgeW91ciBkZXNpZ24gY2hvaWNlIGFuZAo+IGRvY3VtZW50IHRoZW0sIEkgd2lsbCBub3Qgb2Jq
ZWN0Lgo+Cj4gQWxsIG9wdGltaXphdGlvbnMgaW4gdjIgd2VyZSBtZWFzdXJlZCBzdGVwIGJ5IHN0
ZXAuIEV2ZW4gdGhhdCBiaXRtYXAsCj4gd2hpY2ggbWlnaHQgYmUgY29uc2lkZXJlZCBvdmVyZW5n
aW5lZXJlZCwgYnJvdWdodCBhIHJlYWRpbHkKPiBtZWFzdWFyYWJsZSA0JSBpbXByb3ZlbWVudCBp
biBtZW1jYWNoZWQgdGhyb3VnaHB1dCBvbiBBbHRyYSBNYXgKPiBzd2FwcGluZyB0byBPcHRhbmU6
Cj4KPiBVc2luZyB0aGUgYml0bWFwICg2NCBLVk0gUFRFcyBmb3IgZWFjaCBjYWxsKQo+ID09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT0KPiBUeXBlICAgICAgICAgT3BzL3NlYyAgICAgSGl0cy9zZWMgICBNaXNzZXMvc2VjICAg
IEF2Zy4gTGF0ZW5jeSAgICAgcDUwCj4gTGF0ZW5jeSAgICAgcDk5IExhdGVuY3kgICBwOTkuOSBM
YXRlbmN5ICAgICAgIEtCL3NlYwo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBTZXRzICAgICAgICAgICAgMC4wMCAg
ICAgICAgICAtLS0gICAgICAgICAgLS0tICAgICAgICAgICAgIC0tLQo+ICAgICAtLS0gICAgICAg
ICAgICAgLS0tICAgICAgICAgICAgIC0tLSAgICAgICAgIDAuMDAKPiBHZXRzICAgICAgMTAxMjgw
MS45MiAgICA0MzE0MzYuOTIgICAgIDE0OTY1LjExICAgICAgICAgMC4wNjI0Ngo+IDAuMDQ3MDAg
ICAgICAgICAwLjE2NzAwICAgICAgICAgNC4zMTkwMCAgICAgMzk2MzUuODMKPiBXYWl0cyAgICAg
ICAgICAgMC4wMCAgICAgICAgICAtLS0gICAgICAgICAgLS0tICAgICAgICAgICAgIC0tLQo+ICAg
ICAtLS0gICAgICAgICAgICAgLS0tICAgICAgICAgICAgIC0tLSAgICAgICAgICAtLS0KPiBUb3Rh
bHMgICAgMTAxMjgwMS45MiAgICA0MzE0MzYuOTIgICAgIDE0OTY1LjExICAgICAgICAgMC4wNjI0
Ngo+IDAuMDQ3MDAgICAgICAgICAwLjE2NzAwICAgICAgICAgNC4zMTkwMCAgICAgMzk2MzUuODMK
Pgo+Cj4gTm90IHVzaW5nIHRoZSBiaXRtYXAgKDEgS1ZNIFBURXMgZm9yIGVhY2ggY2FsbCkKPiA9
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09Cj4gVHlwZSAgICAgICAgIE9wcy9zZWMgICAgIEhpdHMvc2VjICAgTWlzc2VzL3Nl
YyAgICBBdmcuIExhdGVuY3kgICAgIHA1MAo+IExhdGVuY3kgICAgIHA5OSBMYXRlbmN5ICAgcDk5
LjkgTGF0ZW5jeSAgICAgICBLQi9zZWMKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gU2V0cyAgICAgICAgICAgIDAu
MDAgICAgICAgICAgLS0tICAgICAgICAgIC0tLSAgICAgICAgICAgICAtLS0KPiAgICAgLS0tICAg
ICAgICAgICAgIC0tLSAgICAgICAgICAgICAtLS0gICAgICAgICAwLjAwCj4gR2V0cyAgICAgICA5
NjgyMTAuMDIgICAgNDEyNDQzLjg1ICAgICAxNDMwMy44OSAgICAgICAgIDAuMDY1MTcKPiAwLjA0
NzAwICAgICAgICAgMC4xNTkwMCAgICAgICAgIDcuNDIzMDAgICAgIDM3ODkwLjc0Cj4gV2FpdHMg
ICAgICAgICAgIDAuMDAgICAgICAgICAgLS0tICAgICAgICAgIC0tLSAgICAgICAgICAgICAtLS0K
PiAgICAgLS0tICAgICAgICAgICAgIC0tLSAgICAgICAgICAgICAtLS0gICAgICAgICAgLS0tCj4g
VG90YWxzICAgICA5NjgyMTAuMDIgICAgNDEyNDQzLjg1ICAgICAxNDMwMy44OSAgICAgICAgIDAu
MDY1MTcKPiAwLjA0NzAwICAgICAgICAgMC4xNTkwMCAgICAgICAgIDcuNDIzMDAgICAgIDM3ODkw
Ljc0Cj4KPgo+IEZsYW1lR3JhcGhzIHdpdGggYml0bWFwICgxLnN2ZykgYW5kIHdpdGhvdXQgYml0
bWFwICgyLnN2ZykgYXR0YWNoZWQuCj4KPiBXaGF0IEkgZG9uJ3QgdGhpbmsgaXMgYWNjZXB0YWJs
ZSBpcyBzaW1wbGlmeWluZyB0aG9zZSBvcHRpbWl6YXRpb25zCj4gb3V0IHdpdGhvdXQgZG9jdW1l
bnRpbmcgeW91ciBqdXN0aWZpY2F0aW9ucyAoSSB3b3VsZCBldmVuIGNhbGwgaXQgYQo+IGRlc2ln
biBjaGFuZ2UsIHJhdGhlciB0aGFuIHNpbXBsaWZpY2F0aW9uLCBmcm9tIHYzIHRvIHY0KS4KCkkn
bGwgcHV0IGJhY2sgc29tZXRoaW5nIHNpbWlsYXIgdG8gd2hhdCB5b3UgaGFkIGJlZm9yZSAobGlr
ZSBhCnRlc3RfY2xlYXJfeW91bmcoKSB3aXRoIGEgImZhc3QiIHBhcmFtZXRlciBpbnN0ZWFkIG9m
ICJiaXRtYXAiKS4gSQpsaWtlIHRoZSBpZGVhIG9mIGhhdmluZyBhIG5ldyBtbXUgbm90aWZpZXIs
IGxpa2UKZmFzdF90ZXN0X2NsZWFyX3lvdW5nKCksIHdoaWxlIGxlYXZpbmcgdGVzdF95b3VuZygp
IGFuZCBjbGVhcl95b3VuZygpCnVuY2hhbmdlZCAod2hlcmUgImZhc3QiIG1lYW5zICJwcmlvcml0
aXplIHNwZWVkIG92ZXIgYWNjdXJhY3kiKS4gSXQKc2VlbXMgYSBsaXR0bGUgbW9yZSBzdHJhaWdo
dGZvcndhcmQgdGhhdCB3YXkuCgo+Cj4gPiBGb3IgbG9vay1hcm91bmQgYXQgZXZpY3Rpb24gdGlt
ZToKPiA+IC0gdjQ6IGRvbmUgaWYgdGhlIG1haW4gbW0gUFRFIHdhcyB5b3VuZyBhbmQgbm8gTU1V
IG5vdGlmaWVycyBhcmUgc3Vic2NyaWJlZC4KPiA+IC0gdjIvdjM6IGRvbmUgaWYgdGhlIG1haW4g
bW0gUFRFIHdhcyB5b3VuZyBvciAodGhlIFNQVEUgd2FzIHlvdW5nIGFuZAo+ID4gdGhlIE1NVSBu
b3RpZmllciB3YXMgbG9ja2xlc3MvZmFzdCkuCj4KPiBUaGUgaG9zdCBhbmQgc2Vjb25kYXJ5IE1N
VXMgYXJlIHR3byAqaW5kZXBlbmRlbnQqIGNhc2VzLCBJTU86Cj4gMS4gbG9va2Fyb3VuZCB0aGUg
aG9zdCBNTVUgaWYgdGhlIFBURSBtYXBwaW5nIHRoZSBmb2xpbyB1bmRlciByZWNsYWltIGlzIHlv
dW5nLgo+IDIuIGxvb2thcm91bmQgdGhlIHNlY29uZGFyeSBNTVUgaWYgaXQgY2FuIGJlIGRvbmUg
bG9ja2xlc3NseS4KPgo+IFNvIHRoZSB2Mi92MyBiZWhhdmlvciBzb3VuZHMgYSBsb3QgbW9yZSBy
ZWFzb25hYmxlIHRvIG1lLgoKSSdsbCByZXN0b3JlIHRoZSB2Mi92MyBiZWhhdmlvci4gSSBpbml0
aWFsbHkgcmVtb3ZlZCBpdCBiZWNhdXNlLAp3aXRob3V0IGJhdGNoaW5nLCB3ZSAobW9zdGx5KSBs
b3NlIHRoZSBzcGF0aWFsIGxvY2FsaXR5IHRoYXQsIElJVUMsCmxvb2stYXJvdW5kIGlzIGRlc2ln
bmVkIHRvIGV4cGxvaXQuCgo+Cj4gQWxzbyBhIG5pdCAtLSBkb24ndCB1c2UgJ2Vsc2UnIGluIHRo
ZSBmb2xsb3dpbmcgY2FzZSAoc2hvdWxkX2xvb2tfYXJvdW5kKCkpOgo+Cj4gICBpZiAoZm9vKQo+
ICAgICByZXR1cm4gYmFyOwo+ICAgZWxzZQo+ICAgICBkb19zb21ldGhpbmcoKTsKCk9oLCB5ZXMs
IHNvcnJ5LiBJIHdyb3RlIGFuZCByZXdyb3RlIHNob3VsZF9sb29rX2Fyb3VuZCgpIHF1aXRlIGEg
ZmV3CnRpbWVzIHdoaWxlIHRyeWluZyB0byBmaWd1cmUgb3V0IHdoYXQgbWFkZSBzZW5zZSBpbiBh
IG5vLWJhdGNoaW5nCnNlcmllcy4gSSdsbCBmaXggdGhpcy4KCj4KPiA+IEkgbWFkZSB0aGlzIGxv
Z2ljIGNoYW5nZSBhcyBwYXJ0IG9mIHJlbW92aW5nIGJhdGNoaW5nLgo+ID4KPiA+IEknZCByZWFs
bHkgYXBwcmVjaWF0ZSBndWlkYW5jZSBvbiB3aGF0IHRoZSBjb3JyZWN0IHRoaW5nIHRvIGRvIGlz
Lgo+ID4KPiA+IEluIG15IG1pbmQsIHdoYXQgd291bGQgd29yayBncmVhdCBpczogYnkgZGVmYXVs
dCwgZG8gYWdpbmcgZXhhY3RseQo+ID4gd2hlbiBLVk0gY2FuIGRvIGl0IGxvY2tsZXNzbHksIGFu
ZCB0aGVuIGhhdmUgYSBLY29uZmlnIHRvIGFsd2F5cyBoYXZlCj4gPiBNR0xSVSB0byBkbyBhZ2lu
ZyB3aXRoIEtWTSBpZiBhIHVzZXIgcmVhbGx5IGNhcmVzIGFib3V0IHByb2FjdGl2ZQo+ID4gcmVj
bGFpbSAod2hlbiB0aGUgZmVhdHVyZSBiaXQgaXMgc2V0KS4gVGhlIHNlbGZ0ZXN0IGNhbiBjaGVj
ayB0aGUKPiA+IEtjb25maWcgKyBmZWF0dXJlIGJpdCB0byBrbm93IGZvciBzdXJlIGlmIGFnaW5n
IHdpbGwgYmUgZG9uZS4KPgo+IEkgc3RpbGwgZG9uJ3Qgc2VlIGhvdyB0aGF0IEtjb25maWcgaGVs
cHMuIE9yIHdoeSB0aGUgbmV3IHN0YXRpYyBicmFuY2gKPiBpc24ndCBlbm91Z2g/CgpXaXRob3V0
IGEgc3BlY2lhbCBLY29uZmlnLCB0aGUgZmVhdHVyZSBiaXQganVzdCB0ZWxscyB1cyB0aGF0IGFn
aW5nCndpdGggS1ZNIGlzIHBvc3NpYmxlLCBub3QgdGhhdCBpdCB3aWxsIG5lY2Vzc2FyaWx5IGJl
IGRvbmUuIEZvciB0aGUKc2VsZi10ZXN0LCBpdCdkIGJlIGdvb2QgdG8ga25vdyBleGFjdGx5IHdo
ZW4gYWdpbmcgaXMgYmVpbmcgZG9uZSBvcgpub3QsIHNvIGhhdmluZyBhIEtjb25maWcgbGlrZSBM
UlVfR0VOX0FMV0FZU19XQUxLX1NFQ09OREFSWV9NTVUgd291bGQKaGVscCBtYWtlIHRoZSBzZWxm
LXRlc3Qgc2V0IHRoZSByaWdodCBleHBlY3RhdGlvbnMgZm9yIGFnaW5nLgoKVGhlIEtjb25maWcg
d291bGQgYWxzbyBhbGxvdyBhIHVzZXIgdG8ga25vdyB0aGF0LCBubyBtYXR0ZXIgd2hhdCwKd2Un
cmUgZ29pbmcgdG8gZ2V0IGNvcnJlY3QgYWdlIGRhdGEgZm9yIFZNcywgZXZlbiBpZiwgc2F5LCB3
ZSdyZSB1c2luZwp0aGUgc2hhZG93IE1NVS4gVGhpcyBpcyBzb21ld2hhdCBpbXBvcnRhbnQgZm9y
IG1lL0dvb2dsZSBDbG91ZC4gSXMKdGhhdCByZWFzb25hYmxlPyBNYXliZSB0aGVyZSdzIGEgYmV0
dGVyIHNvbHV0aW9uLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
