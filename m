Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3124D606A31B
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Oct 2026 04:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h4vA1mgU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=sECayl1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ziDzl3/9GD5lFKLi5qAQYadr93H84JR4jPmdvn7rHXI=; b=h4vA1mgUcQjpXkvvuBnlRD9fcv
	7fQlSBZK8+GRz6hyBhxVHktURHDxWvrvWUl2gC4IXtLGqgfEkMfUPu1x1Sle1p3npvZslGqJXDysy
	/epnjomj2f95c1KGg2cEF5KDB1JGs8gj5akiaUSTFfMyF+vCVTnKQ4ikr3pGK22NJjIz6bvwWkqX/
	baLp7XTM+FHA0he2l53FG54gEKHR9kb09e+BflPSRNa3B7GGfPm0IHlnP53xi7WPEsG/hdQF0NSfA
	XNq76agwAYCNvAdaoy7ty0/3gosF7kaXOmY46twIRJFhG3m2x1CvQ9Ym9p6glaJ2rwXTZyjAtIM1C
	a2a/HYIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKThg-0000000HRKu-1SD2;
	Sat, 24 Oct 2026 04:50:00 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKThd-0000000HRKA-31O3
	for linux-riscv@lists.infradead.org;
	Sat, 24 Oct 2026 04:49:59 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so13525055e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 Oct 2026 21:49:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792817396; cv=none;
        d=google.com; s=arc-20260327;
        b=K0tlhSIPaTMls1Kv4PCKJyN8QmvDBfx2CEa1LVXHQSJltAy105/MLPXv8Ivv5sHV7/
         HP38MeSnacFZealxGkFoDxUmzYK4u+QsaEKaJUtW2d6vEccNMme6OWDog+4Oujyeh341
         hnYY5Nh0YoPRvR0W3PJeU1tyHplBmnN9P1IEasEB5x0Pwe8NVI39bKpdhwC5acTVU7Wt
         /cUOmzIul2Qh27WSdSiKxpDQehj5Vgccgixh12yEjKfZuODB9w6oukoUF1JgcOzWYMn4
         zLfoIcsJHow50+mK7CYkqTphxMiLTHfWgArRzF3JlDtNQ8VIAVbp/e72WlnTcfJlwmQf
         o0XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YxBmcqUyq+7y7gmZ9dBOvMilScJYMeNzGz+wY+G2j1M=;
        fh=PVanrjQeefiddZlNixixRJQVMozh3hjauIXHTz8UfvY=;
        b=qLe0zQn1TK51nBLZhgyxpDJP7ePNJG4hEDDMUqChnHBVh8GjOwFyNm4Kfwnt+SA+nx
         w3CswjzkFg6IeDFua+PhTMzvgBALIHZuDZlQB/FxSqF4utxhzUeXLQtq9Ya35pbqqJM3
         Dq11i6O980sw5bU+iTsXmnorD9gvAsSF9L3TlPH6zI6YDkxtaO/chq0EJRHgz7IGIl5F
         z3Fo/mYnHUazOonYKzgK2VocHNzsQeMe/3jKS/pUfDgs0EgZiFBuB8eKr3fVM5wlL0uh
         eY1iTpjtas24+hnmyUq9GcbOBLZZyCIfAwkKYfR2Di0CAjlEDiS8YxPKaQNDvKq1sWsO
         AqQA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792817396; x=1793422196; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YxBmcqUyq+7y7gmZ9dBOvMilScJYMeNzGz+wY+G2j1M=;
        b=sECayl1aop5fHi4z/XYbzXPs3grZ9QsxxwrPtTAvafHQxT2WonBwdQ4uCUaZ/u66W7
         OfQpFhrDYqaNVGa23RBClC2f6AZadwTPXbM6P4n1D3v8sBY1P8YGbWtn6jn+cbgcjbpm
         HrDBpCqRZ4MLtNrrphWOWmPgK2YeiNYeBDn2S8CCcMoYPguMuGxeWoPVH8RESL84V+hG
         s02G2lqX4VqnUhTiXhxqjUxGD/YmMsBDUAyIl18rhOinAdDFLucl6USoV/43RNYmFAKg
         cfKl2iFXyPghhRzDBnYLHAVYmunQIj3DZuFeHf5qp4pU6PVZXi5gMZ5cQ86yPRFhnEoe
         dV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792817396; x=1793422196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YxBmcqUyq+7y7gmZ9dBOvMilScJYMeNzGz+wY+G2j1M=;
        b=Ch5OT9jEq1QikcE1LxwS5HLInxkbjO/9isgLYW3YR5Fe6ftYdGhSdDwVaoBGnLKKw0
         GJ7b0X6ESEdxC1g+OOcJZ4JL2wd41CnRL56CjOx76O/xbdx45OwM/IHLMlNmCfPZbWdo
         5ExPImlbVSocGs9wuFA12e8GjFT+8y67VVs3bNB2wLQIGioY0HebCr70KFHRr2iEqbcc
         oeFK2KHIt0+QMUEke/d4KTr+W3SJG8Og0FxPto9KZw9S03peRQDxL1yy0P/SslsgdXLj
         hLInoBGtguiFtxOmSR/rR+RgYY2Vmwq5XWTkhrN1+Ibwn/ATod7yU2B7L92aS+pRLVsi
         ulrw==
