Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48806C8303D
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 11:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YDcBaoUkbEMbSThRvs5H28HrHPDR3aEXZVuc/wlnnOw=; b=lswSfdjvvtKdFD
	hYDWo3OJ6uZEa5C7gyugkG74UJvVDjEALu8NTip4+3+8xCoXlyAVn/+d21upO90RZnMTAT576Pkp3
	ayTrg/poozMZ4V92JW8NB4sqgDajbOS+pWkElMd9qZr34EsCvh5prmNZl5N5InFENU08PPOBfw6es
	dJ1biobvwp1Y/0Y2S4UAovm5o1V9HPr7JHXZCcyMW1kN4PPd8hGwvR9GXjy+uJzLmbFCIssFLLHJd
	3LDz4HlD3BxGAEuOelQljcfr/VO7wTq1kokj8gdN6Knyh8qlb63C2/SsNfEoLKJTrplSsFH7Ib9R1
	wkW3z8HNPyZdDPjLYLSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXePB-0000000EAuL-28aH;
	Fri, 04 Jul 2025 11:16:33 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXdO9-0000000E0ha-3fCE
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 10:11:27 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55511c3e203so736836e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 04 Jul 2025 03:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751623884; x=1752228684; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThnYue16skpDKY73i8RkpzoMae/+gmhFicLx/ccew8c=;
        b=dKk396DgCFzgExzQIs1nK7Qico25yZYwcUYOACkp6uuNvfXTq++v89m+jisVrSePk5
         qIDgKXAI1//fpNlKlYzxHFC1L4vOE0yV6AXSFjxcOVzR0S3XZjvTimgt6ybj9D+x1E6W
         GV3CoM3zIQzlAep4fe8g0FiILHSVysMsCk/tPw0EgSz8wPO1ruSbZk4+1LydexE4WwlP
         wMFfvQn8qcr5dpkeeM+58pAgU/d8GrIb6oFj8wZyQANI8qTB3GGLOaTOFDz49j2g30p7
         FextK2dOJdEc/tP2biuqPaS/V2WZEJsE0unK/DM+3rNTF+ImnAy4tK7+66DGj/jlkHSQ
         djGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751623884; x=1752228684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThnYue16skpDKY73i8RkpzoMae/+gmhFicLx/ccew8c=;
        b=hRwDEsMcdWc4knaEZsnnK8nTcdKuQ01/s2Vl+BImzaYcd0M31nVbfZmXlN5Q40Oug5
         R1Z5QoHb1LKlyIyQSJrC4xBzsB5G6jf7lP5ERkpOgIqUyX6OTvPm/s572OQ2XuSpSyJw
         epK1V0ZnK6NEKwE+hORlAVJUivn5Lvv8jYHB56L9BpuZHIYEe1GVz3fhWqmd3YAolZuF
         AWuukGwQiHwNkFQCwYV5gBakqHIp+zAn4p8l2HqO2u9n3wLHc6jOqOg0XveeA00wr0YE
         hedz+b2j8on64sKcILPxZR2Zr7eDcOE3TuKyuafhw5GfcZ82Sm87zrvnoOhaBkN9Rd6p
         /bVA==
X-Forwarded-Encrypted: i=1; AJvYcCVc/PidupQYOje05dChz0E/LWq/sWYPU0CxCSUz0i0BaCWcDHjJPvoySNHdQVyUsFcG0ou4rKGj0v6olw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx4hTAErM96zx3l2fA0CM9yhZqbVhBs5KnFXhlNFB0yH9qbx8Q
	8g0AsLeTGE++tE7cJFNDcrz2ZJiat75ZYHoc2nUFA9udyw/d9fFhrJgou2musYs8fKi3ruX/fsc
	cWnwVCSOMKoWdABV9AwoKFklMOcDI+ZmLMrHHxZlaAQ==
X-Gm-Gg: ASbGncuPUkADF5sdf0VmzOO+3q1NEGi+27Iz74FzvH9EpVUGcRk6EtWm8o45hmZvZ51
	5nl3Qk5EIodxPKCFAD04I+T5vuv20Wub45OC4GfChF6xdugpkdZiJiBST6g2xP1KA+P6LorzfVS
	l4HbF6oCNtm55KI0QNX4Zd3EhqnolKRMieSWMfn/eCEeliLv8CMDACh7c=
