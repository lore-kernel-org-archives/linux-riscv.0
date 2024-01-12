Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCE5C4706C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 14:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZlkjZy5nXeLUr1Uh0EqSq144SumYum88DEzv9FuYxw=; b=aH0F6ABfIC15vV
	ELM3FEUznHrvjOen3gLsVSGHWSmt6v7y7IuqEfTdNE2U96EQZIgvFTStFW0BBgG/m6l5wAETqXATG
	XgHepG6QxcRcnDAh34q1YaSQlUA5c251l8hP5Yz/Bp6wwW3j3rMr8KX5odadT6zOX1OeiWP6rC953
	gDabMtacRtmNAODn6dS6LkEIt20OSWrq7qXW+/fonV970EqnYGCgcygxMZSnhBWQvI8LNZkozATXl
	y8VKt7rQnmEAzbnLaFahOyk0kpVp24SQUz4RnYVOGR9hKGv2sMBpdcKj5MtkFch3pzAP/aW0naHqQ
	F5s0CF0W01y1qWAcoElA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOIti-0035LU-2Z;
	Fri, 12 Jan 2024 14:52:38 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOItf-0035J7-1U;
	Fri, 12 Jan 2024 14:52:36 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-2044d093b3fso4058236fac.3;
        Fri, 12 Jan 2024 06:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705071150; x=1705675950; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZO45YkzCWML/dfVASjM1WgREcSCHVv4YlKgRi2In5SM=;
        b=Zb6Eqay1Gu6sBylu6IG38MbXX1X9hLgoexxtYjizMaKBBda8dk6dyBOvwhkD8DL7L9
         R9p76WASGtDR7y/t8FunS4SyC4rzWj/3dncb+Ib1eEpIC7Nz3LMxvoB8MEqbltM2mzXK
         b9buiRtx4u8kbnRX/KaBsV5J167eXYrVHVGJYKKTuyWfufPU5fWEg6syi6Uf3dO85iE8
         m1VCZVh7vO2vWSFmvA7UK0PJbMMGm7txBIpEvtpK7Q76SQRaDeYltzn6smwrIAcLsDxJ
         ZVULAq6d/wHSP6ukxDmKIu/oPzd/QDWkWmy1l3r6wPbUKGDY4MQpF3pqJ61D/5piIJ8W
         y5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705071150; x=1705675950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZO45YkzCWML/dfVASjM1WgREcSCHVv4YlKgRi2In5SM=;
        b=tC+4KUdNBOgtoh5bK6ciFTqm7B0H+Sbq094oGdgJcshGeo6WhX2IoFnEX2Pj/NRhq9
         q3cpQCd1oZVsAkntwybvQi9tjXFRu5PPf24R+yq9s8QsF9pn3PGbQ9bo9UGzjcew568c
         oy2OCpvcd3IBW3RGpXsCrJQIrlZ76N7Af77uCFzIp1sV6JAyfwvVivfwd2lN4FsFqMg+
         I38n5rEkK53ezrD0OZxE+KCYZ+edY4zTw/Uendz16crdkOxIw0IjjjTVmuOuP/vvyRDL
         0bVEWTNcQin24ezADpfpWbq19q7LffuUKY44P3eQ5SKGrGXg3v7XhO0P3MqaZRkE3JIX
         uw4A==
X-Gm-Message-State: AOJu0Yxgpu3bPbbzJsOg9/Jejt86LP/hbc7Svx9ophDDQFHMcE5EQ+q/
	dQKqQGNIqAd9cYUx8KRh7zEofWLIps0L+5takqo=
X-Google-Smtp-Source: AGHT+IF3L5IPA3aINLKE1Gh2ONL1jl1iO/jiOLm/9Zoi+Tx7cZA3qsT/gQ+IN9bZafCkSYUcodRd62GQ0tiAxg2qKZk=
X-Received: by 2002:a05:6871:452:b0:206:8691:cc78 with SMTP id
 e18-20020a056871045200b002068691cc78mr1680164oag.34.1705071149757; Fri, 12
 Jan 2024 06:52:29 -0800 (PST)
MIME-Version: 1.0
References: <20240109-update-llvm-links-v1-0-eb09b59db071@kernel.org>
In-Reply-To: <20240109-update-llvm-links-v1-0-eb09b59db071@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 12 Jan 2024 09:52:17 -0500
Message-ID: <CADnq5_MVDDR-EvgSEhiw_qPkUDPnV25tjUN0SNYq45Q29BN4EQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Update LLVM Phabricator and Bugzilla links
To: Nathan Chancellor <nathan@kernel.org>
Cc: akpm@linux-foundation.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org, 
	llvm@lists.linux.dev, ast@kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, kasan-dev@googlegroups.com, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, mykolal@fb.com, 
	daniel@iogearbox.net, andrii@kernel.org, amd-gfx@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-pm@vger.kernel.org, bridge@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	patches@lists.linux.dev, linux-security-module@vger.kernel.org, 
	linux-crypto@vger.kernel.org, bpf@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_065235_497098_9FDF6B1E 
X-CRM114-Status: GOOD (  15.68  )
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

