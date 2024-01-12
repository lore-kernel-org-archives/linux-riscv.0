Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7D8C4707C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 23:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yIdaPLSgv9eXnmXGXMpZMGzL01DiNohdqrn33TjWPus=; b=d+Q4JW9qr5x2Xs
	Zwu4+LdJbQFojoBxl16bGvCHT5jHY2+ZReEm5eAkxiZ5+UdIlTirdAZPCrutzUwd4sC55atjpSkE/
	NI/EFoeTpW9XoOwXsZKOyUH+xQuoO4pZUcM99fDgdQRaF5vKOiEG69UiY+4K/WW4kp9+fEhW9xpxM
	v9sQCrxRumtqUZ0guetrk96C4xrqIq0kU2+hXTFdQjDPvTD5tJC+0RN5Upeco4p9qGsk/zLSvO018
	GGr1z/yWIFJAMat44tjU93n936PtBYXh9L9mXT+rSi0yMwnP0YEYtUgvtFGPzTjE12b+zB09QbuXt
	vdFpmRlF3pIA+Cl+JDiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rORIH-004HOb-2h;
	Fri, 12 Jan 2024 23:50:33 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rORIE-004HNC-1Q
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 23:50:31 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2ccae380df2so76822001fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jan 2024 15:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1705103426; x=1705708226; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdVVm44GspY1vrqagFO17oKocrrGuSEpWF2qOryhvaY=;
        b=UJyXk7b5L94WgrAQSIcvzJykx2JnySYx2XFu/Wlww/PFDAPIYAHQK++SsQRFPtla/B
         VCwAOVVi2a2p+NZIpKX025U3GGQZSfXA2JSxZp5nm5FwOr+91GC8+R2s4yywLB03miPf
         HZ3ukSeWuLZsOr5b4+ti11Q6omXgA1RpMjyQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705103426; x=1705708226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KdVVm44GspY1vrqagFO17oKocrrGuSEpWF2qOryhvaY=;
        b=XTOu9Wbk4K+EWZ7rbEUWYOV1f5fx4YlMOT35J/pnF78/f+q3If7/vKWxl/DqVI6R24
         4ldP1YCiFH6ltvdn6md4saYWgCzAOCXbd8Q1hQ0zTx6Kd7idBDb54vj8RdtlKsMQVaBO
         PnY8Tau/94c7KCQZctzuhsPjWtfE/2LM7ddKKR4JYL+HOLmsp5e/wEnMO4im1PVI9dJp
         YgmfGWbgAUyewpk5HnxQ1E9A0TOnL6sGlWYUJxMm0f298S95FjUf/ZfNygMJiXXY227g
         A5EuyRzDG8vugDsMXJ5ofofqvdNsTOcRYyy3J96mR7hNRe6DH3pVqkqMxpF5uKG4yHR1
         Is5w==
X-Gm-Message-State: AOJu0YzEUX69OSYWkeMvydDvUZSaRuLWzCciypEQ9svemiiwY9OXnGUB
	omXLcBl38FlTBNb6Ns6VpNUWzXXmBwvWbMw2BdTsludiRxG7
X-Google-Smtp-Source: AGHT+IG74fXTZOq2nIQGkABoTQvuIWpEvgArH4ko847NqdeZiegoSZ+CvkTfc7jJcqd/iuL4Jfoat0JYTgOT3NmkpCw=
X-Received: by 2002:a2e:a36e:0:b0:2cd:8fe0:70ab with SMTP id
 i14-20020a2ea36e000000b002cd8fe070abmr1011564ljn.16.1705103426437; Fri, 12
 Jan 2024 15:50:26 -0800 (PST)
MIME-Version: 1.0
References: <20240110073917.2398826-1-peterlin@andestech.com> <20240110073917.2398826-5-peterlin@andestech.com>
In-Reply-To: <20240110073917.2398826-5-peterlin@andestech.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 12 Jan 2024 15:50:15 -0800
Message-ID: <CAOnJCUJ0fN5=+b4jDx+NPqUwgwGKuBNYt7d86dXYNyjzUYFAWQ@mail.gmail.com>
Subject: Re: [PATCH v7 04/16] dt-bindings: riscv: Add Andes interrupt
 controller compatible string
