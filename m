Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061E9C25B4F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 18:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FyeeCwJgsYB4rRg+EwbugBnqeeacpHllC0GT+OXKhas=; b=mu8ba5BhLna4XQ
	mMxkQ7s9VhoKAwzTSnZ35Mq62GRf6Vqpu/7hhkgAIniZ8DR6jQMTY9K5Q8RIFOK2rP0cMk/OK/cbg
	3a94S/YJkhkr2QGLFDA7xGv03yH/cvjjp4IQRmX1wHWTnQmyihg2kdxrTlTdCKO+RjiuYddEVepYe
	VlgN4YABEtJD0kpK/1cMokR7OroUh7gyZu1qzfsClbLAbjGW7i6RBU5nh+83a7Hfl3MQ+imxMhlZx
	ulZKD5WPxDKvu9HlKRLFfa0FIDEfRFSjTTgjtuPQXKm7h9PJDiaEfNCIPcVaGGDASzStCjqBtI1Cn
	NJWjYHNMFd2Io1Jfsi7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4ldv-0000000GTxp-3eyQ;
	Wed, 08 May 2024 18:03:51 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4ldl-0000000GTq3-2tv1
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 18:03:48 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-572a1b3d6baso1733a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 11:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715191416; x=1715796216; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKy0w8SAVZYo27FpU6ZBovVv7b8KWTwyUtyfvoxHua4=;
        b=gngbr2GUT+ZbnPCqlssOBAQfEhajpSrDf1H6rylGLUxqQBRY+Y6EWTqWlJXSBNe5xF
         cTVX3a0jezwuc4vlAUw1fPpp3A+UvijqgkrAUa2ibwcZMnbgRfaU6G6AsS10APMGh2Rw
         C7rUvftXx+566R3/jRmxKWZDW4y8UvicrxQGh2bhpstHzLfs9JQh6ltboNGPYh1g9R8g
         HqHBqPayxz6ns6x9670xJLTzT6McRLHxkpVWlEvYEAM3FX5y4s6kPbKSE8fM6HTU2/eD
         qdVvwcZEAUPKAYKZpuTiK2pW1jfFnqjG3yY32pkDAV0KHDHUzfuJdAKXLVFAcc1mCwix
         EpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715191416; x=1715796216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKy0w8SAVZYo27FpU6ZBovVv7b8KWTwyUtyfvoxHua4=;
        b=tDmoCRL3p0YvuCdY9JErq8NPqvg2GINvL1xDHvCLGSQOeORpO7XkOP0UM36Qj71mko
         vlMApXXM8m9ajRXbXwdU+HPpS4ye0DKVIDrx8tnZSOsscE3G+F9//OfSkO6lnLohfxgo
         VLo1TuxbW2F0iGbQ0osSquZIVy2KcPBY1gIi0DBK4+b1b2X3XdHTQsnt/Haqk/q/Ei1D
         20VXG3v090LbgpUgEIlDMZbnsaDNsZVHfxpirkjRNlOo55HIExGmYOBP8Qn9FQujOVVP
         9FG9s6LtglvXn/hvGJV69rrenVUjdIMiTPKbTGnO0bmTrne1suo9YbKgtc/CItae48Gb
         7Ifg==
X-Forwarded-Encrypted: i=1; AJvYcCWDlwQ5LZR7YK+IUgs9YWWTJHkSPIKKTJ6eX03J39bxQmZz459XTZwkdpmLpHRKnLhuv5vHQpNWSDiKl2X0P4fzs9Id4Klmd4to547Y/AaF
X-Gm-Message-State: AOJu0YxDsEz/jm6ifVk6Y8nWAF0CAF5E/I+Y8I0VgzkfduQYtINV3hbH
	XGhvv9M7WvoQBKUnUs/ryk4u6eXg8HAQSFsklFmvYsm/IwRadi6WMkOWN+9whbhiDDTWKMKsMtb
	Vf0qOvV9gHAYkyaoKs0XdI7QqdRCKxHSp8nhG
X-Google-Smtp-Source: AGHT+IFdyxKHKBA5RxjNJeg0nvw+PuOv0TpVA43qYYBbq4FC0UUJLuiCzYnH7rV9IAgiFwYJSHM5Q/yPLhYa7GrUbHY=
X-Received: by 2002:a05:6402:1763:b0:572:554b:ec66 with SMTP id
 4fb4d7f45d1cf-57334b922acmr1088a12.3.1715191416289; Wed, 08 May 2024 11:03:36
 -0700 (PDT)
MIME-Version: 1.0
References: <20240507214254.2787305-1-edliaw@google.com> <ZjuA3aY_iHkjP7bQ@google.com>
In-Reply-To: <ZjuA3aY_iHkjP7bQ@google.com>
From: Edward Liaw <edliaw@google.com>
Date: Wed, 8 May 2024 11:03:07 -0700
Message-ID: <CAG4es9V1578h2EgpztcoEv3CPGftbgA+HNfhgaPxBqOxP6-CrQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Define _GNU_SOURCE for sources using
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
X-CRM114-CacheID: sfid-20240508_110341_766542_F1E08341 
X-CRM114-Status: GOOD (  21.86  )
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

