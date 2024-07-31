Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA018C52D1D
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 15:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Knl+6RzUhg5K+LnmfbQ8mpYjPd1oNdNi7tX49LEVKEY=; b=QKbidil3oD9PGW
	PWKkuLQDZ5vb9ww542ZtOts2Re5A2ENktT3ZvYatdy2L7KNqKHCQiSAokqKf51f3viydzl+pAr+1v
	53zuVElHlQnB2CsG6Kmp+KHZcAsLrXULfowjtl8ypeU1wuYKrwYVrzxCruuLhepWjNZLLb8FR4tMn
	n+a8OZbiMZYO80Q62q+RGpQIBGWYrKc6CsDGz4c1kt1HOOjc7QmWM38RHxJSRseTm6motIcG8vnIF
	pbpXqqr7q0zIrdOUvfgPvv4QRsVC+aTlCWZQJ6w7bkBvmmJRmwolLwj+CQMNYHUqG1qh+xgAr/XiI
	UE1I2sSy4FUUz/kLhczw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZBdQ-00000001mk2-3zKN;
	Wed, 31 Jul 2024 15:53:04 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZBdM-00000001mid-1cIl
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 15:53:02 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a7a9a369055so655761166b.3
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 08:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722441178; x=1723045978; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RZ97hpomLEw/byUwUY0TgBpzkmi9pewqj9GBO3ZeSI=;
        b=F8S+Qw6KQJhiwRXDTqELV8N90SKrb0ilRDplPKogRdN7R9t5zf2B9lz1CqtwQhDEs/
         JQw8rPYfCHLq2ow5NkbZewkY4TwSo/joZpbCesQlOvi8vh+we/tOCZki6GvE1SZxsPOB
         gaLftZoifthq0K34BSVQ0w39do59Twbsr/KpVd6GdW2tm5yw7NLO+vw4sy9GWlB3kxrA
         ZcefWJD1f/Z4LK7bUWp28ov6tO/GqO82tKZNMJy2JXvKdDuU+7ZBQHmq52dhwYUMvrZJ
         htHNe63mz76lz5N6hHtb3cOmbcwng2gTxAgHJS3fGgVCsnA/qlII7h0ReW/NuDO7UJ+w
         0yOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722441178; x=1723045978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RZ97hpomLEw/byUwUY0TgBpzkmi9pewqj9GBO3ZeSI=;
        b=HNNSrNF600fbchbaNVY1r3QtHUGYJHRBxLNK1GUUDGYLNsvGZAxcrV3MmIJjJjqsD9
         FgxPr3sRNmpMBXqyFu5T3s00YajGqe5Wy0ORPgxm7Gi37ogY2J2xuVR70fakuWIDCKwP
         7akf9SJ0SmYinBrncOgeFjQ0qF96UTy4MXSt8+Y+R1a90bTMslvagmfS7dUcGwI7ypvD
         MgotJ9iNduGj/oGIwhk7VX7v0mkxhubVtq7cGSZyT4OIfW11xqpdVhdTY3E7XW5ZXeRR
         jwW7qsHQJ7vavnbrdfnytnoJFUi+1yrxCw7vLBuPjMrgPIWF5xhaVaBdeh1Al4SG0LG8
         2BcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjelUxaAdD82B7aLx0p510wxvKYieN08vyCXgX6R9MJd+Wf3M9E6i60ZegPsbJMH2SJ4P8Z3WBT8nBBh3xtwvEzO/Dr+PDWxxiN4Vyfo15
X-Gm-Message-State: AOJu0Yy4LECG5002q5I5ZWX3N9AQA6z3WbhFyfHYthqlt0loWN5dRBwe
	Ua5bWdGosYoDqiAbACuX6Bv2jueJii7+WDbHt2+oumTBOtZx9Hmgf0CySJGLnlPtP9gf45pSk9q
	1t+Qmn8wAIfVfHwAXmQkEErLYtcdhFR2AFC//EQ==
X-Google-Smtp-Source: AGHT+IEXrHnA4utmPx+s/NdEbR222Kpex0GF+qbN3+UuVDfaYGeQQ5BPa+yd+9D4iYRNxVvYTM9lFswX+PBEW9CkWTk=
X-Received: by 2002:a17:906:628c:b0:a72:5598:f03d with SMTP id
 a640c23a62f3a-a7d4014be34mr696899066b.59.1722441177488; Wed, 31 Jul 2024
 08:52:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
 <20240731072405.197046-3-alexghiti@rivosinc.com> <20240731-56ba72420d7f745dacb66fd8@orel>
In-Reply-To: <20240731-56ba72420d7f745dacb66fd8@orel>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 31 Jul 2024 17:52:46 +0200
Message-ID: <CAHVXubjrrWVnw1ufXRJh_5N9M5UiOVZseb0C78fjLaYhNKF7eA@mail.gmail.com>
Subject: Re: [PATCH v4 02/13] riscv: Do not fail to build on byte/halfword
 operations with Zawrs
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, 
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_085300_742773_C09852D9 
X-CRM114-Status: GOOD (  29.29  )
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

