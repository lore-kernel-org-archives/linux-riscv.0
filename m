Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315A7C44515
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 03:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FQA8o3NCXPXGXSl546spAdQZ3trAYPrYoWHYyjAQIZo=; b=i2z65lhOsMBB79
	cMZuCx9GP+VV5LzA6CmA6M3LWkHNXpabXT3tjkYP1ldT7v9BcrFQyiENANGOwdyvdt+neKw4weUxT
	SSdQ+9nibntKg7yT5JdgjQjSRVRuiI0W7CuzNXH7pr+3RHRs1QF6cyBFALyG/1OB0vyIBaqepuXqr
	KcKVvegh2JLviTE89lv32VJBa9kSx7skdg3WvOgnEEZg3wn9Bm0pvamJwJPczujxu/+JyCzdTqXS+
	qwxNjQ+btpQsqt88wlZFxn0d5pJNYRBSwUwEttVX7I2b/0LXNbLUJplWT3K9S/njY/GuDGuVP0ei5
	HswYaj2haEbCSHsJQvqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlew0-00000005nLr-2E3y;
	Mon, 20 Jul 2026 03:44:52 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlevx-00000005nKu-2JPd
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 03:44:51 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47f752b3423so485986f8f.3
        for <linux-riscv@lists.infradead.org>; Sun, 19 Jul 2026 20:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784519088; cv=none;
        d=google.com; s=arc-20260327;
        b=Yk6utI+eEMIvFJ2bZvAUCdp88qK5Q1S+UGpi7j79IWFuadeFQxSUUFHhP2dQkGv9ew
         7xXApjrtXKaWw/W010gQ7hiiuR0VyKEcZDkC+pwoCLYepmwzp5wV2YKPHgdoCN0Nlubx
         p9TQbKQfYuGorMz/yBqK8BNtoGqcwQtH8Qa8LeDukvAgaY6Y5XgCt1RpiK5CssuOU448
         r+SHM3guFE7MZ4OXPjQT1R93gHyf7YZuezYXP2ACNIk/AOmMD95Cc3MtGHiKKRQDLLqi
         8OeHD77bBIs4VyS8fx/dkte1wMvDnHbFag76MY0/9ebnWzgylgIoACdwj+wpLABy9yVo
         3Xkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QrXzsK+oWvecGzZ5xrcvlLeKcco3ngIlFZHJpVnEE0w=;
        fh=3xFokb1/QKm/ShEYuFKT/ObjPFgTjXEhiAtNNkMKeaY=;
        b=EId8K2ThUb+/TYjrjADN4AuLmifYzyXyyMy7v8OeYpKr01+oVm+C2ouvm9HNmlcDiv
         52CBRI0d476/71ZMVxY6gZAUne7R3EFHsYOJNtyK+2XnsXFDYipx9Sk2A8rSdEv6rluS
         SbtQ5bGYtuZ1LYWX++FfjtHw9Sk/BV32qZjrCQTniGx9TK/3M/LyTeX4hnyPN8izGaH6
         rTajJTkD+GIWkrtPqjrztOukF1E5jA03SA9aRq6rf5mukWf1UzIlaUmOvJjkbFxJ4oqW
         WboUQhViVkgoJEGSf/9vOh9bICBWYiDp++Dh3068NohamxBmZ8rAqPu/5c3S4RMmp+hx
         aGXg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1784519088; x=1785123888; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QrXzsK+oWvecGzZ5xrcvlLeKcco3ngIlFZHJpVnEE0w=;
        b=j+FPZyZK2fZ/O82BKQahnUwAFOFpcCswnUHhzmyMXFbHiAUA63ZstOIclSH/RpG4Q3
         gJ+//f/Cphmtt9TgvacPGcuU6h/fyD1JDGDTQj96YgbGf2HSkg5erVKfw84Qivks2QTZ
         RkCFTekzdMadlt8Prs/SWKUMfCzpk9Ycq4gNdYHV+lv76H7C7gt57VNv6B98VT6xM9W7
         lU3JOGBVRIo8lo12HJs5p0V3F8f0tqBF1B1YW2wwwKm07kiq4/L9Tm0Mk3U+xhIIJPsa
         spV0OXrbnal0ejjBfh8CkwPC22R81VzwIHxB9zXZ52tq35xtSMB+LUdP4Q4vLIer6hHS
         LjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784519088; x=1785123888;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QrXzsK+oWvecGzZ5xrcvlLeKcco3ngIlFZHJpVnEE0w=;
        b=p5L8G1IQ9zoxcGQ5/3MHRFjpFncTlCU4JdwV59wEnzJORVPFbEJY8r3Xpt9Qw9CBKv
         FBLtYotBZEBhYA6NIAtjuHudoeTk9uXEWMQ47sf00PmHJKM0PRXBVjCmyIwc1Ckx0f9e
         w7XxD+mWxeGDKt8pbu4QjbnnRVEGWdYPaChfJRe2oe+Yvuu3kqiWl8zt3LVbhIeXfHbH
         pnsbhWfzOmtf0qdiVXQX8WxHLdZL2OXopD6mhnzGW9MDN/xvqOZbFk8ntuWAPH8UWdaf
         wL7Wud/PetJoBZHXQRie6fX8Lx3tKSMlDJtUlhBjzYr+YKvGeqzUTYCbaenV8BiAZIzD
         Nthw==
