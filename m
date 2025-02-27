Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E84C19F2E
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 14:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fUBkx1KVtiDoass8+mNYJ4djVwiOJtW9rz9DH3TRr+s=; b=PRrHGinKLWrnqn
	D8HuAvpHoczeQ5Rc690Jf+PfB9JtZ0inFSythuMEr5NI9ahgpZGD/+M9TDnvbY+aLGpR5N3n5olPN
	R8CRwNW6JOOSFqW1Cysc09GvboFX5Gqfm1fZOQFFrZm9Iv80GFcVPS+CvzhVcPYgL2QEohxp9LRDg
	f6tpcq3L51xgrvbpl7AU1JvIaueu50IbN6DG5brW9juQvBYlHWUFmYDTtmJHd/p4pwkPaVSpNSrsd
	9+Vonn3Z4I+h3sQ8urs6NXCuFNFvvpFJNmzri1f2LwVJTvU4wmM3tA5lEpldSgZvIukeSdwv7C1IX
	eIOktAQOVaHv0dIflozw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf1k-00000007lWf-48m6;
	Thu, 27 Feb 2025 14:38:16 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tndSV-00000007RaE-0Oe0
	for linux-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 12:57:48 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-22337bc9ac3so14873255ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Feb 2025 04:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740661066; x=1741265866; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pf96MEttABttkon6JyPzDs9JgVTWCcxQW9KTdzVlvqQ=;
        b=U5+1bYBPqq8eP1wg+7EmcXHV0BSvdJNTsXnS2wGYNVwsW+NTwXaMn6Qp+M8P2IZ0JD
         syaW6IeBT0CgFrRz1MFI2MLU/ISmZiccq1RK4LJytv68YRfo4RoOHfP2kuTbr47B503U
         QRQoDMqSBCHGYdVk7I11CZh0OK5aIDsW5INYFYAEenJ4T/m7KDqVxJ9JY6BZ9TL0+Vjx
         h3q0BNeaB/l/1hYFawxABTm1UnKP6dfCD0+axYJoUQba6mzt3sqLvmB/KRTD2w/C3tEE
         jA9/GvMft7KgvXrP9skK9wIcL6WagGo4xoBvpu9MrwgUl0USO/hVaXhDaMAFIbWgKlIz
         55vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740661066; x=1741265866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pf96MEttABttkon6JyPzDs9JgVTWCcxQW9KTdzVlvqQ=;
        b=Dv4lELLzpz6zkRGikB2VKOlEn1biUk2K+ommQfVAPX7GCindcutWcIQoLKD/fsK1JF
         3bMdztmmsYIaPyGCJN+Yr5BVliNaQwGcimy7+YGvvMYPIFviQHn0/bg4piUQIsROT7un
         TxvMlyY1nfmCILYPUywKHWT68jN0QGAxU2UPK1KKayUN8V7IUuPPxD7DfJ9D7MxRtpb0
         CsEKr+gxkBn+P0ge47pCIGVLee+rh20Noe6TAQ/vap3edpKxo/whfDxOu0jbQUeo22km
         9Vw/lr9jm1QJqds2iQ8uJxTUsyWKIEO5stFfn0LICIGajiFfek1kaM8Y++yJw1D65ioL
         xcYA==
X-Forwarded-Encrypted: i=1; AJvYcCVVEj90OhIgncPT+Aj7MXj5my/ykeEOhHrLGqYIwo7zkw3odysm1dFBbXghqCdDe4/fB2G9gTzOFyhdbQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPuSO35yJpx2JIK2OXLnI1O84DIBwZMFHTayg1SpBGyVwhKIp0
	iOdrcYjiKIp/T7i12//o4WjlFQsFlL7eEGdlvtsMIcqHoxYk3Qa9mmwyG/3dV9E=
X-Gm-Gg: ASbGncsXdPNXF5C9WMwp94ANQ19Arlo15x8iD3uJGmRjB8DeS7ETpSs93PJPSgN9NPm
	ao/6Mprvtitpiqm/fe8agl+OdzFwdd18+Epz9yJskWrQ0gvkfH4YTIdh18WxmRqwXNiMsh1ghB8
	tA+VK3eFH9CBJEuxfMbaLIhqxAJtElcecljDE1sWYhUqx6mAjrA/WgijPI2D/xs8CYBRx72oIMg
	tYSmQNHp17FZ1jgetBd/+bkodmQOm5w4pElWsB7C1L6mOUqyLom+LvSGsrF7wDbTP5qmq7CPlLg
	qQDU96LSidtDXH/jmGpKq5edmorVwEjInqaopaRKaTNyadnftg3JZRk8/Eo7CgWD5n5UHqE=
X-Google-Smtp-Source: AGHT+IFx4pIh3JIPBr0kkMiUgEYGJKIIZ775OsAddLWn3ffImcN2wl1+nGQSMf4FINEK1qVgjm20Mw==
X-Received: by 2002:a05:6a21:6d9a:b0:1ee:d6da:b646 with SMTP id adf61e73a8af0-1eef52d935emr44541622637.11.1740661066261;
        Thu, 27 Feb 2025 04:57:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe48865sm1508632b3a.50.2025.02.27.04.57.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 04:57:45 -0800 (PST)
