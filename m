Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06FFE77173
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Dec 2024 16:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HSfkz8R/ocebgloBD+FoqVs+WYi0MJf5DS5kGFCinEw=; b=0FEg0eyl722f25
	5PCX3lpxCh2TkLMBnv9N0CLM59/20zSGYP45vQ3dchzgTb3peWsKfXHTWts3dp0PpYaJyQaK08e3a
	EyLdiMjog/xZWPZb6Y9voLKLKKMrjsYw1NEj2nniD5TG7sI3Dik+TJlrgjHJv7ufJYMi3cLakBtu7
	ZeFolhZ9X6Htof5V4Hv3+fhXGQq1EY8juihPIOPcIWeLOlZSUu9Ljneb64s2tDpHXpwqNvKxC2rUl
	Km3pNZSirhAdwO/OfUi07ar2SV56E2zu9DBFMo8M8LE2zfNjWefbUen6X5P0pS7UrCOvM3yUZHlmS
	6r62YMq2sRqcsfXn+hWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbWS-00000002Egc-0NkX;
	Fri, 06 Dec 2024 16:49:44 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbWO-00000002Ef5-2CQ0
	for linux-riscv@lists.infradead.org;
	Fri, 06 Dec 2024 16:49:42 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-841a9366b5eso144824539f.2
        for <linux-riscv@lists.infradead.org>; Fri, 06 Dec 2024 08:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1733503779; x=1734108579; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0whfwYAjXy7+XSzVEU4KqWN95vXE9XVqm2dCOOqkrKo=;
        b=J/4IwfBMBGIPyzD4k0GKc0uz7/WnfFq2/EM8gHo82Z7a7kpPfug/X3jOKKfhGhe2a3
         PvjyZVFqn9kRfRmBibVbO8N7m1DZUTexaEFM6tz91iObMeFa++Dq4jji+s8dwst9JVOB
         ftAX2hNV4IJpBMC0ErHu9ehtmZ1IPNQiBhNNdO2GYpyx7wwrwCbKn9hczF8xeN684wqA
         Bn8wprtV55VEOPGQRzsSEoCTtcco1371lQ0koIMaphM0j1smNlksPXNCyq1nObCDnyCM
         qGvlNYI8lsjsmcmr99ijswCI1WYjc7zpPdK1APKFIMB0lsfgxvqacznEtkHqoFwN3ko1
         LfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733503779; x=1734108579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0whfwYAjXy7+XSzVEU4KqWN95vXE9XVqm2dCOOqkrKo=;
        b=bH0fqsWT44yZeKRx2+xjVUfs/juN97/zLApNTGOb81JqrK3U5g4WQW0wzN016V9/3i
         8+DbFYWZ9B5FQRtVg5lwAMsZjdAklWxWubrl0fp5iPZ90XmeAl8U+J0sfXDrDHxCbIgO
         /hUvpsMcVfWIPJmCvt0GdpHREPOELwGPDNdzS6QImvY7I8haNWURhQxqkpYyQYaronwC
         rjKE/Wtg6vj077gq+KyNz7WVwxQGzDAVG65KWpo7UmJ607+1QPmYrqm2uomHlmK5GfEQ
         VGGqt9d8kCJzfZxCF59QCMWTdtJK//9dwezf6eiUFsNiUgvAddDeWnPZeuGRLBHWw64y
         OumQ==
X-Gm-Message-State: AOJu0YxqEf3VK2VlY5lQfp2id/qfKl1oq7Q/OyB4CYR1kOh1SO3wSETG
	SLtXNVgqp7hzhskVQejN/XDi011Mz89uEF88RAfMbgvBi77wC/cb14P1O3WaGzxy01Zz8qmYtBV
	ERZ3jpvE2x894ldD5htegdvAfeeephKT9cSsNAA==
X-Gm-Gg: ASbGnct/MauLdBCcyrJARuuSQH17e0UnBI0WqHqkMBY/IQOCV+BfGXVNjCmP4GOcFbv
	l0K1bcM6PaXwJAlD4aXvlh1KZDefUq+gv4A==
