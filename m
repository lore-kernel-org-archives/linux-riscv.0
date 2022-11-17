Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56DEC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Nov 2022 09:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=assPnw9mpirk19P2vUXRtJvYwX9AxXSM23fXlItddO8=; b=EzKiu5ziQokEDD
	iBzuw0azCIfMoSKcDgE7GEQZvdxfXsAnbvmt4/IEeo4SVjqpyxM9ltSlUORbYDequIsytgGqBuAXe
	lhyPqZILomQkA/QvYUTfN0+kHsk07iSFzGk5yWAoDopuwHQPEmIhOy1EInoXDAX9yo6vXAkMyLT4p
	JGmfrT5GuaDOq7oqIiWwDrncKg7krWgVVcLklcdAacQJHbCFFzH2DWRzG0g0HoqV9zTw+47HLra6n
	P5MFn3loQmHT4fPvxjsFWpMxsUtpDP73ITnyBvIv0SXNw5sVx9ynsDK1eF4SSOaC8C8bdcB4TVxMC
	8TCk8gGHD0JKZDMSIRQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovaoe-00Bw3i-9r; Thu, 17 Nov 2022 09:04:12 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovaob-00Bw2k-JN
	for linux-riscv@lists.infradead.org; Thu, 17 Nov 2022 09:04:11 +0000
Received: by mail-io1-xd30.google.com with SMTP id e189so917768iof.1
        for <linux-riscv@lists.infradead.org>; Thu, 17 Nov 2022 01:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFbHHqhyDIjVW1NX7EMMrqzGcWcL3YBAWVCvlJhqqR8=;
        b=tdsQXbmcLAGssIgEhaPNAsav/5IBmS7ya2SxLXOAKEiG7BKen4mDbmPx/5H4pwSLQs
         vqzpdAqXIJmAz0rnnyhK5XjH5ekIduVJNv6AU+kPIZj6ttkCSC/l0ZMP/eCPPB3aDCJR
         mupDsiowO2+yEDVLA5ly8B6360Zjpta106lRsoEoHETOjqNEumLJYkXjXs6jrmiHW1Tw
         6L8PUhTDZJ3QTd6zbDFIitAeBkVccT+XuWn4Yo5FT8VezAarz91p4lSO8tVlZIxVC1Ze
         iHKb383VxwvWyVIdnI3emXEqEho5TbEjbstYjr8DLXg1Z+bOEnpCKwqD7HFbrEb3VNWk
         TYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dFbHHqhyDIjVW1NX7EMMrqzGcWcL3YBAWVCvlJhqqR8=;
        b=QJkszFQ94SrcOMWkSfWYYC/3QAy41Y1awwxyf9sGfHUUREeL7hyV9IIceuH/1rFxXB
         j9I2xLLnWFjg/wHQQ8PQksrkhehAswALWvJwpqYPCvwNvNkJM9mWi6b7bGDHH2WGFmIg
         zNLRFVqRjKpUGT8WJI5KaWe+1bbPsL4bqaihx0BPCBUTNR3q1Owwn1whQoX2jfJjWIpI
         jwexezl/rozW8grYmFu0lcV6FE92Wt4uWJZLKJdDTzvtnDhCR7xaa5qdElItuydLeuZ1
         Z98FuNquwGS3+SWcx5fpnkhjtplQfMPP78zJJ69u+MBAOOtiF0zFrPsMKmD/2owuhbj/
         Uviw==
X-Gm-Message-State: ANoB5pmpIXCSmlnT5A3Ypor9grKsAAW56ow830O+5XNQjyLWWMNH9uam
	s7nuUV2nOp10DzwAilTr7Uq4sEgWWajcvxgg3ggeQA==
X-Google-Smtp-Source: AA0mqf7jAIntsV6CY9bgvSv+dHzPWh/bZTRjwWi9SqnNtZ6/VE8nUsYH3ZtQHo8Hv5HzGIOmenpyUiPHTP5oFVioaW0=
X-Received: by 2002:a02:cc4d:0:b0:373:2fc2:96d7 with SMTP id
 i13-20020a02cc4d000000b003732fc296d7mr614253jaq.177.1668675847000; Thu, 17
 Nov 2022 01:04:07 -0800 (PST)
