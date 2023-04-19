Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D133EC77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 02:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q1pyBJFrLvf8DRIt4EAxEQR1N/SWTmd87YC/hgq/+pA=; b=rrFuXEx/YS5OU/
	JJSiXYcayvZNdgphax2eSLDw16qdRJ6q47gT28mtAxnlTq2XLcqKMOxSjdYDqj9oVj6ORbm0KPzxJ
	vJB8waPnMzqY4GuQKxKXQP3w1qej4GxhEML90l4Q/VkrDqwAvDmFHfXxRTS6lKq4m9ZtQcWqXBKNp
	moC29hWXAnULPt+D8LNYksRnYN5hIdDmmCnunlO6zkY/MaZuTaRckIt+cA/yjPtWnHzLyka0B84sD
	zs+KskdcHylurJJyVEOUpVzIGmrD8hr+8xqm/B6dqYklm6IZFOo3G7B7TXC+A3r0F6BAQ1KXLS+/5
	XrocIAT/poghCBHfjWAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poxqS-003oQH-1K;
	Wed, 19 Apr 2023 02:46:56 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poxqP-003oP1-06
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 02:46:54 +0000
Received: by mail-ej1-x635.google.com with SMTP id ud9so77845093ejc.7
        for <linux-riscv@lists.infradead.org>; Tue, 18 Apr 2023 19:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1681872410; x=1684464410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2vBa433INXpwxf/vQcrrT0UFfPGPq+8GhQBLQMIVnQ=;
        b=3x3qdfqgPPOdkPFYRRoL/OQsV3IxiwB9/khhNg39FXiAgvw7/7Yq9YdaCcTqSTKdMO
         e3a7xh8XXy+xTWB1c4HQyw2ZyXBNN6+CNFtaHowG6IyPsBGd+zA8o+dSKBOxaaNpeUea
         s1dvdCFgQww8OhXVi5utwAkwfKJL3g8SIxbDREJ9TJkH1XhqcV0wJi0fRtbWY+xoaPnM
         dIc/8hCwmSNE9Odw4s3zyhYdi7Z0/i9T7sfRc4btYCFhPy3+Ps5C7WM0tF5E6Pb8GKQE
         47s95eExISnQL2ApcOfZRBZ+i+ojB4kwHKKL2sb5+NgXE2zFXsuDtoKioWSX7TipfLg9
         cgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681872410; x=1684464410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2vBa433INXpwxf/vQcrrT0UFfPGPq+8GhQBLQMIVnQ=;
        b=CiHmG8fsv+NIYlnHHgrjseciqXljbJA7CWHw20jsHamfvoxsZvu2fEWrWUgw/gxC+n
         paZ6pASU/itF7RtakR+AbdJWddCCUZV+05qecnkZqqkcJc8+aOqJWdfc8Vb3nrlrjymD
         YM6qUWxxY6GbVtEc5XT8zOURkMYir2riskjIW1M7ePQ4d6sElFDrgLO0vzXaR4xa8nY7
         WcLqRPO6sfFFtMzHDwoRVXz4EWCcuRGPMzMUg7HbC+4xAUa6GKQhEJIcBmIsYn7sVoxr
         +Vc1Lb+RLo39ITPEQC7+7b/Z1gMXr+D3LVSVylhUDHtMnHVsfjVPCpnM5Z3sahbzhe+L
         fSdA==
X-Gm-Message-State: AAQBX9e2Ix0+BqcrESbPZayxZhJ8RlPwdQEoKTac0ImloIhyLDN+pDDa
	/ORhDaj4cZF9h62gIU79w4hqbN7bzuBjoo2L3x8xyA==
X-Google-Smtp-Source: AKy350Z6+jK/PM/xSJspnT7QqbQWFEVMFBr49J7MQW6Uh3I2UmQ5STweXzYucN2UX8zPn3hAX2G+olN+d0Gh41fLahY=
X-Received: by 2002:a17:906:c355:b0:94f:b5c:a254 with SMTP id
 ci21-20020a170906c35500b0094f0b5ca254mr11125425ejb.49.1681872410050; Tue, 18
 Apr 2023 19:46:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230404153452.2405681-1-apatel@ventanamicro.com> <20230404153452.2405681-3-apatel@ventanamicro.com>
In-Reply-To: <20230404153452.2405681-3-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 19 Apr 2023 08:16:37 +0530
Message-ID: <CAAhSdy1FKKt-RpE5f8ZEaQyoJL4oEr=YB3MfKDdHqFmL+AyrHg@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] RISC-V: Detect AIA CSRs from ISA string
To: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_194653_265111_006C4D05 
X-CRM114-Status: GOOD (  17.04  )
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

