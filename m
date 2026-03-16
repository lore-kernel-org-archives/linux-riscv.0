Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE49F013FA
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 22:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m1v58f+pT9xdnb1CmFGsWLXK/e06U3p6qF94Xhh8Gcw=; b=2W5NH2pujfVuAU
	6Gkg+BPp2CYbHhxmhcgetu4H84aH18XVaAlztRET1W0AQeEoRJLrEoCt/PSYXWpgImNQW6R/0dg35
	7/fBvf7N02MzPedtFeij+93MnHC8bYr34q9sfl/8k0YmvI2mT9znAUPwJmMULTEQ6p6v10tsQNu3f
	MciPmhXCb5WgUBIuMKna8qfIYS4u1hUNCPvdDo/l0WgYW+bo88CX2bFGW4EvbIQ5Ojau35EQpUd8I
	PJkf57BPqWsIryVH15357lQWPm4eq7TakkPFVvz+gRjxqKMoG4cpk5J+3pjSzWGuuxABFkTvEO+PQ
	XeUByD5RMoTeFD+/MohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2GBG-00000004zBs-2Lku;
	Mon, 16 Mar 2026 22:12:58 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2GBD-00000004zAR-1BD4
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 22:12:57 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b8d7f22d405so651855566b.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 15:12:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773699172; cv=none;
        d=google.com; s=arc-20240605;
        b=enK+UX38Voz42qJEaQuBVfC+HG4X2KkvoYmnMuUeaxH9RGBPlB+BVVvjKMIjajXFZL
         AowowIWvCKOAmtWgfQ+vH2j1/vwW8sq7e4rXCuG+pxVtd9QRlXQRa1T9M8VTORw8xEor
         RBk4Ti/gzSOONO5geocZGA4BZV4auzVaa2m/rZslXsRi0J3hWsm7eupTfLgJ1fVDjzB0
         hUn5crD3EXVQzxvohuc59gVDtkQVQZs4ixCgCbMMpRqqZQq3uKIx+t1wPdZmF4KE8RKY
         YKz25wUUyzgkygPG/PPEpUfacO60fX3pfYrCWhuDElQfKO7jStoBZxo+YIa8z3O68Kqf
         WUkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pAPcwDRyDaYRxv6m5ec0p6vencyIfyK+pU3obaup7wA=;
        fh=I6Wt+GuqRPPeQtreTIuuvzrZsCBnA25vWR1NC6wimo0=;
        b=R8iFLDnpuQQ0CyPBm39ZdUi3jxEmFfiwp5O0B6BLdoMfrKDbwpHmDU1GeEUvDhAlBj
         yjD6YLiJ68lgLbYsu8f1Y/82AtIZ8jPKxzNf/y3IKeApRVvqwrBB0s5/U/k2+A/NbZ+f
         QoXsYdqWLPS0tb273mvwa/A3z2Br7G3/oVD7HxXXztSF9ot20mXnQVH3c67bcAq5DPRP
         UXa8s61Vm6nAJQrIKb/MbUczyynvOtJw7hACysCQzXr3IQgJxyT/yw7u1FQlSGDyZuRC
         tBzTc7OctyV/s/wwWyHQN75NsVZy4yeHizl1VEXiJ/uRLaqCeyYbbv2ktzu7TC1UJBLy
         1nyA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773699172; x=1774303972; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAPcwDRyDaYRxv6m5ec0p6vencyIfyK+pU3obaup7wA=;
        b=T73uDZ4Z5G09U44ABj0hvRpOVldLB+MMguafZX7PeHaOo8NY5NzSHv5slVkUrSrIE/
         Q5oYC3j+LxGOUitWyvhESWjG9x5Mh2yk/kY0MdbngytZ2+KpgS7V7q9kSo2UAYhZRJQO
         mMk+DreM6sDg1W/9fLiXBwv2CLuls8rGucIBe9djHyEJMvrqy2MQghwpPAmYrNsUawFl
         5OQxDSVyg2XdtVZ/1Idl2fEXrYT64StCI+C14OfT1Y1Jmc2FSDtEggSDEc/hJm8GoPLG
         rV+hMmXp4DGrOF3dFA7m591NoAISZhnrWDVzEziiuhtGu6ZsyaedyW/q1EFvS7JgRRQV
         h7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773699172; x=1774303972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pAPcwDRyDaYRxv6m5ec0p6vencyIfyK+pU3obaup7wA=;
        b=B6gykhgNVs+KiZenA84BUKO6iFllhnOjRS27CBKwyUme0BcmRJx8OdMOK6Dm85HJYr
         gu7nPs+O4YA9+gX6PyUfNM6Tb6Ug7yY1COEhlfaV+NblqAmeHL5vdHEOK+QKB8T7e2jx
         0Of/vZ3KHx6g1BAf9jHnzhiWeWJT+nALsm8xDKem8FQ+N8QaGiD7eqBq6Zo3kAGkaBrQ
         F5hayTKFv4umd4W3dDJtTExefnYNZ0+AuZTijlJmhdV+99gDzBMjVxabS1UbQXP6qGj2
         2jdaC0pbmxj744k12YogTOEsIaeNpaHfcQKRWMsUMxmLpplZXL3NAf91f2zo/1pelQuC
         Do9A==
X-Forwarded-Encrypted: i=1; AJvYcCUMSta9ERqQ0TTLufiKZgt9HJyHgMIH0YXsjqDgNIZNAFMcvAEszKiXrMcJTILpIEInLnqMv1Ij7Ua2tQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzTQTM/XHCoV1/SCGSU11XFCWGzlriZlhLvoZ8IJgIMx36A4pg
	RfpN7KVKbOJSOScEvMrPwfHut0MH/+0ANXKwizIzhIPsXlU1yrNsbK8T6kZ6gK76aihNc/k6zJ2
	Q1jK2KxEUdeu0+/lp81WnjJrJnhexkS8=
