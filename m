Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431C6C27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 18:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fv2fI/C12w8JCuvjqF9/M2+5N/y/zUqCQEX4Tqbfsnk=; b=3YG2n49/ukdbIB
	/ZKLiXW+QkeuZyUWoErkPzUHi+7+ZVHA8mMgVNkQJCbxbwL73/OGRUwTKKjWvC4+b/DlZTqWlIeX0
	jWf1UFpyNZ/bXYSNfTr/4mYp01ek9+VsX2PzWKn3jPI9oC2lA/XHs4LuL1nPFiUDfvP/+Un2gD8cf
	FLvb/Y41Io7Yogz8Gp3YUGzJ+UfuIYgsISGGx5sSSOI8+Vaa+cq4Cygq9l1wgAHlts+aohKmCt7Os
	diRkDFhMU3+gpysN49d3qH1URDqarpfhYOQoWzF2t1scViM5y635ks7CV8PwJ7HTqJ4qnJGM/mAqV
	yAhZW6C/A5BRpwkxwhkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKj2H-0000000AEHM-1FyI;
	Fri, 21 Jun 2024 18:30:57 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKj2D-0000000AEG6-1uVc
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 18:30:55 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-361b376236fso1696797f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 11:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718994651; x=1719599451; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDBJP06DmRWkDW63XRl13F0vqR5/B3xF+ky6e3VTjKM=;
        b=Ndubf1b4YUXf6nfU/I2TWXpoHr3pvEu2c7wzVISkD8ZDXIUVAhNKdSiZlOcrlrJuml
         pRxYjacCzYl/eTSHMedgozplP1VWGVcRkLAB5y/S7zi3yFjGFnEz/maMRKtd6Sy5rwYP
         qZJ+eMm75huxnhbqDib3oFP2gh7qFZv1sOnrZ/WLEQBRYmFdv3MdYR2DXgr/ciwtXeAu
         hB760HJXl2/qKJaVoyXv5qNDkH4sca8EsC8n8p1m3quCe7VgmNvLqQaJIPLFDdkKQMy8
         bDHKNyDi4W+4zKo+QVIPLqLPtqF/WY6ZHGEC+d3ZzIzlOB9wIed7tA2Tsxc8IbzkQw7k
         Jj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718994651; x=1719599451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDBJP06DmRWkDW63XRl13F0vqR5/B3xF+ky6e3VTjKM=;
        b=gHnTWKOncVnl8gNqdpdWewa52p/O8fhXKmgUT5eDA3t7mnLJTpPpSsZ2uiWmDxYJr8
         u0L1kVzRORAYQaDT5Pr1HDrpZP+U0uo5ZXyVlRPl93knWiux4GSN5v0I684buBYpnP66
         dKwCVzx2KtKgUHqsDsX0qyOuY4ckjMdcjETxVXCfi5PsuOmKOwegqRmSMsSiVvZaczNZ
         +OyiSLN/MFokyymZIbKUx6gP7yt/sRlvQ9M0L5R+r9Ywib8fCAS9dYFbREHHhewVibFD
         iFxBReHCwU3GHpeDFbsmWhbU1DXgQEDHohfHuGos2ZZgMBv/qj+NEIrjjyamLx5galRn
         d5vQ==
X-Gm-Message-State: AOJu0YwCVCL0VtglnUEQu4WtzgAUtquAy+TZ8dj2RIcmYZSypEKQWfi5
	XhxVyd19FaOpDnYNE2m+QXY3Zs2adUKMF3WY7RoZXtilqCD2i450pT2nD20raizxhoTUb6RnQfY
	0S+b0zUi+agVsz4QJdeDpARbhGSoxjy2lhcgu+Q==
