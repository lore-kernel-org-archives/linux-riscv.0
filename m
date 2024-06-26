Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFB2C3064D
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 15:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E/lcyBuDWpgrjtLZM5/Ik/gR+ExyeNl6h+aoedv/MRg=; b=R8N1QC7kEtD81u
	K/qu1hKdKiEBqPuJm3rpasqnkhuWPArtcxT+VYYPTZXBCSzNdEfI4xHCa5bIIMLSiSNR0A9bTMqLV
	msWYvQDydjfh5VV5dfHL9DDLIPZWM3G0dibNBDinJ4nl93JWEL4VpGNmvy+2Ji9KRPU25aDQMLbgj
	RTTiabn0D4eXWuy5Bk8wftXxuJHAKS7PBpZiLMgj0bUSL3gqHQtdGJSuBVcdpD8llrnfkMWuIglli
	D/K9Lg/jbdLBKF2SJD3tuH5NT4lgXD7K9HEEjXWYtJIVkWh5nir/Yb7fbf9RuNLb1/4lGjGkHIGjO
	ayYiuuF3fv6aa9BeJn3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMUpe-00000007Rx4-0S5P;
	Wed, 26 Jun 2024 15:45:14 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMUpb-00000007Rvp-3q3p
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 15:45:13 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so107802971fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 08:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719416709; x=1720021509; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbWm8cqE0oE3vKB/XJ40+CrH2tyCa/GZQ7NMjRIgGSc=;
        b=AQ86FfrBAgrL6BtwfWaBRPqGGDnm/xoUVWEz59N+hZBkWJbw2t6rDv2OKRqhPuOf7E
         AEd5AKT/DQ4EMTOxvqxE328TXdIfdn0y+rB/U1WT+PBE9aO/87/K05qIZhPNgDB+Bwai
         ob/YVJzEhunVjAMsegLSX1D79mGxMJDb0uza7LtOKpvL34L/w6h334uNIQmlw5U8aXrq
         BTlZhBCwilA3l4KXHhYoc4CVp7s6EHXzIwwLGG4CWHeXvRQ6vDKI+s4beoEUQqE5O6jQ
         ju4SGrrESSXy62ydY6R3ghw3Z3GDDNJj+hqMftcPzAyEteiBoKZg9jZhlmgY7iTpSpyp
         IsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719416710; x=1720021510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbWm8cqE0oE3vKB/XJ40+CrH2tyCa/GZQ7NMjRIgGSc=;
        b=E6D6YcHQyCAuDTilsq0dZLwBcBSGMx7IylzaaEjpoFGOlriJ5aUE14OhTUqSnfaolo
         XRtc3BzthXtZaJOf7KVyTIv39NeFbuQlDikocwoHJBvCIogYCHNQiT308+MrlvmbhUMO
         OFfjzyvUMWqfMUophGqkpTzA7DcptMRFtqdTSryQn+Kz9UzLcpKmEOwzLcF5ddAgcBOF
         /4EEjSJXHAkRjlTYOoAcyKG/3mXgfYg4UTAzcsLHLD9joF5fT1YZzrJkdYUb9ikZ6DD/
         ROB8GK2meggDls8U93qsGLp9Kj7+3c0LnUV65iqzZh6mH8YR/gvpAJ9Wm70mvkLX/nb8
         zo6A==
X-Forwarded-Encrypted: i=1; AJvYcCW1/v3I1kMUh2L8u4+6yZd6wz95NPYvAKloq5RCyDt1UuzEJhqi+nzolJNSx0UiiUyVrPFYKi8v4RoNj/B07NKHH55+6nGVlTpO8z3YoLq4
X-Gm-Message-State: AOJu0YySYplNb5QTlxTTzC3IeJZ9eiPZNMbBNcvvzBAgspnmsobDyBtr
	SnsAVhLNWV4o5nDrQmi3v7z2sTNRNN4abIqx/gbHKq0XTxUhATWXUI+TJ9HfHzC9Kkrk8mlD6OG
	dfky8H8HVtaxMATINPTY1opKgEr4mV1qmYt64uQ==
