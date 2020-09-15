Return-Path: <SRS0=oZWO=CY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90739C433E2
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 19:44:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CD30206DB
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 19:44:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TJ1rBICs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="bOyc0kG+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CD30206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A0rFSujyQwPuyjXHQL3ZHN35vAtaXxBriLCVaptZAiQ=; b=TJ1rBICs9P7AMBWq+XuJcaY02
	xKHd8hMNU9aTa8Gj8INc8d35TfGYPMTxxiW5ig/YLCQQvp6xrwDAE0Oo7IOSyftikYTFt8njfvram
	WL5p9i5OJRZzW7+DIHIg6KlVMp2wzpUfjPn3OZOFxunmP8RQcrOY5tgNNiaiFRUofUjDJHUHa9DFY
	CgQ2vgLISbPuCrjZQlHEiTloCng/zpkQMEUzE0zYcE57YofxCcFUO0R7S9kX9QWh5W7k4rA7pNW+l
	zRtKfQHgcRJlLh7ixTjXeRrF/fWSUNmlr5pw1cBQj6w43SWRL6ZxbsE2Yht10a9gOKG92s/mJSUsa
	Qp/Oqr0hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIGsT-0003I9-8Q; Tue, 15 Sep 2020 19:44:33 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIGsQ-0003GT-2y
 for linux-riscv@lists.infradead.org; Tue, 15 Sep 2020 19:44:31 +0000
Received: by mail-wr1-x441.google.com with SMTP id x14so4507945wrl.12
 for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2020 12:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PjzEBFSaFZZwGPzvK3ldHo8/ahqiuUuNdZoX7vlerQY=;
 b=bOyc0kG+obnlRY0w33Jy1QiXwf4GtpPIe6yeApzlIUd/hT6mzMsOwbvkwd1eb37xvI
 lF0Wz60GDwJ9CQzi+2GoKpomqireVtE5j48Yckg1A0/BlWgK1vd2PvaeymExTY21XVnc
 I7DwvA8CmsXLsX8+/YYkxvOrzIiRbKEUhdgbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PjzEBFSaFZZwGPzvK3ldHo8/ahqiuUuNdZoX7vlerQY=;
 b=eNmJub43SmsOU+SoVSiwrGiGwmRFnrhHVlEgbvkOWHO+ulFrBkEEEwrfqlispU9IDB
 az0d5Rx2hM3mCd/AMDek8oieKyv6ql5JMN41WnLIY3LtxQ74gIMrcYhe1nzV/dWQXDva
 E0BQqDW+e3jxfN/AJbSqauielUCAdHwEL9C1AL7RYOoJ+lKnqZGlJBcNHvnEZrTIPQkT
 xnLYpmDwogTaamFgdAcNzw0CAzvdoVspY+nb0PdUl24bI1aURudel5G1BbnK1M0yuq1T
 nv3JpbkWJqvStQkzYI1TsMHIjxDIx/x7peSbXPaShQ60mTjERvAtGc+JxKqCdmJtla49
 oVQA==
X-Gm-Message-State: AOAM5338vM58z00zcHaN8ndTiEfcxYxkysl1tK+M6CXdr8thXTyh7raB
 p++yBO+yLICz+VXsfDzNlDXPBI0nZo2oXG6ObwVrTZVW1/KTy2Y=
X-Google-Smtp-Source: ABdhPJzcXIEv83CrM9Ja4e1Cs/2SNGDnH/JM5+7U+QSBwSqeH72DNP5g36m5kmVOv/s5ZqcA0mjcphMNIlidPNdY9rI=
X-Received: by 2002:adf:ef45:: with SMTP id c5mr790391wrp.384.1600199068864;
 Tue, 15 Sep 2020 12:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200915091631.84707-1-damien.lemoal@wdc.com>
