Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45F4C87FCE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 17:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cVUDEQG738yUzQ291Pnf6mFd2Ak8YpyKKPrjikqI1lg=; b=xl60mGaZnYu+V+
	7kt2M2pDXnOkmT4RX7kBifJSpI7PZ2/l3yZPCUhTZq6oQyqiVeOa769+35PIgqEP1WU+kkHiy0sG4
	6dR4yXgFTJSqW+PV8KnvfLJu/D378/OzP1TbjHWH4GIqzhJMN7dqnRefSGJwHlQzgC3xASLEuoxpe
	whp8kb9Kq0bBLrqLLgJGfgF3Jw2QIMtLnsE790BECw4yZw1pDnWyELETSAIZ+nkAEOYMD788MRjeC
	p5VBvfITQXVXzyME4sEvyikQKXSWGK9cRD2ViPGJmXYqimH0DSxXYZeTTZRe4D8cj6GNC4leJ876Z
	kp7ynJ1CeoJwDmBNjjhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRQT-0000000F4wt-01Pz;
	Mon, 28 Jul 2025 17:14:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQTS-0000000Ewcd-1bOi
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 16:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753719193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eFSyKJdecv/1MRDq0uV/UWoK1UBfsR1Jl9RmuHJI4aM=;
	b=bqnNJhz/BR2uzb+uqQlD4ITheVHt8OO9X17b6XHV6imc2d67NaMxwH0sTzUjkyylHO39Gx
	DNlKaqNkqa6FhtQ/+HrJObQyYlRkWnz68JB5EVoUa3lMWiHSsUPdmlDQ4QUrwJ9JFLXMQZ
	KqOEODRglwA0CWhGgRk6dmDhAGrbSqk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-0LU5Tw0-PGWduNOCFlTEAg-1; Mon, 28 Jul 2025 12:13:12 -0400
X-MC-Unique: 0LU5Tw0-PGWduNOCFlTEAg-1
X-Mimecast-MFC-AGG-ID: 0LU5Tw0-PGWduNOCFlTEAg_1753719191
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3b78329f180so1475054f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 09:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753719191; x=1754323991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFSyKJdecv/1MRDq0uV/UWoK1UBfsR1Jl9RmuHJI4aM=;
        b=F1++uK1UWKVbkFDrqEwo5KJj8ModxxfDaltu/B9lMv4Ig3Y4KNmuQPTnNSM2H75nCj
         XRRTZyL5fBxSMpZqg6sc11dtRWxi76e21zYfqX/niAt76cb54onZVEKYePKmWS3DrW9y
         VSqYee9zydgj9s19qX36WckNEdfoo3VUrTwHnE3S3OGxu5BWAYxSqK+0y9YgIZxFDwUb
         IaUQg0Kl0+7Zm3GtBJLNSkud/Ww69TTKLoZkDmw/MnhFT9eAmdyGUq+JghHH2kuIhKYQ
         JxazPGX9UXMMfCmrM02XmcDeiZjsZA0BT33rRV7olukokvBVk3ljvSS6cLV2jUKM73jT
         MoEw==
X-Forwarded-Encrypted: i=1; AJvYcCXp9PSeaBZBoQ/uViz3Wi/RcU2olkLAFcdIAlAPcJo0+McxHzQ/1/5rtxL+r5ZryTAIaoJciRcRSPNfuw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBzODhvajsXWvJxWuIttRfXr9DgrKQpuJNqn6EAsM8a5+jVeU/
	X/+E9E9Aws3R7lY5yTkGz1ATJXFV2Kw+JM8g8g0HaS0urqItHhuJAjGpGBeUAUFMnpPZx8igkkF
	iYODKGrRXpLqz1+svnNgf/S4mhB9HR6xK8ogSI9nFcPW2hmP2eqrMuBFJd1lVCy4TGZn+bdj2qR
	a8ehf10vrdF9OxhhermC4h+H07ciNiYV7qy0KWTS1cXKrW
X-Gm-Gg: ASbGnculO2zqTxxt3VYoaYGk5/r6zVLt1TEx7X8emT5YURn5oUwrSXOjybOgg+saANt
	g7QXLoTUEC5H6tXyGi/Pb3yHLdq4H+CsKlMy5Juuk9oWWcW7oUnQA2yMOuoefA47huNzTjH846G
	YJYBCYsUPfVDL9933SruJmIw==
