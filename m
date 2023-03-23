Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1002C74A5B
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 20:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RaZubxDkG52iG2JQcuJP4zJpAbt8TlAckA/E72z9gg0=; b=ZKfCxF98DrI6in
	fyvkiZ3zB/Ewg4+LJNIRXz+5wp6pWQS2wEZaqCTHTZjGsuK+StnxR5C0dDKsOF/qviPiV4m2AwlwN
	NTF3zEhsKXyyldzwXARZyhkp0vu6+YgHk0cOWLQmmeWLKpH/NkVhNFl9hPM0FAmDHhBLyB/D9Ry1o
	JPtugHxqIxpEz5LDSAH7KHojkaqzh3IdNqtD450g0BR8+xgrdG07WZepJFSIhvdoxsSniyxtFLa+8
	/K5x3oSr3wvNvRc9VMF1ptpWOeO9vKPrrU2gUxp74XYvhMxQtCZo1bmayUM0fJx7Zk2+b++4XjlPO
	px2W+/UQdkqvMfUyy+MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfR81-002sqv-2O;
	Thu, 23 Mar 2023 20:01:41 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfR7y-002soF-17
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 20:01:39 +0000
Received: by mail-pf1-x42e.google.com with SMTP id dw14so8607105pfb.6
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 13:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679601687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+55oTh7z8IE/JgYLIE37w82gPzf2I2OB6Ia2/zSR7Vs=;
        b=IPZIkew3dFtjmZdaViTjyD0HscLUwPXqPripmrMsr3WTFFmpjru7uOEiW5MdR0VV95
         3AkjKWS+SSGR66Z2HcB5pk7YSGalu08/hGwoMnkFnDkE2qoAQbU1GvgUd6upSXxx5s2P
         WgA85mghqIhhEYMtWiZMDw6eVS30vmwumoj8UFiy4jXPgOQpsvTsmsWOaQLIrepOjNLG
         23PQbOvHd/lWhmQ57R9lQXqXoeGABGhKFPHzTLsKICBt+2gzhqsz8P/8SexMqUTFcc6H
         UOF5X9dx/gsFR66RqsvJo3OswMwtQs/bMnp7PF1XkJIv33y55T3bQzLy+NDa36XNhCpS
         +QIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679601687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+55oTh7z8IE/JgYLIE37w82gPzf2I2OB6Ia2/zSR7Vs=;
        b=ZL79Eb0qtnQxUW4P36fpy6f2q3tvsMZNAtlgvQ2NTFeudDeGbxEgrlmqcJHbZFvPOa
         bBn90nDrELlkgwdWPxwFISSD64LjNsp3jJ4keiygFG2WWLVfPU8Dk0yM2n/WbDPn6SEF
         mele/z+P6+BXBu27U0HtHvzJ3Tjm/jDPJQaTvQhsUceROIB5GNc5a4dLSTOwwUcEMPJt
         qdkMZU+GYvvnYP1TWt2/CpwT+2MFtZNb3VQ+HswNIrxLo9FImaS4o+OLEZX/bGGy2HgJ
         gON0HaAr1cts7txuO3I+c161K4zN00BjUxrTPtze8N1xto/aWrKTY5SzhX7gZiU0nEmJ
         WGGQ==
X-Gm-Message-State: AO0yUKVc1kHH4EY2Z1GOTuy8Xbb4wDon56awUxaiMuHgkZMw2GwiPPAU
	Vkjy3qv/kfWsHeqnAzci6WH2G0NSRdIfDWu3O+vrTA==
X-Google-Smtp-Source: AK7set+ozY4YViDqnsSitk2Wr074yCOGB0DUpWwEKn9HjfwuqHnY07bD2pSglnB1LUnHagdMFzX9OQx8JdW2HNZ3kOw=
X-Received: by 2002:a65:484d:0:b0:503:354c:41ad with SMTP id
 i13-20020a65484d000000b00503354c41admr2238413pgs.11.1679601686525; Thu, 23
 Mar 2023 13:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230215143626.453491-1-alexghiti@rivosinc.com>
 <20230215143626.453491-2-alexghiti@rivosinc.com> <4a6fc7a3-9697-a49b-0941-97f32194b0d7@ghiti.fr>
 <877cw7dphf.fsf@all.your.base.are.belong.to.us> <CAKwvOdk0Lr-9gt0xAKvkcwA53+Wy8oeYQo1RJ7XH-LKCCURQCQ@mail.gmail.com>
