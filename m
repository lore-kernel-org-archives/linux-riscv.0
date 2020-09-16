Return-Path: <SRS0=kUFi=CZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD82C433E2
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2020 04:52:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A32820936
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2020 04:52:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eJe2a7Ah";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="m5HXytUQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A32820936
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W9dt0YWVTc2mUHpjYRYHnoGX4jRabPaKvHWAm3iOjfA=; b=eJe2a7AhF4m/RgX3r4718C9Qi
	qWeYHLIj/9pOg7b/ENCbVtKMCWY904ddWTUV4yMjBLa/8ag5ELbdgQnZCqodaGjsJo+wef5Jl3887
	xx6DaKaar4RdC4gqNH7qcAagSyLFqv8j2NF16eCzvQKNfhQMX5o/TAwnfUmijj7MhxaUw2HMTcTaV
	HG3+rP1BeDCXXYZpMhJdh90JgG16P11fTTJz5hsGLpqsHlUOrmu4HLHkSSUTPL/a3N+6S8xQU+5aC
	0FeZNwAwsWbMm/SYdLErwIhW4WtM8pu261PINbzd/NIE5QHJi1/knLf+B+kNhwoaVQUmJB6cbs8oA
	5aytcSn/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIPQu-0007Vo-Nn; Wed, 16 Sep 2020 04:52:40 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIPQr-0007VT-TU
 for linux-riscv@lists.infradead.org; Wed, 16 Sep 2020 04:52:39 +0000
Received: by mail-wm1-x342.google.com with SMTP id e17so1438394wme.0
 for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2020 21:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dkcYiJynCd1mlmFqZtNgEnXv4lav6zP42DDFwDpXCls=;
 b=m5HXytUQHgL2c4LQsIzs90+J8nXMOIkf3pOC3s7HXsuVnitRglTVc8utWxMtm4KeJP
 twUc8keux4JRQlUwx8s/LCxqbI7zYzowNX0621BmRTkFSConp34KzRj8RIM6lgAOatKu
 AK54GrufS3LUqMJ5EeOKHz+mVh/sH3tYr/vhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dkcYiJynCd1mlmFqZtNgEnXv4lav6zP42DDFwDpXCls=;
 b=ZRug+7m6nw6fdfj2iIOwnQNaNAj4CweyAs5sfAVMQkCQn2AYg7CrXhTvvGjgP0/5HG
 CVpbnJRK1N5J6ee5d50EQxlREXBJ20PetC55K4DyrG4HsFLKNEYPKx1dpwd7Lw+n7bAI
 hufOUONS6YoRbFnmd2JuKLfYNPNodhArWg9vYUXCtFRJ+GVuUHYFv8dVTi9R9u9zXO5H
 4oi6Km9EDQm8BnCXC6gDd8ND10LRWAvR8fGpJwa4tVemIhu0BJEKp61OyL8pdiRXFEp+
 X1+gnDtGUryPDh6/dqO3kvI4tE4eQVPVCaauBK1SKXLvgxeb4lx7tY5EvRuTLT1VN40+
 mxcg==
X-Gm-Message-State: AOAM532oPcsdh1ZpWK6OJLr8vMAu2TbyqWu7i3EGViBRHfT+5FWfbIIt
 lMK+E2+hB8QuzirCaVIetcjFGiS/v5JEV3xrXAiQoi6nkKaPXM8=
X-Google-Smtp-Source: ABdhPJyk4oYW1GeZLNjJTZlYjqId85h2xUmJO5ywSBKtyZ5tctuQ+X8JTcHHhp4N2hrVnRICysWJyFkY04hRscRurVY=
X-Received: by 2002:a1c:a988:: with SMTP id s130mr592008wme.31.1600231956142; 
 Tue, 15 Sep 2020 21:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200915091631.84707-1-damien.lemoal@wdc.com>
 <CAOnJCU+5RqhOnLTkX0G7i0g3ZOr_iQzLTcbZDRkVRz=YixEUpA@mail.gmail.com>
 <CY4PR04MB375179E27AE26DBD3ED0FF76E7210@CY4PR04MB3751.namprd04.prod.outlook.com>