MIME-Version: 1.0
References: <20221115182051.582962-1-bjorn@kernel.org> <20221115182051.582962-2-bjorn@kernel.org>
In-Reply-To: <20221115182051.582962-2-bjorn@kernel.org>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Thu, 17 Nov 2022 10:03:56 +0100
Message-ID: <CADYN=9J-Uno-CftASGsguaKuqyHdX3+=7bfD5vDvRNnbpgP7aw@mail.gmail.com>
Subject: Re: [PATCH bpf 2/2] selftests/bpf: Pass target triple to
 get_sys_includes macro
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: bpf@vger.kernel.org, Andrii Nakryiko <andrii@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	Mykola Lysenko <mykolal@fb.com>, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_010409_666250_2099BA03 
X-CRM114-Status: GOOD (  14.73  )
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

T24gVHVlLCAxNSBOb3YgMjAyMiBhdCAxOToyMSwgQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+
Cj4KPiBXaGVuIGNyb3NzLWNvbXBpbGluZyBbMV0sIHRoZSBnZXRfc3lzX2luY2x1ZGVzIG1ha2Ug
bWFjcm8gc2hvdWxkIHVzZQo+IHRoZSB0YXJnZXQgc3lzdGVtIGluY2x1ZGUgcGF0aCwgYW5kIG5v
dCB0aGUgYnVpbGQgaG9zdHMgc3lzdGVtIGluY2x1ZGUKPiBwYXRoLgo+Cj4gTWFrZSBjbGFuZyBo
b25vciB0aGUgQ1JPU1NfQ09NUElMRSB0cmlwbGUuCj4KPiBbMV0gZS5nLiAiQVJDSD1yaXNjdiBD
Uk9TU19DT01QSUxFPXJpc2N2NjQtbGludXgtZ251LSBtYWtlIgo+Cj4gU2lnbmVkLW9mZi1ieTog
QmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKRm9yIGJvdGggcGF0Y2hlcy4KVGVz
dGVkLWJ5OiBBbmRlcnMgUm94ZWxsIDxhbmRlcnMucm94ZWxsQGxpbmFyby5vcmc+Cgo+IC0tLQo+
ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvTWFrZWZpbGUgfCAxMiArKysrKysrKy0tLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvTWFrZWZpbGUgYi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvTWFrZWZpbGUKPiBpbmRleCA4ZjhlZGUzMGU5NGUuLmEyYTFl
YWU3NTgyMCAxMDA2NDQKPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvTWFrZWZp
bGUKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvTWFrZWZpbGUKPiBAQCAtMzA5
LDkgKzMwOSw5IEBAICQoUkVTT0xWRV9CVEZJRFMpOiAkKEhPU1RfQlBGT0JKKSB8ICQoSE9TVF9C
VUlMRF9ESVIpL3Jlc29sdmVfYnRmaWRzICAgICAgICBcCj4gICMgVXNlICctaWRpcmFmdGVyJzog
RG9uJ3QgaW50ZXJmZXJlIHdpdGggaW5jbHVkZSBtZWNoYW5pY3MgZXhjZXB0IHdoZXJlIHRoZQo+
ICAjIGJ1aWxkIHdvdWxkIGhhdmUgZmFpbGVkIGFueXdheXMuCj4gIGRlZmluZSBnZXRfc3lzX2lu
Y2x1ZGVzCj4gLSQoc2hlbGwgJCgxKSAtdiAtRSAtIDwvZGV2L251bGwgMj4mMSBcCj4gKyQoc2hl
bGwgJCgxKSAkKDIpIC12IC1FIC0gPC9kZXYvbnVsbCAyPiYxIFwKPiAgICAgICAgIHwgc2VkIC1u
ICcvPC4uLj4gc2VhcmNoIHN0YXJ0cyBoZXJlOi8sL0VuZCBvZiBzZWFyY2ggbGlzdC4veyBzfCBc
KC8uKlwpfC1pZGlyYWZ0ZXIgXDF8cCB9JykgXAo+IC0kKHNoZWxsICQoMSkgLWRNIC1FIC0gPC9k
ZXYvbnVsbCB8IGdyZXAgJ19fcmlzY3ZfeGxlbiAnIHwgYXdrICd7cHJpbnRmKCItRF9fcmlzY3Zf
eGxlbj0lZCAtRF9fQklUU19QRVJfTE9ORz0lZCIsICQkMywgJCQzKX0nKQo+ICskKHNoZWxsICQo
MSkgJCgyKSAtZE0gLUUgLSA8L2Rldi9udWxsIHwgZ3JlcCAnX19yaXNjdl94bGVuICcgfCBhd2sg
J3twcmludGYoIi1EX19yaXNjdl94bGVuPSVkIC1EX19CSVRTX1BFUl9MT05HPSVkIiwgJCQzLCAk
JDMpfScpCj4gIGVuZGVmCj4KPiAgIyBEZXRlcm1pbmUgdGFyZ2V0IGVuZGlhbm5lc3MuCj4gQEAg
LTMxOSw3ICszMTksMTEgQEAgSVNfTElUVExFX0VORElBTiA9ICQoc2hlbGwgJChDQykgLWRNIC1F
IC0gPC9kZXYvbnVsbCB8IFwKPiAgICAgICAgICAgICAgICAgICAgICAgICBncmVwICdkZWZpbmUg
X19CWVRFX09SREVSX18gX19PUkRFUl9MSVRUTEVfRU5ESUFOX18nKQo+ICBNRU5ESUFOPSQoaWYg
JChJU19MSVRUTEVfRU5ESUFOKSwtbWxpdHRsZS1lbmRpYW4sLW1iaWctZW5kaWFuKQo+Cj4gLUNM
QU5HX1NZU19JTkNMVURFUyA9ICQoY2FsbCBnZXRfc3lzX2luY2x1ZGVzLCQoQ0xBTkcpKQo+ICtp
Zm5lcSAoJChDUk9TU19DT01QSUxFKSwpCj4gK0NMQU5HX1RBUkdFVF9BUkNIID0gLS10YXJnZXQ9
JChub3RkaXIgJChDUk9TU19DT01QSUxFOiUtPSUpKQo+ICtlbmRpZgo+ICsKPiArQ0xBTkdfU1lT
X0lOQ0xVREVTID0gJChjYWxsIGdldF9zeXNfaW5jbHVkZXMsJChDTEFORyksJChDTEFOR19UQVJH
RVRfQVJDSCkpCgpNYXliZSBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIG1vdmUgdGhpcyB0cmljayBp
bnRvIHNlbGZ0ZXN0cy9saWIubWsKc2luY2UgdGhlcmUgYXJlIG1vcmUgTWFrZWZpbGVzIHRoYXQK
d291bGQgYmVuZWZpdCBmcm9tIHRoaXMsIGxpa2UgdGMtdGVzdGluZyBvciBuZXQvYnBmIHRvIG5h
bWUgYSBmZXcuCgpDaGVlcnMsCkFuZGVycwoKPiAgQlBGX0NGTEFHUyA9IC1nIC1XZXJyb3IgLURf
X1RBUkdFVF9BUkNIXyQoU1JDQVJDSCkgJChNRU5ESUFOKSAgICAgICAgICBcCj4gICAgICAgICAg
ICAgIC1JJChJTkNMVURFX0RJUikgLUkkKENVUkRJUikgLUkkKEFQSURJUikgICAgICAgICAgICAg
ICAgICAgXAo+ICAgICAgICAgICAgICAtSSQoYWJzcGF0aCAkKE9VVFBVVCkvLi4vdXNyL2luY2x1
ZGUpCj4gQEAgLTUzOSw3ICs1NDMsNyBAQCAkKGV2YWwgJChjYWxsIERFRklORV9URVNUX1JVTk5F
Uix0ZXN0X3Byb2dzLG5vX2FsdTMyKSkKPiAgIyBEZWZpbmUgdGVzdF9wcm9ncyBCUEYtR0NDLWZs
YXZvcmVkIHRlc3QgcnVubmVyLgo+ICBpZm5lcSAoJChCUEZfR0NDKSwpCj4gIFRSVU5ORVJfQlBG
X0JVSUxEX1JVTEUgOj0gR0NDX0JQRl9CVUlMRF9SVUxFCj4gLVRSVU5ORVJfQlBGX0NGTEFHUyA6
PSAkKEJQRl9DRkxBR1MpICQoY2FsbCBnZXRfc3lzX2luY2x1ZGVzLGdjYykKPiArVFJVTk5FUl9C
UEZfQ0ZMQUdTIDo9ICQoQlBGX0NGTEFHUykgJChjYWxsIGdldF9zeXNfaW5jbHVkZXMsZ2NjLCkK
PiAgJChldmFsICQoY2FsbCBERUZJTkVfVEVTVF9SVU5ORVIsdGVzdF9wcm9ncyxicGZfZ2NjKSkK
PiAgZW5kaWYKPgo+IC0tCj4gMi4zNy4yCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
