Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21546C4167D
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 12:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FrwPxClWtUT+I/hcAZZpgObvbqon7RvzSXNhagBOEgE=; b=hBna8Us/hht2G/
	2cPUmXplx/D8A8uAlvNeF7UYWxcShOpKYI0S9upCaoyfdv+6wIXAEB24Fj8+U+KXtMRcReYM8orD5
	2NouKoxh0VRaSc3EogxynpfRdlZL17hyhQHxKynmMmFSisZ/gXmt22TgjZgYiz/ZSM9qsUtA971ZN
	kc/hf11o+Biqm+fpydbTq6P60FVnB//phqJqjr1tTYYaK1mTPwg3dVAG0X8c3IRssHnGKFYmQ7pHG
	VCWTpKfq5Gz6UzGpcsR175Tbpnr/iNfDxBZ7OkQlqoi9gpX5tz2nS4QBFS28qUo5x+Gs5a8ctEso4
	KZ3+Q5oXzhD0FrvY+xBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDktG-000HR5-0t;
	Thu, 14 Dec 2023 12:32:34 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDktE-000HQU-0W
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 12:32:33 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5c6bd3100fcso4134653a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 04:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1702557151; x=1703161951; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHs0a9X4fElRxkh1m4Obf7cu50BAmw2Tug+rwqngNXM=;
        b=Rs2cn/g84xP1MdckfiHK0kBNou2ROlqW8rwWs1WLTjrimGc5ku+SMzV95gtKxgm5Nh
         yDBox34/oa9NzM10VrcWD2Q3WvVc6VWMCa0qKbo+d+5VX7uUD1BknNYxJnWwvFYmcxKi
         rV2pkVs2U1jPUq9aTgnqqfB80mtadPstXZVb6Ab4wAFd38YoQK/HADI1V/F+tkPI8h4/
         Uq2KrgZg4hwtGk616T72UHD0V4/ZilMLcqUa616o2ONVf+eVmLLSz0hmf/tvLkTO8nyg
         3qA7Q/sn3Mm+ONDSEMOm+3an41dsS4CZaBZ5zuiVrLaHp08JN9lwKY+GwldWNq9J8wsn
         5iTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702557151; x=1703161951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OHs0a9X4fElRxkh1m4Obf7cu50BAmw2Tug+rwqngNXM=;
        b=Isk1l2ca5eVEp4TXG9NkxfUP+5Zib8iJLNTEWkHreirAlSGKYdK7H7zpDKu+77gn2b
         LNE+rBWdMV2pV7wUcCCRLRwS81dBmmVEWWB+uUhIRLE+lTXvAHB5jTRCTrEU85kULzjE
         VMwxMr0Ds9rjuMwAAxmSr//3/N6rEWQ5M6yeq17aOJ06gKMzhaTU5pF7x89pJQnbyxlK
         kzPSOgkHe5a4Q9pmtZHaOS0pbgSEFf+l8arSyU9DBioZV5TOm7TnrCpcdfHH1sayMBzP
         5PY9gYxDUV7buZKSMIB6S2ltryFi2WrDGcRTOYWFLV3QAxXOrqvl7puDq4PKsz6iHxrP
         lrZQ==
X-Gm-Message-State: AOJu0Yxgy2+DrZ+wJ9aVqqcosaXFRPWboTf2uuBRn/2ZrBJ6c/DLaxq2
	eG5nGDJ8FK6UDai4CvuqSYh8RUyspAvaVzi43iqOFQ==
X-Google-Smtp-Source: AGHT+IHtJNIxrFwRTRE/bqbHJp34NVZj1ThA00NgG2O+fluhMv9I0JgSLSsCVqYFeOP3WU22OtYuCLxxss5Y01LGpik=
X-Received: by 2002:a17:90a:de94:b0:28b:1fbd:27de with SMTP id
 n20-20020a17090ade9400b0028b1fbd27demr4566pjv.29.1702557151290; Thu, 14 Dec
 2023 04:32:31 -0800 (PST)
