Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06812C48260
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 14:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NYJN0PUML70pXpRT/FCs/kIPT+lOT+/QGXBvNlr7L5k=; b=IHbZqbnFJ5r0Wl
	NIMznt0ttyLPPGf8QBfAHty8ZK1E1u0wnNSrvxwUWO8Tmf97me7Bk3fHsH7GPsGpXcboDd3CKICc8
	Hosfhbc6hkidvWB+xe9yL6TM/7+CwIxBKYmhleBNdY9kCYNMzysqhjpqbLALJC9LXgJwf8x1Dbe9J
	d2ydqUCKMlPT7C/HQKFY2sCZWuOa6U9drYLJ9mU7AYjj/IH3NEktJneEkLRqaUsWkvX7KgvgRDSR2
	p/lvlyOz000EzdglHTwi5bk3SvuRwwafsFE92MClKx/T/jT2f+ryDctvvOpa22KAGau1JafTdb5tU
	aB/zOpwqaD2BqIwNTqOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rayw5-00000002Z5G-1kn4;
	Fri, 16 Feb 2024 14:11:29 +0000
Received: from mail-yb1-f180.google.com ([209.85.219.180])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rayw2-00000002Z3m-1k4H
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 14:11:27 +0000
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dcdb210cb6aso2183949276.2
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:11:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708092682; x=1708697482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dhKX/Qgrm7Zf7JKAIxtMZgwZqvuWek0AD+yFUOpkk1I=;
        b=hb7gjiUy/Ngc2Eo3qBVgsu3xaY7uUi1em7AL/W9iTsugfTo57EVn6HoSxEUnoJnIAH
         cuSPDunVJWS2B06qZRfXfABApSwjC+vdkzxijN6BIpupJTn25L+Y58sPZxF3lKyXr0IQ
         ERJS4hy9bI0EAcpFD+56Mlrbs0dOSzLDOBoJ5kxJKY/++fD5wYAspVp+NZJWaTgeVjHY
         aQLRn9L8r81wYCokvvxjGqRvMWUmjk8ZmiUqO1mx0gTAZmDTv5MdFeI2+CiFHbbaVhL1
         NUG4tRPLBrDNJSuBnxkLox6O9v0lpB+f05rZC+4QGz1o9YbgUpd11Ufr5d0BF1aorXgs
         Tc6w==
X-Forwarded-Encrypted: i=1; AJvYcCXpL1lmThQRTmDwfApr7l9zqZR05je2DIeHHCYDmYzz4sqtKgHpDGo++MUWVor5C2SeaQx/Gbil/WLzUaxN98XhoLEiO85fucC+34MeY2FG
X-Gm-Message-State: AOJu0YxXCO3DntVbumI563iPrwll69rbCPtHYcznSqZYsREtqEbOH2V8
	2cp1RRptWikHjdgB86MpTvg2rNCF24f7E6yZQgoeyA1CII2RCso6fjlggjmRtVU=
X-Google-Smtp-Source: AGHT+IHVUfguBP5mYgX5ycpkVHr6qFHTwwtFo5tflvUfA4zOB/ejKaYP+jQIB/g0OJs9Bm+VZAR3Aw==
X-Received: by 2002:a25:b04d:0:b0:dc7:4363:4532 with SMTP id e13-20020a25b04d000000b00dc743634532mr4757930ybj.53.1708092682349;
        Fri, 16 Feb 2024 06:11:22 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id w11-20020a05690202cb00b00dcdac51bad9sm310950ybh.49.2024.02.16.06.11.21
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 06:11:21 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-607d8506099so17482477b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:11:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVUEaJeK5F5kjJS/1XeUrew/Tq1XNPd28UfeR0WvsT2/l592N6yH57Fs/8MO/MEB4grw2EYjqYPlPglGTqYEvIeFwBR0yIArEf6TDt4BeKn
X-Received: by 2002:a0d:d7d2:0:b0:607:90a5:dc1d with SMTP id
 z201-20020a0dd7d2000000b0060790a5dc1dmr4365288ywd.17.1708092681385; Fri, 16
 Feb 2024 06:11:21 -0800 (PST)
MIME-Version: 1.0
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com> <20240208124300.2740313-14-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240208124300.2740313-14-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Feb 2024 15:11:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW63y2NcdcMsZC4gnP5u6rHSumGB5oEAvzY9ZH4u=Oqkw@mail.gmail.com>
Message-ID: <CAMuHMdW63y2NcdcMsZC4gnP5u6rHSumGB5oEAvzY9ZH4u=Oqkw@mail.gmail.com>
Subject: Re: [PATCH 13/17] arm64: dts: renesas: r9a07g043: Update
 #power-domain-cells = <1>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_061126_480042_81FC270A 
X-CRM114-Status: GOOD (  17.80  )
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

SGkgQ2xhdWRpdSwKCk9uIFRodSwgRmViIDgsIDIwMjQgYXQgMTo0NOKAr1BNIENsYXVkaXUgPGNs
YXVkaXUuYmV6bmVhQHR1eG9uLmRldj4gd3JvdGU6Cj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNs
YXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPgo+Cj4gVXBkYXRlIENQRyAjcG93ZXItZG9t
YWluLWNlbGxzID0gPDE+IGFuZCBtb3ZlIGFsbCB0aGUgSVBzIHRvIGJlIHBhcnQgb2YgdGhlCj4g
YWx3YXlzIG9uIHBvd2VyIGRvbWFpbiBhcyB0aGUgZHJpdmVyIGhhcyBiZWVuIG1vZGlmaWVkIHRv
IHN1cHBvcnQgbXVsdGlwbGUKPiBwb3dlciBkb21haW5zLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2xh
dWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPgoKVGhhbmtzIGZv
ciB5b3VyIHBhdGNoIQoKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdn
MDQzLmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQzLmR0
c2kKPiBAQCAtMTM4LDcgKzEzOCw3IEBAIG10dTM6IHRpbWVyQDEwMDAxMjAwIHsKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAidGdpYTgiLCAidGdpYjgiLCAidGdp
YzgiLCAidGdpZDgiLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICJ0Y2l2OCIsICJ0Y2l1OCI7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZj
cGcgQ1BHX01PRCBSOUEwN0cwNDNfTVRVX1hfTUNLX01UVTM+Owo+IC0gICAgICAgICAgICAgICAg
ICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JmNwZz47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
cG93ZXItZG9tYWlucyA9IDwmY3BnIFI5QTA3RzA0M19QRF9BTFdBWVNfT04+OwoKVGhpcyBzaG91
bGQgYmUgUjlBMDdHMDQzX1BEX01UVSwgYnV0IHRoYXQgZG9tYWluIGlzIG5vdCB5ZXQgc3VwcG9y
dGVkCmJ5IHRoZSBkcml2ZXIuICBJbnN0ZWFkIG9mIGFkZGluZyBpbmNvcnJlY3QgaGFyZHdhcmUg
ZGVzY3JpcHRpb25zLApJJ2QgcmF0aGVyIGRlZmVyIHRoaXMgdW50aWwgYWxsIGRvbWFpbnMgYXJl
IGhhbmRsZWQgYnkgdGhlIGRyaXZlci4KCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmVzZXRz
ID0gPCZjcGcgUjlBMDdHMDQzX01UVV9YX1BSRVNFVF9NVFUzPjsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAjcHdtLWNlbGxzID0gPDI+Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1
cyA9ICJkaXNhYmxlZCI7CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAg
ICAgIEdlZXJ0CgoKLS0KR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51
eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVy
c2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1
dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIi
IG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
LS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
