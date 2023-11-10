Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06077C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 04:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PjwNXu/p/j5TRb6A+m8yLk3uHAyyG+2WvJt81RROGEM=; b=Ft/Q5XkCONEP69
	iEFyOGA8/aTGPRcHAyOJ1oIgtyNMJQMPzoS8kwV9ZWCGiU7NcJ1SLhWpahKnL6CzDW5te2xBPy3bg
	7VXWQniXhpIhTKqa0iTFyTZv2X+whrFW1yMiUg4L1jC59uPx30A2dE+gxwvMR2bdrAKxNarC/dh4W
	jmd2RA/8GVv1j1HcyvfgMTsS+5+SGDNriWTh36JzuoI4VNgrg10INKyAs22hhn57o1fnbO9k6C9xB
	VJYyjNIN2+TEAOAJpMygmKoe50+RYsrLFJb83G9K/ib2IWvFJ2Nqd8G0Msn6V+p4rMWcjnHpuvXat
	m9dTlpHb9lmZ5ffHbN3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1JbD-007sGp-06;
	Fri, 10 Nov 2023 04:58:31 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Jb9-007sGT-1p
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 04:58:29 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c5071165d5so21977251fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 20:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1699592304; x=1700197104; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6sAETdwuHDStPNydylggHJXqBMcNQvpufLInsKoFd0=;
        b=I6VoUODrL5KDA2s9d+YSIVcITYR9k1vBLCkh9YkhJplpBoeyJKCZicSgxUMuJTmdgi
         5FOWPoBvQifUimTt2Q881uLFnrsiK1pbhvtsteE2EwZxv+zoBg1Zsq5W7M5a3y4lYg4u
         p3hA5tTsW1pdoN9kGU+nju3cO7biAYWhQAm7BxmN1rgy3L0fvAJasooClnJXuJMfy5sq
         pgVwvHXmu3okoD429GzqkPJd2erkRPAoFQNVp4/r2JYTfV4Je8D8+HUhr/sgiCATQlti
         dPdrHwOTQqAYIG4K55WeweTt4mYnMbVukzBP1HvMtzS3ESFq34GGB+YcKnC7RpNZDInX
         gqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699592304; x=1700197104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6sAETdwuHDStPNydylggHJXqBMcNQvpufLInsKoFd0=;
        b=lpUPk7N2ETTy4nlEVaQPtZTeYNRjDjb4ucwTaeLnaV42dB/xoTfAIGkgCnucNttdwR
         zKDVJF+TDkLzdfKcsOT5kPzizYAiWQ8uZOdO2/0l1xldr7nGj0KjJDNWrY80PW53yjvD
         nd87cZF/nqi/JtQHjlzvW0EeVXCI/u/71w0LV38Mdc4bIwaWnEsEQ6SpTFPUcPyyinAw
         b7MD3F6kPRti0Oxd1Kbq3zNJlhgqC4KPMP9mWHlvCxTTvASI3AD/ekacVbJ7VnUM8AjJ
         7RY5CfiZEYy1wl/Hf5+SliS6ojpEgI3MUQuM0Mxh9D5nwsxLyd4Xa3UwHesz9+bqD1Mc
         AWPA==
X-Gm-Message-State: AOJu0YzyG9F91mg3Mg03W8LVjumrFX4WtVv4kQiquc0dwajhkPwf604s
	o1W1roAxhjvXYt78aH4dhNO7bGM4Tvov/SHqzDkmIg==
X-Google-Smtp-Source: AGHT+IFiskVXU4f6KHS4fu76MT4C8NU0DvvVemixeUs0gO7+UD6OZvL9Om2hT/7BdlRp17/BfrmrUlL9CXx9Ip2tQFo=
X-Received: by 2002:a2e:98c7:0:b0:2c6:f3fd:7f0 with SMTP id
 s7-20020a2e98c7000000b002c6f3fd07f0mr5711888ljj.19.1699592304043; Thu, 09 Nov
 2023 20:58:24 -0800 (PST)
