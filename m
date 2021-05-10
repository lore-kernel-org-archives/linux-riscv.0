Return-Path: <SRS0=SpZ8=KF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5EDEC43461
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 11:50:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4741B611C2
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 11:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4741B611C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jyS2m0tbYImV3kQIekJYgOS781hxbgITjOeF5B2RQhM=; b=paavO2FvnYJuGfRoIJ/g0S2Lx
	hdyZ7GoIMpz6f+pp7OKn62jcuiiotCA1S3c91pG3Ji5cb4ZCaRTsC16XXpt2cxGFv61f4/e0aox2n
	lcWumkLO8vbF/9C6WbR1v4PvmTwGr4bX2EGWYs1HYogBaVKeqLOA+7iym7uH2Dp2PIaYeq7mN8SM0
	dRA+mww0ZUwXb+VhMr/inxq8phkEsIwrPIOHKvhtFnjk1pAnp9VqwRmA5V6oXFL88U/4xCC4IimZP
	EJdaI/2vx8I31b/ODz+t5R2/ewqNa2pAE4XF6vb6zeYu2T4++J4rHGAoXwcuH/n4AIsrhhIj1Dt84
	F98trWQBg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg4Qp-00E92M-DE; Mon, 10 May 2021 11:50:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3xE-00E3uK-Ut; Mon, 10 May 2021 11:20:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=nNazoQW0wQFkJyz3CCTQq2cb9JpYNJ6yU8+6sRjnKGQ=; b=dwYKo0hhDGnhN5/twUKX0b+EeP
 5syEXQX4BjsTn6S0pcLEUbB0NLPHmCAA7zCHj6oBZLKYg1gDtlQgx1lhfp+K0SmE2mPUcEs5WO7l+
 pTfcEEhMhZ/8gdlkwIWjbcy9L2Vx5XqGFlpxAT/+YjpmSRNGRHzzTIvxHKeNQHntNj+JsSeNlTeu6
 GvLx1PgbtA8IVSuVh3ll1QfaVaC99PphtU4RsJXLO4DOYDUJY60toKlvCJ/klvTa2IZbythLxC3na
 xG+BOCsS4FCg0ttx71is3z0plIwe86WQUMbdg1qVi6RZHCtak2ZfJf1RVKQ8HrfcG047m+TaqpLOk
 GnYVRE4g==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3xC-008bm6-21; Mon, 10 May 2021 11:20:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC8EA6101E;
 Mon, 10 May 2021 11:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620645601;
 bh=W7iAKST7BRDMlEttXNNjJ33EX76A4qp8I6GEgdSMv7U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gmDmb0dM5IcZQ9rSlubjtF+K7WR5CTuBYzK7hGG8NgJ6VoZl1xWTpOcwkH/5/0zA/
 vlx1VxEGYzpDqoIrEOS4Gq4vleDywsH/Tbkz7KjwQOxa0gHoTz3ZfhQBobu6oYwUNn
 Apktwvurhr0XmVvzqYbUbTW3FMnBkgNdhIrbGi6F2SzZTvdCwG1IcEdUG7Tg53VOjZ
 rsHYuTEPmzH2qPOyCxJC2wx/q7V+K8nhKe4JHOwCkQGI9ADck3Kw17WLNRkmbFOBip
 a9pcqsOJVVBc05NJGVPFoJfSO03eP8zjvIV4wRYaZYLrBIVfbDQLgQs1bXlcp7w7lK
 9KVTRb7Ve04dg==
Date: Mon, 10 May 2021 13:19:50 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 alsa-devel@alsa-project.org, coresight@lists.linaro.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-wired-lan@lists.osuosl.org, keyrings@vger.kernel.org,
 kvm@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fpga@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sgx@vger.kernel.org, linux-usb@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, netdev@vger.kernel.org,
 rcu@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 00/53] Get rid of UTF-8 chars that can be mapped as ASCII
Message-ID: <20210510131950.063f0608@coco.lan>
In-Reply-To: <c4479ced-f4d8-1a1e-ee54-9abc55344187@leemhuis.info>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <c4479ced-f4d8-1a1e-ee54-9abc55344187@leemhuis.info>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_042002_142420_AE366997 
X-CRM114-Status: GOOD (  15.76  )
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

