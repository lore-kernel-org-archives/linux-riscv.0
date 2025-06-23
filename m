Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7122BC7EE2E
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 08:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CNmS392/g6NzHqEzeYygtnZl9zpNR01Y8H3UapyEhE0=; b=mYee1namRWbrU1
	IPFOoyPJCiIHfgbfml3g4Cr/IFv13DQEfL5N1LROWDTQzF/yjX8bIrEhOtGCoh+lGk+/CmocIjGIy
	hBnS6K1CnHcI8Fc5aEv2kY/kBKtnrisrLQyoArYDtFDvOV4GplsBj1lwHGxhK/UF8TO4ZVOlqtiKy
	teWmmrWE+w7wN24zztVcCYrTVrSMNvcmqzqkrYBMO2wOktdOf4AKx9haXBemqui1yxw+LRSps+mhZ
	hUUJl6X+oIM3AAaZPIUSUbb82P+tdH1Q3glN01C3iDl1YO4DpIj2E/1QNWup21c0kIzFw204odUPB
	E5nUKhYHzskQf7Y1g6Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcC4-00000001xV9-3FM9;
	Mon, 23 Jun 2025 08:06:20 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcAk-00000001xIc-1JvC
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 08:04:59 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-235e1d710d8so52270055ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 01:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750665897; x=1751270697; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4vmYNde3494s1oZAkDWHVWSrNdQuXQcEtL0WwaKvH1w=;
        b=eBjJlCzR7K57caqxVjZz1GekKgYXnEDQi+rah7L1yvoyfJG90ssmFj8woxCCf0+NFL
         I8PZ2b/qk0ZUtBHnQtIWIRqccyrZhFOuttNfocLJEXutxFmzBxMxmNcKZlFF39aiOaFj
         art0M7QAanyjMaz73bcQ8m9S+mw3gYdsvhXBGlUjSUq8MuFGiA+zjJ6phkylvLU4wHJ8
         MqhrGgSXUuMKBkdxYysdlRM/tB1vPFnEMoJogq6AYCdqNPBVyNXlgit/H2wsQ1c5Ma6c
         Mmv3a10Uy3hfLdOBVfmWbrN0FjQOHzakkOc44mlgOhpZwj/ZPhumprblpcbLET2x4CLq
         FNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750665897; x=1751270697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4vmYNde3494s1oZAkDWHVWSrNdQuXQcEtL0WwaKvH1w=;
        b=a1hSVMZR9m/hmI0w8GV+78mwEzBB/XXwdMOMa4uYP12n3QuNh/XYCBGq6sVIAms4Y6
         Qao2h0E5KiG8GUW9PtgQzChaDMNTX7xHnOJNxiGFFtNfSB6GQLpYC03cZS7UwrTrZOw9
         ixiuJRFjcIK1fmDAaG+XKFGxSupDyNRT00sn8BcxOv/T1z301YmuzdbK+7cAgf78hYDB
         MqtfgL5saGQ1eZ+wevA3PuvTxhtv3F1ng26+l2UMxqH3YjMV7p1OcBqu8/5XtOA4tf17
         kfXQGepA6J/dTDaGVPuyT/cymAvYi64YjyG+zdMtGwsHvDRFVOR3W4R36dKoZVBaKRWL
         cLlw==
X-Forwarded-Encrypted: i=1; AJvYcCWAHOXw9q0277KcZmqTD3Tpr9JLh3Dw5x5/brFb1dx8FzFY1CD0+f+VRG4BhGhR77NkWWVU72HECsEmMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9HkMSw8tRHrSsyI+NZSQB8bS2nnMbE2RSjpSr59mRd1qFIyCl
	TyB7zGRbCgs1S1ySSfhlRCwQUL1QnFMeg+O5oh0IZfQRinLz7RYtiS30rQE/YjmwDk4=
X-Gm-Gg: ASbGncvsi3a59zE9dAoFAZdhevOHe1MLtZroivy4KCMAiU88qVS8SUk3jc6Hj8u84gY
	xJnYKyYACuEPGwpO38+Ev5xlSPLh/bMr/3hbJZ4RIhlEqvbp9pPvXkpNBMQI1wQ01dRaXmZ+u8S
	K4N+ai8EgJ8qjtzluABJ/CO6Mp7XcX9i/lk8PZc2mnjt0HoUpLH044RbKMsf7nxyeZO0lrXJQbH
	W+t0N35QHHO/lDu3q2dZCO5SqRoL9FRH+WDt3cHzeJOrgneMcrwmr+6FNNCTH6Lv0S62M5DUoFC
	TYPGJWb9XN2UnwzEgQcbKyekMW2qN93IjVMNi5A/UHD3dZl5k4NazPUIgYIpQ+r0y2QvJXUiNHU
	vMVyWYph3pj1rT7WSync8LtUHZo0WQao=
