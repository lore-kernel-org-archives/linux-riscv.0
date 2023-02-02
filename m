Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926D0C05027
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 10:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YvDIudwpsVYA9eeBEpj5f2MFr0YMWdawhjH/ORMOrIs=; b=Pj4a1ml0RRNDAU
	j6NWLyjbCMdK7jvQW6SGo2XaEUe35LE8MBxA2vvvdj1a1Zeb3mgoUqtZ4z6sv5xeIYOVfSRfpClzA
	MBBJub4Ri/SB/1md6PgJNcA2sOnoChwzV4RT+eyKb2sT2p3oTdq3hrFJu+TgYfyI1ZuwbM9to5nh+
	AgdXEzJVkizYF2LKUlyE0fmQzm2Q8LyoasDcjjtnHema6o3xaf9qssEbn3hFXbRvJo9b8LGwqIYTO
	gkRtrcFW5gCagy4ycMHUJfKtnYBlIq/oh8Gl0v5s1U9y+yB8B0tnXVpZoGxnwz8YovPpCEqTnovXW
	pFi7aYvRVxCGfMAH6N7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNXJW-00FVHL-2F; Thu, 02 Feb 2023 10:59:34 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNXJS-00FVCl-NE
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 10:59:32 +0000
Received: by mail-wr1-x433.google.com with SMTP id d14so1307325wrr.9
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 02:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UgTiIPOmBXxBHCBI1SPf1jYsG2ew/s8emelTVcWqHf4=;
        b=P1qpBtdki4WxrIQDdZyF0/6Ft1BgTb9reSHsBkHTObHXZm7BXDLjR1iZ6CotQKJfdE
         /+v+bohLXLLTthPJZoGMqlj4fLH2NKDhoRPv/5fILRZ5vnUkCpX0IPMQEHZ14Bo2YckI
         eoWMZzYBsWEsAlxnhqObjdRaKXU1lXlbFJgLjhBpvgDzSbJyE80azV7nCvx5yA/oO6ay
         M+oQLgFp+H8Q922L2xI9VHWn3bAtwS95NLB/ER+p6JuCPupGAVI2CMLkLOIr+d57wees
         1rSjTmpp3pVeFKBx4gGm60S5b2s2cauSiRELF5/IYI57uXB8rcBjM0nHqJy2sowIUB4g
         Fxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UgTiIPOmBXxBHCBI1SPf1jYsG2ew/s8emelTVcWqHf4=;
        b=CX4o/pXepVg5bnDk38EGDk5xxW/aYthS/eCoX1Fz06KwK8Mv0UGY26ytIGfrVCzmxp
         rFhoF5/uIr76XMNVy3YlwVmJtLlvHyFq55PKFyQWZ2ztqgRkgZ8Z5Ji11go1kYi/5sbf
         u3zUZSPuBQT6yXYiyTXlUiepSYRgIFjYpgBeuX4lBzsM68O0XeHbnXI0Xg6R+WFiqAjd
         2Y/L80UwuNaOGxuAR0ORUySkrYAl0uzCBWkN+LpTgK7/UFyyNGBVlwND5wKs8cLN5lx/
         C0Sp3xSBfSwMPf739AYHn8q7Np1Jf4q3aujKOx16zWiR9+1luf4x5k2UhhjWIdV/4BVr
         yW0w==
X-Gm-Message-State: AO0yUKWYdNdCm/k+bEf5NDvwZutYRKWLFuHwPFDthh2hoqvIQhzb8EQ/
	VBAv2D0MYDy+m/zq/KQkPqD+/g==
X-Google-Smtp-Source: AK7set+pJGkZErNzearfcH92dOwxU8jILjbDFDcwGIsKvNIPaDT8LjSefGTMV9xz/L7MFQEJyTsuUw==
X-Received: by 2002:a05:6000:2:b0:2bf:cbf0:e021 with SMTP id h2-20020a056000000200b002bfcbf0e021mr4738287wrx.71.1675335563311;
        Thu, 02 Feb 2023 02:59:23 -0800 (PST)
