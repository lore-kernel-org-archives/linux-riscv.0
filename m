Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F623C28B30
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 22:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9nSUGghwmPwfO08XyKhyV73O9hO7wSAVJAZCTpatmIk=; b=TcWjst5SBlPBoX
	l/7rnM0mJBbp2xrttbNxTiNeA/3kW70jzDpYg3NL0JDvRSKgpnMcmEPHD0HirNSYT9xj1Kuy3otaQ
	aRRfGtLyoArP7sNOhq5zDuU1Uq/3k3Bf0hyExGRZTeFUnF3DFF7Hq0t39kZsb5cIkTBRDBx3EsuvP
	eBFSwG1ZcTHkSn/K4i7YWx5Cad9QarB8BkLryD04phW682V0VC2u3FjCVIbaCDClCZ10YbGaTmQtv
	2h756uEyUS+l9kZ6feuXwBFdqYnQ9JkxXyWUAC8q4zIzFZ6sL5Rg+EbiGSc4fuC+VPehNmYRUxdhx
	dMNVw6TK4hyp+4p15aDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvObP-0000000DOz0-0zG3;
	Thu, 20 Mar 2025 22:43:03 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvObL-0000000DOxc-2d7v
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 22:43:01 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-6f7031ea11cso15100217b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 15:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742510578; x=1743115378; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qn+4G/BZfte1kQZajpdgC3z6H+wA6NVBYYf22eoImB8=;
        b=qb1z64OW8mzvUrEvt6cThKtGNYblBZxle41XXhj5+84LwNeloF90r7sVmFelporCEO
         RuCt/8inEfXB2xfGmtYGw+sU1H73unVPPt+I06U81YM8smQ9n2vabtot5t7U4YoMvmS+
         y2us7br1CQXvwH3M60wBeI8bQ8RXGBRZARjLPT5+RYcNleNxhiZ2KXv2Q8k+fdwtYJV4
         VnH1s461vNOgmfSsHtFH/yXIut2HhRju2Q+sT8rXxCIPoaLtOgkW5rdDr3P6dva5VnfJ
         ngCrBBpKgxzyJOzXLr1K+JYaU5Nz8tmpbCWSzOVjgs3EiPJCJxCrW5u3FqiUOkHOubac
         u1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742510578; x=1743115378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qn+4G/BZfte1kQZajpdgC3z6H+wA6NVBYYf22eoImB8=;
        b=s3Xsgvc/VXlh4YE9hjuDQKa69cO+89DeB4BLeJ2SYJrHdVgojsc+U8QiJ0pzlrbt5x
         qG6jdaik27Y3eV9ba95NNXmVvlqKQwSZCirI3HNHYB7v+XFliJukusDLk5tdK+JRhJzW
         lmOvwBIHyfeLmAWY7DYOS8BRlT/vDC2v3AqUteU6kb0sFJjM0p/utFk9bmtn59Tm+A4/
         lo/hwEP85NE3GYk/nKhCotrCDhIYfOugV5wNh3uzzMjsg+7DwtqV3n4VNyc4cvO5IfuZ
         8tlQ1YekW6WciXuUAYk8zwKDA7tl+Fzrck40tfirqmCNFoUDgFcRQblB4sNzBlcDG05L
         xm5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXsUZR7MK6RUrTZD/yya6pizH45kw+XqA6A/8AoxgzKPJnQzbgeAe/RPfNexwYSsDDFrr8MYXivu61zxA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yww9VNOnQhAPScO5GToyRVlSaWgWJwCtUijZQVaz9v2JtFra/VO
	oznKqNcUtTcRRgKsCpOIuzmObCrKmXMhkS93BfpgBcJYpxqO/qhwgenK8wphroR2Umd++XWNAtE
	6y4EUOVQX8IKqO0PeXLuilTda58yHSe5ebhj5Fw==
