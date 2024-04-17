Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCB4C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 01:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=JiHfwJ98DeSANFkJcBv5PGaHSJlXJRaFa+JUB7Q/qLQ=; b=RHG10EbUA0Ng/Y0ZqWysWbN6oI
	rKHjW+ioJa44EairfwSyqliDtdEyerIfX70BV/mf4Frok6lrdgBDwE6YVqOFNToGcoIJlTPj93t44
	xhcBiXNwGRO4uGiRoiEtm54YIeccbBh1Br/j+vBpmaLvfQueypwzd5RdMjhnvauX6VuV4Flz7z3L2
	dfaMny4XhN9mR9NYQdEFiLIZVZ6/c6lYThYe7JwfMl0vZKVR1PyMSTyiFP4VLl+bphpeC8kPOMrf/
	Ly1riNDAZL4KlqfjNx+YH/JDhz8JX85jBHX+d/eVFdTaUjbvvZENmT2aGESoZpzKbuvoJgpPJIqkI
	liICw/TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwuQv-0000000EPOv-2SKr;
	Wed, 17 Apr 2024 01:49:57 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwuQs-0000000EPNl-49HS
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 01:49:56 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-5e4613f2b56so3340906a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 18:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1713318592; x=1713923392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1qALZDphy9R4qs652P6WCNunAjFthlKkxzdNdTmcrvs=;
        b=K1fJyhpWi+pRcdqzqOnTFqlDZJnjXClJOtuyCtfFmudenQlwzRW5WgjXGUaT/lm3R/
         fct3x/fs8ajUHUH9jn+bLLSfUkxcfmlrjsMZY7ptz0HOWu4xgZhxJwbfkISYgEcCP9EP
         H7/S8294RxrqUtccZo2ZIiWAAo9LY9t1mpF9A8E9WyZN/rnS+lGnRmtJLJVBldQ4BYGb
         Unlp2PtQ+fhoqq+QLd/KcbqBBjLYH9kQrYhA9plPcJnoCfkLBSyYgkhVvi+APTXFDF0b
         82HR6m1p46z5tc3Plmk18eEHlojW09UcChBcWtN7/eZatBWBQsymoo/u0EGyOg/YgoNL
         4C+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713318592; x=1713923392;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qALZDphy9R4qs652P6WCNunAjFthlKkxzdNdTmcrvs=;
        b=Y0szZcKQJukwBOwOcjwxZp4Oisg1A7DsspbmlCfRTz4DUCp3/51kGkfks5DmVOH7y8
         GYBrx471UcGc34zDBoLDaAWCLKuZymE2iVIkRjbIUSH438Nqm9obLbkTpHDbJjfzXb9Y
         4geYVYzC+P2KWannUmBlfX811fzcSJuXJy8G/mtlB+1WJ0S9rGcla2v/1Dxs0zBQ3rlm
         oJBqUd1VclxvKrdB7gvE7W63T3d54s3gocttRrM8dQX9ci+/auqJ9BXSnKiYTxOAjFfm
         EVFbjP5ll8BbTjYjm4ctsv9ncafMZ4N9BNPj3QPQJiLqVjpUclwhcYR5AnZtUhHDAbXj
         jmkg==
X-Forwarded-Encrypted: i=1; AJvYcCVSj/tOpS/pRwoDe+X1FIeXZUb2Vh0llk4RkJPMe0DmGKonzEdmelLO7hOAx/mLOcpUd6Fa6ZnqMMRnc0VItBUk/6J3JdokD+nRYaXOKfoq
X-Gm-Message-State: AOJu0YzxqbPDxRIEfNtzJsR8NjtCrN3quahJ/67dUAVkOrT8zf4tDuSE
	ATU63HhZwqpSUgC70AiQHVGIoqMPYlWvj2EsS8PaRbOK39V7m1+aQiW3grLRVaY=
X-Google-Smtp-Source: AGHT+IHdS+vBg2EX+ZidcrjDuLNyRMWoghVyRqSbIb4Cge8joJNnr3c+J4X31DWTesfrNIWIXrEaxA==
X-Received: by 2002:a05:6a21:3416:b0:1aa:5b06:315d with SMTP id yn22-20020a056a21341600b001aa5b06315dmr2672869pzb.7.1713318592341;
        Tue, 16 Apr 2024 18:49:52 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id s1-20020a17090aba0100b002a7b1c7db84sm268670pjr.2.2024.04.16.18.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 18:49:51 -0700 (PDT)
Date: Tue, 16 Apr 2024 18:49:51 -0700 (PDT)
X-Google-Original-Date: Tue, 16 Apr 2024 18:49:21 PDT (-0700)
Subject: Re: [PATCH] clocksource/drivers/timer-riscv: Drop extra CSR write
In-Reply-To: <CAK9=C2Vsq0iN5FW=zC7+2GHe115TPJOEEPcDCLs_40yBGpbVdw@mail.gmail.com>
CC: samuel.holland@sifive.com, daniel.lezcano@linaro.org, tglx@linutronix.de,
  aou@eecs.berkeley.edu, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: apatel@ventanamicro.com