MIME-Version: 1.0
References: <20231025183644.8735-1-jerry.shih@sifive.com> <20231025183644.8735-7-jerry.shih@sifive.com>
 <20231102051639.GF1498@sol.localdomain> <39126F19-8FEB-4E18-B61D-4494B59C43A1@sifive.com>
 <20231109071623.GB1245@sol.localdomain>
In-Reply-To: <20231109071623.GB1245@sol.localdomain>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 10 Nov 2023 12:58:12 +0800
Message-ID: <CABgGipXnGVB770ZA=60rD-6Hi5Fv_wh3tST+G+VFbTmMYzz0Mw@mail.gmail.com>
Subject: Re: [PATCH 06/12] RISC-V: crypto: add accelerated AES-CBC/CTR/ECB/XTS implementations
To: Eric Biggers <ebiggers@kernel.org>
Cc: Jerry Shih <jerry.shih@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, palmer@dabbelt.com, 
	Albert Ou <aou@eecs.berkeley.edu>, herbert@gondor.apana.org.au, davem@davemloft.net, 
	greentime.hu@sifive.com, conor.dooley@microchip.com, guoren@kernel.org, 
	bjorn@rivosinc.com, heiko@sntech.de, ardb@kernel.org, phoebe.chen@sifive.com, 
	hongrong.hsu@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_205827_679303_7EFB9235 
X-CRM114-Status: GOOD (  27.88  )
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

