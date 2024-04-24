Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FAEC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 07:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6n9Y8Q77fhiaJWfuGmVNUQzqMI7rflBxFM7Bvaxx8Q=; b=PCEXtDa5JtgIXI
	scXjdzIahNQjDDO6sOB5T+eDQhWC/0HbYzJAN8KbqzLARL5HsWnFrM6ZVOh5OOd9sZB9O3w6S70Gz
	t7wtlhQ4Pxv8/Xzer7LWYC0gNNtznHmcQKRG70D80VrIposGJOFu22p5hWq3pak9CiDBHf0S2pqws
	KIroMpzdrDQRTMGHmDHs4A5I+w6pCJnpl0FQY/YUFwcbfGvVpsdjngQvJfIlSb7DFTe02DKOoPKCp
	zra0KLctsTyKQylgCIv+bMTNpBFq4n9wCkGtwmdphiq9HMtx1r3e++M0hp/UdygJIrTRr7R2g/zpM
	cJf5dTVDKKpap+AtMAiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzWyP-000000035Tj-39VG;
	Wed, 24 Apr 2024 07:23:21 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzWyM-000000035Ss-3PoJ
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 07:23:20 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-34b39ecbcccso473082f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 00:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713943396; x=1714548196; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xOAuqs13k76ipILyHrz87YiVm+6HwZVLQFW6RCDP/CU=;
        b=rkK2p6lq+L2soiourA38KYoH1GBflr2cjbwv9L6bBQyeEHiMLo+NSO9AGEUlIrqNNh
         4AS5kQ9Ylf2yvfy9bXKiTDrYIjnIUsm1mAICwbaPDJY+x+IjK+qKZZCe4QC8TEO2Jnur
         Fc22d3EZMsgUol2+aSpgeCLwhwgzr5RFoHfHlHg+cdNOvUTujhmktOHjCqpuu7IkTGpf
         0fVaaolEGqRIJfogfcmvbRbJ5DLcPV93WwXmzqZbpM5XiWZdMjsnHhj3zHefCytHP7r2
         rY7hZnW8cW0VfWsqL2qt8GOIe0q6S0ATff3cWFaSJ57wEUvVNg+ognioyRJD/j7dbdtj
         gC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713943396; x=1714548196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xOAuqs13k76ipILyHrz87YiVm+6HwZVLQFW6RCDP/CU=;
        b=sMsVS7hWivFt4DSAMh4bTQ87l6kGUsscKooXgz2cHhSXIqa43CwxBGhS3CTeORDLE4
         d/Tc7dwijv76mbSr5Nkx6MLZF3BaO+PQyHjJmrT+ZZd48lNWNrKeJn6v7KVmy9b9bqWZ
         DKwdPHP17WUKS+pH1JCeGtEWYwnDzI8/dbTfnIXAPRznXbfcLIe8N7HYlyeXO63PK6Gk
         mFU2K4yrMNKSfm5TNj5gYQFBFIPrUD5D0h935pWR+cKnZNoUDQl2Cjqm/jwPTt+bq1mg
         ZUKfVOlbnt9dzWk61H2uRaxYqBKzjq6o3YiM27Yt3m8Hb7AakuxrkNsDipRDnFc9FCMu
         UrLA==
X-Forwarded-Encrypted: i=1; AJvYcCX+AJM9rp+8tq+FH+okVc7JrkwzuHC9p+Fo+4fMxM4QbJWpVKmsK1RTD1XzabecvHaIN+kB60koxAyluH+M9qrxm99D/LSTrofcAEafkMd8
X-Gm-Message-State: AOJu0YzgEgHImHU8jX6IWN2oOmcW53OBUM3lfHSKuKBTEbfinpH+rLSL
	ovprzSr7Gp30wpHiqPVU8t68lr6wveieILymXq9mX9AugbBSon1Z9+tMxUVZhH4=
X-Google-Smtp-Source: AGHT+IFCMRd+boelCqR+CsKhxLlNo5r68LHwVH3LQbe+tV9NyEiJ+zKsBoHZU/+a4l1EzP1sq6qqyA==
X-Received: by 2002:a05:600c:3ca4:b0:418:ef65:4b11 with SMTP id bg36-20020a05600c3ca400b00418ef654b11mr1231387wmb.2.1713943396566;
        Wed, 24 Apr 2024 00:23:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:6057:6f32:d1e5:d4d7? ([2a01:e0a:999:a3a0:6057:6f32:d1e5:d4d7])
        by smtp.gmail.com with ESMTPSA id bd22-20020a05600c1f1600b0041b0cda6f9fsm671254wmb.48.2024.04.24.00.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 00:23:15 -0700 (PDT)
