Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1747C3ABD9
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 13:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B8Vsu5vPL6oWjPOPO427MF6hVKeUICLvoYJFEG+/foc=; b=os7XyBdOh+va+h
	cOBpg+fja3c13/N/AHPcGmVTOukRzpE0Wmy4uEJnvXXSAkqSpDm/43FUtd670o99insrPy2OwYDYA
	FZkL3j+fNO0rXviekSYsNRHxHkVQLDV6yGugYYPlk4+THpne4EDh9NpzwKe+Sh21DaIVgKYZCyhrW
	cNy/y2WQXzHyRbrS/jxy5UQxTdff4qMU4jr/W3YlJpNmlEj66k32NzT0DJpjs/hzqnU5TE27s/coB
	6Pq+tSC3LDeN8tJnHWCg4i9zU0lutzDKA68ruDCLansMHWPCKJIMi3KmP9QlhhBaWgt0qvZW2kbWk
	udN7k0EthZVn6cpjnQBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCYB-0000000FHbP-0MH4;
	Wed, 14 May 2025 13:53:35 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF9ll-0000000EqA9-2tsT
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 10:55:27 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-86135d11760so547487439f.2
        for <linux-riscv@lists.infradead.org>; Wed, 14 May 2025 03:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1747220124; x=1747824924; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRXF9DYELCFr5DWcRHF2au4ZCt3rEGvlc0W9vQ4Jvt0=;
        b=oZEQd3VTmgK4BunI0PAPH+EONIXDOdg4MK4cN6F3s6Yv1KXtcrc5KzUxlk7G+0bqbQ
         kWxZOA0XAQtpzZoYNeZekEjTWkVT4fO5KR4eN9d1B/PvYS61aqFpnmJnd56KI8hgaiHY
         amjyVFZtfjf+T30wM3Q89at5QK0FmgLyefPDGuUvX4dWEJvyHsaQdCeX635BED6ugyhB
         3sI0mW6dl7ur1Z4bECMsnQyUqudTw3I3HwoNkke0fCz7S56FPE85M/WuNjJIGHl2NP9x
         a1Gw7kXT9G6+qjvPzhoPOg1Ck3SQxq6txidqD3LIQPeXvOz9bIReYbeNg0Liycr74KJt
         q0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747220124; x=1747824924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FRXF9DYELCFr5DWcRHF2au4ZCt3rEGvlc0W9vQ4Jvt0=;
        b=PI6uJ1bne+gzST00j1g1R6A3mGpW4B8G2HxJfABij43U47N9IyHDbFy4C52WQ8YZBa
         /2/xNA/o1ebX8tMrqJKKwwYUxd6fl4L0KwdmlEXoB9/INJNiQTkTD2vf6xBjP9LLAAMb
         P3gEYwmoOLkoIYf/hYoD+IT7G/NeGPShAf+4SrMDYQPVDCFWWsBjAxGXP2LiehPOcYAL
         8BU05U9OApOOgm28z1SPR3O4s0W8USOHZJoA9zMcVouSmdHHiPf6/WA//QVxriFbhOKG
         9WOZb03LzRqZ8r5ZHdsmUIuG11zacjPl+ZDr0d0UbZpIVBIm1scvCxKpjtboTdLH6T/u
         yJ9w==
X-Forwarded-Encrypted: i=1; AJvYcCXMbFt30rs7QSUCX7rpilPOtJsQ+7vTuleGc+RE8RZcRR+RFQSlWH33rgIo5ZHIeB6A1F2rFYATE3UlnQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzyCYe3yTNGEkeyu57y/VhVO7l0bkKPMSLPPJ+Je+FTwsSn55K4
	8nqfpFDr599Q1tsruU2mH9yJgmhv19eoBTR2lfn4jV6D4wPf/OYv1NKDPds78zb9OHwup/ze1/X
	aw2PA+Ux1MnsNB0eU0fvMUbR/7wVeegcHo2z+dw==
X-Gm-Gg: ASbGncvbMcGwz0VNnIT6LQavw69PIELw6KINeyNg5jWiL3mde0ZVon+7S+ZI2szljcp
	NOemMsYoHqs6yGbB6GJ1ViPZkyrjwmIkkrArBKOBnfq8tWYvW5dRuEjkWfDkWhr0InP9L5zx+B/
	l4jIw6PnVgzbq5TxXW9Qv3MGbHKAG89twQeBavDB7JHwtQ
