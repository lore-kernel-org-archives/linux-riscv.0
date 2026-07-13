Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F99C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 14:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/aX00qj29dkjbkjnTEA1AIKeObLpDb6By1FV14iciuU=; b=I8sRI1rzQqCszO
	U1xBqgFbOZ0N4bcKvkconL3lLsdIb/JUx5JdCHu9nqPSswQmCqKOgFmdAWHDF77wqgbNX2f5w6YVJ
	SD1Naj9nQiwn3sftn3rIXjBxBuDde9aOyP7pgYkWGrfzRTw8RqXGOawiAxTNgs8hfpLKU/mwgeyaT
	BToIViFdUg8LUft/DE79KBuTDfLu0t0IKlYZTDdywAKczUlcwy/FxtLmiolcIDh2a7kuDyQlSGGuH
	qA49T9CeU75orHEW1ohQ+DoHLu7/h693ZhEoO4AGZsPtpHKBJ6YDLXtLYfHXqfN/WPmVUynfN23Ku
	jtOA7C0bWtAU+HHH9s+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI5E-00000009gcu-0iqu;
	Mon, 13 Jul 2026 14:56:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI5C-00000009gbV-2dBA
	for linux-riscv@bombadil.infradead.org;
	Mon, 13 Jul 2026 14:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8ryOTMNwVpU4ujGUky6ot1LLCqvzzEx6/bFp2CC3uos=; b=f+j85lNbZZkFBQ2RmNhL6X8oQs
	XGE9jVLcYvn9Vyuf05v4VTXfXm/v2PNvAtWFeeAs0dmCXD541XQg4PcOBDbw4RSpFTMwKmlt0mOQf
	pyXFdwwl/DTB6dWENbMh/L+esoPLzYd7TpCrUl5luTSDf8saF+e6Z79duNLuCPsVh+YnpttMMH7j2
	VMFeFxTWuz/rDvn46uJRE/bGXQenKUTdqan7+DV8zN8+umBPwsgjqNvpY4hBnyC+MI6y6XnT52PI1
	WGVOrR64C2eRue+G3bsKnDxfHHB10DuIJ3vagfXNBEMR//17lBAds0/vRDEOd15iToXY+2HEBHpWQ
	kT2EHmMQ==;
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjI56-0000000Bk5G-3x7i
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 14:56:33 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-667b76205f1so2681262d50.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 07:56:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783954586; cv=none;
        d=google.com; s=arc-20260327;
        b=l4+JuIp3FFZultxQCYYO1ySoZaIY1EztxS473YV7ruQxwR+qN0YLVXY276VSX2E3ky
         FBS67GgiLRfkg+9zbWX5pL+wViDDmRUul9qtkO8V7HEmRB2JI662E3e9gxkA7+4SX4Oi
         2ke/yzqlaHfARcAB5ia3um4AkCNNV/1rs7AZpY+TB70J2jZ2o57hVpP/vUofWQRmQTJU
         XlfItG7qFAYESB7xjEja6OMB5zxaJ+1ntsRDaA7cudmH53kSMTVt8+pvrHnauPeuQ7QR
         HWx0bZpppfOdB4Cfv0xXrBVNl4ZbAxAJW15chNKNGnWharnTCMi+PR4ij8hLz+N2MQqG
         F6Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8ryOTMNwVpU4ujGUky6ot1LLCqvzzEx6/bFp2CC3uos=;
        fh=x/XLz4ovuP2i6umxBl7IXiZatn5NPStiSyCXLrk0WHU=;
        b=h6DPFG+VIErj5R2JMinQgjWKyhLGv6kcKNZh+tv81/ujEit9YLAjHp/VymHW6vB4Wg
         GrusG+lFNoVquHuVCtpPGdSfvn1Zbn38Y9+pa7R/KSEagbQXXHog4GbqO5i/Yxg1LdA6
         eZR/lyIHwp2IwpMAkF6nU2wFcBhKTkI0gQPEpi1sWsF7OWQyB03v+/w/AIbcrLsnXRk/
         5osFSwu4YH7o0mMG1tCwOpJb7TN14Y2HGEQ6r+SGT+SU91xiV7SXXCDFeeGN++wNh4qF
         oKPLT8Pj44MV89b4NgZrU9cxOmCjdFAnFzLuZrJAmZJ0hFdUZVeZ7YbhmaNEuwUjLAIb
         z/Xg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1783954586; x=1784559386; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8ryOTMNwVpU4ujGUky6ot1LLCqvzzEx6/bFp2CC3uos=;
        b=Y0Q0aCpEuNfckprfmK94M2ltMmAlcS4VPDEdO0+BUw0f4sSkv7ac83ndyrM6tRr9ZN
         Bf2DLeubbTbBJxI1woNyMuWKwGgyYDSszUD3ULEUBE6QRgNwEt33x+ukZK7Ojf+VcJU6
         z08atUgN3mJh61SvDry/OYK3t1GuKpU+yLGpMyKKSerc4bqoBUj527G7SEMEiRKPEqqM
         ZG4Qr1FLO/MgVDMDUT+n3ow2HD9IGzxMH0co5v5XvYL9+Wgjk/dcqS0lmMw4ZKdG/nPp
         xBYyG9xKBs9a0Xq0jpVhWpvnB/gwjUVKQWor1sgMN3CHXXwv2XSVyx0QFMfY0S6AmoMW
         MhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954586; x=1784559386;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ryOTMNwVpU4ujGUky6ot1LLCqvzzEx6/bFp2CC3uos=;
        b=T0yP1zNAKGd/L88XWGxKWQXMqM36ARoNxxgStEJXGi+JL5S7xfn+5jH4B32us5YNju
         UPSIhiwmQZL3rKwiQ35tAmAL40qSsz1He4W4jtkmGZNN71h4tdjZeho5lQGKzSBav5VS
         gKiy8d70S+QhqjlNeYw9uXN+kUtufWtAASv/MmFSEr0KFll6+JjHXBK2nE4eSB/UI93c
         u53g/c8s6HJVYxGyjevZ6WPRsQM2bwBHWm1YQNq+3rzcF2gFumzHBDnuXEXgPjlw+dCm
         knDNCQB7HjCpNso63wLFlZKgkHjKZtX0aUVy3o7cxRcHxA89aGEQzxeRsiodFpSbq+Qa
         gUkQ==
