Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88923C48BF6
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 15:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E848OfsvEpNdCPKbH89bOhwHJQquGP/lAPEXgob4vsQ=; b=h1Y++07ZVj4LJ2
	DJrKDjqW+fNVdMWRo3incCSVYTsC+Lh2bmm1u3ECXbxQ8UG0xs7V3JCV/ZKAKI/d98YUAGa/pHfYq
	3+LIqbKVfEe9U1HmVrFr0/5KNuHFgSeoO0dPVpASku9RtpzHXDCQ89/7HsL2YFIS2xHpD1d+UX33Z
	2cEFeryOyDycsGiij6RghnkbIY3PYA0gFSWnUQYDaRG/dZMqqcC3q8XcEfGQKBbF+XGGSEyi5WVw8
	y/aY+bGZ8mxhmfTcmS5qgpMjR5QRIq/Kz4nkoiaaeROiojf8hcT1QW8r/cm3JWYhofjxfzOyB6Cu3
	FVrj4fRbICjx6ycQT7kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1recrE-00000001PqI-0JcQ;
	Mon, 26 Feb 2024 15:25:32 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1recrB-00000001Pni-0E7Z
	for linux-riscv@lists.infradead.org;
	Mon, 26 Feb 2024 15:25:31 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-41294731cf2so861735e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 26 Feb 2024 07:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708961126; x=1709565926; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OmdxWUDOxWS1QVUQvuVEam/7eao/3EwtoaN4YjxgRj8=;
        b=Rw2A08dkkBQveScUoWISOep7/NAVGaDKEOPznSeW7BZBQWLySrmyzoupkza9AFvgYV
         p0QL7tk+2tNxIjVIC0aA39bA4o8CLnil5jsxBbhMkxUp386ZziyCb5r9voTlwyuYDopA
         0i/nYdqX7RvpOSlZ+Fn9Yy63NGjB5y2qUu/0w2kQx20ktfwm6sgGXhmr1j4CNw9JSX3B
         2TbwSCFHjGlcshE8kKyvIZ4tGgH6ZQI+MLpKlrgTdJAk4qR6O8KZBtMMwR1dMqihQvOn
         a04xr7mLvrQm8WA4niRm1hHUpS/BdAFWOSxJJhXPHf4h+PWF/v+pbTzm5tRxmt/Gfgro
         ChkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708961126; x=1709565926;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OmdxWUDOxWS1QVUQvuVEam/7eao/3EwtoaN4YjxgRj8=;
        b=a3sx5+b2Zuuq6UJDd6CD8q1+oq9DtOzASGpMRr0x4g/xJqF5Zif3Umf5LbesoduvtV
         hpHZdlUArC2ncn16O5pgzxKopgFjkGxusViFby69E+18Egs3UHS05VPaWcSwvuT70yhl
         dbEMbYIk3Yut3Qq9WOBRu9GvvOuGWGRbbuXSxBUkKRUlgdKyQSwhIJNTDbXKjWy5o+Qg
         7hp/BZqVNaMbefugXW7wXI50G0hkGI0/sw0YofSYihd4Yxsg38fvBBjDzCFqKnYtLuOB
         yQXLUB5O8/7FSduWSzdPAV+1YYmWSC+SqqH0k+DRCABFcDAEqV3WohUHmdWOQglJy7/T
         PCmQ==
X-Forwarded-Encrypted: i=1; AJvYcCULtwCdtYOrxjxG1Ow8kZWJKQg0yGrTgUekAO430jVu51aT/54PgyZAMJ7wAp1QqZE8LzWZHMR8aKA6sdYBW48XVTzWYYit16r1YFSH5Ttr
X-Gm-Message-State: AOJu0Yw7vQjFwr/Sso3F/XwVvbNyELqu3ZBV0ovfKtLc5gCquAo+20H7
	l1XowMJ9QbuY0AEc2QwT4gbFjt+qRwGDxd0u0XyIEFzzqfA4YOk0wmSdC8fc835zbK0f1i4J41z
	Z
X-Google-Smtp-Source: AGHT+IEkU69h1irasa49nI1pNbDA2kcFQo4hhVQlKOlNfBMwqoujEQcijkM6sDdPgjSSEEDn4iC4tA==
X-Received: by 2002:a05:600c:5114:b0:412:5670:ef62 with SMTP id o20-20020a05600c511400b004125670ef62mr5374363wms.1.1708961125880;
        Mon, 26 Feb 2024 07:25:25 -0800 (PST)
