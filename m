Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEC3C83F1E
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 07:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1eS4AnUAdEwGppas9F6tHCPJ1HfZcptvWUNNylh/a04=; b=HkjQzMVjuRlz/r
	5f8IrIMhdHShEXqReUJr6tsMQEtHhit25JieX8KM1wkPZmOK9q4w7T9d7L/7OSAOVOpHGJNY7umhR
	74Yf4mEq7LnL+FpQleFwSo0/3n0ajZYrFLFoLP61w6qE+Q9ARNzRvFrxnCUErrpTlMugVNL7Hvo8k
	XzsAZFPxlvQAQ2y2UoRA2Myd1R1zSdgBNYpeneSJHnUayVcEgH784t+oIp/+YmsBO1nfpCY11rg2D
	7yvjDRPGF/nHxKD60vccrXpwOQfdspo/qDjb3LTeCvJIiGCKc2N2VqImFdu1OAfBa5AXCMmnKzIfa
	iwa9qd+TbuWoUfXlKTnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZllP-0000000B18V-3mqI;
	Thu, 10 Jul 2025 07:32:15 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZksI-0000000At8t-0wLH
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 06:35:19 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3b39c46e1cfso89748f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 09 Jul 2025 23:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1752129317; x=1752734117; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyhfcIGHykgvkrP2e/H7VmjAsjt0CsIijqEuhYmyjZA=;
        b=i9XvXfGKZ5UbFF+mTU5SktzYuGcq0kkQ5JxQJ0dpagvKpvA7KDlK09zvBlXyRaWOj+
         gPLuAeq5882LuLaFGs26/5FPr0jz5HJhX9cV9gXF7XS6fa0G06sXIiKWktu6gTDXvkz9
         K/lBU2aBmZ4m71BD/1F6ZTQbzR2DNEHEJwHe4hANbaHkcXChZLDtsV44ibZoCrjeCAUt
         gceQewaeWSKkuyg7h8cUUR3Gyk5lp5+Zq1oMKMuD/G/h3g3rPCaGt/cK+ARF9icustYX
         kE8p/Od41y7y4rLewLuU1nWSNM7lvIP/auNEzsrbxrREeESyl2zwRCNrq4+rjfMM9Tpl
         drng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752129317; x=1752734117;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kyhfcIGHykgvkrP2e/H7VmjAsjt0CsIijqEuhYmyjZA=;
        b=YNXT+IO7FJmhD0o7MH3Nw9rMmnHtg40AkMAsc9p2/speFoaTDEWiOV3sbN+q9uaUS8
         5qn+g1l4/4QMGIv+qxsXNfMv8EfKmG0i1rEMoYLrEeEP5RSmTNCxygPV/xBAT0o8ya+s
         +tBHXqBdYt9LKhvlTz6iTkaVAKrod1dOMMYHSKtZraVgs70bkUicD9Gunc/gl+0Bgurq
         p/W4h5Lb5oskjL8CtHZdNcNtuy4xogrvt+sVpoMRss1AVmKiug3oYwgw+d1Stx8syfU9
         HTBh+VyfmXhFRJIztN/msHiSIOYQdNiq4uOMwGXqoyr4MIAPdmOfxTC6kA+vbzf3lhPT
         VsPw==
X-Forwarded-Encrypted: i=1; AJvYcCVrXRorNDiAb0B+T0EdpcJ/jvQ6jZ8veaY4IVACmxZ3p6baFUE6WW4jmxf8WzmBnM1UY4Vj/a2G+VacpQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRiSpsFmtuKbfBxqvoXiat1wlzNdVXUn4sE9jvsPpdBxvXzX0M
	z9bJhz8jfIXniK2/W/fILq52rcOdgQaHt5zRbRY/lGo9JlAhbdjq1di9bgUSGmoCi4M=
