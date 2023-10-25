Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0121C0032E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 09:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9djPQJRwc0ysl4jaAK6sEcsfKJx5XjzSJeOjs/ZS3pE=; b=eqxfMUo77/Z8p2
	b6AsZW6TjY+lAVxh7q4E/aNK/K9jrRuz58EbbSKIF44JLm0RuNKswLM8dZ79cnL8HGOQy17mQH7Dl
	/X6szwPUsd1a5ghCm4huCx2P4jMOSgfNNwbV9aOnU/XkfnwDLVkT0LtnC4MZbZcvlFq/IDA2WdyuQ
	ZbgXvBJjIQAtdtq0kxQanmp84fv6+i6Ax8DY+02aLeB0ytBH4BoT/iulnSMuR0QiEcNJZG2Izgjvb
	qJt6hVANce640Rl84oJDVgFVnXLbouxbId+sMOlof8VgIOC9erPYuotU+mCqGOgxSRzvTvkoekhGL
	wAt01hQSr29FEjxSj49A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvaFi-00BpJU-0o;
	Wed, 25 Oct 2023 09:32:38 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvaFf-00BpI4-10
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 09:32:37 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-58410ce2f02so2184966eaf.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 02:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698226353; x=1698831153; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JleXfSUkp+S9wegLsWLcm92sHQy5rJ9h3rjZTaRBvnc=;
        b=cfqD3IvaWP52p0UqX6XxTtl4G37XHKBURQktKc1wfh8COzfcrz7pntpjFpH3sNju1u
         Gpy4e0Hi7A0C0zrNA5RoHS4xJdide6b29BfyH956KVv+6sW17irceV/Ukcy2v2pMPiAK
         gxLUOD47vN53GTdlljUv2HULMkVOfcI6xLbqw+8Zb0o2qpDTEUS5R37EjTqcrxgz/XKf
         /s1yrohlT8BfXIUDmc3frbt54XD1w4AcG78i6BfwtwxgukW2QsisazDl6ZnSgefAGYSP
         Yxno2Pro42VsBsTqYuQUX/Zh54IjksXXy+ltVzjWISaFkPRm+17+yvGeFYKKVk/Y1U8c
         xHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698226353; x=1698831153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JleXfSUkp+S9wegLsWLcm92sHQy5rJ9h3rjZTaRBvnc=;
        b=MEkjOaxBoJqz38I06hAdkfGWe23d4l2i185ud8MiTwKufQe7JyqDbrd6RpMvVTkQaM
         aS0Lire/2pbmjGaN0/0tZxSKAgAWOzQHb+MjTKl1I1CoMLINGiaWo41vJ7pkDkfAZMdp
         aTDAj4IO/QrSmN6V+6TIKsGCd09BuM0y3c4nRM5+5/JElQicBiMZ2AIioQEuFkxUa6sW
         aWnur2ZknzFQHdSozpQrqmAtTcv8pV2o88zseV2h1uDjY7SwPKIkMhmPG//7Zusc41v3
         m16wFKaIro4T1otAjSQ6ZinEQ1LZu8lA5I+ptElg+Nk38lM6IL7sVe/IwsNYy7rOQioN
         oYmw==
X-Gm-Message-State: AOJu0Yy6VocoC+BoYK+rAEFbO4aQ/rsrXqzB9fDyryn0o+lR1/C1SVyK
	S60MdWG1cwuHJqj/myZGQ8bOk1kTk8OuKbX5uIIzrA==
X-Google-Smtp-Source: AGHT+IGZxk2jV1lHWX15BuUJIJfzVkgZuAvuKKi7ENF8WnTrOGFD3ImZuACpY6oAzEWaSNmuZvMv8h2OzLOxHAoarhE=
X-Received: by 2002:a05:6870:1250:b0:1ea:fca:8ca2 with SMTP id
 16-20020a056870125000b001ea0fca8ca2mr12157627oao.56.1698226353289; Wed, 25
 Oct 2023 02:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <20231024101902.6689-1-nylon.chen@sifive.com> <20231024101902.6689-2-nylon.chen@sifive.com>
 <20231024-yin-coliseum-11f5e06fec14@spud>
