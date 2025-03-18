Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E4DC282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 16:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OyWV1JiyMjuD5XlD3g0BMnJw60oYtU3aDUe6wQWfS28=; b=sESEllW7+Fnfqo
	JKVbfTr7yaCF190qeuTyRhmKBG26pi6Sa2ZCy0vscLGblmL9yad0ebapHAe8aPumfCt1xcU86EhYO
	Et0p8Z/gEOwvseXEmGOLOiR3WkyKq2O4ZTvgz7QMcWXAafc/ij0pOS6l8p/CqJ3Hk5odfsSA4N49j
	y7BA6Fs37F8R/NctNgW/i7FpJIqZkX/ZxhY4w66czHoV1jxmSKsCEmrLEqlUtNkt9AMPQqSMIDwJu
	r4kxVe11IwYy3pHv8HI4+eO/MoVo7tppHOmguLf4FL4Vnq0zMlKKauZc7PNEiUtuDOAjNK0a3DxLu
	FM+F6nww+888RgTet/ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuaBw-00000006b5E-168V;
	Tue, 18 Mar 2025 16:53:24 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZye-00000006ZCC-1QMy;
	Tue, 18 Mar 2025 16:39:41 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-22401f4d35aso112181045ad.2;
        Tue, 18 Mar 2025 09:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742315979; x=1742920779; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0OMo6kY73E1DUQ5n4WQl1+v1FiQJTXExWUjOORF3Lm0=;
        b=Erql30UcMAUUx1lVbUCJapUVlUqoTc34JhEymOXjE8RHv2/9m+NVjeVRcku/WSAPDb
         /gcTZALI8E7RZzXaCduFFPZWBqQOgV9B/Ko1UD5wKw4kv+/v4eNhwR9tJj0pBVFHRAz+
         4YO/HOcr94ok64bsi5plgBgy3IGlIkzlHf5nq593gjJOnScam/mRYQCJrxaH0GT3SHj0
         3vqDe4oTVfEZUKdusPC9SqYxaaQfgEXicM7lRgxx/NHJrAWjL0Dti8ClsEVfXAWDV5SM
         ZxpKDwGM5kSE/B7xWYyUT5kt8JB7L9NUM+7OYy9uj6p94aM+drwdFdaPuV2GbJiPeVXC
         ezyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742315979; x=1742920779;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OMo6kY73E1DUQ5n4WQl1+v1FiQJTXExWUjOORF3Lm0=;
        b=SoMv8AF4FVPpTMgyOZeGnAMLK6sYRHBGxO0Cthx9s71NmMAk8e6kZKN0RaULqz5ODF
         35XSvV1kXvf0P3nvtGfYm68tG2FUbKwHYHTxOtsyDQmtnkDngTI10gAkQAWhVXkFjjlN
         0DLWisGcq905vnuZFZW+HQfatZt/VuSO6Xuyv7MRlnRaY+/kI8btXIorjteLtqh6xBOM
         9LuFUzC9xsE8xPCleotltcyAtFbJaDxEHec27mCW7joMLlbsw6h7i1ITJHJRXEy1v6Y9
         N2Rh3DoY3ICIcl5om1eCS994F0fAs7cOhEIkvE9VRwQEJ2NhKETKoCj1yURb0wcOpYJ5
         94gw==
X-Forwarded-Encrypted: i=1; AJvYcCVMwAHvKtprm2rpor7MfvDZ28hansVAWgXGxCCIOs097QkOVXwINARRSbKbQqJRUlOBg/sLuw/Svjtg8VA=@lists.infradead.org, AJvYcCWGoeWQzhhTVX1k9tnNKm38vAmHwWw5kJE9RNKIyb/5y47jgLONE2LQ741rHV0kroMyMO2NiUp9xd2iH86z9AIl@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq5WXn7aPajxPiI6D3i3Wk02LJKQUUFTYRkr02b3rTHiduKa3L
	AeuOGM9Q31nAllGtwB597mwGR4jhRCHSiij8ZApUCdrmrXNuzVsb
X-Gm-Gg: ASbGncsrUajl+7z4pOQmITxbixroQxPSLOnOcigoAeNzvpWPc5W/Fq/XpZPFO3W+tBp
	fREh2Kx1smN4yqEKDlczo2hIUrcurkv5phFWXY+WCm5oHcri+QQVR0q3xqFzVMfi3F5+5B7eUZz
	8AdfivGLpW0n7yMiUYuz3Fbbma4lX5AIRJhNGYrGSMKgyEq6YXEWNjzCEJdpOsTEiiYYBGD792C
	AlLmCor+1eVkkO4KaEsN0+0EeHKqAhHyGnIplFBEK2UqbGq1LCjj3qTzkyQGZIvORuD2vy+DHkV
	Z4DldYZHDo+uXNECixA+c7ni5bvr0YqWteGEkCyZgS0M5cATDDoTBIbcBeo+wowOpeR1r7orNW+
	ECdFJSF1zTbOfKu4dzg==
