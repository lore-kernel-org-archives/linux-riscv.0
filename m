Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B47C27C79
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 03:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/QWz5611Yl138+OV+zDct7AVzaeq/AK6SC15RN+yic8=; b=dSdSXU4gJWBtcV
	p7KIfwApqfeUdoWcP4Pl+i9uOibBQwYQB1jbV42k/klQfo4lmwszn8OoP0CicwmaAA94QUHiSUtgg
	i6MrVRXZVJNvJMrrNe+/Y2WlSbkMWcjB65XeAg696DdUsiplEsN/SjnXy7JPQk96nQtDFYnnEeHYK
	1Ma8E1cp1b/G2xqv8ufpRzokdMFkwZ5HcRZTBgOk66xi6uqAJuy1S7Dlp3fsQQHwHJj+l/1sfqrLD
	r6J4+mJJ1xPGSCotwmmIurP6a2aaPTAPAhte02xPb1d/oPXy6wWT6b8Rsuj/sTucOiQKzgUVr+HeJ
	tOKxPWHUd5Zaxsi36c0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK8oO-00000003VXg-25H9;
	Thu, 20 Jun 2024 03:50:12 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK8oK-00000003VWc-2stP
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jun 2024 03:50:10 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-37602516d64so503105ab.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 20:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1718855407; x=1719460207; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hZE/Tf0Mi1j/+dmuzm/OBES5k0vYl42V/5iV4/vGMw=;
        b=Orx9GWjgE9RwzFm1Ec0N7zN3Bc2J/cHxg8B3LkmY/JjGugGiodFdCF+0PIjBWTGBXS
         BbaZxDI5Q0RHJ8f8B0bwEo92WuIICv4FQp7uDbFIlij8Zul4L/ee7cDXIm/lW2Tu0xxH
         7pf6YvpDoXO9oNvGuZw7jgHZ9UJpcQh4opKVwbJl5BYqNO5nHlWpNd3NN6/h51DQq7JF
         vaitlw9tHbfu1jOWHCw/7QrWtBIEFU7MEiu6N53f/E16VImpNl3UZJtT0Xvp8raqGYPc
         JnWvOrVm2lbJtBsxv+zdmdjuJQiQCd0LsOIlY5KluzdXxH9A3/8dR9pSo4yqB+PzuM1p
         iluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718855407; x=1719460207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4hZE/Tf0Mi1j/+dmuzm/OBES5k0vYl42V/5iV4/vGMw=;
        b=M86yCOM3iziBFpn32aBARmYtKh7+1beTGwfBPSceW2lcFKXpI2ItbmD9SrZh3dkokz
         TuZGr/uD/wT2g6pumwP2b/7NajEI80IGGS8XYy3PXu56WQSyhcLM9LEI7S7gX6+/lk/A
         AQyOMOT7nzwIa9YyEn0TW/xQwLvnmp97QzhxT9wtDPE48DTHCCA/Af7h1rEOJ1m7RHFV
         rNZXUVDtLaIYJYwiJkT4gmCnCpd2nlay3Mm7vIixrXfM3IbKQMIVl+hmEQvmyCTmdzTD
         nZQ+NqXlNDENBCXlDt8AYv7is+LBasej8hblc8ZRAQJ6xJ3MjoZxO0zQ8SgFKKfSul+k
         WYqA==
X-Forwarded-Encrypted: i=1; AJvYcCW032yLMIXdHz5od7vJAp92tf8q90sYkcb5/dEl5LgEmrkGACv+dhPQmfrO+YIkl25d570oQnM0nFb0s/YRl3asd5xJGMAGqsPwyOdc3sDC
X-Gm-Message-State: AOJu0YyU8l7O99JjvuQIOP4VbsLbkCiXfIsj9/X5tS+ZT+ceMWgUIdIl
	7olWFGCzuzicveFY7H7P0S1X62ZrLp12xLN8thvmW1RSKANsW+KKyWfHpVT4TM1TTGEr/jrIUxx
	SEvLld8iznSsluU2ad8eYHEv+Z1GERPIhn8gcrA==
