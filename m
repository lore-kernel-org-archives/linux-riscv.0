Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A5EC4725D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 10:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eskPfFVuh7PGkza3FbJrjPHJMlI1M3Rdlbtavo2wkek=; b=FF9UhK9Hbmd1gD
	0MFSRNXb60BnaBfqWxFRcZ93vBzBD62r0ygble7vh/znT7rk6/9sz9jNBrNGp1ih4jBGZ9crf7UqW
	rPrKKQaZpIkwHqw0dNFH2adLL6cs31Bzvrq9Qwmodgnoa1eecDvHG6m+rWta4nTSKOqmupSBWHSAU
	si4OW9SGpwZVWOYk67xkEXmG039DbYQmF7Qv0hzWu6J4VHo4Z6Y03pc7+W/jsNIGu3flHRmWoo4lm
	0JOKYnqiYPCD0krMvTKAEJpVCKgFp1+DWRIUjBrPH8ApjIYnYRK51Ifs70inveNqadAt8Cwn7kCzf
	epBg+N4/qko0T6/rLNgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQlog-0053UI-1P;
	Fri, 19 Jan 2024 10:09:38 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQloc-0053TC-2e
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jan 2024 10:09:36 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50e9e5c97e1so711253e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jan 2024 02:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705658971; x=1706263771; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nujauiSJ02Zrdg5BkB4mk+zSnAXh7vp4Jlf9tWWb5Vs=;
        b=cWBkFq5//gb5+UJRXon6oR2IlY+pIoCyWwkxUSP+dA4jnZqkSU0wk7elmkervg7S38
         rPOkVsxwmsRFGGdwSWEVK8H5EDBFTcPU26cTYqdAikcgeN6xqldtZehwBTtCb8S48n0q
         1EWgSOOq+XPhmufDD1EoqdOzBbYJne7gDr/RzdvCwJcp2EqMRhkH6VBu6jdImD3qqXJP
         0lM7H9YYhQxFO48WDtO7NqFJvf2P+4TU1bu47kWeNYmX4vR9Dxaprylfi3GwkDMCBP3N
         K/2xX/SeR5KSZ41qgybGDbmWzm8TkMuATXwZxcoQvYGR0tMwjvMwDDc1AKIA60X2yorM
         bOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705658971; x=1706263771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nujauiSJ02Zrdg5BkB4mk+zSnAXh7vp4Jlf9tWWb5Vs=;
        b=wF/Jy6TrfF34aw7T+HlaPdnHGY2KKXnnueaPqpM/3pqY4oH00ZEhyrYxTNalpVfr9e
         C4aCcPvu85eMdIRFpmacvqAGAHGLzkpDdTjaSkZbUryem8nVIjaNKtp3hb/NWQEo8RK2
         ea1AUsBjsW9dLH9UQ2JmiGUZxRvncrvtXF9bkFFJ90KC17Tg3/JjKeF3uN2mYh3kYIWf
         3a0mJ31dA2XzjkQr2lm35h4175YgvL7xff+HnkspTvzQSF8JWNAc0RT22lji6HorB4YS
         tzqQAGsYJ7Ii/HgkPZNLdJKM8wdKj1iXkjoshXJlCSD2Ip1p8r2mD5/paVqnAQZ5a/Rv
         cBnA==
X-Gm-Message-State: AOJu0YwPvAQqUEjh2+94/QtZOh8MRHNRdrQsbUc2+g20eOVAM0rJzT45
	89BEiKo2FQ7UldV29z5GSt60ngT0kDUG5GYmQedoGy5Jf5zjrwVXek385+7mVaGZR1oTi+kHMN1
	qHDdOGwkxXwEOR2/OvxRVl4k6ryIee+1yJYeUUg==
X-Google-Smtp-Source: AGHT+IHa/MIEYQlMLAmgsbbIMQodojNHus//+YiXCwZclJTJDmp0EnnAZVroAF6CDUc971U4uLo9+++Hzxp9zvHBhpo=
X-Received: by 2002:a05:6512:1328:b0:50e:e557:f1c4 with SMTP id
 x40-20020a056512132800b0050ee557f1c4mr675944lfu.0.1705658970552; Fri, 19 Jan
 2024 02:09:30 -0800 (PST)
MIME-Version: 1.0
References: <170498463783.20080.10723421328706946354.git-patchwork-notify@kernel.org>
 <mhng-2a34d0e2-170f-47a5-a688-ab454a70f06b@palmer-ri-x1c9>
In-Reply-To: <mhng-2a34d0e2-170f-47a5-a688-ab454a70f06b@palmer-ri-x1c9>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 19 Jan 2024 15:39:18 +0530
Message-ID: <CAK9=C2UV8J52a1pZjsNpFNwpUKn5K3nhS-+bS-3pohDwi3HrfQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] RISC-V SBI debug console extension support
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, nathan@kernel.org, 
	linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	jirislaby@kernel.org, Conor Dooley <conor@kernel.org>, ajones@ventanamicro.com, 
	linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_020934_856388_090C57E8 
X-CRM114-Status: GOOD (  21.17  )
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

