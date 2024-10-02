Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52EACF6D28
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 15:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCIwqHil+vMiXQuVQXBK9keJbN0N3XlZUbYaPehY0rs=; b=bLggF2y58IhHf9
	1L3875dIBJFkBnVBNMgak/Y1ujdcFkBP8JB0PwY/Jxn1VPV/pYstk3VzwQzpqIZ1dtXvXxRWq5MUo
	wJU91IiO9G9OM7gcCJzF7Dil1lV+0GORhDkHN4EZ7ea8LFGsDkOYEU+EMii4xDdg//7R5kv+FkI/1
	Y7cmL8oiZCnwmpoLCa7eGw38CQBoKZyS/6CJ+rGLryKPW8dg6zfEC5GjNaLHFFzDmHW5G5fT3Y2bh
	ZeprDRXaxYugIjaICmGmzdZJBDL5BvpA6cgzgbTpULQHfCTO5kJ12YgkyGFR2YARBgjpwbsmceb4g
	dtq0TfKVGUWa10h8IRkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw0ww-00000006Y9Z-464x;
	Wed, 02 Oct 2024 15:07:35 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw0wt-00000006Y4H-1Ece
	for linux-riscv@lists.infradead.org;
	Wed, 02 Oct 2024 15:07:32 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-e25d57072dcso5936066276.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Oct 2024 08:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727881648; x=1728486448; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0i3BbfvxahvYvWq4i93XsiQMPyiTP9IxQ8M027AZbg4=;
        b=NfHzeuKryYp+ZbI4b8THAyczkcXoPpFHsE5ifRwhxAjklcVFUMr+MO5i0CCEDeQDJZ
         DqDleP52K8kN4JC14MXSypYnD956aoh+zu7xZjOWhOVggnxMWc6/BcOeXf3pPFAxGY2F
         uQLdjTNng/bZn/FPgQKAcnBajr8YMo24JDqBWsr751wCvkdlrlJb3Hn7eyUSMhhwA4Rx
         10Mr5Czvt9ZGMijBuR/+aUKxhUdz3O2W1UJdy4jRHy/Zo4Vb21fkkjY8LBQg6zfI/Etf
         R4Cc7U/Oayo+q9M0zJPXBiFdHJpeM8TdkC2FlH5CcnSQsDMMYh7ya1CJbeWk8keGd7Eg
         KWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727881648; x=1728486448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0i3BbfvxahvYvWq4i93XsiQMPyiTP9IxQ8M027AZbg4=;
        b=qW7O8J8tAJ4ggOKbWghuFgzGfru+7DfuWddsm4Z9g/k8934Rc6klbfUTEQ2ytNWvuZ
         eP6JmbroaBtBhSfaPEqBknqbf+vjtHkozdP7H9oRflS0yVZTSx3Tr2Tay3AroVLAv7WC
         XnFWMZrfjIH8Epswtw4rL9ge5jaLp8so5+fuJ15b9MfxLH+mXlAolHn1bmWgH3m/NC67
         RNzDVGoAXdQxpq5RJCaNcyHsPBE9B4BJl1GHhkzsEIvytekvQGcnXMuWyXRI61rTsNAa
         tQn9pN+SkcojAMt2DeWTzbrEqaf0cpH1l86lsE8E6+LLB4XKep4PRAD0bWtjDduTw72P
         WJbA==
X-Forwarded-Encrypted: i=1; AJvYcCX/ZQRFB8ucpf05FQNSh7O8qhlQI+F2NtOI6iBqyBtQBEwePvld6wQ0ZaaOXqVjf2vMemLxldnr0PgkwA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzeHhnaZKf0sg2EWsocJ4SPwGe74Oep7nGG/rpKan01cTyJjF5+
	iT00hU9PhvaBE/sekOVsQxxcndtPysLF5QG2VBhT5bOnxh0YgBVzy1W0adAmbhdu7fq5v2j/+bU
	lahNj2i9SyAnxS/1aa21XmiqiOss=
X-Google-Smtp-Source: AGHT+IH+TSllG/SCeTg8S09DQGLvV3T6Fg+wFdmO1qdI5EdM4tgcUUTykKxpYGsG9/W9hoY9YTFqiimHmtkpgobguAo=
X-Received: by 2002:a05:690c:4183:b0:6dd:ba22:d946 with SMTP id
 00721157ae682-6e2a2b8307bmr22986657b3.13.1727881648440; Wed, 02 Oct 2024
 08:07:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com> <20240911-xtheadvector-v10-1-8d3930091246@rivosinc.com>
In-Reply-To: <20240911-xtheadvector-v10-1-8d3930091246@rivosinc.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Wed, 2 Oct 2024 23:07:17 +0800
Message-ID: <CAFTtA3NwY7-KbtqWTRoDLv7AGRUo2efQrCa8=hfpPo1DB1RHyQ@mail.gmail.com>
Subject: Re: [PATCH v10 01/14] dt-bindings: riscv: Add xtheadvector ISA
 extension description
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
	Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
	Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_080731_391539_E952BF9B 
