Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F618CCF9F8
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 22:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s5MoqFyCTnmbehU0HQzZVKD4x5ekqO/ScgdiVVMN7m8=; b=Xq6G98ILVnQpmk
	6zvL2BnAQq2pSmonB+6H878qzshz3yVvcoHJW+U55Yx+mIRYUzA0ACcuxZrm30kHSc0qWJSxs9mz+
	FtRgeGD4OmugtZ5Rgdlxrrcu+pkjrWZghN1hScHal5yv5SbuP/cf2O2KSyCb5MhJL5QtKiuswqrMU
	sfdPtQgXoH+7RyTymvML3npz3NM2h1LKI6Mvf1PpwnO8a1yzlvHYY2UY+o66OP57iD0+oEl/9n4cT
	YBnQs3zuq+5K/u5rXawU5+De/8dehaRuuaH/pRqfqZBz0MRt0yUksREw1PI1pD0mm6ltMA8R0rk+P
	QYqdsooG/tC1RRRpF7Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHV33-00000001MQW-195w;
	Fri, 07 Nov 2025 22:35:13 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHV30-00000001MOv-1iik
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 22:35:11 +0000
Received: by mail-io1-xd43.google.com with SMTP id ca18e2360f4ac-948640d425aso97710439f.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Nov 2025 14:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1762554909; x=1763159709; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vg08ldRAkLf5MLDRRjwTlFUbZI12uD+f/89Jv5J/3K8=;
        b=HX/ljh/cMJm5i85oLotWtSy3PXIaxD7e6W6WmlbFev8sqsiOX8E9e0uhjNRAzjvVFd
         RrsLTIOJH77ZFvDu5+BThzKtE2sNlHyfTbLfBzu0cL9JcOpCuWvAVjOjqlQC22EMNUtV
         g2oo0Fpp5QRCXHnduCS6VpoDZwQmviFyrJ0zp+louwlJWCzJK78GNQF1tKD/CqV/kP5S
         EPgigAmvoEyaJ8ngX5PlCLnrSkAevrXPyNRDRgRMyRFnHYxUjS2L5j3htQs0u0SJBXEx
         0VJLWWB/0GUQg/VyfHXQOwpdphXhisZjE7QtVg08w2BC8H9E5EUSEBAOoRY+zKCCaQld
         FsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762554909; x=1763159709;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vg08ldRAkLf5MLDRRjwTlFUbZI12uD+f/89Jv5J/3K8=;
        b=OFhbbK44TZGH/RMC/9bKSZndpxL+YJJbOv5G7zHu7iDOLLTy0hHGQm+tEVBFpe+KqI
         2y1CGA9dsjUD8jkK30aI3crjjen8zVytfRirhYb84F7856ris/X8JsuNqairVsxXMQyG
         zi2YRddIXDBVc6ynKbwlKwBDAg050P9VW1b1E1IPlwWCFXQUfTsRUjZmbNg+PA3gvAET
         ZmS5uOtsVeY2ZCiSpysofLATCjwRqVyj/X1j2STfqQCFALdw40GQAUJDddo2OoaTXedV
         pZsKQ3G3ksdwNCk9acD6S6VqqprF/w5BJaL5cg5GcwapU06Z29hwuoBVQ/40Vryph/tc
         Lk5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUo52WzCKaUunFxRzJ9XO/lbdIL71Loh28dMPBX0fVBWHdz0XF47MM1z1yI4nkjCzUsh8MlKTsv3P+t8w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwwOKOidiPqrlvCOIeXsRkzUrLDK3+MCG4tNcTlXmJfyU3BCmZ8
	oYfpw25aZvsdlVbB0KkGadyjLVGBhf5uRO5t4aigjaYyNhDJFk1Nd9S9AWc07DwUcy8=
X-Gm-Gg: ASbGncsL5fLgPXEvfw+hcr2qSTFjeme4Yd1JZW13bdVFE+WXZY5f9Z5LoIR+ebDogC1
	MLQ8OOrjdLLRAYK4E/6XEjII/XMGPGn6kPQaSTr4SHWb6RNNyBpAjlLx0FMWfDEo8KKWQqU69kP
	2AWOrDF1FTE83rLOEmycITHEI329wHUyw5LgBMJiMjMtpU3gFqaqSitOhI3bBnY55KL4q1OaTng
	TMWPObro552AMBRgF2mVxzgFo9Sm3FzDuM9BhyfTGlCSInPz/8/sb/HKcxvxyg/J5tajnydKF/S
	BHuvZiMzShITYolhofnDd7yhnAx2t4aGB4R3RrwR3rj5qAIPr+1BBYCnToU6OTH5238UkYXJAWM
	GOIj8/Qbk+kNp4Ij9HoA2WtnDC9YMNTdANv46ZDDAvN4IENKKtROszh1bwUKA8YNC/UpKiocyuA
	/xMQ==
