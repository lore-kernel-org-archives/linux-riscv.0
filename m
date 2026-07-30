Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C72AC54FD2
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 06:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=or753Mc8ZmW4v1BM4/ZXQCap2smCqxQWzwAckkg57YQ=; b=git9vn9FCMAyqP
	iCU4MU4BlSC++knRP/KiW7pjiVhE4QGrKsGzlxxwkxPaA/Tg+ZXP/zzV+yPSU2RCggShSu8yqPm0I
	Wh+f991XRioWAZKdjjqXVnYbNyxGPziXMlcwhJxcp9jkWpBLcoXKYuA9LHgJZfJnAIkvHh4IPO7Wh
	k81nj2E+V7cmU33OTvCRLO1zY/mCn7e67s0hDfyLYrXkLDuScxLsIRI3nYjbEHrcl7jG9IUEap1B4
	zAallA0pelljRqVSClhHlRgVNRALodEQJAp7A6cgLL4YaRfMFMa6oW53yibuJDVixn8AG424PnUOe
	uFRvqCgucWZKXJtAueKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKMC-00000009d0H-1qvU;
	Thu, 30 Jul 2026 06:35:04 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKM8-00000009cyh-3OcC
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 06:35:02 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so1458362f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 23:35:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785393299; cv=none;
        d=google.com; s=arc-20260327;
        b=YEWyp7/R1T3L2RDupKKoms2pMg27sETQbxmwxo/UCzq8gt/l8fD0TrZspc7q+tQBlW
         axz6Nr19KN6XAVH9rmhVHWDcN0Uj0Lf/RYFNgD0r6zgqgjZ/xOtWcZS1rXeke1N5H5C/
         B+8HEaYFqtcNf9zYp+NW2qod04J5jUfI/JnOIxjx4Ow5S6kM7Ts1rZEPTnMXE4e4hyxJ
         MJ+rprSS7PUZlFwVngMhFL/UonluevXXw2zOElY1hORfKZ5KbbsUV5w7CfxIIgfHQ8+C
         3Qy7FhuIbyWSSQUGdHmqJGTirT+74CLbRrITnAexyHr4lB+qlA2fSsospodHwJRauKuH
         w4jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IbxqtpZnShFKaHKefEe4sTCSmkBdNGqkiQHmyC+L+Hs=;
        fh=LXuG/5u0VXLZG9QzGe1kILJzLiRVFzJBpF9tCEk5IW0=;
        b=pPmX1Qp3k9DETWmr4xxsBK4Umb1DeBAfN05JDvPvOm6uo8Mn9ssBVb/bP7DJdd2uD0
         7RhQXVAHVEzo+6+Mpm25ldNz1/uZNHMn3UlKr9koaDu60XMoYkuFh814RhFdABO4GT6Z
         87tUAmTaQacPBx/34it9sjTXVImV5c6I57dlXnl3ZXJHBkmNnvc2de8qm9VAEtyntmcu
         KhvZsLSqoNXBY5Bxsmg8x8VallOdqKbH5QOUzmYnZJnCDSnYXBj+KINKlY/GFVOKMe1m
         sv9agGD1Tmba6ACCaGzWuR98pjgRqhSTMJAqmgLGEjuWCgFiS+ohjOkUOBoaBzYyJcwj
         PB1A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785393299; x=1785998099; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IbxqtpZnShFKaHKefEe4sTCSmkBdNGqkiQHmyC+L+Hs=;
        b=xop1upB7/Itso/NNL7MV7X9BvkeP2vdSGUZ6GH+1OLIo7v+pQiZ1BbkxYb2LVUx/Vi
         gzyUYfREuGI6Dy4SlUl5AiMphycX5OWLLiDmUEuM+lI7BfiTGyYM0/q6m7X/Lo8OfTXP
         riSW/SWViXWiDOknQwrn4K6ItH6rQ6F0IJMbgiCqqHkAQldT2ARZ/X24jjTn35VgJWSY
         n8bIOhgsLwe3WKHSXjiJQ0FFsWQhpHyWm+/io8wUITzRRGi9X2xr9sE5438tr4hj9QZC
         mY6DOADdTqNwm1V3YEfZrwGc8GnLM9UcM8V4Fah8f1X3Io5DACmE2YgiU7agOESV66tm
         NVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785393299; x=1785998099;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbxqtpZnShFKaHKefEe4sTCSmkBdNGqkiQHmyC+L+Hs=;
        b=gawu718J5D1XY9lj/FmYflC5A+EhPm0yqYLz5+4w/tgRQqjHS9AvClaT1E5q2JJgSP
         V+hqaNdFW+xbD+bGm0lpumZpQgQnoLcF9P+FpzfXDqwFGPInJfH4nQF3KLzphcKphM0e
         Ye230n0+dG3ODa093sn40xTUjURRR0dHpvInTwbxS9BbNFP238LPANGy6jZQHK+/Izy7
         l3yR/Yvyr3SEzBKLlVDfYJ4nOz0pNTYP0KUxSZD0MMXiGeNNE1mwI1sJhU53+bxW0+FV
         nTjnKOb2urs5SMxKOXQetriIGW63TYzkHiR1PVvfERI4s3ag9JADp7oS8Esvee9eOr7H
         alJA==
