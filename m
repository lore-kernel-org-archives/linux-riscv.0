Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B11EC1444
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 13:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vmYJ1INqAknwne2vBdDvwCrvTeDJlFIsdOaB4tv7gSk=; b=Qw5KbQKaHpGbVu
	am3zywNlxxktx064XJSlnR72JgAoRIQADqm2TVQqaAVQ6sh4KLVL1wV+9AZArn2gxtiqlP9I1SLjS
	u3A6GVZgqZzKZKCF8mHkeTf/V+SrbHIY7Vx5NkwsN8ApAj03wkxZr+sqsdT06hHjaUhPfyq+jdt7J
	BrXAJw2l0Ad5ZjBsIcRplGjlbW2uuQHsO6LpCDmffyPEb1Uem3Ql3u1+7kl9ftXjFmNFHG0YcgT5D
	pO0LDPLz+tCF0g8SZ7OgAqSxp0/sBWYZSNIVrnjTypr/c4ui8NaSdgpU5Mq67QhfEOKl6GoeXobwK
	CQDgnXPnED3YTN3jwdiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQA1-0000000FGSz-3Dc6;
	Tue, 03 Mar 2026 13:51:41 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQ9y-0000000FGSb-2RvX
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 13:51:39 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-64ca4dfdd88so5392249d50.0
        for <linux-riscv@lists.infradead.org>; Tue, 03 Mar 2026 05:51:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772545897; cv=none;
        d=google.com; s=arc-20240605;
        b=B+y2e4gBB7eVwY3ATbTGXqTth5JtedvNiQKr0ZafMn7CVNknW7GgASnzAN2nJpI51T
         o8YHBey8wtHJmlTCt8htuwAvtqL1ZPHW0OkC1L2HU+cl63eYS3lD/S8YTEs1l7+dRXzM
         +JTttKBELz1Rq4QFyue90vs5bgCnvIwr90HWJq/A5A7Hn05UiQjfSULugx91JG59+fBr
         piiZmEViPPWvhEAxB4O6CJwxYtdCIYNSEGIpQ01qK5mS3/XyxNJvo25wsr5yC8Fj46dZ
         l3ayPmskCc+A6L62UVoSLS1qf/M01d7JiCQ2xCcnurcdcR0HuLq4vz7eReRP2Il8c+8p
         xk7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aZn4gqDyUQYxhmDFWGYkcAn3/Qr9cauEsxLXdsoN45c=;
        fh=ejZnuELMXJ8usBU6AW/uFUVZfR7//WkXROUGCHJIMcA=;
        b=K4N4SONSEVVrO+xzRNI51Uk+boOl4E1nt38d7JNVEHpNIF1rvI3oYIPuc9bPnc8aPs
         xCFxw6yRyQVQfujfKIWHx7VAYM/cRexAsPiD0+FylfCndjVl9X+lIA0WnZkH10Mx+h6/
         4u/7q/6M5yM3x5OL9mRLN4YcmNKafbDchYWu8fZailuiHd/7S5e2Bnf45L8CLakcwaLk
         xVszmJsZ2NNfYR93GQgt4+XWpk5flkKnsPZgEXtgx1sVNlCdzrRXcMa9dhg21m6LF01W
         TaTttiUTOjV4jv/PurJDde1NPpTkBIJH4oErNVhQIHDpg39WG+3yMTDwf6JsVMQxA1dV
         /kXg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772545897; x=1773150697; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZn4gqDyUQYxhmDFWGYkcAn3/Qr9cauEsxLXdsoN45c=;
        b=esdSsKXBA0/C8deQ1o+TjKONQc04PBMtvTlm2iced59E4IOJtufr5hf+2u9awuT/pX
         CWRKvGToxqp1Hgwxp0pTQwb4z7YIDB8mGcWvaQamItzxieM74c7fEOdVKhbf+e0dd5z+
         M1/dGtXho2m1yfuqSbj0CDwf+QZNJNeBxk8UPTKzBXfu2zC4ZWShfwdYkB+vvUSoyTh8
         oJRxjELutHphdH6v9UxTnlLxmoVtqTgYBZvo9a8NwI5KBGaB+jmf/UCX3G9V36XW3+Ow
         4EoF2BdDnvN3lChZAfgxZXv5EXiuoNs6G7JCPrtXycNX6OzUkvNnlO0Fz7d3SPUFKuAF
         T0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772545897; x=1773150697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aZn4gqDyUQYxhmDFWGYkcAn3/Qr9cauEsxLXdsoN45c=;
        b=f1s8BEWTnJMvvR95/XZFTfHBtMo6veMqQ4qczkdhJ8je5h/n/B5G5d/JxGcWJll2OQ
         pCGscWFqfjKxfGGim1K16stFTTYGSDC3ZjjDgdaGhO5QZz3w3UdA9xDreosdNxCXRJF9
         yBswKBXfSrm2ytznTRi0JD8mZnRjRwQ6K78YmW3eTkrACUNt5YrA97AdR2ft10TvJft4
         LW8Y7bPxURwBio7PmQBusenq2NAU1UJIao6+FLa7hpuPDs4o8Jk1S/+Kh4I5h77/JYjv
         SNsisHoThW88vBieRJJ6lh5odqSzhO2m6FuKbkL1ScnQUxXWG6TxM0NniylOx9eEQ7Ex
         FlLA==
