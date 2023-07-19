Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20C0C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 17:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8jre/dw4gK8831qwpUQjWFvMq/MUyP4bxDL+Jb3lwWE=; b=XR6vALP0vj1EoG
	6qUfSqHlLQd5HzTZ5zD8fy7HkC3vIdL/whiGtzMA+oSkm0VTONh3XezmzETL34YisB6qr5/SRtI1+
	cz3MNslU7OI21KBzySgC3OKewUnHT5sDP5h2qOmns0SqcQX/69siLXV4aFvvY0kILfvl2rICnKWep
	TlM9gWvYDiWVSl4u9ofPgjzhwwZF+0RRhVTe6UWTntl9q0roYDKql48scwGq9ZZwbS4u9AlEXwjle
	/i72ZruHJ0S+nvn5iO4nRGAJHO2xMaeykF8SlPTOBVJCi+Fg8YTgWV7ImITy2pOhlb0SySdhtD/Qw
	zu9Z0vbqJ5pKehN0I4Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMAlK-008Id9-0B;
	Wed, 19 Jul 2023 17:14:54 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMAlG-008Ic4-2x
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 17:14:52 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fdd7d09576so1248578e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 10:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1689786887; x=1692378887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=elJrsu6Uef6LQuBYEeLwXbUYorXirAQoAABKR5ida5o=;
        b=fiaiyvFfMRr9Xcr14KrkcwlW5WSFKorUe9O1j3cTg+Ni4nJ2Rwb8XvTzSQsOpqJpyo
         bASm/XVJEga+vfVYU86n+ZR1sZS7RnHGniJdqq5sU1GVbxOKAc2GFcN7PPhA9QJjzWEV
         BlGibLWs5VR+3cOUWr/I+maEKzlhkq9Tt6Hsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689786887; x=1692378887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=elJrsu6Uef6LQuBYEeLwXbUYorXirAQoAABKR5ida5o=;
        b=DbNjWqCPR/6wEakKDT6cQjF1wEiTqrhuJTY/YlCw6qb1wVxpTo6tQTe/YxgObzpzWq
         Dekwx8z2d4KrXj1D6Ydkd62QuNxxd6obXOXmNA94jrH3IpyA2CtcTk7pJklwHbrsIKGb
         7GMvra+Xy55ryfszGIYVH0zCYBPI2+d8nCgf/2KKHgkQZOuLdDb1zSM+mG189X5YooGg
         Ebx/HZO1edE6SgK05XUUOn66/A65dBcfTeMsYqzGj5XOt/Lbip4HaDipQpt8/DviO+L/
         Y9meUlJxc+mFnGlFkQ8Fz8PbakfD+YurtsL7sDPFJI4lxBrb92IAVKosCWX3CQsvIT5I
         CcFQ==
X-Gm-Message-State: ABy/qLYes+x/EokAUpKuSHIgJ9BiJs03bT+bywb8rN0pnMWGoFL9FT65
	U3yC0AalbHTsdEQnE8FLP69Z/SLDR8Pm4pFd60Sf
X-Google-Smtp-Source: APBJJlEB1PrXZAM0xFw7GP8k6ndBKsUzY5zeo6WvVrFVnATj7EL2b0cGiZQxPbF0IQ70Uhksr0Wb2hLxqIgfaxCkpiY=
X-Received: by 2002:a2e:8748:0:b0:2b7:33a6:f2c0 with SMTP id
 q8-20020a2e8748000000b002b733a6f2c0mr450107ljj.4.1689786887459; Wed, 19 Jul
 2023 10:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230703124647.215952-1-alexghiti@rivosinc.com>
 <8756384.Zvl9fuB8X0@basile.remlab.net> <CAOnJCU+W9u+HnMfjU_y9W7331Zx07eQs9R1twV0=KsBAeSMSjw@mail.gmail.com>
 <5951331.lOV4Wx5bFT@basile.remlab.net>
In-Reply-To: <5951331.lOV4Wx5bFT@basile.remlab.net>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 19 Jul 2023 10:14:36 -0700
Message-ID: <CAOnJCUKCx0Jh1igZytKAYePhhUBt=x5ANCVx4FRTbLtxGkyowA@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] riscv: Allow userspace to directly access perf counters
To: =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aurelien Jarno <aurelien@aurel32.net>, Mathieu Malaterre <malat@debian.org>, 
	Jan Newger <jannewger@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_101451_165847_2F16DA45 
X-CRM114-Status: GOOD (  19.71  )
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