In-Reply-To: <CY4PR04MB375179E27AE26DBD3ED0FF76E7210@CY4PR04MB3751.namprd04.prod.outlook.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 15 Sep 2020 21:52:25 -0700
Message-ID: <CAOnJCUKjEhd9HbxioLOn2k6Japbp3ThyFWCgx2H2+FZpeJfERQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix compilation warning
To: Damien Le Moal <Damien.LeMoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_005238_081232_ED2A4559 
X-CRM114-Status: GOOD (  27.79  )
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

T24gVHVlLCBTZXAgMTUsIDIwMjAgYXQgNjoyOSBQTSBEYW1pZW4gTGUgTW9hbCA8RGFtaWVuLkxl
TW9hbEB3ZGMuY29tPiB3cm90ZToKPgo+IE9uIDIwMjAvMDkvMTYgNDo0NCwgQXRpc2ggUGF0cmEg
d3JvdGU6Cj4gPiBPbiBUdWUsIFNlcCAxNSwgMjAyMCBhdCAyOjE2IEFNIERhbWllbiBMZSBNb2Fs
IDxkYW1pZW4ubGVtb2FsQHdkYy5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gTW92ZSB0aGUgZGVjbGFy
YXRpb24gb2YgcHRfb3BzIHVuZGVyICIjaWZkZWYgaUNPTkZJR19NTVUiIHRvIGF2b2lkIHRoZQo+
ID4+IGNvbXBpbGF0aW9uIHdhcm5pbmc6Cj4gPj4KPiA+PiBhcmNoL3Jpc2N2L21tL2luaXQuYzo0
NDoyODogd2FybmluZzog4oCYcHRfb3Bz4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkCj4gPj4gWy1X
dW51c2VkLXZhcmlhYmxlXQo+ID4+ICAgIDQ0IHwgc3RhdGljIHN0cnVjdCBwdF9hbGxvY19vcHMg
cHRfb3BzOwo+ID4+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+Cj4g
Pj4KPiA+PiB3aXRoIE5PIE1NVSBidWlsZHMgKGUuZy4gbm9tbXVfazIxMF9kZWZjb25maWcpLgo+
ID4+Cj4gPgo+ID4gVGhhbmtzIGZvciB0aGUgZml4LiBwdF9vcHMgd2FzIGFkZGVkIGFzIGEgcGFy
dCBvZiBFRkkgc2VyaWVzLgo+ID4gSSBhbSBwbGFubmluZyB0byBzZW5kIHY4IHRvIGluY2x1ZGUg
c29tZSBtb3JlIGdlbmVyaWMgRUZJIGNoYW5nZXMuCj4gPgo+ID4gRG8geW91IG1pbmQgaWYgSSBq
dXN0IGluY2x1ZGUgdGhpcyBmaXggaW4gbXkgc2VyaWVzID8KPgo+IFBsZWFzZSBmZWVsIGZyZWUg
dG8gaW50ZWdyYXRlL3NxdWFzaCB0aGlzIGNoYW5nZSBpbiB5b3VyIHNlcmllcy4gTm8gbmVlZCBm
b3IgYQo+IHNlcGFyYXRlIHBhdGNoIGZvciBqdXN0IHRoYXQuIEJ1dDogSWYgeW91ciBFRkkgc2Vy
aWVzIGlzIG5vdCBmaW5hbCwgd2hhdCBpcyBpdAo+IGRvaW5nIG9uIHRoZSBmb3ItbmV4dCBicmFu
Y2ggPz8/Cj4KPiBQYWxtZXIsCj4KPiBXaGF0IGlzIGdvaW5nIG9uIGhlcmUgPyBJZiBBdGlzaCBW
NyBzZXJpZXMgaGFzIHByb2JsZW1zIGFuZCBpcyBub3QgZmluYWwsIHdoeSBpcwo+IGl0IGFscmVh
ZHkgaW4gZm9yLW5leHQgPwo+CgpVRUZJIHN1cHBvcnQgaXMgZ29pbmcgdGhyb3VnaCBhIHNoYXJl
ZCB0cmVlIGJldHdlZW4gVUVGSSAmIFJJU0MtVi4gVGhlCnY3IHdhcyBzdXBwb3NlZCB0byBiZSB0
aGUgZmluYWwgdmVyc2lvbiBidXQKdGhlcmUgd2VyZSBmZXcgcGF0Y2hlcyBpbiBnZW5lcmljIEVG
SSBjb2RlIGxhc3Qgd2VlayBhbmQgQXJkIHN1Z2dlc3RlZAp0byByZWJhc2UgdGhlIFJJU0MtViBV
RUZJIHNlcmllcyBvbiB0b3Agb2YgaXQuCkhlcmUgaXMgdGhlIHRocmVhZC4KaHR0cHM6Ly93d3cu
c3Bpbmljcy5uZXQvbGlzdHMvbGludXgtZWZpL21zZzIwMjcyLmh0bWwKClRoYXQncyB3aHkgSSBh
bSBwbGFubmluZyB0byBzZW5kIGFub3RoZXIgc2VyaWVzIHdpdGggZmV3IG90aGVyIGltcHJvdmVt
ZW50cy4KCj4gPgo+ID4+IFNpZ25lZC1vZmYtYnk6IERhbWllbiBMZSBNb2FsIDxkYW1pZW4ubGVt
b2FsQHdkYy5jb20+Cj4gPj4gLS0tCj4gPj4gIGFyY2gvcmlzY3YvbW0vaW5pdC5jIHwgNCArKy0t
Cj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4g
Pj4KPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jpc2N2L21t
L2luaXQuYwo+ID4+IGluZGV4IDMyZTcyNThkYTliYi4uYzg4OGM0NDcwYjM0IDEwMDY0NAo+ID4+
IC0tLSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gPj4gKysrIGIvYXJjaC9yaXNjdi9tbS9pbml0
LmMKPiA+PiBAQCAtNDEsOCArNDEsNiBAQCBzdHJ1Y3QgcHRfYWxsb2Nfb3BzIHsKPiA+PiAgI2Vu
ZGlmCj4gPj4gIH07Cj4gPj4KPiA+PiAtc3RhdGljIHN0cnVjdCBwdF9hbGxvY19vcHMgcHRfb3Bz
Owo+ID4+IC0KPiA+PiAgc3RhdGljIHZvaWQgX19pbml0IHpvbmVfc2l6ZXNfaW5pdCh2b2lkKQo+
ID4+ICB7Cj4gPj4gICAgICAgICB1bnNpZ25lZCBsb25nIG1heF96b25lX3BmbnNbTUFYX05SX1pP
TkVTXSA9IHsgMCwgfTsKPiA+PiBAQCAtMjE0LDYgKzIxMiw4IEBAIHZvaWQgX19pbml0IHNldHVw
X2Jvb3RtZW0odm9pZCkKPiA+PiAgfQo+ID4+Cj4gPj4gICNpZmRlZiBDT05GSUdfTU1VCj4gPj4g
K3N0YXRpYyBzdHJ1Y3QgcHRfYWxsb2Nfb3BzIHB0X29wczsKPiA+PiArCj4gPj4gIHVuc2lnbmVk
IGxvbmcgdmFfcGFfb2Zmc2V0Owo+ID4+ICBFWFBPUlRfU1lNQk9MKHZhX3BhX29mZnNldCk7Cj4g
Pj4gIHVuc2lnbmVkIGxvbmcgcGZuX2Jhc2U7Cj4gPj4gLS0KPiA+PiAyLjI2LjIKPiA+Pgo+ID4+
Cj4gPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+
PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCj4gPj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo+ID4KPiA+Cj4gPgo+Cj4KPiAtLQo+IERhbWllbiBMZSBNb2FsCj4gV2VzdGVy
biBEaWdpdGFsIFJlc2VhcmNoCgoKCi0tIApSZWdhcmRzLApBdGlzaAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
