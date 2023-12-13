Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A194CC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 14:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v9W0Ate9taNMajfwAQIl1bF+uQblkE7ufhOvVVIrIzs=; b=5GwpK6SbsPAIvS
	QcfN+WZx0G8LF3BLxjTXidgdUtR8pPrxOKf6Owf44vGg71ui94rBURZdujMQdQxcrA+Qr5dJsWXMk
	HoF8w556vKraT9KiXnbkgvmYDT/rbgNmRVd/uRDapihhYbyutsEcgy5Zz/d5FWxXIYeYtF2Vexqqt
	hB9ERp1zNsNg2K68ln1ML07ragOY5Fd6eC+/OjVV//ZkUnuxTjxMXA5bHJYY+wpVa3F1IwPZ5ttNf
	x83JtInJdf+veQN1TbLyK5ra8IMjqSHUD7PU84QspgzLHy58pxA89R+RCXp40/wceQ8BL0lnBKJsI
	lsxrnowHdyuSigHqyaOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDQDi-00F2c2-11;
	Wed, 13 Dec 2023 14:28:18 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDQDe-00F2ZQ-2f
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 14:28:16 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2ca03103155so88512051fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 06:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702477693; x=1703082493; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYCVDEfmEpAAq2joADzIDjMSoQFlP/Ou+pXsJQt/qSE=;
        b=VxxYhWiyEjvbBjnoUFMhe7yE99dbxZu5N5RaJ8xmbX55+fJk5aOQYpaz7+Xy6o+eBq
         K4nCPl9rTeLA/ImQ8y6lxn8eMb57vWUUbCwK/B46oV4T/bvPL3eM7FTzSQUzDlrft5+7
         Ej7PwdYpdIb8ggn94rDvMJVRiHmoBh6s3MZnGP3vH1KmnorqTw2RwB06uNxej+rV5UoR
         69VCfc7ExMJ6alodSUNspNX9Tpm01qzp7PQWu6zhwY8wgrgo9FLbYMzYBzozGs3FBbpw
         zmxEAgUjbt/a93WVk3bKE056CCMgVs21Z7fOohlj+OE2dVIC6jfN5TkmNhpPeVv2nCDR
         bpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702477693; x=1703082493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYCVDEfmEpAAq2joADzIDjMSoQFlP/Ou+pXsJQt/qSE=;
        b=mTL34s79OX4TzW2PHs/hGdlpQUdNjQNgC+jk/0fq4fdkLJTl9MMBWHSGkrxf0e7bUI
         sYEMr2oPL1Z/4hfdoeql9epUedk7ERiCX4UFxhumFWOi66Thnd1lrSxuQW1U4V8eSt9T
         eXKAy5WEijyx875JO7GtsFdN64p7QTrh8/h7gFIq1Hqcra0bN4N/U2/XUwl85UZceYc0
         TArAihwWjnF+Z7+Wud/9J1ACdfV2eZA10cgaP8ni3v9JmdgHjRAgCWTcuuTnItmxiARr
         xCC7DXbzViDFitShx4bRR34hHhGHVgoL3AE8Qh5khnDB9jSV2WsFl1KtWp/aXRgwgkIj
         CusA==
X-Gm-Message-State: AOJu0YzW7nNrbQlw6OS5nL89H8shZGiAmnxwzHDrJE6j3FAdwNyGdMAw
	WVtop/hJ/7FdZK9uctG9gP2Ms2ITB3R7zPwJp/iHjg==
X-Google-Smtp-Source: AGHT+IHDmlLtTkFMLJW7VNJT8SlVJHCzmvG4k5wsYrRIgEpE6i0fDa0/acLJ4JdcgtstAE4LD4tfwFQKOdBlv8mM9Vw=
X-Received: by 2002:a2e:bea7:0:b0:2cb:2b04:cf92 with SMTP id
 a39-20020a2ebea7000000b002cb2b04cf92mr2250407ljr.11.1702477692628; Wed, 13
 Dec 2023 06:28:12 -0800 (PST)
MIME-Version: 1.0
References: <20231213070301.1684751-1-peterlin@andestech.com> <20231213070301.1684751-3-peterlin@andestech.com>
In-Reply-To: <20231213070301.1684751-3-peterlin@andestech.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 13 Dec 2023 19:58:00 +0530
Message-ID: <CAK9=C2WuuYQD8ydrHP16hUXVk6RuKLbfvUe_GpUGw9ppe3Rd8Q@mail.gmail.com>
Subject: Re: [PATCH v5 02/16] irqchip/riscv-intc: Allow large non-standard
 interrupt number
