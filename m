Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4514DC282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 13:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ll2jlTxWhR203SbnUGUOjLTcgTcxsMz36oLAGo9GEfw=; b=SUZqojaGPl3Vwc
	OhyhQyocMv88MvQGRwv49wmxVn5EcLhY7JBjZ6oM/AHeG7MRq/TRM6Y6GMOhLGRq5d9T4zlKP7fVi
	uaOhU+k7NoGD6X3jzDEqCZobIcI5gQl9q6KNOfj4QFeqT2A7JBA59vcy0ZFv/nAQY5VNbKBZZ4wB7
	BQneVaMq0xDagp7ExaKWRO/iMW7aaiwDXW2cb95TRAH/NweKIjbKeYwjdT6hqEf6X1kJZlHAekVjr
	c9xO4ukP69JG3wme5SoUyeBdHRrc5yceLLdZHtg60pWrtqWSoW8QvVQfvP89xnC3Il62saTMMrpnO
	FoMqmeKYXVrYOAjBQmIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trziY-00000005qrO-2ORV;
	Tue, 11 Mar 2025 13:32:22 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trzgu-00000005qbF-29yQ;
	Tue, 11 Mar 2025 13:30:41 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-51eb1a6ca1bso2243375e0c.1;
        Tue, 11 Mar 2025 06:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741699839; x=1742304639; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OS+kx1EYJx8zGVZAVZxDQft66T1VTJ/fMWqkBxUi750=;
        b=kEWuFiQ6cb1ZAxMnv1r6K5wOnRkjEq5fA4xlpPnI2JtrD1UoezGPezRp2kxL7T840D
         zE5gLLE4U46FWTd2JZziFq0XIGeMtXcYReTMmnhEisiV69rnYhRREbHhohUFNIG9bVzw
         v8T2o/m19piDFwKiiHNG+S+wXDPCdN2Oi++wPBNKjegeZXlST2OU9ASzOuJLNtKnhrrA
         RExr7h0bZVh8MWFiL6U10GIb5RYTFV1Xvb1fMIfkCqbmX7jBuPpasc5M4UOVz8pwHCEi
         NcB7gsc9E0L3qvKzah8HahGheqmtrK3anieqln1QgCK+v96/vx9Nx+kiWNewroSYgLIW
         C4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741699839; x=1742304639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OS+kx1EYJx8zGVZAVZxDQft66T1VTJ/fMWqkBxUi750=;
        b=C8Rm5DHYmyfyA6PYAQph14XUKCt7GsGEGMjgpJEI89Qh5sF09a1nIgNuvkUITXzomy
         PqieLA5jpBgJIVa8zKAsPOT529I/KXa3S8+OnsCWVazZS52Z6K1RZhUDx8uy+S9bvsRx
         bjgOn8X9ykR54400TxOvwpzyrF29G2DU4/lWykrG3LIXUvtF/BMJz/EY9yijfNwGQDu0
         nQQX4gtFETG0C61+KVQUiGtz7C4luuXSkPLWkXGqXzNedPIw4CE0GYwH+NEyRXV3sHMo
         SI6z4lDtKF9ogoS/+VM+BKPFXQx+5rrbTmPqT2CB9BN4g5VP/TROB0KgC4WLyL1rAdok
         8TVg==
X-Forwarded-Encrypted: i=1; AJvYcCUwHryO1RqdxrrD0sc8YLr+kQVGO3jxph1RVjv3uBBTe9uEzdI+FLMmJwTZen2tfh0rUw7aGUGc4aCgaZhBlsFZ@lists.infradead.org, AJvYcCWzA8OxUdF2MxoOxC0epa2qn/BoynGzG1DOi9pEKQ0nXSDt2pxAH3zOUYuLENY8riV7S22ivXb0CqxiIUw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzsKLmtQaYUjVJUV7yoQN/2uoqhZd4cF+GUxhCL2NsozLBNxZLr
	ZA3v+LenPEE5GVJFLjFsQEezYs+d12B8jvtcaKIL1m6rtRcw+SSnLAEPQLqR9qivjoaIo9t/0sS
	a3XzyE03R++ub4j2h0b1I2PvEhVg=
X-Gm-Gg: ASbGnctVfUUEjQ5iy/bPUWxRl2hPr+7kbHVozoP9bFBBgHBx07x6NOMrshCnqjv3NEV
	965j9rrumAY1lL5ISogYvrbOUeaPgNlaFYQOFmJo0pL3ydxn6wyg2OA9ULRlRLIcJzV4DY9jP1a
	/oMoxgVcwR+YODJmNwIBOH9c3ONA==
