Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35615C3ABD8
	for <linux-riscv@archiver.kernel.org>; Tue, 13 May 2025 07:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AY1J283l1iufLsk5uIWSP22vHHIgcIW1FzhhbUG53nE=; b=fMPpxhiOSC7nhC
	KRaRcLgTE0MQHv8YGP3ItqkalfgNiPlIH8PsKCZXgc7y1KVT3qVCYbUIOwZqu5uoxjJg1PtmbwkVu
	IwOO4cXZDn4diNpPZeACVcVFGOq/1wWttk23peUZMw6uEiZiOA2gdSVPO9VgxPpYqi63+t/JE1x3M
	IRkaTgcTV7qNfrU/MXqnls16H12vetK9f43AaBSzqmm3XYMAAkqnJxtUD8tbuAEgdhZY2DPyyNIKF
	LKvJ/opYGVvu2mDRFVUk5Mf0cOe/3k/NMlRM90f4oHwa80DhoK/U/N1JRcliscHK6X99w1tG3HtsI
	6N9xEOdQX00m7xYSwYzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEkJ2-0000000Beya-2KgJ;
	Tue, 13 May 2025 07:44:04 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEkHj-0000000Bem9-3WyZ
	for linux-riscv@lists.infradead.org;
	Tue, 13 May 2025 07:42:45 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so60873485e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 May 2025 00:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747122162; x=1747726962; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D5EeRPV8Vs99JUS6VGOzkhDsirZOs54DCeOjcjXBhCA=;
        b=KEN8RONESrNaIUDyfBrBoSCUaCl/DyiKPsrfLwkvok1VSfkJieKwRpBeVKcKyhsFP8
         AYUsFg2LTaQexEfLXKkdTCmeazZZf+Jui4JzpAPAU+Xf+2W23SDX/SusS8uU8hl5jE6D
         MuGF8WBdWehoICNGLSQAcGp/Su4bWMdO6ECwcNBV9QEKh7lL3QdD6qv/c0+kdn7F+iqE
         mMafASh/cMLuiXZSALltZLYpanjJW7zMjpJ/E1om5oqk/y+6yAgTJVXkScCo6V/W8vos
         rEI3v0e8d6RrFWgYAbeUUPBEr9Ek2y+kCV8+oMUysxXOLjlvRY5to2IibtpeJRtwgfzA
         iG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747122162; x=1747726962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D5EeRPV8Vs99JUS6VGOzkhDsirZOs54DCeOjcjXBhCA=;
        b=kN0JWlQssON3+JNK2dwQw9doMi9s3NaqiGdeLQzYg1yIm8ug6vaO1T/KvJ3Y19TwWF
         mo4tt2VNZQlGleVaGuqaRbffOrscbAtu6eqDPiSdn2qP/78hFqSt3Ol2gJczBcG49e9v
         swa+XCRjyKxUZpo9m4Uz4EDnTYXwSzklvYIPUo633seD9m49o3Zn9smn84P9pRA+J3wH
         d4/sbivbBtwNKj3G10nDkGvqUOhS6+DHw0klgIf7isGdGCnaZPxjZuhAMcsBe2iLIyFd
         3z1cKVzlbqkiipPn7WdCc7c4eCB3HhElqi12J7DGnsfW4IL3aGhWIEcuVDGkmpPeAzni
         JyBg==
X-Forwarded-Encrypted: i=1; AJvYcCUWGxo1W4H98y/Ry8E6Fm2Jd2wwQPrjLCO8H2jfEAZ5pg/p229W5CUhyOz8r15xFYlkEEan22rCjdpK1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfJI30ZO0snHL/z2KDddz5wpDFdSVvDwJUwi9ekLgFhgw34dY3
	c5wh4xb6jdUVX3WV0XHUNE4B9jsPhx8E1vRd1Lqr3gVqYpKQ6z9nltrp5GiREbDnFshymCLqaov
	G/P1IjNptw5C35oDwW9eowB2zuaY=
X-Gm-Gg: ASbGncsGEWyz8Dl7Df6DItWIUh6+oWfgElxy9pDUULKc0eAmkR3LuVxmEVngOYzTxO5
	wBHgqY/HkVQx82Dy0FqsXI2YCnPP758TxoDyU9ftthGpvqUc/7S95lAFk/ePHZ8waT3KLSetjsi
	2EgiYTGY6VClTkPZL09wm5eNwT9EESei1s+Kw=
X-Google-Smtp-Source: AGHT+IFXL/hE4jmoKOkbg3iKF2uwGvdj6kGxF++bvbioySStQ0aLhC+48d08yuAr/x6Z1Pv/Qwpygt+YjxKd19udHHM=
X-Received: by 2002:a05:6000:2485:b0:39c:13f5:dba0 with SMTP id
 ffacd0b85a97d-3a1f64328bbmr13087447f8f.13.1747122161833; Tue, 13 May 2025
 00:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250512-daily-saga-36a3a017dd42@spud> <20250512-sevenfold-yeah-d40078a9249e@spud>