X-Google-Smtp-Source: AGHT+IHeBc37pbRnvfEykUpBvFqq4/wFdfQ/OI9yo+wiCiO9O7Ii/6NMT9RkrVuB3eccZMg8VBewVzuX8+kx9wTxJnk=
X-Received: by 2002:a05:6000:1107:b0:364:e290:c60b with SMTP id
 ffacd0b85a97d-364e290cbf5mr4499397f8f.38.1718994651598; Fri, 21 Jun 2024
 11:30:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240613191616.2101821-1-jesse@rivosinc.com> <20240613191616.2101821-7-jesse@rivosinc.com>
 <CALs-HssqVkEX0=x+jhQDjwjRQb9TjbskLvrpvzFG_g-2iDXy3w@mail.gmail.com>
In-Reply-To: <CALs-HssqVkEX0=x+jhQDjwjRQb9TjbskLvrpvzFG_g-2iDXy3w@mail.gmail.com>
From: Jesse Taube <jesse@rivosinc.com>
Date: Fri, 21 Jun 2024 14:30:39 -0400
Message-ID: <CALSpo=ae6Z75SJ7uWj7H_D2GZZaU1genFv+shNCT01DhGYQCTw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] RISC-V: hwprobe: Document unaligned vector perf key
To: Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Eric Biggers <ebiggers@google.com>, Greentime Hu <greentime.hu@sifive.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Heiko Stuebner <heiko@sntech.de>, Costa Shulyupin <costa.shul@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Erick Archer <erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_113053_649515_27CA0B83 
X-CRM114-Status: GOOD (  21.35  )
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