X-Google-Smtp-Source: AGHT+IHZR6USA9yWR5ZWBMvXBHz10PgFyz+z8/DiHeuXwHyQGKeRtUt1d+sutlUlF7qY5zNBqoYc1A==
X-Received: by 2002:a05:6602:60c3:b0:948:28cf:3f9c with SMTP id ca18e2360f4ac-94896011efemr132046639f.14.1762554909205;
        Fri, 07 Nov 2025 14:35:09 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5b746806d2bsm2465313173.18.2025.11.07.14.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 14:35:08 -0800 (PST)
Date: Fri, 7 Nov 2025 16:35:07 -0600
From: Andrew Jones <ajones@ventanamicro.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Ben Dooks <ben.dooks@codethink.co.uk>, linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	patches@lists.linux.dev
Subject: Re: [PATCH fixes] riscv: Fix CONFIG_AS_HAS_INSN for new .insn usage
Message-ID: <20251107-e4e324e725ddf47b9aafa0b4@orel>
References: <20251107-riscv-fix-new-insn-usage-v1-1-9a186c5928a0@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251107-riscv-fix-new-insn-usage-v1-1-9a186c5928a0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_143510_463726_D5BE2926 
X-CRM114-Status: GOOD (  18.41  )
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

T24gRnJpLCBOb3YgMDcsIDIwMjUgYXQgMDI6NTY6NTlQTSAtMDcwMCwgTmF0aGFuIENoYW5jZWxs
b3Igd3JvdGU6Cj4gQWZ0ZXIgY29tbWl0IDQ0YWEyNWMwMDBiNCAoInJpc2N2OiBhc206IHVzZSAu
aW5zbiBmb3IgbWFraW5nIGN1c3RvbQo+IGluc3RydWN0aW9ucyIpLCBidWlsZHMgdXNpbmcgTExW
TSBvbGRlciB0aGF0IDE5IG9yIGJpbnV0aWxzIG9sZGVyIHRoYW4KPiAyLjM4IGZhaWwgd2l0aDoK
PiAKPiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9wcm9jZXNzb3IuaDogQXNzZW1ibGVy
IG1lc3NhZ2VzOgo+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL3Byb2Nlc3Nvci5oOjI3
OiBFcnJvcjogdW5yZWNvZ25pemVkIG9wY29kZSBgMHgxMDAwMDBmJwo+ICAgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS92ZHNvL3Byb2Nlc3Nvci5oOjI3OiBFcnJvcjogdW5yZWNvZ25pemVkIG9wY29k
ZSBgMHgxMDAwMDBmJwo+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL3Byb2Nlc3Nvci5o
OjI3OiBFcnJvcjogdW5yZWNvZ25pemVkIG9wY29kZSBgMHgxMDAwMDBmJwo+ICAgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS92ZHNvL3Byb2Nlc3Nvci5oOjI3OiBFcnJvcjogdW5yZWNvZ25pemVkIG9w
Y29kZSBgMHgxMDAwMDBmJwo+ICAgbWFrZVs0XTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxk
OjI4NzogYXJjaC9yaXNjdi9rZXJuZWwvdmRzby92Z2V0dGltZW9mZGF5Lm9dIEVycm9yIDEKPiAK
PiAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSA8YnVpbHQtaW4+OjQ6Cj4gICBJbiBmaWxlIGluY2x1
ZGVkIGZyb20gbGliL3Zkc28vZ2V0dGltZW9mZGF5LmM6NjoKPiAgIEluIGZpbGUgaW5jbHVkZWQg
ZnJvbSBpbmNsdWRlL3Zkc28vZGF0YXBhZ2UuaDoyMToKPiAgIEluIGZpbGUgaW5jbHVkZWQgZnJv
bSBpbmNsdWRlL3Zkc28vcHJvY2Vzc29yLmg6MTA6Cj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3Zkc28vcHJvY2Vzc29yLmg6MjM6MjogZXJyb3I6IGV4cGVjdGVkIGluc3RydWN0aW9uIGZvcm1h
dAo+ICAgICAgMjMgfCAgICAgICAgIEFMVF9SSVNDVl9QQVVTRSgpOwo+ICAgICAgICAgfCAgICAg
ICAgIF4KPiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3QuaDo0NzozOiBub3Rl
OiBleHBhbmRlZCBmcm9tIG1hY3JvICdBTFRfUklTQ1ZfUEFVU0UnCj4gICAgICA0NyB8ICAgICAg
ICAgICAgICAgICBSSVNDVl9QQVVTRSwgLyogT3JpZ2luYWwgUklTQ+KAkVYgcGF1c2UgaW5zbiAq
LyBcCj4gICAgICAgICB8ICAgICAgICAgICAgICAgICBeCj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2luc24tZGVmLmg6MjU5OjIxOiBub3RlOiBleHBhbmRlZCBmcm9tIG1hY3JvICdSSVNDVl9Q
QVVTRScKPiAgICAgMjU5IHwgI2RlZmluZSBSSVNDVl9QQVVTRSAgICAgQVNNX0lOU05fSSgiMHgx
MDAwMDBmIikKPiAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgXgo+ICAgYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9hc20uaDoxNjoyNjogbm90ZTogZXhwYW5kZWQgZnJvbSBtYWNybyAn
QVNNX0lOU05fSScKPiAgICAgIDE2IHwgI2RlZmluZSBBU01fSU5TTl9JKF9feCkgIi5pbnNuICIg
X194Cj4gICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gICA8aW5saW5lIGFz
bT46NTo3OiBub3RlOiBpbnN0YW50aWF0ZWQgaW50byBhc3NlbWJseSBoZXJlCj4gICAgICAgNSB8
IC5pbnNuIDB4MTAwMDAwZgo+ICAgICAgICAgfCAgICAgICBeCj4gCj4gYmludXRpbHMgZ2FpbmVk
IHN1cHBvcnQgZm9yICcuaW5zbiA8dmFsdWU+JyBpbiAyLjM4IFsxXSBhbmQgTExWTSBnYWluZWQK
PiBzdXBwb3J0IGluIDE5IFsyXS4gQWRqdXN0IHRoZSB0ZXN0IGZvciBDT05GSUdfQVNfSEFTX0lO
U04gdG8gZW5zdXJlIHRoYXQKPiBhbGwgdmVyc2lvbnMgb2YgLmluc24gYXJlIHN1cHBvcnRlZCBi
ZWZvcmUgYmVpbmcgdXNlZC4KPiAKPiBGaXhlczogNDRhYTI1YzAwMGI0ICgicmlzY3Y6IGFzbTog
dXNlIC5pbnNuIGZvciBtYWtpbmcgY3VzdG9tIGluc3RydWN0aW9ucyIpCj4gTGluazogaHR0cHM6
Ly9zb3VyY2V3YXJlLm9yZy9naXQvP3A9YmludXRpbHMtZ2RiLmdpdDthPWNvbW1pdDtoPWEyNjJi
ODJmZGJmNGNkYTNiMDY0OGIxYWRjMzIyNDVjYTNmNzhiN2EgWzFdCj4gTGluazogaHR0cHM6Ly9n
aXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0L2NvbW1pdC8yYTA4NmRjZTY5MWUzY2MzNGEyZmMy
N2Y0ZmIyNTViYjJjYmJmYWM5IFsyXQo+IFN1Z2dlc3RlZC1ieTogQW5kcmV3IEpvbmVzIDxham9u
ZXNAdmVudGFuYW1pY3JvLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8
bmF0aGFuQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvS2NvbmZpZyB8IDIgKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+IGluZGV4IDIy
Y2RhOWM0NTJkMi4uZmFkZWMyMGI4N2E4IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZp
Zwo+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+IEBAIC0zNjcsNyArMzY3LDcgQEAgY29uZmln
IFJJU0NWX05PTlNUQU5EQVJEX0NBQ0hFX09QUwo+ICAJICBzeXN0ZW1zIHRvIGhhbmRsZSBjYWNo
ZSBtYW5hZ2VtZW50Lgo+ICAKPiAgY29uZmlnIEFTX0hBU19JTlNOCj4gLQlkZWZfYm9vbCAkKGFz
LWluc3RyLC5pbnNuIHIgNTEkKGNvbW1hKSAwJChjb21tYSkgMCQoY29tbWEpIHQwJChjb21tYSkg
dDAkKGNvbW1hKSB6ZXJvKQo+ICsJZGVmX2Jvb2wgJChhcy1pbnN0ciwuaW5zbiAweDEwMDAwMGYp
Cj4gIAo+ICBjb25maWcgQVNfSEFTX09QVElPTl9BUkNICj4gIAkjIGh0dHBzOi8vZ2l0aHViLmNv
bS9sbHZtL2xsdm0tcHJvamVjdC9jb21taXQvOWU4ZWQzNDAzYzE5MWFiOWM0OTAzZThlZWI4Zjcz
MmZmOGE0M2NiNAo+IAo+IC0tLQo+IGJhc2UtY29tbWl0OiBhODgyMTI2YzQyZmM1MzI3NWFjOTE5
NjlkNDYwZDkzOTE5MWRiN2IwCj4gY2hhbmdlLWlkOiAyMDI1MTEwNy1yaXNjdi1maXgtbmV3LWlu
c24tdXNhZ2UtMjI2MTM3N2MyZDM4Cj4gCj4gQmVzdCByZWdhcmRzLAo+IC0tICAKPiBOYXRoYW4g
Q2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+Cj4KClRoYW5rcyBmb3IgcG9zdGluZyB0aGlz
IE5hdGhhbi4KClJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8u
Y29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
