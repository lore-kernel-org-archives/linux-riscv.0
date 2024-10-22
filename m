Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1833DD1CDCB
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 10:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FY02xuTRfbluwPxvMlZsYFL82camsQNoGMGw74okd6k=; b=BDlZrGu3YLYSMv
	feQQy3VPgNBUkGxaEjfe6ldvTUdJKdejF3O6QphfOx+bp9SFSuuWFp75WcM+na8kadtnwJK/U0u3+
	3oh8eUxELitspsvvDeIUayvjDiBcgPUQ9aOHwO+DlqURAmenHJ11SF05HUGTFpKJVikvioOIC2NdM
	A7n4RDAtyc5NTB+goBWXfiHExT4xiYHBZ2+WsmHN2cOP6BTmCpe8+HaWO51R4frscPyKxCgImijur
	NDA0t8/oCqXdf9SPbZaSfHoGcdpa/D2oo/ZJfPQ7Ha6Hw9GrcBOmIu3mAAgXberQpk4F/OI4XuT0p
	2ON2lAscqIb6uP/EEHbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Bvf-0000000AUrx-2WQs;
	Tue, 22 Oct 2024 10:15:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Bb5-0000000ARQp-2E6C
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 09:54:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729590878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4iA6unl5xijJh4qR1Q2AAd/utL7Z7NPFC4bwLLUzjEQ=;
	b=VfDKF4ttxsEiR5DraRuHMny/UG1UF4+PM/cNwKpvkQEqEsgMZX6V/DsuRYoeVCYKTuyLb6
	UhOE7UtYjcX2MH6Z6EmBP9mYnKqMQy/fFEE5tvE1QRTsuRxPUeS+Qg+u/3gMIYLXzrY8+B
	L4rvxDgZwfdh6P8Ouop70RT5d0Xuh/g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-3RfXyCFsO4enPMsKtv-mLg-1; Tue, 22 Oct 2024 05:54:35 -0400
X-MC-Unique: 3RfXyCFsO4enPMsKtv-mLg-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-37d589138a9so2980218f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 22 Oct 2024 02:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729590874; x=1730195674;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nI1J080gJIk57nqPokRMkIaqBAiA6XyP9b3WtLdFdmw=;
        b=FOkLxo+jYlI4avw1J/hFeSwzevxqxdjvbg7FhDEbp/D2D/momAefXYNX+nP0zHG71d
         ko/1PSTaK6VTnAA4NrSw9KGwOR4V7zSwalZPijCkeuM3gAK0GbIg/BmoMhnuyWI7fmiR
         OzOH7AUt4Biu99krCHQVSGTP7Izvk/FkkaDpqfOppZJmWSTTEzAsoStYBFh2fdG/jmLb
         a2EtKhzyJ9CnfjS5g4U5L/4C+14jw0JqWHI3BMuNQAvCkmMXl7PoM6vjZau2at++3uFA
         R2ZUCjAnUpF4c+xA7aLll0/UK/C0Lm4FEV9EzDuxFe64CCpRUp1egNJm+dzC9muO8fTg
         sLZA==
X-Forwarded-Encrypted: i=1; AJvYcCUbzCwyFfmsKZYqdSilRZnjcFSVUxZY7swtBDq7vG/FFsct1m1T2WQKLp/NyQhYz+L1pJ4gBJsKwp9AmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKeGu8DFDzKKNy8m+G20dMyAn6XRDwjRSv7sfe3ZZyHRk45/Fq
	dP338W7gUJT05kmB5WWatVJRt+SuQLYBr48tN2xk2MFWGMu79XsjZrfzUQ1ZLn49CviJoEHOn1o
	C9IpVv9s7RNXZ7Jbuls2FxJkFUeGZ13LfdAxwDZOYtMcHYkzguyeyS4VKT59qyXM3vg==
X-Received: by 2002:a05:6000:1a52:b0:37d:53a7:a635 with SMTP id ffacd0b85a97d-37ebd3a30b4mr9041576f8f.51.1729590873989;
        Tue, 22 Oct 2024 02:54:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/MSC0f4a4ghBH8Njw0NZeddYxIlEatBvFumhTXQ8ieD1rzRQxbyN4pCWfCENi2prg9FrCzw==
