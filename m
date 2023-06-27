Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B110EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 15:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jBTXesXDt4LPJjx9rkTyB2kUW4qgQTjR1nyXpC4T3ys=; b=3aIhv8yPcZJSby
	iWshq6XDO6PfmzVDVJCW+33Q8upMXpAH8EDlFshSePW73xpYXDd9nwrZEtYEwbDnZp514umj2DxOk
	VUXP4OPkUuyz+xYMVgYhSCUGmpQoeze/YgY1LmRU+tZmIsW7uubqL+6Y3mrSiUQ+oiQmbCv+0R7qU
	mARLWii3OOX8FTcv18m8T+VXo+KnSpCydqwCHIz66wSUkWICrj7b6eITNpLHNffQoMaTqJs+ZnSrB
	r+o8uoxCZFbXpvTBNqzI3/iBhIB6SWq4QLYH2NJ9/5/Fiv5hAq2cDMSKg7KUOo5t1JmHFbGpZuzmM
	XbdDbkgUZASURnQtm/fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEAn0-00DXrN-37;
	Tue, 27 Jun 2023 15:39:34 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEAmy-00DXqb-0F
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 15:39:33 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b6a1fe5845so36467941fa.3
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 08:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1687880367; x=1690472367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6IOCNv/SJtKUmrbWeURwjMEcBmPJWOE2TKY9/M8bD8=;
        b=KNW+lElFinH0WyRf35ZNzUI/b1PcuFjv/PBPV/atZyqa54FnubqCVkBv4igpYFVmO+
         QUoz/craY6Rix8uESb1WVPKK/cpy7+rfstqmGL+pBbjznPsY7Ey1RqC4EVQ1z4zi/LVU
         zZg43FTfoIWY9CwUPjF4sVQT9GvQHK14wpm1wBXJqYKArtNuxRosKgT8ylLzefCxQquk
         aZJPIO3MVbASAnnYY66qxumUfM07K1QS5ex0Tdj9fwqS6/l4hQiv5TpfegblhcpFjXFE
         R+bJLDrGnhx+nVou/Y4Io45fZEcm/WAjx+zgkoW8RYbvORyNLnSA5vfbgmsQV5haiw83
         ovhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687880367; x=1690472367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6IOCNv/SJtKUmrbWeURwjMEcBmPJWOE2TKY9/M8bD8=;
        b=FltVieVc2M6F7BPWBVWgj1Yg15gHvNfu8fxab/Os9uMEBzWnS6DZ+PZAmPabDnJqop
         uV5O4XftbR9rQvjH7lsIUy84vBKpfOOagR1nZ936bTyQziVO0v1anCu+T2/u8yoN7my2
         RFtWuLSklC+H73Ax+5GIxmP7KxEA4wlaTJREDUE34smmRQ/gbTht6EIkr++3y32nlsNw
         YqBiCZaoqQ0s573wy2AV9SDTAyQVRFQG54+4IW6koqMu662XrS3wEhn0mdk0IAfgJUS4
         kspjceO2tw+90748OPrWU1U/kzcN8+co1zrZE2VKAfTv9q93iBqy8jbibVoJQ3fCB6XW
         P2Jw==
X-Gm-Message-State: AC+VfDwD80TzQNUSYGqDK/ehX57MY9ZU4UoHZfQRlTRNsCqbQnUB0kSc
	F8rD7WykLOHkL1LOPifXK/tR0USn496xC1nFOaxRRQ==
X-Google-Smtp-Source: ACHHUZ44awdvxFG8+IJLEY/feLz0QQeVz/f/QYrqwM/qKqJfKJ1cr4wwM4zMWj7m+CuLUZOlGPdtgBiTicHbHBGy+Ec=
X-Received: by 2002:a2e:9c53:0:b0:2b5:7dd9:74f5 with SMTP id
 t19-20020a2e9c53000000b002b57dd974f5mr14108755ljj.21.1687880366632; Tue, 27
 Jun 2023 08:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230627015556.12329-1-andy.chiu@sifive.com> <20230627015556.12329-3-andy.chiu@sifive.com>
 <87o7l19wkm.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87o7l19wkm.fsf@all.your.base.are.belong.to.us>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 27 Jun 2023 23:39:15 +0800
