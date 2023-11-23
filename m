Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CFCC61D85
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 10:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3s6qxNeaCUU23fBEn3dYQ7YsFGXg1DorIbMiW+3TCKg=; b=JtwXn5OckRm2LC
	jzSC9ckUZWvetdGR24rHtUbp3uwqu1C7bVZZKY3mK/Y103Ck6YI6m0fR33wFQfjOHCreiSihql+kU
	wC95Nt3Ycs1rqudarWQ2O5RHWqIex1ghbLrUCypRS2z6+nOx72yjQDUptq9FfvAIqOCmCknM6ZKYO
	mRSosJLyRGaElXceTEKIShRchAt3vKIgQDlbIkLOW3MruKGxuAiIeXp1Ot8aLUxOUUurJ4Shj403K
	4rn8jwQD+uG8uY+7/6dhlGS7DrS5KH+Y+Z8Iq3FHUcpOXTBbS3QSI/ZtTHMlDpD5AFHp7LzmFUbbW
	UuyxTMtDqQTzi4tgoOVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r677e-004PHX-0t;
	Thu, 23 Nov 2023 10:39:50 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r677b-004PFs-1u
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 10:39:48 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5be24d41bb8so548022a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Nov 2023 02:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700735984; x=1701340784; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQ5cHR9g9Ex7S7K/JEODWQbh9BgcOaeTZEBwA4kKzCg=;
        b=nprlBqxFppld7iayRfN/SG4GHVUKl6vZ79NLd+0Ziz05P7Q/HYO+Z56CmOSlt/LEp4
         5aUDeW2nGcnCmlkDv9QEYirJa83soYh54GDIyiRY6BCKTbhCwToZRiCIK9MYwft5AIfr
         7xiPK8ZQBR4KIf2BiegKQ6P7cuoeejb6cmtBjetuyp5/R0l7lh9stDgPFB1/imE03PQD
         U1nJoUtlQL69Dcr0iNcMNqlBHim4LXZRIV61og1IRLryfXNOqbs37MUZdZrbj95bxz7j
         D3Kq86C4DxgUgU6GJrnYBKdHHfy9WtSJWYyke+5TH/G3q89HalaU9vlL1vxvFS7YujB6
         K9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700735984; x=1701340784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQ5cHR9g9Ex7S7K/JEODWQbh9BgcOaeTZEBwA4kKzCg=;
        b=f/wqcr54ADTTsAU7z9COxJBnuduQZQPWPxYksbIbZYoQMYco0rOffRhFNXUglO4Ugx
         hwRHF5IL1tlPR6cSxKJhv/7X5bNG0aRBWO0/Kg0dR6mZvnRG1SPm31MKhOBFN7n5D73X
         PdkMDF2KqEkPjNwgD7Q8zDOaCV7J0E2DPQQEpbev5ffTjN+VvSAJyfaPnAM/enaA6381
         J05SHA5Ug5DaiR79Av0GqgAHcui3YNty/8ISmUryfkySpQN4MaV4PknUDNX+7jQsCvTF
         ZcKJZcm9Bp5cOClZWpsrEKS+ufFUURCE/rF/aMjj5NOiy7WHjcalDhY8zdf964GSOpez
         F//g==
X-Gm-Message-State: AOJu0YwtABnHSuQ8uh9kzXVyokQ1tGtDcgYObw0Kd2fyJpOP9GZrKzTT
	ZLCNGVcfYe+HrBIP79Yd6VgpGvoW9fasdU5vUMF53A==
X-Google-Smtp-Source: AGHT+IG99YAMevSp0jGufV7mXYc4HBJFz0NMYVlrsS8HZwf7nEtTjYohwnzETeJL+MEJrNZlmD9vq5lOCr8swdpaVqw=
X-Received: by 2002:a17:90a:bf0b:b0:280:47ba:767a with SMTP id
 c11-20020a17090abf0b00b0028047ba767amr3176568pjs.16.1700735984411; Thu, 23
 Nov 2023 02:39:44 -0800 (PST)
MIME-Version: 1.0
References: <20231118033859.726692-1-apatel@ventanamicro.com>
 <20231118033859.726692-6-apatel@ventanamicro.com> <fb72e212-711e-4be9-9b92-89b2dc121476@sifive.com>
