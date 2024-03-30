Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECF2CD1283
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Mar 2024 02:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nN9SWKTsTMgTcMbAMrfkMPWk7sZAMFGft0HngIt2ypg=; b=OZ6OLfU+cnDBtB
	+K/uZuxc11DdIRKnyOEAnYP6kXeZ4iiGZdSel7O62kFM8cODJdMsjJRd9PNoWzGxjVDTlDL58exHP
	paf/y9d12CqQmCaEURRd5OCu4DYO3+bBbaVEw54M/d5G6FJE9cIeahoiWSV0D5YrGgdbYUzvy85GB
	q3vr8FmVQJji5m53w1rmy4xIQVzn7wdtiIv85VGSAKK9bJTKdW189VXbL+zwINbPxlieS9x3/Fgxw
	FZMh2N/DkaN/Mt2U2FsKvC4JI71+cr5mTS/cqiqewHjH+ImYxwLPzjKQ5et9gnTo2v6pChuJV1Oac
	W46vXb6MXtNMJ8orWTjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqO5F-00000002Xbj-1sQW;
	Sat, 30 Mar 2024 02:04:37 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqO5C-00000002Xb1-20YB
	for linux-riscv@lists.infradead.org;
	Sat, 30 Mar 2024 02:04:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4E0BACE319B
	for <linux-riscv@lists.infradead.org>; Sat, 30 Mar 2024 02:04:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33895C433B2
	for <linux-riscv@lists.infradead.org>; Sat, 30 Mar 2024 02:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711764271;
	bh=Wk28etsJV9OLppkXGrvdl2+DqrkI79w+XXntZj2FBbU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TwEfoq0WQ6BpJv7ip3oXNkO4gICUL7k8jsZTM5wR6Hbkpj+uf3yMrkjSITf8lg2oJ
	 LSPBR7yGJJstQw2/ymzK1ScvD1UWNVkkPx1J+UKlIiEPNVNuzb3FgCbXIzK8QgsD+Q
	 qXeoYWg+eso3HWrnPYQSJDHx25ite5Kr3qokAOlsUpfNvFzXX95rG5CkgYYPC+M7jg
	 BS0g+xYWYyXJqqHKdhp9Kd2Me9dM43JzyhW7rPRdUB6RrVq5UZaCG2k/8mBjxo71RN
	 Ea5ihAAyocKEcPn8iDAccLRzt3CVmyavPyWz1yU+Jii5W7M7x/T8qRE2Q4Tw2vmA9G
	 k0+DqH8MTzVYQ==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5684db9147dso2773800a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 19:04:31 -0700 (PDT)
X-Gm-Message-State: AOJu0YxnCUL91kCUisZo3lwuyBv9coQ+T1VqOBg8lDFK5+WwaP0MG6u5
	EB7Op1FqYtpZYPyz+wpCX0Xph6F9Ull9NQ/oCODXyCdt8HcyUa47eU2VEcxpgC4kH7hK7gLLBn8
	zqmYE+WZ12yUPHxue7645QgZ5P4M=
X-Google-Smtp-Source: AGHT+IEAADUQy1Sg8zrh0aqV8FJVSevq0sivP9tiRStv3WrBnwPhBx8S+J/NFVmwsTVNfNzXHqaKOtMTVuCQ2ahr0dM=
X-Received: by 2002:a50:a44a:0:b0:56b:a155:4b39 with SMTP id
 v10-20020a50a44a000000b0056ba1554b39mr2573169edb.28.1711764269734; Fri, 29
 Mar 2024 19:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_2E60E33C1F88A090B6B3A332AE528C6B8806@qq.com> <tencent_9B2484D4343EF1ED092E6A1F3A66E206C40A@qq.com>
In-Reply-To: <tencent_9B2484D4343EF1ED092E6A1F3A66E206C40A@qq.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 30 Mar 2024 10:04:17 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR8cb842GWa9Lpxz4y62ZtMumECOps8ojnZQx0TJMRxnQ@mail.gmail.com>
Message-ID: <CAJF2gTR8cb842GWa9Lpxz4y62ZtMumECOps8ojnZQx0TJMRxnQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] soc: canaan: Deprecate SOC_CANAAN and use
 SOC_CANAAN_K210 for K210
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>, 
	Damien Le Moal <dlemoal@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_190434_969073_CAC2C892 
X-CRM114-Status: GOOD (  19.22  )
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