In-Reply-To: <20250512-sevenfold-yeah-d40078a9249e@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 13 May 2025 08:42:15 +0100
X-Gm-Features: AX0GCFs3WUCcJVNPxLJlOrk65mHejbVofYUQyPp4oSEDskZVj5B6_lOINocEbfQ
Message-ID: <CA+V-a8sKAVEZDOxgok94YHWdE9Mgw-z3DRa8UTSf=myxe5O9pA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: cache: add specific RZ/Five
 compatible to ax45mp
To: Conor Dooley <conor@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Ben Zong-You Xie <ben717@andestech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_004243_879678_734E82DB 
X-CRM114-Status: GOOD (  17.32  )
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

T24gTW9uLCBNYXkgMTIsIDIwMjUgYXQgMzoxMuKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNy
b2NoaXAuY29tPgo+Cj4gV2hlbiB0aGUgYmluZGluZyB3YXMgb3JpZ2luYWxseSB3cml0dGVuLCBp
dCB3YXMgYXNzdW1lZCB0aGF0IGFsbAo+IGF4NDVtcC1jYWNoZXMgaGFkIHRoZSBzYW1lIHByb3Bl
cnRpZXMgZXRjLiBUaGlzIGhhcyB0dXJuZWQgb3V0IHRvIGJlCj4gaW5jb3JyZWN0LCBhcyB0aGUg
UWlMYWkgU29DIGhhcyBhIGRpZmZlcmVudCBudW1iZXIgb2YgY2FjaGUtc2V0cy4KPgo+IEFkZCBh
IHNwZWNpZmljIGNvbXBhdGlibGUgZm9yIHRoZSBSWi9GaXZlIGZvciBwcm9wZXJ0eSBlbmZvcmNl
bWVudCBhbmQKPiBpbiBjYXNlIHRoZXJlIHR1cm5zIG91dCB0byBiZSBhZGRpdGlvbmFsIGRpZmZl
cmVuY2VzIGJldHdlZW4gdGhlc2UKPiBpbXBsZW1lbnRhdGlvbnMgb2YgdGhlIGNhY2hlIGNvbnRy
b2xsZXIuCj4KPiBBY2tlZC1ieTogQmVuIFpvbmctWW91IFhpZSA8YmVuNzE3QGFuZGVzdGVjaC5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlw
LmNvbT4KPiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvY2FjaGUvYW5kZXN0ZWNoLGF4
NDVtcC1jYWNoZS55YW1sICAgICB8IDQgKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4KUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJo
YWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KCkNoZWVycywKUHJhYmhha2FyCgo+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2FjaGUvYW5k
ZXN0ZWNoLGF4NDVtcC1jYWNoZS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2NhY2hlL2FuZGVzdGVjaCxheDQ1bXAtY2FjaGUueWFtbAo+IGluZGV4IGQyY2JlNDlmNGUx
NWYuLjgyNjY4ZDMyNzM0NGUgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2NhY2hlL2FuZGVzdGVjaCxheDQ1bXAtY2FjaGUueWFtbAo+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jYWNoZS9hbmRlc3RlY2gsYXg0NW1wLWNhY2hl
LnlhbWwKPiBAQCAtMjgsNiArMjgsNyBAQCBzZWxlY3Q6Cj4gIHByb3BlcnRpZXM6Cj4gICAgY29t
cGF0aWJsZToKPiAgICAgIGl0ZW1zOgo+ICsgICAgICAtIGNvbnN0OiByZW5lc2FzLHI5YTA3ZzA0
M2YtYXg0NW1wLWNhY2hlCj4gICAgICAgIC0gY29uc3Q6IGFuZGVzdGVjaCxheDQ1bXAtY2FjaGUK
PiAgICAgICAgLSBjb25zdDogY2FjaGUKPgo+IEBAIC03MCw3ICs3MSw4IEBAIGV4YW1wbGVzOgo+
ICAgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPgo+
Cj4gICAgICBjYWNoZS1jb250cm9sbGVyQDEzNDAwMDAwIHsKPiAtICAgICAgICBjb21wYXRpYmxl
ID0gImFuZGVzdGVjaCxheDQ1bXAtY2FjaGUiLCAiY2FjaGUiOwo+ICsgICAgICAgIGNvbXBhdGli
bGUgPSAicmVuZXNhcyxyOWEwN2cwNDNmLWF4NDVtcC1jYWNoZSIsICJhbmRlc3RlY2gsYXg0NW1w
LWNhY2hlIiwKPiArICAgICAgICAgICAgICAgICAgICAgImNhY2hlIjsKPiAgICAgICAgICByZWcg
PSA8MHgxMzQwMDAwMCAweDEwMDAwMD47Cj4gICAgICAgICAgaW50ZXJydXB0cyA9IDw1MDggSVJR
X1RZUEVfTEVWRUxfSElHSD47Cj4gICAgICAgICAgY2FjaGUtbGluZS1zaXplID0gPDY0PjsKPiAt
LQo+IDIuNDUuMgo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
