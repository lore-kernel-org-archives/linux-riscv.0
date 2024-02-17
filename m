Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071CFC48BC3
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 05:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zNltzC+1aeZmwUuhhA7BX0Ifdbw1A9mhpoT0WFs8qMc=; b=GZluP4/kEUspUh
	E4o1JAVQEzLyuzt/Vjui128xN2S0pHEZWt5QPWn4aTFsAihpfxk6biUiRv+NlI5Rx78yB0stNHW09
	peKA4AONB3ZVFJDPy8mrEzemAnYg9/0ZFDt7AhqVjLapC3+ijQKdBzV88j4OQTn7Mj+uDEgXbdrB4
	2TfE0moa+ZrWF6sZfPVN4bMuQlJ9GLobRu2x0rtZSpaw03SwMxkWoI2Eqci53BD7VdJWMd05KBSJf
	Mj/4TaB8OXuXsrp+5ppmAvwFr4vBULi+0R5RUsgPZc69wvYy43XvX4MVp9qZwfGstUN4XQtQKS2KW
	Jhpj65he2uzbFIwykFGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbDTK-00000004hYE-3A8w;
	Sat, 17 Feb 2024 05:42:46 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbDTH-00000004hXH-1eSf
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 05:42:44 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-512a8e71331so16312e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 21:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708148561; x=1708753361; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2XJqDi+VWb+RWFjBl96LehTOOg8v5aVoczUYhI4x1E=;
        b=bwGRga9RR3VFjbFbgmLfSFRHWPhgMEYUaKid9x4UPsU0v+/AasVWxpAbNdpX4tXE+H
         jHCcth1ByM9euGdPWfVqxCitu+Uwrb2/tqQu9ykFqdeIQTTiHrn3hWmBqKfeOEeCB9tC
         8KrUNOIb++VyVo3uOO23A6dayecGvLZLOn1edluzbvnJAmaDZfH4Nr2D4JyTN9Y8SYkS
         q1RGfsTTR33UMvG+KLXEfp/sJIEiB4l7h1ttSZ7t54PcQs369vKJ728PVZYvd8en5ww6
         2mCIXxKIa0a0ex+avqPfTDV9D+1onSKWu5JYvjprBhHARocKN8ZjXGLtqXXf/YPXBhtP
         flug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708148561; x=1708753361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2XJqDi+VWb+RWFjBl96LehTOOg8v5aVoczUYhI4x1E=;
        b=C4f7uvI0yBl7qx0akNLCm6duXPoV9iWXX05wIBUk2qzF4C7CB/4Oj4w4iD0xRgSJA/
         tihuczYcg2vSWgsJzgEclhELfMT148+DYSesHhQXDwBBMSF9TwEuGs6gv6XtibE9zjES
         ulay9pqvoFP+BIiR+s/xmRgE3/ZyL649RYX6cRsoVG27AoHlxKRUC5ms1iLajGtYYqy4
         Rs5h+GUA7/2by7AMuAykFXzaIwb0Q6j6SxkHVQixbeDHcaS+9tY0XIleprVFIt1Q5M0s
         JZIolQeKvoel6PxNu/HKBLML7XSZ7rFDVRA5plYJfph4RULyXD187Wtzin+Fy8VQAw/d
         FSuw==
X-Forwarded-Encrypted: i=1; AJvYcCVrYOghq7sBjEHVF/+yUY+xO9Syx+a8LjgSyAYYPzX+X3nuVKMDbGtzvFkFSFz68fZiUfFxP/wq64174u6hLUvSsIjPHgoT4iSgx0NsIRXF
X-Gm-Message-State: AOJu0YxBrt3o9oyTGu0/oPHcMOJx25UoFGklTR5XZmwnLsjooDAjneVg
	HlJsFzkJsjkEqVTGFg6z+jnessI7dBCnOsNyFlKONhErG9VxmXkvpRWrjZJeTOu45dZJE7XiSYL
	mlOAZ4URzKpsyZIYXy/WW0d/5pCLJ76J309FYLA==
