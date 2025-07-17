Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2964EC83F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 05:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r9vaUHfJEobINCviCnxzCvHjvzfOhqwsdkVtEO+kT2Q=; b=dR1L5BowjJykU3
	1KlSPMZchuycNsa5MwN3AGNg/A/tPdSNN4V3UUn+njk+7tT3zZdHmuCwejKTbGAQ5avhEDIqgVxxY
	XD6G7oohjEF1g2QLaj7A5kADh16WYgCBB2Lm78GqvV4XAll4hTCVmqD902mnUGS4qF+8cpfNmiWuH
	hcChk70TxweltJJFEzb9F3f7UcRAGEP+8j1M8mTBcOgLNeUuy+3xgdDGJ04iIvykG9Wl1Q4TOCMOy
	Bjk//BMMdrnjgFQrUpysfCWI9ZLHyzxzLhSlBZU4+4dAIjnCQ3exm6FTDiIbLoL+7gtlFXYWlhIdG
	cN/NmL40Ok8OmWo4OTrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucGxh-00000009DC0-216j;
	Thu, 17 Jul 2025 05:15:17 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucGxe-00000009DBe-24l1
	for linux-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 05:15:15 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-86d0c598433so19306439f.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Jul 2025 22:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752729313; x=1753334113; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVRqC63NQkzRhsguny4WRGvreqzSucOKM3zJQeUVsOE=;
        b=g7ZwmmZCo5YejtkWC9Q4tKanPLJ8N2+2w6z0kLzy+ix/H77f2h5Sf3KaWrM7MJWNRj
         4abZGxHzb+EJEGykhhScuer8fNmATBPS0OhKshZRx6nLfmV6tHY8RgltPmYB2Os2hdZT
         8Gk0ty200v6YU2TCky5QJ9H3UCpd97m8GZCNzF1XubsKrfdZPKKJa0LVX784HKuSsMDW
         CBQr7MEtIHVWUeRB7qL1a8JFwa0GqrvIJcT9SoyvooEvsWOaB3mCUao9R9MTNEUUPJ6L
         XgcoYdEPXgKPIvsueSPJw4AN2/73luXTJrnNGo8u/BaVMawkQL4MOW9HJOTUiJmJcha/
         Dw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752729313; x=1753334113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RVRqC63NQkzRhsguny4WRGvreqzSucOKM3zJQeUVsOE=;
        b=UTQvNt4Wvrvr6KRB/eNshYrILhDTQn16+FyW8VST0XDjhXFyxjWj6amqH7tARM0WXb
         vQFNA2LPT0x5TqF0YJLzP+NrZ7/rglBoG516GWt9s4okBR0M/WPy28+NO8red74pZKZC
         b8dm0KfrYBlQ42hnatsTWRDAMabbYcYsANPbieFEUVaYYSVC0hjVfq2jIKHsQiYwCUNK
         l2TA3Hqb1ke2ci3MiGlaznKBq1MyNvUMbFNZRVitWkIScpH7Kz8AEuNvPprwBKZWWUKF
         cvUKtz6tzTUiIQ3y/NTUpqbYnhHUmeCqIYQnRC3HucKsRDceUEMNd+rkoWuvFdzvdkA9
         PKxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi5boZv92Ay3jeENOt8EddQQ8q66EJ82BCMGRpoCnIgY0k7brvl5MR6tSt9wk2ftBVkFNZX5CZIyGVAg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxeAt8uoWzA09GkDQHzh9TO0TcvcinKkgJkj37i75FluPUMO1ID
	pGvpEW7it41sK0kj56uMDpO3vpTlgKXY+feNXL5hwlial3Aqu19Neth74pPetleEj88ugmhaZFp
	12yMwA5uhrXqqxoYyEx/4qWL+3awoDhXQ6YljySslFQ==
X-Gm-Gg: ASbGncvZI4u8ZiB5L+JB91IgSwpuuMvOEbPqHzlJK/j0SZfgXCK74qgv4Y0cGAtcj3U
	c8H5HUbDWJ5qDq9bFxTwog0K+lIE+wf5zg37Y2tdmO6jx+eFrZ0OVgi0+jzA5DGE8+/USNxwo4y
	SjiE5ceUIegFdsQ9Bpn9B+27fjSSx/gXQHKT+FnCnqnYhw2lNZyfXriBeVMVoA0M4mDr9GqJEg6
	ChTlw==
X-Google-Smtp-Source: AGHT+IHtwxqogAVRzQ8j1+KbbVuIoYbtsJ1fOLV0VDFJKcFWTOFvEqs94CnUExP9Tm6R/KKSaLyay9LOuriDebGeu/I=
X-Received: by 2002:a05:6602:4144:b0:879:49e9:5156 with SMTP id
 ca18e2360f4ac-879c293fbf9mr662815839f.9.1752729312911; Wed, 16 Jul 2025
 22:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250709025516.28051-1-nick.hu@sifive.com> <20250709025516.28051-2-nick.hu@sifive.com>
