Return-Path: <SRS0=FKry=J7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B41C433ED
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 02:14:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71FD361168
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 02:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71FD361168
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UjqyxecJ90EA6ar/LHNJOkwcEuu+fVcRZ0UpSrLsqRQ=; b=h/ybb9A1VutKbxT0LoRnH90d1
	VQ2/XzOW+n82xdGe0W1IUPg79GFsliqFuVCwCx2fp7dM3g1zjEt9+O4qytzmaOZn8tuUvW/DG4e67
	raxX/oB7A0EvG03rHArSnLNokHXD2Wu1f3stpVSo3KVfusYXwtm+tQEII97NFlJK8h1+vkpfpA1nC
	0uXxfpVxMaMlAQVSe/omoqFoArRnI1Js6fA0qNIdYlxDUgDN8HVlc74jPwpZam2n0SXnsx6rnSb+Z
	9MYUuJv9fyboD4mWL6ME15Tu2j51IukPgqDgpWvAi1biyP6zER8Dgdgtx0Wt3b53b41wajrzXZI/x
	uIENIV0AQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldkZo-00FF33-M1; Tue, 04 May 2021 02:14:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldkZZ-00FF2J-M9; Tue, 04 May 2021 02:14:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=Flpk8WY3fI6JRVmVx74VCPIcuW76pW3yvcKLrKEQfcI=; b=dkaEjFv9VrffNMdhAbE31eS5EF
 QXX2CnSpArOPdi01Vsp5DHUSoEyqF7muZKyp1hGL+v5+shWWxorT5OnHOrByOqUVgq6i4O2b1of2t
 3yhJCbwpGemG5GN56XGVfeuhQhkdIbri2+QIFOyt29ChWDuN2TRuo1KD6b0mok61wPPHxMqtsV8FR
 spKkkOnL2VuS5O2FlCr4YMG8w7TxSPycwm9MzuAXFglli7/DynpkYCRcllS8AnHo74xatssYwUN2N
 h6apF8os3GJAVlwkEq2U16EMzhoKndo8oedDqQjGYJu3HMFuGM1fUfiMbOJF3YZGv2ConpziTqW7v
 CHBEpo9Q==;
Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldkZW-003cZ8-KX; Tue, 04 May 2021 02:14:04 +0000
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id 1442Dd4c009729;
 Tue, 4 May 2021 11:13:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 1442Dd4c009729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1620094420;
 bh=Flpk8WY3fI6JRVmVx74VCPIcuW76pW3yvcKLrKEQfcI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RcPTKSEZuzsHuullksFe1HmFYdJqmuQDvmRuMVscMUnbTGD1IAHfFUx7dg5iV8m8S
 JVq+4OeY8GmRwgM90uoiXxUQ8GBU6DS/UE7YNkMpCRhQjemtdM4gmVoWnXnKkMsZ6P
 wNzX+lqAga+GQCDJEkaLa0RsqmlOeV3Hv1gGqW3xwLbgXdat/s+21f6w35/UYErAzg
 eYPRP+7AosJUwZ/dFtrG0VhYQzao1oonlLYcj98QF0Z/lCQfak8N8Dj6/pM0Hyk1Rm
 0dH6xOgeIDzXhHXf/pxV1d72yKjZLx4ffhCHSdxGwxklgz893YkuvQdstcmBJwRsxN
 0RDuMm6MsEa/Q==
X-Nifty-SrcIP: [209.85.210.182]
Received: by mail-pf1-f182.google.com with SMTP id 10so5933873pfl.1;
 Mon, 03 May 2021 19:13:40 -0700 (PDT)
X-Gm-Message-State: AOAM532t+OOgwok+Yqz+iiBAer2Rv+hTppOQ3gzhSNZmZmZqp8wKptO/
 ONmyC04Ci52NvOD8knUHCLkMEneeiHGM3XrWgXQ=
X-Google-Smtp-Source: ABdhPJzeIVApSQix0BuMNREdE8BGMBMEs/IGqBZW9NLCxeXtWVZOIBXs6zvGuxchr2x095EnqC+MdArD+HY3m1+ob/s=
X-Received: by 2002:a63:e044:: with SMTP id n4mr21297348pgj.47.1620094419287; 
 Mon, 03 May 2021 19:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <8b5f1d57-1357-affd-565f-f4826f3ecbdf@csgroup.eu>