T24gV2VkLCBNYXkgOCwgMjAyNCBhdCA2OjQ34oCvQU0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vh
bmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBNYXkgMDcsIDIwMjQsIEVkd2FyZCBM
aWF3IHdyb3RlOgo+ID4gODA5MjE2MjMzNTU1ICgic2VsZnRlc3RzL2hhcm5lc3M6IHJlbW92ZSB1
c2Ugb2YgTElORV9NQVgiKSBpbnRyb2R1Y2VkCj4gPiBhc3ByaW50ZiBpbnRvIGtzZWxmdGVzdF9o
YXJuZXNzLmgsIHdoaWNoIGlzIGEgR05VIGV4dGVuc2lvbiBhbmQgbmVlZHMKPiA+IF9HTlVfU09V
UkNFIHRvIGVpdGhlciBiZSBkZWZpbmVkIHByaW9yIHRvIGluY2x1ZGluZyBoZWFkZXJzIG9yIHdp
dGggdGhlCj4gPiAtRF9HTlVfU09VUkNFIGZsYWcgcGFzc2VkIHRvIHRoZSBjb21waWxlci4KPiA+
Cj4gPiB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgta3NlbGZ0ZXN0LzIwMjQwNDMw
MjM1MDU3LjEzNTE5OTMtMS1lZGxpYXdAZ29vZ2xlLmNvbS8KPiA+IHYyOiBhZGQgLURfR05VX1NP
VVJDRSB0byBLSERSX0lOQ0xVREVTIHNvIHRoYXQgaXQgaXMgaW4gYSBzaW5nbGUKPiA+IGxvY2F0
aW9uLiAgUmVtb3ZlICNkZWZpbmUgX0dOVV9TT1VSQ0UgZnJvbSBzb3VyY2UgY29kZSB0byByZXNv
bHZlCj4gPiByZWRlZmluaXRpb24gd2FybmluZ3MuCj4gPgo+ID4gRWR3YXJkIExpYXcgKDUpOgo+
ID4gICBzZWxmdGVzdHM6IENvbXBpbGUga3NlbGZ0ZXN0IGhlYWRlcnMgd2l0aCAtRF9HTlVfU09V
UkNFCj4gPiAgIHNlbGZ0ZXN0cy9zZ3g6IEluY2x1ZGUgS0hEUl9JTkNMVURFUyBpbiBNYWtlZmls
ZQo+ID4gICBzZWxmdGVzdHM6IEluY2x1ZGUgS0hEUl9JTkNMVURFUyBpbiBNYWtlZmlsZQo+ID4g
ICBzZWxmdGVzdHM6IERyb3AgZGVmaW5lIF9HTlVfU09VUkNFCj4gPiAgIHNlbGZ0ZXN0czogRHJv
cCBkdXBsaWNhdGUgLURfR05VX1NPVVJDRQo+Cj4gQ2FuIHlvdSByZWJhc2UgdGhpcyBvbiB0b3Ag
b2YgbGludXgtbmV4dD8gIEkgaGF2ZSBhIGNvbmZsaWN0aW5nIGZpeFsqXSBmb3IgdGhlCj4gS1ZN
IHNlbGZ0ZXN0cyBxdWV1ZWQgZm9yIDYuMTAsIGFuZCBJIHdvdWxkIHByZWZlciBub3QgdG8gZHJv
cCB0aGF0IGNvbW1pdCBhdAo+IHRoaXMgc3RhZ2UgYXMgaXQgd291bGQgcmVxdWlyZSBhIHJlYmFz
ZSBvZiBhIHBpbGUgb2Ygb3RoZXIgY29tbWl0cy4KCk9rLCBJJ2xsIGRvIHRoYXQuCgo+Cj4gQW5k
IEkgZG91YnQgS1ZNIGlzIHRoZSBvbmx5IHN1YnN5c3RlbSB0aGF0IGhhcyBhIHRhcmdldGVkIGZp
eCBmb3IgdGhlIF9HTlVfU09VUkNFCj4gbWVzcy4KPgo+IElmIHdlIHdhbnQvbmVlZCB0byBnZXQg
YSBmaXggaW50byA2LjksIHRoZW4gSU1PIHdlIHNob3VsZCBqdXN0IHJldmVydCA4MDkyMTYyMzM1
NTUKPiAoInNlbGZ0ZXN0cy9oYXJuZXNzOiByZW1vdmUgdXNlIG9mIExJTkVfTUFYIiksIGFzIHRo
YXQgY2FtZSBpbiBxdWl0ZSBsYXRlIGluIHRoZQo+IDYuOSBjeWNsZSwgYW5kIEkgZG9uJ3QgdGhp
bmsgaXQncyBmZWFzaWJsZSB0byBiZSAxMDAlIGNvbmZpZGVudCB0aGF0IGdsb2JhbGx5Cj4gZGVm
aW5pbmcgX0dOVV9TT1VSQ0Ugd29ya3MgZm9yIGFsbCBzZWxmdGVzdHMsIGkuZS4gd2UgcmVhbGx5
IHNob3VsZCBoYXZlIGEgZnVsbAo+IGN5Y2xlIGZvciBmb2xrcyB0byB0ZXN0LgoKVGhhdCBzb3Vu
ZHMgcmVhc29uYWJsZSB0byBtZS4gIEluIHRoaXMgdGhyZWFkIFRhbyBzdWdnZXN0ZWQgcmV2ZXJ0
aW5nCmJhY2sgdG8gODA5MjE2MjMzNTU1IGFuZCB1c2luZyBhIGZpeGVkIHZhbHVlIGluIHBsYWNl
IG9mIExJTkVfTUFYIHRvCmZpeCAzOGM5NTdmMDcwMzgKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgta3NlbGZ0ZXN0LzIwMjQwNTA4MDcwMDAzLjJhY2RmOWI0QGtlcm5lbC5vcmcvCgo+Cj4g
WypdIGh0dHBzOi8vZ2l0aHViLmNvbS9rdm0teDg2L2xpbnV4L2NvbW1pdC83MzBjZmE0NWI1ZjQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