X-Gm-Gg: ASbGnctezpbCTL8FJt2lEcmSngTQyLIBSAo+DYj3lgwU/McM+63Gla0IQCJqOuZoUqI
	5SS8+fwidpYUn0uyYwJa/pQhzku6/hLRKru53qys9YCglWIpgBvNIh3ENl85wQ70jYLYy54/vY9
	bhzeKR0OAq5qny4tdtMhMpL4GcC6Lrxdij5c++bliC1bhpAjDbSbjbx0HrcO3Llgbc11WfAJMEM
	PMYRSPB/ExS3QL4UTQr7Vdnb3deKE0H3sJypS+zXEbZKmgmkFs5b0tdhVqsYFk5F4Kg0R/NbaNU
	2Ggn3ilRqJHq4Z987YqhAHdUzvATF96hnT7dyew0Gji+n8qRZCHAeJS0mY7agBTTIKKt8xvjkor
	/mt9r5czYDZ+7TTbd23WKrQ==
X-Google-Smtp-Source: AGHT+IEqEitaMgB8tObGyqBHxc/XW6tkIZ1LssQgO+WUWZXRaXyhTeRPn6KcRlFtzKo7i/2kYbIvaw==
X-Received: by 2002:a05:600c:3584:b0:453:76e2:5b16 with SMTP id 5b1f17b1804b1-454db9090c3mr7110435e9.0.1752129316466;
        Wed, 09 Jul 2025 23:35:16 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454cdb381a6sm57354855e9.1.2025.07.09.23.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 23:35:16 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 10 Jul 2025 08:35:15 +0200
Message-Id: <DB8607ITP9UR.2LOW61O3OVJ2F@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [External] [PATCH] RISC-V: store percpu offset in CSR_SCRATCH
Cc: <masahiroy@kernel.org>, <nathan@kernel.org>, <nicolas.schier@linux.dev>,
 <dennis@kernel.org>, <tj@kernel.org>, <cl@gentwo.org>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <alex@ghiti.fr>, <andybnac@gmail.com>, <bjorn@rivosinc.com>,
 <cyrilbur@tenstorrent.com>, <rostedt@goodmis.org>, <puranjay@kernel.org>,
 <ben.dooks@codethink.co.uk>, <zhangchunyan@iscas.ac.cn>,
 <ruanjinjie@huawei.com>, <jszhang@kernel.org>, <charlie@rivosinc.com>,
 <cleger@rivosinc.com>, <antonb@tenstorrent.com>, <ajones@ventanamicro.com>,
 <debug@rivosinc.com>, <haibo1.xu@intel.com>, <samuel.holland@sifive.com>,
 <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>, <wangziang.ok@bytedance.com>
To: "yunhui cui" <cuiyunhui@bytedance.com>
References: <20250704084500.62688-1-cuiyunhui@bytedance.com>
 <DB5U402ARSEO.4H4PE19LGCR7@ventanamicro.com>
 <CAEEQ3w=V6-d+YSWP=0WMt6UAZexrazq0UQjdyUmS3AnMtkdoKQ@mail.gmail.com>
 <DB6MLPA3BJ75.2U5FP5JSJD2LO@ventanamicro.com>
 <CAEEQ3wkoy3Jr0vZk=X4U56KYPq3=5t7Wr4RE6uNby3MS5qzh-g@mail.gmail.com>
 <DB7L9ZHZI3AI.36SXWX2SO9OS7@ventanamicro.com>
 <CAEEQ3wnaL5X_jXEmbbWFp3jx1Aq=02Gf7kDNBS=wcPyfEq7yBw@mail.gmail.com>
In-Reply-To: <CAEEQ3wnaL5X_jXEmbbWFp3jx1Aq=02Gf7kDNBS=wcPyfEq7yBw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_233518_273979_A97D1FDB 
X-CRM114-Status: GOOD (  13.23  )
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