X-Google-Smtp-Source: AGHT+IGAu8sRN9d6YginLzXnR26SBrwXTWtMoIeqalY4gdd+wB4xJaqi8iWblIrCKepqAoQGghGYIw==
X-Received: by 2002:a17:903:4b30:b0:234:8c3d:2912 with SMTP id d9443c01a7336-237d96b6361mr175973175ad.11.1750665897172;
        Mon, 23 Jun 2025 01:04:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d867f8d0sm78007835ad.175.2025.06.23.01.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 01:04:56 -0700 (PDT)
Message-ID: <1d9ad2a8-6ab5-4f5e-b514-4a902392e074@rivosinc.com>
Date: Mon, 23 Jun 2025 10:04:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: KVM: Delegate illegal instruction fault
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 Xu Lu <luxu.kernel@bytedance.com>, anup@brainfault.org,
 atish.patra@linux.dev, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20250620091720.85633-1-luxu.kernel@bytedance.com>
 <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_010458_467839_77CFA11C 
X-CRM114-Status: GOOD (  10.48  )
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

CgpPbiAyMC8wNi8yMDI1IDE0OjA0LCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4gMjAyNS0wNi0y
MFQxNzoxNzoyMCswODowMCwgWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+Ogo+PiBE
ZWxlZ2F0ZSBpbGxlZ2FsIGluc3RydWN0aW9uIGZhdWx0IHRvIFZTIG1vZGUgaW4gZGVmYXVsdCB0
byBhdm9pZCBzdWNoCj4+IGV4Y2VwdGlvbnMgYmVpbmcgdHJhcHBlZCB0byBIUyBhbmQgcmVkaXJl
Y3RlZCBiYWNrIHRvIFZTLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBYdSBMdSA8bHV4dS5rZXJuZWxA
Ynl0ZWRhbmNlLmNvbT4KPj4gLS0tCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2t2bV9ob3N0LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKPj4gQEAg
LTQ4LDYgKzQ4LDcgQEAKPj4gKwkJCQkJIEJJVChFWENfSU5TVF9JTExFR0FMKSAgICB8IFwKPiAK
PiBZb3Ugc2hvdWxkIGFsc28gcmVtb3ZlIHRoZSBkZWFkIGNvZGUgaW4ga3ZtX3Jpc2N2X3ZjcHVf
ZXhpdC4KPiAKPiBBbmQgd2h5IG5vdCBkZWxlZ2F0ZSB0aGUgb3RoZXJzIGFzIHdlbGw/Cj4gKEVY
Q19MT0FEX01JU0FMSUdORUQsIEVYQ19TVE9SRV9NSVNBTElHTkVELCBFWENfTE9BRF9BQ0NFU1Ms
Cj4gIEVYQ19TVE9SRV9BQ0NFU1MsIGFuZCBFWENfSU5TVF9BQ0NFU1MuKQoKQ3VycmVudGx5LCBP
cGVuU0JJIGRvZXMgbm90IGRlbGVnYXRlIG1pc2FsaWduZWQgZXhjZXB0aW9uIGJ5IGRlZmF1bHQg
YW5kCmhhbmRsZXMgbWlzYWxpZ25lZCBhY2Nlc3MgYnkgaXRzZWxmLCB0aGlzIGlzIChwYXJ0aWFs
bHkpIHdoeSB3ZSBhZGRlZAp0aGUgRldGVCBTQkkgZXh0ZW5zaW9uIHRvIHJlcXVlc3Qgc3VjaCBk
ZWxlZ2F0aW9uLiBTaW5jZSBzb21lIHN1cGVydmlzb3IKc29mdHdhcmUgZXhwZWN0IHRoYXQgZGVm
YXVsdCwgdGhleSBkbyBub3QgaGF2ZSBjb2RlIHRvIGhhbmRsZSBtaXNhbGlnbmVkCmFjY2Vzc2Vz
IGVtdWxhdGlvbi4gU28gdGhleSBzaG91bGQgbm90IGJlIGRlbGVnYXRlZCBieSBkZWZhdWx0LgoK
VGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4gVGhhbmtzLgo+IAo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4g
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
