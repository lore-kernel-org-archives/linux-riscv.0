Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C67C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 22:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J3Igb7Qp4tZ+cr7qmP0db7lUdEfDRSB00W8ArmUJpGw=; b=A4VLpc9Yhqvbwj
	PyMK+ReiOlfkFI6IWRxJKfB+KAEm8XJwyh5MDDp2imggeu9T39XBFP+r+/3n5POZGwOz+qKqE3Ev4
	UxCQAFwQPV/CfMMNgB5hD9/v+GFsxPYISC1UxKLSQwAz7mZ/7kx3z84AjNtNIk8WlEzPUjyEHHFlw
	6bORVCaVMOtS5DpW/9gAksFR0CKWIsvH26l+P2Oo3knbiwb9pi0FrlCEzlPhgp1JdZVMj/HAdRzDI
	kvLxdsRJO9Pbrw66AyX1Oh2U1wc0PY5TQZARGCBsroJ1rDknXlfF4SabsYUIKcHcR2uV3H2wz9eA9
	QQbzMo4/gxYjIMTO3rEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7N44-000000032hO-0SAm;
	Wed, 15 May 2024 22:25:36 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7N40-000000032f9-0sCd
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 22:25:34 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-41fd5dc0439so50880865e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 May 2024 15:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1715811927; x=1716416727; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BI857sayZDwQNSg5pPJ106rwXLFaEfhCLfpMtQ/x5oA=;
        b=mxBH1DFGt5n6l97uMZ4xJjrsezV16ZHNNdIyuK52B7SR/a7hub9LPtQ27R8fIZMnRa
         /9z9B4eGIRArEhRJ/zzdbk3BUaoxPSt9uPhoIcqbDUuQNkEkYkcQZCkpY7jPqJOTZ94R
         Lwi5dkfRb37pUc3TKcZaim4hz8gURVRjPC8RmipYWBLfyDf0reCfakWr7R/+Q5IFhVI8
         zrkEcdYMHvwLRV9It3aRvxrfUXYZO3KT5/OHGdqo7el2a8aCAqsiKcneFOWvtypVThvg
         KNdnX5bSAT+nbfojgukwcNxx2/r5klas8i4Y5wgob8A8JUN5YNYvvhy5ElPNTpSk5F1/
         dZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715811927; x=1716416727;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BI857sayZDwQNSg5pPJ106rwXLFaEfhCLfpMtQ/x5oA=;
        b=mFdyLnCfh2UuCPlqSLhLKdE3Xc6briGRgo9DqtdedWVkBxJj7ZXWLY6XXP3hZX3V9e
         5mbf+18FoG3BuI/SzPAfVaGkNyARDl2xT+Hhi64z4JwRuUlET1uWjIQ4RnC8HByzd952
         fWiWMAgYmm2tnV6niOcYzzLdDwBsDfemEcFmDXPUg3xrAzQ8OQcUEj+lXsJ3ZxVl7Xz8
         G5HGtSGD7bi+8qbIa4TcytXoCA+KVGfqSWVLOImVZigXGVnR9ebcne3H0pmJMQ83i3az
         YKDi4vb78eThGeEO0aNnPRH028BhoQoftGBXPW32pvLl5sNdHTRJ7PI4pmTPHdMrgiBp
         318g==
X-Forwarded-Encrypted: i=1; AJvYcCXXE8SIUy34YoUnDFapSzHCixRrIDYat3wo5fF59PWg33lgWxFykxNQhGfWmC1ywLkWnEUPrJO5KmQzQ66sEjiM69uZBpfY4kGhZmTaCHkB
X-Gm-Message-State: AOJu0YxOBFL18nJVtgm+haOAY5gF2lMeR0I33F/cwaw7+ZBDR9WhSCoA
	xApPin8IReWermoKMoCz2lE2F6sDEjQLVIpIqcIkANXxt5NHGeVF56KgP65xUg8=
X-Google-Smtp-Source: AGHT+IENgjSLQxs5gKBtSC3SHE6IkKb3zYvJJgsyZKLJ07yLL95UOkkK/ds1ZAYyov1qy7vJDUKK1A==
X-Received: by 2002:a05:600c:1d1c:b0:420:98d:e101 with SMTP id 5b1f17b1804b1-420098de3c7mr107812905e9.15.1715811927173;
        Wed, 15 May 2024 15:25:27 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42009eda143sm184412385e9.14.2024.05.15.15.25.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2024 15:25:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH 0/2] riscv: Allow vlenb to be probed from DT
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20240515-add_vlenb_to_dt-v1-0-4ebd7cba0aa1@rivosinc.com>
Date: Wed, 15 May 2024 23:25:16 +0100
Cc: Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>
Message-Id: <A9EDD470-B8EC-4644-82A0-7444729EF885@jrtc27.com>
References: <20240515-add_vlenb_to_dt-v1-0-4ebd7cba0aa1@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_152532_752893_48B5B0BF 
X-CRM114-Status: GOOD (  13.08  )
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

T24gMTUgTWF5IDIwMjQsIGF0IDIyOjUwLCBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3Np
bmMuY29tPiB3cm90ZToKPiAKPiBUaGUga2VybmVsIGN1cnJlbnRseSByZXF1aXJlcyBhbGwgaGFy
dHMgdG8gaGF2ZSB0aGUgc2FtZSB2YWx1ZSBpbiB0aGUKPiB2bGVuYiBjc3IgdGhhdCBpcyBwcmVz
ZW50IHdoZW4gYSBoYXJ0IHN1cHBvcnRzIHZlY3Rvci4gSW4gb3JkZXIgdG8gcmVhZAo+IHRoaXMg
Y3NyLCB0aGUga2VybmVsIG5lZWRzIHRvIGJvb3QgdGhlIGhhcnQuIEFkZGluZyB2bGVuYiB0byB0
aGUgRFQgd2lsbAo+IGFsbG93IHRoZSBrZXJuZWwgdG8gZGV0ZWN0IHRoZSBpbmNvbnNpc3RlbmN5
IGVhcmx5IGFuZCBub3Qgd2FzdGUgdGltZQo+IHRyeWluZyB0byBib290IGhhcnRzIHRoYXQgaXQg
ZG9lc24ndCBzdXBwb3J0LgoKVGhhdCBkb2VzbuKAmXQgc2VlbSBzdWZmaWNpZW50IGp1c3RpZmlj
YXRpb24gdG8gbWUuIElmIGl0IGNhbiBiZSByZWFkCmZyb20gdGhlIGhhcmR3YXJlLCB3aHkgc2hv
dWxkIHdlIGhhdmUgdG8gcHV0IGl0IGluIHRoZSBGRFQ/IFRoZSB3aG9sZQpwb2ludCBvZiB0aGUg
RkRUIGlzIHRvIGNvbW11bmljYXRlIHRoZSBoYXJkd2FyZSBjb25maWd1cmF0aW9uIHRoYXQKaXNu
4oCZdCBvdGhlcndpc2UgZGlzY292ZXJhYmxlLgoKQXMgZm9yIFQtSEVBRCBzdHVmZiwgaWYgdGhl
eSBuZWVkIGl0IHRoZXkgY2FuIGhhdmUgYSBjdXN0b20gcHJvcGVydHkuClRob3VnaCBuYWl2ZWx5
IEnigJlkIGFzc3VtZSB0aGVyZeKAmXMgYSB3YXkgdG8gYXZvaWQgaXQgc3RpbGwuLi4KCkplc3MK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
