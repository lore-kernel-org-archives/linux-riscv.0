Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D51CE79A9
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 19:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zRTuM0zqTraVQe+xm7f+Eo6hoQF/iVXp3B+GX07V18g=; b=xA+umjpRwHXBlC
	Lu+EJgL9PzBc47/0g9xGZRh9WdmUWRL/ziRwZbJSKe5sPJioulorm6iaWAhD0NrW6qn20FQzl9RO4
	OI4+KOWzU4NzgOSOhpPD0rVVk+YG0YApbwRuV53DVbTkrn1EqTZjRSjij6FrY8Lyq8lL1JWWocWUP
	zORuQdNqmt6T3xzqlagiMIYAZSlDKERnZdqRmippwfQv3LR3MsjzS8Ev45FhA0sjm6V4rsz97q06n
	IgOPMBhPYXKEySc4XXnG+2i8bbhdd1Fi/CNlBozR61eKrHR1QREOOigweu2YJd0kWZj0FVCUEsqdV
	DYmEAvff6OGKhHRgowcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qigo5-001BkO-2U;
	Tue, 19 Sep 2023 19:54:49 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qigo2-001Bjc-1y
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 19:54:48 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50098cc8967so9883381e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 12:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1695153284; x=1695758084; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjrdE60++TcwatJpXQy7OuWtzjqtwzDOP4HlaCMD688=;
        b=XH8fjrLd0QZh80oyl3T2khtB/XjC2IdinpyFGkbSr6HljPOho7JWBSraOGOULASOu/
         wHyO4qQMIWPRQrheMf+Vc9bE//VZ5nFYuGdYcdCJ/NkmY3lwKWX6lAALeuZLvzPSD8F0
         9lI1OkMNaYWdQKxT/SCUSfeerhPmJSDwEkpaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695153284; x=1695758084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjrdE60++TcwatJpXQy7OuWtzjqtwzDOP4HlaCMD688=;
        b=rIayZBHsvf3SdNE9eLpgOIHnWSv3uf/ZTEfSNAu1siJUMgJcUOh574buPCCSHt2gYn
         fWZLOj5JbR+SFTPbukVabt3jTxH5470TAAEBVtgQ8b7CR9g4hB8Gow2VqitjGJF7U0Zr
         le0TqE/otraTo/ibJ8Rb4JQDa6R0UY64clNlxPuZMgDijBrqdRcgbefMrq5TGd0KI0Qk
         /88lqVw8K2h8JPqxDcLlO3zsF6EzwtKPjoMtJJYuXvHpUUfBSowLc33cqdnhslSZTtjH
         Npi8e+kIxdK4hUy8diszkimEa9+AI0fTbgo2NeeD838PW336lPkHzOZTemCZfJ3IkgsL
         jrBw==
X-Gm-Message-State: AOJu0YyItmR3LSmroZnc+0YtL3jYQRA6ZbhGl9fa9TVwgQh9QQ50hlmX
	5lDmCsrjlLj4+J+J6cuqK2lGNrrfS4qHLGKH6fjj
X-Google-Smtp-Source: AGHT+IGCP2sHSYQZgQISUa9EgUk/8O464Rrr/vqidV5rzxfkX7nm0h42VEh5K+cIZmfXJ4mpo7ccdy+WLMgXrV6wO8E=
X-Received: by 2002:a05:6512:475:b0:4fe:8c4:44fb with SMTP id
 x21-20020a056512047500b004fe08c444fbmr546266lfd.38.1695153283961; Tue, 19 Sep
 2023 12:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230918180646.1398384-1-apatel@ventanamicro.com> <20230918180646.1398384-4-apatel@ventanamicro.com>
