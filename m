Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46114C41513
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Aug 2023 04:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:
	From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WIus5wjD2O5VoU1Hoat89Rvw1Fklj2Lu85ILUmNhymE=; b=bQEZXMWLJZpOL1
	S4lvAD3lLHrUdsV0PnP6ayXn+uhAScCZz4RTYCwVknJ1IeEe8FNYguscq7B6w9J48BZN8Z2MYBPI3
	CSa2NkOpZ07Hz0RknZ+fcvxKr61yNuolCK8FcnVmRqrFeDAhKVwASuX3xbPMeNXqxe5oXCkrrDu1c
	SOu8goRniF9x56OH7qdmuOxhFGupp0m9RJ5kQgqs82CbxyHpmjACBctwYQtBMxZBbRgvccWrAEBw0
	mtvmYncbkN+t54AGFhLD7FV/PJpzpu+4/he8RzOEMK7voEMXgk8tsiONlfAbXyKGHkPTikLCV5F8j
	HC+1Go3y7VW0oVQTBd1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qV2Xv-00ERK3-2D;
	Sun, 13 Aug 2023 04:17:43 +0000
Received: from mail-pl1-f182.google.com ([209.85.214.182])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qV2Xt-00ERJZ-0I;
	Sun, 13 Aug 2023 04:17:42 +0000
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1bdbf10333bso14462375ad.1;
        Sat, 12 Aug 2023 21:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691900260; x=1692505060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CLMyURC53hwz5v812uK/eVgyKmTJ3lphiPgO1Kd5Ijk=;
        b=SCZH+s4IjU3SjtQJtGI0UXKRsMDMqCoLEZ8ezG3NLnxNeBp8xpulPwWsOId3jI7dEL
         iRu8hJhJXzCR0oBU1RL0IMPGmaVgeKXyYtQTSsYpQi7fKb2tJYIA2NHNTZF6CEEvMK6l
         btPKZQXqqt/mkyM4EHdnyCozu2oujcG9+4infw1UukhUPHDw93vN8FA8cpwqHuql4HoX
         r+d2upgihLB9KuHudL67GhNZ+WXaejZCs+SDNTtkyTEHzTa9McLz/Geiuq/mc3bToS+r
         i2hj6EPeKKr2DAiXIWWoicMdW/wS4fTZwI+IQRwwFksfHXGlVMoL03ey8LtrQEX33nPn
         u6iA==
X-Gm-Message-State: AOJu0Yxhh2KoRt3aBmbjgeMmKa7Eja4y0zFI6C+oemgXKjW74LEor4O6
	Zuox1rhPVK7kh1/W/SVVlVdwVkD3ocF/ZA==
X-Google-Smtp-Source: AGHT+IGNM0F9h+mBiWgPSr5pD/uonORLuD4MGusRJ1IYS5cltv1nxpo8XizNJQEEQIbH0zMxhDW9CA==
X-Received: by 2002:a17:902:e5c1:b0:1b8:9b1d:9e24 with SMTP id u1-20020a170902e5c100b001b89b1d9e24mr8275792plf.22.1691900259808;
        Sat, 12 Aug 2023 21:17:39 -0700 (PDT)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com. [209.85.216.49])
        by smtp.gmail.com with ESMTPSA id a22-20020a17090acb9600b00267b7c5d232sm1654935pju.48.2023.08.12.21.17.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Aug 2023 21:17:39 -0700 (PDT)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2682e33509bso2291170a91.1;
        Sat, 12 Aug 2023 21:17:39 -0700 (PDT)
X-Received: by 2002:a17:90a:8d0c:b0:263:f8e3:5a2a with SMTP id
 c12-20020a17090a8d0c00b00263f8e35a2amr5198981pjo.36.1691900259095; Sat, 12
 Aug 2023 21:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230807191952.2019208-1-contact@jookia.org>
