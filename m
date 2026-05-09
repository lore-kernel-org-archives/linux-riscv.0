Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCB2CD3447
	for <linux-riscv@archiver.kernel.org>; Sat,  9 May 2026 15:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=80S/Vc0jwJW3whJMxuYz38wqdO03eVL88ZgiAAKvl2k=; b=CQVM99FC0K+N0i
	qjX9/HqByVB86oR2iU2X/UR45ds50unmQHGMLeQlY+EWabFi30TcyzEvEQgliE2BXNMerP+EyyHaY
	ovEm4SVJihowRUUSX5BUaJwpO4DAjmPIl2+n+kUQfMLtz88zR+MsozJ/JCb8bkc9vzWvNd1IdrntW
	wD7lb19dpT68zYM8BISxjcEFhCCG02VrEINcdoMwr7pCea9vSRsAZakyBHYxDlNsvTJtMa8aMKfLe
	7k0shchtYW7RU9d4veijOKot3iEPYB4f0u83yiM0FDTWqQfp20JT8T6b7EE9OsiDuNkOAppg+XXD1
	FrTMkiBGGo3Ph3TqVufQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLjSN-00000009BFT-01Aw;
	Sat, 09 May 2026 15:19:07 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLjSJ-00000009BEn-20sL
	for linux-riscv@lists.infradead.org;
	Sat, 09 May 2026 15:19:05 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-67cac5ece75so5151843a12.2
        for <linux-riscv@lists.infradead.org>; Sat, 09 May 2026 08:19:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778339941; cv=none;
        d=google.com; s=arc-20240605;
        b=FII5G5havHV0kRBvT7sjGUdAT0gUrHbo2GuswZvUc9C8NllM/7+oeByGRybfO1qJgl
         o6bx8DIRR/THmgmDs4GAKUJ8t9ZbrXdPQlSEz8Mof+icaWqP8OnQGyC+nZ/2QKai+HGZ
         5eCLHCXKD7UBnizaeGqouIvXMEQ+AhqVWfn5EEQtTuVRvtFdlshgzwAgDYTLcQR5vHwL
         vw9N9CR3FrqYyZPbZv0on9yanMffmn0U+2V1SGbAIE+mtnuYSpMRgwzgLuONc0dJY90S
         GbAe534ivRBFHB+oYmYvYG/Z8LuitexRDefCYVlObaqby+VeCtNbSNnouGeVHCMl3kEB
         JoQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lWC4p6CoR3WnBZepPidUEBffnCrNgpoooO8w4NtuJ7M=;
        fh=j0O6hxXzP1ePG7ZDUnwRiQs1xLe+vVZQ/CDMblqoMO4=;
        b=SVou4RnMBX1/cmuqZ6pzxSoxswU/Drjzc29bZnxZHhVAys7ei5fDG/l4TBrEXNcPEt
         C95l+O7wsJWiimE4372O5GmMz4T02VnEwqGMecLhQm/1ApBvXhApVXAmFd/3FmQRhs4u
         gx6LT6BxoSJcqw3nctJWXamhoMQCxttz1vejk/3mqxSQKQOEZIBQOwiQVxDJVsGQy/pq
         B4kK1KXZC6i3KmwxVCQRsfMKl3a9hY9j6NVpzz42+o1ZPp3eeDpJn6Dl9tsw2yp+SfiS
         OV+IO8Lf6O3X/dLRZFlaRH3Db4zf2RcYpjctOpCU08lDqvY8CZxLTRvGhFBD1bveJila
         FXNg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778339941; x=1778944741; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWC4p6CoR3WnBZepPidUEBffnCrNgpoooO8w4NtuJ7M=;
        b=axi8mLpgdfyMPEtPepe7FnqaFnyLitLqS1HUzLeRCsQf+g0VfUvJyQMa95cvxLLpHh
         WYtzWnxMl7Z7zTTr7M6VTD1BCBCs3fJd2SMh5kQSubSYGmAuKuBsmgMZEO7lywzYw/d0
         QkPgxUR8XXUDHYY141RUs59kcMm6RcDa73hSnh9sM1nafIrDwAHExqshFpNyCqOVuuGc
         xt91/y7VJohyZsju0LLhzQxDx6XRyEasR+LqM8poRa1UrahUFD6VqSnPSdR/D9U7TOUD
         y1yZBBVghIYJlG7CfnePtO9uq35KGNZgCI7O2m5zUiz9o913BR9ktC4DW5c2KXNpRfmG
         7AfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778339941; x=1778944741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lWC4p6CoR3WnBZepPidUEBffnCrNgpoooO8w4NtuJ7M=;
        b=G+Zt0l01PNdx1jkLAEas8gecz3FOoOy+oYrIq1L/kqvBdXFBIhIovAuuMgLvDmCzSu
         Dq9BpAxZTpqXTZsggT5Mquo4ENm28XBbylPdy4DOU//oMETHhOF+RHG8+GvMElA06ouE
         MvtGHdIbeRq2MiURp5wr0Zb+rV9xHGSIpZD1q008M3omcwm/fikzZgX4j16ZIeRKlyB0
         nkfxrJIxNPNXxiTdAwX+eEI4WxCqEYiUliWQIvlej89YkqN8gwTtESfK4EGUocYXtL3L
         du5pBqaPrSTwh1x1a2z0a82/YZcv+en/ay4ZjcAuNb14T46VrBE6nYwvsb8NOnwFIR9V
         6FPA==
