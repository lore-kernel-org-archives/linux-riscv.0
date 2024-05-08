Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEACC25B4F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 20:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vLW5xfdjUj724WPgIAtGdX8EuBYfmeq8getoez5Tna4=; b=oL5ou1tJjcK+qW
	tANm+uOdfosl4X8CFvUYauJ014W3gS5UHt1xV2CgiFBgnqAksJSLhk+ZMGZRm8i6zvrZvtqcLwXsF
	VMsn2SVhFyntq2/Em7rDuQlwyIH8qAcUycCT6ZvMXi3sikyFSBZJLJstT+KR7H7kEut1/pTjqUONo
	9+DMe6bk/isHi3hYz9Di5jzzVT4pl1Um8qK4giZlGp88ijn8LAY5BULfWOAJZwT2V3eCtIxFRvbVh
	6SGXFCkvqmfgJv9tJMpJeJZBXndfoShEIyWl03g1sOyXGR4DcA2owh04qyL3ZNOplMuvJJCJZZz2p
	zyWYViaGIcaxhm+peiiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4nti-0000000Gt51-3H1K;
	Wed, 08 May 2024 20:28:18 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4ntb-0000000Gt17-3nwm
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 20:28:14 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-572aad902baso3821a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 13:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715200088; x=1715804888; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxBCT1ZV/EGWLKjxVs7FXcKu7sqjJfkKsVJ1w+mU1+0=;
        b=ElkDLCzLAvScHSSEZ6mtNQVcaeqr2V+qBrbcNQI5lMezHoQ6qq5vF9KPAU+n3eZtCp
         fhFe5UqFeph1jA9ceyjo8uI7vfeeglNImlNa9670WlipYx2SxPU+snZq4zOpO39TfCPJ
         Rle47iU1hXYGCnE4XuMEA0aJx3oiFIDivV2vaanSaPOo2wu+LhxtY93ylIl+KhN2FFDu
         tf/yvpblr0qBbSe8KVvva9xDnmAjcbDWoYKe77J5kNUuids+XbEbXJg1uZiMa4qDY+Lo
         xP9bXfsl/o0a3ZttXgrIoKAXGLfFMYpvWiecQ+Fy1PpyBWG7zKiblaKEij6ghqtbLPyt
         Sv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715200088; x=1715804888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxBCT1ZV/EGWLKjxVs7FXcKu7sqjJfkKsVJ1w+mU1+0=;
        b=rq2io+FkZJKGoym/n7OSEROJlMmdQY6XdMlJCHC4L1tqIulAOD9+dHaIEz4UD8tQ+h
         25aWWDnxY35lu3mBNJyYV4LBqJpRJb31SvQBIAIib9viqRYgRpFMkmrh4U75PI/qq0p8
         vuvQbozaLvp2m3kYlUBAl2XOhGzuGf1ecdzT2sEfrvRQZ/96nYtk2/WefwCJYL+H1vaF
         SnArvueIEfbT68KkDimB6pinfUZC4lQhQBHYsvzWpbCtuAZLUPiLcc8QxizGur8MDo1J
         hiRVDhCNThQaNaQWkzRwWs5mOz1Z/HKlyhTkkshupvVDLe+DmVgkTtO/lXrjVexsPr53
         IYQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk4S3EQr2OSSDwVM31MPNLQNOBQSKoCkUIBPaMFOlOSfr18hjmSADD2qj8ZcRz0vUdvG/Xi5QzgpYMbEEI78BLEevsV0cKT741xehS7Yc9
X-Gm-Message-State: AOJu0Yz2bu13m6GmmA9ltpKK0ad5ke7gF76r/L6lUEUgRVTHCycaLkKE
	rt4q/khmtY5MxxLZZvvHlCKmgBIgJhHiEbzeaq1OOtLUdBkPZL3rC8M6tq5lNmkFXjwX8ThQfE7
	jE4Bc5HcApDY4F0foqBAa6bzGjm9atGdrbMfe
X-Google-Smtp-Source: AGHT+IG0Nkg3RjjAAyj+n+Ew0xyy8RnKsH20og6+OrFEWYycNhxXEo9VK176FECewK/2EQxZ5XFepnMJQqWDZY6gYdE=
X-Received: by 2002:a05:6402:228b:b0:572:a33d:437f with SMTP id
 4fb4d7f45d1cf-573341614e1mr44879a12.2.1715200087751; Wed, 08 May 2024
 13:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240507214254.2787305-1-edliaw@google.com> <20240507214254.2787305-5-edliaw@google.com>
 <ZjuEILj0SZRuTL9I@google.com>
