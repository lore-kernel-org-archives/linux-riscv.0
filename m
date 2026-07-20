Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64FCC44515
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 03:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SP66bqAnofIWxJpyghToVmqiTo7T3huHJbOh83Zdhvs=; b=RsdkNuXEnKzexS
	wTuMqD520QBM86h0/CLLik5YsZsP6BO/yXl4Gh/LfJOtVkC7D2KsfiZhXVvjsPxkk5RqLnnCkWyFR
	HuQdYhubIDe0XHR5OkZQsonUCj5rNXCOCaVZpbfG2lKcdVpwBhxmTM6OTLXz2dVd59Wr9kpJZG3wA
	3t5pX/U4vXPJ34aeGk8xaoT4ymQM8MjFX6K7COpWPCJrGgQW4ZyJ6Kf8oTrppEW3cATrY8jXFIKLz
	Lw0cHyCkpyIDUeRqv21YU2brGOvedfuqRnbokVk5ZbdrDVJNBYir9xh6b+/VDW4+eSL16jJ4FDG3J
	3cU8Ai5rICyqhUMNORSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlejX-00000005mNf-3tPJ;
	Mon, 20 Jul 2026 03:31:59 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlejV-00000005mM6-22tT
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 03:31:59 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so15452745e9.3
        for <linux-riscv@lists.infradead.org>; Sun, 19 Jul 2026 20:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784518315; cv=none;
        d=google.com; s=arc-20260327;
        b=m7kReG9TF9THNVDY9lKLjvIzpzpMYo78jlcGLZepgI+5POJ1JEVey+jh5fUN6Ffc95
         fBNpUm3oZ60wjGHZTf7JVP2zHdUmHXINIFEEywERkXeWZnbSSTY5VJFB9tdWaVTgSvnC
         Ww90msq2FF39p7mk/tsab1vGO0rQdWds3icPAIkV9msNODQ9MthCmCuaGAZIxVQ91uQh
         QZMIq3XmnhBS3tmrWYkj+OJ6ugcX3W5VJ9axr3mDAIAyrb+3thKBjSuqEmeP2jJH6w0j
         e0OGbjAjZQfgtntYbD4lUTcEK44xq5WECSyUKyw0cn+/r4uegOuZWgzJY1WtqPNZmXaL
         E7sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aTYOzSqx3Il+ouDYIVcmVPdr5ATrW84HiHpgJkY7NSE=;
        fh=dZprvfX7dNLFJIlFlJA2iMM70Wjk+5vKbgQAhp/SsOc=;
        b=TsMdapaLvnqdOTt6VZCDO5bM9xGGxlMFgnkRfRXGfLd8i4VSKOYtYuBNYr+zlSOp9m
         /jAS1asgJKAaKV1h4Tqzu4QNJ7F54DSl12nLIuaR1qqEMHT8X5Faj7+JIcN92dpttMMa
         hnU+/HKhfNtBMp+2aoLWNUxgVY6ydcPiTqBSY6yEJE9irRwp91u2U2k8I5nIQB2hSO/+
         XhCKnwb7yCRsAthgIkAdidAv4MdYWIFVPEKbEFFg/nz2gRTjklJonT6X/TcEUhEdqGvH
         asSo+qLR39AQ7S4AsvbMrZvYeCauXRyyZUBSaARo9J53JhhdDrmCzdIX1kWe4mvmcRZF
         I3jw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1784518315; x=1785123115; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aTYOzSqx3Il+ouDYIVcmVPdr5ATrW84HiHpgJkY7NSE=;
        b=LxBnZZIl/6QV2SfX6ugnYNKH0s/zmZwTxi/YBUBrK8X3pLbFym//JTMKhL+nrEuC4C
         QQe/q+RjVaRVd//OSxUhLrPk39RfjkTHwEq0am3OFwQmfEomnsuXaCSGGM54cyFIuOys
         MOixljmby/vevGMTq+7ntFZu6v96iXRuDNMdan+AJS2SeprMxgSolQVKXNQJmGWaT2wt
         IgCTFHMu+Ra+oQVUzFyO6eALEQ3BqbLre1WZyZftJGPT5yL4w3ZvHt1f78dISRQET7yW
         zKrY1Gr0NZrXLClzFAu8045LIYhgHQmVQiEseWEtqAJpOIkPXKnkoWkoJakYwKBo8vnq
         cFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784518315; x=1785123115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aTYOzSqx3Il+ouDYIVcmVPdr5ATrW84HiHpgJkY7NSE=;
        b=Br/YwjSR+Ec24aCzusFPZHx8Gn7NdxbnBWDwM3xS73Vtvb42J1rUIOeK6DUwJEaOcY
         3TSgPv3icLAHuhOlWDKrjQauLmO17WXmLqXnJm9AuXn+eOymJguFSWcMdgjIk/AnW1zE
         pshSH0Q0MiQnewhhlyH1VMvchND+qpY8Wb1sVAYd2oKI95ickhHNcL+x7Fa9HVgARsPv
         45X1j/ujLsxXVXzcgaSmh5A1LPo++/UIXhkPXklamTvs8roT/qyI0vXSUTj9+ERTW8P4
         IbklTjny1jmR6BMulSNP5pdJmXPc34IF9JnBC/AJGCxchGTLz/xbhfH5tBXfZUiJ/1dr
         PZcg==
