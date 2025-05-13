Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63BDC3ABC9
	for <linux-riscv@archiver.kernel.org>; Tue, 13 May 2025 07:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hREWCo2kjE+NkVddl+eXbMev+RHJRCuGCw71ALXAHiE=; b=3VmG+UFoCgTybF
	xOBw8omiZT6TzLPa24szMtcEN3Yt5xfblfzHhHZCJFE0NyOabc+mWjafJyXSwX9SW46dOkWxED0M7
	u+whrzTLBi3FVwZ/DJ5q+a6hkH2NfUoyhMefryzv8nsxDWNHfbpdFCFld+ThLhzdcDui7wif7HjyD
	KSaK6OPhjAT48RnIeZr2OlJqfYJwB9dJmYwFM3rJY1qM45Tn2ufKKTmud2szXw4MK6kEb8C7Rhbek
	L/hSl/j7+rrqEptFoR6oy1cuepop6xPY7FAB3s30Z/DKwTmlk2CaqqCG8QicZZvaXNP2PHS2FJ50X
	1O7Sa9mdrW3ccUAsvUjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEkJ3-0000000Beyg-0WRF;
	Tue, 13 May 2025 07:44:05 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEkIH-0000000BeqL-1UTH
	for linux-riscv@lists.infradead.org;
	Tue, 13 May 2025 07:43:18 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a1fb17a9beso2197884f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 May 2025 00:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747122195; x=1747726995; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fG8oqj+Wp78YD53lMG3NWPJMEgG7b7UFy7qM2sNYujM=;
        b=KyDjR9v8HmMDfKt9PunmayCZG3i3X9+JMqx38+KJ191eduIELVLT0kkV352joV3W3M
         JaxPcOaZT8VNBsNXho9tIs7SrZxtwV6kZX0tts02FcriWtzrAsxV5I53QwedLsgIhU8z
         0mn8FRQ0hNHpEHOmP78FeOTNt236eTFypUJoIo0t8Un4uDJaml4Agnr+hULraiogy2X3
         3XWVpQF1t5wH5V+uFBhQ9vBXEzSLHRUQNhKBKcLoocWzWI9QP2cRuy/kGxqvO384jvK/
         eIADAWris64//W1RU0z/xiGH+WMT9uYMAfR3+YWJWFUR2Rf8UJLTKZLZ6WKxiOIlP7gD
         zT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747122195; x=1747726995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fG8oqj+Wp78YD53lMG3NWPJMEgG7b7UFy7qM2sNYujM=;
        b=OWJaXH86Rn0nLdrYt93VuVwkD5/FTOmPtxg9yLPWDpHiLrRvszADiky7yP+ObyogKv
         RuakuuUabyV64COHp543U7cRpuocUVHXteGIeC28pH99pcUsR7k07xnaUL5LQDL1X5xm
         ElzFKroSguOtAVbiP+lHkQxzt9wzxsyx237ukS5Zg3s2agBF9ZBC0kQZWAptwP3vr4Z9
         0DNBbA7rL1m+SapuA2yJ33DwyQQjhKB14K8mJgtylzGirG8HTNuPwuE8psK4a4SIiB94
         fZi7ekw7d2E0wniUlR9lZHI0g5B6/c1JApb02w0SVgUfCGRb4PmG3E8nUfU/HLqP+F1f
         u2rA==
X-Forwarded-Encrypted: i=1; AJvYcCVNGKNR/sZAI0LNc75OM+9WQLJhrKu9K+uTS6lWBWcft0i+2JV60DLi3KMIVhPsC9Hlz9jnpXWJ6BDtQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwwGYVHudw06VG1uRVaanf9q89IXQdPXVmNzBGU9L6euXwN2V3d
	2IXXHjV7sSoAspr7JtYXoo0RpDKI+AY1b/KoVhJRogphvFIOw/1K2o26bdgeKz2lu2dkzR0JhDx
	LTxRvwUaG+K8Hrpgb0/ud2Ee8xlQ=
