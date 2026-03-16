Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10EDF46426
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 09:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gdrK41Z31/Fu2SQ6m3ikN1s9Talsbwl0EIT1soQv8TU=; b=urdxvBOIu9Y4QO
	vUPLgRgqfRPR0q0WljWPJ/0YI9eQUCd/+8+FCKTSV40yIB/3EwKRS9/75UFgYahCYwJgQ3S78orL1
	YNsmqRjQLn96Gl6EIjQomto3zRfWY/ZvWM3py9EIN16fjNO1OxfJHnicMZOWSdHnDTVZplIahazN3
	+uIiNs0HhApX4BfEZX7u22yNiUTwPDgW1DtjG3npUu5K07EwRc43iiInT/v3ppoQC0aayh+WUuarQ
	c5pYpabTU9tkRgp3QHx0amcwFdihE5WRgKjmYwZi1RS0DeJn0oMOwY19zz7mUd5rMFQOkic4R/OV9
	crURNJ7/N1A573s4H6LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24YI-00000003hhf-1vH9;
	Mon, 16 Mar 2026 09:47:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24YG-00000003hhL-0FjN
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 09:47:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D29514081B
	for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 09:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B48D3C19425
	for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 09:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773654474;
	bh=hTO0b//9J6hdEaeoiKx8R3uzY2KOnB6ZXa4y+7/QD3c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Sl49HhCyKH8k+Hb4iD7CrePHlPwLaDaES5ObsgMvB+ELzbCQJPzuST17v0WXVwRX1
	 z8WdiSRBWqhMq/EObwy1p6W/nj04J+kJ1FKdfYcbM60pU0fQdSqikaU/4ZSrs23r5u
	 Wvow+E4UBYSzA3G2Ggz2n2/NK01BD6G3gKMEoNX72/mSBNwxtLdyLcx5jk/k/ofJU4
	 LOS3VfIAY6gVAt7dFaRyoVLWepdrIuIMcaJi98cbnGQRRh3+yUrBpm1e5Vv8RPDvin
	 u+7sGqdkYIGopcxt6jWStoJiw+/O221CFRZDxji5MxxByUD2lp1ouZjRIh3Mp9E9C0
	 BSuTi8vDIOwBg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59dea72099eso4531677e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 02:47:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7b8qoLOCnqG3kWwBEimH9M3HMYRNtVkAlrkcVqYnIdgWYYKnQSR8aNZ6nUkueCMjevT/slFIOJ1xUeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtXA1YO6KaFaydGaUIlxIRbXbo6HmD4CzjF8KXmtDyUI1KA/RS
	eSWoZF9CNAjZSlJpX7MChB5RrOuJ8UDWrhiK426G9waPgf+3fvAb3TJ41WkWpvW/QeB0nj7bewe
	ETGJbCslO4znypZBnWrBLAIEzrz4SOp+5ODvsp6502Q==
X-Received: by 2002:a05:6512:61a8:b0:5a1:2512:859b with SMTP id
 2adb3069b0e04-5a162b27dc8mr4321963e87.44.1773654473396; Mon, 16 Mar 2026
 02:47:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260311-tasting-friend-eae39148fb96@spud> <20260311-vigorous-steadfast-04afdcc9e524@spud>
In-Reply-To: <20260311-vigorous-steadfast-04afdcc9e524@spud>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 16 Mar 2026 10:47:41 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mf_bXZ2RnJxYm=tvwd6VTyEq6G54L=Byb38bM2sq3o=dA@mail.gmail.com>
X-Gm-Features: AaiRm53OceAgbmYwA2bIdbrB6kT_rOSWVOngjGWPSWu0Bz7x8aUaBEt-bwQGpaM
Message-ID: <CAMRc=Mf_bXZ2RnJxYm=tvwd6VTyEq6G54L=Byb38bM2sq3o=dA@mail.gmail.com>
Subject: Re: [PATCH v12 3/4] soc: microchip: add mpfs gpio interrupt mux driver
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Herve Codina <herve.codina@bootlin.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_024756_268647_3024344F 
X-CRM114-Status: GOOD (  11.06  )
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

T24gV2VkLCBNYXIgMTEsIDIwMjYgYXQgNDoxOOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNy
b2NoaXAuY29tPgo+Cj4gT24gUG9sYXJGaXJlIFNvQyB0aGVyZSBhcmUgbW9yZSBHUElPIGludGVy
cnVwdHMgdGhhbiB0aGVyZSBhcmUgaW50ZXJydXB0Cj4gbGluZXMgYXZhaWxhYmxlIG9uIHRoZSBQ
TElDLCBhbmQgYSBydW50aW1lIGNvbmZpZ3VyYWJsZSBtdXggaXMgdXNlZCB0bwo+IGRlY2lkZSB3
aGljaCBpbnRlcnJ1cHRzIGFyZSBhc3NpZ25lZCBkaXJlY3QgY29ubmVjdGlvbnMgdG8gdGhlIFBM
SUMgJgo+IHdoaWNoIGFyZSByZWxlZ2F0ZWQgdG8gc2hhcmluZyBhIGxpbmUuCj4KPiBBZGQgYSBk
cml2ZXIgc28gdGhhdCBMaW51eCBjYW4gc2V0IHRoZSBtdXggYmFzZWQgb24gdGhlIGludGVycnVw
dAo+IG1hcHBpbmcgaW4gdGhlIGRldmljZXRyZWUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDb25vciBE
b29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IEJh
cnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAb3NzLnF1YWxjb21tLmNvbT4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