X-Gm-Gg: ASbGncsbJAgXHnUSxER+n1OxQXbSFFf1z85mhGkZpdgxxvJx/FDCkcUbI0fR35HX+PK
	n8Y+XBkS7L22hck02lD8Fay0Uy7LXI+mNn+RffSDOjFvQ8Up20TgjdWwy4/PfzVDbH9em5z+Y2F
	o1NxMv/BDq6rOFZm8UDy0O59e84OI=
X-Google-Smtp-Source: AGHT+IGmYWppAb1TiIqTjy/w+R69Tu+tZXikOvPPA4dXCqNye2klzCsCnnoPJTKEOwtSTNPJ9gWuo2HlZH9leRcscHA=
X-Received: by 2002:a05:690c:64c8:b0:6f4:8207:c68d with SMTP id
 00721157ae682-700babfd564mr17209397b3.3.1742510578457; Thu, 20 Mar 2025
 15:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-22-e51202b53138@rivosinc.com> <D8LFQYX4EHF8.2AJ01XL34WK0W@ventanamicro.com>
In-Reply-To: <D8LFQYX4EHF8.2AJ01XL34WK0W@ventanamicro.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 20 Mar 2025 15:42:44 -0700
X-Gm-Features: AQ5f1Jo-nHEMu5qFdaTum9uSomYqo-G7mLCiMbL1c8nby8c7DsEke_Gukp9eNFU
Message-ID: <CAKC1njTyiaBkmHvAM8VT_MG4Cdch=H9P8r3C-m-=QQEuzyrRNA@mail.gmail.com>
Subject: Re: [PATCH v12 22/28] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com, 
	Zong Li <zong.li@sifive.com>, linux-riscv <linux-riscv-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_154259_666741_C0A66C26 
X-CRM114-Status: GOOD (  20.73  )
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