Message-ID: <cf568ee0-8baf-4701-9e22-0b71792cf329@rivosinc.com>
Date: Thu, 27 Feb 2025 13:57:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 02/10] riscv: Define arch_apei_get_mem_attribute
 for RISC-V
To: Himanshu Chauhan <hchauhan@ventanamicro.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
 acpica-devel@lists.linux.dev
References: <20250227123628.2931490-1-hchauhan@ventanamicro.com>
 <20250227123628.2931490-3-hchauhan@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250227123628.2931490-3-hchauhan@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_045747_385331_B98C47B1 
X-CRM114-Status: GOOD (  15.93  )
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
Cc: apatel@ventanamicro.com, tony.luck@intel.com, robert.moore@intel.com, conor@kernel.org, james.morse@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, ardb@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAyNy8wMi8yMDI1IDEzOjM2LCBIaW1hbnNodSBDaGF1aGFuIHdyb3RlOgo+IGdoZXNfbWFw
IGZ1bmN0aW9uIHVzZXMgYXJjaF9hcGVpX2dldF9tZW1fYXR0cmlidXRlIHRvIGdldCB0aGUKPiBw
cm90ZWN0aW9uIGJpdHMgZm9yIGEgZ2l2ZW4gcGh5c2ljYWwgYWRkcmVzcy4gVGhlc2UgcHJvdGVj
dGlvbgo+IGJpdHMgYXJlIHRoZW4gdXNlZCB0byBtYXAgdGhlIHBoeXNpY2FsIGFkZHJlc3MuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSGltYW5zaHUgQ2hhdWhhbiA8aGNoYXVoYW5AdmVudGFuYW1pY3Jv
LmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hY3BpLmggfCAyMCArKysrKysr
KysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQo+IAo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FjcGkuaCBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vYWNwaS5oCj4gaW5kZXggNmUxMzY5NTEyMGJjLi4wYzU5OTQ1MmVmNDggMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hY3BpLmgKPiArKysgYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2FjcGkuaAo+IEBAIC0yNyw2ICsyNywyNiBAQCBleHRlcm4gaW50IGFjcGlf
ZGlzYWJsZWQ7Cj4gIGV4dGVybiBpbnQgYWNwaV9ub2lycTsKPiAgZXh0ZXJuIGludCBhY3BpX3Bj
aV9kaXNhYmxlZDsKPiAgCj4gKyNpZmRlZglDT05GSUdfQUNQSV9BUEVJCj4gKy8qCj4gKyAqIGFj
cGlfZGlzYWJsZV9jbWNmZiBpcyB1c2VkIGluIGRyaXZlcnMvYWNwaS9hcGVpL2hlc3QuYyBmb3Ig
ZGlzYWJsaW5nCj4gKyAqIElBLTMyIEFyY2hpdGVjdHVyZSBDb3JyZWN0ZWQgTWFjaGluZSBDaGVj
ayAoQ01DKSBGaXJtd2FyZS1GaXJzdCBtb2RlCj4gKyAqIHdpdGggYSBrZXJuZWwgY29tbWFuZCBs
aW5lIHBhcmFtZXRlciAiYWNwaT1ub2NtY29mZiIuIEJ1dCB3ZSBkb24ndAo+ICsgKiBoYXZlIHRo
aXMgSUEtMzIgc3BlY2lmaWMgZmVhdHVyZSBvbiBBUk02NCwgdGhpcyBkZWZpbml0aW9uIGlzIG9u
bHkKCkhpIEhpbWFuc2h1CgpzL0FSTS9SSVNDLVYKClRoYW5rcywKCkNsw6ltZW50Cgo+ICsgKiBm
b3IgY29tcGF0aWJpbGl0eS4KPiArICovCj4gKyNkZWZpbmUgYWNwaV9kaXNhYmxlX2NtY2ZmIDEK
PiArc3RhdGljIGlubGluZSBwZ3Byb3RfdCBhcmNoX2FwZWlfZ2V0X21lbV9hdHRyaWJ1dGUocGh5
c19hZGRyX3QgYWRkcikKPiArewo+ICsJLyoKPiArCSAqIFVudGlsIHdlIGhhdmUgYSB3YXkgdG8g
bG9vayBmb3IgRUZJIG1lbW9yeSBhdHRyaWJ1dGVzLgo+ICsJICovCj4gKwlyZXR1cm4gUEFHRV9L
RVJORUw7Cj4gK30KPiArI2Vsc2UgLyogQ09ORklHX0FDUElfQVBFSSAqLwo+ICsjZGVmaW5lIGFj
cGlfZGlzYWJsZV9jbWNmZiAwCj4gKyNlbmRpZiAvKiAhQ09ORklHX0FDUElfQVBFSSAqLwo+ICsK
PiAgc3RhdGljIGlubGluZSB2b2lkIGRpc2FibGVfYWNwaSh2b2lkKQo+ICB7Cj4gIAlhY3BpX2Rp
c2FibGVkID0gMTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
