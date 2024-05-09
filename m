Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F725C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 17:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8LaZAff6mSQ9GJ5IJ1Co7eXlmcZDOKd2vpCDIPXIKXw=; b=ULDAI5yuccV6Zq
	2JssSAxle+W1YAkakA3uHrSSvgTWBU9Irsz53BqvGEjXqIaUIQ7i1/2YxdCKCwWfSzbApaROIWVRK
	hDk+NqWOfAghhc5z9Jj8PkGtez8EsLZQQZHvDFEt0u4VgPqok/ew9jdDanghEqs+5mdohW5GmuOBK
	6aeWv3/rny6/Lk/eMbr24+4FsCX422m+w/6d5BbFDKbELlSB3yaaYG55wi2hzLcukHDoHj1JL2zcw
	JDf/b+/+3jKDDGKI3Q1ZsoFn7wQJMjZDHZFJlDMB8WPB8CYdObrOZEA2jnVf8ghdZiqdjXh39W/mJ
	fFpitRphGh0kMGwq3nVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s57qL-00000002HDS-0Kbx;
	Thu, 09 May 2024 17:46:09 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s57qE-00000002H9O-2faH
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 17:46:07 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-572aad902baso1505a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 10:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715276760; x=1715881560; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9dUf6h0ZONDc1o4IvKX4JCSR1LfcFcW4NQit96LWug=;
        b=L5FxH0OQtWC/8o0u9182BRtlOKDRj1nJhwV0mXY925u/BSgwLNkp/aakuKMrHof46e
         eS3pm2N/l02ZF7otFLon2FQHiNtG3Px53zYdzU0DCNPOSIeXY9h9/t7G5nOddzWCnN44
         PwZGgnLFFUGPPXhIH8vHFWfaj4QzuAYFUNxHW26s5GxW+bG/xipGDDSnavUvofAQVL+B
         A/JzMMuGAvlqzTUODMCgzQLFbqcpXIJcNOIASppLOM0VUNEe4LDP16tdA+0/KfJFcUcg
         qaWU7UHNu/8e27jdFN9fg4V8XiE2kF+1uFd0Gf/TirV/m5yteLqVs6y1ceYBndvTo5O9
         ChMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715276760; x=1715881560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R9dUf6h0ZONDc1o4IvKX4JCSR1LfcFcW4NQit96LWug=;
        b=i2DGhP8Qrr+cdXE0x7K9h4z3MVoyqAm4WJTU820mToF19SI5st+bZYp0ClgiS2sX98
         keQCcXD/sW8YADIA7f2iaqRtx9ra2gBtWSrtNvq9lxrzHb5Bz6+Se3SN7V3zWtuU1b0k
         K0Tc/ryqJ7warUYQdKJ44I/v03w+VOLCMcw5U9COI5EbnMRVqpT8EiNAK/7CTMxfTNP4
         x2UCXq9cUzGHfB7YTCpRY3QpgG1B8QkF6Yt6FWKxn8pDTuYW7ZVrgl6CqQZiLJainQUn
         Eldyj+jEYFtg5qSmvrCYM3DYQS3dtRzIfccg7gNNdawybKObwOJg4Ogxq41hH4pl/0+8
         +tOw==
X-Forwarded-Encrypted: i=1; AJvYcCWWSmlE3UMfyVOdY/7L5AjZeOcaP/8/sU5tGDMNagUUkkShEdZkhjpippjwMsNMZhAssMmr53qo656ULtqGEdQY2akMfXHzK6MGLMHkJYJ2
X-Gm-Message-State: AOJu0YzTu/7L8FgUVGCImyOr4m+EJEh2jEY+s2ndWLuFbdJY2v89rOVr
	b1hoS5ydIU6HTPgG6TujwPmDNx3ftJKCu/GziI1VcXJ52gXho5CAS/Lbb874Y716eDuQ/kC0pWz
	PwUMhImpKRgu6yQQOxnK8E87ausyrmy9PPVxK