Message-ID: <CABgGipVJbtpLa94+TO13M+Ovk4BVyARqL654g86tg-feQ8wxig@mail.gmail.com>
Subject: Re: [v1, 2/2] selftests: Test RISC-V Vector's first-use handler
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, vineetg@rivosinc.com, greentime.hu@sifive.com, 
	guoren@linux.alibaba.com, bjorn@rivosinc.com, Shuah Khan <shuah@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_083932_141427_F5E6F3AE 
X-CRM114-Status: GOOD (  29.30  )
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

T24gVHVlLCBKdW4gMjcsIDIwMjMgYXQgMzo0NuKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3Jp
dGVzOgo+Cj4gPiBUaGlzIGFkZCBhIHRlc3QgdG8gY2hlY2sgaWYgdGhlIGtlcm5lbCB6ZXJvLWlu
aXRpYWxpemVzIGFsbCBWIHJlZ2lzdGVycwo+ID4gYWZ0ZXIgdGhlIGZpcnN0LXVzZSB0cmFwIGhh
bmRsZXIgcmV0dXJucy4KPiA+Cj4gPiBJZiBWIHJlZ2lzdGVycyBhcmUgbm90IHplcm8taW5pdGlh
bGl6ZWQsIHRoZW4gdGhlIHRlc3Qgc2hvdWxkIGZhaWwgb25lCj4gPiBvdXQgb2Ygc2V2ZXJhbCBy
dW5zOgo+ID4KPiA+IGBgYAo+ID4gIHJvb3RAc2lmaXZlLWZwZ2E6fiMgLi92X2luaXR2YWxfbm9s
aWJjCj4gPiAgIyB2bCA9IDI1Ngo+ID4gIG5vdCBvayAxIGRldGVjdCBzdGFsZSB2YWx1ZXMgb24g
di1yZWdlc3RlcnMKPiA+ICAwIDAgMCAwIDAgMCAwIDAgICAwIDAgMCAwIDAgMCAwIDAKPiA+ICAw
IDRjIDQxIDRlIDQ3IDNkIDQzIDAgICA1MCA0MSA1NCA0OCAzZCAyZiA3NSA3Mwo+ID4gIDcyIDJm
IDZjIDZmIDYzIDYxIDZjIDJmICAgNzMgNjIgNjkgNmUgM2EgMmYgNzUgNzMKPiA+ICA3MiAyZiA2
YyA2ZiA2MyA2MSA2YyAyZiAgIDYyIDY5IDZlIDNhIDJmIDc1IDczIDcyCj4gPiAgZmYgZmYgODEg
MCAwIDAgMCAwICAgMCAwIDAgMCAwIDAgMCAwCj4gPiBgYGAKPiA+Cj4gPiBPdGhlcndpc2UsIHRo
ZSB0ZXN0IHBhc3NlcyB3aXRob3V0IGVycm9ycyBlYWNoIHJ1bi4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgo+ID4gLS0tCj4gPiAgLi4uL3Rl
c3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L3ZlY3Rvci8uZ2l0aWdub3JlIHwgIDEgKwo+ID4gIHRvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L3ZlY3Rvci9NYWtlZmlsZSB8ICA2ICstCj4gPiAgLi4u
L3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3Ivdl9pbml0dmFsX25vbGliYy5jIHwgNjggKysrKysrKysr
KysrKysrKysrKwo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNzQgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9y
aXNjdi92ZWN0b3Ivdl9pbml0dmFsX25vbGliYy5jCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L3ZlY3Rvci8uZ2l0aWdub3JlIGIvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvcmlzY3YvdmVjdG9yLy5naXRpZ25vcmUKPiA+IGluZGV4IDRmMmI0ZThhM2Iw
OC4uOWFlNzk2NDQ5MWQ1IDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
cmlzY3YvdmVjdG9yLy5naXRpZ25vcmUKPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L3Jpc2N2L3ZlY3Rvci8uZ2l0aWdub3JlCj4gPiBAQCAtMSwyICsxLDMgQEAKPiA+ICB2c3RhdGVf
ZXhlY19ub2xpYmMKPiA+ICB2c3RhdGVfcHJjdGwKPiA+ICt2X2luaXR2YWxfbm9saWJjCj4gPiBk
aWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvdmVjdG9yL01ha2VmaWxl
IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvdmVjdG9yL01ha2VmaWxlCj4gPiBpbmRl
eCBjZDZlODBiZjk5NWQuLmJmZmYwZmY0ZjNiZSAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL3Jpc2N2L3ZlY3Rvci9NYWtlZmlsZQo+ID4gKysrIGIvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvcmlzY3YvdmVjdG9yL01ha2VmaWxlCj4gPiBAQCAtMiw3ICsyLDcgQEAKPiA+
ICAjIENvcHlyaWdodCAoQykgMjAyMSBBUk0gTGltaXRlZAo+ID4gICMgT3JpZ2luYWxseSB0b29s
cy90ZXN0aW5nL2FybTY0L2FiaS9NYWtlZmlsZQo+ID4KPiA+IC1URVNUX0dFTl9QUk9HUyA6PSB2
c3RhdGVfcHJjdGwKPiA+ICtURVNUX0dFTl9QUk9HUyA6PSB2c3RhdGVfcHJjdGwgdl9pbml0dmFs
X25vbGliYwo+ID4gIFRFU1RfR0VOX1BST0dTX0VYVEVOREVEIDo9IHZzdGF0ZV9leGVjX25vbGli
Ywo+ID4KPiA+ICBpbmNsdWRlIC4uLy4uL2xpYi5tawo+ID4gQEAgLTEzLDMgKzEzLDcgQEAgJChP
VVRQVVQpL3ZzdGF0ZV9wcmN0bDogdnN0YXRlX3ByY3RsLmMgLi4vaHdwcm9iZS9zeXNfaHdwcm9i
ZS5TCj4gPiAgJChPVVRQVVQpL3ZzdGF0ZV9leGVjX25vbGliYzogdnN0YXRlX2V4ZWNfbm9saWJj
LmMKPiA+ICAgICAgICQoQ0MpIC1ub3N0ZGxpYiAtc3RhdGljIC1pbmNsdWRlIC4uLy4uLy4uLy4u
L2luY2x1ZGUvbm9saWJjL25vbGliYy5oIFwKPiA+ICAgICAgICAgICAgICAgLVdhbGwgJChDRkxB
R1MpICQoTERGTEFHUykgJF4gLW8gJEAgLWxnY2MKPiA+ICsKPiA+ICskKE9VVFBVVCkvdl9pbml0
dmFsX25vbGliYzogdl9pbml0dmFsX25vbGliYy5jCj4gPiArICAgICAkKENDKSAtbm9zdGRsaWIg
LXN0YXRpYyAtaW5jbHVkZSAuLi8uLi8uLi8uLi9pbmNsdWRlL25vbGliYy9ub2xpYmMuaCBcCj4g
PiArICAgICAgICAgICAgIC1XYWxsICQoQ0ZMQUdTKSAkKExERkxBR1MpICReIC1vICRAIC1sZ2Nj
Cj4KPiBIbW0sIGRvZXMgdGhpcyBidWlsZCB3aXRoIGNsYW5nPyAoTm8sIGJpZ2dlIG9uIG15IGVu
ZCwgYW5kIGNhbiBiZSBmaXhlZAo+IGxhdGVyLikKCk9vcHMsIEkgZGlkbid0IHRyeS4gSSB3aWxs
IHJlc3BpbiB0aGUgc2VyaWVzIGlmIGNsYW5nIHJ1bnMgaW50bwpwcm9ibGVtcy4gSSBhbSBub3Qg
dmVyeSBjb25maWRlbnQgaGVyZSwgYnV0IGRvIHdlIG5lZWQgdG8gZ2F0ZSBidWlsZAp0aGVzZSB0
ZXN0cyBpZiBDT05GSUdfUklTQ1ZfSVNBX1YgaXMgbm90IHNldD8gSWYgbXkgY29kZSBmaXRzIGNs
YW5nCndlbGwgdGhlbiBpdCBwcm9iYWJseSB3b3VsZCBiZSBzb21lIHRvb2xjaGFpbiBkZXBlbmRl
bmN5IGlzc3VlcwooZ3Vlc3NpbmcgdGhlICIub3B0aW9uIGFyY2giIHBhcnQpLiBLY29uZmlnIHNo
b3VsZCBiZSBhYmxlIHRvIHJlc29sdmUKdGhpcyBwYXJ0LgoKPgo+ID4gZGlmZiAtLWdpdCBhL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L3ZlY3Rvci92X2luaXR2YWxfbm9saWJjLmMgYi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3Ivdl9pbml0dmFsX25vbGliYy5jCj4g
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi42Njc2NGVkYjBk
NTIKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jp
c2N2L3ZlY3Rvci92X2luaXR2YWxfbm9saWJjLmMKPiA+IEBAIC0wLDAgKzEsNjggQEAKPiA+ICsv
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Cj4gPiArCj4gPiArI2luY2x1
ZGUgIi4uLy4uL2tzZWxmdGVzdC5oIgo+ID4gKyNkZWZpbmUgTUFYX1ZTSVpFICAgICg4MTkyICog
MzIpCj4gPiArCj4gPiArdm9pZCBkdW1wKGNoYXIgKnB0ciwgaW50IHNpemUpCj4gPiArewo+ID4g
KyAgICAgaW50IGkgPSAwOwo+ID4gKwo+ID4gKyAgICAgZm9yIChpID0gMDsgaSA8IHNpemU7IGkr
Kykgewo+ID4gKyAgICAgICAgICAgICBpZiAoaSAhPSAwKSB7Cj4gPiArICAgICAgICAgICAgICAg
ICAgICAgaWYgKGkgJSAxNiA9PSAwKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cHJpbnRmKCJcbiIpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGVsc2UgaWYgKGkgJSA4ID09
IDApCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwcmludGYoIiAgIik7Cj4gPiAr
ICAgICAgICAgICAgIH0KPiA+ICsgICAgICAgICAgICAgcHJpbnRmKCIlMDJ4ICIsIHB0cltpXSk7
Cj4gPiArICAgICB9Cj4gPiArICAgICBwcmludGYoIlxuIik7Cj4gPiArfQo+ID4gKwo+ID4gK2lu
dCBtYWluKHZvaWQpCj4gPiArewo+ID4gKyAgICAgaW50IGk7Cj4gPiArICAgICB1bnNpZ25lZCBs
b25nIHZsOwo+ID4gKyAgICAgY2hhciAqZGF0YXAsICp0bXA7Cj4gPiArCj4gPiArICAgICBkYXRh
cCA9IG1hbGxvYyhNQVhfVlNJWkUpOwo+ID4gKyAgICAgaWYgKCFkYXRhcCkgewo+ID4gKyAgICAg
ICAgICAgICBrc2Z0X3Rlc3RfcmVzdWx0X2ZhaWwoImZhaWwgdG8gYWxsb2NhdGUgbWVtb3J5IGZv
ciBzaXplID0gJWx1XG4iLCBNQVhfVlNJWkUpOwo+ID4gKyAgICAgICAgICAgICBleGl0KC0xKTsK
PiA+ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIHRtcCA9IGRhdGFwOwo+ID4gKyAgICAgYXNtIHZv
bGF0aWxlICgKPiA+ICsgICAgICAgICAgICAgIi5vcHRpb24gcHVzaFxuXHQiCj4gPiArICAgICAg
ICAgICAgICIub3B0aW9uIGFyY2gsICt2XG5cdCIKPiA+ICsgICAgICAgICAgICAgInZzZXR2bGkg
ICAgICAgICUwLCB4MCwgZTgsIG04LCB0YSwgbWFcblx0Igo+ID4gKyAgICAgICAgICAgICAidnNl
OC52ICAgICAgICAgdjAsICglMilcblx0Igo+ID4gKyAgICAgICAgICAgICAiYWRkICAgICAgICAg
ICAgJTEsICUyLCAlMFxuXHQiCj4gPiArICAgICAgICAgICAgICJ2c2U4LnYgICAgICAgICB2OCwg
KCUxKVxuXHQiCj4gPiArICAgICAgICAgICAgICJhZGQgICAgICAgICAgICAlMSwgJTEsICUwXG5c
dCIKPiA+ICsgICAgICAgICAgICAgInZzZTgudiAgICAgICAgIHYxNiwgKCUxKVxuXHQiCj4gPiAr
ICAgICAgICAgICAgICJhZGQgICAgICAgICAgICAlMSwgJTEsICUwXG5cdCIKPiA+ICsgICAgICAg
ICAgICAgInZzZTgudiAgICAgICAgIHYyNCwgKCUxKVxuXHQiCj4gPiArICAgICAgICAgICAgICIu
b3B0aW9uIHBvcFxuXHQiCj4gPiArICAgICAgICAgICAgIDogIj0mciIgKHZsKSwgIj1yIiAodG1w
KSA6ICJyIiAoZGF0YXApIDogIm1lbW9yeSIpOwo+ID4gKwo+ID4gKyAgICAga3NmdF9wcmludF9t
c2coInZsID0gJWx1XG4iLCB2bCk7Cj4gPiArCj4gPiArICAgICBpZiAoZGF0YXBbMF0gIT0gMHgw
MCAmJiBkYXRhcFswXSAhPSAweGZmKSB7Cj4gPiArICAgICAgICAgICAgIGtzZnRfdGVzdF9yZXN1
bHRfZmFpbCgidi1yZWdlc3RlcnMgYXJlIG5vdCBwcm9wZXJseSBpbml0aWFsaXplZFxuIik7Cj4K
PiBOaXQ6ICJ2LXJlZ2lzdGVycyIKPgo+ID4gKyAgICAgICAgICAgICBkdW1wKGRhdGFwLCB2bCAq
IDQpOwo+ID4gKyAgICAgICAgICAgICBleGl0KC0xKTsKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICsg
ICAgIGZvciAoaSA9IDE7IGkgPCB2bCAqIDQ7IGkrKykgewo+ID4gKyAgICAgICAgICAgICBpZiAo
ZGF0YXBbaV0gIT0gZGF0YXBbMF0pIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBrc2Z0X3Rl
c3RfcmVzdWx0X2ZhaWwoImRldGVjdCBzdGFsZSB2YWx1ZXMgb24gdi1yZWdlc3RlcnNcbiIpOwo+
Cj4gTml0IChkaXRvKTogInYtcmVnaXN0ZXJzIiwgYW5kIG1heWJlICJkZXRlY3RlZCIuCj4KPgo+
IFdpdGgsIG9yIHdpdGhvdXQgdGhlIGNoYW5nZXMgYWJvdmUsCj4gUmV2aWV3ZWQtYnk6IEJqw7Zy
biBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPgo+IEJqw7ZybgoKVGhhbmtzLApBbmR5Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
