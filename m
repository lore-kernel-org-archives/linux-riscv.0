Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D055AC00A5A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 02:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BVf2VRhW1rdvPD4Hg+FviGE+9Pink23GJ6hUOE+jo/k=; b=Kp8T3yoKTEdPP7
	epjhDBLOwtNp6Mbo9kFj1UFJX8fWdMkr6YYm7EWnL+wHLpJCI/fT72nUZ9VrdgnbDo7eyhxgYVI+M
	Z5oykUJeggrwWvDAs/rk7756Ayr8ZPHX6KV3eCrAGUfsXm73vQMOKm0TEHgWPbIJQ68iwhGIYDBGn
	7KT3owNT7/6upsMG/Uley2Rgx8jCItlyou9/gXcMFEGo2Etw2WvN5QhLE4XnR/Oti025jRZRWrnN0
	AjcXcqNKn2j7R/jGPT0WBE4DzVXGgzqigQYB7Q2VwJeyeJge0h0u8xVbnd2afNP6Y63S4D17+t1M6
	6oG09Fz+GzowL0wsOJSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHyEI-00GbSv-FS; Wed, 18 Jan 2023 02:31:10 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHyED-00GbSG-Dy
	for linux-riscv@lists.infradead.org; Wed, 18 Jan 2023 02:31:09 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 203so36498219yby.10
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jan 2023 18:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnaUf3QSVN2saLT2ffyfJ60ASojbZ1sd/IBl8PiiSXs=;
        b=SJwcydLYElPFNUtH9vShrHDvyVLBsxBJ4Tbx9UF+Cj+Fka+ZodXAQccK+rD6Tvrvre
         WBwvq2CvH2p44bHs9kM3p6pxcQ3iQ9OL0FtCP/YoVSxgii4oj3OKcTe5YF3a0uqjR28c
         dgRPdqgDrkYZqvylRNmUupYXs4J0OG64qJPelFwR+94bRwlFhIRu8EXO5aDcfduMQlJj
         eIvNjQcMDqQe9/tPwjzPiueUi0aTKjMhdTN91iq9hIW7HL6pepDiH+OiK9fWdoQTBmC/
         Pp9+qLpaHZoQt52AdthBDx8+wjR3l0E+zPA9DvvP0EUDa/QXOOa7L50GhQxsRXXDL3Bt
         N/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnaUf3QSVN2saLT2ffyfJ60ASojbZ1sd/IBl8PiiSXs=;
        b=2dWDDwZ1AFskTrG5xQaHuwXBVLoOu4UoSRbitm5vf2Wh6HjhgIsd9pEcW3+pZwvho3
         LYyyGSYS3DyatV5cXfzzfmuDWAGVnvYGdF4/MdUSgrUjQysulYuhnuZmBivSa7UkCtgq
         LKQkhLr0zPRH8qA/eE/6Y4domcbBYw34vlzGCwEIejWBxxMX3qLn+NHhDwf0lzf2GSBG
         s4m6WsH3berp+T6k1V7SsR9AhMhMv34BvdtqTWAc2idCnZfeUAEzbloBMkbbAOdOYiCz
         10zL/1u+p2MUuLg/r57CwVoCJBT4Om1BmiaqaRpSFe1lKlbHcpXwCgL3EQxgSEwMZ0Dd
         Ua7w==
X-Gm-Message-State: AFqh2kpipDdBeFgjaIVKHX+hyvWKPXnNXI8FvSZxFMKkUY1/DudlyEWd
	rUBEA+DVzbpvuQmfiy/F5/8hhhuG9X4H8qWsKF5pLAJOOxOs1CjrVyU=
X-Google-Smtp-Source: AMrXdXs1lNfCBcr7LYUIuPyvtZB23DXwSuKFBjAl9Hh1uvQ+oOlwxrTdcHGJ40bPv+te+6cIe/6LJ2EFM5yG+OQHSS4=
X-Received: by 2002:a5b:f11:0:b0:7f3:de9b:de11 with SMTP id
 x17-20020a5b0f11000000b007f3de9bde11mr315627ybr.544.1674009064182; Tue, 17
 Jan 2023 18:31:04 -0800 (PST)
MIME-Version: 1.0
References: <20230113083115.2590-1-nylon.chen@sifive.com> <Y8GjySjm9OjoZvCF@spud>
 <95F1EAA0-D8D6-4F8A-8049-5E7BFDE4C06C@jrtc27.com>