In-Reply-To: <8b5f1d57-1357-affd-565f-f4826f3ecbdf@csgroup.eu>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 4 May 2021 11:13:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNASv=ev=MbA+iXsjQvKGe69+AmL7Ri7WQc9caoZpfyzEgw@mail.gmail.com>
Message-ID: <CAK7LNASv=ev=MbA+iXsjQvKGe69+AmL7Ri7WQc9caoZpfyzEgw@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Paul Mackerras <paulus@samba.org>,
 "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>,
 Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_191403_015309_BE2467C1 
X-CRM114-Status: GOOD (  17.98  )
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

T24gTW9uLCBNYXkgMywgMjAyMSBhdCAzOjE3IFBNIENocmlzdG9waGUgTGVyb3kKPGNocmlzdG9w
aGUubGVyb3lAY3Nncm91cC5ldT4gd3JvdGU6Cj4KPgo+Cj4gTGUgMDEvMDUvMjAyMSDDoCAxNzox
NSwgTWFzYWhpcm8gWWFtYWRhIGEgw6ljcml0IDoKPiA+IFRoZSBjdXJyZW50IG1pbmltdW0gR0ND
IHZlcnNpb24gaXMgNC45IGV4Y2VwdCBBUkNIPWFybTY0IHJlcXVpcmluZwo+ID4gR0NDIDUuMS4K
PiA+Cj4gPiBXaGVuIHdlIGRpc2N1c3NlZCBsYXN0IHRpbWUsIHdlIGFncmVlZCB0byByYWlzZSB0
aGUgbWluaW11bSBHQ0MgdmVyc2lvbgo+ID4gdG8gNS4xIGdsb2JhbGx5LiBbMV0KPiA+Cj4gPiBJ
J2QgbGlrZSB0byBwcm9wb3NlIEdDQyA1LjIgdG8gY2xlYW4gdXAgYXJjaC9wb3dlcnBjL0tjb25m
aWcgYXMgd2VsbC4KPgo+IE9uZSBwb2ludCBJIG1pc3NlZCB3aGVuIEkgc2F3IHlvdXIgcGF0Y2gg
Zmlyc3QgdGltZSwgYnV0IEkgcmVhbGlzZWQgZHVyaW5nIHRoZSBkaXNjdXNzaW9uOgo+Cj4gVXAg
dG8gNC45LCBHQ0Mgd2FzIG51bWJlcmVkIHdpdGggMyBkaWdpdHMsIHdlIGhhZCA0LjguMCwgNC44
LjEsIC4uLiA0LjguNSwgNC45LjAsIDQuOS4xLCAuLi4uIDQuOS40Cj4KPiBUaGVuIHN0YXJ0aW5n
IGF0IDUsIEdDQyBzd2l0Y2hlZCB0byBhIDIgZGlnaXRzIHNjaGVtZSwgd2l0aCA1LjAsIDUuMSwg
NS4yLCAuLi4gNS41Cj4KPiBTbywgdGhhdCBpcyBub3QgR0NDIDUuMSBvciA1LjIgdGhhdCB5b3Ug
c2hvdWxkIHRhcmdldCwgYnV0IG9ubHkgR0NDIDUuCj4gVGhlbiBpdCBpcyB1cCB0byB0aGUgdXNl
ciB0byB1c2UgdGhlIGxhdGVzdCBhdmFpbGFibGUgdmVyc2lvbiBvZiBHQ0MgNSwgd2hpY2ggaXMg
NS41IGF0IHRoZSB0aW1lCj4gYmVnaW4sIGp1c3QgbGlrZSB0aGUgdXNlciB3b3VsZCBoYXZlIHNl
bGVjdGVkIDQuOS40IHdoZW4gNC45IHdhcyB0aGUgbWluaW11bSBHQ0MgdmVyc2lvbi4KPgo+IENo
cmlzdG9waGUKCgoKT25lIGxpbmUgYmVsb3cgaW4gRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2NoYW5n
ZXMucnN0LApJIHNlZQoKICAgICBDbGFuZy9MTFZNIChvcHRpb25hbCkgIDEwLjAuMSAgICAgICAg
ICAgY2xhbmcgLS12ZXJzaW9uCgoKCkNsYW5nIDEwLjAuMSBpcyBhIGJ1ZyBmaXggcmVsZWFzZSBv
ZiBDbGFuZyAxMAoKCkkgZG8gbm90IHRoaW5rIEdDQyA1LjIgaXMgc3RyYW5nZSB3aGVuIHdlCndh
bnQgdG8gZXhjbHVkZSB0aGUgaW5pdGlhbCByZWxlYXNlIG9mIEdDQyA1LgoKCgoKCi0tIApCZXN0
IFJlZ2FyZHMKTWFzYWhpcm8gWWFtYWRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
