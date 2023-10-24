Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC79AC07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 12:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gyk4GXlIBY+xn/n2Prlu1xX/d8vcLeP0bHljW2lBvgA=; b=BBm0/tnhYFZRpL
	dQvBh4tRWSHQfzBuFcnpHukLUCFc7WdZ0VSkzXBfrtzXXKqmnfh697M+leAi3wp45b3vvcXgpCIOz
	ia5o35q+6cQefF+sDBKJWcOWJvTz8ZjF9U8ECiWMl/+raMEPb6SDM/Fsy53UoGN6oB8cgNjU+58yo
	nzx17PtqKwCxSrGS00R8TvdI49dyoYpmmQvhWC+tPZrnRr/qKBYB7EX/OTI33x8Q5mql/XGFcQm87
	0Mw8UIisnYnJsTOb+YThV/xjk54X9BJDdwzj82AVhY9Gwo3G0zHp4VfATd6odz/+nIWBJBhH4al3G
	BaeTo9KkG0s49Y1Ccc4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvGC6-009ihy-2k;
	Tue, 24 Oct 2023 12:07:34 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvGC3-009igp-18
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 12:07:32 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-694ed847889so3645398b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 24 Oct 2023 05:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698149248; x=1698754048; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnbQ6Q2EDEmeDrsBAt+FskdauroAd8IioN5ZwkR9W1E=;
        b=ezXHYXxGUdXzvuCa60GbWOA3n6IabzGUqv6tlYZaeOmG2LAfEvGvvktfduxZihfZNH
         jQvmKrCehlguTPif1EuJig2x/X8n34Opu9fxaw/O+apqCmOV+clgZx1Ty9D31Zm6d+op
         BeqXv4EeIqvQepFdAdJarTA3njmNNRgg1uWT/JDz8IXxqlGUba29DANWG+7cgTjHuDMg
         vQdcK4x3lYG7coTGOSuwby7He1QoCT3x71J2UPguf3ilu8cOcpbPc7qTjwmgOEBOJTjh
         MxnV+Hajyn6tWiw3jC6TttKqEp/VqgAOTjMTppOWgnfaM403mgQR04Dyx2B2i12iIsv1
         s0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698149248; x=1698754048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fnbQ6Q2EDEmeDrsBAt+FskdauroAd8IioN5ZwkR9W1E=;
        b=HYMPSSCfdvpZ6t7NVSfw2BbJ2j3cm9Mu+NlzyNIQlGWhZwVAeM/NKtXyiSgX+41xj/
         Jd2X0tVZ5QLXpojcACKejoTIl8Pr//ODaU+Owq1XEqXl8DhpGmGvE1pAcd6/OYmt3oMn
         k8dwfZZ/InKTkkBqVpkoKwZxrcPrleDbROLIQC49s+EVhDBLBHrlWAX2DYc65ioRwieM
         woSqEOm6o0ewnL9pgq2fj0pExgpVeECyYX43HWBbnitq//OBH09f9GPUP6aRoMdKNiFZ
         8sbO67CP8Lntvaip2wBOv3J2/m6VLpHCnTCTcEdUqgu0HAKNE7SXjtnKbphPUjtCYqc5
         /Dog==
X-Gm-Message-State: AOJu0YwLnOwiyUe78kUMEHP/1+lUFvUAF3Zqot7YJ2V/frzyXt2ME3H2
	dGWripPhYho2JOYCKORxxeRrdoqH2sIpwKAsDAgC7bF9ilGM8oz6
X-Google-Smtp-Source: AGHT+IG0RTgNFoEme/gXUtHy69ZlWk+VDdfjWqZ9EjZXIbatFOkLD9Eb6PUwQTRfBjWAxVZwmGXX+UlFPH+OLG/I4So=
X-Received: by 2002:a05:6a20:e109:b0:163:2da1:387f with SMTP id
 kr9-20020a056a20e10900b001632da1387fmr3054954pzb.50.1698149247695; Tue, 24
 Oct 2023 05:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <20231023172800.315343-1-apatel@ventanamicro.com>
 <20231023172800.315343-2-apatel@ventanamicro.com> <87h6mgs09f.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87h6mgs09f.fsf@all.your.base.are.belong.to.us>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 24 Oct 2023 17:37:16 +0530
