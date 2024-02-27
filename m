Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB82BC5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 09:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=08EL8AEuXIdmjf+ciAAH8TWgGRv0rPsrVqBh40+2LVc=; b=bd31i8qqMAktdJ
	04zwCVn4UzIxzjSKPok7JcWLUK03E1wnUQMzkaoHfJ3rDyE390i7rFEq0qH+2ebJ3Wm8CMoWt39qj
	TYNHD/JZasByDng9Sy2frvRuTZfVWfGlwagyRcdGXh+fqlSIHzDzCrrEvfLjr0+iORLZKgYcZz4Cm
	tqWj7k4fc+xcfpOFDgWW+C4AlkpAAwWIFyDwsWF/uBMhEl9ThcoZa7lf0RrorJ3jYgw+5DSM8pbCl
	PcOP5/nOeAKuXld6/EJ/7rDjaQXjFDirPbh5bI4189mr99i+IdGBC21keg8JeyysukaLubseui2/7
	k15TEJoJOsx1u4ehhkdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1retVN-00000004TMo-17oy;
	Tue, 27 Feb 2024 09:12:10 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1retVF-00000004TKd-1ZFM
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 09:11:59 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6e495e7d697so771089a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 27 Feb 2024 01:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709025115; x=1709629915; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iqmg1xIpurv53FgVspQqGn5e7v8oRKUqp2bPRQGCv1w=;
        b=j9BabjuQCcRUEDtwaL8h5AWP2os3wzbib4Yi3eX6lmhy1Z27SJ22zLcVt6OwnSERK3
         kPfw5LAqN7G7/HlZ9DD37H0hTxhKKs2G8NAn+tiEqPlp5Ja3CL+uAxH1l8RdjlD5bO6Y
         75fhDSFH++bsT/vnT8UOQ37hgBSlyYLzznQPGH1RjQ+pLneLjKW5EviMiwc0pf6l0JXh
         nXqAn2N0Upx5r7apZo80ZmOk4X1eo6pRsfI2ncxSAy3BrPlOMf9VzMJvvYhEs8MYr2WU
         12dhakFPA4GBbpfaRfLlAp/drcRNybtTwJc09SpPNtuqjdo/4Vk7VUVKIY36WSWepaUi
         aR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709025115; x=1709629915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iqmg1xIpurv53FgVspQqGn5e7v8oRKUqp2bPRQGCv1w=;
        b=j1PZzr8SYnbNA/oobw0PpUpwn25055S9zaLGVTGZTLaFJi50BBHZu3Nwhi+jCq+7kz
         ovj44mE00EUtNxNcp1BctkrIqN7d/JgBbvGImC2UsGqLUGKx/4nqIJefEjTPtxPnSOdh
         iFXbYLg2GDz9W8k9vxsqSNi3NcyD4bDWjSs7SXIfwwOVh/025xjI41eu6tZKy9RBKIz4
         ilEaQeJzS0c5LyfnC0MjP+bsYCdihhYCBdO6siE26j9oPDquAjkdc+ySM1sb7golKmbI
         7T11hkXQheApiKIPDif/ifyuhxofuokoKiUg2ddJD6sgDaIV3KZqMfZthG9q+e6YX3lq
         NJfg==
X-Forwarded-Encrypted: i=1; AJvYcCUcryphqdD2yZ8zZH8vyckpu/hq6zl3rQGFUJYY4reaWT2jc5yE1koXGVMXTQSaV74NzevCwii9b5qreRnxdGqtvscI4GLbx5NkPxVVyRHg
X-Gm-Message-State: AOJu0YzHd+/CKR5N2v329NtrigsuLjj+YOzgJXutGRwj6UwqKSLmCIZD
	y3zqWaWxamHb1YvGbmcVnqfCKFiJRkyWURnphHvRoioDtckwmQuJ0RWlymfFncE=
X-Google-Smtp-Source: AGHT+IHl56rwr930B3wadTCG40VLh8Pqx/IvnBbhnZLNnBMwNU6D0iq/HaPHH32q8T7UEoPk01A0xw==
X-Received: by 2002:a4a:d0d4:0:b0:5a0:3aeb:ae3f with SMTP id u20-20020a4ad0d4000000b005a03aebae3fmr9524072oor.0.1709025115072;
        Tue, 27 Feb 2024 01:11:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:999:a3a0:bf35:904f:7a0e:6c9a? ([2a01:e0a:999:a3a0:bf35:904f:7a0e:6c9a])
        by smtp.gmail.com with ESMTPSA id fa29-20020a056a002d1d00b006e47b5b67d1sm979347pfb.77.2024.02.27.01.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 01:11:54 -0800 (PST)
