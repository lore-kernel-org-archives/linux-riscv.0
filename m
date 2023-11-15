Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B092C2BB3F
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 16:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FZwOcjIU2W0uJtbwLKpyCE/rMDlLkhdLKnnuWyekN88=; b=mG635ugzZstSZk
	YHb1xWMQtSSF525Hd5VkAR76A2osC5lzbPKpEoxgh635gkBI79QrGt1T5kdy5F4yudooFU684q21G
	YbI0bGf+xomYrTL0rvxGO7A7ngIAvSm3JZfHD15zZTJmjcFSowvhBbN1wD2OHBSobSKMrrPxmWxkp
	HqoKww7aecvS7oYo6mr1r3YxBsYzjsVghXP8ht7iT+DuI0fqQqw03Ff0k6PlAfrE0JPYFtobPtEpZ
	1ovIeeWcGCY8d/q/KCkGWoVfl05+xz7SU/SNZ4ig5OZERd2i/ODiAkDs6JlmCRZe2yCREnAvlL1nq
	Af4bVZnfApGwKqiP/Acg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Igl-001JAF-0b;
	Wed, 15 Nov 2023 16:24:27 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Igi-001J9P-2L
	for linux-riscv@lists.infradead.org;
	Wed, 15 Nov 2023 16:24:26 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6bd0e1b1890so5633199b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Nov 2023 08:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700065461; x=1700670261; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rm2s3ZZnh5AYNa/PtFkxzzQrA/071VVCNOg0IXiaNPw=;
        b=B1IhJKKpzQym+g7CkxnQIekl6ojl+2tdLK/Jbg5l29dqmRF7v1T084KKewy5hnQUsD
         yNh4IAylD7m7Cm33PXVVG0BgWEgk29JfqtwHbLaMgYGxDSlUdl2wh7Meh8ei3Bp2+/6L
         fuFRGFgi96pKh4sSpLH/yiUZcTYwjbhbyXGOJZruaSWaz5VDWk5x+YuloX3ocRpmhrXi
         S9wDwrexDXF0BETi7cutqXYimmSVt1hBlj2IlqFZQf4BxNfXd/o9Im8ChJf+L0h8oBuZ
         P2ug04atdKcPmFJKGWRHVOmPd+/zNpIQU8Gz3tevi/xd6J7Kp0TLlBMoV9Qh2tGTLnAI
         ohlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700065461; x=1700670261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rm2s3ZZnh5AYNa/PtFkxzzQrA/071VVCNOg0IXiaNPw=;
        b=VaF021TOGYxTN39CZ/HrzTd0NCu3oBj1F61nKHj8WgOiacl4IcQ+45INkaExEmJTev
         qXu0enVyzV2LbCR3qPdMzLP711TkaApSrjqU7NTVbqr0A0aKQomNEYE9YxJnKC/GE7HA
         TqDs8bfWsQAck2kauHO7+d49Mm2OvwEaZvEGRJ7EUnRi72j2dbB0V4Hu6IuH8ztx0WN/
         TGzE9Rh7HFQWp5lR8FoOTgz4/80iG+Rth0uowzRSABM/V+D338GyreWLri21RfpJpTx+
         ljbaSrHkwQCPPg0fayQvVif7GJk6Y2Dq4pWyWBoMko/DOOAv90PRgmcqa9mz9HDuDrTA
         PbXA==
X-Gm-Message-State: AOJu0Yx2PXldYc51ek54ywzVk52iDheDdDd5y312iY+sP3SlFifDIfU5
	bJhRigi60G/ZBHyrfH5VfiKQo8OD3bqd4CCb5ueDuA==
X-Google-Smtp-Source: AGHT+IEYqoGyBOYH2CRUEUDNMopPpnlzW8Jhu4m6FA70HrcOz9vMc3lEjSBBgyTkxcz58VzywgmUSpFDneJs6jg67/I=
X-Received: by 2002:a05:6a20:da82:b0:187:9392:cfdd with SMTP id
 iy2-20020a056a20da8200b001879392cfddmr1099674pzb.24.1700065461385; Wed, 15
 Nov 2023 08:24:21 -0800 (PST)
MIME-Version: 1.0
References: <20231115061811.10041-1-joshua.yeong@starfivetech.com>
 <CAK9=C2VXxNjKOq1XqQ9t6iVELdj2fFi85K77xNCOfdf3WRdy8w@mail.gmail.com> <f373645c-1e89-df76-e545-21bf0ba9ee8f@starfivetech.com>
In-Reply-To: <f373645c-1e89-df76-e545-21bf0ba9ee8f@starfivetech.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 15 Nov 2023 21:54:09 +0530
Message-ID: <CAK9=C2W3_LNjQkW0G5TypNW_=3sGOV8NMuYEwnq5Yj=RmgkE3A@mail.gmail.com>
Subject: Re: [PATCH 1/1] clocksource/timer-risc: Add riscv_clock_shutdown callback
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, leyfoon.tan@starfivetech.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_082424_792570_0587654B 
X-CRM114-Status: GOOD (  16.23  )
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