T24gRnJpLCBNYXIgMjksIDIwMjQgYXQgNjowMOKAr0FNIFlhbmd5dSBDaGVuIDxjeXlAY3l5c2Vs
Zi5uYW1lPiB3cm90ZToKPgo+IFNpbmNlIFNPQ19GT08gc2hvdWxkIGJlIGRlcHJlY2F0ZWQgZnJv
bSBwYXRjaCBbMV0sIGFuZCBjbGVhbnVwIGZvciBvdGhlcgo+IFNvQ3MgaXMgYWxyZWFkeSBpbiB0
aGUgbWFpbGluZyBsaXN0IFsyLDMsNF0sIHdlIHJlbW92ZSB0aGUgdXNlIG9mCj4gU09DX0NBTkFB
TiBhbmQgdXNlIEFSQ0hfQ0FOQUFOIGZvciBTb0NzIHZlbmRvcmVkIGJ5IENhbmFhbiBpbnN0ZWFk
IGZyb20gbm93Cj4gb24uIFRodXMsIHdlIHNob3VsZCBhbHNvIGNoYW5nZSB0aGUgTWFrZWZpbGUg
aGVyZSB0byB1c2UgQVJDSF9DQU5BQU4uCj4KPiBUaGVuLCBzaW5jZSB3ZSBoYXZlIGludHJvZHVj
ZWQgU09DX0NBTkFBTl9LMjEwIGZvciBLMjEwLXNwZWNpZmljIGRyaXZlcnMsCj4gd2Ugc2hvdWxk
IHJlcGxhY2UgaXRzIGRyaXZlcnMgZGVwZW5kcyBvbiBTT0NfQ0FOQUFOX0syMTAgYW5kIGRlZmF1
bHQgc2VsZWN0Cj4gd2hlbiBpdCBoYXMgdGhlIHN5bWJvbCBTT0NfQ0FOQUFOX0syMTAuCj4KPiBb
MV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMjExMjEyMjE0MTQuMTA5
OTY1LTEtY29ub3JAa2VybmVsLm9yZy8KPiBbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtcmlzY3YvMjAyNDAzMDUtcHJheWluZy1jbGFkLWM0ZmJjYWE3ZWQwYUBzcHVkLwo+IFszXSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI0MDMwNS1mbGVkLXVuZHJpbGxl
ZC00MWRjMGM0NmJiMjlAc3B1ZC8KPiBbNF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
cmlzY3YvMjAyNDAzMDUtc3RyZXNzLWVhcmZsYXAtZDdkZGI4NjU1YTRkQHNwdWQvCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBZYW5neXUgQ2hlbiA8Y3l5QGN5eXNlbGYubmFtZT4KPiAtLS0KPiAgZHJpdmVy
cy9zb2MvTWFrZWZpbGUgICAgICAgfCAyICstCj4gIGRyaXZlcnMvc29jL2NhbmFhbi9LY29uZmln
IHwgNCArKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL01ha2VmaWxlIGIvZHJpdmVycy9zb2Mv
TWFrZWZpbGUKPiBpbmRleCBiYThmNWI1NDYwZTEuLmZiMmJkMzEzODdkMCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL3NvYy9NYWtlZmlsZQo+ICsrKyBiL2RyaXZlcnMvc29jL01ha2VmaWxlCj4gQEAg
LTcsNyArNyw3IEBAIG9iai15ICAgICAgICAgICAgICAgICAgICAgICAgICAgKz0gYXBwbGUvCj4g
IG9iai15ICAgICAgICAgICAgICAgICAgICAgICAgICArPSBhc3BlZWQvCj4gIG9iai0kKENPTkZJ
R19BUkNIX0FUOTEpICAgICAgICAgICAgICAgICs9IGF0bWVsLwo+ICBvYmoteSAgICAgICAgICAg
ICAgICAgICAgICAgICAgKz0gYmNtLwo+IC1vYmotJChDT05GSUdfU09DX0NBTkFBTikgICAgICAg
Kz0gY2FuYWFuLwo+ICtvYmotJChDT05GSUdfQVJDSF9DQU5BQU4pICAgICAgKz0gY2FuYWFuLwo+
ICBvYmotJChDT05GSUdfQVJDSF9ET1ZFKSAgICAgICAgICAgICAgICArPSBkb3ZlLwo+ICBvYmot
JChDT05GSUdfTUFDSF9ET1ZFKSAgICAgICAgICAgICAgICArPSBkb3ZlLwo+ICBvYmoteSAgICAg
ICAgICAgICAgICAgICAgICAgICAgKz0gZnNsLwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9j
YW5hYW4vS2NvbmZpZyBiL2RyaXZlcnMvc29jL2NhbmFhbi9LY29uZmlnCj4gaW5kZXggNDNjZWQy
YmY4NDQ0Li4zMTIxZDM1MWZlYTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zb2MvY2FuYWFuL0tj
b25maWcKPiArKysgYi9kcml2ZXJzL3NvYy9jYW5hYW4vS2NvbmZpZwo+IEBAIC0yLDkgKzIsOSBA
QAo+Cj4gIGNvbmZpZyBTT0NfSzIxMF9TWVNDVEwKPiAgICAgICAgIGJvb2wgIkNhbmFhbiBLZW5k
cnl0ZSBLMjEwIFNvQyBzeXN0ZW0gY29udHJvbGxlciIKPiAtICAgICAgIGRlcGVuZHMgb24gUklT
Q1YgJiYgU09DX0NBTkFBTiAmJiBPRgo+ICsgICAgICAgZGVwZW5kcyBvbiBSSVNDViAmJiBTT0Nf
Q0FOQUFOX0syMTAgJiYgT0YKPiAgICAgICAgIGRlcGVuZHMgb24gQ09NTU9OX0NMS19LMjEwCj4g
LSAgICAgICBkZWZhdWx0IFNPQ19DQU5BQU4KPiArICAgICAgIGRlZmF1bHQgU09DX0NBTkFBTl9L
MjEwCj4gICAgICAgICBzZWxlY3QgUE0KPiAgICAgICAgIHNlbGVjdCBNRkRfU1lTQ09OCj4gICAg
ICAgICBoZWxwCj4gLS0KPiAyLjQzLjAKPgpGb3IgY29taW5nIGsyMzA6CgpBY2tlZC1ieTogR3Vv
IFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+CgoKLS0KQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
