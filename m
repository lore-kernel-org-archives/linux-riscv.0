Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC660C25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 18:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DSXHYo0mg67fCg91McwyHAlHOZ89gAmRhPJ9cZfqnPQ=; b=PTrsoYnMi8vIFc
	3pbPv/QkhVUjrQ6NkowvdvAo3Ups7aFA+ofuif+M9rS0h0EmJn/Y0JorblClv9zRCrpaJ8JBTEIJ3
	UltMkJzOb3xaue8K4MU2KoMPeuyAEx+U0acd99eEitBYRpnqp1me/8Hmw3nqx0u5vND8ufoemSJb4
	PCTjbtla1MJcZaQFF2JNsGARehqhzFftTxvHJH8RW3VEOxXAhGRwcHLI1hanHPe0q4aF0kYM1U3sC
	7vh83OPU86Zm0dWZyQx2jcduU4HGaOe+6oFO1QPUUMqsOYDbiyfbp0sEGNjoeXozx2g080j78/0qy
	N9Hx04Rq2XPEl+ZUR5XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s58Nb-00000002MB7-45Ew;
	Thu, 09 May 2024 18:20:32 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s58NW-00000002M70-12Ho;
	Thu, 09 May 2024 18:20:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715278815;
	bh=JCJaK6QpOrmmUJdi/1h2/P/m5VnuJoQJ8ijlBJBZs2E=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=Y0vwhbgpxSGiErJBlZANaCoV14K1sUaA4F/ooMPA8bO48t72Fpno5DrnfALIMJiFY
	 oMSvCEfOkwdTnfzldtNTgWgnNeYnX0lnmSBwYV+uUcXI50biIzPUgTSdbJDAk9h9/N
	 bVUTOACTMW2U5cMSjfFt9b0R/BiIAN1Kzg0OIMCCtoqr8O1bj2D1Led/rtVGtGTVC8
	 kz3S35qqjR2mswHsIzoVynyPqK+vGV6uTv4IAVR+VARRqE/hZwUo8M6kQ1/zzNJO7N
	 IQqLkWeZKdjhwuxngilpfTAlT58QqNdElQbuZGDixBXFgx76yRt8hchoMtP4P0BWps
	 4uG5Wxt7oOVIg==