X-Gm-Gg: ASbGncvZUj+n4fUxTHZvO61g7yfcqWqz6B3zD7uWjJKRrZq+sHGq8S9TRnswob2OCWm
	z+/+2lJKBX3wj9UeQu91rQbWoVE7hoPsomr/pnABzB6+Q46fZ7IodipdNgRbmDalQ2pLekNlsla
	KfD5HJzYMfrzveBHcuJEeb3NbxmavlUkCg15N+lO8bM69KPQ==
X-Google-Smtp-Source: AGHT+IEZGFUBGfpFWoH02PF3w4asX5yVpyJ9KxOfndhTR3c9CFgfuFIy472TCk4Qb3+UWsnv0YDG9mgYiKqGQ6eYoMg=
X-Received: by 2002:a05:6000:430e:b0:3a0:b5ec:f05f with SMTP id
 ffacd0b85a97d-3a1f6482aabmr12175878f8f.39.1747122195541; Tue, 13 May 2025
 00:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250512-daily-saga-36a3a017dd42@spud> <20250512-sphere-plenty-8ce4cd772745@spud>
In-Reply-To: <20250512-sphere-plenty-8ce4cd772745@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 13 May 2025 08:42:48 +0100
X-Gm-Features: AX0GCFuqAHW_El1GmwQL0ffwl-eOvi3d0MKWaPdlKXmQfFMsGd_d4EiSnbBSRgQ
Message-ID: <CA+V-a8tgkNd92USA99UtgydA7F6BdYYB=eBXF7VNR_4h6ViOzA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: dts: renesas: add specific RZ/Five cache compatible
To: Conor Dooley <conor@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Ben Zong-You Xie <ben717@andestech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_004317_392369_C261E695 
X-CRM114-Status: GOOD (  16.57  )
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

T24gTW9uLCBNYXkgMTIsIDIwMjUgYXQgMjo0OOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
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
LmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0M2YuZHRz
aSB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPgpSZXZpZXdlZC1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJq
QGJwLnJlbmVzYXMuY29tPgoKQ2hlZXJzLApQcmFiaGFrYXIKCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDNmLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3JlbmVzYXMvcjlhMDdnMDQzZi5kdHNpCj4gaW5kZXggZTBkZGY4ZjYwMmM3OS4uYThiY2Iy
NmY0MjcwMCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdn
MDQzZi5kdHNpCj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0M2Yu
ZHRzaQo+IEBAIC0xNDMsNyArMTQzLDggQEAgcGxpYzogaW50ZXJydXB0LWNvbnRyb2xsZXJAMTJj
MDAwMDAgewo+ICAgICAgICAgfTsKPgo+ICAgICAgICAgbDJjYWNoZTogY2FjaGUtY29udHJvbGxl
ckAxMzQwMDAwMCB7Cj4gLSAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYW5kZXN0ZWNoLGF4
NDVtcC1jYWNoZSIsICJjYWNoZSI7Cj4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVu
ZXNhcyxyOWEwN2cwNDNmLWF4NDVtcC1jYWNoZSIsICJhbmRlc3RlY2gsYXg0NW1wLWNhY2hlIiwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICJjYWNoZSI7Cj4gICAgICAgICAgICAgICAg
IHJlZyA9IDwweDAgMHgxMzQwMDAwMCAweDAgMHgxMDAwMDA+Owo+ICAgICAgICAgICAgICAgICBp
bnRlcnJ1cHRzID0gPFNPQ19QRVJJUEhFUkFMX0lSUSg0NzYpIElSUV9UWVBFX0xFVkVMX0hJR0g+
Owo+ICAgICAgICAgICAgICAgICBjYWNoZS1zaXplID0gPDB4NDAwMDA+Owo+IC0tCj4gMi40NS4y
Cj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
