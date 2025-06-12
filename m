Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7F2C71136
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 19:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tNRGLoKCLLRK+nW4L8/OOGQlAF68fibNfSzrA9quG8E=; b=UfXK4pGVxs9ZEI
	CMz991dxYOnyJDUNyfVklBZsSNG2cPm4WaNsP4/zb2vhqWKaucvNy/x/s5MSDiH04TkWptVDarCpG
	S+nLg2jZ9cs+R+7k0OKgzjKJqBwEqEAvtQrQL7N0Ff55kfmJZj3LZjNStmqznJHSNU4yzpZipHBqv
	Zqfc6WZXPLXKKKX8XauWpcRO+vrT1cRGjpd5qIzUwzL16J9j5d7FrWJ05ScfGx0bZsRv2gQHTMB3a
	OTIXuNiIEfwTGqrOFHSH/0A5NBHdg3300dbLjINZlEQP8uOhraCnGZobkj66p0TuntgqAjYhpqc5X
	xSi3Y7moKVm80vPHadfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnrC-0000000EK3C-19rQ;
	Thu, 12 Jun 2025 19:45:02 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjxk-0000000Do4t-2GQj
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 15:35:33 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a52878d37aso216756f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 08:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749742531; x=1750347331; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrKb3e7CakgdaivAHMe1lTLQEl14asIVWTpRE1pFTi4=;
        b=bE4ebCwNzRrGj7e83thFmPpVZ9lXsCpbe/DBalqrMwsxTd3N/7lNlFgslFqFVh/FBg
         YV3/Z76IOad/XDjauaDVm8FxH/iCSWTjo16sCFPIMoCbaZBR2uBhrxEXMBMtU8c18DeK
         ztYl3lBXh5cfPX/LtejYAjen1UDyOVqZopmrbogbuLR3YBkmIVj/7H+m1n9k9oeCNrg+
         2Ibs5qkc0Sm6IZdzz0Zo5HvEDOwOPn+sUOEB7uZl40/9E9ROU5hbtYs17KpgtXbaXrEt
         gqMPne/jnSS9s35EUbuULpOcO5ziMEKKDi+ZNUsfiiaP3Y+gzgeQVLM1MDZwZqXNkpDk
         GsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749742531; x=1750347331;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vrKb3e7CakgdaivAHMe1lTLQEl14asIVWTpRE1pFTi4=;
        b=cv/Yl5PtJ/6CMNf8JIKIZost76vrFH65aJwe2r51lJRR7V8X9r2CvBrrOW+hpChUSC
         i+8zwO0GAtO4Jy7usfnQtYP+Tkd2gKqcjRpWYqKlHobP4ufll0JbjePw7jR/8UNqsi4l
         yFh1Hs92n0XG5F62VVsbl/9YyxAnIty30kIC2YlnW/iwgYEhgNYILEeUvEEvthrq5deS
         DgBTI4tsCezHATlVDrWqdLL9BOSjcrStM33Is+1nZiRCGZ7G77iy3Cw30z/86ySmK6r3
         8uNDrTBjnnMDpj8+8TKly4NgMWm/Dwi/MOqWtc3/zIONZlKW9wgGKhHIaMCIe8nv05qm
         dgww==
X-Gm-Message-State: AOJu0YwdHAyfzYm+k10fFOnrMgG0c9IqLba2o6ktkG8BIhOei+NQfatA
	IJe76Bzhp1GEo6x2s9sAhHeVgWnZGzAxHa7LwFK2xO20e34DZGAoX4sXh7iRIs9K+ho=
X-Gm-Gg: ASbGncso8RMbEaCDaAnlyrocie7wA2PYxHFSdXrcbp0MGewsCn2/Q/RGoi/MLV9CbLy
	Xl1qN39Zn4XGzFO+ytQfYaFCr6rsIbpftshnYCGUrDF1jbIbG6yO/DUlDqET5R+Y9+ZofTiIhd6
	4oOJJF5m7Ye2Yalrs3XqPosWzfLwUSRBJTAsypVQkT+Q47LfEXn+ePbbYmuKWTZZgCyfvpIpU74
	KLiyInCFtto6esiGBqOjTj2HhscEweFPl2a+SS5pcHz7QfFPUmWIW1vVCBQpH8qe/w8Gn6cQOTT
	ShSJaK5iISUTHVqAS2PMF5dmpIGG0Vme+3MlN0PNTrm2aN2fgmBar87WvrEy7TRnK5xAJA==
