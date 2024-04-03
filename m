Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E02CD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 16:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QXkjma+g/EUDBA5NHBsTZlT0mtjRyoljFyE6jUr92Og=; b=Pxz2/CcA4sowof
	HrVj/e3LeKKsKAiGF1lyHJsptxLx5GQOqxWNsy8uEuNdzU6zJCM/5RkGzgcQRPdoGe/jrz52draXI
	Lom+4Tf6Ml6dawFvv0Cv5WP29Ukrc8UUFlcEwUz4r06G35aUTjItb99QMjZEbP/O6LwgHLPSptmsE
	33CSK3cU+3HHcc9YTimAvkTgrlhLpI9Z4EprUBnqxqdY9DUr3qfehWfF80CJIc6RIEShfcdUvpUGW
	e04QpSmCrDyP9NegcsWJhrkh+C8/pqUYgBbDxbiCyLzqVrSgMmWttGYyBqXUioU6dSUS0yRTq2Unt
	pl4Pg048l9bcjlC7BxrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs3Tp-0000000GyAm-2XG0;
	Wed, 03 Apr 2024 16:28:53 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs3Tm-0000000Gy9U-1Rbu
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 16:28:52 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-7d0262036afso724939f.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 09:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712161726; x=1712766526; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZD7uwIcLRwgER+t9bCi/p5bpIhFWWkg08DE3SUOO/2Q=;
        b=UZGGtfVGbzuCG9E/1EmHu7old/5OMXNjy1Qwd5rcOP1IkLgXFTK29jYbSCXixVBk+r
         cej4pbQX3wg/H0Y2bhK8Ws7MKKxQ8DNnA4ysaZMxc5zGihc6SvpmuzpojVQf5qzKYOOy
         cx9vMUrCbVJQ5hJXgQFjUa7V4xRM7fHsusxtSepA4MdkBUP4BTQ0BkqLDqUg5wQWRNqa
         6gFfVHUQgo4oDsa7dXUimL2+Tquf5pPHbXWklBibQ1lPlv8Kxdo1EYA8l4Wx/Ndv1nfg
         2giWVf5JHg5epFqJ6XIb4doPKyG5016exBQBEprxgIhOwobbZlVczeCBKpDkRWIEJblS
         oOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712161726; x=1712766526;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZD7uwIcLRwgER+t9bCi/p5bpIhFWWkg08DE3SUOO/2Q=;
        b=RsUHAQxDt5/fNiXuodOowFxLnniDG41C5LSQ8uZpmiqkvjE69rPOnTkQbxOD847bTW
         5fkM/3AuAhVwTs+AWQH4RVpPdE5Kisjfj/iC0cCE/fvchV2oJNpkGo4J5EFu7VLAGeDb
         HDnrsQiKi4ozG+esdNbMYcmi8L18vyObSN0GscBDtDuBqLZTrbnbamWc2aORGhBxkofm
         dmpm7LeEgJFINgJZTqX/xgYAL3TDf2rtgLJbpsUh3leNeZGu6RqI294+MjL2hHRcKa+W
         s2cL1WzLg9VVC+QxVQr2dCCg8w8qe84UN83N6oHZ9d17x9shxsUEbCeyBWm4DTcvkJmD
         UXCg==
X-Forwarded-Encrypted: i=1; AJvYcCXBXLrrQsx4CevkLQo3mpG4iugoD0/feIhL5vYczDWMvFrIMhYoJKi610vmCOExWhTJdulb4QnnTDgas2ub5QGNnlpen4if/++qYd7FEiBs
X-Gm-Message-State: AOJu0YxBaxLf24/q4kePy3ApFhG0lolRZeesanhQtNZSE7nqHNLp9Cy4
	DJhAxAMnBmn/ILtSVlfIj4WevTnSRZmzUVOnfnTJ8SjqDjgmAladCFfQ1pclx1k=
X-Google-Smtp-Source: AGHT+IFuQumNPkIhD67CrMU/Bp7tP6hSarQ6ue0WJv8UDmefSdlxUtRIxsTCMyeerym07w+zyPiw1g==
X-Received: by 2002:a05:6602:1d93:b0:7d0:8cff:cff3 with SMTP id hj19-20020a0566021d9300b007d08cffcff3mr154596iob.8.1712161726133;
        Wed, 03 Apr 2024 09:28:46 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.190])
        by smtp.gmail.com with ESMTPSA id f21-20020a056638169500b0047c451a313asm3895973jat.100.2024.04.03.09.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 09:28:45 -0700 (PDT)
Message-ID: <4dbd5daf-d100-4ae2-8bda-c657e23a809e@sifive.com>
Date: Wed, 3 Apr 2024 11:28:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 01/18] irqchip/sifive-plic: Convert PLIC driver into a
 platform driver
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Anup Patel <apatel@ventanamicro.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Marc Zyngier <maz@kernel.org>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 linux-kernel@vger.kernel.org, Saravana Kannan <saravanak@google.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Andrew Jones <ajones@ventanamicro.com>
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
 <20240222094006.1030709-2-apatel@ventanamicro.com>
 <CA+V-a8tGucbJ87hsMQDEgcor5BzDmB_WnRsEn6c9F_HzucWLXQ@mail.gmail.com>
 <CAK9=C2VgiRcQjBEPmZjdcMf221omKS8ntdcenSE7G__4xYcCUA@mail.gmail.com>
 <CA+V-a8ser=hDmst6+XSeOWaEoOd+iY3Ys6bYBWDa5UYPfT+Pug@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <CA+V-a8ser=hDmst6+XSeOWaEoOd+iY3Ys6bYBWDa5UYPfT+Pug@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_092850_582788_C5007B79 