X-Google-Smtp-Source: AGHT+IEsUcIqOtDh4qY84VrR7dhWsUpg7gwW9C2txJWoPP6k/tpHi1CvIf0OsIfE3p0Zr1XdgR25bvUfnZ7cRBd3PFw=
X-Received: by 2002:a05:6e02:198b:b0:3db:75b6:7624 with SMTP id
 e9e14a558f8ab-3db75b6780fmr2850135ab.11.1747220124329; Wed, 14 May 2025
 03:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250513-fix_scounteren_vs-v1-1-c1f52af93c79@rivosinc.com>
In-Reply-To: <20250513-fix_scounteren_vs-v1-1-c1f52af93c79@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 14 May 2025 16:25:12 +0530
X-Gm-Features: AX0GCFtIxlTWYfHTygNZSZFPokesN2cLhuuKOTpmwdkrTRv-yq2sET779gpzlaA
Message-ID: <CAAhSdy2LbLwRxuFVtMrrcTTD5NCxVCGLy4o=ZUowxT_9DXGqBA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Disable instret/cycle for VU mode by default
To: Atish Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_035525_994200_52C67C81 
X-CRM114-Status: GOOD (  16.13  )
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

T24gV2VkLCBNYXkgMTQsIDIwMjUgYXQgMTI6MTPigK9QTSBBdGlzaCBQYXRyYSA8YXRpc2hwQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGUgS1ZNIHZpcnR1YWxpemVzIFBNVSBpbiBSSVNDLVYg
YW5kIGRpc2FibGVzIGFsbCBjb3VudGVyIGFjY2VzcyBleGNlcHQKPiBUTSBiaXQgYnkgZGVmYXVs
dCB2aSBoc3RhdGVlbiBDU1IuIFRoZXJlIGlzIG5vIGJlbmVmaXQgaW4gZW5hYmxpbmcgQ1kvVE0K
PiBiaXRzIGluIHNjb3VudGVyZW4gZm9yIHRoZSBndWVzdCB1c2VyIHNwYWNlIGFzIGl0IGNhbid0
IGJlIHJ1biB3aXRob3V0Cj4gaGNvdW50ZXJlbiBhbnl3YXlzLgo+Cj4gQWxsb3cgb25seSBUTSBi
aXQgd2hpY2ggbWF0Y2hlcyB0aGUgaGNvdW50ZXJlbiBkZWZhdWx0IHNldHRpbmcuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgYXJj
aC9yaXNjdi9rdm0vdmNwdS5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNw
dS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gaW5kZXggNjBkNjg0Yzc2YzU4Li44NzM1OTNi
ZmU2MTAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gKysrIGIvYXJjaC9y
aXNjdi9rdm0vdmNwdS5jCj4gQEAgLTE0Niw4ICsxNDYsOCBAQCBpbnQga3ZtX2FyY2hfdmNwdV9j
cmVhdGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICAgICAgICAgaWYgKGt2bV9yaXNjdl92Y3B1
X2FsbG9jX3ZlY3Rvcl9jb250ZXh0KHZjcHUsIGNudHgpKQo+ICAgICAgICAgICAgICAgICByZXR1
cm4gLUVOT01FTTsKPgo+IC0gICAgICAgLyogQnkgZGVmYXVsdCwgbWFrZSBDWSwgVE0sIGFuZCBJ
UiBjb3VudGVycyBhY2Nlc3NpYmxlIGluIFZVIG1vZGUgKi8KPiAtICAgICAgIHJlc2V0X2Nzci0+
c2NvdW50ZXJlbiA9IDB4NzsKPiArICAgICAgIC8qIEJ5IGRlZmF1bHQsIG9ubHkgVE0gc2hvdWxk
IGJlIGFjY2Vzc2libGUgaW4gVlUgbW9kZSAqLwo+ICsgICAgICAgcmVzZXRfY3NyLT5zY291bnRl
cmVuID0gMHgyOwoKTGV0J3MgcmVtb3ZlIHRoaXMgYXMgd2VsbCBiZWNhdXNlIHRoZSBMaW51eCBT
QkkgUE1VIGRyaXZlcgpkb2VzIGluaXRpYWxpemUgc2NvdW50ZXJlbiBjb3JyZWN0bHkuCgpSZWdh
cmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
