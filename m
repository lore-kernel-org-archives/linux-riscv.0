Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BFEC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 17:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+64ikIXqEbM3F4NAGKK/eaVT1LxQCyptkDnB3Imc/W4=; b=pF4tRLiQDlA8AW
	DDG4pAYq9OYedUHv+gDWdJmuOVb6zfZgYgA1a6uY/ffvcgolIhr+XYRXqBba+lP+FSyRfvD5V3rJB
	jW59eZPM47i63pxyAH+5IampGGJF5u4r9NQY7CfIQRTUxsxFHJtihnU+1O4wn381OiUtK9LBF6YCD
	cq8Ti+9ZIvkDPtQlylOOWuYhd3YprtPbc68UUSu4Zz6Xy+3yVm0BFxDxzWZFJWJiILn89RaSKyJ4v
	3JWP/rlwNIpZxTlYHOIS6Vx8IB0GluBvHRxtnRjWf9/FnJUHAQPew+LnJsJsOmu8WO+X2rK5/TCcm
	JOdIK77l5NXQ8V0PvSsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCkDW-006OOf-2O;
	Mon, 11 Dec 2023 17:37:18 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCkDU-006OLt-0J
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 17:37:17 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3b9e6262fccso2840482b6e.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 09:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702316235; x=1702921035; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=olWTkTTTDMqyGniJrt96EJYeNEaxv5XjfscB27aHKBI=;
        b=BYnbBEMUHuOFEhvuoilKinCLORKJJ0NVrSumJTuXctcq8EkkhUa2T9ohYutADAfHup
         QTOtyAFossPG9YXG799k/4DdA166/Z5HSO3Pwb6ftgTRxiA0IWoSE5HDHgdAqwY3PHp5
         LO1Rd0DAD7VFwqvqcRUwIul0JyGLw1ws6XqGfAGRMQUD2+lV+HlHMavGSRNaIGAt745d
         gtCz+v4uh0kJH353EiR+DGsOFD+8mxDzxGqdJxPP5ZOUM2WV85fg+Eew4CcBpnC9rjvv
         MHwlIxsVA8QIgbZIWVEnLD0h78hMpVDFSEDGRDle6JLSiZhjmJLbowXzArHLFLeGaTZQ
         oEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702316235; x=1702921035;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=olWTkTTTDMqyGniJrt96EJYeNEaxv5XjfscB27aHKBI=;
        b=DgX898mO+yQo1WouPYYlydlo7ERxr5NexeOzV8n2yW1GrTFZEEQNAU2O1yoYfY3TK3
         1m7UF6HmZwcZV7bgNM/i03viFgAWn9/qAmW+l3pRpOWF5JRDFicOO5butN7kZ8YepO6k
         o2/CkmOKSEUfeYtfBx3PD9K8Vs3LfXmQTjqiT427Pu83pv9KQ80/SxUv814q/qIRSZyo
         gaqfVMvqF+Ommd1BayZSAr/hOlpQW2wJuYGjErXzSfXLIRM/ikR3A6O8USHdj8xAPcDn
         ygbPbK33ZHJaaDWhG5DiR0LSbG8ZHk86CgHG4TH9VBG3whgiOLbkPj6Trs23bMQqqG7g
         FXXA==
X-Gm-Message-State: AOJu0YzqkeckeCoftdRwnYSRupCyPTrQpAWZ8NPFzOZbAHaVFwWYGV92
	Us1C5cSVT+YLIlThOdGU7wRuLjqLJJMcXbACFdnhdA==
X-Google-Smtp-Source: AGHT+IHkgREgetJtJ3CpZeBOhCg+lo0iJmAL4cDPZHyGGcooXLGdNWNZrDMNjy7Xl75SejBdf5W5Lg==
X-Received: by 2002:a05:6358:9209:b0:170:1d30:56e0 with SMTP id d9-20020a056358920900b001701d3056e0mr5134113rwb.30.1702309233725;
        Mon, 11 Dec 2023 07:40:33 -0800 (PST)
Received: from ?IPV6:2600:1700:2000:b002:f8a3:26ec:ac85:392e? ([2600:1700:2000:b002:f8a3:26ec:ac85:392e])
        by smtp.gmail.com with ESMTPSA id s6-20020a0cf646000000b0067ec9faed23sm1463005qvm.142.2023.12.11.07.40.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 07:40:33 -0800 (PST)