X-Google-Smtp-Source: AGHT+IGhhLlYZ82l6gl3X+EsNLlepkGD/eRveXzBhTVRmQD8rg+O0oCrJyGSf1cCkIdlCknUK5+bVyVkBaulCaQoMcM=
X-Received: by 2002:a05:6e02:1545:b0:376:148f:d6c6 with SMTP id
 e9e14a558f8ab-3761d70d4b9mr43611515ab.24.1718855407480; Wed, 19 Jun 2024
 20:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
 <20240222094006.1030709-2-apatel@ventanamicro.com> <CAJM55Z9hGKo4784N3s3DhWw=nMRKZKcmvZ58x7uVBghExhoc9A@mail.gmail.com>
 <CAK9=C2WP2+gKScUFuoE9782gjSfnDtcLAw01eCwram3LMAStBg@mail.gmail.com> <CAJM55Z8ti-ePT0t714h1Za9X3Ns3=Fw0pCu3NZ=7eT76JU_p5g@mail.gmail.com>
In-Reply-To: <CAJM55Z8ti-ePT0t714h1Za9X3Ns3=Fw0pCu3NZ=7eT76JU_p5g@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 20 Jun 2024 09:19:56 +0530
Message-ID: <CAAhSdy1pesbdTfWnFURMJRcy2ujjX+cXtt-cfLDj2CQf2Ua_gw@mail.gmail.com>
Subject: Re: [PATCH v14 01/18] irqchip/sifive-plic: Convert PLIC driver into a
 platform driver
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_205009_021121_B0AFD10E 
X-CRM114-Status: GOOD (  26.71  )
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

