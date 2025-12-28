Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FAA6E92722
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Dec 2025 02:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7j8gZSnErT9EHPvqS/REYwg0C6mkP3VtTQbyUSwuJWQ=; b=nktKojdx1tZHAM
	lIVdaSWSlVpSm7biZxdnhCHdDaXvv348en8tnAKhLlHTyNE4ZyRDTuCziGAxFEVeZx+PGC8YMP36X
	QD6sn5D3Cp5Ez+zhQHoh155wOVNKb/DVFGR3ES1wPogx7wP9M2qwSdSXHDGaqbK6jza3sWSW/0ZX+
	xQ3gTjzGN4PmhGqHXcbei5+oXDpaVhjDJU7w9KFTXvbRDlMM0jpsypdlXGsMa7H3XYZiAVW68uboV
	5TFRq/zk9eVeYEtBveYtIN03sG1MrkZxEWu1r6SYx9sYd77bqrIK9dT564j0lr2y43ngn+J/QmWo4
	/14zW14ehTCDlLVyjvcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZgsY-00000002Lr7-1CYl;
	Sun, 28 Dec 2025 02:51:34 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZgsV-00000002Lqm-1RHL
	for linux-riscv@lists.infradead.org;
	Sun, 28 Dec 2025 02:51:33 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-787da30c50fso73024587b3.3
        for <linux-riscv@lists.infradead.org>; Sat, 27 Dec 2025 18:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766890290; x=1767495090; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18qGTvniKulXXWT/wKk72xoOo8IjxyBBayqhOjXKPqU=;
        b=jpzM2+7s3WVmA0QUNAcfP2QyttjTscIhqMTezQWh9WS1SfskSJvVitFdnSPXf2AN83
         rRpRGEqQ8Sj1wRjNKFhd67/s7vaKdP6z912yM2vPqNws1HPHdhxvB/9f9OWuUwTVai4a
         pctZjaAuhmRpsYcyAuN5Jt8fNIH7n74dklgCAb8zoD+T7soTzFHGOvPe1YYWx1JfCrU3
         jdh4EHLJ7hzyfPu7xvjPHx8acgkjxgq21QQ1tcanYuBJHEgjtPYvyh/jZQMGp6TzSydC
         1xttn8YnRlGna7J0vaHEutHDVWvSNnTiqfUl/ZvN8z2/fPJWt8HhpMNkup/GWI6CRnZr
         XPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766890290; x=1767495090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=18qGTvniKulXXWT/wKk72xoOo8IjxyBBayqhOjXKPqU=;
        b=HeRi/WbtqB7cdpz9V4rRoJi0DhN317UpR+PmO5SyVFc6sDmeTNUnwT5kofDFC3dPBD
         o6WPYTHy2F6VvILXG6a6SEYe4hsX0wswkKrhUZu/BpR/cQoNxumH+Al9q/YdfIPGlRxw
         qsEYZmKa/4j6g5zGWotoBomhbOUgk3aT95J87KLMGizwNiSxncXBxwDS+7dP3eMnHp9/
         9nDwPpayYH9ywkIEXazxeuwLYazzvNKhCxn53nALRU16Oo1eZgAjbxN9V5RGUBKYQc6D
         MRL8A7toUNf2uQMsva5pSYHcVo6nYbLSLDloGP1uBnhsyNIdCl6tcF1/bB0wH5dArK5K
         E54Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtLnTYVwh1X1jds64kzFuL5kRUCUx4h+50ec8K/jMT6WByQERGwJYAiv0R1AbmUoXeUqoQe3/lsAZWcg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4rZDpDOn3bc+UQtdXuJiR20zdoFUkRAxaVjdF3mYOJnSkI8oy
	+QwABMz6ZAh4mDHRbgBf9/A02OhtUzFq1mSsbFQkzYGrDFFaY+8oZY1n1zybZmVioXcDDmgKb2X
	QDYoawnJxOAENw1DxQQoNIA1Jg7vGKPczg77xc1XtRg==
