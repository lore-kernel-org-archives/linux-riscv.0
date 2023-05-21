Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCD2C77B7C
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 15:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kSUcmtFYLpRFkg4fY/5VJtr4Ro2AERvn5bzI0AeHWKQ=; b=N/BWdp6CW0Hqix
	L+p6FJJfo8tSQVAMHtwsN9WOhFOnM7gA5ZK4X7mwBeUOOeU/U0efm6J/DnHKAjySZALIvasUtHyrg
	TXVMY40/vXJ/lwhW2gLbeMm06WRJ1DxdsgpJd75Ro0yPkD59LLNZwQQKcOB95/nTPbP6BAjagdAxl
	sRhptXtuFtIYafkjyMV0gYJ7kGlFw0erCwMC3P+3MspRNf+6Ag4zCu4H76b11vCLQMRCxhpW+JmAE
	fKDTxut8eK2wd7X9cCJytK+LEeQn5d/FFjuB4bpHynjxEs2ukUW/1gct4lLQ7J6vuDXGd+A7CeMsO
	6iDfSIdmvcS+TTBKV8cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0l0n-0045V1-1y;
	Sun, 21 May 2023 15:30:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0l0k-0045U9-0i;
	Sun, 21 May 2023 15:30:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 54E7A61508;
	Sun, 21 May 2023 15:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3330C4339B;
	Sun, 21 May 2023 15:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684683016;
	bh=YPMM/8GlJbBOcfom5pOdN7LyjQ75t5SA5nQ04f6GwkY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eeUqfok0OaJAh/CZBmIcAYF7tx7N+bq5FayfRUeapjoumtfNDG5+Avg4yaR7ciUi+
	 J/TjVFGF0EEY4J8PBXGMf33IjJalzMjGuOUxzJhznD58hvq+NMA3WU8fQdYZs+E3t2
	 tVAiuOpht2Dj40YgONNLeEJ93s8e8I9pDOiYUdxCv5/vXVR70JehEre95Waqg7NbFj
	 wJWI0TDXbpBNK8emwFkuC/+yJcdzclhkJVQRa9Yb4ZqnlQXW5Z+RX4SVX/nzVYyCfN
	 eyAdHMqNWKa11JRdK2v7vsOlFvLGDLwKKKF6A86Yi1PuvTtp4pZlfv5nmK6iUW+bsC
	 IhGKxxfy6dV5w==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-50db91640d3so7945938a12.0;
        Sun, 21 May 2023 08:30:16 -0700 (PDT)
X-Gm-Message-State: AC+VfDz4YHzDI+WLhEX80RxpWQA8g++fdGmegIOgJRW97Cq8Vu6XCVXC
	l5z/+hLqS72f4p0K/SxZiYJjUytkf1jy/lwDfc4=
X-Google-Smtp-Source: ACHHUZ7fC7VoTCmxVvgnj+XprmdOzTdADfx+p51AfUU2RX+IjuemmurGhjjXvb4ZOHMk5eyEyL8M50rHqnEzEEon25w=
X-Received: by 2002:a17:907:8a20:b0:96a:861:a2ac with SMTP id
 sc32-20020a1709078a2000b0096a0861a2acmr8333246ejc.0.1684683014948; Sun, 21
 May 2023 08:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230516200341.553413-1-arnd@kernel.org>
In-Reply-To: <20230516200341.553413-1-arnd@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 21 May 2023 23:30:03 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTqoE=Hty7q__m_4zvTOpC8cDpnK1ghEuFVZ+KrA7xmfA@mail.gmail.com>
Message-ID: <CAJF2gTTqoE=Hty7q__m_4zvTOpC8cDpnK1ghEuFVZ+KrA7xmfA@mail.gmail.com>
Subject: Re: [PATCH] irq_work: consolidate arch_irq_work_raise prototypes
To: Arnd Bergmann <arnd@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-csky@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_083018_345948_0EEF1EF7 
X-CRM114-Status: GOOD (  20.34  )
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