In-Reply-To: <20231024-yin-coliseum-11f5e06fec14@spud>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Wed, 25 Oct 2023 17:32:21 +0800
Message-ID: <CAHh=Yk_h_1r7ZG+yLK=SoK9AgPkestuQDH-CK621mz=X-PA+cQ@mail.gmail.com>
Subject: Re: [v5 1/2] riscv: dts: sifive: unleashed/unmatched: Remove PWM
 controlled LED's active-low properties
To: Conor Dooley <conor@kernel.org>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, 
	emil.renner.berthing@canonical.com, vincent.chen@sifive.com, 
	greentime.hu@sifive.com, zong.li@sifive.com, nylon7717@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_023235_425825_1CC45B9C 
X-CRM114-Status: GOOD (  21.45  )
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

SGkgQ29ub3IsCgpDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IOaWvCAyMDIz5bm0MTDm
nIgyNOaXpSDpgLHkuowg5LiL5Y2IMTA6NTXlr6vpgZPvvJoKPgo+IEhleSwKPgo+IE9uIFR1ZSwg
T2N0IDI0LCAyMDIzIGF0IDA2OjE5OjAxUE0gKzA4MDAsIE55bG9uIENoZW4gd3JvdGU6Cj4gPiBU
aGlzIHJlbW92ZXMgdGhlIGFjdGl2ZS1sb3cgcHJvcGVydGllcyBvZiB0aGUgUFdNLWNvbnRyb2xs
ZWQgTEVEcyBpbgo+ID4gdGhlIEhpRml2ZSBVbm1hdGNoZWQgZGV2aWNlIHRyZWUuCj4gPgo+ID4g
VGhlIHJlZmVyZW5jZSBpcyBoaWZpdmUtdW5sZWFzaGVkLWEwMC5wZGZbMF0gYW5kIGhpZml2ZS11
bm1hdGNoZWQtc2NoZW1hdGljcy12My5wZGZbMV0uCj4gPgo+ID4gTGluazogaHR0cHM6Ly9zaWZp
dmUuY2RuLnByaXNtaWMuaW8vc2lmaXZlL2M1MmE4ZTMyLTA1Y2UtNGFhZi05NWM4LTdiZjg0NTNm
ODY5OF9oaWZpdmUtdW5sZWFzaGVkLWEwMC1zY2hlbWF0aWNzLTEucGRmIFswXQo+ID4gTGluazog
aHR0cHM6Ly9zaWZpdmUuY2RuLnByaXNtaWMuaW8vc2lmaXZlLzZhMDZkNmMwLTZlNjYtNDliNS04
ZTllLWU2OGNlNzZmNDE5Ml9oaWZpdmUtdW5tYXRjaGVkLXNjaGVtYXRpY3MtdjMucGRmIFsxXQo+
Cj4gPgo+Cj4gVGhpcyBibGFuayBsaW5lIHNob3VsZCBiZSByZW1vdmVkIGlmIHRoZXJlIGlzIGEg
Zm9sbG93LXVwLgp0aGFua3MsIEkgZ290IGl0Lgo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50
IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgo+Cj4gV2hhdCBkaWQgVmluY2VudCBjb250
cmlidXRlIHRvIHRoaXMgcGF0Y2g/IEFyZSB5b3UgbWlzc2luZyBhCj4gY28tZGV2ZWxvcGVkLWJ5
IHRhZywgcGVyaGFwcz8KWWVzLCBWaW5jZW50IHdhcyB0aGUgZmlyc3QgcGVyc29uIHRvIGZpbmQg
dGhlIFBXTSBkcml2ZXIgcHJvYmxlbSwgYW5kClpvbmcgTGkgaGVscGVkIG1lIHdpdGggdGhlIHJl
bGV2YW50IHJldmlldyBpbnRlcm5hbGx5LgoKc28gaW4gdGhlIG5leHQgdmVyc2lvbiwgSSB3aWxs
IGFkZCB0aGUgY29ycmVjdCB0YWdzIGZvciB0aGVzZSB0d28gZGV2ZWxvcGVycy4KClRoYW5rIHlv
dSBhZ2FpbiBmb3IgeW91ciB0aW1lLgo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBOeWxvbiBDaGVuIDxu
eWxvbi5jaGVuQHNpZml2ZS5jb20+Cj4KPiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25v
ci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiBBY2tlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5k
b29sZXlAbWljcm9jaGlwLmNvbT4KPgo+IEkgZXhwZWN0IHRoaXMgdG8gZ28gdmlhIHRoZSBwd20g
dHJlZSBzaW5jZSB0aGlzIGlzIGdvaW5nIHRvICJicmVhayIgKGluCj4gdGhlIGxvb3Nlc3QgcG9z
c2libGUgc2Vuc2UpIGV4aXN0aW5nIHN5c3RlbXMgaWYgbWVyZ2VkIHNlcGFyYXRlbHkuCj4KPiBD
aGVlcnMsCj4gQ29ub3IuCj4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZl
L2hpZml2ZS11bmxlYXNoZWQtYTAwLmR0cyB8ICA4ICsrKystLS0tCj4gPiAgYXJjaC9yaXNjdi9i
b290L2R0cy9zaWZpdmUvaGlmaXZlLXVubWF0Y2hlZC1hMDAuZHRzIHwgMTIgKysrKy0tLS0tLS0t
Cj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5s
ZWFzaGVkLWEwMC5kdHMgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5sZWFz
aGVkLWEwMC5kdHMKPiA+IGluZGV4IDkwMGE1MDUyNmQ3Ny4uMTFlN2FjMWM1NGJiIDEwMDY0NAo+
ID4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zaWZpdmUvaGlmaXZlLXVubGVhc2hlZC1hMDAu
ZHRzCj4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5sZWFzaGVk
LWEwMC5kdHMKPiA+IEBAIC00OSw3ICs0OSw3IEBAIGxlZC1jb250cm9sbGVyIHsKPiA+ICAgICAg
ICAgICAgICAgY29tcGF0aWJsZSA9ICJwd20tbGVkcyI7Cj4gPgo+ID4gICAgICAgICAgICAgICBs
ZWQtZDEgewo+ID4gLSAgICAgICAgICAgICAgICAgICAgIHB3bXMgPSA8JnB3bTAgMCA3ODEyNTAw
IFBXTV9QT0xBUklUWV9JTlZFUlRFRD47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcHdtcyA9
IDwmcHdtMCAwIDc4MTI1MDAgMD47Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgYWN0aXZlLWxv
dzsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBjb2xvciA9IDxMRURfQ09MT1JfSURfR1JFRU4+
Owo+ID4gICAgICAgICAgICAgICAgICAgICAgIG1heC1icmlnaHRuZXNzID0gPDI1NT47Cj4gPiBA
QCAtNTcsNyArNTcsNyBAQCBsZWQtZDEgewo+ID4gICAgICAgICAgICAgICB9Owo+ID4KPiA+ICAg
ICAgICAgICAgICAgbGVkLWQyIHsKPiA+IC0gICAgICAgICAgICAgICAgICAgICBwd21zID0gPCZw
d20wIDEgNzgxMjUwMCBQV01fUE9MQVJJVFlfSU5WRVJURUQ+Owo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIHB3bXMgPSA8JnB3bTAgMSA3ODEyNTAwIDA+Owo+ID4gICAgICAgICAgICAgICAgICAg
ICAgIGFjdGl2ZS1sb3c7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgY29sb3IgPSA8TEVEX0NP
TE9SX0lEX0dSRUVOPjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBtYXgtYnJpZ2h0bmVzcyA9
IDwyNTU+Owo+ID4gQEAgLTY1LDcgKzY1LDcgQEAgbGVkLWQyIHsKPiA+ICAgICAgICAgICAgICAg
fTsKPiA+Cj4gPiAgICAgICAgICAgICAgIGxlZC1kMyB7Cj4gPiAtICAgICAgICAgICAgICAgICAg
ICAgcHdtcyA9IDwmcHdtMCAyIDc4MTI1MDAgUFdNX1BPTEFSSVRZX0lOVkVSVEVEPjsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICBwd21zID0gPCZwd20wIDIgNzgxMjUwMCAwPjsKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICBhY3RpdmUtbG93Owo+ID4gICAgICAgICAgICAgICAgICAgICAgIGNv
bG9yID0gPExFRF9DT0xPUl9JRF9HUkVFTj47Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgbWF4
LWJyaWdodG5lc3MgPSA8MjU1PjsKPiA+IEBAIC03Myw3ICs3Myw3IEBAIGxlZC1kMyB7Cj4gPiAg
ICAgICAgICAgICAgIH07Cj4gPgo+ID4gICAgICAgICAgICAgICBsZWQtZDQgewo+ID4gLSAgICAg
ICAgICAgICAgICAgICAgIHB3bXMgPSA8JnB3bTAgMyA3ODEyNTAwIFBXTV9QT0xBUklUWV9JTlZF
UlRFRD47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcHdtcyA9IDwmcHdtMCAzIDc4MTI1MDAg
MD47Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgYWN0aXZlLWxvdzsKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICBjb2xvciA9IDxMRURfQ09MT1JfSURfR1JFRU4+Owo+ID4gICAgICAgICAgICAg
ICAgICAgICAgIG1heC1icmlnaHRuZXNzID0gPDI1NT47Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9ib290L2R0cy9zaWZpdmUvaGlmaXZlLXVubWF0Y2hlZC1hMDAuZHRzIGIvYXJjaC9yaXNj
di9ib290L2R0cy9zaWZpdmUvaGlmaXZlLXVubWF0Y2hlZC1hMDAuZHRzCj4gPiBpbmRleCAwNzM4
N2Y5YzEzNWMuLmIzMjhlZTgwNjkzZiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9k
dHMvc2lmaXZlL2hpZml2ZS11bm1hdGNoZWQtYTAwLmR0cwo+ID4gKysrIGIvYXJjaC9yaXNjdi9i
b290L2R0cy9zaWZpdmUvaGlmaXZlLXVubWF0Y2hlZC1hMDAuZHRzCj4gPiBAQCAtNTEsOCArNTEs
NyBAQCBsZWQtY29udHJvbGxlci0xIHsKPiA+ICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJw
d20tbGVkcyI7Cj4gPgo+ID4gICAgICAgICAgICAgICBsZWQtZDEyIHsKPiA+IC0gICAgICAgICAg
ICAgICAgICAgICBwd21zID0gPCZwd20wIDAgNzgxMjUwMCBQV01fUE9MQVJJVFlfSU5WRVJURUQ+
Owo+ID4gLSAgICAgICAgICAgICAgICAgICAgIGFjdGl2ZS1sb3c7Cj4gPiArICAgICAgICAgICAg
ICAgICAgICAgcHdtcyA9IDwmcHdtMCAwIDc4MTI1MDAgMD47Cj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgY29sb3IgPSA8TEVEX0NPTE9SX0lEX0dSRUVOPjsKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICBtYXgtYnJpZ2h0bmVzcyA9IDwyNTU+Owo+ID4gICAgICAgICAgICAgICAgICAgICAgIGxh
YmVsID0gImQxMiI7Cj4gPiBAQCAtNjgsMjAgKzY3LDE3IEBAIG11bHRpLWxlZCB7Cj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgbGFiZWwgPSAiZDIiOwo+ID4KPiA+ICAgICAgICAgICAgICAgICAg
ICAgICBsZWQtcmVkIHsKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHB3bXMgPSA8
JnB3bTAgMiA3ODEyNTAwIFBXTV9QT0xBUklUWV9JTlZFUlRFRD47Cj4gPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBhY3RpdmUtbG93Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcHdtcyA9IDwmcHdtMCAyIDc4MTI1MDAgMD47Cj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjb2xvciA9IDxMRURfQ09MT1JfSURfUkVEPjsKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICB9Owo+ID4KPiA+ICAgICAgICAgICAgICAgICAgICAgICBsZWQtZ3JlZW4gewo+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHdtcyA9IDwmcHdtMCAxIDc4MTI1MDAgUFdN
X1BPTEFSSVRZX0lOVkVSVEVEPjsKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFj
dGl2ZS1sb3c7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwd21zID0gPCZwd20w
IDEgNzgxMjUwMCAwPjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbG9yID0g
PExFRF9DT0xPUl9JRF9HUkVFTj47Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgfTsKPiA+Cj4g
PiAgICAgICAgICAgICAgICAgICAgICAgbGVkLWJsdWUgewo+ID4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcHdtcyA9IDwmcHdtMCAzIDc4MTI1MDAgUFdNX1BPTEFSSVRZX0lOVkVSVEVE
PjsKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFjdGl2ZS1sb3c7Cj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwd21zID0gPCZwd20wIDMgNzgxMjUwMCAwPjsKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbG9yID0gPExFRF9DT0xPUl9JRF9CTFVF
PjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICB9Owo+ID4gICAgICAgICAgICAgICB9Owo+ID4g
LS0KPiA+IDIuNDIuMAo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