X-CRM114-Status: GOOD (  15.66  )
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

Q2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4g5pa8IDIwMjTlubQ55pyIMTLm
l6Ug6YCx5ZubIOS4i+WNiDE6NTflr6vpgZPvvJoKPgo+IFRoZSB4dGhlYWR2ZWN0b3IgSVNBIGV4
dGVuc2lvbiBpcyBkZXNjcmliZWQgb24gdGhlIFQtSGVhZCBleHRlbnNpb24gc3BlYwo+IEdpdGh1
YiBwYWdlIFsxXSBhdCBjb21taXQgOTUzNThjYjJjY2E5Lgo+Cj4gTGluazogaHR0cHM6Ly9naXRo
dWIuY29tL1QtaGVhZC1TZW1pL3RoZWFkLWV4dGVuc2lvbi1zcGVjL2Jsb2IvOTUzNThjYjJjY2E5
NDg5MzYxYzYxZDMzNWUwM2QzMTM0YjE0MTMzZi94dGhlYWR2ZWN0b3IuYWRvYyBbMV0KPgo+IFNp
Z25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Cj4gUmV2
aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+CgpSZXZp
ZXdlZC1ieTogQW5keSBDaGl1IDxhbmR5Ym5hY0BnbWFpbC5jb20+Cgo+IC0tLQo+ICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIHwgMTAgKysr
KysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55
YW1sCj4gaW5kZXggYTA2ZGJjNmI0OTI4Li4xYTNkMDFhZWRkZTYgMTAwNjQ0Cj4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlh
bWwKPiBAQCAtNTU2LDYgKzU1NiwxMCBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICAgICAgICBsYXRl
bmN5LCBhcyByYXRpZmllZCBpbiBjb21taXQgNTZlZDc5NSAoIlVwZGF0ZQo+ICAgICAgICAgICAg
ICByaXNjdi1jcnlwdG8tc3BlYy12ZWN0b3IuYWRvYyIpIG9mIHJpc2N2LWNyeXB0by4KPgo+ICsg
ICAgICAgICMgdmVuZG9yIGV4dGVuc2lvbnMsIGVhY2ggZXh0ZW5zaW9uIHNvcnRlZCBhbHBoYW51
bWVyaWNhbGx5IHVuZGVyIHRoZQo+ICsgICAgICAgICMgdmVuZG9yIHRoZXkgYmVsb25nIHRvLiBW
ZW5kb3JzIGFyZSBzb3J0ZWQgYWxwaGFudW1lcmljYWxseSBhcyB3ZWxsLgo+ICsKPiArICAgICAg
ICAjIEFuZGVzCj4gICAgICAgICAgLSBjb25zdDogeGFuZGVzcG11Cj4gICAgICAgICAgICBkZXNj
cmlwdGlvbjoKPiAgICAgICAgICAgICAgVGhlIEFuZGVzIFRlY2hub2xvZ3kgcGVyZm9ybWFuY2Ug
bW9uaXRvciBleHRlbnNpb24gZm9yIGNvdW50ZXIgb3ZlcmZsb3cKPiBAQCAtNTYzLDYgKzU2Nywx
MiBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICAgICAgICBSZWdpc3RlcnMgaW4gdGhlIEFYNDVNUCBk
YXRhc2hlZXQuCj4gICAgICAgICAgICAgIGh0dHBzOi8vd3d3LmFuZGVzdGVjaC5jb20vd3AtY29u
dGVudC91cGxvYWRzL0FYNDVNUC0xQy1SZXYuLTUuMC4wLURhdGFzaGVldC5wZGYKPgo+ICsgICAg
ICAgICMgVC1IRUFECj4gKyAgICAgICAgLSBjb25zdDogeHRoZWFkdmVjdG9yCj4gKyAgICAgICAg
ICBkZXNjcmlwdGlvbjoKPiArICAgICAgICAgICAgVGhlIFQtSEVBRCBzcGVjaWZpYyAwLjcuMSB2
ZWN0b3IgaW1wbGVtZW50YXRpb24gYXMgd3JpdHRlbiBpbgo+ICsgICAgICAgICAgICBodHRwczov
L2dpdGh1Yi5jb20vVC1oZWFkLVNlbWkvdGhlYWQtZXh0ZW5zaW9uLXNwZWMvYmxvYi85NTM1OGNi
MmNjYTk0ODkzNjFjNjFkMzM1ZTAzZDMxMzRiMTQxMzNmL3h0aGVhZHZlY3Rvci5hZG9jLgo+ICsK
PiAgICAgIGFsbE9mOgo+ICAgICAgICAjIFpjYiBkZXBlbmRzIG9uIFpjYQo+ICAgICAgICAtIGlm
Ogo+Cj4gLS0KPiAyLjQ1LjAKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