In-Reply-To: <20230918180646.1398384-4-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 19 Sep 2023 12:54:32 -0700
Message-ID: <CAOnJCUJYDHtbYS4js7PSAeLqT4sL5zi7DT5xeSww+5Nvs2UhcA@mail.gmail.com>
Subject: Re: [PATCH 3/4] KVM: riscv: selftests: Fix ISA_EXT register handling
 in get-reg-list
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_125446_673674_D9FC835C 
X-CRM114-Status: GOOD (  20.79  )
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

T24gTW9uLCBTZXAgMTgsIDIwMjMgYXQgMTE6MDfigK9BTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBTYW1lIHNldCBvZiBJU0FfRVhUIHJlZ2lzdGVycyBh
cmUgbm90IHByZXNlbnQgb24gYWxsIGhvc3QgYmVjYXVzZQo+IElTQV9FWFQgcmVnaXN0ZXJzIGFy
ZSB2aXNpYmxlIHRvIHRoZSBLVk0gdXNlciBzcGFjZSBiYXNlZCBvbiB0aGUKPiBJU0EgZXh0ZW5z
aW9ucyBhdmFpbGFibGUgb24gdGhlIGhvc3QuIEFsc28sIGRpc2FibGluZyBhbiBJU0EKPiBleHRl
bnNpb24gdXNpbmcgY29ycmVzcG9uZGluZyBJU0FfRVhUIHJlZ2lzdGVyIGRvZXMgbm90IGFmZmVj
dAo+IHRoZSB2aXNpYmlsaXR5IG9mIHRoZSBJU0FfRVhUIHJlZ2lzdGVyIGl0c2VsZi4KPgo+IEJh
c2VkIG9uIHRoZSBhYm92ZSwgd2Ugc2hvdWxkIGZpbHRlci1vdXQgYWxsIElTQV9FWFQgcmVnaXN0
ZXJzLgo+CgpJbiB0aGF0IGNhc2UsIHdlIGRvbid0IG5lZWQgdGhlIHN3aXRjaCBjYXNlIGFueSBt
b3JlLiBKdXN0IGEKY29uZGl0aW9uYWwgY2hlY2sgd2l0aCBLVk1fUklTQ1ZfSVNBX0VYVF9NQVgg
c2hvdWxkIGJlIHN1ZmZpY2llbnQuCgo+IEZpeGVzOiA0NzcwNjkzOThlZDYgKCJLVk06IHJpc2N2
OiBzZWxmdGVzdHM6IEFkZCBnZXQtcmVnLWxpc3QgdGVzdCIpCj4gU2lnbmVkLW9mZi1ieTogQW51
cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gLS0tCj4gIC4uLi9zZWxmdGVzdHMv
a3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jICAgICAgICB8IDM1ICsrKysrKysrKysrLS0tLS0tLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxp
c3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYwo+
IGluZGV4IGQ4ZWNhY2QwM2VjZi4uNzZjMGFkMTFlNDIzIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYwo+ICsrKyBiL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYwo+IEBAIC0xNCwxNyArMTQs
MzMgQEAKPgo+ICBib29sIGZpbHRlcl9yZWcoX191NjQgcmVnKQo+ICB7Cj4gKyAgICAgICBzd2l0
Y2ggKHJlZyAmIH5SRUdfTUFTSykgewo+ICAgICAgICAgLyoKPiAtICAgICAgICAqIFNvbWUgSVNB
IGV4dGVuc2lvbnMgYXJlIG9wdGlvbmFsIGFuZCBub3QgcHJlc2VudCBvbiBhbGwgaG9zdCwKPiAt
ICAgICAgICAqIGJ1dCB0aGV5IGNhbid0IGJlIGRpc2FibGVkIHRocm91Z2ggSVNBX0VYVCByZWdp
c3RlcnMgd2hlbiBwcmVzZW50Lgo+IC0gICAgICAgICogU28sIHRvIG1ha2UgbGlmZSBlYXN5LCBq
dXN0IGZpbHRlcmluZyBvdXQgdGhlc2Uga2luZCBvZiByZWdpc3RlcnMuCj4gKyAgICAgICAgKiBT
YW1lIHNldCBvZiBJU0FfRVhUIHJlZ2lzdGVycyBhcmUgbm90IHByZXNlbnQgb24gYWxsIGhvc3Qg
YmVjYXVzZQo+ICsgICAgICAgICogSVNBX0VYVCByZWdpc3RlcnMgYXJlIHZpc2libGUgdG8gdGhl
IEtWTSB1c2VyIHNwYWNlIGJhc2VkIG9uIHRoZQo+ICsgICAgICAgICogSVNBIGV4dGVuc2lvbnMg
YXZhaWxhYmxlIG9uIHRoZSBob3N0LiBBbHNvLCBkaXNhYmxpbmcgYW4gSVNBCj4gKyAgICAgICAg
KiBleHRlbnNpb24gdXNpbmcgY29ycmVzcG9uZGluZyBJU0FfRVhUIHJlZ2lzdGVyIGRvZXMgbm90
IGFmZmVjdAo+ICsgICAgICAgICogdGhlIHZpc2liaWxpdHkgb2YgdGhlIElTQV9FWFQgcmVnaXN0
ZXIgaXRzZWxmLgo+ICsgICAgICAgICoKPiArICAgICAgICAqIEJhc2VkIG9uIGFib3ZlLCB3ZSBz
aG91bGQgZmlsdGVyLW91dCBhbGwgSVNBX0VYVCByZWdpc3RlcnMuCj4gICAgICAgICAgKi8KPiAt
ICAgICAgIHN3aXRjaCAocmVnICYgflJFR19NQVNLKSB7Cj4gKyAgICAgICBjYXNlIEtWTV9SRUdf
UklTQ1ZfSVNBX0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhUX0E6Cj4gKyAgICAgICBjYXNlIEtWTV9S
RUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhUX0M6Cj4gKyAgICAgICBjYXNlIEtW
TV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhUX0Q6Cj4gKyAgICAgICBjYXNl
IEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhUX0Y6Cj4gKyAgICAgICBj
YXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhUX0g6Cj4gKyAgICAg
ICBjYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhUX0k6Cj4gKyAg
ICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhUX006Cj4g
KyAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhUX1NW
UEJNVDoKPiAgICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JJU0NWX0lT
QV9FWFRfU1NUQzoKPiAgICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JJ
U0NWX0lTQV9FWFRfU1ZJTlZBTDoKPiAgICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhU
IHwgS1ZNX1JJU0NWX0lTQV9FWFRfWklISU5UUEFVU0U6Cj4gKyAgICAgICBjYXNlIEtWTV9SRUdf
UklTQ1ZfSVNBX0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhUX1pJQ0JPTToKPiArICAgICAgIGNhc2Ug
S1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWklDQk9aOgo+ICAgICAg
ICAgY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQkI6Cj4g
ICAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhUX1NT
QUlBOgo+ICsgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUklTQ1ZfSVNB
X0VYVF9WOgo+ICsgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUklTQ1Zf
SVNBX0VYVF9TVk5BUE9UOgo+ICAgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBL
Vk1fUklTQ1ZfSVNBX0VYVF9aQkE6Cj4gICAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VY
VCB8IEtWTV9SSVNDVl9JU0FfRVhUX1pCUzoKPiAgICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9J
U0FfRVhUIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWklDTlRSOgo+IEBAIC01MCwxMiArNjYsNyBAQCBz
dGF0aWMgaW5saW5lIGJvb2wgdmNwdV9oYXNfZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50
IGV4dCkKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgdmFsdWU7Cj4KPiAgICAgICAgIHJldCA9IF9f
dmNwdV9nZXRfcmVnKHZjcHUsIFJJU0NWX0lTQV9FWFRfUkVHKGV4dCksICZ2YWx1ZSk7Cj4gLSAg
ICAgICBpZiAocmV0KSB7Cj4gLSAgICAgICAgICAgICAgIHByaW50ZigiRmFpbGVkIHRvIGdldCBl
eHQgJWQiLCBleHQpOwo+IC0gICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gLSAgICAgICB9
Cj4gLQo+IC0gICAgICAgcmV0dXJuICEhdmFsdWU7Cj4gKyAgICAgICByZXR1cm4gKHJldCkgPyBm
YWxzZSA6ICEhdmFsdWU7Cj4gIH0KPgo+ICB2b2lkIGZpbmFsaXplX3ZjcHUoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCBzdHJ1Y3QgdmNwdV9yZWdfbGlzdCAqYykKPiBAQCAtNTA2LDEwICs1MTcsNiBA
QCBzdGF0aWMgX191NjQgYmFzZV9yZWdzW10gPSB7Cj4gICAgICAgICBLVk1fUkVHX1JJU0NWIHwg
S1ZNX1JFR19TSVpFX1U2NCB8IEtWTV9SRUdfUklTQ1ZfVElNRVIgfCBLVk1fUkVHX1JJU0NWX1RJ
TUVSX1JFRyh0aW1lKSwKPiAgICAgICAgIEtWTV9SRUdfUklTQ1YgfCBLVk1fUkVHX1NJWkVfVTY0
IHwgS1ZNX1JFR19SSVNDVl9USU1FUiB8IEtWTV9SRUdfUklTQ1ZfVElNRVJfUkVHKGNvbXBhcmUp
LAo+ICAgICAgICAgS1ZNX1JFR19SSVNDViB8IEtWTV9SRUdfU0laRV9VNjQgfCBLVk1fUkVHX1JJ
U0NWX1RJTUVSIHwgS1ZNX1JFR19SSVNDVl9USU1FUl9SRUcoc3RhdGUpLAo+IC0gICAgICAgS1ZN
X1JFR19SSVNDViB8IEtWTV9SRUdfU0laRV9VTE9ORyB8IEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8
IEtWTV9SSVNDVl9JU0FfRVhUX0EsCj4gLSAgICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19T
SVpFX1VMT05HIHwgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JJU0NWX0lTQV9FWFRfQywK
PiAtICAgICAgIEtWTV9SRUdfUklTQ1YgfCBLVk1fUkVHX1NJWkVfVUxPTkcgfCBLVk1fUkVHX1JJ
U0NWX0lTQV9FWFQgfCBLVk1fUklTQ1ZfSVNBX0VYVF9JLAo+IC0gICAgICAgS1ZNX1JFR19SSVND
ViB8IEtWTV9SRUdfU0laRV9VTE9ORyB8IEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SSVND
Vl9JU0FfRVhUX00sCj4gICAgICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpFX1VMT05H
IHwgS1ZNX1JFR19SSVNDVl9TQklfRVhUIHwgS1ZNX1JFR19SSVNDVl9TQklfU0lOR0xFIHwgS1ZN
X1JJU0NWX1NCSV9FWFRfVjAxLAo+ICAgICAgICAgS1ZNX1JFR19SSVNDViB8IEtWTV9SRUdfU0la
RV9VTE9ORyB8IEtWTV9SRUdfUklTQ1ZfU0JJX0VYVCB8IEtWTV9SRUdfUklTQ1ZfU0JJX1NJTkdM
RSB8IEtWTV9SSVNDVl9TQklfRVhUX1RJTUUsCj4gICAgICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZN
X1JFR19TSVpFX1VMT05HIHwgS1ZNX1JFR19SSVNDVl9TQklfRVhUIHwgS1ZNX1JFR19SSVNDVl9T
QklfU0lOR0xFIHwgS1ZNX1JJU0NWX1NCSV9FWFRfSVBJLAo+IC0tCj4gMi4zNC4xCj4KCgotLSAK
UmVnYXJkcywKQXRpc2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
