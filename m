Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5A5EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 17:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BMtz5hVXY/hSJQwuNW/dUQMpwRhzLg4aPUiY7XAUyq0=; b=SiqgBPyk4mHLeW
	2dUx30A1oPal7bBBhVOeLB7wpbJLmKCF5ti+6BLYu9seeK2sy3Bos9FnhHq/Vhq8Ho2bX4LxVyyZ6
	QsTgg9S+aR1FTld5Xj+uNznCNAq000pn8DHpH0MYQBPhhR38bIMc0wh0TLvlhVfUASB8KZAIApeRs
	2+Q0o/rP77qzGZfg0Iw/4HdxARzvnh7ATp2pd1aIdTppj9IvRLj3RKzosIr8e4xrZDPSFswSPWb5/
	jugF+DRaWO2NY4vIp2ktPabzCFBpnR2vMgfLJA6rTUfRT3T0bnJVJorxw3aYcIxv7nHZHvnDMw5ln
	TUYgj8u1yvtLHRgwHhXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEYp2-00GGd8-1v;
	Wed, 28 Jun 2023 17:19:16 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEYoz-00GGbc-0y
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 17:19:15 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b69f71a7easo832731fa.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jun 2023 10:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687972750; x=1690564750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hUxTuJ7SYMUJNED8HWvX+wC3nrWl1+CukmahGo2CNkE=;
        b=NTyTiinJA2JKXdptZuPF/uLO4E+gZLBMMsd44vKuq86yYbtMbahA1MMTIWOpwsRbOI
         t8vGVXIyi5WzGL0VlUGi7XpjFpTI7vwdMZc25MPp3y0LkTQvJ8PbE5lUhW3nzyFRHupZ
         Q+eLxPjtcptKDUpwggzWKUMr9W4QyLkhwpWMif20T6tie8MNuAS3+0N7nMAWWuLA4+vX
         5v6gEO8tGEUEzX2dh+pA/S60cR5j0MnDV8gm+l2+YcaAPydTzpQSQVQbQiHkQd1CG1+f
         j3ZMk41dj1anGiS4dl0yFhjp3XgceAhqPVddocGN7GfTl3Fr4duPYbcj0vaBezNWJwhT
         WPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687972750; x=1690564750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hUxTuJ7SYMUJNED8HWvX+wC3nrWl1+CukmahGo2CNkE=;
        b=eBoUj3bQfLa7FLvs5vD+U3amF+FWT7d6KowBaeTlc81OEFaQcbwufT7sK+5l4NxO39
         BL45IwwF2F1JLLOozXEkog9Zhlb7dl0fndtKr8AjkE32/s50GwxZQblmw3flBq4D5U9y
         rjaKsS6IwgmGkofoGjQXD2d7e6HkZHfTh+DF3KHQl+SbJqy9fOKGjV5i0s8zoWnWaJce
         yPqwgJusGnvFssB1RapfLmaeucTWw191ilcqYK0OII4YatPZhNrkoWw24pGLXoNUO9Vy
         O+mfLS1lpl5zy0enCt0TLVzPAfr5DfEhGDyeKL3o4KoxEtoMll3cquiXgaYxDjjES8w2
         d/Vg==
X-Gm-Message-State: AC+VfDw3pgcTUWM2crPwqi1gg+hyD7T6V14xoKMARpBP0o1uwaKx3FWW
	sS0VpVTZ0PJhgmo50PGkJ3/tpi6LhJ+Hsgt+QVJfew==
X-Google-Smtp-Source: ACHHUZ7iCGsA8a9YWEulaTcajXBjFoUhV2YqawFJYt9M7glCW5ic8AdFXSkpCVRPm5fMQrnvMkLoQrk/6Vs4qTFn1hc=
X-Received: by 2002:a19:e046:0:b0:4f9:24b6:6695 with SMTP id
 g6-20020a19e046000000b004f924b66695mr14518746lfj.29.1687972750417; Wed, 28
 Jun 2023 10:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230627143747.1599218-1-sameo@rivosinc.com> <20230627143747.1599218-2-sameo@rivosinc.com>
 <CALs-HssMkVikspnEi-Ek2t=ABvFvgptAhsBjk1+aLuVjiP7P7w@mail.gmail.com>
 <20230627-debating-twelve-da2c1ed60948@spud> <ZJwE5wRVkoND3Z6P@vermeer> <20230628-unfeeling-tavern-edd4f58396fa@wendy>