T24gV2VkLCBOb3YgMTUsIDIwMjMgYXQgMToyMuKAr1BNIEpvc2h1YSBZZW9uZwo8am9zaHVhLnll
b25nQHN0YXJmaXZldGVjaC5jb20+IHdyb3RlOgo+Cj4gSGkgQW51cCwKPgo+IE9uIDE1LU5vdi0y
MyAzOjAwIFBNLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gT24gV2VkLCBOb3YgMTUsIDIwMjMgYXQg
MTE6NDnigK9BTSBKb3NodWEgWWVvbmcKPiA+IDxqb3NodWEueWVvbmdAc3RhcmZpdmV0ZWNoLmNv
bT4gd3JvdGU6Cj4gPj4gQWRkIGNsb2Nrc291cmNlIGRldGFjaC9zaHV0ZG93biBjYWxsYmFjayB0
byBkaXNhYmxlIFJJU0MtViB0aW1lciBpbnRlcnJ1cHQgd2hlbgo+ID4+IHN3aXRjaGluZyBvdXQg
cmlzY3YgdGltZXIgYXMgY2xvY2sgc291cmNlCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBKb3No
dWEgWWVvbmcgPGpvc2h1YS55ZW9uZ0BzdGFyZml2ZXRlY2guY29tPgo+ID4+IC0tLQo+ID4+ICAg
ZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jIHwgNyArKysrKysrCj4gPj4gICAxIGZp
bGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jIGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1y
aXNjdi5jCj4gPj4gaW5kZXggZGEzMDcxYjM4N2ViLi41ODhhMDU0NTliNmEgMTAwNjQ0Cj4gPj4g
LS0tIGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jCj4gPj4gKysrIGIvZHJpdmVy
cy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jCj4gPj4gQEAgLTUwLDEyICs1MCwxOSBAQCBzdGF0
aWMgaW50IHJpc2N2X2Nsb2NrX25leHRfZXZlbnQodW5zaWduZWQgbG9uZyBkZWx0YSwKPiA+PiAg
ICAgICAgICByZXR1cm4gMDsKPiA+PiAgIH0KPiA+Pgo+ID4+ICtzdGF0aWMgaW50IHJpc2N2X2Ns
b2NrX3NodXRkb3duKHN0cnVjdCBjbG9ja19ldmVudF9kZXZpY2UgKmV2dCkKPiA+PiArewo+ID4+
ICsgICAgICAgc2JpX3NldF90aW1lcigtMSk7Cj4gPiBVc2UgcmlzY3ZfY2xvY2tfZXZlbnRfc3Rv
cCgpIGhlcmUuCj4gWW91IG1lYW4gcmVwbGFjaW5nIHJpc2N2X2Nsb2NrX3NodXRkb3duIGFzIHJp
c2N2X2Nsb2NrX2V2ZW50X3N0b3A/CgpJIG1lYW50IHJlcGxhY2luZyBzYmlfc2V0X3RpbWVyKCkg
d2l0aCByaXNjdl9jbG9ja19ldmVudF9zdG9wKCkuCgo+ID4KPiA+PiArICAgICAgIHJldHVybiAw
Owo+ID4+ICt9Cj4gPj4gKwo+ID4+ICAgc3RhdGljIHVuc2lnbmVkIGludCByaXNjdl9jbG9ja19l
dmVudF9pcnE7Cj4gPj4gICBzdGF0aWMgREVGSU5FX1BFUl9DUFUoc3RydWN0IGNsb2NrX2V2ZW50
X2RldmljZSwgcmlzY3ZfY2xvY2tfZXZlbnQpID0gewo+ID4+ICAgICAgICAgIC5uYW1lICAgICAg
ICAgICAgICAgICAgID0gInJpc2N2X3RpbWVyX2Nsb2NrZXZlbnQiLAo+ID4+ICAgICAgICAgIC5m
ZWF0dXJlcyAgICAgICAgICAgICAgID0gQ0xPQ0tfRVZUX0ZFQVRfT05FU0hPVCwKPiA+PiAgICAg
ICAgICAucmF0aW5nICAgICAgICAgICAgICAgICA9IDEwMCwKPiA+PiAgICAgICAgICAuc2V0X25l
eHRfZXZlbnQgICAgICAgICA9IHJpc2N2X2Nsb2NrX25leHRfZXZlbnQsCj4gPj4gKyAgICAgICAu
c2V0X3N0YXRlX3NodXRkb3duICAgICA9IHJpc2N2X2Nsb2NrX3NodXRkb3duLAo+ID4+ICAgfTsK
PiA+Pgo+ID4+ICAgLyoKPiA+PiAtLQo+ID4+IDIuMjUuMQo+ID4+Cj4gPiBSZWdhcmRzLAo+ID4g
QW51cAoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
