Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1A3C369D9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 11:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w6v7yz9U6yaqPwNWXYIMl47CjNVVHM0XUT/DvNTYvE0=; b=CSB9hzE+U9owN+
	OUJBP4qwXo4mjpzCNd+G0PYdeChTjKRHEsJjBZ9Xx2icxhRDW6WJNixJ+jMisz4h68Sxu4Tqr72/8
	AHz8/yhnzXSCeYguMFMCXFKv7YVbnbDDEMkAmw82cGarCQN+7nbtue0ixakMh8nX6sJIflgcGZQQJ
	4BRA1V0ZH43H5y/goD1YkyfbLNmVZoPW+PKEXxUvH7FLnsc1EE9ANuda87vgifuYB1vEnC1fMwI/T
	9YBesJ+WbwyCuh4OMqtJsxiecDInn1q7mBT1rofDVqFkrjxQ5a47Qm9P4eC1WC5vRLiv8HQhAzBgz
	C1L3JdQbpv5Cvc5eyRJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA60Y-0000000Ck0L-23yY;
	Wed, 30 Apr 2025 11:53:46 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA5sa-0000000CjN2-20su
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 11:45:36 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-391324ef4a0so395315f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 30 Apr 2025 04:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746013531; x=1746618331; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MwfMy0+KN//YvkfkLkShPPR01KHLLVwze7q8vnuMUqk=;
        b=OyryHhDqB7paiKqPg9bbBt8XR0VICgGI1blwF9x+Qqa/yOioPJiAA3rZJDMbXzxWEe
         of0DmKk/rRMY7FwYndPn3Ik/qu4JcntmM7YU01TfnQuy/znymUS90o8aJsg1LVY+4nFp
         SgSQHCA3qePiW/RiCdKHU0jdaKtVRCwAmoGOyBS0tpAITHLlcuKJ+hjjSUp+qMrNpfvD
         ZR1ZM2EKPZ2E1v3C/zDGkHPV1GLEyOuBNFW+s/HYtRAz41hxA3qyAuKJ1vbd1lGw03VA
         4ragGW2syLr8LPaY+2wNYEmjcbMAhlNuBl3Dpj6J7g8aj+Durl+kcG/aI76Ds6pcffav
         uSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746013531; x=1746618331;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MwfMy0+KN//YvkfkLkShPPR01KHLLVwze7q8vnuMUqk=;
        b=Aeygvdv/4a6nrglQJU2jd3rn50KeCDHtR+5Ojz1LSHtzlllzP8bDmAwud2OayYihsA
         ePmHWSZ5URFjPXUn/aYnddjhbUqXkuStRP/ZpkU6GHtR6I4RUOdrH5kCbtKTr/Z3Jg3s
         OXy7PaykRQOD4JkoBgWfnRTcal5CiIsRqsC58zll9lt5PCpDJ1JerlnyzIW0WDvZj8mG
         O8Mos34cttQH0sZyevH6dPH+1v/7TPmoZtjJI2hfNJisoldKryUNJlliWNHY0v4YqDNI
         64TLQDqz+O2Ov3Qb3GBNO/2SDacLRP/QuUX4fDZbiOuo+36oc+BM5/mdU96GoAr9TEmU
         XSIA==
X-Forwarded-Encrypted: i=1; AJvYcCWSOMLTEM805fkq/Q+ohIKYfTMZB7s+8cuZ1X1/fBlqVJYvxQibp5UWgdPyC4e+9pF/ntRLPzs0fWSdqA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRTYIwJSMc4uXch5J+C3fen1FhzRxz+ZCWiMaknJ2t/e41esEL
	5ahms4oVbEfK5ZcZ74VQ+7M5GTGzaiA+KdCtspyB0vhrN6AEZ49IshZzu4vBl8s=
