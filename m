Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820DEC52D7C
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 18:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lq1XRuddoy+SWaht/HJY3wAiLsbEcMbG3KvBSYqzgxY=; b=srvMA0Htb0mXkh
	O4ns/NVDe+I5wvNy/bDZYZROuqnlZn7ul4UmWRah4vuCtvoiq+8JKQwHApHVPRgFgxlEGjQofW+Jp
	xxDeSBapFMLcQmkaBAOuFchNeqo8e8zQ/myxCv+YOS67DvTcLfC4qwi/ql+qz6Jrm4hz224zQ+fz9
	RXqko0WVOTD0g8ShQJlTcB7K89E4PWZVQ2nP0Zf0XVVksyPgaHErWSpcmZpET48wReOKacR/yvyZ6
	LET+cZwT6gQdjwB4ym33uiQWIkc8cy0X7YtfVBI8DW/BDtZMoJhS0ddLB01ozyGCdKjMk+hAgVR5n
	N1cXksn/zGo3SFV5LM2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg76v-00000002ZG7-2MSe;
	Mon, 19 Aug 2024 18:28:09 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg763-00000002Yxx-0Qmw
	for linux-riscv@lists.infradead.org;
	Mon, 19 Aug 2024 18:27:16 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-371b015572cso1804557f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Aug 2024 11:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1724092033; x=1724696833; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKLGgkdxGjwvH7vrkOjUsYvXYfsjWp5LV2FLkOtp4XA=;
        b=YNZJ1BlCqRwbGIW37Ugoq4cpGj1EaTtCLLfM3B2IF6MeRFtEhGlKkcOX52JQO3Zyjz
         OV2AG9COrqxzedH3OXZfRmA/cga//le7BXKZXhJ0p7RgCQDgLmHjVaSNLlFxPL7tpB8j
         Uzc3m8XpmJ6fjqihDYVzYz0XvGjqn/Y5NtJIHMpmIcLhn6E+hS2xQWgWNln+iwgi0Rtg
         LoR4w67fgRH0p+FKH+qb1gzSb//cn9Bd1uHkuqEIMSxO2f/BSp5e6QbHv0H32/eGFk0j
         dvJ2Oxvc3BNOw/KdGXV9xZCarANxMwZTcFTGEkaLyR+1Nf72WLA1zoavHzy1JrDDscQv
         rfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724092033; x=1724696833;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKLGgkdxGjwvH7vrkOjUsYvXYfsjWp5LV2FLkOtp4XA=;
        b=hu//oL3gZHqsgEOrRHmMu0brL9ZzJCUkMXQigbEY53suhDm0CM//moxEMWSRRoaFMa
         STTPMkGexEScdLrF3Pg1uxFMPz2LYF5aFV0w/aMnqxZuAssovNRjXGgjtvf/4BWfamB9
         2nHj44kxZ3cZaqyjfOmIQ0IfmEOCryN79TpwI7M8c3AB+5LUzvercT9x3Ge9wr9FXyE8
         1NrnwHEbdtG5rD7AX/2ODoGMcb+GaDI4wkIEbUZRlrRHKzjjyrUbJf0aYZph7ZbjG0OI
         YN4KLirLTjaQvLzU/Q7M33DPOkTPB1dl+B9StT2ZjoYHrm1L/PEJgyZho3dVMU16xh7F
         nLmg==
X-Forwarded-Encrypted: i=1; AJvYcCXxSG0sL/EeODGbWV9OTeEW/nzoe5xrHz9LW5ikNxCjaE9mbIM2C/BMoOidNKdIKo/G3ggKZBYmeLyvQN6GWOpSUu1Zt1YvPr1Wl50mjLir
X-Gm-Message-State: AOJu0YzJbq/xTFhA1JT7b6+pMJDbaCpg4yC0dUhR5DnO2tzSevwJQuN0
	4YfxNbzMkbEcwWxIhTkW9CS1uksxFaKvQ7xSh2iIdHNz4eudaLaEJTPhA6t8vF8=