Received: from smtpclient.apple (global-5-143.n-2.net.cam.ac.uk. [131.111.5.143])
        by smtp.gmail.com with ESMTPSA id u15-20020a5d6daf000000b002bfe266d710sm1266499wrs.90.2023.02.02.02.59.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Feb 2023 02:59:22 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH] riscv: kprobe: Fixup misaligned load text
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <87cz6s75ze.fsf@all.your.base.are.belong.to.us>
Date: Thu, 2 Feb 2023 10:59:22 +0000
Cc: Guo Ren <guoren@kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 liaochang1@huawei.com,
 linux-arch <linux-arch@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Bjorn Topel <bjorn.topel@gmail.com>
Message-Id: <5C373F4A-983E-4ACA-AAB0-54E629D5F501@jrtc27.com>
References: <20230201064608.3486136-1-guoren@kernel.org>
 <87tu05pvur.fsf@all.your.base.are.belong.to.us>
 <CAJF2gTSj12E9+peMF0rNY_psGDyEG5BbMY6V-s4dK0FpkCC9Yw@mail.gmail.com>
 <87cz6s75ze.fsf@all.your.base.are.belong.to.us>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_025930_835243_5A83C0FD 
X-CRM114-Status: GOOD (  19.10  )
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

T24gMiBGZWIgMjAyMywgYXQgMDk6NDgsIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+
IHdyb3RlOgo+IAo+IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPiB3cml0ZXM6Cj4gCj4+IE9u
IFdlZCwgRmViIDEsIDIwMjMgYXQgNTo0MCBQTSBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwu
b3JnPiB3cm90ZToKPj4+IAo+Pj4gZ3VvcmVuQGtlcm5lbC5vcmcgd3JpdGVzOgo+Pj4gCj4+Pj4g
RnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+Pj4+IAo+Pj4+IFRoZSBj
dXJyZW50IGtwcm9iZSB3b3VsZCBjYXVzZSBhIG1pc2FsaWduZWQgbG9hZCBmb3IgdGhlIHByb2Jl
IHBvaW50Lgo+Pj4+IFRoaXMgcGF0Y2ggZml4dXAgaXQgd2l0aCB0d28gaGFsZi13b3JkIGxvYWRz
IGluc3RlYWQuCj4+Pj4gCj4+Pj4gRml4ZXM6IGMyMmIwYmNiMWRkMCAoInJpc2N2OiBBZGQga3By
b2JlcyBzdXBwb3J0ZWQiKQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51
eC5hbGliYWJhLmNvbT4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVs
Lm9yZz4KPj4+PiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi84Nzhy
aGlnOXpqLmZzZkBhbGwueW91ci5iYXNlLmFyZS5iZWxvbmcudG8udXMvCj4+Pj4gUmVwb3J0ZWQt
Ynk6IEJqb3JuIFRvcGVsIDxiam9ybi50b3BlbEBnbWFpbC5jb20+Cj4+Pj4gLS0tCj4+Pj4gYXJj
aC9yaXNjdi9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYyB8IDQgKysrLQo+Pj4+IDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+PiAKPj4+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYyBiL2FyY2gvcmlzY3Yva2VybmVs
L3Byb2Jlcy9rcHJvYmVzLmMKPj4+PiBpbmRleCA0MWM3NDgxYWZkZTMuLmMxMTYwNjI5Y2VmNCAx
MDA2NDQKPj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jCj4+Pj4g
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYwo+Pj4+IEBAIC03NCw3ICs3
NCw5IEBAIGludCBfX2twcm9iZXMgYXJjaF9wcmVwYXJlX2twcm9iZShzdHJ1Y3Qga3Byb2JlICpw
KQo+Pj4+ICAgICAgICAgICAgICByZXR1cm4gLUVJTFNFUTsKPj4+PiAKPj4+PiAgICAgIC8qIGNv
cHkgaW5zdHJ1Y3Rpb24gKi8KPj4+PiAtICAgICBwLT5vcGNvZGUgPSAqcC0+YWRkcjsKPj4+PiAr
ICAgICBwLT5vcGNvZGUgPSAoa3Byb2JlX29wY29kZV90KSgqKHUxNiAqKXByb2JlX2FkZHIpOwo+
Pj4+ICsgICAgIGlmIChHRVRfSU5TTl9MRU5HVEgocC0+b3Bjb2RlKSA9PSA0KQo+Pj4+ICsgICAg
ICAgICAgICAgcC0+b3Bjb2RlIHw9IChrcHJvYmVfb3Bjb2RlX3QpKCoodTE2ICopKHByb2JlX2Fk
ZHIgKyAyKSkKPj4+PiAgICAgIDw8IDE2Owo+Pj4gCj4+PiBVZ2gsIHRob3NlIGNhc3RzLiA6LSgg
V2hhdCBhYm91dCB0aGUgbWVtY3B5IHZhcmlhbnQgeW91IGhhZCBpbiB0aGUgb3RoZXIKPj4+IHRo
cmVhZD8KPj4gVGhlIG1lbWNweSB2ZXJzaW9uIHdvdWxkIGZvcmNlIGxvYWQgcHJvYmVfYWRkciAr
IDIuIFRoaXMgb25lIHdvdWxkCj4+IHNhdmUgYW4gbGggb3BlcmF0aW9uLiBUaGUgY29kZSB0ZXh0
IGd1YXJhbnRlZXMgaGFsZi13b3JkIGFsaWdubWVudC4gTm8KPj4gbWlzYWxpZ25lZCBsb2FkIGhh
cHBlbmVkLiBTZWNvbmQsIGtwcm9iZSB3b3VsZG4ndCB3cml0ZSB0aGUgbGFzdCBoYWxmCj4+IG9m
IDMyYiBpbnN0cnVjdGlvbi4KPiAKPiBPaywgc29tZXRoaW5nIG1vcmUgcmVhZGFibGUsIGxpa2U6
Cj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jCj4gaW5kZXggZjIxNTkyZDIwMzA2Li4z
NjAyMzUyYmExNzUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL2twcm9i
ZXMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMKPiBAQCAtNTAs
MTQgKzUwLDE2IEBAIHN0YXRpYyB2b2lkIF9fa3Byb2JlcyBhcmNoX3NpbXVsYXRlX2luc24oc3Ry
dWN0IGtwcm9iZSAqcCwgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gCj4gaW50IF9fa3Byb2JlcyBh
cmNoX3ByZXBhcmVfa3Byb2JlKHN0cnVjdCBrcHJvYmUgKnApCj4gewo+IC0JdW5zaWduZWQgbG9u
ZyBwcm9iZV9hZGRyID0gKHVuc2lnbmVkIGxvbmcpcC0+YWRkcjsKPiArCXUxNiAqaW5zbiA9ICh1
MTYgKilwLT5hZGRyOwo+IAo+IC0JaWYgKHByb2JlX2FkZHIgJiAweDEpCj4gKwlpZiAoKHVpbnRw
dHJfdClpbnNuICYgMHgxKQo+IAkJcmV0dXJuIC1FSUxTRVE7Cj4gCj4gCS8qIGNvcHkgaW5zdHJ1
Y3Rpb24gKi8KPiAtCXAtPm9wY29kZSA9ICpwLT5hZGRyOwo+IC0KPiArCXAtPm9wY29kZSA9ICpp
bnNuKys7Cj4gKwlpZiAoR0VUX0lOU05fTEVOR1RIKHAtPm9wY29kZSkgPT0gNCkKPiArCQlwLT5v
cGNvZGUgfD0gKmluc24gPDwgMTY7CgoqaW5zbiBnZXRzIHByb21vdGVkIHRvIGludCBub3QgdW5z
aWduZWQgc28gdGhpcyBpcyBVQiBpZiBiaXQgMTUgaXMgc2V0LgoKSmVzcwoKPiArCQo+IAkvKiBk
ZWNvZGUgaW5zdHJ1Y3Rpb24gKi8KPiAJc3dpdGNoIChyaXNjdl9wcm9iZV9kZWNvZGVfaW5zbihw
LT5hZGRyLCAmcC0+YWluc24uYXBpKSkgewo+IAljYXNlIElOU05fUkVKRUNURUQ6CS8qIGluc24g
bm90IHN1cHBvcnRlZCAqLwo+IAo+IAo+IEJqw7Zybgo+IAo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4g
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
