Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E95C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 12:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCys987Ec9V77j6bi+P320CLYJL0X4fnU7N4diKKQQs=; b=GBF74aGXZ4CEBr
	cF9NfoDF3GT7mmVT2/ijT6BsBT8gX3HSJ3J+nvnIAXscoIPQs8b5a6KvbzjmV8ZkUNtA08Onm+Wo4
	yZVPmY3rA5yeYn+wDW9Kp2XS++5ZIKyn8qhydBL9AhiNZ51et3aYmlV8eJQmmrCuj7cys3am2kZJm
	V+nmiGbrISjzMBd0Nw9GaJFDA4M4PI1io0Crwaz1nmRg5rYB51iqAm6/X+c86ON29JOWSYE4hgadS
	QfDFdw8K0dR7iFM4QGOuAC2Jb32V19kxvxNDDXEGluhCKro3XOQaGBVpmHTfuliJ3gCnQ3WzGEgNh
	ZSsK2p69x1QtAxfxzoTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAURS-00000008ucy-3Thi;
	Fri, 24 May 2024 12:54:38 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAURO-00000008ucT-46X0
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 12:54:36 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-36dd56cf5f5so24338945ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 May 2024 05:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1716555272; x=1717160072; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MxmDLiLsd5ua2H7Oam6e1zqnDQkQ25mJBA16oWnpxYY=;
        b=aw9nR3tZmsDBIiTj7dJHNq5V6WJ2VPxkBJT1ba+ipq70m4rfuTjsFR4vgVc0Y/0EDO
         Jt9J2BRIlEhY4ar6hmw8ZKuPvU+xvofxdUP3N1ofjP4UOnGszeybpcnFHAVpb9YfxOuE
         9lygzGw0PmvEZDaHODW7w0pRSeYMaUbeWpubAaKoua11Ceg6KkSFliMr38ImUI+TGKsh
         vKlVGRWvVLNDu2SEhAViu0bAkp1VanYlmgfbObhjWqafVOIUNQiu6KU94qd+evDMrvZe
         eNpBRmCl7TD1NEgDr5fmBeiUtGzFPDcMIu8H9HrBkQMLxG5c8iOJXZbseWmUl7981s3P
         GgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716555272; x=1717160072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MxmDLiLsd5ua2H7Oam6e1zqnDQkQ25mJBA16oWnpxYY=;
        b=bM2s51BIPhKUqztHF5s7Bv/bgdz6KRW6GzCg8jmgY5KVShyYjKumWahRe2lD7HGUTA
         J2MMoxteu2O2PO/2438l3kBAuFmbxHjR7OFXX66QhwZJwnnQIfhUuUjCraMmR7CWPZbw
         QdNTa8tUoFQN+co8q0HJyBRN17xYRt0YqswxjIdcORlF5aJ4IfNbJPwe5bSThZa5gFre
         0fh+MfjryNAYTN4NtcS5MEhmtZsEGWiL9jWgdDURPowHaA9CIcHHtHdMXMMSjdrSLYgF
         fmvpdAcJ2syRBV73pcDjCfR946O59bAfCtvQMOkF1Ynl/PZGqAZe5JtfLRgzlfQpOZLA
         GXFw==
X-Forwarded-Encrypted: i=1; AJvYcCWL/ivVT28mvyYvNiZnNoMVD4w5aCkYdjzAPsNw/fvsnsmZj4CrwiJrciOIt3DDcxhS3QV8ivA91BT3dvg8Tbt2V9Oj556fBG4bhbzs41rX
X-Gm-Message-State: AOJu0YxdEVdHWf0vYimFP2InksZjdw89HnYPLZlW/ZB5OpYBecH8/F9K
	z91UxV/i9o+xk7fiFxiMHY4AgRH1PweVJxD0cKrGNbqRifw6CUFVcajqLjl85J5Hh7fTGKNGKp1
	jYstIuEJnUt8xfmK6MwcChaGfU9XsNaQ3hzFcAA==
