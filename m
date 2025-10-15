Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DFDCCD193
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 19:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FW+A/pHAcLUsvSycQVyaCnjC2NmSCp9oCYkBTkGXW+Q=; b=Sx5ggco3Bqmg4L
	jnm5ZG4mdzNUrR5LAOBFPY5Aq6MmI+eHrjhdEmeyv1thv/JvFZSmXMTDzPvG2BMSYfq3PyC8B27fW
	Mq3mrs8Q7emWxRLW//VT05lmqddMkaHh7dy/kIRlis0PUwliEz9z9ygzvd+TQpb3wiSGj/zY9yV7+
	GihMKw0MnKtxAKybNOido7MvBPpC3j1z0PbYxzAXRDhGFCzhnHmQZc6+CjBqpF6ceNqkHEqCxCVdM
	ofSHyy6gc7XwKweUxdSutoDgtTzebQKmLEfohFXtnqpTXra8RQN37uZe9CysRHT1W5MYRVIeaC/6I
	pgHlZxlcc22NsA/qlZlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97aL-00000002nNY-0Qnk;
	Wed, 15 Oct 2025 19:54:57 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97aI-00000002nND-1y2U
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 19:54:55 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-63babfdb52cso5995891a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 12:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760558092; x=1761162892; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6txPrWGJQKba/YBePw8USSq9dZr1PQIVujAd1UbYZG0=;
        b=nXXN1o8WCDsGotZU6ovvdG0ErdZBWACAzYiQHMaWS8DHi4yHybCVISfyN+LAuk0+Vn
         3LAPmVHGTq6z+vAC8EK0e48MLrqHhKtKkiRWbkZYfiUlGamFwArzVmXHl9wOSEfin5tA
         z2LZ2R5oh+iVHvz0nIaaEKYJeMzJmePeEYfFHcZXNyh4vQAP3Bhp26chpXJgdFnC7h4v
         t3p4jg1Q2dlfIyNEPe4aqqxlgbGtc7ivUc6AAYR+tp4fypYTowXPR0ruiIG5MsdIkk+2
         8oHYy6iRpKBtwO9QH5yRQYum6VIuerl2HCCsqVMI3bGKi8epRKn51rl8F3Pz11OLWkgp
         1zcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760558092; x=1761162892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6txPrWGJQKba/YBePw8USSq9dZr1PQIVujAd1UbYZG0=;
        b=LIjgquLK7j0jsJb3tIXUsXHP+XGdi64NzK3Fqc2hSVa5/UoFX3sMywrU8/mWDpvsre
         4boUP9rv4FfCRL3y57eQuDdjEVE40AI2vQqDhb9tbwUDEYFUu1ie/OZrSHIAdVYNFhOq
         Vpc7e0OBKnTIog1PvpLc5N5AaZ5QQhzLCkkVlCDAc9Q8MM+8NTYfjmnEuBHWCtq/lR4T
         WI7AjR12+04es/XiyNKt31JGJlfkxr/OTbdTdLUJcZKPX9bE8ISTaU1AP9Dq3UJeL6Tm
         qaIVsxR8x8zZ1Z4FsNJxMd1T+9UeACAcgmvK5pppH9/aZJ0YomiK/YBKckS63nJt/H1J
         9WKQ==
X-Gm-Message-State: AOJu0YzzC0MkbAXnQLM++CbD710dPBBBcswWym0T4gdTFDjf21zhZIqZ
	TsUUx6pNVKsPzPejFEBElPwa7DsaX17qC0XtkvdeWpaSD8m69RoXU7RVyLq8LJb4JyIM3aXbPC1
	CP/D+UkUR9o+kKW0lUaZJoc3+HTw2JFA=
