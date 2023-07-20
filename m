Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AE1EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 15:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AOJVhrQrbOJXeyjaM7W5ZlsbHpET9vMqW2O8e+CfxRY=; b=g2XkwAersvF/x/
	8F6FIJwOA/lnEyPnJuLoJBseFtubOg+eUQ7/uZ5rXxWA4XzL0AlzrRToeCNWlw0s5Cp/b4rF7YUCA
	WHDTc5pdPCPqCcTv/0l6UtupXZfKmeIXy32YMi4hGebRLbkK593zC8/zgL0wK+A3qZvt0KsB0CViU
	wR2qBRlGrSATKz/mfnNriN/K9IH/rFJMRR0nA/YjN6dvLeLINzrlxm3EgtTaTRyZRqCedPUHl4RZZ
	tJTMTCHB5nOCjivWVjM/Ehggjbseb3tOPQvPO3MKkoWlHOklpH+xpJGBdff0W6m1kNlhnZIOoEcEp
	2y4B4RW2hn9lUOdQvcrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMVEc-00BUEy-26;
	Thu, 20 Jul 2023 15:06:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMVEa-00BUEO-0k
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 15:06:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 33CE761ADE
	for <linux-riscv@lists.infradead.org>; Thu, 20 Jul 2023 15:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94AE0C433D9
	for <linux-riscv@lists.infradead.org>; Thu, 20 Jul 2023 15:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689865586;
	bh=NwVY/LiiggaGme0jWI+ZcS1i0Dbn9MG9/E1CJbQ8P08=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XzXvymy8m9SUHmSMziFhB91k8ukfkATqIdIigv9ENMpUo004JPU243e87dnxwLERL
	 pnjAjbKW0vp3xAjIQTsp/A4HDEvdHcz0rmYup8Zb2if7yeJvj+V+2T73/o8fp7PfFT
	 SFvtAgZjDlFp+kSvr2k/zoAQc0kV7pU3uRs6naTN5oiO0o2xF4q/G/PYlP6VVDhExH
	 auHKCAL5fQDRgy9tSoTBNglXldzOVi6/qNHln2m3HpSnyCWUBDZwuUTI0LaaYdI/zv
	 u/12td66yghWaM4ePFsniXExQ4q7yCyQqaSEoOzFev0QNw37rirWIduq7dv/M8O94P
	 nO4mmze9tv/IA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so1397449e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jul 2023 08:06:26 -0700 (PDT)
X-Gm-Message-State: ABy/qLaNMEjWxgBfEcCabfJSp3d8Fluxn+SjB8iZEPBKy6s7z9A8tgQf
	HTUof5O0HpyJVacPu+UdKqPR5pSxkkfPyNGjTsY=
X-Google-Smtp-Source: APBJJlEckaUxLkBuMQTgllpd9gH5FY9afzhqu0sFHpFK92iGmfjgIY25B7mru0vF0W0Pki+6KsZfrsX3/oC1tuLhW8s=
X-Received: by 2002:a05:6512:2525:b0:4f8:58ae:8ea8 with SMTP id
 be37-20020a056512252500b004f858ae8ea8mr2845132lfb.58.1689865584515; Thu, 20
 Jul 2023 08:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221124094845.1907443-1-debug@rivosinc.com> <20230720001852.GA572618@google.com>
In-Reply-To: <20230720001852.GA572618@google.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 20 Jul 2023 23:06:12 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRFvSvEvQeDugdp73o7w4ArdtQ99JScEbLkaLnFcftVcA@mail.gmail.com>
Message-ID: <CAJF2gTRFvSvEvQeDugdp73o7w4ArdtQ99JScEbLkaLnFcftVcA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: VMAP_STACK overflow detection thread-safe
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Deepak Gupta <debug@rivosinc.com>, palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_080628_330019_5AA7939F 
X-CRM114-Status: GOOD (  14.29  )
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

