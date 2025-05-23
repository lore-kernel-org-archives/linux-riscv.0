Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766CFC54ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 15:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GsXxnvYiF0uYydP+UOhKd3Z3OEukqkGDnsFLC3I6knY=; b=d8EGyCjuaO403r
	lgW731Lphm5UbWeq6Bv3LcK6xHOOKDX8GpfzzlbKTBNh3srvdTnHQBzDxGKsZkrRlUs/bJthvOmNc
	/zHdPN2fDRhYuWLWt22Ya3tyetcs0NGa6ET9H2ACJo1ItigTbkg4SJ4MKX6qNIRsQJH0Ne01tIp3I
	MtCLBYAxjmA+PhrcHq+HrfWLFpqR/xP6tHAIOjNB79GuuREcMhaT9GYjEvJs367WptCo2j3yucs1j
	w2jXJJG7GKLb8HnHo9Ven+bQxg90n/0lN0wWw8NjL//EgemfWBczv1/fwiekdl8d1wcMsOrSNuEY5
	BDIDGveQLXsSiT0Do2Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUe1-00000004IdL-1G5T;
	Fri, 23 May 2025 15:49:13 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIULU-00000004Fnf-3x7y
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 15:30:06 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b13e0471a2dso6016916a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 May 2025 08:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748014204; x=1748619004; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZysAlyZtrotmIvgcjSaWUnFpu8BmC8DX1etzBHhsTSU=;
        b=t/iLo5SHYJNBCX0Bz/O4Oh+fMXw85tiWGAMAiFdn6jkRE7+P5U9U+f+pfevxYf+d4F
         OE/3sMq+eppyLgTPyq4Dh61WB34952p0e4c8o8Ga1klrlGjlo0PC4RGAGLBzcXdkl6bv
         ZaBpikn2B0U0SawCzjbDy6l26z6Lo555U622f7k9frzHzYN9iBHV344DGNNYUczvTO67
         +xUtETvBOx0E/Yb/+mrDhEr4iHZFBtxHEzxJvv+9eX9k5QuIp/TYw7CrjnIii3KoN/0R
         +BgbM64J2xf+W/H4u9m2BrhdNm5HLEcUF9xPnVj7aNtUmIEKkzAuF/AyfqaJirwNRMnZ
         eQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748014204; x=1748619004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZysAlyZtrotmIvgcjSaWUnFpu8BmC8DX1etzBHhsTSU=;
        b=RZ3cevRdvRAqqndldznYEABp1aegPVxLU6R7oYpUqSfDzY4Nos4qVDEp5SULWWXLX3
         TOEYCvwxBuqac2cetvnLaqHt6O2uYTxSn3S858oMDHgSRNKdoJnlDRgpTtPqd8K7U6BS
         MLhZkjrtaBwhr/BSKXNejTbXUEkH3EO79ja6KWh9mr+fxfUaMHwX/ArS5jt3Mw3pHZXZ
         hYqGetdgiyMyTQF96DygD7lTAHp8Dg6WfD/sZn9vfQBgoI7CtoL/IABg1t+CZICzRmK1
         pRFL7IKW9GPob6qPpUpELXBRxWf6sk/GjxEhbgw0fxr4xXPIAZ0yXDbMviyEdJK7UbBT
         NdyA==
X-Forwarded-Encrypted: i=1; AJvYcCW2xz+An3EnEodiIp+wX2a2JEFysRBKe//HMKXI8r95ED4O4CdUu26sJCAGPRcOgLdETKVa7YMERbBw3g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxkSJeqbviH/URPNMg43FNwFc/pu8tdWsI4UvIXW+6wvPXVFU7J
	gqK09hbCoCpIcVd/MY3ZI+7pcO85Sq4i3uQIO1X/Si/Vbd5g9zt69nb5iEZZ9ycDgIo=
X-Gm-Gg: ASbGnct5rMykd+40bzKm5aTIsVTp6EuOs42LwafbAbhVVvjG4jdb7fJ+AkxOUNF9Fhr
	wT2jaIwye9WpQ4sDWKI2qPWCall7DhKv+iJSthyygbh82z+ZgRR6UhhIFFmORMgSvNwue6rN6SJ
	Rl2ctdJGydpWSkdYqTJZcBiOyVfSghROXa1ZdQpc5OndWClkVl/NOZNhxa2Yf6K03fCS7nMz8tD
	5rrM8H1MgB8RXnkyG3Vtkxz7ymLqIlrAKrKyExsJ63qpFcLoHJPJi8OdeL/LnT5mDEXJ9LZkTzS
	UWFMgjBExMHHJ2uAPKfryNqeuuxPoSd0gUBOAMZwg31it5GCa5wFfViaJ7UnbS92inUuZY77Twn
	SOQptdS885zZZz+l4CtMQ