SGkgRHJldywKCk9uIFdlZCwgSnVsIDMxLCAyMDI0IGF0IDQ6MTDigK9QTSBBbmRyZXcgSm9uZXMg
PGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVsIDMxLCAyMDI0
IGF0IDA5OjIzOjU0QU0gR01ULCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPiByaXNjdiBkb2Vz
IG5vdCBoYXZlIGxyIGluc3RydWN0aW9ucyBvbiBieXRlIGFuZCBoYWxmd29yZCBidXQgdGhlCj4g
PiBxc3BpbmxvY2sgaW1wbGVtZW50YXRpb24gYWN0dWFsbHkgdXNlcyBzdWNoIGF0b21pY3MgcHJv
dmlkZWQgYnkgdGhlCj4gPiBaYWJoYSBleHRlbnNpb24sIHNvIHRob3NlIHNpemVzIGFyZSBsZWdp
dGltYXRlLgo+Cj4gV2UgY3VycmVudGx5IGFsd2F5cyBjb21lIHRvIF9fY21wd2FpdCgpIHRocm91
Z2ggc21wX2NvbmRfbG9hZF9yZWxheGVkKCkKPiBhbmQgcXVldWVkX3NwaW5fbG9ja19zbG93cGF0
aCgpIGFkZHMgYW5vdGhlciBpbnZvY2F0aW9uLgoKYXRvbWljX2NvbmRfcmVhZF9yZWxheGVkKCkg
YW5kIHNtcF9jb25kX2xvYWRfYWNxdWlyZSgpIGFsc28gY2FsbApzbXBfY29uZF9sb2FkX3JlbGF4
ZWQoKQoKQW5kIGhlcmUgaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTEtcmMx
L3NvdXJjZS9rZXJuZWwvbG9ja2luZy9xc3BpbmxvY2suYyNMMzgwLAp0aGUgc2l6ZSBwYXNzZWQg
aXMgMS4KCj4gSG93ZXZlciwgaXNuJ3QKPiB0aGUgcmVhc29uIHdlJ3JlIGhpdHRpbmcgdGhlIEJV
SUxEX0JVRygpIGJlY2F1c2UgdGhlIHN3aXRjaCBmYWlscyB0byBmaW5kCj4gYSBjYXNlIGZvciAx
Niwgbm90IGJlY2F1c2UgaXQgZmFpbHMgdG8gZmluZCBjYXNlcyBmb3IgMSBvciAyPyBUaGUgbmV3
Cj4gaW52b2NhdGlvbiBwYXNzZXMgYSBwb2ludGVyIHRvIGEgc3RydWN0IG1jc19zcGlubG9jaywg
d2hpY2ggbG9va3MgbGlrZQo+IGl0IGhhcyBzaXplIDE2LiBXZSBuZWVkIHRvIGVuc3VyZSB0aGF0
IHdoZW4gcHRyIHBvaW50cyB0byBhIHBvaW50ZXIgdGhhdAo+IHdlIHBhc3MgdGhlIHNpemUgb2Yg
dWludHB0cl90LgoKSSBndWVzcyB5b3UncmUgcmVmZXJpbmcgdG8gdGhpcyBjYWxsIGhlcmUKaHR0
cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTEtcmMxL3NvdXJjZS9rZXJuZWwvbG9j
a2luZy9xc3BpbmxvY2suYyNMNTUxLApidXQgaXQncyBhIHBvaW50ZXIgdG8gYSBwb2ludGVyLCB3
aGljaCB3aWxsIHRoZW4gcGFzcyBhIHNpemUgOC4KCkFuZCB0aGUgYnVpbGQgZXJyb3IgdGhhdCBJ
IGdldCBpcyB0aGUgZm9sbG93aW5nOgoKSW4gZnVuY3Rpb24gJ19fY21wd2FpdCcsCiAgICBpbmxp
bmVkIGZyb20gJ3F1ZXVlZF9zcGluX2xvY2tfc2xvd3BhdGgnIGF0Ci4uL2tlcm5lbC9sb2NraW5n
L3FzcGlubG9jay5jOjM4MDozOgouLy4uL2luY2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMuaDo1
MTA6NDU6IGVycm9yOiBjYWxsIHRvCidfX2NvbXBpbGV0aW1lX2Fzc2VydF8yJyBkZWNsYXJlZCB3
aXRoIGF0dHJpYnV0ZSBlcnJvcjogQlVJTERfQlVHCmZhaWxlZAogIDUxMCB8ICAgICAgICAgX2Nv
bXBpbGV0aW1lX2Fzc2VydChjb25kaXRpb24sIG1zZywKX19jb21waWxldGltZV9hc3NlcnRfLCBf
X0NPVU5URVJfXykKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF4KLi8uLi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyX3R5cGVzLmg6NDkxOjI1OiBub3Rl
OiBpbiBkZWZpbml0aW9uIG9mCm1hY3JvICdfX2NvbXBpbGV0aW1lX2Fzc2VydCcKICA0OTEgfCAg
ICAgICAgICAgICAgICAgICAgICAgICBwcmVmaXggIyMgc3VmZml4KCk7CiAgICAgICAgIFwKICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn4KLi8uLi9pbmNsdWRlL2xpbnV4L2Nv
bXBpbGVyX3R5cGVzLmg6NTEwOjk6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybwonX2NvbXBp
bGV0aW1lX2Fzc2VydCcKICA1MTAgfCAgICAgICAgIF9jb21waWxldGltZV9hc3NlcnQoY29uZGl0
aW9uLCBtc2csCl9fY29tcGlsZXRpbWVfYXNzZXJ0XywgX19DT1VOVEVSX18pCiAgICAgIHwgICAg
ICAgICBefn5+fn5+fn5+fn5+fn5+fn5+Ci4uL2luY2x1ZGUvbGludXgvYnVpbGRfYnVnLmg6Mzk6
Mzc6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybwonY29tcGlsZXRpbWVfYXNzZXJ0JwogICAz
OSB8ICNkZWZpbmUgQlVJTERfQlVHX09OX01TRyhjb25kLCBtc2cpIGNvbXBpbGV0aW1lX2Fzc2Vy
dCghKGNvbmQpLCBtc2cpCiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXn5+fn5+fn5+fn5+fn5+fn5+Ci4uL2luY2x1ZGUvbGludXgvYnVpbGRfYnVnLmg6NTk6MjE6
IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybwonQlVJTERfQlVHX09OX01TRycKICAgNTkgfCAj
ZGVmaW5lIEJVSUxEX0JVRygpIEJVSUxEX0JVR19PTl9NU0coMSwgIkJVSUxEX0JVRyBmYWlsZWQi
KQogICAgICB8ICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fgouLi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2NtcHhjaGcuaDozNzY6MTc6IG5vdGU6IGluIGV4cGFuc2lvbiBvZgpt
YWNybyAnQlVJTERfQlVHJwogIDM3NiB8ICAgICAgICAgICAgICAgICBCVUlMRF9CVUcoKTsKCndo
aWNoIHBvaW50cyB0byB0aGUgZmlyc3Qgc21wX2NvbmRfbG9hZF9yZWxheGVkKCkgSSBtZW50aW9u
ZWQgYWJvdmUuCgpUaGFua3MsCgpBbGV4CgoKPgo+ID4KPiA+IFRoZW4gaW5zdGVhZCBvZiBmYWls
aW5nIHRvIGJ1aWxkLCBqdXN0IGZhbGxiYWNrIHRvIHRoZSAhWmF3cnMgcGF0aC4KPgo+IE5vIG1h
dHRlciB3aGF0IHNpemVzIHdlJ3JlIGZhaWxpbmcgb24sIGlmIHdlIGRvIHRoaXMgdGhlbgo+IHF1
ZXVlZF9zcGluX2xvY2tfc2xvd3BhdGgoKSB3b24ndCBiZSBhYmxlIHRvIHRha2UgYWR2YW50YWdl
IG9mIFphd3JzLgo+Cj4gVGhhbmtzLAo+IGRyZXcKPgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFs
ZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vY21weGNoZy5oIHwgMyArKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vY21weGNoZy5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jbXB4
Y2hnLmgKPiA+IGluZGV4IGViYmNlMTM0OTE3Yy4uOWJhNDk3ZWExOGE1IDEwMDY0NAo+ID4gLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jbXB4Y2hnLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vY21weGNoZy5oCj4gPiBAQCAtMjY4LDcgKzI2OCw4IEBAIHN0YXRpYyBfX2Fs
d2F5c19pbmxpbmUgdm9pZCBfX2NtcHdhaXQodm9sYXRpbGUgdm9pZCAqcHRyLAo+ID4gICAgICAg
ICAgICAgICBicmVhazsKPiA+ICAjZW5kaWYKPiA+ICAgICAgIGRlZmF1bHQ6Cj4gPiAtICAgICAg
ICAgICAgIEJVSUxEX0JVRygpOwo+ID4gKyAgICAgICAgICAgICAvKiBSSVNDLVYgZG9lc24ndCBo
YXZlIGxyIGluc3RydWN0aW9ucyBvbiBieXRlIGFuZCBoYWxmLXdvcmQuICovCj4gPiArICAgICAg
ICAgICAgIGdvdG8gbm9femF3cnM7Cj4gPiAgICAgICB9Cj4gPgo+ID4gICAgICAgcmV0dXJuOwo+
ID4gLS0KPiA+IDIuMzkuMgo+ID4KPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+ID4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPiBsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