X-Received: by 2002:a05:6000:1a52:b0:37d:53a7:a635 with SMTP id ffacd0b85a97d-37ebd3a30b4mr9041534f8f.51.1729590873489;
        Tue, 22 Oct 2024 02:54:33 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9bb66sm6197474f8f.95.2024.10.22.02.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 02:54:33 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 546B0160B2D1; Tue, 22 Oct 2024 11:54:32 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Puranjay Mohan <puranjay@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexei Starovoitov <ast@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Andrii Nakryiko <andrii@kernel.org>,
 bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, "David S.
 Miller" <davem@davemloft.net>, Eduard Zingerman <eddyz87@gmail.com>, Eric
 Dumazet <edumazet@google.com>, Hao Luo <haoluo@google.com>, Helge Deller
 <deller@gmx.de>, Jakub Kicinski <kuba@kernel.org>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Jiri Olsa <jolsa@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, Martin KaFai Lau <martin.lau@linux.dev>,
 Mykola Lysenko <mykolal@fb.com>, netdev@vger.kernel.org, Palmer Dabbelt
 <palmer@dabbelt.com>, Paolo Abeni <pabeni@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Puranjay Mohan <puranjay12@gmail.com>,
 Puranjay Mohan <puranjay@kernel.org>, Shuah Khan <shuah@kernel.org>, Song
 Liu <song@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Yonghong Song
 <yonghong.song@linux.dev>
Subject: Re: [PATCH bpf-next 2/5] bpf: bpf_csum_diff: optimize and
 homogenize for all archs
In-Reply-To: <20241021122112.101513-3-puranjay@kernel.org>
References: <20241021122112.101513-1-puranjay@kernel.org>
 <20241021122112.101513-3-puranjay@kernel.org>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 22 Oct 2024 11:54:32 +0200
Message-ID: <874j54iht3.fsf@toke.dk>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_025439_667315_8D68DCB1 
X-CRM114-Status: GOOD (  22.64  )
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

UHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5QGtlcm5lbC5vcmc+IHdyaXRlczoKCj4gMS4gT3B0aW1p
emF0aW9uCj4gICAgLS0tLS0tLS0tLS0tCj4KPiBUaGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBj
b3BpZXMgdGhlICdmcm9tJyBhbmQgJ3RvJyBidWZmZXJzIHRvIGEKPiBzY3JhdGNocGFkIGFuZCBp
dCB0YWtlcyB0aGUgYml0d2lzZSBOT1Qgb2YgJ2Zyb20nIGJ1ZmZlciB3aGlsZSBjb3B5aW5nLgo+
IEluIHRoZSBuZXh0IHN0ZXAgY3N1bV9wYXJ0aWFsKCkgaXMgY2FsbGVkIHdpdGggdGhpcyBzY3Jh
dGNocGFkLgo+Cj4gc28sIG1hdGhlbWF0aWNhbGx5LCB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlv
biBpcyBkb2luZzoKPgo+IAlyZXN1bHQgPSBjc3VtKHRvIC0gZnJvbSkKPgo+IEhlcmUsICd0bycg
IGFuZCAnfiBmcm9tJyBhcmUgY29waWVkIGluIHRvIHRoZSBzY3JhdGNocGFkIGJ1ZmZlciwgd2Ug
bmVlZAo+IGl0IGluIHRoZSBzY3JhdGNocGFkIGJ1ZmZlciBiZWNhdXNlIGNzdW1fcGFydGlhbCgp
IHRha2VzIGEgc2luZ2xlCj4gY29udGlndW91cyBidWZmZXIgYW5kIG5vdCB0d28gZGlzam9pbnQg
YnVmZmVycyBsaWtlICd0bycgYW5kICdmcm9tJy4KPgo+IFdlIGNhbiByZSB3cml0ZSB0aGlzIGVx
dWF0aW9uIHRvOgo+Cj4gCXJlc3VsdCA9IGNzdW0odG8pIC0gY3N1bShmcm9tKQo+Cj4gdXNpbmcg
dGhlIGRpc3RyaWJ1dGl2ZSBwcm9wZXJ0eSBvZiBjc3VtKCkuCj4KPiB0aGlzIGFsbG93cyAndG8n
IGFuZCAnZnJvbScgdG8gYmUgYXQgZGlmZmVyZW50IGxvY2F0aW9ucyBhbmQgdGhlcmVmb3JlCj4g
dGhpcyBzY3JhdGNocGFkIGFuZCBjb3B5aW5nIGlzIG5vdCBuZWVkZWQuCj4KPiBUaGlzIGluIEMg
Y29kZSB3aWxsIGxvb2sgbGlrZToKPgo+IHJlc3VsdCA9IGNzdW1fc3ViKGNzdW1fcGFydGlhbCh0
bywgdG9fc2l6ZSwgc2VlZCksCj4gICAgICAgICAgICAgICAgICAgY3N1bV9wYXJ0aWFsKGZyb20s
IGZyb21fc2l6ZSwgMCkpOwo+Cj4gMi4gSG9tb2dlbml6YXRpb24KPiAgICAtLS0tLS0tLS0tLS0t
LQo+Cj4gVGhlIGJwZl9jc3VtX2RpZmYoKSBoZWxwZXIgY2FsbHMgY3N1bV9wYXJ0aWFsKCkgd2hp
Y2ggaXMgaW1wbGVtZW50ZWQgYnkKPiBzb21lIGFyY2hpdGVjdHVyZXMgbGlrZSBhcm0gYW5kIHg4
NiBidXQgb3RoZXIgYXJjaGl0ZWN0dXJlcyByZWx5IG9uIHRoZQo+IGdlbmVyaWMgaW1wbGVtZW50
YXRpb24gaW4gbGliL2NoZWNrc3VtLmMKPgo+IFRoZSBnZW5lcmljIGltcGxlbWVudGF0aW9uIGlu
IGxpYi9jaGVja3N1bS5jIHJldHVybnMgYSAxNiBiaXQgdmFsdWUgYnV0Cj4gdGhlIGFyY2ggc3Bl
Y2lmaWMgaW1wbGVtZW50YXRpb25zIGNhbiByZXR1cm4gbW9yZSB0aGFuIDE2IGJpdHMsIHRoaXMK
PiB3b3JrcyBvdXQgaW4gbW9zdCBwbGFjZXMgYmVjYXVzZSBiZWZvcmUgdGhlIHJlc3VsdCBpcyB1
c2VkLCBpdCBpcyBwYXNzZWQKPiB0aHJvdWdoIGNzdW1fZm9sZCgpIHRoYXQgdHVybnMgaXQgaW50
byBhIDE2LWJpdCB2YWx1ZS4KPgo+IGJwZl9jc3VtX2RpZmYoKSBkaXJlY3RseSByZXR1cm5zIHRo
ZSB2YWx1ZSBmcm9tIGNzdW1fcGFydGlhbCgpIGFuZAo+IHRoZXJlZm9yZSB0aGUgcmV0dXJuZWQg
dmFsdWVzIGNvdWxkIGJlIGRpZmZlcmVudCBvbiBkaWZmZXJlbnQKPiBhcmNoaXRlY3R1cmVzLiBz
ZWUgZGlzY3Vzc2lvbiBpbiBbMV06Cj4KPiBmb3IgdGhlIGludCB2YWx1ZSAyOCB0aGUgY2FsY3Vs
YXRlZCBjaGVja3N1bXMgYXJlOgo+Cj4geDg2ICAgICAgICAgICAgICAgICAgICA6ICAgIC0yOSA6
IDB4ZmZmZmZmZTMKPiBnZW5lcmljIChhcm02NCwgcmlzY3YpIDogIDY1NTA3IDogMHgwMDAwZmZl
Mwo+IGFybSAgICAgICAgICAgICAgICAgICAgOiAxMzEwNDIgOiAweDAwMDFmZmUyCj4KPiBQYXNz
IHRoZSByZXN1bHQgb2YgYnBmX2NzdW1fZGlmZigpIHRocm91Z2ggZnJvbTMydG8xNigpIGJlZm9y
ZSByZXR1cm5pbmcKPiB0byBob21vZ2VuaXplIHRoaXMgcmVzdWx0IGZvciBhbGwgYXJjaGl0ZWN0
dXJlcy4KPgo+IE5PVEU6IGZyb20zMnRvMTYoKSBpcyB1c2VkIGluc3RlYWQgb2YgY3N1bV9mb2xk
KCkgYmVjYXVzZSBjc3VtX2ZvbGQoKQo+IGRvZXMgZnJvbTMydG8xNigpICsgYml0d2lzZSBOT1Qg
b2YgdGhlIHJlc3VsdCwgd2hpY2ggaXMgbm90IHdoYXQgd2Ugd2FudAo+IHRvIGRvIGhlcmUuCj4K
PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnBmL0NBSitIZk5pUWJPY3FDTHhGVVAyRk1t
NVFyTFhVVWFqODUyRnhlM2huXzJKTml1Y242Z0BtYWlsLmdtYWlsLmNvbS8KPgo+IFNpZ25lZC1v
ZmYtYnk6IFB1cmFuamF5IE1vaGFuIDxwdXJhbmpheUBrZXJuZWwub3JnPgoKUHJldHR5IG5lYXQg
c2ltcGxpZmljYXRpb24gOikKClJldmlld2VkLWJ5OiBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4g
PHRva2VAcmVkaGF0LmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