T24gVGh1LCBKdW4gMjAsIDIwMjQgYXQgMjo1MuKAr1BNIEV2YW4gR3JlZW4gPGV2YW5Acml2b3Np
bmMuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgSnVuIDEzLCAyMDI0IGF0IDEyOjE44oCvUE0gSmVz
c2UgVGF1YmUgPGplc3NlQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPgo+ID4gRG9jdW1lbnQga2V5
IGZvciByZXBvcnRpbmcgdGhlIHNwZWVkIG9mIHVuYWxpZ25lZCB2ZWN0b3IgYWNjZXNzZXMuCj4g
PiBUaGUgZGVzY3JpcHRpb25zIGFyZSB0aGUgc2FtZSBhcyB0aGUgc2NhbGFyIGVxdWl2YWxlbnQg
dmFsdWVzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEplc3NlIFRhdWJlIDxqZXNzZUByaXZvc2lu
Yy5jb20+Cj4gPiAtLS0KPiA+IFYxIC0+IFYyOgo+ID4gICAtIE5ldyBwYXRjaAo+ID4gLS0tCj4g
PiAgRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0IHwgMTYgKysrKysrKysrKysr
KysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCBiL0RvY3VtZW50YXRp
b24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+ID4gaW5kZXggNzA4NWE2OTRiODAxLi4zNDRiZWEx
ZTIxYmQgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5y
c3QKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+ID4gQEAg
LTIzNiwzICsyMzYsMTkgQEAgVGhlIGZvbGxvd2luZyBrZXlzIGFyZSBkZWZpbmVkOgo+ID4KPiA+
ICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0tFWV9aSUNCT1pfQkxPQ0tfU0laRWA6IEFuIHVu
c2lnbmVkIGludCB3aGljaAo+ID4gICAgcmVwcmVzZW50cyB0aGUgc2l6ZSBvZiB0aGUgWmljYm96
IGJsb2NrIGluIGJ5dGVzLgo+ID4gKwo+ID4gKyogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZ
X1ZFQ19NSVNBTElHTkVEX1BFUkZgOiBBbiBlbnVtIHZhbHVlIGRlc2NyaWJpbmcgdGhlCj4gPiAr
ICBwZXJmb3JtYW5jZSBvZiBtaXNhbGlnbmVkIHZlY3RvciBhY2Nlc3NlcyBvbiB0aGUgc2VsZWN0
ZWQgc2V0IG9mIHByb2Nlc3NvcnMuCj4gPiArCj4gPiArICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BS
T0JFX1ZFQ19NSVNBTElHTkVEX1VOS05PV05gOiBUaGUgcGVyZm9ybWFuY2Ugb2YgbWlzYWxpZ25l
ZAo+ID4gKyAgICBhY2Nlc3NlcyBpcyB1bmtub3duLgo+ID4gKwo+ID4gKyAgKiA6YzptYWNybzpg
UklTQ1ZfSFdQUk9CRV9WRUNfTUlTQUxJR05FRF9TTE9XYDogTWlzYWxpZ25lZCBhY2Nlc3NlcyBh
cmUgc2xvd2VyCj4KPiBTaG91bGQgd2Ugc3BlY2lmeSB3aGF0IHNpemUgb2YgdmVjdG9yIGFjY2Vz
cyB3ZSdyZSBjb21wYXJpbmcgYWdhaW5zdD8KPiBJbiBvdGhlciB3b3JkcywgY3Jpc3BlbiB1cCB3
aGF0ICJtaXNhbGlnbmVkIGFjY2VzcyIgZXhhY3RseSBtZWFucy4gSQo+IHJlYWxpemUgeW91IGNv
cGllZCB0aGlzIGZyb20gbXkgdGV4dC4gSSByZWFsbHkgc2hvdWxkIGhhdmUgc2FpZAo+ICJtaXNh
bGlnbmVkIG5hdGl2ZSB3b3JkIHNpemUgYWNjZXNzZXMiLgoKSW4gYXJjaC9yaXNjdi9rZXJuZWwv
dmVjLWNvcHktdW5hbGlnbmVkLlMgSSBzZXQgV09SRF9FRVcgdG8gMzJiaXRzLgpUaGUgcmF0aW9u
YWxlIGZvciB1c2luZyAzMmJpdHMgaXMKKCJyaXNjdjogdmVjdG9yOiBhZGp1c3QgbWluaW11bSBW
ZWN0b3IgcmVxdWlyZW1lbnQgdG8gWlZFMzJYIikgaW4gdGhpcyBzZXQuCmh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC8yMDI0MDQxMi16dmUtZGV0ZWN0aW9uLXY0LTAtZTBjNDViYjZiMjUzQHNp
Zml2ZS5jb20vCgpJJ2xsIGNoYW5nZSBmYXN0ZSBhbmQgc2xvdyB0byBzdGFydCB3aXRoICIzMmJp
dCBtaXNhbGlnbmVkIGFjY2Vzc2VzIGFyZSIKClRoYW5rcywKSmVzc2UKPgo+ID4gKyAgICB0aGFu
IGVxdWl2YWxlbnQgYnl0ZSBhY2Nlc3Nlcy4gIE1pc2FsaWduZWQgYWNjZXNzZXMgbWF5IGJlIHN1
cHBvcnRlZAo+ID4gKyAgICBkaXJlY3RseSBpbiBoYXJkd2FyZSwgb3IgdHJhcHBlZCBhbmQgZW11
bGF0ZWQgYnkgc29mdHdhcmUuCj4gPiArCj4gPiArICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JF
X1ZFQ19NSVNBTElHTkVEX0ZBU1RgOiBNaXNhbGlnbmVkIGFjY2Vzc2VzIGFyZSBmYXN0ZXIKPiA+
ICsgICAgdGhhbiBlcXVpdmFsZW50IGJ5dGUgYWNjZXNzZXMuCj4gPiArCj4gPiArICAqIDpjOm1h
Y3JvOmBSSVNDVl9IV1BST0JFX1ZFQ19NSVNBTElHTkVEX1VOU1VQUE9SVEVEYDogTWlzYWxpZ25l
ZCBhY2Nlc3NlcyBhcmUKPiA+ICsgICAgbm90IHN1cHBvcnRlZCBhdCBhbGwgYW5kIHdpbGwgZ2Vu
ZXJhdGUgYSBtaXNhbGlnbmVkIGFkZHJlc3MgZmF1bHQuCj4gPiAtLQo+ID4gMi40My4wCj4gPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
