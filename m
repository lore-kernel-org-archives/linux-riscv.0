Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E99C3F6B0
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 21:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c3e3KcYAsXdQmag9IGOm4sX2EZ3W9ZcFCkxXk9EfQAY=; b=s/M/VuF/sN8m2F
	XnInKmE9YPON9AnyInF7DPSaJx7yilveuq+klVHbT1iHeLtDKbX7Gc+Mln509ktSzFM+t4m/6TFMC
	VYU8cd8UVR3CkGaLQhsHXPWgDa9IHeefgMjXb/dICzNBsnyi6ZSabyHJQF7nfwN4JnBo1H17iMh1D
	u82sShbTsfSvJg0MW+X4Y7AmI6kg2xvy175rTRUlYnBsTFZSLqO4hpqnxAdcTbxmUmvCA/RAtzP8L
	FF9A6FEuGSAlryZoniABc8gxSB27XQybK61WdEX2rnv5jQPaRa94VQBFR6DOT/bUdsl9lrBDqUW+c
	0h8oqw7BxEEexCmGOYug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLAIQ-00G9B7-SE; Mon, 08 Aug 2022 21:28:22 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLAIO-00G9A5-EP
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 21:28:22 +0000
Received: by mail-wr1-x429.google.com with SMTP id z12so12247635wrs.9
        for <linux-riscv@lists.infradead.org>; Mon, 08 Aug 2022 14:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc;
        bh=i7aLZBzX/VueIll13gdwWAufXZi6UvA/3xPKiBV4yhg=;
        b=KFIM3X/OqwWXkiuO/oSPbpudOd0TIk1R4DdpLS/Xp4EP+dZEVeI+Yvona4t5yu1y1l
         Lfs5uZUIrIpl1dDjCq36VZdJqcIbgtkdNw0DpuH3EPnBMr4ip8SAIwRh4Ilwl2whTZxF
         39WDsfRCqlAukD0wyxhAa1xPwQxmMUTYo6u79BiWCJ3BLlAbemkFKKfKXIID5ZrSx1/2
         6OvnKtK2BF/moQTdTh/+BO+rFAcoBBFMXlJK5/IbKsSjfN9QShsTM6yTSE5l7ivSlrmC
         ztxjUoUNtqZnbRq/A9cy961oUZTW4nsbkAL3d+NDIYbJSfcoGxdkULuNqXF4Tv0gd3WJ
         ns6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc;
        bh=i7aLZBzX/VueIll13gdwWAufXZi6UvA/3xPKiBV4yhg=;
        b=lk9aVNvntrjSZUuJbbJbYCYM4GipSORrt0ptM3zH6JFXSYwu67pSeB1Vb/uun9lfBu
         MkKlHH++5t+mmQlvA4ICKsh3yZOmWW4jr1iO01FDdRhcicZMTlUGAI8Yu0Lwi8R1JIen
         ZyMIGv6fG5eIQuo0lxhULHiYCyCLwYoV4KVh3Gqx3r2croO2TJOkmcqiT/m8LmFpm0zB
         Vi5KD9j51OfHGc7xJrc/aplfu/soSnVNsbceHJqgx/kNu9p75rnDwcTH7Bigm+2/f8ns
         3/WDc6YcdawEfLN/ILqsatGZGQ8T2dAmhXkLKGamN4nGY7pi8YwGa8DGY3yw32lykN2S
         bp/Q==
X-Gm-Message-State: ACgBeo1Fjl4e4KIcJTy5zAI5agOffBhG7wH+2B49qxDsdvXBJM4OpNu2
	7ReP2+jhGwVgN4+ysxxHuQ4w3A==
X-Google-Smtp-Source: AA6agR4DQZ8bkSuxcJF32aGE0rzuknem9jxFkpyGqu+SX71Jlf09Ux9CYHmk/YomBYV4cag9aKPjng==
X-Received: by 2002:adf:d1e8:0:b0:223:bca:8019 with SMTP id g8-20020adfd1e8000000b002230bca8019mr2737187wrd.562.1659994097412;
        Mon, 08 Aug 2022 14:28:17 -0700 (PDT)
Received: from smtpclient.apple (global-5-141.n-2.net.cam.ac.uk. [131.111.5.141])
        by smtp.gmail.com with ESMTPSA id w15-20020adfec4f000000b0021e6b62fde2sm11996117wrn.59.2022.08.08.14.28.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Aug 2022 14:28:16 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH v2 3/4] hw/riscv: virt: fix syscon subnode paths
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20220808210643.2192602-4-mail@conchuod.ie>
Date: Mon, 8 Aug 2022 22:28:16 +0100
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Rob Herring <robh@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 qemu-riscv@nongnu.org,
 QEMU Developers <qemu-devel@nongnu.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Message-Id: <4BA66590-3A82-4B5C-829B-67F8B5D5029D@jrtc27.com>
