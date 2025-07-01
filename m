Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48931C8302F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 08:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nz3EBdYMGPR6gB0vv/Yrsm3hk6zEAZx+4wFZV/LBpgQ=; b=crYrngTJRwI0ht
	j1n/fH9BCqD4Fqle9XCAMSIme312DBPwRBzBWB3z9kFqXbKxEZN0bxJhA9YM1qHhsv8RBhToQ//JB
	NgZqVhjwSB8tF613JJQhrc9l20gV9wcfAws6e/P5AGQpQb+3S/dZKP0OudN/TAlR4vb+t5cSFw62y
	HsgbM0vNh+JEnim40iE0uMrXawFcOoD+fOVLUv1kGle++yTdY9rGk4sQ3iewRB7QtZtkub3VHFCl8
	zw7AQiA7PAxe7DGuUD4GwOJEIjBwYxEgOeAYX/OgGcfByUEMkUhdEGlj9jQ9lApgGZPfL1vRvZWnp
	5AC2R9fcu68Y8KDzQfNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWj3-00000004TZW-2tWs;
	Tue, 01 Jul 2025 08:52:25 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWDk-00000004OZ4-42JZ
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 08:20:06 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-70e4043c5b7so28830787b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Jul 2025 01:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751358004; x=1751962804; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbuOsRMFTiJD9Z73+tptA9tOlUhWfVFv9XwbRhZntqs=;
        b=v4yl1cPYxLPCTEirrONKRi2s5TDim4iftMhNwE0Zj02O86gfi3IQD3qoJNZjHr57RO
         q1Ta9BW9V7k2L2cdEneiEii36NI9rMWnwNMqiKzrrXNZMRu7nFnYX8AETjwRoGlb9Ue9
         Lm7W1hZUKs+icVzhhS+RtD3UN1nWPyGcmXnj0GBbzBxL5E1l67vpRcJysMwrR2rYm/EG
         GId7j+fNuliKhTiya2qg5q2Zsdsk6RQrOVFHaCBX3bHWAEX2WCxr8SLhlHLYtcwFV4+W
         eliyCJ701OsfawvarchxSKliOeAupR0TTfurXbbmR6X86j/dkhQntz3EI/1tOwnFrR9m
         RLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751358004; x=1751962804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FbuOsRMFTiJD9Z73+tptA9tOlUhWfVFv9XwbRhZntqs=;
        b=lTGUNf7n516tPDI5xjm+UMXgsY9iea11cYmbdYjMgAhbLvJ2rn3MderdgDVQv3pZdb
         opcdKacWclNxMtWvH8Y+Knd995dNthf9L1/Qw6LtR+l4uqjWWFGt7PkRQlvmA1IMNJQx
         5hVgyXAKeROY3WaAMd/XEpaQJ3D2lh5EbhOP0D8IlB5iHG6UCbzYu5a+8bltglIDxbXZ
         M9HvpIpv6ll8Y0JU+F3XiZJpvujna4pMILfTJb9i1bDjqgz+VNZDgosCFkPNF2XqAM6l
         q615uZhatnlfrZsFDjZCsmM0mVTw4MBexSDGEFMJRq0xWGVhC/G3rY1mHMRrVFW26XUa
         Fjdg==
X-Forwarded-Encrypted: i=1; AJvYcCX6P65OLSyPFdrZsl9M7Bclp3yBjUuTGxItZ2OyjWgh64vVioDYd7QgGGrvb+aasJyGhsxmRBt1zdKmzA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc/nvfpvQB4Q2b/n52HywIHQMR9hb26KW8GEITbomvFauVGYhE
	P822haipO+Ck7cjOEhcAAvZqKFzFzq6tEr1a1jzDisE5HOdDUU+/IS3y2EmQ+G3Ok5dJX2UhJaZ
	atTVDq75GmoF3H58Q3JnTJG1CFGDi4q0k7b1Nr4XGmA==
X-Gm-Gg: ASbGncs6OaDGfYMvPDdDpFY4zVfIm/ISEnH19wfkc3LAqayQS8qquOHPgn8UvkG5BN/
	KQkqIjDQVFO4ClCb2CIRQK/rJQRUWoOChLMMiho1Il6C8tmXwQSNusQHmvj4far278mHpJnvUSp
	DuU5tgy3pNR9SYqU5KVP2jaAsKR/Lnquj4YUkyB3TOJCD8gPSi
X-Google-Smtp-Source: AGHT+IFre+CwhTt7pE+B50luWB9F2Nl0i0HpZdG4/qK3UkvJ4Pwbg0TDxDpw39sn7GQMRaKyZ8jEL4jGCSy8+Dou2x8=
X-Received: by 2002:a05:690c:30d:b0:70f:84c8:312e with SMTP id
 00721157ae682-7151713d346mr246421247b3.1.1751358003665; Tue, 01 Jul 2025
 01:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
 <20250701-working_dma_0701_v2-v2-6-ab6ee9171d26@riscstar.com> <a329e8a9-d581-4af1-ac0f-9f104a810bc9@kernel.org>
