Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD289C5475B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2024 04:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s/RJy0FiqvMFShwo8G33U1GMfL87rMv6Dm4zB9PV+lA=; b=Fu1xGlNQ1yXcW9
	nbo4my/8ZYaVT4G0tSk9GuBMer53jUlSKBuN8saJCqE2vlCyUEv5VHmLq4rzcbqb0BB3b92m5SRNS
	uNcW7ng5yf4YNdOoH/8lgjWIXlS3f9LA2dEP3zdin/5CHhPXcUP0fITRP1mBswX6OULvLBoHCXBDV
	lQX+XlMSErtyfL1uFYyd4wHGVnaQ/jaaF3UCfadJoQGsv+3wH6Laqn1WWo8FBkCi3YUdQM91h7A3X
	Pd032EwBpQHKxXZP7GgaFg/8FEUeu29hrq0UMl5WJEwR2j5MT2HuSjwvvJvNquf+hieQWrLA0LSVS
	nUeaIjhWVNUer3SpSpew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjXUv-00000000AlP-2AjQ;
	Mon, 11 Mar 2024 04:42:49 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjXUt-00000000Aie-0bdA
	for linux-riscv@lists.infradead.org;
	Mon, 11 Mar 2024 04:42:48 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-690cd7f83cdso5916066d6.3
        for <linux-riscv@lists.infradead.org>; Sun, 10 Mar 2024 21:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710132154; x=1710736954; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OYVTrtS1wFR4xz4iRpAoYb5PAkF0r3W283OMjz+whQg=;
        b=lYTWOik7FP8CVxppoHhiZlm7JarkkaDwxRBC7xm+84eSda8QkbFAvav8986qGmeVXq
         5doG6288HYjXGDfZdiWyZvYonVDk3nAb3+iSPRmUrWxuE0qYir3thdDZCcEZszcINlPn
         t97kORaukcjGBQ/cVwm7XBheeEki2XZskt3iujaGDVyJtvHs8+3i+PFf+QxF2nL9qBL8
         qm5F6ldFwHyKLcS3mhI75yLqCzjbLO30EGEvaeRKdjhoeHIkFnB0HLycPRYOWjZLNkPt
         5Z/7iUANKRYMNCLZ7mzmAvOW/W3ybgX0eShxLL1iFO2SkavDv8NRYyqfieW2XyvWGmqf
         aKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710132154; x=1710736954;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OYVTrtS1wFR4xz4iRpAoYb5PAkF0r3W283OMjz+whQg=;
        b=eLw5VXFBELTP7oEmcwPVV7iCM8B89g0el2POBPv2mp1mzowHIKa5L3q3ZTAEOQkJWo
         /zCJ31/eGMK8Xw+9jcERSz/QEG8QgAm1LIyyIU7M3x0GKcUIoypLz3JLxhcGgluT7Zsq
         2nko9VC8GIozt1/4+HG+65IOuckHO5VHjoLQeqtigwC9gLlTkx9NoTm1JF1rqw2rpw8Y
         CmWK1Hk/i1vLEzSsUBkxr/J/cijAOWrL5EbMeM1l/QKuPSm5CO48TciamcznPLTlencw
         fIhUZKcFhSuJovQ3V0Rb3NM/PfwIkel80zNxvkNKlll19PdQD1BAMrF0y9XFnXr0Amjs
         oxog==
X-Forwarded-Encrypted: i=1; AJvYcCXTLPLNjrxttKuLPEgKAb6KT+MwLmInZoLily8lyOoUbIYi3QKszO21fkGmypb841CswemWrmNxd1a17j9bAtk4JQ43PNn5imAYfCUuYUup
X-Gm-Message-State: AOJu0Yx/UAZ3Lf56wGhEVyxv08I7BofxrYeTHmkeWN1wM8Kyt7Mnt4w9
	V2I0B3TWf1F/ZBtfR2w8B/0PKkvileOiGqZzyfvaSITsD4NuWOLYvCzROCL+K04=
