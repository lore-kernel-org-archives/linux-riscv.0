Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0034C001DB
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 09:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M4dI686RFoji0zpc8R4E0FWZIPd8idVC849hXeRlZ/g=; b=pc846POJ1eymbO
	L448cM7KQDt0JMGHPFVOfnPwGGIPX5wJ+J+/W8Q6UJbkfjutG3C71gu+JFlEKtgL3YlH/byzxx+pM
	UmOQ7Ai9rPC0EjKgmzVa+7WHFq4zAFYRjcay+zSa4WU7To6NU2SYsB7F4UFFSUgwuvMkmt2/KYB2D
	kpOdlNukSTsazpHeKuQCDaO3jT/V8qrvvBk+tj/5FweIX9VAO31srtY2c0Y3uPFFBP24C0D2ZJ+/w
	HdHdx5lLeEKhtC5cPERUCEIhFG/EspFJ5J5DFVftN4XgdsKpIbHhYlafGs+WV7pJHhDlvSQY8L9a/
	p5a4Q68YHiU2Ik/ohEDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRqqP-00ByaA-0V;
	Fri, 04 Aug 2023 09:11:37 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRqqM-00ByZH-1b
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 09:11:36 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5222bc916acso2318794a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 02:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1691140292; x=1691745092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCLrMIcrmxPkYa4R7qfeQvE0tPVOXSV4boHfMs5CXCw=;
        b=e7TjRfOyN4hnGmNqQDqDk2MoCCyGYJlKRtgX8kcspaBT9rO0VX/9xDn1We+detSqQ0
         65OL305lzPVJxdiHn4qeII8Hsc6nRLfWzwoz8DJevMvoJpym3NrVxxtEfD1yOJZdhvfG
         wByQjNIP7InMrnTq2G9APZbXSNJqWkpZQjbs5r7naeqtwvZ5N4nGICruwbZpjTLkta4a
         +c/w33gcfCcH4NJ2SWspuHn3wBuIKgLUul/0ihqQ2V/IJHbZ/bm2pakiXJlKPzSBwsV+
         T7qgV2Zh+vIkbJdK7UcA1Y0+padUgmtl4e7yvby1v8TQgNnOU9M4X+sLb7/xbSHAT6j/
         /yXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691140292; x=1691745092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCLrMIcrmxPkYa4R7qfeQvE0tPVOXSV4boHfMs5CXCw=;
        b=NbrfP5s9+tRpHM+Aw/aiCQCX0hWeEcDmYSTPod9nHYn4M1dMzu0GeB607ZQlJLTDKa
         G2zJ/GNZgxlLcJdzj+Ziv7J9A57etAQ1D5lAlj1LEHhghME8H9gaILzj3FodYnKXtO/P
         rYJXaSnF2LBZqP5ITJvZx1DyozllwgPGlvBfbXk7KPxqwhXedY6mZpHCMWYjFJNWPBVf
         ruIUDcW0KHfAoYU2LIv6XAZwekA7NGZYXMS0uoqul5gWNY+O2kPNcWGBHJq3RbgTwb+O
         8IVQhSFJdt4WraW3FfaW/8qi2LUPfILz8cdBa7ARjiGWns2NNdDAkwyhnMs55IMMi/yP
         dHdg==
X-Gm-Message-State: AOJu0Yxra2MHbBC2qYTPNwxEMNKqCAtrasJLQBBJMbYe6OfdhM2xy8l7
	TUS9NlwZAgdkhchMfiR1cStZXQjngvRGwNvJ95hNnw==
X-Google-Smtp-Source: AGHT+IG0L5EQE0VXMUNJlUQFay1dJwjekRL8tawBeRTK1zsdM3y6pPSjp/CooI8XEt894peGJueURTR8hnSRzdvc2Lc=
X-Received: by 2002:aa7:cb57:0:b0:522:bc01:47ab with SMTP id
 w23-20020aa7cb57000000b00522bc0147abmr1100082edt.29.1691140292458; Fri, 04
 Aug 2023 02:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230803163302.445167-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230803163302.445167-1-dbarboza@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 4 Aug 2023 14:41:21 +0530
Message-ID: <CAAhSdy0PoG=AwvcavJxuS1Y6nbFE8pcX5vXDuzFr6+vjhpAMkQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] RISC-V: KVM: change get_reg/set_reg error code
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, atishp@atishpatra.org, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_021134_734388_00385C63 
X-CRM114-Status: GOOD (  14.34  )
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

