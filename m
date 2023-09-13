Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FA3CA5537
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 10:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hRtd9/y99yFveAMRLh4Dw3ltq05Nj9NXs1HAthKlZHE=; b=QOC3w/YIq47SYj
	0kE66FGS59iBovl/M5icv6Ut4wBPbYnHti3Z38iS+qn5XHopItRyZOWB76m3W5bi2EUgqCEsl5rSK
	iTWSEbtWBapIUPoKgws3CKXRVE87QVLDRX+ErG1Ohx6g2LlukCyVmbpwK6JsnwQFF6R6zehoQFPqJ
	aRSe7D3R34+y9TMDIk3ScU0DfgeIW7Q/Ki0Q8KRuGdYZVE8/F1P9F9/R9Hsx9o0XnRDfNYhEnQLO6
	WclAmaefRI6iBTrN2AaHVezLhxYAXzxj68kn+ZDtVftrFY6qOhl8U+A0UfWjAvfBKOxSBQMt03E6h
	GY/tzA21KKuBWGX3K9WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgNZy-005gNZ-1t;
	Wed, 13 Sep 2023 10:58:42 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgNZv-005gMR-2f
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 10:58:41 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-26d5970cd28so5314174a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 03:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694602718; x=1695207518; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slAYSc7DXITgYyvEajQT1IvP1sCKjir5q1RLHoLv0QE=;
        b=b7oDlck+D8MGW+seKAW/zwCJr9/sXVMZDQjdbz0qpHZ7zx/ZrizomQtbEuiQw8ICJ8
         TH4t0L1svL6oB0a33hNeREtYTJM7VnALNG6P1qCijEatMDNsJ08nY9VdCDRGBYU9LXlq
         wFyJXLJMuDYNTIKtV1s2ac0ZTRWzBmIk8bxV8BvfyiiGu408YsTwKptpQDfMCfPqVZld
         ONqqXPPeQwp5af6saIgnjCsQs/iISAyCzaqyTjLBsJa9OSgmFopdFBjTet7a6jDmercD
         PbaDH3ApgLKycOKtBRG/ou57NhzpTgjRmy+XSl3Ouh9QY4PPIEbY30fh4By0Ng+UNS83
         5aUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694602718; x=1695207518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=slAYSc7DXITgYyvEajQT1IvP1sCKjir5q1RLHoLv0QE=;
        b=DzD1X0qG8jZtNpVJuMcZS6kNpkIGxnIjAxDBHd5BAM3+2UUUH0uaYfNKg+h620q7pN
         RTBrxwnRe56vjo4qV+2k8VufchjdA8FlxszTwuN/46LynIon5xql4dq7GbCWzsYiHMjg
         UYqwbgRSsJ525bwPMQvmAykGF08pUhpYeHIGmjd5HZ/tRiuyhme7R9BiG9PuNEmi16Gl
         IhO0zF9CNd8gVvhZ0RludtNp7u1xHHcjDfWyXV5ZbDerq8MSufTtREtLEuNZ7SeAqmPl
         rT1PRIcGMtARQJ3XtgLiP3X3WKGPSiAqMk3nGffUzCnFCHHCan/KWe/fJeWuolgYyRmI
         sv0Q==
X-Gm-Message-State: AOJu0YxIfJjKuSa+zq+ofx14Bs2iCnagGpYjIJQFB09QnVYF7rUzTFHU
	nKbyWiEsc8HOtHyichL51Fml43j9zqHD2QBr6mns0A==
X-Google-Smtp-Source: AGHT+IHhp8xAYoISqZ8W0p9FXmeWV3zP/Z5Om6OyMdci0swqhikS+acjYkCBKmSioXQ31oB/6sDWnxOU/OnMAcLT9Wg=
X-Received: by 2002:a17:90b:1892:b0:273:f017:cac0 with SMTP id
 mn18-20020a17090b189200b00273f017cac0mr1714830pjb.39.1694602718311; Wed, 13
 Sep 2023 03:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230912174928.528414-1-apatel@ventanamicro.com>
 <20230912174928.528414-4-apatel@ventanamicro.com> <CAGETcx8vXifmS2U5PTtmBySA=dih3GUOQ93A_qA5nm3faQqcGg@mail.gmail.com>