T24gV2VkLCBNYXkgMTcsIDIwMjMgYXQgNDowM+KAr0FNIEFybmQgQmVyZ21hbm4gPGFybmRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+
Cj4gVGhlIHByb3RvdHlwZSB3YXMgaGlkZGVuIG9uIHg4Niwgd2hpY2ggY2F1c2VzIGEgd2Fybmlu
ZzoKPgo+IGtlcm5lbC9pcnFfd29yay5jOjcyOjEzOiBlcnJvcjogbm8gcHJldmlvdXMgcHJvdG90
eXBlIGZvciAnYXJjaF9pcnFfd29ya19yYWlzZScgWy1XZXJyb3I9bWlzc2luZy1wcm90b3R5cGVz
XQo+Cj4gRml4IHRoaXMgYnkgcHJvdmlkaW5nIGl0IGluIG9ubHkgb25lIHBsYWNlIHRoYXQgaXMg
YWx3YXlzIHZpc2libGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFy
bmRiLmRlPgo+IC0tLQo+ICBhcmNoL2FybS9pbmNsdWRlL2FzbS9pcnFfd29yay5oICAgICB8IDIg
LS0KPiAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9pcnFfd29yay5oICAgfCAyIC0tCj4gIGFyY2gv
Y3NreS9pbmNsdWRlL2FzbS9pcnFfd29yay5oICAgIHwgMiArLQo+ICBhcmNoL3Bvd2VycGMvaW5j
bHVkZS9hc20vaXJxX3dvcmsuaCB8IDEgLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2lycV93
b3JrLmggICB8IDIgKy0KPiAgYXJjaC9zMzkwL2luY2x1ZGUvYXNtL2lycV93b3JrLmggICAgfCAy
IC0tCj4gIGFyY2gveDg2L2luY2x1ZGUvYXNtL2lycV93b3JrLmggICAgIHwgMSAtCj4gIGluY2x1
ZGUvbGludXgvaXJxX3dvcmsuaCAgICAgICAgICAgIHwgMyArKysKPiAgOCBmaWxlcyBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
YXJtL2luY2x1ZGUvYXNtL2lycV93b3JrLmggYi9hcmNoL2FybS9pbmNsdWRlL2FzbS9pcnFfd29y
ay5oCj4gaW5kZXggMzE0OWU0ZGMxYjU0Li44ODk1OTk5ODM0Y2MgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9hcm0vaW5jbHVkZS9hc20vaXJxX3dvcmsuaAo+ICsrKyBiL2FyY2gvYXJtL2luY2x1ZGUvYXNt
L2lycV93b3JrLmgKPiBAQCAtOSw2ICs5LDQgQEAgc3RhdGljIGlubGluZSBib29sIGFyY2hfaXJx
X3dvcmtfaGFzX2ludGVycnVwdCh2b2lkKQo+ICAgICAgICAgcmV0dXJuIGlzX3NtcCgpOwo+ICB9
Cj4KPiAtZXh0ZXJuIHZvaWQgYXJjaF9pcnFfd29ya19yYWlzZSh2b2lkKTsKPiAtCj4gICNlbmRp
ZiAvKiBfQVNNX0FSTV9JUlFfV09SS19IICovCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5j
bHVkZS9hc20vaXJxX3dvcmsuaCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vaXJxX3dvcmsuaAo+
IGluZGV4IDgxYmJmYTNhMDM1Yi4uYTEwMjAyODVlYTc1IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJt
NjQvaW5jbHVkZS9hc20vaXJxX3dvcmsuaAo+ICsrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20v
aXJxX3dvcmsuaAo+IEBAIC0yLDggKzIsNiBAQAo+ICAjaWZuZGVmIF9fQVNNX0lSUV9XT1JLX0gK
PiAgI2RlZmluZSBfX0FTTV9JUlFfV09SS19ICj4KPiAtZXh0ZXJuIHZvaWQgYXJjaF9pcnFfd29y
a19yYWlzZSh2b2lkKTsKPiAtCj4gIHN0YXRpYyBpbmxpbmUgYm9vbCBhcmNoX2lycV93b3JrX2hh
c19pbnRlcnJ1cHQodm9pZCkKPiAgewo+ICAgICAgICAgcmV0dXJuIHRydWU7Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvY3NreS9pbmNsdWRlL2FzbS9pcnFfd29yay5oIGIvYXJjaC9jc2t5L2luY2x1ZGUv
YXNtL2lycV93b3JrLmgKPiBpbmRleCAzM2FhZjM5ZDZmOTQuLmQzOWZjYzFmNTM5NSAxMDA2NDQK
PiAtLS0gYS9hcmNoL2Nza3kvaW5jbHVkZS9hc20vaXJxX3dvcmsuaAo+ICsrKyBiL2FyY2gvY3Nr
eS9pbmNsdWRlL2FzbS9pcnFfd29yay5oCj4gQEAgLTcsNSArNyw1IEBAIHN0YXRpYyBpbmxpbmUg
Ym9vbCBhcmNoX2lycV93b3JrX2hhc19pbnRlcnJ1cHQodm9pZCkKPiAgewo+ICAgICAgICAgcmV0
dXJuIHRydWU7Cj4gIH0KPiAtZXh0ZXJuIHZvaWQgYXJjaF9pcnFfd29ya19yYWlzZSh2b2lkKTsK
PiArCkFja2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KCj4gICNlbmRpZiAvKiBf
X0FTTV9DU0tZX0lSUV9XT1JLX0ggKi8KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtL2lycV93b3JrLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vaXJxX3dvcmsuaAo+
IGluZGV4IGI4YjBiZThmMWEwNy4uYzZkMzA3OGJkOGMzIDEwMDY0NAo+IC0tLSBhL2FyY2gvcG93
ZXJwYy9pbmNsdWRlL2FzbS9pcnFfd29yay5oCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL2lycV93b3JrLmgKPiBAQCAtNiw2ICs2LDUgQEAgc3RhdGljIGlubGluZSBib29sIGFyY2hf
aXJxX3dvcmtfaGFzX2ludGVycnVwdCh2b2lkKQo+ICB7Cj4gICAgICAgICByZXR1cm4gdHJ1ZTsK
PiAgfQo+IC1leHRlcm4gdm9pZCBhcmNoX2lycV93b3JrX3JhaXNlKHZvaWQpOwo+Cj4gICNlbmRp
ZiAvKiBfQVNNX1BPV0VSUENfSVJRX1dPUktfSCAqLwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2lycV93b3JrLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2lycV93b3Jr
LmgKPiBpbmRleCBiNTM4OTE5NjRhZTAuLmIyN2E0ZDY0ZmM2YSAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2lycV93b3JrLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2lycV93b3JrLmgKPiBAQCAtNiw1ICs2LDUgQEAgc3RhdGljIGlubGluZSBib29sIGFyY2hf
aXJxX3dvcmtfaGFzX2ludGVycnVwdCh2b2lkKQo+ICB7Cj4gICAgICAgICByZXR1cm4gSVNfRU5B
QkxFRChDT05GSUdfU01QKTsKPiAgfQo+IC1leHRlcm4gdm9pZCBhcmNoX2lycV93b3JrX3JhaXNl
KHZvaWQpOwo+ICsKPiAgI2VuZGlmIC8qIF9BU01fUklTQ1ZfSVJRX1dPUktfSCAqLwo+IGRpZmYg
LS1naXQgYS9hcmNoL3MzOTAvaW5jbHVkZS9hc20vaXJxX3dvcmsuaCBiL2FyY2gvczM5MC9pbmNs
dWRlL2FzbS9pcnFfd29yay5oCj4gaW5kZXggNjAzNzgzNzY2ZDBhLi5mMDBjOWY2MTBkNWEgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9zMzkwL2luY2x1ZGUvYXNtL2lycV93b3JrLmgKPiArKysgYi9hcmNo
L3MzOTAvaW5jbHVkZS9hc20vaXJxX3dvcmsuaAo+IEBAIC03LDYgKzcsNCBAQCBzdGF0aWMgaW5s
aW5lIGJvb2wgYXJjaF9pcnFfd29ya19oYXNfaW50ZXJydXB0KHZvaWQpCj4gICAgICAgICByZXR1
cm4gdHJ1ZTsKPiAgfQo+Cj4gLXZvaWQgYXJjaF9pcnFfd29ya19yYWlzZSh2b2lkKTsKPiAtCj4g
ICNlbmRpZiAvKiBfQVNNX1MzOTBfSVJRX1dPUktfSCAqLwo+IGRpZmYgLS1naXQgYS9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS9pcnFfd29yay5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vaXJxX3dvcmsu
aAo+IGluZGV4IDgwMGZmY2UwZGIyOS4uNmI0ZDM2Yzk1MTY1IDEwMDY0NAo+IC0tLSBhL2FyY2gv
eDg2L2luY2x1ZGUvYXNtL2lycV93b3JrLmgKPiArKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9p
cnFfd29yay5oCj4gQEAgLTksNyArOSw2IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBhcmNoX2lycV93
b3JrX2hhc19pbnRlcnJ1cHQodm9pZCkKPiAgewo+ICAgICAgICAgcmV0dXJuIGJvb3RfY3B1X2hh
cyhYODZfRkVBVFVSRV9BUElDKTsKPiAgfQo+IC1leHRlcm4gdm9pZCBhcmNoX2lycV93b3JrX3Jh
aXNlKHZvaWQpOwo+ICAjZWxzZQo+ICBzdGF0aWMgaW5saW5lIGJvb2wgYXJjaF9pcnFfd29ya19o
YXNfaW50ZXJydXB0KHZvaWQpCj4gIHsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9pcnFf
d29yay5oIGIvaW5jbHVkZS9saW51eC9pcnFfd29yay5oCj4gaW5kZXggOGNkMTFhMjIzMjYwLi4x
MzZmMjk4MGNiYTMgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9pcnFfd29yay5oCj4gKysr
IGIvaW5jbHVkZS9saW51eC9pcnFfd29yay5oCj4gQEAgLTY2LDYgKzY2LDkgQEAgdm9pZCBpcnFf
d29ya19zeW5jKHN0cnVjdCBpcnFfd29yayAqd29yayk7Cj4gIHZvaWQgaXJxX3dvcmtfcnVuKHZv
aWQpOwo+ICBib29sIGlycV93b3JrX25lZWRzX2NwdSh2b2lkKTsKPiAgdm9pZCBpcnFfd29ya19z
aW5nbGUodm9pZCAqYXJnKTsKPiArCj4gK3ZvaWQgYXJjaF9pcnFfd29ya19yYWlzZSh2b2lkKTsK
PiArCj4gICNlbHNlCj4gIHN0YXRpYyBpbmxpbmUgYm9vbCBpcnFfd29ya19uZWVkc19jcHUodm9p
ZCkgeyByZXR1cm4gZmFsc2U7IH0KPiAgc3RhdGljIGlubGluZSB2b2lkIGlycV93b3JrX3J1bih2
b2lkKSB7IH0KPiAtLQo+IDIuMzkuMgo+CgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
