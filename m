Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFD9C54791
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 07:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TP+5rOoaeDwjyagKirScbwLqftGClfNQhBzay9m+vcA=; b=SZ6PXkzp/ToQFu
	9JTbkZfeF3O6gTcGAQjae5IbMwJh5bOlvnFLFzdyq7f07woeOiWHAnz2nYcVhJ5/svUgbsvupFSgH
	bagXUdHeZ8juav1AKmGHtxn7rNICwopb0nF83K5Dqirm60Zo2xS109pWqB1Pjhk8ne5DR7fCk1FTj
	vk/XyB0+eimd76I19xuQEyWVXWJdC39te6EpczprIFJCtukSGITYssiDpjymu5MSv5chR1IVq3HK/
	7QwacBbRRMMzveAl5B3Ku8Ryo98r+jl1Qzvzd7uqPZ8PNuOMtxjRgPxTnPJH92UBOXBzpHCXdbHa/
	cAWnV8PTKxIuRs6IWEmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkIfb-000000097r4-3ZsZ;
	Wed, 13 Mar 2024 07:04:59 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkIfZ-000000097qQ-0sRy
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 07:04:58 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-db3a09e96daso5424410276.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Mar 2024 00:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710313495; x=1710918295; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23iwWUZrjK0uVCzWGrozLYPj1RLPGp+w74J65VD/jJw=;
        b=W4xx0xLQTH++u5ORBDjVt4eGCD+bhaP/kUb14f2aycB+b7XFBkuhFU0ggna/mcHB1d
         EQARQMnZ0B/aR6+eDZ7oRrQCOcmqk6gt9JzD1Bo4VarHvQI98EbAV6H9wt5wuw9HKRt7
         MeG8tLEvU7Eet8YN21gO52/OWqfzOpaEB6QKwzfPZuNU/kbXZKoMKlET5clnUP7Q3s5w
         ZRgrjhcXpKfDdF17fshKah1sTHJRk8XYiiU6vhGTUe5wrD05Muy121vIP17hcuLiz+c3
         BlFJukP+7Y2k7aBSpUSQRy2SGniIdwWuKBWkO4y3IjgfFUWhNYlbcbDeqKwC4dmpWSZC
         eCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710313495; x=1710918295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23iwWUZrjK0uVCzWGrozLYPj1RLPGp+w74J65VD/jJw=;
        b=LkfFrDRU0TOWPbel+OelniEsu0btphEeEiuoRjfNmFkDKceNUFzIU4QY5R84e92g6e
         sDrJRhgvxN5G8S8rnoDnVUI50OzDaZcUZP3C07a9KqDOnTPkHzi/20r9Z3jUV8aKfAZ+
         ycD3VlPMI+9vixErUylTsSrGuP3LC7j29tF2K85SHNs75z+ASS/RRRHBRq1V6hopqiws
         tQ875HY3ScJDqXZNUv5T1bydIYfVGmTzFkh1PVD1PUGVpCAbtSIha/LxBwFwbYY3qnZd
         +GcmR5+ZxGAiIH41A6Bx7R+9NyR9jzftI5i0UjkFzux8baDqDfHVNhgYyGQqI5gkAjVd
         J3eA==
X-Gm-Message-State: AOJu0YwJnwt7rp++VS5WffX42AQHODoO8ibA23uwZrDps4Zi2J/aTKsJ
	Z512E8ltCDbQr/f0W6RPQsknnTkFtMgqJihXswFUwgpsQJ/RUel1XYgM4Xb57QRFVyXIF4BMQU3
	OfQeddsOhj+Z3jFchDcVnZ20cXvvizljUxIY2xg==
X-Google-Smtp-Source: AGHT+IENRH7CxODCmI4xmFH3RzGGjRXZk3DtZOylOwajqdNTbtP599gJ7j2O9tA6gHHIXD8vrl3AZ/1ugtvHc9NEMu8=
X-Received: by 2002:a25:d349:0:b0:dcd:38f9:f78 with SMTP id
 e70-20020a25d349000000b00dcd38f90f78mr1640902ybf.29.1710313494755; Wed, 13
 Mar 2024 00:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240312123627.9285-1-andy.chiu@sifive.com> <20240312123627.9285-5-andy.chiu@sifive.com>
 <20240312-follow-catnap-7fdfa9cb9531@spud>
