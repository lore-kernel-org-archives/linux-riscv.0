Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F015C5DF66
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 14:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o0fbIgtShBIct8fwqTDOV3eTO15Y+g0zUB9MoGk66JA=; b=DxUyn5rMh+xb+b
	3R8ZZLM2rgL4Gl6XCxtYto+cfrQbazcHRB9qedvoZ7hTob7vG1CXa3UZjGKbdXLFq9nSQUXCvku/K
	oQc70kwTQT7bo1KcMv4i4iC38FRHuq6f1DKpl9wtABu6tm1vEbNXO2Q12AqjWZWMU2kavvtzs/KNO
	xsiYz5ruZ5tsWtAxvZFlHQIbQibsZnj7yD5UOU5lxPMJV2+2h0LlLiCNmINrjoi4lBri6k347GpAC
	H1CcOHbtyPu2NkfTQ1iL4vHgbHerwDZ/Cy3wkaWfimtUiP4/r0zUMk/CxmE9fGvSH2Mgf7OXcIS/t
	BuG+XLIFjz2G6gGIZw9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvyRd-00000006JrS-14EG;
	Mon, 17 Aug 2026 14:36:09 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvyRb-00000006Jqw-0KeX
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 14:36:08 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4815bce4652so2166965f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 07:36:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786977365; cv=none;
        d=google.com; s=arc-20260327;
        b=heeg4EC1nSFhVW3HsKDOCTksNVFeo5BkwAE3bNvqw0gjogOzbaIcxNjQfTjEUYs9j9
         QyVadVvtK+tKjnr+LrZu7VLzsCzAHfEMd0cOPLiQYHAwVyg6/wUpwjZPTAAozVeTk8l2
         X8YTGEBQ9OB+oDHrByFZhY7UAh5kNc+ffNJzOC6C4cZ5kNYg/hvgj5XBY8xafu8vO5dT
         MZUgYQv/AfCQf+HY2JtpeBkMKzSXGjQqro92+qE9qH5192i3Kj1/oWHoUihJGorC2iw8
         GKRAZ4PTqFwDiMSfN3GE2Y4Os3TlgCIbDumZyT7+x7Cwanh5qOR9fii8bmkWfpenoqyE
         Cf8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NNV/KfjNGs21ujgwRGykL+fiDz1lC1QgSwJMLHxXhjw=;
        fh=brfo6Ysyf96agF5jUnIB1va1uhheD9smAXhC4AjqiMg=;
        b=CDoKtPYlfAqGl/5tqB1ImTUx8n7K/EL4A9A86FANaf082xBf/JCLTupFvT59ZeFJqR
         JxBbBL93r5FbNvlRqVqcor8feeNiQ+4ehkqM4bVAwrxUekUR72s72n9FLGO7XvRLdej4
         tz2UQqjlDgJI3FkEdtSrJjXG2agazb9bpjChJOQDhw4FUDn/s1hqnKGpaveDabsapS7i
         DGI5btKDQbcPls4aV2F6q7dzCnow06SB+eWZGPQyIO0zCKpbXPvWOWwN4fem8Tn6lH82
         5qqPlV3icfdV+M2vSaKOseTf45XGNCdiG0A9VqK9Z1s8aVeoIrQ5DzoR5VrBJWx7Jm71
         /+hQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1786977365; x=1787582165; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NNV/KfjNGs21ujgwRGykL+fiDz1lC1QgSwJMLHxXhjw=;
        b=Tum6YOj2v4dKuwPDyw85gVysp8R+oiSJFpX5aMaJL46CTLbQCy8EXGAIQO5Q4TYamS
         POgUDZMNwBSQ2rG2StYSNXZy5dI66j8rYV68RLYLnPRqpaaWSyFx3n8sXauD+OemX5UB
         4DjOj08NNjKUAulV0e2H6YnnnP5hJfczPg9JPWpLGTzitShm+tKKsTjTOWDiGcTcM3YT
         I1qLrBJCLyWiFpyEgpbO9Id0i156B/cgtiifj+GCtFU8TkFhnhDBmsfpjpqQsCS1v9RA
         eYkWwcqFvZR5mwnAvcdU9nyVyrxrVABawo8Z+KbsxRaRajmYgsLZiiOySBhw12j7s+GF
         8UVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786977365; x=1787582165;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NNV/KfjNGs21ujgwRGykL+fiDz1lC1QgSwJMLHxXhjw=;
        b=WOoIGmHQDUxrauXTCECInJ+yBy7xFpY5uT64BDHLq/HTzdXwtEF+BYXpVU2Rz9zhOx
         exbn5wZrZFLROBE92D5Q8SW2wHTt9rzjdvYsQqodWUTBVASL8IIkjuwgDRQ4bf4/m1hc
         Rtbodb0PlCjOTFuB0s/1iH1FU2gS8QyxOC5Bvfw8kyEKQQ1AV6vB3g8v8oU2tVHd0MLa
         ls5nXtxwgXgm32mCitDUgl2ROlbW6G8M64z90S0PAK3lKr2ChHigMZbr+d1m+8GY+4oD
         gCmBPkx4r2ApIBiC69EjVAjlC1M7gwXVY/tJ2WdDl52WZK0XmPDlEEm8KWoNhUvqBCp7
         em+A==
