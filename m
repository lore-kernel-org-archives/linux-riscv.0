Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDAFD609D5
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Dec 2025 01:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/1+ELJY8LtQ0BfRF03Rous/1AIw6BSts0l1JbW0Ihg0=; b=svJELZub+QrRyM
	NV3jhkz5xeX5IlfrXZ61+ACV8cS2ZZsjdt4DLKt+PVw6U3bffluZsRWsnGaPAwTIA8hK5WCrLVtAp
	Q/KCsSxwD4YgiubSKZFlzE3v7NHYumivWPulns+NC1hnlEvX4cwROj59X2+0kKD/bwWcl3cq8ApLh
	5qe5I5kLpqBBU754qM9gG9AuSrHNm20yUmYDdz/Mvod8GfE5u4vIMx2uL+Zk1P0wweh7swG1+Eter
	4+xPf83JndAX0xfWhhnnpaZpmlrsvrDTQzubluX4OdycDO7558Dy+iZbtVzp465ecYzih9rF5GZHD
	ngUytxqrw2Qp1c1GpGYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVgke-0000000627S-3Ltp;
	Wed, 17 Dec 2025 01:54:52 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVgkb-00000006277-39dE
	for linux-riscv@lists.infradead.org;
	Wed, 17 Dec 2025 01:54:51 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-78c33d0df85so73100387b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 17:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765936488; x=1766541288; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sd7QPHCVU5Iv6Zimvwat/hwwusR53tKu2g3puM08IT8=;
        b=ZkpZQD5nnc9k6uTambxp0clv8mUKjggXoKaco2qQ444VmjcKyMCTJPtbnzmzfE4nCf
         vwR7W0/p7xKEWmyHgyAGMmZ9orO1FfkoENTQ/5rZwGL3mWR6teX4m3tbxE8lYWlqHNRb
         kHpl1Cu6h7oMP/FV1wO2EQaqceAmLzVQy0qEqFoBUnuTmczXcxLNDodgNSRCQap4s7ay
         hnnqb2nfOQbtB8nXzmpL8WVPzy7v4u5flUMHJk+W7oC+Jp3NZqNTZUzJ9TAstOCMv86B
         jKJKSkozNJcTNTXL0F+tXulwWEKsxqjgEhUxy800AvQ6GfLNeNl2fbMNut5hpmIfczxq
         jOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765936488; x=1766541288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sd7QPHCVU5Iv6Zimvwat/hwwusR53tKu2g3puM08IT8=;
        b=A2HWiIEZhtnIiBKPjxuKK//2g/BU+SK1DWVE96PxZcmkQkAIrvY+88a65R6vhsxQYr
         r9Gy9Xr/1NSHGzzQseMSck8TozlCfVdQGvJVqqrttQhGiCJ1uoqKHY+WGQ+OpUACdChV
         1f+j4S0o/IPrUv0c3S6TM9RxEMJhRKH9hPqSeliEqAK9o/80l8A80SAudF5HlHVxjPht
         bhHE+nchPo+Y75hhaABY33AHgO6SHY/xAUiCoIwjxr7bGdqxAMmaHZ7Uv+9niADpa6JZ
         0BvIXSw7Ro2GHI1QWLQHQNRCL9jcjeySXZB7Ah4thZC+qnorRRlsYn2DCy3/FhgEkVVU
         MGmA==
X-Forwarded-Encrypted: i=1; AJvYcCVVNPkVe0Xarnu8KJ5T9NDrIWLunF78Tm1rpGE6eEbuOkwrvmxlVJy1Z85/0TmzE9eGTW2lN8SEf+yVSg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/iMKpKc5Reg79xzvwplThrwyvnnBrfth+7D81XUzS9jIvOg8U
	SX/1fv9wd6gK82kk/rbwZa3nLUj0EqRDw8aNhAn05HLpmwwZTrpUbauDzbpVfQzsmF+ESUizj2O
	0agJGEA1+5Jf1A6oXG44Pg3aqlvpBkSAhC7sX27KLdg==
