Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3896CD11C2
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 14:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZhuzi3UflAiyhdu/iuXabDYq++3TLnr3Iy4djCSPBk=; b=cWo0uNK2Kp+RmL
	R5a0Ji4Ryd7T9Vk8hyzUyO56flbr47g21D9CDoa4SFfYKLS5YLHpPVwmJGLCK4uHmHG1NEiQZQbxE
	Y3U3tTtORRRlcgy+llN8cGRMn/BbCAXVBvJZkrtsoNJw0mtFsLQRSlzkZTXLJ11NcZIhEvZTs6IEv
	vzxFXLa4JsuSDCu+fPiTiUMX8/0p13ySVuB+O+mMQO26uzSjJ9nniwpiyGx4K/BKwBzcOER8/5FTX
	qFKU4OWBza7TQkUqqQ2Oob6kuS0hz2smBBJDmAPXRaX/COU7ZXQ++niTYuUXBu2aJszXJQ6ys2mYM
	wVeXNq1bO9Py316igjnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rskdW-00000007UIP-2xYS;
	Fri, 05 Apr 2024 14:33:46 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rskdS-00000007UDJ-2lHx
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 14:33:44 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-343e7c20686so485346f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Apr 2024 07:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712327617; x=1712932417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XE7bBtXjTLLxuBkd0cUQ4f+BnesVFs7jpuSpsklKO2U=;
        b=X/jF/F+oiQqnd5Gg3BMyvHN2udx31OTLsH6YmDF4ClMBNbE3v4xJzW87H3m+0J/91l
         T9fhtN185x6Pf+EwgI/N2j/6vkvHsrXaVC3ezuBCx1WA1tk11Zflf3hsZ0hLixJP7UrH
         ERG3DuEhFvqCfnCYiONPOWB0xRaYu7jRJIwU5lsDRAOrM9sLhfFSddb3YoDh08ZOKhyd
         ws4Pez6yBqUmqkPAThQ1gaRyc54+/B8I/X56aGrtuIm+GX6VpkUxDamIm8ixXgeaTh5e
         ztTzeZM6IF2N+GzTdwY2LGsUINSF42I43FhgaKhL8KKgK91GjKVl7kdUeObcJF6W1oi5
         U8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712327617; x=1712932417;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XE7bBtXjTLLxuBkd0cUQ4f+BnesVFs7jpuSpsklKO2U=;
        b=U8LGVKeoEywUEYZGRzyQHMtnkSt0l3FkYCs+AqNw+mUuMz1MROcDw7nCAjL65Jm2b/
         eh08WFi3i/PwJxiFX8jcewAwpfJDik+fdQNz1q+Zjr7kWEw+3g9saVXnzdzNZtKSLGef
         LwgwIgggCitJJpsZVrDJB1YvvLErbW5rPew1Id+yueHphGsRnIFk7/8U+qNJWz++7Rmu
         mQqvTrQCLq5eDk3iR/W38rW8obuNkKkmu1XKuSz1+psvM1ZQx9iz81jMLlLm6zanooaF
         AvZYSk7IEiknFETeA3RCer273YrfPaPUZ4HJu4QmRR3emSfCb6d6AebwYYku4MrAvQ77
         OqPg==
X-Forwarded-Encrypted: i=1; AJvYcCWFRCioAQT2eeL1HtECzDKtIKS6IAJ2AYQu26thQAAPCEVtp4Fa2jH8L3OnagdLz3/HDrNqM7ppe37sj3I5DVLst+JCDPjaLm2Lsig7Dy+G
X-Gm-Message-State: AOJu0Yw0ZD6X7iJrnilmfX4Gdmm1Y41Ef7CwS65VEkERNISyGiCUs+X1
	erbhlvNQFqXFMxh1ltZfASKWA7zWPpT4kcwNH1ozTrkKvs3qpqQDzCXjrB3WjMwRy83t
X-Google-Smtp-Source: AGHT+IEZHLxAivag9esAnrX7FyCLYw7AgXgDUqm69jkpKf7pmtQeCzm4iQJH8oEUjk/4um4e6tEGng==
X-Received: by 2002:a05:6000:229:b0:343:968e:f27c with SMTP id l9-20020a056000022900b00343968ef27cmr1223599wrz.27.1712327617094;
        Fri, 05 Apr 2024 07:33:37 -0700 (PDT)
Received: from localhost (54-240-197-231.amazon.com. [54.240.197.231])
        by smtp.gmail.com with ESMTPSA id d11-20020adff84b000000b0033e7a102cfesm2167143wrq.64.2024.04.05.07.33.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Apr 2024 07:33:36 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, "KP
 Singh" <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Pu Lehui
 <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next] riscv, bpf: add internal-only MOV instruction
 to resolve per-CPU addrs
In-Reply-To: <87wmpbnbce.fsf@all.your.base.are.belong.to.us>
References: <20240405124348.27644-1-puranjay12@gmail.com>
 <87wmpbnbce.fsf@all.your.base.are.belong.to.us>
