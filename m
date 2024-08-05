Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C27EC3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 18:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sw08uhxVbvfjgf3vE3w74ljkOPn7Oc0KBGh5K4namjw=; b=NtKvENyII0HdDM
	vLHKk+wctKDXMDrtNyrMRoSyyPeW53eCsNFCOKoiFquqUV97xF1iOey30WvCOz2cTtwChqkuh4oky
	sKg1tu6iHXaOndIWwr65dS5VxnzT0pRC0IlynwZIDhQMm/P/UmZM4PYGsj7UUpbfywawEa6M9K1KD
	Uol/Svjdpx2H1St9CFCD7J0At1yCON+o+Q6go1h2G/Rd/u51x/DFuWa8pZYgOAv4UcdhgEIpGleRh
	dg4aiiwnKAKm5LgKM64IZmbiSrsV5DEJ/PDKdwSWFBFqxQKqU4nwdhqOCuvkdtplIg5kyCZh0tvuQ
	c6lY2Wy4miDhfWLnHLPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb2bp-0000000GtcT-2cgL;
	Mon, 05 Aug 2024 18:39:05 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb2bm-0000000Gtbf-2zcL
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 18:39:04 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5b01af9b0c9so9968741a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2024 11:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722883140; x=1723487940; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0fHi9KsdL/dhg3Iq7FZic1Ag2yGSv3KBsY4wPIKoXc=;
        b=uTibUDUvZrqbVgHKLe1MwXJugrXZTne1T/PVCxws318TB8wMqaPaZTJND7ioYAgRcK
         zhh21qp71ylz4GMaJJNT0zgFTuinFrF9icydDMipTL4xPy2ShO+3eIiisf1TsWHawAFU
         /cSDGtXW+lHxpzZtQmamG7XLbOVxkUfn1dZtRsHvZrZA9ZzQXXaQmDb82Y94GewS/u8Z
         j4akZJFI6jLhQOEvUksInhjrsA2saua1hQKFNiXRuCPzrE1/LdMcW8sQN6F78qce8eTW
         Yvp2ElSog+0wDF3YuA7zDCjOiycSEy5QKWEvlppCKW0Apau/cCpxRmXfUu39rXCqNCkR
         7kQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722883140; x=1723487940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z0fHi9KsdL/dhg3Iq7FZic1Ag2yGSv3KBsY4wPIKoXc=;
        b=VET4JNAALIUMZ8sPLZoUbzHHNGDJlR2eqR9CFm40CAyEwGodT+TR6hd4gEGN0JGtE7
         QvOt4WquXD4NncDUGsewRA0G2ERcFpO8sd4oDGzGdnQzXrfv/JEVmjaeGJQdjDJx8mQk
         0hQr9Bm/2FEyEnE7Y3DL1g+mZ7IGLedSg252ru3bH222e/1b31SrT22RkjkkXJXcbCon
         bc1WA0Zlyza50p1rpglCqlLT4Gv/37MfJfkslWFXU8lL579/iIqwDKYoqW6DjUAqr51z
         WTwUXV44W0KjP13sShJqOWnDMNXPpZqFekHLoES+UyvBm+rKy69DjBlAkzLj14VvG0Xi
         +HBw==
X-Gm-Message-State: AOJu0YypRyQybQnES4p/ODrDYB3WLCXNYSxZ6Vp4XrASHlAk7MG4l1uS
	f+dXFumr+jCfllWBRXDXv1ytgJNDVCL/X11Ez+aPA9SJWF9eGuyOsKlwpsGe8TdPKSAl2FcvpJ+
	9WO6lqE58XioW9O8j+PUe0FgfaGF4njcUanmXXA==
X-Google-Smtp-Source: AGHT+IHGDWiYA4gxxfNGX16WDAPwnIZq8VLG/7+YcSFFrHFbrxAB9lU1euM5kVqthhxJ26B5ZI3RZy5fWZ0Q/yhpQmQ=
X-Received: by 2002:a17:907:7204:b0:a7a:b070:92d1 with SMTP id
 a640c23a62f3a-a7dc517b48dmr937619966b.46.1722883139711; Mon, 05 Aug 2024
 11:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240805173816.3722002-1-jesse@rivosinc.com>
