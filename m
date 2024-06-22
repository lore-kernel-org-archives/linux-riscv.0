Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11239C27C53
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jun 2024 16:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=esbn8L4NaCFY2wpXRy4Hk3yWYX8LeywKm/59toqkb40=; b=zPt5XiAGMjs1BJ
	mUZKO1eGJoG2ob5p3v8ZoyPsCl8MwTcPbNeGpkHAijdUDKkw38s7I4Gg/IasbS6gFzqWs4t7pyvuG
	ck2T3kqtKMvT/zPmNGBoPudwfQxsYkQksMCsIcpYYZezo9P5MaBAX3p97MHQ4jfWLalSmdewAcyG5
	eR59jledxNaDWHJf3ak3uzjGII9SLQK6Wee4xm3AUUdvcy/yrTXTP5zfLb/AZ9UqXgr7vDeTetHll
	4IsTTAGFZKr3XASyYTtZtSpuGnLWYCnj18f4Ln4frr/cD840T/z9Wi+26jTYZyRC5yav2+85HR90m
	tgBs3n9GyV2KPQgwbQ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL3tR-0000000CRb6-0DTD;
	Sat, 22 Jun 2024 16:47:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL3tL-0000000CRaI-1Ast;
	Sat, 22 Jun 2024 16:47:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 78962616DD;
	Sat, 22 Jun 2024 16:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89A2C4AF0F;
	Sat, 22 Jun 2024 16:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719074825;
	bh=6o2GVijMyt7bzrd339rAvtddzKF1tfqFnbIInrY5XWM=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Hnq7EXRvXUPSsTl4kBGSMV/cQJNg78YaDNqsvhOGHotuWf4bOCbVQvw1lpzOCSX3Q
	 QWey/irz5/nv4U6uE/oehiel+gM/LLQqjAeUVZOEf3kTUtWGn0ONtC+/EVtU7Pv5kU
	 PQmlFi/8gB+XdhGBQObFp5jaTTUTGAMcF7dvJlqt0XMVTdAWcymTdCciFFFtVRdnvy
	 S3lS2PnGcQhLwMenISPDXcRoF9xGOKpzng9/NW8KNw8VugRUksKe2GRe8tYi0EWJpC
	 n0UYv2Yzd10lMW5YhYYPRYZx1BnB82PWWCAKB/Y5NdGzboLBTc8Hv9SwNAzWxJa7tf
	 0SK7qY5JOhC6A==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ec10324791so33725171fa.1;
        Sat, 22 Jun 2024 09:47:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUz/qRhN9RL2Q86UNvoIriYJM1zc1Jyn5nv/f2nyiyDqu0p4UVuyBcyzPoJ2M/Agb182d3WEyM4LdYjS79qXt3CyIjbjCLRHfymiTH8Vfr08XIZRYg6gXdIltbmfoaFm3t+I6c3xjjqniLWx4rdoqOJDOb070E=
X-Gm-Message-State: AOJu0YzHi9JqsEQrbwB8UCwHKbJXj81bI5pGMXY0VtLOTvuiaHHBpmqz
	V7QzRlA9B+jTvT8f52a6sX8R6AT3TVoTDrtaurSjt8x3E0RR4cwT6YFl/hET/MRIP8BZgCqOQEp
	QVoeCPSUZOQk+UqGOcMU+dqroRs0=
X-Google-Smtp-Source: AGHT+IH5/klRobrk8C8Tx8r4xEV1zy70cWikSV0uysow8O2/V58aKkLa/zaQhuBPPi8FPf4Cxx6rkddcvaqELWY/X38=
X-Received: by 2002:a2e:9902:0:b0:2ec:5736:e8f1 with SMTP id
 38308e7fff4ca-2ec5b2e9046mr1607861fa.46.1719074823759; Sat, 22 Jun 2024
 09:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240622150731.1105901-1-wens@kernel.org> <20240622150731.1105901-2-wens@kernel.org>
 <171907415897.1042829.2907756455868106157.robh@kernel.org>
