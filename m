Return-Path: <SRS0=FKry=J7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50497C433B4
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 13:19:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7B7D613C7
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 13:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7B7D613C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GxHJiyVTQo2IScPDaa2Aa8zj1OWX4Vw4IuUyZ/iyO6k=; b=Bibc79ErJ1m5NUGOWni2WKoEg
	q5rCgMxd9xUVDJol1jfcmE7j2nI6PKcszaZ6x6Cs161f2JKL6ckEX6jIvi61bJ7HFjOxuf8rFajYk
	ZKOFDyr2Wo9XTgZEPZsAuMKuXYo+y4f6iUgx6wU9A2qIMQuiwsoVOXV11klWAAUCZMFQiERfVfNHI
	3UXCdcpa0ZsmgilGJBhynKRaGa5aU3H34PCEhNo/08hp/COq6Q2IkXWZpg9QFUSSZDZEYtfc3UVux
	yp1E2AEvv6r8bavwLvcpDFNarm1UAz09lPIvaygbvNfRsn5Aaa7g92Jh+qka0s+iYQnGe3qdUZevI
	lKm2NCfgQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldux4-00GFlg-Sg; Tue, 04 May 2021 13:19:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldux3-00GFlK-Bx; Tue, 04 May 2021 13:19:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=CblgwW7Ud4f+9B1bK3aZ/7Lhxg480Ys59O+QR93vR6A=; b=O+iqx/qYJ3/UsWkI3SIzDNUWvP
 yK3aCJulygvtqXTpN9zfmelWMSdi9T5YRpQIAtpLYuTNqM+TB+IOXtA4+M5ROICJofJOb0rpyGGiV
 12g0e343vmj1Cvzec8qOE8eQRXYSip1TKqvHbBiDF9lODGq1GZe+Xr22anZ+2xRkihHr1FhxoS46S
 /v1cJnaosRI5JQe87qS7X9W62PcKFJIDf/N35sKmKyOvTZsIQj953c1BNDDkUdMh28B2JpY6Seexo
 tXNo8dcRt+2LKSN3VbQuO/RHeHR0KJXJtM6MXRBbDc/MqiVqWNCUKg0erzRKZgguehNDOm4hTIPFM
 38IyxOwA==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldux0-003zd0-Rj; Tue, 04 May 2021 13:19:00 +0000
Received: by mail-pf1-x435.google.com with SMTP id x188so5328782pfd.7;
 Tue, 04 May 2021 06:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CblgwW7Ud4f+9B1bK3aZ/7Lhxg480Ys59O+QR93vR6A=;
 b=HUCmFuhh8rWhVdsZN+H9ct9cpQQQ8X/8g5TSNpCqhizZ8EbPmq5SSLxpKk2jeUMdaX
 Tj9yd9u0iJ0+fauwyryct8gHTiPFZj6s+oGlCBMXIEenq7xhQhcoDyUjJJnTvFcswe4G
 kvI65Ho+kQrl2l3KFtE6JOsBNLDlKGMenC/VffsODCsr4+WtgNGh8Vdn/eHvTRdHQyrt
 XMRsS43lgRgSqlQQPaedD7v9I5rEUNCo2b0cfLiNvnFweSGe0SD5mJrLPaklTOGdbo/x
 q0TOBJBYgVHNa+tO2YzSKYk817yKK3IV1bzf14n9rSOL8mbUx4mXvj74RSVzQHw+2W9K
 Tr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CblgwW7Ud4f+9B1bK3aZ/7Lhxg480Ys59O+QR93vR6A=;
 b=nXfOzoYk5wskb5cPd7a/9PyqlVMLaQdiW/YQrqxC9XfgLSfcMVU4zUobc1g768s8d6
 OG8nO9P8TeRgR/l0qa5Ig5btRlRXbEBd0cC0ERxtAsbmUNsOdlZe3RsCq9D/dYT1sem/
 mNMXxYIaeRLI//0S0+G3hCgl9hNdInAX4GltizlWVbShQRkq3cIcm35/1SDxhBStPs/y
 PgbsFwjy+zn8LN4FESL9hZeaK4ASMuGE1M0ChW/LqMEv4Gg+bbLEAimxURUVbQv9fmvB
 wHSU8hqvGN8rQTEnb+S11W+yD3vdEELeNFNtqnzp+29BTthGh5vnq+t8po/GKikNENnl
 ZBOw==
X-Gm-Message-State: AOAM532We0Hc8Z0pJYgTzAeAFajxIRELlAX6I+ttfIS/Sj2xjoWBppFI
 K/JqhfMXNaq9+g3EgrbHDZut2XuufOYUZgk7+x8=
