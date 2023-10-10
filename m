Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D47FCD8CAC
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 17:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m+4XX+2hXd3k27ZmQ8irVgfyEjLrCoDhOnkZDBMpCGo=; b=HcNEbzCyziTVaP
	/wbUkdnwbdalrpS6LUJiR+UwGSSiiW2DOaBqRou+kJQUI9cUSd982MpAzYlDGIZPvvnsqJ9XhDFhd
	al4X96PNrwvTsmpb6nVsnl+9dacEPFTqVGgMH1NE1CVck3vz188qjey1uTZZcRh3tueJ38ZcEHdqo
	S4lVU0m1aMp9blRMER6oxS73SrYvM3267vvaaU0fjITOsVGZLG+zkM3ZLknCLXrLLhfaiyv8s+QmU
	EPHUB45B1hrKinqq3KIVM8CiHtasqDhslX7DrBTQ0ZSbPKa0GDB09R8nE8eO8FN7egvNqMjPxLQPP
	TaICeY+p8lSMYLEtvXEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqG8v-00Do7a-27;
	Tue, 10 Oct 2023 17:03:37 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqG8r-00Do6q-1Y
	for linux-riscv@lists.infradead.org;
	Tue, 10 Oct 2023 17:03:35 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-325e9cd483eso5614403f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 10 Oct 2023 10:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696957410; x=1697562210; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFoVNhEfSzp1dSw6NNvj7gLh7P8v4ACYe4VP+0F2LtQ=;
        b=EU7ufhgjEel8+gA6+8SwUogGZE7moSGFmlFSUIWqZBR7TMCi6+5gxyIWCoYwdoX6GF
         HxQPvRJaaLXZAr8LSzUoxc2HWEsXlhcKmnGDm0dmg4X1OqSgIbba898QgeHOH8gdw+xZ
         eGLi+K255dY3AiKYRTc45hilIbVgJ/MIgeAC/ceWH6sGLB7ZlX7NzI4ydhfXvjdEztku
         S/QVfhwX/TpMBFsh2T6oJ9f4vwH2vuvZKUA4ji7pKN5RRJXXW8Ebi3RhvGlKH0qZnwGy
         NKMmdRRkmZUx+oJBBaTX4ehKd6DMoBVl4iQ6cYz0qyUCSWNvEPRqrSVNtmBbB+wnRhuU
         qqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696957410; x=1697562210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XFoVNhEfSzp1dSw6NNvj7gLh7P8v4ACYe4VP+0F2LtQ=;
        b=HfTGhdSJOGk+XuUzT5w4FOZrx8i58EqT1DSGE+FErBfxvoCKjaYSfnZFiOaQqkJUFP
         qyljZnEaxQhHhwZNeJm5HL3c1QFulPmk61tBbYIjvb6vSJbkJqGN3bLlc0Wfu5N1P5b6
         sTnJ/dZGvgBTCTqzH7k3hkTp4r6xYooE4LjSPgCay3LW9Au2iPQagpkVa6RTS4+dewMF
         95JlwwyS/zVPBc1+6jfwrpE8i5iEiK8QLqarGYZ2y2Bq2wvfvNcFBP44Lsot+OFTJXKE
         MQxowtPNU08mwpY2/ttLTcLH4D0v/GnLqj8aEdRMzIwnH6b3p7PLSahaQJ5FOxuZ4cM8
         /sIQ==
X-Gm-Message-State: AOJu0Yztt5SUsC4FCEtMkTNKNBBzrNS/n7pRZUqwHMCxZqMXxOyqGrOl
	11hof1lwLIC9Obgk3ilTf8ayUwrATuuSmybxsmtvIQ==
X-Google-Smtp-Source: AGHT+IFvbHj9Ji4Gx2B+d7UqMkOjFTULnHJKFnwQml1FPaJtrvtIokyrSZyrZGy3HfybqA0GtEnC+FoTEPkMROGBCyo=
X-Received: by 2002:a5d:4b11:0:b0:31a:e772:ddf6 with SMTP id
 v17-20020a5d4b11000000b0031ae772ddf6mr17138614wrq.39.1696957410061; Tue, 10
 Oct 2023 10:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <20231003-riscv-lto-v3-1-8aca61a4ecb4@kernel.org>
In-Reply-To: <20231003-riscv-lto-v3-1-8aca61a4ecb4@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 10 Oct 2023 10:03:15 -0700
Message-ID: <CAKwvOdnMeM4YArw=hyVkev11cLfks5gaXWXNK+Wo0bcbeuMZHg@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: build: Allow LTO to be selected
To: Nathan Chancellor <nathan@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor@kernel.org, trix@redhat.com, samitolvanen@google.com, twd2.me@gmail.com, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_100333_818689_4C58A2E1 
X-CRM114-Status: GOOD (  13.06  )
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