X-Gm-Gg: ASbGncuX5zSJvBKBUEvKnn2rcfEDWZSpyTCXmAchMbVaMAm6ai3IJ+mTZtORDB7Lwz7
	CHaVM3oej5AkWIj7Q36t8Orr1ZPY7vYYwycxi+vwWFMxsx3V7HQskIieCUHNtLw64eLJZ/z9Knc
	4NzohS8kAhJKjC/Yc2ek+X2idgSiaNCnJF5cPXnt/8F5zPrcq3bzKqy4OqtV2Kgy4HfWiKkAhTg
	G4TklXRRKqnJsFy32vGEFpzR8b+HKL//+X762/0KPyHI68oItJP5VdJBgHGOPYcwdWAsVpzuCWo
	cYZMhwA2ZYC9ISdO+Rom0K/8bIMf9Ig3L4CJv0gJ86gPOk1LTGrcmEw4zt7YiK836Sgj3OrZxID
	kmB6acayXSfM=
X-Google-Smtp-Source: AGHT+IGPsHFo0i2I8e2STgcf8/9L1wSmTK1gIO5CuUV/Z9SjXZXm3h77FFhC8bIycStr7wFr3jgBMA==
X-Received: by 2002:a05:6000:22c3:b0:3a0:678f:8023 with SMTP id ffacd0b85a97d-3a091a624b4mr22754f8f.4.1746013530645;
        Wed, 30 Apr 2025 04:45:30 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e460b2sm17013970f8f.70.2025.04.30.04.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 04:45:30 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 30 Apr 2025 13:45:29 +0200
Message-Id: <D9JY52BJEFX2.2S5XL9NOOGBS7@ventanamicro.com>
Subject: Re: [PATCH 4/5] KVM: RISC-V: reset VCPU state when becoming
 runnable
Cc: "Anup Patel" <apatel@ventanamicro.com>, <kvm-riscv@lists.infradead.org>,
 <kvm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Atish Patra" <atishp@atishpatra.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Andrew Jones" <ajones@ventanamicro.com>, "Mayuresh
 Chitale" <mchitale@ventanamicro.com>
To: "Anup Patel" <anup@brainfault.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-7-rkrcmar@ventanamicro.com>
 <CAAhSdy0e3HVN6pX-hcX2N+kpwsupsCf6BqrYq=bvtwtFOuEVhA@mail.gmail.com>
 <D9IGJR9DGFAM.1PVHVOOTVRFZW@ventanamicro.com>
 <CAK9=C2Woc5MtrJeqNtaVkMXWEsGeZPsmUgtFQET=OKLHLwRbPA@mail.gmail.com>
 <D9J1TBKYC8YH.1OPUI289U0O2C@ventanamicro.com>
 <CAAhSdy01yBBfJwdTn90WeXFR85=1zTxuebFhi4CQJuOujVTHXg@mail.gmail.com>
 <D9J9DW53Q2GD.1PB647ISOCXRX@ventanamicro.com>
 <CAAhSdy0B-pF-jHmTXNYE7NXwdCWJepDtGR__S+P4MhZ1bfUERQ@mail.gmail.com>
 <CAAhSdy20pq3KvbCeST=h+O5PWfs2E4uXpX9BbbzE7GJzn+pzkA@mail.gmail.com>
 <D9JTZ6HH00KY.1B1SKH1Z0UI1S@ventanamicro.com>
 <CAAhSdy0TfpWQ-kC_gUUCU0oC5dR45A1v9q84H2Tj9A8kdO0d1A@mail.gmail.com>
In-Reply-To: <CAAhSdy0TfpWQ-kC_gUUCU0oC5dR45A1v9q84H2Tj9A8kdO0d1A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_044532_639637_8160684A 
X-CRM114-Status: GOOD (  21.37  )
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

