Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3069C77B60
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 12:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/WGKwK0D61zjFX1o+J25XfJCFdR3XfqKKQWeZ71hHy4=; b=4Rj+1dUo7bAdlx
	rO6qZp7vkAz1Z2XaBt88v9YqdorBjtQxSjgnUWfdveyRkl364/3bd/JoD6vrsxrA9WxPg9a48c/Tl
	HOhKJClrY9QcCUiXVzDDUpBVdB1D0RVw8cCfjdQ4s89zu6Mn55uSHuS0Vmi3mkDymKAn1svyRclZM
	EoJFHpyeN8ITrd1tDr4dd7eDLpIVOjxb7esw0WZnDOz0qQ/JH2+PHKTiFYXuojIFSohStbvae7OHx
	KsOYTFqRhUhek8Z78Fz/lG1wd7sXJnv/C78HKzNhMHrqI4rULP2bOhgx58tmaD3g6meAlOWYmhC55
	xg0qwr1r4RQbEzgTv/VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjIwv-00FDsq-1W;
	Mon, 03 Apr 2023 12:06:13 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjIws-00FDrS-2h
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 12:06:11 +0000
Received: by mail-ed1-x533.google.com with SMTP id r11so116382090edd.5
        for <linux-riscv@lists.infradead.org>; Mon, 03 Apr 2023 05:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112; t=1680523567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZfKyBaaKHbQvgg/VJsrpQyMIGk/2wuGGA+Z7SD3s4Q=;
        b=hi3PNsTKURB5PVdNZkcXbSPnvmQOvG9rz7V/2C2ROw3ba1F6KlTOwgcj4AtIIhr0ST
         3JfoPVfkamnbtBhUnQiyaLqnV3kq81AUaM6G+D8rT3CfvpATriU8WdWOmaeC/tBDlG2O
         2vb7wClsSykyLAYi7FkDWhKUO4NSA0crquEyH8EDqValishYZ93lVuNAHMiUL6UXBIzM
         UCiv9dKt8RUTV5Bp+Y4cNEC364qr84jwVdGaTnWk7j1a6wW73/+El9GZa/9cbMqGOPTf
         rx1xxDj1JJg8rQJoyoBPgORNB0o+cmt78EhHhTnvdncg3T3MjK1qRyS/EdD2kzeh7+Of
         8fRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680523567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZfKyBaaKHbQvgg/VJsrpQyMIGk/2wuGGA+Z7SD3s4Q=;
        b=SVPyUVP7EneIaegeDHKe/SXmEd+tQxf+0R4I4rd+id5Rnd+el+rGFyVpSA3s023trw
         7h6qVGwaF40nyieh2fQ3nmL4UDN1yE0VEBmx/s+Rp38dQObpTEyXI1vFkMAmYjxAEdJI
         GvAqlW1LcikQyk6HkF0+Xv67uQ79LhUyiaSj13y5TYjWLUocXvSha/nPE5NvAoVT0Vq+
         uD3pLaR9F9ObuFCEoAnibH3zjrvkqM4AoqPh026tt8vGnT9uJyByQyQe5w8SeZb8H/Ni
         9KxYza3J+0rqgtDPYyXi5Aaa5zNgDZYChYgcXCVoHAWFEhbl0S4hDJzr71mYv1tjt8EN
         Iqtw==
X-Gm-Message-State: AAQBX9eRsKGi0FlFcM/hPieH51ZXQNY1lv0qCU8zIXadmv6B83h+ctzh
	x366fxeCTGvHEVIsR3GjN6jSbVHVfsqDIMq0eX55hA==
X-Google-Smtp-Source: AKy350Y+VYvsNjh0WcR57yewEEKViES5vHUz2CstIZgU1iqEfYqNKp9hEOLycwhS0LrtxrS0Xjd+IOOEaQtT21owqTc=
X-Received: by 2002:a17:906:2357:b0:931:cac0:60ff with SMTP id
 m23-20020a170906235700b00931cac060ffmr16919310eja.13.1680523566836; Mon, 03
 Apr 2023 05:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230403093310.2271142-1-apatel@ventanamicro.com>
 <20230403093310.2271142-3-apatel@ventanamicro.com> <20230403-80af54e80a34fc70fad04e0c@wendy>
In-Reply-To: <20230403-80af54e80a34fc70fad04e0c@wendy>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 3 Apr 2023 17:35:54 +0530
Message-ID: <CAAhSdy1L55ZOTKhv81baAMPkEQ==Oz0KgoULkq1mFx4GWN+Sow@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] RISC-V: Detect AIA CSRs from ISA string
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_050610_874268_26E5AD53 
X-CRM114-Status: GOOD (  11.04  )
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

T24gTW9uLCBBcHIgMywgMjAyMyBhdCAzOjEw4oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vci5kb29s
ZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEFwciAwMywgMjAyMyBhdCAwMzow
MzowNFBNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5j
Cj4gPiBpbmRleCA1OWQ1OGVlMGY2OGQuLjFiMTNhNTgyM2I5MCAxMDA2NDQKPiA+IC0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwv
Y3B1ZmVhdHVyZS5jCj4gPiBAQCAtMjIxLDggKzIyMSwxMCBAQCB2b2lkIF9faW5pdCByaXNjdl9m
aWxsX2h3Y2FwKHZvaWQpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgfSBlbHNlIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIC8qIHNvcnRlZCBhbHBoYWJldGljYWxseSAqLwo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXl5eXl5eXl5eXl5eXl5eXl5eXl5eCj4KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFNFVF9JU0FfRVhUX01BUCgic3NhaWEiLCBSSVNDVl9JU0FfRVhUX1NT
QUlBKTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNFVF9JU0FfRVhUX01BUCgi
c3Njb2ZwbWYiLCBSSVNDVl9JU0FfRVhUX1NTQ09GUE1GKTsKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFNFVF9JU0FfRVhUX01BUCgic3N0YyIsIFJJU0NWX0lTQV9FWFRfU1NUQyk7
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTRVRfSVNBX0VYVF9NQVAoInNtYWlh
IiwgUklTQ1ZfSVNBX0VYVF9TTUFJQSk7Cj4KPiBUaGlzIGVudHJ5IGhhcyBiZWVuIGFkZGVkIGlu
IGFuIGluY29ycmVjdCBvcmRlciBjaGllZiA6LwoKT2theSwgSSB3aWxsIHVwZGF0ZSBpbiB0aGUg
bmV4dCByZXZpc2lvbi4KCj4KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNFVF9J
U0FfRVhUX01BUCgic3ZpbnZhbCIsIFJJU0NWX0lTQV9FWFRfU1ZJTlZBTCk7Cj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBTRVRfSVNBX0VYVF9NQVAoInN2cGJtdCIsIFJJU0NWX0lT
QV9FWFRfU1ZQQk1UKTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNFVF9JU0Ff
RVhUX01BUCgiemJiIiwgUklTQ1ZfSVNBX0VYVF9aQkIpOwoKUmVnYXJkcywKQW51cAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