X-Google-Smtp-Source: AGHT+IHm6QkUD94TIyh0e2e6tfOgOPCxLc5UKodukZsY3vLNflsEcumr4/7GtmIshD+ErYhzJYlL+A==
X-Received: by 2002:a5d:64c8:0:b0:3a5:324a:a04e with SMTP id ffacd0b85a97d-3a55864fb75mr2538631f8f.0.1749742530967;
        Thu, 12 Jun 2025 08:35:30 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:e05f:7af3:1bf9:f101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561976894sm2347199f8f.12.2025.06.12.08.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 08:35:30 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 12 Jun 2025 17:35:30 +0200
Message-Id: <DAKNYLI1ZWNU.2RGRA0ONMCIYL@ventanamicro.com>
Subject: Re: [PATCH 1/2] RISC-V: sbi: turn sbi_ecall into variadic macro
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Atish Patra" <atishp@rivosinc.com>, "Andrew Jones"
 <ajones@ventanamicro.com>, =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?=
 <cleger@rivosinc.com>, "Anup Patel" <apatel@ventanamicro.com>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250612145754.2126147-2-rkrcmar@ventanamicro.com>
 <20250612145754.2126147-3-rkrcmar@ventanamicro.com>
 <20250612170632-59116c0a-6b38-4cd9-8df1-b193251d598c@linutronix.de>
In-Reply-To: <20250612170632-59116c0a-6b38-4cd9-8df1-b193251d598c@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_083532_576232_6708C0EC 
X-CRM114-Status: GOOD (  19.16  )
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