X-Forwarded-Encrypted: i=1; AHgh+RpblLj6dnyhlGX328RjdSr3w+5sp1ESfczk+wOGHrirjxIG14GNJ1s+QT/1WpueRyKx5MgB4BIY7vyGeg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfODtVLrByG4e/NS5txmTcEI8SUUAC4ygwi+1GZmok/ltw1zSt
	H7BkE2uue7z9Lf0+nxScdtarv3f+OqcJGf6ujOaRoc+VHoYn0uRPbY6CyRBg2XU35+TmllDrrKj
	5pojh+NBfQmoKKx/WP6DVMpOpypZmDRj0QUX63pJyGA==
X-Gm-Gg: AfdE7cnHkTSn5hwP2LJzR2y1BxTqS4KxvdzgChH8aNYfgHwo0PgaZMAngDXeFVZ7Tjz
	aIMVPm+qC3QldjbXQAWc/ze6KIB/B8iKq2auveDFyzYboFB8FRO5XNHgVPkgEWYOdQXFwaglBF4
	+mGTBTyBotFVC7Bse/F/b9MRFO4R0TiAqWQGL5n2j4B58Ks4P4WFKl/hB3GOGVsTnRwMcbl9K0f
	hHr78Hz2YSFA0tT8iUknQxUakVbLu0A9zB485ejZ5FJLzD9fWuPeV6eGAw+CZXhIh5hAYOhN09K
	CET9ydp+vUR5bP1saOllaf5XMZ1mwsj/HC5xj9Qeg50KQPMQwlzFCUt11ytSy8UTHTNzevNpfT8
	XVpkz6w==
X-Received: by 2002:a05:6000:2981:10b0:47e:f3d:2b3 with SMTP id
 ffacd0b85a97d-47f6232e25fmr10727708f8f.39.1784519087699; Sun, 19 Jul 2026
 20:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260718033646.001.7e022554-caplitmus-rv@iscas.ac.cn>
In-Reply-To: <20260718033646.001.7e022554-caplitmus-rv@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 20 Jul 2026 09:14:36 +0530
X-Gm-Features: AUfX_myx_CqVJdrkmr9SMHwm_azlizROziu7_375kjuYyFjX13-mO7wzDlg6K-g
Message-ID: <CAAhSdy3LA9y-kj7y0Q2gPcHYRk+Hi-tuVQzsCZCvvuv4qQTurQ@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-imsic: Fix MMIO regset lookup loop bound
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_204449_630126_0EBC62F1 
X-CRM114-Status: GOOD (  17.01  )
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

