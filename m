Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC499C3DA61
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 09:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/mYPYS4ffxK4+eQMkkK3HqQbYbrJe0BM53Ggx3cT58s=; b=BjuNHlayF9CwVA
	5cT9auz+Vur+5La41UNDPDnbQMbjnIlHZhC6GZqJLtG5WKEya9ehLPg9RUFq2kDdKIkz566n/BhD/
	gSrlktLpCRZcMKXik4rAKhMt/YmEdHgpkHvaS/cvHFKPq2g0z3yNrNFBXvJFswf9PE3BPcyc/9yEz
	yWKbg2nV3ssBMF/uODLVD6xyKEK5Xajjv00tc+A1S1NmniFxE20hClio+mL2hee+puWBeS6AM9/w6
	DPcNGSYy7PJhCo1u1zzu5+2aG6zsyCx0BcZnAEKHmHETgAjDenF4RL7zLIy4gtJWYEj53aiqSHoUE
	Fy793NSzvRaRHmuszQYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYiiC-0000000EPiN-30pi;
	Tue, 30 Jul 2024 09:00:04 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYii3-0000000EPc8-3XLM
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 08:59:57 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-36874d7f70bso430006f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jul 2024 01:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722329994; x=1722934794; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nNVuxs1MrMq4lcDOUZmx3vJTp4xEo5IRLOaYragrSo8=;
        b=CN3VZ6WAveiSUpvGo+0QZgVPxZD5j3t4B9zlCNK5KSsNcLWgN4dyzq5+SCJmrz+XLu
         ordsn/zGtbMgvlQvTRqy4Ig0ZMmXHndk+sdz9yDMBFsXDDEz1VId3BPZFXXs25w8yuFA
         lHXGs3X9XBn8Xv9ISXT2PvWbEsSuiyGpd9Ilhzn6Li2H8y7xrKkx91Gr8KwslPrOQNe8
         /DpQbDxlUPLeYozkF/+98KpPTiNKYukwJmdIAay+GSZ+bs1NWNSBZ7hgBEi9b4XJCybm
         V9GG8Juq78K2UI1YaK8Fxzf6JVx3u2EOAuaK0pOpAo5UhsfYPug2dx6nzbg/+HGpoL3C
         cy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722329994; x=1722934794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nNVuxs1MrMq4lcDOUZmx3vJTp4xEo5IRLOaYragrSo8=;
        b=tAZ84VBMd9U1bV/jaHMUMmS21xmZVkH83Bun0ZuUbsSBmuXz9IDP6dgJQ7DzW2KmlU
         f+/0OR7+qtB5osur6feyx0pBANbHnRBbFbBamPRiGunc3c/gD51Lm//4+45/97r6+5Mv
         ZyLUe3KfOQrAvGKTxyDBXv7oHUxRMPn+CzZxet8wp3ET/Q6X/KdkMaxTjl2ytvpb6PXo
         jxFGTl3f0/S+aK8zKzYOu4PWdVg/aco+7ooyJO7ZCGqj+b7ZzXnlugEvDMHfgU/ptu8c
         uD7D0O1giE67rBlr9F9WI0dVM3NDWGc22ohXxfMKjgi1ZoqjCzVk38D/LM/4dMJIEJ4B
         t0ng==
X-Forwarded-Encrypted: i=1; AJvYcCXew469A2F+sOsSp4tMuxMmeM4nPqdIlsEdq9EE5XfNX0yC0YM1KNoDqnZgCLMpuMR74kNv0CG6Tgpxpg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxdT+LfQBHPXoEvxoWoqpQPdnql7hIAvZ3gpMWyv33MSv3GKZwm
	0e+56XFbRPNi50kLUXu9CEo1IJLo/v24UfOVC1ArYnApd9V3rel9Q0ZXiQFB91s=
X-Google-Smtp-Source: AGHT+IFoWKDhfiVSA9aPn4FBTB1PiREVVPkTaeG764ytCjXhR/sBVssh7utGGffqhcPp0zgg8YjliA==
X-Received: by 2002:a05:600c:3b87:b0:426:668f:5ed7 with SMTP id 5b1f17b1804b1-42805700160mr73422405e9.2.1722329993329;
        Tue, 30 Jul 2024 01:59:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428240b3b25sm11235555e9.0.2024.07.30.01.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 01:59:53 -0700 (PDT)