T24gV2VkLCBKdW4gMTksIDIwMjQgYXQgMTE6MTbigK9QTSBFbWlsIFJlbm5lciBCZXJ0aGluZwo8
ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4KPiBBbnVwIFBhdGVs
IHdyb3RlOgo+ID4gT24gVHVlLCBKdW4gMTgsIDIwMjQgYXQgNzowMOKAr1BNIEVtaWwgUmVubmVy
IEJlcnRoaW5nCj4gPiA8ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbT4gd3JvdGU6
Cj4gPiA+Cj4gPiA+IEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiA+ID4gVGhlIFBMSUMgZHJpdmVyIGRv
ZXMgbm90IHJlcXVpcmUgdmVyeSBlYXJseSBpbml0aWFsaXphdGlvbiBzbyBjb252ZXJ0Cj4gPiA+
ID4gaXQgaW50byBhIHBsYXRmb3JtIGRyaXZlci4KPiA+ID4gPgo+ID4gPiA+IEFmdGVyIGNvbnZl
cnNpb24sIHRoZSBQTElDIGRyaXZlciBpcyBwcm9iZWQgYWZ0ZXIgQ1BVcyBhcmUgYnJvdWdodC11
cAo+ID4gPiA+IHNvIHNldHVwIGNwdWhwIHN0YXRlIGFmdGVyIGNvbnRleHQgaGFuZGxlciBvZiBh
bGwgb25saW5lIENQVXMgYXJlCj4gPiA+ID4gaW5pdGlhbGl6ZWQgb3RoZXJ3aXNlIFBMSUMgZHJp
dmVyIGNyYXNoZXMgZm9yIHBsYXRmb3JtcyB3aXRoIG11bHRpcGxlCj4gPiA+ID4gUExJQyBpbnN0
YW5jZXMuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxA
dmVudGFuYW1pY3JvLmNvbT4KPiA+ID4KPiA+ID4gSGkgQW51cCwKPiA+ID4KPiA+ID4gU29ycnkg
Zm9yIHRoZSBsYXRlIHJlcGx5IHRvIHRoZSBtYWlsaW5nIGxpc3QsIGJ1dCBldmVyIHNpbmNlIDYu
OSB3aGVyZSB0aGlzIHdhcwo+ID4gPiBhcHBsaWVkIG15IEFsbHdpbm5lciBEMSBiYXNlZCBib2Fy
ZHMgbm8gbG9uZ2VyIGJvb3QuIFRoaXMgaXMgdGhlIGxvZyBvZiBteQo+ID4gPiBMaWNoZWVSViBE
b2NrIGJvb3RpbmcgcGxhaW4gNi4xMC1yYzQsIGxvY2tpbmcgdXAgYW5kIHRoZW4gcmVib290aW5n
IGR1ZSB0byB0aGUKPiA+ID4gdGhlIHdhdGNoZG9nIHRpbWluZyBvdXQ6Cj4gPiA+Cj4gPiA+IGh0
dHBzOi8vcGFzdGViaW4uY29tL3Jhdy9uc2J6Z0VLVwo+ID4gPgo+ID4gPiBPbiA2LjEwLXJjNCBJ
IGNhbiBicmluZyB0aGUgc2FtZSBib2FyZCB0byBib290IGJ5IHJldmVydGluZyB0aGlzIHBhdGNo
IGFuZCBhbGwKPiA+ID4gcGF0Y2hlcyBidWlsZGluZyBvbiBpdC4gRWcuOgo+ID4gPgo+ID4gPiAg
IGdpdCByZXZlcnQgZTMwNmE4OTRiZDUxIGE3ZmI2OWZmZDdjZSBhYmI3MjA1Nzk0OTAgXAo+ID4g
PiAgICAgICAgICAgICAgOTU2NTIxMDY0NzgwIGExNTU4NzI3N2EyNCA2YzcyNWYzM2Q2N2IgXAo+
ID4gPiAgICAgICAgICAgICAgYjY4ZDBmZjUyOWE5IDI1ZDg2MmUxODNkNCA4ZWM5OWIwMzMxNDcK
PiA+Cj4gPiBEb2VzIHlvdXIgYm9hcmQgYm9vdCB3aXRoIG9ubHkgU0JJIHRpbWVyIGRyaXZlciBl
bmFibGVkID8KPgo+IEknbSBub3QgMTAwJSBzdXJlIHRoaXMgaXMgd2hhdCB5b3UgbWVhbiwgYnV0
IHdpdGggdGhpcyBjaGFuZ2UgSSBjYW4gZGlzYWJsZQo+IENPTkZJR19TVU40SV9USU1FUjoKPgo+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcuc29jcyBiL2FyY2gvcmlzY3YvS2NvbmZp
Zy5zb2NzCj4gaW5kZXggZjUxYmIyNGJjODRjLi4wMTQzNTQ1MzQ4ZWIgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9LY29uZmlnLnNvY3MKPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcuc29jcwo+
IEBAIC0zOSw3ICszOSw2IEBAIGNvbmZpZyBBUkNIX1NVTlhJCj4gICAgICAgICBib29sICJBbGx3
aW5uZXIgc3VuMjBpIFNvQ3MiCj4gICAgICAgICBkZXBlbmRzIG9uIE1NVSAmJiAhWElQX0tFUk5F
TAo+ICAgICAgICAgc2VsZWN0IEVSUkFUQV9USEVBRAo+IC0gICAgICAgc2VsZWN0IFNVTjRJX1RJ
TUVSCj4gICAgICAgICBoZWxwCj4gICAgICAgICAgIFRoaXMgZW5hYmxlcyBzdXBwb3J0IGZvciBB
bGx3aW5uZXIgc3VuMjBpIHBsYXRmb3JtIGhhcmR3YXJlLAo+ICAgICAgICAgICBpbmNsdWRpbmcg
Ym9hcmRzIGJhc2VkIG9uIHRoZSBEMSBhbmQgRDFzIFNvQ3MuCj4KPgo+IEJ1dCB1bmZvcnR1bmF0
ZWx5IHRoZSBib2FyZCBzdGlsbCBkb2Vzbid0IGJvb3Q6Cj4gaHR0cHM6Ly9wYXN0ZWJpbi5jb20v
cmF3L0F3UnhjZmV1CgpJIHRoaW5rIHdlIHNob3VsZCBlbmFibGUgZGVidWcgcHJpbnRzIGluIERE
IGNvcmUgYW5kIHNlZQp3aGljaCBkZXZpY2UgaXMgbm90IGdldHRpbmcgcHJvYmVkIGR1ZSB0byBs
YWNrIG9mIGEgcHJvdmlkZXIuCgpKdXN0IGFkZCAiI2RlZmluZSBERUJVRyIgYXQgdGhlIHRvcCBp
biBkcml2ZXJzL2Jhc2UvY29yZS5jCmFuZCBib290IGFnYWluIHdpdGggImxvZ2xldmVsPTgiIGtl
cm5lbCBwYXJhbWV0ZXIgKGFsb25nIHdpdGgKdGhlIGFib3ZlIGNoYW5nZSkuCgpSZWdhcmRzLApB
bnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