To: Yu Chien Peter Lin <peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_155030_484064_F2761001 
X-CRM114-Status: GOOD (  17.40  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, paul.walmsley@sifive.com, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, chao.wei@sophgo.com, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org, unicorn_wang@outlook.com, wefu@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKYW4gOSwgMjAyNCBhdCAxMTo0MOKAr1BNIFl1IENoaWVuIFBldGVyIExpbgo8cGV0
ZXJsaW5AYW5kZXN0ZWNoLmNvbT4gd3JvdGU6Cj4KPiBBZGQgImFuZGVzdGVjaCxjcHUtaW50YyIg
Y29tcGF0aWJsZSBzdHJpbmcgdG8gaW5kaWNhdGUgdGhhdAo+IEFuZGVzIHNwZWNpZmljIGxvY2Fs
IGludGVycnVwdCBpcyBzdXBwb3J0ZWQgb24gdGhlIGNvcmUsCj4gZS5nLiBBWDQ1TVAgY29yZXMg
aGF2ZSAzIHR5cGVzIG9mIG5vbi1zdGFuZGFyZCBsb2NhbCBpbnRlcnJ1cHQKPiB3aGljaCBjYW4g
YmUgaGFuZGxlZCBpbiBzdXBlcnZpc29yIG1vZGU6Cj4KClBBVENIMSBpbiB0aGlzIHNlcmllcyBy
ZW5hbWVzIGV2ZXJ5dGhpbmcgZnJvbSBBTkRFU1RFQ0ggdG8gQU5ERVMgdG8gYmUKY29uc2lzdGVu
dC4KSGVyZSB5b3UgYXJlIGFkZGluZyBEVCBiaW5kaW5nIHdpdGggImFuZGVzdGVjaCIuIElzIHRo
ZXJlIGFueQpmdW5kYW1lbnRhbCBkaWZmZXJlbmNlIGJldHdlZW4gdGhlc2UgdHdvIHRvIGRlbWFu
ZAp0aGlzIGNoYW5nZSA/CgpGWUk6IEkgZG9uJ3QgbWluZCBlaXRoZXIgd2F5IGFzIEkgZG9uJ3Qg
aGF2ZSBza2luIGluIHRoZSBnYW1lLiBKdXN0CnNvbWV0aGluZyBJIG5vdGljZWQgd2hpbGUgcmV2
aWV3aW5nIHRoZSBzZXJpZXMuCgo+IC0gU2xhdmUgcG9ydCBFQ0MgZXJyb3IgaW50ZXJydXB0Cj4g
LSBCdXMgd3JpdGUgdHJhbnNhY3Rpb24gZXJyb3IgaW50ZXJydXB0Cj4gLSBQZXJmb3JtYW5jZSBt
b25pdG9yIG92ZXJmbG93IGludGVycnVwdAo+Cj4gVGhlc2UgaW50ZXJydXB0cyBhcmUgZW5hYmxl
ZC9kaXNhYmxlZCB2aWEgYSBjdXN0b20gcmVnaXN0ZXIKPiBTTElFIGluc3RlYWQgb2YgdGhlIHN0
YW5kYXJkIGludGVycnVwdCBlbmFibGUgcmVnaXN0ZXIgU0lFLgo+Cj4gU2lnbmVkLW9mZi1ieTog
WXUgQ2hpZW4gUGV0ZXIgTGluIDxwZXRlcmxpbkBhbmRlc3RlY2guY29tPgo+IEFja2VkLWJ5OiBD
b25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IFJldmlld2VkLWJ5OiBM
YWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4g
LS0tCj4gQ2hhbmdlcyB2MSAtPiB2MjoKPiAgIC0gTmV3IHBhdGNoCj4gQ2hhbmdlcyB2MiAtPiB2
MzoKPiAgIC0gVXBkYXRlZCBjb21taXQgbWVzc2FnZQo+ICAgLSBGaXhlZCBwb3NzaWJsZSBjb21w
YXRpYmxlcyBmb3IgQW5kZXMgSU5UQwo+IENoYW5nZXMgdjMgLT4gdjQ6Cj4gICAtIEFkZCBjb25z
dCBlbnRyeSBpbnN0ZWFkIG9mIGVudW0gKFN1Z2dlc3RlZCBieSBDb25vcikKPiBDaGFuZ2VzIHY0
IC0+IHY1Ogo+ICAgLSBJbmNsdWRlIENvbm9yJ3MgQWNrZWQtYnkKPiAgIC0gSW5jbHVkZSBQcmFi
aGFrYXIncyBSZXZpZXdlZC1ieQo+IENoYW5nZXMgdjUgLT4gdjY6Cj4gICAtIE5vIGNoYW5nZQo+
IENoYW5nZXMgdjYgLT4gdjc6Cj4gICAtIE5vIGNoYW5nZQo+IC0tLQo+ICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sIHwgNiArKysrKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4gaW5kZXggMjM2
NDZiNjg0ZWEyLi4zM2MyYjYyMGE1OWYgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPiBAQCAtMTAxLDcgKzEwMSwxMSBAQCBw
cm9wZXJ0aWVzOgo+ICAgICAgICAgIGNvbnN0OiAxCj4KPiAgICAgICAgY29tcGF0aWJsZToKPiAt
ICAgICAgICBjb25zdDogcmlzY3YsY3B1LWludGMKPiArICAgICAgICBvbmVPZjoKPiArICAgICAg
ICAgIC0gaXRlbXM6Cj4gKyAgICAgICAgICAgICAgLSBjb25zdDogYW5kZXN0ZWNoLGNwdS1pbnRj
Cj4gKyAgICAgICAgICAgICAgLSBjb25zdDogcmlzY3YsY3B1LWludGMKPiArICAgICAgICAgIC0g
Y29uc3Q6IHJpc2N2LGNwdS1pbnRjCj4KPiAgICAgICAgaW50ZXJydXB0LWNvbnRyb2xsZXI6IHRy
dWUKPgo+IC0tCj4gMi4zNC4xCj4KCgotLSAKUmVnYXJkcywKQXRpc2gKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