Received: from [100.113.15.66] (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3ED82378214F;
	Thu,  9 May 2024 18:19:55 +0000 (UTC)
Message-ID: <57f47bc1-972c-45b5-81ef-d8269dcadebb@collabora.com>
Date: Thu, 9 May 2024 23:20:19 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, shuah@kernel.org,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Nhat Pham <nphamcs@gmail.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Christian Brauner
 <brauner@kernel.org>, Eric Biederman <ebiederm@xmission.com>,
 Kees Cook <keescook@chromium.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Andy Lutomirski <luto@amacapital.net>,
 Will Drewry <wad@chromium.org>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?=
 <mic@digikod.net>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Andrew Morton <akpm@linux-foundation.org>, Seth Forshee
 <sforshee@kernel.org>, Bongsu Jeon <bongsu.jeon@samsung.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, =?UTF-8?Q?Andreas_F=C3=A4rber?=
 <afaerber@suse.de>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Matthieu Baerts <matttbe@kernel.org>,
 Mat Martineau <martineau@kernel.org>, Geliang Tang <geliang@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Fenghua Yu <fenghua.yu@intel.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-team@android.com,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, linux-input@vger.kernel.org, iommu@lists.linux.dev,
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org,
 linux-actions@lists.infradead.org, mptcp@lists.linux.dev,
 linux-rtc@vger.kernel.org, linux-sgx@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Define _GNU_SOURCE for sources using
To: Edward Liaw <edliaw@google.com>, Shuah Khan <skhan@linuxfoundation.org>
References: <20240507214254.2787305-1-edliaw@google.com>
 <f4e45604-86b0-4be6-9bea-36edf301df33@linuxfoundation.org>
 <CAG4es9XE2D94BNboRSf607NbJVW7OW4xkVq4jZ8pDZ_AZsb3nQ@mail.gmail.com>
 <946ae22f-a4af-448a-92e1-60afb6ed9261@linuxfoundation.org>
 <CAG4es9V2CcBJr0josSoGNsD+ZPQ6vasVXh_Hc_j88oeSqn__yQ@mail.gmail.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <CAG4es9V2CcBJr0josSoGNsD+ZPQ6vasVXh_Hc_j88oeSqn__yQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_112026_444804_841A00AD 
X-CRM114-Status: GOOD (  19.36  )
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

T24gNS85LzI0IDEwOjQ1IFBNLCBFZHdhcmQgTGlhdyB3cm90ZToKPiBPbiBUaHUsIE1heSA5LCAy
MDI0IGF0IDc6MzfigK9BTSBTaHVhaCBLaGFuIDxza2hhbkBsaW51eGZvdW5kYXRpb24ub3JnPiB3
cm90ZToKPj4KPj4gT24gNS85LzI0IDAwOjEzLCBFZHdhcmQgTGlhdyB3cm90ZToKPj4+IE9uIFdl
ZCwgTWF5IDgsIDIwMjQgYXQgNDoxMOKAr1BNIFNodWFoIEtoYW4gPHNraGFuQGxpbnV4Zm91bmRh
dGlvbi5vcmc+IHdyb3RlOgo+Pj4+Cj4+Pj4gT24gNS83LzI0IDE1OjM4LCBFZHdhcmQgTGlhdyB3
cm90ZToKPj4+Pj4gODA5MjE2MjMzNTU1ICgic2VsZnRlc3RzL2hhcm5lc3M6IHJlbW92ZSB1c2Ug
b2YgTElORV9NQVgiKSBpbnRyb2R1Y2VkCj4+Pj4+IGFzcHJpbnRmIGludG8ga3NlbGZ0ZXN0X2hh
cm5lc3MuaCwgd2hpY2ggaXMgYSBHTlUgZXh0ZW5zaW9uIGFuZCBuZWVkcwo+Pj4+PiBfR05VX1NP
VVJDRSB0byBlaXRoZXIgYmUgZGVmaW5lZCBwcmlvciB0byBpbmNsdWRpbmcgaGVhZGVycyBvciB3
aXRoIHRoZQo+Pj4+PiAtRF9HTlVfU09VUkNFIGZsYWcgcGFzc2VkIHRvIHRoZSBjb21waWxlci4K
Pj4+Pj4KPj4+Pj4gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWtzZWxmdGVzdC8y
MDI0MDQzMDIzNTA1Ny4xMzUxOTkzLTEtZWRsaWF3QGdvb2dsZS5jb20vCj4+Pj4+IHYyOiBhZGQg
LURfR05VX1NPVVJDRSB0byBLSERSX0lOQ0xVREVTIHNvIHRoYXQgaXQgaXMgaW4gYSBzaW5nbGUK
Pj4+Pj4gbG9jYXRpb24uICBSZW1vdmUgI2RlZmluZSBfR05VX1NPVVJDRSBmcm9tIHNvdXJjZSBj
b2RlIHRvIHJlc29sdmUKPj4+Pj4gcmVkZWZpbml0aW9uIHdhcm5pbmdzLgo+Pj4+Pgo+Pj4+PiBF
ZHdhcmQgTGlhdyAoNSk6Cj4+Pj4+ICAgICBzZWxmdGVzdHM6IENvbXBpbGUga3NlbGZ0ZXN0IGhl
YWRlcnMgd2l0aCAtRF9HTlVfU09VUkNFCj4+Pj4+ICAgICBzZWxmdGVzdHMvc2d4OiBJbmNsdWRl
IEtIRFJfSU5DTFVERVMgaW4gTWFrZWZpbGUKPj4+Pgo+Pj4+IEkgYXBwbGVkIHBhdGNoZXMgMS81
IGFuZCAyLjUgLSBUaGUgcmVzdCBuZWVkIHRvIGJlIHNwbGl0IHVwLgo+Pj4+Cj4+Pj4+ICAgICBz
ZWxmdGVzdHM6IEluY2x1ZGUgS0hEUl9JTkNMVURFUyBpbiBNYWtlZmlsZQo+Pj4+PiAgICAgc2Vs
ZnRlc3RzOiBEcm9wIGRlZmluZSBfR05VX1NPVVJDRQo+Pj4+PiAgICAgc2VsZnRlc3RzOiBEcm9w
IGR1cGxpY2F0ZSAtRF9HTlVfU09VUkNFCj4+Pj4+Cj4+Pj4KPj4+PiBQbGVhc2Ugc3BsaXQgdGhl
c2UgcGF0Y2hlcyBwd2UgdGVzdCBkaXJlY3RvcnkuIE90aGVyd2lzZSBpdCB3aWxsCj4+Pj4gY2F1
c2UgbWVyZ2UgY29uZmxpY3RzIHdoaWNoIGNhbiBiZSBoYXJkIHRvIHJlc29sdmUuCj4+Pgo+Pj4g
SGkgU2h1YWgsCj4+PiBTZWFuIGFza2VkIHRoYXQgSSByZWJhc2UgdGhlIHBhdGNoZXMgb24gbGlu
dXgtbmV4dCwgYW5kIEkgd2lsbCBuZWVkIHRvCj4+PiByZW1vdmUgYWRkaXRpb25hbCBfR05VX1NP
VVJDRSBkZWZpbmVzLiAgU2hvdWxkIEkgc2VuZCBhbiB1bnNwbGl0IHYzIHRvCj4+PiBiZSByZXZp
ZXdlZCwgdGhlbiBzcGxpdCBpdCBhZnRlcndhcmRzPyAgSSdtIGNvbmNlcm5lZCB0aGF0IGl0IHdp
bGwgYmUKPj4+IGRpZmZpY3VsdCB0byByZXZpZXcgd2l0aCB+NzAgcGF0Y2hlcyBvbmNlIHNwbGl0
Lgo+Pgo+PiBQbGVhc2Ugc2VuZCB0aGVtIHNwbGl0IC0gaXQgd2lsbCBiZSBlYXNpZXIgdG8gcmV2
aWV3IGFuZCBhcHBseS4gWW91Cj4+IG1pZ2h0IGFzIHdlbGwgd2FpdCB1bnRpbCB0aGUgbWVyZ2Ug
d2luZG93IGlzIGRvbmUuIEkgZG9uJ3QgdGhpbmsKPj4gYW55Ym9keSB3b3VsZCBoYXZlIHRpbWUg
dG8gcmV2aWV3IG5vdyBzaW5jZSBtZXJnZSB3aW5kb3cgc3RhcnRzCj4+IG5leHQgd2Vlay4KPiAK
PiBTb3JyeSwgSSBoYXZlIHRoZW0gc3BsaXQgYWxyZWFkeTsgaXMgaXQgb2sgaWYgSSBzZW5kIHRo
ZW0gbm93PyAgSSB3aWxsCj4gYmUgb24gbGVhdmUgc29vbiBhbmQgbWF5IG5vdCBiZSBhYmxlIHRv
IGdldCBiYWNrIHRvIGl0IGluIGEgd2hpbGUuCkZlZWwgZnJlZSB0byBzZW5kIHRoZSBwYXRjaGVz
LiBUaGVyZSBpcyBubyByZXN0cmljdGlvbiBvbiB0aGF0LgoKPiAKPiBUaGFua3MsCj4gRWR3YXJk
Cj4gCj4+Cj4+Cj4+IHRoYW5rcywKPj4gLS0gU2h1YWgKPiAKCi0tIApCUiwKTXVoYW1tYWQgVXNh
bWEgQW5qdW0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
