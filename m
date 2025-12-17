Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF60D64083
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Dec 2025 07:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QrMyywnxewLMLNRPkJs8fV5zSVDcP9f/ziuQPEawac8=; b=rMXStBZXc/VRiF
	MgUh/BmqVRlYp+QdfY4LhinLgtiDZNX2yJ3spQ1vCuh6Y1YZuirQ0jFx5jUTetWDzDcbF2SYkt7Oq
	Ysiuaca3Zepvh8DbAygttfrbvNJIF3O1X7EcZ7F0+KBNsNZPcAtf/SN37t9R+3dTy2gvWKVqHwxWZ
	FErf5kORNYNRQvrn5aMGpMFswS1QAy46jolMXsYSLY04ey42lamfRIok/Bko1mHGnEUDQpsHOcH72
	mcxixVKgNB0OqhkuLsEF+xJ316H+JiNAc/tb8fyp8y7d1vCzwoambueH4UIVq+GWzTipEWhIdokIw
	E6xkqE8HTuXM6OmBvSuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVlhk-00000006HIS-31vR;
	Wed, 17 Dec 2025 07:12:12 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVlhf-00000006HHz-3iOz
	for linux-riscv@lists.infradead.org;
	Wed, 17 Dec 2025 07:12:11 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-6420c08f886so6482580d50.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 23:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765955526; x=1766560326; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmFJSxesbxFHQ7/q1IylIXrQEr0i3Tqtt2nX92DzZ7M=;
        b=KYOZ9e9SZgG7zrEqyI/Ju+BD3YRX7u6i6EYesKqVdoX9bWmy/JpW2hZhqnfOSnxaCQ
         PxP8cfap0q0nnIUzDepuFAOOrVXaMf4wmAD0UmB/69ZzhoimIsW5NmWjOVy4E7X+cv9A
         JFE5+Ic1A+MkLeeFdU3vYzDiJAX/JVund+wCl4VbSMAz89N0f7DjRjqZU97LtBVVtXwJ
         2vwHPmyLXmMN3Cba1313ZdClu0LX1SddV26eP1Z7aDzX4NDyD3GXXImqN9tMeUTZBItE
         N8/R7VhC1nH/S/sG165e4rMjbXTV1LYPt3rrUaGrSqCH7Jl3ECrcwxHnkA0ZOmfgo6BH
         0lbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765955526; x=1766560326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PmFJSxesbxFHQ7/q1IylIXrQEr0i3Tqtt2nX92DzZ7M=;
        b=eloZQtrHIcqAfPehOM25uGuIxGgtw+pArxtiAD9q2BeLMiAYw8pqoNdad7KwgbxV7f
         V5D6iGlQz969hrBglRs/eseNXdieAeYYJEg00VS3LiaFlKDva0xt5Tdn5aF1MMwPmBAc
         jLCa7DXQeg89e1g3UGalyctaf3n1Qcz/7FcwC4y6WFMeSuPkvIhWiCvOaoNSODL5sK91
         dywc0ajimzCbfByk7kEFRY3/C05QVhFWmoeYO0f46uvHHLg0TmGtO29fe3Y3bVDJei2Z
         D2d/3nT2iFbY9u+dOHpJR1ev/qqjxCCFhOpZREtuib4I53sHGONZWuocXklv8UYHU1f2
         lN6g==
X-Forwarded-Encrypted: i=1; AJvYcCUjwjbRpjsajm4iCrWrf68XdCCNhZZzbpqk6fWmJ1ouC4+ghmAg32b6vueqXwor/2bihTdnOc48E4fSrQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8bh4xrCyeJW/mOeSiLTy1p+gx2fye8p/ID9A+4W6bpRcDwAdT
	zcsd+JWGNPa7SAnmw3+RqdOfsy9acm8eqRaCywo3L3yrxMcoVTQTgy5HD6WW1bjgdrjRI/6FkHy
	phYGF13T5eJ/tii7b1UJhCeitmTO8RjEgUK3pVAVKiQ==