X-Gm-Gg: ASbGncsPDmUUlCXacCwbXm3fKmlLJaXktHd3pAyOjdS1Sj3SWSjjYewZH5rrcVIwgXB
	PD+e9GJQNpnPKtsPmgY1X4yMyuiiW5WOE/9EPCV+JyAB++P4tznMn/dnc3xUukeXtGZBGp83wbL
	uBfEoRdJAF2Z9JOf47pmSvuJMI0ILDVu7+Rzsd/zgFwwEPLm9X/Kx2/SH9JgAxtqg6nnvQoxdVQ
	in5sPPjYfq+o/8dGiaxrHVqxl+o4/Of7g==
X-Google-Smtp-Source: AGHT+IEUqo0R2GZOT/KXkXAx0vTk4GL7xiLp5gkL3ByIOaHhbjRuEg2HqJikmhAYuLgjjr/94NEnrgCCj3+qDPfl2F4=
X-Received: by 2002:a05:6402:50c7:b0:634:ab36:3c74 with SMTP id
 4fb4d7f45d1cf-639d5b80653mr28131910a12.9.1760558091971; Wed, 15 Oct 2025
 12:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20251007115840.2320557-1-geomatsi@gmail.com> <20251007115840.2320557-7-geomatsi@gmail.com>
In-Reply-To: <20251007115840.2320557-7-geomatsi@gmail.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Wed, 15 Oct 2025 14:54:39 -0500
X-Gm-Features: AS18NWAHrDSUKeL_x2zKeFwwB6V8GhrxKoLsuT-6g2e1OqQMu1bXWZWGOV6Nh_U
Message-ID: <CAFTtA3PyEnscQx+JtM3wBb0YZJxFjoJp4JB6QJQXbN6q3HVFyA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] riscv: vector: initialize vlenb on the first
 context switch
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Thomas Huth <thuth@redhat.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Han Gao <rabenda.cn@gmail.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Nam Cao <namcao@linutronix.de>, 
	Joel Granados <joel.granados@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_125454_545429_D65BDE9B 
X-CRM114-Status: GOOD (  18.43  )
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

