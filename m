Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDEDC4345F
	for <linux-riscv@archiver.kernel.org>; Sat,  4 May 2024 14:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WXXDGo+RdviePVi78V0/A6YTx9UYvsE/VeDEJRNhwTQ=; b=d30YLIBjtpyAGL2v1k65CCscMU
	ONPZbYbylOSXPoD+29NfOWD6SX0WYVuyO/Ck5hbTyNG1sKRn64V06HUH2U3iNLnJsElac8iJzZDcb
	3bQKX38M1s3m1x6kIMAR1DhbuYhVPCgduT/MdylHBcOIG6DOcG11f9zxWqUb7EiuwZQet5uLUH85a
	D3MwTgtcv5Hz2htLJt5BSJ/6JopPYcV29+hicW85odrVijeGUzVsykH8o+MMEpCggHH3Dc4/CWezx
	CU4XD21vUorr8MZqAeEhLq4ULhUgnLfR95kUM1elysWsdKnQwQP1TPLAJjQJLwQaoIC/VSYanuuPn
	pDZLZ12Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3Fxo-00000002Clr-3RWn;
	Sat, 04 May 2024 14:02:08 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3Fxk-00000002ClI-18NN
	for linux-riscv@lists.infradead.org;
	Sat, 04 May 2024 14:02:06 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 047043FE4F
	for <linux-riscv@lists.infradead.org>; Sat,  4 May 2024 14:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714831322;
	bh=w1wKLlddgNLRY7sVTw/AmzrPkB5NtGmCyXfNQGsnsrU=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Xdi6esao+nKtAxvZ7ny2Iq8SNX7Rlp8TJBlAe0ohjY8RO5PfikwXxRN41QCvHiYDA
	 CUHxcqDgn+moO+LkXVpTMGAVolT1cuk2lkKGbUTln4EgCUpxIf0f3T2U+ysYsM323G
	 x/CMpyqOrbEX6cIf65yOaZdeKSELacdOi/7xUQFRZzIT4Df/H3hXUORDWmTIEe6zJB
	 zyutMEjNr5wFVRn3EXTiGwDPclaocebA5iUqTSOSGOeJ3Up+s9w7BfpI+T7YRNIC0h
	 lsrgfURqq13NFwB3eTE9ogTXFIB4bSYESQG2Gf1cLRXMxVEN2LOguZNv3SEYouI/27
	 fhgUHupcCw30Q==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-439e8824c7dso9567941cf.0
        for <linux-riscv@lists.infradead.org>; Sat, 04 May 2024 07:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714831321; x=1715436121;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w1wKLlddgNLRY7sVTw/AmzrPkB5NtGmCyXfNQGsnsrU=;
        b=ZwgFkvdMoHzo/JHV/8Cm/v5tiu9r5xDj3Pz2y1n+DZLx8qlrA1ustGwB9ueyR5RTG+
         EdEdJzYHEwe89mq6/4EC1RjNTvQICLIL2FJqxx3bdbu109DbEFdGnwDpBuEgz5vt1AiO
         frv9ur5xtbtwHqQp8vEUO4xYm9PRjZ+F5eYfdtK4IyQ6awPbFa2ZFTAv8TcmfyCz2NlB
         xL5je64J6BIko6HJZFMLV0RlId13/hQGkJSkbmafb7XAT8dugz+ZvBM6HnF37GdgwKLA
         DKEboD7nG4gF9/Ys/oicj65NzQLJEV3L0O6tEeCkxoLpG/N3EGxL3I9vlSAVdsgsk7ww
         zxKg==
X-Gm-Message-State: AOJu0YyP2xEcBG7y0r5RFSHrZEfMLoMJCwjw55S9LVAV4qY2e9GRrzCY
	IG2cf2jwdiwAtfr3ED8C5jBys25Z1VHPFkAJGTpPCH070By746/gEA9rT9JoDIBEaxGv64SyNtb
	8h2jBY34cc0+hcl8q4XZg6ol0XHWATyMo0VfTIEU50LrZosX5+6pjUXZW9s4+gib5SMXdEjF14M
	C5SBSGPdXNI3BSFq/fL57FBTu1bm3jgcbGiLelSCdmJKuouMDFE7YsBGJu
X-Received: by 2002:a05:622a:251:b0:43a:3856:4536 with SMTP id c17-20020a05622a025100b0043a38564536mr6720469qtx.17.1714831321008;
        Sat, 04 May 2024 07:02:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGZgnGwlr5MlquzRD3HBD2jghIOPUIuKhTSH7FRuH4CWfIUsVkG3VAkY/u8aMaKyJFPxi8z4makbKpQ28f8LU=