T24gVGh1LCBBdWcgMywgMjAyMyBhdCAxMDowM+KAr1BNIERhbmllbCBIZW5yaXF1ZSBCYXJib3ph
CjxkYmFyYm96YUB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gVGhpcyB2ZXJz
aW9uIGluY2x1ZGVzIGEgZGlmZiB0aGF0IEFuZHJldyBtZW50aW9uZWQgaW4gdjIgWzFdIHRoYXQg
SQo+IG1pc3NlZC4gVGhleSB3ZXJlIHNxdWFzaGVkIGludG8gcGF0Y2ggMS4KPgo+IE5vIG90aGVy
IGNoYW5nZXMgbWFkZS4gUGF0Y2hlcyByZWJhc2VkIG9uIHRvcCBvZiByaXNjdl9rdm1fcXVldWUu
Cj4KPiBDaGFuZ2VzIGZyb20gdjM6Cj4gLSBwYXRjaCAxOgo+ICAgLSBhZGRlZCBtaXNzaW5nIEVJ
TlZBTCAtIEVOT0VOVCBjb252ZXJzaW9ucwo+IC0gdjMgbGluazogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcva3ZtLzIwMjMwODAzMTQwMDIyLjM5OTMzMy0xLWRiYXJib3phQHZlbnRhbmFtaWNyby5j
b20vCj4KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcva3ZtLzIwMjMwODAxMjIyNjI5LjIx
MDkyOS0xLWRiYXJib3phQHZlbnRhbmFtaWNyby5jb20vCj4KPgo+IEFuZHJldyBKb25lcyAoMSk6
Cj4gICBSSVNDLVY6IEtWTTogSW1wcm92ZSB2ZWN0b3Igc2F2ZS9yZXN0b3JlIGVycm9ycwo+Cj4g
RGFuaWVsIEhlbnJpcXVlIEJhcmJvemEgKDkpOgo+ICAgUklTQy1WOiBLVk06IHJldHVybiBFTk9F
TlQgaW4gKl9vbmVfcmVnKCkgd2hlbiByZWcgaXMgdW5rbm93bgo+ICAgUklTQy1WOiBLVk06IHVz
ZSBFTk9FTlQgaW4gKl9vbmVfcmVnKCkgd2hlbiBleHRlbnNpb24gaXMgdW5hdmFpbGFibGUKPiAg
IFJJU0MtVjogS1ZNOiBkbyBub3QgRU9QTk9UU1VQUCBpbiBzZXRfb25lX3JlZygpIHppY2JvKG18
eikKPiAgIFJJU0MtVjogS1ZNOiBkbyBub3QgRU9QTk9UU1VQUCBpbiBzZXQgS1ZNX1JFR19SSVND
Vl9USU1FUl9SRUcKPiAgIFJJU0MtVjogS1ZNOiB1c2UgRUJVU1kgd2hlbiAhdmNwdS0+YXJjaC5y
YW5fYXRsZWFzdF9vbmNlCj4gICBSSVNDLVY6IEtWTTogYXZvaWQgRUJVU1kgd2hlbiB3cml0aW5n
IHNhbWUgSVNBIHZhbAo+ICAgUklTQy1WOiBLVk06IGF2b2lkIEVCVVNZIHdoZW4gd3JpdGluZyB0
aGUgc2FtZSBtYWNoaW5lIElEIHZhbAo+ICAgUklTQy1WOiBLVk06IGF2b2lkIEVCVVNZIHdoZW4g
d3JpdGluZyB0aGUgc2FtZSBpc2FfZXh0IHZhbAo+ICAgZG9jczoga3ZtOiByaXNjdjogZG9jdW1l
bnQgRUJVU1kgaW4gS1ZNX1NFVF9PTkVfUkVHCgpJIGhhdmUgcXVldWVkIGFsbCBwYXRjaGVzIGV4
Y2VwdCBQQVRDSDkgZm9yIExpbnV4LTYuNi4KCkRyZXcsIHBsZWFzZSBzZW5kIHY1IG9mIFBBVENI
LgoKVGhhbmtzLApBbnVwCgo+Cj4gIERvY3VtZW50YXRpb24vdmlydC9rdm0vYXBpLnJzdCB8ICAy
ICsKPiAgYXJjaC9yaXNjdi9rdm0vYWlhLmMgICAgICAgICAgIHwgIDQgKy0KPiAgYXJjaC9yaXNj
di9rdm0vdmNwdV9mcC5jICAgICAgIHwgMTIgKysrLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVf
b25lcmVnLmMgICB8IDc0ICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KPiAgYXJj
aC9yaXNjdi9rdm0vdmNwdV9zYmkuYyAgICAgIHwgMTYgKysrKy0tLS0KPiAgYXJjaC9yaXNjdi9r
dm0vdmNwdV90aW1lci5jICAgIHwgMTEgKystLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0
b3IuYyAgIHwgNjAgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCj4gIDcgZmlsZXMgY2hhbmdl
ZCwgMTA3IGluc2VydGlvbnMoKyksIDcyIGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjQxLjAKPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
