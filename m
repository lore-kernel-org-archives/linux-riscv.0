Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B52D3F07A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 15:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=85ZGXghMAQU3/+uB23aRdqqK7LjGLkggT5hN45Y0ol4=; b=Lt7HplQyGWH/JU
	GqwuKUfpFaR2CwudulyLQUc7Dy3z0l7bhPM1WRhs/4ZXybjeoZLsFC75Orf28P74J1KoFfWv/U00A
	tCfSUcU4mTtrsStF3tdvDubV+ZQ9UJrYfExw9sZFNLFW3NlM8UkoWnzSwAwyFcA8cI++udcTxOw3/
	mqBZ9PUVSQ4wvm9Bxwa/ZaKZVDLcVSOGIzYgsxAPVEkZhZvNyQjuPu/DzeO+fr+94UncD4recsvhv
	QRqMgxMAa+S7KaSn+tzkdG6BzRxOzKeEkjJb+7Ki4qCNz9kPGPZkQe9ll0gVKEsVSh47IgjQJl08G
	kE5ZZ8X3Dw0ZwcHgbuIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7AD-0000000GF9c-0yxN;
	Wed, 28 Jan 2026 15:09:01 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7AA-0000000GF8g-1shp
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 15:09:00 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-45efde72438so758514b6e.3
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 07:08:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769612936; cv=none;
        d=google.com; s=arc-20240605;
        b=DEZubhr5KfTXeum5Dqk6xPuJhO7PqPf7eD8tP+UOlzLjS7hmPwBG53JwghUip0IeFC
         33pw98JO1hyzaIBl19jcEhaOFNmOf03tBDC0xdU6PGAML3Wny9wl7WkM5olXzjtkbYdQ
         CZfsFbENMcZBB3PtQBidrkxuxNZ+r6qOgudjWkcel0ZEJLEzQ7wvtT869AAv3xA8IAK0
         4N6g7N8lipwr2scesthy3mrDyR5OZJ+vw+kPbYZ1BpCIZeiRsnbLeyS6+13jKdU/99dA
         hFmBrCOHjhnAw0aB7S4FP5rIQXdvwbbIhP0HcHBzmUdqMCwoJ3Tra4yYDggEM2lNSYqv
         qs6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AxMPzN53EYgjdk6Vy1nZn5p3hSqaa1HYt69dzR2C85k=;
        fh=9iK0uJPPGjSE04iJ8mhsWiCJvRbFMA40DiyNjd4O2aY=;
        b=SS5UT/jBXIUv/KFzzg3XzEuN1mQDDFoH8ZSz+fkf0ThJ80p4fzvrkatvvXvYvZhYRn
         3XWpdzdl8/usvM6z7OunQ3cH5CpL08RFn5uCSAVJ1f6ReYj3416bFWa48PjzlONB1E6J
         Br4/WOK4dAf9OYMfEDqOlqloXBVwjqMuFDCVOiS4mRyTpeK8iv1/dgaUSoP2O9YKwzM+
         p94bUii4Fdjzb7AMt0V9obJ49FZhQ97vBr/BZbA8MpMvZtJAANH+UAD70x31G9mjAbsc
         W9GDrdUFnBvX3VdtzcUkTcQrM2O3J28rMzuMD/b3n6Ssp9Ruh62Bk2t+cN8B9IDfdFLe
         BhIw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1769612936; x=1770217736; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AxMPzN53EYgjdk6Vy1nZn5p3hSqaa1HYt69dzR2C85k=;
        b=fTWTcAGfJdsY1V4hPKm2t9eZNNxuO8ixk3EsnXSqJYkJb+fI1XKGtSyQauEnvvn2qn
         vBxcmiKLoyrF2I3C9u7Vv/X5VhmBXmL8KxY2YRL6GhdjWZvb5ub3L2LMlzmSP27yuvPP
         2ChWBm/cIVEGlGdM3ojVbAOFtiHgoWwVFafx9MtjqtdlQWYR7wwhgLgdLEIJTgqi4NV2
         ZoLPefvqUMW4TkQD6/p3O2Qv2zWsh7cpZsmmd8kOn0uZnm41AHvIsLrLHDOrYBugSt7A
         LZcipQoeogYE4oLqyNqiocr2bdfDdt++NUiIhJre4axtNnhuySO0R60NbjjYO5m5ATR5
         QYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769612936; x=1770217736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AxMPzN53EYgjdk6Vy1nZn5p3hSqaa1HYt69dzR2C85k=;
        b=vCdHrF5WVGGr4gjs4MyiiF5rSjVAAstBCPuz0whciVygYWPMsMd8R0h3MSeOQjDAGP
         72mSmzN9qCZiqK/wwpSyMvAdaFvWFCylHRCoOfZ0U2o/EwTQTZoumHunhJzZveALUBjx
         O/8hMHgLm48F8Tc2mxAx83MdxP88H/GQse1AakC3ZbHt64ET6rTYHAxVzIZ89pKqPLjn
         a9hBUB8hRnEr09Qi9C3esGZaW0W/u2q8x6CR26aGTQuVKXq/22pot7I+Wy3v3D+K5te7
         wnjzxMIYyBACDC09FJGnOSDMRuvaGNeyzX6Jt8FufCv6kiuv2UbVXkhnI80mTg3AdpBY
         gKmg==