X-Gm-Gg: AY/fxX5L55Ul1GxBunUQ08qV/iVXCncXEtopIbYDMYpgZ7BCUkG0xRyFZAJaOkkO5UR
	dHm7VnyB+h87zc30OZRzLyYoCazoC403k0ZKD/Fzuku27DV+ZoNH3tSjGLHFKB5iK0n2tXF898V
	3NeEO3W3fa2G2tDVF2rp+C0UhUiurfPwgNUPb3XBM140KpSoAURokcsVobX8vQfmxpUfSO+TWd+
	A4SbbhGdVQRKuaMb3FXHw1oOce71qXuUeh0EXc2BdOnJPEein1PDk6Epid6DQUOZlqxL8OD7e9r
	vBWuju77G6i7mPChnig+Z5KhyOSB7t9PHWY3hOmHGfiL
X-Google-Smtp-Source: AGHT+IEc7vrvqgLHTFGlN3GYl8BNYF5Xijr5Fz6yp8EHf084aPqSZUjYIDTL+WyA328b2h++sOgSe5PHolFKTubOv/Y=
X-Received: by 2002:a05:690c:2601:b0:78c:697e:738 with SMTP id
 00721157ae682-78fb3f37a5amr462215137b3.18.1766890289821; Sat, 27 Dec 2025
 18:51:29 -0800 (PST)
MIME-Version: 1.0
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-7-3af3f3cd0f8a@riscstar.com> <20251222-stitch-preachy-3fab87fd6f0f@spud>
 <CAH1PCMZ7ywZ3unLy0yHYK+fFHk0y=q2cEtPnRi=qSpf=fc75rw@mail.gmail.com> <66c0676a-7920-4825-b916-3c00b1648a08@riscstar.com>
In-Reply-To: <66c0676a-7920-4825-b916-3c00b1648a08@riscstar.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Sun, 28 Dec 2025 10:51:18 +0800
X-Gm-Features: AQt7F2qn_DuwN9wJBAHmU8RWoNvuj8xcFk9LYANOqbaLNy2Gt0ggjV_dYt2ZiZQ
Message-ID: <CAH1PCMbBURb=DpChf+Y-DjYjzpXG-pKgoaHAu=TUuG4oVC56cg@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] dt-bindings: riscv: Add B ISA extension description
To: Alex Elder <elder@riscstar.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Andrew Jones <ajones@ventanamicro.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-serial@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_185131_657673_16F08FFB 
X-CRM114-Status: GOOD (  32.95  )
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