MIME-Version: 1.0
References: <20231205024310.1593100-1-atishp@rivosinc.com> <20231205024310.1593100-6-atishp@rivosinc.com>
In-Reply-To: <20231205024310.1593100-6-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 14 Dec 2023 18:02:19 +0530
Message-ID: <CAAhSdy1L6smTUtjO1XJp2L=EfK-jYN9CS70h9nNa639ownKJBg@mail.gmail.com>
Subject: Re: [RFC 5/9] RISC-V: Add SBI PMU snapshot definitions
To: Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_043232_199433_DAB63236 
X-CRM114-Status: GOOD (  13.75  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBEZWMgNSwgMjAyMyBhdCA4OjEz4oCvQU0gQXRpc2ggUGF0cmEgPGF0aXNocEByaXZv
c2luYy5jb20+IHdyb3RlOgo+Cj4gU0JJIFBNVSBTbmFwc2hvdCBmdW5jdGlvbiBvcHRpbWl6ZXMg
dGhlIG51bWJlciBvZiB0cmFwcyB0bwo+IGhpZ2hlciBwcml2aWxlZ2UgbW9kZSBieSBsZXZlcmFn
aW5nIGEgc2hhcmVkIG1lbW9yeSBiZXR3ZWVuIHRoZSBTL1ZTLW1vZGUKPiBhbmQgdGhlIE0vSFMg
bW9kZS4gQWRkIHRoZSBkZWZpbml0aW9ucyBmb3IgdGhhdCBleHRlbnNpb24KPgo+IFNpZ25lZC1v
ZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgoKTEdUTS4KClJldmlld2Vk
LWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAt
LS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCB8IDEwICsrKysrKysrKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+IGluZGV4
IGYzZWVjYTc5YTAyZC4uMjk4MjFhZGRiOWI3IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vc2JpLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4gQEAg
LTEyMiw2ICsxMjIsNyBAQCBlbnVtIHNiaV9leHRfcG11X2ZpZCB7Cj4gICAgICAgICBTQklfRVhU
X1BNVV9DT1VOVEVSX1NUT1AsCj4gICAgICAgICBTQklfRVhUX1BNVV9DT1VOVEVSX0ZXX1JFQUQs
Cj4gICAgICAgICBTQklfRVhUX1BNVV9DT1VOVEVSX0ZXX1JFQURfSEksCj4gKyAgICAgICBTQklf
RVhUX1BNVV9TTkFQU0hPVF9TRVRfU0hNRU0sCj4gIH07Cj4KPiAgdW5pb24gc2JpX3BtdV9jdHJf
aW5mbyB7Cj4gQEAgLTEzOCw2ICsxMzksMTMgQEAgdW5pb24gc2JpX3BtdV9jdHJfaW5mbyB7Cj4g
ICAgICAgICB9Owo+ICB9Owo+Cj4gKy8qIERhdGEgc3RydWN0dXJlIHRvIGNvbnRhaW4gdGhlIHBt
dSBzbmFwc2hvdCBkYXRhICovCj4gK3N0cnVjdCByaXNjdl9wbXVfc25hcHNob3RfZGF0YSB7Cj4g
KyAgICAgICB1aW50NjRfdCBjdHJfb3ZlcmZsb3dfbWFzazsKPiArICAgICAgIHVpbnQ2NF90IGN0
cl92YWx1ZXNbNjRdOwo+ICsgICAgICAgdWludDY0X3QgcmVzZXJ2ZWRbNDQ3XTsKPiArfTsKPiAr
Cj4gICNkZWZpbmUgUklTQ1ZfUE1VX1JBV19FVkVOVF9NQVNLIEdFTk1BU0tfVUxMKDQ3LCAwKQo+
ICAjZGVmaW5lIFJJU0NWX1BNVV9SQVdfRVZFTlRfSURYIDB4MjAwMDAKPgo+IEBAIC0yMzQsOSAr
MjQyLDExIEBAIGVudW0gc2JpX3BtdV9jdHJfdHlwZSB7Cj4KPiAgLyogRmxhZ3MgZGVmaW5lZCBm
b3IgY291bnRlciBzdGFydCBmdW5jdGlvbiAqLwo+ICAjZGVmaW5lIFNCSV9QTVVfU1RBUlRfRkxB
R19TRVRfSU5JVF9WQUxVRSAoMSA8PCAwKQo+ICsjZGVmaW5lIFNCSV9QTVVfU1RBUlRfRkxBR19J
TklUX0ZST01fU05BUFNIT1QgKDEgPDwgMSkKPgo+ICAvKiBGbGFncyBkZWZpbmVkIGZvciBjb3Vu
dGVyIHN0b3AgZnVuY3Rpb24gKi8KPiAgI2RlZmluZSBTQklfUE1VX1NUT1BfRkxBR19SRVNFVCAo
MSA8PCAwKQo+ICsjZGVmaW5lIFNCSV9QTVVfU1RPUF9GTEFHX1RBS0VfU05BUFNIT1QgKDEgPDwg
MSkKPgo+ICBlbnVtIHNiaV9leHRfZGJjbl9maWQgewo+ICAgICAgICAgU0JJX0VYVF9EQkNOX0NP
TlNPTEVfV1JJVEUgPSAwLAo+IC0tCj4gMi4zNC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
