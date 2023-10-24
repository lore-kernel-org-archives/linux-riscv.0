Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE98FC07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 12:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J5tHIjI0aBFzKVJCVKlRcaKS9Acxz4DxmRR3sTCWVAg=; b=UFruACRWE1uKRT
	sIk2UC0lMhaZ6XrUeC/OfdrszFfjcIi/V+8MV6V+JdzkVBlNnOjXNCMeMneAlEnSGXxx75B5ZqeFt
	WPWktcnkJtO2msruTMMNlr7Q6hnV070Us2/UFLdqUnpUdePa4huxKacOszqKvrcHo3uymnPXYcrQB
	EjtApoHFX9ocDn/JKHK0Zv7ah+2j+k0GrPtjGMrradTqZIMM1wrsqOlmGhXYbpnZzLx4rNJZVRcmg
	9csvsq9MwDoMJEWd3LIB6SPf4NRfBhVNaXqdo0cVLmG/efWTepy6rfURbvCqiaP1tZNYD1fBM6MD0
	FGyQ2+Lp5Kfr74ohUalw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvGDG-009is1-17;
	Tue, 24 Oct 2023 12:08:46 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvGDD-009iqo-1s
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 12:08:44 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6b5cac99cfdso3610528b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 24 Oct 2023 05:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698149320; x=1698754120; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMK1b0C/L5gsGLFeXRamJpztKKQzm+CIlOPG1sOdW0o=;
        b=SREJ6zGPXwXmNeSxO4xDxe3BB2GZshOLDQKKriPgMD+ywYGM5IdwOYRuVzMeeg8iPi
         iv1e1Dgg/egEIdal5GkcTseMJkUt6KYklFMtDtogohgw95bSrPsme4yIoztNV8b0iLuN
         jNh1VCxLmjsXIRvpnCm1c4fITgNZrDyYFO+ndJtSeo/pYPa7EU8T1xjdKp19m7ntaOVG
         MITKbvFhQrWMG0t+iBWYC5RPOup7hUrPoVlmGpGeZjEEzM89vqsd3rvYcQU4B6J/7I9D
         IvT9Y+Fkyf82uMKjTeKJsRfrpRSDS2XP32lzWDl1iT5R+Kg0xwg7XwT+ofGTUwD3hRxj
         c7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698149320; x=1698754120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YMK1b0C/L5gsGLFeXRamJpztKKQzm+CIlOPG1sOdW0o=;
        b=YJwb9ANzQCR466m4LJDDpT/aNbk9YoCEoDeUc1QKS56X+rygA8/7N/C9Sz0vfTBDCT
         JQRfVxs3CuFD1g51fC+6aGTLFmO0gIsb2b36tVx694ncF3f2kD/jFP6GDFTjZFKrgulr
         o0AhD2qas0L2vOqhUEQY+SjIXrmimep1vS6uyXQituKT8GRELMsNk57P1ci4jTf35HcF
         UNSo431pgB7FwJXPdaccx8hbwAOL4ENL2sjlSpXaOoaXpEXoKIATpfBehCsP1gAIpcNk
         tGSetOoN3gT8zrLKeKToca0wgfeszOG//9IfSs8+c8SO2aZHE+bNYfuUets+v0fVz33+
         041A==
X-Gm-Message-State: AOJu0YyjXq0AXQznoeBo2Xp3JsY5skg2ZrQNYAsoENDevHaC9pEYBShh
	9bttuF56tw0Scy956/mWziiH9e4J86AaRDTZB9tOOg==
X-Google-Smtp-Source: AGHT+IFf5XQ1QrXyWpn6fYdMoI3iDWgIsJGguKE6SezMge8SlFoUeS1mh1uQTHY/nYilct4uGjuRE5tSWIeQFzBQE0E=
X-Received: by 2002:a05:6a00:194a:b0:690:bdda:7c35 with SMTP id
 s10-20020a056a00194a00b00690bdda7c35mr10133732pfk.1.1698149319657; Tue, 24
 Oct 2023 05:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231023172800.315343-1-apatel@ventanamicro.com>
 <20231023172800.315343-8-apatel@ventanamicro.com> <20231024-arbitrate-glitter-2053d17d7260@spud>
In-Reply-To: <20231024-arbitrate-glitter-2053d17d7260@spud>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 24 Oct 2023 17:38:28 +0530
Message-ID: <CAK9=C2UxD1uKCvg26xzevtm4MAeGix-qS9PM296uCg3NqSyTaA@mail.gmail.com>
Subject: Re: [PATCH v11 07/14] irqchip: Add RISC-V incoming MSI controller
 early driver