SGksIEFsZXgKCk9uIFNhdCwgRGVjIDI3LCAyMDI1IGF0IDU6MjjigK9BTSBBbGV4IEVsZGVyIDxl
bGRlckByaXNjc3Rhci5jb20+IHdyb3RlOgo+Cj4gT24gMTIvMjMvMjUgMTI6NTEgQU0sIEd1b2Rv
bmcgWHUgd3JvdGU6Cj4gPiBIaSwgQ29ub3IKPiA+Cj4gPiBPbiBUdWUsIERlYyAyMywgMjAyNSBh
dCA1OjE34oCvQU0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPiA+Pgo+
ID4+IE9uIE1vbiwgRGVjIDIyLCAyMDI1IGF0IDA5OjA0OjE3UE0gKzA4MDAsIEd1b2RvbmcgWHUg
d3JvdGU6Cj4gPj4+IEFkZCBkZXNjcmlwdGlvbiBvZiB0aGUgc2luZ2xlLWxldHRlciAiQiIgZXh0
ZW5uc2lvbiBmb3IgQml0IE1hbmlwdWxhdGlvbi4KPiA+Pj4gQiBpcyBtYW5kYXRvcnkgZm9yIFJW
QTIzVTY0Lgo+ID4+Pgo+ID4+PiBUaGUgQiBleHRlbnNpb24gaXMgcmF0aWZpZWQgaW4gdGhlIDIw
MjQwNDExIHZlcnNpb24gb2YgdGhlIHVucHJpdmlsZWdlZAo+ID4+PiBJU0Egc3BlY2lmaWNhdGlv
bi4gQWNjb3JkaW5nIHRvIHRoZSByYXRpZmllZCBzcGVjLCAidGhlIEIgc3RhbmRhcmQKPiA+Pj4g
ZXh0ZW5zaW9uIGNvbXByaXNlcyBpbnN0cnVjdGlvbnMgcHJvdmlkZWQgYnkgdGhlIFpiYSwgWmJi
LCBhbmQgWmJzCj4gPj4+IGV4dGVuc2lvbnMuCj4gPj4+Cj4gPj4+IEhlbmNlIGFkZCBhIHNjaGVt
YSBjaGVjayBydWxlIHRvIGVuZm9yY2UgdGhhdCBCIGltcGxpZXMgWmJhLCBaYmIgYW5kIFpicy4K
PiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogR3VvZG9uZyBYdSA8Z3VvZG9uZ0ByaXNjc3Rhci5j
b20+Cj4gPj4+IC0tLQo+ID4+PiB2MjogTmV3IHBhdGNoLgo+ID4+PiAtLS0KPiA+Pj4gICAuLi4v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgICAgICAgICB8IDE5ICsr
KysrKysrKysrKysrKysrKysKPiA+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygr
KQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPiA+Pj4gaW5kZXggNTY1Y2IyY2JiNDliNTUyOTU5
MzkyODEwYTliNzMxYjQzMzQ2YTU5NC4uMzg1ZTFkZWIyMzk5NmQyOTRlNzY2MjY5M2YxMjU3Zjkx
MGE2ZTEyOSAxMDA2NDQKPiA+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+ID4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gPj4+IEBAIC0xMDksNiArMTA5
LDEzIEBAIHByb3BlcnRpZXM6Cj4gPj4+ICAgICAgICAgICAgICAgVGhlIHN0YW5kYXJkIEMgZXh0
ZW5zaW9uIGZvciBjb21wcmVzc2VkIGluc3RydWN0aW9ucywgYXMgcmF0aWZpZWQgaW4KPiA+Pj4g
ICAgICAgICAgICAgICB0aGUgMjAxOTEyMTMgdmVyc2lvbiBvZiB0aGUgdW5wcml2aWxlZ2VkIElT
QSBzcGVjaWZpY2F0aW9uLgo+ID4+Pgo+ID4+PiArICAgICAgICAtIGNvbnN0OiBiCj4gPj4+ICsg
ICAgICAgICAgZGVzY3JpcHRpb246Cj4gPj4+ICsgICAgICAgICAgICBUaGUgc3RhbmRhcmQgQiBl
eHRlbnNpb24gZm9yIGJpdCBtYW5pcHVsYXRpb24gaW5zdHJ1Y3Rpb25zLCBhcwo+ID4+PiArICAg
ICAgICAgICAgcmF0aWZpZWQgaW4gdGhlIDIwMjQwNDExIHZlcnNpb24gb2YgdGhlIHVucHJpdmls
ZWdlZCBJU0EKPiA+Pj4gKyAgICAgICAgICAgIHNwZWNpZmljYXRpb24uIFRoZSBCIHN0YW5kYXJk
IGV4dGVuc2lvbiBjb21wcmlzZXMgaW5zdHJ1Y3Rpb25zCj4gPj4+ICsgICAgICAgICAgICBwcm92
aWRlZCBieSB0aGUgWmJhLCBaYmIsIGFuZCBaYnMgZXh0ZW5zaW9ucy4KPiA+Pj4gKwo+ID4+PiAg
ICAgICAgICAgLSBjb25zdDogdgo+ID4+PiAgICAgICAgICAgICBkZXNjcmlwdGlvbjoKPiA+Pj4g
ICAgICAgICAgICAgICBUaGUgc3RhbmRhcmQgViBleHRlbnNpb24gZm9yIHZlY3RvciBvcGVyYXRp
b25zLCBhcyByYXRpZmllZAo+ID4+PiBAQCAtNzM1LDYgKzc0MiwxOCBAQCBwcm9wZXJ0aWVzOgo+
ID4+PiAgICAgICAgICAgdGhlbjoKPiA+Pj4gICAgICAgICAgICAgY29udGFpbnM6Cj4gPj4+ICAg
ICAgICAgICAgICAgY29uc3Q6IGYKPiA+Pj4gKyAgICAgICMgYiBjb21wcmlzZXMgdGhlIGZvbGxv
d2luZyBleHRlbnNpb25zCj4gPj4+ICsgICAgICAtIGlmOgo+ID4+PiArICAgICAgICAgIGNvbnRh
aW5zOgo+ID4+PiArICAgICAgICAgICAgY29uc3Q6IGIKPiA+Pgo+ID4+IFdoYXQncyB0aGUgdmFs
dWUgaW4gYWRkaW5nIGIsIGlmIGl0IGRlcGVuZHMgb24gaGF2aW5nIGFsbCAzIG9mIHRoZQo+ID4+
IGNvbXBvbmVudHMgZGVmaW5lZCBpbmRpdmlkdWFsbHkgdG9vPyBDdXJyZW50bHkgYWxsICJzdXBl
cnNldCIgdHlwZXMgb2YKPiA+PiBleHRlbnNpb25zIGFyZSBwZXJtaXR0ZWQgd2l0aG91dCB0aGVp
ciBjb21wb25lbnQgcGFydHMgYWxzbyBiZWluZyBkZWZpbmVkLAo+ID4+IHRoaXMgZG9lc24ndCBm
b2xsb3cgY29udmVudGlvbiBhbmQgdGhlcmVmb3JlIG5lZWRzIHRvIGJlIGV4cGxhaW5lZC4KPiA+
Pgo+ID4+IFlvdSBvYnZpb3VzbHkgbmVlZCB0aGlzIGNvbnN0cnVjdCBiZWNhdXNlIHRoZSBrZXJu
ZWwgZG9lcyBub3QgdW5kZXJzdGFuZAo+ID4+ICJiIiwgYW5kIGV2ZW4gaWYgeW91IGFkZGVkIHN1
cHBvcnQgZm9yIGludGVycHJldGluZyAiYiIgdG8gdGhlIGtlcm5lbAo+ID4+IHRoaXMgaXMgcHJv
YmFibHkgc3RpbGwgbmVlZGVkIHRvIG1ha2Ugc3VyZSB0aGUgQUJJIGlzIG1haW50YWluZWQgZm9y
Cj4gPj4gYW55dGhpbmcgaW1wb3J0aW5nIGEgZGV2aWNldHJlZSBmcm9tIHRoZSBrZXJuZWwuCj4g
Pgo+ID4gWWVzLCBleGFjdGx5LiBVbmxpa2Ugb3RoZXIgc2luZ2xlLWxldHRlciBleHRlbnNpb25z
LCAiYiIgd2FzIHJhdGlmaWVkCj4gPiAoQXByLzIwMjQpIG11Y2ggbGF0ZXIgdGhhbiBpdHMgY29t
cG9uZW50cyB6YmEvemJiL3picyAoSnVuLzIwMjEpLgo+ID4gRXhpc3Rpbmcgc29mdHdhcmUgYW5k
IHRoZSBrZXJuZWwgYWxyZWFkeSBleHBlY3QgdGhlc2UgZXhwbGljaXQgY29tcG9uZW50Cj4gPiBz
dHJpbmdzLCBzbyBlbmZvcmNpbmcgdGhpcyBkZXBlbmRlbmN5IGVuc3VyZXMgY29yZXMgZGVjbGFy
aW5nICJiIiB3aWxsCj4gPiBhbHNvIGJlIGNvcnJlY3RseSB1bmRlcnN0b29kIGJ5IG9sZGVyIHNv
ZnR3YXJlIHRoYXQgb25seSBsb29rcyBmb3IKPiA+IHpiYS96YmIvemJzLgo+Cj4gSSBtaWdodCBi
ZSBtaXN1bmRlcnN0YW5kaW5nIHlvdSwgYnV0IEkgZG9uJ3QgdGhpbmsgZXh0ZW5zaW9uICJiIgo+
IHNob3VsZCAqcmVxdWlyZSogdGhlIG90aGVyIHRocmVlIGV4dGVuc2lvbnMuICBJbnN0ZWFkLCB0
aGUgImIiCj4gZXh0ZW5zaW9uIHNob3VsZCBiZSBjb25zaWRlcmVkICplcXVpdmFsZW50KiB0byB0
aGUgb3RoZXIgdGhyZWUuCgpZb3UgYXJlIGNvcnJlY3QgaW4gc2F5aW5nIHRoZXkgYXJlIGVxdWl2
YWxlbnQuCgo+IFRoYXQncyB3aGF0IEkgdW5kZXJzdGFuZCBpdCB0byBtZWFuLCBhbnl3YXkuCj4g
ICAgaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWIKPgo+IFRoZXJlJ3Mgbm8gcG9pbnQg
aW4gc3VwcG9ydGluZyAiYiIgaW4gZGV2aWNldHJlZSB0byByZXByZXNlbnQKPiB0aGUgb3RoZXJz
IGlmIGl0IGFsc28gcmVxdWlyZXMgdGhlIG90aGVycyB0byBiZSBwcmVzZW50Lgo+Cj4gSSB0aGlu
ayB0aGF0LCBpbnN0ZWFkLCAiYiIsICJ6YmEiLCAiemJiIiwgYW5kICJ6YnMiIHNob3VsZCBhbGwK
PiBiZSBhbGxvd2VkLgo+Cj4gSSBtaWdodCBldmVuIGdvIGZ1cnRoZXIgYW5kIGhhcmRlbiB0aGUg
cmVxdWlyZW1lbnQsIHNheWluZyB0aGF0Cj4gaWYgeW91IHNwZWNpZnkgImIiIHlvdSBzaG91bGQg
Km5vdCogc3BlY2lmeSAiemJhIiwgInpiYiIsIG9yICJ6YnMiLgoKSGlzdG9yaWNhbCByZWFzb25z
IGhlcmUuICJiIiBjYW1lIHRvbyBsYXRlLiBUaGUgY2hpcCB2ZW5kb3JzIGhhdmUgcHVibGlzaGVk
CmNvcmVzIHdpdGggInpiYSIsICJ6YmIiLCBhbmQgInpicyJhbHJlYWR5LgoKVGhhdCdzIGEgbWln
cmF0aW9uIGJyaWRnZSB0byByZXF1aXJlICJiIiBtdXN0IGJlIGxpc3RlZAp0b2dldGhlciB3aXRo
IHRoZSBvdGhlciB0aHJlZS4KCkJSLApHdW9kb25nCgo+IEJ1dCB0aGF0IG1pZ2h0IG5vdCBiZSBu
b3JtYWwgcHJhY3RpY2UsIGFuZCBpdCdzIG5vdCBuZWNlc3NhcnkKPiBiZWNhdXNlIHRoZXkgYXJl
bid0IGluIGNvbmZsaWN0Lgo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC1BbGV4Cj4KPiA+IEkgd2lsbCB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlIGluIHYzIHRv
IGNsZWFybHkgZXhwbGFpbiB0aGlzIHJlYXNvbmluZy4KPiA+IERvZXMgaXQgc291bmQgZ29vZCB0
byB5b3U/Cj4gPgo+ID4gVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3Lgo+ID4KPiA+IEJSLAo+ID4g
R3VvZG9uZyBYdQo+ID4KPiA+Pgo+ID4+PiArICAgICAgICB0aGVuOgo+ID4+PiArICAgICAgICAg
IGFsbE9mOgo+ID4+PiArICAgICAgICAgICAgLSBjb250YWluczoKPiA+Pj4gKyAgICAgICAgICAg
ICAgICBjb25zdDogemJhCj4gPj4+ICsgICAgICAgICAgICAtIGNvbnRhaW5zOgo+ID4+PiArICAg
ICAgICAgICAgICAgIGNvbnN0OiB6YmIKPiA+Pj4gKyAgICAgICAgICAgIC0gY29udGFpbnM6Cj4g
Pj4+ICsgICAgICAgICAgICAgICAgY29uc3Q6IHpicwo+ID4+PiAgICAgICAgICMgWmNiIGRlcGVu
ZHMgb24gWmNhCj4gPj4+ICAgICAgICAgLSBpZjoKPiA+Pj4gICAgICAgICAgICAgY29udGFpbnM6
Cj4gPj4+Cj4gPj4+IC0tCj4gPj4+IDIuNDMuMAo+ID4+Pgo+ID4KPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
