Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93AEC54EE9
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 09:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=L4E6FdMTYC/L2YZJhBRbH5IYwIg2GVtjXaFWNhQSZhQ=; b=waapnjwJpmmZMNDksZ0uuVHM0E
	ZMbyp9hucqxFt6TFZEYBFlrbyz2h7JWY0TPO8qS9apbeDzIOpSAImunmJZ2nV5cXxONTCqF4y0/Ed
	+lwOadUu1ihFbdvfL5WIcoC5Hb85kJKL7og40Itm12i1DuctECb1/1aY7YbaErbEGNreSJ5W7+GRA
	OcOdwoPIbJ3jjV19+m1UkQv/rIycqiG3P/gurW51mVs2+SfyKGZtr7Er+hXB28Kz8pYKvBkHauVYJ
	dTlafKlD4xy2XxqP5WI5NYe8JB008Xn0rvz9H/gjxnL7ChB6BR/Tj5IB8UXtn84Og+tIuuN2ePlgv
	r/zbOQFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ83R-00BtVV-7k; Fri, 16 Sep 2022 09:54:37 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ83N-00BtRk-CE
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 09:54:35 +0000
Received: by mail-ej1-x632.google.com with SMTP id kr11so2133422ejc.8
        for <linux-riscv@lists.infradead.org>; Fri, 16 Sep 2022 02:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date;
        bh=wj5OSFKMaMShL9kPf9grhYXO/iiEFQNYTLIygfPbFF0=;
        b=S6xb6kIuhT4wmw6S0ZJybtoz5CCAknGQsMFFQnrGHHo3d2Ll9idaadbGuZs6jO7l+D
         dr/azVWd76TnRURvVGtfM6Oiy8Dp7zpdkmw8uSUsmnXQofb+o6pku/GY1GfzqM1FWbVi
         cKwp/4kSV9G/KVvg8EtC+T3Vj9o/TBA8G3eMQ2AJZrdLJE4Z2diCTtswodnQoQ8nRx2o
         PB2FP1KgRsl6kPuxLYHw66MJfF7QBL9+m9eeE97hAbSIDqOHPEq+ts90j9a1wCZg5mTj
         +CUPvMcXHgYwye+YV8XA+I02UgkEIMkzEzwNYmCjBecIRWqD0wvteipHzfMOxWOBjIAS
         aX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
        bh=wj5OSFKMaMShL9kPf9grhYXO/iiEFQNYTLIygfPbFF0=;
        b=YH1JjJthxIbpWl7XxhhQXAr/CTfz24aussIeTZjW4q6/V3bQ/A+cfOwxwhNhzhh+4Z
         8sUI8MBtSkwJy7Hr8G3GvioHIIA61sK4eP39AR1c9IKYi4TCitfaGOpZQFQGzNaJVhX8
         fcUN6AD+6ySragd724qy/1qkpg8BewsdVFJq+FqstjcHJCCyXKb/nEinfxCog64pzIaU
         gJftKi22NdmxQCWEJLLj8LuBDTpv07hacG6sdodBmpCTL2yadAMea0ZUmc5PLLTTqQAj
         rCcgFph7Bozwr2/Mk1b5vDzWtrEXuyQJOXhVrWHKkbVHTPgzopmEExpIPPVl7Ez523IH
         QIhg==
X-Gm-Message-State: ACrzQf1ctbtMcbWVkSySxRQmjtq+tZx6cM+npyu6AQED4t/cT2nsbxki
	6+LVesl7VI6oGjb+wMKLoCTkpxyOZaMHm6KJ3f4=
X-Google-Smtp-Source: AMsMyM5skfvX+xKarZa0E3BhB7qnCyF5lJUhezWEizPxPZ6QA1BYGU8dFI52cG7Cw1lUgonjj0uv7Q==
X-Received: by 2002:a17:906:fc6:b0:72f:d080:416 with SMTP id c6-20020a1709060fc600b0072fd0800416mr2995012ejk.1.1663322068752;
        Fri, 16 Sep 2022 02:54:28 -0700 (PDT)
Received: from localhost (guests-out.ms.mff.cuni.cz. [195.113.20.231])
        by smtp.gmail.com with ESMTPSA id x17-20020a170906297100b0074136cac2e7sm9984592ejd.81.2022.09.16.02.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 02:54:28 -0700 (PDT)
Date: Fri, 16 Sep 2022 02:54:28 -0700 (PDT)
X-Google-Original-Date: Fri, 16 Sep 2022 02:54:22 PDT (-0700)
Subject: Re: [PATCH v2] riscv: ztso: disallow elf binaries needing TSO
In-Reply-To: <9b9ff287-75e5-3ee5-e6c5-1daca6c562dc@microchip.com>
CC: Vineet Gupta <vineetg@rivosinc.com>, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, cmuellner@ventanamicro.com, linux@rivosinc.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor.Dooley@microchip.com
Message-ID: <mhng-11eafba7-7b0e-4d68-a7cd-c56595ff9a7c@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_025433_623715_3E4E8A24 
X-CRM114-Status: GOOD (  25.64  )
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