X-Forwarded-Encrypted: i=1; AHgh+RrhRS2E61YmsUG4/Bea7g3mz6h5g7DeqLx233WRoV3sXobOE4rwzh5kDlK9oFyObJRnkSg+jMwYogm4wA==@lists.infradead.org
X-Gm-Message-State: AOJu0YysNl18Px19ixDLOQ098+xMuAUSgJ/bbJXqVp5fpoRIjYOeKOo2
	L3HmGKfourXYjaBMssbvigy8mHzIHJ3PSWJcOezCdvY6dDQZQPFs+ptwOaYbtNeyV6qkyyqmTld
	GLd7L7262FMKZPB6MaOEmiHRoATsoRNzwRfQ35R+i9w==
X-Gm-Gg: AfdE7cm8ifgsQcXRkGIBkmNkYx/MMHnPBCaqGY2ecD6aj8IByT9tQS9WIsK8t5gFh+3
	qWORdCctlbFa9tW/mxeIvNhBDjnxbDEVXooN4KEMJyB4IoLAqfQrNSh7OsJlmH/KeiE52Lb2GoI
	knAjd8OYTBI1U9hDXBByjjB+VW03qgFiThh+5uQE2vjiRmfZGHUT2Z8MHKYpQYFzdtb0qxZ4in1
	GCOwbkdk3nQL4Qn2Ll3RqI1FGgou/P/QUuVwIcxAmAa1j38iWsFZFzQLXlEn126MoGKFEjHO+l5
	OM/tYfPgRxDjBsCcIURX2g/p6RE=
X-Received: by 2002:a05:690e:210d:b0:664:8e4e:66fe with SMTP id
 956f58d0204a3-667d7b003e7mr4788212d50.12.1783954586457; Mon, 13 Jul 2026
 07:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
 <wjbz5tp7vjrsjwjaiu3n7du5ksbrlsduuxhwg2wriyxshkrqd5@t3sdxr6ua2sg> <20260713123759-GKD106000@kernel.org>
