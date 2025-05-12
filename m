Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2292C3ABC3
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 12:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=orvgCdTIdHrhwre5CVk2chDaeVN1i+R0AMEv9Ssfbm4=; b=GPdfozzAk+Y4Df
	OdzFBuGG8nZtmj3QobHuq6wQ+K+sIbUhlNJHMCKq09MlUd/AEd+MjM/DDCoBEqsOnQQKfytOFQ4XR
	qPO6Ffsdx3rn5559Y6aY8iySyc6dCHICiiBxL9Fd+CMpawhzpx3ZtX23sfUfnXJtbz+2ZugumAUsE
	8dDT5EOH90Mzw2/zNVQ9G7fCcS2kJvacSftCgkGlcoMQZnq+c+ETsyPR7zEA9mZ2llnFTckfcy99F
	ybXfr+Lkg0fqHHx+DyL4Y9lLwERpWA051MhCrsYPovxi2ix8X7ipGipKhJiSHOXpcIdwfeEheCexA
	8Po6KSfG2NylIYwzuV4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERur-00000009Kru-3IOc;
	Mon, 12 May 2025 12:05:53 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERr3-00000009KKL-3c9b
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 12:01:59 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a0af41faa5so2414891f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 05:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747051316; x=1747656116; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLJVLjVIRNcIHnxTaw9HxnIWG+CtfSeCj2P4M8tU46M=;
        b=kLen5JqNS2Rdw+bt4sqfEnX83WRESe488GJUx73QXrkDPiXKOHQeiyB9g/ylV5gCBK
         8l0xmdpJV3UJwnYM8SQpyokS0vBbIoROgeqoKVrP6npiA7YpKaI/V43VZ4HK4nfVy0gE
         FOAIB3f9+3oIQnnQSwLiDZ7J05QQfr2dhiXhJKtiNcrGMfzJOU7WRp2AUJpBp6Gv/UBY
         ONPnn/qJIwfxX7/a5HeiacS/DKEyH2zxbfvTY29q+Y5Pq8ezCoxdtRh/fCSNPPXfaPrG
         kIHwSGv5qZJ7EvQuz3zo0KS0iIWbNcVSuGuk2bbuh1ft37f1w+EJO1qxZPmBT8bUQuO6
         Q/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747051316; x=1747656116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLJVLjVIRNcIHnxTaw9HxnIWG+CtfSeCj2P4M8tU46M=;
        b=rzLEaA72FEbMjW14BDlC+WBgjoPqpYlV8xvzHJlEYsNNmT856yM8l5NbKsg4uk8fm+
         zrn2ebAyM+i+x7ktcxPnN46bNvr0aG6Fg1jyUJAWLoxad+LkEbJMWDaM79bB2yMryTp0
         NEYdMo0Cbv/amKTUPdXSrTdatwOBzpymG0YsRaC5MQE7cL3pByDQV4Q5n/PjRYHwQmdd
         CM+SxSeU/HNKXUMcXCAe2zNwtiy/0z4/TwStN/UxCUlljkx/PF+vOP3jo1Dc/eiScXMj
         AnhmqwugqdUPglGmXpaXvUHJdFaIxzhKP2Wo1Eo9FYC3bHVPJ3l4S0RiEArqdy0d2hsE
         q+pg==
X-Forwarded-Encrypted: i=1; AJvYcCVJndXYo3sLWOCgYZP824LUEJWFa/8ZJFDl8lpAb4DXC5xbseNllj5iTG15TCeTkCmCOzeEMDqcQy441w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzS4s++tPtxFpNBCCeIzb1RUt4GBD+JW+1WFltaI43GphqLxj5G
	20vRzOfeTYuD800ZmlGVNjw6P6hzyP0fQ3i+HqXk2NULDqURNEhKmLW05QEKTHAtaYt624D34D4
	Lce0vSxX9TAErd04zuQ1cThn8ECg=
X-Gm-Gg: ASbGncvDte0dZRvPdFvTKiQL2Hq9U9k23eZ7Esd5Z8HaKNvhzvnMUn/i/oCFTHE91uL
	AgEexaGdEqtsP861yTwAt8YebIlpCiWJwTKu9ZhwIOpGyqJH+opHxCR/5BiuQ8/7IbU5Lxt/nsS
	fuCMwcC2VK7Pk7FD2bo00bKILl7knU7iZNt0dJWZNW0Q==
X-Google-Smtp-Source: AGHT+IFk51E71SGFXWQToQBrKc9lJsRATe+u4B3hYGRyU+GlbSWTBex+VUQWevQItC9UKpsGV9rJCDGVr/VutENn9RY=
X-Received: by 2002:a05:6000:2289:b0:3a0:b784:883f with SMTP id
 ffacd0b85a97d-3a1f64836f4mr9290450f8f.23.1747051315923; Mon, 12 May 2025
 05:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-sapling-exhale-72815a023ac1@spud> <20250509-dwindle-remold-98b3d03d0631@spud>
 <CAMuHMdVWznEm4Kg-MvgCT5+cBtdwGi9YrzFK6mBaoPJ+VK8S+Q@mail.gmail.com>
 <20250512-disaster-plaster-9dc63205cd6e@spud> <CA+V-a8sJUsNsF+AT1v3ySLiH9RGwDukMHHOC44JuV4JE3YKEpg@mail.gmail.com>
 <CAMuHMdWcfH7RfYnX+1vx6zFo83oGAW25kSAH0fW8Nb_LQ4PV_w@mail.gmail.com>