RW0gTW9uLCAxMCBNYXkgMjAyMSAxMjo1Mjo0NCArMDIwMApUaG9yc3RlbiBMZWVtaHVpcyA8bGlu
dXhAbGVlbWh1aXMuaW5mbz4gZXNjcmV2ZXU6Cgo+IE9uIDEwLjA1LjIxIDEyOjI2LCBNYXVybyBD
YXJ2YWxobyBDaGVoYWIgd3JvdGU6Cj4gPgo+ID4gQXMgTGludXggZGV2ZWxvcGVycyBhcmUgYWxs
IGFyb3VuZCB0aGUgZ2xvYmUsIGFuZCBub3QgZXZlcnlib2R5IGhhcyBVVEYtOAo+ID4gYXMgdGhl
aXIgZGVmYXVsdCBjaGFyc2V0LCBiZXR0ZXIgdG8gdXNlIFVURi04IG9ubHkgb24gY2FzZXMgd2hl
cmUgaXQgaXMgcmVhbGx5Cj4gPiBuZWVkZWQuCj4gPiBb4oCmXQo+ID4gVGhlIHJlbWFpbmluZyBw
YXRjaGVzIG9uIHNlcmllcyBhZGRyZXNzIHN1Y2ggY2FzZXMgb24gKi5yc3QgZmlsZXMgYW5kIAo+
ID4gaW5zaWRlIHRoZSBEb2N1bWVudGF0aW9uL0FCSSwgdXNpbmcgdGhpcyBwZXJsIG1hcCB0YWJs
ZSBpbiBvcmRlciB0byBkbyB0aGUKPiA+IGNoYXJzZXQgY29udmVyc2lvbjoKPiA+IAo+ID4gbXkg
JWNoYXJfbWFwID0gKAo+ID4gW+KApl0KPiA+IAkweDIwMTMgPT4gJy0nLAkJIyBFTiBEQVNICj4g
PiAJMHgyMDE0ID0+ICctJywJCSMgRU0gREFTSCAgCgoKPiBJIG1pZ2h0IGJlIHBlcmZvcm1pbmcg
YmlrZSBzaGVkZGluZyBoZXJlLCBidXQgd291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvCj4gcmVwbGFj
ZSB0aG9zZSB0d28gd2l0aCAiLS0iLCBhcyBleHBsYWluZWQgaW4KPiBodHRwczovL2VuLndpa2lw
ZWRpYS5vcmcvd2lraS9EYXNoI0FwcHJveGltYXRpbmdfdGhlX2VtX2Rhc2hfd2l0aF90d29fb3Jf
dGhyZWVfaHlwaGVucwo+IAo+IEZvciBFTSBEQVNIIHRoZXJlIHNlZW1zIHRvIGJlIGV2ZW4gIi0t
LSIsIGJ1dCBJJ2Qgc2F5IHRoYXQgaXMgYSBiaXQgdG9vCj4gbXVjaC4KClllYWgsIHdlIGNhbiBk
bywgaW5zdGVhZDoKCiAJMHgyMDEzID0+ICctLScsCQkjIEVOIERBU0gKIAkweDIwMTQgPT4gJy0t
LScsCSMgRU0gREFTSCAgCgpJIHdhcyBhY3R1YWxseSBpbiBkb3VidCBhYm91dCB0aG9zZSA7LSkK
CkJ0dywgd2hlbiBwcm9kdWNpbmcgSFRNTCBkb2N1bWVudGF0aW9uLCAgU3BoaW54IHNob3VsZCBj
b252ZXJ0OgoJLS0gaW50byBFTiBEQVNICmFuZDoKCS0tLSBpbnRvIEVNIERBU0gKClNvLCB0aGUg
cmVzdWx0aW5nIGh0bWwgd2lsbCBiZSBpZGVudGljYWwuCgo+IE9yIGRvIHlvdSBmZWFyIHRoZSBl
eHRyYSB3b3JrIGFzIHNvbWUgbGluZXMgdGhlbiBtaWdodCBicmVhayB0aGUKPiA4MC1jaGFyYWN0
ZXIgbGltaXQgdGhlbj8KCk5vLCBJIHN1c3BlY3QgdGhhdCB0aGUgbGluZSBzaXplIHdvbid0IGJl
IGFuIGlzc3VlLiBTb21lIGNhcmUgc2hvdWxkCnRha2VuIHdoZW4gRU4gREFTSCBhbmQgRU0gREFT
SCBhcmUgdXNlZCBpbnNpZGUgdGFibGVzLgoKVGhhbmtzLApNYXVybwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