X-Forwarded-Encrypted: i=1; AFNElJ9yqah/CHqt31IxMeOqR0zs6fPc7MoAm//sCu+XqEqg7vi5Vcvh2tReo1GF+LaIIkfnovRNUCQruhTP4w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjSoaP9TewMkOhRRQsZcqDmHdgi+r/rYg5dpYc99TUUstDIW7k
	3FETFYpePVejoaVJ/pc0FS6UPUOOSL1hBg8GV2RMxTqynZpap4p4pWW/QlMBSjg0kTX8q2vCrOy
	TUSAK3z9QKV2aB4I/0LnbCkTfdS/YJfs=
X-Gm-Gg: Acq92OGS3C5uYx5ZJmcp4kBCD6v26Ooe6MI5WZCdr/Ey8nvxb+He+42r6e0vAapsF34
	dADA/x4PvGA7HlzRyaeEN7WssdHUZ7oup+g5lz9VOP68UMZ5zJGqwwtgMyGmwHdLPaV6nB5Lr6W
	xwxLPhKVICWxGH++d5pNpn6gd/JIzFxJyEerrRd+ysm1I5/fyd0B1ogqg8s15FccMnmOVC6E+NL
	rmKEMm6Xt1+tQt+orv/FefvV+1tBQz3FtiFDLCZCG8Ra7093e8wl9YIESrCM9v9kZDl2hM5FPUP
	M6BB
X-Received: by 2002:a05:6402:510f:b0:66f:8fbc:c73e with SMTP id
 4fb4d7f45d1cf-67d63d8b785mr8680905a12.9.1778339940657; Sat, 09 May 2026
 08:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260502051906.8160-1-linux.amoon@gmail.com> <20260502051906.8160-2-linux.amoon@gmail.com>
 <20260507024524-GKA3579608@kernel.org> <CANAwSgQLhgC6puNy2dkMjL=hd+yTYizBBFykd63KJDbw48219w@mail.gmail.com>
 <20260509121802-GKB3601591@kernel.org>
In-Reply-To: <20260509121802-GKB3601591@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 9 May 2026 20:48:43 +0530
X-Gm-Features: AVHnY4LyUVJYkL_oLwoNQx2o6mh_XMStte74J_KAFvL20bhQMAlNuMI_2ORcHgg
Message-ID: <CANAwSgQNgXKitogbhQFcQaTTFtJ2sfxHehOCPdHH51S0a5wcSg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] riscv: dts: spacemit: k1-bananapi-f3: Add
 vcc5v0_sys regulator for Banana Pi F3
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	Han Gao <gaohan@iscas.ac.cn>, Ze Huang <huang.ze@linux.dev>, Chukun Pan <amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_081903_553018_EFFE8ABC 
X-CRM114-Status: GOOD (  31.28  )
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