X-Gm-Gg: AY/fxX6DbD5vsKxv0vlHbyXfpYrXuBPJ7JhLPyB+CJt9GHrvgZ9+o9WxUm6yNSGsQyD
	mI2Y4AN5LgbiBwvvJJvidmoYZieJCO2TZjOVUynvkf6cFk0HZmMgfewi02WvhjmSQeXeo9detTF
	de0AmWX4i54EEQrUZOzfLIpieAz+NuyYPdkWZohkB1O2f3b3nfEFhz/pelGQkHMky4blkKX76s2
	ljbc9KkP60BqEdlG5cvoK6oABRNp1orOOlM5W+0sDKy7OSbrrvTQFvSbG9K5P+Z6pR9M2yCXxEH
	ZdWfvM6wFNph2Ld437JoN/mL6xcaFQukEcRKKo1ISJ4q
X-Google-Smtp-Source: AGHT+IE8huFPmjeqVhigRS72exyW6RWye/SjaHiK5d2+xtE4vBR2EQkcVlmt5N9wvdRb4rljR0aa/NY7v8SaaR90Wtc=
X-Received: by 2002:a05:690e:1910:b0:644:3850:9062 with SMTP id
 956f58d0204a3-64555668019mr13876808d50.72.1765955526563; Tue, 16 Dec 2025
 23:12:06 -0800 (PST)
MIME-Version: 1.0
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-7-a0d256c9dc92@riscstar.com> <60948ca2-ed3d-485b-9b11-15df7ef8791d@canonical.com>
In-Reply-To: <60948ca2-ed3d-485b-9b11-15df7ef8791d@canonical.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 17 Dec 2025 15:11:55 +0800
X-Gm-Features: AQt7F2qskcnlJTlmY9mkZsjM35ekor5-LiDipt_O0jT58J0Q0vF7KdDCyFPY_3o
Message-ID: <CAH1PCMb=+TvB1w+G6a2ANDp05HUwC4r6CFBDHXFwSmoP3Mm8xw@mail.gmail.com>
Subject: Re: [PATCH 7/8] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-serial@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_231208_244134_838BE5C3 
X-CRM114-Status: GOOD (  25.40  )
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