Date: Fri, 05 Apr 2024 14:33:34 +0000
Message-ID: <mb61pjzlb98w1.fsf@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_073342_722152_58C26540 
X-CRM114-Status: GOOD (  21.12  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBQdXJhbmpheSBNb2hh
biA8cHVyYW5qYXkxMkBnbWFpbC5jb20+IHdyaXRlczoKPgo+PiBTdXBwb3J0IGFuIGluc3RydWN0
aW9uIGZvciByZXNvbHZpbmcgYWJzb2x1dGUgYWRkcmVzc2VzIG9mIHBlci1DUFUKPj4gZGF0YSBm
cm9tIHRoZWlyIHBlci1DUFUgb2Zmc2V0cy4gVGhpcyBpbnN0cnVjdGlvbiBpcyBpbnRlcm5hbC1v
bmx5IGFuZAo+PiB1c2VycyBhcmUgbm90IGFsbG93ZWQgdG8gdXNlIHRoZW0gZGlyZWN0bHkuIFRo
ZXkgd2lsbCBvbmx5IGJlIHVzZWQgZm9yCj4+IGludGVybmFsIGlubGluaW5nIG9wdGltaXphdGlv
bnMgZm9yIG5vdyBiZXR3ZWVuIEJQRiB2ZXJpZmllciBhbmQgQlBGCj4+IEpJVHMuCj4+Cj4+IFJJ
U0MtViB1c2VzIGdlbmVyaWMgcGVyLWNwdSBpbXBsZW1lbnRhdGlvbiB3aGVyZSB0aGUgb2Zmc2V0
cyBmb3IgQ1BVcwo+PiBhcmUga2VwdCBpbiBhbiBhcnJheSBjYWxsZWQgX19wZXJfY3B1X29mZnNl
dFtjcHVfbnVtYmVyXS4gUklTQ1Ygc3RvcmVzCj4+IHRoZSBhZGRyZXNzIG9mIHRoZSB0YXNrX3N0
cnVjdCBpbiBUUCByZWdpc3Rlci4gVGhlIGZpcnN0IGVsZW1lbnQgaW4KPj4gdGFzdF9zdHJ1Y3Qg
aXMgc3RydWN0IHRocmVhZF9pbmZvLCBhbmQgd2UgY2FuIGdldCB0aGUgY3B1IG51bWJlciBieQo+
ICAgICAgXgo+ICAgICAgayA7LSkKCkkgbmVlZCB0byBzdGFydCB1c2luZyBzb21lIGtpbmQgb2Yg
c3BlbGwtY2hlY2sgaW4gdmltIDpELgoKPj4gcmVhZGluZyBmcm9tIHRoZSBUUCByZWdpc3RlciAr
IG9mZnNldG9mKHN0cnVjdCB0aHJlYWRfaW5mbywgY3B1KS4KPj4KPj4gT25jZSB3ZSBoYXZlIHRo
ZSBjcHUgbnVtYmVyIGluIGEgcmVnaXN0ZXIgd2UgcmVhZCB0aGUgb2Zmc2V0IGZvciB0aGF0Cj4+
IGNwdSBmcm9tIGFkZHJlc3M6ICZfX3Blcl9jcHVfb2Zmc2V0ICsgY3B1X251bWJlciA8PCAzLiBU
aGVuIHdlIGFkZCB0aGlzCj4+IG9mZnNldCB0byB0aGUgZGVzdGluYXRpb24gcmVnaXN0ZXIuCj4K
PiBKdXN0IHRvIGNsYXJpZnkgZm9yIHJlYWRlcnM7IEJQRiBwcm9ncmFtcyBhcmUgcnVuIHdpdGgg
bWlncmF0ZSBkaXNhYmxlLAo+IHdoaWNoIG1lYW5zIHRoYXQgb24gUlQgd2UgY2FuIGJlIHByZWVt
cHRlZCwgd2hpY2ggbWVhbnMgdGhhdCBwZXItY3B1Cj4gb3BlcmF0aW9ucyBhcmUgdHJpY2tpZXIg
KGRpc2FibGluZyBpbnRlcnJ1cHRzL3ByZWVtcHRpb24pLgo+Cj4gSG93ZXZlciwgdGhpcyBCUEYg
aW5zdHJ1Y3Rpb24gaXMgYWJvdXQgY2FsY3VsYXRpbmcgdGhlIHBlci1jcHUgYWRkcmVzcywKPiBz
byB0aGUgbG9vayB1cCBjYW4gYmUgaW5saW5lZC4KPgo+IEl0J3Mgbm90IGEgcGVyLWNwdSAqb3Bl
cmF0aW9uKi4KCldpbGwgYWRkIHRoaXMgaW5mb3JtYXRpb24gdG8gdGhlIGNvbW1pdCBtZXNzYWdl
LgoKPj4gVG8gbWVhc3VyZSB0aGUgaW1wcm92ZW1lbnQgZnJvbSB0aGlzIGNoYW5nZSwgdGhlIGJl
bmNobWFyayBpbiBbMV0gd2FzCj4+IHVzZWQgb24gUWVtdToKPj4KPj4gQmVmb3JlOgo+PiBnbG9i
LWFyci1pbmMgICA6ICAgIDEuMTI3IMKxIDAuMDEzTS9zCj4+IGFyci1pbmMgICAgICAgIDogICAg
MS4xMjEgwrEgMC4wMDRNL3MKPj4gaGFzaC1pbmMgICAgICAgOiAgICAwLjY4MSDCsSAwLjA1Mk0v
cwo+Pgo+PiBBZnRlcjoKPj4gZ2xvYi1hcnItaW5jICAgOiAgICAxLjEzOCDCsSAwLjAxMU0vcwo+
PiBhcnItaW5jICAgICAgICA6ICAgIDEuMzY2IMKxIDAuMDA2TS9zCj4+IGhhc2gtaW5jICAgICAg
IDogICAgMC42NzYgwrEgMC4wMDFNL3MKPj4KPj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9hbmFr
cnlpa28vbGludXgvY29tbWl0LzhkZWM5MDA5NzVlZgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQdXJh
bmpheSBNb2hhbiA8cHVyYW5qYXkxMkBnbWFpbC5jb20+Cj4+IC0tLQo+PiAgYXJjaC9yaXNjdi9u
ZXQvYnBmX2ppdF9jb21wNjQuYyB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgMSBm
aWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5j
Cj4+IGluZGV4IDE1ZTQ4MmYyYzY1Ny4uZTk1YmQxZDQ1OWE0IDEwMDY0NAo+PiAtLS0gYS9hcmNo
L3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCj4+ICsrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9q
aXRfY29tcDY0LmMKPj4gQEAgLTEyLDYgKzEyLDcgQEAKPj4gICNpbmNsdWRlIDxsaW51eC9zdG9w
X21hY2hpbmUuaD4KPj4gICNpbmNsdWRlIDxhc20vcGF0Y2guaD4KPj4gICNpbmNsdWRlIDxhc20v
Y2ZpLmg+Cj4+ICsjaW5jbHVkZSA8YXNtL3BlcmNwdS5oPgo+PiAgI2luY2x1ZGUgImJwZl9qaXQu
aCIKPj4gIAo+PiAgI2RlZmluZSBSVl9GRU5UUllfTklOU05TIDIKPj4gQEAgLTEwODksNiArMTA5
MCwyNCBAQCBpbnQgYnBmX2ppdF9lbWl0X2luc24oY29uc3Qgc3RydWN0IGJwZl9pbnNuICppbnNu
LCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCwKPj4gIAkJCWVtaXRfb3IoUlZfUkVHX1QxLCBy
ZCwgUlZfUkVHX1QxLCBjdHgpOwo+PiAgCQkJZW1pdF9tdihyZCwgUlZfUkVHX1QxLCBjdHgpOwo+
PiAgCQkJYnJlYWs7Cj4+ICsJCX0gZWxzZSBpZiAoaW5zbl9pc19tb3ZfcGVyY3B1X2FkZHIoaW5z
bikpIHsKPj4gKwkJCWlmIChyZCAhPSBycykKPj4gKwkJCQllbWl0X212KHJkLCBycywgY3R4KTsK
Pj4gKyNpZmRlZiBDT05GSUdfU01QCj4+ICsJCQkJLyogTG9hZCBjdXJyZW50IENQVSBudW1iZXIg
aW4gVDEgKi8KPj4gKwkJCQllbWl0X2xkKFJWX1JFR19UMSwgb2Zmc2V0b2Yoc3RydWN0IHRocmVh
ZF9pbmZvLCBjcHUpLCBSVl9SRUdfVFAsCj4+ICsJCQkJCWN0eCk7Cj4+ICsJCQkJLyogPDwgMyBi
ZWNhdXNlIG9mZnNldHMgYXJlIDggYnl0ZXMgKi8KPj4gKwkJCQllbWl0X3NsbGkoUlZfUkVHX1Qx
LCBSVl9SRUdfVDEsIDMsIGN0eCk7Cj4+ICsJCQkJLyogTG9hZCBhZGRyZXNzIG9mIF9fcGVyX2Nw
dV9vZmZzZXQgYXJyYXkgaW4gVDIgKi8KPj4gKwkJCQllbWl0X2ltbShSVl9SRUdfVDIsICh1NjQp
Jl9fcGVyX2NwdV9vZmZzZXQsIGN0eCk7Cj4KPiBEaWQgeW91IHRyeSB1c2luZyBlbWl0X2FkZHIo
KSBoZXJlPyBJJ2QgZ3Vlc3MgdGhhdCdsbCBiZSBmZXdlcgo+IGluc3RydWN0aW9ucywgbm8/CgpZ
ZXMsIEkgc2hvdWxkIGhhdmUgdXNlZCB0aGF0LCB0aGUgYWRkcmVzcyB3b3VsZCBhbHdheXMgYmUg
aW4gdGhlIHJhbmdlCm9mIGF1aXBjK2FkZGkgcmlnaHQ/IEkgd2lsbCB0cnkgYW5kIHNlZS4gCgpU
aGFua3MsClB1cmFuamF5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