In-Reply-To: <20200915091631.84707-1-damien.lemoal@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 15 Sep 2020 12:44:17 -0700
Message-ID: <CAOnJCU+5RqhOnLTkX0G7i0g3ZOr_iQzLTcbZDRkVRz=YixEUpA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix compilation warning
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_154430_255919_68238CBE 
X-CRM114-Status: GOOD (  19.85  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBTZXAgMTUsIDIwMjAgYXQgMjoxNiBBTSBEYW1pZW4gTGUgTW9hbCA8ZGFtaWVuLmxl
bW9hbEB3ZGMuY29tPiB3cm90ZToKPgo+IE1vdmUgdGhlIGRlY2xhcmF0aW9uIG9mIHB0X29wcyB1
bmRlciAiI2lmZGVmIGlDT05GSUdfTU1VIiB0byBhdm9pZCB0aGUKPiBjb21waWxhdGlvbiB3YXJu
aW5nOgo+Cj4gYXJjaC9yaXNjdi9tbS9pbml0LmM6NDQ6Mjg6IHdhcm5pbmc6IOKAmHB0X29wc+KA
mSBkZWZpbmVkIGJ1dCBub3QgdXNlZAo+IFstV3VudXNlZC12YXJpYWJsZV0KPiAgICA0NCB8IHN0
YXRpYyBzdHJ1Y3QgcHRfYWxsb2Nfb3BzIHB0X29wczsKPiAgICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF5+fn5+fgo+Cj4gd2l0aCBOTyBNTVUgYnVpbGRzIChlLmcuIG5vbW11X2sy
MTBfZGVmY29uZmlnKS4KPgoKVGhhbmtzIGZvciB0aGUgZml4LiBwdF9vcHMgd2FzIGFkZGVkIGFz
IGEgcGFydCBvZiBFRkkgc2VyaWVzLgpJIGFtIHBsYW5uaW5nIHRvIHNlbmQgdjggdG8gaW5jbHVk
ZSBzb21lIG1vcmUgZ2VuZXJpYyBFRkkgY2hhbmdlcy4KCkRvIHlvdSBtaW5kIGlmIEkganVzdCBp
bmNsdWRlIHRoaXMgZml4IGluIG15IHNlcmllcyA/Cgo+IFNpZ25lZC1vZmYtYnk6IERhbWllbiBM
ZSBNb2FsIDxkYW1pZW4ubGVtb2FsQHdkYy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvbW0vaW5p
dC5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jpc2N2
L21tL2luaXQuYwo+IGluZGV4IDMyZTcyNThkYTliYi4uYzg4OGM0NDcwYjM0IDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gKysrIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiBA
QCAtNDEsOCArNDEsNiBAQCBzdHJ1Y3QgcHRfYWxsb2Nfb3BzIHsKPiAgI2VuZGlmCj4gIH07Cj4K
PiAtc3RhdGljIHN0cnVjdCBwdF9hbGxvY19vcHMgcHRfb3BzOwo+IC0KPiAgc3RhdGljIHZvaWQg
X19pbml0IHpvbmVfc2l6ZXNfaW5pdCh2b2lkKQo+ICB7Cj4gICAgICAgICB1bnNpZ25lZCBsb25n
IG1heF96b25lX3BmbnNbTUFYX05SX1pPTkVTXSA9IHsgMCwgfTsKPiBAQCAtMjE0LDYgKzIxMiw4
IEBAIHZvaWQgX19pbml0IHNldHVwX2Jvb3RtZW0odm9pZCkKPiAgfQo+Cj4gICNpZmRlZiBDT05G
SUdfTU1VCj4gK3N0YXRpYyBzdHJ1Y3QgcHRfYWxsb2Nfb3BzIHB0X29wczsKPiArCj4gIHVuc2ln
bmVkIGxvbmcgdmFfcGFfb2Zmc2V0Owo+ICBFWFBPUlRfU1lNQk9MKHZhX3BhX29mZnNldCk7Cj4g
IHVuc2lnbmVkIGxvbmcgcGZuX2Jhc2U7Cj4gLS0KPiAyLjI2LjIKPgo+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKCgotLSAKUmVnYXJkcywK
QXRpc2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