SGkgUGFsbWVyLAoKT24gVHVlLCBBcHIgNCwgMjAyMyBhdCA5OjA14oCvUE0gQW51cCBQYXRlbCA8
YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gV2UgaGF2ZSB0d28gZXh0ZW5zaW9u
IG5hbWVzIGZvciBBSUEgSVNBIHN1cHBvcnQ6IFNtYWlhIChNLW1vZGUgQUlBIENTUnMpCj4gYW5k
IFNzYWlhIChTLW1vZGUgQUlBIENTUnMpLgo+Cj4gV2UgZXh0ZW5kIHRoZSBJU0Egc3RyaW5nIHBh
cnNpbmcgdG8gZGV0ZWN0IFNtYWlhIGFuZCBTc2FpYSBleHRlbnNpb25zLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gUmV2aWV3ZWQtYnk6
IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gUmV2aWV3ZWQtYnk6IEF0
aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgoKQ2FuIHlvdSBwbGVhc2UgQUNLIHRoaXMg
cGF0Y2ggc28gdGhhdCBJIGNhbiBpbmNsdWRlIGl0IGluIExpbnV4LTYuNCBQUiA/CgpSZWdhcmRz
LApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggfCAyICsrCj4g
IGFyY2gvcmlzY3Yva2VybmVsL2NwdS5jICAgICAgICB8IDIgKysKPiAgYXJjaC9yaXNjdi9rZXJu
ZWwvY3B1ZmVhdHVyZS5jIHwgMiArKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+IGluZGV4IDYyNjNhMGRlMWM2YS4uNzRmNWRhYjIx
NDhmIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+ICsrKyBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+IEBAIC00Miw2ICs0Miw4IEBACj4gICNk
ZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQkIgICAgICAgICAgICAgIDMwCj4gICNkZWZpbmUgUklTQ1Zf
SVNBX0VYVF9aSUNCT00gICAgICAgICAgIDMxCj4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aSUhJ
TlRQQVVTRSAgICAgIDMyCj4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TTUFJQSAgICAgICAgICAg
IDMzCj4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TU0FJQSAgICAgICAgICAgIDM0Cj4KPiAgI2Rl
ZmluZSBSSVNDVl9JU0FfRVhUX01BWCAgICAgICAgICAgICAgNjQKPiAgI2RlZmluZSBSSVNDVl9J
U0FfRVhUX05BTUVfTEVOX01BWCAgICAgMzIKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJu
ZWwvY3B1LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYwo+IGluZGV4IDg0MDBmMGNjOTcwNC4u
YWUxZTdiYmY5MzQ0IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdS5jCj4gKysr
IGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMKPiBAQCAtMTg4LDYgKzE4OCw4IEBAIHN0YXRpYyBz
dHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIGlzYV9leHRfYXJyW10gPSB7Cj4gICAgICAgICBfX1JJ
U0NWX0lTQV9FWFRfREFUQSh6aWNib20sIFJJU0NWX0lTQV9FWFRfWklDQk9NKSwKPiAgICAgICAg
IF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHppaGludHBhdXNlLCBSSVNDVl9JU0FfRVhUX1pJSElOVFBB
VVNFKSwKPiAgICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpiYiwgUklTQ1ZfSVNBX0VYVF9a
QkIpLAo+ICsgICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoc21haWEsIFJJU0NWX0lTQV9FWFRf
U01BSUEpLAo+ICsgICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoc3NhaWEsIFJJU0NWX0lTQV9F
WFRfU1NBSUEpLAo+ICAgICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoc3Njb2ZwbWYsIFJJU0NW
X0lTQV9FWFRfU1NDT0ZQTUYpLAo+ICAgICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoc3N0Yywg
UklTQ1ZfSVNBX0VYVF9TU1RDKSwKPiAgICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHN2aW52
YWwsIFJJU0NWX0lTQV9FWFRfU1ZJTlZBTCksCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2Vy
bmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+IGluZGV4
IDU5ZDU4ZWUwZjY4ZC4uOWU5MmUyM2Y2ZjgyIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2Vy
bmVsL2NwdWZlYXR1cmUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+
IEBAIC0yMjEsNiArMjIxLDggQEAgdm9pZCBfX2luaXQgcmlzY3ZfZmlsbF9od2NhcCh2b2lkKQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIH0gZWxzZSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBzb3J0ZWQg
YWxwaGFiZXRpY2FsbHkgKi8KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNFVF9J
U0FfRVhUX01BUCgic21haWEiLCBSSVNDVl9JU0FfRVhUX1NNQUlBKTsKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFNFVF9JU0FfRVhUX01BUCgic3NhaWEiLCBSSVNDVl9JU0FfRVhU
X1NTQUlBKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNFVF9JU0FfRVhUX01B
UCgic3Njb2ZwbWYiLCBSSVNDVl9JU0FfRVhUX1NTQ09GUE1GKTsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFNFVF9JU0FfRVhUX01BUCgic3N0YyIsIFJJU0NWX0lTQV9FWFRfU1NU
Qyk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTRVRfSVNBX0VYVF9NQVAoInN2
aW52YWwiLCBSSVNDVl9JU0FfRVhUX1NWSU5WQUwpOwo+IC0tCj4gMi4zNC4xCj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