X-Forwarded-Encrypted: i=1; AKwUvBwenZZAph9r1qjfSeIZo3dM9rNHuqRGnzPGB5Fg7PlDIZXofop3C3QgFIdKy0YV6S0FuWBYRbBMs0EKlQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJq+/gqmdrUX8sE+dW/YLjrtjGu3p2bTTTBwPZIo2qyKxlAyfFK
	So6YtlTKU2MLGKkpor32puG5EB2iabvNJOZNSFXRs9XhweeK7D0Swva0Qkom7PQCvHvgiq1B79i
	93c5h37AtiCbpIh5y5UDvsbs3u/FHDYUmFTeBiNTmYQ==
X-Gm-Gg: AYBFou1gE8t84D7fmzgi0tJPRaagiqT4k6DHSZ0s5fJSqDFV4LeqGWz1zcBUV8m4MTR
	It2b3A2vI8F72V7ze4GCdoyJVu/ePDsdFo7Rm/yquOvYc22tuCTk9doOHSTDPTayLgGxUJnKDSq
	+wBshzLBDwYFPunMw7N4DhQHyF34HZmH92jTMU5Maz2bLTSYnsBNavIy6aig18cwnRoVNGSsGA+
	pyOlBwFHflBuNhz1mux1g03OeXi6w23bwrmAox+OMcOFZUKDh3bdN+TgWxw8ZISSY3AjA3C3rMP
	Yyc08IVmokyyAnoJPvaHryCg3QP3TwgJ74/P4N/brXJ57uZ1oq8Rr1KCZSUX3poJohIDaAgZh4l
	K3R1Cyjw+xml3XUghzXx6lKLRsibFHU7Vdeu3EDdXWSC9UCyiT4bPh8tq157209j2KEcSULJamb
	7BpqCog5rrbT9ERUs5MX4q4gYX1tZxYp8Qg7/0+bOQm61IUKA67PfoBZ8=
X-Received: by 2002:a05:600c:3e10:b0:4a1:e01e:1927 with SMTP id
 5b1f17b1804b1-4a35ac8d939mr12203795e9.5.1792817395557; Fri, 23 Oct 2026
 21:49:55 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <caplitmus-rv.75b0e9ee82984422ba17d833767912a8.d33@163.com>
