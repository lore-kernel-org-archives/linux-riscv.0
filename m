Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F91E77171
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 06:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iRU8bosRkSIjFzrQF39o+gt72xUrCenEwKFoUNWc4ns=; b=m6K5WpxjDEbpah
	eKqM9IMUGKSzbpHcoV0iUBSf41qCozFAdzvchG7nLqKs32OhJemTvotmoJK8iQO0YKXUgEwbU5zzZ
	EXJ3OKpb8PDwRjFkql0iEqXckVExh7WFPYbo4CuGMPpeKJY6cylDnh9iT4pW4Jqu+FVzBAm3NDqJG
	Jm9Q/t29NN/E89X7Dg+D1EZY6KbBT6ECjdZ1eKCd4EmzgfccdntcKCFXfnfaLKQJrUcfZDFYRBmx7
	ay6y+pWqHaPcXZCk+rOmjXzAtZrsW+Ewl9rblOYZH9Q/mDOwAES/mTVMDGTOguKznIlpgpdUvsTcb
	cv3a1c5MPzHk4eojvcBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ53L-0000000EreT-1kO2;
	Thu, 05 Dec 2024 06:09:31 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ53I-0000000ErdW-2vzR
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 06:09:29 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-84198253240so20082739f.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Dec 2024 22:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1733378968; x=1733983768; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aL2ODb59ZMLyvYZNKyPV9w4ocXZc2/Drlrpw4dYUQ6s=;
        b=LwTangLmsC7orkr5Jh8zleHqRtjPd5hRLZ6X8Q1rJj7sXzbNk9rFuPRK8kPzby8xIc
         LBIGJtvli3kgnOJuVdk0IDXR6E6N5x+b0oahJIRVuM6hQ1WPnx0OmZKM9X1BEzIea+jH
         8aPeYhMEGkTGq0/NQnvnOL53uDYM/dihhTipmyWhxVo/uZSlW2JpU7BShE6eq7a3FOqh
         nYzxuVH5UefAYVqswFJZ1F/BiZxDrWCXEijCnYfPDSQ0xMdR1gLLrVcJqdfOpvnDS+Yi
         LYKMCPIEolB3rueUTBRzBhqk1Ni5NZ2Ct2EwkPnMxSEfcPkDDgusQD7CkpYd+fmX4i9J
         pluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733378968; x=1733983768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aL2ODb59ZMLyvYZNKyPV9w4ocXZc2/Drlrpw4dYUQ6s=;
        b=WSq5P661yf3XOEkxxED+/T6ZnGFRvCk6/aLMyvn0p3/IDHtm6e4znxhkqR3BEMeU5k
         /Hsl60trXG09uc9zFBUx9zEiuXpVGaaO6ut26Pte1OASOjYV4TUr+cSzBHOpIowh4Bxa
         3hxiZxI7RoS1Md9iJVr41Q/JFAnwwuATTcOs4JnFTzUwYb4NFAD5/21Pz9TRvXmBvDz3
         //dzE0drGAXH/FPMODCY4XNzw6ghtLF0EmNfgMJwBzQuFvKej4ucZN6sxqaLfIbTyFuX
         xDNXTK/N7ohm5Ek8Tal0+9HDjk1PLmGfsCwZWwVMiKu9XmrLUpsCKpPmvEHsEaVLLbpA
         SdXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJZooun0iRf2TL/usraMGzj4eENL6Y63Hn/H1TGUOlHZIPtT1PbhHaFnQMa6SEE29IOXmUMJQ2X/q1MQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxyK/8NCdqgYD1+OLIomwUSUNQBfwbHmER2SqEaJ6VJ/OtA1H47
	3eJ/6/lvaiHGDYJhnUGHemnarjwuY644p2mb6fTiba7IHoDWSDAbUC0gubVoEQK3lysvbDwYCN8
	fBNrjbLQ45jWXL2zwlbtm8wgM2x5e4PCBW4QVhw==