Message-ID: <a49546e8-6749-4458-98da-67fd37b7df18@rivosinc.com>
Date: Tue, 27 Feb 2024 10:11:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: deprecate CONFIG_MMU=n
To: Charles Lohr <lohr85@gmail.com>, Conor Dooley <conor@kernel.org>
Cc: Samuel Holland <samuel.holland@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Andrew Jones <ajones@ventanamicro.com>, Damien Le Moal <dlemoal@kernel.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Atish Patra <atishp@rivosinc.com>
References: <20240226140649.293254-1-cleger@rivosinc.com>
 <40dee2c1-ff24-40b2-a13c-6934139ba869@sifive.com>
 <ea356036-5a0b-47ea-aafb-f9813cc6ec9b@rivosinc.com>
 <20240226-pajamas-okay-51e16426b0f5@spud>
 <CAGu26P_v9FjYq9Bncvfd-dBhdHQevvN3HpO1nqjA2hYFCpG7hg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CAGu26P_v9FjYq9Bncvfd-dBhdHQevvN3HpO1nqjA2hYFCpG7hg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_011157_748314_B45DC12D 
X-CRM114-Status: GOOD (  23.18  )
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

CgpPbiAyNi8wMi8yMDI0IDIwOjAwLCBDaGFybGVzIExvaHIgd3JvdGU6Cj4gV09BSCEgUGxlYXNl
IERPIE5PVCBkZXByZWNhdGUgTk9NTVUuIEkgdXNlIHRoZSBOT01NVSBidWlsZCBjb25zdGFudGx5
Cj4gYW5kIE5PTU1VIExpbnV4IG9uIFJJU0MtViBpcyB0aGUgYXZlbnVlIHVzZWQgYnkgbWFueSBG
UEdBIHNvZnQgY29yZXMKPiBmb3IgTGludXgsIGFzIHdlbGwgYXMgc29tZSBsaW1pdGVkIHN5c3Rl
bXMuCj4gCj4gSSBnZXQgbmV3IGNvcGllcyBvZiB0aGUga2VybmVsIHdoZW4gdGhlcmUgYXJlIHJl
bGVhc2VzIGFuZCB0ZXN0IHRoZW0KPiBmcmVxdWVudGx5IHRvIG1ha2Ugc3VyZSBldmVyeXRoaW5n
IGlzIHN0aWxsIHdvcmtpbmcgYXMgZXhwZWN0ZWQuCj4gCj4gRm9yIHVzIHdlIGp1c3QgZG9uJ3Qg
Y2FyZSBhYm91dCBYSVAuIEkgbWVhbiBpZiBzb21lb25lIGRpZCBwdXNoIGl0Cj4gdGhyb3VnaCB0
byBmcnVpdGlvbiwgSSdkIGFsc28gdGVzdCBhbmQgdXNlIGl0LCBidXQgSSB1cmdlIHlvdSBwbGVh
c2UKPiBkbyBub3QgZGVwcmVjYXRlIHRoaXMuICBXaGlsZSBpdCdzIHNvbWV0aW1lcyBuZWVkZWQg
YSBiaXQgb2YgYQo+IGNyZWF0aXZlIGJ1aWxkIHRvIGdldCBldmVyeXRoaW5nIHdvcmtpbmcsIEkn
dmUgbmV2ZXIgbmVlZGVkIHRvIHBhdGNoCj4gYW55dGhpbmcgaW4gdGhlIGtlcm5lbCBiZXlvbmQg
cGF0Y2hpbmcgaW4gYSBjdXN0b20gY29uc29sZSBmb3Igc2VyaWFsCj4gb3V0cHV0Lgo+IAoKSGV5
IENoYXJsZXMsCgpObyB3b3JyaWVzLCB3ZSBhY3R1YWxseSBkaWQgbm90IGV4cGVjdGVkIE5PTU1V
IHRvIGhhdmUgKnNvIG1hbnkqIHVzZXJzLgpJIGd1ZXNzIGRlcHJlY2F0aW5nIHN0dWZmIGlzIGEg
Z29vZCB3YXkgdG8gaGF2ZSBpbW1lZGlhdGUgZmVlZGJhY2sgOykuCkhhdmluZyBGRFBJQyBwc0FC
SSB0byBiZSBtZXJnZWQgdXBzdHJlYW0gY291bGQgYWxzbyBwcm9iYWJseSBiZSBhCnBvc2l0aXZl
IHBvaW50IHRvd2FyZCBhIGJldHRlciBOT01NVSBzdXBwb3J0LgoKPiBJIGFtIGhhcHB5IHRvIGRp
c2N1c3MgdGhlIHBvc3NpYmlsaXR5IG9mIG1lIGFuZCBvciBvbmUgb2YgdGhlIG90aGVyCj4gUklT
Qy1WIHNvZnQgKEZQR0EpIGNvcmUgcGVvcGxlIHN0ZXBwaW5nIHVwIHRvIHRyeSB0byBiZSBtb3Jl
IGFjdGl2ZSwKPiBidXQgc28gZmFyIHdlJ3ZlIGp1c3QgYmVlbiB2ZXJ5IHdlbGwgc2VydmljZWQg
YnkgdGhlIGN1cnJlbnQgTk9NTVUKPiBMaW51eCBzZXR1cC4KCkl0IGNvdWxkIHByb2JhYmx5IGJl
IG5pY2UgdG8gaGF2ZSBzb21lIGZlZWRiYWNrL1Rlc3RlZC1ieTogZnJvbSBOT01NVQp1c2VycyBm
b3IgbmV3IHJlbGVhc2VzIHRoZW4uCgpUaGFua3MsCgpDbMOpbWVudAoKPiAKPiBDaGFybGVzCj4g
Cj4gCj4gT24gTW9uLCBGZWIgMjYsIDIwMjQgYXQgODowM+KAr0FNIENvbm9yIERvb2xleSA8Y29u
b3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIE1vbiwgRmViIDI2LCAyMDI0IGF0IDA0OjI1
OjI0UE0gKzAxMDAsIENsw6ltZW50IEzDqWdlciB3cm90ZToKPj4+IEkgZ3Vlc3MgSSBjb3VsZCBh
bHNvIG1hcmsgWElQIGFzIGRlcHJlY2F0ZWQuCj4+Cj4+IEknbSBub3Qgc28gc3VyZSwgcGVvcGxl
IHJlY2VudGx5IGFkZGVkIFhJUCBzdXBwb3J0IHRvIFFFTVUgKGFuZCBzZW50Cj4+IGtlcm5lbCBm
aXhlcyBpbiBEZWNlbWJlcikuIFhJUCBpcyBhbHNvIG5vdCBuZWFybHkgYXMgbXVjaCBvZiBhIHBy
b2JsZW0KPj4gdG8gc3VwcG9ydCwgdGhlcmUncyBmYXIgbGVzcyB0aGF0IGl0IGRvZXMgZGlmZmVy
ZW50bHksIHRoZSBtYWluIGJhcnJpZXIKPj4gd2FzIHRoZSBpbmFiaWxpdHkgdG8gdGVzdCBpdCB3
aGljaCBpcyBubyBsb25nZXIgdGhlIGNhc2UuCj4+IFRoYXQgc2FpZCwgWElQIGlzIGdvbm5hIGtp
bGwgaXRzZWxmIG9mZiBJIGZlZWwgYXMgaXQgZG9lcyBub3Qgc3VwcG9ydAo+PiBydW50aW1lIHBh
dGNoaW5nIGFuZCB0aGVyZWZvcmUgaXMgZXh0cmVtZWx5IGxpbWl0ZWQgb24gZXh0ZW5zaW9ucywg
Z2l2ZW4KPj4gd2UgdXNlIGFsdGVybmF0aXZlcyBmb3IgYWxsIG9mIHRoYXQgKGFsdGhvdWdoIEkg
c3VwcG9zZSBpZiBzb21lb25lIGhhcyBhCj4+IHVzZWNhc2UgdGhleSBjb3VsZCBtYWtlIG5hc3R5
IG1hY3JvcyB3b3JzZSBhbmQgaW1wbGVtZW50IGEgY29tcGlsZXRpbWUKPj4gc3dpdGNoIGluIHRo
ZSBhbHRlcm5hdGl2ZXMgdG9vKS4KPj4KPj4gQ2hlZXJzLAo+PiBDb25vci4KPj4KPj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0Cj4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