SGkgWWl4dW4sCgpPbiBTYXQsIDkgTWF5IDIwMjYgYXQgMTc6NDgsIFlpeHVuIExhbiA8ZGxhbkBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IEhpIEFuYW5kLAo+Cj4gT24gMTM6MDYgRnJpIDA4IE1heSAg
ICAgLCBBbmFuZCBNb29uIHdyb3RlOgo+ID4gSGkgWWl4dW4sCj4gPgo+ID4gVGhhbmtzIGZvciB5
b3VyIHJldmlldyBjb21tZW50cy4KPiA+Cj4gPiBPbiBUaHUsIDcgTWF5IDIwMjYgYXQgMDg6MTUs
IFlpeHVuIExhbiA8ZGxhbkBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgQW5hbmQs
Cj4gPiA+Cj4gPiA+IE9uIDEwOjQ4IFNhdCAwMiBNYXkgICAgICwgQW5hbmQgTW9vbiB3cm90ZToK
PiA+ID4gPiBEZWZpbmUgdGhlIHN5c3RlbSA1ViBmaXhlZCByZWd1bGF0b3IgKHZjYzV2MF9zeXMp
IHN1cHBsaWVkIGJ5IHRoZQo+ID4gPiA+IERDIGlucHV0LiBBcyBwZXIgdGhlIHNjaGVtYXRpY3Ms
IHZjYzV2MF9zeXMgaXMgdGhlIGlucHV0IHBvd2VyIHNvdXJjZQo+ID4gPiA+IGZvciB0aGUgVkND
NVYwX0hVQiBhbmQgNVZfVkJVUyByZWdsYXRvcnMuIFVwZGF0ZSB0aGVzZSByZWd1bGF0b3JzCj4g
PiA+ID4gdG8gY29ycmVjdGx5IHJlZmVyZW5jZSB2Y2M1djBfc3lzIGFzIHRoZWlyIHBhcmVudCAo
dmluLXN1cHBseSkuCj4gPiA+ID4KPiA+ID4gPiBDYzogSGFuIEdhbyA8Z2FvaGFuQGlzY2FzLmFj
LmNuPgo+ID4gPiA+IENjOiBaZSBIdWFuZyA8aHVhbmcuemVAbGludXguZGV2Pgo+ID4gPiA+IENj
OiBDaHVrdW4gUGFuIDxhbWFkZXVzQGptdS5lZHUuY24+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTog
QW5hbmQgTW9vbiA8bGludXguYW1vb25AZ21haWwuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBh
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cyB8IDEyICsrKysr
KysrKysrKwo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+ID4gPiA+
Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFu
YW5hcGktZjMuZHRzIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1m
My5kdHMKPiA+ID4gPiBpbmRleCA1NzkwZDkyN2I5M2QuLjk3MjdlY2RkOWY2YiAxMDA2NDQKPiA+
ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0
cwo+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGkt
ZjMuZHRzCj4gPiA+ID4gQEAgLTUwLDYgKzUwLDE2IEBAIHJlZ19kY19pbjogcmVndWxhdG9yLWRj
LWluLTEydiB7Cj4gPiA+ID4gICAgICAgICAgICAgICByZWd1bGF0b3ItYWx3YXlzLW9uOwo+ID4g
PiA+ICAgICAgIH07Cj4gPiA+ID4KPiA+ID4gPiArICAgICByZWdfdmNjNXYwX3N5czogcmVndWxh
dG9yLXZjYzV2MC1zeXMgewo+ID4gPiBUaGlzIHdpbGwgZmFsbCBpbnRvIHRoZSBjYXRvZ2VyeSBv
ZiAibm9uLWNvbnRyb2xsYWJsZSAmIHNlcnZlIG5vIGRldmljZXMiCj4gPiA+IHNlZSBzaW1pbGFy
IGNvbW1lbnQgZm9yICdyZWdfZGNfaW4nIHdoaWNoIHJhaXNlZCBieSBLcnp5c3p0b2YKPiA+ID4K
PiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzY1MzA1MjZmLTU5Y2EtNDc1My1hMDY4
LTQ2YzYyYTFhMWZlZEBrZXJuZWwub3JnLwo+ID4gPgo+ID4gPiBvciBzaG91bGQgSSBhc2ssIHdo
YXQncyB0aGUgcmVhbCBwcm9ibGVtIGlmIHJlZ3VsYXRvciBoYXMgbm8gdmluLXN1cHBseT8KPiA+
Cj4gPiBJZiB0aGUgZGV2aWNlIHRyZWUgaXMgbm90IGNvbmZpZ3VyZWQgd2l0aCB0aGUgY29ycmVj
dCBwb3dlciBzb3VyY2UgaXQKPiA+IHdpbGwgYWZmZWN0IHBlcmZvcm1hbmNlLgo+ID4KPiBQbGVh
c2UgZWxhYm9yYXRlLCBvciBwcm92aWRlIGVub3VnaCBldmlkZW5jZSB0byBwcm92ZSB0aGlzLCBi
ZWNhdXNlIHRoZQo+IGNvbmNsdXNpb24geW91IGdhdmUgaGVyZSBjb250cmFkaWN0cyB3aXRoIHdo
YXQgS3J6eXN6dG9mIHBvaW50ZWQgb3V0CkkgZG9u4oCZdCBoYXZlIHRoZSBzY2hlbWF0aWMgZm9y
IHRoYXQgYm9hcmQsIHNvIEkgc2tpcHBlZCByZXBseWluZy4KClBsZWFzZSByZWZlciB0byB0aGUg
UE9XRVIgVFJFRSBkaWFncmFtLCB3aGljaCBwcm92aWRlcyBhIGNsZWFyCnZpc3VhbGl6YXRpb24g
b2YgdGhlIHBvd2VyIHNvdXJjZXMuCgpUaGlzIGJvYXJkIGFjY2VwdHMgdHdvIHByaW1hcnkgcG93
ZXIgc291cmNlczogYSAxMuKAr1YgREMgaW5wdXQgYW5kIFVTQgpUeXBl4oCRQyBwb3dlci4KRnJv
bSB0aGUgc2NoZW1hdGlj4oCZcyBwb3dlciB0cmVlIChwYWdl4oCvNCk6CgpUeXBl4oCRQyDihpIg
RENfSU7ihpIgU1k4Mzg2SiAoVXh4eCkg4oaSIFBJIFBNSUMKCkFjY29yZGluZyB0byB0aGUgYmxv
Y2sgZGlhZ3JhbSwgdGhlIFNZODM4NkogcmVndWxhdG9yIElDIGlzCnJlc3BvbnNpYmxlIGZvciBn
ZW5lcmF0aW5nIHRoZSBWQ0M1VjBfU1lTIHJhaWwgIFZDQzRWMF9TWVMgKHNlZSBwYWdlCjEzKS4K
ClVTQlZCVVMg4oaSIFNZODM4Nkog4oaSIFZDQzVWMF9TWVMKVVNCVkJVUyDihpIgU1k4Mzg2SiDi
hpIgVkNDNFYwX1NZUwoKVVNCVkJVUyAoIFR5cGVDIHBvcnQpIC0tPiBEQ19JTi0tPiAxMlYKCklu
IHRoaXMgZGVzaWduLCB0aGUgU1k4Mzg2SiBvcGVyYXRlcyBhcyBhIHN0ZXDigJFkb3duIGNvbnZl
cnRlciwgc3VwcGx5aW5nCmJvdGggVkNDNFYwX1NZUyBhbmQgVkNDNVYwX1NZUyByYWlscyBhbmQg
UCEgUE1JQy4KClNZODM4NiBpcyBhIGhpZ2gtZWZmaWNpZW5jeSBzeW5jaHJvbm91cyBzdGVwLWRv
d24gREMvREMgcmVndWxhdG9yCmNhcGFibGUgb2YgZGVsaXZlcmluZyB1cCB0byA2QSB3aXRoIHdp
ZGUgaW5wdXQgdm9sdGFnZSBzdXBwb3J0IGFuZCBtdWx0aXBsZQpwcm90ZWN0aW9uIGZlYXR1cmVz
LgpEYXRhc2hlZXQgWzFdIGh0dHBzOi8vZGF0YXNoZWV0NHUuY29tL2Rvd25sb2FkX25ldy5waHA/
aWQ9MTYwNDc0NAoKSSBoYXZlIHRyaWVkIHRvIGVsYWJvcmF0ZSBhcyBjbGVhcmx5IGFzIEkgY2Fu
Lgo+Cj4gPiA+IEFueSBwcm9iZSBmYWlsdXJlIG9yIHNvbWV0aGluZyBiYWQgaGFwcGVuPyAoYmVz
aWRlcyAvc3lzLy4uL3JlZ3VsYXRvcl9zdW1tYXkpCj4gPgo+ID4gTm90IHJlYWxseTsgdGhlIHJl
Z3VsYXRvciBzdW1tYXJ5IGp1c3QgY29uZmlybXMgdGhlIFBNSUMgdXNlZCB0aGUKPiA+IGNvcnJl
Y3QgcG93ZXIgc291cmNlLgo+ID4gd2l0aCB0ZSBkZXZpY2UgaXAgYmxvY2tzLgo+ID4KPiB0aGVu
IEkgc2VlIGl0J3MgdW5uZWNlc3NhcnkgdG8gYWRkIHRoaXMKPgo+ID4gQmFuYW5hcGkgRjMgc2No
ZW1hdGljcy4KPiA+IFsxXSBodHRwczovL2RyaXZlLmdvb2dsZS5jb20vZmlsZS9kLzE5aUxKNXhu
Q0Jfb0s4VmVRamtQR2p6QW4zOVdZeXlsdi92aWV3Cj4gPiAocGFnZSAyNCkKPiA+Cj4gPiBQbGVh
c2UgY2hlY2sgdGhlIHNoZW1hdGljcyBWQ0M1VjBfU1lTIHBhZ2UgNAo+ID4gVkNDNVYwX1NZUy0+
VVNCX1ZDQzVWMC0+SERNSV9WQ0M1VjAtPkZBTl9WQ0M1VjAtPlZDQzNWM19TWVMKPiA+Cj4gPiBQ
bGVhc2UgY2hlY2sgdGhlIHNoZW1hdGljcyBWQ0M1VjBfU1lTIHBhZ2UgMjQKPiA+IFZDQzVWMF9T
WVMgaW5wdXQgZm9yIFZDQzVWMF9IVUIgYW5kIDVWX1ZCVVMgZ2l2ZSB0aGUgVVNCIGh1YiwKPiA+
IHdoaWNoIGlzIGVuYWJsZWQgYnkgVVNCM19QV1JFTiAoZ3BpbyBwaW4pPgo+ID4KPiA+IFBsZXNl
IGNoZWNrIHBvd2VyIHRyZWUgcGFnZSA0Cj4gPiBVU0JWQlVTLT5TWTgzODZKIFVYWFggLT4gUENJ
RV9WQ0MzVjMgZm9yIHBjaWUgdmluIHNvdXJjZQo+ID4KPiA+IFNvLCB0aGlzIHNlcmllcyB0cmll
cyB0byBmaXggdGhlIHZpbiBzb3VyY2UgZm9yIFVTQiAzLjAgYW5kIFBDSWUgbm9kZXMuCj4gPgo+
IFRoaXMgaXMgbm90IHdoYXQgSSBhc2suLgpPcHBzLCBJIHRyaWVkLCBidXQgSSB3YXNu4oCZdCBh
YmxlIHRvIGNsZWFybHkgZWxhYm9yYXRlIG9uIGhvdyB0aGUgcG93ZXIgc291cmNlcwphcmUgZGlz
dHJpYnV0ZWQgYWNyb3NzIHRoZSB2YXJpb3VzIHBlcmlwaGVyYWxzLgo+Cj4gLS0KPiBZaXh1biBM
YW4gKGRsYW4pClRoYW5rcwotQW5hbmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