X-Forwarded-Encrypted: i=1; AHgh+RqhQx3MCVa2o+lXp+LeDEq80P1ZFMHFI7UZW7xF1aQ06knzpWY4Cj9T3G2usqMqn4GlH6zxZC8wE0NJUw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8mjTc8sk+OP7aqXolVeptUErif5hHI8i2FUqqzNBITKykE3JC
	InWQVU9pVEACEa+uKrDraoGPvVuW4nWdcmf+4nxhQdh5nm6wHnCismZZGi4jbJdh3v3zT0joxor
	/1sBk2YZWtTkzwjOuyGm7NXNfCj7qe2oaSlleHKiPQQ==
X-Gm-Gg: AR+sD102M1UnoB0hYhwoLsSgITpnJzCxSibk6RnUHxlv51Yo1Il7ivJTmwhAACSY51B
	kPVHe1H7hQmm85IRoSTZfvmxYdmr5X1Irg555X2bccb59/stU8nfZISIYbk2x90UKv8CGRRgHlM
	fP/NAn7Te+EiMdzV60EZ+yJE/RrubCdQqJF2NSVYsWJco/5vAJ8fFh+Cd/V/1Yb/zs4UrHsGh9X
	9PIojfEFrv5e/wvuhzOp3kIsoQn44jxG3bxIYHo6TdvXWBdgmb2qjCI4VYVN/7vwEZ5yDdt0KQP
	6r4QOkmVptii12AIx12b99bayp+Xb2uNjt97qbmVDzf0/VCYISpGrJjfwhwYc5Olp2Eyu0U1szx
	ShvyyiiCEe/lcSA34+seQhgzkIvLbdzIWJpPSJj1rICXBLw7zDJSokvTHGgx2GkgjJRxT6tuNiQ
	==
X-Received: by 2002:a05:6000:2010:b0:47f:4fa9:ae42 with SMTP id
 ffacd0b85a97d-47fc80c2fcbmr1669738f8f.11.1785393298545; Wed, 29 Jul 2026
 23:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260729232527.139183-1-inochiama@gmail.com> <20260729232527.139183-4-inochiama@gmail.com>
In-Reply-To: <20260729232527.139183-4-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 30 Jul 2026 12:04:45 +0530
X-Gm-Features: AUfX_mwiU5ddNzdK7WpCSdf3HhHn67Wv5Yj3GZUH0R97aWLgDl1m06xy4O4sbCY
Message-ID: <CAAhSdy2dMcuYv=vvVDabxv92OwM6HMU5LuH84Qqu86YZfEDV5Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] RISC-V: KVM: Reset the SBI extension when disable it
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_233501_126869_6CEB4E6C 
X-CRM114-Status: GOOD (  17.57  )
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