T24gV2VkLCBKdWwgMTksIDIwMjMgYXQgNzo0NuKAr0FNIFLDqW1pIERlbmlzLUNvdXJtb250IDxy
ZW1pQHJlbWxhYi5uZXQ+IHdyb3RlOgo+Cj4gTGUga2Vza2l2aWlra29uYSAxOS4gaGVpbsOka3V1
dGEgMjAyMywgMS40OC40OSBFRVNUIEF0aXNoIFBhdHJhIGEgw6ljcml0IDoKPiA+ID4gSXNuJ3Qg
UkRUSU0gc3VzY2VwdGlibGUgdG8gaW50ZXJmZXJlbmNlIGZyb20gcG93ZXIgbWFuYWdlbWVudCBh
bmQgQ1BVCj4gPiA+IGZyZXF1ZW5jeSBzY2FsaW5nPyBJIHN1cHBvc2UgdGhhdCBSRENZQ0xFIG1h
eSBiZWhhdmUgZGlmZmVyZW50bHkgZGVwZW5kaW5nCj4gPiA+IG9uIFBNIGluICpzb21lKiBkZXNp
Z25zLCBidXQgdGhhdCB3b3VsZCBzdGlsbCBiZSB3YXkgYmV0dGVyIHRoYW4gUkRUSU1FCj4gPiA+
IGZvciB0aGUgcHVycG9zZS4KPiA+Cj4gPiBZZXMuIEJ1dCB0aGF0J3Mgd2hhdCBpdCBpcyBwcm9i
YWJseSB1c2luZyBmb3Igb3RoZXIgSVNBcyA/Cj4KPiBBdCBsZWFzdCBvbiBBQXJjaDY0LCBpdCBp
cyB1c2luZyBlaXRoZXIgTGludXggcGVyZiBjeWNsZSBjb3VudGVyLCBvciBpZiB0aGF0Cj4gaXMg
ZGlzYWJsZWQgYXQgYnVpbGQgdGltZSwgdGhlIHJhdyBQTVUgY3ljbGUgY291bnRlciAtIHdoaWNo
IG9idmlvdXNseSBsZWFkcwo+IHRvIFNJR0lMTCBvbiBMaW51eCwganVzdCBsaWtlIHRoaXMgTVIg
d291bGQgZG8gd2l0aCBSRENZQ0xFLgo+CgpHb29kIHRvIGtub3cuIFRoYW5rcyBmb3IgdGhlIGNs
YXJpZmljYXRpb24uCgo+IEFnYWluLCBJIGRvIG5vdCAqcGVyc29uYWxseSogaGF2ZSBvYmplY3Rp
b25zIHRvIGRpc2FibGluZyBSRENZQ0xFIGZvcgo+IHVzZXJzcGFjZSAoc29tZWJvZHkgZWxzZSBk
b2VzLCBidXQgdGhhdCdzIG5laXRoZXIgbXkgbm9yIHlvdXIgcHJvYmxlbSkuIEkgZG8KPiBoYXZl
IG9iamVjdGlvbnMgdG8gdGhlIHdvcmRpbmcgb2Ygc29tZSBvZiB0aGUgY29tbWl0IG1lc3NhZ2Vz
IHRob3VnaC4KPgoKQ29tcGxldGVseSBhZ3JlZWQuIFdlIHdpbGwgdXBkYXRlIHRoZSBjb21taXQg
dGV4dCB3aXRoIG1vcmUgY2xhcmlmaWNhdGlvbiBpbiB2NS4KCj4gPiBNeSBwb2ludCB3YXMgaXQg
c2hvdWxkIGp1c3QgZG8gd2hhdGV2ZXIgaXQgZG9lcyBmb3Igb3RoZXIgSVNBLiBSSVNDLVYgaXMg
bm8KPiA+IHNwZWNpYWwgaW4gdGhhdCByZWdhcmQuCj4KPiBTdXJlLiBNeSBwb2ludCBpcyB0aGF0
IFJEVElNRSBtYXkgYmUgZ3JlYXQgZm9yLCBzbyB0byBzYXksIHN5c3RlbS1sZXZlbAo+IGJlbmNo
bWFya3MuIEZvciBGRm1wZWcgdGhhdCBjb3VsZCBzb21ldGhpbmcgbGlrZSBob3cgbG9uZyBpdCB0
YWtlcyB0bwo+IHRyYW5zY29kZSBhIHZpZGVvLiBCdXQgaXQgZG9lc24ndCBzZWVtIHRvIG1ha2Ug
bXVjaCBzZW5zZSBmb3IKPiBtaWNyb2JlbmNobWFya2luZyBvZiBzaW5nbGUgdGhyZWFkZWQgdGln
aHRseSBvcHRpbWlzZWQgbG9vcHMsIGFzIG9wcG9zZWQgdG8KPiBSRENZQ0xFIChvciBhIHdyYXBw
ZXIgZm9yIFJEQ1lDTEUpLgo+Cj4gLS0KPiBSw6ltaSBEZW5pcy1Db3VybW9udAo+IGh0dHA6Ly93
d3cucmVtbGFiLm5ldC8KPgo+Cj4KCgotLSAKUmVnYXJkcywKQXRpc2gKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
