Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B13606A31C
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 23:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0HdUlHN9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rK7aLHVu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2oCFYOrhSuEIsW9HlhwHTsdbFb895iCtIUUMFHtvCyI=; b=0HdUlHN9FYkr020lOx80r1hYjU
	z1koUBkcmJWId4w9XRCPDSkYf2oRj4Q1mx2yptiHuKRjEg/3Ej894ah0SGodgUsEthgydljNt9b6B
	s0L3Ebja8VsXvKuyMOplYFpg4ps22I41xUAbgmf9bwXUgDDUlA5Sc9UxrWeI1PQUXDmWw2EP53NI7
	eqWNAoiMQF76cQobzVbY6HBM6Mn2Vu3Frd2faKQvoyuXG9lzYO/ZgvDg2lZEqsDxqv9saXB7Wx8t3
	1eKbKIVQfn7DhWvmfeJ4b2jxRNpHhRN1fu5xN7gcXhyl+mPPTrtC+ypkSbNZSRX/j2JXSbHOyBye4
	ik2BkCOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQCBL-0000000GsyP-2I8D;
	Sun, 08 Nov 2026 23:20:15 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQCBI-0000000Gsxd-43St
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 23:20:14 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a210470b49so1634245e9.2
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 15:20:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794180010; cv=none;
        d=google.com; s=arc-20260327;
        b=ofwVi1pNaLp1utfMsAph4n6ButY0LMw+z+Is/yiCQ4almmFX88rTBObCYrObRx4S28
         h6cl4wiNcu+uLdEKIfyqjvKhlnJwI3HZpn5sUUDOq9V9xVpvDP51Zetmv1Zdl+lEht02
         Opj3kZri+jPGVgXmQ09A+a1XqtuTziQkFDrXQwts5inE/wT3fH3R9/QXRD2BUmC0xQ3o
         WJwFRqGnC+9/OWd3tICODoVlFHvkDI1wPSmNdCHQfD7p57Kj4qW8PesqxN6vLtR6Ilfm
         PRvlvhVG+CyHKVESMHTC8yKm/9MZbVESdK6IXFnJTdfJKBKa/bIRoI6GF6oS7BoQZ9Ty
         tWXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m1/J7FILflciOoToVoalj4BsQPvxpTrXiBsxuDEywhc=;
        fh=IAJKtunxXsoOOuhGAxHfu84zPwMkaWYBi9mjj1m0sDg=;
        b=GReVGqy7eBGV9ikoO/plUGcs8n7xCt4C0eHb5o3vOf0wy/w9MNow3f0ur9amtHiL4e
         wFLruTUaVMjBWekZG+tLSEKcGo2MjPR6hAEs+g+QliLPneUqY52K2OfB4DohLk1dzvKL
         QSPRXEOt3+l6twKnT2H3KKkmMX4kXlzktPyKOs+HZOMzuxVBtYQhLuhztAIHgKH6+uJE
         ndSu94cHEpZDr7n3XlEbWFcbK1mKMMB13z1g0jVCGwT2srJZeb00Ag9HfCESxhujJZHs
         8zh00T3w26c2sLm19VjuD7ZlYp7cLLsmA5fIq344R4DfG3nqRqaUJn+4SVMbt8yRK5zJ
         /dRA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794180010; x=1794784810; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m1/J7FILflciOoToVoalj4BsQPvxpTrXiBsxuDEywhc=;
        b=rK7aLHVudmT7wB5u/mW431jtiyNi5s3At7pbzORTInYWeXvUBu/bUgY3dRVOCTVXwN
         6hiQ14LOSiqfyITKFMavHnL3oXi6RmHZLCydR3scIl4sDEd2Y0LjVpmPMOFcpjj3n8r5
         /2NBCFGsFj+6UbNQyp3ZZF7w1xQJ9kFr6cbNK/Wacx8FXsrbie9+dTfp3Av5erCRLY6u
         78nJGuIxG8XcPHtzIeQSws6DLY9zxQjYQJktKNGq1AfxaWwQ+4/vJnK1+6yYpEzAU9pc
         /rGkzmtAsaF/2sZbS/YrMUW6ceyb7tO4UALTvjYmDruNqQg+ui7EwaFIh7Esgwq3el/h
         S/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794180010; x=1794784810;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1/J7FILflciOoToVoalj4BsQPvxpTrXiBsxuDEywhc=;
        b=l8BPun1o9ldkLjxD6zubhrWPlmSBDTfhVvGw4nXHr4iEYgz98UW81UAS0W6+i1ktv3
         fi1wxJFsSxjdoLxzy86FdCIedc9EWvLhlcRCsXaqeN7cz5OowxGi3ZUuUVn1uG7j/xGj
         O28gKxPfiIaaQ5o2xPaZJHS7kHUnZ0F7RmbXCa8mAFSFP614CJrgIhDkMJ7aSJ3Cjqwq
         3uFVht8O+8xZHAqojmBavWSMKRKDNEV77puGz8QODyeVNPv2ivq8X01J6U2lWd7Ib0Om
         eTscB1wk5+s/wxgU8KB56hmKeA7Un5/mKLAA42sJxeFHe8bftUrMQiTB34EQb07E5RpT
         grPg==
X-Forwarded-Encrypted: i=1; AL+hErFQ0g+0vvmt4tLYBETIqrJL1kviM3e6QlEtnfNfPABuc5pw674UK/g2irBhYSf5VBFkcmugOJOqquDGxw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8lejkVSGxZcL9NkfdanuLXJLvXPiWSB7ano4jEmce3PMZZQvcq
	AlyXGKXaPG95f82T8QHOKQf5xpFD8NKoCmrC5cXpIftk91o7Br2Q/ftPrJIujZbBpb39f20jpYu
	DZP8MytEK2esBhhu/a4IbNErjTXKog4o=