T24gU2F0LCBKYW4gMTMsIDIwMjQgYXQgMTI6MDDigK9BTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVy
QGRhYmJlbHQuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgMTEgSmFuIDIwMjQgMDY6NTA6MzcgUFNU
ICgtMDgwMCksIHBhdGNod29yay1ib3QrbGludXgtcmlzY3ZAa2VybmVsLm9yZyB3cm90ZToKPiA+
IEhlbGxvOgo+ID4KPiA+IFRoaXMgc2VyaWVzIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4Lmdp
dCAoZm9yLW5leHQpCj4gPiBieSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT46
Cj4gPgo+ID4gT24gRnJpLCAyNCBOb3YgMjAyMyAxMjozOTowMCArMDUzMCB5b3Ugd3JvdGU6Cj4g
Pj4gVGhlIFNCSSB2Mi4wIHNwZWNpZmljYXRpb24gaXMgbm93IGZyb3plbi4gVGhlIFNCSSB2Mi4w
IHNwZWNpZmljYXRpb24gZGVmaW5lcwo+ID4+IFNCSSBkZWJ1ZyBjb25zb2xlIChEQkNOKSBleHRl
bnNpb24gd2hpY2ggcmVwbGFjZXMgdGhlIGxlZ2FjeSBTQkkgdjAuMQo+ID4+IGZ1bmN0aW9ucyBz
YmlfY29uc29sZV9wdXRjaGFyKCkgYW5kIHNiaV9jb25zb2xlX2dldGNoYXIoKS4KPiA+PiAoUmVm
ZXIgdjIuMC1yYzUgYXQgaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3Ytc2Jp
LWRvYy9yZWxlYXNlcykKPiA+Pgo+ID4+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgU0JJ
IGRlYnVnIGNvbnNvbGUgKERCQ04pIGV4dGVuc2lvbiBpbgo+ID4+IExpbnV4IFJJU0MtVi4KPiA+
Pgo+ID4+IFsuLi5dCj4gPgo+ID4gSGVyZSBpcyB0aGUgc3VtbWFyeSB3aXRoIGxpbmtzOgo+ID4g
ICAtIFt2NSwxLzVdIFJJU0MtVjogQWRkIHN0dWJzIGZvciBzYmlfY29uc29sZV9wdXRjaGFyL2dl
dGNoYXIoKQo+ID4gICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy9mNTAzYjE2N2I2
NjAKPiA+ICAgLSBbdjUsMi81XSBSSVNDLVY6IEFkZCBTQkkgZGVidWcgY29uc29sZSBoZWxwZXIg
cm91dGluZXMKPiA+ICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2MvZjQzZmFiZjQ0
NGNhCj4gPiAgIC0gW3Y1LDMvNV0gdHR5L3NlcmlhbDogQWRkIFJJU0MtViBTQkkgZGVidWcgY29u
c29sZSBiYXNlZCBlYXJseWNvbgo+ID4gICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3Yv
Yy9jNzdiZjM2MDdhMGYKPiA+ICAgLSBbdjUsNC81XSB0dHk6IEFkZCBTQkkgZGVidWcgY29uc29s
ZSBzdXBwb3J0IHRvIEhWQyBTQkkgZHJpdmVyCj4gPiAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9yaXNjdi9jLzg4ZWFkNjhlNzY0Ywo+ID4gICAtIFt2NSw1LzVdIFJJU0MtVjogRW5hYmxlIFNC
SSBiYXNlZCBlYXJseWNvbiBzdXBwb3J0Cj4gPiAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9y
aXNjdi9jLzUwOTQyYWQ2ZGRiNQo+ID4KPiA+IFlvdSBhcmUgYXdlc29tZSwgdGhhbmsgeW91IQo+
Cj4gTmF0aGFuIHBvaW50cyBvdXQgdGhhdCB0aGlzIGhhcyBzb21lIHNlbWFudGljIGNvbmZsaWN0
cyB3aXRoIGEgcGF0Y2ggaW4KPiBHcmVnJ3MgVFRZIHRyZWU6IGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2dyZWdraC90dHkuZ2l0L2NvbW1pdC8/aWQ9ZjMy
ZmNiZWRiZTkyOTA1NjVlNGVhYzNmZDdjNGM0NTFkNTQ3ODc4Nwo+Cj4gU28gSSB0aGluayB0aGUg
YmVzdCBiZXQgaXMgdG8gd2FpdCBvbiBHcmVnJ3MgcGF0Y2ggdG8gbGFuZCBpbiBMaW51cycKPiB0
cmVlLCBhbmQgdGhlbiBiYXNlIGEgdjYgb2YgdGhpcyBwYXRjaCBzZXQgb24gdGhhdCBtZXJnZWQg
cGF0Y2guICBJJ20KPiBnb2luZyB0byBkcm9wIHRoaXMgb25lIGZyb20gZm9yLW5leHQuCgpHcmVn
J3MgcGF0Y2ggaXMgbm93IGF2YWlsYWJsZSBpbiB1cHN0cmVhbSBMaW51eCBzbyBJIHdpbGwgcmVi
YXNlIGFuZApzZW5kIG91dCB2Ni4KClRoYW5rcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
