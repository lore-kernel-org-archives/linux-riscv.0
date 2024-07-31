Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B818C3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 21:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tphgas97sOO0FpGuN2wiuR1Lr7yXF7Fv0uq4sUgedz8=; b=j79gLeFw3c2ee3
	QcpNCCmqv/BjVWbvWtXAK2dfBVoFiMdE9x8kEZh+6O+VRiPIckdMm7nQYBMeKlfR25xto+rFkZmuD
	53EUhumFvqtB9gfmXIXvAB70pbeKBNP5s3maFB/lg4zY52ZxRMQRC04jSYhpJyEW/U3frNSzTNGVi
	Ichgb9PnH9h1wsuakE00k26QzrIbFH3MQWWzKJOP6ck//cUWJ0KQcp63q+TCkxckhgIhRY/OVQ4a2
	UVxAG8+J0U6kVyRkHCEu3f3r0pJ6/8L5rK2xetb+4+KC1zq1M2mhbvloYhoI6V6FdAniq1W+P6pit
	Tr8QPffRp8JSjS1taOOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZHG8-00000002dao-1FBv;
	Wed, 31 Jul 2024 21:53:24 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZHEy-00000002dQz-2TcT
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 21:53:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 86CC8CE1780
	for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 21:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0706C4AF11
	for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 21:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722462728;
	bh=dMejEloAEVcCZyvgcOEVM+yjF7rV83Fb47hNrMHcm60=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OFXIhAa49ozspRb+Vkg+haQ1CJdlME/Xu6FJdG8xHm7AzdmrR0yzch+x0i9bROVyY
	 A7wd3yYyAt+eCNuFst9nR2ZQS/1gpYyvZOzG/cuh2mlrXx6WzgcLLOyi12IUWANWpx
	 h8dSoJG1kAWngOTiF0/6RrXOEz6P42V5R+CIQai4isVMDTBYGAvSi1IewPlHxhqdY8
	 7wYaZEhcMyhOkfCLDmRYEmNbNpGUW/p+Att0Sfiiq6WqbV3DJ/P0kVgHLqPYbB+F+N
	 ZvD9Jkl3Xu6RT1X8KGEr2viOY0DavTkf5K8zxAMghH1Cu+pYg1q+Ae5sLsXF+hOpaq
	 Lgp93F6wJDETw==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5afa207b8bfso6450767a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 14:52:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvuJ8YG0v6Q+xx1/lGYLJddyvFFMYjgl9HXQCDM3YsMjIn2vzGaC7UQn4qeF1AEEZDOP8yCqcFV8JU77VK7p8j9iAhkYnui2pniiaaCv/5
X-Gm-Message-State: AOJu0Yx+XNxksi9RmVqwxgOZyWd+4n9izARBXmtQL7/bqQdkjB2/vJ6w
	VMmO2hJqrss4tcrWvweQPT5ImskbT1L/CaJFQRTrks5e0V7xai+qdmPveWqXqRomrryJnj9H+3O
	KWHse26ly5tGevvGDupFvP8Jh4Z8=
X-Google-Smtp-Source: AGHT+IG6u+LBC1U/4ah8Phx3p1l/q7k/uRvdbCWTGY0uN3N8etMJmLSzVrI0hwkofLSh7v3Pv8RNG16kgZqR0K/TkXM=
X-Received: by 2002:a05:6402:3d6:b0:5a1:73fc:6bd4 with SMTP id
 4fb4d7f45d1cf-5b6ff0005f4mr189800a12.19.1722462727169; Wed, 31 Jul 2024
 14:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
 <20240731072405.197046-3-alexghiti@rivosinc.com> <ea55bb29-c3ba-4e71-a76a-f788c4a7ea16@redhat.com>
In-Reply-To: <ea55bb29-c3ba-4e71-a76a-f788c4a7ea16@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 1 Aug 2024 06:51:55 +0900
X-Gmail-Original-Message-ID: <CAJF2gTTGpTG6Va+7Sa9t2BFGFc5oy-yR5zEdiWretygO1jD_Ww@mail.gmail.com>
Message-ID: <CAJF2gTTGpTG6Va+7Sa9t2BFGFc5oy-yR5zEdiWretygO1jD_Ww@mail.gmail.com>
Subject: Re: [PATCH v4 02/13] riscv: Do not fail to build on byte/halfword
 operations with Zawrs