In-Reply-To: <20230807191952.2019208-1-contact@jookia.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 13 Aug 2023 12:17:27 +0800
X-Gmail-Original-Message-ID: <CAGb2v66vqrNZ-ga-1O_bQ16BWXH=RmSHo2Kb+WHJyw-Nm1kWVg@mail.gmail.com>
Message-ID: <CAGb2v66vqrNZ-ga-1O_bQ16BWXH=RmSHo2Kb+WHJyw-Nm1kWVg@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: dts: allwinner: d1: Add CAN controller nodes
To: John Watts <contact@jookia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230812_211741_155712_240B86E9 
X-CRM114-Status: GOOD (  21.19  )
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
Reply-To: wens@csie.org
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, linux-riscv@lists.infradead.org, Marc Kleine-Budde <mkl@pengutronix.de>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBBdWcgOCwgMjAyMyBhdCAzOjIw4oCvQU0gSm9obiBXYXR0cyA8Y29udGFjdEBqb29r
aWEub3JnPiB3cm90ZToKPgo+IFRoZSBBbGx3aW5uZXIgRDEsIFQxMTMgcHJvdmlkZSB0d28gQ0FO
IGNvbnRyb2xsZXJzIHRoYXQgYXJlIHZhcmlhbnRzCj4gb2YgdGhlIFI0MCBjb250cm9sbGVyLgo+
Cj4gSSBoYXZlIHRlc3RlZCBzdXBwb3J0IGZvciB0aGVzZSBjb250cm9sbGVycyBvbiB0d28gYm9h
cmRzOgo+Cj4gLSBBIExpY2hlZSBQYW5lbCBSViA4NiBQYW5lbCBydW5uaW5nIGEgRDEgY2hpcAo+
IC0gQSBNYW5nbyBQaSBNUSBEdWFsIHJ1bm5pbmcgYSBUMTEzLXMzIGNoaXAKPgo+IEJvdGggb2Yg
dGhlc2UgZnVsbHkgc3VwcG9ydCBib3RoIENBTiBjb250cm9sbGVycy4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEpvaG4gV2F0dHMgPGNvbnRhY3RAam9va2lhLm9yZz4KPiAtLS0KPiBDaGFuZ2VzIGluIHYz
Ogo+IC0gU2V0IGRlZmF1bHQgcGluY3RybCBmb3IgY2FuIGNvbnRyb2xsZXIKPiAtIE1vdmVkIGNh
biBub2RlcyB0byBwcm9wZXIgbG9jYXRpb24KPiAtIE1vdmVkIGNhbiBwaW5zIHRvIHByb3BlciBs
b2NhdGlvbgo+Cj4gIC4uLi9ib290L2R0cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaSAg
ICB8IDM0ICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDM0IGluc2VydGlv
bnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW54
aS1kMXMtdDExMy5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VueGktZDFz
LXQxMTMuZHRzaQo+IGluZGV4IGQ1OWI0YWNmMTgzYS4uMjRmMmU3MGQ1ODg2IDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bnhpLWQxcy10MTEzLmR0c2kKPiAr
KysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW54aS1kMXMtdDExMy5kdHNpCj4g
QEAgLTUyLDYgKzUyLDE4IEBAIHBpbzogcGluY3RybEAyMDAwMDAwIHsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAjZ3Bpby1jZWxscyA9IDwzPjsKPiAgICAgICAgICAgICAgICAgICAgICAgICAj
aW50ZXJydXB0LWNlbGxzID0gPDM+Owo+Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgL29taXQt
aWYtbm8tcmVmLwoKSnVzdCBGWUkgdGhpcyBsaWtlbHkgZW5kcyB1cCBkb2luZyBub3RoaW5nIGlm
IHlvdSBhbHNvIGhhdmUgdGhlbQpyZWZlcmVuY2VkIHRocm91Z2ggYSBkZWZhdWx0IHBpbmN0cmwg
c2V0dGluZy4gVGhleSBlbmQgdXAgYWx3YXlzCnJlZmVyZW5jZWQgYW5kIGFsd2F5cyBpbmNsdWRl
ZC4gRm9yIHRoZSBEMSBzZXJpZXMgaXQgbG9va3MgbGlrZSBubwpwZXJpcGhlcmFsIGhhcyBkZWZh
dWx0IHBpbmN0cmwgc2V0dGluZyBnaXZlbi4KCldlIGNhbiBzdGlsbCBrZWVwIGl0IHRob3VnaC4g
SXQgd291bGQgaGVscCB3aGVuIGZ1dHVyZSBjaGlwIHZhcmlhbnRzCnNwZWNpZnkgZGlmZmVyZW50
IHBpbm11eGVzLgoKPiArICAgICAgICAgICAgICAgICAgICAgICBjYW4wX3BpbnM6IGNhbjAtcGlu
cyB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwaW5zID0gIlBCMiIsICJQQjMi
Owo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZnVuY3Rpb24gPSAiY2FuMCI7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgfTsKPiArCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
L29taXQtaWYtbm8tcmVmLwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGNhbjFfcGluczogY2Fu
MS1waW5zIHsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBpbnMgPSAiUEI0Iiwg
IlBCNSI7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmdW5jdGlvbiA9ICJjYW4x
IjsKPiArICAgICAgICAgICAgICAgICAgICAgICB9Owo+ICsKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAvb21pdC1pZi1uby1yZWYvCj4gICAgICAgICAgICAgICAgICAgICAgICAgY2xrX3BnMTFf
cGluOiBjbGstcGcxMS1waW4gewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGlu
cyA9ICJQRzExIjsKPiBAQCAtMzU2LDYgKzM2OCwyOCBAQCBpMmMzOiBpMmNAMjUwMmMwMCB7Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4gICAgICAgICAgICAg
ICAgIH07Cj4KPiArICAgICAgICAgICAgICAgY2FuMDogY2FuQDI1MDQwMDAgewo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgcGluY3RybC0wID0gPCZjYW4wX3BpbnM+OwoKVGhlIGNvbXBhdGlibGUgc3Ry
aW5nIHNob3VsZCBiZSB0aGUgZmlyc3QgcHJvcGVydHkuIEluIG90aGVyIHN1bnhpIFNvQyBkdHNp
CmZpbGVzLCB3ZSBwdXQgdGhlIHBpbmN0cmwganVzdCBiZWZvcmUgdGhlICJzdGF0dXMiIHByb3Bl
cnR5IGlmIGl0J3MgcHJlc2VudAp0byBzcGVjaWZ5IGEgZGVmYXVsdCBwaW4gbXV4aW5nLgoKSSBj
YW4gZml4IGl0IHVwIHdoaWxlIGFwcGx5aW5nLgoKQ2hlbll1Cgo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjIwaS1kMS1jYW4iOwo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIHJlZyA9IDwweDAyNTA0MDAwIDB4NDAwPjsKPiArICAgICAgICAgICAg
ICAgICAgICAgICBpbnRlcnJ1cHRzID0gPFNPQ19QRVJJUEhFUkFMX0lSUSgyMSkgSVJRX1RZUEVf
TEVWRUxfSElHSD47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZjY3UgQ0xL
X0JVU19DQU4wPjsKPiArICAgICAgICAgICAgICAgICAgICAgICByZXNldHMgPSA8JmNjdSBSU1Rf
QlVTX0NBTjA+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7
Cj4gKyAgICAgICAgICAgICAgIH07Cj4gKwo+ICsgICAgICAgICAgICAgICBjYW4xOiBjYW5AMjUw
NDQwMCB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0
IjsKPiArICAgICAgICAgICAgICAgICAgICAgICBwaW5jdHJsLTAgPSA8JmNhbjFfcGlucz47Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuMjBpLWQx
LWNhbiI7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDI1MDQ0MDAgMHg0MDA+
Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8U09DX1BFUklQSEVSQUxf
SVJRKDIyKSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPiArICAgICAgICAgICAgICAgICAgICAgICBj
bG9ja3MgPSA8JmNjdSBDTEtfQlVTX0NBTjE+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJl
c2V0cyA9IDwmY2N1IFJTVF9CVVNfQ0FOMT47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgc3Rh
dHVzID0gImRpc2FibGVkIjsKPiArICAgICAgICAgICAgICAgfTsKPiArCj4gICAgICAgICAgICAg
ICAgIHN5c2Nvbjogc3lzY29uQDMwMDAwMDAgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjIwaS1kMS1zeXN0ZW0tY29udHJvbCI7Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MzAwMDAwMCAweDEwMDA+Owo+IC0tCj4gMi40MS4w
Cj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