In-Reply-To: <95F1EAA0-D8D6-4F8A-8049-5E7BFDE4C06C@jrtc27.com>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Wed, 18 Jan 2023 10:30:52 +0800
Message-ID: <CAHh=Yk8=-LvJ3ygC8aK6y7FBFaOyiZ1UQY9PSXWwNwJAWYJW8w@mail.gmail.com>
Subject: Re: [PATCH 0/2] Change PWM-controlled LED pin active mode and algorithm
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, nylon7717@gmail.com, zong.li@sifive.com, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, 
	Thierry Reding <thierry.reding@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-pwm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_183105_542140_C930FE02 
X-CRM114-Status: GOOD (  37.78  )
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

SGkgSmVzcywKCmFzIHlvdSBzYWlkLCBJIHVzZSBMRUQgZGlyZWN0bHkgY29ubmVjdGVkIHRvIFBX
TSBsb2dpYyB0byBtb2RpZnkgaXQuCgpBcyBJIHN0YXRlZCBpbiBteSBwcmV2aW91cyBhcnRpY2xl
LCB0aGUga2V5IGlzIHRoYXQgdGhlIGxvd2VyIHRoZSBQV00Kb3V0cHV0IGlzLCB0aGUgYnJpZ2h0
ZXIgdGhlIExFRCBsaWdodCBpcyhhY3RpdmUtbG93KSwgdGhlIGhpZ2hlciB0aGUKUFdNIG91dHB1
dCBpcywgdGhlIGJyaWdodGVyIHRoZSBMRUQgbGlnaHQgaXMoYWN0aXZlLWhpZ2gpLgoKVGhlcmVm
b3JlLCBJIHdvdWxkIHBvaW50IG91dCB0aGUgd2F2ZWZvcm0gZGlhZ3JhbSBiZWxvdywgdGhlIG91
dHB1dApyZXN1bHQgcmVtYWlucyB0aGUgc2FtZSBmb3IgdGhlIGNpcmN1aXQsIGJ1dCB3aGVuIHlv
dSB1c2UKYWN0aXZlLWxvdy9hY3RpdmUtaGlnaCB0byBsb29rIGF0IGl0LCB5b3Ugd2lsbCBnZXQg
dHdvIGNvbXBsZXRlbHkKZGlmZmVyZW50IHJlc3VsdHMgb2YgYnJpZ2h0bmVzcy4KCmUuZy4gZHV0
eT0zMHMsIHBlcmlvZD0xMDBzLCBhY3R2aWUtaGlnaCA9IDMwJSwgYWN0aXZlLWxvdyA9IDcwJQoK
VgpeCnwKfCAtLS0tLS0tLS0tfAp8ICAgICAgICAgICAgIHwKfCAgICAgICAgICAgICB8CnxfX19f
X18gfF9fX19fX19fX18gPiB0CgpKZXNzaWNhIENsYXJrZSA8anJ0YzI3QGpydGMyNy5jb20+IOaW
vCAyMDIz5bm0MeaciDE05pelIOmAseWFrSDkuIrljYgzOjI05a+r6YGT77yaCj4KPiBPbiAxMyBK
YW4gMjAyMywgYXQgMTg6MzIsIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gPgo+ID4gK0NDIFV3ZSwgVGhpZXJyeSwgbGludXgtcHdtCj4gPgo+ID4gSGV5IE55bG9uLAo+
ID4KPiA+IFBsZWFzZSBydW4gc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCBiZWZvcmUgc2VuZGlu
ZyBwYXRjaGVzLCB5b3UgbWlzc2VkCj4gPiBib3RoIG1lICYgdGhlIFBXTSBtYWludGFpbmVycyB1
bmZvcnR1bmF0ZWx5IQo+ID4gQUZBSUssIHRoZSBQV00gbWFpbnRhaW5lcnMgdXNlIHBhdGNod29y
aywgc28geW91IHdpbGwgcHJvYmFibHkgaGF2ZSB0bwo+ID4gcmVzZW5kIHRoaXMgcGF0Y2hzZXQg
c28gdGhhdCBpdCBpcyBvbiB0aGVpciByYWRhci4KPiA+IEkndmUgbWFya2VkIHRoZSBzZXJpZXMg
YXMgIkNoYW5nZXMgUmVxdWVzdGVkIiBvbiB0aGUgUklTQy1WIG9uZS4KPiA+Cj4gPiBPbiBGcmks
IEphbiAxMywgMjAyMyBhdCAwNDozMToxM1BNICswODAwLCBOeWxvbiBDaGVuIHdyb3RlOgo+ID4K
PiA+PiBBY2NvcmRpbmcgdG8gdGhlIGNpcmN1aXQgZGlhZ3JhbSBvZiBVc2VyIExFRHMgLSBSR0Ig
ZGVzY3JpYmVkIGluIHRoZQo+ID4+IG1hbnVhbCBoaWZpdmUtdW5tYXRjaGVkLXNjaGVtYXRpY3Mt
djMucGRmWzBdLgo+ID4+IFRoZSBiZWhhdmlvciBvZiBQV00gaXMgYWNpdHZlLWhpZ2guCj4gPj4K
PiA+PiBBY2NvcmRpbmcgdG8gdGhlIGRlc2NyaXB0aW9ub2YgUFdNIGZvciBwd21jbXAgaW4gU2lG
aXZlIEZVNzQwLUMwMDAKPiA+PiBNYW51YWxbMV0uCj4gPj4gVGhlIHB3bSBhbGdvcml0aG0gaXMg
KFBXKSBwdWxzZSBhY3RpdmUgdGltZSAgPSAoRCkgZHV0eSAqIChUKSBwZXJpb2RbMl0uCj4gPj4g
VGhlIGBmcmFjYCB2YXJpYWJsZSBpcyBwdWxzZSAiaW5hY3RpdmUiIHRpbWUgc28gd2UgbmVlZCB0
byBpbnZlcnQgaXQuCj4gPj4KPiA+PiBTbyB0aGlzIHBhdGNoc2V0IHJlbW92ZXMgYWN0aXZlLWxv
dyBpbiBEVFMgYW5kIGFkZHMgcmV2ZXJzZSBsb2dpYyB0bwo+ID4+IHRoZSBkcml2ZXIuCj4gPj4K
PiA+PiBbMF06aHR0cHM6Ly9zaWZpdmUtY2hpbmEub3NzLWNuLXpoYW5namlha291LmFsaXl1bmNz
LmNvbS9IaUZJdmUlMjBVbm1hdGNoZWQvaGlmaXZlLXVubWF0Y2hlZC1zY2hlbWF0aWNzLXYzLnBk
Zgo+ID4+IFsxXTpodHRwczovL3NpZml2ZS1jaGluYS5vc3MtY24temhhbmdqaWFrb3UuYWxpeXVu
Y3MuY29tL0hpRkl2ZSUyMFVubWF0Y2hlZC9mdTc0MC1jMDAwLW1hbnVhbC12MXAyLnBkZgo+ID4+
IFsyXTpodHRwczovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9EdXR5X2N5Y2xlCj4gPgo+ID4gUGxl
YXNlIGRlbGV0ZSBsaW5rIDIsIGNvbnZlcnQgdGhlIG90aGVyIHR3byB0byBzdGFuZGFyZCBMaW5r
OiB0YWdzIGFuZAo+ID4gcHV0IHRoaXMgaW5mb3JtYXRpb24gaW4gdGhlIGR0cyBwYXRjaC4gUG9z
c2libHkgaW50byB0aGUgUFdNIHBhdGNoIHRvbywKPiA+IGRlcGVuZGluZyBvbiB3aGF0IHRoZSBQ
V00gbWFpbnRhaW5lcnMgdGhpbmsuCj4gPiBUaGlzIGluZm8gc2hvdWxkIGJlIGluIHRoZSBjb21t
aXQgaGlzdG9yeSBJTU8gYW5kIHRoZSBjb21taXQgbWVzc2FnZSBmb3IKPiA+IHRoZSBkdHMgcGF0
Y2ggc2F5cyB3aGF0J3Mgb2J2aW91cyBmcm9tIHRoZSBkaWZmIHdpdGhvdXQgYW55IGV4cGxhbmF0
aW9uCj4gPiBhcyB0byB3aHkuCj4gPgo+ID4gSSBkaWQgYSBiaXQgb2YgbG9va2luZyBhcm91bmQg
b24gbG9yZSwgdG8gc2VlIGlmIEkgY291bGQgZmlndXJlIG91dAo+ID4gd2h5IGl0IHdhcyBkb25l
IGxpa2UgdGhpcyBpbiB0aGUgZmlyc3QgcGxhY2UsIGFuZCBJIGZvdW5kOgo+ID4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtcHdtL0NBSjJfak9HMk0wM2FMQmdVT2dHaldIOUNVeHEyYVRH
OTdlU1g3MD1VYVNiR0NNTUZfZ0BtYWlsLmdtYWlsLmNvbS8KPgo+IFRoYXQgRFRTIGRvY3VtZW50
YXRpb24gbWFrZXMgbm8gc2Vuc2UgdG8gbWUsIHdoeSBkb2VzIHdoYXQgdGhlIExFRCBpcwo+IHdp
cmVkIHRvIG1hdHRlcj8gV2hldGhlciB5b3UgaGF2ZSB5b3VyIHRyYW5zaXN0b3IgbmV4dCB0byBn
cm91bmQgb3IKPiBuZXh0IHRvIFZkZCBkb2VzbuKAmXQgbWF0dGVyLCB3aGF0IG1hdHRlcnMgaXMg
d2hldGhlciB0aGUgdHJhbnNpc3RvciBpcwo+IG9uIG9yIG9mZi4gTWF5YmUgd2hhdCB0aGV5IG1l
YW4gaXMgd2hldGhlciB0aGUgKlBXTSdzIG91dHB1dCogLyAqdGhlCj4gdHJhbnNpc3RvcidzIGlu
cHV0KiBpcyBwdWxsZWQgdG8gZ3JvdW5kIG9yIFZkZD8gSW4gd2hpY2ggY2FzZSB0aGUKPiBwcm9w
ZXJ0eSB3b3VsZCBpbmRlZWQgbm90IGFwcGx5IGhlcmUuCj4KPiBVbmxlc3MgdGhhdOKAmXMgd3Jp
dHRlbiBhc3N1bWluZyB0aGUgTEVEIGlzIHdpcmVkIGRpcmVjdGx5IHRvIHRoZSBQV00sIGluCj4g
d2hpY2ggY2FzZSBpdCB3b3VsZCBtYWtlIHNlbnNlLCBidXQgdGhhdOKAmXMgYSB2ZXJ5IG5hcnJv
dy1taW5kZWQgdmlldyBvZgo+IHdoYXQgdGhlIFBXTSBvdXRwdXQgaXMgKGRpcmVjdGx5KSBkcml2
aW5nLgo+Cj4gSmVzcwo+Cj4gPiBUaGF0IGRvZXNuJ3QgZXhwbGFpbiB0aGUgZHJpdmVyLCBidXQg
aXQgZG9lcyBleHBsYWluIHRoZSBkdHMgYmVpbmcgdGhhdAo+ID4gd2F5LiBQZXJoYXBzIGEgRml4
ZXMgdGFnIGlzIGFsc28gaW4gb3JkZXI/IEJ1dCBvbmx5IGlmIGJvdGggcGF0Y2hlcyBnZXQKPiA+
IG9uZSwgb3RoZXJ3aXNlIGJhY2twb3J0aW5nIHdvdWxkIGxlYWQgdG8gYnJlYWthZ2UuCj4gPgo+
ID4gVGhlIG1pbigpIGNvbnN0cnVjdCBhcHBlYXJzIHRvIGhhdmUgYmVlbiB0aGVyZSBzaW5jZSB0
aGUgUkZDIGRyaXZlciB3YXMKPiA+IGZpcnN0IHBvc3RlZC4KPiA+Cj4gPiBUaGFua3MsCj4gPiBD
b25vci4KPiA+Cj4gPj4KPiA+PiBOeWxvbiBDaGVuICgyKToKPiA+PiAgcmlzY3Y6IGR0czogc2lm
aXZlIHVubWF0Y2hlZDogUmVtb3ZlIFBXTSBjb250cm9sbGVkIExFRCdzIGFjdGl2ZS1sb3cKPiA+
Cj4gPiBuaXQ6IHMvc2lmaXZlIHVubWF0Y2hlZDovc2lmaXZlOiB1bm1hdGNoZWQ6Lwo+ID4KPiA+
PiAgICBwcm9wZXJ0aWVzCj4gPj4gIHB3bTogc2lmaXZlOiBjaGFuZ2UgdGhlIFBXTSBjb250cm9s
bGVkIExFRCBhbGdvcml0aG0KPiA+Pgo+ID4+IGFyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2hp
Zml2ZS11bm1hdGNoZWQtYTAwLmR0cyB8IDQgLS0tLQo+ID4+IGRyaXZlcnMvcHdtL3B3bS1zaWZp
dmUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEgKwo+ID4+IDIgZmlsZXMgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDQgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiAtLQo+ID4+IDIuMzYu
MQo+ID4+Cj4gPj4KPiA+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+ID4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+ID4+IGxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKPiA+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+ID4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPiBsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