Message-ID: <380532d7-41bf-4fcc-bcff-3cb6de0b172f@rivosinc.com>
Date: Wed, 24 Apr 2024 09:23:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/7] riscv: Add support for Ssdbltrp extension
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, Ved Shanbhogue <ved@rivosinc.com>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
 <20240423-fresh-constrict-c28f949665e8@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240423-fresh-constrict-c28f949665e8@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_002318_873001_BD28DB45 
X-CRM114-Status: GOOD (  15.34  )
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

CgpPbiAyMy8wNC8yMDI0IDE4OjI0LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gVGh1LCBBcHIg
MTgsIDIwMjQgYXQgMDQ6MjY6MzlQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+IAo+
PiAgZHJpdmVycy9maXJtd2FyZS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgICA3ICsK
Pj4gIGRyaXZlcnMvZmlybXdhcmUvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICB8ICAgMSAr
Cj4+ICBkcml2ZXJzL2Zpcm13YXJlL3Jpc2N2X2RibHRycC5jICAgICAgICAgICAgICAgfCAgOTUg
KysrKysrKysrKwo+IAo+IEZyb20gd2hhdCB3ZSBkaXNjdXNzZWQgd2l0aCBBcm5kIGJhY2sgd2hl
biB3ZSBzdGFydGVkIHJvdXRpbmcgdGhlIGR0cwo+IGFuZCBzb2MgZHJpdmVyIHN0dWZmIHZpYSB0
aGUgc29jIHRyZWUsIHJpc2N2IHN0dWZmIGluIGRyaXZlcnMvZmlybXdhcmUKPiBzdXBwb3NlZGx5
IGFsc28gZmFsbHMgdW5kZXIgbXkgcmVtaXQsIGFuZCBnZXRzIG1lcmdlZCB2aWEgdGhlIHNvYyB0
cmVlLAo+IGFsdGhvdWdoIEkgd291bGQgZXhwZWN0IHRoYXQgdGhpcyBhbmQgdGhlIGluaXRpYWwg
U1NFIHN1cHBvcnQgc2VyaWVzCj4gd291bGQgZ28gdmlhIHRoZSByaXNjdiB0cmVlIHNpbmNlIHRo
ZXkgdG91Y2ggYSBsb3QgbW9yZSB0aGFuIGp1c3QKPiBkcml2ZXJzL2Zpcm13YXJlLgoKWWVzIGlu
ZGVlZC4KCj4gCj4gQ291bGQgeW91IGNyZWF0ZSBhIGRyaXZlcnMvZmlybXdhcmUvcmlzY3YgZGly
ZWN0b3J5IGZvciB0aGlzIGRibHRycCBmaWxlCj4gYW5kIHdoaWNoZXZlciBvZiB0aGlzIG9yIHRo
ZSBTU0UgcGF0Y2ggdGhhdCBsYW5kcyBmaXJzdCBhZGQgYSBtYWludGFpbmVycwo+IGVudHJ5IGZv
ciBkcml2ZXJzL2Zpcm13YXJlL3Jpc2N2IHRoYXQgbGlua3MgdG8gbXkgZ2l0IHRyZWU/CgpZZXMg
c3VyZSwgSSdsbCBtb2RpZnkgdGhpcyBvbmUgYXMgd2VsbCBhcyB0aGUgU1NFIHNlcmllcy4KCj4g
SXQgcHJvYmFibHkgYWxzbyBtYWtlcyBzZW5zZSB0byBjcmVhdGUgcGVyLWRyaXZlciBlbnRyaWVz
IGZvciBlYWNoIG9mCj4gdGhlIGRibHRycCBhbmQgc3NlIGRyaXZlcnMgdGhhdCBlbnN1cmVzIHlv
dSBnZXQgQ0NlZCBvbiBhbnkgcGF0Y2hlcwo+IGZvciB0aGVtLgo+IAoKSW5kZWVkLCBtaXNzZWQg
dGhhdC4KClRoYW5rcywKCkNsw6ltZW50CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
