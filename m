Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963CBC48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 01:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hhr/axgOyOCynahWe0sPKzJuRDf/CzsY7Ceag0MfUic=; b=rh0anWtYfOHOhS
	Lq6XExpCVL22vCZze7uweodvSH4NQ8S+6uLKe34UMPwSLOyQvYvcljK32Pvk5mc5usX4fL0gMZ/py
	Pb1w1wYjwMBNo/JGShdwhpEMpTeyG9q1nlhYJxLt0sCPWTZzIHaZHKgKzeQw7qWFSQNuQh72wcMva
	Ix2fsIcXVlgCS/f9GJb4kDn1BFCXRL/rFL63MeU9QilJHS+rlGOQazqPi1xkx4rk0IQwzJfXEb1nN
	5o8/MAOG6yYIC/zn+ztvU2KkYYXcxLB7l5xNFP54hNxf0ItaMmhdJnpq26mBwMc1m5Z4jEWfNQ6ct
	JZ708qSaOt7My/WhwTUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcEj4-0000000CiL4-42g0;
	Tue, 20 Feb 2024 01:15:14 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcEj1-0000000CiKY-3GyG
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 01:15:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C2FCCCE17B0
	for <linux-riscv@lists.infradead.org>; Tue, 20 Feb 2024 01:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1AE0C43141
	for <linux-riscv@lists.infradead.org>; Tue, 20 Feb 2024 01:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708391708;
	bh=gRlACvq18RgH3+fWPOxkkUfB0U8xAoHtppyL5FDnKuE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qzvkrcv7Y6I/ApWX7O7vOPeBl1rJSUDc4Vbe5uqu0wtQVVOHV/aPwJ7HNkQHvzjiK
	 XQhP6w+uf0UDZX2nqSSmIiE2RRZkD58a2qZn5dwMdth+hKUvBKNP6jZDsFJ4stLfcS
	 3MxIkpG1V4NeydmpQoaBkHmYEYEH9QTw0cOVARWFpXCI0LLO5NPKklYdNPMaUXLrM1
	 PCBgyIa6IKDFCpVxvHmQU6RxNmAqthmk4RzPhcjDN13CvL9e3wND51/apSaZ9dU1jO
	 TUl7ZcwQuD8rCzf4bt1N7R8g5cz4mMZOA9zVkh/uT0swvABuLhhKdIprcpC9rlEsB8
	 cO0WmxPRmqdIQ==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-563b7b3e3ecso5939598a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 17:15:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXM8mQK2Ah5hB7c1mEfYY704M9FfYb4Gr8j4ntqcc3/3HE554amzvZ6l1tbpE92opCrGlUhzFz5LI4+QjIRD8q9ibVhEFyUWClOfF81cIAK
X-Gm-Message-State: AOJu0YwjeqiB9HmZXTpFA4WKOQZ9uY0tOQ9Q5wO7PWvnCKewYYFllbkG
	SPNA7DZIbvstay533dMMX7vUs3USqdDFy8q+OE5parAdqjLlqw6yo8K7m1RMAa3KSsj1kRg/Kd0
	fTJnzCSGwIArFALgRTmP9gESRkDU=
X-Google-Smtp-Source: AGHT+IH4+9JBZnMWglIVAMrZKsqHw7pO9w1Rp9U87EJpKCF7PoBPr3pPgDcO6TDGwO0E8MKi2ReWPMx/pZWLWjuSas4=
X-Received: by 2002:aa7:d0d5:0:b0:564:a1e2:edd2 with SMTP id
 u21-20020aa7d0d5000000b00564a1e2edd2mr1785583edo.9.1708391707015; Mon, 19 Feb
 2024 17:15:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1708223519.git.unicorn_wang@outlook.com> <aaad6e257a44e312cfbeb5a8ce84b8975cdc461e.1708223519.git.unicorn_wang@outlook.com>
In-Reply-To: <aaad6e257a44e312cfbeb5a8ce84b8975cdc461e.1708223519.git.unicorn_wang@outlook.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 20 Feb 2024 09:14:55 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTAz1p-hXF5YCz0Hz5c+QMuSv6BGNbwpYW6Nvez0N7g6g@mail.gmail.com>
Message-ID: <CAJF2gTTAz1p-hXF5YCz0Hz5c+QMuSv6BGNbwpYW6Nvez0N7g6g@mail.gmail.com>
Subject: Re: [PATCH v10 1/5] dt-bindings: clock: sophgo: add pll clocks for SG2042
To: Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, richardcochran@gmail.com, 
	robh+dt@kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com, 
	xiaoguang.xing@sophgo.com, jszhang@kernel.org, inochiama@outlook.com, 
	samuel.holland@sifive.com, Chen Wang <unicorn_wang@outlook.com>, 
	Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_171512_187141_0AF03100 
X-CRM114-Status: GOOD (  15.87  )
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

