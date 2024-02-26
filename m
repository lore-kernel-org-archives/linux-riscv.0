Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FDBC48BF6
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 15:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8oC6l8FeLaLQbh8r3dmjtps0aC2I9gYh9Fqs1/vOeiA=; b=2K4jl+zGxJs0sm
	3V1Kt9ksuIc3oFiBvGN5AKBwZbXt0Zk/unUVX/2gNL8KRzixcG0WqpbE4lBpa+SjoaHfhq1tSp8A6
	kccs6t5Ao89m6HacidLmwGpimmxURigLCjpElbeVqNmWwPFv/eF50vEy/RqcxS2IdpkuXbkWhnsqn
	5jK5YvayyFiQniDaOxV2Hwc+FxGYn9SvMlVhkUy7Q1TOWKYXJnl/fyAvIoS3y3yeNXWPg8DJHaeGq
	wi6RpV1+XwPbOINKyChZqXQpqDww1cP/wSUg+cX3+Dlezlkb4D6zKIsGQT1fgsL1KIgCgSeIUJe2t
	3Y43zhpbRy6eDBmsquzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1recgn-00000001MSH-28tp;
	Mon, 26 Feb 2024 15:14:45 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1recgk-00000001MRG-2jLS
	for linux-riscv@lists.infradead.org;
	Mon, 26 Feb 2024 15:14:44 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-7c745af8f1cso160402239f.1
        for <linux-riscv@lists.infradead.org>; Mon, 26 Feb 2024 07:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1708960481; x=1709565281; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DnhDNqZldvfwo++1kr0TTTkp3od5W/IiFTP/MKj7Qek=;
        b=W8g3sdlQrm4xuOS9oOGTeFJSJEaRcXUOSGI37clW0rYrRQ7Mh2Qu/BfoATfKoTXbVB
         34ZRFglHcehG/UvRnXdL++ObwxQF8FL6xi8PfzMgn07roHSHVCu4Si2NFPEIFEtLt5uj
         CTxudE4gqPzv9o1POUSEdeAQHKBtUm1rmXKV1J9pr28LrNeDt4NKONwZ0uN5QRq17cRS
         yRz6VpyKc8xs+5gTCh9dANwTO2mzGTh97Unazf479EiDxB8JItAGEyAoKJDtGUBCdYps
         QRtU9w6WLGfN+ymxfaMhdnMPBhzGHMuqXtnfi+V5MbEOl6FiXG0+1c4glkSLQoDKpY16
         +UjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708960481; x=1709565281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DnhDNqZldvfwo++1kr0TTTkp3od5W/IiFTP/MKj7Qek=;
        b=I+fabfMR6rEfGHhYgMQwSMpnyVobLS2DZAElcyPExBT+Xq+1396X29tNqliknZAzKF
         ec4BPLyl6VlQolMzMhojIUlgn42IE3cAvIRm8B7623tuA0+mBLDGziIJzoS5epMPAPXn
         I1rMVDLk30WuAv+eU37RpLBxpb6Jze9jeIi2lwSBJLKmiGTTSSKvgF+1wnZG83rxR8xG
         ZoUd9kr36WEPY1CQKxhkzYyJBiM7wLLNeDQ8aFp49COuTx4ss+a7QtG1NkBmKUHCXV4n
         qlx9Qj+CN7+lI+VstfUewtU4PZAdvM3uI+mIKD3m0qfpuWRZsbYJa3e5EExt7tQgy0SF
         xwZA==
X-Forwarded-Encrypted: i=1; AJvYcCWplKhe7L2IZ1+iXUFDN2+oDrl0NgvWuX/20TFF/ot1cRTNleZdez2F2AUjrdY8ywtGE5808HW7V/+azZIIOv7SWaD0roGXRGWdIRhH9WUF
X-Gm-Message-State: AOJu0Yzxpc5Wz3aMRm7wVj2Afo6lHxBIT8gGajZvjaeb0BTJgOsSdCeZ
	/+zXBmdv1kIGNr83pHRFeQvdKH7lX4wKNd80K1gMt+3m+Ywl76ycSxq2VzWRz0s=
X-Google-Smtp-Source: AGHT+IHEaD4rR2rDzvAfb0spGPXwvQzyNLv0eR1h0rsYQclBtWakcm2H92kl96HePewGk7gyX70KWA==
X-Received: by 2002:a6b:4e12:0:b0:7c7:dca3:7e27 with SMTP id c18-20020a6b4e12000000b007c7dca37e27mr871256iob.17.1708960480771;
        Mon, 26 Feb 2024 07:14:40 -0800 (PST)
Received: from [100.64.0.1] ([170.85.6.200])
        by smtp.gmail.com with ESMTPSA id d22-20020a5d9516000000b007c7b076f07asm1112155iom.15.2024.02.26.07.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 07:14:40 -0800 (PST)