X-Google-Smtp-Source: AGHT+IFujUbi/JzfhmrtcGQ3D4oV7h0eie/xe8JSG2biYs1Uf2rxNY6Xc0sSBjnTJ11UzqzUDP6veQ==
X-Received: by 2002:a05:6214:184b:b0:690:9022:15cf with SMTP id d11-20020a056214184b00b00690902215cfmr4388812qvy.61.1710132154380;
        Sun, 10 Mar 2024 21:42:34 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.8.176])
        by smtp.gmail.com with ESMTPSA id di12-20020ad458ec000000b00690d848521esm213805qvb.12.2024.03.10.21.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Mar 2024 21:42:33 -0700 (PDT)
Message-ID: <77275750-18ca-4040-8b46-da601606dc67@sifive.com>
Date: Sun, 10 Mar 2024 23:42:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/13] riscv: Use IPIs for remote cache/TLB flushes by
 default
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>, Stefan O'Rear <sorear@fastmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Jisheng Zhang
 <jszhang@kernel.org>, yunhui cui <cuiyunhui@bytedance.com>
References: <20240229232211.161961-1-samuel.holland@sifive.com>
 <20240229232211.161961-4-samuel.holland@sifive.com>
 <10c4851d-a8d8-4289-a9f9-509c70a0ca22@app.fastmail.com>
 <CAK9=C2X9GR4SVU_VisAakM4Ae4=59D84MkXU-5_0y192Kzv_-Q@mail.gmail.com>
 <CAK9=C2WH+3QzHpUqaQv3TZEJatfgytVOYur5NvhifdheEgU1AQ@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CAK9=C2WH+3QzHpUqaQv3TZEJatfgytVOYur5NvhifdheEgU1AQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240310_214247_194503_3072131A 
X-CRM114-Status: GOOD (  23.03  )
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

