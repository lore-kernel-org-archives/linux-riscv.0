Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F549C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 14:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xSQYJYLIjFZ1OZeF+E3WbaWmgko5qyRShnG05Zzqlz4=; b=LDaKRZF5OSsgtg
	vMqDGBYl1S3eOslZIFb8XrcNKA+N79OXk2d+qeBMVW/u1ArnqkUModiQKBGFnNSbFMj6dvIpcOb49
	SK0X0yE85btADivov9pf1TbplJBm9xQfTB2jQUVdliNOZZqMKLTScI8/8aSQJRI4XFYwDcyxEAxoy
	Rqw4CkXCPGRn8eRp3Ve4jqWqVbe0t44xTk/AWLvjIvsPdSAv9JHzCZdRzpp400EdgLQ2tRo0VIyIq
	4gf0puaQGKjp3/s7AKTwx/rE2mCVXWRGKgOhFohvjVQoJFsOJMkRr+0xB2tetJQGSZbv5mw94Fq+/
	VvETke5e9G5FZuZ66U0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCKC8-00000004RIr-0Pie;
	Wed, 29 May 2024 14:22:24 +0000
Received: from mail-yw1-f169.google.com ([209.85.128.169])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCKC5-00000004RHh-0VvP;
	Wed, 29 May 2024 14:22:22 +0000
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-628c1f09f5cso20317357b3.1;
        Wed, 29 May 2024 07:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716992537; x=1717597337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZhFBRfdhny2Bdj9xeQJ2Gk+dh8Rw9f9PCqy5yikLoYY=;
        b=QorrJrpzTk+PINpNL77tZhGGDk2Q3u6oWo+29G+R2SMndzxKrfSCdiJEeaLSp+dcYs
         4JreQms+of8TNdcah0BM1h+P27GVXHraXz4KJVw1UtwZ9tFnlDq12Py0/k7UatwE5WlK
         +tM6ifsUWm4D1U9O16mDbUDn0MMSZdDh0NMHWIIAcTtNv+IWvFElGzvTExs95YOhPFuT
         KasL9sDNKuCX6EDkOrrs0+CY45wr/36n9g1rt8JyXXBXTWKEa90y3NI2BTn8b69t6Zg/
         UpTH6oH19Zfkd+6sFVhG+EbCAlY34gDcL//LrptPKs1PNV7fXeHtgsYKPF2F1JyoeD/t
         3v/w==
X-Forwarded-Encrypted: i=1; AJvYcCV720zd7yDLXiuj1u0e36ZzcQauNZDQAAd1z6WYXQ2S2YVvZ9vTVwBMbYQOJLGoGZLVF6bBeUI9qY95c17kAtHUy7cWpY6nRHwmJgmmnrmUPXII5aooqVBpMV7bZTbUdvuxZ07n5tWpE8aSLmqLi4XBJslGuok=
X-Gm-Message-State: AOJu0Yxsx0zCRiM4S2qAnmfwDpBWEmgfY9GC02xzL8CxPDvfhL8AxSlq
	Pha4ZJWa4ri1nmXrmx1lqsAITsV0dg/Os9Zs1X2/IY+Vu3dXln2WBxf4a8T3
X-Google-Smtp-Source: AGHT+IFZrDimd8FNYDPHv4F7KKc0D2m3buatQjQAK7/RPXydjgkfIRd7m0WaFLDOdBgngEZgnvClXQ==
X-Received: by 2002:a81:a18f:0:b0:627:96bd:b28 with SMTP id 00721157ae682-62a08fda55amr179280197b3.46.1716992535292;
        Wed, 29 May 2024 07:22:15 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a3d8c41sm24580247b3.48.2024.05.29.07.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 07:22:14 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-df4e5b89e49so1962322276.0;
        Wed, 29 May 2024 07:22:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXocj/5SHmjaZLC7XEI35rmX6qF0p1085L4F5fYXaC4yn55aj9/thuNZwrbVvE5Z1hS7jrMmVPI+B/PXnbC2IJ3MmXZe3kxu8HiMo9R2BKGrsTJQvP9W3BX2/tpkSFbHMs5J2OHJ8dEKZMgjIVVgzfshv16yZU=