In-Reply-To: <ZjuEILj0SZRuTL9I@google.com>
From: Edward Liaw <edliaw@google.com>
Date: Wed, 8 May 2024 13:27:39 -0700
Message-ID: <CAG4es9VWuY4Z5HoU_SQCDaSrDC0s1knDfGvLNEa1YxhC0RZ2ZQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] selftests: Drop define _GNU_SOURCE
To: Sean Christopherson <seanjc@google.com>
Cc: shuah@kernel.org, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Christian Brauner <brauner@kernel.org>, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <keescook@chromium.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Kevin Tian <kevin.tian@intel.com>, Andy Lutomirski <luto@amacapital.net>, 
	Will Drewry <wad@chromium.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	David Hildenbrand <david@redhat.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Seth Forshee <sforshee@kernel.org>, Bongsu Jeon <bongsu.jeon@samsung.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Matthieu Baerts <matttbe@kernel.org>, 
	Mat Martineau <martineau@kernel.org>, Geliang Tang <geliang@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Fenghua Yu <fenghua.yu@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, linux-input@vger.kernel.org, iommu@lists.linux.dev, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-actions@lists.infradead.org, mptcp@lists.linux.dev, 
	linux-rtc@vger.kernel.org, linux-sgx@vger.kernel.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_132812_037642_B761E17B 
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

T24gV2VkLCBNYXkgOCwgMjAyNCBhdCA2OjU04oCvQU0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vh
bmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBNYXkgMDcsIDIwMjQsIEVkd2FyZCBM
aWF3IHdyb3RlOgo+ID4gX0dOVV9TT1VSQ0UgaXMgcHJvdmlkZWQgYnkgS0hEUl9JTkNMVURFUywg
c28gaXQgc2hvdWxkIGJlIGRyb3BwZWQgdG8KPiA+IHByZXZlbnQgX0dOVV9TT1VSQ0UgcmVkZWZp
bmVkIHdhcm5pbmdzLgo+Cj4gLi4uCj4KPiA+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy94ODYvdGVzdF9zeXNjYWxsX3Zkc28uYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L3g4Ni90ZXN0X3N5c2NhbGxfdmRzby5jCj4gPiBpbmRleCA4OTY1YzMxMWJkNjUuLjVjZDEzMjc5
YmJhNSAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3g4Ni90ZXN0X3N5
c2NhbGxfdmRzby5jCj4gPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy94ODYvdGVzdF9z
eXNjYWxsX3Zkc28uYwo+ID4gQEAgLTgsMTAgKzgsNiBAQAo+ID4gICAqIENhbiBiZSBidWlsdCBz
dGF0aWNhbGx5Ogo+ID4gICAqIGdjYyAtT3MgLVdhbGwgLXN0YXRpYyAtbTMyIHRlc3Rfc3lzY2Fs
bF92ZHNvLmMgdGh1bmtzXzMyLlMKPiA+ICAgKi8KPiA+IC0jdW5kZWYgX0dOVV9TT1VSQ0UKPiA+
IC0jZGVmaW5lIF9HTlVfU09VUkNFIDEKPiA+IC0jdW5kZWYgX19VU0VfR05VCj4gPiAtI2RlZmlu
ZSBfX1VTRV9HTlUgMQo+Cj4gQUZBSUNULCBtYW51YWxseSBkZWZpbmluZyBfX1VTRV9HTlUgaXMg
ZnJvd25lZCB1cG9uLCBzbyBJJ20gZ3Vlc3NpbmcgdGhlIF9fVVNFX0dOVQo+IHN0dWZmIGlzIGp1
c3QgdGhlIHJlc3VsdCBvZiBtaXNndWlkZWQgY29weStwYXN0ZS4gIEJ1dCBpdCB3b3VsZCBiZSBu
aWNlIHRvIGdldAo+IGNvbmZpcm1hdGlvbiB0aGF0IHRoaXMgdGVzdCBpc24ndCBkb2luZyBzb21l
dGhpbmcgY2xldmVyLiAgT3IgYXQgdGhlIHZlcnkgbGVhc3QsCj4gZXhwbGFpbiB0aGUgcmVtb3Zh
bCBvZiBfX1VTRV9HTlUgaW4gdGhlIGNoYW5nZWxvZy4KCkl0IGxvb2tzIGxpa2UgdGVzdF9zeXNj
YWxsX3Zkc28sIHRlc3RfRkNNT1YsIHRlc3RfRkNPTUksIGFuZAp0ZXN0X0ZJU1RUUCBkb24ndCBh
Y3R1YWxseSB1c2UgYW55IEdOVSBleHRlbnNpb25zLiAgSSdsbCBhZGQgdGhhdCB0bwp0aGUgY29t
bWl0IG1lc3NhZ2UuCgoKPgo+ID4gICNpbmNsdWRlIDx1bmlzdGQuaD4KPiA+ICAjaW5jbHVkZSA8
c3RkbGliLmg+Cj4gPiAgI2luY2x1ZGUgPHN0cmluZy5oPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