X-Google-Smtp-Source: AGHT+IEjXKzu6GdnHpvC2XZ82qS8kZJyBd0JNRnPe8Oday4QWzxFjQqHYSizzqD4CkgJRyGLJvUbzx2STfJIVw12W/A=
X-Received: by 2002:a2e:8416:0:b0:2ec:4397:5ce7 with SMTP id
 38308e7fff4ca-2ec5b31d0e0mr72977401fa.39.1719416709468; Wed, 26 Jun 2024
 08:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240625165121.2160354-1-evan@rivosinc.com> <20240625165121.2160354-3-evan@rivosinc.com>
 <20240625-kindle-sanitizer-c52b48ed9b86@spud> <CALs-HsuEc9ympGsQP3bvXaowiAj0bq3nvD=9CcX0NNMza+79OA@mail.gmail.com>
 <20240626-ungraded-legend-65480eabd255@spud>
In-Reply-To: <20240626-ungraded-legend-65480eabd255@spud>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 26 Jun 2024 08:44:33 -0700
Message-ID: <CALs-HsuCu-C04vnGRV69S4TQx_URZGmKRbK+ekARR6ZM_SNVHg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] RISC-V: hwprobe: Add SCALAR to misaligned perf defines
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Ben Dooks <ben.dooks@codethink.co.uk>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Costa Shulyupin <costa.shul@redhat.com>, 
	Erick Archer <erick.archer@gmx.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_084512_133571_64437A1E 
X-CRM114-Status: GOOD (  35.67  )
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