X-Google-Smtp-Source: AGHT+IGE5m6c7zPdMBD4x7LWCETtpVBn2q4Mh4LJo0JYKNyDmFsLhMqkHIw+PJnwPR3g3D5sK0aeCQ==
X-Received: by 2002:a17:902:ea0c:b0:223:3bf6:7e6a with SMTP id d9443c01a7336-2262c5383e0mr62696385ad.12.1742315979380;
        Tue, 18 Mar 2025 09:39:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68aa906sm97145285ad.88.2025.03.18.09.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 09:39:38 -0700 (PDT)
Message-ID: <17a383b4-2add-4e74-b7ca-d7ef2baac4f9@roeck-us.net>
Date: Tue, 18 Mar 2025 09:39:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/14] arm64: Add support for suppressing warning
 backtraces
To: Will Deacon <will@kernel.org>, Alessandro Carminati <acarmina@redhat.com>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard
 <mripard@kernel.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 loongarch@lists.linux.dev, x86@kernel.org,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-8-acarmina@redhat.com>
 <20250313122503.GA7438@willie-the-truck>
 <CAGegRW5r3V2-_44-X353vS-GZwDYG=SVwc6MzSGE8GdFQuFoKA@mail.gmail.com>
 <20250318155946.GC13829@willie-the-truck>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250318155946.GC13829@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_093940_378646_0800B6F0 
X-CRM114-Status: GOOD (  19.94  )
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

