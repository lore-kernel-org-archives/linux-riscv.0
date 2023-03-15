Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F812C6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 04:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zyRf63E/psjYtO2jCeUUhc/JzNE5JhS37Jt3hFUldgo=; b=o3CgINP/H6aB/r
	GqErxQdtsBYejoeb7mla+QDCEefJ3FwBqYYYqQF8PnYOiBU/mFUJqQJotmroq5n4cOBOZYMjfg6bu
	Qa7O/r2D/QKmqNALrd/eKOUcah9lQ04MluswOvVnp257lCxHCxD1yWsah9iFgXtSfmdeLRp+MxkfH
	sJMVUJ1E0UKLgz9RDJPvWDymgNOoik3d1lPP58mptKIBmfS670GALYM2/HHoTc0RuKjsCIEflpCZl
	113tW6jfVJ8PBJenA4nZEJf90wCHac99cyaUOyE0XPYz1NOWZ6Odu18/6FUZcDZzJut2A+kzPH2Zp
	weOTO8tJUQTfyk3PSzXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcIPm-00CEip-1f;
	Wed, 15 Mar 2023 04:07:02 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcIPi-00CEhx-2H
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 04:07:00 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-540cb2fb5b9so240155057b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 21:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1678853217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Enn/P/P0Dso5wyT4aOyOrnfmbLXABI8oREO5fJsikhQ=;
        b=hvN2KLy5T3SiSflrjJRxvuPv6nrBSuZh0KCh1TLM1iOfBtnTVDVpijqPBclk9AqrZC
         RWU1x3EwowxRny2TX18oNDlOLVjIEptbfT/ZIXkOHxLJW82+qgIweO8QSiUNPI0ZKtmy
         +MZMBAnW20W/0q3qD0dxafJWZbbnrH8eR2sxWpjBnby3jrLPzC+6lEGBMPF3MdHnFCkq
         3eoBNeER9FIAEBbZZlDb6ZmC/d4GBa5wG4aGazYyjfdNbkoe+ZHo8YCGNe5uQWvWPHOH
         BrnEDNdQRfjygRVovr93C9KmlF87Jr9lwYVWp5DPxUEXAvhVEMq9u75mdKSuT2/u5EIv
         cSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678853217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Enn/P/P0Dso5wyT4aOyOrnfmbLXABI8oREO5fJsikhQ=;
        b=0sMNxaLv0GgbNGghOy+Q/xVVPS7JT2tQJxo7BY2ddL4mK2e35XGwLGl4Zaed5rUU61
         4WuGVUDQpOd4aPNa8Hz5HUJxk8PeOg8fvQ/AsE7HCBL6sS5TPxwvfQzRwGld8l/1QTKn
         5HzQkGK1f3cBFv8mRsD+3N32fLtd5+fjK7kQfiH/d0/YMK/92tiFjdJsDeSuAY1rlst1
         KG8sWZhBSsdgZt1M3NY9oed5bYrEEegUqFl1KAbt/W/gkmi/H4VSjhmF8/hrf2bnGpuc
         ulGozenebbWsGjIS3eafZMKU3x7ZIaxhn36SpganJ9J8ISfOoU1E6chIhzkkQ701UOL4
         JNdA==
X-Gm-Message-State: AO0yUKXcYip5nOV+GofoNMK7kskWst1Fz6QqZMaRSuYcfmuGYtz0K+ai
	5sx0+tF9+lux0fU+i+6GhLqGGW2czcZJbb5RDyFHopNve3wknC/SDi0=
X-Google-Smtp-Source: AK7set/QwXaVUBibhg3kuLxzvNSAgDNGKXWiCcNO7ggyml88RawJoFRbknRBYj2sneiztp2sYM11S74xbEM9Te/QxWM=
X-Received: by 2002:a81:ad63:0:b0:52a:9f66:80c6 with SMTP id
 l35-20020a81ad63000000b0052a9f6680c6mr25994436ywk.9.1678853216765; Tue, 14
 Mar 2023 21:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230224170118.16766-1-andy.chiu@sifive.com> <20230224170118.16766-9-andy.chiu@sifive.com>
 <87r0u74dac.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87r0u74dac.fsf@all.your.base.are.belong.to.us>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 15 Mar 2023 12:05:00 +0800