T24gVGh1LCBNYXIgMjAsIDIwMjUgYXQgMzoxMOKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21h
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IDIwMjUtMDMtMTRUMTQ6Mzk6NDEtMDc6MDAs
IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPjoKPiA+IEtlcm5lbCB3aWxsIGhhdmUg
dG8gcGVyZm9ybSBzaGFkb3cgc3RhY2sgb3BlcmF0aW9ucyBvbiB1c2VyIHNoYWRvdyBzdGFjay4K
PiA+IExpa2UgZHVyaW5nIHNpZ25hbCBkZWxpdmVyeSBhbmQgc2lncmV0dXJuLCBzaGFkb3cgc3Rh
Y2sgdG9rZW4gbXVzdCBiZQo+ID4gY3JlYXRlZCBhbmQgdmFsaWRhdGVkIHJlc3BlY3RpdmVseS4g
VGh1cyBzaGFkb3cgc3RhY2sgYWNjZXNzIGZvciBrZXJuZWwKPiA+IG11c3QgYmUgZW5hYmxlZC4K
Pgo+IFdoeSBjYW4ndCBrZXJuZWwgYWNjZXNzIHRoZSB1c2VyIHNoYWRvdyBzdGFjayB0aHJvdWdo
IGFuIGFsaWFzZWQgV1IKPiBtYXBwaW5nPwoKSXQgY2FuLCBhbHRob3VnaCB0aGF0IG9wZW5zIHVw
IGEgY2FuIG9mIHdvcm1zLiBJZiB0aGlzIGFsdGVybmF0aW5nCm1hcHBpbmcgaXMgdXNlciBtb2Rl
CnRoZW4gZW5zdXJpbmcgdGhhdCBhbm90aGVyIHRocmVhdCBpbiB1c2Vyc3BhY2UgY2FuJ3Qgd3Jp
dGUgdG8gdGhpcwphZGRyZXNzIGluIHRoaXMgd2luZG93Cm9mIHNpZ25hbCBoYW5kbGluZy4gQSBr
ZXJuZWwgYWx0ZXJuYXRlIG1hcHBpbmcgY2FuIGJlIGNyZWF0ZWQsIGJ1dAp0aGF0IGNhbiBsZWFk
IHRvIGFsbApzb3J0cyBvZiByZXF1aXJlbWVudHMgb2YgZW5zdXJpbmcgdGhlIHBhZ2UgaXMgcGlu
bmVkIGRvd24uIElJUkMsIEl0CmhhcyBiZWVuIGRlYmF0ZWQKb24geDg2IHNoYWRvdyBzdGFjayBt
ZXJnZSB0aW1lIGFzIHdlbGwgb24gaG93IGEgZmxha3kgYWxpYXMgbWFwcGluZyBhcHByb2FjaCBj
YW4KYmVjb21lIGFuZCB3ZWFrZW4gdGhlIHRocmVhdCBtb2RlbCBpdCBpcyBzdXBwb3NlZCB0byBw
cm90ZWN0IGFnYWluc3QuCgpTaW1wbHkgdXNpbmcgYHNzYW1vc3dhcGAgaXMgc2ltcGxlIGFuZCBz
ZXJ2ZXMgdGhlIHB1cnBvc2UuIEVuYWJsaW5nIHNoYWRvdyBzdGFjawphY2Nlc3MgZm9yIHRoZSBr
ZXJuZWwgZG9lc24ndCBoYXZlIGFueSBhZHZlcnNlIGVmZmVjdCBvbiB0aGUga2VybmVsLgoKPgo+
ID4gSW4gZnV0dXJlIHdoZW4ga2VybmVsIHNoYWRvdyBzdGFja3MgYXJlIGVuYWJsZWQgZm9yIGxp
bnV4IGtlcm5lbCwgaXQgbXVzdAo+ID4gYmUgZW5hYmxlZCBhcyBlYXJseSBhcyBwb3NzaWJsZSBm
b3IgYmV0dGVyIGNvdmVyYWdlIGFuZCBwcmV2ZW50IGltYmFsYW5jZQo+ID4gYmV0d2VlbiByZWd1
bGFyIHN0YWNrIGFuZCBzaGFkb3cgc3RhY2suIEFmdGVyIGByZWxvY2F0ZV9lbmFibGVfbW11YCBo
YXMKPiA+IGJlZW4gZG9uZSwgdGhpcyBpcyBhcyBlYXJseSBhcyBwb3NzaWJsZSBpdCBjYW4gZW5h
YmxlZC4KPiA+Cj4gPiBSZXZpZXdlZC1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgo+
ID4gU2lnbmVkLW9mZi1ieTogRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+Cj4gPiAt
LS0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9oZWFkLlMKPiA+IEBAIC0zMjAsNiArMzI2LDEyIEBAIFNZTV9DT0RFX1NUQVJUKF9z
dGFydF9rZXJuZWwpCj4gPiAgICAgICBsYSB0cCwgaW5pdF90YXNrCj4gPiAgICAgICBsYSBzcCwg
aW5pdF90aHJlYWRfdW5pb24gKyBUSFJFQURfU0laRQo+ID4gICAgICAgYWRkaSBzcCwgc3AsIC1Q
VF9TSVpFX09OX1NUQUNLCj4gPiArICAgICBsaSBhNywgU0JJX0VYVF9GV0ZUCj4gPiArICAgICBs
aSBhNiwgU0JJX0VYVF9GV0ZUX1NFVAo+ID4gKyAgICAgbGkgYTAsIFNCSV9GV0ZUX1NIQURPV19T
VEFDSwo+ID4gKyAgICAgbGkgYTEsIDEgLyogZW5hYmxlIHN1cGVydmlzb3IgdG8gYWNjZXNzIHNo
YWRvdyBzdGFjayBhY2Nlc3MgKi8KPiA+ICsgICAgIGxpIGEyLCBTQklfRldGVF9TRVRfRkxBR19M
T0NLCj4gPiArICAgICBlY2FsbAo+Cj4gSSB0aGluayB0aGUgZWNhbGwgY2FuIGZhaWwgZXZlbiBv
biBtYWNoaW5lcyB0aGF0IGhhdmUgWmljZmlzcywgc28gaXQKPiB3b3VsZCBiZSBnb29kIHRvIGRp
c2FibGUgdXNlciBzaGFkb3cgc3RhY2sgaWYgdGhhdCBoYXBwZW5zLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