X-Google-Smtp-Source: AGHT+IEZO0hM/Eo4qjWitYGYD8gtI1mX/YSCbBZ3xcT3qyrw3QTuw78EQsEo1zsD6MJr9+sfqGczMg==
X-Received: by 2002:adf:a317:0:b0:366:efbd:8aa3 with SMTP id ffacd0b85a97d-3719431575fmr8913958f8f.2.1724092032510;
        Mon, 19 Aug 2024 11:27:12 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898aab44sm11152375f8f.91.2024.08.19.11.27.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2024 11:27:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [External] Some feedbacks on RISC-V IOMMU driver
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CAPYmKFs7ZyHyKo8uULvYp3YK8ABOJo8+FWDG_cr2YU_cXgfRww@mail.gmail.com>
Date: Mon, 19 Aug 2024 19:27:01 +0100
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 linux@rivosinc.com,
 Will Deacon <will@kernel.org>,
 joro@8bytes.org,
 LKML <linux-kernel@vger.kernel.org>,
 Yongji Xie <xieyongji@bytedance.com>,
 iommu@lists.linux.dev,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 wangqian.rd@bytedance.com,
 linux-riscv <linux-riscv@lists.infradead.org>,
 robin.murphy@arm.com,
 Hangjing Li <lihangjing@bytedance.com>,
 baolu.lu@linux.intel.com
Message-Id: <A75E5C30-F062-43A3-A9AF-BB205632C7EC@jrtc27.com>
References: <CAPYmKFsTcurrUiWqM8cFj+GgqfRiaLqPDGOTSE+RLyKJGSKE2g@mail.gmail.com>
 <B0C91D33-8C1C-4C67-B9B4-41206EFD8ECF@jrtc27.com>
 <CAPYmKFs7ZyHyKo8uULvYp3YK8ABOJo8+FWDG_cr2YU_cXgfRww@mail.gmail.com>
To: Xu Lu <luxu.kernel@bytedance.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_112715_198809_BEBE71BE 
X-CRM114-Status: GOOD (  25.09  )
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

