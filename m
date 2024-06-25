Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE30C2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 19:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ybaT3V3I/T6j9mLHfCC94VbypkBwZfeAlew/3+l6Ds=; b=dgG4+P4XUi8H38
	aWc4QhTUH8RCFM3NKxbsmTEt8XEoYZ1KE6CrmJQceiW975uQXTqwH3qHrizeEO1Su4DkRAoF407Mr
	FaXx3kvy4oORIS2+qYOjpCvEz9Zx8Mm0P1tL74s33Su6Xcep7dK/MrZd1d5XB07j3gAfkbLonczQd
	gh+w2HudwN/eKu7MRLAjreRV8LP3jBRbbf+NQ3I7tTI3qSS1Oyn3xpWPifs2bIJgXGPVzUOFCgzsS
	wmtNvYzrTVVDelUWcn22SVB1gX8l1Rcx45g9Cm/NG5dytlGhVWdZvtBm87HfKF+cyBHIlj8v4qYnH
	1khqg/JHu24Y4AxkZeOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMBX9-00000004DCS-3FjZ;
	Tue, 25 Jun 2024 19:08:51 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMBX6-00000004DBg-41Sw
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 19:08:50 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a72510ebc3fso393325966b.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 12:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719342526; x=1719947326; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tL4EzYq6ilmDvWnIZB/4gWNot3CMWNGIIwPHhO9IRMw=;
        b=FNMXnggMYTdj8yVzGybetbUrbgIriW9T0ClZ/ymrt1lyDxU19NLI1iK6FiOYWvSFp8
         skhOznSn2yPgZycNuFl7v4kFBJiZ+8aETr+p2PvJ7R5lt4yicCDWVaRss1MAcl7KTpqS
         Y/qhH2/mN5alLqLdJxeF4jIXkEZg/pouwgkHc8w4V/77UwMLjDE7LvbZw1h5hNS2swvL
         CXVRxLMJraw7hiPh8tQz1amjHxGVG4jXZKayxIwbYe5lbQy30Ti7rNjDuC0x+neXk18Z
         fmuHA9j/pF3oqUXOp7X0oZAyOgEoX5gqCdTCLKQQ5bq3GOrEHTmeIm0Aek524xHF8U+n
         IKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719342526; x=1719947326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tL4EzYq6ilmDvWnIZB/4gWNot3CMWNGIIwPHhO9IRMw=;
        b=wdjENACGJ4EwA5H2ppxunasHea7W4h6aSknLxpqFJ+7HzStpfw0xFTP3ulxwllxS8Z
         2km/nY3pmoJBFezqflxiC6wTdKfJLuRITrFZrIG2sxAv7XLHN8W8VvnCaJFlo1FNMfSU
         jH1DPSAAhidQZe0edGCM9htqwv/XhfmSL/WxVmSxRYCUh8z4Mo1d4azLWPVeZSpMKxAC
         0cAfwLZhdbSydIWuhXRzzkeG05BjE9yOZ1AuoNrkW1iGypJnTitX9rBMuIWAsb/u5Han
         7kDpHsVDHWJS8KAl1d7pc3m2eiKVwnSkaJ18Vkn2KeP2LNa8s2tGaHHHNGzUNta5EuKF
         gOAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm8pedcyAyukBVGudZFiRxTsPqF4doDqYKOa1q/Gw+DfQmGRn1uNTzTId46LLxRIBDCHYyVYHqx6d+SoKF3kJQ8H/WGFDSthU5BDGOVPKD
X-Gm-Message-State: AOJu0Yzvy6Rr5cT+ANg2kW0VkHdl7Eb8StvTTEijtJQkaxNTsI1qQeU+
	4wDg3aFqf/D2SfGms7M1OrvmyH3Wvnmot6UbNmeFnRL5sDXln/bz2l4m1AV2XuTUPYaZe7sSNSN
	EdwGNQU/V+lrEATX8iUmox5rQY0DmGQMCbGkPxg==