In-Reply-To: <fb72e212-711e-4be9-9b92-89b2dc121476@sifive.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 23 Nov 2023 16:09:32 +0530
Message-ID: <CAK9=C2W+Rb85Dm+sN=PXgN3wpbJFrvctBvC-Coi1Q_TsvthWYA@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] RISC-V: Enable SBI based earlycon support
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Conor Dooley <conor@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_023947_634265_F662625B 
X-CRM114-Status: GOOD (  16.20  )
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

T24gV2VkLCBOb3YgMjIsIDIwMjMgYXQgNDoxOOKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBPbiAyMDIzLTExLTE3
IDk6MzggUE0sIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBMZXQgdXMgZW5hYmxlIFNCSSBiYXNlZCBl
YXJseWNvbiBzdXBwb3J0IGluIGRlZmNvbmZpZ3MgZm9yIGJvdGggUlYzMgo+ID4gYW5kIFJWNjQg
c28gdGhhdCAiZWFybHljb249c2JpIiBjYW4gYmUgdXNlZCBhZ2Fpbi4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+IFJldmlld2Vk
LWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiAg
YXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZyAgICAgIHwgMSArCj4gPiAgYXJjaC9yaXNjdi9j
b25maWdzL3J2MzJfZGVmY29uZmlnIHwgMSArCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZp
ZyBiL2FyY2gvcmlzY3YvY29uZmlncy9kZWZjb25maWcKPiA+IGluZGV4IDkwNTg4MTI4MmE3Yy4u
ZWFmMzRlODcxZTMwIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZp
Zwo+ID4gKysrIGIvYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZwo+ID4gQEAgLTE0OSw2ICsx
NDksNyBAQCBDT05GSUdfU0VSSUFMXzgyNTBfQ09OU09MRT15Cj4gPiAgQ09ORklHX1NFUklBTF84
MjUwX0RXPXkKPiA+ICBDT05GSUdfU0VSSUFMX09GX1BMQVRGT1JNPXkKPiA+ICBDT05GSUdfU0VS
SUFMX1NIX1NDST15Cj4gPiArQ09ORklHX1NFUklBTF9FQVJMWUNPTl9SSVNDVl9TQkk9eQo+ID4g
IENPTkZJR19WSVJUSU9fQ09OU09MRT15Cj4gPiAgQ09ORklHX0hXX1JBTkRPTT15Cj4gPiAgQ09O
RklHX0hXX1JBTkRPTV9WSVJUSU89eQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvY29uZmln
cy9ydjMyX2RlZmNvbmZpZyBiL2FyY2gvcmlzY3YvY29uZmlncy9ydjMyX2RlZmNvbmZpZwo+ID4g
aW5kZXggODliNjAxZTI1M2E2Li41NzIxYWYzOWFmZDEgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jp
c2N2L2NvbmZpZ3MvcnYzMl9kZWZjb25maWcKPiA+ICsrKyBiL2FyY2gvcmlzY3YvY29uZmlncy9y
djMyX2RlZmNvbmZpZwo+Cj4gVGhpcyBmaWxlIGlzbid0IHVzZWQgYW55bW9yZSBzaW5jZSA3MmYw
NDVkMTlmMjUgKCJyaXNjdjogRml4dXAgZGlmZmVyZW5jZSB3aXRoCj4gZGVmY29uZmlnIiksIHNv
IHRoZXJlJ3Mgbm8gbmVlZCB0byB1cGRhdGUgaXQuIEknbGwgc2VuZCBhIHBhdGNoIGRlbGV0aW5n
IGl0LgoKT2theSwgSSB3aWxsIGRyb3AgdGhlIGNoYW5nZXMgaW4gcnYzMl9kZWZjb25maWcuCgo+
Cj4gUmVnYXJkcywKPiBTYW11ZWwKPgo+ID4gQEAgLTY2LDYgKzY2LDcgQEAgQ09ORklHX0lOUFVU
X01PVVNFREVWPXkKPiA+ICBDT05GSUdfU0VSSUFMXzgyNTA9eQo+ID4gIENPTkZJR19TRVJJQUxf
ODI1MF9DT05TT0xFPXkKPiA+ICBDT05GSUdfU0VSSUFMX09GX1BMQVRGT1JNPXkKPiA+ICtDT05G
SUdfU0VSSUFMX0VBUkxZQ09OX1JJU0NWX1NCST15Cj4gPiAgQ09ORklHX1ZJUlRJT19DT05TT0xF
PXkKPiA+ICBDT05GSUdfSFdfUkFORE9NPXkKPiA+ICBDT05GSUdfSFdfUkFORE9NX1ZJUlRJTz15
Cj4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