X-Gm-Message-State: AOJu0Yyf47qE9XqXsOeg8b1tGwXzGH2Xi8Htnl9S3LQS+uwoozDUDOsW
	rWrYjdOzpm32kAFkL6mDm3YTVKvsbRUOK+rXZkjihYCpyLb3GGPn4QITv6iWL+XbmGkHFMwo8yy
	luYTs7ui63np36bMm/jsaSS4O+19ouF9wSGhu7xB+TQ==
X-Gm-Gg: AR+sD13ZMJdWyGFALcHly4/e1e+kI5sgUyx7sc1gQdLTJwqyi7LUigE4ymUYfZJdJl5
	rR/MO6SKKgQDQaxdisaibdK+j6Y/ji5dQENckFmZoQwp0t07DoT/YJDfdZfnUOATDFBe4743yzr
	ZuZ3rdfZA2IfIDl9dItTAVZkWnMCFcA2RwmcT4/zFKC/wn/HTQ1UxN2Xla5m28aG05YeMvgVClq
	RLc2dDQpIEczK6vCUBEDaZ4xJtgZsIHDsWmMCA1bQcAZ7XQpDtktUbRZA8dWfsR4prHnjWBWqLZ
	a1NQnBgcQ26a2/lxVMS/LT/GqhBuBKUlXOJ8gL23TGxLS+xJqyqS4jpPL36jpuOQBu9bSEkVkUa
	0lwRO1WGkynT1WO00uCol6brVimFYM0qyuLBcrVLcdsdLxINAgkLGVEn+/weMU7w=
X-Received: by 2002:adf:ee84:0:b0:47f:cb39:10c4 with SMTP id
 ffacd0b85a97d-4816075ce29mr33109868f8f.12.1786977365196; Mon, 17 Aug 2026
 07:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260816070049.2097442-1-guoren@kernel.org> <20260816070049.2097442-3-guoren@kernel.org>
In-Reply-To: <20260816070049.2097442-3-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 17 Aug 2026 20:05:51 +0530
X-Gm-Features: AcwNN1V2m2WCaBxr0rvZMK9hVLQO2qOSstRyecHNb-5dc_jgIb2148PUYrB6rno
Message-ID: <CAAhSdy0O33kwnLZ9O3MpiGSbypke5jF1arnRGs1AnSVkdfQSTg@mail.gmail.com>
Subject: Re: [PATCH 2/5] riscv: sbi: Use IPI_MAX for SBI IPI muxing
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	tglx@kernel.org, daniel.lezcano@kernel.org, hui.wang@canonical.com, 
	samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_073607_155306_B6FA5F94 