In-Reply-To: <20230628-unfeeling-tavern-edd4f58396fa@wendy>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 28 Jun 2023 10:18:34 -0700
Message-ID: <CALs-HstZe+bw_fY--4FQXfFoA67tvMSaEjKhZ2pRstNT07xBxA@mail.gmail.com>
Subject: Re: [PATCH 1/3] RISC-V: add Bitmanip/Scalar Crypto parsing from DT
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Samuel Ortiz <sameo@rivosinc.com>, Conor Dooley <conor@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	"Hongren (Zenithal) Zheng" <i@zenithal.me>, linux@rivosinc.com, Andrew Jones <ajones@ventanamicro.com>, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>, Anup Patel <apatel@ventanamicro.com>, 
	linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Jiatai He <jiatai2021@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_101913_563069_2638A531 
X-CRM114-Status: GOOD (  28.31  )
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

T24gV2VkLCBKdW4gMjgsIDIwMjMgYXQgNDoxMOKAr0FNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdW4gMjgsIDIwMjMgYXQgMTI6
MDE6MTFQTSArMDIwMCwgU2FtdWVsIE9ydGl6IHdyb3RlOgo+ID4gT24gVHVlLCBKdW4gMjcsIDIw
MjMgYXQgMDc6NDg6MTVQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gPiBPbiBUdWUs
IEp1biAyNywgMjAyMyBhdCAxMToxNDozMEFNIC0wNzAwLCBFdmFuIEdyZWVuIHdyb3RlOgo+ID4g
PiA+IE9uIFR1ZSwgSnVuIDI3LCAyMDIzIGF0IDc6MzjigK9BTSBTYW11ZWwgT3J0aXogPHNhbWVv
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiA+ID4gPiBJdCB3b3VsZCBiZSBuaWNlIHRvIGNvbnNv
bGlkYXRlIHRoZSBvbmVzIHRvZ2V0aGVyIHRoYXQgc2VhcmNoIGZvciBhCj4gPiA+ID4gc2luZ2xl
IHN0cmluZyBhbmQgc2V0IG11bHRpcGxlIGJpdHMsIHRob3VnaCBJIGRvbid0IGhhdmUgYW55IHN1
cGVyCj4gPiA+ID4gZWxlZ2FudCBpZGVhcyBmb3IgaG93IG9mZiB0aGUgdG9wIG9mIG15IGhlYWQu
Cj4gPiA+Cj4gPiA+IEkndmUgZ290IGEgcmVmYWN0b3Igb2YgdGhpcyBjb2RlIGluIHByb2dyZXNz
LCBkcm9wcGluZyBhbGwgb2YgdGhlc2UKPiA+ID4gY29weS1wYXN0ZSBpbiBwbGFjZSBvZiBhIGxv
b3AuIEl0IGNlcnRhaW5seSBsb29rcyBtb3JlIGVsZWdhbnQgdGhhbgo+ID4gPiB0aGlzLCBidXQg
aXQgd2lsbCBmYWxsIG92ZXIgYSBiaXQgZm9yIHRoZXNlICJvbmUgc3RyaW5nIG1hdGNoZXMgbWFu
eQo+ID4gPiBleHRlbnNpb25zIiBjYXNlcy4gU2VlIGhlcmU6Cj4gPiA+IGh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yaXNjdi9wYXRjaC8yMDIzMDYyNi10aGlldmlu
Zy1qb2Nrc3RyYXAtZDM1ZDIwYjUzNWM1QHdlbmR5Lwo+ID4gPiBNeSBpbW1lZGlhdGUgdGhvdWdo
dCBpcyB0byBhZGQgYW5vdGhlciBlbGVtZW50IHRvIHJpc2N2X2lzYV9leHRfZGF0YSwKPiA+ID4g
dGhhdCBjb250YWlucyAicGFyZW50IiBleHRlbnNpb25zIHRvIGNoZWNrIGZvci4gU2hvdWxkIGJl
IGZhaXJseSBkb2FibGUsCj4gPiA+IEknbGwgd2hpcCBzb21ldGhpbmcgdXAgb24gdG9wIG9mIHRo
YXQuLi4KPiA+Cj4gPiBOaWNlLCBhbmQgdGhhbmtzIGZvciB0aGUgcmV2aWV3Lgo+Cj4gPiBTaG91
bGQgSSB3YWl0IGZvciB5b3VyIHJlZmFjdG9yIHRvIGJlIG1lcmdlZCBiZWZvcmUgcHVzaGluZyB0
aGlzIG9uZT8KPgo+IEkgZG9uJ3Qga25vdy4gSSB0aGluayB0aGF0IHlvdSBzaG91bGQgY29udGlu
dWUgb24gd2l0aCB5b3VyIHNlcmllcyBoZXJlLAo+IGFuZCB3aGljaGV2ZXIgZ29lcyBpbiBzZWNv
bmQgZ2V0cyByZWJhc2VkIG9uIHRvcCBvZiB0aGUgb3RoZXIuCj4gSSBkb24ndCB0aGluayBpdCBt
YWtlcyBtYXRlcmlhbCBkaWZmZXJlbmNlIHRvIHJldmlldyBvZiB0aGlzIHBhdGNoc2V0IGFzCj4g
dG8gd2hldGhlciB5b3UgcmViYXNlIG9uIHRvcCBvZiB3aGF0IEknbSB3b3JraW5nIG9uLCBzbyBJ
IHdvdWxkbid0Cj4gYm90aGVyIHVudGlsIGl0IGdldHMgbWVyZ2VkLgo+Cj4gUmF0aGVyIGhhY2t5
LCBoYWQgbGVzcyB0aW1lIHRoYW4gZXhwZWN0ZWQgdGhpcyBtb3JuaW5nOgo+IGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Nvbm9yL2xpbnV4LmdpdC9jb21t
aXQvP2g9cmlzY3YtZXh0ZW5zaW9ucy1zdHJpbmdzLXN1cGVyc2V0cwo+IENsZWFybHkgdGhlcmUn
cyBpc3N1ZXMgd2l0aCBsb29waW5nIHRvIFJJU0NWX0lTQV9NQVhfU1VQRVJTRVRTICYgSSBqdXN0
Cj4gcmVwdXJwb3NlZCBaaWNzciBmb3IgdGhlIHNha2Ugb2YgdGVzdGluZyBzb21ldGhpbmcgaW4g
dGhlIHRpbWUgSSBoYWQuCj4KPiBFdmFuLCBhdCBhIGhpZ2ggbGV2ZWwsIGRvZXMgdGhhdCBsb29r
IG1vcmUgZWxlZ2FudCB0byB5b3UsIG9yIGhhdmUgSSBtYWRlCj4gdGhpbmdzIHdvcnNlPwo+CgpJ
IHNlZSB3aGF0IHlvdSdyZSBnb2luZyBmb3IgYXQgbGVhc3QuIEl0J3MgdW5mb3J0dW5hdGUgdGhh
dCB3aGVuCnNvbWVvbmUgYnVtcHMgdXAgUklTQ1ZfSVNBX01BWF9TVVBFUlNFVFMgaXQgc3F1YXJl
cyB0aGUgd2hvbGUgYXJyYXkuCkFub3RoZXIgd2F5IHRvIGdvIG1pZ2h0IGJlIHRvIGRlZmluZSB0
aGUgZWxlbWVudHMgaW4gYSBzZXBhcmF0ZSBhcnJheSwKbGlrZToKCnVuc2lnbmVkIGludCByaXNj
dl96a3NfZXh0c1tdID0gewogICAgICAgUklTQ1ZfSVNBX0VYVF9aQktCLAogICAgICAgUklTQ1Zf
SVNBX0VYVF9aQktDLAogICAgICAgLi4uLgp9OwoKdGhlbiB0aGUgbWFjcm8gZW50cnkgbG9va3Mg
bGlrZToKClNFVF9JU0FfRVhUX01BUF9NVUxUSSgiemtzIiwgcmlzY3ZfemtzX2V4dHMpLAoKd2hl
cmUgdGhlIFNFVF9JU0FfRVhUX01BUF9NVUxUSSgpIGNvdWxkIHVzZSBBUlJBWV9TSVpFKCkgdG8g
c3Rhc2ggYm90aAp0aGUgcG9pbnRlciB0byB0aGUgYXJyYXkgYW5kIHRoZSBudW1iZXIgb2YgZWxl
bWVudHMuCgotRXZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