T24gMTkgQXVnIDIwMjQsIGF0IDA4OjQ5LCBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNv
bT4gd3JvdGU6Cj4gCj4gSGkgSmVzc2ljYSwKPiAKPiBPbiBNb24sIEF1ZyAxOSwgMjAyNCBhdCAx
OjE34oCvUE0gSmVzc2ljYSBDbGFya2UgPGpydGMyN0BqcnRjMjcuY29tPiB3cm90ZToKPj4gCj4+
IE9uIDE5IEF1ZyAyMDI0LCBhdCAwNDo1NiwgWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5j
b20+IHdyb3RlOgo+Pj4gCj4+PiBIaSBUb21hc3osCj4+PiAKPj4+IFRoYW5rcyBmb3IgeW91ciBi
cmlsbGlhbnQgam9iIG9uIFJJU0MtViBJT01NVSBkcml2ZXIuIEl0IGhlbHBzIHVzIGEKPj4+IGxv
dCBmb3Igd2hhdCB3ZSBhcmUgZG9pbmcuIEJlbG93IGlzIG91ciBmZWVkYmFjayBvbiB0aGUgZXhp
c3RpbmcKPj4+IGltcGxlbWVudGF0aW9uWzFdLgo+Pj4gCj4+PiAxKSBTb21lIElPTU1VIEhXIG1h
eSBvbmx5IHN1cHBvcnQgMzItYml0IGdyYW51bGFyaXR5IGFjY2VzcyBvbiBpdHMKPj4+IGNvbnRy
b2wgcmVnaXN0ZXJzIChldmVuIHdoZW4gdGhlIHJlZ2lzdGVyIGlzIDggYnl0ZSBsZW5ndGgpLiBN
YXliZSBpdAo+Pj4gaXMgYmV0dGVyIHRvIHByb3ZpZGUgYSAzMi1iaXQgYWNjZXNzIG1ldGhvZCBm
b3IgOCBieXRlIGxlbmd0aAo+Pj4gcmVnaXN0ZXJzIGxpa2Ugd2hhdCBvcGVuc2JpIGRvZXMgb24g
QUNMSU5UIE1USU1FIHJlZ2lzdGVyLgo+PiAKPj4gVGhhdCBPcGVuU0JJIGhhcyB0byBhY2Nlc3Mg
TVRJTUUgcGllY2V3aXNlIGlzIGEgd29ya2Fyb3VuZCBmb3IgYSB2ZW5kb3IKPj4gbm90IGltcGxl
bWVudGluZyB3aGF0IHRoZSBzcGVjIGNsZWFybHkgaW50ZW5kZWQsIGV2ZW4gaWYgaXQgd2FzbuKA
mXQKPj4gZXhwbGljaXRseSBzdGF0ZWQgKGJ1dCBpcyBub3csIGluIHJlc3BvbnNlIHRvIHRoYXQp
LiBSZXBlYXRpbmcgdGhhdAo+PiBzaXR1YXRpb24gd291bGQgYmUgYSBwaXRpZnVsIG1pc3Rha2Uu
Cj4+IAo+PiBUaGUgY3VycmVudCBJT01NVSBzcGVjIGRyYWZ0IHZlcnkgY2xlYXJseSBzdGF0ZXM6
Cj4+IAo+PiAgIlJlZ2lzdGVycyB0aGF0IGFyZSA2NC1iaXQgd2lkZSBtYXkgYmUgYWNjZXNzZWQg
dXNpbmcgZWl0aGVyIGEgMzItYml0Cj4+ICAgb3IgYSA2NC1iaXQgYWNjZXNzLuKAnQo+PiAKPiAK
PiBUaGUgc3BlYydzIGRlc2NyaXB0aW9uIGFib3V0IHRoaXMgaXMgcHJldHR5IGNvbmZ1c2luZy4K
PiAiVGhlIDggYnl0ZSBJT01NVSByZWdpc3RlcnMgYXJlIGRlZmluZWQgaW4gc3VjaCBhIHdheSB0
aGF0IHNvZnR3YXJlCj4gY2FuIHBlcmZvcm0gdHdvIGluZGl2aWR1YWwgNCBieXRlIGFjY2Vzc2Vz
LCBvciBoYXJkd2FyZSBjYW4gcGVyZm9ybQo+IHR3byBpbmRlcGVuZGVudCA0IGJ5dGUgdHJhbnNh
Y3Rpb25zIHJlc3VsdGluZyBmcm9tIGFuIDggYnl0ZSBhY2Nlc3MuIgo+IEl0IHNlZW1zIHRoYXQg
dGhlcmUgaXMgbm8gcmVxdWlyZW1lbnQgdG8gaW1wbGVtZW50IDgtYnl0ZSBhY2Nlc3MuCj4gSXQn
cyBPSyB0aGVuIGlmIHdlIHRoaW5rIHRoaXMgaXMgbm90IGEgcHJvYmxlbS4KCkkgYWdyZWUgdGhh
dCBwYXJ0IGlzIHBvb3JseSB3b3JkZWQuIFRoZSBwYXJ0IEkgcXVvdGVkIChmcm9tIFNvZnR3YXJl
Cmd1aWRlbGluZXMpIGlzIGNsZWFyIG9uIHRoZSBtYXR0ZXIgdGhvdWdoLiBNeSBpbnRlcnByZXRh
dGlvbiBvZiB0aGUKcGFydCB5b3UgcXVvdGVkIGlzIHRoYXQgdGhlIHNwZWMgaGFzIGJlZW4gd3Jp
dHRlbiBzdWNoIHRoYXQgc29mdHdhcmUKY2FuIGNob29zZSB0byBicmVhayA4LWJ5dGUgYWNjZXNz
ZXMgaW50byB0d28gNC1ieXRlIG9uZXMgYW5kIHRoaW5ncwp3aWxsIHdvcmssIGJ1dCBpZiBpdCBk
b2VzbuKAmXQgKHdoaWNoIGlzIGEgdmFsaWQgZHJpdmVyIGltcGxlbWVudGF0aW9uKSwKaGFyZHdh
cmUgY2FuIGFsc28gZG8gc28gc2hvdWxkIGl0IG5vdCB3YW50IHRvIHN1cHBvcnQgYW4gOC1ieXRl
CmludGVyZmFjZSAoZS5nLiB5b3UgaGF2ZSBhIDQtYnl0ZSBJL08gYnVzKS4KCkplc3MKCj4+IEpl
c3MKPj4gCj4+PiAyKSBJbiB0aGUgSU9NTVUgZmF1bHQgcXVldWUgaGFuZGxpbmcgcHJvY2VkdXJl
LCBJIHdvbmRlciB3aGV0aGVyIGl0IGlzCj4+PiBiZXR0ZXIgdG8gY2xlYXIgdGhlIGZxbWYvZnFv
ZiBiaXQgZmlyc3QsIGFuZCB0aGVuIGNsZWFyIHRoZSBpcHNyLmZpcAo+Pj4gYml0LiBPdGhlcndp
c2UgdGhlIGlwc3IuZmlwIGNhbiBub3QgYmUgY2xlYXJlZCBhbmQgYSByZWR1bmRhbnQKPj4+IGlu
dGVycnVwdCB3aWxsIGJlIHNpZ25hbGVkLgo+IAo+IEJ5IHRoZSB3YXksIGl0IHNlZW1zIHRoZSBp
cnEgaGFuZGxlciBtdXN0IGNsZWFyIGlwc3IuZmlwIGZpcnN0IHRvCj4gYXZvaWQgbWlzc2luZyBv
dXQgc29tZSBmYXVsdHMgbm8gbWF0dGVyIHdoZXRoZXIgYSByZWR1bmRhbnQgaXJxIHdpbGwKPiBi
ZSBnZW5lcmF0ZWQuCj4gCj4gSWYgaXBzci5maXEgcGVuZGluZyB2aWEgZnFvZi9mcW1mIGlzIGlt
cGxlbWVudGVkIGFzIGVkZ2UgdHJpZ2dlcmluZywKPiB0aGVuIGlwc3IuZmlxIGNhbiBiZSBjbGVh
cmVkIGF0IGZpcnN0LiBJbiB0aGlzIGNhc2Ugd2UgY2FuIG5vdCBjbGVhcgo+IGlwc3IuZmlwIGFn
YWluIGFmdGVyIGNsZWFyaW5nIGZxb2YvZnFtZiBiaXQsIGFzIGl0IGluZGljYXRlcyBhIG5ldwo+
IGZhdWx0IHRvIGJlIGhhbmRsZWQuCj4gCj4gSWYgaXBzci5maXEgcGVuZGluZyB2aWEgZnFvZi9m
cW1mIGlzIGltcGxlbWVudGVkIGFzIGxldmVsIHRyaWdnZXJpbmcsCj4gdGhlbiBpcHNyLmZpcSBj
YW4gbm90IGJlIGNsZWFyZWQgYXQgZmlyc3QgYW5kIGEgcmVkdW5kYW50IGlycSB3aWxsIGJlCj4g
Z2VuZXJhdGVkIGFmdGVyIHRoaXMgaGFuZGxlcidzIHJldHVybi4gQnV0IGl0IGlzIE9LIGFzIG5v
IGZhdWx0IHdpbGwKPiBiZSBtaXNzZWQuIE90aGVyd2lzZSBpdCBpcyBoYXJkIHRvIGRldGVjdCB3
aGV0aGVyIHRoZSBpcHNyLmZpcSBpcyBhbgo+IG9sZCBvbmUgb3IgYSBuZXcgb25lLgo+IAo+IFBs
ZWFzZSBjb3JyZWN0IG1lIGlmIEkgaGF2ZSBhbnkgbWlzdW5kZXJzdGFuZGluZy4gTG9va2luZyBm
b3J3YXJkIHRvCj4gdGhlIHN1YnNlcXVlbnQgY29kZS4KPiAKPiBCZXN0IHJlZ2FyZHMhCj4gCj4+
PiAKPj4+IEJlc3QgcmVnYXJkcyEKPj4+IFh1IEx1Cj4+PiAKPj4+IFsxXSBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvY292ZXIuMTcxODM4ODkwOC5naXQudGplem5hY2hAcml2b3NpbmMuY29t
Lwo+Pj4gCj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+Pj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCj4+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