X-Google-Smtp-Source: AGHT+IFgoo2KQUyFKVYcNQsMHt+AG7QRnWDFexuYnSapnWtKPDeO3CINuVI7rn/8LCncVw+v2sU3PjVVf3mqW28I6Oc=
X-Received: by 2002:a17:906:e52:b0:a6f:33d6:2d49 with SMTP id
 a640c23a62f3a-a7242cdb3ffmr713502166b.52.1719342526431; Tue, 25 Jun 2024
 12:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240625165121.2160354-1-evan@rivosinc.com> <20240625165121.2160354-3-evan@rivosinc.com>
 <20240625-kindle-sanitizer-c52b48ed9b86@spud>
In-Reply-To: <20240625-kindle-sanitizer-c52b48ed9b86@spud>
From: Evan Green <evan@rivosinc.com>
Date: Tue, 25 Jun 2024 12:08:09 -0700
Message-ID: <CALs-HsuEc9ympGsQP3bvXaowiAj0bq3nvD=9CcX0NNMza+79OA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240625_120849_026054_9857EDFD 
X-CRM114-Status: GOOD (  27.61  )
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

T24gVHVlLCBKdW4gMjUsIDIwMjQgYXQgMTE6MzXigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBKdW4gMjUsIDIwMjQgYXQgMDk6NTE6MjFBTSAt
MDcwMCwgRXZhbiBHcmVlbiB3cm90ZToKPiA+IEluIHByZXBhcmF0aW9uIGZvciBtaXNhbGlnbmVk
IHZlY3RvciBwZXJmb3JtYW5jZSBod3Byb2JlIGtleXMsIHJlbmFtZQo+ID4gdGhlIGh3cHJvYmUg
a2V5IHZhbHVlcyBhc3NvY2lhdGVkIHdpdGggbWlzYWxpZ25lZCBzY2FsYXIgYWNjZXNzZXMgdG8K
PiA+IGluY2x1ZGUgdGhlIHRlcm0gU0NBTEFSLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEV2YW4g
R3JlZW4gPGV2YW5Acml2b3NpbmMuY29tPgo+ID4KPiA+IC0tLQo+ID4KPiA+IENoYW5nZXMgaW4g
djI6Cj4gPiAgLSBBZGRlZCBwYXRjaCB0byByZW5hbWUgbWlzYWxpZ25lZCBwZXJmIGtleSB2YWx1
ZXMgKFBhbG1lcikKPiA+Cj4gPiAgRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0
ICAgICAgIHwgMjAgKysrKysrKysrKy0tLS0tLS0tLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUv
dWFwaS9hc20vaHdwcm9iZS5oICAgICAgfCAxMCArKysrKy0tLS0tCj4gPiAgYXJjaC9yaXNjdi9r
ZXJuZWwvc3lzX2h3cHJvYmUuYyAgICAgICAgICAgIHwgMTAgKysrKystLS0tLQo+ID4gIGFyY2gv
cmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyAgICAgICB8ICA2ICsrKy0tLQo+ID4gIGFy
Y2gvcmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYyB8IDEyICsrKysrKy0tLS0t
LQo+ID4gIDUgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMjkgZGVsZXRpb25zKC0p
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJz
dCBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+ID4gaW5kZXggYzlmNTcw
YjFhYjYwLi44M2Y3ZjNjMTM0N2YgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2FyY2gv
cmlzY3YvaHdwcm9iZS5yc3QKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3By
b2JlLnJzdAo+ID4gQEAgLTIxNSwyMiArMjE1LDIyIEBAIFRoZSBmb2xsb3dpbmcga2V5cyBhcmUg
ZGVmaW5lZDoKPiA+ICAgIHRoZSBwZXJmb3JtYW5jZSBvZiBtaXNhbGlnbmVkIHNjYWxhciB3b3Jk
IGFjY2Vzc2VzIG9uIHRoZSBzZWxlY3RlZCBzZXQgb2YKPiA+ICAgIHByb2Nlc3NvcnMuCj4gPgo+
ID4gLSAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VOS05PV05gOiBUaGUg
cGVyZm9ybWFuY2Ugb2YgbWlzYWxpZ25lZAo+ID4gLSAgICBhY2Nlc3NlcyBpcyB1bmtub3duLgo+
ID4gKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1NDQUxBUl9VTktOT1dO
YDogVGhlIHBlcmZvcm1hbmNlIG9mCj4gPiArICAgIG1pc2FsaWduZWQgYWNjZXNzZXMgaXMgdW5r
bm93bi4KPiA+Cj4gPiAtICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfRU1V
TEFURURgOiBNaXNhbGlnbmVkIGFjY2Vzc2VzIGFyZQo+ID4gKyAgKiA6YzptYWNybzpgUklTQ1Zf
SFdQUk9CRV9NSVNBTElHTkVEX1NDQUxBUl9FTVVMQVRFRGA6IE1pc2FsaWduZWQgYWNjZXNzZXMg
YXJlCj4gPiAgICAgIGVtdWxhdGVkIHZpYSBzb2Z0d2FyZSwgZWl0aGVyIGluIG9yIGJlbG93IHRo
ZSBrZXJuZWwuICBUaGVzZSBhY2Nlc3NlcyBhcmUKPiA+ICAgICAgYWx3YXlzIGV4dHJlbWVseSBz
bG93Lgo+ID4KPiA+IC0gICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9TTE9X
YDogTWlzYWxpZ25lZCB3b3JkIGFjY2Vzc2VzIGFyZQo+ID4gLSAgICBzbG93ZXIgdGhhbiBlcXVp
dmFsZW50IGJ5dGUgYWNjZXNzZXMuICBNaXNhbGlnbmVkIGFjY2Vzc2VzIG1heSBiZSBzdXBwb3J0
ZWQKPiA+IC0gICAgZGlyZWN0bHkgaW4gaGFyZHdhcmUsIG9yIHRyYXBwZWQgYW5kIGVtdWxhdGVk
IGJ5IHNvZnR3YXJlLgo+ID4gKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVE
X1NDQUxBUl9TTE9XYDogTWlzYWxpZ25lZCB3b3JkIGFjY2Vzc2VzCj4gPiArICAgIGFyZSBzbG93
ZXIgdGhhbiBlcXVpdmFsZW50IGJ5dGUgYWNjZXNzZXMuICBNaXNhbGlnbmVkIGFjY2Vzc2VzIG1h
eSBiZQo+ID4gKyAgICBzdXBwb3J0ZWQgZGlyZWN0bHkgaW4gaGFyZHdhcmUsIG9yIHRyYXBwZWQg
YW5kIGVtdWxhdGVkIGJ5IHNvZnR3YXJlLgo+ID4KPiA+IC0gICogOmM6bWFjcm86YFJJU0NWX0hX
UFJPQkVfTUlTQUxJR05FRF9GQVNUYDogTWlzYWxpZ25lZCB3b3JkIGFjY2Vzc2VzIGFyZQo+ID4g
LSAgICBmYXN0ZXIgdGhhbiBlcXVpdmFsZW50IGJ5dGUgYWNjZXNzZXMuCj4gPiArICAqIDpjOm1h
Y3JvOmBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfU0NBTEFSX0ZBU1RgOiBNaXNhbGlnbmVkIHdv
cmQgYWNjZXNzZXMKPiA+ICsgICAgYXJlIGZhc3RlciB0aGFuIGVxdWl2YWxlbnQgYnl0ZSBhY2Nl
c3Nlcy4KPiA+Cj4gPiAtICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5T
VVBQT1JURURgOiBNaXNhbGlnbmVkIGFjY2Vzc2VzIGFyZQo+ID4gLSAgICBub3Qgc3VwcG9ydGVk
IGF0IGFsbCBhbmQgd2lsbCBnZW5lcmF0ZSBhIG1pc2FsaWduZWQgYWRkcmVzcyBmYXVsdC4KPiA+
ICsgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9TQ0FMQVJfVU5TVVBQT1JU
RURgOiBNaXNhbGlnbmVkIGFjY2Vzc2VzCj4gPiArICAgIGFyZSBub3Qgc3VwcG9ydGVkIGF0IGFs
bCBhbmQgd2lsbCBnZW5lcmF0ZSBhIG1pc2FsaWduZWQgYWRkcmVzcyBmYXVsdC4KPiA+Cj4gPiAg
KiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfWklDQk9aX0JMT0NLX1NJWkVgOiBBbiB1bnNp
Z25lZCBpbnQgd2hpY2gKPiA+ICAgIHJlcHJlc2VudHMgdGhlIHNpemUgb2YgdGhlIFppY2JveiBi
bG9jayBpbiBieXRlcy4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20vaHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAo+ID4g
aW5kZXggMjIwNzM1MzNjZWE4Li5lMTE2ODRkOGFlMWMgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvdWFwaS9hc20vaHdwcm9iZS5oCj4gPiBAQCAtNjYsMTEgKzY2LDExIEBAIHN0cnVjdCByaXNj
dl9od3Byb2JlIHsKPiA+ICAjZGVmaW5lICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX0VYVF9a
VkU2NEYgICAgICAgICgxVUxMIDw8IDQwKQo+ID4gICNkZWZpbmUgICAgICAgICAgICAgIFJJU0NW
X0hXUFJPQkVfRVhUX1pWRTY0RCAgICAgICAgKDFVTEwgPDwgNDEpCj4gPiAgI2RlZmluZSBSSVND
Vl9IV1BST0JFX0tFWV9DUFVQRVJGXzAgIDUKPiA+IC0jZGVmaW5lICAgICAgICAgICAgICBSSVND
Vl9IV1BST0JFX01JU0FMSUdORURfVU5LTk9XTiAgICAgICAgMAo+ID4gLSNkZWZpbmUgICAgICAg
ICAgICAgIFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9FTVVMQVRFRCAgICAgICAxCj4gPiAtI2Rl
ZmluZSAgICAgICAgICAgICAgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1NMT1cgICAgICAgICAg
IDIKPiA+IC0jZGVmaW5lICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfRkFT
VCAgICAgICAgICAgMwo+ID4gLSNkZWZpbmUgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVfTUlT
QUxJR05FRF9VTlNVUFBPUlRFRCAgICA0Cj4gPiArI2RlZmluZSAgICAgICAgICAgICAgUklTQ1Zf
SFdQUk9CRV9NSVNBTElHTkVEX1NDQUxBUl9VTktOT1dOICAgICAgICAgMAo+ID4gKyNkZWZpbmUg
ICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9TQ0FMQVJfRU1VTEFURUQgICAg
ICAgIDEKPiA+ICsjZGVmaW5lICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX01JU0FMSUdORURf
U0NBTEFSX1NMT1cgICAgICAgICAgICAyCj4gPiArI2RlZmluZSAgICAgICAgICAgICAgUklTQ1Zf
SFdQUk9CRV9NSVNBTElHTkVEX1NDQUxBUl9GQVNUICAgICAgICAgICAgMwo+ID4gKyNkZWZpbmUg
ICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9TQ0FMQVJfVU5TVVBQT1JURUQg
ICAgIDQKPiA+ICAjZGVmaW5lICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX01JU0FMSUdORURf
TUFTSyAgICAgICAgICAgNwo+Cj4gSG93IGNvbWUgdGhlICJvbGQiIG5hbWVzIGRvIG5vdCBuZWVk
IHRvIGJlIHByZXNlcnZlZCBmb3IgdXNlcnNwYWNlPwoKSXQgZGVwZW5kcyBvbiB3aGF0IGV4YWN0
bHkgdGhlIGJpZyB1c2Vyc3BhY2UgY29tcGF0aWJpbGl0eSBydWxlIGlzLgpUaGlzIHByZXNlcnZl
cyBiaW5hcnkgY29tcGF0aWJpbGl0eSwgd2hpY2ggSSB0aGluayBpcyB0aGUgYmlnIG9uZSwgYnV0
CmJyZWFrcyBzb3VyY2UgY29tcGF0aWJpbGl0eSwgdGhvdWdoIHdpdGggYW4gZWFzeSB0cmFuc2xh
dGlvbiB0byBmaXguCldlIGNvdWxkIGtlZXAgdGhlIG9sZCBuYW1lcyBhcm91bmQsIGJ1dCB0aGVu
IGl0IHNlZW1zIHNvcnQgb2Ygc2lsbHkgdG8KaW50cm9kdWNlIHRoZSBuZXcgbmFtZXMuIEkgaW50
cm9kdWNlZCB0aGlzIHBhdGNoIHVwb24gcmVxdWVzdCwgc28gSQpkb24ndCBwZXJzb25hbGx5IGhh
dmUgYSBob3JzZSBpbiB0aGUgcmFjZSBvbiB0aGlzIG9uZS4KCi1FdmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