X-Received: by 2002:a5d:5d86:0:b0:3b7:871b:8cba with SMTP id ffacd0b85a97d-3b7871b8d7fmr3956578f8f.55.1753719190775;
        Mon, 28 Jul 2025 09:13:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWWWEK4FMuzka8/nfxF96/PztlXrkB6yJIpynbPb+zfrrEU+L+fITa5lHzMJzyOEcmb5yZy3SmKtEj2AkMJio=
X-Received: by 2002:a5d:5d86:0:b0:3b7:871b:8cba with SMTP id
 ffacd0b85a97d-3b7871b8d7fmr3956548f8f.55.1753719190400; Mon, 28 Jul 2025
 09:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy12xtRRem-AybfymGHh+sj4qSDDG0XL6M6as=cD5Y2tkA@mail.gmail.com>
 <CABgObfYEgf9mTLWByDJeqDT+2PukVn3x2S0gu4TZQP6u5dCtoQ@mail.gmail.com> <CAAhSdy3Jr1-8TVcEhiCUrc-DHQSTPE1RjF--marQPtcV6FPjJA@mail.gmail.com>
In-Reply-To: <CAAhSdy3Jr1-8TVcEhiCUrc-DHQSTPE1RjF--marQPtcV6FPjJA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 28 Jul 2025 18:12:59 +0200
X-Gm-Features: Ac12FXwUHOVXqDpc5CP8DQR9OWMiwskCL4EwTXkcLoTa8Rg2-Y0UmIDt4HRK2XU
Message-ID: <CABgObfaDkfUa+=Dthqx_ZFy418KLFkqy2+tKLaGEZmbZ6SbhBA@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.17
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>, Atish Patra <atish.patra@linux.dev>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PleEepwfaJYLvKqn016mUkMRL779rAbM42eU-2S531Y_1753719191
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_091314_491185_45528AE9 
X-CRM114-Status: GOOD (  10.59  )
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

T24gTW9uLCBKdWwgMjgsIDIwMjUgYXQgNTo1NeKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdWwgMjgsIDIwMjUgYXQgOToyMuKAr1BNIFBh
b2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwg
SnVsIDI1LCAyMDI1IGF0IDI6MDbigK9QTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3Jn
PiB3cm90ZToKPiA+ID4gICAgICAgUklTQy1WOiBwZXJmL2t2bTogQWRkIHJlcG9ydGluZyBvZiBp
bnRlcnJ1cHQgZXZlbnRzCj4gPgo+ID4gU29tZXRoaW5nIGhlcmUgYXRlIFF1YW4gWmhvdSdzIFNp
Z25lZC1vZmYtYnkgbGluZSwgd2hpY2ggaXMgcHJlc2VudCBhdAo+ID4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci85NjkzMTMyZGY0ZDBmODU3YjhiZTNhNzU3NTBjMzZiNDAyMTNmY2MwLjE3MjYy
MTE2MzIuZ2l0Lnpob3VxdWFuQGlzY2FzLmFjLmNuCj4gPiBidXQgbm90IGluIHlvdXIgYnJhbmNo
Lgo+Cj4gVGhlcmUgd2VyZSBjb3VwbGUgb2YgIi0tLSIgbGluZXMgaW4gcGF0Y2ggZGVzY3JpcHRp
b24gd2hpY2gKPiBjcmVhdGVkIHByb2JsZW1zIGZvciBtZSBzbyBJIHRyaWVkIGZpeGluZyBtYW51
YWxseSBhbmQKPiBhY2NpZGVudGFsbHkgYXRlIFNpZ25lZC1vZmYtYnkuCj4KPiBTb3JyeSBhYm91
dCB0aGF0LgoKTm8gcHJvYmxlbS4gQW5vdGhlciAoYW5kIG1vcmUgaW1wb3J0YW50KSBxdWVzdGlv
biwgZm9yIFNCSSBGV0ZUIEkKZG9uJ3Qgc2VlIGFueSB3YXkgZm9yIHVzZXJzcGFjZSB0byAxKSBw
aWNrIHdoaWNoIGZlYXR1cmVzIGFyZQphdmFpbGFibGUgMikgcmV0cmlldmUgdGhlIHN0YXRlIGFu
ZCBwdXQgaXQgYmFjayBpbnRvIEtWTS4gQW0gSSBtaXNzaW5nCnNvbWV0aGluZz8KClBhb2xvCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