SGkgRXJpYywKCk9uIFRodSwgTm92IDksIDIwMjMgYXQgMzoxNuKAr1BNIEVyaWMgQmlnZ2VycyA8
ZWJpZ2dlcnNAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIE5vdiAwNywgMjAyMyBhdCAw
NDo1MzoxM1BNICswODAwLCBKZXJyeSBTaGloIHdyb3RlOgo+ID4gT24gTm92IDIsIDIwMjMsIGF0
IDEzOjE2LCBFcmljIEJpZ2dlcnMgPGViaWdnZXJzQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiBP
biBUaHUsIE9jdCAyNiwgMjAyMyBhdCAwMjozNjozOEFNICswODAwLCBKZXJyeSBTaGloIHdyb3Rl
Ogo+ID4gPj4gK3N0YXRpYyBpbnQgZWNiX2VuY3J5cHQoc3RydWN0IHNrY2lwaGVyX3JlcXVlc3Qg
KnJlcSkKPiA+ID4+ICt7Cj4gPiA+PiArICBzdHJ1Y3QgY3J5cHRvX3NrY2lwaGVyICp0Zm0gPSBj
cnlwdG9fc2tjaXBoZXJfcmVxdGZtKHJlcSk7Cj4gPiA+PiArICBjb25zdCBzdHJ1Y3QgcmlzY3Y2
NF9hZXNfY3R4ICpjdHggPSBjcnlwdG9fc2tjaXBoZXJfY3R4KHRmbSk7Cj4gPiA+PiArICBzdHJ1
Y3Qgc2tjaXBoZXJfd2FsayB3YWxrOwo+ID4gPj4gKyAgdW5zaWduZWQgaW50IG5ieXRlczsKPiA+
ID4+ICsgIGludCBlcnI7Cj4gPiA+PiArCj4gPiA+PiArICAvKiBJZiB3ZSBoYXZlIGVycm9yIGhl
cmUsIHRoZSBgbmJ5dGVzYCB3aWxsIGJlIHplcm8uICovCj4gPiA+PiArICBlcnIgPSBza2NpcGhl
cl93YWxrX3ZpcnQoJndhbGssIHJlcSwgZmFsc2UpOwo+ID4gPj4gKyAgd2hpbGUgKChuYnl0ZXMg
PSB3YWxrLm5ieXRlcykpIHsKPiA+ID4+ICsgICAgICAgICAga2VybmVsX3ZlY3Rvcl9iZWdpbigp
Owo+ID4gPj4gKyAgICAgICAgICBydjY0aV96dmtuZWRfZWNiX2VuY3J5cHQod2Fsay5zcmMudmly
dC5hZGRyLCB3YWxrLmRzdC52aXJ0LmFkZHIsCj4gPiA+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBuYnl0ZXMgJiBBRVNfQkxPQ0tfVkFMSURfU0laRV9NQVNLLAo+ID4gPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmN0eC0+a2V5KTsKPiA+ID4+ICsg
ICAgICAgICAga2VybmVsX3ZlY3Rvcl9lbmQoKTsKPiA+ID4+ICsgICAgICAgICAgZXJyID0gc2tj
aXBoZXJfd2Fsa19kb25lKAo+ID4gPj4gKyAgICAgICAgICAgICAgICAgICZ3YWxrLCBuYnl0ZXMg
JiBBRVNfQkxPQ0tfUkVNQUlOSU5HX1NJWkVfTUFTSyk7Cj4gPiA+PiArICB9Cj4gPiA+PiArCj4g
PiA+PiArICByZXR1cm4gZXJyOwo+ID4gPj4gK30KPiA+ID4KPiA+ID4gVGhlcmUncyBubyBmYWxs
YmFjayBmb3IgIWNyeXB0b19zaW1kX3VzYWJsZSgpIGhlcmUuICBJIHJlYWxseSBsaWtlIGl0IHRo
aXMgd2F5Lgo+ID4gPiBIb3dldmVyLCBmb3IgaXQgdG8gd29yayAoZm9yIHNrY2lwaGVycyBhbmQg
YWVhZHMpLCBSSVNDLVYgbmVlZHMgdG8gYWxsb3cgdGhlCj4gPiA+IHZlY3RvciByZWdpc3RlcnMg
dG8gYmUgdXNlZCBpbiBzb2Z0aXJxIGNvbnRleHQuICBJcyB0aGF0IGFscmVhZHkgdGhlIGNhc2U/
Cj4gPgo+ID4gVGhlIGtlcm5lbC1tb2RlLXZlY3RvciBjb3VsZCBiZSBlbmFibGVkIGluIHNvZnRp
cnEsIGJ1dCB3ZSBkb24ndCBoYXZlIG5lc3RpbmcKPiA+IHZlY3RvciBjb250ZXh0cy4gV2lsbCB3
ZSBoYXZlIHRoZSBjYXNlIHRoYXQga2VybmVsIG5lZWRzIHRvIGp1bXAgdG8gc29mdGlycSBmb3IK
PiA+IGVuY3J5cHRpb25zIGR1cmluZyB0aGUgcmVndWxhciBjcnlwdG8gZnVuY3Rpb24/IElmIHll
cywgd2UgbmVlZCB0byBoYXZlIGZhbGxiYWNrcwo+ID4gZm9yIGFsbCBhbGdvcml0aG1zLgo+Cj4g
QXJlIHlvdSBhc2tpbmcgd2hhdCBoYXBwZW5zIGlmIGEgc29mdGlycSBpcyB0YWtlbiB3aGlsZSB0
aGUgQ1BVIGlzIGJldHdlZW4KPiBrZXJuZWxfdmVjdG9yX2JlZ2luKCkgYW5kIGtlcm5lbF92ZWN0
b3JfZW5kKCk/ICBJIHRoaW5rIHRoYXQgbmVlZHMgdG8gYmUKPiBwcmV2ZW50ZWQgYnkgbWFraW5n
IGtlcm5lbF92ZWN0b3JfYmVnaW4oKSBhbmQga2VybmVsX3ZlY3Rvcl9lbmQoKSBkaXNhYmxlIGFu
ZAo+IHJlLWVuYWJsZSBzb2Z0aXJxcywgbGlrZSB3aGF0IGtlcm5lbF9uZW9uX2JlZ2luKCkgYW5k
IGtlcm5lbF9uZW9uX2VuZCgpIGRvIG9uCj4gYXJtNjQuICBSZWZlciB0byBjb21taXQgMTMxNTAx
NDlhYTZkZWQgd2hpY2ggaW1wbGVtZW50ZWQgdGhhdCBiZWhhdmlvciBvbiBhcm02NC4KClllcywg
aWYgbWFraW5nIFZlY3RvciBhdmFpbGFibGUgdG8gc29mdGlycSBjb250ZXh0IGlzIGEgbXVzdCwg
dGhlbiBpdAppcyByZWFzb25hYmxlIHRvIGNhbGwgbG9jYWxfYmhfZGlzYWJsZSgpIGluIGtlcm5l
bF92ZWN0b3JfYmVnaW4oKS4KSG93ZXZlciwgc29mdGlycSB3b3VsZCBub3QgYmUgdGhlIG9ubHkg
dXNlciBmb3IgVmVjdG9yIGFuZCBkaXNhYmxpbmcKaXQgbWF5IGNhdXNlIGV4dHJhIGxhdGVuY2ll
cy4gTWVhbndoaWxlLCBzaW1wbHkgZGlzYWJsaW5nIGJoIGluCmtlcm5lbF92ZWN0b3JfYmVnaW4o
KSB3aWxsIGNvbmZsaWN0IHdpdGggdGhlIHBhdGNoWzFdIHRoYXQgdGFrZXMgYW4KYXBwcm9hY2gg
dG8gcnVuIFByZWVtcHRpYmxlIFZlY3Rvci4gVGhvdWdoIGl0IGlzIG5vdCBjbGVhciB5ZXQgb24K
d2hldGhlciB3ZSBzaG91bGQgcnVuIFZlY3RvciB3aXRob3V0IHR1cm5pbmcgb2ZmIHByZWVtcHRp
b24sIEkgaGF2ZQp0ZXN0ZWQgcnVubmluZyBwcmVlbXB0aWJsZSBWZWN0b3IgYW5kIG9ic2VydmVk
IHNvbWUgbGF0ZW5jeQppbXByb3ZlbWVudHMgd2l0aG91dCBzYWNyaWZpY2luZyB0aHJvdWdocHV0
LiBXZSB3aWxsIGhhdmUgYSBkaXNjdXNzaW9uCm9uIExQQzIwMjNbMl0gYW5kIGl0J2QgYmUgZ3Jl
YXQgaWYgeW91IGNvdWxkIGpvaW4gb3IgY29udGludWUgdG8KZGlzY3VzcyBpdCBoZXJlLgoKQXBw
cm9hY2hlcyBjYW4gYmUgZG9uZSBzdWNoIGFzIG5lc3RpbmcsIGlmIHJ1bm5pbmcgVmVjdG9yIGlu
IHNvZnRpcnEKaXMgcmVxdWlyZWQuIFNpbmNlIGl0IHJlcXVpcmVzIGV4dHJhIHNhdmUvcmVzdG9y
ZSBvbiBuZXN0aW5nLCBJIHRoaW5rCndlIHNob3VsZCBydW4gc29tZSB0ZXN0cyB0byBnZXQgbW9y
ZSBwZXJmb3JtYW5jZSAobGF0ZW5jeS90aHJvdWdocHV0KQpmaWd1cmUgbGV0IHRoZSByZXN1bHQg
ZGVjaWRlIHRoZSBmaW5hbCBkaXJlY3Rpb24uIEZvciBleGFtcGxlLCB3ZQpjb3VsZCBydW4gVmVj
dG9yIGluIGVpdGhlciBuZXN0aW5nIHdpdGggcHJlZW1wdC1WIGFuZCAgbm9uLW5lc3RpbmcKd2l0
aG91dCBwcmVlbXB0LVYgYW5kIGNvbXBhcmUgdGhlIGZvbGxvd2luZyBwZXJmb3JtYW5jZSBjYXRh
Y2hyaXN0aWNzOgogLSBTeXN0ZW0td2lkZSBsYXRlbmN5IGltcGFjdAogLSBMYXRlbmN5IGFuZCB0
aHJvdWdocHV0IG9mIHNvZnRpcnEtVmVjdG9yIGl0c2VsZgoKPgo+IC0gRXJpYwoKIC0gWzFdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMTAxOTE1NDU1Mi4yMzM1MS02LWFuZHkuY2hp
dUBzaWZpdmUuY29tLwogLSBbMl0gaHR0cHM6Ly9scGMuZXZlbnRzL2V2ZW50LzE3L2NvbnRyaWJ1
dGlvbnMvMTQ3NC8KClJlZ2FyZCwKQW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
