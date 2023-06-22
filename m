Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59ADFEB64D8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 18:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G8zO2yW/fwov9kZ7tXAXICjb6Xby6/BK6LnlmNd/pmU=; b=c58IhFrKMoXl6d
	qW+w+DREQvop35WH715PPOOCcTGdCiNg2DG7Du4I2tknraWvNL0zuYINEdRAYdu3ONIzhXaWf53kO
	cYq+x1aPDWMOqxjvpIEJWZqOD9ouRZz0e1qWBWMiIMwSSZGA3Q65wy64BLBlC/a2xxwBjB9iZEK7O
	9Nq7WM1dFZd+NKE7DA88MkGQ3WFeHJnDHljN6hXesCnx9qc9Ees4VAh++DvgWwkS3aZoDtguOvupg
	V9oemo/lreBIvVKynVWEjOthM0CtTQnzbnyVdDuaQKr7ckQ14bp/9lgB0PbRnuB7UChqB8dLm78Eb
	dSKKklLXWOcG+o5//f0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCP3C-001Rvx-0x;
	Thu, 22 Jun 2023 18:28:58 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCP38-001Rup-2C
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 18:28:56 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-25eb3db3004so3638835a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jun 2023 11:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687458533; x=1690050533;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YI/oCnDdll7xeXkfLFG5RlPTvHgVHccCn8qZKbqDchc=;
        b=0qRaxcys4YmbQ0xcwXtiYKCybCP3eDqqZcNt0EbFptR/i+sEiqixTdVlSVvUpEcFUC
         J7Krjuhdik4DEZJt1cb4j4jIcBa6bbacTwDYK6hYa+FfrljIdxcVB2qgbrGYnMbcTU5L
         3ksBCu08lF6m0rLzc1hRaO4d45MtypJenIKGuj5T29bbEAY/hZm/ZkfIPRpQCWwPZlkG
         mnpZR95MjsTb7Gm1lFjUwmBt607YMeQxY3OziiQ82YbuR+c799mYDAPhNQXk9rhhI/bJ
         ssKDqayfpmuC8VnBsG6xJY5XunTaA406nT8NiK0HByc+KGgU9UeNCTxn5lVvjbClLirC
         DObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687458533; x=1690050533;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YI/oCnDdll7xeXkfLFG5RlPTvHgVHccCn8qZKbqDchc=;
        b=OkvPdGDn4x1yaxxSuXd93/AkApOO3A+jfzMWx53sk4OeD4EtK3kH0MZ+EtSBDi5cXH
         BE7rWHesh+o3W5nECOTstAbkIUeH+2pT3ogOpJoyY81vj+EEN8ApqO+r5ucpDhb6XZ5L
         TtxhwAkvOuhCgzY1Spa7Rtdp0XdX+h+P+fX4FNpCH7OE0HtYx1OTZBrmBLqkxQpePXz4
         jQW/fkEqm9BD7B7zrtoWuuZVRbfzL44j3ILfkR36BdIVpl0DatVtvsRbncAu4wAA53i6
         ze07RT1vhUxpfF9YnX6TJAS3s0NQ1R/FhiEQbs2NcaUpOEQRcBhOS6ykUaqpcl1ccEuE
         BTUg==
X-Gm-Message-State: AC+VfDwKZXYiWPI8n0uVBrDMcLQZaQOUvdujtpk+9lt6OkBWBn5c8TYP
	pvei+dOQM5VOR3Nykgiwk1lEUA==
X-Google-Smtp-Source: ACHHUZ5tzCgAIP975zn3FHFf5anIJ68kDIOS19I6Ykf6+fcDrv81ohoKWXn+RZu67MiKIpItDRgU1Q==
X-Received: by 2002:a17:902:ec8b:b0:1b6:b445:36d4 with SMTP id x11-20020a170902ec8b00b001b6b44536d4mr1659052plg.43.1687458532934;
        Thu, 22 Jun 2023 11:28:52 -0700 (PDT)
Received: from [10.0.16.165] ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id ja7-20020a170902efc700b001b3c7e5ed8csm5688527plb.74.2023.06.22.11.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 11:28:52 -0700 (PDT)
Message-ID: <b990638b-a86a-ee43-f8b1-18a0a0651ad0@rivosinc.com>
Date: Thu, 22 Jun 2023 11:28:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] riscv: Discard vector state on syscalls
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-kernel@vger.kernel.org, linux@rivosinc.com,
 Palmer Dabbelt <palmer@rivosinc.com>, =?UTF-8?Q?R=c3=a9mi_Denis-Courmont?=
 <remi@remlab.net>, Darius Rad <darius@bluespec.com>,
 Andy Chiu <andy.chiu@sifive.com>
