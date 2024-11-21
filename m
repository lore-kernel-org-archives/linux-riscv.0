Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F03E64039
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Nov 2024 22:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzJuZ7+/g4maCB2VUfzGn26mAKhk3jpbQrb4UMpq7Ns=; b=iYgUap4yVntRBp
	0Bn/wf7FiEazxZ8snSRaHS3MJ7RjsXX+5lDzvBwyIIHugplyEUmg3BCiIHH7QeXqNX/IS1qt7qCFg
	KH5YcXkOwT2JWwbsTmNZ0P3AmEdaUvVNzzvHuyigdkZcQKzziM+T8PWJi4OvI68E20vux9S3qd6h+
	4utnq7knHaYD1V1c0fb8E/Mo3MZD4MdoQG7Dh7rvxYA4Sh11d3eEyx+NwlSSvsCf7DEDjl1JVcFZj
	KIKL92NGRxbHr2mxuD7EZlKUY1GYSjTgtq8JU643Etfn1+RhZxzQqTJ4rvW3vtmBwy+iZDot2rUDZ
	n8GhQ0KmnhJP25AhAsng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEFrL-000000015H7-1iWx;
	Thu, 21 Nov 2024 22:41:11 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEFrI-000000015Gj-46It
	for linux-riscv@lists.infradead.org;
	Thu, 21 Nov 2024 22:41:10 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3a789d422bcso5614605ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Nov 2024 14:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1732228867; x=1732833667; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G0nFhOWS85+b5e0Y+BADc2JfWMqvmPiOUR6rVphXxW0=;
        b=FIbfILklOnBiEEyIhorQXxQcwJbgIhlaTAq/hxxaiua+g3+Z2fDrR+vnDLhqSukPHy
         oqOyS28E72Tu4tji+7J8xoltPj29n1i3ln17VgDQuh/Rx7ifQKjmG9HhRLZtnE5UrBmt
         pGDlAyvAtW+9x5WuhmilIGRPXE8UWzrW7aaV/qHSoR75bOQO4/Pq2h2qaa97QpTL2T1D
         RUObVeg/mkj2PCEl4l7T1u9LA1cnoiI9sZGn83yIfrdJ2+ztLAkdLEjBffyq/IsqQxVq
         UGbz1JcPhxNi4iANPSIIW3vI84QbYFJcZ3Wddhj+jX4PfmEQ6/dT/7EBzhPGQ21hBaMl
         jjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732228867; x=1732833667;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G0nFhOWS85+b5e0Y+BADc2JfWMqvmPiOUR6rVphXxW0=;
        b=SYbyDkt4Z7nriDdUWgaGP/A84JHvZTB1i04nnmk2ujQ5XXq111a5nFQnGVQaguk/Rj
         Gy8FzSBfZ/b2LesSxd8XwRLkqNuivy9IoI1v55SXv0ecXTocChpJoGqRRzrDrKQLsrIL
         jUjfXLteMJjszdd3HwFWGn2m/uruMtsR1+f63ZWbjJs0mH3qyOjNDclUxIxI4/kPbTj9
         sFMad49xfksxp7czrc7CRmgfF/HGdXmABEepwZ3LadJeF7mhmuwxa/++dQSQ8vu1gwDo
         pSp18cW+vYI2AvTgHdK6WEDidaU+b+2cGIssDO0tinHsYf8KRFwXMV3PahVvB+p0sb39
         U+Og==
X-Forwarded-Encrypted: i=1; AJvYcCVfXWSBwRUu7gYpEWbEp7veJhJ26VnWTy9blxDPzmzdmgXNkW+CanhkL6ZQakH0dpPMoV6pDC+VxOcQCg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv6QxDEr97cLN5JwvpOOMJ2DCbGTnPijvLgmuRQlzAWbZH3ztn
	RH6icQzcSeEDlDvPKz/B7K/B5axjLKYRaD+xFSUuSXE/8wMgytGt9i/XP3QI+UU=