MjAyNS0wNi0xMlQxNzoxNDowOSswMjowMCwgVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlz
c3NjaHVoQGxpbnV0cm9uaXguZGU+Ogo+IE9uIFRodSwgSnVuIDEyLCAyMDI1IGF0IDA0OjU3OjU0
UE0gKzAyMDAsIFJhZGltIEtyxI1tw6HFmSB3cm90ZToKPj4gQ291bnRpbmcgdGhlIGFyZ3VtZW50
cyB0byBzYmlfZWNhbGwoKSBhbmQgcGFkZGluZyB3aXRoIHplcm9zIGdldHMgb2xkCj4+IHByZXR0
eSBxdWljay4gIEl0J3MgYWxzbyBoYXJkZXIgdG8gZGlzdGluZ3Vpc2ggYSB0YWlsaW5nIDAgYXJn
dW1lbnQgYW5kCj4+IHRoZSBwYWRkaW5nLiAgVGhlIHBhdGNoIGNoYW5nZXMgc2JpX2VjYWxsKCkg
dG8gYWNjZXB0IGFueXRoaW5nIGJldHdlZW4gMQo+PiBhbmQgOCBpbnRlZ2VyIGFyZ3VtZW50cy4K
Pj4gCj4+IFRob3NlIHdobyBjYW4gY291bnQgYXJlIGFsc28gZ2l2ZW4gc2JpX2VjYWxsMSgpIHRv
IHNiaV9lY2FsbDgoKSwgd2hpY2gKPj4gdGhlIHZhcmlhZGljIG1hZ2ljIHVzZXMgdW5kZXIgdGhl
IGhvb2QuICBUaGUgZXJyb3IgbWVzc2FnZXMgdXBvbiBhCj4+IHByb2dyYW1tZXIgZXJyb3IgYXJl
IGEgYml0IGhhaXJ5LCBhcyBleHBlY3RlZCBvZiBtYWNyb3MsIGFuZCB0aGUKPj4gc3RhdGljX2Fz
c2VydCBpcyB0aGVyZSB0byBpbXByb3ZlIHRoZW0gYSBiaXQuCj4+IAo+PiBUaGUgZmluYWwgZ29h
bCB3b3VsZCBiZSBhdm9pZCBjbG9iYmVyaW5nIHJlZ2lzdGVycyB0aGF0IGFyZSBub3QgdXNlZCBp
bgo+PiB0aGUgZWNhbGwsIGJ1dCB3ZSBmaXJzdCBoYXZlIHRvIGZpeCB0aGUgY29kZSBnZW5lcmF0
aW9uIGFyb3VuZAo+PiB0cmFjZXBvaW50cyBpZiBzYmlfZWNhbGwgaXMgZXhwZWN0ZWQgdG8gYmUg
dXNlZCBpbiBwYXRocyB3aGVyZQo+PiBwZXJmb3JtYW5jZSBpcyBjcml0aWNhbC4KPj4gCj4+IFNp
Z25lZC1vZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPgo+
PiAtLS0KPj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggfCAzNCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystCj4+ICAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+PiAKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4+IGluZGV4IDM0MWU3NDIz
OGFhMC4uYzYyZGI2MWJkMDE4IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3NiaS5oCj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKPj4gQEAgLTEwLDYg
KzEwLDcgQEAKPj4gICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+PiAgI2luY2x1ZGUgPGxpbnV4
L2NwdW1hc2suaD4KPj4gICNpbmNsdWRlIDxsaW51eC9qdW1wX2xhYmVsLmg+Cj4+ICsjaW5jbHVk
ZSA8bGludXgvYnVpbGRfYnVnLmg+Cj4+ICAKPj4gICNpZmRlZiBDT05GSUdfUklTQ1ZfU0JJCj4+
ICBlbnVtIHNiaV9leHRfaWQgewo+PiBAQCAtNDY1LDkgKzQ2Niw0MCBAQCBzdHJ1Y3Qgc2JpcmV0
IF9fc2JpX2VjYWxsKHVuc2lnbmVkIGxvbmcgYXJnMCwgdW5zaWduZWQgbG9uZyBhcmcxLAo+PiAg
CQkJICB1bnNpZ25lZCBsb25nIGFyZzIsIHVuc2lnbmVkIGxvbmcgYXJnMywKPj4gIAkJCSAgdW5z
aWduZWQgbG9uZyBhcmc0LCB1bnNpZ25lZCBsb25nIGFyZzUsCj4+ICAJCQkgIGludCBmaWQsIGlu
dCBleHQpOwo+PiAtI2RlZmluZSBzYmlfZWNhbGwoZSwgZiwgYTAsIGExLCBhMiwgYTMsIGE0LCBh
NSkJXAo+PiArCj4+ICsjZGVmaW5lIHNiaV9lY2FsbDEoZSkgXAo+PiArCQlfX3NiaV9lY2FsbCgw
LCAwLCAwLCAwLCAwLCAwLCAwLCBlKQo+PiArI2RlZmluZSBzYmlfZWNhbGwyKGUsIGYpIFwKPj4g
KwkJX19zYmlfZWNhbGwoMCwgMCwgMCwgMCwgMCwgMCwgZiwgZSkKPj4gKyNkZWZpbmUgc2JpX2Vj
YWxsMyhlLCBmLCBhMCkgXAo+PiArCQlfX3NiaV9lY2FsbChhMCwgMCwgMCwgMCwgMCwgMCwgZiwg
ZSkKPj4gKyNkZWZpbmUgc2JpX2VjYWxsNChlLCBmLCBhMCwgYTEpIFwKPj4gKwkJX19zYmlfZWNh
bGwoYTAsIGExLCAwLCAwLCAwLCAwLCBmLCBlKQo+PiArI2RlZmluZSBzYmlfZWNhbGw1KGUsIGYs
IGEwLCBhMSwgYTIpIFwKPj4gKwkJX19zYmlfZWNhbGwoYTAsIGExLCBhMiwgMCwgMCwgMCwgZiwg
ZSkKPj4gKyNkZWZpbmUgc2JpX2VjYWxsNihlLCBmLCBhMCwgYTEsIGEyLCBhMykgXAo+PiArCQlf
X3NiaV9lY2FsbChhMCwgYTEsIGEyLCBhMywgMCwgMCwgZiwgZSkKPj4gKyNkZWZpbmUgc2JpX2Vj
YWxsNyhlLCBmLCBhMCwgYTEsIGEyLCBhMywgYTQpIFwKPj4gKwkJX19zYmlfZWNhbGwoYTAsIGEx
LCBhMiwgYTMsIGE0LCAwLCBmLCBlKQo+PiArI2RlZmluZSBzYmlfZWNhbGw4KGUsIGYsIGEwLCBh
MSwgYTIsIGEzLCBhNCwgYTUpIFwKPj4gIAkJX19zYmlfZWNhbGwoYTAsIGExLCBhMiwgYTMsIGE0
LCBhNSwgZiwgZSkKPj4gIAo+PiArI2RlZmluZSBfX3NiaV9jb3VudF9hcmdzX21hZ2ljKF8sIGEs
IGIsIGMsIGQsIGUsIGYsIGcsIGgsIE4sIC4uLikgTgo+PiArI2RlZmluZSBfX3NiaV9jb3VudF9h
cmdzKC4uLikgXAo+PiArCV9fc2JpX2NvdW50X2FyZ3NfbWFnaWMoXywgIyMgX19WQV9BUkdTX18s
IDgsIDcsIDYsIDUsIDQsIDMsIDIsIDEsIDApCj4KPiBUaGlzIGxvb2tzIGEgbG90IGxpa2UgQ09V
TlRfQVJHUygpIGZyb20gaW5jbHVkZS9saW51eC9hcmdzLmguCj4KPj4gKyNkZWZpbmUgX19zYmlf
Y291bnRfYXJnczIoLi4uKSBcCj4+ICsJKHNpemVvZigodW5zaWduZWQgbG9uZ1tdKXswLCAjIyBf
X1ZBX0FSR1NfX30pIC8gc2l6ZW9mKHVuc2lnbmVkIGxvbmcpIC0gMSkKPj4gKyNkZWZpbmUgX19z
YmlfY29uY2F0X2V4cGFuZGVkKGEsIGIpIGEgIyMgYgo+Cj4gLi4uIGFuZCBDT05DQVRFTkFURSgp
CgpUaGFua3MgZm9yIHBvaW50aW5nIHRoZW0gb3V0LCBJIHdpbGwgdXNlIHRoZW0gaW4gdjIuCgo+
PiArI2RlZmluZSBfX3NiaV9jb25jYXQobikgX19zYmlfY29uY2F0X2V4cGFuZGVkKHNiaV9lY2Fs
bCwgbikKPj4gKwo+PiArLyogc2JpX2VjYWxsIHNlbGVjdHMgdGhlIGFwcHJvcHJpYXRlIHNiaV9l
Y2FsbDEgdG8gc2JpX2VjYWxsOCAqLwo+PiArI2RlZmluZSBzYmlfZWNhbGwoLi4uKSAgXAo+PiAr
CSh7IFwKPj4gKwkJc3RhdGljX2Fzc2VydChfX3NiaV9jb3VudF9hcmdzMihfX1ZBX0FSR1NfXykg
PD0gOCk7IFwKPgo+IFdoeSBkb2VzIHRoaXMgbmVlZCB0byB1c2UgX19zYmlfY291bnRfYXJnczIo
KSA/CgpXaGVuIHlvdSBnbyBvdmVyIHRoZSBoYXJkY29kZWQgbWF4aW11bSBjb3VudCBpbiBDT1VO
VF9BUkdTLCB0aGUgbWFjcm8Kc3RvcHMgY291bnRpbmcgYW5kIHJldHVybnMgdGhlIGFyZ3VtZW50
cyBpbnN0ZWFkLgpUaGUgYXJyYXkgYXBwcm9hY2ggaW4gX19zYmlfY291bnRfYXJnczIoKSBjb3Vu
dHMgYW55IG51bWJlciBvZgphcmd1bWVudHMsIHNvIGl0IGdpdmVzIGEgbXVjaCBtb3JlIHVuZGVy
c3RhbmRhYmxlIGVycm9yLgoKSSBndWVzcyB1c2luZyBDT1VOVF9BUkdTKCkgYW5kIGNvbmRlbW5p
bmcgcHJvZ3JhbW1lcnMgdGhhdCBvdmVyc2hvb3QgdGhlCjE1IGNvdW50ZWQgYXJndW1lbnRzIGlz
IGJldHRlci4gIFdlIGRvbid0IHJlYWxseSBuZWVkIGEgc3RhdGljX2Fzc2VydAp0aGVuIGVpdGhl
ciwgYW5kIHYyIGNvdWQgYmUganVzdDoKCiNkZWZpbmUgc2JpX2VjYWxsKC4uLikgXAoJQ09OQ0FU
RU5BVEUoc2JpX2VjYWxsLCBDT1VOVF9BUkdTKF9fVkFfQVJHU19fKSkoX19WQV9BUkdTX18pOwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