Message-ID: <CABgGipXQcLvcSqHWoaZZEMW+7cwxEyOYPAEvr5cCtJMPFGva0w@mail.gmail.com>
Subject: Re: [PATCH -next v14 08/19] riscv: Introduce struct/helpers to
 save/restore per-task Vector state
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org, 
	atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	Vincent Chen <vincent.chen@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_210658_770414_07D16112 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

T24gVGh1LCBNYXIgMiwgMjAyMyBhdCA3OjEz4oCvUE0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPiB3cml0
ZXM6Cj4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaAo+ID4gaW5kZXggNjkyZDNlZTJkMmQzLi45
YzAyNWYyZWZkYzMgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rv
ci5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCj4gPiBAQCAtMzEs
MTEgKzU0LDcyIEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCByaXNjdl92X2Rpc2FibGUo
dm9pZCkKPiA+ICAgICAgIGNzcl9jbGVhcihDU1JfU1NUQVRVUywgU1JfVlMpOwo+ID4gIH0KPiA+
Cj4gPiArc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIF9fdnN0YXRlX2Nzcl9zYXZlKHN0cnVj
dCBfX3Jpc2N2X3ZfZXh0X3N0YXRlICpkZXN0KQo+ID4gK3sKPiA+ICsgICAgIGFzbSB2b2xhdGls
ZSAoCj4gPiArICAgICAgICAgICAgICJjc3JyICAgJTAsICIgQ1NSX1NUUihDU1JfVlNUQVJUKSAi
XG5cdCIKPiA+ICsgICAgICAgICAgICAgImNzcnIgICAlMSwgIiBDU1JfU1RSKENTUl9WVFlQRSkg
IlxuXHQiCj4gPiArICAgICAgICAgICAgICJjc3JyICAgJTIsICIgQ1NSX1NUUihDU1JfVkwpICJc
blx0Igo+ID4gKyAgICAgICAgICAgICAiY3NyciAgICUzLCAiIENTUl9TVFIoQ1NSX1ZDU1IpICJc
blx0Igo+ID4gKyAgICAgICAgICAgICA6ICI9ciIgKGRlc3QtPnZzdGFydCksICI9ciIgKGRlc3Qt
PnZ0eXBlKSwgIj1yIiAoZGVzdC0+dmwpLAo+ID4gKyAgICAgICAgICAgICAgICI9ciIgKGRlc3Qt
PnZjc3IpIDogOik7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9p
ZCBfX3ZzdGF0ZV9jc3JfcmVzdG9yZShzdHJ1Y3QgX19yaXNjdl92X2V4dF9zdGF0ZSAqc3JjKQo+
ID4gK3sKPiA+ICsgICAgIGFzbSB2b2xhdGlsZSAoCj4gPiArICAgICAgICAgICAgICJ2c2V0dmwg
IHgwLCAlMiwgJTFcblx0Igo+ID4gKyAgICAgICAgICAgICAiY3NydyAgICIgQ1NSX1NUUihDU1Jf
VlNUQVJUKSAiLCAlMFxuXHQiCj4gPiArICAgICAgICAgICAgICJjc3J3ICAgIiBDU1JfU1RSKENT
Ul9WQ1NSKSAiLCAlM1xuXHQiCj4gPiArICAgICAgICAgICAgIDogOiAiciIgKHNyYy0+dnN0YXJ0
KSwgInIiIChzcmMtPnZ0eXBlKSwgInIiIChzcmMtPnZsKSwKPiA+ICsgICAgICAgICAgICAgICAg
ICJyIiAoc3JjLT52Y3NyKSA6KTsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGlubGluZSB2b2lk
IF9fcmlzY3Zfdl92c3RhdGVfc2F2ZShzdHJ1Y3QgX19yaXNjdl92X2V4dF9zdGF0ZSAqc2F2ZV90
bywgdm9pZCAqZGF0YXApCj4gPiArewo+ID4gKyAgICAgcmlzY3Zfdl9lbmFibGUoKTsKPiA+ICsg
ICAgIF9fdnN0YXRlX2Nzcl9zYXZlKHNhdmVfdG8pOwo+ID4gKyAgICAgYXNtIHZvbGF0aWxlICgK
PiA+ICsgICAgICAgICAgICAgInZzZXR2bGkgICAgICAgIHQ0LCB4MCwgZTgsIG04LCB0YSwgbWFc
blx0Igo+ID4gKyAgICAgICAgICAgICAidnNlOC52ICAgICAgICAgdjAsICglMClcblx0Igo+ID4g
KyAgICAgICAgICAgICAiYWRkICAgICAgICAgICAgJTAsICUwLCB0NFxuXHQiCj4gPiArICAgICAg
ICAgICAgICJ2c2U4LnYgICAgICAgICB2OCwgKCUwKVxuXHQiCj4gPiArICAgICAgICAgICAgICJh
ZGQgICAgICAgICAgICAlMCwgJTAsIHQ0XG5cdCIKPiA+ICsgICAgICAgICAgICAgInZzZTgudiAg
ICAgICAgIHYxNiwgKCUwKVxuXHQiCj4gPiArICAgICAgICAgICAgICJhZGQgICAgICAgICAgICAl
MCwgJTAsIHQ0XG5cdCIKPiA+ICsgICAgICAgICAgICAgInZzZTgudiAgICAgICAgIHYyNCwgKCUw
KVxuXHQiCj4gPiArICAgICAgICAgICAgIDogOiAiciIgKGRhdGFwKSA6ICJ0NCIsICJtZW1vcnki
KTsKPiA+ICsgICAgIHJpc2N2X3ZfZGlzYWJsZSgpOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMg
aW5saW5lIHZvaWQgX19yaXNjdl92X3ZzdGF0ZV9yZXN0b3JlKHN0cnVjdCBfX3Jpc2N2X3ZfZXh0
X3N0YXRlICpyZXN0b3JlX2Zyb20sCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdm9pZCAqZGF0YXApCj4gPiArewo+ID4gKyAgICAgcmlzY3Zfdl9lbmFibGUoKTsKPiA+ICsg
ICAgIGFzbSB2b2xhdGlsZSAoCj4gPiArICAgICAgICAgICAgICJ2c2V0dmxpICAgICAgICB0NCwg
eDAsIGU4LCBtOCwgdGEsIG1hXG5cdCIKPiA+ICsgICAgICAgICAgICAgInZsZTgudiAgICAgICAg
IHYwLCAoJTApXG5cdCIKPiA+ICsgICAgICAgICAgICAgImFkZCAgICAgICAgICAgICUwLCAlMCwg
dDRcblx0Igo+ID4gKyAgICAgICAgICAgICAidmxlOC52ICAgICAgICAgdjgsICglMClcblx0Igo+
ID4gKyAgICAgICAgICAgICAiYWRkICAgICAgICAgICAgJTAsICUwLCB0NFxuXHQiCj4gPiArICAg
ICAgICAgICAgICJ2bGU4LnYgICAgICAgICB2MTYsICglMClcblx0Igo+ID4gKyAgICAgICAgICAg
ICAiYWRkICAgICAgICAgICAgJTAsICUwLCB0NFxuXHQiCj4gPiArICAgICAgICAgICAgICJ2bGU4
LnYgICAgICAgICB2MjQsICglMClcblx0Igo+ID4gKyAgICAgICAgICAgICA6IDogInIiIChkYXRh
cCkgOiAidDQiKTsKPgo+IE5pdC9xdWVzdGlvbjogRm9yIGJvdGggZW5hYmxlL2Rpc2FibGU7IEFu
eSByZWFzb24gdG8gY2xvYmJlciB0NCwgaW5zdGVhZAo+IG9mIHVzaW5nIGEgc2NyYXRjaCByZWc/
Cj4KClllcywgaXQgaXMgYmV0dGVyIHRvIHVzZSBhIHNjcmF0Y2ggcmVnaXN0ZXIgaGVyZSBpbiBv
cmRlciB0byBnYWluCmJlbmVmaXQgZnJvbSBpbmxpbmUgYXNtLgoKPiBCasO2cm4KCkFuZHkKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