T24gVHVlLCBPY3QgMywgMjAyMyBhdCAxMjoxN+KAr1BNIE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRo
YW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBXZW5kZSBUYW4gPHR3ZDIubWVAZ21haWwu
Y29tPgo+Cj4gQWxsb3cgTFRPIHRvIGJlIHNlbGVjdGVkIGZvciBSSVNDLVYsIG9ubHkgd2hlbiBM
TEQgPj0gMTQsIHNpbmNlIHRoZXJlIGlzIGFuCj4gaXNzdWUgWzFdIGluIHByaW9yIExMRCB2ZXJz
aW9ucyB0aGF0IHByZXZlbnRzIExMRCB0byBnZW5lcmF0ZSBwcm9wZXIKPiBtYWNoaW5lIGNvZGUg
Zm9yIFJJU0MtViB3aGVuIHdyaXRpbmcgYG5vcGBzLgo+Cj4gSSBoYXZlIHRlc3RlZCBlbmFibGlu
ZyBMVE8gZm9yIGBkZWZjb25maWdgLiBUaGUgTExEIHRvb2sgfjJtMjFzIGFuZCB+M0dpQgo+IG9u
IG91ciBJbnRlbCBYZW9uIEdvbGQgNjE0MCBzZXJ2ZXIgYW5kIHByb2R1Y2VkIGFuIDE4TWlCIElt
YWdlLiBUaGUgaW1hZ2UKPiBjYW4gYm9vdCB0byBzaGVsbCB1c2luZyBhbiBhcmNocmlzY3Ygcm9v
dGZzIG9uIFFFTVUuCj4KPiBJIGhhdmUgYWxzbyB0ZXN0ZWQgaXQgZm9yIGBhbGx5ZXNjb25maWdg
IHdpdGhvdXQgQ09NUElMRV9URVNULCBGVFJBQ0UsCj4gS0FTQU4sIGFuZCBHQ09WLiBUaGUgTExE
IHRvb2sgfjdoMDNtIGFuZCB+MzM1R2lCIG9uIHRoZSBzZXJ2ZXIsCj4gc3VjY2Vzc2Z1bGx5IHBy
b2R1Y2luZyBhIDEuN0dpQiBJbWFnZS4gVW5mb3J0dW5hdGVseSwgd2UgY2Fubm90IGJvb3QgdGhp
cwo+IGltYWdlIGJlY2F1c2UgdGhlIGBjcmVhdGVfa2VybmVsX3BhZ2VfdGFibGUoKWAgLT4gYGFs
bG9jX3BtZF9lYXJseSgpYCAtPgo+IGBCVUdfT04oKWAgbG9naWMgbGltaXRzIHRoZSBpbWFnZSB0
byBiZSA8IDFHaUIuIE1heWJlIHdlIGNhbiBmaXggaXQgaW4gYQo+IHNlcGFyYXRlIHBhdGNoIGZ1
cnRoZXIuCj4KPiBEaXNhYmxlIExUTyBmb3IgYXJjaC9yaXNjdi9rZXJuZWwvcGksIGFzIGxsdm0t
b2JqY29weSBleHBlY3RzIGFuIEVMRgo+IG9iamVjdCBmaWxlIHdoZW4gbWFuaXB1bGF0aW5nIHRo
ZSBmaWxlcyBpbiB0aGF0IHN1YmZvbGRlciwgcmF0aGVyIHRoYW4KPiBMTFZNIGJpdGNvZGUuCj4K
PiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0L2lzc3Vlcy81MDUwNSwg
cmVzb2x2ZWQgYnkgTExWTQo+ICAgICBjb21taXQgZTYzNDU1ZDVlMGU1ICgiW01DXSBVc2UgbG9j
YWwgTUNTdWJ0YXJnZXRJbmZvIGluIHdyaXRlTm9wcyIpCj4KPiBUZXN0ZWQtYnk6IFdlbmRlIFRh
biA8dHdkMi5tZUBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogV2VuZGUgVGFuIDx0d2QyLm1l
QGdtYWlsLmNvbT4KPiBDby1kZXZlbG9wZWQtYnk6IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRoYW5A
a2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtl
cm5lbC5vcmc+CgpQZXJoYXBzIHdvcnRoIGEgdjQgZHVlIHRvIGxpbmtlciByZWxheGF0aW9uIHJl
c3VsdGluZyBpbiBib290IGZhaWx1cmVzCnlvdSBvYnNlcnZlZDoKaHR0cHM6Ly9naXRodWIuY29t
L0NsYW5nQnVpbHRMaW51eC9saW51eC9pc3N1ZXMvMTk0MiA/CgotLSAKVGhhbmtzLAp+TmljayBE
ZXNhdWxuaWVycwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
