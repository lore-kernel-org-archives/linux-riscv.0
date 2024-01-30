Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB0EC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 21:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RarzA/29RwnRx3ppA5Z9cp1FACCXGQshftfSka3Zyto=; b=tY0r7Rzwu9ODXt
	/E7A/e12MrECsFVBIJOE51SwTq/Y9oRumtpJ45ukBujMKwUNKTa3Sq0pkkSNqIzmX0b/p754gj8jD
	4PbEptx7cgM/fbDGQfiI5DoKTc+as/FJTv0jgSTuDG/OBKOqbxoka3PyZkM8j6lt6PMf4vRv4lxuS
	/El0+QiUxlSh/Nq1frGFRhc5nsCbWkNbtmb2TjUFQrHVsoGh+MTGCUTUUREaDlpRjMZ81BV40LQau
	VY7+oT6Y0gqUCXsbTS3eUjqQzt958fPKEIZrOc9rKftDnXZ776adTAGMSgYObjmJ9i4JxKX6pYpuT
	iucTogtsJ/ruDQMnZTDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUvpE-00000000dIz-0mdq;
	Tue, 30 Jan 2024 21:39:24 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUvpB-00000000dIc-2WB7
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 21:39:22 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-4bd7614325eso172175e0c.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 13:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706650759; x=1707255559; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CgZ5XCS3YrIa4j32+QK1bhbU4hAMl5Z8tCr8NP1xm6Q=;
        b=dEhlPNaCAJN18xNi3YnDEazrQwvlGF/h0eQiC5MvqowXb0VE++zZOSjO0USeVAyGPg
         jOuDCL/6mE8JtWeST+s1STF6rObHjNZFsZ+aNQzt0ZmBSdVobPJecv59WCzWaWXYg14U
         MK+aou838p4ptdUYXCCjpofa3E8bWqeIwbfY9OP9o09UQqDiN9GKxDoDNN6EYMfEFdqo
         pZo+WR5B1/kXQvhhFuMkB2q6GrVv5mTgVyAGNt0oA2E1BqqwFQWImRF8eZaEkT8JRKl2
         b2NzeK5usd3FnX8WoH6XIfZojR6xsLTPZShI8WlSkoCLFOo1Aj5DR8HBmGmE0up78kQb
         S23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706650759; x=1707255559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CgZ5XCS3YrIa4j32+QK1bhbU4hAMl5Z8tCr8NP1xm6Q=;
        b=jPE8tb74OGJHkCzeR7gCfSgaf/wimqWaJp6VpEyzeGmKegBPf0AsEmJK34SRyTVZD/
         owWd7PsqEn2ovjDMPubupKm1Bm6Lk0F0+x1sKZbRlTIwlODCOwhf4XRYgkE/D87DJWqv
         MBPulgAgvk7+RPWE8PsC0xNYlZFyarJuWB4fq21GtNpK8zaQ0J+7mhND0T8JxRjG2Pps
         JqKAIHxMMUnncOmkaY4u4pU1WO8+q2i9C5tX7BXceCrMnJD9d4/M7ZUyv430P8VPooTz
         4WxfMtxSzGwGuAm191Bgo6Hc3EDZQcr762dGK4OeIj39Mwfo3Iua7gbq9YPn6BcQXkgc
         zc8Q==
X-Gm-Message-State: AOJu0YwfQJZdFPeOWjdbmr7ES8poeHpg/MszKpdC+7QmFLxyyZfCH3zH
	zeVuPMhlCboP0Prxsmgx+LQbrR1HOM7lRU0caM+TANQxVk6GpZjrv7teiv/85Np4K+0z/sfPXFl
	fw1NKhvbdAmvsISruuT/abJ2mJes=
X-Google-Smtp-Source: AGHT+IE7dhlxFO+nFq6g8kY40nYD0HDfK/dJkZ5LwGn7nPoWrxbMVe5jJbFmeAqCKUNuhYWJhNqf7aRv0zgZHvlaZPA=
X-Received: by 2002:a05:6122:178d:b0:4b9:e8bd:3b2 with SMTP id
 o13-20020a056122178d00b004b9e8bd03b2mr1291986vkf.2.1706650759373; Tue, 30 Jan
 2024 13:39:19 -0800 (PST)