References: <20230622173613.30722-1-bjorn@kernel.org>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <20230622173613.30722-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_112854_745104_41115182 
X-CRM114-Status: GOOD (  22.21  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiA2LzIyLzIzIDEwOjM2LCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+IEZyb206IEJqw7ZybiBU
w7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPgo+IFRoZSBSSVNDLVYgdmVjdG9yIHNwZWNpZmlj
YXRpb24gc3RhdGVzOgo+ICAgIEV4ZWN1dGluZyBhIHN5c3RlbSBjYWxsIGNhdXNlcyBhbGwgY2Fs
bGVyLXNhdmVkIHZlY3RvciByZWdpc3RlcnMKPiAgICAodjAtdjMxLCB2bCwgdnR5cGUpIGFuZCB2
c3RhcnQgdG8gYmVjb21lIHVuc3BlY2lmaWVkLgoKU28gdGhlIG9ubHkgdXNlIGNhc2Ugb2Ygc2F2
aW5nL3Jlc3RvcmluZyBWIHJlZ3MgaW4gX19zd2l0Y2hfdG8gaXMgYW4gCmludGVycnVwdCBpbmR1
Y2VkIHRhc2sgc3dpdGNoID8KCj4KPiBUaGUgdmVjdG9yIHJlZ2lzdGVycyBhcmUgY2xlYXJlZCwg
dmlsbCBpcyBzZXQgKGludmFsaWQpLCBhbmQgdGhlCj4gdmVjdG9yIHN0YXR1cyBpcyBzZXQgdG8g
SW5pdGlhbC4KPgo+IFRoYXQgd2F5IHdlIGNhbiBwcmV2ZW50IHVzZXJzcGFjZSBmcm9tIGFjY2lk
ZW50YWxseSByZWx5aW5nIG9uIHRoZQo+IHN0YXRlZCBzYXZlLgo+Cj4gUsOpbWkgcG9pbnRlZCBv
dXQgWzFdIHRoYXQgY2xlYXJpbmcgdGhlIHJlZ2lzdGVycyBtaWdodCBiZSBzdXBlcmZsdW91cywK
PiBhbmQgc2V0dGluZyB2aWxsIGlzIHN1ZmZpY2llbnQuCj4KPiBMaW5rOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1yaXNjdi8xMjc4NDMyNi45VVBQSzNNQWVCQGJhc2lsZS5yZW1sYWIu
bmV0LyAjIFsxXQo+IFN1Z2dlc3RlZC1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2lu
Yy5jb20+Cj4gU3VnZ2VzdGVkLWJ5OiBSw6ltaSBEZW5pcy1Db3VybW9udCA8cmVtaUByZW1sYWIu
bmV0Pgo+IFNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4K
PiAtLS0KPgo+IEkgZmlndXJlZCBJJ2Qgc2VudCBvdXQgYSBwcm9wZXIgcGF0Y2guIEkgbGlrZSBB
bmR5J3Mgb3B0aW1pemF0aW9uCj4gcGF0Y2gsIGJ1dCBUQkggSSB0aGluayB3ZSBzaG91bGQgZG8g
dGhhdCBhcyBhIGZvbGxvdyB1cC4KPgo+IEFzIFLDqW1pIHBvaW50ZWQgb3V0LCB0aGUgY2xlYXJp
bmcgbWlnaHQgYmUgb3B0ZWQgb3V0LCBidXQgSSBsZWZ0IGl0IGluCj4gaGVyZS4KPgo+Cj4gQmrD
tnJuCj4KPiAtLS0KPiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmggfCAyNSArKysr
KysrKysrKysrKysrKysrKysrKysrCj4gICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jICAgICAg
IHwgIDIgKysKPiAgIDIgZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmggYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3ZlY3Rvci5oCj4gaW5kZXggMDRjMGIwN2JmNmNkLi42OTJjZTU1ZTRhNjkgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaAo+ICsrKyBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vdmVjdG9yLmgKPiBAQCAtMTYzLDYgKzE2MywzMCBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgX19zd2l0Y2hfdG9fdmVjdG9yKHN0cnVjdCB0YXNrX3N0cnVjdCAqcHJldiwKPiAg
IHZvaWQgcmlzY3Zfdl92c3RhdGVfY3RybF9pbml0KHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrKTsK
PiAgIGJvb2wgcmlzY3Zfdl92c3RhdGVfY3RybF91c2VyX2FsbG93ZWQodm9pZCk7Cj4gICAKPiAr
c3RhdGljIGlubGluZSB2b2lkIHJpc2N2X3ZfdnN0YXRlX2Rpc2NhcmQoc3RydWN0IHB0X3JlZ3Mg
KnJlZ3MpCj4gK3sKPiArCXVuc2lnbmVkIGxvbmcgdmwsIHZ0eXBlX2ludmFsID0gMVVMIDw8IChC
SVRTX1BFUl9MT05HIC0gMSk7Cj4gKwo+ICsJaWYgKCFyaXNjdl92X3ZzdGF0ZV9xdWVyeShyZWdz
KSkKPiArCQlyZXR1cm47Cj4gKwo+ICsJcmlzY3Zfdl9lbmFibGUoKTsKPiArCWFzbSB2b2xhdGls
ZSAoCj4gKwkJIi5vcHRpb24gcHVzaFxuXHQiCj4gKwkJIi5vcHRpb24gYXJjaCwgK3Zcblx0Igo+
ICsJCSJ2c2V0dmxpCSUwLCB4MCwgZTgsIG04LCB0YSwgbWFcblx0Igo+ICsJCSJ2bXYudi5pCXYw
LCAwXG5cdCIKPiArCQkidm12LnYuaQl2OCwgMFxuXHQiCj4gKwkJInZtdi52LmkJdjE2LCAwXG5c
dCIKPiArCQkidm12LnYuaQl2MjQsIDBcblx0Igo+ICsJCSJ2c2V0dmwJCSUwLCB4MCwgJTFcblx0
Igo+ICsJCSIub3B0aW9uIHBvcFxuXHQiCj4gKwkJOiAiPSZyIiAodmwpIDogInIiICh2dHlwZV9p
bnZhbCkgOiAibWVtb3J5Iik7Cj4gKwlyaXNjdl92X2Rpc2FibGUoKTsKPiArCj4gKwlyaXNjdl92
X3ZzdGF0ZV9vbihyZWdzKTsKPiArfQo+ICsKPiAgICNlbHNlIC8qICEgQ09ORklHX1JJU0NWX0lT
QV9WICAqLwo+ICAgCj4gICBzdHJ1Y3QgcHRfcmVnczsKPiBAQCAtMTc4LDYgKzIwMiw3IEBAIHN0
YXRpYyBpbmxpbmUgYm9vbCByaXNjdl92X3ZzdGF0ZV9jdHJsX3VzZXJfYWxsb3dlZCh2b2lkKSB7
IHJldHVybiBmYWxzZTsgfQo+ICAgI2RlZmluZSBfX3N3aXRjaF90b192ZWN0b3IoX19wcmV2LCBf
X25leHQpCWRvIHt9IHdoaWxlICgwKQo+ICAgI2RlZmluZSByaXNjdl92X3ZzdGF0ZV9vZmYocmVn
cykJCWRvIHt9IHdoaWxlICgwKQo+ICAgI2RlZmluZSByaXNjdl92X3ZzdGF0ZV9vbihyZWdzKQkJ
CWRvIHt9IHdoaWxlICgwKQo+ICsjZGVmaW5lIHJpc2N2X3ZfdnN0YXRlX2Rpc2NhcmQocmVncykJ
CWRvIHt9IHdoaWxlICgwKQo+ICAgCj4gICAjZW5kaWYgLyogQ09ORklHX1JJU0NWX0lTQV9WICov
Cj4gICAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlz
Y3Yva2VybmVsL3RyYXBzLmMKPiBpbmRleCAwNWZmZGNkMTQyNGUuLjAwYzY4YjU3ZmY4OCAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHMuYwo+IEBAIC0yOTUsNiArMjk1LDggQEAgYXNtbGlua2FnZSBfX3Zpc2libGUg
X190cmFwX3NlY3Rpb24gdm9pZCBkb190cmFwX2VjYWxsX3Uoc3RydWN0IHB0X3JlZ3MgKnJlZ3Mp
Cj4gICAJCXJlZ3MtPmVwYyArPSA0Owo+ICAgCQlyZWdzLT5vcmlnX2EwID0gcmVncy0+YTA7Cj4g
ICAKPiArCQlyaXNjdl92X3ZzdGF0ZV9kaXNjYXJkKHJlZ3MpOwo+ICsKPiAgIAkJc3lzY2FsbCA9
IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUocmVncywgc3lzY2FsbCk7Cj4gICAKPiAgIAkJ
aWYgKHN5c2NhbGwgPCBOUl9zeXNjYWxscykKPgo+IGJhc2UtY29tbWl0OiA0NjgxZGFjYWRlZWZh
NWNhNjAxN2UwMDczNmFkYzFkN2RjOTYzYzZhCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