In-Reply-To: <171907415897.1042829.2907756455868106157.robh@kernel.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 23 Jun 2024 00:46:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v66MptRCWnSyJ6B1g=E9rHh0MUac1kPw56rTO6So9_Qqow@mail.gmail.com>
Message-ID: <CAGb2v66MptRCWnSyJ6B1g=E9rHh0MUac1kPw56rTO6So9_Qqow@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: sram: sunxi-sram: Add regulators child
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>, linux-sunxi@lists.linux.dev, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_094707_516146_D701986B 
X-CRM114-Status: GOOD (  21.32  )
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
Reply-To: wens@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGksCgpPbiBTdW4sIEp1biAyMywgMjAyNCBhdCAxMjozNuKAr0FNIFJvYiBIZXJyaW5nIChBcm0p
IDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4KPiBPbiBTYXQsIDIyIEp1biAyMDI0IDIzOjA3
OjI5ICswODAwLCBDaGVuLVl1IFRzYWkgd3JvdGU6Cj4gPiBGcm9tOiBTYW11ZWwgSG9sbGFuZCA8
c2FtdWVsQHNob2xsYW5kLm9yZz4KPiA+Cj4gPiBTb21lIHN1bnhpIFNvQ3MgaGF2ZSBpbi1wYWNr
YWdlIHJlZ3VsYXRvcnMgY29udHJvbGxlZCBieSBhIHJlZ2lzdGVyIGluCj4gPiB0aGUgc3lzdGVt
IGNvbnRyb2wgTU1JTyBibG9jay4gQWxsb3cgYSBjaGlsZCBub2RlIGZvciB0aGlzIHJlZ3VsYXRv
cgo+ID4gZGV2aWNlIGluIGFkZGl0aW9uIHRvIFNSQU0gY2hpbGQgbm9kZXMuCj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbEBzaG9sbGFuZC5vcmc+Cj4gPiBSZXZp
ZXdlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8u
b3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3JnPgo+ID4g
LS0tCj4gPiAgLi4uL2FsbHdpbm5lcixzdW40aS1hMTAtc3lzdGVtLWNvbnRyb2wueWFtbCAgIHwg
MjggKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25z
KCspCj4gPgo+Cj4gTXkgYm90IGZvdW5kIGVycm9ycyBydW5uaW5nICdtYWtlIGR0X2JpbmRpbmdf
Y2hlY2snIG9uIHlvdXIgcGF0Y2g6Cj4KPiB5YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6Cj4KPiBk
dHNjaGVtYS9kdGMgd2FybmluZ3MvZXJyb3JzOgo+IC9idWlsZHMvcm9iaGVycmluZy9kdC1yZXZp
ZXctY2kvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NyYW0vYWxsd2lu
bmVyLHN1bjRpLWExMC1zeXN0ZW0tY29udHJvbC5leGFtcGxlLmR0Yjogc3lzY29uQDMwMDAwMDA6
IHJlZ3VsYXRvcnNAMzAwMDE1MDogRmFsc2Ugc2NoZW1hIGRvZXMgbm90IGFsbG93IHsnY29tcGF0
aWJsZSc6IFsnYWxsd2lubmVyLHN1bjIwaS1kMS1zeXN0ZW0tbGRvcyddLCAncmVnJzogW1s1MDMz
MTk4NCwgNF1dLCAnbGRvYSc6IHsncmVndWxhdG9yLW1pbi1taWNyb3ZvbHQnOiBbWzE4MDAwMDBd
XSwgJ3JlZ3VsYXRvci1tYXgtbWljcm92b2x0JzogW1sxODAwMDAwXV19LCAnbGRvYic6IHsncmVn
dWxhdG9yLW5hbWUnOiBbJ3ZjYy1kcmFtJ10sICdyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCc6IFtb
MTUwMDAwMF1dLCAncmVndWxhdG9yLW1heC1taWNyb3ZvbHQnOiBbWzE1MDAwMDBdXX19Cj4gICAg
ICAgICBmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NyYW0v
YWxsd2lubmVyLHN1bjRpLWExMC1zeXN0ZW0tY29udHJvbC55YW1sIwo+IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zcmFtL2FsbHdpbm5lcixzdW40aS1hMTAtc3lzdGVtLWNvbnRy
b2wuZXhhbXBsZS5kdGI6IC9leGFtcGxlLTEvc3lzY29uQDMwMDAwMDAvcmVndWxhdG9yc0AzMDAw
MTUwOiBmYWlsZWQgdG8gbWF0Y2ggYW55IHNjaGVtYSB3aXRoIGNvbXBhdGlibGU6IFsnYWxsd2lu
bmVyLHN1bjIwaS1kMS1zeXN0ZW0tbGRvcyddCgpJJ20gbm90IHNlZWluZyB0aGlzIGVycm9yIGxv
Y2FsbHkuIFRoZSBiaW5kaW5nIGluIHF1ZXN0aW9uIGZvcgonYWxsd2lubmVyLHN1bjIwaS1kMS1z
eXN0ZW0tbGRvcycgd2FzIG1lcmdlZCBpbiB2Ni4xMC1yYzEgaW4gY29tbWl0CjYyMmJhYjE4ODQ4
NCAoInJlZ3VsYXRvcjogZHQtYmluZGluZ3M6IEFkZCBBbGx3aW5uZXIgRDEgc3lzdGVtIExET3Mi
KS4KCgpDaGVuWXUKCj4gZG9jIHJlZmVyZW5jZSBlcnJvcnMgKG1ha2UgcmVmY2hlY2tkb2NzKToK
Pgo+IFNlZSBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvZGV2aWNldHJlZS1i
aW5kaW5ncy9wYXRjaC8yMDI0MDYyMjE1MDczMS4xMTA1OTAxLTItd2Vuc0BrZXJuZWwub3JnCj4K
PiBUaGUgYmFzZSBmb3IgdGhlIHNlcmllcyBpcyBnZW5lcmFsbHkgdGhlIGxhdGVzdCByYzEuIEEg
ZGlmZmVyZW50IGRlcGVuZGVuY3kKPiBzaG91bGQgYmUgbm90ZWQgaW4gKnRoaXMqIHBhdGNoLgo+
Cj4gSWYgeW91IGFscmVhZHkgcmFuICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIGFuZCBkaWRuJ3Qg
c2VlIHRoZSBhYm92ZQo+IGVycm9yKHMpLCB0aGVuIG1ha2Ugc3VyZSAneWFtbGxpbnQnIGlzIGlu
c3RhbGxlZCBhbmQgZHQtc2NoZW1hIGlzIHVwIHRvCj4gZGF0ZToKPgo+IHBpcDMgaW5zdGFsbCBk
dHNjaGVtYSAtLXVwZ3JhZGUKPgo+IFBsZWFzZSBjaGVjayBhbmQgcmUtc3VibWl0IGFmdGVyIHJ1
bm5pbmcgdGhlIGFib3ZlIGNvbW1hbmQgeW91cnNlbGYuIE5vdGUKPiB0aGF0IERUX1NDSEVNQV9G
SUxFUyBjYW4gYmUgc2V0IHRvIHlvdXIgc2NoZW1hIGZpbGUgdG8gc3BlZWQgdXAgY2hlY2tpbmcK
PiB5b3VyIHNjaGVtYS4gSG93ZXZlciwgaXQgbXVzdCBiZSB1bnNldCB0byB0ZXN0IGFsbCBleGFt
cGxlcyB3aXRoIHlvdXIgc2NoZW1hLgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