Message-ID: <28d780da-4f43-4db5-8e1b-c66bb9973cd1@rivosinc.com>
Date: Tue, 30 Jul 2024 10:59:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tools: Add riscv barrier implementation
To: Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrea Parri <parri.andrea@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20240729-optimize_ring_buffer_read_riscv-v1-0-6bbc0f2434ee@rivosinc.com>
 <20240729-optimize_ring_buffer_read_riscv-v1-1-6bbc0f2434ee@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240729-optimize_ring_buffer_read_riscv-v1-1-6bbc0f2434ee@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_015956_153971_37883D68 
X-CRM114-Status: GOOD (  17.99  )
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

CgpPbiAyOS8wNy8yMDI0IDIyOjUwLCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4gTWFueSBvZiB0
aGUgb3RoZXIgYXJjaGl0ZWN0dXJlcyB1c2UgdGhlaXIgY3VzdG9tIGJhcnJpZXIgaW1wbG1lbnRh
dGlvbnMuCgpIaSBDaGFybGllLAoKVHlwbzogaW1wbG1lbnRhdGlvbnMgLT4gaW1wbGVtZW50YXRp
b25zCgo+IFVzZSB0aGUgYmFycmllciBjb2RlIGZyb20gdGhlIGtlcm5lbCBzb3VyY2VzIHRvIG9w
dGltaXplIGJhcnJpZXJzIGluCj4gdG9vbHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBK
ZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgdG9vbHMvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9iYXJyaWVyLmggfCAzOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCj4gIHRvb2xzL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZmVuY2UuaCAgIHwgMTMgKysrKysr
KysrKysrCj4gIHRvb2xzL2luY2x1ZGUvYXNtL2JhcnJpZXIuaCAgICAgICAgICAgIHwgIDIgKysK
PiAgMyBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3Rv
b2xzL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYmFycmllci5oIGIvdG9vbHMvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9iYXJyaWVyLmgKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAwMDAwMC4uNjk5N2YxOTcwODZkCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3Rvb2xzL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vYmFycmllci5oCj4gQEAgLTAsMCArMSwzOSBAQAo+ICsvKiBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5ICovCj4gKy8qCj4gKyAqIENvcGllZCBm
cm9tIHRoZSBrZXJuZWwgc291cmNlcyB0byB0b29scy9hcmNoL3Jpc2N2Ogo+ICsgKgo+ICsgKiBD
b3B5cmlnaHQgKEMpIDIwMTIgQVJNIEx0ZC4KPiArICogQ29weXJpZ2h0IChDKSAyMDEzIFJlZ2Vu
dHMgb2YgdGhlIFVuaXZlcnNpdHkgb2YgQ2FsaWZvcm5pYQo+ICsgKiBDb3B5cmlnaHQgKEMpIDIw
MTcgU2lGaXZlCj4gKyAqLwo+ICsKPiArI2lmbmRlZiBfVE9PTFNfTElOVVhfQVNNX1JJU0NWX0JB
UlJJRVJfSAo+ICsjZGVmaW5lIF9UT09MU19MSU5VWF9BU01fUklTQ1ZfQkFSUklFUl9ICj4gKwo+
ICsjaW5jbHVkZSA8YXNtL2ZlbmNlLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9jb21waWxlci5oPgo+
ICsKPiArLyogVGhlc2UgYmFycmllcnMgbmVlZCB0byBlbmZvcmNlIG9yZGVyaW5nIG9uIGJvdGgg
ZGV2aWNlcyBhbmQgbWVtb3J5LiAqLwo+ICsjZGVmaW5lIG1iKCkJCVJJU0NWX0ZFTkNFKGlvcncs
IGlvcncpCj4gKyNkZWZpbmUgcm1iKCkJCVJJU0NWX0ZFTkNFKGlyLCBpcikKPiArI2RlZmluZSB3
bWIoKQkJUklTQ1ZfRkVOQ0Uob3csIG93KQo+ICsKPiArLyogVGhlc2UgYmFycmllcnMgZG8gbm90
IG5lZWQgdG8gZW5mb3JjZSBvcmRlcmluZyBvbiBkZXZpY2VzLCBqdXN0IG1lbW9yeS4gKi8KPiAr
I2RlZmluZSBzbXBfbWIoKQlSSVNDVl9GRU5DRShydywgcncpCj4gKyNkZWZpbmUgc21wX3JtYigp
CVJJU0NWX0ZFTkNFKHIsIHIpCj4gKyNkZWZpbmUgc21wX3dtYigpCVJJU0NWX0ZFTkNFKHcsIHcp
Cj4gKwo+ICsjZGVmaW5lIHNtcF9zdG9yZV9yZWxlYXNlKHAsIHYpCQkJCQkJXAo+ICtkbyB7CQkJ
CQkJCQkJXAo+ICsJUklTQ1ZfRkVOQ0UocncsIHcpOwkJCQkJCVwKPiArCVdSSVRFX09OQ0UoKnAs
IHYpOwkJCQkJCVwKPiArfSB3aGlsZSAoMCkKPiArCj4gKyNkZWZpbmUgc21wX2xvYWRfYWNxdWly
ZShwKQkJCQkJCVwKPiArKHsJCQkJCQkJCQlcCj4gKwl0eXBlb2YoKnApIF9fX3AxID0gUkVBRF9P
TkNFKCpwKTsJCQkJXAo+ICsJUklTQ1ZfRkVOQ0UociwgcncpOwkJCQkJCVwKPiArCV9fX3AxOwkJ
CQkJCQkJXAo+ICt9KQo+ICsKPiArI2VuZGlmIC8qIF9UT09MU19MSU5VWF9BU01fUklTQ1ZfQkFS
UklFUl9IICovCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZmVu
Y2UuaCBiL3Rvb2xzL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZmVuY2UuaAo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4zNzg2MGU4Njc3MWQKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIvdG9vbHMvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mZW5jZS5oCj4gQEAgLTAs
MCArMSwxMyBAQAo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5ICov
Cj4gKy8qCj4gKyAqIENvcGllZCBmcm9tIHRoZSBrZXJuZWwgc291cmNlcyB0byB0b29scy9hcmNo
L3Jpc2N2Ogo+ICsgKi8KPiArCj4gKyNpZm5kZWYgX0FTTV9SSVNDVl9GRU5DRV9ICj4gKyNkZWZp
bmUgX0FTTV9SSVNDVl9GRU5DRV9ICj4gKwo+ICsjZGVmaW5lIFJJU0NWX0ZFTkNFX0FTTShwLCBz
KQkJIlx0ZmVuY2UgIiAjcCAiLCIgI3MgIlxuIgo+ICsjZGVmaW5lIFJJU0NWX0ZFTkNFKHAsIHMp
IFwKPiArCSh7IF9fYXNtX18gX192b2xhdGlsZV9fIChSSVNDVl9GRU5DRV9BU00ocCwgcykgOiA6
IDogIm1lbW9yeSIpOyB9KQo+ICsKPiArI2VuZGlmCS8qIF9BU01fUklTQ1ZfRkVOQ0VfSCAqLwo+
IGRpZmYgLS1naXQgYS90b29scy9pbmNsdWRlL2FzbS9iYXJyaWVyLmggYi90b29scy9pbmNsdWRl
L2FzbS9iYXJyaWVyLmgKPiBpbmRleCA4ZDM3OGM1N2NiMDEuLjBjMjE2NzhhYzVlNiAxMDA2NDQK
PiAtLS0gYS90b29scy9pbmNsdWRlL2FzbS9iYXJyaWVyLmgKPiArKysgYi90b29scy9pbmNsdWRl
L2FzbS9iYXJyaWVyLmgKPiBAQCAtOCw2ICs4LDggQEAKPiAgI2luY2x1ZGUgIi4uLy4uL2FyY2gv
YXJtNjQvaW5jbHVkZS9hc20vYmFycmllci5oIgo+ICAjZWxpZiBkZWZpbmVkKF9fcG93ZXJwY19f
KQo+ICAjaW5jbHVkZSAiLi4vLi4vYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2JhcnJpZXIuaCIK
PiArI2VsaWYgZGVmaW5lZChfX3Jpc2N2KQo+ICsjaW5jbHVkZSAiLi4vLi4vYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9iYXJyaWVyLmgiCj4gICNlbGlmIGRlZmluZWQoX19zMzkwX18pCj4gICNpbmNs
dWRlICIuLi8uLi9hcmNoL3MzOTAvaW5jbHVkZS9hc20vYmFycmllci5oIgo+ICAjZWxpZiBkZWZp
bmVkKF9fc2hfXykKPiAKCkNhbiBub3QgcmVhbGx5IHRlbGwgZm9yIHRoYXQgcGFydCBleGNlcHQg
aXQgc2VlbXMgb2sgdG8gbWUgYXMgd2VsbC4KQW5kcmVhIG1pZ2h0IGJlIGEgYmV0dGVyIGNhbmRp
ZGF0ZSB0byBhZGQgaXRzIFJiLgoKVGhhbmtzLAoKQ2zDqW1lbnQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