X-Forwarded-Encrypted: i=1; AHgh+RosHe2OQZ3cAb2pb85rQK2OHiceZWxfj2JxSTvEZudMiA27/eXfQUkyuBBMs7dCXpqtYFlpuLBHci2F3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzlMDpL2VRAh9SOMdRhZeLKqpsmAQMacnAuPjRh2p4XUMOHqRXf
	trvwrbk/TmkwWntUhZiZEvZG1aY86jg9SkPPSNDKXl8j6bQZ9PPsW7QYaqhqXBxXA8F3h+b9pxy
	/Ab8O1DNI2ebbD9886xL4VTxDby2g38uRAcntwVJQuQ==
X-Gm-Gg: AfdE7ckkHPwHUw/g75lQyIBq7vM9/CBSoEt1AjCBQBshu04mTmk0PgW11W+zvZUAzm7
	1Yj6m6EMAWLx3hw02vkMGN8nfMyhkNLq4iWaE5k7neNjBpH4qI06kxtIksx40BUTh5eQZZoTkOO
	e1v6c4ytfFFghRuTmJGWMZYmws9aMb0CUnWskzmEWeQ64mJ3+68AnS8QFW3nyWT7efU1LoGYRvn
	ccJfziwckG/3G84NS/xaCYR1vCIAwNeTVjA5fiz8WdBtYm7xi+at/ecy3J7BbbM8ebgoTFLA3ZB
	A4SgXvj96xsvF3e611+IpEdDEjruh20ZXGAijYjk6d486YxATyldIzDSJrgvnoawryFeUm9wP6O
	NJQ0wwtyvdEylj+4E
X-Received: by 2002:a05:600c:6298:b0:493:c182:6b08 with SMTP id
 5b1f17b1804b1-4954a5125a0mr136732955e9.36.1784518315031; Sun, 19 Jul 2026
 20:31:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260718033646.001.7e022554-caplitmus-rv@iscas.ac.cn>
In-Reply-To: <20260718033646.001.7e022554-caplitmus-rv@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 20 Jul 2026 09:01:43 +0530
X-Gm-Features: AUfX_myjI4u8LTI3qCljYtjTEAQ5zgZ0X7GXRqqR8ts2z6Il33MddgGeMkag-ds
Message-ID: <CAAhSdy3Azj5gt=+JLSD6P+OezWhmCMgdRzBR+Vu+=hBuTmv4Bg@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-imsic: Fix MMIO regset lookup loop bound
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_203157_811322_AD4E532A 
X-CRM114-Status: GOOD (  16.09  )
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
YWMuY24+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5v
cmc+CgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1z
aWMtc3RhdGUuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNp
Yy1zdGF0ZS5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5jCj4gaW5k
ZXggYjhkMWJiYmY0MmY3My4uMDA4ZGZjZjM0M2U1MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2ly
cWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmMKPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJx
LXJpc2N2LWltc2ljLXN0YXRlLmMKPiBAQCAtODk2LDcgKzg5Niw3IEBAIGludCBfX2luaXQgaW1z
aWNfc2V0dXBfc3RhdGUoc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSwgdm9pZCAqb3BhcXVl
KQo+ICAgICAgICAgICAgICAgICBpbmRleCA9IG5yX21taW9zOwo+ICAgICAgICAgICAgICAgICBy
ZWxvZmYgPSBpICogQklUKGdsb2JhbC0+Z3Vlc3RfaW5kZXhfYml0cykgKgo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICBJTVNJQ19NTUlPX1BBR0VfU1o7Cj4gLSAgICAgICAgICAgICAgIGZvciAo
aiA9IDA7IG5yX21taW9zOyBqKyspIHsKPiArICAgICAgICAgICAgICAgZm9yIChqID0gMDsgaiA8
IG5yX21taW9zOyBqKyspIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAocmVsb2ZmIDwg
cmVzb3VyY2Vfc2l6ZSgmbW1pb3Nbal0pKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBpbmRleCA9IGo7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsK
PiAtLQo+IDIuNDMuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