In-Reply-To: <20240312-follow-catnap-7fdfa9cb9531@spud>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 13 Mar 2024 15:04:44 +0800
Message-ID: <CABgGipW-Tk1LU=zu7N6Xnrr2UUaLwGA1cW1+Qh4WWWqshGFH6A@mail.gmail.com>
Subject: Re: [v1, 4/6] riscv: cpufeature: add zve32[xf] and zve64[xfd] isa detection
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	greentime.hu@sifive.com, guoren@linux.alibaba.com, bjorn@kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor.dooley@microchip.com>, Andrew Jones <ajones@ventanamicro.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Evan Green <evan@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Yangyu Chen <cyy@cyyself.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_000457_278055_496BE85D 
X-CRM114-Status: GOOD (  21.56  )
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

T24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgOTowNeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1hciAxMiwgMjAyNCBhdCAwODozNjoyNVBNICsw
ODAwLCBBbmR5IENoaXUgd3JvdGU6Cj4gPiBNdWx0aXBsZSBWZWN0b3Igc3ViZXh0ZW5zaW9ucyBh
cmUgYWRkZWQuIEFsc28sIHRoZSBwYXRjaCB0YWtlcyBjYXJlIG9mCj4gPiB0aGUgZGVwZW5kZW5j
aWVzIG9mIFZlY3RvciBzdWJleHRlbnNpb25zIGJ5IG1hY3JvIGV4cGFuc2lvbnMuIFNvLCBpZgo+
ID4gc29tZSAiZW1iZWRkZWQiIHBsYXRmb3JtIG9ubHkgcmVwb3J0cyAienZlNjRmIiBvbiB0aGUg
SVNBIHN0cmluZywgdGhlCj4gPiBwYXJzZXIgaXMgYWJsZSB0byBleHBhbmQgaXQgdG8genZlMzJ4
IHp2ZTMyZiB6dmU2NHggYW5kIHp2ZTY0Zi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IENo
aXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgo+Cj4gVGhlc2UgbmV3IGV4dGVuc2lvbnMgbmVlZCB0
byBiZSBhZGRlZCB0byB0aGUgZHQtYmluZGluZ3MuCgpJIGFtIGFkZGluZyBhIHBhdGNoIGZvciBk
dC1iaW5kaW5nIGFmdGVyIHRoaXMgaW4gdjIuCgo+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2h3Y2FwLmggfCAgNSArKysrKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZl
YXR1cmUuYyB8IDQxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiA+ICAyIGZp
bGVzIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9od2NhcC5oCj4gPiBpbmRleCA1MzQwZjgxODc0NmIuLjI0ZWZlYTQ0ZjFhYiAxMDA2
NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+ID4gKysrIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gPiBAQCAtODAsNiArODAsMTEgQEAKPiA+ICAj
ZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkZBICAgICAgICAgICAgNzEKPiA+ICAjZGVmaW5lIFJJU0NW
X0lTQV9FWFRfWlRTTyAgICAgICAgICAgNzIKPiA+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkFD
QVMgICAgICAgICAgNzMKPiA+ICsjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZFMzJYICAgICAgICAg
NzQKPiA+ICsjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZFMzJGICAgICAgICAgNzUKPiA+ICsjZGVm
aW5lIFJJU0NWX0lTQV9FWFRfWlZFNjRYICAgICAgICAgNzYKPiA+ICsjZGVmaW5lIFJJU0NWX0lT
QV9FWFRfWlZFNjRGICAgICAgICAgNzcKPiA+ICsjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZFNjRE
ICAgICAgICAgNzgKPiA+Cj4gPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX01BWCAgICAgICAgICAg
IDEyOAo+ID4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9JTlZBTElEICAgICAgICAgICAgICAgIFUz
Ml9NQVgKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+IGluZGV4IDg5ODZjZWI1ODE4OC4uM2Fh
MGRmM2YzYjQxIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5j
Cj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+IEBAIC0yMDEsNiAr
MjAxLDQwIEBAIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgcmlzY3ZfenZiYl9leHRzW10gPSB7
Cj4gPiAgICAgICBSSVNDVl9JU0FfRVhUX1pWS0IKPiA+ICB9Owo+ID4KPiA+ICsjZGVmaW5lIFJJ
U0NWX0lTQV9FWFRfWlZFMzJGX0lNUExZX0xJU1QgICAgICBcCj4gPiArICAgICBSSVNDVl9JU0Ff
RVhUX1pWRTMyRiwgICAgICAgICAgIFwKPiA+ICsgICAgIFJJU0NWX0lTQV9FWFRfWlZFMzJYLAo+
ID4gKwo+ID4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVkU2NEZfSU1QTFlfTElTVCAgICAgIFwK
PiA+ICsgICAgIFJJU0NWX0lTQV9FWFRfWlZFNjRGLCAgICAgICAgICAgXAo+ID4gKyAgICAgUklT
Q1ZfSVNBX0VYVF9aVkU2NFgsICAgICAgICAgICBcCj4gPiArICAgICBSSVNDVl9JU0FfRVhUX1pW
RTMyRl9JTVBMWV9MSVNUCj4gPiArCj4gPiArI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWRTY0RF9J
TVBMWV9MSVNUICAgICAgXAo+ID4gKyAgICAgUklTQ1ZfSVNBX0VYVF9aVkU2NEQsICAgICAgICAg
ICBcCj4gPiArICAgICBSSVNDVl9JU0FfRVhUX1pWRTY0Rl9JTVBMWV9MSVNUCj4gPiArCj4gPiAr
c3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCByaXNjdl96dmUzMmZfZXh0c1tdID0gewo+ID4gKyAg
ICAgUklTQ1ZfSVNBX0VYVF9aVkUzMkZfSU1QTFlfTElTVAo+ID4gK307Cj4gPiArCj4gPiArc3Rh
dGljIGNvbnN0IHVuc2lnbmVkIGludCByaXNjdl96dmU2NGZfZXh0c1tdID0gewo+ID4gKyAgICAg
UklTQ1ZfSVNBX0VYVF9aVkU2NEZfSU1QTFlfTElTVAo+ID4gK307Cj4gPiArCj4gPiArc3RhdGlj
IGNvbnN0IHVuc2lnbmVkIGludCByaXNjdl96dmU2NGRfZXh0c1tdID0gewo+ID4gKyAgICAgUklT
Q1ZfSVNBX0VYVF9aVkU2NERfSU1QTFlfTElTVAo+ID4gK307Cj4gPiArCj4gPiArc3RhdGljIGNv
bnN0IHVuc2lnbmVkIGludCByaXNjdl96dmU2NHhfZXh0c1tdID0gewo+ID4gKyAgICAgUklTQ1Zf
SVNBX0VYVF9aVkUzMlgsCj4gPiArICAgICBSSVNDVl9JU0FfRVhUX1pWRTY0WAo+ID4gK307Cj4g
PiArCj4gPiArc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCByaXNjdl92X2V4dHNbXSA9IHsKPiA+
ICsgICAgIFJJU0NWX0lTQV9FWFRfWlZFNjREX0lNUExZX0xJU1QKPiA+ICt9Owo+ID4gKwo+ID4g
IC8qCj4gPiAgICogVGhlIGNhbm9uaWNhbCBvcmRlciBvZiBJU0EgZXh0ZW5zaW9uIG5hbWVzIGlu
IHRoZSBJU0Egc3RyaW5nIGlzIGRlZmluZWQgaW4KPiA+ICAgKiBjaGFwdGVyIDI3IG9mIHRoZSB1
bnByaXZpbGVnZWQgc3BlY2lmaWNhdGlvbi4KPiA+IEBAIC0yNDgsNyArMjgyLDcgQEAgY29uc3Qg
c3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7Cj4gPiAgICAgICBf
X1JJU0NWX0lTQV9FWFRfREFUQShkLCBSSVNDVl9JU0FfRVhUX2QpLAo+ID4gICAgICAgX19SSVND
Vl9JU0FfRVhUX0RBVEEocSwgUklTQ1ZfSVNBX0VYVF9xKSwKPiA+ICAgICAgIF9fUklTQ1ZfSVNB
X0VYVF9EQVRBKGMsIFJJU0NWX0lTQV9FWFRfYyksCj4gPiAtICAgICBfX1JJU0NWX0lTQV9FWFRf
REFUQSh2LCBSSVNDVl9JU0FfRVhUX3YpLAo+ID4gKyAgICAgX19SSVNDVl9JU0FfRVhUX1NVUEVS
U0VUKHYsIFJJU0NWX0lTQV9FWFRfdiwgcmlzY3Zfdl9leHRzKSwKPiA+ICAgICAgIF9fUklTQ1Zf
SVNBX0VYVF9EQVRBKGgsIFJJU0NWX0lTQV9FWFRfaCksCj4gPiAgICAgICBfX1JJU0NWX0lTQV9F
WFRfREFUQSh6aWNib20sIFJJU0NWX0lTQV9FWFRfWklDQk9NKSwKPiA+ICAgICAgIF9fUklTQ1Zf
SVNBX0VYVF9EQVRBKHppY2JveiwgUklTQ1ZfSVNBX0VYVF9aSUNCT1opLAo+ID4gQEAgLTI4Myw2
ICszMTcsMTEgQEAgY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0
W10gPSB7Cj4gPiAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQSh6dHNvLCBSSVNDVl9JU0FfRVhU
X1pUU08pLAo+ID4gICAgICAgX19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUKHp2YmIsIFJJU0NWX0lT
QV9FWFRfWlZCQiwgcmlzY3ZfenZiYl9leHRzKSwKPiA+ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9E
QVRBKHp2YmMsIFJJU0NWX0lTQV9FWFRfWlZCQyksCj4gPiArICAgICBfX1JJU0NWX0lTQV9FWFRf
U1VQRVJTRVQoenZlMzJmLCBSSVNDVl9JU0FfRVhUX1pWRTMyRiwgcmlzY3ZfenZlMzJmX2V4dHMp
LAo+ID4gKyAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoenZlMzJ4LCBSSVNDVl9JU0FfRVhUX1pW
RTMyWCksCj4gPiArICAgICBfX1JJU0NWX0lTQV9FWFRfU1VQRVJTRVQoenZlNjRmLCBSSVNDVl9J
U0FfRVhUX1pWRTY0RiwgcmlzY3ZfenZlNjRmX2V4dHMpLAo+ID4gKyAgICAgX19SSVNDVl9JU0Ff
RVhUX1NVUEVSU0VUKHp2ZTY0ZCwgUklTQ1ZfSVNBX0VYVF9aVkU2NEQsIHJpc2N2X3p2ZTY0ZF9l
eHRzKSwKPiA+ICsgICAgIF9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVCh6dmU2NHgsIFJJU0NWX0lT
QV9FWFRfWlZFNjRYLCByaXNjdl96dmU2NHhfZXh0cyksCj4gPiAgICAgICBfX1JJU0NWX0lTQV9F
WFRfREFUQSh6dmZoLCBSSVNDVl9JU0FfRVhUX1pWRkgpLAo+ID4gICAgICAgX19SSVNDVl9JU0Ff
RVhUX0RBVEEoenZmaG1pbiwgUklTQ1ZfSVNBX0VYVF9aVkZITUlOKSwKPiA+ICAgICAgIF9fUklT
Q1ZfSVNBX0VYVF9EQVRBKHp2a2IsIFJJU0NWX0lTQV9FWFRfWlZLQiksCj4gPiAtLQo+ID4gMi4x
Ny4xCj4gPgo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+IGxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YKClRoYW5rcyEKQW5keQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