X-Forwarded-Encrypted: i=1; AJvYcCXraCj1DQTas7v6iVv7L4IiuDtkBGq4BGMv8SniwGqG9zm3GjMZJ8caW1KOlK6ISu6p9WOwP4vIU9t+9w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwAdCzvAehdVIgFSZnznBBkAmZKN4AUGR3hbqeR5crPKifW0uH1
	uMUyjt413jhSsul9yhuFeScsOzGoHFxMK7Mv5xhc05o2csfRttz5JmcixypDxb89GdgSy/ejotf
	YnygofS+PZ6ywF70sDkxh4qJxxm/phtR+EvA6XytrKQ==
X-Gm-Gg: AZuq6aKHZlAv+kr+c09ddw/pq464kxgA3BHUWh2X4kT/Zf0J7xY6O9+clTXzJNnTQ/M
	MdnbVa71rQMKHSmeWelq57zePEOncBHDtMDL/XaJz26NZ7QxvDfwlsYRd6JJFKnAh/qXbzRdcba
	ldfxIIOCgxez3LVgc5ox8W447kosjU/Fwkh0FKUyLFfoXWUasFHuXRaYUU1rqPKN3S1JjfyFlAS
	j83wM0j0v85pOQ5fP96FRHYWMol0IVphrMcnTVUG4D7IpfHKgqd7tsKFX9jby6Xi8X1mho+DnQ4
	OhpXn6/La2H4jYm5EdvOOThKiGZRJnjy2nFrJj3X8vjmkbDY5fcx3Uj6Hy4=
X-Received: by 2002:a4a:edc5:0:b0:662:ffb2:c5eb with SMTP id
 006d021491bc7-662ffb2c7dbmr710171eaf.38.1769612936518; Wed, 28 Jan 2026
 07:08:56 -0800 (PST)
MIME-Version: 1.0
References: <20260127072219.3366607-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260127072219.3366607-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 28 Jan 2026 20:38:45 +0530
X-Gm-Features: AZwV_QgU7EEvN2RGRe6P5jSnLHFztiDjeyvI6uk4oEgv6ph_m4-rthrrImh9DQ4
Message-ID: <CAAhSdy2z+8X3mgdfh5NOyJdJrH91honoAKzru+q8y1_D4pakRw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix null pointer dereference in kvm_riscv_aia_imsic_rw_attr()
To: Jiakai Xu <jiakaipeanut@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Jiakai Xu <xujiakai2025@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_070858_655496_7C69C7E3 
X-CRM114-Status: GOOD (  18.97  )
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