X-Forwarded-Encrypted: i=1; AJvYcCW7o+AV+QHSOsfBkW8+2WuEhAR+qBcsQsY9KnvhpW17wDMmZETecB6xsJYhRD0+3BdAlDmLDpahlNKcMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJE3LChIJAJlkKws3EKM3xAZtfSwMu5xDlyWYLK21ZqFW7Nn4F
	l2KH8Y+traHnFiKve5xT6zd4AnjBcaG/bER0EqkNAnngR5CoqrB9CjoWTB1Vjbh4T2g3GWH1n7y
	VastcYHVigL2QYAJBjAWBdZK2qsl5NhcjKipFP5A=
X-Gm-Gg: ATEYQzzxm8M++JWR4Yd2ebOO6/SvDu1EX/NEin6H7x2Z45g92rFJl90tiryrpVp8Cly
	tkKQ5gsiqRrjsJlf5OJFM/b3I4DS438fUom7tnMiZ7xcsErad5hBkRGVD75FFSSaYxq9xrRjYiJ
	AWVFZ/GvEOWHlEb7mXQuVUqWKQM2S4FtSVk/Fl3Bv7o4d0pU1UCFH26UjvHGCj9jFx5LOzxNb93
	9c0bbvCk9hMvbfsmf59/i/5DgNXy7/tmsOCcF5lY0VQX95wvcFG+Fp/YosIlxsyUYGQIm713//2
	bI34xcUm
X-Received: by 2002:a05:690e:90:b0:649:4997:3e94 with SMTP id
 956f58d0204a3-64cc20833c8mr10119824d50.12.1772545897333; Tue, 03 Mar 2026
 05:51:37 -0800 (PST)
MIME-Version: 1.0
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
 <20260302-orangepi-sd-card-uhs-v1-1-89c219973c0c@gmail.com>
 <20260302-crewman-faster-9fd00b62e30c@spud> <20260302223803-GKB289813@kernel.org>
In-Reply-To: <20260302223803-GKB289813@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 3 Mar 2026 14:51:25 +0100
X-Gm-Features: AaiRm52NZmZiw1yUUKvM0Min02zDkPktW8qIv-Jsblu1CXoYU1NePFrvk318i6c
Message-ID: <CABdCQ=Nd9ZW6OBnAiuki=2+DhVraW19bh_m8=LLQGUKN8TkEdQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] dt-bindings: mmc: spacemit,sdhci: add AIB voltage
 switching registers
To: Yixun Lan <dlan@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@gentoo.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_055138_660960_4E45F698 
X-CRM114-Status: GOOD (  23.30  )
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