Message-ID: <mhng-3a5fcdd0-0bf4-45d3-aa7d-fffddd852288@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_184955_060160_EBED37B6 
X-CRM114-Status: GOOD (  20.00  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAxMyBNYXIgMjAyNCAwOTo1NjozNCBQRFQgKC0wNzAwKSwgYXBhdGVsQHZlbnRhbmFt
aWNyby5jb20gd3JvdGU6Cj4gT24gV2VkLCBNYXIgMTMsIDIwMjQgYXQgMTowM+KAr0FNIFNhbXVl
bCBIb2xsYW5kCj4gPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+Pgo+PiBPbiBy
aXNjdjMyLCB0aGUgdGltZSBjb21wYXJhdG9yIHZhbHVlIGlzIHNwbGl0IGFjcm9zcyB0d28gQ1NS
cy4gV2Ugd3JpdGUKPj4gYm90aCB3aGVuIHN0b3BwaW5nIHRoZSB0aW1lciwgYnV0IHJlYWxpc3Rp
Y2FsbHkgdGhlIHRpbWUgaXMganVzdCBhcwo+PiB1bmxpa2VseSB0byByZWFjaCAweGZmZmZmZmZm
MDAwMDAwMDAgYXMgMHhmZmZmZmZmZmZmZmZmZmZmLCBzbyB0aGVyZSBpcwo+PiBubyBuZWVkIHRv
IHdyaXRlIHRoZSBsb3cgQ1NSLgo+Cj4gRXZlbiB0aG91Z2ggdW5saWtlbHksIHRoZXJlIGlzIHN0
aWxsIGEgdGhlb3JldGljYWwgcG9zc2liaWxpdHkgb2YKPiBjb3VudGVyIHJlYWNoaW5nIHZhbHVl
IDB4ZmZmZmZmZmYwMDAwMDAwMC4KCkkgZ3Vlc3MgdGhhdCBkZXBlbmRzIG9uIHRoZSB0aW1lYmFz
ZSBmcmVxdWVuY3ksIGJ1dCBpZiBteSBtYXRoIGlzIHJpZ2h0IAp0aGVuIHdlJ3ZlIGdvdCBzb21l
IHRpbWVycyB0aGF0IHdpbGwgb3ZlcmZsb3cgYSAzMi1iaXQgY291bnRlciBpbiAxMCAKbWludXRl
cyAtLSB0YWtlIHRoYXQgd2l0aCBhIGdyYWluIG9mIHNhbHQgYXMgdGhleSdyZSBhbGwgNjQtYml0
IHN5c3RlbXMgCih3ZSBkb24ndCBoYXZlIGFueSAzMi1iaXQgRFRzIHVwc3RyZWFtPyksIGJ1dCBp
dCBzdGlsbCBzZWVtcyBwbGF1c2libGUgCmZvciAzMi1iaXQgb3ZlcmZsb3dzIHRvIGhhcHBlbiBo
ZXJlIG9uIHJlYWwgc3lzdGVtcy4KCj4gVGhlIGdvb2QgdGhpbmcgYWJvdXQgdmFsdWUgMHhmZmZm
ZmZmZmZmZmZmZmZmIGlzIHRoYXQgdGhlIGNvdW50ZXIgd2lsbAo+IGltbWVkaWF0ZWx5IHdyYXAg
YXJvdW5kIGFmdGVyIHJlYWNoaW5nIGl0LgoKSSdtIG5vdCBzdXJlIGhvdyB0aGF0J3MgZ29vZD8g
IEx1Y2tpbHkgd2UndmUgZ290IH4xMDAsMDAwIHllYXJzIHRvIApmaWd1cmUgb3V0LCBldmVuIG9u
IHRoZXNlIHN5c3RlbXMgd2l0aCBwcmV0dHkgZmFzdCB0aW1lcnMgOykKCj4gUmVnYXJkcywKPiBB
bnVwCj4KPgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxh
bmRAc2lmaXZlLmNvbT4KPj4gLS0tCj4+Cj4+ICBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJp
c2N2LmMgfCAzICsrLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNj
di5jIGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jCj4+IGluZGV4IGU2NmRjYmQ2
NjU2Ni4uZWFhZjAxZjNjMzRiIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3Rp
bWVyLXJpc2N2LmMKPj4gKysrIGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jCj4+
IEBAIC0zNSw5ICszNSwxMCBAQCBzdGF0aWMgYm9vbCByaXNjdl90aW1lcl9jYW5ub3Rfd2FrZV9j
cHU7Cj4+ICBzdGF0aWMgdm9pZCByaXNjdl9jbG9ja19ldmVudF9zdG9wKHZvaWQpCj4+ICB7Cj4+
ICAgICAgICAgaWYgKHN0YXRpY19icmFuY2hfbGlrZWx5KCZyaXNjdl9zc3RjX2F2YWlsYWJsZSkp
IHsKPj4gLSAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfU1RJTUVDTVAsIFVMT05HX01BWCk7
Cj4+ICAgICAgICAgICAgICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfMzJCSVQpKQo+PiAgICAg
ICAgICAgICAgICAgICAgICAgICBjc3Jfd3JpdGUoQ1NSX1NUSU1FQ01QSCwgVUxPTkdfTUFYKTsK
Pj4gKyAgICAgICAgICAgICAgIGVsc2UKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgY3NyX3dy
aXRlKENTUl9TVElNRUNNUCwgVUxPTkdfTUFYKTsKPj4gICAgICAgICB9IGVsc2Ugewo+PiAgICAg
ICAgICAgICAgICAgc2JpX3NldF90aW1lcihVNjRfTUFYKTsKPj4gICAgICAgICB9Cj4+IC0tCj4+
IDIuNDMuMQo+Pgo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
