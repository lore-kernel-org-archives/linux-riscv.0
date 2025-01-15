Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51848E77188
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 02:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=muHVyoBPHb8FrcEjT9Uiu/10sR7QqGIzQ9HZD4sv0Rw=; b=GIWkhHojR9J24P
	6468cbwz3LCM7Z7CUw1EFbsBj6zO3eBpGSA/2kKeufHr+fCSQ3gRB8zphISZg3gcjEAY82yP912fo
	HkFcrtNVVwRjtninCR3dmJdWSdkNHysFfn4SdgjlzsyXrptg3m9rPvrYQ6KNI65Sc0qK6U7rARxep
	6if9HVfADn1fFYizVs18Q0qvFDSWGUVPai9zAVJjMA2wt7I07gaCogZuGAwTQZ1V/1tVZNFUuFcBS
	DAcdFiNOMsK7C3A5Wr2tkVaQC7xIBZk0cIx1PE/qObtkcwKz/bFIZ1esKNk8oT1NRaRe7cNlLHRE9
	uCijU19LRmn+OfLyRu6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXshR-0000000AMVr-37x0;
	Wed, 15 Jan 2025 02:00:05 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXshP-0000000AMVU-1q2I
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 02:00:04 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2163dc5155fso113357065ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 18:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736906402; x=1737511202; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6j7EL5/S6mW10Eo2ewMIu3NVjAIkszvM8gbN2PXKIvw=;
        b=VE2VIlr1lFhoVw/wy8EkI+szmOaodPbGkjGbnM+7/oSDyF/FovEXg3YHRj+mDfvbng
         OWUf0LuF1q9oU3KKkSzV4Vrt29IaUbsszxc/Wkbdq5lFjzrb5grHld/CkRilRvvvkAP1
         JrFTE6ka2ZvwjTabqD8he5ceVyKfQz7g64oJfJkJviYZcCJv82G31ZtWj3vHJiwmMDw/
         kh1yTqjO3tRbjtI18NFlC3Mpqd0ZO9LKJ6DZe5pXrhwPHMlSotxow3ejYrqGM0edgBM/
         gU3Viq3psm0yhI2dnSoePBG93JsEdP7USrik/aLiW+AT4/e8Cv4yOvsOLlz9CxewON/G
         0lXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736906402; x=1737511202;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6j7EL5/S6mW10Eo2ewMIu3NVjAIkszvM8gbN2PXKIvw=;
        b=hDK5+1KPRXWh7QT3RJfQ5TaZAYHHgNh1emRKxIc7ZLuNydXnRNapJJLvsEF2PhtrWr
         w6C0Yklaviz2jjXGKkAbqsHIM7MzanEXL5v6okbbaRAFlQFvCNVAJyaAfIhoTOwn2+gd
         Q0Zp60gAq7G+Jh2Ta1hJRtNU6pgsVvhn6BH4lgdRDwKUYAzGyG0tKrIA+dzJT4taRxhn
         U1rST0xda/tdMGAf0ce+fpsV5E0YQWF6Neq+t0nH5xX3X8bau6ztktj8tvPYQwaOSPkL
         0PFzs2SVkVo3AEwB+qd9vtrQA3P+VCUFtLdpt5neKvi0bcxalh+xCWPfs5gaOiejUaP9
         pZHA==
X-Gm-Message-State: AOJu0YwbcyzEMPbQ4Dnygu3utgHJUN8zO50diuXg9A5ox6S2qQOqfeeb
	Ojn7MvSrAnFFf1g7fM033KWpe/6CMrpAg676qaXfZ8ZpgZ9asFgM
X-Gm-Gg: ASbGnct4aCtxr5E9ja1KErqAiPhJ4MkVkwxj+OQ3zWrTyRm1lG5ZdiAMjEZsv7L+0Hi
	PYvA/VKkcURwFI00kOdzbBl1GwE1mGrqP5egD7pTYFp37zUrU6Xy9UgCuuH/ALICfCBamlzbvqP
	e6VN1iOKh/h+pGkEUm4uCn4bKZ/T6Kw2R9QO8cJ+bynkPbMSobCkBc1Ir9QtymFxr+LDpwQ1ysF
	TQMdB6WPgTe62cH+iezQpE5paObNUf2Kj74sBtf+JzKoHgCW7z3IOzbh9Er
X-Google-Smtp-Source: AGHT+IEONGFipWFSvg1P+/klhO41uep5Mxidtxdy3ma6qbR94qyoRbNDDx6VSTZYX42TI6X087uDaw==
X-Received: by 2002:a17:903:22c4:b0:216:50fb:5dfc with SMTP id d9443c01a7336-21a83f4b046mr377332825ad.9.1736906401986;
        Tue, 14 Jan 2025 18:00:01 -0800 (PST)
Received: from [172.31.0.17] ([136.60.141.45])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f233851sm72848525ad.191.2025.01.14.18.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 18:00:01 -0800 (PST)
Message-ID: <31ce4016-9420-4143-ae31-faf36a878cb4@gmail.com>
Date: Tue, 14 Jan 2025 19:00:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Page sizes supported by RISC-V
From: Jeff Law <jeffreyalaw@gmail.com>
To: Florian Weimer <fweimer@redhat.com>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>,
 Xu Lu <luxu.kernel@bytedance.com>
References: <878qvbzqfx.fsf@oldenburg.str.redhat.com>
 <e55950a2-beb0-4f2a-81da-1c66724116d7@gmail.com>
 <8734lixzss.fsf@oldenburg.str.redhat.com>
 <cbbc9925-12a5-4043-a6c5-ccd1ef0997c8@gmail.com>