To: Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_050843_623428_C0982824 
X-CRM114-Status: GOOD (  13.14  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBPY3QgMjQsIDIwMjMgYXQgMjo1NeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIE9jdCAyMywgMjAyMyBhdCAxMDo1Nzo1M1BNICsw
NTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+Cj4gPiArI2lmZGVmIENPTkZJR19HRU5FUklDX0lSUV9E
RUJVR0ZTCj4gPiArdm9pZCBpbXNpY192ZWN0b3JfZGVidWdfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUg
Km0sCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgaW1zaWNfdmVjdG9yICp2
ZWMsIGludCBpbmQpCj4gPiArewo+ID4gKyAgICAgdW5zaWduZWQgaW50IG1jcHUgPSAwLCBtbG9j
YWxfaWQgPSAwOwo+ID4gKyAgICAgc3RydWN0IGltc2ljX2xvY2FsX3ByaXYgKmxwcml2Owo+ID4g
KyAgICAgYm9vbCBtb3ZlX2luX3Byb2dyZXNzID0gZmFsc2U7Cj4gPiArICAgICBzdHJ1Y3QgaW1z
aWNfdmVjdG9yICptdmVjOwo+ID4gKyAgICAgYm9vbCBpc19lbmFibGVkID0gZmFsc2U7Cj4gPiAr
ICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+ID4gKwo+ID4gKyAgICAgbHByaXYgPSBwZXJfY3B1
X3B0cihpbXNpYy0+bHByaXYsIHZlYy0+Y3B1KTsKPiA+ICsgICAgIGlmIChXQVJOX09OKCZscHJp
di0+dmVjdG9yc1t2ZWMtPmxvY2FsX2lkXSAhPSB2ZWMpKQo+ID4gKyAgICAgICAgICAgICByZXR1
cm47Cj4gPiArCj4gPiArICAgICByYXdfc3Bpbl9sb2NrX2lycXNhdmUoJmxwcml2LT5pZHNfbG9j
aywgZmxhZ3MpOwo+ID4gKyAgICAgaWYgKHRlc3RfYml0KHZlYy0+bG9jYWxfaWQsIGxwcml2LT5p
ZHNfZW5hYmxlZF9iaXRtYXApKQo+ID4gKyAgICAgICAgICAgICBpc19lbmFibGVkID0gdHJ1ZTsK
PiA+ICsgICAgIG12ZWMgPSBscHJpdi0+aWRzX21vdmVbdmVjLT5sb2NhbF9pZF07Cj4gPiArICAg
ICBpZiAobXZlYykgewo+ID4gKyAgICAgICAgICAgICBtb3ZlX2luX3Byb2dyZXNzID0gdHJ1ZTsK
PiA+ICsgICAgICAgICAgICAgbWNwdSA9IG12ZWMtPmNwdTsKPiA+ICsgICAgICAgICAgICAgbWxv
Y2FsX2lkID0gbXZlYy0+bG9jYWxfaWQ7Cj4gPiArICAgICB9Cj4gPiArICAgICByYXdfc3Bpbl91
bmxvY2tfaXJxcmVzdG9yZSgmbHByaXYtPmlkc19sb2NrLCBmbGFncyk7Cj4gPiArCj4gPiArICAg
ICBzZXFfcHJpbnRmKG0sICIlKnN0YXJnZXRfY3B1ICAgICAgOiAlNXVcbiIsIGluZCwgIiIsIHZl
Yy0+Y3B1KTsKPiA+ICsgICAgIHNlcV9wcmludGYobSwgIiUqc3RhcmdldF9sb2NhbF9pZCA6ICU1
dVxuIiwgaW5kLCAiIiwgdmVjLT5sb2NhbF9pZCk7Cj4gPiArICAgICBzZXFfcHJpbnRmKG0sICIl
KnNpc19yZXNlcnZlZCAgICAgOiAlNXVcbiIsIGluZCwgIiIsCj4gPiArICAgICAgICAgICAgICAg
ICh2ZWMtPmxvY2FsX2lkIDw9IElNU0lDX0lQSV9JRCkgPyAxIDogMCk7Cj4KPiA+ICsgICAgIHNl
cV9wcmludGYobSwgIiUqc2lzX2VuYWJsZWQgICAgICA6ICU1dVxuIiwgaW5kLCAiIiwKPiA+ICsg
ICAgICAgICAgICAgICAgKG1vdmVfaW5fcHJvZ3Jlc3MpID8gMSA6IDApOwo+Cj4gZ2NjICYgY2xh
bmcgcmVwb3J0Ogo+IGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuYzoyODg6
MTQ6IHdhcm5pbmc6IHZhcmlhYmxlICdpc19lbmFibGVkJyBzZXQgYnV0IG5vdCB1c2VkIFstV3Vu
dXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+Cj4gVGhpcyBsb29rcyB0byBiZSBhIGNvcHktcGFzdGEg
aXNzdWUsIGFuZCB0aGUgbW92ZV9pbl9wcm9ncmVzcyBoZXJlCj4gc2hvdWxkIGJlIGlzX2VuYWJs
ZWQ/CgpUaGFua3MgZm9yIGNhdGNoaW5nLiBTdHJhbmdlbHksICBJIGRpZCBub3Qgc2VlIHRoaXMg
d2FybmluZyB3aXRoCnRoZSB0b29sY2hhaW4gd2hpY2ggSSB1c2UuCgpJIHdpbGwgZml4IGl0IGlu
IHRoZSBuZXh0IHBhdGNoIHJldmlzaW9uLgoKUmVnYXJkcywKQW51cAoKPgo+ID4gKyAgICAgc2Vx
X3ByaW50ZihtLCAiJSpzaXNfbW92ZV9wZW5kaW5nIDogJTV1XG4iLCBpbmQsICIiLAo+ID4gKyAg
ICAgICAgICAgICAgICAobW92ZV9pbl9wcm9ncmVzcykgPyAxIDogMCk7Cj4gPiArICAgICBpZiAo
bW92ZV9pbl9wcm9ncmVzcykgewo+ID4gKyAgICAgICAgICAgICBzZXFfcHJpbnRmKG0sICIlKnNt
b3ZlX2NwdSAgICAgICAgOiAlNXVcbiIsIGluZCwgIiIsIG1jcHUpOwo+ID4gKyAgICAgICAgICAg
ICBzZXFfcHJpbnRmKG0sICIlKnNtb3ZlX2xvY2FsX2lkICAgOiAlNXVcbiIsIGluZCwgIiIsIG1s
b2NhbF9pZCk7Cj4gPiArICAgICB9Cj4gPiArfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