MjAyNS0wNy0xMFQxMTo0NTowNiswODowMCwgeXVuaHVpIGN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5j
ZS5jb20+Ogo+IE9uIFdlZCwgSnVsIDksIDIwMjUgYXQgMTA6MjDigK9QTSBSYWRpbSBLcsSNbcOh
xZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4+IElzIHRoZSBvdmVyaGVhZCBh
Ym92ZSB3aXRoIHRoaXMgcGF0Y2g/ICBBbmQgd2hlbiB3ZSB0aGVuIHVzZSB0aGUKPj4gQ1NSX1ND
UkFUQ0ggZm9yIHBlcmNwdSwgZG9lcyBpdCBkZWdyYWRlIGV2ZW4gZnVydGhlcj8KPgo+IFdlIGNh
biBzZWUgdGhhdCB0aGUgcGVyY3B1IG9wdGltaXphdGlvbiBpcyBhcm91bmQgMi41JSB0aHJvdWdo
IHRoZQo+IG1ldGhvZCBvZiBmaXhpbmcgcmVnaXN0ZXJzLCBhbmQgd2UgY2FuIGNvbnNpZGVyIHRo
YXQgdGhlIHBlcmNwdQo+IG9wdGltaXphdGlvbiBjYW4gYnJpbmcgYSAyLjUlIGdhaW4uIElzIHRo
ZXJlIG5vIG5lZWQgdG8gYWRkIHRoZSBwZXJjcHUKPiBvcHRpbWl6YXRpb24gbG9naWMgb24gdGhl
IGJhc2lzIG9mIHRoZSBzY3JhdGNoIHBhdGNoIGZvciB0ZXN0aW5nPwo+Cj4gUmVmZXJlbmNlOiBo
dHRwczovL2xpc3RzLnJpc2N2Lm9yZy9nL3RlY2gtcHJpdmlsZWdlZC9tZXNzYWdlLzI0ODUKClRo
YXQgaXMgd2hlbiB0aGUgdmFsdWUgaXMgaW4gYSBHUFIsIHRob3VnaCwgYW5kIHdlIGRvbid0IGtu
b3cgdGhlCnBlcmZvcm1hbmNlIG9mIGEgQ1NSX1NDUkFUQ0ggYWNjZXNzLgpXZSBjYW4gaG9wZSB0
aGF0IGl0J3Mgbm90IG11Y2ggd29yc2UgdGhhbiBhIEdQUiwgYnV0IGFuIGltcGxlbWVudGF0aW9u
Cm1pZ2h0IGNob29zZSB0byBiZSB2ZXJ5IHNsb3cgd2l0aCBDU1JfU0NSQVRDSC4KCkkgaGF2ZSBp
biBtaW5kIGFub3RoZXIgbWV0aG9kIHdoZXJlIHdlIGNhbiB1c2UgdGhlIGN1cnJlbnQgQ1NSX1ND
UkFUQ0gKd2l0aG91dCBjaGFuZ2luZyBDU1JfVFZBTCwgYnV0IEkgZG9uJ3QgcmVhbGx5IHdhbnQg
dG8gc3BlbmQgdGltZSBvbiBpdAppZiByZWFkaW5nIHRoZSBDU1IgZG9lc24ndCBnaXZlIGFueSBi
ZW5lZml0LgoKSXQgd291bGQgYmUgdG8gc3RvcmUgdGhlIHBlcmNwdSBvZmZzZXQgaW4gQ1NSX1ND
UkFUQ0ggcGVybWFuZW50bHksIGRvCnRoZSBlYXJseSBleGNlcHRpb24gcmVnaXN0ZXIgc2h1ZmZs
aW5nIHdpdGggYSBwZXJjcHUgYXJlYSBzdG9yYWdlLCBhbmQKbG9hZCB0aGUgdGhyZWFkIHBvaW50
ZXIgZnJvbSB0aGVyZSBhcyB3ZWxsLgpUaGF0IG1ldGhvZCB3b3VsZCBhbHNvIGVsaW1pbmF0ZSB3
cml0aW5nIENTUl9TQ1JBVENIIG9uIGV2ZXJ5IGV4Y2VwdGlvbgplbnRyeStleGl0LCBzbyBtYXli
ZSBpdCBtYWtlcyBzZW5zZSB0byB0cnkgaXQgZXZlbiBpZiBDU1JzIGFyZSBzbG93Li4uCgpUaGFu
a3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
