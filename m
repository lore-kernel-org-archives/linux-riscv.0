Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568A7EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 23:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yUpwNTqkUvPdwv65wGYAhRBG82lOPON8xdZ+3k6jAwM=; b=FWfwBtVt+MA/MU
	20qlfGd2ORX1wg2eGB0GjmABHGxptxIG1g1s2Tmn5GNAFGE6kQ1tgZ5V8pJa+yglq2niuxom+nTn0
	X+FV9Wao5lmmBTf1okO/d+v/zzPlMTQVC8Z8n69Uq4atDAZrXvKdhB5dnpFebPTMKlR7fsdix2Nrf
	EYmq4ziGr804grmj4K99BUYL0stOMtxloX/npVwYqotsDIzXr5S7sRzXemtL9uZCRl8+nRcvvUS0b
	Lbc972DXi8HdzNiGaA5IEQq+uOi/oW2eXlIGSyf6EEcUKkgqiqcOi8ihpgYYsz+3ETC5lVOWlbH5n
	7z7k40qDvva/3qOg+RLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDvVj-00BCkg-1e;
	Mon, 26 Jun 2023 23:20:43 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDvVd-00BCjx-2Y
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 23:20:42 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fb7dc16ff0so802164e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 16:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687821635; x=1690413635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WsuDpkg4STj8VScLUF1v+q9KU/sRwZdf0lwfYtb4nAU=;
        b=C1YJv7l5E3ROxSNyp2Ma6wOHfw4IZG4XuKs7uygKnjuEeNdgXPdVAbHlgIu26QN7+d
         f/E6Klo+Jt15f+XgaseGnZbh5P4e4AskGzdAJPBVkNsec1Edy2+5r0YfY3FUHNs4I3Fx
         9hUvqUZYv6RZtVMZKo0YOyaUV7s+t5PwywAzl1+gfNqOyX4RVzhzuOExFRdEJyCryp7v
         DqFfxkYgVUzi4GcaPCfvmRH7HeGbxRarFUtHWbhupqIaPypod8XI3JzmwbkrApzMB3TJ
         dePdQY3aEed7GXqATYVhwFYTukwJoUt9sKREaaZr59XUMO0q4hJSRXALp4jE1X8Hbtg/
         1rug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687821635; x=1690413635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WsuDpkg4STj8VScLUF1v+q9KU/sRwZdf0lwfYtb4nAU=;
        b=Z2UiTfKGN+oyYyxvsp0kll1ehik/SBKKMh94tTgUHcD7JPxP9SvpqCkel8XF8kN8J0
         qyG58UV10CjW0HhuaMPRdZow4A/aan/yju/QnZMwB/SdRcNOOh8eAwD6MzfRSHai/uwk
         Uc1zeD5g0dpyBASKEe7/4/mem96PBUuSv50lGrOPAc5/xVByageXy9zlKTdQgk/VcIm4
         G/ct6ZFTUDzRy6gCKbZ6R2lAleBe4ZGUqPHoMBoI/2dxP3wyO7HgqqROKcoeU4WLJS1e
         UrJyKCGKJWAPljmQeWz/C1zlu80IPIdurxOzYlL8p+mPIshEDr4koxHZpCV5qdnxev0B
         fA7g==
X-Gm-Message-State: AC+VfDzoNu4BwI4nLoH8VsnxYJNtFSSyzHgEkLXnSq9KOmnSm367+A0Y
	czp4xQObYM/FG/Dc6hSujuQWoYSqTW9AE+Dxo5eFvQ==
X-Google-Smtp-Source: ACHHUZ7ggykNDv4GNwR59J6Un/xdcCwEfTkyvP6dZPtd3LNrRL+OzpPAQH0aK5EpljAet7sMLGfDHuCLj8AS/0jchBg=
X-Received: by 2002:a05:6512:12c7:b0:4f9:72a5:2b72 with SMTP id
 p7-20020a05651212c700b004f972a52b72mr7112983lfg.22.1687821634913; Mon, 26 Jun
 2023 16:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230626-nature-seventh-6102e17bb4be@spud> <mhng-7656ce4f-bdcb-419c-8a77-18ab7d301cd7@palmer-ri-x1c9>