T24gU3VuLCBGZWIgMTgsIDIwMjQgYXQgMTA6NTHigK9BTSBDaGVuIFdhbmcgPHVuaWNvcm54d0Bn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9v
ay5jb20+Cj4KPiBBZGQgYmluZGluZ3MgZm9yIHRoZSBwbGwgY2xvY2tzIGZvciBTb3BoZ28gU0cy
MDQyLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5j
b20+Cj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gLS0tCj4g
IC4uLi9iaW5kaW5ncy9jbG9jay9zb3BoZ28sc2cyMDQyLXBsbC55YW1sICAgICB8IDQ1ICsrKysr
KysrKysrKysrKysrKysKPiAgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zb3BoZ28sc2cyMDQy
LXBsbC5oIHwgMTQgKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNTkgaW5zZXJ0aW9ucygrKQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Ns
b2NrL3NvcGhnbyxzZzIwNDItcGxsLnlhbWwKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUv
ZHQtYmluZGluZ3MvY2xvY2svc29waGdvLHNnMjA0Mi1wbGwuaAo+Cj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9zb3BoZ28sc2cyMDQyLXBsbC55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3NvcGhnbyxzZzIw
NDItcGxsLnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4u
YjlhZjczM2U4YTczCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9jbG9jay9zb3BoZ28sc2cyMDQyLXBsbC55YW1sCj4gQEAgLTAsMCArMSw0
NSBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1
c2UpCj4gKyVZQU1MIDEuMgo+ICstLS0KPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2No
ZW1hcy9jbG9jay9zb3BoZ28sc2cyMDQyLXBsbC55YW1sIwo+ICskc2NoZW1hOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiArCj4gK3RpdGxlOiBTb3BoZ28g
U0cyMDQyIFBMTCBDbG9jayBHZW5lcmF0b3IKPiArCj4gK21haW50YWluZXJzOgo+ICsgIC0gQ2hl
biBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+Cj4gKwo+ICtwcm9wZXJ0aWVzOgo+ICsg
IGNvbXBhdGlibGU6Cj4gKyAgICBjb25zdDogc29waGdvLHNnMjA0Mi1wbGwKPiArCj4gKyAgcmVn
Ogo+ICsgICAgbWF4SXRlbXM6IDEKPiArCj4gKyAgY2xvY2tzOgo+ICsgICAgaXRlbXM6Cj4gKyAg
ICAgIC0gZGVzY3JpcHRpb246IE9zY2lsbGF0b3IoQ2xvY2sgR2VuZXJhdGlvbiBJQykgZm9yIE1h
aW4vRml4ZWQgUExMICgyNSBNSHopCj4gKyAgICAgIC0gZGVzY3JpcHRpb246IE9zY2lsbGF0b3Io
Q2xvY2sgR2VuZXJhdGlvbiBJQykgZm9yIEREUiBQTEwgMCAoMjUgTUh6KQo+ICsgICAgICAtIGRl
c2NyaXB0aW9uOiBPc2NpbGxhdG9yKENsb2NrIEdlbmVyYXRpb24gSUMpIGZvciBERFIgUExMIDEg
KDI1IE1IeikKPiArCj4gKyAgJyNjbG9jay1jZWxscyc6Cj4gKyAgICBjb25zdDogMQo+ICsgICAg
ZGVzY3JpcHRpb246Cj4gKyAgICAgIFNlZSA8ZHQtYmluZGluZ3MvY2xvY2svc29waGdvLHNnMjA0
Mi1wbGwuaD4gZm9yIHZhbGlkIGluZGljZXMuCj4gKwo+ICtyZXF1aXJlZDoKPiArICAtIGNvbXBh
dGlibGUKPiArICAtIHJlZwo+ICsgIC0gY2xvY2tzCj4gKyAgLSAnI2Nsb2NrLWNlbGxzJwo+ICsK
PiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4gKwo+ICtleGFtcGxlczoKPiArICAtIHwK
PiArICAgIGNsb2NrLWNvbnRyb2xsZXJAMTAwMDAwMDAgewo+ICsgICAgICBjb21wYXRpYmxlID0g
InNvcGhnbyxzZzIwNDItcGxsIjsKPiArICAgICAgcmVnID0gPDB4MTAwMDAwMDAgMHgxMDAwMD47
Cj4gKyAgICAgIGNsb2NrcyA9IDwmY2dpX21haW4+LCA8JmNnaV9kcGxsMD4sIDwmY2dpX2RwbGwx
PjsKPiArICAgICAgI2Nsb2NrLWNlbGxzID0gPDE+Owo+ICsgICAgfTsKPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zb3BoZ28sc2cyMDQyLXBsbC5oIGIvaW5jbHVkZS9k
dC1iaW5kaW5ncy9jbG9jay9zb3BoZ28sc2cyMDQyLXBsbC5oCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjJkNTE5YjNiZjUxYwo+IC0tLSAvZGV2L251bGwKPiAr
KysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3NvcGhnbyxzZzIwNDItcGxsLmgKPiBAQCAt
MCwwICsxLDE0IEBACj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wIE9SIEJT
RC0yLUNsYXVzZSAqLwo+ICsvKgo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjMgU29waGdvIFRlY2hu
b2xvZ3kgSW5jLiBBbGwgcmlnaHRzIHJlc2VydmVkLgo+ICsgKi8KPiArCj4gKyNpZm5kZWYgX19E
VF9CSU5ESU5HU19TT1BIR09fU0cyMDQyX1BMTF9IX18KPiArI2RlZmluZSBfX0RUX0JJTkRJTkdT
X1NPUEhHT19TRzIwNDJfUExMX0hfXwo+ICsKPiArI2RlZmluZSBNUExMX0NMSyAgICAgICAgICAg
ICAgICAgICAgICAgMAo+ICsjZGVmaW5lIEZQTExfQ0xLICAgICAgICAgICAgICAgICAgICAgICAx
Cj4gKyNkZWZpbmUgRFBMTDBfQ0xLICAgICAgICAgICAgICAgICAgICAgIDIKPiArI2RlZmluZSBE
UExMMV9DTEsgICAgICAgICAgICAgICAgICAgICAgMwo+ICsKPiArI2VuZGlmIC8qIF9fRFRfQklO
RElOR1NfU09QSEdPX1NHMjA0Ml9QTExfSF9fICovCj4gLS0KPiAyLjI1LjEKPgpSZXZpZXdlZC1i
eTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+CgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