In-Reply-To: <CAKwvOdk0Lr-9gt0xAKvkcwA53+Wy8oeYQo1RJ7XH-LKCCURQCQ@mail.gmail.com>
From: Fangrui Song <maskray@google.com>
Date: Thu, 23 Mar 2023 13:01:15 -0700
Message-ID: <CAFP8O3+UO0x9aETSnOkL7=473mX0wrt+ueuB9UgOJaf+N0p7gw@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] riscv: Introduce CONFIG_RELOCATABLE
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, nathan@kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_130138_389988_10EE2245 
X-CRM114-Status: GOOD (  17.42  )
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

T24gV2VkLCBNYXIgMjIsIDIwMjMgYXQgMTE6MjbigK9BTSBOaWNrIERlc2F1bG5pZXJzCjxuZGVz
YXVsbmllcnNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEZlYiAyNCwgMjAyMyBhdCA3
OjU44oCvQU0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4g
QWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPiB3cml0ZXM6Cj4gPgo+ID4gPiArY2MgbGlu
dXgta2J1aWxkLCBsbHZtLCBOYXRoYW4sIE5pY2sKPiA+ID4KPiA+ID4gT24gMi8xNS8yMyAxNToz
NiwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4gPj4gRnJvbTogQWxleGFuZHJlIEdoaXRpIDxh
bGV4QGdoaXRpLmZyPgo+ID4gPj4KPiA+ID4gSSB0cmllZCBhIGxvdCBvZiB0aGluZ3MsIGJ1dCBJ
IHN0cnVnZ2xlIHRvIHVuZGVyc3RhbmQsIGRvZXMgYW55b25lIGhhdmUKPiA+ID4gYW55IGlkZWE/
IEZZSSwgdGhlIHNhbWUgcHJvYmxlbSBoYXBwZW5zIHdpdGggTExWTS4KPgo+IE9mZiB0aGUgdG9w
IG9mIG15IGhlYWQsIG5vIGlkZWEuCj4KPiAoTWF5YmUgYXMgYSBmb2xsb3cgdXAgdG8gdGhpcyBz
ZXJpZXMsIEkgd29uZGVyIGlmIHB1cnN1aW5nCj4gQVJDSF9IQVNfUkVMUiBmb3IgQVJDSD1yaXNj
diBpcyB3b3J0aHdoaWxlPykKCihJIGhhZCB0aG91Z2h0IGFib3V0IHRoaXMgZm9yIG15IG93biBm
dW4sIGJ1dCB0aGUgY3VycmVudGx5IG9ubHkKaW1wbGVtZW50YXRpb24gYXJjaC9hcm02NC9rZXJu
ZWwvaGVhZC5TIHVzZXMgYXNzZW1ibHkuCkV2ZXJ5IHBvcnQgbmVlZHMgdG8gd3JpdGUgc29tZSBh
c3NlbWJseSBmb3IgdGhlIHNhbWUgdGFzaywgd2hpY2ggaXMgYSBwaXR5LgpJbiBGcmVlQlNEIHJ0
bGQsIGdsaWJjLCBhbmQgbXVzbCwgRFRfUkVMUiBjb2RlIGlzIHRhcmdldC1pbmRlcGVuZGVudC4p
CgoKPiA+Cj4gPiBEb24ndCBhc2sgbWUgKndoeSosIGJ1dCBhZGRpbmcgLS1lbWl0LXJlbG9jcyB0
byB5b3VyIGxpbmtlciBmbGFncyBzb2x2ZXMKPiA+ICJ0aGUgTlVMTCAucmVsYS5keW4iIGJvdGgg
Zm9yIEdDQyBhbmQgTExWTS4KPiA+Cj4gPiBUaGUgZG93bnNpZGUgaXMgdGhhdCB5b3UgZW5kIHVw
IHdpdGggYSBidW5jaCBvZiAucmVsYSBjcnVmdCBpbiB5b3VyCj4gPiB2bWxpbnV4Lgo+Cj4gVGhl
cmUgd2FzIGEgcGF0Y2gganVzdCB0aGlzIHdlZWsgdG8gdXNlICQoT0JKQ09QWSkgdG8gc3RyaXAg
dGhlc2UgZnJvbQo+IHZtbGludXggKGZvciB4ODYpLiBMb29rcyBsaWtlIHg4NiB1c2VzIC0tZW1p
dC1yZWxvY3MgZm9yIEtBU0xSOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMzAz
MjAxMjEwMDYuNDg2My0xLXBldHIucGF2bHVAc3VzZS5jb20vCj4gLS0KPiBUaGFua3MsCj4gfk5p
Y2sgRGVzYXVsbmllcnMKPgoKCi0tIArlrovmlrnnnb8KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