In-Reply-To: <20250709025516.28051-2-nick.hu@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 17 Jul 2025 10:45:01 +0530
X-Gm-Features: Ac12FXwk4EceTVPyJlthvo-soULa5ZkAI9paRpA2zqEiUTLhOp7I7S7jrgHdYxU
Message-ID: <CAAhSdy2J6C8LvBCB0LKd2np47qBQ2EFXXnDvb2OjYKqSOF7EbQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] irqchip/riscv-imsic: Restore the IMSIC registers
To: Nick Hu <nick.hu@sifive.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_221514_777469_3E328D39 
X-CRM114-Status: GOOD (  21.90  )
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

T24gV2VkLCBKdWwgOSwgMjAyNSBhdCA4OjI24oCvQU0gTmljayBIdSA8bmljay5odUBzaWZpdmUu
Y29tPiB3cm90ZToKPgo+IFdoZW4gdGhlIHN5c3RlbSB3b2tlbiB1cCBmcm9tIHRoZSBsb3cgcG93
ZXIgc3RhdGUsIHRoZSBJTVNJQyBtaWdodCBiZSBpbgo+IHRoZSByZXNldCBzdGF0ZS4gVGhlcmVm
b3JlIGFkZGluZyB0aGUgQ1BVIFBNIGNhbGxiYWNrcyB0byByZXN0b3JlIHRoZQo+IElNU0lDIHJl
Z2lzdGVyIHdoZW4gdGhlIGNwdSByZXN1bWUgZnJvbSB0aGUgbG93IHBvd2VyIHN0YXRlLgo+Cj4g
U2lnbmVkLW9mZi1ieTogTmljayBIdSA8bmljay5odUBzaWZpdmUuY29tPgo+IFJldmlld2VkLWJ5
OiBZb25nLVh1YW4gV2FuZyA8eW9uZ3h1YW4ud2FuZ0BzaWZpdmUuY29tPgo+IFJldmlld2VkLWJ5
OiBDeWFuIFlhbmcgPGN5YW4ueWFuZ0BzaWZpdmUuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2lycWNo
aXAvaXJxLXJpc2N2LWltc2ljLWVhcmx5LmMgfCA0MSArKysrKysrKysrKysrKysrKysrKy0tLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtZWFybHkuYyBiL2Ry
aXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtZWFybHkuYwo+IGluZGV4IGQ5YWU4NzgwODY1
MS4uZjY0ZDlhMDY0MmJiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3Yt
aW1zaWMtZWFybHkuYwo+ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtZWFy
bHkuYwo+IEBAIC03LDYgKzcsNyBAQAo+ICAjZGVmaW5lIHByX2ZtdChmbXQpICJyaXNjdi1pbXNp
YzogIiBmbXQKPiAgI2luY2x1ZGUgPGxpbnV4L2FjcGkuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2Nw
dS5oPgo+ICsjaW5jbHVkZSA8bGludXgvY3B1X3BtLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9pbnRl
cnJ1cHQuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2lvLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9pcnEu
aD4KPiBAQCAtMTA5LDE0ICsxMTAsOCBAQCBzdGF0aWMgdm9pZCBpbXNpY19oYW5kbGVfaXJxKHN0
cnVjdCBpcnFfZGVzYyAqZGVzYykKPiAgICAgICAgIGNoYWluZWRfaXJxX2V4aXQoY2hpcCwgZGVz
Yyk7Cj4gIH0KPgo+IC1zdGF0aWMgaW50IGltc2ljX3N0YXJ0aW5nX2NwdSh1bnNpZ25lZCBpbnQg
Y3B1KQo+ICtzdGF0aWMgdm9pZCBpbXNpY19yZXN0b3JlKHZvaWQpCj4gIHsKPiAtICAgICAgIC8q
IE1hcmsgcGVyLUNQVSBJTVNJQyBzdGF0ZSBhcyBvbmxpbmUgKi8KPiAtICAgICAgIGltc2ljX3N0
YXRlX29ubGluZSgpOwo+IC0KPiAtICAgICAgIC8qIEVuYWJsZSBwZXItQ1BVIHBhcmVudCBpbnRl
cnJ1cHQgKi8KPiAtICAgICAgIGVuYWJsZV9wZXJjcHVfaXJxKGltc2ljX3BhcmVudF9pcnEsIGly
cV9nZXRfdHJpZ2dlcl90eXBlKGltc2ljX3BhcmVudF9pcnEpKTsKPiAtCj4gICAgICAgICAvKiBT
ZXR1cCBJUElzICovCj4gICAgICAgICBpbXNpY19pcGlfc3RhcnRpbmdfY3B1KCk7Cj4KPiBAQCAt
MTI4LDYgKzEyMywxOSBAQCBzdGF0aWMgaW50IGltc2ljX3N0YXJ0aW5nX2NwdSh1bnNpZ25lZCBp
bnQgY3B1KQo+Cj4gICAgICAgICAvKiBFbmFibGUgbG9jYWwgaW50ZXJydXB0IGRlbGl2ZXJ5ICov
Cj4gICAgICAgICBpbXNpY19sb2NhbF9kZWxpdmVyeSh0cnVlKTsKPiArfQo+ICsKPiArc3RhdGlj
IGludCBpbXNpY19zdGFydGluZ19jcHUodW5zaWduZWQgaW50IGNwdSkKPiArewo+ICsgICAgICAg
LyogTWFyayBwZXItQ1BVIElNU0lDIHN0YXRlIGFzIG9ubGluZSAqLwo+ICsgICAgICAgaW1zaWNf
c3RhdGVfb25saW5lKCk7Cj4gKwo+ICsgICAgICAgLyogRW5hYmxlIHBlci1DUFUgcGFyZW50IGlu
dGVycnVwdCAqLwo+ICsgICAgICAgZW5hYmxlX3BlcmNwdV9pcnEoaW1zaWNfcGFyZW50X2lycSwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgIGlycV9nZXRfdHJpZ2dlcl90eXBlKGltc2ljX3Bh
cmVudF9pcnEpKTsKPiArCj4gKyAgICAgICAvKiBSZXN0b3JlIHRoZSBpbXNpYyByZWcgKi8KPiAr
ICAgICAgIGltc2ljX3Jlc3RvcmUoKTsKPgo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPiBAQCAt
MTQzLDYgKzE1MSwyMyBAQCBzdGF0aWMgaW50IGltc2ljX2R5aW5nX2NwdSh1bnNpZ25lZCBpbnQg
Y3B1KQo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+ICtzdGF0aWMgaW50IGltc2ljX25vdGlm
aWVyKHN0cnVjdCBub3RpZmllcl9ibG9jayAqc2VsZiwgdW5zaWduZWQgbG9uZyBjbWQsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICB2b2lkICp2KQoKcy9pbXNpY19ub3RpZmllci9pbXNpY19w
bV9ub3RpZmllci8KClRoZSAidm9pZCAqdiIgcGFyYW1ldGVyIGNhbiBiZSBvbiB0aGUgc2FtZSBs
aW5lIGFzIGZ1bmN0aW9uIGRlY2xhcmF0aW9uLgoKPiArewo+ICsgICAgICAgc3dpdGNoIChjbWQp
IHsKPiArICAgICAgIGNhc2UgQ1BVX1BNX0VYSVQ6Cj4gKyAgICAgICAgICAgICAgIC8qIFJlc3Rv
cmUgdGhlIGltc2ljIHJlZyAqLwo+ICsgICAgICAgICAgICAgICBpbXNpY19yZXN0b3JlKCk7Cj4g
KyAgICAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIHJldHVybiBO
T1RJRllfT0s7Cj4gK30KPiArCj4gK3N0YXRpYyBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgaW1zaWNf
bm90aWZpZXJfYmxvY2sgPSB7CgpzL2ltc2ljX25vdGlmaWVyX2Jsb2NrL2ltc2ljX3BtX25vdGlm
aWVyX2Jsb2NrLwoKPiArICAgICAgIC5ub3RpZmllcl9jYWxsID0gaW1zaWNfbm90aWZpZXIsCj4g
K307Cj4gKwo+ICBzdGF0aWMgaW50IF9faW5pdCBpbXNpY19lYXJseV9wcm9iZShzdHJ1Y3QgZndu
b2RlX2hhbmRsZSAqZndub2RlKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgaXJxX2RvbWFpbiAqZG9t
YWluOwo+IEBAIC0xODAsNyArMjA1LDcgQEAgc3RhdGljIGludCBfX2luaXQgaW1zaWNfZWFybHlf
cHJvYmUoc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSkKPiAgICAgICAgIGNwdWhwX3NldHVw
X3N0YXRlKENQVUhQX0FQX0lSUV9SSVNDVl9JTVNJQ19TVEFSVElORywgImlycWNoaXAvcmlzY3Yv
aW1zaWM6c3RhcnRpbmciLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgaW1zaWNfc3RhcnRp
bmdfY3B1LCBpbXNpY19keWluZ19jcHUpOwo+Cj4gLSAgICAgICByZXR1cm4gMDsKPiArICAgICAg
IHJldHVybiBjcHVfcG1fcmVnaXN0ZXJfbm90aWZpZXIoJmltc2ljX25vdGlmaWVyX2Jsb2NrKTsK
PiAgfQo+Cj4gIHN0YXRpYyBpbnQgX19pbml0IGltc2ljX2Vhcmx5X2R0X2luaXQoc3RydWN0IGRl
dmljZV9ub2RlICpub2RlLCBzdHJ1Y3QgZGV2aWNlX25vZGUgKnBhcmVudCkKPiAtLQo+IDIuMTcu
MQo+CgpPdGhlcndpc2UsIHRoaXMgbG9va3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBBbnVw
IFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