In-Reply-To: <CAGETcx8vXifmS2U5PTtmBySA=dih3GUOQ93A_qA5nm3faQqcGg@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 13 Sep 2023 16:28:25 +0530
Message-ID: <CAK9=C2Wj0=2NNaXLBbNOcmHaJfV4DpAXqSayQtqF0eHsbki3_A@mail.gmail.com>
Subject: Re: [PATCH v8 03/16] of: property: Add fw_devlink support for msi-parent
To: Saravana Kannan <saravanak@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_035839_904721_0845C7A1 
X-CRM114-Status: GOOD (  18.38  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBTZXAgMTMsIDIwMjMgYXQgNDozMOKAr0FNIFNhcmF2YW5hIEthbm5hbiA8c2FyYXZh
bmFrQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBTZXAgMTIsIDIwMjMgYXQgMTA6NTDi
gK9BTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4g
VGhpcyBhbGxvd3MgZndfZGV2bGluayB0byBjcmVhdGUgZGV2aWNlIGxpbmtzIGJldHdlZW4gY29u
c3VtZXJzIG9mCj4gPiBhIE1TSSBhbmQgdGhlIHN1cHBsaWVyIG9mIHRoZSBNU0kuCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiAt
LS0KPiA+ICBkcml2ZXJzL29mL3Byb3BlcnR5LmMgfCAyICsrCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL29mL3Byb3BlcnR5
LmMgYi9kcml2ZXJzL29mL3Byb3BlcnR5LmMKPiA+IGluZGV4IGNmOGRhY2YzZTNiOC4uNzU4ZWE4
MjJlNDZkIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9vZi9wcm9wZXJ0eS5jCj4gPiArKysgYi9k
cml2ZXJzL29mL3Byb3BlcnR5LmMKPiA+IEBAIC0xMjY3LDYgKzEyNjcsNyBAQCBERUZJTkVfU0lN
UExFX1BST1AocmVzZXRzLCAicmVzZXRzIiwgIiNyZXNldC1jZWxscyIpCj4gPiAgREVGSU5FX1NJ
TVBMRV9QUk9QKGxlZHMsICJsZWRzIiwgTlVMTCkKPiA+ICBERUZJTkVfU0lNUExFX1BST1AoYmFj
a2xpZ2h0LCAiYmFja2xpZ2h0IiwgTlVMTCkKPiA+ICBERUZJTkVfU0lNUExFX1BST1AocGFuZWws
ICJwYW5lbCIsIE5VTEwpCj4gPiArREVGSU5FX1NJTVBMRV9QUk9QKG1zaV9wYXJlbnQsICJtc2kt
cGFyZW50IiwgIiNtc2ktY2VsbHMiKQo+ID4gIERFRklORV9TVUZGSVhfUFJPUChyZWd1bGF0b3Jz
LCAiLXN1cHBseSIsIE5VTEwpCj4gPiAgREVGSU5FX1NVRkZJWF9QUk9QKGdwaW8sICItZ3BpbyIs
ICIjZ3Bpby1jZWxscyIpCj4gPgo+ID4gQEAgLTEzNjEsNiArMTM2Miw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgc3VwcGxpZXJfYmluZGluZ3Mgb2Zfc3VwcGxpZXJfYmluZGluZ3NbXSA9IHsKPiA+
ICAgICAgICAgeyAucGFyc2VfcHJvcCA9IHBhcnNlX3JlZ3VsYXRvcnMsIH0sCj4gPiAgICAgICAg
IHsgLnBhcnNlX3Byb3AgPSBwYXJzZV9ncGlvLCB9LAo+ID4gICAgICAgICB7IC5wYXJzZV9wcm9w
ID0gcGFyc2VfZ3Bpb3MsIH0sCj4gPiArICAgICAgIHsgLnBhcnNlX3Byb3AgPSBwYXJzZV9tc2lf
cGFyZW50LCB9LAo+Cj4gUGxlYXNlIGZvbGxvdyB0aGUgc2FtZSBvcmRlcmluZyBoZXJlIGFzIHRo
ZSBERUZJTkVfU0lNUExFX1BST1AgbWFjcm9zLgo+IFNvLCB0aGlzIHNob3VsZCBjb21lIGFmdGVy
IHRoZSBwYW5lbCBvbmUuCj4KCk9rYXksIEkgd2lsbCB1cGRhdGUgaW4gdGhlIG5leHQgcmV2aXNp
b24uCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