Message-ID: <40dee2c1-ff24-40b2-a13c-6934139ba869@sifive.com>
Date: Mon, 26 Feb 2024 09:14:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: deprecate CONFIG_MMU=n
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Andrew Jones <ajones@ventanamicro.com>, Damien Le Moal <dlemoal@kernel.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Atish Patra <atishp@rivosinc.com>
References: <20240226140649.293254-1-cleger@rivosinc.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240226140649.293254-1-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_071442_782063_E08C3E5B 
X-CRM114-Status: GOOD (  21.26  )
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

T24gMjAyNC0wMi0yNiA4OjA2IEFNLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4gRGVwcmVjYXRp
b24gb2YgTk9NTVUgc3VwcG9ydCBmb3IgcmlzY3Ygd2FzIGRpc2N1c3NlZCBkdXJpbmcgTFBDIDIw
MjMKPiBbMV0uIFJlYXNvbnMgZm9yIHRoaXMgaW52b2x2ZXMgbGFjayBvZiB1c2VycyBhcyB3ZWxs
IGFzIG1haW50ZW5hbmNlCj4gZWZmb3J0cyB0byBzdXBwb3J0IHRoaXMgbW9kZS4gcHNBQkkgRkRQ
SUMgc3BlY2lmaWNhdGlvbiBhbHNvIG5ldmVyCj4gbWFkZSBpdCB1cHN0cmVhbSBhbmQgbGFzdCBw
dWJsaWMgbWVzc2FnZXMgb2YgdGhpcyBkZXZlbG9wbWVudCBzZWVtcyB0bwo+IGRhdGUgYmFjayBm
cm9tIDIwMjAgWzJdLiBQbGFuIHRoZSBkZXByZWNhdGlvbiB0byBiZSBkb25lIGluIDIgeWVhcnMg
ZnJvbQoKV2hhdCBhcmUgdGhlIGNyaXRlcmlhIGZvciBkZWxheWluZy9jYW5jZWxpbmcgdGhlIHJl
bW92YWw/IE5PTU1VIHN1cHBvcnQgZG9lc24ndApyb3QgbmVhcmx5IGFzIGZhc3QgYXMgWElQOyBz
dGF0aWMgUElFIEVMRiB3b3JrcyBhbmQgaXMgd2VsbCBzcGVjaWZpZWQ7IGFuZCBhcwptZW50aW9u
ZWQgYXQgTFBDLCB0aGVyZSBhcmUgc29tZSB1c2VycywgZXZlbiBpZiAianVzdCBmb3IgZnVuIi4K
Cj4gbm93LiBNYXJrIHRoZSBLY29uZmlnIG9wdGlvbiBhcyBkZXByZWNhdGVkIGJ5IGFkZGluZyBh
IG5ldyBkdW1teSBvcHRpb24KPiB3aGljaCBleHBsaWNpdGx5IGRpc3BsYXlzIHRoZSBkZXByZWNh
dGlvbiBpbiBjYXNlIG9mIENPTkZJR19NTVU9bi4gVGhpcyBvcHRpb24KPiBpcyBzZWxlY3RlZCBp
bmRpcmVjdGx5IGJ5IENPTkZJR19SSVNDVl9NX01PREUgc2luY2UgYW4gb3B0aW9uIGNhbiBub3QK
PiBzZWxlY3QgYW5vdGhlciBvbmUgZGlyZWN0bHkgd2l0aCBhICJzZWxlY3QiIGluIGNhc2Ugb2Yg
c3VjaCBDT05GSUc9bi4KPiBBZGRpdGlvbmFsbHksIGRpc3BsYXkgYSBwcl9lcnIoKSBtZXNzYWdl
IGF0IGJvb3QgdGltZSBpbiBjYXNlIG9mIE5PTU1VCj4gYnVpbGQgdG8gd2FybiBhYm91dCB1cGNv
bWluZyBkZXByZWNhdGlvbi4KPiAKPiBMaW5rOiBodHRwczovL2xwYy5ldmVudHMvZXZlbnQvMTcv
Y29udHJpYnV0aW9ucy8xNDc4LyBbMV0KPiBMaW5rOiBodHRwczovL2dyb3Vwcy5nb29nbGUuY29t
L2EvZ3JvdXBzLnJpc2N2Lm9yZy9nL3N3LWRldi9jL1pqWVVKc3drblE0L20vV1lSUnlsVHdBQUFK
IFsyXQo+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNv
bT4KPiAKPiAtLS0KPiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICB8IDggKysrKysrKysKPiAg
YXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyB8IDQgKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDEy
IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJj
aC9yaXNjdi9LY29uZmlnCj4gaW5kZXggYmZmYmQ4NjlhMDY4Li44ZGE1OGMxMDJkM2YgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4g
QEAgLTIyMSw2ICsyMjEsNyBAQCBjb25maWcgQVJDSF9NTUFQX1JORF9DT01QQVRfQklUU19NQVgK
PiAgIyBzZXQgaWYgd2UgcnVuIGluIG1hY2hpbmUgbW9kZSwgY2xlYXJlZCBpZiB3ZSBydW4gaW4g
c3VwZXJ2aXNvciBtb2RlCj4gIGNvbmZpZyBSSVNDVl9NX01PREUKPiAgCWJvb2wKPiArCXNlbGVj
dCBOT01NVQo+ICAJZGVmYXVsdCAhTU1VCj4gIAo+ICAjIHNldCBpZiB3ZSBhcmUgcnVubmluZyBp
biBTLW1vZGUgYW5kIGNhbiB1c2UgU0JJIGNhbGxzCj4gQEAgLTIzNiw2ICsyMzcsMTMgQEAgY29u
ZmlnIE1NVQo+ICAJICBTZWxlY3QgaWYgeW91IHdhbnQgTU1VLWJhc2VkIHZpcnR1YWxpc2VkIGFk
ZHJlc3Npbmcgc3BhY2UKPiAgCSAgc3VwcG9ydCBieSBwYWdlZCBtZW1vcnkgbWFuYWdlbWVudC4g
SWYgdW5zdXJlLCBzYXkgJ1knLgo+ICAKPiArY29uZmlnIE5PTU1VCj4gKwlkZXBlbmRzIG9uICFN
TVUKPiArCWJvb2wgIk5PTU1VIGtlcm5lbCAoREVQUkVDQVRFRCkiCj4gKwloZWxwCj4gKwkgIE5P
TU1VIGtlcm5lbCBpcyBkZXByZWNhdGVkIGFuZCBpcyBzY2hlZHVsZWQgZm9yIHJlbW92YWwgYnkK
PiArCSAgdGhlIGJlZ2lubmluZyBvZiAyMDI3Lgo+ICsKClRoZSBpZGlvbWF0aWMgd2F5IHRvIGRp
c3BsYXkgdGhpcyBraW5kIG9mIHdhcm5pbmcgaXMgYSBjb21tZW50IGRpcmVjdGl2ZToKCmRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKaW5kZXggZDRl
ODkwZmI1YjVhLi5iNzM2NDQwY2UwZjcgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwor
KysgYi9hcmNoL3Jpc2N2L0tjb25maWcKQEAgLTI0OCw2ICsyNDgsOSBAQCBjb25maWcgTU1VCiAg
ICAgICAgICBTZWxlY3QgaWYgeW91IHdhbnQgTU1VLWJhc2VkIHZpcnR1YWxpc2VkIGFkZHJlc3Np
bmcgc3BhY2UKICAgICAgICAgIHN1cHBvcnQgYnkgcGFnZWQgbWVtb3J5IG1hbmFnZW1lbnQuIElm
IHVuc3VyZSwgc2F5ICdZJy4KCitjb21tZW50ICJOT01NVSBzdXBwb3J0IGlzIGRlcHJlY2F0ZWQg
KHNjaGVkdWxlZCBmb3IgcmVtb3ZhbCBpbiAyMDI3KSIKKyAgICAgICBkZXBlbmRzIG9uICFNTVUK
KwogY29uZmlnIFBBR0VfT0ZGU0VUCiAgICAgICAgaGV4CiAgICAgICAgZGVmYXVsdCAweEMwMDAw
MDAwIGlmIDMyQklUICYmIE1NVQoKUmVnYXJkcywKU2FtdWVsCgo+ICBjb25maWcgUEFHRV9PRkZT
RVQKPiAgCWhleAo+ICAJZGVmYXVsdCAweEMwMDAwMDAwIGlmIDMyQklUICYmIE1NVQo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0
dXAuYwo+IGluZGV4IDRmNzNjMGFlNDRiMi4uODc5OTgxNmVmMGE2IDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5j
Cj4gQEAgLTI5NSw2ICsyOTUsMTAgQEAgdm9pZCBfX2luaXQgc2V0dXBfYXJjaChjaGFyICoqY21k
bGluZV9wKQo+ICAJcmlzY3Zfc2V0X2RtYV9jYWNoZV9hbGlnbm1lbnQoKTsKPiAgCj4gIAlyaXNj
dl91c2VyX2lzYV9lbmFibGUoKTsKPiArCj4gKyNpZiAhZGVmaW5lZChDT05GSUdfTU1VKQo+ICsJ
cHJfZXJyKCJSSVNDLVYgTk9NTVUgc3VwcG9ydCBpcyBkZXByZWNhdGVkIGFuZCBzY2hlZHVsZWQg
Zm9yIHJlbW92YWwgYnkgdGhlIGJlZ2lubmluZyBvZiAyMDI3XG4iKTsKPiArI2VuZGlmCj4gIH0K
PiAgCj4gIGJvb2wgYXJjaF9jcHVfaXNfaG90cGx1Z2dhYmxlKGludCBjcHUpCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