MIME-Version: 1.0
References: <20240117140333.2479667-1-vincent.chen@sifive.com>
 <CA+V-a8uDyY7bT4t8XRRVuTiMceiLtWpHTwEM6M_o_FgJOd4P0A@mail.gmail.com> <CAHVXubgJ+j78fwDyy44tz38sfH=aN-eBZypQmXpAbgKsrtTn0A@mail.gmail.com>
In-Reply-To: <CAHVXubgJ+j78fwDyy44tz38sfH=aN-eBZypQmXpAbgKsrtTn0A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 30 Jan 2024 21:38:53 +0000
Message-ID: <CA+V-a8vTxD1gcDP9Yf1-sBMvaAKnVz69xgeh-6Np+P-WEGcu5A@mail.gmail.com>
Subject: Re: [v6 PATCH] riscv: mm: execute local TLB flush after populating vmemmap
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Vincent Chen <vincent.chen@sifive.com>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_133921_661225_DD469EAF 
X-CRM114-Status: GOOD (  24.27  )
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

SGkgQWxleGFuZHJlLAoKT24gVHVlLCBKYW4gMzAsIDIwMjQgYXQgMTA6NTnigK9BTSBBbGV4YW5k
cmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gSGkgUHJhYmhha2Fy
LAo+Cj4gT24gVHVlLCBKYW4gMzAsIDIwMjQgYXQgMTA6NTnigK9BTSBMYWQsIFByYWJoYWthcgo+
IDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgVmluY2VudCwK
PiA+Cj4gPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KPiA+Cj4gPiBPbiBXZWQsIEphbiAxNywg
MjAyNCBhdCAyOjA34oCvUE0gVmluY2VudCBDaGVuIDx2aW5jZW50LmNoZW5Ac2lmaXZlLmNvbT4g
d3JvdGU6Cj4gPiA+Cj4gPiA+IFRoZSBzcGFyZV9pbml0KCkgY2FsbHMgbWVtbWFwX3BvcHVsYXRl
KCkgbWFueSB0aW1lcyB0byBjcmVhdGUgVkEgdG8gUEEKPiA+ID4gbWFwcGluZyBmb3IgdGhlIFZN
RU1NQVAgYXJlYSwgd2hlcmUgYWxsICJzdHJ1Y3QgcGFnZSIgYXJlIGxvY2F0ZWQgb25jZQo+ID4g
PiBDT05GSUdfU1BBUlNFTUVNX1ZNRU1NQVAgaXMgZGVmaW5lZC4gVGhlc2UgInN0cnVjdCBwYWdl
IiBhcmUgbGF0ZXIKPiA+ID4gaW5pdGlhbGl6ZWQgaW4gdGhlIHpvbmVfc2l6ZXNfaW5pdCgpIGZ1
bmN0aW9uLiBIb3dldmVyLCBkdXJpbmcgdGhpcwo+ID4gPiBwcm9jZXNzLCBubyBzZmVuY2Uudm1h
IGluc3RydWN0aW9uIGlzIGV4ZWN1dGVkIGZvciB0aGlzIFZNRU1NQVAgYXJlYS4KPiA+ID4gVGhp
cyBvbWlzc2lvbiBtYXkgY2F1c2UgdGhlIGhhcnQgdG8gZmFpbCB0byBwZXJmb3JtIHBhZ2UgdGFi
bGUgd2Fsawo+ID4gPiBiZWNhdXNlIHNvbWUgZGF0YSByZWxhdGVkIHRvIHRoZSBhZGRyZXNzIHRy
YW5zbGF0aW9uIGlzIGludmlzaWJsZSB0byB0aGUKPiA+ID4gaGFydC4gVG8gc29sdmUgdGhpcyBp
c3N1ZSwgdGhlIGxvY2FsX2ZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UoKSBpcyBjYWxsZWQKPiA+ID4g
cmlnaHQgYWZ0ZXIgdGhlIHNwYXJzZV9pbml0KCkgdG8gZXhlY3V0ZSBhIHNmZW5jZS52bWEgaW5z
dHJ1Y3Rpb24gZm9yIHRoaXMKPiA+ID4gVk1FTU1BUCBhcmVhLCBlbnN1cmluZyB0aGF0IGFsbCBk
YXRhIHJlbGF0ZWQgdG8gdGhlIGFkZHJlc3MgdHJhbnNsYXRpb24KPiA+ID4gaXMgdmlzaWJsZSB0
byB0aGUgaGFydC4KPiA+ID4KPiA+ID4gRml4ZXM6IGQ5NWYxYTU0MmMzZCAoIlJJU0MtVjogSW1w
bGVtZW50IHNwYXJzZW1lbSIpCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgQ2hlbiA8dmlu
Y2VudC5jaGVuQHNpZml2ZS5jb20+Cj4gPiA+IFJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkg
PGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS90bGJmbHVzaC5oIHwgMiArKwo+ID4gPiAgYXJjaC9yaXNjdi9tbS9pbml0LmMgICAg
ICAgICAgICAgIHwgNSArKysrKwo+ID4gPiAgYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jICAgICAg
ICAgIHwgNiArKysrKysKPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQo+
ID4gPgo+ID4gSSBnZXQgYmVsb3cgYnVpbGQgaXNzdWUgd2l0aCB0aGlzIHBhdGNoIGFwcGxpZWQ6
Cj4gPgo+ID4gYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jOjIwNzo2OiBlcnJvcjogcmVkZWZpbml0
aW9uIG9mCj4gPiAnbG9jYWxfZmx1c2hfdGxiX2tlcm5lbF9yYW5nZScKPiA+ICAgMjA3IHwgdm9p
ZCBsb2NhbF9mbHVzaF90bGJfa2VybmVsX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4gPiB1
bnNpZ25lZCBsb25nIGVuZCkKPiA+ICAgICAgIHwgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+Cj4gPiBhcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmM6Njk6Njogbm90ZTogcHJldmlvdXMg
ZGVmaW5pdGlvbiBvZgo+ID4gJ2xvY2FsX2ZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UnIHdpdGggdHlw
ZSAndm9pZChsb25nIHVuc2lnbmVkIGludCwKPiA+IGxvbmcgdW5zaWduZWQgaW50KScKPiA+ICAg
IDY5IHwgdm9pZCBsb2NhbF9mbHVzaF90bGJfa2VybmVsX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3Rh
cnQsCj4gPiB1bnNpZ25lZCBsb25nIGVuZCkKPiA+ICAgICAgIHwgICAgICBefn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+Cj4gPiBtYWtlWzRdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6
MjQzOiBhcmNoL3Jpc2N2L21tL3RsYmZsdXNoLm9dIEVycm9yIDEKPiA+IG1ha2VbNF06ICoqKiBX
YWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCj4gPiAgIENDICAgICAga2VybmVsL3Jlc291
cmNlLm8KPiA+IG1ha2VbM106ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo0ODE6IGFyY2gv
cmlzY3YvbW1dIEVycm9yIDIKPiA+IG1ha2VbM106ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVk
IGpvYnMuLi4uCj4gPgo+ID4gSSBoYXZlIGF0dGFjaGVkIHRoZSBkZWZjb25maWcgZmlsZS4KPiA+
Cj4KPiBJbmRlZWQsIHdlIHJlY2VudGx5IGFkZGVkIHRoZSBzYW1lIGZ1bmN0aW9uLCB5b3UgY2Fu
IGZpbmQgYSByZWJhc2VkCj4gdmVyc2lvbiBvZiB0aGlzIHBhdGNoIG9uIHRvcCBvZiA2LjggaGVy
ZToKPiBodHRwczovL2dpdGh1Yi5jb20vQWxleEdoaXRpL2xpbnV4LXJpc2N2L2NvbW1pdC83NTZk
MTg3MWY1OGVkYWM0NTU3NzNkYjBiYjk5NmY4ZDA2NGE2YjA2Cj4KVGhhbmtzIGZvciB0aGUgcG9p
bnRlci4KCkNoZWVycywKUHJhYmhha2FyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