Message-ID: <ae9b5592-549d-4a6a-82c8-9545ab8eb924@sifive.com>
Date: Mon, 11 Dec 2023 09:40:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>,
 "Conor.Dooley" <conor.dooley@microchip.com>, llvm@lists.linux.dev,
 Leo Li <sunpeng.li@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Palmer Dabbelt <palmer@dabbelt.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 linux-riscv@lists.infradead.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
 <20231123-headdress-mold-0dd7a74477f7@wendy>
 <20231130004224.GE2513828@dev-arch.thelio-3990X>
 <4f277982-fffb-4fe1-bc02-007633400f31@sifive.com>
 <5090a015-5b6f-44be-bb25-d2ca3fdf5d40@app.fastmail.com>
 <07d27191-12b6-4c84-b80e-75c618df9de4@sifive.com>
 <CADnq5_O+ozkwQAEn3K_=-pB2L0+pbc+tbPU0CEwOTa+QysogAg@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CADnq5_O+ozkwQAEn3K_=-pB2L0+pbc+tbPU0CEwOTa+QysogAg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_093716_224521_8B2953C5 
X-CRM114-Status: GOOD (  17.13  )
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

SGkgQWxleCwKCk9uIDIwMjMtMTItMTEgOToxNyBBTSwgQWxleCBEZXVjaGVyIHdyb3RlOgo+IE9u
IFN1biwgRGVjIDEwLCAyMDIzIGF0IDU6MTDigK9BTSBTYW11ZWwgSG9sbGFuZAo+IDxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPj4KPj4gSGkgQXJuZCwKPj4KPj4gT24gMjAyMy0x
Mi0wOSAyOjM4IFBNLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+Pj4gT24gRnJpLCBEZWMgOCwgMjAy
MywgYXQgMDY6MDQsIFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+Pj4+IE9uIDIwMjMtMTEtMjkgNjo0
MiBQTSwgTmF0aGFuIENoYW5jZWxsb3Igd3JvdGU6Cj4+Pj4+IE9uIFRodSwgTm92IDIzLCAyMDIz
IGF0IDAyOjIzOjAxUE0gKzAwMDAsIENvbm9yIERvb2xleSB3cm90ZToKPj4+Pj4+IE9uIFR1ZSwg
Tm92IDIxLCAyMDIzIGF0IDA3OjA1OjE1UE0gLTA4MDAsIFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+
Pj4+Pj4+IFJJU0MtViB1c2VzIGtlcm5lbF9mcHVfYmVnaW4oKS9rZXJuZWxfZnB1X2VuZCgpIGxp
a2Ugc2V2ZXJhbCBvdGhlcgo+Pj4+Pj4+IGFyY2hpdGVjdHVyZXMuIEVuYWJsaW5nIGhhcmR3YXJl
IEZQIHJlcXVpcmVzIG92ZXJyaWRpbmcgdGhlIElTQSBzdHJpbmcKPj4+Pj4+PiBmb3IgdGhlIHJl
bGV2YW50IGNvbXBpbGF0aW9uIHVuaXRzLgo+Pj4+Pj4KPj4+Pj4+IEFoIHllcywgYnJpbmdpbmcg
dGhlIGpveSBvZiBmcmFtZS1sYXJnZXItdGhhbiB3YXJuaW5ncyB0byBSSVNDLVY6Cj4+Pj4+PiAu
Li9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RtbC9kY24zMi9kaXNw
bGF5X21vZGVfdmJhXzMyLmM6NTg6MTM6IHdhcm5pbmc6IHN0YWNrIGZyYW1lIHNpemUgKDI0MTYp
IGV4Y2VlZHMgbGltaXQgKDIwNDgpIGluICdESVNQQ0xLRFBQQ0xLRENGQ0xLRGVlcFNsZWVwUHJl
ZmV0Y2hQYXJhbWV0ZXJzV2F0ZXJtYXJrc0FuZFBlcmZvcm1hbmNlQ2FsY3VsYXRpb24nIFstV2Zy
YW1lLWxhcmdlci10aGFuXQo+Pj4+Pgo+Pj4+PiA6KAo+Pj4+Pgo+Pj4+Pj4gTmF0aGFuLCBoYXZl
IHlvdSBnaXZlbiB1cCBvbiB0aGVzZSBiZWluZyBzb3J0ZWQgb3V0Pwo+Pj4+Pgo+Pj4+PiBEb2Vz
IHlvdXIgY29uZmlndXJhdGlvbiBoYXZlIEtBU0FOIChJIGRvbid0IHRoaW5rIFJJU0MtViBzdXBw
b3J0cwo+Pj4+PiBLQ1NBTik/IEl0IGlzIHBvc3NpYmxlIHRoYXQgZG1sL2RjbjMyIG5lZWRzIHNv
bWV0aGluZyBzaW1pbGFyIHRvIGNvbW1pdAo+Pj4+PiA2NzQwZWM5N2JjZGIgKCJkcm0vYW1kL2Rp
c3BsYXk6IEluY3JlYXNlIGZyYW1lIHdhcm5pbmcgbGltaXQgd2l0aCBLQVNBTgo+Pj4+PiBvciBL
Q1NBTiBpbiBkbWwyIik/Cj4+Pj4+Cj4+Pj4+IEkgYW0gbm90IHJlYWxseSBpbnRlcmVzdGVkIGlu
IHBsYXlpbmcgd2hhY2stYS1tb2xlIHdpdGggdGhlc2Ugd2FybmluZ3MKPj4+Pj4gbGlrZSBJIGhh
dmUgZG9uZSBpbiB0aGUgcGFzdCBmb3IgdGhlIHJlYXNvbnMgSSBvdXRsaW5lZCBoZXJlOgo+Pj4+
Pgo+Pj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy8yMDIzMTAxOTIwNTExNy5HQTgzOTkwMkBk
ZXYtYXJjaC50aGVsaW8tMzk5MFgvCj4+Pj4KPj4+PiBJIGFsc28gc2VlIG9uZSBvZiB0aGVzZSB3
aXRoIGNsYW5nIDE3IGV2ZW4gd2l0aCBLQVNBTiBkaXNhYmxlZDoKPj4+Pgo+Pj4+IGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZG1sL2RjbjMyL2Rpc3BsYXlfbW9kZV92
YmFfMzIuYzozNzo2Ogo+Pj4+IHdhcm5pbmc6IHN0YWNrIGZyYW1lIHNpemUgKDIyMDgpIGV4Y2Vl
ZHMgbGltaXQgKDIwNDgpIGluICdkbWwzMl9yZWNhbGN1bGF0ZScKPj4+PiBbLVdmcmFtZS1sYXJn
ZXItdGhhbl0KPj4+PiB2b2lkIGRtbDMyX3JlY2FsY3VsYXRlKHN0cnVjdCBkaXNwbGF5X21vZGVf
bGliICptb2RlX2xpYikKPj4+Pgo+Pj4+ICAgICAgXgo+Pj4+IDE1MzIvMjIwOCAoNjkuMzglKSBz
cGlsbHMsIDY3Ni8yMjA4ICgzMC42MiUpIHZhcmlhYmxlcwo+Pj4+Cj4+Pj4gU28gSSdtIGluIGZh
dm9yIG9mIGp1c3QgcmFpc2luZyB0aGUgbGltaXQgZm9yIHRoZXNlIGZpbGVzIGZvciBjbGFuZywg
bGlrZSB5b3UKPj4+PiBzdWdnZXN0ZWQgaW4gdGhlIGxpbmtlZCB0aHJlYWQuCj4+Pgo+Pj4gSG93
IGFib3V0IGp1c3QgYWRkaW5nIGEgQlVHX09OKElTX0VOQUJMRUQoQ09ORklHX1JJU0NWKSkKPj4+
IGluIHRoYXQgZnVuY3Rpb24/IFRoYXQgc2hvdWxkIGFsc28gYXZvaWQgdGhlIGJ1aWxkIGZhaWx1
cmUKPj4+IGJ1dCBnaXZlIGEgYmV0dGVyIGluZGljYXRpb24gb2Ygd2hlcmUgdGhlIHByb2JsZW0g
aXMKPj4+IGlmIHNvbWVvbmUgYWN0dWFsbHkgcnVucyBpbnRvIHRoYXQgZnVuY3Rpb24gYW5kIHRy
aWdnZXJzCj4+PiBhIHJ1bnRpbWUgc3RhY2sgb3ZlcmZsb3cuCj4+Cj4+IFdvbid0IHRoYXQgYnJl
YWsgYWN0dWFsIHVzZXJzIG9mIHRoZSBkcml2ZXIsIHRyYWRpbmcgYW4gdW5saWtlbHkgYnV0Cj4+
IHRoZW9yZXRpY2FsbHkgcG9zc2libGUgc3RhY2sgb3ZlcmZsb3cgZm9yIGEgZ3VhcmFudGVlZCBj
cmFzaD8gVGhlIGludGVudCBvZiB0aGlzCj4+IHNlcmllcyBpcyB0aGF0IEkgaGF2ZSBvbmUgb2Yg
dGhlc2UgR1BVcyBwbHVnZ2VkIGluIHRvIGEgUklTQy1WIGJvYXJkLCBhbmQgSSB3YW50Cj4+IHRv
IHVzZSBpdC4KPiAKPiBEb2VzIHRoaXMgcGF0Y2ggYWRkcmVzcyB0aGUgaXNzdWU/Cj4gaHR0cHM6
Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2FnZDVmL2xpbnV4Ly0vY29tbWl0LzcyYWRhODYwM2Uz
NjI5MWFkOTFlNGY0MGYxMGVmNzQyZWY3OWJjNGUKCk5vLCBJIGdldCB0aGUgd2FybmluZyB3aXRo
b3V0IGFueSBvZiB0aGVzZSBkZWJ1Z2dpbmcgb3B0aW9ucyBlbmFibGVkLiBJIGNhbgpyZXByb2R1
Y2Ugd2l0aCBqdXN0IGRlZmNvbmZpZyArIENPTkZJR19EUk1fQU1ER1BVPW0gd2hlbiBidWlsdCB3
aXRoIGNsYW5nIDE3LgoKUmVnYXJkcywKU2FtdWVsCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