T24gVHVlLCBKYW4gOSwgMjAyNCBhdCA1OjI24oCvUE0gTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhh
bkBrZXJuZWwub3JnPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIHVwZGF0ZXMgYWxsIGluc3RhbmNl
cyBvZiBMTFZNIFBoYWJyaWNhdG9yIGFuZCBCdWd6aWxsYSBsaW5rcwo+IHRvIHBvaW50IHRvIEdp
dEh1YiBjb21taXRzIGRpcmVjdGx5IGFuZCBMTFZNJ3MgQnVnemlsbGEgdG8gR2l0SHViIGlzc3Vl
Cj4gc2hvcnRsaW5rcyByZXNwZWN0aXZlbHkuCj4KPiBJIHNwbGl0IHVwIHRoZSBQaGFicmljYXRv
ciBwYXRjaCBpbnRvIEJQRiBzZWxmdGVzdHMgYW5kIHRoZSByZXN0IG9mIHRoZQo+IGtlcm5lbCBp
biBjYXNlIHRoZSBCUEYgZm9sa3Mgd2FudCB0byB0YWtlIGl0IHNlcGFyYXRlbHkgZnJvbSB0aGUg
cmVzdCBvZgo+IHRoZSBzZXJpZXMsIHRoZXJlIGFyZSBvYnZpb3VzbHkgbm8gZGVwZW5kZW5jeSBp
c3N1ZXMgaW4gdGhhdCBjYXNlLiBUaGUKPiBCdWd6aWxsYSBjaGFuZ2Ugd2FzIG1lY2hhbmljYWwg
ZW5vdWdoIGFuZCBzaG91bGQgaGF2ZSBubyBjb25mbGljdHMuCj4KPiBJIGFtIGFpbWluZyB0aGlz
IGF0IEFuZHJldyBhbmQgQ0MnaW5nIG90aGVyIGxpc3RzLCBpbiBjYXNlIG1haW50YWluZXJzCj4g
d2FudCB0byBjaGltZSBpbiwgYnV0IEkgdGhpbmsgdGhpcyBpcyBwcmV0dHkgdW5jb250cm92ZXJz
aWFsIChmYW1vdXMKPiBsYXN0IHdvcmRzLi4uKS4KPgoKQWNrZWQtYnk6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KCj4gLS0tCj4gTmF0aGFuIENoYW5jZWxsb3IgKDMp
Ogo+ICAgICAgIHNlbGZ0ZXN0cy9icGY6IFVwZGF0ZSBMTFZNIFBoYWJyaWNhdG9yIGxpbmtzCj4g
ICAgICAgYXJjaCBhbmQgaW5jbHVkZTogVXBkYXRlIExMVk0gUGhhYnJpY2F0b3IgbGlua3MKPiAg
ICAgICB0cmVld2lkZTogVXBkYXRlIExMVk0gQnVnemlsbGEgbGlua3MKPgo+ICBhcmNoL2FybTY0
L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstLQo+ICBhcmNo
L3Bvd2VycGMvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstLQo+
ICBhcmNoL3Bvd2VycGMva3ZtL2Jvb2szc19odl9uZXN0ZWQuYyAgICAgICAgICAgICAgICB8ICAy
ICstCj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDIgKy0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJhY2UuaCAgICAgICAgICAgICAg
ICAgICAgfCAgMiArLQo+ICBhcmNoL3MzOTAvaW5jbHVkZS9hc20vZnRyYWNlLmggICAgICAgICAg
ICAgICAgICAgICB8ICAyICstCj4gIGFyY2gveDg2L3Bvd2VyL01ha2VmaWxlICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgY3J5cHRvL2JsYWtlMmJfZ2VuZXJpYy5jICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL2Zpcm13YXJlL2VmaS9saWJz
dHViL01ha2VmaWxlICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3NkbWFfdjRfNF8yLmMgICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9tZWRpYS90
ZXN0LWRyaXZlcnMvdmljb2RlYy9jb2RlYy1md2h0LmMgICAgfCAgMiArLQo+ICBkcml2ZXJzL3Jl
Z3VsYXRvci9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIGluY2x1
ZGUvYXNtLWdlbmVyaWMvdm1saW51eC5sZHMuaCAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAg
aW5jbHVkZS9saW51eC9jb21waWxlci1jbGFuZy5oICAgICAgICAgICAgICAgICAgICAgfCAgMiAr
LQo+ICBsaWIvS2NvbmZpZy5rYXNhbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAyICstCj4gIGxpYi9yYWlkNi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDIgKy0KPiAgbGliL3N0YWNraW5pdF9rdW5pdC5jICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMiArLQo+ICBtbS9zbGFiX2NvbW1vbi5jICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAyICstCj4gIG5ldC9icmlkZ2UvYnJfbXVsdGljYXN0LmMgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgc2VjdXJpdHkvS2NvbmZpZyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9icGYvUkVBRE1FLnJzdCAgICAgICAgICAgICB8IDMyICsrKysrKysrKysrLS0tLS0tLS0tLS0K
PiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Byb2dfdGVzdHMveGRwd2FsbC5jICAgfCAg
MiArLQo+ICAuLi4vc2VsZnRlc3RzL2JwZi9wcm9ncy90ZXN0X2NvcmVfcmVsb2NfdHlwZV9pZC5j
ICB8ICAyICstCj4gIDIzIGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDQwIGRlbGV0
aW9ucygtKQo+IC0tLQo+IGJhc2UtY29tbWl0OiAwZGQzZWUzMTEyNTUwOGNkNjdmN2U3MTcyMjQ3
ZjA1YjdmZDE3NTNhCj4gY2hhbmdlLWlkOiAyMDI0MDEwOS11cGRhdGUtbGx2bS1saW5rcy1kMDNm
OWQ2NDllMWUKPgo+IEJlc3QgcmVnYXJkcywKPiAtLQo+IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRo
YW5Aa2VybmVsLm9yZz4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