T24gVHVlLCBKYW4gMjcsIDIwMjYgYXQgMTI6NTLigK9QTSBKaWFrYWkgWHUgPGppYWthaXBlYW51
dEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQWRkIGEgbnVsbCBwb2ludGVyIGNoZWNrIGZvciBpbXNp
Y19zdGF0ZSBiZWZvcmUgZGVyZWZlcmVuY2luZyBpdCBpbgo+IGt2bV9yaXNjdl9haWFfaW1zaWNf
cndfYXR0cigpLiBXaGlsZSB0aGUgZnVuY3Rpb24gY2hlY2tzIHRoYXQgdGhlCj4gdmNwdSBleGlz
dHMsIGl0IGRvZXNuJ3QgdmVyaWZ5IHRoYXQgdGhlIHZjcHUncyBpbXNpY19zdGF0ZSBoYXMgYmVl
bgo+IGluaXRpYWxpemVkLCBsZWFkaW5nIHRvIGEgbnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlIHdo
ZW4gYWNjZXNzZWQuCj4KPiBUaGUgY3Jhc2ggbWFuaWZlc3RzIGFzOgo+ICAgVW5hYmxlIHRvIGhh
bmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQgdmlydHVhbCBhZGRyZXNzCj4gICBkZmZmZmZm
ZjAwMDAwMDA2Cj4gICAuLi4KPiAgIGt2bV9yaXNjdl9haWFfaW1zaWNfcndfYXR0cisweDJkOC8w
eDg1NCBhcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYzo5NTgKPiAgIGFpYV9zZXRfYXR0cisweDJl
ZS8weDE3MjYgYXJjaC9yaXNjdi9rdm0vYWlhX2RldmljZS5jOjM1NAo+ICAga3ZtX2RldmljZV9p
b2N0bF9hdHRyIHZpcnQva3ZtL2t2bV9tYWluLmM6NDc0NCBbaW5saW5lXQo+ICAga3ZtX2Rldmlj
ZV9pb2N0bCsweDI5Ni8weDM3NCB2aXJ0L2t2bS9rdm1fbWFpbi5jOjQ3NjEKPiAgIHZmc19pb2N0
bCBmcy9pb2N0bC5jOjUxIFtpbmxpbmVdCj4gICAuLi4KPgo+IFRoZSBmaXggYWRkcyBhIGNoZWNr
IHRvIHJldHVybiAtRU5PREVWIGlmIGltc2ljX3N0YXRlIGlzIE5VTEwgYW5kIG1vdmVzCj4gaXNl
bCBhc3NpZ25tZW50IGFmdGVyIGltc2ljX3N0YXRlIE5VTEwgY2hlY2suCj4KPiBGaXhlczogNTQ2
MzA5MWE1MWNmYWEgKCJSSVNDLVY6IEtWTTogRXhwb3NlIElNU0lDIHJlZ2lzdGVycyBhcyBhdHRy
aWJ1dGVzIG9mIEFJQSBpcnFjaGlwIikKPiBTaWduZWQtb2ZmLWJ5OiBKaWFrYWkgWHUgPHh1amlh
a2FpMjAyNUBpc2Nhcy5hYy5jbj4KPiBTaWduZWQtb2ZmLWJ5OiBKaWFrYWkgWHUgPGppYWthaVBl
YW51dEBnbWFpbC5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJh
aW5mYXVsdC5vcmc+CgpRdWV1ZWQgdGhpcyBmb3IgTGludXgtNi4yMAoKVGhhbmtzLApBbnVwCgoK
PiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMgfCA0ICsrKy0KPiAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMKPiBp
bmRleCBlNTk3ZTg2NDkxYzNiLi5iZDcwODFlNzAwMzZkIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3Yva3ZtL2FpYV9pbXNpYy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMKPiBA
QCAtOTUyLDggKzk1MiwxMCBAQCBpbnQga3ZtX3Jpc2N2X2FpYV9pbXNpY19yd19hdHRyKHN0cnVj
dCBrdm0gKmt2bSwgdW5zaWduZWQgbG9uZyB0eXBlLAo+ICAgICAgICAgaWYgKCF2Y3B1KQo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsKPgo+IC0gICAgICAgaXNlbCA9IEtWTV9ERVZf
UklTQ1ZfQUlBX0lNU0lDX0dFVF9JU0VMKHR5cGUpOwo+ICAgICAgICAgaW1zaWMgPSB2Y3B1LT5h
cmNoLmFpYV9jb250ZXh0Lmltc2ljX3N0YXRlOwo+ICsgICAgICAgaWYgKCFpbXNpYykKPiArICAg
ICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4gKyAgICAgICBpc2VsID0gS1ZNX0RFVl9SSVND
Vl9BSUFfSU1TSUNfR0VUX0lTRUwodHlwZSk7Cj4KPiAgICAgICAgIHJlYWRfbG9ja19pcnFzYXZl
KCZpbXNpYy0+dnNmaWxlX2xvY2ssIGZsYWdzKTsKPgo+IC0tCj4gMi4zNC4xCj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