References: <20220808210643.2192602-1-mail@conchuod.ie>
 <20220808210643.2192602-4-mail@conchuod.ie>
To: Conor Dooley <mail@conchuod.ie>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_142820_551727_6C138544 
X-CRM114-Status: GOOD (  19.33  )
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

T24gOCBBdWcgMjAyMiwgYXQgMjI6MDYsIENvbm9yIERvb2xleSA8bWFpbEBjb25jaHVvZC5pZT4g
d3JvdGU6Cj4gCj4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNv
bT4KPiAKPiBUaGUgc3Vibm9kZXMgb2YgdGhlIHN5c2NvbiBoYXZlIGJlZW4gYWRkZWQgdG8gdGhl
IGluY29ycmVjdCBwYXRocy4KPiBSYXRoZXIgdGhhbiBhZGQgdGhlbSBhcyBzdWJub2RlcywgdGhl
eSB3ZXJlIG9yaWdpbmFsbHkgYWRkZWQgdG8gIi9mb28iCj4gYW5kIGEgbGF0ZXIgcGF0Y2ggbW92
ZWQgdGhlbSB0byAiL3NvYy9mb28iLiBCb3RoIGFyZSBpbmNvcnJlY3QgJiB0aGV5Cj4gc2hvdWxk
IGhhdmUgYmVlbiBhZGRlZCBhcyAiL3NvYy90ZXN0QCMjIy9mb28iIGFzICIvc29jL3Rlc3QiIGlz
IHRoZQo+IHN5c2NvbiBub2RlLiBGaXggYm90aCB0aGUgcmVib290IGFuZCBwb3dlcm9mZiBzdWJu
b2RlcyB0byBhdm9pZCBlcnJvcnMKPiBzdWNoIGFzOgo+IAo+IC9zdHVmZi9xZW11L3FlbXUuZHRi
OiBzb2M6IHBvd2Vyb2ZmOiB7J3ZhbHVlJzogW1syMTg0NV1dLCAnb2Zmc2V0JzogW1swXV0sICdy
ZWdtYXAnOiBbWzRdXSwgJ2NvbXBhdGlibGUnOiBbJ3N5c2Nvbi1wb3dlcm9mZiddfSBzaG91bGQg
bm90IGJlIHZhbGlkIHVuZGVyIHsndHlwZSc6ICdvYmplY3QnfQo+ICAgICAgICBGcm9tIHNjaGVt
YTogL2hvbWUvY29ub3IvLmxvY2FsL2xpYi9weXRob24zLjkvc2l0ZS1wYWNrYWdlcy9kdHNjaGVt
YS9zY2hlbWFzL3NpbXBsZS1idXMueWFtbAo+IC9zdHVmZi9xZW11L3FlbXUuZHRiOiBzb2M6IHJl
Ym9vdDogeyd2YWx1ZSc6IFtbMzA1ODNdXSwgJ29mZnNldCc6IFtbMF1dLCAncmVnbWFwJzogW1s0
XV0sICdjb21wYXRpYmxlJzogWydzeXNjb24tcmVib290J119IHNob3VsZCBub3QgYmUgdmFsaWQg
dW5kZXIgeyd0eXBlJzogJ29iamVjdCd9Cj4gICAgICAgIEZyb20gc2NoZW1hOiAvaG9tZS9jb25v
ci8ubG9jYWwvbGliL3B5dGhvbjMuOS9zaXRlLXBhY2thZ2VzL2R0c2NoZW1hL3NjaGVtYXMvc2lt
cGxlLWJ1cy55YW1sCj4gCj4gUmVwb3J0ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMjA4MDMx
NzA1NTIuR0EyMjUwMjY2LXJvYmhAa2VybmVsLm9yZy8KPiBGaXhlczogMThkZjBiNDY5NSAoImh3
L3Jpc2N2OiB2aXJ0OiBBbGxvdyBjcmVhdGluZyBtdWx0aXBsZSBOVU1BIHNvY2tldHMiKQo+IEZp
eGVzOiAwZTQwNGRhMDA3ICgicmlzY3YvdmlydDogQWRkIHN5c2NvbiByZWJvb3QgYW5kIHBvd2Vy
b2ZmIERUIG5vZGVzIikKPiBSZXZpZXdlZC1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIu
ZnJhbmNpc0B3ZGMuY29tPgo+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+CgpUaGlzIGJyZWFrcyBGcmVlQlNE4oCZcyBkcml2ZXIgKHdlbGws
IGl0IGp1c3Qgd29u4oCZdCBwcm9iZS9hdHRhY2gpLCB3aGljaAppcyB3cml0dGVuIHRvIGhhbmRs
ZSBzeXNjb24tcG93ZXJvZmYvcmVib290IGV4aXN0aW5nIGFzIGEgY2hpbGQgb2YgYQpzaW1wbGVi
dXMgbm90IGEgc3lzY29uLiBNb3Jlb3Zlciwgd2hhdCBpcyB0aGUgcG9pbnQgb2YgcmVnbWFwIGlu
IHRoaXMKY2FzZT8gSXRzIGV4aXN0ZW5jZSBzdWdnZXN0cyB0aGUgcG9pbnQgaXMgZm9yIHRoZW0g
dG8gKm5vdCogYmUgY2hpbGRyZW4Kb2YgdGhlIHN5c2Nvbiwgb3RoZXJ3aXNlIHlvdSB3b3VsZG7i
gJl0IG5lZWQgYW4gZXhwbGljaXQgcGhhbmRsZSwgeW914oCZZApqdXN0IGxvb2sgYXQgdGhlIHBh
cmVudC4gTW92aW5nIHRoZSBub2RlcyB3aGlsc3Qga2VlcGluZyB0aGUgcHJvcGVydHkKZG9lc27i
gJl0IG1ha2Ugc2Vuc2UgdG8gbWUuCgpKZXNzCgo+IC0tLQo+IGh3L3Jpc2N2L3ZpcnQuYyB8IDYg
KysrKy0tCj4gMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvaHcvcmlzY3YvdmlydC5jIGIvaHcvcmlzY3YvdmlydC5jCj4gaW5k
ZXggOGIyOTc4MDc2ZS4uYTk4YjA1NDU0NSAxMDA2NDQKPiAtLS0gYS9ody9yaXNjdi92aXJ0LmMK
PiArKysgYi9ody9yaXNjdi92aXJ0LmMKPiBAQCAtODk2LDcgKzg5Niw4IEBAIHN0YXRpYyB2b2lk
IGNyZWF0ZV9mZHRfcmVzZXQoUklTQ1ZWaXJ0U3RhdGUgKnMsIGNvbnN0IE1lbU1hcEVudHJ5ICpt
ZW1tYXAsCj4gICAgIHRlc3RfcGhhbmRsZSA9IHFlbXVfZmR0X2dldF9waGFuZGxlKG1jLT5mZHQs
IG5hbWUpOwo+ICAgICBnX2ZyZWUobmFtZSk7Cj4gCj4gLSAgICBuYW1lID0gZ19zdHJkdXBfcHJp
bnRmKCIvc29jL3JlYm9vdCIpOwo+ICsgICAgbmFtZSA9IGdfc3RyZHVwX3ByaW50ZigiL3NvYy90
ZXN0QCVseC9yZWJvb3QiLAo+ICsgICAgICAgIChsb25nKW1lbW1hcFtWSVJUX1RFU1RdLmJhc2Up
Owo+ICAgICBxZW11X2ZkdF9hZGRfc3Vibm9kZShtYy0+ZmR0LCBuYW1lKTsKPiAgICAgcWVtdV9m
ZHRfc2V0cHJvcF9zdHJpbmcobWMtPmZkdCwgbmFtZSwgImNvbXBhdGlibGUiLCAic3lzY29uLXJl
Ym9vdCIpOwo+ICAgICBxZW11X2ZkdF9zZXRwcm9wX2NlbGwobWMtPmZkdCwgbmFtZSwgInJlZ21h
cCIsIHRlc3RfcGhhbmRsZSk7Cj4gQEAgLTkwNCw3ICs5MDUsOCBAQCBzdGF0aWMgdm9pZCBjcmVh
dGVfZmR0X3Jlc2V0KFJJU0NWVmlydFN0YXRlICpzLCBjb25zdCBNZW1NYXBFbnRyeSAqbWVtbWFw
LAo+ICAgICBxZW11X2ZkdF9zZXRwcm9wX2NlbGwobWMtPmZkdCwgbmFtZSwgInZhbHVlIiwgRklO
SVNIRVJfUkVTRVQpOwo+ICAgICBnX2ZyZWUobmFtZSk7Cj4gCj4gLSAgICBuYW1lID0gZ19zdHJk
dXBfcHJpbnRmKCIvc29jL3Bvd2Vyb2ZmIik7Cj4gKyAgICBuYW1lID0gZ19zdHJkdXBfcHJpbnRm
KCIvc29jL3Rlc3RAJWx4L3Bvd2Vyb2ZmIiwKPiArICAgICAgICAobG9uZyltZW1tYXBbVklSVF9U
RVNUXS5iYXNlKTsKPiAgICAgcWVtdV9mZHRfYWRkX3N1Ym5vZGUobWMtPmZkdCwgbmFtZSk7Cj4g
ICAgIHFlbXVfZmR0X3NldHByb3Bfc3RyaW5nKG1jLT5mZHQsIG5hbWUsICJjb21wYXRpYmxlIiwg
InN5c2Nvbi1wb3dlcm9mZiIpOwo+ICAgICBxZW11X2ZkdF9zZXRwcm9wX2NlbGwobWMtPmZkdCwg
bmFtZSwgInJlZ21hcCIsIHRlc3RfcGhhbmRsZSk7Cj4gLS0gCj4gMi4zNy4xCj4gCj4gCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