X-Google-Smtp-Source: AGHT+IFG+qZVP+GdGsJ0bfuXNwufKAJIRBglqYr60vsLU06TQKxk62S9P+fDwyd1v4jS3rVgg+dEQp+BJ2xOYW96LJk=
X-Received: by 2002:a50:cac7:0:b0:572:988f:2f38 with SMTP id
 4fb4d7f45d1cf-5734f8fe9f6mr3018a12.6.1715276759326; Thu, 09 May 2024 10:45:59
 -0700 (PDT)
MIME-Version: 1.0
References: <20240507214254.2787305-1-edliaw@google.com> <f4e45604-86b0-4be6-9bea-36edf301df33@linuxfoundation.org>
 <CAG4es9XE2D94BNboRSf607NbJVW7OW4xkVq4jZ8pDZ_AZsb3nQ@mail.gmail.com> <946ae22f-a4af-448a-92e1-60afb6ed9261@linuxfoundation.org>
In-Reply-To: <946ae22f-a4af-448a-92e1-60afb6ed9261@linuxfoundation.org>
From: Edward Liaw <edliaw@google.com>
Date: Thu, 9 May 2024 10:45:31 -0700
Message-ID: <CAG4es9V2CcBJr0josSoGNsD+ZPQ6vasVXh_Hc_j88oeSqn__yQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Define _GNU_SOURCE for sources using
To: Shuah Khan <skhan@linuxfoundation.org>
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
	Sean Christopherson <seanjc@google.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
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
X-CRM114-CacheID: sfid-20240509_104602_773235_047CBCA1 
X-CRM114-Status: GOOD (  23.65  )
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