In-Reply-To: <a329e8a9-d581-4af1-ac0f-9f104a810bc9@kernel.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 1 Jul 2025 16:19:52 +0800
X-Gm-Features: Ac12FXz5TtaMdqHj-qXiGBKlygWCWhHUUNjiyvuAFFCHITTv4zQR9b39KeOkZO4
Message-ID: <CAH1PCMb8OKiqT1R0mHSU1RFxcJvd6VyFyWJWhhKpWc5nKvTi3Q@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] riscv: dts: spacemit: Add PDMA0 node for K1 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	=?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alex Elder <elder@riscstar.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_012005_001112_D5356EB5 
X-CRM114-Status: GOOD (  17.76  )
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

T24gVHVlLCBKdWwgMSwgMjAyNSBhdCAzOjM34oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
a0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIDAxLzA3LzIwMjUgMDc6MzcsIEd1b2RvbmcgWHUg
d3JvdGU6Cj4gPiBBZGQgUERNQTAgZG1hLWNvbnRyb2xsZXIgbm9kZSB1bmRlciBkbWFfYnVzIGZv
ciBTcGFjZW1pVCBLMSBTb0MuCj4gPgo+ID4gVGhlIFBETUEwIG5vZGUgaXMgbWFya2VkIGFzIGRp
c2FibGVkIGJ5IGRlZmF1bHQsIGFsbG93aW5nIGJvYXJkLXNwZWNpZmljCj4gPiBkZXZpY2UgdHJl
ZXMgdG8gZW5hYmxlIGl0IGFzIG5lZWRlZC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW9kb25n
IFh1IDxndW9kb25nQHJpc2NzdGFyLmNvbT4KPiA+IC0tLQo+ID4gdjI6Cj4gPiAtIFVwZGF0ZWQg
dGhlIGNvbXBhdGlibGUgc3RyaW5nLgo+ID4gLSBSZWJhc2VkLiBQYXJ0IG9mIHRoZSBjaGFuZ2Vz
IGluIHYxIGlzIG5vdyBpbiB0aGlzIHBhdGNoc2V0Ogo+ID4gICAgLSAicmlzY3Y6IGR0czogc3Bh
Y2VtaXQ6IEFkZCBETUEgdHJhbnNsYXRpb24gYnVzZXMgZm9yIEsxIgo+ID4gICAgLSBMaW5rOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA2MjMtazEtZG1hLWJ1c2VzLXJmYy13aXAt
djEtMC1jMDE0NDA4MjA2MWZAaXNjYXMuYWMuY24vCj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2Jv
b3QvZHRzL3NwYWNlbWl0L2sxLmR0c2kgfCAxMSArKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxMSBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9v
dC9kdHMvc3BhY2VtaXQvazEuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEu
ZHRzaQo+ID4gaW5kZXggOGY0NGMxNDU4MTIzYmU5ZTc0YTgwODc4NTE3YjJiNzg1ZDc0M2JlZi4u
NjllMGIxZWRmMzI3NmRmMjZjMDdjMTVkODE2MDdmODNkZTBlNWQ1NyAxMDA2NDQKPiA+IC0tLSBh
L2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEuZHRzaQo+ID4gKysrIGIvYXJjaC9yaXNj
di9ib290L2R0cy9zcGFjZW1pdC9rMS5kdHNpCj4gPiBAQCAtNTkxLDYgKzU5MSwxNyBAQCB1YXJ0
OTogc2VyaWFsQGQ0MDE3ODAwIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
YXR1cyA9ICJkaXNhYmxlZCI7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgfTsKPiA+Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgcGRtYTA6IGRtYS1jb250cm9sbGVyQGQ0MDAwMDAwIHsKPgo+
Cj4gT2RkbHkgcGxhY2VkLiBJcyBzcGFjZW1pdCBub3QgZm9sbG93aW5nIHN0YW5kYXJkIERUUyBj
b2Rpbmcgc3R5bGUgb3JkZXJpbmc/Cj4KCk9oLCBJIHNlZSB0aGUgaXNzdWUuIEkgd2lsbCBmaXgg
dGhpcyBieSBvcmRlcmluZyBieSAidW5pdCBhZGRyZXNzIGluCmFzY2VuZGluZyBvcmRlciIuIFRo
YW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBvdXQuCgotR3VvZG9uZwoKPgo+IEJlc3QgcmVnYXJkcywK
PiBLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