X-Gm-Gg: AY/fxX46VDMEGWmFOaYbbNuSPvvQ5xiV1Z5DUW0ZQL6wTN6LnRFgEX3xNoSzeVPJorS
	/1gzua1OXdhnUiNy6ywASNIc0S2vOlVDUAwqInUBfWkBxnqCMFoqkNic/ZaRYSO9QyYJXplfSTd
	UIbsZ+WjMTBRA9J6LHQ10MQm56VAE5+w52QTI/chepk8T6L5F57wrpaYX4ItLrWcNFwTQH508Gq
	2SZAgv1AmySqqF+GTtZxEQ+A7xqgIytRGLd5/gge4YjPdoZHuBeK3V1ZOWzah7BH1/2Z1z2CqfT
	Ng45ADZqjxClkpszzSfsyeGbBdeG3duwuQLIfJFc4VKa
X-Google-Smtp-Source: AGHT+IG7RmyYUv9Cs29kj2dxdrYXc3URbz5VHNb0PZI6tD2ZWGH5YXEmhQNocOw3g5bSfsZIoCB4/P4XTUm2cXg3BYw=
X-Received: by 2002:a05:690c:9a0e:b0:781:64f:2b63 with SMTP id
 00721157ae682-78e66ea4ad5mr150059267b3.63.1765936488525; Tue, 16 Dec 2025
 17:54:48 -0800 (PST)
MIME-Version: 1.0
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-1-a0d256c9dc92@riscstar.com> <e596f624-b4da-4c93-910c-b3c35917eb9c@kernel.org>
In-Reply-To: <e596f624-b4da-4c93-910c-b3c35917eb9c@kernel.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 17 Dec 2025 09:54:37 +0800
X-Gm-Features: AQt7F2o5HH0qUzMTVYR3bdSsKGKqc250kEEJ9XB0OvFRDAn2rOZynYGpODwCBsI
Message-ID: <CAH1PCMaKpeATkt-ygN00tYGc1_-DVzBgp2QdfRfmUJC4+RrhoA@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: riscv: add SpacemiT X100 CPU compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <xypron.glpk@gmx.de>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-serial@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_175449_821320_FFAB491E 
X-CRM114-Status: GOOD (  12.40  )
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

T24gVHVlLCBEZWMgMTYsIDIwMjUgYXQgMTE6MzPigK9QTSBLcnp5c3p0b2YgS296bG93c2tpIDxr
cnprQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gMTYvMTIvMjAyNSAxNDozMiwgR3VvZG9uZyBY
dSB3cm90ZToKPiA+IEFkZCBjb21wYXRpYmxlIHN0cmluZyBmb3IgdGhlIFNwYWNlbWlUIFgxMDAg
KFJWQTIzIGNvbXBsaWFudCkgY29yZS4KPiA+Cj4gPiBMaW5rOiBodHRwczovL3d3dy5zcGFjZW1p
dC5jb20vZW4vc3BhY2VtaXQteDEwMC1jb3JlLwo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1b2Rv
bmcgWHUgPGd1b2RvbmdAcmlzY3N0YXIuY29tPgo+ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbCB8IDEgKwo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbAo+ID4gaW5kZXggZDczM2MwYmQ1MzRmYjYzZWQ3
YzBlYWRhOTdjNDI4MzI0MzFmMWZjMS4uY2NlODcwOTJkYzc3NDlmNDkwNjYxNTRkOWEyNTZhZjZj
N2I2YzE5ZiAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9yaXNjdi9jcHVzLnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9yaXNjdi9jcHVzLnlhbWwKPiA+IEBAIC02Miw2ICs2Miw3IEBAIHByb3BlcnRpZXM6Cj4g
PiAgICAgICAgICAgICAgICAtIHNpZml2ZSx1NzQKPiA+ICAgICAgICAgICAgICAgIC0gc2lmaXZl
LHU3NC1tYwo+ID4gICAgICAgICAgICAgICAgLSBzcGFjZW1pdCx4NjAKPiA+ICsgICAgICAgICAg
ICAgIC0gc3BhY2VtaXQseDEwMAo+Cj4KPiBUd28gcmV2aWV3cyBvZiB0aGlzIG9uZS1saW5lciBi
dXQgbm8gb25lIHBvaW50ZWQgb3V0IHRoYXQgc29ydGluZyBpcwo+IGJyb2tlbi4uLiBXaGF0IGlz
IGJlaW5nIGV4YWN0bHkgcmV2aWV3ZWQgaW4gdGhpcyBvbmUtbGluZXI/CgpUaGFua3MgS3J6eXN6
dG9mLiBJIHdpbGwgZml4IHRoYXQsIHB1dCB4MTAwIGJlZm9yZSB4NjAuCgpCUiwKR3VvZG9uZwoK
Pgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