X-Google-Smtp-Source: AGHT+IFYm/wR4jTRlbIDDwF6FIxEmPbVXFWiC29PN2h5l87b4kSraGLAGzH7R/iggEXemYKU5MQvLCtTcORv1zFuOus=
X-Received: by 2002:a05:6512:3c94:b0:553:291f:92d with SMTP id
 2adb3069b0e04-556e617c939mr532276e87.57.1751623883637; Fri, 04 Jul 2025
 03:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250704070356.1683992-1-apatel@ventanamicro.com> <20250704-attractive-sawfly-of-artistry-1c86a3@krzk-bin>
In-Reply-To: <20250704-attractive-sawfly-of-artistry-1c86a3@krzk-bin>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 4 Jul 2025 15:41:11 +0530
X-Gm-Features: Ac12FXzuBcUQShERIhU7sx8yxPVr9NpYbWLk5Qb0GVfeL-KIfhtDK6Kn6d-Jp8I
Message-ID: <CAK9=C2Xt5r0Vjw916U7hV7jR1iRwfaLpvhLYTLmWec_p_1pziw@mail.gmail.com>
Subject: Re: [PATCH v8 00/24] Linux SBI MPXY and RPMI drivers
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_031125_912218_9E815191 
X-CRM114-Status: GOOD (  17.47  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdWwgNCwgMjAyNSBhdCAxOjE14oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
a0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgSnVsIDA0LCAyMDI1IGF0IDEyOjMzOjMy
UE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBUaGUgU0JJIHYzLjAgKE1QWFkgZXh0ZW5z
aW9uKSBbMV0gYW5kIFJQTUkgdjEuMCBbMl0gc3BlY2lmaWNhdGlvbnMKPiA+IGFyZSBmcm96ZW4g
YW5kIGZpbmlzaGVkIHB1YmxpYyByZXZpZXcgYXQgdGhlIFJJU0MtViBJbnRlcm5hdGlvbmFsLgo+
ID4KPiA+IEN1cnJlbnRseSwgbW9zdCBvZiB0aGUgUlBNSSBhbmQgTVBYWSBkcml2ZXJzIGFyZSBp
biBPcGVuU0JJIHdoZXJlYXMKPiA+IExpbnV4IG9ubHkgaGFzIFNCSSBNUFhZIG1haWxib3ggY29u
dHJvbGxlciBkcml2ZXIsIFJQTUkgY2xvY2sgZHJpdmVyCj4gPiBhbmQgUlBNSSBzeXN0ZW0gTVNJ
IGRyaXZlciBUaGlzIHNlcmllcyBhbHNvIGluY2x1ZGVzIEFDUEkgc3VwcG9ydAo+ID4gZm9yIFNC
SSBNUFhZIG1haWxib3ggY29udHJvbGxlciBhbmQgUlBNSSBzeXN0ZW0gTVNJIGRyaXZlcnMuCj4g
Pgo+ID4gVGhlc2UgcGF0Y2hlcyBjYW4gYmUgZm91bmQgaW4gdGhlIHJpc2N2X3NiaV9tcHh5X21h
aWxib3hfdjggYnJhbmNoCj4gPiBhdDogaHR0cHM6Ly9naXRodWIuY29tL2F2cGF0ZWwvbGludXgu
Z2l0Cj4gPgo+ID4gVG8gdGVzdCB0aGVzZSBwYXRjaGVzLCBib290IExpbnV4IG9uICJ2aXJ0LHJw
bWk9b24sYWlhPWFwbGljLWltc2ljIgo+ID4gbWFjaGluZSB3aXRoIE9wZW5TQkkgYW5kIFFFTVUg
ZnJvbSB0aGUgZGV2LXVwc3RyZWFtIGJyYW5jaCBhdDoKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS92
ZW50YW5hbWljcm8vb3BlbnNiaS5naXQKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS92ZW50YW5hbWlj
cm8vcWVtdS5naXQKPiA+Cj4gPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2Ev
cmlzY3Ytc2JpLWRvYy9yZWxlYXNlcwo+ID4gWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1u
b24taXNhL3Jpc2N2LXJwbWkvcmVsZWFzZXMKPiA+Cj4gPiBDaGFuZ2VzIHNpbmNlIHY3Ogo+ID4g
IC0gQWRkcmVzc2VkIGNvbW1lbnRzIG9uIFBBVENIMywgUEFUQ0g3LCBQQVRDSDEwLCBQQVRDSDE0
LCBhbmQgUEFUQ0gyMQo+Cj4gV2hpY2ggY29tbWVudHM/IFdoYXQgZXhhY3RseSBkaWQgeW91IGNo
YW5nZT8gUHJvdmlkZSBpbi1wYXRjaCBjaGFuZ2Vsb2dzCj4gZXhwbGFpbmluZyB0aGlzLCBiZWNh
dXNlIHdoYXQgeW91IHdyb3RlIGlzIHdheSB0b28gdmFndWUuCj4KCkFwb2xvZ2llcyBmb3IgYmVp
bmcgYSBiaXQgbGF6eSBoZXJlLiBNb3N0IGNoYW5nZXMgYXJlIHByZXR0eSBzdHJhaWdodCBmb3J3
YXJkCmV4Y2VwdCB0aGUgaW1wcm92ZW1lbnRzIGluIFBBVENIMTQuIE1vcmUgZGV0YWlsZWQgY2hh
bmdlIGxvZyBpcyBiZWxvdyAuLi4KCkNoYW5nZXMgc2luY2Ugdjc6CiAtIEFkZHJlc3NlZCBlbnVt
IHJlbGF0ZWQgbml0cyBpbiBQQVRDSDMKICAgKFJlZmVyLCBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvQ0FLOT1DMlZ4aEM2c294SHRtYWNlZGJlQ1U9ckZpODRCcjFSdk4ydVBjQktvTGhSYUp3
QG1haWwuZ21haWwuY29tLykKIC0gQWRkcmVzc2VkIGNvbW1lbnRzIGluIFBBVENINyBhcyBmb2xs
b3dzOgogICAtIEFkZGVkIG1pbm1heC5oIHRvIGluY2x1ZGVzCiAgIC0gUmVtb3ZlZCAicmMiIHZh
cmlhYmxlIGZyb20gbXB4eV9tYm94X3NlbmRfcnBtaV9kYXRhKCkKICAgLSBSZW1vdmVkIGFsaWdu
bWVudCBhbmQgb3RoZXIgY2hlY2tzIGZyb20gbXB4eV9tYm94X3BlZWtfcnBtaV9kYXRhKCkKICAg
LSBDcmVhdGVkIHNlcGFyYXRlIGZ1bmN0aW9uIHRvIHJlc3RyaWN0IHNjb3BlIG9mIGNoYW5uZWxf
aWRzIHVzZWQKaW4gbXB4eV9tYm94X3Byb2JlKCkKICAgKFJlZmVyLCBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvQ0FLOT1DMlVtZTJDbUJZSFlvYjdIU0pIdT1aZGZkV00rNEpZUGdGSjlIaXI1
T2k4Y09nQG1haWwuZ21haWwuY29tLykKIC0gSW1wcm92ZWQgY29tbWVudHMgZm9yIHN0cnVjdCBy
cG1pX2Nsa19yYXRlcyBpbiBQQVRDSDEwCiAgIChSZWZlciwgaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsL0NBSzk9QzJWZnZzYkZUamVjUW0wT1Nzc3NYYmZmN3dDNGZxV2YzQ1RtbnBXU2lhTGNC
d0BtYWlsLmdtYWlsLmNvbS8pCiAtIEltcHJvdmVkIHJlZmFjdG9yaW5nIG9mIGFjcGlfZndub2Rl
X2dldF9yZWZlcmVuY2VfYXJncygpIGluIFBBVENIMTQKICAgKFJlZmVyLCBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMjAyNTA3MDIwNTEzNDUuMTQ2MDQ5Ny0xNS1hcGF0ZWxAdmVudGFuYW1p
Y3JvLmNvbS8pCiAtIEltcHJvdmUgbmFyZ3NfY291bnQgcGFyc2luZyBpbiBhY3BpX2Z3bm9kZV9n
ZXRfcmVmZXJlbmNlX2FyZ3MoKSBmb3IgUEFUQ0gxNQogICAoUmVmZXIsIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC8yMDI1MDcwMjA1MTM0NS4xNDYwNDk3LTE2LWFwYXRlbEB2ZW50YW5hbWlj
cm8uY29tLykKIC0gQWRkZWQgbW9yZSBjb21tZW50cyBkZXNjcmliaW5nIHdoeSBuZWVkIHRvIGV4
cGxpY2l0bHkgc2V0IGRldmljZQpNU0kgZG9tYWluIGluIFBBVENIMjEKICAgKFJlZmVyLCBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvYUdhVW1wdzFwVldOQW1wYkBzbWlsZS5maS5pbnRlbC5j
b20vKQoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