In-Reply-To: <20240805173816.3722002-1-jesse@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Mon, 5 Aug 2024 11:38:23 -0700
Message-ID: <CALs-HstYwwgPAOP22V1A6iTX85eRqRp4b4039pewsDHus_dLgQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] RISC-V: Add parameter to unaligned access speed
To: Jesse Taube <jesse@rivosinc.com>
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
X-CRM114-CacheID: sfid-20240805_113902_922881_97A7CF93 
X-CRM114-Status: GOOD (  11.37  )
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

T24gTW9uLCBBdWcgNSwgMjAyNCBhdCAxMDozOOKAr0FNIEplc3NlIFRhdWJlIDxqZXNzZUByaXZv
c2luYy5jb20+IHdyb3RlOgo+Cj4gQWRkIGEga2VybmVsIHBhcmFtZXRlciB0byB0aGUgdW5hbGln
bmVkIGFjY2VzcyBzcGVlZC4gVGhpcyBhbGxvd3MKPiBza2lwaW5nIG9mIHRoZSBzcGVlZCB0ZXN0
cyBmb3IgdW5hbGlnbmVkIGFjY2Vzc2VzLCB3aGljaCBvZnRlbiBpcyB2ZXJ5Cj4gc2xvdy4KPgo+
IFNpZ25lZC1vZmYtYnk6IEplc3NlIFRhdWJlIDxqZXNzZUByaXZvc2luYy5jb20+CgpIb3cgY29t
ZSB0aGlzIGlzIGEgY29tbWFuZCBsaW5lIHBhcmFtZXRlciByYXRoZXIgdGhhbiBhIEtjb25maWcK
b3B0aW9uPyBJIGNvdWxkIGJlIHdyb25nLCBzbyBJJ2xsIGxheSBvdXQgbXkgcmF0aW9uYWxlIGFu
ZCBwZW9wbGUgY2FuCnBpY2sgaXQgYXBhcnQgaWYgSSd2ZSBnb3QgYSBiYWQgYXNzdW1wdGlvbi4K
CkkgdGhpbmsgb2YgY29tbWFuZGxpbmUgcGFyYW1ldGVycyBhcyAobW9zdGx5KSBzb21ldGhpbmcg
ZW5kIHVzZXJzCnR3aWRkbGUgd2l0aCwgdmVyc3VzIGtjb25maWcgb3B0aW9ucyBhcyBzb21ldGhp
bmcgc3lzdGVtIGJ1aWxkZXJzIHNldAp1cC4gSSdkIGxhcmdlbHkgZXhwZWN0IGVuZCB1c2VycyBu
b3QgdG8gbm90aWNlIHR3byB0aWNrcyBhdCBib290IHRpbWUuCkknZCBleHBlY3QgaXRzIHN5c3Rl
bSBidWlsZGVycyBhbmQgZmxlZXQgbWFuYWdlcnMsIHdobyBrbm93IHRoZWlyCmhhcmR3YXJlIGFu
ZCBidWlsZCB0aGVpciBrZXJuZWxzIG9wdGltaXplZCBmb3IgaXQsIGFyZSB0aGUgb25lcyB3aG8K
d291bGQgd2FudCB0byBzaGF2ZSBvZmYgdGhpcyB0aW1lIGFuZCBnbyBzdHJhaWdodCB0byB0aGUg
a25vd24gYW5zd2VyLgpBbmVjZG90YWxseSwgYXQgQ2hyb21lT1Mgd2UgaGFkIGEgc3Ryb25nIHBy
ZWZlcmVuY2UgZm9yIEtjb25maWcKb3B0aW9ucywgYXMgdGhleSB3ZXJlIGVhc2llciB0byBjb21w
b3NlIGFuZCBtYWludGFpbiB0aGFuIGEgbG9vc2UgcGlsZQpvZiBjb21tYW5kbGluZSBhcmd1bWVu
dHMuCgpUaGUgY29tbWl0IHRleHQgZG9lc24ndCBnbyBpbnRvIHRoZSByYXRpb25hbGUsIGludGVu
ZGVkIGF1ZGllbmNlLCBvcgpleHBlY3RlZCB1c2FnZSwgc28gbWF5YmUgbXkgZ3Vlc3NlcyBtaXNz
IHRoZSBtYXJrIG9uIHdoYXQgeW91J3JlCnRoaW5raW5nLgotRXZhbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