X-Gm-Gg: ATEYQzwL2RH/EgIckHTruj+SG3OJXwfDEgZsLJOCvmx/MvBQfvAbR23HhVSEHQMC0cx
	6uGykPqvmgJ0DwKhLoZU7OztJQrEDvLDVZX8+s4iKy7gNOk5l1SGgV6BpVkWkYAfHGhBO4FS32L
	sbvFAB/I35WZS2MjuggIepEs1nKexOzm/szMagDNARUrSgyZ9Luyas7+qHAXXTvcnBMD3/kxDRJ
	wLFEjWIJDE22RsRDfU+kZb3u8ssmul9C7mO7yJfk73+qoUqERJOnLN605dhIxNzvRv/3vdElY6O
	gmKh3WD8rhyAhsFVDAkskXyvLf4o7iWsY7pbJlvu
X-Received: by 2002:a17:907:1c0b:b0:b97:b515:31e with SMTP id
 a640c23a62f3a-b97b51509acmr346111966b.50.1773699172087; Mon, 16 Mar 2026
 15:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260311070416.972667-1-hch@lst.de> <20260311070416.972667-11-hch@lst.de>
In-Reply-To: <20260311070416.972667-11-hch@lst.de>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 16 Mar 2026 23:12:39 +0100
X-Gm-Features: AaiRm53MOL-S4iIRiZrnVZNNZCm-cfe6kMQGe2L4WL9TC_xpq_akeJ994p2lXMA
Message-ID: <CA+=Fv5QkJm8+ysx8W=ypr84oSR=rrikfk-iMMU6_xrtS1PsWvg@mail.gmail.com>
Subject: Re: [PATCH 10/27] alpha: move the XOR code to lib/raid/
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Dan Williams <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, 
	Arnd Bergmann <arnd@arndb.de>, Song Liu <song@kernel.org>, Yu Kuai <yukuai@fnnas.com>, 
	Li Nan <linan122@huawei.com>, "Theodore Ts'o" <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-raid@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_151255_352874_09611A65 
X-CRM114-Status: GOOD (  15.53  )
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

T24gV2VkLCBNYXIgMTEsIDIwMjYgYXQgODowNuKAr0FNIENocmlzdG9waCBIZWxsd2lnIDxoY2hA
bHN0LmRlPiB3cm90ZToKPgo+IE1vdmUgdGhlIG9wdGltaXplZCBYT1IgY29kZSBvdXQgb2YgbGlu
ZSBpbnRvIGxpYi9yYWlkLgo+Cj4gTm90ZSB0aGF0IHRoZSBnaWFudCBpbmxpbmUgYXNzZW1ibHkg
YmxvY2sgbWlnaHQgYmUgYmV0dGVyIG9mZiBhcyBhCj4gc2VwYXJhdGUgYXNzZW1ibHkgc291cmNl
IGZpbGUgbm93LCBidXQgSSdsbCBsZWF2ZSB0aGF0IHRvIHRoZSBhbHBoYQo+IG1haW50YWluZXJz
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0t
Cj4gIGFyY2gvYWxwaGEvaW5jbHVkZS9hc20veG9yLmggfCA4NTMgKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KPiAgbGliL3JhaWQveG9yL01ha2VmaWxlICAgICAgICB8ICAgMiAr
Cj4gIGxpYi9yYWlkL3hvci9hbHBoYS94b3IuYyAgICAgfCA4NDkgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDg1NSBpbnNlcnRpb25zKCspLCA4
NDkgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIvcmFpZC94b3IvYWxwaGEv
eG9yLmMKPgoKSGksCgpJIGFwcGxpZWQgdGhpcyBwYXRjaCBhbmQgcmFuIGl0IG9uIG15IFVQMjAw
MCsKClRoZSBrZXJuZWwgYnVpbGRzIGFuZCBib290cywgYW5kIEkgdmVyaWZpZWQgdGhlIG5ldyBs
aWIvcmFpZC94b3IvYWxwaGEKaW1wbGVtZW50YXRpb24gdXNpbmcgdGhlIFhPUiBLVW5pdCB0ZXN0
LCB0aGUgdGVzdCBwYXNzZWQsIHNlZSBiZWxvdzoKClsgICAyNS43MDUwNjRdICAgICBLVEFQIHZl
cnNpb24gMQpbICAgMjUuNzA1MDY0XSAgICAgIyBTdWJ0ZXN0OiB4b3IKWyAgIDI1LjcwNTA2NF0g
ICAgICMgbW9kdWxlOiB4b3Jfa3VuaXQKWyAgIDI1LjcwNTA2NF0gICAgIDEuLjEKWyAgIDI4Ljk1
Nzk5Ml0gICAgICMgeG9yX3Rlc3Q6IFRlc3Qgc2hvdWxkIGJlIG1hcmtlZCBzbG93IChydW50aW1l
OgozLjI1MzQxMzMzMHMpClsgICAyOC45NTg5NjldICAgICBvayAxIHhvcl90ZXN0CgpBY2tlZC1i
eTogTWFnbnVzIExpbmRob2xtIDxsaW5tYWc3QGdtYWlsLmNvbT4KVGVzdGVkLWJ5OiBNYWdudXMg
TGluZGhvbG0gPGxpbm1hZzdAZ21haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