T24gVHVlLCBEZWMgMTYsIDIwMjUgYXQgMTA6MjTigK9QTSBIZWlucmljaCBTY2h1Y2hhcmR0Cjxo
ZWlucmljaC5zY2h1Y2hhcmR0QGNhbm9uaWNhbC5jb20+IHdyb3RlOgo+Cj4gT24gMTIvMTYvMjUg
MTQ6MzIsIEd1b2RvbmcgWHUgd3JvdGU6Cj4gPiBTcGFjZW1pVCBLMyBpcyBlcXVpcHBlZCB3aXRo
IDggWDEwMCBjb3Jlcywgd2hpY2ggYXJlIFJWQTIzIGNvbXBsaWFudC4KPiA+IEFkZCBub2RlcyBv
ZiB1YXJ0cywgdGltZXIgYW5kIGludGVycnVwdC1jb250cm9sbGVycy4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBHdW9kb25nIFh1IDxndW9kb25nQHJpc2NzdGFyLmNvbT4KPiA+IC0tLQo+ID4gICBh
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2szLmR0c2kgfCA1MjkgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDUyOSBpbnNlcnRpb25z
KCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazMu
ZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazMuZHRzaQo+ID4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAuLmNiMjdiNzkwNzE2ZmRkNmRjMmJjODljMjhkZDI1ODhhNTk2YTVhZjkKPiA+IC0tLSAv
ZGV2L251bGwKPiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazMuZHRzaQo+
ID4gQEAgLTAsMCArMSw1MjkgQEAKPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQ
TC0yLjAgT1IgTUlUKQo+ID4gKy8qCj4gPiArICogQ29weXJpZ2h0IChjKSAyMDI1IFNwYWNlbWlU
IChIYW5nemhvdSkgVGVjaG5vbG9neSBDby4gTHRkCj4gPiArICogQ29weXJpZ2h0IChjKSAyMDI1
IEd1b2RvbmcgWHUgPGd1b2RvbmdAcmlzY3N0YXIuY29tPgo+ID4gKyAqLwo+ID4gKwo+ID4gKyNp
bmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9pcnEuaD4KPiA+ICsKPiA+
ICsvZHRzLXYxLzsKPiA+ICsKPiA+ICsvIHsKPiA+ICsgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+
Owo+ID4gKyAgICAgI3NpemUtY2VsbHMgPSA8Mj47Cj4gPiArICAgICBtb2RlbCA9ICJTcGFjZW1p
VCBLMyI7Cj4gPiArICAgICBjb21wYXRpYmxlID0gInNwYWNlbWl0LGszIjsKPiA+ICsKPiA+ICsg
ICAgIGFsaWFzZXMgewo+ID4gKyAgICAgICAgICAgICBzZXJpYWwwID0gJnVhcnQwOwo+ID4gKyAg
ICAgICAgICAgICBzZXJpYWwyID0gJnVhcnQyOwo+ID4gKyAgICAgICAgICAgICBzZXJpYWwzID0g
JnVhcnQzOwo+ID4gKyAgICAgICAgICAgICBzZXJpYWw0ID0gJnVhcnQ0Owo+ID4gKyAgICAgICAg
ICAgICBzZXJpYWw1ID0gJnVhcnQ1Owo+ID4gKyAgICAgICAgICAgICBzZXJpYWw2ID0gJnVhcnQ2
Owo+ID4gKyAgICAgICAgICAgICBzZXJpYWw3ID0gJnVhcnQ3Owo+ID4gKyAgICAgICAgICAgICBz
ZXJpYWw4ID0gJnVhcnQ4Owo+ID4gKyAgICAgICAgICAgICBzZXJpYWw5ID0gJnVhcnQ5Owo+ID4g
KyAgICAgICAgICAgICBzZXJpYWwxMCA9ICZ1YXJ0MTA7Cj4gPiArICAgICB9Owo+ID4gKwo+ID4g
KyAgICAgY3B1czogY3B1cyB7Cj4gPiArICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+
Owo+ID4gKyAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKPiA+ICsgICAgICAgICAgICAg
dGltZWJhc2UtZnJlcXVlbmN5ID0gPDI0MDAwMDAwPjsKPiA+ICsKPiA+ICsgICAgICAgICAgICAg
Y3B1XzA6IGNwdUAwIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNw
YWNlbWl0LHgxMDAiLCAicmlzY3YiOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGRldmljZV90
eXBlID0gImNwdSI7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDA+Owo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIHJpc2N2LGlzYS1iYXNlID0gInJ2NjRpIjsKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICByaXNjdixpc2EtZXh0ZW5zaW9ucyA9ICJpIiwgIm0iLCAiYSIsICJmIiwg
ImQiLCAiYyIsICJ2IiwgImgiLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgInNtYWlhIiwgInNtc3RhdGVlbiIsICJzc2FpYSIsICJzc2NvZnBtZiIsCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAic3NucG0iLCAi
c3N0YyIsICJzdmFkZSIsICJzdmludmFsIiwgInN2bmFwb3QiLAo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInN2cGJtdCIsICJ6YXdycyIsICJ6YmEiLCAi
emJiIiwgInpiYyIsICJ6YnMiLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgInpjYSIsICJ6Y2IiLCAiemNkIiwgInpjbW9wIiwgInpmYSIsICJ6ZmJmbWlu
IiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ6Zmgi
LCAiemZobWluIiwgInppY2JvbSIsICJ6aWNib3AiLCAiemljYm96IiwKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ6aWNudHIiLCAiemljb25kIiwgInpp
Y3NyIiwgInppZmVuY2VpIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICJ6aWhpbnRudGwiLCAiemloaW50cGF1c2UiLCAiemlocG0iLCAiemltb3AiLAo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInprdCIsICJ6
dmJiIiwgInp2YmMiLCAienZmYmZtaW4iLCAienZmYmZ3bWEiLAo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInp2ZmgiLCAienZmaG1pbiIsICJ6dmtiIiwg
Inp2a2ciLCAienZrbiIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAienZrbmMiLCAienZrbmVkIiwgInp2a25nIiwgInp2a25oYSIsCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAienZrbmhiIiwgInp2a3MiLCAi
enZrc2MiLCAienZrc2VkIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICJ6dmtzZyIsICJ6dmtzaCIsICJ6dmt0IjsKPgo+IFRoaXMgbm90IHRoZSBkZXNj
cmlwdGlvbiBvZiBhbiBSVkEyM1M2NCBjcHUuIEl0IGlzIG5vdCBldmVuIFJWQTIzVTY0LAo+IGUu
Zy4gYHN1cG1gIGlzIG1pc3NpbmcuCj4KPiBJcyB0aGUgZGVzY3JpcHRpb24gaW5jb21wbGV0ZSBv
ciBpcyB0aGUgQ1BVIG5vdCBjb21wbGlhbnQ/CgpIaSBIZWlucmljaCwKClRoZSBTcGFjZW1pVCBL
MyBzdXBwb3J0cyB0aGUgbWFuZGF0b3J5IGV4dGVuc2lvbnMgZGVmaW5lZCBpbiB0aGUgUlZBMjMK
UHJvZmlsZSAocmF0aWZpZWQgT2N0IDIwMjQpLiBUaGUgbGlzdCBhcHBlYXJzIGluY29tcGxldGUg
aGVyZSBvbmx5IGJlY2F1c2UKSSBhbSByZXN0cmljdGluZyB0aGUgZW50cmllcyB0byB0aG9zZSBj
dXJyZW50bHkgc3VwcG9ydGVkIGJ5IHRoZSBMaW51eAprZXJuZWwgRGV2aWNlIFRyZWUgYmluZGlu
Z3MuCgpTcGVjaWZpY2FsbHksIEkgbXVzdCBhZGhlcmUgdG8KRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCAoYW5kIGNwdXMueWFtbCBmb3IKcHJv
cGVydGllcyBsaWtlICdyaXNjdixzdjM5JyB3aGljaCBzdGFuZHMgZm9yIHRoZSBleHRlbnNpb24g
U3YzOSkuIElmIEkKYWRkIGV4dGVuc2lvbiBzdHJpbmdzIHRoYXQgYXJlIG5vdCB5ZXQgZGVmaW5l
ZCBpbiB0aGVzZSBzY2hlbWFzLCBzdWNoIGFzCnN1cG0sIHJ1bm5pbmcgJ21ha2UgZHRic19jaGVj
ayBXPTMnIGZhaWxzIHdpdGg6ICdzdXBtJyBpcyBub3Qgb25lIG9mClsnaScsICdtJywgJ2EnLCAu
Li5dLCBmb2xsb3dlZCBieSAiVW5ldmFsdWF0ZWQgcHJvcGVydGllcyBhcmUgbm90IGFsbG93ZWQu
IgoKQW5vdGhlciBhbmdsZSwgSSBmb3VuZCB0aGVyZSBhcmUgb3RoZXIgcmVhc29ucyB3aHkgTGlu
dXgga2VybmVsIGNob3NlIHRvCidvbWl0JyBzb21lIHNwZWNpZmljIGV4dGVuc2lvbiBzdHJpbmdz
LiBGb3IgZXhhbXBsZSwgaGVyZSBhcmUgd2hhdCBJIG5vdGljZWQKc28gZmFyLCBpbmNsdWRpbmcg
dGhlICdzdXBtJyB5b3UgbWVudGlvbmVkOgoKc3VwbTogVGhlcmUgaXMgbm8gYmluZGluZyBzdHJp
bmcgZm9yIHRoaXMgeWV0LiBIb3dldmVyLCBpbiB0aGUga2VybmVsIGNvbmZpZwoocmVmZXIgdG8g
YXJjaC9yaXNjdi9LY29uZmlnKSwgUklTQ1ZfSVNBX1NVUE0gZGVwZW5kcyBvbiB0aGUgZGV0ZWN0
aW9uIG9mIHRoZQp1bmRlcmx5aW5nICdzbW5wbScgb3IgJ3NzbnBtJyBoYXJkd2FyZSBleHRlbnNp
b25zLiBTaW5jZSAnc3NucG0nIGlzCnByZXNlbnQgaW4gbXkgbGlzdCwgaXQgY2FuIGJlIGNvbnNp
ZGVyZWQgYXMgc3VwcG9ydGVkIGFuZCB0aGUga2VybmVsCndpbGwgZW5hYmxlIHBvaW50ZXIgbWFz
a2luZyBzdXBwb3J0IGF1dG9tYXRpY2FsbHkuCgpPdGhlciBleGFtcGxlczoKc3NzdGF0ZWVuOiBU
aGUga2VybmVsIHNjaGVtYSBjdXJyZW50bHkgdXNlcyB0aGUgc21zdGF0ZWVuIHN0cmluZyB0bwpj
b3ZlciBDU1IgYWNjZXNzIGNvbnRyb2wgaW4gYWxsIG1vZGVzIChIL1MvVlMvVS9WVSkuIEkgaGF2
ZSBpbmNsdWRlZAonc21zdGF0ZWVuJyB0byBzYXRpc2Z5IHRoaXMsIGFzIHRoZXJlIGlzIG5vIHNl
cGFyYXRlICdzc3N0YXRlZW4nIGJpbmRpbmcKaW4gdGhlIGV4dGVuc2lvbnMueWFtbC4KCnppY2Np
ZjogVGhpcyBleHRlbnNpb24gaXMgYWxzbyBhYnNlbnQgZnJvbSB0aGUgYmluZGluZ3MsIGRlc3Bp
dGUgYmVpbmcKaW1wbGllZCBieSBmdHJhY2UgZHluYW1pYyBjb2RlIHdvcmsuIFJlZmVyZW5jZToK
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwNDA3MTgwODM4LjQyODc3LTEyLWFuZHli
bmFjQGdtYWlsLmNvbS8KSSBpbnRlbmQgdG8gc3VibWl0IGEgc2VwYXJhdGUgcGF0Y2ggc2VyaWVz
IHRvIGZvcm1hbGx5IGFkZCB6aWNjaWYgdG8KZXh0ZW5zaW9ucy55YW1sLgoKQW55d2F5LCBJIGhh
dmUgbGltaXRlZCB0aGUgeDEwMCByaXNjdixpc2EtZXh0ZW5zaW9ucyBsaXN0IHRvIHN0cmljdGx5
CnZhbGlkYXRlIGFnYWluc3QgdGhlIGN1cnJlbnQga2VybmVsIHNjaGVtYSB3aGlsZSBleHBvc2lu
ZyBhbGwgZmVhdHVyZXMKdGhlIGtlcm5lbCBpcyBjdXJyZW50bHkgY2FwYWJsZSBvZiBwYXJzaW5n
LgoKSSBob3BlIHRoaXMgZXhwbGFuYXRpb24gY2xhcmlmaWVzIHRoZSBzaXR1YXRpb24uIFBsZWFz
ZSBsZXQgbWUga25vdyBpZiB5b3UKYWdyZWUgd2l0aCB0aGlzIGFwcHJvYWNoLgoKQmVzdCBSZWdh
cmRzLApHdW9kb25nIFh1Cgo+Cj4gQmVzdCByZWdhcmRzCj4KPiBIZWlucmljaAo+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