X-Gm-Gg: AYBFou0wbZ0P5NSj7CeBgdPH26EmD0AYnIsX+JMlRGsnaLf/6/Nr/w/KDnqA398h4vU
	WIru5X6vDq2OxgWTX9JxsDipCmSLZc7SK/ETfS1Vi/1lpiwai16mkUNIzK79AQcX0MXXJT5B15Y
	ZFC6MjsrZg9ktz9SxO7v8VgJvGrNS0hrVxjhg7d30+ihDE7X6+GJYMs36dEPd1fpgjOHEqImz/K
	cGHvFNmuuS43cXQm8eO1TvFLcIvLf8Nfy/BriT6m+b5KjR/nhwm4YJJg49kuA80k60IBP7hxqY8
	xOFtqyBqors/NT82j3UqHLAGzfc+d0lrSvjm8Z9R1umeOtc18bTtDrOFPX15iQIFAHbcJoa0C+6
	MjO/gox5bqRVk9SZAHasEztHXGWGmb2rvWszJAJGDC6ovpeg+WcttCrDOk4b5M6aSkDwFZ07LFt
	Wf+5L4pJ46KnlnSxCBuVfm9cQerNPT7DA5T493nWTPwHD2BS/C76gmoZyW6Fo=
X-Received: by 2002:a05:600c:6095:b0:4a1:fbf8:55c9 with SMTP id
 5b1f17b1804b1-4b963c89227mr39662885e9.33.1794180010333; Sun, 08 Nov 2026
 15:20:10 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-reset-regmap-test-bits-v1-0-1b33607a76b0@pengutronix.de> <20261103-reset-regmap-test-bits-v1-6-1b33607a76b0@pengutronix.de>
In-Reply-To: <20261103-reset-regmap-test-bits-v1-6-1b33607a76b0@pengutronix.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 8 Nov 2026 23:19:44 +0000
X-Gm-Features: AclHuK-aeVO63ZKWXARmCrmFPccfQkZVnuibMmil6eYfKAtCJR8zv2owsIJ8nxI
Message-ID: <CA+V-a8tDskFKhsJJiV1OUXEzcTN6nKEz4DJCPjJC2tEdrCUTgg@mail.gmail.com>
Subject: Re: [PATCH 6/8] reset: rzv2h-usb2phy: Use regmap_test_bits in rzv2h_usbphy_reset_status
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Damien Le Moal <dlemoal@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_152013_028331_0178C823 
X-CRM114-Status: GOOD (  14.43  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBOb3YgMywgMjAyNiBhdCAyOjUy4oCvUE0gUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBw
ZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4KPiBTaW1wbGlmeSByenYyaF91c2JwaHlfcmVzZXRfc3Rh
dHVzKCkgYnkgdXNpbmcgcmVnbWFwX3Rlc3RfYml0cygpLgo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdl
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5k
ZT4KPiAtLS0KPiAgZHJpdmVycy9yZXNldC9yZXNldC1yenYyaC11c2IycGh5LmMgfCA2ICsrLS0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ClJl
dmlld2VkLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVu
ZXNhcy5jb20+CgpDaGVlcnMsClByYWJoYWthcgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZXNl
dC9yZXNldC1yenYyaC11c2IycGh5LmMgYi9kcml2ZXJzL3Jlc2V0L3Jlc2V0LXJ6djJoLXVzYjJw
aHkuYwo+IGluZGV4IGQ5NjA0MmUyOGNkNS4uZTY0NDA5MmNjMmY3IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvcmVzZXQvcmVzZXQtcnp2MmgtdXNiMnBoeS5jCj4gKysrIGIvZHJpdmVycy9yZXNldC9y
ZXNldC1yenYyaC11c2IycGh5LmMKPiBAQCAtNjgsMTEgKzY4LDkgQEAgc3RhdGljIGludCByenYy
aF91c2JwaHlfcmVzZXRfc3RhdHVzKHN0cnVjdCByZXNldF9jb250cm9sbGVyX2RldiAqcmNkZXYs
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgaWQp
Cj4gIHsKPiAgICAgICAgIHN0cnVjdCByenYyaF91c2IycGh5X3Jlc2V0X3ByaXYgKnByaXYgPSBy
enYyaF91c2JwaHlfcmNkZXZfdG9fcHJpdihyY2Rldik7Cj4gLSAgICAgICB1MzIgcmVnOwo+Cj4g
LSAgICAgICByZWdtYXBfcmVhZChwcml2LT5yZWdtYXAsIHByaXYtPmRhdGEtPnJlc2V0X3JlZywg
JnJlZyk7Cj4gLQo+IC0gICAgICAgcmV0dXJuIChyZWcgJiBwcml2LT5kYXRhLT5yZXNldF9zdGF0
dXNfYml0cykgPT0gcHJpdi0+ZGF0YS0+cmVzZXRfc3RhdHVzX2JpdHM7Cj4gKyAgICAgICByZXR1
cm4gcmVnbWFwX3Rlc3RfYml0cyhwcml2LT5yZWdtYXAsIHByaXYtPmRhdGEtPnJlc2V0X3JlZywK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByaXYtPmRhdGEtPnJlc2V0X3N0YXR1
c19iaXRzKTsKPiAgfQo+Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVzZXRfY29udHJvbF9vcHMg
cnp2MmhfdXNicGh5X3Jlc2V0X29wcyA9IHsKPgo+IC0tCj4gMi40Ny4zCj4KPgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