Received: from ?IPV6:2a01:e0a:999:a3a0:83a3:2c00:c690:18b0? ([2a01:e0a:999:a3a0:83a3:2c00:c690:18b0])
        by smtp.gmail.com with ESMTPSA id be13-20020a05600c1e8d00b004129ed6f9cbsm7888226wmb.4.2024.02.26.07.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 07:25:25 -0800 (PST)
Message-ID: <ea356036-5a0b-47ea-aafb-f9813cc6ec9b@rivosinc.com>
Date: Mon, 26 Feb 2024 16:25:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: deprecate CONFIG_MMU=n
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Andrew Jones <ajones@ventanamicro.com>, Damien Le Moal <dlemoal@kernel.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Atish Patra <atishp@rivosinc.com>
References: <20240226140649.293254-1-cleger@rivosinc.com>
 <40dee2c1-ff24-40b2-a13c-6934139ba869@sifive.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <40dee2c1-ff24-40b2-a13c-6934139ba869@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_072529_165018_572CE65C 
X-CRM114-Status: GOOD (  24.62  )
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

CgpPbiAyNi8wMi8yMDI0IDE2OjE0LCBTYW11ZWwgSG9sbGFuZCB3cm90ZToKPiBPbiAyMDI0LTAy
LTI2IDg6MDYgQU0sIENsw6ltZW50IEzDqWdlciB3cm90ZToKPj4gRGVwcmVjYXRpb24gb2YgTk9N
TVUgc3VwcG9ydCBmb3IgcmlzY3Ygd2FzIGRpc2N1c3NlZCBkdXJpbmcgTFBDIDIwMjMKPj4gWzFd
LiBSZWFzb25zIGZvciB0aGlzIGludm9sdmVzIGxhY2sgb2YgdXNlcnMgYXMgd2VsbCBhcyBtYWlu
dGVuYW5jZQo+PiBlZmZvcnRzIHRvIHN1cHBvcnQgdGhpcyBtb2RlLiBwc0FCSSBGRFBJQyBzcGVj
aWZpY2F0aW9uIGFsc28gbmV2ZXIKPj4gbWFkZSBpdCB1cHN0cmVhbSBhbmQgbGFzdCBwdWJsaWMg
bWVzc2FnZXMgb2YgdGhpcyBkZXZlbG9wbWVudCBzZWVtcyB0bwo+PiBkYXRlIGJhY2sgZnJvbSAy
MDIwIFsyXS4gUGxhbiB0aGUgZGVwcmVjYXRpb24gdG8gYmUgZG9uZSBpbiAyIHllYXJzIGZyb20K
PiAKPiBXaGF0IGFyZSB0aGUgY3JpdGVyaWEgZm9yIGRlbGF5aW5nL2NhbmNlbGluZyB0aGUgcmVt
b3ZhbD8gTk9NTVUgc3VwcG9ydCBkb2Vzbid0Cj4gcm90IG5lYXJseSBhcyBmYXN0IGFzIFhJUDsg
c3RhdGljIFBJRSBFTEYgd29ya3MgYW5kIGlzIHdlbGwgc3BlY2lmaWVkOyBhbmQgYXMKPiBtZW50
aW9uZWQgYXQgTFBDLCB0aGVyZSBhcmUgc29tZSB1c2VycywgZXZlbiBpZiAianVzdCBmb3IgZnVu
Ii4KCkhpIFNhbXVlbCwKCkkgd2FzIGFjdHVhbGx5IGRldmVsb3Bpbmcgc29tZSBmZWF0dXJlIHRo
YXQgZW5jb3VudGVyZWQgTk9NTVUgYnVpbGQKZmFpbHVyZXMgYW5kIEkgd2FzIHJlbWluZGVkIHRo
YXQgTk9NTVUgd2FzIGRpc2N1c3NlZCB0byBiZSBkZXByZWNhdGVkCmR1cmluZyBsYXN0IExQQy4g
SSBndWVzcyBJIGNvdWxkIGFsc28gbWFyayBYSVAgYXMgZGVwcmVjYXRlZC4gVGhlCnJhdGlvbmFs
ZSBiZWhpbmQgZGVsYXlpbmcgaXMgdG8gbGV0IHNvbWUgdXNlcnMgdG8gbWFuaWZlc3QgdGhlbXNl
bHZlcwpiZWZvcmUgYSBmdWxsIHJlbW92YWwuIEJ1dCB0aGlzIGNhbiBzdGlsbCBiZSBkaXNjdXNz
ZWQgb2YgY291cnNlLCB0aGlzCnBhdGNoIHdhcyBhbHNvIG1lYW50IHRvIHRyaWdnZXIgc3VjaCBm
ZWVkYmFjay4KCj4gCj4+IG5vdy4gTWFyayB0aGUgS2NvbmZpZyBvcHRpb24gYXMgZGVwcmVjYXRl
ZCBieSBhZGRpbmcgYSBuZXcgZHVtbXkgb3B0aW9uCj4+IHdoaWNoIGV4cGxpY2l0bHkgZGlzcGxh
eXMgdGhlIGRlcHJlY2F0aW9uIGluIGNhc2Ugb2YgQ09ORklHX01NVT1uLiBUaGlzIG9wdGlvbgo+
PiBpcyBzZWxlY3RlZCBpbmRpcmVjdGx5IGJ5IENPTkZJR19SSVNDVl9NX01PREUgc2luY2UgYW4g
b3B0aW9uIGNhbiBub3QKPj4gc2VsZWN0IGFub3RoZXIgb25lIGRpcmVjdGx5IHdpdGggYSAic2Vs
ZWN0IiBpbiBjYXNlIG9mIHN1Y2ggQ09ORklHPW4uCj4+IEFkZGl0aW9uYWxseSwgZGlzcGxheSBh
IHByX2VycigpIG1lc3NhZ2UgYXQgYm9vdCB0aW1lIGluIGNhc2Ugb2YgTk9NTVUKPj4gYnVpbGQg
dG8gd2FybiBhYm91dCB1cGNvbWluZyBkZXByZWNhdGlvbi4KPj4KPj4gTGluazogaHR0cHM6Ly9s
cGMuZXZlbnRzL2V2ZW50LzE3L2NvbnRyaWJ1dGlvbnMvMTQ3OC8gWzFdCj4+IExpbms6IGh0dHBz
Oi8vZ3JvdXBzLmdvb2dsZS5jb20vYS9ncm91cHMucmlzY3Yub3JnL2cvc3ctZGV2L2MvWmpZVUpz
d2tuUTQvbS9XWVJSeWxUd0FBQUogWzJdCj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdl
ciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPj4KPj4gLS0tCj4+ICBhcmNoL3Jpc2N2L0tjb25maWcg
ICAgICAgIHwgOCArKysrKysrKwo+PiAgYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyB8IDQgKysr
Kwo+PiAgMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPj4gaW5kZXggYmZmYmQ4
NjlhMDY4Li44ZGE1OGMxMDJkM2YgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+
PiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPj4gQEAgLTIyMSw2ICsyMjEsNyBAQCBjb25maWcg
QVJDSF9NTUFQX1JORF9DT01QQVRfQklUU19NQVgKPj4gICMgc2V0IGlmIHdlIHJ1biBpbiBtYWNo
aW5lIG1vZGUsIGNsZWFyZWQgaWYgd2UgcnVuIGluIHN1cGVydmlzb3IgbW9kZQo+PiAgY29uZmln
IFJJU0NWX01fTU9ERQo+PiAgCWJvb2wKPj4gKwlzZWxlY3QgTk9NTVUKPj4gIAlkZWZhdWx0ICFN
TVUKPj4gIAo+PiAgIyBzZXQgaWYgd2UgYXJlIHJ1bm5pbmcgaW4gUy1tb2RlIGFuZCBjYW4gdXNl
IFNCSSBjYWxscwo+PiBAQCAtMjM2LDYgKzIzNywxMyBAQCBjb25maWcgTU1VCj4+ICAJICBTZWxl
Y3QgaWYgeW91IHdhbnQgTU1VLWJhc2VkIHZpcnR1YWxpc2VkIGFkZHJlc3Npbmcgc3BhY2UKPj4g
IAkgIHN1cHBvcnQgYnkgcGFnZWQgbWVtb3J5IG1hbmFnZW1lbnQuIElmIHVuc3VyZSwgc2F5ICdZ
Jy4KPj4gIAo+PiArY29uZmlnIE5PTU1VCj4+ICsJZGVwZW5kcyBvbiAhTU1VCj4+ICsJYm9vbCAi
Tk9NTVUga2VybmVsIChERVBSRUNBVEVEKSIKPj4gKwloZWxwCj4+ICsJICBOT01NVSBrZXJuZWwg
aXMgZGVwcmVjYXRlZCBhbmQgaXMgc2NoZWR1bGVkIGZvciByZW1vdmFsIGJ5Cj4+ICsJICB0aGUg
YmVnaW5uaW5nIG9mIDIwMjcuCj4+ICsKPiAKPiBUaGUgaWRpb21hdGljIHdheSB0byBkaXNwbGF5
IHRoaXMga2luZCBvZiB3YXJuaW5nIGlzIGEgY29tbWVudCBkaXJlY3RpdmU6Cj4gCj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+IGluZGV4IGQ0
ZTg5MGZiNWI1YS4uYjczNjQ0MGNlMGY3IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZp
Zwo+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+IEBAIC0yNDgsNiArMjQ4LDkgQEAgY29uZmln
IE1NVQo+ICAgICAgICAgICBTZWxlY3QgaWYgeW91IHdhbnQgTU1VLWJhc2VkIHZpcnR1YWxpc2Vk
IGFkZHJlc3Npbmcgc3BhY2UKPiAgICAgICAgICAgc3VwcG9ydCBieSBwYWdlZCBtZW1vcnkgbWFu
YWdlbWVudC4gSWYgdW5zdXJlLCBzYXkgJ1knLgo+IAo+ICtjb21tZW50ICJOT01NVSBzdXBwb3J0
IGlzIGRlcHJlY2F0ZWQgKHNjaGVkdWxlZCBmb3IgcmVtb3ZhbCBpbiAyMDI3KSIKPiArICAgICAg
IGRlcGVuZHMgb24gIU1NVQo+ICsKClRoYW5rcywgSSB3YXMgbm90IGFibGUgdG8gZmluZCBhbnkg
ZXhhbXBsZSBvZiBzdWNoIHVzYWdlLgoKQ2zDqW1lbnQKCj4gIGNvbmZpZyBQQUdFX09GRlNFVAo+
ICAgICAgICAgaGV4Cj4gICAgICAgICBkZWZhdWx0IDB4QzAwMDAwMDAgaWYgMzJCSVQgJiYgTU1V
Cj4gCj4gUmVnYXJkcywKPiBTYW11ZWwKPiAKPj4gIGNvbmZpZyBQQUdFX09GRlNFVAo+PiAgCWhl
eAo+PiAgCWRlZmF1bHQgMHhDMDAwMDAwMCBpZiAzMkJJVCAmJiBNTVUKPj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4+
IGluZGV4IDRmNzNjMGFlNDRiMi4uODc5OTgxNmVmMGE2IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC9zZXR1cC5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPj4g
QEAgLTI5NSw2ICsyOTUsMTAgQEAgdm9pZCBfX2luaXQgc2V0dXBfYXJjaChjaGFyICoqY21kbGlu
ZV9wKQo+PiAgCXJpc2N2X3NldF9kbWFfY2FjaGVfYWxpZ25tZW50KCk7Cj4+ICAKPj4gIAlyaXNj
dl91c2VyX2lzYV9lbmFibGUoKTsKPj4gKwo+PiArI2lmICFkZWZpbmVkKENPTkZJR19NTVUpCj4+
ICsJcHJfZXJyKCJSSVNDLVYgTk9NTVUgc3VwcG9ydCBpcyBkZXByZWNhdGVkIGFuZCBzY2hlZHVs
ZWQgZm9yIHJlbW92YWwgYnkgdGhlIGJlZ2lubmluZyBvZiAyMDI3XG4iKTsKPj4gKyNlbmRpZgo+
PiAgfQo+PiAgCj4+ICBib29sIGFyY2hfY3B1X2lzX2hvdHBsdWdnYWJsZShpbnQgY3B1KQo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
