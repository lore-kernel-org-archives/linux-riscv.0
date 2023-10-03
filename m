Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C07E75454
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 12:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SHOVfMZb91wNusjwiH3VXXyt7kg/uV+bfgpsWvmlqbs=; b=kPegyst7elPSsJ
	0/sZwMotF0b3zBU0e4f1khZjGSRscoe0zfIAlmZZFB4zI1rP6k1CF44gxEe/qlTm2nWqb4hYUx+LO
	3uKuQ1HfoeEb8O0teT+PiAdsM71H9zIVlFEEaxf3uiESihhUhgDAnxh+Oz17gvknXXvepRBsbAPW1
	YzZaH/S2ljbZ8YZpWo7gDOJkEGCmGtJcHPyANx10l3l62oLZuzheFUPiDMXa/jIvzASdnFKdDfniM
	Wv2WD5GNZ0y5WAL1+sJa+vMUnxW1yJFsqMTNORlAlobXSdEZwP+SCfhPVV/SagYxH3WI3Y4uaGPPp
	IJaNAYNaIBFrUB3FVecg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qneKD-00EbII-2A;
	Tue, 03 Oct 2023 12:16:29 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qneKA-00EbHd-2w
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 12:16:28 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-7a8b5ec9a6fso372122241.2
        for <linux-riscv@lists.infradead.org>; Tue, 03 Oct 2023 05:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696335385; x=1696940185; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aJXJTRX+A49HmWEadFvnUyvtH0TUvh0ZRZBc7dCwk8=;
        b=T6PqbPPya+YgzfqhWGUFImnGv7q64j4yyO7yzOdq8I3wVWv/ZJoeRQcx8SksgRfBY3
         x80ngi5NS0PUnf3PKfo0d/RSd34VRiVHPFnbJG68iMjSba3QIAil9sAC5DqnOv9LIdTw
         6Werg/Kc6VuMxAwzBVdPnL/oRqrXGcvmwFcYpi6PmpXV6qbUfdPMaV01gqoKtJ9G/+GJ
         q2czU0fxstCIRoXE02TK+jUFIWGapA+DxElInht2ai945vYFgwb5UjFmUEszqDBFwzR2
         nrzXAgOsrwJxTnUP40V4Rn8/dpDAqIbHtzj3PrjeBlClwIsZQC/yICuGFTYSw0noYwck
         LaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696335385; x=1696940185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2aJXJTRX+A49HmWEadFvnUyvtH0TUvh0ZRZBc7dCwk8=;
        b=rI18pK2fsYnsuzO8ONZPD5d6l/+80zWceSOiV6F7t1xFrgiKLxTTMOWpCI+uuJhdKx
         HgjsQIC1WwkCrJtHAmbDXLopOOgotAxu9rj0nU59w23mB0daIBeXldopa+H8DrTL8UMZ
         ljD+ThQKfSlacp0CGvn8ic1z6XwXX0UTyBOVoqBaBCs/8neE3JpzQFcw6rNv0k9nbO2+
         fQWVvQ4UvB8PPll5WnX1XPOsoH0/5wHncpmf3SpHbkU1v6a9k078th2u1Er9kTNHPJUR
         pN/r/LGCcFXQZpN6H44DFHrxEYDFw5gBsvM72v9y5mB7jBaQKIF1RtYPMlVncjMF0zRE
         WMBw==
X-Gm-Message-State: AOJu0Yy9ul8HN7ALUjQsjtzw+vqbYQVgGj9rVhzND2sXLs+9nWY3JfZK
	rYkAHTFC4m0BupOqFdinYTCqc+fWW7+lPtEt6bI=