In-Reply-To: <20260713123759-GKD106000@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 13 Jul 2026 09:56:15 -0500
X-Gm-Features: AUfX_mxXZbxq8-VPSYzKHw4Bcqse0ZCXB00LCsca2IM_XGbO21zHzHAHbEujGR4
Message-ID: <CAEev2e-g3bZcohFf_7b5CaVyi0BeWi5uwLGj6MuhQXp16jiyEQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add UFS Host driver support for SpacemiT K3 SoC
To: Yixun Lan <dlan@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_155629_060938_342CCE37 
X-CRM114-Status: GOOD (  24.15  )
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

SGkgWWl4dW4sCgpPbiBNb24sIEp1bCAxMywgMjAyNiBhdCA3OjM44oCvQU0gWWl4dW4gTGFuIDxk
bGFuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGkgQW5pcnVkaCwKPgo+IE9uIDIyOjQwIFN1biAx
MiBKdWwgICAgICwgQW5pcnVkaCBTcmluaXZhc2FuIHdyb3RlOgo+ID4gSGkgWWl4dW4sCj4gPgo+
ID4gT24gVGh1LCBKdWwgMDIsIDIwMjYgYXQgMDI6MzE6MzRBTSArMDAwMCwgWWl4dW4gTGFuIHdy
b3RlOgo+ID4gPiBUaGlzIHNlcmllcyB0cnkgdG8gYWRkIFVGUyBzdXBwb3J0IGZvciBTcGFjZW1p
VCBLMyBTb0MsIHRoZSBjb250cm9sbGVyCj4gPiA+IGNvbXBvbmVudHMgY29uc2lzdHMgb2YgU3lz
dGVtIEJ1cyBJbnRlcmZhY2UgVW5pdCwgVUZTIEhvc3QgQ29udHJvbGxlcgo+ID4gPiBJbnRlcmZh
Y2UsIFVGUyBUcmFuc3BvcnQgUHJvdG9jb2wgTGF5ZXIsIFVGUyBIb3N0IFJlZ2lzdGVycywgRGV2
aWNlCj4gPiA+IE1hbmFnZW1lbnQgRW50aXR5IChETUUpLCBUcmFuc3BvcnQgTGF5ZXIsIE5ldHdv
cmsgTGF5ZXIsIERhdGEgTGluawo+ID4gPiBMYXllciwgUEhZIEFkYXB0ZXIgTGF5ZXIsIGFuZCBN
LVBIWSBJbnRlcmZhY2UuIEEgbW9yZSBkZXRhaWwgZnVuY3Rpb25hbAo+ID4gPiBibG9jayBkaWFn
cmFtIGNhbiBiZSBmb3VuZCBpbiBTcGFjZW1pVCB3ZWJzaXRlLCBjaGFwdGVyIDkuNy4zIFsxXQo+
ID4gPgo+ID4gPiBQbGVhc2Ugbm90ZSwgaW4gb3JkZXIgdG8gdGVzdCB0aGlzIGRyaXZlciwgdGhl
IFVGUyBjbG9jayBkcml2ZXJbMl0gaGVyZQo+ID4gPiBzaG91bGQgYmUgYXBwbGllZCBmaXJzdCBh
cyBhIHByZXJlcXVpc2l0ZSBwYXRjaC4KPiA+ID4KPiA+ID4gT25lIGtub3duIGlzc3VlIGlzIHRo
YXQgdGhlIGRldmljZSB3aWxsIG9jY2FzaW9uYWxseSByYWlzZSBCS09QUyBpbnRlcnJ1cHQKPiA+
ID4gd2hlbiBkb2luZyBzb21lIGhpZ2ggbG9hZCB0ZXN0LCBsb2cgZnJvbSBkbWVzZyBzaG93cwo+
ID4gPgo+ID4gPiBbICA4MDYuNzEwNzYzXSB1ZnNoY2Qtc3BhY2VtaXQgYzBlMDAwMDAudWZzaGM6
IHVmc2hjZF9ia29wc19leGNlcHRpb25fZXZlbnRfaGFuZGxlcjogZGV2aWNlIHJhaXNlZCB1cmdl
bnQgQktPUFMgZXhjZXB0aW9uIGZvciBia29wcyBzdGF0dXMgMQo+ID4gPgo+ID4gPiBMaW5rOiBo
dHRwczovL3NwYWNlbWl0LmNvbS9jb21tdW5pdHkvZG9jdW1lbnQvaW5mbz9ub2RlcGF0aD1oYXJk
d2FyZS9rZXlfc3RvbmUvazMvazNfZG9jcy9rM191c2VybWFudWFsLzA5X21lbW9yeV9zdG9yYWdl
Lm1kJmxhbmc9ZW4gWzFdCj4gPiA+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDI2MDYzMC0wNi1jbGstdWZzLXN1cHBvcnQtdjEtMC1jZjc1MjFkMWQwZmVAa2VybmVsLm9yZy8g
WzJdCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFlpeHVuIExhbiA8ZGxhbkBrZXJuZWwub3JnPgo+ID4K
PiA+IEkgc2VlIHRoaXMgZHVyaW5nIHByb2JlIG9uIGEgazMtcGljby1pdHguIERvZXMgdGhlIFVG
UyBjaGlwIG9uIGJvYXJkCj4gPiBoYXZlIGFuIFJQTUIgYmxvY2sgb24gaXQ/IElzIHRoaXMgZXJy
b3Igb2YgYW55IGNvbmNlcm4uCj4gPgo+IEl0J3MgcHJvYmFibHkgdHJ1ZSBvZiBoYXZpbmcgYSBS
UE1CIGJsb2NrLCBidXQgbm90IHVzZWQgaW4gSzMgcGxhdGZvcm0sIHNvIGNhbiBpZ25vcmUKPgo+
ID4gWyAgICA1Ljk1Nzg2NF0gdWZzaGNkLXNwYWNlbWl0IGMwZTAwMDAwLnVmc2hjOiB1ZnNoY2Rf
c2NzaV9hZGRfd2x1czogQk9PVCBXTFVOIG5vdCBmb3VuZAo+ID4gWyAgICA1Ljk2MzMxOV0gYnVz
X2FkZF9kZXZpY2U6IGNhbm5vdCBhZGQgZGV2aWNlICd1ZnNfcnBtYjAnIHRvIHVucmVnaXN0ZXJl
ZCBidXMgJ3Vmc19ycG1iJwo+ID4gWyAgICA1Ljk3MTE1NV0gdWZzaGNkLXNwYWNlbWl0IGMwZTAw
MDAwLnVmc2hjOiBGYWlsZWQgdG8gcmVnaXN0ZXIgVUZTIFJQTUIgZGV2aWNlIDAKPiA+Cj4gTWF5
YmUgZGlzYWJsZSBDT05GSUdfUlBNQiB0byBzaWxlbnQgdGhpcz8gSSd2ZSBub3QgdGVzdGVkIHRo
aXMgb3B0aW9uIGxvY2FsbHkKCkknbSB0ZXN0aW5nIG9uIGEgZGlzdHJvIGRlZmNvbmZpZywgc28g
aXQgaGFzIHRoaXMgb3B0aW9uIGVuYWJsZWQuCgpJcyB0aGVyZSBhbnl0aGluZyB3ZSBjYW4gZG8g
aW4gdGhlIGRyaXZlciB0byBoYXZlIGl0IGlnbm9yZSB0aGUgUlBNQj8KSWYgdGhlIGVycm9yIGlz
IGEgcmVkLWhlcnJpbmcsIHdlIHNob3VsZG4ndCBiZSBkaXNwbGF5aW5nIGl0IGF0IGFsbCBpbgp0
aGUgZmlyc3QgcGxhY2UuCgpSZWdhcmRzCkFuaXJ1ZGggU3Jpbml2YXNhbgoKPgo+IC0tCj4gWWl4
dW4gTGFuIChkbGFuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
