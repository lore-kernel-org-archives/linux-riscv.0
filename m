Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C77C369DC
	for <linux-riscv@archiver.kernel.org>; Thu,  1 May 2025 13:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=loVqoCe4JcOq2hBPM0YTvSSS4vzzJQdHQG2tvwSwRoA=; b=ENnJKEQHk5zyiI
	QMJsYnz23pRq3fJnN211o3HI+9vEck6wg2Y54iGjCXSslvbfxgsBb3DXXGDNwJSdAP3e0E6/cmGWN
	15OS9ljS/SwXPznBXQQuGktahYnsNDoyv21NdohxV8+iCiRWldY46ax9V7pgOhpi1H6DO2w3U4o83
	hM8pe9eaz7COKurIAFHtYgU1UbcZ5bMvmQH2odZVcev61vOZHPJChm61T/fIe3XMCQ4zNRMiQ7zpu
	GnKzdIfpNdhldAGwoFVfkHd/0lK9sgrDu3IqiDw4t39UixLxMpAGaEgpy77GBcIs2Yk0++TnDLTvf
	H7JLH53X4sg/GUCoUCzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAU9w-0000000Fr3f-3B4K;
	Thu, 01 May 2025 13:41:04 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAU5K-0000000FqDF-0iKo
	for linux-riscv@lists.infradead.org;
	Thu, 01 May 2025 13:36:19 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3d96d16b369so9385155ab.0
        for <linux-riscv@lists.infradead.org>; Thu, 01 May 2025 06:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1746106577; x=1746711377; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5HbFwwkJF2Y2R1Vbj0ljcnhgzUV/rgTcfz1KnrFhCo=;
        b=IYKefz6KPpfmBmjDkm+mrTcE4qn76UuaDWKuJ3eDM+qpUy+LXXU6Z7T3ErJfw9ej8o
         accQ0S+Bb4LZCPJk7sj4fOwdJXrNGHqdBQZkkALUoh9p8ToyOozV0y7tkGZLN7jBehta
         S7zG4UZE/VgA4H/+hiBJ9jGXc0tuPxOf1mtuE0vmwnSjsGIAJD/ohGB2XikdKSvCfKGR
         lmXr7wDn5C10ci9P3cqs6COGCLkleB3m/TXlzPbyS51yggZNwq+aNYOGUmKaIx+434d0
         dtkZJxrg9FgA9ekbTRL/pWNAgsJp6iSXz4hQ68CTP/5QjD+rmNxztRIoLCuHEGWtA/qx
         nNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746106577; x=1746711377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5HbFwwkJF2Y2R1Vbj0ljcnhgzUV/rgTcfz1KnrFhCo=;
        b=PWoQgD6mGnhB3s57b/du4asdSM5Z6PoFzMARIUyBP8EE/hMSbLLUBlPiZCwT/jtvt4
         oJ38Z5IGqMHiNvjtoYRcnK4AgdHRQJwvzhMff4cw+bO40etEqT/mcsjQgnVlfCEoGYut
         mN687BHCmHAXIqLMRqB2mZA1lGEyTlyd5u468Rkyj0im/HFphIQpWduB8C8WQzmfshGc
         owblspaWUI9eAvbK1P6SGDTRNL0J6q0UK0uzy5LowwvDuwOQVyRgKsXGQrwfNDeunGPJ
         WBBg82rZ5o7C8eUg8qlZLf7DA5YETwhOEdYbKYEzMYnnk8ro2fWTrweUILO1SpBwNjyK
         5NBA==
X-Forwarded-Encrypted: i=1; AJvYcCUlrGB8pPRW6h2RkoiSMtyPksY2PlxBzgQZXBkrPofAxFb/qnQBmib3pDaSBM3tmpldRYA+ovy99QS79A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ11zW3P2kvj+MHWosJEISUNpk4L3uYhnVG8X6qjaZT0HHyzSq
	HqeMmRYSbilxDDKb9raYNJakL9tynsIDih3k3D5mghlcGnYO3t6KdbXkoVbdrx/QlYXk2pbbOSg
	BDcFqHkr10e/a2j7shlkGUA9bomZkwD19gMf+fQ==
X-Gm-Gg: ASbGnct+0ZnAfE0J5k5k9mAne0HKzs9rinXTQl9i7y7NMbD88X9wm6MZBtZdLSOsMtT
	jFfMHBwJ8SadrLfQFGR6brJNswLeZsp7sraCj4TKEYvqpO6q01DMs/BoLamI2HIfhAWgw3MkD7V
	qaijGj/anEDFAv283yvonxjA==