X-Google-Smtp-Source: AGHT+IHV5UsJWVVSXMIRZx/sVjTvLDn9ViHAtq/f55MJnJ9GaNOZsO0f5MhInSprCBQHhILYGp16aP1HyN0PvWvs1bM=
X-Received: by 2002:a1f:d6c2:0:b0:495:d5a4:513 with SMTP id
 n185-20020a1fd6c2000000b00495d5a40513mr12591708vkg.14.1696335384959; Tue, 03
 Oct 2023 05:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <7b93655219a6ad696dd3faa9f36fde6b094694a9.1696330005.git.geert+renesas@glider.be>
In-Reply-To: <7b93655219a6ad696dd3faa9f36fde6b094694a9.1696330005.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 3 Oct 2023 13:15:31 +0100
Message-ID: <CA+V-a8vtEKLXh=72pj-mW76g4OS0gWrig==CriB0xx++c=ECiQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: cache: andestech,ax45mp-cache: Fix unit
 address in example
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Palmer Dabbelt <palmer@rivosinc.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_051626_950522_F90AE7EB 
X-CRM114-Status: GOOD (  15.33  )
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

T24gVHVlLCBPY3QgMywgMjAyMyBhdCAxMTo0OOKAr0FNIEdlZXJ0IFV5dHRlcmhvZXZlbgo8Z2Vl
cnQrcmVuZXNhc0BnbGlkZXIuYmU+IHdyb3RlOgo+Cj4gVGhlIHVuaXQgYWRkcmVzcyBpbiB0aGUg
ZXhhbXBsZSBkb2VzIG5vdCBtYXRjaCB0aGUgcmVnIHByb3BlcnR5Lgo+IENvcnJlY3QgdGhlIHVu
aXQgYWRkcmVzcyB0byBtYXRjaCByZWFsaXR5Lgo+Cj4gRml4ZXM6IDNlN2JmNDY4NWU0Mjc4NmQg
KCJkdC1iaW5kaW5nczogY2FjaGU6IGFuZGVzdGVjaCxheDQ1bXAtY2FjaGU6IEFkZCBEVCBiaW5k
aW5nIGRvY3VtZW50YXRpb24gZm9yIEwyIGNhY2hlIGNvbnRyb2xsZXIiKQo+IFNpZ25lZC1vZmYt
Ynk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Cj4gLS0tCj4g
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2NhY2hlL2FuZGVzdGVjaCxheDQ1bXAtY2FjaGUueWFt
bCAgICAgICB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4KUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxh
ZC5yakBicC5yZW5lc2FzLmNvbT4KCkNoZWVycywKUHJhYmhha2FyCgo+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2FjaGUvYW5kZXN0ZWNoLGF4NDVtcC1j
YWNoZS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2NhY2hlL2FuZGVz
dGVjaCxheDQ1bXAtY2FjaGUueWFtbAo+IGluZGV4IDlhYjVmMGM0MzVkNGRmMTYuLmQyY2JlNDlm
NGUxNWZkYzQgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2NhY2hlL2FuZGVzdGVjaCxheDQ1bXAtY2FjaGUueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9jYWNoZS9hbmRlc3RlY2gsYXg0NW1wLWNhY2hlLnlhbWwKPiBA
QCAtNjksNyArNjksNyBAQCBleGFtcGxlczoKPiAgICAtIHwKPiAgICAgICNpbmNsdWRlIDxkdC1i
aW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9pcnEuaD4KPgo+IC0gICAgY2FjaGUtY29udHJv
bGxlckAyMDEwMDAwIHsKPiArICAgIGNhY2hlLWNvbnRyb2xsZXJAMTM0MDAwMDAgewo+ICAgICAg
ICAgIGNvbXBhdGlibGUgPSAiYW5kZXN0ZWNoLGF4NDVtcC1jYWNoZSIsICJjYWNoZSI7Cj4gICAg
ICAgICAgcmVnID0gPDB4MTM0MDAwMDAgMHgxMDAwMDA+Owo+ICAgICAgICAgIGludGVycnVwdHMg
PSA8NTA4IElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+IC0tCj4gMi4zNC4xCj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
