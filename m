Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004F8F46421
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 09:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KH7asiaIRQ9t3tKLb1TtMKbE9rtZO04AGfpIux86Nuk=; b=WVcnwthqE2feon
	SoSgadz8HWL9+4sanZ5IpQkxBR11pGUqvLqs6oC1Jv8zjclEcDXlyanSW8uS1ry6QedQ/SpX8ppDx
	eu9q6txsh9yF1Pj3g8RJApt3Yz0g6NpUxTDnhYnkIMc2CsnPqYM2Ynv2EvW9tmF9iHcjwvGCkN7Y6
	lBINZZ5fejarWVXE/rCX2Hqy03G1MliNJdvff8/zRPd+szJWojSkCaajMRBq3hUxGBRAEltRIt0fv
	OzkVs33dX1YVEj5pPREH9gd3bspDgL4Pv48KZSVna5vT3vCkmpPod+aUm0rtMpoabNGr4s71+tC7p
	VbbaiaEVhTh8Nlu0dWFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24ET-00000003dZM-2jMs;
	Mon, 16 Mar 2026 09:27:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24ER-00000003dYx-2Bky
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 09:27:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D2ED44444
	for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 09:27:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE509C2BCB2
	for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 09:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773653246;
	bh=2075SDS2E697W/Wwc6aAUT+Nkq77v1+WxTO8AZGoRSo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uCe+Mdtucr80Oyi6/DEwvBr9vOfKxNAzReJoHwX0FBP19FgU25jeVR516yuPWSWPA
	 N45CbN/BH7ypw+a2fKD1GxsbLdFYAEWX0yhoar/d5teaecMnQ5bBxMrZpP80UwG3gI
	 5hZ/ZeE7DFsQutaXmDReq/l4nAd5IEgl35sFIwofN6cRkhW/2eGM3yWni7uDgCGRpL
	 Hnn30Uh152prnaId6/OppvTfYO+beMS0PggJGqIPpYIr5z2yKcL5HXAWzAcy7+PnPr
	 CO9sKM3Yx/OV2dTuu7f1VY9qkJROorVM9tjJFeo3yZLEST8fSj6FKv9BaIOPCgKGao
	 IIXTMIqBpavzg==
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64ad9238d8fso4774616d50.3
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 02:27:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1iynLo634+PYljqBdqaJi8/sa/5CGkLYUR8lzwZX+S1tMvEMkng1bw+oy3dflRpBeGiwYcVkMCDCzvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKtNsWuz/OHEPjaqg7MPqjsoO2W+T2oEqCb4l1PoPI+srXucIB
	guxvtaI/Q5KXV60OycBjk2syMupWbfk9KXd1ipAQx7rkRNHrXQk94Lu+HUE9sVIJnt0pX8WOoMt
	eM8cODh2qF9XPYIoB4078dvS2kld8fHI=
X-Received: by 2002:a05:690c:6504:b0:799:182:17d1 with SMTP id
 00721157ae682-79a1c200ad0mr117403067b3.45.1773653246121; Mon, 16 Mar 2026
 02:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260311-tasting-friend-eae39148fb96@spud> <20260311-vigorous-steadfast-04afdcc9e524@spud>
In-Reply-To: <20260311-vigorous-steadfast-04afdcc9e524@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 10:27:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLnXBW7FDdGRt3rN5Up6GdRvu-Ywsg8jfepjEf4rBjPQ6A@mail.gmail.com>
X-Gm-Features: AaiRm50FrysZdDLlfNrm-B63ONOL6pT_4lfzAVob6hJh5NZnRj5j07-W2lGMtDY
Message-ID: <CAD++jLnXBW7FDdGRt3rN5Up6GdRvu-Ywsg8jfepjEf4rBjPQ6A@mail.gmail.com>
Subject: Re: [PATCH v12 3/4] soc: microchip: add mpfs gpio interrupt mux driver
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Herve Codina <herve.codina@bootlin.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_022727_579919_AE53C605 
X-CRM114-Status: GOOD (  12.51  )
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
bmVsLm9yZz4gd3JvdGU6Cgo+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3Jv
Y2hpcC5jb20+Cj4KPiBPbiBQb2xhckZpcmUgU29DIHRoZXJlIGFyZSBtb3JlIEdQSU8gaW50ZXJy
dXB0cyB0aGFuIHRoZXJlIGFyZSBpbnRlcnJ1cHQKPiBsaW5lcyBhdmFpbGFibGUgb24gdGhlIFBM
SUMsIGFuZCBhIHJ1bnRpbWUgY29uZmlndXJhYmxlIG11eCBpcyB1c2VkIHRvCj4gZGVjaWRlIHdo
aWNoIGludGVycnVwdHMgYXJlIGFzc2lnbmVkIGRpcmVjdCBjb25uZWN0aW9ucyB0byB0aGUgUExJ
QyAmCj4gd2hpY2ggYXJlIHJlbGVnYXRlZCB0byBzaGFyaW5nIGEgbGluZS4KPgo+IEFkZCBhIGRy
aXZlciBzbyB0aGF0IExpbnV4IGNhbiBzZXQgdGhlIG11eCBiYXNlZCBvbiB0aGUgaW50ZXJydXB0
Cj4gbWFwcGluZyBpbiB0aGUgZGV2aWNldHJlZS4KPgo+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERv
b2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+CgpSZXZpZXdlZC1ieTogTGludXMgV2Fs
bGVpaiA8bGludXN3QGtlcm5lbC5vcmc+CgpXZSBuZWVkIGEgcGllY2Ugb2YgYWNjZXNzaWJsZSBk
b2N1bWVudGF0aW9uIHRoYXQgY2xlYXJseSBkZWZpbmVzCnRoZSBkaWZmZXJlbmNlIGJldHdlZW4g
YW4gSVJRIG11eCBhbmQgYSBoaWVyYXJjaGljYWwgSVJRIGNoaXAuCklmIG9ubHkgYSBwb3N0IG9u
IHBlb3BsZS5rZXJuZWwub3JnLCBqdXN0IHNvbWV0aGluZyB0byBoZWxwIHBlb3BsZQp0byBrbm93
IHdoZW4gdG8gdXNlIHdoaWNoIGFwcHJvYWNoLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