In-Reply-To: <caplitmus-rv.75b0e9ee82984422ba17d833767912a8.d33@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 24 Oct 2026 10:19:44 +0530
X-Gm-Features: AclHuK-rwyUpMrCtlF-8OzUUpfS51mxj7irl2dKCroJ9WfO9LDr7DIESO4VEff8
Message-ID: <CAAhSdy1UwajY2P2ca_h0NUd2v00TR18go0gGNwRTxd66HQxS_Q@mail.gmail.com>
Subject: Re: [PATCH] perf/riscv: clear snapshot setup state when a CPU goes offline
To: Pengpeng Hou <hppiscas@163.com>
Cc: Atish Patra <atish.patra@linux.dev>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_214957_895545_9B6D15FD 
X-CRM114-Status: GOOD (  18.72  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBTZXAgNiwgMjAyNiBhdCA5OjU44oCvQU0gUGVuZ3BlbmcgSG91IDxocHBpc2Nhc0Ax
NjMuY29tPiB3cm90ZToKPgo+IHBtdV9zYmlfZHlpbmdfY3B1KCkgZGlzYWJsZXMgdGhlIGNhbGxp
bmcgaGFydCdzIFNCSSBQTVUgc25hcHNob3Qgc2hhcmVkCj4gbWVtb3J5IGJ1dCBsZWF2ZXMgc25h
cHNob3Rfc2V0X2RvbmUgc2V0LiBXaGVuIHRoZSBDUFUgY29tZXMgYmFjayBvbmxpbmUsCj4gcG11
X3NiaV9zbmFwc2hvdF9zZXR1cCgpIHJldHVybnMgZWFybHkgd2l0aG91dCByZWdpc3RlcmluZyB0
aGUgc2hhcmVkCj4gbWVtb3J5IGFnYWluLgo+Cj4gU25hcHNob3Qgb3BlcmF0aW9ucyBvbiB0aGF0
IGhhcnQgY2FuIHRoZW4gZmFpbCBiZWNhdXNlIHRoZSBmaXJtd2FyZSBubwo+IGxvbmdlciBoYXMg
YSBzbmFwc2hvdCBhcmVhLCB3aGlsZSB0aGUgZHJpdmVyIHN0aWxsIGZvbGxvd3MgaXRzIHNuYXBz
aG90Cj4gcGF0aHMuCj4KPiBDbGVhciB0aGUgcGVyLUNQVSBzZXR1cCBmbGFnIGFmdGVyIHNuYXBz
aG90IGRpc2FibGUgc3VjY2VlZHMuIFJldGFpbiB0aGUKPiBmbGFnIGFuZCB0aGUgZXhpc3Rpbmcg
ZXJyb3IgcmV0dXJuIGlmIGRpc2FibGUgZmFpbHMsIHNvIGEgZmFpbGVkIHRlYXJkb3duCj4gZG9l
cyBub3QgY2xhaW0gdGhhdCB0aGUgZmlybXdhcmUgcmVnaXN0cmF0aW9uIGhhcyBiZWVuIHJlbW92
ZWQuCj4KPiBGaXhlczogYTg2MjUyMTdhMDU0ICgiZHJpdmVycy9wZXJmOiByaXNjdjogSW1wbGVt
ZW50IFNCSSBQTVUgc25hcHNob3QgZnVuY3Rpb24iKQo+IEFzc2lzdGVkLWJ5OiBHUFQtNQo+IFNp
Z25lZC1vZmYtYnk6IFBlbmdwZW5nIEhvdSA8aHBwaXNjYXNAMTYzLmNvbT4KCkxHVE0uCgpSZXZp
ZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClRoYW5rcywKQW51cAoK
PiAtLS0KPiBUaGUgaXNzdWUgd2FzIGZvdW5kIGJ5IG91ciBzdGF0aWMtYW5hbHlzaXMgdG9vbCBh
bmQgbWFudWFsbHkgcmV2aWV3ZWQuCj4KPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlcmYvcmlz
Y3ZfcG11X3NiaS5jIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+IGluZGV4IDUwMjIw
ZjdiLi5mMzhhNjRjNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5j
Cj4gKysrIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+IEBAIC0xMTc1LDYgKzExNzUs
MTAgQEAgc3RhdGljIGludCBwbXVfc2JpX3N0YXJ0aW5nX2NwdSh1bnNpZ25lZCBpbnQgY3B1LCBz
dHJ1Y3QgaGxpc3Rfbm9kZSAqbm9kZSkKPgo+ICBzdGF0aWMgaW50IHBtdV9zYmlfZHlpbmdfY3B1
KHVuc2lnbmVkIGludCBjcHUsIHN0cnVjdCBobGlzdF9ub2RlICpub2RlKQo+ICB7Cj4gKyAgICAg
ICBzdHJ1Y3QgcmlzY3ZfcG11ICpwbXUgPSBobGlzdF9lbnRyeV9zYWZlKG5vZGUsIHN0cnVjdCBy
aXNjdl9wbXUsIG5vZGUpOwo+ICsgICAgICAgc3RydWN0IGNwdV9od19ldmVudHMgKmNwdV9od19l
dnQgPSBwZXJfY3B1X3B0cihwbXUtPmh3X2V2ZW50cywgY3B1KTsKPiArICAgICAgIGludCByZXQ7
Cj4gKwo+ICAgICAgICAgaWYgKHJpc2N2X3BtdV91c2VfaXJxKSB7Cj4gICAgICAgICAgICAgICAg
IGRpc2FibGVfcGVyY3B1X2lycShyaXNjdl9wbXVfaXJxKTsKPiAgICAgICAgIH0KPiBAQCAtMTE4
Miw4ICsxMTg2LDEyIEBAIHN0YXRpYyBpbnQgcG11X3NiaV9keWluZ19jcHUodW5zaWduZWQgaW50
IGNwdSwgc3RydWN0IGhsaXN0X25vZGUgKm5vZGUpCj4gICAgICAgICAvKiBEaXNhYmxlIGFsbCBj
b3VudGVycyBhY2Nlc3MgZm9yIHVzZXIgbW9kZSBub3cgKi8KPiAgICAgICAgIGNzcl93cml0ZShD
U1JfU0NPVU5URVJFTiwgMHgwKTsKPgo+IC0gICAgICAgaWYgKHNiaV9wbXVfc25hcHNob3RfYXZh
aWxhYmxlKCkpCj4gLSAgICAgICAgICAgICAgIHJldHVybiBwbXVfc2JpX3NuYXBzaG90X2Rpc2Fi
bGUoKTsKPiArICAgICAgIGlmIChzYmlfcG11X3NuYXBzaG90X2F2YWlsYWJsZSgpKSB7Cj4gKyAg
ICAgICAgICAgICAgIHJldCA9IHBtdV9zYmlfc25hcHNob3RfZGlzYWJsZSgpOwo+ICsgICAgICAg
ICAgICAgICBpZiAocmV0KQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4g
KyAgICAgICAgICAgICAgIGNwdV9od19ldnQtPnNuYXBzaG90X3NldF9kb25lID0gZmFsc2U7Cj4g
KyAgICAgICB9Cj4KPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiBiYXNlLWNvbW1pdDogNGQ3
ZDk0ODZjMDRkOTE3MjY1ZjY0YzU1YmQyM2IyY2M0ZmU3NzQ5Ywo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