X-CRM114-Status: GOOD (  17.52  )
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

SGkgUHJhYmhha2FyLAoKT24gMjAyNC0wNC0wMyAxMDo0OSBBTSwgTGFkLCBQcmFiaGFrYXIgd3Jv
dGU6Cj4gT24gV2VkLCBBcHIgMywgMjAyNCBhdCAzOjE34oCvUE0gQW51cCBQYXRlbCA8YXBhdGVs
QHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Pgo+PiBPbiBXZWQsIEFwciAzLCAyMDI0IGF0IDI6
MDHigK9QTSBMYWQsIFByYWJoYWthcgo+PiA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdy
b3RlOgo+Pj4KPj4+IEhpIEFudXAsCj4+Pgo+Pj4gT24gVGh1LCBGZWIgMjIsIDIwMjQgYXQgOTo0
MeKAr0FNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPj4+Pgo+
Pj4+IFRoZSBQTElDIGRyaXZlciBkb2VzIG5vdCByZXF1aXJlIHZlcnkgZWFybHkgaW5pdGlhbGl6
YXRpb24gc28gY29udmVydAo+Pj4+IGl0IGludG8gYSBwbGF0Zm9ybSBkcml2ZXIuCj4+Pj4KPj4+
PiBBZnRlciBjb252ZXJzaW9uLCB0aGUgUExJQyBkcml2ZXIgaXMgcHJvYmVkIGFmdGVyIENQVXMg
YXJlIGJyb3VnaHQtdXAKPj4+PiBzbyBzZXR1cCBjcHVocCBzdGF0ZSBhZnRlciBjb250ZXh0IGhh
bmRsZXIgb2YgYWxsIG9ubGluZSBDUFVzIGFyZQo+Pj4+IGluaXRpYWxpemVkIG90aGVyd2lzZSBQ
TElDIGRyaXZlciBjcmFzaGVzIGZvciBwbGF0Zm9ybXMgd2l0aCBtdWx0aXBsZQo+Pj4+IFBMSUMg
aW5zdGFuY2VzLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZl
bnRhbmFtaWNyby5jb20+Cj4+Pj4gLS0tCj4+Pj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtc2lmaXZl
LXBsaWMuYyB8IDEwMSArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KPj4+PiAgMSBmaWxl
IGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKyksIDQwIGRlbGV0aW9ucygtKQo+Pj4+Cj4+PiBUaGlz
IHBhdGNoIHNlZW1zIHRvIGhhdmUgYnJva2VuIHRoaW5ncyBvbiBSWi9GaXZlIFNvQywgYWZ0ZXIg
cmV2ZXJ0aW5nCj4+PiB0aGlzIHBhdGNoIEkgZ2V0IHRvIGJvb3QgaXQgYmFjayBhZ2FpbiBvbiB2
Ni45LXJjMi4gTG9va3MgbGlrZSB0aGVyZQo+Pj4gaXMgc29tZSBwcm9iZSBvcmRlciBpc3N1ZSBh
ZnRlciBzd2l0Y2hpbmcgdG8gcGxhdGZvcm0gZHJpdmVyPwo+Pgo+PiBZZXMsIHRoaXMgaXMgbW9z
dCBsaWtlbHkgcmVsYXRlZCB0byBwcm9iZSBvcmRlcmluZyBiYXNlZCBvbiB5b3VyIERULgo+Pgo+
PiBDYW4geW91IHNoYXJlIHRoZSBmYWlsaW5nIGJvb3QgbG9nIGFuZCBEVCA/Cj4gCj4gbm9uIHdv
cmtpbmcgY2FzZSwgaHR0cHM6Ly9wYXN0ZS5kZWJpYW4ubmV0LzEzMTI5NDcvCgpMb29rcyBsaWtl
IHlvdSBuZWVkIHRvIGFkZCAia2VlcF9ib290Y29uIiB0byB5b3VyIGtlcm5lbCBjb21tYW5kIGxp
bmUgdG8gZ2V0IGEKZnVsbCBsb2cgaGVyZS4KCj4gYWZ0ZXIgcmV2ZXJ0aW5nLCBodHRwczovL3Bh
c3RlLmRlYmlhbi5uZXQvMTMxMjk0OC8KPiAoYXR0YWNoZWQgaXMgdGhlIERUQikKCkkgZG9uJ3Qg
c2VlIGFueXRoaW5nIHN1c3BpY2lvdXMgYmV0d2VlbiB0aGUgInJpc2N2LWludGMiIGxpbmVzIGFu
ZCB0aGUgIkZpeGVkCmRlcGVuZGVuY3kgY3ljbGUocykiIGxpbmVzIHRoYXQgbG9va3MgbGlrZSBp
dCB3b3VsZCBkZXBlbmQgb24gdGhlIFBMSUMgSVJRCmRvbWFpbi4gTWF5YmUgdGhlcmUgaXMgc29t
ZSBkcml2ZXIgdGhhdCBkb2VzIG5vdCBoYW5kbGUgLUVQUk9CRV9ERUZFUj8gSXQncyBoYXJkCnRv
IHRlbGwgd2l0aG91dCB0aGUgZnVsbCBsb2cgZnJvbSB0aGUgZmFpbHVyZSBjYXNlLgoKUmVnYXJk
cywKU2FtdWVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
