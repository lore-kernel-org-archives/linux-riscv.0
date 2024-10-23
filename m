Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC24FCDDE49
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2024 10:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j7c8vDys5rh4DxXFboKGANk8itez0AluBQJgneuzWeA=; b=S7tMwg34KF23XM
	vgJJ0Egw+r+S/Fq8BiawS52ZQS5h2cKfuGoql5WTeoN/vFQuIrcWpm9mDziZV3AlSlz+Lazbo7IZZ
	7vF+guj17Imhp21C9Yjx2FOnJd52ADITVdygUzmWPC8jhR9qedS4N2uwLC+Z+vjvcFKIp+hviOg7I
	nsl3JjKSD2rrOFdRbRFKISqQtagavqxTR+/vlm4S0GITQWydL20TSENT/gFnxLM7HueTxgnQsCrcM
	HznTyajRn7gPpwubvVw294LeFJrNExWlg/IqonHKLAPXLEHuElX6x5NCqeJmFKzjRZLqRleeVBSZ/
	19vzVl/jKIgylwoihiqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YBT-0000000DubR-0Mpt;
	Wed, 23 Oct 2024 10:01:43 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Y8H-0000000DtZ2-0NoT
	for linux-riscv@lists.infradead.org;
	Wed, 23 Oct 2024 09:58:26 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-539e63c8678so7998372e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 23 Oct 2024 02:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729677502; x=1730282302; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2L9Ape+8+yTZPYfTF9lq2DArA0UAGnHMSIi/f1A9gfo=;
        b=P1NvcgutboisvJRKFo5U4AbWV0v2UlhPVnKtSA2p0hg4e5cv+ikkfrzShfI7SRYp4L
         EvFONIUPch8R7UwY0kncYekNr0LhdBb1B8bRrqIEaDSWHMoDAaT+8K/YFAA1s+ABEjXn
         XXjxr3KawnBCwKSoxeA9+dR4QRCLV+0Sn9FinwqPv7Ss1kA4DD2Lo5DjSlY7sa0OHeqk
         hw8VaFp9LLGEApCdFav9nCgycaijlzyQuNWNyWPPSSEoll5cCnM5QxM0EzWNLu9BxNFw
         Y/5Q96eLlu3RsktIyQowYh13j+hUN8uPUA2bQIQZ4xyEnyuDNkvfAixisxDWkemWTYaM
         h/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729677502; x=1730282302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2L9Ape+8+yTZPYfTF9lq2DArA0UAGnHMSIi/f1A9gfo=;
        b=v1ANzNgf6yCqPQlCQfdl6qRmh4i5pBCJEveHZ5XaB9mflg4ixiZp4WvFM1ilVGxk4s
         kB43CkICKoxgCm/TLqN76lCOns4oYm7G79cckuszPFbnbFrjiqqbsGuAFb18ljYbrdFk
         5x8HTMvf8Dol7QJYGD1PoPL4phPXrYZ1guTgP7tTUZapnkr7clLr3/ZzNHqNVVoAUYwu
         bYfWNBwlMx/l3SWLSMIUeJU3MIz0WeDNg73/3T5Lg3B+hPeyWc+4Iq+YNua7jAq+9w5J
         kqLkYrd1EDlNht8ByjTNCsyYg6PNeAPm+eR5CJLqxIB5g4e0fctg9HHmKGqtBEmAveYi
         h7QQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfeOSFpsxezf59s+cvF6cIhpRQDoffL5iftDcHa4LC8xf1siJkYyMhsiC0CYI+UgZK/U6qo8WzImQ2iw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwelZknH0AhZQz/5HWEBiMR0iqgXezM194VRIoGHlHf4kqzuAIX
	VbzM0WlGCA3JyG/0wAOKIEG21+4KPLE29teitVezScbaalwoBjGJXBsGLL6sI2nAG67iZfvqFlB
	jOHNVrgnGQumPL/bRW4hfk8FrRSxySy7p9hbM0w==
X-Google-Smtp-Source: AGHT+IEMaIVffKoEGuSVtg7x47gj83aOUojX3IM7m0iK6Z0nZEbKP1bY+xstXSXj6igHPpLfZOwnpBcyvDYP8Q2VVnc=
X-Received: by 2002:a05:6512:2211:b0:539:958a:8fb1 with SMTP id
 2adb3069b0e04-53b1a394c17mr776373e87.60.1729677502024; Wed, 23 Oct 2024
 02:58:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240723-supervise-drown-d5d3b303e7fd@wendy> <20240723-underage-wheat-7dd65c2158e7@wendy>
 <CACRpkdbRE695f-+do1HYpOZ6e4qxgUBWJzEPO2hTCuZ3xxYHQg@mail.gmail.com>
 <20241016-shallot-nerd-51eeba039ba0@spud> <20241016-dandelion-hypnosis-9d989bb2fdd1@spud>
 <CACRpkdbJKWcjBG5ejwsNEgnnGWj69TAtKbgaHP3NiPM5GbiGQw@mail.gmail.com>
 <20241016-cobbler-connector-9b17ec158e3a@spud> <20241022-unrushed-dragonish-2949ee887824@spud>