T24gVGh1LCBKdWwgMzAsIDIwMjYgYXQgNDo1NeKAr0FNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhlIFNCSSBleHRlbnNpb24gdmFsaWRhdGlvbiBjYWxs
YmFjayBjYW4gb25seSBmaXggdGhlIHBhcmFtZXRlciBpZgo+IHRoZSBleHRlbnNpb24gaXMgZW5h
YmxlZC4gSG93ZXZlciwgaWYgdGhlIGV4dGVuc2lvbiBpcyBkaXNhYmxlZCBhZnRlcgo+IG1vZGlm
dHkgc29tZSBwYXJhbWV0ZXJzLCB0aGUgc3RhdGUgb2YgdGhlIGV4dGVuc2lvbiBpcyBzdGlsbCBi
cm9rZW4uCj4KPiBSZXNldCB0aGUgZXh0ZW5zaW9uIHdoZW4gdGhlIGV4dGVuc2lvbiBpcyBkaXNh
YmxlZCBzbyBpdCBjYW4gaGF2ZQo+IGEgY2xlYXIgY29udGV4dC4KPgo+IFNpZ25lZC1vZmYtYnk6
IElub2NoaSBBbWFvdG8gPGlub2NoaWFtYUBnbWFpbC5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpUaGFua3MsCkFudXAKCj4gLS0tCj4g
IGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMgfCA3ICsrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2Jp
LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCj4gaW5kZXggYjczN2U5YTdhMTJhLi4xYzRm
ODc0MzY4ZmIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYwo+ICsrKyBi
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKPiBAQCAtMjIxLDYgKzIyMSw3IEBAIHN0YXRpYyBp
bnQgcmlzY3ZfdmNwdV9zZXRfc2JpX2V4dF9zaW5nbGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+
ICB7Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2NvbnRleHQgKnNjb250ZXh0ID0gJnZj
cHUtPmFyY2guc2JpX2NvbnRleHQ7Cj4gICAgICAgICBjb25zdCBzdHJ1Y3Qga3ZtX3Jpc2N2X3Ni
aV9leHRlbnNpb25fZW50cnkgKnNleHQ7Cj4gKyAgICAgICBjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVf
c2JpX2V4dGVuc2lvbiAqZXh0Owo+Cj4gICAgICAgICBpZiAocmVnX3ZhbCAhPSAxICYmIHJlZ192
YWwgIT0gMCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gQEAgLTIyOSw2ICsy
MzAsMTIgQEAgc3RhdGljIGludCByaXNjdl92Y3B1X3NldF9zYmlfZXh0X3NpbmdsZShzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUsCj4gICAgICAgICBpZiAoIXNleHQgfHwgc2NvbnRleHQtPmV4dF9zdGF0
dXNbc2V4dC0+ZXh0X2lkeF0gPT0gS1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVTX1VOQVZBSUxBQkxF
KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT0VOVDsKPgo+ICsgICAgICAgZXh0ID0gc2V4
dC0+ZXh0X3B0cjsKPiArCj4gKyAgICAgICBpZiAoIXJlZ192YWwgJiYgc2NvbnRleHQtPmV4dF9z
dGF0dXNbc2V4dC0+ZXh0X2lkeF0gPT0gS1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVTX0VOQUJMRUQg
JiYKPiArICAgICAgICAgICBleHQtPnJlc2V0KQo+ICsgICAgICAgICAgICAgICBleHQtPnJlc2V0
KHZjcHUpOwo+ICsKPiAgICAgICAgIHNjb250ZXh0LT5leHRfc3RhdHVzW3NleHQtPmV4dF9pZHhd
ID0gKHJlZ192YWwpID8KPiAgICAgICAgICAgICAgICAgICAgICAgICBLVk1fUklTQ1ZfU0JJX0VY
VF9TVEFUVVNfRU5BQkxFRCA6Cj4gICAgICAgICAgICAgICAgICAgICAgICAgS1ZNX1JJU0NWX1NC
SV9FWFRfU1RBVFVTX0RJU0FCTEVEOwo+IC0tCj4gMi41NS4wCj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