RWwgbHVuLCAyIG1hciAyMDI2IGEgbGFzIDIzOjM4LCBZaXh1biBMYW4gKDxkbGFuQGtlcm5lbC5v
cmc+KSBlc2NyaWJpw7M6Cj4KPiBIaSBJa2VyLCBDb25vciwKPgo+IE9uIDE4OjI1IE1vbiAwMiBN
YXIgICAgICwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gT24gTW9uLCBNYXIgMDIsIDIwMjYgYXQg
MDQ6MTM6MjJQTSArMDEwMCwgSWtlciBQZWRyb3NhIHdyb3RlOgo+ID4gPiBBZGQgU3BhY2VtaVQg
SzEgQUlCIHJlZ2lzdGVyIHByb3BlcnRpZXMgZm9yIFVIUyB2b2x0YWdlIHN3aXRjaGluZwo+ID4g
PiBzdXBwb3J0Ogo+ID4gPgo+ID4gPiAtIHNwYWNlbWl0LGFpYi1tbWMxLWlvLXJlZzogQUlCIE1N
QzEgSU8gcmVnaXN0ZXIgYWRkcmVzcyBmb3Igdm9sdGFnZQo+ID4gPiAgIHN3aXRjaGluZwo+ID4g
PiAtIHNwYWNlbWl0LGFwYmMtYXNmYXItcmVnOiBBUEJDIEFTRkFSIHJlZ2lzdGVyIGFkZHJlc3Mg
Zm9yIEFJQiBhY2Nlc3MKPiA+ID4gLSBzcGFjZW1pdCxhcGJjLWFzc2FyLXJlZzogQVBCQyBBU1NB
UiByZWdpc3RlciBhZGRyZXNzIGZvciBBSUIgYWNjZXNzCj4gPiA+Cj4gPiA+IFRoZXNlIHByb3Bl
cnRpZXMgZW5hYmxlIHRoZSBkcml2ZXIgdG8gcGVyZm9ybSB2b2x0YWdlIHN3aXRjaGluZyBiZXR3
ZWVuCj4gPiA+IDMuM1YgYW5kIDEuOFYgcmVxdWlyZWQgZm9yIFVIUyBTRCBjYXJkIG1vZGVzLgo+
ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJa2VyIFBlZHJvc2EgPGlrZXJwZWRyb3NhbUBnbWFp
bC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21tYy9zcGFjZW1pdCxzZGhjaS55YW1sIHwgMTUgKysrKysrKysrKysrKysrCj4gPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9zcGFjZW1pdCxzZGhjaS55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9zcGFjZW1pdCxzZGhjaS55YW1s
Cj4gPiA+IGluZGV4IDEzZDkzODIwNThmYmMxYzEyYmUxMDI0ZDFjNTUwZjA0YTgyNTY3M2MuLjRk
NjU5MGFhODI2MjAwOWI2ZTU2OTdhMDRiNDVjZjM3MzZjMGZhNDIgMTAwNjQ0Cj4gPiA+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvc3BhY2VtaXQsc2RoY2kueWFt
bAo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL3NwYWNl
bWl0LHNkaGNpLnlhbWwKPiA+ID4gQEAgLTMyLDYgKzMyLDE4IEBAIHByb3BlcnRpZXM6Cj4gPiA+
ICAgICAgICAtIGNvbnN0OiBjb3JlCj4gPiA+ICAgICAgICAtIGNvbnN0OiBpbwo+ID4gPgo+ID4g
PiArICBzcGFjZW1pdCxhaWItbW1jMS1pby1yZWc6Cj4gPiA+ICsgICAgJHJlZjogL3NjaGVtYXMv
dHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gPiA+ICsgICAgZGVzY3JpcHRpb246IEFJ
QiBNTUMxIElPIHJlZ2lzdGVyIGFkZHJlc3MgZm9yIHZvbHRhZ2Ugc3dpdGNoaW5nCj4gPiA+ICsK
PiA+ID4gKyAgc3BhY2VtaXQsYXBiYy1hc2Zhci1yZWc6Cj4gPiA+ICsgICAgJHJlZjogL3NjaGVt
YXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gPiA+ICsgICAgZGVzY3JpcHRpb246
IEFQQkMgQVNGQVIgcmVnaXN0ZXIgYWRkcmVzcyBmb3IgQUlCIGFjY2Vzcwo+ID4gPiArCj4gPiA+
ICsgIHNwYWNlbWl0LGFwYmMtYXNzYXItcmVnOgo+ID4gPiArICAgICRyZWY6IC9zY2hlbWFzL3R5
cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgo+ID4gPiArICAgIGRlc2NyaXB0aW9uOiBBUEJD
IEFTU0FSIHJlZ2lzdGVyIGFkZHJlc3MgZm9yIEFJQiBhY2Nlc3MKPiA+ID4gKwo+ID4gPiAgcmVx
dWlyZWQ6Cj4gPiA+ICAgIC0gY29tcGF0aWJsZQo+ID4gPiAgICAtIHJlZwo+ID4gPiBAQCAtNTAs
NCArNjIsNyBAQCBleGFtcGxlczoKPiA+ID4gICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8JnBs
aWM+Owo+ID4gPiAgICAgICAgY2xvY2tzID0gPCZjbGtfYXBtdSAxMD4sIDwmY2xrX2FwbXUgMTM+
Owo+ID4gPiAgICAgICAgY2xvY2stbmFtZXMgPSAiY29yZSIsICJpbyI7Cj4gPiA+ICsgICAgICBz
cGFjZW1pdCxhaWItbW1jMS1pby1yZWcgPSA8MHhkNDAxZTgxYz47Cj4gPgo+ID4gVGhpcyBsb29r
cyB2ZXJ5IHZlcnkgd3JvbmcgdG8gbWUuIFRoaXMgaXMgcGFydCBvZiB0aGUgcGluY3RybAo+ID4g
cmVzZXJ2YXRpb246Cj4gPiAgICAgICAgICAgICAgIHBpbmN0cmw6IHBpbmN0cmxAZDQwMWUwMDAg
ewo+ID4gICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic3BhY2VtaXQsazEtcGlu
Y3RybCI7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MCAweGQ0MDFlMDAwIDB4
MCAweDEwMDA+Owo+ID4gICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmc3lzY29uX2Fw
YmMgQ0xLX0FJQj4sCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZzeXNjb25f
YXBiYyBDTEtfQUlCX0JVUz47Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgY2xvY2stbmFtZXMg
PSAiZnVuYyIsICJidXMiOwo+ID4gICAgICAgICAgICAgICAgICAgICAgIHNwYWNlbWl0LGFwYmMg
PSA8JnN5c2Nvbl9hcGJjPjsKPiA+ICAgICAgICAgICAgICAgfTsKPiA+IHNvIGlmIHlvdSBuZWVk
IHRvIGNoYW5nZSBzb21ldGhpbmcgaGVyZSwgeW91IG5lZWQgdG8gZG8gaXQgdmlhIHBpbmN0cmwu
Cj4gPgo+ID4gPiArICAgICAgc3BhY2VtaXQsYXBiYy1hc2Zhci1yZWcgPSA8MHhkNDAxNTA1MD47
Cj4gPiA+ICsgICAgICBzcGFjZW1pdCxhcGJjLWFzc2FyLXJlZyA9IDwweGQ0MDE1MDU0PjsKPiA+
Cj4gPiBUaGVzZSB0d28gYXJlIHRoZSBhcGJjIHN5c2NvbjoKPiA+ICAgICAgICAgICAgICAgc3lz
Y29uX2FwYmM6IHN5c3RlbS1jb250cm9sbGVyQGQ0MDE1MDAwIHsKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gInNwYWNlbWl0LGsxLXN5c2Nvbi1hcGJjIjsKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4ZDQwMTUwMDAgMHgwIDB4MTAwMD47Cj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZvc2NfMzJrPiwgPCZ2Y3RjeG9fMW0+LCA8
JnZjdGN4b18zbT4sCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZ2Y3RjeG9f
MjRtPjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJvc2MiLCAidmN0
Y3hvXzFtIiwgInZjdGN4b18zbSIsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAidmN0Y3hvXzI0bSI7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgI2Nsb2NrLWNlbGxz
ID0gPDE+Owo+ID4gICAgICAgICAgICAgICAgICAgICAgICNyZXNldC1jZWxscyA9IDwxPjsKPiA+
ICAgICAgICAgICAgICAgfTsKPiA+IHNvIGFkZCBhIHBoYW5kbGUgdG8gdGhlIHN5c2NvbiAobGlr
ZSB0aGUgcGluY3RybCBjdXJyZW50bHkgaGFzKSBhbmQKPiA+IGFjY2VzcyB0aGVzZSB2aWEgaXRz
IHJlZ21hcC4gV2hhdCB5b3UndmUgZ290IGhlcmUgaXMgYSBub24tcnVubmVyLAo+ID4gc29ycnku
Cj4KPiBXZSd2ZSBnYWluZWQgdGhpcyBzdXBwb3J0IGluIHBpbmN0cmwgd2hpY2ggYWxyZWFkeSBh
Y2NlcHRlZCBpbiBtYWlubGluZSwKPiBpdCdzIGRvbmUgYXMgQ29ub3Igc3VnZ2VzdGVkIGhlcmUs
IHNvIHlvdSBjYW4gZHJvcCB0aGVzZSBwcm9wZXJ0aWVzIGFsb25nCj4gd2l0aCB0aGUgcGF0Y2gg
WzUvMTBdLCBzZWUKPgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDEwOC1reC1w
aW5jdHJsLWFpYi1pby1wd3ItZG9tYWluLXYyLTAtNmJjYjQ2MTQ2ZTUzQGxpbnV4LnNwYWNlbWl0
LmNvbS8KClRoYW5rcyBmb3IgdGhlIHBvaW50ZXIhIEkgbWlzc2VkIHRoYXQgdGhlc2UgaGFkIGFs
cmVhZHkgbGFuZGVkIGluCm1haW5saW5lLiBJJ2xsIHJlYmFzZSB0aGUgc2VyaWVzLCBkcm9wIHRo
ZSByZWR1bmRhbnQgcHJvcGVydGllcyBhbmQKcGF0Y2ggWzUvMTBdLCBhbmQgc2VuZCBhIHYyIHNo
b3J0bHkuCgo+Cj4gPiBwdy1ib3Q6IGNoYW5nZXMtcmVxdWVzdGVkCj4gPgo+ID4gVGhhbmtzLAo+
ID4gQ29ub3IuCj4KPgo+Cj4gLS0KPiBZaXh1biBMYW4gKGRsYW4pCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
