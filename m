Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2629AC3ABBC
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 11:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M0G5ZhIeKHSyuqHQ8jepXkDLlF6p+qJhrh02XknZE/4=; b=q3sDnLXs7tFquW
	5JMIxJOhxESNAyIAr2H9TTvoKj/TlZ61xNNtMw/+9cbKidj/YN4fLJzp2fZxzlqj0ne2cHNnLOWtR
	ZrN5lc08PVtOBOOjVEbKkkzO2po78JUPqUXqtEeKkSziSie3EMso05eCNabrvb9GAArl0hnfTdiOy
	5Sa0mIdoGSK5Le/CtmhjU8nKQiTgc5PCgtwHMtHWW8ZG0ussBPHPrIYrjRDC13kGufo2JH0eBQCMh
	XI6bpxblzyHftqIlOzOvpeOy0PLhnsgc8yM+WhxG/SsfbR9he9cdH1ioBq9UAPoZQq3QjKpi821sV
	Ky5c6F9lIQHZZE4PUCvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERFg-00000009F6Z-2NSR;
	Mon, 12 May 2025 11:23:20 +0000
Received: from mail-qk1-f176.google.com ([209.85.222.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQyN-00000009CcZ-20Sm
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 11:05:29 +0000
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c7913bab2cso504013785a.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 04:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747047926; x=1747652726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/0nyFVM8kY7M26CugFUGaMuLf40Ltidiv/gy6m4GKs=;
        b=YCqIXVzTqQ1boVAQYKnVY+I9gaLXye0k7+Eolh8p9eynFfv0XN09Cb5OIa68TTdEy1
         /NnMeGrYYinevOJSZDVxTTfavKOmIRuunMuayOqarR24zjgIQ9VByvKB1RxZzrxERX6I
         HRz5ZTntMRhWQoqeY7QZ6PWROYzb1ObsNTJMgfDzNsVcGLaPve2GKWCcwsndNZLJqf0U
         QGgSH9fvdmo0SeYPHjLpe8MphZF4roLr9H6deDHNz82erFwEwj68PTedYGmx6HrnnzAN
         6PuTDh/ELMfXBX66jQo5h4kLLkPBjyPZ+jsY7T3dY42fAb7ttsJhT4PcujzfYVWB7KNw
         ApGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ1yKhPjVoxGNVTbR+2NXs37+4vZpwSwj82Jv2OLPwlSYmvKDmFOI+9ysVURDgjT97ohVF32n7mFAZBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRjQSQ/EeCSWsRoowL3YC8MQRvlDFprX2Uj4vF8eJQJFokUYng
	lD3Pa0BxefDvXTt8KCT3+VKXqOc3ER0h4saswA1xBsD+Z+N7vv1H4t908Otp
X-Gm-Gg: ASbGncuWDvuBaUxIlnb7/Rt8VFrKidT/pPg2tjSeEgL4U6/SWxhdL8GdnTFfNpDUzJ2
	3B2JDTTEhRI6+UeV6v6KTSxTvgTu9x35NoTK5cT57SMDwAtne/y33VYRY0gAWrSQQroy0rBWUmx
	z3GoLdAfv5JrLpnukhbzF3tDa+W1ohocOBgO/5fZDLaV/hdxKmXJU6++5A3b0DOyC3LpTnjH0bL
	2cXMbObZcKUuFQKQ1a6zeTvZNg+V8fKMNw+4AwTM1Up9ERWJpGIDMzwu/T1Ki7PraJZNxy6udYK
	ouuV+Z/cgcwMJGcWoNGalkOWoJ2AXdCVyz0aUwB+uH71MZgikobQ+x7fnyNxy3dQJmvzYzeAxTQ
	WZ7aZHTu/qylSetnavw==
X-Google-Smtp-Source: AGHT+IEWJHet3jzSqfsYomn3epBgFkv2ahaQ4FanqidXEYsD92KDrjzOZLkf+3nKQEWVxoTbDqlTuQ==
X-Received: by 2002:a05:620a:4706:b0:7c9:2425:a7ae with SMTP id af79cd13be357-7cd011031ccmr2307806485a.29.1747047925675;
        Mon, 12 May 2025 04:05:25 -0700 (PDT)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd00f4d77esm539046385a.6.2025.05.12.04.05.25
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 04:05:25 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c5a88b34a6so476088385a.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 04:05:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbORpDV5K6qwlJgh8Gf1gqZQfX6Io4vXFzDjGWh3n6+Yea4r3U4EkpX56+4ZLP3xdD03eGA/AfzmWAEA==@lists.infradead.org
X-Received: by 2002:a05:620a:2442:b0:7c5:9a1b:4f22 with SMTP id
 af79cd13be357-7cd0114d020mr1937195185a.56.1747047925157; Mon, 12 May 2025
 04:05:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-sapling-exhale-72815a023ac1@spud> <20250509-dwindle-remold-98b3d03d0631@spud>
 <CAMuHMdVWznEm4Kg-MvgCT5+cBtdwGi9YrzFK6mBaoPJ+VK8S+Q@mail.gmail.com>
 <20250512-disaster-plaster-9dc63205cd6e@spud> <CA+V-a8sJUsNsF+AT1v3ySLiH9RGwDukMHHOC44JuV4JE3YKEpg@mail.gmail.com>
In-Reply-To: <CA+V-a8sJUsNsF+AT1v3ySLiH9RGwDukMHHOC44JuV4JE3YKEpg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 May 2025 13:05:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWcfH7RfYnX+1vx6zFo83oGAW25kSAH0fW8Nb_LQ4PV_w@mail.gmail.com>
X-Gm-Features: AX0GCFuhtlyY3Eqn_kBtywHJQj93m0KzA5ewFZiyxbSIYATMgySwwco2EFgn4Dw
Message-ID: <CAMuHMdWcfH7RfYnX+1vx6zFo83oGAW25kSAH0fW8Nb_LQ4PV_w@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: cache: add specific RZ/Five
 compatible to ax45mp
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Ben Zong-You Xie <ben717@andestech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_040527_524275_450E34C5 
X-CRM114-Status: GOOD (  28.59  )
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

T24gTW9uLCAxMiBNYXkgMjAyNSBhdCAxMjowNSwgTGFkLCBQcmFiaGFrYXIgPHByYWJoYWthci5j
c2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPiBPbiBNb24sIE1heSAxMiwgMjAyNSBhdCAxMDo1OeKA
r0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiBPbiBNb24sIE1h
eSAxMiwgMjAyNSBhdCAxMTowMToyNkFNICswMjAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6
Cj4gPiA+IE9uIEZyaSwgOSBNYXkgMjAyNSBhdCAxNzozOSwgQ29ub3IgRG9vbGV5IDxjb25vckBr
ZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xl
eUBtaWNyb2NoaXAuY29tPgo+ID4gPiA+Cj4gPiA+ID4gV2hlbiB0aGUgYmluZGluZyB3YXMgb3Jp
Z2luYWxseSB3cml0dGVuLCBpdCB3YXMgYXNzdW1lZCB0aGF0IGFsbAo+ID4gPiA+IGF4NDVtcC1j
YWNoZXMgaGFkIHRoZSBzYW1lIHByb3BlcnRpZXMgZXRjLiBUaGlzIGhhcyB0dXJuZWQgb3V0IHRv
IGJlCj4gPiA+ID4gaW5jb3JyZWN0LCBhcyB0aGUgUWlMYWkgU29DIGhhcyBhIGRpZmZlcmVudCBu
dW1iZXIgb2YgY2FjaGUtc2V0cy4KPiA+ID4gPgo+ID4gPiA+IEFkZCBhIHNwZWNpZmljIGNvbXBh
dGlibGUgZm9yIHRoZSBSWi9GaXZlIGZvciBwcm9wZXJ0eSBlbmZvcmNlbWVudCBhbmQKPiA+ID4g
PiBpbiBjYXNlIHRoZXJlIHR1cm5zIG91dCB0byBiZSBhZGRpdGlvbmFsIGRpZmZlcmVuY2VzIGJl
dHdlZW4gdGhlc2UKPiA+ID4gPiBpbXBsZW1lbnRhdGlvbnMgb2YgdGhlIGNhY2hlIGNvbnRyb2xs
ZXIuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRv
b2xleUBtaWNyb2NoaXAuY29tPgo+ID4gPgo+ID4gPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCj4g
PiA+Cj4gPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2NhY2hl
L2FuZGVzdGVjaCxheDQ1bXAtY2FjaGUueWFtbAo+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9jYWNoZS9hbmRlc3RlY2gsYXg0NW1wLWNhY2hlLnlhbWwKPiA+
ID4gPiBAQCAtMjgsNiArMjgsNyBAQCBzZWxlY3Q6Cj4gPiA+ID4gIHByb3BlcnRpZXM6Cj4gPiA+
ID4gICAgY29tcGF0aWJsZToKPiA+ID4gPiAgICAgIGl0ZW1zOgo+ID4gPiA+ICsgICAgICAtIGNv
bnN0OiByZW5lc2FzLHI5YTA3ZzA0M2YtY2FjaGUKPiA+ID4KPiA+ID4gVGhpcyBuYW1lIGxvb2tz
IGEgYml0IHRvbyBnZW5lcmljIHRvIG1lLCBhcyB0aGlzIGlzIG5vdCBhIGdlbmVyaWMKPiA+ID4g
Y2FjaGUgb24gdGhlIFI5QTA3RzA0M0YgU29DLCBidXQgc3BlY2lmaWMgdG8gdGhlIENQVSBjb3Jl
cy4KPiA+Cj4gPiBTbyAicmVuZWFzYXMscjkuLi4tY3B1LWNhY2hlIj8KPgo+IE1heWJlICJyZW5l
c2FzLHI5YTA3ZzA0M2YtcmlzY3YtY2FjaGUiID8KCiJyZW5lc2FzLHI5YTA3ZzA0M2YtYXg0NW1w
LWNhY2hlIj8KClRoZXJlIGRvbid0IHNlZW0gdG8gYmUgbWFueSB2ZW5kb3Itc3BlY2lmaWMgZGVy
aXZhdGl2ZXMgb2Ygc3RhbmRhcmRpemVkCmNhY2hlcywgZXhjZXB0IGZvciAiYnJjbSxiY20xMTM1
MS1hMi1wbDMxMC1jYWNoZSIuCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAg
ICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBM
aW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29u
dmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIu
IEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1t
ZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
