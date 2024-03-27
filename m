Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B49BC54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 14:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9z1Rj25pkyqjL83TdLH8RZZDtUdcg7xxx/A/+m1AKAo=; b=sjxybJLQs6pw+0
	91leVfL0yQe5KEs9wifnEj/WnF9sxINnmXZJ67jhboPxAUnCHv5IlZ+ltvh7bPYYIlZ5Jl8G2ZeGj
	8/G1DSjXUTw5ZmZOJkK5MNWssK6u5q36+94jrt7msWzQyv4+iRT0y0uu1zMhnvnYjIxksUdIKxHWX
	LoQ2/7B/dLtj4fbizKMEfCb+O7ptteMEJjHKXfKKMKpfb9tTpfSINjxeHw2u7b4azvvRPDu/XLUPx
	FA+MF/0m2YP2jLRIzP6zTJrrZFkhc4+q0XTUIZlSMyturXgYMOAtcXzk8KL8eLIAkrfCrj5oWEvCx
	/AzYqWszj6pruTiKdgMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpUBf-00000009RfZ-0kTa;
	Wed, 27 Mar 2024 14:23:31 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpUBY-00000009RaW-382P
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 14:23:29 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-dc23bf7e5aaso6804660276.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 07:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711549399; x=1712154199; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRFvGQGfmRLMn0TkT6BKRAVaaKQN9JenEnS46fWKpus=;
        b=Zyj0H2b6q4r/uSAzgh8o3Ym2gqa5Q5ZZPk1mDK4+eLAJ9SLM2cfzl/6IMCb1lbMVH2
         WKQaXDcWDnIyctvkV7ojMPZ+KRxMWrkdJSZAntiCBy1Tby5Yb7BD9zLLvSKGJGaNZEge
         DJMEvJURScE+FFlBlFpDmp24jYGOkpYhmJfoJFxSf4vDcHeRcdHRnmcxL0brx4UtbdCF
         T9lMi7UCrzi1j2+vLOlMvmB0h00uJndlLFZPXHrjSVr2PkoNHjYbbJtm+lKfQRlQhGjq
         78u8PwJTryY7YAtacbxciFS0n6M5SuQgWqTLUmb3uhQltHLYrxIs81BEacfL/2vWwStH
         PIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711549399; x=1712154199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gRFvGQGfmRLMn0TkT6BKRAVaaKQN9JenEnS46fWKpus=;
        b=qvdk8vjTHsyor/1arPeaKDr3RDrAiCb5hUbgMkOCVtGr0dumaGjf4/xUz/2hC7J+YI
         3pewfAvGV7wrIFs0pZCw9cqWH2eIHotlFQ14xYW0GG2X6EG2rkvUy2REWwtnzcSG8gvi
         42ieX7Gx5uqbVKtgKe4gJew3FwqO2SzGt9XDd/ONsFF60w1VazdVn6pXLXd62dYv8k/B
         +hzJN5cHmLfn7e4jTWywim0IGs6L3+a2whondam8dO/otW0CI61jM/hwfVr4evVCwkO5
         557vlsys6OIgxvGD/3YhMNm6Ga8jQdv9uTgAvf0C1wKczW1m6GvpCbi/OvhsCQGWuUgn
         2llQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx/IkyJOc8sbbPpJf5fnvtgDalkn6UkB9xAlzgMY0IN1Ck3OF2aVM1DXtDUPXLtulkhZv1haW6VAm8mm3pqB+T6ki+PqDLlJBz5uuoxcLP
X-Gm-Message-State: AOJu0YyizN+LdhLi7pEM6YHzzOBKm2k7kNW1lvfTUxvFz7wzaOR3kEcS
	e8uKX+ukoCEYoZVOqXhPjIX9O+wneB2pe6GkcN0AJHYDbLnokqDLSFyvwRlzokmLNw+X8F4/InE
	KvUqPEWLKKZLfTRb+JcbBCsr8C025JmVDgQpjsg==