X-Gm-Gg: ASbGncsCayClT6S/gtMLvIsJtf1s3dNbL314RWTSJFZvj2WgBffix5FRaLztXGTHnW/
	xO0ik6rF3zV5oU2Kdi3Larjt8YZMGVQ==
X-Google-Smtp-Source: AGHT+IEOJFcAi0n4c1mbGRpzcMhoQOlyi+pjiyaxzgnJjkOrtltLnY8I/trZOofEuFvj7Y58FOr5LXqv2HOUgAuNT5U=
X-Received: by 2002:a05:6602:160b:b0:83a:7a19:1de0 with SMTP id
 ca18e2360f4ac-8445b5e5949mr1404993539f.14.1733378967761; Wed, 04 Dec 2024
 22:09:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.1732854096.git.zhouquan@iscas.ac.cn>
In-Reply-To: <cover.1732854096.git.zhouquan@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 5 Dec 2024 11:39:16 +0530
Message-ID: <CAAhSdy2aPmV6U+GnCnqExXzO3okpDFTbCgwz+Y=dZDVBO0E7Eg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] RISC-V: KVM: Allow Svvptc/Zabha/Ziccrse exts for guests
To: zhouquan@iscas.ac.cn
Cc: ajones@ventanamicro.com, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_220928_737718_528D19D8 
X-CRM114-Status: GOOD (  10.04  )
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

T24gTW9uLCBEZWMgMiwgMjAyNCBhdCA4OjUz4oCvQU0gPHpob3VxdWFuQGlzY2FzLmFjLmNuPiB3
cm90ZToKPgo+IEZyb206IFF1YW4gWmhvdSA8emhvdXF1YW5AaXNjYXMuYWMuY24+Cj4KPiBBZHZl
cnRpc2UgU3Z2cHRjL1phYmhhL1ppY2Nyc2UgZXh0ZW5zaW9ucyB0byBLVk0gZ3Vlc3QKPiB3aGVu
IHVuZGVybHlpbmcgaG9zdCBzdXBwb3J0cyBpdC4KPgo+IC0tLQo+IENoYW5nZSBzaW5jZSB2MToK
PiAtIEFycmFuZ2UgU3Z2cHRjIGluIGFscGhhYmV0aWNhbCBvcmRlciAoQW5kcmV3KQo+IC0gQWRk
IFJldmlld2VkLWJ5IHRhZ3MKPgo+IC0tLQo+IHYxIGxpbms6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsL2NvdmVyLjE3MzI3NjIxMjEuZ2l0Lnpob3VxdWFuQGlzY2FzLmFjLmNuLwo+Cj4g
UXVhbiBaaG91ICg0KToKPiAgIFJJU0MtVjogS1ZNOiBBbGxvdyBTdnZwdGMgZXh0ZW5zaW9uIGZv
ciBHdWVzdC9WTQo+ICAgUklTQy1WOiBLVk06IEFsbG93IFphYmhhIGV4dGVuc2lvbiBmb3IgR3Vl
c3QvVk0KPiAgIFJJU0MtVjogS1ZNOiBBbGxvdyBaaWNjcnNlIGV4dGVuc2lvbiBmb3IgR3Vlc3Qv
Vk0KPiAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIFN2dnB0Yy9aYWJoYS9aaWNjcnNlIGV4
dHMgdG8gZ2V0LXJlZy1saXN0Cj4gICAgIHRlc3QKClF1ZXVlZCB0aGlzIHNlcmllcyBmb3IgNi4x
NAoKVGhhbmtzLApBbnVwCgo+Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCAg
ICAgICAgICAgICAgICB8ICAzICsrKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAg
ICAgICAgICAgICAgICAgICAgfCAgNiArKysrKysKPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
a3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jIHwgMTIgKysrKysrKysrKysrCj4gIDMgZmlsZXMgY2hh
bmdlZCwgMjEgaW5zZXJ0aW9ucygrKQo+Cj4gLS0KPiAyLjM0LjEKPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