X-Google-Smtp-Source: AGHT+IHY7gd5DfteiMffTuTR2BB5tAOFnK6ac9kV3ASNuI57T6S+/lfY0TuUH0M3Tjf2aq1tEUdaJ7qOsG8AOHYTWno=
X-Received: by 2002:a05:6e02:1b0b:b0:3d5:eb14:9c85 with SMTP id
 e9e14a558f8ab-3d9676c6669mr79049245ab.6.1746106577095; Thu, 01 May 2025
 06:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250430-kvm_selftest_improve-v3-0-eea270ff080b@rivosinc.com>
In-Reply-To: <20250430-kvm_selftest_improve-v3-0-eea270ff080b@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 1 May 2025 19:06:06 +0530
X-Gm-Features: ATxdqUElPYmtqqRS47Feed2BMb796DJHZOR_NiIu4niYbEKvJ9Q_aHmmUyE0IV4
Message-ID: <CAAhSdy0UAnmNHWNJBysuH93Mok5_AQB88uy0nHuiumpfGgiJfQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] RISC-V KVM selftests improvements
To: Atish Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_063618_211768_DE62D8B0 
X-CRM114-Status: GOOD (  13.74  )
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

T24gV2VkLCBBcHIgMzAsIDIwMjUgYXQgMTo0NuKAr1BNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIGltcHJvdmVzIHRoZSBmb2xsb3dpbmcg
dGVzdHMuCj4gMS4gR2V0LXJlZy1saXN0IDogQWRkcyB2ZWN0b3Igc3VwcG9ydAo+IDIuIFNCSSBQ
TVUgdGVzdCA6IERpc3Rpbmd1aXNoIGJldHdlZW4gZGlmZmVyZW50IHR5cGVzIG9mIGlsbGVnYWwg
ZXhjZXB0aW9uCj4KPiBUaGUgZmlyc3QgcGF0Y2ggaXMganVzdCBoZWxwZXIgcGF0Y2ggdGhhdCBh
ZGRzIHN0dmFsIHN1cHBvcnQgZHVyaW5nCj4gZXhjZXB0aW9uIGhhbmRsaW5nLgo+Cj4gU2lnbmVk
LW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4gLS0tCj4gQ2hhbmdl
cyBpbiB2MzoKPiAtIERyb3BwZWQgdGhlIHJlZHVuZGFudCBtYWNyb3MgYW5kIHJ2MzIgc3BlY2lm
aWMgY3NyIGRldGFpbHMuCj4gLSBDaGFuZ2VkIHRvIHZjcHVfZ2V0X3JlZyBmcm9tIF9fdmNwdV9n
ZXRfcmVnIGJhc2VkIG9uIHN1Z2dlc3Rpb24gZnJvbSBEcmV3Lgo+IC0gQWRkZWQgUkIgdGFncyBm
cm9tIERyZXcuCj4gLSBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUw
NDI5LWt2bV9zZWxmdGVzdF9pbXByb3ZlLXYyLTAtNTE3MTNmOTFlMDRhQHJpdm9zaW5jLmNvbQo+
Cj4gQ2hhbmdlcyBpbiB2MjoKPiAtIFJlYmFzZWQgb24gdG9wIG9mIExpbnV4IDYuMTUtcmM0Cj4g
LSBDaGFuZ2VkIGZyb20gZXhfcmVncyB0byBwdF9yZWdzIGJhc2VkIG9uIERyZXcncyBzdWdnZXN0
aW9uLgo+IC0gRHJvcHBlZCBBbnVwJ3MgcmV2aWV3IG9uIFBBVENIMSBhcyBpdCBpcyBzaWduaWZp
Y2FudGx5IGNoYW5nZWQgZnJvbSBsYXN0IHJldmlldy4KPiAtIE1vdmVkIHRoZSBpbnN0cnVjdGlv
biBkZWNvZGluZyBtYWNyb3MgdG8gYSBjb21tb24gaGVhZGVyIGZpbGUuCj4gLSBJbXByb3ZlZCB0
aGUgdmVjdG9yIHJlZyBsaXN0IHRlc3QgYXMgcGVyIHRoZSBmZWVkYmFjay4KPiAtIExpbmsgdG8g
djE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTAzMjQta3ZtX3NlbGZ0ZXN0X2ltcHJv
dmUtdjEtMC01ODM2MjAyMTlkNGZAcml2b3NpbmMuY29tCj4KPiAtLS0KPiBBdGlzaCBQYXRyYSAo
Myk6Cj4gICAgICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBbGlnbiB0aGUgdHJhcCBpbmZvcm1h
dGlvbiB3aWh0IHB0X3JlZ3MKPiAgICAgICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IERlY29kZSBz
dHZhbCB0byBpZGVudGlmeSBleGFjdCBleGNlcHRpb24gdHlwZQo+ICAgICAgIEtWTTogcmlzY3Y6
IHNlbGZ0ZXN0czogQWRkIHZlY3RvciBleHRlbnNpb24gdGVzdHMKClF1ZXVlZCB0aGlzIHNlcmll
cyBmb3IgTGludXgtNi4xNi4KClRoYW5rcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