In-Reply-To: <mhng-7656ce4f-bdcb-419c-8a77-18ab7d301cd7@palmer-ri-x1c9>
From: Evan Green <evan@rivosinc.com>
Date: Mon, 26 Jun 2023 16:19:58 -0700
Message-ID: <CALs-HstCEFJD0xC1Ro8bjTL-bu4ramiXk5LZRr8QNsW1OcUZFA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_162038_060402_3CF5759E 
X-CRM114-Status: GOOD (  35.90  )
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
Cc: apatel@ventanamicro.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, heiko.stuebner@vrull.eu, ajones@ventanamicro.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdW4gMjYsIDIwMjMgYXQgMTo0OOKAr1BNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
ZGFiYmVsdC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCAyNiBKdW4gMjAyMyAxMzozNDoyNCBQRFQg
KC0wNzAwKSwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gT24gTW9uLCBKdW4gMjYsIDIwMjMgYXQg
MTI6MjU6NDJQTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90ZToKPiA+PiBPbiBGcmksIEp1biAyMywg
MjAyMyBhdCA1OjEy4oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToK
PiA+PiA+IE9uIEZyaSwgSnVuIDIzLCAyMDIzIGF0IDAzOjIzOjUzUE0gLTA3MDAsIEV2YW4gR3Jl
ZW4gd3JvdGU6Cj4gPj4gPiA+IEluIC9wcm9jL2NwdWluZm8sIG1vc3Qgb2YgdGhlIGluZm9ybWF0
aW9uIHdlIHNob3cgZm9yIGVhY2ggcHJvY2Vzc29yIGlzCj4gPj4gPiA+IHNwZWNpZmljIHRvIHRo
YXQgaGFydDogbWFyY2hpZCwgbXZlbmRvcmlkLCBtaW1waWQsIHByb2Nlc3NvciwgaGFydCwKPiA+
PiA+ID4gY29tcGF0aWJsZSwgYW5kIHRoZSBtbXUgc2l6ZS4gQnV0IHRoZSBJU0Egc3RyaW5nIGdl
dHMgZmlsdGVyZWQgdGhyb3VnaCBhCj4gPj4gPiA+IGxvd2VzdCBjb21tb24gZGVub21pbmF0b3Ig
bWFzaywgc28gdGhhdCBpZiBvbmUgQ1BVIGlzIG1pc3NpbmcgYW4gSVNBCj4gPj4gPiA+IGV4dGVu
c2lvbiwgbm8gQ1BVcyB3aWxsIHNob3cgaXQuCj4gPj4gPiA+Cj4gPj4gPiA+IE5vdyB0aGF0IHdl
IHRyYWNrIHRoZSBJU0EgZXh0ZW5zaW9ucyBmb3IgZWFjaCBoYXJ0LCBsZXQncyByZXBvcnQgSVNB
Cj4gPj4gPiA+IGV4dGVuc2lvbiBpbmZvIGFjY3VyYXRlbHkgcGVyLWhhcnQgaW4gL3Byb2MvY3B1
aW5mby4KPiA+PiA+Cj4gPj4gPiBObywgeW91IGNhbid0IGRvIHRoaXMgYXMgaXQgYnJlYWtzIHRo
ZSBhc3N1bXB0aW9ucyBvZiB1c2Vyc3BhY2UgdGhhdAo+ID4+ID4gdGhpcyBzaG93cyB0aGUgc2V0
IHN1cHBvcnRlZCBhY3Jvc3MgYWxsIGhhcnRzLgo+ID4+ID4gU29ycnksIGJ1dCBOQUsuCj4gPgo+
ID4+IE15IGhvcGUgd2FzIHRoYXQgd2Ugd2VyZSBzdGlsbCBlYXJseSBlbm91Z2ggdGhhdCBubyBw
cm9kdWN0aW9uIHN5c3RlbXMKPiA+PiBleGlzdGVkICh5ZXQpIHRoYXQgYWN0dWFsbHkgaGFkIGRp
ZmZlcmVudCBJU0EgZXh0ZW5zaW9ucyBpbiB0aGUgc2V0IHdlCj4gPj4gdHJhY2ssIGFuZCB0aGVy
ZWZvcmUgdXNlcm1vZGUgd291bGQgaGF2ZSBiZWVuIHVuYWJsZSB0byBtYWtlIHRob3NlCj4gPj4g
YXNzdW1wdGlvbnMgYXQgdGhpcyBwb2ludC4gSWYgc3VjaCBhIHN5c3RlbSBleGlzdHMsIGFuZCBJ
IGRvbid0IGtub3cKPiA+PiBpZiBpdCBkb2VzIG9yIG5vdCwgdGhlbiBJIGFncmVlIGl0J3MgdG9v
IGxhdGUgdG8gbWFrZSBhIGNoYW5nZSBsaWtlCj4gPj4gdGhpcy4KPiA+Cj4gPiBZb3Ugc2hvdWxk
IHB1dCB0aGlzIGluZm9ybWF0aW9uIGludG8geW91ciBjb21taXQgbWVzc2FnZXMgJiBub3QganVz
dAo+ID4gaG9wZSB0aGF0IHBlb3BsZSB1bmRlcnN0YW5kIHlvdXIgaW50ZW50LgoKRmFpciBlbm91
Z2guCgo+ID4gVXNlcnNwYWNlIGRvZXMgYWN0dWFsbHkgbWFrZSB0aGVzZSBhc3N1bXB0aW9ucyBh
bHJlYWR5LCBzZWUgZm9yIGV4YW1wbGUKPiA+IHRoaXMgR29vZ2xlICJjcHUgZmVhdHVyZXMiIHJl
cG86Cj4gPiBodHRwczovL2dpdGh1Yi5jb20vZ29vZ2xlL2NwdV9mZWF0dXJlcy90cmVlL21haW4K
PiA+IFRvIGJlIHF1aXRlIGhvbmVzdCwgSSByZWFsbHkgZGlzbGlrZSB0aGUgZnJhZ2lsaXR5IG9m
IHdoYXQgdGhleSBoYXZlCj4gPiBpbXBsZW1lbnRlZCAtIHdpdGggb25seSBvbmUgb2YgdGhlIHJl
YXNvbnMgYmVpbmcgdGhleSBtYWRlIHRoZSBtaXN0YWtlCj4gPiBvZiBhc3N1bWluZyBob21vZ2Vu
ZWl0eS4KCj4gPgo+ID4gVGhlcmUncyBnb3QgdG8gYmUgYSBsaW5lIHNvbWV3aGVyZSBmb3Igd2hh
dCBjb25zdGl0dXRlcyBidWdneSB1c2Vyc3BhY2UKPiA+IGFuZCB3aGF0J3MgYSByZWdyZXNzaW9u
LiBVcCB0byBQYWxtZXIgSSBzdXBwb3NlIGFzIHRvIHdoYXQgY29uc3RpdHV0ZXMKPiA+IHdoaWNo
Lgo+Cj4gTWF5YmUgbGV0J3MganVzdCBhZGQgYSBwcmV0dHkgcHJpbnRlZCB2ZXJzaW9uIG9mIHRo
ZSBod3Byb2JlIGluZm8gdG8KPiAvcHJvYy9jcHVpbmZvLCBhbmQgdGhlbiBsZWF2ZSB0aGUgSVNB
IHN0cmluZyBhbG9uZSBhcyBhIGxlZ2FjeQo+IGludGVyZmFjZT8KCkkgbGlrZSBpdCEgSSdsbCBh
aW0gZm9yIHRoYXQgZm9yIHYyLiBJJ2xsIHJlc2lzdCB0aGUgdXJnZSB0byBuYW1lIHRoZQpyb3cg
aXNhX2Zvcl9yZWFsLgoKPgo+IEhhdmluZyBzb21ldGhpbmcgc28gcG9vcmx5IGRlZmluZWQgYXMg
dUFCSSBpcyBhIGJpdCBlbWJhcmFzc2luZywgYnV0Cj4gaXQncyBvdXIgbWlzdGFrZSBzbyB3ZSd2
ZSBnb3QgdG8gbGl2ZSB3aXRoIGl0Lgo+Cj4gPj4gSSB0aG91Z2h0IEknZCBwdXQgdGhpcyBvdXQg
aGVyZSBhbmQgc2VlIGlmIHNvbWVvbmUgY291bGQgcG9pbnQgYXQgc3VjaAo+ID4+IGEgc3lzdGVt
OyBidXQgaWYgbm90IGl0J2QgYmUgZ3JlYXQgdG8ga2VlcCAvcHJvYy9jcHVpbmZvIGFjY3VyYXRl
IGFuZAo+ID4+IGNvbnNpc3RlbnQgd2l0aCBod3Byb2JlICh3aGljaCBkb2VzIHJldHVybiBhY2N1
cmF0ZSBwZXItaGFydCBJU0EKPiA+PiBleHRlbnNpb24gaW5mbykuCj4gPgo+ID4gSnVzdCBhbm90
aGVyIG5haWwgaW4gdGhlIGNvZmZpbiBmb3IgYSBiYWQgaW50ZXJmYWNlIDopCj4gPiBUaGVyZSBh
cmUgYXBwYXJlbnRseSBzb21lIG1peGVkIGM5MDYgY2hpcHMgdGhhdCBzdXBwb3J0IHZlY3RvciBv
biBvbmUKPiA+IGNvcmUgYW5kIG5vdCB0aGUgb3RoZXIgLSBhbHRob3VnaCBpdCBpcyB0aGVhZCB2
ZWN0b3Igd2hpY2ggaXMgbm90Cj4gPiBzdXBwb3J0ZWQgdXBzdHJlYW0geWV0Li4uCj4gPgo+ID4g
T3RoZXIgdGhhbiB0aGF0LCBTaUZpdmUgc3R1ZmYgdGVjaG5pY2FsbHkgY2FuIGJlIG1peGVkIC0g
cnY2NGltYWMgJgo+ID4gcnY2NGltYWZkYyBvbiBhIGJ1bmNoIG9mIHRoZSBvbGRlciBzdHVmZi4g
SSBkb24ndCB0aGluayBhbnlvbmUgYWN0dWFsbHkKPiA+IHJ1bnMgdGhvc2Ugc29ydCBvZiBjb25m
aWd1cmF0aW9ucyBvbiB0aGVtIHRob3VnaC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