Message-ID: <CAK9=C2U7nRc95-DoxesfOzBBat8wNMhTqi4NTJWgJjQYd9NZow@mail.gmail.com>
Subject: Re: [PATCH v11 01/14] RISC-V: Don't fail in riscv_of_parent_hartid()
 for disabled HARTs
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_050731_393541_2EC3460E 
X-CRM114-Status: GOOD (  16.03  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBPY3QgMjQsIDIwMjMgYXQgNToyNeKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+
IHdyaXRlczoKPgo+ID4gVGhlIHJpc2N2X29mX3Byb2Nlc3Nvcl9oYXJ0aWQoKSB1c2VkIGJ5IHJp
c2N2X29mX3BhcmVudF9oYXJ0aWQoKSBmYWlscwo+ID4gZm9yIEhBUlRzIGRpc2FibGVkIGluIHRo
ZSBEVC4gVGhpcyByZXN1bHRzIGluIHRoZSBmb2xsb3dpbmcgd2FybmluZwo+ID4gdGhyb3duIGJ5
IHRoZSBSSVNDLVYgSU5UQyBkcml2ZXIgZm9yIHRoZSBFLWNvcmUgb24gU2lGaXZlIGJvYXJkczoK
PiA+Cj4gPiBbICAgIDAuMDAwMDAwXSByaXNjdi1pbnRjOiB1bmFibGUgdG8gZmluZCBoYXJ0IGlk
IGZvciAvY3B1cy9jcHVAMC9pbnRlcnJ1cHQtY29udHJvbGxlcgo+ID4KPiA+IFRoZSByaXNjdl9v
Zl9wYXJlbnRfaGFydGlkKCkgaXMgb25seSBleHBlY3RlZCB0byByZWFkIHRoZSBoYXJ0aWQgZnJv
bQo+ID4gdGhlIERUIHNvIHdlIHNob3VsZCBkaXJlY3RseSBjYWxsIG9mX2dldF9jcHVfaHdpZCgp
IGluc3RlYWQgb2YgY2FsbGluZwo+ID4gcmlzY3Zfb2ZfcHJvY2Vzc29yX2hhcnRpZCgpLgo+ID4K
PiA+IEZpeGVzOiBhZDYzNWU3MjNlMTcgKCJyaXNjdjogY3B1OiBBZGQgNjRiaXQgaGFydGlkIHN1
cHBvcnQgb24gUlY2NCIpCj4KPiBQYXRjaCAxIGFuZCAzOiBUaGVzZSBmaXhlcyBhcmUgc3RhbmQg
YWxvbmUsIGFuZCBkb2Vzbid0IGhhdmUgdG8gYmUgcGFydAo+IG9mIHRoZSBzZXJpZXMuCj4KPiBX
b3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8gcHVsbCB0aGVzZSBvdXQgb2YgdGhlIGxvbmctZ29pbmcg
c2VyaWVzLCBhbmQKPiB0cnkgdG8gZ2V0IGluIHRoZSBmaXhlcyBBU0FQPwoKWWVzLCB0aGF0IGlz
IGNvcnJlY3QuIEluIGZhY3QsIFBBVENIMiBjYW4gYWxzbyBiZSB0YWtlbiBmb3IgTGludXgtNi43
LgoKSSBzdWdnZXN0IFBBVENIMSB0byBQQVRDSDMgKDMgcGF0Y2hlcykgYmUgdGFrZW4gZm9yIExp
bnV4LTYuNwpzaW5jZSB0aGUgbWVyZ2Ugd2luZG93IGlzIHByZXR0eSBjbG9zZS4KClJlZ2FyZHMs
CkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