T24gVGh1LCBKdWwgMjAsIDIwMjMgYXQgODoxOeKAr0FNIFNhbWkgVG9sdmFuZW4gPHNhbWl0b2x2
YW5lbkBnb29nbGUuY29tPiB3cm90ZToKPgo+IEhpIERlZXBhaywKPgo+IE9uIFRodSwgTm92IDI0
LCAyMDIyIGF0IDAxOjQ4OjQ1QU0gLTA4MDAsIERlZXBhayBHdXB0YSB3cm90ZToKPiA+IGNvbW1p
dCAzMWRhOTRjMjVhZWEgKCJyaXNjdjogYWRkIFZNQVBfU1RBQ0sgb3ZlcmZsb3cgZGV0ZWN0aW9u
IikgYWRkZWQKPiA+IHN1cHBvcnQgZm9yIENPTkZJR19WTUFQX1NUQUNLLiBJZiBvdmVyZmxvdyBp
cyBkZXRlY3RlZCwgQ1BVIHN3aXRjaGVzIHRvCj4gPiBgc2hhZG93X3N0YWNrYCB0ZW1wb3Jhcmls
eSBiZWZvcmUgc3dpdGNoaW5nIGZpbmFsbHkgdG8gcGVyLWNwdQo+ID4gYG92ZXJmbG93X3N0YWNr
YC4KPiA+Cj4gPiBJZiB0d28gQ1BVcy9oYXJ0cyBhcmUgcmFjaW5nIGFuZCBlbmQgdXAgaW4gb3Zl
ciBmbG93aW5nIGtlcm5lbCBzdGFjaywgb25lCj4gPiBvciBib3RoIHdpbGwgZW5kIHVwIGNvcnJ1
cHRpbmcgZWFjaCBvdGhlciBzdGF0ZSBiZWNhdXNlIGBzaGFkb3dfc3RhY2tgIGlzCj4gPiBub3Qg
cGVyLWNwdS4gVGhpcyBwYXRjaCBvcHRpbWl6ZXMgcGVyLWNwdSBvdmVyZmxvdyBzdGFjayBzd2l0
Y2ggYnkKPiA+IGRpcmVjdGx5IHBpY2tpbmcgcGVyLWNwdSBgb3ZlcmZsb3dfc3RhY2tgIGFuZCBn
ZXRzIHJpZCBvZiBgc2hhZG93X3N0YWNrYC4KPgo+IEFyZSB5b3UgcGxhbm5pbmcgb24gcmVzZW5k
aW5nIHRoaXMgcGF0Y2g/IEkgc2VlIGl0IGRpZG4ndCBnYWluIG11Y2gKPiB0cmFjdGlvbiBsYXN0
IHRpbWUsIGJ1dCB0aGlzIGxvb2tzIGxpa2UgYSBtdWNoIGNsZWFuZXIgc29sdXRpb24gZm9yCj4g
c2VsZWN0aW5nIHRoZSBvdmVyZmxvdyBzdGFjayB0aGFuIGhhdmluZyBhIGBzaGFkb3dfc3RhY2tg
IGFuZCBjYWxsaW5nCj4gdG8gQyB0byBjb21wdXRlIHRoZSBwZXItQ1BVIG9mZnNldC4gVGhlIGFz
bV9wZXJfY3B1IG1hY3JvIGFsc28gd291bGQKPiBjb21lIGluIGhhbmR5IHdoZW4gaW1wbGVtZW50
aW5nIENPTkZJR19TSEFET1dfQ0FMTF9TVEFDSywgd2hpY2ggd2UnZAo+IGxpa2UgdG8gaGF2ZSBv
biBSSVNDLVYgdG9vLgpJIHJlbWVtYmVyIHdlIGVuZGVkIHVwIHdpdGggYW4gYXRvbWljIGxvY2sg
bWVjaGFuaXNtIGluc3RlYWQgb2YgcGVyY3B1Cm9mZnNldCwgc28gd2hhdCdzIHRoZSBiZW5lZml0
IG9mIHBlcmNwdSBzdHlsZSBpbiBvdmVyZmxvd19zdGFjayBwYXRoPwoKPgo+IFNhbWkKCgoKLS0g
CkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