T24gVGh1LCAxNSBTZXAgMjAyMiAyMzo1ODowNSBQRFQgKC0wNzAwKSwgQ29ub3IuRG9vbGV5QG1p
Y3JvY2hpcC5jb20gd3JvdGU6Cj4gT24gMTYvMDkvMjAyMiAwNzozNCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+PiBPbiAxNi8wOS8yMDIyIDA1OjIzLCBWaW5lZXQgR3VwdGEgd3JvdGU6Cj4+PiBbWW91
IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIHZpbmVldGdAcml2b3NpbmMuY29tLiBMZWFybiB3
aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklk
ZW50aWZpY2F0aW9uIF0KPj4+Cj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUK
Pj4+Cj4+PiBBcyBvZiBub3cgdGhlIHNvZnR3YXJlIHN0YWNrIG5lZWRzIHdvcmsgdG8gc3VwcG9y
dCB6dHNvLiBVbnRpbCB0aGF0IHdvcmsKPj4+IGlzIGZpbmlzaGVkLCBkaXNhbGxvdyBiaW5hcmll
cyBuZWVkaW5nIFRTTy4KPj4+Cj4+PiBUaGlzIHBhdGNoIGlzIG5lZWRlZCB0byBoZWxwIHp0c28g
cmF0aWZpY2F0aW9uIGFuZCBwcm9saWZpcmF0aW9uIG9mIHRzbwo+Pj4gYml0cyBpbiB0b29saW5n
Lgo+PiAKPj4gSSBoYXZlIHRvIGFkbWl0IHRvIGJlaW5nIGEgbGl0dGxlIGNvbmZ1c2VkIGhlcmUs
IGlmIFp0c28gaXMgbm90IHJhdGlmaWVkCj4+IHdoeSBkbyB3ZSBuZWVkIHRvIHByb3RlY3Qgb3Vy
c2VsdmVzIGZyb20gaXQ/Cj4gCj4gQWxzbywgc2luY2UgdGhpcyBpcyBub3QgbWFya2VkIGFzIGEg
Zml4LCB3aHkgd291bGQgd2Ugbm90IGp1c3QgYXBwbHkgdGhlCj4gcGF0Y2hzZXQgZnJvbSBQYWxt
ZXIgdGhhdCBsb29rcyBsaWtlIGEgbW9yZSBjb21wbGV0ZSB2ZXJzaW9uIG9mIHRoaXMKPiBwYXRj
aDoKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIyMDkwMjAzNDM1Mi44
ODI1LTEtcGFsbWVyQHJpdm9zaW5jLmNvbS8KPiAKPiBNYXliZSB5b3UgY291bGQgb2ZmZXIgYW4g
Ui1iIG9yIHNvbWUgY29tbWVudHMgb24gdGhhdCBwYXRjaCBpbnN0ZWFkPwoKSU1PIHRoYXQncyB0
aGUgYmV0dGVyIHdheSB0byBnbywgWnRzbyBpcyBmcm96ZW4gc28gd2UgY2FuIGV4cGVjdCAKc29m
dHdhcmUgdG8gc3RhcnQgdXNpbmcgaXQuICBNaWdodCBhcyB3ZWxsIGxldCBpdCBydW4gaWYgdGhl
IG1hY2hpbmUgaXMgCmdvaW5nIHRvIGJlIFRTTyBhbnl3YXkgKGFuZCBJSVJDIHNvbWUgb2YgdGhl
IFQtSGVhZCBzdHVmZiBlaXRoZXIgaXMgb3IgCmNhbiBiZSBUU08sIHNvIHdlJ2xsIG5lZWQgdG8g
ZGV0ZWN0aW9uIHNvb24gYW55d2F5KS4KCkkgd2FzIGFsc28gcGxhbm5pbmcgb24gcmUtc3Bpbm5p
bmcgdGhlIFFFTVUgc3R1ZmYgc28gd2UgY2FuIHRlc3QgaXQsIGJ1dCAKZ2l2ZW4gaG93IHNpbXBs
ZSB0aGUgTGludXggcGF0Y2ggaXMgSSB0aGluayBpdCdzIGZpbmUgdG8ganVzdCBnbyBhaGVhZCAK
YW5kIHRha2UgaXQuCgpIYXBweSB0byBoZWFyIGFueSBjb21tZW50cywgdGhvdWdoLgoKPiAKPiBU
aGFua3MsCj4gQ29ub3IuCj4gCj4+IAo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFZpbmVldCBHdXB0
YSA8dmluZWV0Z0ByaXZvc2luYy5jb20+Cj4+PiAtLS0KPj4+IENoYW5nZXMgc2luY2UgdjEKPj4+
IMKgwqAgLSBCdWlsZCBlcnJvciAoYW5kIGJvb3QgdGVzdGVkIG9uIHFlbXUpCj4+PiDCoMKgIC0g
SW1wcm92ZWQgdGhlIGNvbW1lbnRzIGEgYml0Cj4+PiAtLS0KPj4+IMKgIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vZWxmLmjCoMKgwqDCoMKgIHwgMTEgKysrKysrKysrKy0KPj4+IMKgIGFyY2gvcmlz
Y3YvaW5jbHVkZS91YXBpL2FzbS9lbGYuaCB8wqAgMiArKwo+Pj4gwqAgMiBmaWxlcyBjaGFuZ2Vk
LCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vZWxmLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VsZi5o
Cj4+PiBpbmRleCBmNTNjNDAwMjZjN2EuLmI2YjQ1NDJiMzAzOSAxMDA2NDQKPj4+IC0tLSBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vZWxmLmgKPj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vZWxmLmgKPj4+IEBAIC0yNiwxMCArMjYsMTkgQEAKPj4+Cj4+PiDCoCAjZGVmaW5lIEVMRl9E
QVRBwqDCoMKgwqDCoMKgIEVMRkRBVEEyTFNCCj4+Pgo+Pj4gKy8qCj4+PiArICogTWFrZSBzdXJl
IHRoZSBlbGYgYmVpbmcgbG9hZGVkIGlzIGNvbXBhdGlibGUgd2l0aCBleHRlbnNpb25zLgo+Pj4g
KyAqCj4+PiArICogSW4gdGhlIGZpbmFsIGluY2FybmF0aW9uIHRoaXMgd2lsbCBnZXQgdGhlIGV4
dGVuc2lvbiBsaXN0IGZyb20gRFQgYW5kCj4+PiArICogbWFrZSBzdXJlIGVsZiBjYW4gcnVuIG9u
IGdpdmVuIGhhcmR3YXJlK2tlcm5lbC4KPj4+ICsgKiBGb3Igbm93IGRpc2FsbG93IFRTTyBidWls
dCBiaW5hcmllcy4KPj4+ICsgKi8KPj4+ICsjZGVmaW5lIHJ2X2V4dF9vayh4KcKgwqAgKCEoKHgp
LT5lX2ZsYWdzICYgRUZfUklTQ1ZfVFNPKSkKPj4+ICsKPj4+IMKgIC8qCj4+PiDCoMKgICogVGhp
cyBpcyB1c2VkIHRvIGVuc3VyZSB3ZSBkb24ndCBsb2FkIHNvbWV0aGluZyBmb3IgdGhlIHdyb25n
IGFyY2hpdGVjdHVyZS4KPj4+IMKgwqAgKi8KPj4+IC0jZGVmaW5lIGVsZl9jaGVja19hcmNoKHgp
ICgoeCktPmVfbWFjaGluZSA9PSBFTV9SSVNDVikKPj4+ICsjZGVmaW5lIGVsZl9jaGVja19hcmNo
KHgpICgoeCktPmVfbWFjaGluZSA9PSBFTV9SSVNDViAmJiBydl9leHRfb2soeCkpCj4+Pgo+Pj4g
wqAgI2RlZmluZSBDT1JFX0RVTVBfVVNFX1JFR1NFVAo+Pj4gwqAgI2RlZmluZSBFTEZfRVhFQ19Q
QUdFU0laRcKgwqDCoMKgwqAgKFBBR0VfU0laRSkKPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvdWFwaS9hc20vZWxmLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vZWxm
LmgKPj4+IGluZGV4IGQ2OTZkNjYxMDIzMS4uZmE5ZTRjNTJjN2FjIDEwMDY0NAo+Pj4gLS0tIGEv
YXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2VsZi5oCj4+PiArKysgYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvdWFwaS9hc20vZWxmLmgKPj4+IEBAIC0zMiw2ICszMiw4IEBAIHR5cGVkZWYgdW5pb24g
X19yaXNjdl9mcF9zdGF0ZSBlbGZfZnByZWdzZXRfdDsKPj4+IMKgICNkZWZpbmUgRUxGX1JJU0NW
X1JfVFlQRShyX2luZm8pwqDCoMKgwqDCoMKgIEVMRjMyX1JfVFlQRShyX2luZm8pCj4+PiDCoCAj
ZW5kaWYKPj4+Cj4+PiArI2RlZmluZSBFRl9SSVNDVl9UU0/CoMKgwqDCoMKgwqDCoMKgwqDCoCAo
MSA8PCAzKQo+PiAKPj4gcy9FRi9FTEYgPwo+PiAKPj4gVGhhbmtzLAo+PiBDb25vci4KPj4gCj4+
PiArCj4+PiDCoCAvKgo+Pj4gwqDCoCAqIFJJU0MtViByZWxvY2F0aW9uIHR5cGVzCj4+PiDCoMKg
ICovCj4+PiAtLSAKPj4+IDIuMzQuMQo+Pj4KPj4+Cj4+PiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+
PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+PiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4+IAo+IAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