X-Google-Smtp-Source: AGHT+IGYxBizN2LWi9Q0EujC00wGP+OXjEg8ECCcaoV2+WotPGFiM/+Sna09HESRfbDarEimOdKSDh0zNwdww7Nkw9M=
X-Received: by 2002:a25:7284:0:b0:dcb:e462:6e10 with SMTP id
 n126-20020a257284000000b00dcbe4626e10mr1148689ybc.58.1711549398808; Wed, 27
 Mar 2024 07:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240326203017.310422-1-alexghiti@rivosinc.com> <20240326203017.310422-2-alexghiti@rivosinc.com>
In-Reply-To: <20240326203017.310422-2-alexghiti@rivosinc.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 27 Mar 2024 22:23:08 +0800
Message-ID: <CABgGipV1SaAxX6vL6CFdb-ctQtV2oA1=dE0zGZrrh2qbxDgkwQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: Fix warning by declaring arch_cpu_idle() as noinstr
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Pu Lehui <pulehui@huawei.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Puranjay Mohan <puranjay12@gmail.com>, Zong Li <zong.li@sifive.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Evgenii Shatokhin <e.shatokhin@yadro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_072324_933170_2CEFD7BA 
X-CRM114-Status: GOOD (  16.46  )
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

T24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgNDozM+KAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGUgZm9sbG93aW5nIHdhcm5pbmcgYXBwZWFy
cyB3aGVuIHVzaW5nIGZ0cmFjZToKPgo+IFs4OTg1NS40NDM0MTNdIFJDVSBub3Qgb24gZm9yOiBh
cmNoX2NwdV9pZGxlKzB4MC8weDFjCj4gWzg5ODU1LjQ0NTY0MF0gV0FSTklORzogQ1BVOiA1IFBJ
RDogMCBhdCBpbmNsdWRlL2xpbnV4L3RyYWNlX3JlY3Vyc2lvbi5oOjE2MiBhcmNoX2Z0cmFjZV9v
cHNfbGlzdF9mdW5jKzB4MjA4LzB4MjI4Cj4gWzg5ODU1LjQ0NTgyNF0gTW9kdWxlcyBsaW5rZWQg
aW46IHh0X2Nvbm50cmFjayhFKSBuZnRfY2hhaW5fbmF0KEUpIHh0X01BU1FVRVJBREUoRSkgbmZf
Y29ubnRyYWNrX25ldGxpbmsoRSkgeHRfYWRkcnR5cGUoRSkgbmZ0X2NvbXBhdChFKSBuZl90YWJs
ZXMoRSkgbmZuZXRsaW5rKEUpIGJyX25ldGZpbHRlcihFKSBjZmc4MDIxMShFKSBubHNfaXNvODg1
OV8xKEUpIG9mcGFydChFKSByZWRib290KEUpIGNtZGxpbmVwYXJ0KEUpIGNmaV9jbWRzZXRfMDAw
MShFKSB2aXJ0aW9fbmV0KEUpIGNmaV9wcm9iZShFKSBjZmlfdXRpbChFKSA5cG5ldF92aXJ0aW8o
RSkgZ2VuX3Byb2JlKEUpIG5ldF9mYWlsb3ZlcihFKSB2aXJ0aW9fcm5nKEUpIGZhaWxvdmVyKEUp
IDlwbmV0KEUpIHBoeXNtYXAoRSkgbWFwX2Z1bmNzKEUpIGNoaXByZWcoRSkgbXRkKEUpIHVpb19w
ZHJ2X2dlbmlycShFKSB1aW8oRSkgZG1fbXVsdGlwYXRoKEUpIHNjc2lfZGhfcmRhYyhFKSBzY3Np
X2RoX2VtYyhFKSBzY3NpX2RoX2FsdWEoRSkgZHJtKEUpIGVmaV9wc3RvcmUoRSkgYmFja2xpZ2h0
KEUpIGlwX3RhYmxlcyhFKSB4X3RhYmxlcyhFKSByYWlkMTAoRSkgcmFpZDQ1NihFKSBhc3luY19y
YWlkNl9yZWNvdihFKSBhc3luY19tZW1jcHkoRSkgYXN5bmNfcHEoRSkgYXN5bmNfeG9yKEUpIHhv
cihFKSBhc3luY190eChFKSByYWlkNl9wcShFKSByYWlkMShFKSByYWlkMChFKSB2aXJ0aW9fYmxr
KEUpCj4gWzg5ODU1LjQ1MTU2M10gQ1BVOiA1IFBJRDogMCBDb21tOiBzd2FwcGVyLzUgVGFpbnRl
ZDogRyAgICAgICAgICAgIEUgICAgICA2LjguMC1yYzZ1YnVudHUtZGVmY29uZmlnICMyCj4gWzg5
ODU1LjQ1MTcyNl0gSGFyZHdhcmUgbmFtZTogcmlzY3YtdmlydGlvLHFlbXUgKERUKQo+IFs4OTg1
NS40NTE4OTldIGVwYyA6IGFyY2hfZnRyYWNlX29wc19saXN0X2Z1bmMrMHgyMDgvMHgyMjgKPiBb
ODk4NTUuNDUyMDE2XSAgcmEgOiBhcmNoX2Z0cmFjZV9vcHNfbGlzdF9mdW5jKzB4MjA4LzB4MjI4
Cj4gWzg5ODU1LjQ1MjExOV0gZXBjIDogZmZmZmZmZmY4MDE2YjIxNiByYSA6IGZmZmZmZmZmODAx
NmIyMTYgc3AgOiBmZmZmYWY4MDgwOTBmZGIwCj4gWzg5ODU1LjQ1MjE3MV0gIGdwIDogZmZmZmZm
ZmY4MjdjNzY4MCB0cCA6IGZmZmZhZjgwODA4OWFkNDAgdDAgOiBmZmZmZmZmZjgwMGMwZGQ4Cj4g
Wzg5ODU1LjQ1MjIxNl0gIHQxIDogMDAwMDAwMDAwMDAwMDAwMSB0MiA6IDAwMDAwMDAwMDAwMDAw
MDAgczAgOiBmZmZmYWY4MDgwOTBmZTMwCj4gWzg5ODU1LjQ1MjMwNl0gIHMxIDogMDAwMDAwMDAw
MDAwMDAwMCBhMCA6IDAwMDAwMDAwMDAwMDAwMjYgYTEgOiBmZmZmZmZmZjgyY2Q2YWM4Cj4gWzg5
ODU1LjQ1MjQyM10gIGEyIDogZmZmZmZmZmY4MDA0NThjOCBhMyA6IGZmZmZhZjgwYjE4NzA2NDAg
YTQgOiAwMDAwMDAwMDAwMDAwMDAwCj4gWzg5ODU1LjQ1MjY0Nl0gIGE1IDogMDAwMDAwMDAwMDAw
MDAwMCBhNiA6IDAwMDAwMDAwZmZmZmZmZmYgYTcgOiBmZmZmZmZmZmZmZmZmZmZmCj4gWzg5ODU1
LjQ1MjY5OF0gIHMyIDogZmZmZmZmZmY4Mjc2Njg3MiBzMyA6IGZmZmZmZmZmODAwMDRjYWEgczQg
OiBmZmZmZmZmZjgwZWJlYTkwCj4gWzg5ODU1LjQ1Mjc0M10gIHM1IDogZmZmZmFmODA4MDg5YmQ0
MCBzNiA6IDgwMDAwMDBhMDAwMDZlMDAgczcgOiAwMDAwMDAwMDAwMDAwMDA4Cj4gWzg5ODU1LjQ1
Mjc4N10gIHM4IDogMDAwMDAwMDAwMDAwMjAwMCBzOSA6IDAwMDAwMDAwODAwNDM3MDAgczEwOiAw
MDAwMDAwMDAwMDAwMDAwCj4gWzg5ODU1LjQ1MjgzMV0gIHMxMTogMDAwMDAwMDAwMDAwMDAwMCB0
MyA6IDAwMDAwMDAwMDAxMDAwMDAgdDQgOiAwMDAwMDAwMDAwMDAwMDY0Cj4gWzg5ODU1LjQ1Mjg3
NF0gIHQ1IDogMDAwMDAwMDAwMDAwMDAwYyB0NiA6IGZmZmZhZjgwYjE4MmRiZmMKPiBbODk4NTUu
NDUyOTI5XSBzdGF0dXM6IDAwMDAwMDAyMDAwMDAxMDAgYmFkYWRkcjogMDAwMDAwMDAwMDAwMDAw
MCBjYXVzZTogMDAwMDAwMDAwMDAwMDAwMwo+IFs4OTg1NS40NTMwNTNdIFs8ZmZmZmZmZmY4MDE2
YjIxNj5dIGFyY2hfZnRyYWNlX29wc19saXN0X2Z1bmMrMHgyMDgvMHgyMjgKPiBbODk4NTUuNDUz
MTkxXSBbPGZmZmZmZmZmODAwMGUwODI+XSBmdHJhY2VfY2FsbCsweDgvMHgyMgo+IFs4OTg1NS40
NTMyNjVdIFs8ZmZmZmZmZmY4MDBhMTQ5Yz5dIGRvX2lkbGUrMHgyNGMvMHgyY2EKPiBbODk4NTUu
NDUzMzU3XSBbPGZmZmZmZmZmODAwMGRhNTQ+XSByZXR1cm5fdG9faGFuZGxlcisweDAvMHgyNgo+
IFs4OTg1NS40NTM0MjldIFs8ZmZmZmZmZmY4MDAwYjcxNj5dIHNtcF9jYWxsaW4rMHg5Mi8weGI2
Cj4gWzg5ODU1LjQ1Mzc4NV0gLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tCj4K
PiBUbyBmaXggdGhpcywgbWFyayBhcmNoX2NwdV9pZGxlKCkgYXMgbm9pbnN0ciwgbGlrZSBpdCBp
cyBkb25lIGluIGNvbW1pdAo+IGE5Y2JjMWI0NzFkMiAoInMzOTAvaWRsZTogbWFyayBhcmNoX2Nw
dV9pZGxlKCkgbm9pbnN0ciIpLgo+Cj4gUmVwb3J0ZWQtYnk6IEV2Z2VuaWkgU2hhdG9raGluIDxl
LnNoYXRva2hpbkB5YWRyby5jb20+Cj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1yaXNjdi81MWYyMWI4Ny1lYmVkLTQ0MTEtYWZiYy1jMDBkM2RlYTJiYWJAeWFkcm8uY29t
Lwo+IEZpeGVzOiBjZmJjNGY4MWM5ZDAgKCJyaXNjdjogU2VsZWN0IEFSQ0hfV0FOVFNfTk9fSU5T
VFIiKQo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5j
LmNvbT4KClJldmlld2VkLWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgpUZXN0
ZWQtYnk6IEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNpZml2ZS5jb20+Cgo+IC0tLQo+ICBhcmNoL3Jp
c2N2L2tlcm5lbC9wcm9jZXNzLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3By
b2Nlc3MuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYwo+IGluZGV4IDkyOTIyZGJkNWI1
Yy4uNmFiZWVjYmZjNTFkIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3Mu
Ywo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYwo+IEBAIC0zNyw3ICszNyw3IEBA
IEVYUE9SVF9TWU1CT0woX19zdGFja19jaGtfZ3VhcmQpOwo+Cj4gIGV4dGVybiBhc21saW5rYWdl
IHZvaWQgcmV0X2Zyb21fZm9yayh2b2lkKTsKPgo+IC12b2lkIGFyY2hfY3B1X2lkbGUodm9pZCkK
PiArdm9pZCBub2luc3RyIGFyY2hfY3B1X2lkbGUodm9pZCkKPiAgewo+ICAgICAgICAgY3B1X2Rv
X2lkbGUoKTsKPiAgfQo+IC0tCj4gMi4zOS4yCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
