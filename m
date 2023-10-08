Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFF3E95A82
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Oct 2023 16:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RdebaCEoK9whPelf0eH+N5koJwa7tzMxZvei6CWWlqo=; b=laxDMUX8448I582HEZm/eiE1PI
	2jx8i8vb5WIkJ9ChdcFF12M174Jd8aisgX6VK360ERwBPQGaE64pjDb++dDjAJf/+JvMTnMdy8RBW
	TNvC03KvW+t7Rjl87I0C57HPwGWfuJ0bjCcyKfgDUp7bajrBxk4/1I7Syx+m+XUwijHUaePYD6CE+
	exmrAL/MA0OebNTzp8VVbG9EBIXGs7NKXaVlSPRdzxROnX5We78LWjdGzFGR/FUQR686HYzUUcWGb
	t3RhmF8XktcU+zh0FDN/t5SG/HqKykL7HoR2iq0RjshR7vFudRd3/J9rV8VFTI6hhySEhKfDpdxAB
	hjco5qWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpWZF-0092TS-0q;
	Sun, 08 Oct 2023 16:23:45 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpWZB-0092Rt-2f
	for linux-riscv@lists.infradead.org;
	Sun, 08 Oct 2023 16:23:43 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c012232792so45340281fa.0
        for <linux-riscv@lists.infradead.org>; Sun, 08 Oct 2023 09:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1696782218; x=1697387018; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ll1xFIKgthVBkbIQ18l2VWC32SrBNao63uADKYJp67g=;
        b=EEsfnkEj4GUHp20f5PrLLOKjYNHnLl1VkA3DSf/hTK7WlXZU3HKs6NFS0RM5fDEa4z
         j40LYhGyiLg6xk8pewI7iAAR5suVUWf+EjWY0K2iWxJCjwZoWG6CBsKDn6AjJM07K0YX
         xh3NMRFgOCbE6hhjwjWZVUCqvo52xI1Iv+sugwNoMN9FttgLlE9fbscQ/uhRjZl5Ibvr
         42GB+5PDiNe82Is2brZ+IAo/x1I1ylMcXjneoH86mbX5V85wwFfYlDJWxJtTZvjMMXty
         evUC9S8/kfZnz9QdcL88FxfA4Z5EQR83bVsObEFAmt9UlQjyZ7NPD/5hORTQJUBrMX0I
         +I+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696782218; x=1697387018;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ll1xFIKgthVBkbIQ18l2VWC32SrBNao63uADKYJp67g=;
        b=lvLsoIvoHN1Cx4SNRpUYjfgQNJJMK16GUF/PIJzS7hNda67H7EgTxmka3NUKXG6hYK
         v9BhKAcoEokjdvFk6Rpbu7U+43a9YkSLIFAr6vdWtBHOkyStw0fBz7UfDsV6snQmtEGX
         oyzH794m2v9+rIB53rB5u+HeZWM8DLAw8UVMxOsjy2bJqqQE/Yhn8zInzzcaPCkud1nU
         RVd8fhDVEuC59Fr9vDtBy1MmBleSyGfGQZx87vygtqwF9DKJuVCKIP+v+/na5CClWPc3
         CmuN8DuGUczHzvm3Wz0BLe51R36aQ2Y5h3NX1o49fGpuLAD7MKRszURDYgpHLr5xaZOj
         +UoA==
X-Gm-Message-State: AOJu0Yw1qpf4twp4xiKoJxthC2/KqbxRYiNGfjTm4aBXnMVPWUll7FHS
	DPLgrfX6lPg3xTo9+DuJ71MI6MzQSPQzNBubWWe1GA==
X-Google-Smtp-Source: AGHT+IEDiW/72+1fHjRwjd2QHLfwn12GJk+UvsKaCmV8jsLIrAy42uLdoJcDdY4vYIHGAMER6GtYTjOmBCv8mj+EReI=
X-Received: by 2002:a2e:828b:0:b0:2be:54b4:ff90 with SMTP id
 y11-20020a2e828b000000b002be54b4ff90mr10069767ljg.53.1696782218295; Sun, 08
 Oct 2023 09:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230605110724.21391-1-andy.chiu@sifive.com> <20230605110724.21391-15-andy.chiu@sifive.com>
 <ZSJ0K5JFrglyJY8o@aurel32.net>