X-Google-Smtp-Source: AGHT+IG706oHtTX6EHJGP+6O0ueOX8hKEYHRAtlMxjdpa5kaBBkruy70OydInrBDfoTThdPlUAB7QfD2yRnjk92tjac=
X-Received: by 2002:a05:6e02:1a09:b0:36b:2731:83ce with SMTP id
 e9e14a558f8ab-3737b2c5874mr24957655ab.8.1716555272176; Fri, 24 May 2024
 05:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240226065113.1690534-1-nick.hu@sifive.com> <CAPDyKFph3WsZMmALnzBQKE4S_80Ji5h386Wi0vHda37QUsjMtg@mail.gmail.com>
 <CAKddAkDcdaXKzpcKN=LCCx9S4Trv+joLX2s=nyhzaRtM5HorqA@mail.gmail.com>
 <CAKddAkC6N=Cfo0z+F8herKTuJzCyt_MA0vWNbLCr6CbQnj0y8g@mail.gmail.com>
 <CAPDyKFr_M0NDH0gaunBpybnALOFfz4LpX4_JW2GCUxjwGzdZsg@mail.gmail.com>
 <CAKddAkC5CRX+ZTh=MgzPYU72SY13+AQYhknhV_CC+=XX9=DKyg@mail.gmail.com>
 <CAAhSdy1SDd=VUqDQA0T5n9LwHo=3uGzFq1dUcbDFcB3aBdaioA@mail.gmail.com>
 <CAAhSdy33DcNw+pbDRrR=hBH86kwvu3xZbomQby8XhRXcc-exqQ@mail.gmail.com>
 <CAKddAkBrP2iQBC+aY1Xw5pssBpiQZe4V-6ww5m8hbKP6V0jzLg@mail.gmail.com>
 <CAAhSdy12-_Hdb-WVrs8kyfCy_OQA0p27DS6TOV87dh9HODrU_Q@mail.gmail.com>
 <CAKddAkCQOvnci-bzKx1pBUJh5t1uPT-wNXGH1WyqDyb5qR_Scg@mail.gmail.com>
 <CAK9=C2V2xYwi4wK2+e=z7NF8Ph7+LxvWh4J4TmQrbVfSfpO-Ag@mail.gmail.com> <CAPDyKFo6PiWmwtHTfRCWK95RgQShfuR+G2cZm0D1Ad-at_MWmg@mail.gmail.com>
In-Reply-To: <CAPDyKFo6PiWmwtHTfRCWK95RgQShfuR+G2cZm0D1Ad-at_MWmg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 24 May 2024 18:24:20 +0530
Message-ID: <CAAhSdy3VVbOjMZR_De3D6hC0XwgjwpRzxU=Xpf=OOULfTYOxOw@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: riscv-sbi: Add cluster_pm_enter()/exit()
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Nick Hu <nick.hu@sifive.com>, palmer@dabbelt.com, 
	rafael@kernel.org, daniel.lezcano@linaro.org, paul.walmsley@sifive.com, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, zong.li@sifive.com, 
	Cyan Yang <cyan.yang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_055435_248130_8264E6CC 
X-CRM114-Status: GOOD (  46.02  )
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