To: Yu Chien Peter Lin <peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_062814_864979_595B7538 
X-CRM114-Status: GOOD (  25.82  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, jszhang@kernel.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBEZWMgMTMsIDIwMjMgYXQgMTI6MzTigK9QTSBZdSBDaGllbiBQZXRlciBMaW4KPHBl
dGVybGluQGFuZGVzdGVjaC5jb20+IHdyb3RlOgo+Cj4gQ3VycmVudGx5LCB0aGUgaW1wbGVtZW50
YXRpb24gb2YgdGhlIFJJU0MtViBJTlRDIGRyaXZlciB1c2VzIHRoZQo+IGludGVycnVwdCBjYXVz
ZSBhcyBoYXJkd2FyZSBpbnRlcnJ1cHQgbnVtYmVyIGFuZCBoYXMgYSBsaW1pdGF0aW9uIG9mCj4g
c3VwcG9ydGluZyBhIG1heGltdW0gb2YgNjQgaW50ZXJydXB0cy4gSG93ZXZlciwgYWNjb3JkaW5n
IHRvIHRoZQo+IHByaXZpbGVnZWQgc3BlYywgaW50ZXJydXB0IGNhdXNlcyA+PSAxNiBhcmUgZGVm
aW5lZCBmb3IgcGxhdGZvcm0gdXNlLgoKSSBkaXNhZ3JlZSB3aXRoIHRoaXMgcGF0Y2guCgpFdmVu
IHRob3VnaCBSSVNDLVYgcHJpdiBzZXBjIGFsbG93cyBpbnRlcnJ1cHQgY2F1c2VzID49IDE2LCB3
ZQpzdGlsbCBuZWVkIENTUnMgdG8gbWFuYWdlIGFyYml0cmFyeSBsb2NhbCBpbnRlcnJ1cHRzCgpD
dXJyZW50bHksIHdlIGhhdmUgZm9sbG93aW5nIHN0YW5kYXJkIENTUnM6CjEpIFttfHNdaWUgYW5k
IFttfHNdaXAgd2hpY2ggYXJlIFhMRU4gd2lkZQoyKSBXaXRoIEFJQSwgd2UgaGF2ZSBbbXxzXWll
aCBhbmQgW218c11pcGggZm9yIFJWMzIKCkNsZWFybHksIHdlIGNhbiBvbmx5IGhhdmUgYSBYTEVO
IG51bWJlciBvZiBzdGFuZGFyZCBsb2NhbAppbnRlcnJ1cHRzIHdpdGhvdXQgQUlBIGFuZCA2NCBs
b2NhbCBpbnRlcnJ1cHRzIHdpdGggQUlBLgoKTm93IGZvciBpbXBsZW1lbnRhdGlvbnMgd2l0aCBj
dXN0b20gQ1NScyAoc3VjaCBhcyBBbmRlcyksCndlIHN0aWxsIGNhbid0IGFzc3VtZSBpbmZpbml0
ZSBsb2NhbCBpbnRlcnJ1cHRzIGJlY2F1c2UgSFcgd2lsbApoYXZlIGEgZmluaXRlIG51bWJlciBv
ZiBjdXN0b20gQ1NScy4KCj4KPiBUaGlzIGxpbWl0YXRpb24gcHJldmVudHMgdG8gZnVsbHkgdXRp
bGl6ZSB0aGUgYXZhaWxhYmxlIGxvY2FsIGludGVycnVwdAo+IHNvdXJjZXMuIEFkZGl0aW9uYWxs
eSwgdGhlIGludGVycnVwdCBudW1iZXIgdXNlZCBvbiBSSVNDLVYgYXJlIHNwYXJzZSwKPiB3aXRo
IG9ubHkgaW50ZXJydXB0IG51bWJlcnMgMSwgNSBhbmQgOSAocGx1cyBTc2NvZnBtZiBvciBULUhl
YWQncyBQTVUKPiBpbnRlcnJ1cHQpIGJlaW5nIGN1cnJlbnRseSB1c2VkIGZvciBzdXBlcnZpc29y
IG1vZGUuCj4KPiBTd2l0Y2ggdG8gdXNpbmcgaXJxX2RvbWFpbl9jcmVhdGVfdHJlZSgpIHRvIGNy
ZWF0ZSB0aGUgcmFkaXggdHJlZQo+IG1hcCwgc28gYSBsYXJnZXIgbnVtYmVyIG9mIGhhcmR3YXJl
IGludGVycnVwdHMgY2FuIGJlIGhhbmRsZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdSBDaGllbiBQ
ZXRlciBMaW4gPHBldGVybGluQGFuZGVzdGVjaC5jb20+Cj4gUmV2aWV3ZWQtYnk6IENoYXJsZXMg
Q2ktSnl1biBXdSA8ZG1pbnVzQGFuZGVzdGVjaC5jb20+Cj4gUmV2aWV3ZWQtYnk6IExlbyBZdS1D
aGkgTGlhbmcgPHljbGlhbmdAYW5kZXN0ZWNoLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIHYxIC0+IHYy
Ogo+ICAgLSBGaXhlZCBpcnEgbWFwcGluZyBmYWlsdXJlIGNoZWNraW5nIChzdWdnZXN0ZWQgYnkg
Q2zDqW1lbnQgYW5kIEFudXApCj4gQ2hhbmdlcyB2MiAtPiB2MzoKPiAgIC0gTm8gY2hhbmdlCj4g
Q2hhbmdlcyB2MyAtPiB2NDogKFN1Z2dlc3RlZCBieSBUaG9tYXMgWzFdKQo+ICAgLSBVc2UgcHJf
d2Fybl9yYXRlbGltaXRlZCBpbnN0ZWFkCj4gICAtIEZpeCBjb2Rpbmcgc3R5bGUgYW5kIGNvbW1p
dCBtZXNzYWdlCj4gQ2hhbmdlcyB2NCAtPiB2NTogKFN1Z2dlc3RlZCBieSBUaG9tYXMpCj4gICAt
IEZpeCBjb21taXQgbWVzc2FnZQo+Cj4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cHJvamVjdC9saW51eC1yaXNjdi9wYXRjaC8yMDIzMTAyMzAwNDEwMC4yNjYzNDg2LTMtcGV0ZXJs
aW5AYW5kZXN0ZWNoLmNvbS8jMjU1NzMwODUKPiAtLS0KPiAgZHJpdmVycy9pcnFjaGlwL2lycS1y
aXNjdi1pbnRjLmMgfCAxMiArKysrLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAv
aXJxLXJpc2N2LWludGMuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jCj4gaW5k
ZXggZThkMDFiMTRjY2RkLi4yZmRkNDBmMmE3OTEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pcnFj
aGlwL2lycS1yaXNjdi1pbnRjLmMKPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWlu
dGMuYwo+IEBAIC0yNCwxMCArMjQsOSBAQCBzdGF0aWMgYXNtbGlua2FnZSB2b2lkIHJpc2N2X2lu
dGNfaXJxKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ICB7Cj4gICAgICAgICB1bnNpZ25lZCBsb25n
IGNhdXNlID0gcmVncy0+Y2F1c2UgJiB+Q0FVU0VfSVJRX0ZMQUc7Cj4KPiAtICAgICAgIGlmICh1
bmxpa2VseShjYXVzZSA+PSBCSVRTX1BFUl9MT05HKSkKPiAtICAgICAgICAgICAgICAgcGFuaWMo
InVuZXhwZWN0ZWQgaW50ZXJydXB0IGNhdXNlIik7Cj4gLQo+IC0gICAgICAgZ2VuZXJpY19oYW5k
bGVfZG9tYWluX2lycShpbnRjX2RvbWFpbiwgY2F1c2UpOwo+ICsgICAgICAgaWYgKGdlbmVyaWNf
aGFuZGxlX2RvbWFpbl9pcnEoaW50Y19kb21haW4sIGNhdXNlKSkKPiArICAgICAgICAgICAgICAg
cHJfd2Fybl9yYXRlbGltaXRlZCgiRmFpbGVkIHRvIGhhbmRsZSBpbnRlcnJ1cHQgKGNhdXNlOiAl
bGQpXG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNhdXNlKTsKPiAg
fQo+Cj4gIC8qCj4gQEAgLTExNyw4ICsxMTYsNyBAQCBzdGF0aWMgaW50IF9faW5pdCByaXNjdl9p
bnRjX2luaXRfY29tbW9uKHN0cnVjdCBmd25vZGVfaGFuZGxlICpmbikKPiAgewo+ICAgICAgICAg
aW50IHJjOwo+Cj4gLSAgICAgICBpbnRjX2RvbWFpbiA9IGlycV9kb21haW5fY3JlYXRlX2xpbmVh
cihmbiwgQklUU19QRVJfTE9ORywKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICZyaXNjdl9pbnRjX2RvbWFpbl9vcHMsIE5VTEwpOwo+ICsgICAgICAgaW50
Y19kb21haW4gPSBpcnFfZG9tYWluX2NyZWF0ZV90cmVlKGZuLCAmcmlzY3ZfaW50Y19kb21haW5f
b3BzLCBOVUxMKTsKCkkgZGlzYWdyZWUgd2l0aCB0aGlzIGNoYW5nZSBiYXNlZCBvbiB0aGUgcmVh
c29uaW5nIGFib3ZlLgoKSW5zdGVhZCBvZiB0aGlzLCB3ZSBzaG91bGQgZGV0ZXJtaW5lIHRoZSBu
dW1iZXIgb2YgbG9jYWwgaW50ZXJydXB0cwpiYXNlZCBvbiB0aGUgdHlwZSBvZiBSSVNDLVYgaW50
YzoKMSkgRm9yIHN0YW5kYXJkIElOVEMgd2l0aG91dCBBSUEsIHdlIGhhdmUgWExFTiAob3IgQklU
U19QRVJfTE9ORykKICAgIGxvY2FsIGludGVycnVwdHMKMikgRm9yIHN0YW5kYXJ0IElOVEMgd2l0
aCBBSUEsIHdlIGhhdmUgNjQgbG9jYWwgaW50ZXJydXB0cwozKSBGb3IgY3VzdG9tIElOVEMgKHN1
Y2ggYXMgQW5kZXMpLCB0aGUgbnVtYmVyIG9mIGxvY2FsIGludGVycnVwdAogICAgc2hvdWxkIGJl
IGN1c3RvbSAoQW5kZXMgc3BlY2lmaWMpIHdoaWNoIGNhbiBiZSBkZXRlcm1pbmVkIGJhc2VkCiAg
ICBvbiBjb21wYXRpYmxlIHN0cmluZy4KCkFsc28sIGNyZWF0aW5nIGEgbGluZWFyIGRvbWFpbiB3
aXRoIGEgZml4ZWQgbnVtYmVyIG9mIGxvY2FsIGludGVycnVwdHMKZW5zdXJlcyB0aGF0IGRyaXZl
cnMgY2FuJ3QgbWFwIGEgbG9jYWwgaW50ZXJydXB0IGJleW9uZCB0aGUgYXZhaWxhYmlsaXR5Cm9m
IENTUnMgdG8gbWFuYWdlIGl0LgoKPiAgICAgICAgIGlmICghaW50Y19kb21haW4pIHsKPiAgICAg
ICAgICAgICAgICAgcHJfZXJyKCJ1bmFibGUgdG8gYWRkIElSUSBkb21haW5cbiIpOwo+ICAgICAg
ICAgICAgICAgICByZXR1cm4gLUVOWElPOwo+IEBAIC0xMzIsOCArMTMwLDYgQEAgc3RhdGljIGlu
dCBfX2luaXQgcmlzY3ZfaW50Y19pbml0X2NvbW1vbihzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZm4p
Cj4KPiAgICAgICAgIHJpc2N2X3NldF9pbnRjX2h3bm9kZV9mbihyaXNjdl9pbnRjX2h3bm9kZSk7
Cj4KPiAtICAgICAgIHByX2luZm8oIiVkIGxvY2FsIGludGVycnVwdHMgbWFwcGVkXG4iLCBCSVRT
X1BFUl9MT05HKTsKPiAtCgpTYW1lIGFzIGFib3ZlLCB3ZSBzaG91bGQgZGVmaW5pdGVseSBhZHZl
cnRpc2UgdGhlIHR5cGUgb2YgSU5UQyBhbmQKbnVtYmVyIG9mIGxvY2FsIGludGVycnVwdHMgbWFw
cGVkLgoKUmVnYXJkcywKQW51cAoKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiAtLQo+IDIu
MzQuMQo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