SGkgU2VyZ2V5LAoKT24gVHVlLCBPY3QgNywgMjAyNSBhdCA2OjU44oCvQU0gU2VyZ2V5IE1hdHl1
a2V2aWNoIDxnZW9tYXRzaUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhlIHZzdGF0ZSBpbiB0aHJl
YWRfc3RydWN0IGlzIHplcm9lZCB3aGVuIHRoZSB2ZWN0b3IgY29udGV4dCBpcwo+IGluaXRpYWxp
emVkLiBUaGF0IGluY2x1ZGVzIHJlYWQtb25seSByZWdpc3RlciB2bGVuYiwgd2hpY2ggaG9sZHMK
PiB0aGUgdmVjdG9yIHJlZ2lzdGVyIGxlbmd0aCBpbiBieXRlcy4gVGhpcyB6ZXJvZWQgc3RhdGUg
cGVyc2lzdHMKPiB1bnRpbCBtc3RhdHVzLlZTIGJlY29tZXMgJ2RpcnR5JyBhbmQgYSBjb250ZXh0
IHN3aXRjaCBzYXZlcyB0aGUKPiBhY3R1YWwgaGFyZHdhcmUgdmFsdWVzLgo+Cj4gVGhpcyBjYW4g
ZXhwb3NlIHRoZSB6ZXJvIHZsZW5iIHZhbHVlIHRvIHRoZSB1c2VyLXNwYWNlIGluIGVhcmx5Cj4g
ZGVidWcgc2NlbmFyaW9zLCBlLmcuIHdoZW4gcHRyYWNlIGF0dGFjaGVzIHRvIGEgdHJhY2VkIHBy
b2Nlc3MKPiBlYXJseSwgYmVmb3JlIGFueSB2ZWN0b3IgaW5zdHJ1Y3Rpb24gZXhjZXB0IHRoZSBm
aXJzdCBvbmUgd2FzCj4gZXhlY3V0ZWQuCj4KPiBGaXggdGhpcyBieSBmb3JjaW5nIHRoZSB2ZWN0
b3IgY29udGV4dCBzYXZlIG9uIHRoZSBmaXJzdCBjb250ZXh0IHN3aXRjaC4KPgo+IFNpZ25lZC1v
ZmYtYnk6IFNlcmdleSBNYXR5dWtldmljaCA8Z2VvbWF0c2lAZ21haWwuY29tPgo+IC0tLQo+ICBh
cmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYyB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYwo+IGluZGV4IDkwMWU2N2FkZjU3Ni4uM2RkMjJh
NzFhYTE4IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jCj4gKysrIGIv
YXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMKPiBAQCAtMTIwLDYgKzEyMCw3IEBAIHN0YXRpYyBp
bnQgcmlzY3Zfdl90aHJlYWRfemFsbG9jKHN0cnVjdCBrbWVtX2NhY2hlICpjYWNoZSwKPgo+ICAg
ICAgICAgY3R4LT5kYXRhcCA9IGRhdGFwOwo+ICAgICAgICAgbWVtc2V0KGN0eCwgMCwgb2Zmc2V0
b2Yoc3RydWN0IF9fcmlzY3Zfdl9leHRfc3RhdGUsIGRhdGFwKSk7Cj4gKwo+ICAgICAgICAgcmV0
dXJuIDA7Cj4gIH0KPgo+IEBAIC0yMTYsOCArMjE3LDExIEBAIGJvb2wgcmlzY3Zfdl9maXJzdF91
c2VfaGFuZGxlcihzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiAgICAgICAgICAgICAgICAgZm9yY2Vf
c2lnKFNJR0JVUyk7Cj4gICAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+ICAgICAgICAgfQo+
ICsKPiAgICAgICAgIHJpc2N2X3ZfdnN0YXRlX29uKHJlZ3MpOwo+ICAgICAgICAgcmlzY3Zfdl92
c3RhdGVfc2V0X3Jlc3RvcmUoY3VycmVudCwgcmVncyk7Cj4gKyAgICAgICBzZXRfdHNrX3RocmVh
ZF9mbGFnKGN1cnJlbnQsIFRJRl9SSVNDVl9WX0ZPUkNFX1NBVkUpOwo+ICsKCkkgYW0gYWZyYWlk
IHRoYXQgdGhpcyBhcHByb2FjaCBjYW4gcmVzdWx0IGluIGEgc2VjdXJpdHkgaXNzdWUgd2hlcmUg
YQpjb250ZXh0IHN3aXRjaCBoYXBwZW5zIGJlZm9yZSB0aGUgdi1yZXN0b3JlIHBhcnQgb2YgdGhl
IGN1cnJlbnQKcHJvY2VzcywgY2hlYXRpbmcgdGhlIGtlcm5lbCB0byBzdG9yZSBzdGFsZSB2LXJl
Z3Mgb250byB0aGUgY3VycmVudApjb250ZXh0IG1lbW9yeS4gUGxlYXNlIG5vdGUgdGhhdCB0aGlz
IGhhbmRsZXIgaXMgcnVuIHdpdGggaXJxIGVuYWJsZWQKc28gcHJlZW1wdGlvbiBpcyBhbGxvd2Vk
LgoKSSB3b3VsZCBleHBlY3Qgc2ltcGx5IGluaXRpYWxpemluZyB0aGUgdmxlYiBpbiByaXNjdl92
X3RocmVhZF96YWxsb2MsCnBlcmhhcHMgZHJvcHBpbmcgdGhlICJ6IiBpbiB0aGUgbmFtZSB0byBw
cmV2ZW50IGNvbmZ1c2lvbi4KCj4gICAgICAgICByZXR1cm4gdHJ1ZTsKPiAgfQo+Cj4gLS0KPiAy
LjUxLjAKPgoKVGhhbmtzLApBbmR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