In-Reply-To: <20241022-unrushed-dragonish-2949ee887824@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Oct 2024 11:58:09 +0200
Message-ID: <CACRpkdboUNST1Fc75DZOQsbysW15X4VQMcVKS6TcuH=wNsoFFw@mail.gmail.com>
Subject: Re: [RFC v7 4/6] gpio: mpfs: add polarfire soc gpio support
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, Lewis Hanly <lewis.hanly@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_025825_154703_25963E8E 
X-CRM114-Status: GOOD (  22.51  )
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

T24gVHVlLCBPY3QgMjIsIDIwMjQgYXQgNjoyOOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gT24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgMDg6NDI6NTFQTSArMDEw
MCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gT24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgMDk6MjY6
MTNQTSArMDIwMCwgTGludXMgV2FsbGVpaiB3cm90ZToKPiA+ID4gT24gV2VkLCBPY3QgMTYsIDIw
MjQgYXQgMTI6MjnigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+
ID4gPgo+ID4gPiA+IFdoYXQgZG9lcyBicmluZyBhIG5pY2Ugc2ltcGxpZmljYXRpb24gdGhvdWdo
LCBJTU8sIGlzIHJlZ21hcC4gSSBhbQo+ID4gPiA+IHByZXR0eSBzdXJlIHRoYXQgdXNpbmcgaXQg
d2FzIG9uZSBvZiB0aGUgc3VnZ2VzdGlvbnMgbWFkZSBsYXN0IHRpbWUKPiA+ID4gPiBMZXdpcyBz
dWJtaXR0ZWQgdGhpcyAtIHNvIEkgdGhpbmsgSSdtIGdvaW5nIHRvIGRvIHRoYXQgaW5zdGVhZC4K
PiA+ID4KPiA+ID4gSWYgeW91IGhhdmUgdGhlIHRpbWUuIFVzaW5nIEdQSU9fUkVHTUFQIGZvciBN
TUlPIGlzIG5vdCB0aGF0Cj4gPiA+IGNvbW1vbiBhbmQgSSB0aGluayB0aGUgZHJpdmVyIGlzIHBy
ZXR0eSBuZWF0IGFzIGl0IHN0YW5kcy4KPiA+Cj4gPiBBcyB3aXRoIHVzaW5nIHRoZSBjb21tb24g
TU1JTyBzdHVmZiwgSSBkb24ndCB0aGluayBHUElPX1JFR01BUCBwcm92aWRlcwo+ID4gdGhhdCBt
dWNoIHZhbHVlIGFzIEkgY2Fubm90IHVzZSB0aGUgZGlyZWN0aW9uIHN0dWZmIGZyb20gaXQuIEkg
d2FzCj4gPiB0aGlua2luZyBvZiB1c2luZyByZWdtYXAgZGlyZWN0bHksIGxpa2U6Cj4gPiBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jb25vci9saW51eC5n
aXQvY29tbWl0Lz9oPWdwaW8tbm8taXJxJmlkPWM4OTMzZTFlMzYwMGUzZmEyOWVmZTI4ZmJiMmUz
NDNlMTMzZjlkNjcKPiA+IHdoaWNoIEkgdGhpbmsgcmVkdWNlcyBob3cgdWdseSB0aGUgdHdvIGRp
cmVjdGlvbiBmdW5jdGlvbnMgbG9vay4KPgo+IFNvcnJ5IHRvIGJvdGhlciB5b3UgTGludXMsIGJ1
dCBJIHdhcyBob3BpbmcgdG8gc2VlIHNvbWUgc29ydCBvZiBjb21tZW50Cj4gaGVyZSBiZWZvcmUg
SSBzcXVhc2ggdGhpcyBzdHVmZiBhbmQgc3VibWl0IGEgbmV3IHZlcnNpb24uIElzIHNvbWV0aGlu
Zwo+IGxpa2Ugd2hhdCBJIGxpbmtlZCBhYm92ZSBhY2NlcHRhYmxlPwoKSSBwcmV0dHkgbXVjaCB0
cnVzdCB5b3VyIGp1ZGdlbWVudCBvbiB0aGlzLCBJJ20gZmluZSB3aXRoIGVpdGhlciBzb2x1dGlv
biwKdGhlIHBhdGNoIGlzIGFsc28gcGVyZmVjdGx5IGZpbmUgYWxyZWFkeSBhcyBpdCBpcyB1bmxl
c3MgeW91IHdhbnQgdG8gcG9saXNoIGl0CmZ1cnRoZXIuCgpZb3VycywKTGludXMgV2FsbGVpagoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