X-Google-Smtp-Source: AGHT+IGNn3qXE8Q2rV0AbEGEYH7CRDHvt7ZbR9eJEmA9ut7fgUgx1eQcMY50Tzh0dWXfbhyTfzgBRj3nELnm/DfNA7E=
X-Received: by 2002:a05:6512:526:b0:511:96d0:5ae1 with SMTP id
 o6-20020a056512052600b0051196d05ae1mr5084453lfc.40.1708148560820; Fri, 16 Feb
 2024 21:42:40 -0800 (PST)
MIME-Version: 1.0
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <20240127161753.114685-15-apatel@ventanamicro.com> <87jzn4ctks.ffs@tglx>
 <CAAhSdy2aeyJBcMVre12jGwU52oP9Z=1emB-bcYxygdR3QhP+6w@mail.gmail.com> <878r3kcg7e.ffs@tglx>
In-Reply-To: <878r3kcg7e.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 17 Feb 2024 11:12:29 +0530
Message-ID: <CAK9=C2WWBrUae2hduUBwuxd8=23_KO3-x1fF=BaTtxJMHVyFrg@mail.gmail.com>
Subject: Re: [PATCH v12 14/25] irqchip/sifive-plic: Convert PLIC driver into a
 platform driver
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_214243_483035_F6D1E381 
X-CRM114-Status: GOOD (  22.80  )
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
Cc: Marc Zyngier <maz@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBGZWIgMTcsIDIwMjQgYXQgMTo1MuKAr0FNIFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIEZyaSwgRmViIDE2IDIwMjQgYXQgMjI6NDEsIEFu
dXAgUGF0ZWwgd3JvdGU6Cj4gPiBPbiBGcmksIEZlYiAxNiwgMjAyNCBhdCA5OjAz4oCvUE0gVGhv
bWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+IHdyb3RlOgo+ID4+IEkgZG9uJ3QgdGhp
bmsgdGhhdCByZW1vdmluZyB0aGUgc2V0dXAgcHJvdGVjdGlvbiBpcyBjb3JyZWN0Lgo+ID4+Cj4g
Pj4gQXNzdW1lIHlvdSBoYXZlIG1heGNwdXM9TiBvbiB0aGUga2VybmVsIGNvbW1hbmQgbGluZSwg
dGhlbiB0aGUgYWJvdmUKPiA+PiBmb3JfZWFjaF9vbmxpbmVfY3B1KCkgbG9vcCB3b3VsZCByZXN1
bHQgaW4gY3B1aHBfc2V0dXAgPT0gdHJ1ZSB3aGVuIHRoZQo+ID4+IGluc3RhbmNlcyBmb3IgdGhl
IG5vdCBvbmxpbmVkIENQVXMgYXJlIHNldCB1cCwgbm8/Cj4gPgo+ID4gQSBwbGF0Zm9ybSBjYW4g
aGF2ZSBtdWx0aXBsZSBQTElDIGluc3RhbmNlcyB3aGVyZSBlYWNoIFBMSUMKPiA+IGluc3RhbmNl
IHRhcmdldHMgYSBzdWJzZXQgb2YgSEFSVHMgKG9yIENQVXMpLgo+ID4KPiA+IFByZXZpb3VzbHkg
KGJlZm9yZSB0aGlzIHBhdGNoKSwgd2Ugd2VyZSBwcm9iaW5nIFBMSUMgdmVyeSBlYXJseSBzbyBv
bgo+ID4gYSBwbGF0Zm9ybSB3aXRoIG11bHRpcGxlIFBMSUMgaW5zdGFuY2VzLCB3ZSBuZWVkIHRv
IGVuc3VyZSB0aGF0IGNwdWhwCj4gPiBzZXR1cCBpcyBkb25lIG9ubHkgYWZ0ZXIgUExJQyBjb250
ZXh0IGFzc29jaWF0ZWQgd2l0aCBib290IENQVSBpcwo+ID4gaW5pdGlhbGl6ZWQgaGVuY2UgdGhl
IHBsaWNfY3B1aHBfc2V0dXBfZG9uZSBjaGVjay4KPiA+Cj4gPiBUaGlzIHBhdGNoIGNvbnZlcnRz
IFBMSUMgZHJpdmVyIGludG8gYSBwbGF0Zm9ybSBkcml2ZXIgc28gbm93IFBMSUMKPiA+IGluc3Rh
bmNlcyBhcmUgcHJvYmVkIGFmdGVyIGFsbCBhdmFpbGFibGUgQ1BVcyBhcmUgYnJvdWdodC11cC4g
SW4gdGhpcwo+ID4gY2FzZSwgdGhlIGNwdWhwIHNldHVwIG11c3QgYmUgZG9uZSBvbmx5IGFmdGVy
IFBMSUMgY29udGV4dCBvZiBhbGwKPiA+IGF2YWlsYWJsZSBDUFVzIGFyZSBpbml0aWFsaXplZCBv
dGhlcndpc2Ugc29tZSBvZiB0aGUgQ1BVcyBjcmFzaAo+ID4gaW4gcGxpY19zdGFydGluZ19jcHUo
KSBkdWUgdG8gbGFjayBvZiBQTElDIGNvbnRleHQgaW5pdGlhbGl6YXRpb24uCj4KPiBZb3UncmUg
bWlzc2luZyB0aGUgcG9pbnQuCj4KPiBBc3N1bWUgeW91IGhhdmUgOCBDUFVzIGFuZCAyIFBMSUMg
aW5zdGFuY2VzIG9uZSBmb3IgQ1BVMC0zIGFuZCBvbmUgZm9yCj4gQ1BVNC03Lgo+Cj4gQWRkICJt
YXhjcHVzPTQiIG9uIHRoZSBrZXJuZWwgY29tbWFuZCBsaW5lLCB0aGVuIG9ubHkgdGhlIGZpcnN0
IDQgQ1BVcwo+IGFyZSBicm91Z2h0IHVwLgo+Cj4gU28gYXQgcHJvYmUgdGltZSBjcHVfb25saW5l
X21hc2sgaGFzIGJpdCAwLDEsMiwzIHNldC4KPgo+IFdoZW4gdGhlIGZpcnN0IFBMSUMgaXQgcHJv
YmVkIHRoZSBsb29wIHdoaWNoIGNoZWNrcyB0aGUgY29udGV4dCBmb3IgZWFjaAo+IG9ubGluZSBD
UFUgd2lsbCBub3QgY2xlYXIgY3B1aHBfc2V0dXAgYW5kIHRoZSBob3RwbHVnIHN0YXRlIGlzIGlu
c3RhbGxlZC4KPgo+IE5vdyB0aGUgc2Vjb25kIFBMSUMgaXMgcHJvYmVkICh0aGUgb25lIGZvciB0
aGUgb2ZmbGluZSBDUFVzIDQtNykgYW5kIHRoZQo+IGxvb3Agd2lsbCBhZ2FpbiBub3QgY2xlYXIg
Y3B1aHBfc2V0dXAgYW5kIGl0IHRyaWVzIHRvIGluc3RhbGwgdGhlIHN0YXRlCj4gYWdhaW4sIG5v
PwoKQWhoLCB5ZXMuIEdvb2QgY2F0Y2guCgpGb3IgdGhlICJtYXhjcHVzIiBpbiBrZXJuZWwgY29t
bWFuZC1saW5lLCB3ZSBjYW4ndCByZWx5IG9uIHRoZQpjcHVfb25saW5lX21hc2suIEkgd2lsbCBw
cmVzZXJ2ZSB0aGUgcGxpY19jcHVocF9zZXR1cF9kb25lCmNoZWNrIGluIHRoZSBuZXh0IHJldmlz
aW9uLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