SGkgU3RlZmFuLCBBbnVwLAoKT24gMjAyNC0wMy0xMCAxMToxMiBQTSwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBNb24sIE1hciAxMSwgMjAyNCBhdCA5OjM04oCvQU0gQW51cCBQYXRlbCA8YXBhdGVs
QHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Pgo+PiBPbiBNb24sIE1hciAxMSwgMjAyNCBhdCA4
OjM34oCvQU0gU3RlZmFuIE8nUmVhciA8c29yZWFyQGZhc3RtYWlsLmNvbT4gd3JvdGU6Cj4+Pgo+
Pj4gT24gVGh1LCBGZWIgMjksIDIwMjQsIGF0IDY6MjEgUE0sIFNhbXVlbCBIb2xsYW5kIHdyb3Rl
Ogo+Pj4+IEFuIElQSSBiYWNrZW5kIGlzIGFsd2F5cyByZXF1aXJlZCBpbiBhbiBTTVAgY29uZmln
dXJhdGlvbiwgYnV0IGFuIFNCSQo+Pj4+IGltcGxlbWVudGF0aW9uIGlzIG5vdC4gRm9yIGV4YW1w
bGUsIFNCSSB3aWxsIGJlIHVuYXZhaWxhYmxlIHdoZW4gdGhlCj4+Pj4ga2VybmVsIHJ1bnMgaW4g
TSBtb2RlLgo+Pj4+Cj4+Pj4gR2VuZXJhbGx5LCBJUElzIGFyZSBhc3N1bWVkIHRvIGJlIGZhc3Rl
ciB0aGFuIFNCSSBjYWxscyBkdWUgdG8gdGhlIFNCSQo+Pj4+IGNvbnRleHQgc3dpdGNoIG92ZXJo
ZWFkLiBIb3dldmVyLCB3aGVuIFNCSSBpcyB1c2VkIGFzIHRoZSBJUEkgYmFja2VuZCwKPj4+PiB0
aGVuIHRoZSBjb250ZXh0IHN3aXRjaCBjb3N0IG11c3QgYmUgcGFpZCBhbnl3YXksIGFuZCBwZXJm
b3JtaW5nIHRoZQo+Pj4+IGNhY2hlL1RMQiBmbHVzaCBkaXJlY3RseSBpbiB0aGUgU0JJIGltcGxl
bWVudGF0aW9uIGlzIG1vcmUgZWZmaWNpZW50Cj4+Pj4gdGhhbiBpbnNlcnRpbmcgYW4gaW50ZXJy
dXB0IHRvIHRoZSBrZXJuZWwuIFRoaXMgaXMgdGhlIG9ubHkgc2NlbmFyaW8KPj4+PiB3aGVyZSBy
aXNjdl9pcGlfc2V0X3ZpcnFfcmFuZ2UoKSdzIHVzZV9mb3JfcmZlbmNlIHBhcmFtZXRlciBpcyBm
YWxzZS4KPj4+Pgo+Pj4+IFRodXMsIGl0IG1ha2VzIHNlbnNlIGZvciByZW1vdGUgZmVuY2VzIHRv
IHVzZSBJUElzIGJ5IGRlZmF1bHQsIGFuZCBtYWtlCj4+Pj4gdGhlIFNCSSByZW1vdGUgZmVuY2Ug
ZXh0ZW5zaW9uIHRoZSBzcGVjaWFsIGNhc2UuCj4+Pgo+Pj4gVGhlIGhpc3RvcmljYWwgaW50ZW50
aW9uIG9mIHByb3ZpZGluZyBTQkkgY2FsbHMgZm9yIHJlbW90ZSBmZW5jZXMgaXMgdGhhdAo+Pj4g
aXQgYWJzdHJhY3RzIG92ZXIgaGFyZHdhcmUgdGhhdCBhbGxvd3MgZm9yIHBlcmZvcm1pbmcgcmVt
b3RlIGZlbmNlcwo+Pj4gX3dpdGhvdXQgYW4gSVBJIGF0IGFsbF8uIFRoZSBUSDE1MjAgaXMgYW4g
ZXhhbXBsZSBvZiBzdWNoIGhhcmR3YXJlLCBzaW5jZQo+Pj4gaXQgY2FuIChhdCBsZWFzdCBhY2Nv
cmRpbmcgdG8gdGhlIGRvY3VtZW50YXRpb24pIHBlcmZvcm0gYnJvYWRjYXN0IGZlbmNlLAo+Pj4g
ZmVuY2UuaSwgYW5kIHNmZW5jZS52bWEgb3BlcmF0aW9ucyB1c2luZyBiaXRzIGluIHRoZSBtaGlu
dCByZWdpc3Rlci4KClBsYXRmb3JtLXNwZWNpZmljIGNvZGUgY2FuIGNhbGwgc3RhdGljX2JyYW5j
aF9lbmFibGUoJnJpc2N2X3NiaV9mb3JfcmZlbmNlKSBpZgppdCBzb21laG93IGtub3dzIFNCSSBy
ZW1vdGUgZmVuY2VzIGFyZSBmYXN0ZXIuIFRoYXQgb3B0aW9uIGlzIHN0aWxsIGF2YWlsYWJsZS4K
Cj4+PiBULUhlYWQncyBwdWJsaWMgb3BlbnNiaSByZXBvc2l0b3J5IGRvZXNuJ3QgYWN0dWFsbHkg
dXNlIHRoaXMgZmVhdHVyZSwgYW5kCj4+PiBpbiBnZW5lcmFsIFNCSSByZW1vdGUgZmVuY2VzIGNv
bWUgZnJvbSBhIG11Y2ggbW9yZSBvcHRpbWlzdGljIHRpbWUgYWJvdXQKPj4+IGhvdyBtdWNoIHdl
IGNhbiBzdWNjZXNzZnVsbHkgaGlkZSBmcm9tIHN1cGVydmlzb3Igc29mdHdhcmUuIEJ1dCBJIGRv
bid0Cj4+PiB0aGluayB3ZSBjYW4gZ2VuZXJhbGl6ZSB0aGF0IGFuIElQSSB3aWxsIGFsd2F5cyBk
byBsZXNzIHdvcmsgdGhhbiBhIFNCSQo+Pj4gcmVtb3RlIGZlbmNlLgoKQWdyZWVkLCBhbmQgYXMg
QW51cCBwb2ludGVkIG91dCBiZWxvdywgdGhlIGNhc2Ugd2hlcmUgSVBJcyBnbyB0aHJvdWdoIFNC
SSBpcyBhbgpvYnZpb3VzIGNhc2Ugd2hlcmUgSVBJcyB3aWxsIGRvIG1vcmUgd29yayB0aGFuIFNC
SSByZW1vdGUgZmVuY2VzLiBIb3dldmVyLCB0aGVyZQppcyBub3QgY3VycmVudGx5IGFueSB3YXkg
dG8gZGV0ZWN0IHBsYXRmb3JtcyB3aGVyZSBTQkkgcmVtb3RlIGZlbmNlcyBoYXZlCnNwZWNpYWwg
b3B0aW1pemF0aW9ucy4gU28sIGluIHRoZSBhYnNlbmNlIG9mIGV4dHJhIGluZm9ybWF0aW9uLCB0
aGUga2VybmVsCmFzc3VtZXMgU0JJIHJlbW90ZSBmZW5jZXMgaGF2ZSB0aGUgcGVyZm9ybWFuY2Ug
Y2hhcmFjdGVyaXN0aWNzIGltcGxpZWQgYnkgdXNpbmcKb25seSBzdGFuZGFyZCBSSVNDLVYgcHJp
dmlsZWdlZCBJU0EgZmVhdHVyZXMuCgpUaGUgc3RhdHVzIHF1byBpcyB0aGF0IGluIGFsbCBjYXNl
cyB3aGVyZSBJUElzIGNhbiBiZSBkZWxpdmVyZWQgdG8gdGhlIGtlcm5lbCdzCnByaXZpbGVnZSBt
b2RlIHdpdGhvdXQgZmlybXdhcmUgYXNzaXN0YW5jZSwgcmVtb3RlIGZlbmNlcyBhcmUgc2VudCB2
aWEgSVBJLiBUaGlzCnBhdGNoIGlzIGp1c3QgcmVjb2duaXppbmcgdGhhdC4KCj4+IE9uIHBsYXRm
b3JtcyB3aGVyZSBTQkkgaXMgdGhlIG9ubHkgd2F5IG9mIGluamVjdGluZyBJUElzIGluIFMtbW9k
ZSwgdGhlCj4+IFNCSSBiYXNlZCByZW1vdGUgZmVuY2VzIGFyZSBhY3R1YWxseSBtdWNoIGZhc3Rl
ci4gVGhpcyBpcyBiZWNhdXNlIG9uCj4+IHN1Y2ggcGxhdGZvcm1zIGluamVjdGluZyBhbiBJUEkg
ZnJvbSBhIEhBUlQgdG8gYSBzZXQgb2YgSEFSVHMgd2lsbAo+PiByZXF1aXJlIG11bHRpcGxlIFNC
SSBjYWxscyB3aGljaCBjYW4gYmUgZGlyZWN0bHkgcmVwbGFjZWQgYnkgb25lIChvcgo+PiBmZXcp
IFNCSSByZW1vdGUgZmVuY2UgU0JJIGNhbGxzLgo+Pgo+PiBNb3N0IG9mIHRoZSBjdXJyZW50IHBs
YXRmb3JtcyBzdGlsbCBoYXZlIE0tbW9kZSBDTElOVCBhbmQgZGVwZW5kIG9uCj4+IFNCSSBJUEkg
Zm9yIFMtbW9kZSBJUEkgaW5qZWN0aW9uIHNvIHdlIHNob3VsZCBub3Qgc2xvdyBkb3duIHJlbW90
ZQo+PiBmZW5jZXMgZm9yIHRoZXNlIHBsYXRmb3Jtcy4KCkp1c3QgdG8gYmUgY2xlYXIsIHRoaXMg
cGF0Y2ggZG9lcyBub3QgY2hhbmdlIHRoZSBiZWhhdmlvciBvbiBhbnkgZXhpc3RpbmcKcGxhdGZv
cm0uIEFsbCBpdCBkb2VzIGlzIHNpbXBsaWZ5IHRoZSBsb2dpYyB0aGUga2VybmVsIHVzZXMgdG8g
Y2hvb3NlIHRoYXQKYmVoYXZpb3IgYXQgYm9vdCB0aW1lLgoKSW4gZmFjdCwgaXQgbWFrZXMgdXNp
bmcgc29tZXRoaW5nIGxpa2UgdGhlIFQtSEVBRCBpbnN0cnVjdGlvbnMgZWFzaWVyLCBiZWNhdXNl
Cml0IGRlY291cGxlcyB0aGUgcmVtb3RlIGZlbmNlIHN0YXRpYyBicmFuY2ggZnJvbSBpcnFjaGlw
IGRyaXZlciByZWdpc3RyYXRpb24uCkFuZCBpdCBhbHNvIHBhdmVzIHRoZSB3YXkgZm9yIHN1cHBv
cnRpbmcgYW4gU0JJIGltcGxlbWVudGF0aW9uIHRoYXQgb21pdHMgdGhlCnJlbW90ZSBmZW5jZSBl
eHRlbnNpb24sIGlmIG5lZWRlZC4KCkxpa2UgSSBtZW50aW9uZWQgaW4gdGhlIGNvbW1pdCBtZXNz
YWdlLCB0aGUgZ29hbCB3YXMgdG8gbWFrZSBJUElzIHRoZSAiZWxzZSIKY2FzZSwgc2luY2UgU01Q
IHNpbXBseSB3b24ndCB3b3JrIHdpdGhvdXQgSVBJcywgc28gdGhleSBtdXN0IGV4aXN0LiBBbmQg
YW55Cm9wdGltaXphdGlvbnMgY2FuIGJlIGFkZGVkIG9uIHRvcCBvZiB0aGF0LgoKPj4gVW50aWwg
YWxsIHBsYXRmb3JtcyBoYXZlIG1vdmVkIHRvIFJJU0MtViBBSUEgKHdoaWNoIHN1cHBvcnRzIFMt
bW9kZQo+PiBJUElzKSwgd2Ugc2hvdWxkIGtlZXAgdGhpcyBib290LXRpbWUgY2hvaWNlIG9mIFNC
SSBSRkVOQ0VzIHZlcnN1cwo+PiBkaXJlY3QgUy1tb2RlIElQSXMuCj4+Cj4+IElNTywgdGhpcyBw
YXRjaCBpcyBhaGVhZCBvZiBpdHMgdGltZS4KPiAKPiBJIHRoaW5rIHRoaXMgcGF0Y2ggaXMgZmlu
ZSBzaW5jZSBpdCByZXBsYWNlcyB0aGUgc3RhdGljIGtleQo+IHJpc2N2X2lwaV9mb3JfcmZlbmNl
IHdpdGggcmlzY3Zfc2JpX2Zvcl9yZmVuY2UuCj4gCj4gSSBnb3QgY29uZnVzZWQgYnkgdGhlIHJl
bW92YWwgb2YgcmlzY3ZfaXBpX2Zvcl9yZmVuY2UuCgpUaGFua3MgZm9yIHRha2luZyB0aGUgdGlt
ZSB0byByZS1yZXZpZXcuCgpSZWdhcmRzLApTYW11ZWwKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