X-Google-Smtp-Source: ABdhPJx5/8RQyp1LMuT4Dl9J/CS/IVFtFhu6zNbV+WzSdT3rLdKRijmds7H+X6buGhqrh+XMoJnP1gnFM230fMgVSDo=
X-Received: by 2002:a17:90a:bd13:: with SMTP id
 y19mr5273402pjr.181.1620134338124; 
 Tue, 04 May 2021 06:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <8b5f1d57-1357-affd-565f-f4826f3ecbdf@csgroup.eu>
In-Reply-To: <8b5f1d57-1357-affd-565f-f4826f3ecbdf@csgroup.eu>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 4 May 2021 16:18:41 +0300
Message-ID: <CAHp75VevBN1AKpZetMfY7tUU0ghjc7_g7Vw=+rPxTfdifqqhFw@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, 
 Linux Documentation List <linux-doc@vger.kernel.org>, 
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Paul Mackerras <paulus@samba.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_061858_931663_3D140BF9 
X-CRM114-Status: GOOD (  17.10  )
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

T24gTW9uLCBNYXkgMywgMjAyMSBhdCA5OjE3IEFNIENocmlzdG9waGUgTGVyb3kKPGNocmlzdG9w
aGUubGVyb3lAY3Nncm91cC5ldT4gd3JvdGU6Cj4gTGUgMDEvMDUvMjAyMSDDoCAxNzoxNSwgTWFz
YWhpcm8gWWFtYWRhIGEgw6ljcml0IDoKPiA+IFRoZSBjdXJyZW50IG1pbmltdW0gR0NDIHZlcnNp
b24gaXMgNC45IGV4Y2VwdCBBUkNIPWFybTY0IHJlcXVpcmluZwo+ID4gR0NDIDUuMS4KPiA+Cj4g
PiBXaGVuIHdlIGRpc2N1c3NlZCBsYXN0IHRpbWUsIHdlIGFncmVlZCB0byByYWlzZSB0aGUgbWlu
aW11bSBHQ0MgdmVyc2lvbgo+ID4gdG8gNS4xIGdsb2JhbGx5LiBbMV0KPiA+Cj4gPiBJJ2QgbGlr
ZSB0byBwcm9wb3NlIEdDQyA1LjIgdG8gY2xlYW4gdXAgYXJjaC9wb3dlcnBjL0tjb25maWcgYXMg
d2VsbC4KPgo+IE9uZSBwb2ludCBJIG1pc3NlZCB3aGVuIEkgc2F3IHlvdXIgcGF0Y2ggZmlyc3Qg
dGltZSwgYnV0IEkgcmVhbGlzZWQgZHVyaW5nIHRoZSBkaXNjdXNzaW9uOgo+Cj4gVXAgdG8gNC45
LCBHQ0Mgd2FzIG51bWJlcmVkIHdpdGggMyBkaWdpdHMsIHdlIGhhZCA0LjguMCwgNC44LjEsIC4u
LiA0LjguNSwgNC45LjAsIDQuOS4xLCAuLi4uIDQuOS40Cj4KPiBUaGVuIHN0YXJ0aW5nIGF0IDUs
IEdDQyBzd2l0Y2hlZCB0byBhIDIgZGlnaXRzIHNjaGVtZSwgd2l0aCA1LjAsIDUuMSwgNS4yLCAu
Li4gNS41Cj4KPiBTbywgdGhhdCBpcyBub3QgR0NDIDUuMSBvciA1LjIgdGhhdCB5b3Ugc2hvdWxk
IHRhcmdldCwgYnV0IG9ubHkgR0NDIDUuCj4gVGhlbiBpdCBpcyB1cCB0byB0aGUgdXNlciB0byB1
c2UgdGhlIGxhdGVzdCBhdmFpbGFibGUgdmVyc2lvbiBvZiBHQ0MgNSwgd2hpY2ggaXMgNS41IGF0
IHRoZSB0aW1lCj4gYmVnaW4sIGp1c3QgbGlrZSB0aGUgdXNlciB3b3VsZCBoYXZlIHNlbGVjdGVk
IDQuOS40IHdoZW4gNC45IHdhcyB0aGUgbWluaW11bSBHQ0MgdmVyc2lvbi4KCkFuZCB3ZSBtYXkg
ZW5kIHVwIGluIHRoZSBjYXNlIHdoZW4gZ2NjIDUueCB3aWxsIGJlIG1vcmUgYnVnZ3kgdGhhbgp2
NC45LnkgKGFzIG9uY2UgcHJvdmVkIGJ5IG5pY2UgZGV0ZWN0aXZlIHN0b3J5IHdoZXJlIGNvbXBp
bGVyIGJ1Zwpwcm9kdWNlcyBhIGZpbGUgc3lzdGVtIGNvcnJ1cHRpb24pLgoKLS0gCldpdGggQmVz
dCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
