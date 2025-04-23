Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD486C369CB
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 10:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rzTyF2bEkIjaI4HJKSAYfHLENFTQMv/WIbflQ//JQjA=; b=YslK2zuD+M9T4I
	TO6xT0h+2chHuCzKne0kh2G9XCjBReuXjTJ2TdQ6+mCEiq7VGcPVOmLi02xnrwyBinzU2j2wP0BRY
	QuPpNaYCnHrjavM4KeLFVkZT/nTnlP1DJSYPznFsjh9/zcNbNetgua77d2BPCJGkY3BMyOxu/HRcp
	9RfaZ8iJ32gg486q8Eyah8ERBwmkblPd9uMZf95UrXSYhfYlvGYLxnPNglS5diLxBx+STH3n//QUa
	0qirS3l4X6RS6RXcmgsujTVNO3vS2mHLQoHRnecrgWB1Rc3cxzXGHUsTr+/D/dLRfovr+Z7eHeV0j
	edJjPBIg18lACiewsAxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7XSO-0000000ABVA-1CQQ;
	Wed, 23 Apr 2025 10:35:56 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7W79-00000009t9O-3H3M
	for linux-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 09:09:56 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so7068576e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 23 Apr 2025 02:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745399394; x=1746004194; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WARUA/SEaM7gTnI/pqNkLOZLeUBM+XHsQtQUHb5intU=;
        b=qWwiye2/9tKpgWdLXxWOgcVJfvyXRW/tcunv1C5SuX63ePyjqKw4PDvnQzVfNHHFIZ
         fLskLVNczkhyXRky+ZaDU5WOlLiDYgr3Cu1wvjXCMQUWq0tErY/AfVP253tuarQs6VRt
         xgP+oWHUaTVgx6+WY/vMYJUtKJ4yiznXsi3NgHsbKbv70zKNca8Bz/pk8oubphEKN93u
         HWyWAZ1RCK6aHP1tOwvavhsw6B/kXpzo7IjhB8eCxHQhxR0R37cRUwQEx8NEi0zHyEon
         ydUue0BYy3agXhjO5ZFO7eZblK5CW0EnOPW+O0mty3DkgWclTe/sdIzOXicWkRflhPhq
         GewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745399394; x=1746004194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WARUA/SEaM7gTnI/pqNkLOZLeUBM+XHsQtQUHb5intU=;
        b=nKwmjf5zGSka8iqEpYejkpk6jwf9jRDNSVs9zTZmv3iDxG867B4zzLamspfnaGsF31
         Gp0O2VSQMK96cOHHdexDE87LTj5OlIhTdgF/FmaQn+PsCN9o1IzqzYBWBFwXjCMpB44/
         gXEim8OEiDrd85IdS06+x4tARNsQ7o2n+cD6Q4qLXIEIaZwe6/Ww8KEphDb5LZJ95Lbt
         5CfkQq/mnsKa6sYr3wtL1vde++wFot0USGEuRkdinrNt6i0JhqQ6HXJk8BnGclAMKPdi
         J/rFGHCKXgF+PHkC+tCB909hE+3UadgN6/M7ND2Bi+6cmIAdYgnliymLqL4qx0IR/wJf
         kZDA==
X-Forwarded-Encrypted: i=1; AJvYcCWFc+eQIYss/FHXeri2nhZytNa0rKqY+cAphCwewkUybBsS8g7LzvZPTroQ6/1IEFWJxJFitB49EImwMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxY9JG3HVnBD+TG3F9/gX6RCQWjf8TlaA4XMvf8PGq+YRj7UbSb
	R0Qql07vMccK8CD9b5inj5unBnyjfuRgnEHSXKsYVLOsfgpiC5SEyhbY5Y1H+OFMFVYHoYo8tN6
	S2zD0hXz5GjmscakPtIKhhEHZMMZfjN5WxcSVeg==
X-Gm-Gg: ASbGncuKeGC0qqWTDzqRMtT7SzFOjk+0X3jFVyinnRuO8HSdXQ+CC0BmadoWz0jjvzv
	RTzbMpRpWxApRBJSc8+8QMdz2B4hqeHRbwDzdaaS0wlJ+XxaM6e/WfCZVrQyuUBgZDWOtfG5qYe
	WRduF99J886L3GRFt2BjBH31qsZKGBEjE9
X-Google-Smtp-Source: AGHT+IGGSWx/qXe0KQyY/MREsZlIV6fNVYZhSzegs3sVGQ2Vz/xafsGBBtwjdgGYFha2pmBwx3eFZ0eFO4ELEa/acV4=
X-Received: by 2002:a05:6512:68d:b0:549:7394:2ce5 with SMTP id
 2adb3069b0e04-54d6e663182mr5664661e87.41.1745399393941; Wed, 23 Apr 2025
 02:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250422162250.436169-1-uwu@icenowy.me> <20250422162250.436169-2-uwu@icenowy.me>
In-Reply-To: <20250422162250.436169-2-uwu@icenowy.me>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 11:09:42 +0200
X-Gm-Features: ATxdqUGJI5EWHbFKNL1piYfBX7w6VEjwsS65rRDUL2ZIvKqVpjd39nGuBX00R-E
Message-ID: <CACRpkdbGwPyQgVL18iMvUTAvh4XTjo6g3mGT4e_b2aNAjr2obg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: jh7110-sys: add force inputs
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_020955_825386_1C848C5C 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
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

SGkgSWNlbm93eSwKCnRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCk9uIFR1ZSwgQXByIDIyLCAyMDI1
IGF0IDY6MjPigK9QTSBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4gd3JvdGU6Cgo+ICsg
IHN0YXJmaXZlLGZvcmNlLWxvdy1pbnB1dHM6Cj4gKyAgICBkZXNjcmlwdGlvbjoKPiArICAgICAg
VGhlIGxpc3Qgb2YgaW5wdXQgc2lnbmFscyBmb3JjZWQgdG8gYmUgbG93IGluc2lkZSB0aGUgU29D
IGl0c2VsZi4KPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3Vp
bnQzMi1hcnJheQoKSSBkb24ndCBzZWUgd2h5IHlvdSBuZWVkIHRoaXMgaGFjay4KClVzZSB0aGUg
ZXhpc3RpbmcgcGVyLXBpbiBvdXRwdXQtbG93IHByb3BlcnR5IChzZWUKRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcGluY2ZnLW5vZGUueWFtbCkuCgo+ICsgIHN0YXJm
aXZlLGZvcmNlLWhpZ2gtaW5wdXRzOgo+ICsgICAgZGVzY3JpcHRpb246Cj4gKyAgICAgIFRoZSBs
aXN0IG9mIGlucHV0IHNpZ25hbHMgZm9yY2VkIHRvIGJlIGhpZ2ggaW5zaWRlIHRoZSBTb0MgaXRz
ZWxmLgo+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMy
LWFycmF5CgpVc2UgdGhlIGV4aXN0aW5nIG91dHB1dC1oaWdoIHByb3BlcnR5LgoKTm93IEkgKmtu
b3cqIHRoZXNlIHR3byBwcm9wZXJ0aWVzIGFyZSBwZXItcGluLiBUaGF0IGlzIG1vcmUgdGFsa2F0
aXZlCmJ1dCB3YXkgZWFzaWVyIGZvciB1c2VycyB0byByZWFkLgoKVGhlbiB1c2UgcGluY29udHJv
bCBob2dzIHRvIG1ha2Ugc3VyZSB0aGVzZSBjb25maWdzIGFyZSBzZXQgdXAKYXQgcHJvYmUuCgpZ
b3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
