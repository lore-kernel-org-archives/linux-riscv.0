Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16CAC25B78
	for <linux-riscv@archiver.kernel.org>; Thu, 16 May 2024 12:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KLrT3NMF+W+dQPjiGaRhHWDpmdZxsbpitdQc/IzP02M=; b=3HPEF9VtHTDkYx
	ym1oazeBI1aAJoGgz1Vp+7f6YvbIWSbbd5Oo1TrdOC6fD8TExxzT/N5g7WA1GA3bKlW9yiDh7Y8as
	XQtTvwph4mZRPfs4H7eZO3tYCsDpbG076t5Vs6DOKbCz4fW1b7GtdUDddfkxPiwkMH3xy2XND1v+P
	YBk1tJiOjdjFMxiijXks7WznF7QF7SdW37/Sz9nESoy5RTfFXZTwRyhVxdBIifaajnTZxN/8e4W7S
	UTeR/8oow8TPkTDTjtBE74vuQPw6INzH06zqG/Z1Uw0ElEEUhihBQxrG0dwUFfKM3ObdJfLzo5Flc
	UfChNsvQVkaVd1QhCkyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7aXC-00000004sNm-1XN7;
	Thu, 16 May 2024 12:48:34 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7aX9-00000004sMG-2E1x
	for linux-riscv@lists.infradead.org;
	Thu, 16 May 2024 12:48:33 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-6181d032bf9so79383637b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 May 2024 05:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715863708; x=1716468508; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0YMZmj/yuBSBh3+Prm3doCFTI5UB0khyraQ6llJYcQ=;
        b=a5zNlpccbEd/fVoDojflFD0y7B0axGTYZDUBZKYFKuOpL15ZcHLpOXJ2zXlxKpmZRu
         Wq0v6yf8InoIqikq2WcjwDzmQubw0ELNuwuZalAsU6ccKssveEh5btNAuvj4nEcufR/+
         2lVAUvsr8E5+iaoyWibSPB4rwdULhtOoSDXjmvX00SyL0dxDTO8J+kfykuihWEhBHbkF
         To74jJ3LW+HjWwsSQCjVIKB76bpwx2uFLHLymQakk9c8a5ECD2BCu48O/d0HUZfI4KWL
         rnKgFOg77eSH/JgvBNU0FCZyGB0RrduSI1Ln3/64UJxEsUjhaCJpEU6efwiKknP7pkz4
         Z66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715863708; x=1716468508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0YMZmj/yuBSBh3+Prm3doCFTI5UB0khyraQ6llJYcQ=;
        b=mwLHm3Tgw20nYMS1jw73noe6lVMdL7ssR6CVFAtWu7VQm16kNIYdg7gncOiNMIH5wL
         /jtzna96F3Svh7hNyMmkd753MyN/Bu+wrcuyj6+xk2pFobnzVjRtBPFA/fhQ8jrbnZ6n
         KqGsAAULrU+F7rt1AJv6SGXhJqFdT2YNwN3QoBKBnA3Ij0YlaA8WnmHJCWQNp6JgASjk
         4XhY6fY7MUbjUPvcHEXmYzu23KeTmMMKpUWkLZIxnFydHTfBFjDaaqCxmFMp4cH0B8u8
         /x6mQTH0Nmb3jlN8QqyGI0sBexZ7srFgS2oL4UCy8jKzGWfuhzT4m2apfPj3yNBIq3YP
         lseg==
X-Forwarded-Encrypted: i=1; AJvYcCVf4Rgj+xP7whYV32NSHhRBIUQDPa5j0a7TjQJOMPgvK9YnWiDewNl6Wf5YfHkmIdbDamsplbTMYi5OY5Nh7xC1C8EPqcspoUlo2WPv08Bv
X-Gm-Message-State: AOJu0YziC4WiMn1sf9Dpdil4l+8HWzA/7JfXLFaRmsKtkoXjuy3NPif9
	zNlHpbMzKT5unTL+4JDDXTG/iUURlZSxTehzEv7+GQVFK3JW2OuOpJEd2wl6GrpI7pPD99hLd1k
	fNB8DuzEBuAF//e+BJW7IWW2J8qdxKe6GoMNVmw==
X-Google-Smtp-Source: AGHT+IFmiatJ0VGsQTQP54hpUSwoqwi/xnPZ1Pzr4sv0QEqyqVyV9N5SU92rESBXEGjCyeby+CMydFjJBhLe6iYVziE=
X-Received: by 2002:a81:c70d:0:b0:61b:1bf5:67a9 with SMTP id
 00721157ae682-622affc9c33mr175662497b3.22.1715863708404; Thu, 16 May 2024
 05:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
 <20240503-dev-charlie-support_thead_vector_6_9-v6-1-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-1-cb7624e65d82@rivosinc.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 16 May 2024 20:48:17 +0800