MjAyNS0wNC0zMFQxNTo0NzoxMyswNTozMCwgQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz46Cj4gT24gV2VkLCBBcHIgMzAsIDIwMjUgYXQgMTo1OeKAr1BNIFJhZGltIEtyxI1tw6HFmSA8
cmtyY21hckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPj4gMjAyNS0wNC0zMFQxMDo1NjozNSsw
NTozMCwgQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz46Cj4+ID4gT24gV2VkLCBBcHIg
MzAsIDIwMjUgYXQgOTo1MuKAr0FNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+IHdy
b3RlOgo+PiA+PiBPbiBUdWUsIEFwciAyOSwgMjAyNSBhdCA5OjUx4oCvUE0gUmFkaW0gS3LEjW3D
ocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+PiA+PiA+IFRoZSBwb2ludCBv
ZiB0aGlzIHBhdGNoIGlzIHRvIHJlc2V0IHRoZSBib290IFZDUFUsIHNvIHdlIHJlc2V0IHRoZSBW
Q1BVCj4+ID4+ID4gdGhhdCBpcyBtYWRlIHJ1bm5hYmxlIGJ5IHRoZSBLVk1fU0VUX01QX1NUQVRF
IElPQ1RMLgo+PiA+Pgo+PiA+PiBMaWtlIEkgc2FpZCBiZWZvcmUsIHdlIGRvbid0IG5lZWQgdG8g
ZG8gdGhpcy4gVGhlIGluaXRpYXRpbmcgVkNQVQo+PiA+PiBjYW4gYmUgcmVzZXR0ZWQganVzdCBi
ZWZvcmUgZXhpdGluZyB0byB1c2VyIHNwYWNlIGZvciBzeXN0ZW0gcmVzZXQKPj4gPj4gZXZlbnQg
ZXhpdC4KPj4KPj4gWW91IGFzc3VtZSBpbml0aWF0aW5nIFZDUFUgPT0gYm9vdCBWQ1BVLgo+Pgo+
PiBXZSBzaG91bGQgcHJldmVudCBLVk1fU0VUX01QX1NUQVRFIElPQ1RMIGZvciBhbGwgbm9uLWlu
aXRpYXRpbmcgVkNQVXMgaWYKPj4gd2UgZGVjaWRlIHRvIGFjY2VwdCB0aGUgYXNzdW1wdGlvbi4K
Pgo+IFRoZXJlIGlzIG5vIHN1Y2ggYXNzdW1wdGlvbi4KCllvdSBwcm9iYWJseSBoYXZlbid0IGlu
dGVuZGVkIGl0OgoKICAxKSBWQ1BVIDAgaXMgImNoaWxsaW5nIiBpbiB1c2Vyc3BhY2UuCiAgMikg
VkNQVSAxIGluaXRpYXRlcyBTQkkgcmVzZXQuCiAgMykgVkNQVSAxIG1ha2VzIGEgcmVzZXQgcmVx
dWVzdCB0byBWQ1BVIDAuCiAgNCkgVkNQVSAxIHJldHVybnMgdG8gdXNlcnNwYWNlLgogIDUpIFVz
ZXJzcGFjZSBrbm93cyBpdCBzaG91bGQgcmVzZXQgdGhlIFZNLgogIDYpIFZDUFUgMCBzdGlsbCBo
YXNuJ3QgZW50ZXJlZCBLVk0uCiAgNykgVXNlcnNwYWNlIHNldHMgdGhlIGluaXRpYWwgc3RhdGUg
b2YgVkNQVSAwIGFuZCBlbnRlcnMgS1ZNLgogIDgpIFZDUFUgMCBpcyByZXNldCBpbiBLVk0sIGJl
Y2F1c2Ugb2YgdGhlIHBlbmRpbmcgcmVxdWVzdC4KICA5KSBUaGUgaW5pdGlhbCBib290IHN0YXRl
IGZyb20gdXNlcnNwYWNlIGlzIGxvc3QuCgo+PiBJJ2QgcmF0aGVyIGNob29zZSBhIGRpZmZlcmVu
dCBkZXNpZ24sIHRob3VnaC4KPj4KPj4gSG93IGFib3V0IGEgbmV3IHVzZXJzcGFjZSBpbnRlcmZh
Y2UgZm9yIElPQ1RMIHJlc2V0Pwo+PiAoQ2FuIGJlIGNhcGFiaWxpdHkgdG9nZ2xlIGZvciBLVk1f
U0VUX01QX1NUQVRFIG9yIGEgc3RyYWlnaHQgbmV3IElPQ1RMLikKPj4KPj4gVGhhdCB3b3VsZG4n
dCAiZml4IiBjdXJyZW50IHVzZXJzcGFjZXMsIGJ1dCB3b3VsZCBzaWduaWZpY2FudGx5IGltcHJv
dmUKPj4gdGhlIHNhbml0eSBvZiB0aGUgS1ZNIGludGVyZmFjZS4KPgo+IEkgYmVsaWV2ZSB0aGUg
Y3VycmVudCBpbXBsZW1lbnRhdGlvbiBuZWVkcyBhIGZldyBpbXByb3ZlbWVudHMKPiB0aGF0J3Mg
YWxsLiBXZSBjZXJ0YWlubHkgZG9uJ3QgbmVlZCB0byBpbnRyb2R1Y2UgYW55IG5ldyBJT0NUTC4K
CkkgZG8gdG9vLiAgVGhlIHdob2xlIHBhdGNoIGNvdWxkIGhhdmUgYmVlbiBhIHNpbmdsZSBsaW5l
OgoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3Zj
cHUuYwppbmRleCBkM2Q5NTdhOWU1YzQuLmIzZTZhZDg3ZTFjZCAxMDA2NDQKLS0tIGEvYXJjaC9y
aXNjdi9rdm0vdmNwdS5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwpAQCAtNTExLDYgKzUx
MSw3IEBAIGludCBrdm1fYXJjaF92Y3B1X2lvY3RsX3NldF9tcHN0YXRlKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSwKIAogCXN3aXRjaCAobXBfc3RhdGUtPm1wX3N0YXRlKSB7CiAJY2FzZSBLVk1fTVBf
U1RBVEVfUlVOTkFCTEU6CisJCWt2bV9yaXNjdl9yZXNldF92Y3B1KHZjcHUpOwogCQlXUklURV9P
TkNFKHZjcHUtPmFyY2gubXBfc3RhdGUsICptcF9zdGF0ZSk7CiAJCWJyZWFrOwogCWNhc2UgS1ZN
X01QX1NUQVRFX1NUT1BQRUQ6CgpJdCBpcyB0aGUgYmFja3dhcmQgY29tcGF0aWJpbGl0eSBhbmQg
dHJ5aW5nIHRvIGZpeCBjdXJyZW50IHVzZXJzcGFjZXMKdGhhdCdzIG1ha2luZyBpdCB1Z2x5LiAg
SSBhbHJlYWR5IGdhdmUgdXAgb24gdGhlIGxhdHRlciwgc28gd2UgY2FuIGhhdmUKYSBkZWNlbnRs
eSBjbGVhbiBzb2x1dGlvbiB3aXRoIHRoZSBmb3JtZXIuCgo+IEFsc28sIGtlZXAgaW4gbWluZCB0
aGF0IHNvIGZhciB3ZSBoYXZlIGF2b2lkZWQgYW55IFJJU0MtVgo+IHNwZWNpZmljIEtWTSBJT0NU
THMgYW5kIHdlIHNob3VsZCB0cnkgdG8ga2VlcCBpdCB0aGF0IHdheQo+IGFzIGxvbmcgYXMgd2Ug
Y2FuLgoKV2UgY2FuIHJlLXVzZSBLVk1fU0VUX01QX1NUQVRFIGFuZCBhZGQgYSBLVk0gY2FwYWJp
bGl0eS4KVXNlcnNwYWNlIHdpbGwgb3B0LWluIHRvIHJlc2V0IHRoZSBWQ1BVIHRocm91Z2ggdGhl
IGV4aXN0aW5nIElPQ1RMLgoKVGhpcyBkZXNpZ24gd2lsbCBhbHNvIGFsbG93IHVzZXJzcGFjZSB0
byB0cmlnZ2VyIGEgVkNQVSByZXNldCB3aXRob3V0CnRlYXJpbmcgZG93biB0aGUgd2hvbGUgVk0u
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