X-Received: by 2002:a25:2f91:0:b0:dcd:a9ad:7d67 with SMTP id
 3f1490d57ef6-df772166ff3mr17433131276.8.1716992534038; Wed, 29 May 2024
 07:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240222094006.1030709-1-apatel@ventanamicro.com> <20240222094006.1030709-2-apatel@ventanamicro.com>
In-Reply-To: <20240222094006.1030709-2-apatel@ventanamicro.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 May 2024 16:22:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVYFFR7K5SbHBLY-JHhb7YpgGMS_hnRWm8H0KD-wBo+4A@mail.gmail.com>
Message-ID: <CAMuHMdVYFFR7K5SbHBLY-JHhb7YpgGMS_hnRWm8H0KD-wBo+4A@mail.gmail.com>
Subject: Re: [PATCH v14 01/18] irqchip/sifive-plic: Convert PLIC driver into a
 platform driver
To: Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_072221_188301_B43F250D 
X-CRM114-Status: GOOD (  22.39  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQW51cCwKCk9uIFRodSwgRmViIDIyLCAyMDI0IGF0IDEwOjQx4oCvQU0gQW51cCBQYXRlbCA8
YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+IFRoZSBQTElDIGRyaXZlciBkb2VzIG5v
dCByZXF1aXJlIHZlcnkgZWFybHkgaW5pdGlhbGl6YXRpb24gc28gY29udmVydAo+IGl0IGludG8g
YSBwbGF0Zm9ybSBkcml2ZXIuCj4KPiBBZnRlciBjb252ZXJzaW9uLCB0aGUgUExJQyBkcml2ZXIg
aXMgcHJvYmVkIGFmdGVyIENQVXMgYXJlIGJyb3VnaHQtdXAKPiBzbyBzZXR1cCBjcHVocCBzdGF0
ZSBhZnRlciBjb250ZXh0IGhhbmRsZXIgb2YgYWxsIG9ubGluZSBDUFVzIGFyZQo+IGluaXRpYWxp
emVkIG90aGVyd2lzZSBQTElDIGRyaXZlciBjcmFzaGVzIGZvciBwbGF0Zm9ybXMgd2l0aCBtdWx0
aXBsZQo+IFBMSUMgaW5zdGFuY2VzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBh
dGVsQHZlbnRhbmFtaWNyby5jb20+CgpUaGFua3MgZm9yIHlvdXIgcGF0Y2gsIHdoaWNoIGlzIG5v
dyBjb21taXQgOGVjOTliMDMzMTQ3ZWYzYgooImlycWNoaXAvc2lmaXZlLXBsaWM6IENvbnZlcnQg
UExJQyBkcml2ZXIgaW50byBhIHBsYXRmb3JtCmRyaXZlciIpIGluIHY2LjkuCgpJdCBsb29rcyBs
aWtlIHRoaXMgY29udmVyc2lvbiBpcyBjYXVzaW5nIGlzc3VlcyBvbiBCZWFnbGVWIFN0YXJsaWdo
dApCZXRhLiAgQWZ0ZXIgdXBkYXRpbmcgZXNtaWwvdmlzaW9uZml2ZSB0byB2Ni4xMC1yYzEsIHRo
ZSBrZXJuZWwgdXN1YWxseQpmYWlscyB0byBib290LiBBZGRpbmcgImVhcmx5Y29uIGtlZXBfYm9v
dGNvbiIgcmV2ZWFscyB0aGVzZSBkaWZmZXJlbmNlczoKCi1yaXNjdi1wbGljIGMwMDAwMDAuaW50
ZXJydXB0LWNvbnRyb2xsZXI6IG1hcHBlZCAxMzMgaW50ZXJydXB0cyB3aXRoIDIKaGFuZGxlcnMg
Zm9yIDQgY29udGV4dHMuCistLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KK1dB
Uk5JTkc6IENQVTogMCBQSUQ6IDEgYXQgZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5j
OjM3MwpwbGljX2hhbmRsZV9pcnErMHhmMi8weGY2CitNb2R1bGVzIGxpbmtlZCBpbjoKK0NQVTog
MCBQSUQ6IDEgQ29tbTogc3dhcHBlci8wIE5vdCB0YWludGVkCjYuMTAuMC1yYzEtc3RhcmxpZ2h0
LTAyMzQyLWcwYmE0Yzc2Y2EwZTgtZGlydHkgIzMyMworSGFyZHdhcmUgbmFtZTogQmVhZ2xlViBT
dGFybGlnaHQgQmV0YSAoRFQpCitlcGMgOiBwbGljX2hhbmRsZV9pcnErMHhmMi8weGY2CisgcmEg
OiBnZW5lcmljX2hhbmRsZV9kb21haW5faXJxKzB4MWMvMHgyYQorZXBjIDogZmZmZmZmZmY4MDMz
Zjk5NCByYSA6IGZmZmZmZmZmODAwNjMxOWEgc3AgOiBmZmZmZmZjODAwMDAzZjUwCisgZ3AgOiBm
ZmZmZmZmZjgxMmQ2M2YwIHRwIDogZmZmZmZmZDg4MDBiODAwMCB0MCA6IDAwMDAwMDAwMDAwMDAw
NDAKKyB0MSA6IDAwMDAwMDAwMDAwMDAwMDAgdDIgOiAwMDAwMDAwMDAwMDAxMDAwIHMwIDogZmZm
ZmZmYzgwMDAwM2ZhMAorIHMxIDogMDAwMDAwMDAwMDAwMDAwOSBhMCA6IGZmZmZmZmQ4ODAxODM2
MDAgYTEgOiAwMDAwMDAwMDAwMDAwMDA5CisgYTIgOiAwMDAwMDAwMDAwMDAwMDAwIGEzIDogMDAw
MDAwMDAwMDAwMDAwMCBhNCA6IDAwMDAwMDAwMDAwMDAwMDAKKyBhNSA6IDAwMDAwMDAwMDAwMDAw
MDAgYTYgOiBmZmZmZmZkODgwNDAwMjQ4IGE3IDogZmZmZmZmZDg4MDQwMDJiOAorIHMyIDogZmZm
ZmZmZDlmOGZhYzQ1OCBzMyA6IDAwMDAwMDAwMDAwMDAwMDQgczQgOiAwMDAwMDAwMDAwMDAwMDAw
CisgczUgOiBmZmZmZmZmZjgxMjkzZjU4IHM2IDogZmZmZmZmZDg4MDE0YWMwMCBzNyA6IDAwMDAw
MDAwMDAwMDAwMDQKKyBzOCA6IGZmZmZmZmM4MDAwMTNiMmMgczkgOiBmZmZmZmZjODAwMDEzYjM0
IHMxMDogMDAwMDAwMDAwMDAwMDAwNgorIHMxMTogZmZmZmZmZDlmOGZjMTQ1OCB0MyA6IDAwMDAw
MDAwMDAwMDAwMDIgdDQgOiAwMDAwMDAwMDAwMDAwNDAyCisgdDUgOiBmZmZmZmZkODgwMDYxMGMw
IHQ2IDogZmZmZmZmZDg4MDA2MTBlMAorc3RhdHVzOiAwMDAwMDAwMjAwMDAwMTAwIGJhZGFkZHI6
IGZmZmZmZmQ5ZjhmYWM0NTggY2F1c2U6IDAwMDAwMDAwMDAwMDAwMDMKK1s8ZmZmZmZmZmY4MDMz
Zjk5ND5dIHBsaWNfaGFuZGxlX2lycSsweGYyLzB4ZjYKK1s8ZmZmZmZmZmY4MDA2MzE5YT5dIGdl
bmVyaWNfaGFuZGxlX2RvbWFpbl9pcnErMHgxYy8weDJhCitbPGZmZmZmZmZmODAzM2Q3YWE+XSBy
aXNjdl9pbnRjX2lycSsweDI2LzB4NjAKK1s8ZmZmZmZmZmY4MDZjOTJlZT5dIGhhbmRsZV9yaXNj
dl9pcnErMHg0YS8weDc0CitbPGZmZmZmZmZmODA2ZDIzNDY+XSBjYWxsX29uX2lycV9zdGFjaysw
eDMyLzB4NDAKKy0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQorVW5hYmxlIHRv
IGhhbmRsZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGF0IHZpcnR1YWwgYWRkcmVz
cwowMDAwMDAwMDAwMDAwMDA0CitPb3BzIFsjMV0KK01vZHVsZXMgbGlua2VkIGluOgorQ1BVOiAw
IFBJRDogMSBDb21tOiBzd2FwcGVyLzAgVGFpbnRlZDogRyAgICAgICAgVwo2LjEwLjAtcmMxLXN0
YXJsaWdodC0wMjM0Mi1nMGJhNGM3NmNhMGU4LWRpcnR5ICMzMjMKK0hhcmR3YXJlIG5hbWU6IEJl
YWdsZVYgU3RhcmxpZ2h0IEJldGEgKERUKQorZXBjIDogcGxpY19oYW5kbGVfaXJxKzB4NjYvMHhm
NgorIHJhIDogZ2VuZXJpY19oYW5kbGVfZG9tYWluX2lycSsweDFjLzB4MmEKK2VwYyA6IGZmZmZm
ZmZmODAzM2Y5MDggcmEgOiBmZmZmZmZmZjgwMDYzMTlhIHNwIDogZmZmZmZmYzgwMDAwM2Y1MAor
IGdwIDogZmZmZmZmZmY4MTJkNjNmMCB0cCA6IGZmZmZmZmQ4ODAwYjgwMDAgdDAgOiAwMDAwMDAw
MDAwMDAwMDQwCisgdDEgOiAwMDAwMDAwMDAwMDAwMDAwIHQyIDogMDAwMDAwMDAwMDAwMTAwMCBz
MCA6IGZmZmZmZmM4MDAwMDNmYTAKKyBzMSA6IDAwMDAwMDAwMDAwMDAwMDkgYTAgOiBmZmZmZmZk
ODgwMTgzNjAwIGExIDogMDAwMDAwMDAwMDAwMDAwOQorIGEyIDogMDAwMDAwMDAwMDAwMDAwMCBh
MyA6IDAwMDAwMDAwMDAwMDAwMDAgYTQgOiAwMDAwMDAwMDAwMDAwMDAwCisgYTUgOiBmZmZmZmZm
ZjgwMzNkNzJhIGE2IDogZmZmZmZmZDg4MDQwMDI0OCBhNyA6IGZmZmZmZmQ4ODA0MDAyYjgKKyBz
MiA6IGZmZmZmZmQ5ZjhmYWM0NTggczMgOiAwMDAwMDAwMDAwMDAwMDA0IHM0IDogZmZmZmZmZDg4
MDE4MzYzMAorIHM1IDogZmZmZmZmZmY4MTI5M2Y1OCBzNiA6IGZmZmZmZmZmODEyOTQ4YTAgczcg
OiBmZmZmZmZmZjgwYzRlNjYwCisgczggOiBmZmZmZmZmZjgwZDllZWEwIHM5IDogZmZmZmZmYzgw
MDAxM2IzNCBzMTA6IDAwMDAwMDAwMDAwMDAwMDYKKyBzMTE6IGZmZmZmZmQ5ZjhmYzE0NTggdDMg
OiAwMDAwMDAwMDAwMDAwMDAyIHQ0IDogMDAwMDAwMDAwMDAwMDQwMgorIHQ1IDogZmZmZmZmZDg4
MDA2MTBjMCB0NiA6IGZmZmZmZmQ4ODAwNjEwZTAKK3N0YXR1czogMDAwMDAwMDIwMDAwMDEwMCBi
YWRhZGRyOiAwMDAwMDAwMDAwMDAwMDA0IGNhdXNlOiAwMDAwMDAwMDAwMDAwMDBkCitbPGZmZmZm
ZmZmODAzM2Y5MDg+XSBwbGljX2hhbmRsZV9pcnErMHg2Ni8weGY2CitbPGZmZmZmZmZmODAwNjMx
OWE+XSBnZW5lcmljX2hhbmRsZV9kb21haW5faXJxKzB4MWMvMHgyYQorWzxmZmZmZmZmZjgwMzNk
N2FhPl0gcmlzY3ZfaW50Y19pcnErMHgyNi8weDYwCitbPGZmZmZmZmZmODA2YzkyZWU+XSBoYW5k
bGVfcmlzY3ZfaXJxKzB4NGEvMHg3NAorWzxmZmZmZmZmZjgwNmQyMzQ2Pl0gY2FsbF9vbl9pcnFf
c3RhY2srMHgzMi8weDQwCitDb2RlOiA4YjkzIGQ3MGIgNWIxNyAwMGY1IDBiMTMgZmE4YiBmYzE3
IDAwYTUgMGMxMyA1YTBjIChhNzgzKSAwMDA5CistLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAw
MDAwIF0tLS0KK0tlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBGYXRhbCBleGNlcHRpb24gaW4g
aW50ZXJydXB0CitTTVA6IHN0b3BwaW5nIHNlY29uZGFyeSBDUFVzCistLS1bIGVuZCBLZXJuZWwg
cGFuaWMgLSBub3Qgc3luY2luZzogRmF0YWwgZXhjZXB0aW9uIGluIGludGVycnVwdCBdLS0tCgpB
cyAibWFwcGVkIDEzMyBpbnRlcnJ1cHRzIiBpcyBubyBsb25nZXIgcHJpbnRlZCwgaXQgbG9va3Mg
bGlrZSBhbgp1bmV4cGVjdGVkIGVhcmx5IGludGVycnVwdCBjb21lcyBpbiB3aGlsZSBzdGlsbCBp
biBwbGljX3Byb2JlKCkuCgpFc21pbCBzdWdnZXN0ZWQgcmV2ZXJ0aW5nIGFsbCBvZjoKYTdmYjY5
ZmZkN2NlNDM4YSBpcnFjaGlwL3NpZml2ZS1wbGljOiBBdm9pZCBleHBsaWNpdCBjcHVtYXNrIGFs
bG9jYXRpb24gb24gc3RhY2sKYWJiNzIwNTc5NDkwMDUwMyBpcnFjaGlwL3NpZml2ZS1wbGljOiBJ
bXByb3ZlIGxvY2tpbmcgc2FmZXR5IGJ5IHVzaW5nCmlycXNhdmUvaXJxcmVzdG9yZQo5NTY1MjEw
NjQ3ODAzMGY1IGlycWNoaXAvc2lmaXZlLXBsaWM6IFBhcnNlIG51bWJlciBvZiBpbnRlcnJ1cHRz
IGFuZApjb250ZXh0cyBlYXJseSBpbiBwbGljX3Byb2JlKCkKYTE1NTg3Mjc3YTI0NmMzOCBpcnFj
aGlwL3NpZml2ZS1wbGljOiBDbGVhbnVwIFBMSUMgY29udGV4dHMgdXBvbgppcnFkb21haW4gY3Jl
YXRpb24gZmFpbHVyZQo2YzcyNWYzM2Q2N2I1M2YyIGlycWNoaXAvc2lmaXZlLXBsaWM6IFVzZSBy
aXNjdl9nZXRfaW50Y19od25vZGUoKSB0bwpnZXQgcGFyZW50IGZ3bm9kZQpiNjhkMGZmNTI5YTkz
OWExIGlycWNoaXAvc2lmaXZlLXBsaWM6IFVzZSBkZXZtX3h5eigpIGZvciBtYW5hZ2VkIGFsbG9j
YXRpb24KMjVkODYyZTE4M2Q0ZWZlYiBpcnFjaGlwL3NpZml2ZS1wbGljOiBVc2UgZGV2X3h5eigp
IGluLXBsYWNlIG9mIHByX3h5eigpCjhlYzk5YjAzMzE0N2VmM2IgaXJxY2hpcC9zaWZpdmUtcGxp
YzogQ29udmVydCBQTElDIGRyaXZlciBpbnRvIGEgcGxhdGZvcm0gZHJpdmVyCgpBZnRlciB0aGlz
LCB0aGUgUExJQyBpcyBpbml0aWFsaXplZCBlYXJsaWVyIGFnYWluLCBhbmQgdGhpcyBpbmRlZWQK
c2VlbXMgdG8gZml4IHRoZSBpc3N1ZSBmb3IgbWUuCkJlZm9yZSwgdGhlIGtlcm5lbCBib290ZWQg
ZmluZSBpbiBvbmx5IGNhLiAxIG91dCBvZiA1IHRyaWVzLgpBZnRlciB0aGUgcmV2ZXJ0cywgaXQg
Ym9vdGVkIDUvNS4KCkRvIHlvdSBrbm93IHdoYXQncyBnb2luZyBvbj8gSXMgdGhlcmUgYSBzaW1w
bGVyIGZpeD8KClRoYW5rcyEKCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAg
ICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExp
bnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
