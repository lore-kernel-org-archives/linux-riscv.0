Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C77C0218A
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jan 2025 01:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0TaWQ6Dh3842eJ++GQA/UQxePhweLmnRgOwcOUWdkqk=; b=4Kf6yyUQOWtNwS
	loMcg/bE5JmiySvvfx3F7+kL0BPHRB+M8C10sZKuhJKN9jSeoKQQNjga1gA1gkS2elVHn6zZSEjsa
	Yrnzii8Hh+0eEqcjCoJ+iSk43HbMbI5mTMCSRWpPJIJPW0GkS3FvSi+AgmIXywzYyMPDkJahJrTNh
	gg86aYKXg67ixnRj/3MmLpQhtCXbXRHWr1VZsmllvRYhLTGc3D2J0O/HbzYFRiAjvIz9ofnGz4X4y
	bfiL/pdYCa44gujI6wSSm1y4E/FJsBmj3UMJKtaUMzC1PhI8F2VNv7uAvewZP1ZiJwPTF16neOB1O
	SoSsF9CZNSJKTuqJqbxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdfsp-00000009tx5-2ZMX;
	Fri, 31 Jan 2025 01:31:47 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdfsn-00000009twj-1O7G
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jan 2025 01:31:46 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2161eb94cceso17827575ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jan 2025 17:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1738287104; x=1738891904; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MG19W4SOPIaZi7OCinPeczwbesfkNxF5n0JVFRzeQlA=;
        b=F9z+Sw3XK45B5zurQ/mSRC12+CqQ3A2KMaD250n8IY6pIVsWn/Va3TzCTXYZRvOZaQ
         m57dMe/v/e7jiu/M3mnw3qThT1M8e3S5VlJ1etqqXAx5t/aAHCWpzEMczdB4LbadRLmv
         MTjCJLOf+Uu8JVuXxiVBT1RI+iM9N1bA4ULpXajPiTrnTIGGgYrV7pp9/NPcsZ4lSqUn
         RTkDXSpuV0KsrtYGiSFo6k0kLp7nlv6Q3vmUDJ1wlYJB7mhLCRduURksnyKz2VYGib/p
         aK3OeT4t5FlZBYNXMfMvBce3/1ROXClhVSRlVh0DvyAFHzGVw2pr6p+wQDSOAd8qKZxF
         KtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738287104; x=1738891904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MG19W4SOPIaZi7OCinPeczwbesfkNxF5n0JVFRzeQlA=;
        b=DAEU8O+3EnbAPTvT38dBX5ShKZU87e9QMCEausiUbrmYJXri3ihxN+/ZS0cQ0eWlfQ
         gqlHcRgcSZNZcWruNZd9nbpH2gm3+MmTeipImNrb9yW+MnYERa2vRQ6v2ny7hBmj9Szt
         o0EIeJVG8SC5sIHA8g0HzJMIeUvprgWewhGyHeIE2gJblCexZiHKXpMfzehg2wgGnwVc
         74oyiz+bof76tzheM7sHvqOYwdzdMnxLI4xD0HBL6eUNj6YKeRt1CEOPlBOioAa6PiV1
         Gu5RLtvdOEAEwzLc5+jeN0St1ivTaMynTanZ6VV87z9RECh9EWXpY0fdFrheLdXwmHIn
         NydQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzYy7i9qI2d2Pe/Aajx0z9YnX8cGWeI9nilk6KfeXonPkCMkuTnmKjyFDIjwQwZ6CQPYMS3dsUm039Xg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywiqv7xAt0Cf2+fh1799nRgQ01NbRsoyrTM/jUQwJzm5M2cKP7R
	4YoSpB6u2ElECo4iUpvsklHttFGET0CW3L8uBWl4I5LzyjN3CdzjYZ2T4cHM8A==
X-Gm-Gg: ASbGncvKe0l4WAsEoUHrpeSOu6TUD1w0cUQ1BOqRkO5iW9LnHoC4rcWVZoM3aYTQGXh
	nWoswHUP9iK5bmvmHMOtH2MDJrO0qwcAn39xoEs77vvGqbMN1eUgm+oMqpRdblmsHBRD/ctU/kE
	RpHANLFdBbdvuKrVlYsAYJuzUtT+patT7kS7KDtEtIE3GeTlRIeBmzB86d+nBH46qz5Gl4xHPye
	XiwXTlp428RwDLFfyA7CiesCJvOJtnvEWeM3nepr2mtarG00F45tKeToPDXpbMPqsWTtMVz/JfM
	zq5qp6fPNaOwRjqB75w95rVYsxZS1Bk2AQ==
X-Google-Smtp-Source: AGHT+IF4Q8nENVfklGPnhiKtH5eyOQErysoSYV+Lhn5dkRBbuxx/QIH4nFvnyXq4lmP1dfXh+avEog==
X-Received: by 2002:a17:903:22c4:b0:216:1cfa:2bbf with SMTP id d9443c01a7336-21dd7dd87famr149812315ad.35.1738287103992;
        Thu, 30 Jan 2025 17:31:43 -0800 (PST)