In-Reply-To: <ZSJ0K5JFrglyJY8o@aurel32.net>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 9 Oct 2023 01:23:26 +0900
Message-ID: <CABgGipVQ3j+Njw1CDkD9cuDwTwR2-WqF7Y_yZt3NPipAedK_2Q@mail.gmail.com>
Subject: Re: [PATCH -next v21 14/27] riscv: signal: Add sigcontext
 save/restore for vector
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, vineetg@rivosinc.com, 
	greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	Vincent Chen <vincent.chen@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Conor Dooley <conor.dooley@microchip.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Rob Herring <robh@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Wenting Zhang <zephray@outlook.com>, Guo Ren <guoren@kernel.org>, 
	Andrew Bresticker <abrestic@rivosinc.com>, Al Viro <viro@zeniv.linux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_092341_936363_D9474B6B 
X-CRM114-Status: GOOD (  28.77  )
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

T24gU3VuLCBPY3QgOCwgMjAyMyBhdCA2OjE54oCvUE0gQXVyZWxpZW4gSmFybm8gPGF1cmVsaWVu
QGF1cmVsMzIubmV0PiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gMjAyMy0wNi0wNSAxMTowNywgQW5k
eSBDaGl1IHdyb3RlOgo+ID4gRnJvbTogR3JlZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZl
LmNvbT4KPiA+Cj4gPiBUaGlzIHBhdGNoIGZhY2lsaXRhdGVzIHRoZSBleGlzdGluZyBmcC1yZXNl
cnZlZCB3b3JkcyBmb3IgcGxhY2VtZW50IG9mCj4gPiB0aGUgZmlyc3QgZXh0ZW5zaW9uJ3MgY29u
dGV4dCBoZWFkZXIgb24gdGhlIHVzZXIncyBzaWdmcmFtZS4gQSBjb250ZXh0Cj4gPiBoZWFkZXIg
Y29uc2lzdHMgb2YgYSBkaXN0aW5jdCBtYWdpYyB3b3JkIGFuZCB0aGUgc2l6ZSwgaW5jbHVkaW5n
IHRoZQo+ID4gaGVhZGVyIGl0c2VsZiwgb2YgYW4gZXh0ZW5zaW9uIG9uIHRoZSBzdGFjay4gVGhl
biwgdGhlIGZyYW1lIGlzIGZvbGxvd2VkCj4gPiBieSB0aGUgY29udGV4dCBvZiB0aGF0IGV4dGVu
c2lvbiwgYW5kIHRoZW4gYSBoZWFkZXIgKyBjb250ZXh0IGJvZHkgZm9yCj4gPiBhbm90aGVyIGV4
dGVuc2lvbiBpZiBleGlzdHMuIElmIHRoZXJlIGlzIG5vIG1vcmUgZXh0ZW5zaW9uIHRvIGNvbWUs
IHRoZW4KPiA+IHRoZSBmcmFtZSBtdXN0IGJlIGVuZGVkIHdpdGggYSBudWxsIGNvbnRleHQgaGVh
ZGVyLiBBIHNwZWNpYWwgY2FzZSBpcwo+ID4gcnY2NGdjLCB3aGVyZSB0aGUga2VybmVsIHN1cHBv
cnQgbm8gZXh0ZW5zaW9ucyByZXF1aXJpbmcgdG8gZXhwb3NlCj4gPiBhZGRpdGlvbmFsIHJlZ2Zp
bGUgdG8gdGhlIHVzZXIuIEluIHN1Y2ggY2FzZSB0aGUga2VybmVsIHdvdWxkIHBsYWNlIHRoZQo+
ID4gbnVsbCBjb250ZXh0IGhlYWRlciByaWdodCBhZnRlciB0aGUgZmlyc3QgcmVzZXJ2ZWQgd29y
ZCBvZgo+ID4gX19yaXNjdl9xX2V4dF9zdGF0ZSB3aGVuIHNhdmluZyBzaWdmcmFtZS4gQW5kIHRo
ZSBrZXJuZWwgd291bGQgY2hlY2sgaWYKPiA+IGFsbCByZXNlcnZlZCB3b3JkcyBhcmUgemVyb3Mg
d2hlbiBhIHNpZ25hbCBoYW5kbGVyIHJldHVybnMuCj4gPgo+ID4gX19yaXNjdl9xX2V4dF9zdGF0
ZS0tLS0+fCAgICAgfDwtX19yaXNjdl9leHRyYV9leHRfaGVhZGVyCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgfiAgICAgICB+Cj4gPiAgICAgICAucmVzZXJ2ZWRbMF0tLS0+fDAgICAgICB8PC0g
ICAgIC5yZXNlcnZlZAo+ID4gICAgICAgICAgICAgICA8LS0tLS0tLXxtYWdpYyAgfDwtICAgICAu
aGRyCj4gPiAgICAgICAgICAgICAgIHwgICAgICAgfHNpemUgICB8X19fX19fXyBlbmQgb2Ygc2Nf
ZnByZWdzCj4gPiAgICAgICAgICAgICAgIHwgICAgICAgfGV4dC1iZHl8Cj4gPiAgICAgICAgICAg
ICAgIHwgICAgICAgfiAgICAgICB+Cj4gPiAgICAgICArKXNpemUgIC0tLS0tLS0+fG1hZ2ljICB8
PC0gYW5vdGhlciBjb250ZXh0IGhlYWRlcgo+ID4gICAgICAgICAgICAgICAgICAgICAgIHxzaXpl
ICAgfAo+ID4gICAgICAgICAgICAgICAgICAgICAgIHxleHQtYmR5fAo+ID4gICAgICAgICAgICAg
ICAgICAgICAgIH4gICAgICAgfgo+ID4gICAgICAgICAgICAgICAgICAgICAgIHxtYWdpYzowfDwt
IG51bGwgY29udGV4dCBoZWFkZXIKPiA+ICAgICAgICAgICAgICAgICAgICAgICB8c2l6ZTowIHwK
PiA+Cj4gPiBUaGUgdmVjdG9yIHJlZ2lzdGVycyB3aWxsIGJlIHNhdmVkIGluIGRhdGFwIHBvaW50
ZXIuIFRoZSBkYXRhcCBwb2ludGVyCj4gPiB3aWxsIGJlIGFsbG9jYXRlZCBkeW5hbWljYWxseSB3
aGVuIHRoZSB0YXNrIG5lZWRzIGluIGtlcm5lbCBzcGFjZS4gT24KPiA+IHRoZSBvdGhlciBoYW5k
LCBkYXRhcCBwb2ludGVyIG9uIHRoZSBzaWdmcmFtZSB3aWxsIGJlIHNldCByaWdodCBhZnRlcgo+
ID4gdGhlIF9fcmlzY3Zfdl9leHRfc3RhdGUgZGF0YSBzdHJ1Y3R1cmUuCj4KPiBJdCBhcHBlYXJz
IHRoYXQgdGhpcyBwYXRjaCBzb21laG93IGJyZWFrcyB1c2VybGFuZCwgYXQgbGVhc3QgdGhlIHJ1
c3QKPiBjb21waWxlci4gVGhpcyBjYW4gYmUgb2JzZXJ2ZWQgZm9yIGluc3RhbmNlIGJ5IGJ1aWxk
aW5nIHRoZSBydXN0LWxzZAo+IHBhY2thZ2UgaW4gRGViaWFuLCBidXQgbWFueSBvdGhlciBydXN0
IHBhY2thZ2VzIGFyZSBhbHNvIGFmZmVjdGVkOgoKU29ycnkgZm9yIHRoZSB0aW1lIHNwZW50IG9u
IHBpbnBvaW50aW5nIHRoZSBpc3N1ZS4gWWVzLCB0aGlzIGlzIGEgYnVnCmFuZCB3ZSBoYWQgYSBm
aXggWzFdLiBUaGlzIGZpeCB3YXMgYWNjaWRlbnRseSBub3QgZ2V0dGluZyBpbnRvIHRoZQotZml4
ZXMgYnJhbmNoLCBidXQgaXQgd2lsbC4gQW5kIGl0IHNob3VsZCBiZSBnb2luZyBpbnRvIGxpbnV4
IHN0YWJsZQphcyB3ZWxsLCB0aG91Z2ggSSBhbSBub3QgY2VydGFpbiBhYm91dCB0aGUgdGltaW5n
LiBPdGhlcndpc2UsIHRoaXMgYnVnCm1heSBwb3RlbnRpYWxseSBicmVhayBhbnkgcHJvY2Vzc2Vz
IHdoaWNoIGFsbG9jYXRlIGEgc2lnYWx0c3RhY2sgYXQgYW4KYWRkcmVzcyBoaWdoZXIgdGhhbiB0
aGVpciBzdGFjay4KCj4KPiAqIEZhaWxlZCBidWlsZCB3aXRoIGtlcm5lbCA2LjUuMzoKPiAgIGh0
dHBzOi8vYnVpbGRkLmRlYmlhbi5vcmcvc3RhdHVzL2ZldGNoLnBocD9wa2c9cnVzdC1sc2QmYXJj
aD1yaXNjdjY0JnZlcj0wLjIzLjEtNyUyQmIxJnN0YW1wPTE2OTY0NzUzODYmcmF3PTAKPgo+ICog
U3VjY2Vzc2Z1bCBidWlsZCB3aXRoIGtlcm5lbCA2LjQuMTM6Cj4gICBodHRwczovL2J1aWxkZC5k
ZWJpYW4ub3JnL3N0YXR1cy9mZXRjaC5waHA/cGtnPXJ1c3QtbHNkJmFyY2g9cmlzY3Y2NCZ2ZXI9
MC4yMy4xLTclMkJiMSZzdGFtcD0xNjk2NDkxMDI1JnJhdz0wCj4KPiBJdCBoYXBwZW5zIG9uIGhh
cmR3YXJlIHdoaWNoIGRvZXMgbm90IGhhdmUgdGhlIFYgZXh0ZW5zaW9uIChpbiB0aGUgYWJvdmUK
PiBjYXNlIG9uIGEgSGlmaXZlIFVubWF0Y2hlZCBib2FyZCkuIFRoaXMgY2FuIGFsc28gYmUgcmVw
cm9kdWNlZCBpbiBhIFFFTVUKPiBWTS4gVW5mb3J0dW5hdGVseSBkaXNhYmxpbmcgQ09ORklHX1JJ
U0NWX0lTQV9WIGRvZXMgbm90IHdvcmthcm91bmQgdGhlCj4gaXNzdWUuCj4KPiBJdCBpcyBub3Qg
Y2xlYXIgdG8gbWUgaWYgaXQgaXMgYSBrZXJuZWwgaXNzdWUgb3IgYSB3cm9uZyBhc3N1bXB0aW9u
IG9uCj4gdGhlIHJ1c3Qgc2lkZS4gQW55IGhpbnQgb24gaG93IHRvIGNvbnRpbnVlIGludmVzdGln
YXRpbmc/Cj4KPiBSZWdhcmRzCj4gQXVyZWxpZW4KPgo+IC0tCj4gQXVyZWxpZW4gSmFybm8gICAg
ICAgICAgICAgICAgICAgICAgICAgIEdQRzogNDA5NlIvMURERDhDOUIKPiBhdXJlbGllbkBhdXJl
bDMyLm5ldCAgICAgICAgICAgICAgICAgICAgIGh0dHA6Ly9hdXJlbDMyLm5ldAoKWzFdOiBodHRw
czovL3loYnQubmV0L2xvcmUvYWxsL21obmctNzc5OWQzYTEtYzEyYS00OGU5LWJiNWYtZTBhNTk2
ODkyZDc4QHBhbG1lci1yaS14MWM5LwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