X-Gm-Gg: ASbGncs1MZhzTMqiI6pRRyuKpzdLcPgQX3bNa61K481HDEPetoWs52+FgGxjs9SxwXY
	cMTfIz/8hmxKQ7t0Kd2XRUkDEcmWSscvh5IIZlEa3f0g+Ocm1s/p7ogHzAvPybSATbdc/UUPKZ0
	BL6LoNEgXp2WSU3JPh1qVcgwrqNJ5LhAOmOirybqDtIvCXwmKFTUK5kzpiud9LaAvmXHqxI9mBy
	kb6O9gOkPoBRCGyMwi9XW4lTPk82LrdHCSGDGwhEiXd+gH4Hsj2wCQ5n12I4gzzwmsgwb+VAAg=
X-Google-Smtp-Source: AGHT+IFtYm7+InIzE8NYWnE5on5jRcQ1LiNxm3OAKBXi9wWhDfkAhDCnGw+SZnH/vFb1Xp+/slpCBw==
X-Received: by 2002:a05:6602:608a:b0:83a:b188:7a4d with SMTP id ca18e2360f4ac-83ecdb38114mr88002539f.0.1732228867257;
        Thu, 21 Nov 2024 14:41:07 -0800 (PST)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-83ecd418010sm18407939f.42.2024.11.21.14.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 14:41:06 -0800 (PST)
Message-ID: <4141beba-3310-49a0-9163-538b89c0e6fb@sifive.com>
Date: Thu, 21 Nov 2024 16:41:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: Call secondary mmu notifier when flushing the
 tlb
To: Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240328073838.8776-1-alexghiti@rivosinc.com>
 <20241121-e97820f8c09de9bcedfe885d@orel>
 <0456b6b4-1453-444d-8cd8-38715dc9f845@ghiti.fr>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <0456b6b4-1453-444d-8cd8-38715dc9f845@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_144109_039446_F12B00C3 
X-CRM114-Status: GOOD (  10.50  )
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

SGkgQWxleCwKCk9uIDIwMjQtMTEtMjEgNDozNiBBTSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+
IEhpIEFuZHJldywKPiAKPiBPbiAyMS8xMS8yMDI0IDEwOjMyLCBBbmRyZXcgSm9uZXMgd3JvdGU6
Cj4+IE9uIFRodSwgTWFyIDI4LCAyMDI0IGF0IDA4OjM4OjM4QU0gKzAxMDAsIEFsZXhhbmRyZSBH
aGl0aSB3cm90ZToKPj4+IFRoaXMgaXMgcmVxdWlyZWQgdG8gYWxsb3cgdGhlIElPTU1VIGRyaXZl
ciB0byBjb3JyZWN0bHkgZmx1c2ggaXRzIG93bgo+Pj4gVExCLgo+Pj4KPj4+IFNpZ25lZC1vZmYt
Ynk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPj4+IC0tLQo+Pj4K
Pj4+IENoYW5nZXMgaW4gdjI6Cj4+PiAtIFJlYmFzZSBvbiB0b3Agb2YgNi45LXJjMQo+Pj4KPj4+
IMKgIGFyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyB8IDM5ICsrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyks
IDE2IGRlbGV0aW9ucygtKQo+Pj4KPj4gSGkgQWxleCwKPj4KPj4gSXMgdGhpcyBwYXRjaCBzdGls
bCBzb21ldGhpbmcgd2UgbmVlZD8KPj4KPj4gVGhhbmtzLAo+PiBkcmV3Cj4gCj4gCj4gWWVzIEkg
dGhpbmsgc28sIGhvcGVmdWxseSBpdCBnZXRzIG1lcmdlZC4KClBsZWFzZSByZWJhc2UgYW5kIHJl
c2VuZCB0aGlzIHBhdGNoLiBJdCBjb25mbGljdHMgd2l0aCB0d28gb3RoZXIgY2hhbmdlcyBtZXJn
ZWQKc2luY2UgeW91IHNlbnQgdjIgKDAzOGFjMThhYWU5MyBhbmQgZjU4ZTVkYzQ1ZmE5KSwgaW4g
YWRkaXRpb24gdG8gdGhlIG9uZSB5b3UKc2VudCB0aGUgcmVzb2x1dGlvbiBmb3IuCgpSZWdhcmRz
LApTYW11ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