To: Waiman Long <longman@redhat.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_145212_980641_DE70FED1 
X-CRM114-Status: GOOD (  19.13  )
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

T24gVGh1LCBBdWcgMSwgMjAyNCBhdCAxOjI34oCvQU0gV2FpbWFuIExvbmcgPGxvbmdtYW5AcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiA3LzMxLzI0IDAzOjIzLCBBbGV4YW5kcmUgR2hpdGkgd3Jv
dGU6Cj4gPiByaXNjdiBkb2VzIG5vdCBoYXZlIGxyIGluc3RydWN0aW9ucyBvbiBieXRlIGFuZCBo
YWxmd29yZCBidXQgdGhlCj4gPiBxc3BpbmxvY2sgaW1wbGVtZW50YXRpb24gYWN0dWFsbHkgdXNl
cyBzdWNoIGF0b21pY3MgcHJvdmlkZWQgYnkgdGhlCj4gPiBaYWJoYSBleHRlbnNpb24sIHNvIHRo
b3NlIHNpemVzIGFyZSBsZWdpdGltYXRlLgo+Cj4gTm90ZSB0aGF0IHRoZSBuYXRpdmUgcXNwaW5s
b2NrIGNvZGUgb25seSBuZWVkIGhhbGZ3b3JkIGF0b21pYyBjbXB4Y2hnCj4gb3BlcmF0aW9uLiBI
b3dldmVyLCBpZiB5b3UgYWxzbyBwbGFuIHRvIHVzZSBwYXJhdmlydHVhbCBxc3BpbmxvY2ssIHlv
dQo+IG5lZWQgdG8gaGF2ZSBieXRlLWxldmVsIGF0b21pYyBjbXB4Y2hnKCkuClRoeCBmb3IgcmVt
aW5kaW5nIG1lOyBJIHdpbGwgdXBkYXRlIHBhcmF2aXJ0IHFzcGlubG9jayBhZnRlciB0aGVzZQpw
YXRjaGVzIG1lcmdlLgoKWmFiaGEgJiBaY2FzIGV4dGVuc2lvbiBwcm92aWRlcyBieXRlIGFuZCBo
YWxmLXdvcmQgYXRvbWljIGNtcHhjaGcuCgo+Cj4gQ2hlZXJzLAo+IExvbmdtYW4KPgo+ID4KPiA+
IFRoZW4gaW5zdGVhZCBvZiBmYWlsaW5nIHRvIGJ1aWxkLCBqdXN0IGZhbGxiYWNrIHRvIHRoZSAh
WmF3cnMgcGF0aC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhn
aGl0aUByaXZvc2luYy5jb20+Cj4gPiAtLS0KPiA+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9j
bXB4Y2hnLmggfCAzICsrLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Y21weGNoZy5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jbXB4Y2hnLmgKPiA+IGluZGV4IGVi
YmNlMTM0OTE3Yy4uOWJhNDk3ZWExOGE1IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9jbXB4Y2hnLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY21weGNo
Zy5oCj4gPiBAQCAtMjY4LDcgKzI2OCw4IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBf
X2NtcHdhaXQodm9sYXRpbGUgdm9pZCAqcHRyLAo+ID4gICAgICAgICAgICAgICBicmVhazsKPiA+
ICAgI2VuZGlmCj4gPiAgICAgICBkZWZhdWx0Ogo+ID4gLSAgICAgICAgICAgICBCVUlMRF9CVUco
KTsKPiA+ICsgICAgICAgICAgICAgLyogUklTQy1WIGRvZXNuJ3QgaGF2ZSBsciBpbnN0cnVjdGlv
bnMgb24gYnl0ZSBhbmQgaGFsZi13b3JkLiAqLwo+ID4gKyAgICAgICAgICAgICBnb3RvIG5vX3ph
d3JzOwo+ID4gICAgICAgfQo+ID4KPiA+ICAgICAgIHJldHVybjsKPgoKCi0tIApCZXN0IFJlZ2Fy
ZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