Message-ID: <CABgGipU6rybwUo3ZW_RhH5VgWcFqV0x6RTrKAaMXS6=tfe2t5Q@mail.gmail.com>
Subject: Re: [PATCH v6 01/17] dt-bindings: riscv: Add xtheadvector ISA
 extension description
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_054831_608239_C5FC4116 
X-CRM114-Status: GOOD (  16.18  )
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

T24gU2F0LCBNYXkgNCwgMjAyNCBhdCAzOjMz4oCvQU0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGll
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGUgeHRoZWFkdmVjdG9yIElTQSBleHRlbnNpb24g
aXMgZGVzY3JpYmVkIG9uIHRoZSBULUhlYWQgZXh0ZW5zaW9uIHNwZWMKPiBHaXRodWIgcGFnZSBb
MV0gYXQgY29tbWl0IDk1MzU4Y2IyY2NhOS4KPgo+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9U
LWhlYWQtU2VtaS90aGVhZC1leHRlbnNpb24tc3BlYy9ibG9iLzk1MzU4Y2IyY2NhOTQ4OTM2MWM2
MWQzMzVlMDNkMzEzNGIxNDEzM2YveHRoZWFkdmVjdG9yLmFkb2MgWzFdCj4KPiBTaWduZWQtb2Zm
LWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+IFJldmlld2VkLWJ5
OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgoKUmV2aWV3ZWQtYnk6
IEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNpZml2ZS5jb20+Cgo+IC0tLQo+ICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIHwgMTAgKysrKysrKysr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4g
aW5kZXggNDY4YzY0NjI0N2FhLi45OWQyYTllOGM1MmQgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPiBA
QCAtNDc3LDYgKzQ3NywxMCBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICAgICAgICBsYXRlbmN5LCBh
cyByYXRpZmllZCBpbiBjb21taXQgNTZlZDc5NSAoIlVwZGF0ZQo+ICAgICAgICAgICAgICByaXNj
di1jcnlwdG8tc3BlYy12ZWN0b3IuYWRvYyIpIG9mIHJpc2N2LWNyeXB0by4KPgo+ICsgICAgICAg
ICMgdmVuZG9yIGV4dGVuc2lvbnMsIGVhY2ggZXh0ZW5zaW9uIHNvcnRlZCBhbHBoYW51bWVyaWNh
bGx5IHVuZGVyIHRoZQo+ICsgICAgICAgICMgdmVuZG9yIHRoZXkgYmVsb25nIHRvLiBWZW5kb3Jz
IGFyZSBzb3J0ZWQgYWxwaGFudW1lcmljYWxseSBhcyB3ZWxsLgo+ICsKPiArICAgICAgICAjIEFu
ZGVzCj4gICAgICAgICAgLSBjb25zdDogeGFuZGVzcG11Cj4gICAgICAgICAgICBkZXNjcmlwdGlv
bjoKPiAgICAgICAgICAgICAgVGhlIEFuZGVzIFRlY2hub2xvZ3kgcGVyZm9ybWFuY2UgbW9uaXRv
ciBleHRlbnNpb24gZm9yIGNvdW50ZXIgb3ZlcmZsb3cKPiBAQCAtNDg0LDUgKzQ4OCwxMSBAQCBw
cm9wZXJ0aWVzOgo+ICAgICAgICAgICAgICBSZWdpc3RlcnMgaW4gdGhlIEFYNDVNUCBkYXRhc2hl
ZXQuCj4gICAgICAgICAgICAgIGh0dHBzOi8vd3d3LmFuZGVzdGVjaC5jb20vd3AtY29udGVudC91
cGxvYWRzL0FYNDVNUC0xQy1SZXYuLTUuMC4wLURhdGFzaGVldC5wZGYKPgo+ICsgICAgICAgICMg
VC1IRUFECj4gKyAgICAgICAgLSBjb25zdDogeHRoZWFkdmVjdG9yCj4gKyAgICAgICAgICBkZXNj
cmlwdGlvbjoKPiArICAgICAgICAgICAgVGhlIFQtSEVBRCBzcGVjaWZpYyAwLjcuMSB2ZWN0b3Ig
aW1wbGVtZW50YXRpb24gYXMgd3JpdHRlbiBpbgo+ICsgICAgICAgICAgICBodHRwczovL2dpdGh1
Yi5jb20vVC1oZWFkLVNlbWkvdGhlYWQtZXh0ZW5zaW9uLXNwZWMvYmxvYi85NTM1OGNiMmNjYTk0
ODkzNjFjNjFkMzM1ZTAzZDMxMzRiMTQxMzNmL3h0aGVhZHZlY3Rvci5hZG9jLgo+ICsKPiAgYWRk
aXRpb25hbFByb3BlcnRpZXM6IHRydWUKPiAgLi4uCj4KPiAtLQo+IDIuNDQuMAo+Cj4KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