X-Received: by 2002:a05:622a:251:b0:43a:3856:4536 with SMTP id
 c17-20020a05622a025100b0043a38564536mr6720450qtx.17.1714831320756; Sat, 04
 May 2024 07:02:00 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 4 May 2024 16:02:00 +0200
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <CAK7LNATbseQCgjAUDemNoo9zPd_iSb+4Gz9TaW2YkOKcp3CSEQ@mail.gmail.com>
References: <20240502111613.1380453-1-emil.renner.berthing@canonical.com>
 <20240502111613.1380453-4-emil.renner.berthing@canonical.com> <CAK7LNATbseQCgjAUDemNoo9zPd_iSb+4Gz9TaW2YkOKcp3CSEQ@mail.gmail.com>
Mime-Version: 1.0
Date: Sat, 4 May 2024 16:02:00 +0200
Message-ID: <CAJM55Z-MMcePewnMsmTqHtcjLiCnmMMLawtJxPcXs8r1Sr6n4g@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] kbuild: buildtar: install riscv compressed images
 as vmlinuz
To: Masahiro Yamada <masahiroy@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Nick Terrell <terrelln@fb.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240504_070204_466739_72A1ABAA 
X-CRM114-Status: GOOD (  15.89  )
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

TWFzYWhpcm8gWWFtYWRhIHdyb3RlOgo+IE9uIFRodSwgTWF5IDIsIDIwMjQgYXQgODoxNuKAr1BN
IEVtaWwgUmVubmVyIEJlcnRoaW5nCj4gPGVtaWwucmVubmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5j
b20+IHdyb3RlOgo+ID4KPiA+IFVzZSB0aGUgS0JVSUxEX0lNQUdFIHZhcmlhYmxlIHRvIGRldGVy
bWluZSB0aGUgcmlnaHQga2VybmVsIGltYWdlIHRvCj4gPiBpbnN0YWxsIGFuZCBpbnN0YWxsIGNv
bXByZXNzZWQgaW1hZ2VzIHRvIC9ib290L3ZtbGludXotJHZlcnNpb24gbGlrZSB0aGUKPiA+ICdt
YWtlIGluc3RhbGwnIHRhcmdldCBhbHJlYWR5IGRvZXMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
RW1pbCBSZW5uZXIgQmVydGhpbmcgPGVtaWwucmVubmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5jb20+
Cj4gPiAtLS0KPiA+IFRoaXMgcGF0Y2ggZGVwZW5kcyBvbiBNYXNhaGlybydzIHBhdGNoIGF0Cj4g
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwNDE0MTc0MTM5LjMwMDExNzUtMS1tYXNh
aGlyb3lAa2VybmVsLm9yZwo+Cj4gVGhhbmsgeW91IGZvciBmaXhpbmcgdGhlIGlzc3VlIGZvciBy
aXNjdi4KPiBPbmx5IHRoZSBxdWVzdGlvbiBJIGhhdmUgaXMgaG93IHRoaXMgcGF0Y2ggc2VyaWVz
IGdldHMgaW4uCj4gSWYgaXQgd2FpdHMgZm9yIHRoZSBuZXh0IGRldmVsb3BtZW50IGN5Y2xlLCBp
dCB3aWxsIGJlCj4gY2xlYW5seSBhcHBsaWNhYmxlLgoKSSdtIG9rIHdpdGggd2FpdGluZywgYnV0
IG90aGVyd2lzZSBQYWxtZXIgY291bGQgdGFrZSBwYXRjaCAxIGFuZCAyIGFuZCB5b3UKY291bGQg
dGFrZSBwYXRjaCAzLiBUaGUgd29yc3QgdGhhdCBjYW4gaGFwcGVuIGlzIHRoYXQgYSBiaXNlY3Qg
bGFuZHMgb24geW91cgpicmFuY2ggdGhhdCB3aWxsIG9ubHkgcGFja2FnZSB0aGUgdW5jb21wcmVz
c2VkIEltYWdlIGluIHRoZSB0YXJiYWxscyBldmVuIGlmCkltYWdlLmd6IG9yIEltYWdlLmJ6MiBl
eGlzdC4gQ09ORklHX0VGSV9aQk9PVD15IGFuZCBDT05GSUdfWElQX0tFUk5FTD15X2tlcm5lbHMK
d2lsbCBhbHNvIGJlIGZpbmUgd2l0aCBvbmx5IHBhdGNoIDMgYXBwbGllZC4KCj4gQW55d2F5LAo+
Cj4gQWNrZWQtYnk6IE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+CgpUaGFu
a3MhCgovRW1pbAo+Cj4KPgo+Cj4gLS0KPiBCZXN0IFJlZ2FyZHMKPiBNYXNhaGlybyBZYW1hZGEK
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