X-Google-Smtp-Source: AGHT+IEdlANg8wwO3+blZsMeIKZDl/aWdfuOZvDvj8FeW02HTI0mk6reEwHEpni5Wcy/mFcYlo/kjQ==
X-Received: by 2002:a17:902:dac7:b0:224:e0f:4b5 with SMTP id d9443c01a7336-231de351d32mr381454745ad.7.1748014204025;
        Fri, 23 May 2025 08:30:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed195csm125049005ad.212.2025.05.23.08.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 08:30:03 -0700 (PDT)
Message-ID: <9f9e2869-725d-4590-887a-9b0ef091472e@rivosinc.com>
Date: Fri, 23 May 2025 17:29:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/14] RISC-V: KVM: add support for FWFT SBI extension
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
 Andrew Jones <ajones@ventanamicro.com>, Deepak Gupta <debug@rivosinc.com>,
 Charlie Jenkins <charlie@rivosinc.com>, Atish Patra <atishp@rivosinc.com>,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-14-cleger@rivosinc.com>
 <DA3K95ZYJ52S.1K6O3LN6WEI0N@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <DA3K95ZYJ52S.1K6O3LN6WEI0N@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_083005_183656_1AB460D8 
X-CRM114-Status: GOOD (  10.91  )
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

CgpPbiAyMy8wNS8yMDI1IDE1OjA1LCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4gMjAyNS0wNS0y
M1QxMjoxOTozMCswMjowMCwgQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPjoK
Pj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4+ICtzdGF0aWMgY29uc3Qg
ZW51bSBzYmlfZndmdF9mZWF0dXJlX3Qga3ZtX2Z3ZnRfZGVmaW5lZF9mZWF0dXJlc1tdID0gewo+
PiArCVNCSV9GV0ZUX01JU0FMSUdORURfRVhDX0RFTEVHLAo+PiArCVNCSV9GV0ZUX0xBTkRJTkdf
UEFELAo+PiArCVNCSV9GV0ZUX1NIQURPV19TVEFDSywKPj4gKwlTQklfRldGVF9ET1VCTEVfVFJB
UCwKPj4gKwlTQklfRldGVF9QVEVfQURfSFdfVVBEQVRJTkcsCj4+ICsJU0JJX0ZXRlRfUE9JTlRF
Ul9NQVNLSU5HX1BNTEVOLAo+PiArfTsKPiAKPiBIb3cgd2lsbCB1c2Vyc3BhY2UgY29udHJvbCB3
aGljaCBzdWJzZXQgb2YgdGhlc2UgZmVhdHVyZXMgaXMgYWxsb3dlZCBpbgo+IHRoZSBndWVzdD8K
PiAKPiAoV2UgY2FuIHJldXNlIHRoZSBLVk0gU0JJIGV4dGVuc2lvbiBpbnRlcmZhY2UgaWYgd2Ug
ZG9uJ3Qgd2FudCB0byBhZGQgYQo+ICBGV0ZUIHNwZWNpZmljIE9ORV9SRUcuKQoKSGkgUmFkaW0s
CgpJIGRpZG4ndCBsb29rZWQgYXQgdGhhdCBwYXJ0LiBCdXQgbW9zdCBsaWtlbHkgdXNpbmcgdGhl
IGt2bSBvbmUgcmVnCmludGVyZmFjZSBzZWVtcyBvayBsaWtlIHdoYXQgaXMgZG9uZSBmb3IgU1RB
ID8gV2UgY291bGQgaGF2ZSBwZXIgZmVhdHVyZQpvdmVycmlkZSB3aXRoIG9uZSByZWcgcGVyIGZl
YXR1cmUuCgpJcyB0aGlzIHNvbWV0aGluZyBibG9ja2luZyB0aG91Z2ggPyBXZSdkIGxpa2UgdG8g
bWVyZ2UgRldGVCBvbmNlIFNCSSAzLjAKaXMgcmF0aWZpZWQgc28gdGhhdCB3b3VsZCBiZSBuaWNl
IG5vdCBkZWxheWluZyBpdCB0b28gbXVjaC4gSSdsbCB0YWtlIGEKbG9vayBhdCBpdCB0byBzZWUg
aWYgaXQgaXNuJ3QgdG9vIGxvbmcgdG8gaW1wbGVtZW50LgoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4g
Cj4gVGhhbmtzLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