T24gRnJpLCBNYXkgMjQsIDIwMjQgYXQgNDoxMeKAr1BNIFVsZiBIYW5zc29uIDx1bGYuaGFuc3Nv
bkBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgMTcgTWF5IDIwMjQgYXQgMDY6MzksIEFu
dXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUs
IE1heSAxNiwgMjAyNCBhdCA5OjQw4oCvQU0gTmljayBIdSA8bmljay5odUBzaWZpdmUuY29tPiB3
cm90ZToKPiA+ID4KPiA+ID4gSGkgQW51cAo+ID4gPgo+ID4gPiBPbiBXZWQsIE1heSAxNSwgMjAy
NCBhdCA5OjQ24oCvUE0gQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4g
PiA+ID4KPiA+ID4gPiBIaSBOaWNrLAo+ID4gPiA+Cj4gPiA+ID4gT24gV2VkLCBNYXkgMTUsIDIw
MjQgYXQgNTo0NeKAr1BNIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPiA+
ID4gPgo+ID4gPiA+ID4gSGkgQW51cCwKPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGFuayB5b3UgZm9y
IHlvdXIgZ3VpZGFuY2UuCj4gPiA+ID4gPiBBZnRlciBlbmFibGluZyB0aGUgZGVidWcgbWVzc2Fn
ZSwgd2UgZm91bmQgYSB3YXkgdG8gc29sdmUgdGhlIHByb2JsZW0KPiA+ID4gPiA+IGJ5IHRoZSBm
b2xsb3dpbmcgc3RlcHM6Cj4gPiA+ID4gPiAxLiBBZGQgYSBjb21wYXRpYmxlIHN0cmluZyBpbiAn
cG93ZXItZG9tYWlucycgbm9kZSBvdGhlcndpc2UgaXQgd29uJ3QKPiA+ID4gPiA+IGJlIHRoZSBz
dXBwbGllciBvZiB0aGUgY29uc3VtZXJzLiAoU2VlIG9mX2xpbmtfdG9fcGhhbmRsZSgpKQo+ID4g
PiA+Cj4gPiA+ID4gSG1tLCByZXF1aXJpbmcgYSBjb21wYXRpYmxlIHN0cmluZyBpcyBvZGQuIFdo
ZXJlIHNob3VsZCB3ZSBkb2N1bWVudAo+ID4gPiA+IHRoaXMgY29tcGF0aWJsZSBzdHJpbmcgPwo+
ID4gPiA+Cj4gPiA+IFNvcnJ5LCB0aGlzIGlzIG15IGZhdWx0LiBJIGRpZG4ndCBpbmNsdWRlIHNv
bWUgdXBkYXRlcyBpbgo+ID4gPiBvZl9saW5rX3RvX3BoYW5kbGUoKS4gVGhpcyBsZWQgc29tZSBt
aXN1bmRlcnN0YW5kaW5ncyBoZXJlLgo+ID4gPiBZb3UgYXJlIHJpZ2h0LCB3ZSBkb24ndCBuZWVk
IGl0Lgo+ID4gPiBUaGUgc3VwcGxpZXIgd2lsbCBiZSBsaW5rZWQgdG8gdGhlIENMVVNURVJfUEQg
bm9kZS4KPiA+ID4KPiA+ID4gPiA+IDIuIE1vdmUgdGhlICdwb3dlci1kb21haW5zJyBub2RlIG91
dHNpZGUgdGhlICdjcHVzJyBub2RlIG90aGVyd2lzZSBpdAo+ID4gPiA+ID4gd29uJ3QgYmUgYWRk
ZWQgdG8gdGhlIGRldmljZSBoaWVyYXJjaHkgYnkgZGV2aWNlX2FkZCgpLgo+ID4gPiA+ID4gMy4g
VXBkYXRlIHRoZSBjcHVpZGxlLXJpc2N2LXNiaSBkcml2ZXIgdG8gZ2V0IHRoZSBwZHNfbm9kZSBm
cm9tCj4gPiA+ID4gPiAnL3Bvd2VyLWRvbWFpbnMnLgo+ID4gPiA+Cj4gPiA+ID4gQnkgYWRkaW5n
IGEgY29tcGF0aWJsZSBzdHJpbmcgYW5kIG1vdmluZyB0aGUgInBvd2VyLWRvbWFpbnMiIG5vZGUK
PiA+ID4gPiBvdXRzaWRlLCB5b3UgYXJlIHNpbXBseSBmb3JjaW5nIHRoZSBPRiBmcmFtZXdvcmsg
dG8gcG9wdWxhdGUgZGV2aWNlcy4KPiA+ID4gPgo+ID4gPiA+IEhvdyBhYm91dCBtYW51YWxseSBj
cmVhdGluZyBwbGF0Zm9ybV9kZXZpY2UgZm9yIGVhY2ggcG93ZXItZG9tYWluCj4gPiA+ID4gRFQg
bm9kZSB1c2luZyBvZl9wbGF0Zm9ybV9kZXZpY2VfY3JlYXRlKCkgaW4gc2JpX3BkX2luaXQoKSA/
Cj4gPiA+ID4KPiA+ID4gVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbiEgV2UgaGF2ZSB0ZXN0IHRo
ZSBzb2x1dGlvbiBhbmQgaXQgY291bGQgd29yay4KPiA+ID4gV2Ugd2FzIHdvbmRlcmluZyBpZiBp
dCdzIGZlYXNpYmxlIGZvciB1cyB0byByZWxvY2F0ZSB0aGUKPiA+ID4gJ3Bvd2VyLWRvbWFpbnMn
IG5vZGUgb3V0c2lkZSBvZiB0aGUgL2NwdXM/IFRoZSBDTFVTVEVSX1BEIG1pZ2h0Cj4gPiA+IGVu
Y29tcGFzcyBub3Qgb25seSB0aGUgQ1BVcyBidXQgYWxzbyBvdGhlciBjb21wb25lbnRzIHdpdGhp
biB0aGUKPiA+ID4gY2x1c3Rlci4KPiA+Cj4gPiBUaGUgY3B1aWRsZS1yaXNjdi1zYmkgZHJpdmVy
IGV4cGVjdHMgInBvd2VyLWRvbWFpbnMiIERUIG5vZGUKPiA+IHVuZGVyICIvY3B1cyIgRFQgbm9k
ZSBiZWNhdXNlIHRoaXMgZHJpdmVyIG9ubHkgZGVhbHMgd2l0aCBwb3dlcgo+ID4gZG9tYWlucyBy
ZWxhdGVkIHRvIENQVSBjbHVzdGVyIG9yIENQVSBjYWNoZS1oaWVyYXJjaHkuIEl0IGRvZXMKPiA+
IG1ha2Ugc2Vuc2UgdG8gZGVmaW5lIEwyL0wzIHBvd2VyIGRvbWFpbnMgdW5kZXIKPiA+ICIvY3B1
cy9wb3dlci1kb21haW4iIHNpbmNlIHRoZXNlIGFyZSByZWxhdGVkIHRvIENQVXMuCj4gPgo+ID4g
TW92aW5nIHRoZSBDUFUgInBvd2VyLWRvbWFpbnMiIERUIG5vZGUgZGlyZWN0bHkgdW5kZXIgIi8i
IG9yCj4gPiBzb21ld2hlcmUgZWxzZSB3b3VsZCBtZWFuIHRoYXQgaXQgY292ZXJzIHN5c3RlbS13
aWRlIHBvd2VyCj4gPiBkb21haW5zIHdoaWNoIGlzIG5vdCB0cnVlLgo+Cj4gSSB1bmRlcnN0YW5k
IHlvdXIgcG9pbnQsIGJ1dCBJIGFtIG5vdCBjb252aW5jZWQgdGhhdCB0aGUgcG93ZXItZG9tYWlu
cwo+IG5lZWQgdG8gYmVsb25nIHRvIHRoZSAiY3B1cyIgbm9kZS4gSWRlYWxseSwgdGhlIHBvd2Vy
LWRvbWFpbiBkZXNjcmliZXMKPiB0aGUgcG93ZXItcmFpbCBhbmQgdGhlIGludGVyZmFjZSB0byBt
YW5hZ2UgdGhlIENQVXMsIHRoaXMgY2FuIHN1cmVseQo+IGJlIGRlc2NyaWJlZCBvdXRzaWRlIHRo
ZSAiY3B1cyIgbm9kZSAtIGV2ZW4gaWYgdGhlcmUgYXJlIG9ubHkgQ1BVcwo+IHRoYXQgYXJlIHVz
aW5nIGl0Lgo+Cj4gTW9yZW92ZXIsIG1vdmluZyBmb3J3YXJkLCBvbmUgc2hvdWxkIG5vdCBiZSBz
dXJwcmlzZWQgaWYgaXQgdHVybnMgb3V0Cj4gdGhhdCBhIHBsYXRmb3JtIGhhcyBvdGhlciBkZXZp
Y2VzIHRoYW4gdGhlIENQVXMsIHNoYXJpbmcgdGhlIHNhbWUKPiBwb3dlci1yYWlsIGFzIHRoZSBD
UFUgY2x1c3Rlci4gQXQgbGVhc3QsIHdlIGhhdmUgdGhhdCBmb3IgYXJtL3BzY2kKPiBbMV0uCgpG
b3Igbm9uLUNQVSBwb3dlciBkb21haW5zLCB3ZSBhcmUgd29ya2luZyBvbiBhIG1lc3NhZ2luZwpz
cGVjaWZpY2F0aW9uIChSUE1JKSBbMV0uIFRoZSBzdXBlcnZpc29yIHNvZnR3YXJlIG1pZ2h0IGhh
dmUKZGlyZWN0IGFjY2VzcyB0byBhIFJQTUkgdHJhbnNwb3J0IG9yIGl0IGNhbiBzZW5kIFJQTUkg
bWVzc2FnZXMKdmlhIFNCSSBNUFhZIGV4dGVuc2lvbiBbMl0uCgpJZiBwb3dlci1yYWlscyBvbiBh
IHBsYXRmb3JtIGFyZSBzaGFyZWQgYmV0d2VlbiBDUFVzIGFuZApkZXZpY2VzIHRoZW4gdGhlIHBs
YXRmb3JtIGNhbjoKCjEpIFVzZSBTQkkgSFNNIGZvciBDUFVzIGFuZCB1c2UgUlBNSSBmb3IgZGV2
aWNlcy4gVGhlCkRUIGJpbmRpbmdzIGZvciBkZXZpY2UgcG93ZXItZG9tYWlucyBiYXNlZCBvbiBS
UE1JIGFyZQpzdGlsbCB3b3JrLWluLXByb2dyZXNzLiBJZiB0aGVyZSBhcmUgbXVsdGlwbGUgc3Vw
ZXJ2aXNvciBkb21haW5zCihha2Egc3lzdGVtIGxldmVsIHBhcnRpdGlvbnMpIGNyZWF0ZWQgYnkg
U0JJIGltcGxlbWVudGF0aW9uIG9yCnNvbWUgcGFydGl0aW9uaW5nIGh5cGVydmlzb3IgdGhlbiB0
aGUgUlBNSSBtZXNzYWdlcyBjYW4gYmUKYXJiaXRyYWdlZCBieSBTQkkgaW1wbGVtZW50YXRpb24g
dXNpbmcgU0JJIE1QWFkgZXh0ZW5zaW9uLgpUaGUgU0JJIE1QWFkgZXh0ZW5zaW9uIGFsc28gYWxs
b3dzIHNoYXJpbmcgdGhlIHNhbWUgUlBNSQp0cmFuc3BvcnQgYmV0d2VlbiBtYWNoaW5lLW1vZGUg
KGZpcm13YXJlKSBhbmQgc3VwZXJ2aXNvci1tb2RlLgoKMikgVXNlIGl0cyBvd24gcGxhdGZvcm0g
c3BlY2lmaWMgcG93ZXItZG9tYWluIGRyaXZlciBmb3IgYm90aApDUFVzIGFuZCBkZXZpY2VzIChi
YXNpY2FsbHkgZG9uJ3QgdXNlIHRoZSBTQkkgSFNNIGFuZCBSUE1JKS4KSW4gdGhpcyBjYXNlLCB0
aGVyZSB3b24ndCBiZSBhbnkgY29udHJvbGxlZCBhY2Nlc3MgKG9yIGFyYml0cmF0aW9uKQpvZiBw
b3dlciByYWlscyBhY3Jvc3Mgc3VwZXJ2aXNvciBkb21haW5zLgoKPgo+ID4KPiA+IEkgc3VnZ2Vz
dCB3ZSBjb250aW51ZSB1c2luZyAiL2NwdXMvcG93ZXItZG9tYWlucyIgRFQgbm9kZQo+ID4gb25s
eSBmb3IgcG93ZXIgZG9tYWlucyByZWxhdGVkIHRvIENQVSBjbHVzdGVycyBvciBDUFUKPiA+IGNh
Y2hlLWhpZXJhcmNoeS4KPiA+Cj4gPiBGb3Igc3lzdGVtIHdpZGUgcG93ZXIgZG9tYWlucyBvZiBT
b0MgZGV2aWNlcywgd2UgY2FuIGVpdGhlcjoKPiA+IDEpIFVzZSBkZXZpY2UgcG93ZXIgZG9tYWlu
cyB0aHJvdWdoIHRoZSBTQkkgTVBYWSBleHRlbnNpb24KPiA+ICAgICB2aWEgZGlmZmVyZW50IGRy
aXZlcgo+ID4gMikgVXNlIGEgcGxhdGZvcm0gc3BlY2lmaWMgZHJpdmVyCj4gPgo+ID4gPgo+ID4g
PiBXZSBhbHNvIGxvb2sgYXQgY3B1aWRsZV9wc2NpX2RvbWFpbiBkcml2ZXIgYW5kIGl0IHNlZW1z
IEFybSBkb2Vzbid0Cj4gPiA+IGNyZWF0ZSB0aGUgZGV2aWNlcyBmb3IgZWFjaCBzdWJub2RlIG9m
IHBzY2kgZG9tYWluLgo+ID4gPiBJcyB0aGVyZSBhbnkgcmVhc29uIHRoYXQgdGhleSBkb24ndCBu
ZWVkIGl0Pwo+Cj4gV2UgZG9uJ3QgbmVlZCBpdCBmb3IgYXJtIGFzIHdlIGhhdmUgYSBzZXBhcmF0
ZSBub2RlIGZvciBQU0NJIGFuZCBpdHMKPiBwb3dlci1kb21haW5zIFsyXS4gTW9yZW92ZXIsIHdl
IGhhdmUgYSBzZXBhcmF0ZSBkcml2ZXIgdGhhdCBtYW5hZ2VzCj4gdGhlIHBvd2VyLWRvbWFpbiAo
Y3B1aWRsZS1wc2NpLWRvbWFpbikuCgpVbmxpa2UgdGhlIEFSTSB3b3JsZCwgd2UgZG9uJ3QgaGF2
ZSBhbnkgRFQgbm9kZSBmb3IgU0JJIGluCnRoZSBSSVNDLVYgd29ybGQgYmVjYXVzZSB0aGUgU0JJ
IGlzIGFsd2F5cyB0aGVyZS4gRHVlIHRvIHRoaXMsCnRoZSBTQkkgSFNNIENQVSBpZGxlIGRyaXZl
ciAodGhpcyBkcml2ZXIpIGN1cnJlbnRseSBsb29rcyBmb3IKQ1BVICJwb3dlci1kb21haW5zIiB1
bmRlciAiL2NwdXMiIERUIG5vZGUgYmVjYXVzZSB0aGUKU0JJIEhTTSBleHRlbnNpb24gb25seSBk
ZWFscyB3aXRoIENQVSBzdGF0ZXMuCgo+Cj4gWy4uLl0KPgo+IFsxXSBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL3Fjb20vc2M3MjgwLmR0c2kgKHNlYXJjaCBmb3IgIkNMVVNURVJfUEQiKQo+IFsyXSBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3BzY2kueWFtbAo+Cj4gS2luZCByZWdh
cmRzCj4gVWZmZQoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LXJw
bWkKWzJdIGh0dHBzOi8vZG9jcy5nb29nbGUuY29tL2RvY3VtZW50L2QvMUl2ZWozdTZ1UWdWZEpI
bmpyYnFnVXdFMUp1eTc1ZDR1WUNqV3JkTmplQWcvZWRpdD91c3A9c2hhcmluZwoKQmVzdCByZWdh
cmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