T24gVGh1LCBNYXkgOSwgMjAyNCBhdCA3OjM34oCvQU0gU2h1YWggS2hhbiA8c2toYW5AbGludXhm
b3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBPbiA1LzkvMjQgMDA6MTMsIEVkd2FyZCBMaWF3IHdy
b3RlOgo+ID4gT24gV2VkLCBNYXkgOCwgMjAyNCBhdCA0OjEw4oCvUE0gU2h1YWggS2hhbiA8c2to
YW5AbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4gPj4KPiA+PiBPbiA1LzcvMjQgMTU6Mzgs
IEVkd2FyZCBMaWF3IHdyb3RlOgo+ID4+PiA4MDkyMTYyMzM1NTUgKCJzZWxmdGVzdHMvaGFybmVz
czogcmVtb3ZlIHVzZSBvZiBMSU5FX01BWCIpIGludHJvZHVjZWQKPiA+Pj4gYXNwcmludGYgaW50
byBrc2VsZnRlc3RfaGFybmVzcy5oLCB3aGljaCBpcyBhIEdOVSBleHRlbnNpb24gYW5kIG5lZWRz
Cj4gPj4+IF9HTlVfU09VUkNFIHRvIGVpdGhlciBiZSBkZWZpbmVkIHByaW9yIHRvIGluY2x1ZGlu
ZyBoZWFkZXJzIG9yIHdpdGggdGhlCj4gPj4+IC1EX0dOVV9TT1VSQ0UgZmxhZyBwYXNzZWQgdG8g
dGhlIGNvbXBpbGVyLgo+ID4+Pgo+ID4+PiB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgta3NlbGZ0ZXN0LzIwMjQwNDMwMjM1MDU3LjEzNTE5OTMtMS1lZGxpYXdAZ29vZ2xlLmNvbS8K
PiA+Pj4gdjI6IGFkZCAtRF9HTlVfU09VUkNFIHRvIEtIRFJfSU5DTFVERVMgc28gdGhhdCBpdCBp
cyBpbiBhIHNpbmdsZQo+ID4+PiBsb2NhdGlvbi4gIFJlbW92ZSAjZGVmaW5lIF9HTlVfU09VUkNF
IGZyb20gc291cmNlIGNvZGUgdG8gcmVzb2x2ZQo+ID4+PiByZWRlZmluaXRpb24gd2FybmluZ3Mu
Cj4gPj4+Cj4gPj4+IEVkd2FyZCBMaWF3ICg1KToKPiA+Pj4gICAgIHNlbGZ0ZXN0czogQ29tcGls
ZSBrc2VsZnRlc3QgaGVhZGVycyB3aXRoIC1EX0dOVV9TT1VSQ0UKPiA+Pj4gICAgIHNlbGZ0ZXN0
cy9zZ3g6IEluY2x1ZGUgS0hEUl9JTkNMVURFUyBpbiBNYWtlZmlsZQo+ID4+Cj4gPj4gSSBhcHBs
ZWQgcGF0Y2hlcyAxLzUgYW5kIDIuNSAtIFRoZSByZXN0IG5lZWQgdG8gYmUgc3BsaXQgdXAuCj4g
Pj4KPiA+Pj4gICAgIHNlbGZ0ZXN0czogSW5jbHVkZSBLSERSX0lOQ0xVREVTIGluIE1ha2VmaWxl
Cj4gPj4+ICAgICBzZWxmdGVzdHM6IERyb3AgZGVmaW5lIF9HTlVfU09VUkNFCj4gPj4+ICAgICBz
ZWxmdGVzdHM6IERyb3AgZHVwbGljYXRlIC1EX0dOVV9TT1VSQ0UKPiA+Pj4KPiA+Pgo+ID4+IFBs
ZWFzZSBzcGxpdCB0aGVzZSBwYXRjaGVzIHB3ZSB0ZXN0IGRpcmVjdG9yeS4gT3RoZXJ3aXNlIGl0
IHdpbGwKPiA+PiBjYXVzZSBtZXJnZSBjb25mbGljdHMgd2hpY2ggY2FuIGJlIGhhcmQgdG8gcmVz
b2x2ZS4KPiA+Cj4gPiBIaSBTaHVhaCwKPiA+IFNlYW4gYXNrZWQgdGhhdCBJIHJlYmFzZSB0aGUg
cGF0Y2hlcyBvbiBsaW51eC1uZXh0LCBhbmQgSSB3aWxsIG5lZWQgdG8KPiA+IHJlbW92ZSBhZGRp
dGlvbmFsIF9HTlVfU09VUkNFIGRlZmluZXMuICBTaG91bGQgSSBzZW5kIGFuIHVuc3BsaXQgdjMg
dG8KPiA+IGJlIHJldmlld2VkLCB0aGVuIHNwbGl0IGl0IGFmdGVyd2FyZHM/ICBJJ20gY29uY2Vy
bmVkIHRoYXQgaXQgd2lsbCBiZQo+ID4gZGlmZmljdWx0IHRvIHJldmlldyB3aXRoIH43MCBwYXRj
aGVzIG9uY2Ugc3BsaXQuCj4KPiBQbGVhc2Ugc2VuZCB0aGVtIHNwbGl0IC0gaXQgd2lsbCBiZSBl
YXNpZXIgdG8gcmV2aWV3IGFuZCBhcHBseS4gWW91Cj4gbWlnaHQgYXMgd2VsbCB3YWl0IHVudGls
IHRoZSBtZXJnZSB3aW5kb3cgaXMgZG9uZS4gSSBkb24ndCB0aGluawo+IGFueWJvZHkgd291bGQg
aGF2ZSB0aW1lIHRvIHJldmlldyBub3cgc2luY2UgbWVyZ2Ugd2luZG93IHN0YXJ0cwo+IG5leHQg
d2Vlay4KClNvcnJ5LCBJIGhhdmUgdGhlbSBzcGxpdCBhbHJlYWR5OyBpcyBpdCBvayBpZiBJIHNl
bmQgdGhlbSBub3c/ICBJIHdpbGwKYmUgb24gbGVhdmUgc29vbiBhbmQgbWF5IG5vdCBiZSBhYmxl
IHRvIGdldCBiYWNrIHRvIGl0IGluIGEgd2hpbGUuCgpUaGFua3MsCkVkd2FyZAoKPgo+Cj4gdGhh
bmtzLAo+IC0tIFNodWFoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