T24gU2F0LCBKdWwgMTgsIDIwMjYgYXQgOToyMeKAr0FNIFBlbmdwZW5nIEhvdSA8cGVuZ3BlbmdA
aXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gbnJfbW1pb3MgaXMgdGhlIG51bWJlciBvZiBlbGVtZW50
cyBpbiB0aGUgTU1JTyByZXNvdXJjZSBhcnJheXMsIHdoaWxlIGogaXMKPiB0aGUgaW5kZXggdGhh
dCBhZHZhbmNlcyB0aHJvdWdoIHRoZW0uIFRoZSBsb29wIGN1cnJlbnRseSB0ZXN0cyB0aGUgbm9u
emVybwo+IGNvdW50IG9uIGV2ZXJ5IGl0ZXJhdGlvbi4gSWYgbm8gcmVnaW9uIGNvbnRhaW5zIHJl
bG9mZiwgaXQgcmVhZHMgcGFzdCBtbWlvcwo+IGJlZm9yZSByZWFjaGluZyB0aGUgZXhpc3Rpbmcg
bm90LWZvdW5kIGNoZWNrLgo+Cj4gQ29tcGFyZSBqIHdpdGggbnJfbW1pb3MuIFRoaXMgcHJlc2Vy
dmVzIHN1Y2Nlc3NmdWwgbG9va3VwcyBhbmQgbGV0cyB0aGUKPiBub3QtZm91bmQgcGF0aCBoYW5k
bGUgYW4gb2Zmc2V0IGJleW9uZCB0aGUgbGlzdGVkIHJlZ2lvbnMuCj4KPiBGaXhlczogMjFhOGY4
YTBlYjM1ICgiaXJxY2hpcDogQWRkIFJJU0MtViBpbmNvbWluZyBNU0kgY29udHJvbGxlciBlYXJs
eSBkcml2ZXIiKQo+IFNpZ25lZC1vZmYtYnk6IFBlbmdwZW5nIEhvdSA8cGVuZ3BlbmdAaXNjYXMu
YWMuY24+CgpJIGp1c3QgcmVjYWxsZWQgdGhhdCBhIHNpbWlsYXIgZml4IHdhcyBhbHJlYWR5IHBv
c3RlZCBhIHdlZWsgYWdvCmJ5ICJIYW9mZW5nIExpIDxsaWhhb2ZlbmdAa3lsaW5vcy5jbj4iIHdp
dGggcGF0Y2ggc3ViamVjdAoiaXJxY2hpcC9yaXNjdi1pbXNpYzogZml4IE1NSU8gbG9va3VwIE9P
QiBhbmQgTlVMTCBjbGVhbnVwIgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAgZHJpdmVycy9pcnFj
aGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNo
aXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWlt
c2ljLXN0YXRlLmMKPiBpbmRleCBiOGQxYmJiZjQyZjczLi4wMDhkZmNmMzQzZTUzIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuYwo+ICsrKyBiL2Ry
aXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuYwo+IEBAIC04OTYsNyArODk2LDcg
QEAgaW50IF9faW5pdCBpbXNpY19zZXR1cF9zdGF0ZShzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndu
b2RlLCB2b2lkICpvcGFxdWUpCj4gICAgICAgICAgICAgICAgIGluZGV4ID0gbnJfbW1pb3M7Cj4g
ICAgICAgICAgICAgICAgIHJlbG9mZiA9IGkgKiBCSVQoZ2xvYmFsLT5ndWVzdF9pbmRleF9iaXRz
KSAqCj4gICAgICAgICAgICAgICAgICAgICAgICAgIElNU0lDX01NSU9fUEFHRV9TWjsKPiAtICAg
ICAgICAgICAgICAgZm9yIChqID0gMDsgbnJfbW1pb3M7IGorKykgewo+ICsgICAgICAgICAgICAg
ICBmb3IgKGogPSAwOyBqIDwgbnJfbW1pb3M7IGorKykgewo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGlmIChyZWxvZmYgPCByZXNvdXJjZV9zaXplKCZtbWlvc1tqXSkpIHsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGluZGV4ID0gajsKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGJyZWFrOwo+IC0tCj4gMi40My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