X-CRM114-Status: GOOD (  15.01  )
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

T24gU3VuLCBBdWcgMTYsIDIwMjYgYXQgMTI6MzHigK9QTSBHdW8gUmVuIDxndW9yZW5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiAiR1VPIFJlbiAoWHVhblRpZSkiIDxndW9yZW5Aa2VybmVs
Lm9yZz4KPgo+IE5vdyB0aGF0IElQSV9NQVggaXMgdmlzaWJsZSBmcm9tIDxhc20vc21wLmg+LCBy
ZXBsYWNlIHRoZSBoYXJkLWNvZGVkCj4gQklUU19QRVJfQllURSB3aXRoIHRoZSBwcm9wZXIgc3lt
Ym9saWMgY29uc3RhbnQgaW4gdGhlIFNCSSBJUEkKPiBleHRlbnNpb24gZHJpdmVyLgo+Cj4gTm8g
ZnVuY3Rpb25hbCBjaGFuZ2U7IElQSV9NQVggaXMgc3RpbGwgOC4KPgo+IFNpZ25lZC1vZmYtYnk6
IEdVTyBSZW4gKFh1YW5UaWUpIDxndW9yZW5Aa2VybmVsLm9yZz4KCkxHVE0uCgpSZXZpZXdlZC1i
eTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCj4gLS0t
Cj4gIGFyY2gvcmlzY3Yva2VybmVsL3NiaS1pcGkuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL3NiaS1pcGkuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3NiaS1pcGkuYwo+IGlu
ZGV4IDBjYzU1NTljMDhkOC4uZWVlYzE3OGE5Yjk1IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL3NiaS1pcGkuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NiaS1pcGkuYwo+IEBA
IC01Nyw3ICs1Nyw3IEBAIHZvaWQgX19pbml0IHNiaV9pcGlfaW5pdCh2b2lkKQo+ICAgICAgICAg
ICAgICAgICByZXR1cm47Cj4gICAgICAgICB9Cj4KPiAtICAgICAgIHZpcnEgPSBpcGlfbXV4X2Ny
ZWF0ZShCSVRTX1BFUl9CWVRFLCBzYmlfc2VuZF9pcGkpOwo+ICsgICAgICAgdmlycSA9IGlwaV9t
dXhfY3JlYXRlKElQSV9NQVgsIHNiaV9zZW5kX2lwaSk7Cj4gICAgICAgICBpZiAodmlycSA8PSAw
KSB7Cj4gICAgICAgICAgICAgICAgIHByX2VycigidW5hYmxlIHRvIGNyZWF0ZSBtdXhlZCBJUElz
XG4iKTsKPiAgICAgICAgICAgICAgICAgaXJxX2Rpc3Bvc2VfbWFwcGluZyhzYmlfaXBpX3ZpcnEp
Owo+IEBAIC03NSw3ICs3NSw3IEBAIHZvaWQgX19pbml0IHNiaV9pcGlfaW5pdCh2b2lkKQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgImlycWNoaXAvc2JpLWlwaTpzdGFydGluZyIsCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICBzYmlfaXBpX3N0YXJ0aW5nX2NwdSwgTlVMTCk7Cj4KPiAt
ICAgICAgIHJpc2N2X2lwaV9zZXRfdmlycV9yYW5nZSh2aXJxLCBCSVRTX1BFUl9CWVRFKTsKPiAr
ICAgICAgIHJpc2N2X2lwaV9zZXRfdmlycV9yYW5nZSh2aXJxLCBJUElfTUFYKTsKPiAgICAgICAg
IHByX2luZm8oInByb3ZpZGluZyBJUElzIHVzaW5nIFNCSSBJUEkgZXh0ZW5zaW9uXG4iKTsKPgo+
ICAgICAgICAgLyoKPiAtLQo+IDIuNDMuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