X-Google-Smtp-Source: AGHT+IFy2Sl8rkBIl4+/ZfojG+Lp511BkNoNkiebfxbXz25a/xXmKtCtJuK/D9U65TOMGgOaav+c8ESCttCkqV6X1J8=
X-Received: by 2002:a05:6122:2011:b0:520:42d3:91aa with SMTP id
 71dfb90a1353d-523e3ff118fmr11782712e0c.2.1741699839299; Tue, 11 Mar 2025
 06:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <Z82tWYZulV12Pjir@shell.armlinux.org.uk> <E1trIAQ-005nto-3w@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1trIAQ-005nto-3w@rmk-PC.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 11 Mar 2025 13:30:13 +0000
X-Gm-Features: AQ5f1Jp3UtuRRhR-96fKi5aM9eNN6ctPoGEYrjWhhbpHpPNGlFs33K9fIDMWwbw
Message-ID: <CA+V-a8u34cKgccW=qEw=FC34HH+Q6pVmRqeMq7Q_btxqkqNtnQ@mail.gmail.com>
Subject: Re: [PATCH net-next 6/7] dt-bindings: deprecate "snps,en-tx-lpi-clockgating"
 property
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, 
	Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Minda Chen <minda.chen@starfivetech.com>, 
	netdev@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Abeni <pabeni@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_063040_554834_C9147315 
X-CRM114-Status: GOOD (  16.27  )
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

T24gU3VuLCBNYXIgOSwgMjAyNSBhdCAzOjEz4oCvUE0gUnVzc2VsbCBLaW5nIChPcmFjbGUpCjxy
bWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4KPiBXaGV0aGVyIHRoZSBNSUkgdHJh
bnNtaXQgY2xvY2sgY2FuIGJlIHN0b3BwZWQgaXMgcHJpbWFyaWx5IGEgcHJvcGVydHkKPiBvZiB0
aGUgUEhZICh0aGVyZSBpcyBhIGNhcGFiaWxpdHkgYml0IHRoYXQgc2hvdWxkIGJlIGNoZWNrZWQg
Zmlyc3QuKQo+IFdoZXRoZXIgdGhlIE1BQyBpcyBjYXBhYmxlIG9mIHN0b3BwaW5nIHRoZSB0cmFu
c21pdCBjbG9jayBpcyBhIHNlcGFyYXRlCj4gaXNzdWUsIGJ1dCB0aGlzIGlzIGFscmVhZHkgaGFu
ZGxlZCBieSB0aGUgY29yZSBEZXNpZ25XYXJlIE1BQyBjb2RlLgo+Cj4gVGhlcmVmb3JlLCBzbnBz
LGVuLXR4LWxwaS1jbG9ja2dhdGluZyBpcyB0ZWNobmljYWxseSBpbmNvcnJlY3QsIHNvIHRoaXMK
PiBjb21taXQgZGVwcmVjYXRlcyB0aGUgcHJvcGVydHkgaW4gdGhlIGJpbmRpbmcuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgPHJtaytrZXJuZWxAYXJtbGludXgub3Jn
LnVrPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3NucHMs
ZHdtYWMueWFtbCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgoKUmV2
aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5l
c2FzLmNvbT4KCkNoZWVycywKUHJhYmhha2FyCgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxkd21hYy55YW1sCj4gaW5kZXggM2YwYWE0NmQ3
OThlLi43OGIzMDMwZGM1NmQgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMueWFtbAo+IEBAIC00OTQsNiArNDk0LDcgQEAg
dGl0bGU6IFN5bm9wc3lzIERlc2lnbldhcmUgTUFDCj4KPiAgICBzbnBzLGVuLXR4LWxwaS1jbG9j
a2dhdGluZzoKPiAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL2Zs
YWcKPiArICAgIGRlcHJlY2F0ZWQ6IHRydWUKPiAgICAgIGRlc2NyaXB0aW9uOgo+ICAgICAgICBF
bmFibGUgZ2F0aW5nIG9mIHRoZSBNQUMgVFggY2xvY2sgZHVyaW5nIFRYIGxvdy1wb3dlciBtb2Rl
Cj4KPiAtLQo+IDIuMzAuMgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