T24gMy8xOC8yNSAwODo1OSwgV2lsbCBEZWFjb24gd3JvdGU6Cj4gT24gVGh1LCBNYXIgMTMsIDIw
MjUgYXQgMDU6NDA6NTlQTSArMDEwMCwgQWxlc3NhbmRybyBDYXJtaW5hdGkgd3JvdGU6Cj4+IE9u
IFRodSwgTWFyIDEzLCAyMDI1IGF0IDE6MjXigK9QTSBXaWxsIERlYWNvbiA8d2lsbEBrZXJuZWwu
b3JnPiB3cm90ZToKPj4+Cj4+PiBPbiBUaHUsIE1hciAxMywgMjAyNSBhdCAxMTo0MzoyMkFNICsw
MDAwLCBBbGVzc2FuZHJvIENhcm1pbmF0aSB3cm90ZToKPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9h
cm02NC9pbmNsdWRlL2FzbS9idWcuaCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vYnVnLmgKPj4+
PiBpbmRleCAyOGJlMDQ4ZGIzZjYuLjA0NGM1ZTI0YTE3ZCAxMDA2NDQKPj4+PiAtLS0gYS9hcmNo
L2FybTY0L2luY2x1ZGUvYXNtL2J1Zy5oCj4+Pj4gKysrIGIvYXJjaC9hcm02NC9pbmNsdWRlL2Fz
bS9idWcuaAo+Pj4+IEBAIC0xMSw4ICsxMSwxNCBAQAo+Pj4+Cj4+Pj4gICAjaW5jbHVkZSA8YXNt
L2FzbS1idWcuaD4KPj4+Pgo+Pj4+ICsjaWZkZWYgSEFWRV9CVUdfRlVOQ1RJT04KPj4+PiArIyBk
ZWZpbmUgX19CVUdfRlVOQyAgX19mdW5jX18KPj4+PiArI2Vsc2UKPj4+PiArIyBkZWZpbmUgX19C
VUdfRlVOQyAgTlVMTAo+Pj4+ICsjZW5kaWYKPj4+PiArCj4+Pj4gICAjZGVmaW5lIF9fQlVHX0ZM
QUdTKGZsYWdzKSAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4+PiAtICAgICBhc20gdm9s
YXRpbGUgKF9fc3RyaW5naWZ5KEFTTV9CVUdfRkxBR1MoZmxhZ3MpKSk7Cj4+Pj4gKyAgICAgYXNt
IHZvbGF0aWxlIChfX3N0cmluZ2lmeShBU01fQlVHX0ZMQUdTKGZsYWdzLCAlYzApKSA6IDogImki
IChfX0JVR19GVU5DKSk7Cj4+Pgo+Pj4gV2h5IGlzICdpJyB0aGUgcmlnaHQgYXNtIGNvbnN0cmFp
bnQgdG8gdXNlIGhlcmU/IEl0IHNlZW1zIGEgYml0IG9kZCB0bwo+Pj4gdXNlIHRoYXQgZm9yIGEg
cG9pbnRlci4KPj4KPj4gSSByZWNlaXZlZCB0aGlzIGNvZGUgYXMgbGVnYWN5IGZyb20gYSBwcmV2
aW91cyB2ZXJzaW9uLgo+PiBJbiBteSByZXZpZXcsIEkgY29uc2lkZXJlZCB0aGUgY2FzZSB3aGVu
IEhBVkVfQlVHX0ZVTkNUSU9OIGlzIGRlZmluZWQ6Cj4+IEhlcmUsIF9fQlVHX0ZVTkMgaXMgZGVm
aW5lZCBhcyBfX2Z1bmNfXywgd2hpY2ggaXMgdGhlIG5hbWUgb2YgdGhlCj4+IGN1cnJlbnQgZnVu
Y3Rpb24gYXMgYSBzdHJpbmcgbGl0ZXJhbC4KPj4gVXNpbmcgdGhlIGNvbnN0cmFpbnQgImkiIHNl
ZW1zIGFwcHJvcHJpYXRlIHRvIG1lIGluIHRoaXMgY2FzZS4KPj4KPj4gSG93ZXZlciwgd2hlbiBI
QVZFX0JVR19GVU5DVElPTiBpcyBub3QgZGVmaW5lZDoKPj4gX19CVUdfRlVOQyBpcyBkZWZpbmVk
IGFzIE5VTEwuIEluaXRpYWxseSwgSSBjb25zaWRlcmVkIGl0IGxpdGVyYWwgMCwKPj4gYnV0IGFm
dGVyIGludmVzdGlnYXRpbmcgeW91ciBjb25jZXJuLCBJIGZvdW5kOgo+Pgo+PiBgYGAKPj4gJCBl
Y2hvIC1FICIjaW5jbHVkZSA8c3RkaW8uaD5cbiNpbmNsdWRlIDxzdGRkZWYuaD5cbmludCBtYWlu
KCkKPj4ge1xucmV0dXJuIDA7XG59IiB8IGFhcmNoNjQtbGludXgtZ251LWdjYyAtRSAtZE0gLSB8
IGdyZXAgTlVMTAo+PiAjZGVmaW5lIE5VTEwgKCh2b2lkICopMCkKPj4gYGBgCj4+Cj4+IEkgcmVh
bGl6ZWQgdGhhdCBOVUxMIGlzIGFjdHVhbGx5IGEgcG9pbnRlciB0aGF0IGlzIG5vdCBhIGxpbmsg
dGltZQo+PiBzeW1ib2wsIGFuZCB1c2luZyB0aGUgImkiIGNvbnN0cmFpbnQgd2l0aCBOVUxMIG1h
eSByZXN1bHQgaW4gdW5kZWZpbmVkCj4+IGJlaGF2aW9yLgo+Pgo+PiBXb3VsZCB0aGUgZm9sbG93
aW5nIGFsdGVybmF0aXZlIGRlZmluaXRpb24gZm9yIF9fQlVHX0ZVTkMgYmUgbW9yZSBjb252aW5j
aW5nPwo+Pgo+PiBgYGAKPj4gI2lmZGVmIEhBVkVfQlVHX0ZVTkNUSU9OCj4+ICAgICAgI2RlZmlu
ZSBfX0JVR19GVU5DIF9fZnVuY19fCj4+ICNlbHNlCj4+ICAgICAgI2RlZmluZSBfX0JVR19GVU5D
ICh1aW50cHRyX3QpMAo+PiAjZW5kaWYKPj4gYGBgCj4+IExldCBtZSBrbm93IHlvdXIgdGhvdWdo
dHMuCj4gCj4gVGhhbmtzIGZvciB0aGUgYW5hbHlzaXM7IEkgaGFkbid0IG5vdGljZWQgdGhpcyBz
cGVjaWZpYyBpc3N1ZSwgaXQganVzdAo+IHNtZWxsZWQgYSBiaXQgZmlzaHkuIEFueXdheSwgdGhl
IGRpZmYgYWJvdmUgbG9va3MgYmV0dGVyLCB0aGFua3MuCj4gCgpJdCBoYXMgYmVlbiBhIGxvbmcg
dGltZSwgYnV0IEkgc2VlbSB0byByZWNhbGwgdGhhdCBJIHJhbiBpbnRvIHRyb3VibGUgd2hlbgp0
cnlpbmcgdG8gdXNlIGEgZGlmZmVyZW50IGNvbnN0cmFpbnQuCgpHdWVudGVyCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