Received: from [192.168.50.113] ([27.96.222.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bc97e7csm5137597a91.9.2025.01.30.17.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 17:31:43 -0800 (PST)
Message-ID: <f1218075-94a5-429a-ab35-f47d3e79e80e@tenstorrent.com>
Date: Fri, 31 Jan 2025 12:31:38 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] riscv: uaccess: use input constraints for ptr of
 __put_user
To: Jessica Clarke <jrtc27@jrtc27.com>, charlie@rivosinc.com
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>
References: <20241118230112.2872978-1-cyrilbur@tenstorrent.com>
 <20241118230112.2872978-3-cyrilbur@tenstorrent.com>
 <EA2CB85E-E210-402E-B891-2F4420E55CDB@jrtc27.com>
Content-Language: en-US
From: Cyril Bur <cyrilbur@tenstorrent.com>
In-Reply-To: <EA2CB85E-E210-402E-B891-2F4420E55CDB@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_173145_379379_C5E833BB 
X-CRM114-Status: GOOD (  20.61  )
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

CgpPbiAxOC8xLzIwMjUgOTozNCBhbSwgSmVzc2ljYSBDbGFya2Ugd3JvdGU6Cj4gT24gMTggTm92
IDIwMjQsIGF0IDIzOjAxLCBDeXJpbCBCdXIgPGN5cmlsYnVyQHRlbnN0b3JyZW50LmNvbT4gd3Jv
dGU6Cj4+Cj4+IEZyb206IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPj4KPj4g
SSBiZWxpZXZlIHRoZSBvdXRwdXQgY29uc3RyYWludHMgIj1tIiBpcyBub3QgbmVjZXNzYXJ5LCBi
ZWNhdXNlCj4+IHRoZSBpbnN0cnVjdGlvbiBpdHNlbGYgaXMgIndyaXRlIiwgd2UgZG9uJ3QgbmVl
ZCB0aGUgY29tcGlsZXIKPj4gdG8gIndyaXRlIiBmb3IgdXMuIFNvIHRlbGwgY29tcGlsZXIgd2Ug
cmVhZCBmcm9tIG1lbW9yeSBpbnN0ZWFkCj4+IG9mIHdyaXRpbmcuCj4gCj4gVGhhdOKAmXMgbm90
IHdoYXQgPW0gZG9lcy4gPW0gdGVsbHMgdGhlIGNvbXBpbGVyIOKAnHRoaXMgYXNzZW1ibHkgd2ls
bCBiZQo+IHdyaXRpbmcgdG8gdGhpcyBtZW1vcnkgbG9jYXRpb24sIGFuZCBuZWVkcyB0aGUgYWRk
cmVzcyBvZiB0aGUgbG9jYXRpb24KPiBmb3IgdGhhdCBvcGVyYW5k4oCdLiBJZiB5b3UgbW92ZSBp
dCBmcm9tIGFuIG91dHB1dCB0byBhbiBpbnB1dCB0aGVuIHlvdQo+IGdldCB0aGUgc2FtZSBhc3Nl
bWJseSBnZW5lcmF0ZWQsIGJ1dCB0aGUgY29tcGlsZXIgYmVsaWV2ZXMgeW91IGFyZQo+ICpyZWFk
aW5nKiBmcm9tIHRoYXQgbWVtb3J5LCBub3QgKndyaXRpbmcqIHRvIGl0LCBhbmQgc28gZG9lcyBu
b3QKPiBiZWxpZXZlIHRoZSBtZW1vcnkgbWF5IGJlIGNsb2JiZXJlZC4KPiAKPiBOb3csIGl0IG1h
eSB3ZWxsIGJlIHRoYXQsIGJ5IHZpcnR1ZSBvZiB0aGlzIGJlaW5nIHVzZXJzcGFjZSBtZW1vcnkg
dGhhdAo+IGlzIG9ubHkgZXZlciBhY2Nlc3NlZCB2aWEgYXNzZW1ibHksIGFuZCBhbnkgaW5saW5l
IGFzc2VtYmx5IGJlaW5nCj4gbWFya2VkIHZvbGF0aWxlLCB0aGlzIGluIGVmZmVjdCBkb2VzbuKA
mXQgbWF0dGVyLiBCdXQgaXQgaXMgc3RpbGwKPiB0ZWNobmljYWxseSB3cm9uZyB0byBtb2RlbCBp
dCB0aGF0IHdheSwgYW5kIHlvdSBjYW5ub3QgdXNlIHRoZQo+IGp1c3RpZmljYXRpb24geW91IGFy
ZSB1c2luZywgYmVjYXVzZSBpdCBpcyBmYWxzZSwgYW5kIGRlbW9uc3RyYXRlcyBhCj4gbGFjayBv
ZiB1bmRlcnN0YW5kaW5nIGZvciBob3cgaW5saW5lIGFzc2VtYmx5IHdvcmtzLiBJdCBoYXMgdG8g
YmUKPiBjb3JyZWN0bHkganVzdGlmaWVkLgo+IAo+IChJIGRvIG5vdGUgdGhhdCBuZWl0aGVyIHg4
NiBub3IgYXJtNjQgc2VlbXMgdG8gbW9kZWwgdGhpcyBhcyBhbiBvdXRwdXQpCj4gCj4gSmVzcwoK
R29vZCBwb2ludHMsIEkgYWdyZWUuIEkgYW0gaGFwcHkgdG8gcmVzcGluIHRoaXMgcGF0Y2ggbW92
ZSB0aGUgPW0gdG8gCm91dHB1dCBjb25zdHJhaW50LgoKQENoYXJsaWUgUGxlYXNlIGxldCBtZSBr
bm93IGlmIHlvdSB3b3VsZCBsaWtlIG1lIHRvIGtlZXAgeW91ciB0YWdzIG9uIAp0aGUgdHdlYWtl
ZCB2ZXJzaW9uLgoKVGhhbmtzLAoKQ3lyaWwKPiAKPj4gU2lnbmVkLW9mZi1ieTogSmlzaGVuZyBa
aGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+PiBTaWduZWQtb2ZmLWJ5OiBDeXJpbCBCdXIgPGN5
cmlsYnVyQHRlbnN0b3JyZW50LmNvbT4KPj4gLS0tCj4+IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
dWFjY2Vzcy5oIHwgMTggKysrKysrKysrLS0tLS0tLS0tCj4+IDEgZmlsZSBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdWFjY2Vzcy5o
Cj4+IGluZGV4IDA5ZDRjYTM3NTIyYy4uODRiMDg0ZTM4OGE3IDEwMDY0NAo+PiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAo+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3VhY2Nlc3MuaAo+PiBAQCAtMTg2LDExICsxODYsMTEgQEAgZG8geyBcCj4+IF9fdHlwZW9m
X18oKihwdHIpKSBfX3ggPSB4OyBcCj4+IF9fYXNtX18gX192b2xhdGlsZV9fICggXAo+PiAiMTpc
biIgXAo+PiAtICIgIiBpbnNuICIgJXoyLCAlMVxuIiBcCj4+ICsgIiAiIGluc24gIiAlejEsICUy
XG4iIFwKPj4gIjI6XG4iIFwKPj4gX0FTTV9FWFRBQkxFX1VBQ0NFU1NfRVJSKDFiLCAyYiwgJTAp
IFwKPj4gLSA6ICIrciIgKGVyciksICI9bSIgKCoocHRyKSkgXAo+PiAtIDogInJKIiAoX194KSk7
IFwKPj4gKyA6ICIrciIgKGVycikgXAo+PiArIDogInJKIiAoX194KSwgIm0iKCoocHRyKSkpOyBc
Cj4+IH0gd2hpbGUgKDApCj4+Cj4+ICNpZmRlZiBDT05GSUdfNjRCSVQKPj4gQEAgLTIwMywxNiAr
MjAzLDE2IEBAIGRvIHsgXAo+PiB1NjQgX194ID0gKF9fdHlwZW9mX18oKHgpLSh4KSkpKHgpOyBc
Cj4+IF9fYXNtX18gX192b2xhdGlsZV9fICggXAo+PiAiMTpcbiIgXAo+PiAtICIgc3cgJXozLCAl
MVxuIiBcCj4+ICsgIiBzdyAlejEsICUzXG4iIFwKPj4gIjI6XG4iIFwKPj4gLSAiIHN3ICV6NCwg
JTJcbiIgXAo+PiArICIgc3cgJXoyLCAlNFxuIiBcCj4+ICIzOlxuIiBcCj4+IF9BU01fRVhUQUJM
RV9VQUNDRVNTX0VSUigxYiwgM2IsICUwKSBcCj4+IF9BU01fRVhUQUJMRV9VQUNDRVNTX0VSUigy
YiwgM2IsICUwKSBcCj4+IC0gOiAiK3IiIChlcnIpLCBcCj4+IC0gIj1tIiAoX19wdHJbX19MU1dd
KSwgXAo+PiAtICI9bSIgKF9fcHRyW19fTVNXXSkgXAo+PiAtIDogInJKIiAoX194KSwgInJKIiAo
X194ID4+IDMyKSk7IFwKPj4gKyA6ICIrciIgKGVycikgXAo+PiArIDogInJKIiAoX194KSwgInJK
IiAoX194ID4+IDMyKSwgXAo+PiArICJtIiAoX19wdHJbX19MU1ddKSwgXAo+PiArICJtIiAoX19w
dHJbX19NU1ddKSk7IFwKPj4gfSB3aGlsZSAoMCkKPj4gI2VuZGlmIC8qIENPTkZJR182NEJJVCAq
Lwo+Pgo+PiAtLSAKPj4gMi4zNC4xCj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+PiBsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPiAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