Content-Language: en-US
In-Reply-To: <cbbc9925-12a5-4043-a6c5-ccd1ef0997c8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_180003_480772_82BE7A29 
X-CRM114-Status: GOOD (  15.27  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiA5LzI5LzI0IDk6MTggQU0sIEplZmYgTGF3IHdyb3RlOgo+IAo+IAo+IE9uIDkvMjkvMjQg
OTowOCBBTSwgRmxvcmlhbiBXZWltZXIgd3JvdGU6Cj4+Cj4+IEkgdW5kZXJzdGFuZCB0aGF0IG5v
dCBtYWtpbmcgYSBjYWxsIGluIHRoZSBzcGVjaWZpY2F0aW9ucyBhdm9pZHMgdGhlCj4+IG5lZWQg
dG8gcmVzb2x2ZSB0aGVzZSBjb25mbGljdHMuwqAgQnV0IGlmIHlvdSBkb24ndCBkZWZpbmUgYSBt
YXhpbXVtIHBhZ2UKPj4gc2l6ZSB0aGVyZSwgaXQgaXMgZWZmZWN0aXZlbHkgc3BlY2lmaWVkIGFz
IDQwOTYgYnl0ZXMuwqAgVGhpcyB3aWxsIGNhdXNlCj4+IHByb2JsZW1zIGlmIGRpc3RyaWJ1dGlv
bnMgdGFyZ2V0aW5nIGxhcmdlIHN5c3RlbXMgd2FudCBhIGxhcmdlciBwYWdlCj4+IHNpemUgYmVj
YXVzZSBpdCBiZXR0ZXIgYWxpZ25zIHdpdGggdGhlIGtpbmQgb2YgaGFyZHdhcmUgdGhleSB0YXJn
ZXQuCj4+IEl0J3MgcmVhbGx5IGJhZCBmb3IgY3Jvc3MtZGlzdHJpYnV0aW9uIGJpbmFyeSBjb21w
YXRpYmlsaXR5LCBzb21ldGhpbmcKPj4gdGhhdCdzIGltcG9ydGFudCBvdXRzaWRlIHRoZSBlbWJl
ZGRlZCBzcGFjZSBhbmQgcHJvYmFibHkgbmVjZXNzYXJ5IGZvcgo+PiBtYWluc3RyZWFtaW5nLgo+
Pgo+PiAoT2YgY291cnNlIHlvdSBrbm93IGFsbCB0aGlzLiA4LSkKPiBZdXAuwqAgT25jZSBpdCdz
IGJha2VkIGludG8gb25lIHNpZ25pZmljYW50IGRpc3RybywgaXQncyBkb2luZyB0byBiZSAKPiBi
bG9vZHkgaGFyZCB0byBjaGFuZ2UuwqAgSSdtIHN1cmUgd2UgYm90aCByZW1lbWJlciB0aGUgUFBD
IHBhZ2VzaXplIHN0dWZmIAo+IGZyb20gYSBmZXcgeWVhcnMgYmFjayA7KAo+IAo+IEkgc3Ryb25n
bHkgc3VzcGVjdCB0aGUgbGFjayBvZiBzcGVjaWZpY2F0aW9uIGhlcmUgaXMgbWVhbiB0byBnaXZl
IAo+IGRlZ3JlZXMgb2YgZnJlZWRvbSB0byB0aGUgaW1wbGVtZW50b3JzLCBidXQgc29tZXRpbWVz
IHRob3NlIHdyaXRpbmcgdGhlIAo+IHNwZWNzIGRvbid0IHJlYWxseSB1bmRlcnN0YW5kIHRoZSBp
bXBsaWNhdGlvbiBvZiBsZWF2aW5nIHRoaW5ncyBsaWtlIAo+IHRoaXMgdW5zcGVjaWZpZWQgYW5k
IGhvdyBtdWNoIHBhaW4gaXQgcmVhbGx5IGNhdXNlcyBpbiB0aGUgZW5kLgpTbyByZXN1cnJlY3Rp
bmcgdGhpcyBkaXNjdXNzaW9uLgoKSXMgdGhlcmUgYW55IHJlYWxpc3RpYyBjaGFuY2Ugb2YgYnVt
cGluZyB0aGUgbWluaW11bSBwYWdlc2l6ZSBmb3IgcmlzYy12IAphdCB0aGlzIHBvaW50PyAgWHUg
THUgYW5kIGhpcyB0ZWFtIGhhdmUgc29tZSBjb21wZWxsaW5nIGRhdGEgdGhhdCAKaW5kaWNhdGVz
IG1vdmluZyBmb3J3YXJkIHRvIDY0ayBjb3VsZCBiZSBoaWdobHkgcHJvZml0YWJsZS4gIFRoYXQg
d29yayAKd2FzIGRvbmUgb24gYWFyY2g2NCwgYnV0IHNob3VsZCBiZSBnZW5lcmFsbHkgYXBwbGlj
YWJsZSB0byByaXNjdiBhcyB3ZWxsLgoKTXkgYmlnZ2VzdCB3b3JyeSBpcyBpZiB3ZSBkb24ndCB0
YWNrbGUgdGhpcyBub3csIHRoZW4gSSBzdXNwZWN0IHRoZSAKd2luZG93IGNsb3NlcyBmb3JldmVy
IGFuZCBJJ2QgaGF0ZSBmb3IgdGhlIHNwYWNlbWl0IGNoaXAgaW4gdGhlIEJQSSB0byAKbWFuZGF0
ZSBzb21ldGhpbmcgbGlrZSB0aGlzIGdvaW5nIGZvcndhcmQuCgpqZWZmCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