T24gV2VkLCBKdW4gMjYsIDIwMjQgYXQgNzozNOKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1biAyNSwgMjAyNCBhdCAxMjowODowOVBNIC0w
NzAwLCBFdmFuIEdyZWVuIHdyb3RlOgo+ID4gT24gVHVlLCBKdW4gMjUsIDIwMjQgYXQgMTE6MzXi
gK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBP
biBUdWUsIEp1biAyNSwgMjAyNCBhdCAwOTo1MToyMUFNIC0wNzAwLCBFdmFuIEdyZWVuIHdyb3Rl
Ogo+ID4gPiA+IEluIHByZXBhcmF0aW9uIGZvciBtaXNhbGlnbmVkIHZlY3RvciBwZXJmb3JtYW5j
ZSBod3Byb2JlIGtleXMsIHJlbmFtZQo+ID4gPiA+IHRoZSBod3Byb2JlIGtleSB2YWx1ZXMgYXNz
b2NpYXRlZCB3aXRoIG1pc2FsaWduZWQgc2NhbGFyIGFjY2Vzc2VzIHRvCj4gPiA+ID4gaW5jbHVk
ZSB0aGUgdGVybSBTQ0FMQVIuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBFdmFuIEdy
ZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KPiA+ID4gPgo+ID4gPiA+IC0tLQo+ID4gPiA+Cj4gPiA+
ID4gQ2hhbmdlcyBpbiB2MjoKPiA+ID4gPiAgLSBBZGRlZCBwYXRjaCB0byByZW5hbWUgbWlzYWxp
Z25lZCBwZXJmIGtleSB2YWx1ZXMgKFBhbG1lcikKPiA+ID4gPgo+ID4gPiA+ICBEb2N1bWVudGF0
aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgICAgICAgfCAyMCArKysrKysrKysrLS0tLS0tLS0t
LQo+ID4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oICAgICAgfCAx
MCArKysrKy0tLS0tCj4gPiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgICAg
ICAgICAgICB8IDEwICsrKysrLS0tLS0KPiA+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNf
bWlzYWxpZ25lZC5jICAgICAgIHwgIDYgKysrLS0tCj4gPiA+ID4gIGFyY2gvcmlzY3Yva2VybmVs
L3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYyB8IDEyICsrKysrKy0tLS0tLQo+ID4gPiA+ICA1IGZp
bGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQo+ID4gPiA+Cj4g
PiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCBi
L0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+ID4gPiA+IGluZGV4IGM5ZjU3
MGIxYWI2MC4uODNmN2YzYzEzNDdmIDEwMDY0NAo+ID4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24v
YXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vYXJjaC9y
aXNjdi9od3Byb2JlLnJzdAo+ID4gPiA+IEBAIC0yMTUsMjIgKzIxNSwyMiBAQCBUaGUgZm9sbG93
aW5nIGtleXMgYXJlIGRlZmluZWQ6Cj4gPiA+ID4gICAgdGhlIHBlcmZvcm1hbmNlIG9mIG1pc2Fs
aWduZWQgc2NhbGFyIHdvcmQgYWNjZXNzZXMgb24gdGhlIHNlbGVjdGVkIHNldCBvZgo+ID4gPiA+
ICAgIHByb2Nlc3NvcnMuCj4gPiA+ID4KPiA+ID4gPiAtICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BS
T0JFX01JU0FMSUdORURfVU5LTk9XTmA6IFRoZSBwZXJmb3JtYW5jZSBvZiBtaXNhbGlnbmVkCj4g
PiA+ID4gLSAgICBhY2Nlc3NlcyBpcyB1bmtub3duLgo+ID4gPiA+ICsgICogOmM6bWFjcm86YFJJ
U0NWX0hXUFJPQkVfTUlTQUxJR05FRF9TQ0FMQVJfVU5LTk9XTmA6IFRoZSBwZXJmb3JtYW5jZSBv
Zgo+ID4gPiA+ICsgICAgbWlzYWxpZ25lZCBhY2Nlc3NlcyBpcyB1bmtub3duLgo+ID4gPiA+Cj4g
PiA+ID4gLSAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVEYDog
TWlzYWxpZ25lZCBhY2Nlc3NlcyBhcmUKPiA+ID4gPiArICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BS
T0JFX01JU0FMSUdORURfU0NBTEFSX0VNVUxBVEVEYDogTWlzYWxpZ25lZCBhY2Nlc3NlcyBhcmUK
PiA+ID4gPiAgICAgIGVtdWxhdGVkIHZpYSBzb2Z0d2FyZSwgZWl0aGVyIGluIG9yIGJlbG93IHRo
ZSBrZXJuZWwuICBUaGVzZSBhY2Nlc3NlcyBhcmUKPiA+ID4gPiAgICAgIGFsd2F5cyBleHRyZW1l
bHkgc2xvdy4KPiA+ID4gPgo+ID4gPiA+IC0gICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfTUlT
QUxJR05FRF9TTE9XYDogTWlzYWxpZ25lZCB3b3JkIGFjY2Vzc2VzIGFyZQo+ID4gPiA+IC0gICAg
c2xvd2VyIHRoYW4gZXF1aXZhbGVudCBieXRlIGFjY2Vzc2VzLiAgTWlzYWxpZ25lZCBhY2Nlc3Nl
cyBtYXkgYmUgc3VwcG9ydGVkCj4gPiA+ID4gLSAgICBkaXJlY3RseSBpbiBoYXJkd2FyZSwgb3Ig
dHJhcHBlZCBhbmQgZW11bGF0ZWQgYnkgc29mdHdhcmUuCj4gPiA+ID4gKyAgKiA6YzptYWNybzpg
UklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1NDQUxBUl9TTE9XYDogTWlzYWxpZ25lZCB3b3JkIGFj
Y2Vzc2VzCj4gPiA+ID4gKyAgICBhcmUgc2xvd2VyIHRoYW4gZXF1aXZhbGVudCBieXRlIGFjY2Vz
c2VzLiAgTWlzYWxpZ25lZCBhY2Nlc3NlcyBtYXkgYmUKPiA+ID4gPiArICAgIHN1cHBvcnRlZCBk
aXJlY3RseSBpbiBoYXJkd2FyZSwgb3IgdHJhcHBlZCBhbmQgZW11bGF0ZWQgYnkgc29mdHdhcmUu
Cj4gPiA+ID4KPiA+ID4gPiAtICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX01JU0FMSUdORURf
RkFTVGA6IE1pc2FsaWduZWQgd29yZCBhY2Nlc3NlcyBhcmUKPiA+ID4gPiAtICAgIGZhc3RlciB0
aGFuIGVxdWl2YWxlbnQgYnl0ZSBhY2Nlc3Nlcy4KPiA+ID4gPiArICAqIDpjOm1hY3JvOmBSSVND
Vl9IV1BST0JFX01JU0FMSUdORURfU0NBTEFSX0ZBU1RgOiBNaXNhbGlnbmVkIHdvcmQgYWNjZXNz
ZXMKPiA+ID4gPiArICAgIGFyZSBmYXN0ZXIgdGhhbiBlcXVpdmFsZW50IGJ5dGUgYWNjZXNzZXMu
Cj4gPiA+ID4KPiA+ID4gPiAtICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX01JU0FMSUdORURf
VU5TVVBQT1JURURgOiBNaXNhbGlnbmVkIGFjY2Vzc2VzIGFyZQo+ID4gPiA+IC0gICAgbm90IHN1
cHBvcnRlZCBhdCBhbGwgYW5kIHdpbGwgZ2VuZXJhdGUgYSBtaXNhbGlnbmVkIGFkZHJlc3MgZmF1
bHQuCj4gPiA+ID4gKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1NDQUxB
Ul9VTlNVUFBPUlRFRGA6IE1pc2FsaWduZWQgYWNjZXNzZXMKPiA+ID4gPiArICAgIGFyZSBub3Qg
c3VwcG9ydGVkIGF0IGFsbCBhbmQgd2lsbCBnZW5lcmF0ZSBhIG1pc2FsaWduZWQgYWRkcmVzcyBm
YXVsdC4KPiA+ID4gPgo+ID4gPiA+ICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0tFWV9aSUNC
T1pfQkxPQ0tfU0laRWA6IEFuIHVuc2lnbmVkIGludCB3aGljaAo+ID4gPiA+ICAgIHJlcHJlc2Vu
dHMgdGhlIHNpemUgb2YgdGhlIFppY2JveiBibG9jayBpbiBieXRlcy4KPiA+ID4gPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKPiA+ID4gPiBpbmRleCAyMjA3MzUzM2NlYTguLmUx
MTY4NGQ4YWUxYyAxMDA2NDQKPiA+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20vaHdwcm9iZS5oCj4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3
cHJvYmUuaAo+ID4gPiA+IEBAIC02NiwxMSArNjYsMTEgQEAgc3RydWN0IHJpc2N2X2h3cHJvYmUg
ewo+ID4gPiA+ICAjZGVmaW5lICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX0VYVF9aVkU2NEYg
ICAgICAgICgxVUxMIDw8IDQwKQo+ID4gPiA+ICAjZGVmaW5lICAgICAgICAgICAgICBSSVNDVl9I
V1BST0JFX0VYVF9aVkU2NEQgICAgICAgICgxVUxMIDw8IDQxKQo+ID4gPiA+ICAjZGVmaW5lIFJJ
U0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMCAgNQo+ID4gPiA+IC0jZGVmaW5lICAgICAgICAgICAg
ICBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5LTk9XTiAgICAgICAgMAo+ID4gPiA+IC0jZGVm
aW5lICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfRU1VTEFURUQgICAgICAg
MQo+ID4gPiA+IC0jZGVmaW5lICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX01JU0FMSUdORURf
U0xPVyAgICAgICAgICAgMgo+ID4gPiA+IC0jZGVmaW5lICAgICAgICAgICAgICBSSVNDVl9IV1BS
T0JFX01JU0FMSUdORURfRkFTVCAgICAgICAgICAgMwo+ID4gPiA+IC0jZGVmaW5lICAgICAgICAg
ICAgICBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5TVVBQT1JURUQgICAgNAo+ID4gPiA+ICsj
ZGVmaW5lICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfU0NBTEFSX1VOS05P
V04gICAgICAgICAwCj4gPiA+ID4gKyNkZWZpbmUgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVf
TUlTQUxJR05FRF9TQ0FMQVJfRU1VTEFURUQgICAgICAgIDEKPiA+ID4gPiArI2RlZmluZSAgICAg
ICAgICAgICAgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1NDQUxBUl9TTE9XICAgICAgICAgICAg
Mgo+ID4gPiA+ICsjZGVmaW5lICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX01JU0FMSUdORURf
U0NBTEFSX0ZBU1QgICAgICAgICAgICAzCj4gPiA+ID4gKyNkZWZpbmUgICAgICAgICAgICAgIFJJ
U0NWX0hXUFJPQkVfTUlTQUxJR05FRF9TQ0FMQVJfVU5TVVBQT1JURUQgICAgIDQKPiA+ID4gPiAg
I2RlZmluZSAgICAgICAgICAgICAgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX01BU0sgICAgICAg
ICAgIDcKPiA+ID4KPiA+ID4gSG93IGNvbWUgdGhlICJvbGQiIG5hbWVzIGRvIG5vdCBuZWVkIHRv
IGJlIHByZXNlcnZlZCBmb3IgdXNlcnNwYWNlPwo+ID4KPiA+IEl0IGRlcGVuZHMgb24gd2hhdCBl
eGFjdGx5IHRoZSBiaWcgdXNlcnNwYWNlIGNvbXBhdGliaWxpdHkgcnVsZSBpcy4KPiA+IFRoaXMg
cHJlc2VydmVzIGJpbmFyeSBjb21wYXRpYmlsaXR5LCB3aGljaCBJIHRoaW5rIGlzIHRoZSBiaWcg
b25lLCBidXQKPiA+IGJyZWFrcyBzb3VyY2UgY29tcGF0aWJpbGl0eSwgdGhvdWdoIHdpdGggYW4g
ZWFzeSB0cmFuc2xhdGlvbiB0byBmaXguCj4gPiBXZSBjb3VsZCBrZWVwIHRoZSBvbGQgbmFtZXMg
YXJvdW5kLCBidXQgdGhlbiBpdCBzZWVtcyBzb3J0IG9mIHNpbGx5IHRvCj4gPiBpbnRyb2R1Y2Ug
dGhlIG5ldyBuYW1lcy4gSSBpbnRyb2R1Y2VkIHRoaXMgcGF0Y2ggdXBvbiByZXF1ZXN0LCBzbyBJ
Cj4gPiBkb24ndCBwZXJzb25hbGx5IGhhdmUgYSBob3JzZSBpbiB0aGUgcmFjZSBvbiB0aGlzIG9u
ZS4KPgo+IFNvIGFwcGFyZW50bHkgdGhpcyBpc24ndCBxdWl0ZSBQYWxtZXIgYWN0dWFsbHkgd2Fu
dGVkLiBJbiB0b2RheSdzIGNhbGwKPiBoZSBzdWdnZXN0ZWQgdGhhdCBoZSdkIHNlbmQgYSBuZXcg
dmVyc2lvbiBoaW1zZWxmLCBidXQgYWxzbyB0aGF0IHdoYXQgd2UKPiBzaG91bGQgZG8gZGVmaW5l
IGEgbmV3IGtleSBmb3Igc2NhbGFyIC9hbmQvIG5ldyBhZGQgbmV3IGRlZmluZXMgdmFsdWVzIHRo
YXQKPiBjb250YWluIHRoZSB3b3JkIHNjYWxhciwgcmV0YWluaW5nIHRoZSBvbGQgZGVmaW5lcy4g
VGhlIHZhbHVlcyBjYW4gb2YKPiBjb3Vyc2UgYmUgdGhlIHNhbWUuCgpBaGgsIGdvdCBpdC4gSSdt
IGhhcHB5IHRvIHNwaW4gdGhpcy4KLUV2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