X-Google-Smtp-Source: AGHT+IFictbKsSbt5zxu6TMdxKpWJ7OEgN4bWq0xyn6ACDGGevBPbhVQcoL5/hHQE8JqD9YBvLYTDq/LyRqS/ACQ6QU=
X-Received: by 2002:a05:6602:2c92:b0:841:984b:47d2 with SMTP id
 ca18e2360f4ac-8447e34907cmr474724839f.14.1733503779122; Fri, 06 Dec 2024
 08:49:39 -0800 (PST)
MIME-Version: 1.0
References: <20241127041840.419940-1-michaelneuling@tenstorrent.com>
In-Reply-To: <20241127041840.419940-1-michaelneuling@tenstorrent.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Dec 2024 22:19:28 +0530
Message-ID: <CAAhSdy19qxSeTH4oZz-nggszew81bFz-Ey=HxcxtfxFw=4otAA@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Fix csr_write -> csr_set for HVIEN PMU
 overflow bit
To: Michael Neuling <michaelneuling@tenstorrent.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	palmer@dabbelt.com, mikey@neuling.org, atishp@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_084940_810962_F53645EB 
X-CRM114-Status: GOOD (  14.73  )
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

T24gV2VkLCBOb3YgMjcsIDIwMjQgYXQgOTo0OeKAr0FNIE1pY2hhZWwgTmV1bGluZwo8bWljaGFl
bG5ldWxpbmdAdGVuc3RvcnJlbnQuY29tPiB3cm90ZToKPgo+IFRoaXMgZG9lc24ndCBjYXVzZSBh
IHByb2JsZW0gY3VycmVudGx5IGFzIEhWSUVOIGlzbid0IHVzZWQgZWxzZXdoZXJlCj4geWV0LiBG
b3VuZCBieSBpbnNwZWN0aW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBOZXVsaW5nIDxt
aWNoYWVsbmV1bGluZ0B0ZW5zdG9ycmVudC5jb20+Cj4gRml4ZXM6IDE2YjBiZGU5YTM3YyAoIlJJ
U0MtVjogS1ZNOiBBZGQgcGVyZiBzYW1wbGluZyBzdXBwb3J0IGZvciBndWVzdHMiKQo+IFJldmll
d2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiBSZXZpZXdlZC1ieTog
QW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCBmb3IgNi4xMy1yY1ggZml4
ZXMKClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gdjI6Cj4gICBBZGRlZCBGaXhlcyB0YWcKPiAgIEFk
ZGVkIFJldmlld3MKPiAgIE5vIGNvZGUgY2hhbmdlCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL2Fp
YS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9haWEuYyBiL2FyY2gvcmlzY3Yva3Zt
L2FpYS5jCj4gaW5kZXggMjk2N2QzMDVjNC4uOWYzYjUyNzU5NiAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2t2bS9haWEuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYS5jCj4gQEAgLTU1Miw3
ICs1NTIsNyBAQCB2b2lkIGt2bV9yaXNjdl9haWFfZW5hYmxlKHZvaWQpCj4gICAgICAgICBjc3Jf
c2V0KENTUl9ISUUsIEJJVChJUlFfU19HRVhUKSk7Cj4gICAgICAgICAvKiBFbmFibGUgSVJRIGZp
bHRlcmluZyBmb3Igb3ZlcmZsb3cgaW50ZXJydXB0IG9ubHkgaWYgc3Njb2ZwbWYgaXMgcHJlc2Vu
dCAqLwo+ICAgICAgICAgaWYgKF9fcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoTlVMTCwg
UklTQ1ZfSVNBX0VYVF9TU0NPRlBNRikpCj4gLSAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1Jf
SFZJRU4sIEJJVChJUlFfUE1VX09WRikpOwo+ICsgICAgICAgICAgICAgICBjc3Jfc2V0KENTUl9I
VklFTiwgQklUKElSUV9QTVVfT1ZGKSk7Cj4gIH0KPgo+ICB2b2lkIGt2bV9yaXNjdl9haWFfZGlz
YWJsZSh2b2lkKQo+IC0tCj4gMi4zNC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