In-Reply-To: <CAMuHMdWcfH7RfYnX+1vx6zFo83oGAW25kSAH0fW8Nb_LQ4PV_w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 12 May 2025 13:01:28 +0100
X-Gm-Features: AX0GCFt-R2izv5Pf4TZGUme5bt66ZDkczAtT9CVVS9BSmAPnq3CowydfwZp3ZF0
Message-ID: <CA+V-a8sob3Me1JcQopymEtWZXCqGLyQZHu8n4X_5m8OKj0wFoQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: cache: add specific RZ/Five
 compatible to ax45mp
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Conor Dooley <conor@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Ben Zong-You Xie <ben717@andestech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_050157_930793_353CA7CE 
X-CRM114-Status: GOOD (  23.03  )
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

SGkgR2VlcnQsCgpPbiBNb24sIE1heSAxMiwgMjAyNSBhdCAxMjowNeKAr1BNIEdlZXJ0IFV5dHRl
cmhvZXZlbgo8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCAxMiBNYXkg
MjAyNSBhdCAxMjowNSwgTGFkLCBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29t
PiB3cm90ZToKPiA+IE9uIE1vbiwgTWF5IDEyLCAyMDI1IGF0IDEwOjU54oCvQU0gQ29ub3IgRG9v
bGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gT24gTW9uLCBNYXkgMTIsIDIwMjUg
YXQgMTE6MDE6MjZBTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+ID4gPiA+IE9u
IEZyaSwgOSBNYXkgMjAyNSBhdCAxNzozOSwgQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3Jn
PiB3cm90ZToKPiA+ID4gPiA+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3Jv
Y2hpcC5jb20+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gV2hlbiB0aGUgYmluZGluZyB3YXMgb3JpZ2lu
YWxseSB3cml0dGVuLCBpdCB3YXMgYXNzdW1lZCB0aGF0IGFsbAo+ID4gPiA+ID4gYXg0NW1wLWNh
Y2hlcyBoYWQgdGhlIHNhbWUgcHJvcGVydGllcyBldGMuIFRoaXMgaGFzIHR1cm5lZCBvdXQgdG8g
YmUKPiA+ID4gPiA+IGluY29ycmVjdCwgYXMgdGhlIFFpTGFpIFNvQyBoYXMgYSBkaWZmZXJlbnQg
bnVtYmVyIG9mIGNhY2hlLXNldHMuCj4gPiA+ID4gPgo+ID4gPiA+ID4gQWRkIGEgc3BlY2lmaWMg
Y29tcGF0aWJsZSBmb3IgdGhlIFJaL0ZpdmUgZm9yIHByb3BlcnR5IGVuZm9yY2VtZW50IGFuZAo+
ID4gPiA+ID4gaW4gY2FzZSB0aGVyZSB0dXJucyBvdXQgdG8gYmUgYWRkaXRpb25hbCBkaWZmZXJl
bmNlcyBiZXR3ZWVuIHRoZXNlCj4gPiA+ID4gPiBpbXBsZW1lbnRhdGlvbnMgb2YgdGhlIGNhY2hl
IGNvbnRyb2xsZXIuCj4gPiA+ID4gPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9v
bGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiA+ID4gPgo+ID4gPiA+IFRoYW5rcyBm
b3IgeW91ciBwYXRjaCEKPiA+ID4gPgo+ID4gPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2NhY2hlL2FuZGVzdGVjaCxheDQ1bXAtY2FjaGUueWFtbAo+ID4gPiA+
ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2NhY2hlL2FuZGVzdGVj
aCxheDQ1bXAtY2FjaGUueWFtbAo+ID4gPiA+ID4gQEAgLTI4LDYgKzI4LDcgQEAgc2VsZWN0Ogo+
ID4gPiA+ID4gIHByb3BlcnRpZXM6Cj4gPiA+ID4gPiAgICBjb21wYXRpYmxlOgo+ID4gPiA+ID4g
ICAgICBpdGVtczoKPiA+ID4gPiA+ICsgICAgICAtIGNvbnN0OiByZW5lc2FzLHI5YTA3ZzA0M2Yt
Y2FjaGUKPiA+ID4gPgo+ID4gPiA+IFRoaXMgbmFtZSBsb29rcyBhIGJpdCB0b28gZ2VuZXJpYyB0
byBtZSwgYXMgdGhpcyBpcyBub3QgYSBnZW5lcmljCj4gPiA+ID4gY2FjaGUgb24gdGhlIFI5QTA3
RzA0M0YgU29DLCBidXQgc3BlY2lmaWMgdG8gdGhlIENQVSBjb3Jlcy4KPiA+ID4KPiA+ID4gU28g
InJlbmVhc2FzLHI5Li4uLWNwdS1jYWNoZSI/Cj4gPgo+ID4gTWF5YmUgInJlbmVzYXMscjlhMDdn
MDQzZi1yaXNjdi1jYWNoZSIgPwo+Cj4gInJlbmVzYXMscjlhMDdnMDQzZi1heDQ1bXAtY2FjaGUi
Pwo+ClNvdW5kcyBnb29kIHRvIG1lLgoKQ2hlZXJzLApQcmFiaGFrYXIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
