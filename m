Return-Path: <SRS0=HaOg=QW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C21C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 Feb 2019 07:59:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13E39206BB
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 Feb 2019 07:59:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OOdg/gah";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFJysJLW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13E39206BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f++ORMbFDNDO309ggKmwU34xlSgo37yrY3cqo3sZnGw=; b=OOdg/gahs8LpRi
	qUDGNPR7IaPpaQoRz/j/G5NikgS8YF8imnED6roekxdjdMJDAY13QNlSRUa8CDfb32exwsENUa5fj
	rqZPzIJGpo8m1MKZ6a4sQ8vw6YXjCiNBFgeSPIe53r2vI7intxICIM17xPPXFkkVtVjICoiAHsKSG
	2fVtK16S5MCAMNGDJ2oD3npYMX+skbCUoxhn6HzfRfGerYLt5gtFg9/6C9zmREqGsmu+CuRPAMWF4
	YZsZ/jj7Nj29OEtz6PaWuF+Mhjo3qWrV+TZWHhG3sHi53v4Zua6ohWzOEE8UxE/IJ3OhrKx9ulwR6
	zwQESEFF6/ZC4Ne7sklw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guYOc-0002ui-DK; Fri, 15 Feb 2019 07:58:54 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guYOZ-0002tx-J7
 for linux-riscv@lists.infradead.org; Fri, 15 Feb 2019 07:58:53 +0000
Received: by mail-ed1-x542.google.com with SMTP id b20so7164379edw.11
 for <linux-riscv@lists.infradead.org>; Thu, 14 Feb 2019 23:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9hadSi4LFcMfVTlwwQG+41oFCFy8OhnB/f4tmYYI81c=;
 b=hFJysJLWkGLtXG1O5bEgyGRtaiEsrbDgqrAmcqolx1PRFxSXlR2/gtI/gSrbU8Dtu1
 /f47WdBKnG7pGHxKRqgnqSuzk4hnwcAH63OCYSf21D2Djg/rcpibvn6gz3AhMhD5ZHRK
 +jjDWjFEYH42HrtWf1zUe83/sLVovkTFlJ8jlC5+zn+V2JKvBLDQ9K1OLut3CTfjpy9v
 uHHAl8YoQEK60thdD73+TRj2unwTfB0P5ZeyhBiVZTiLjDeanAv+SP74SEo8CCTpUrr/
 AeLVZ4wyC9695moE3AxZjltTQzeilvvms5tSoUNTAGKFt5N0mAq1YU2Yw7xfIgQDjUGQ
 lDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9hadSi4LFcMfVTlwwQG+41oFCFy8OhnB/f4tmYYI81c=;
 b=pbIaarIw3k9+XMYiAVEO9WoBK0R4vm9eCBSZVZl71NYpDoniJXnWVSEv86LOUaXDEp
 ZOa9QJenVm6aLiGWJJLtCVuDMMs7IlE7HKsN1Z2eTw0ThmqTiS3cAvjTcr2ewaE3BJBR
 RrKc2gZtRjz87fZHNhELXxN7tdfxg0GYZBTSYPOyJHJ6ZTf5dKJD5ujV1/E6f9/Xovv4
 tTtNb3MCOaT/IxDayPNnGptpakyxYwr5qB8c2gLRR7pYPvLFNyS4ZOh6LJbD4HI+Ncnu
 w1iTP0Dz/DlHXSXg0alcQ6W0AdLENrek3gfxvYIhUC3m4iXEi4UT+Zs5vNUZdH9YUW6m
 uEzQ==
X-Gm-Message-State: AHQUAuYgt+UOMmAFrrtoOL+8PphiWN0I1dUv8dCQqR1GTds77lCUQEpr
 msKoiFhC9rDQ+YEN63DyPi5egAMd/6bEMBRawUo=
X-Google-Smtp-Source: AHgI3IYk+97brw7+2M2gsoq0t5Rme1jfRYz4kkvzqwCZT7uVIBuSU1MdnUBpIqQHCaGv8ygJYxBFb/p5CQiqNo7uGOE=
X-Received: by 2002:a17:906:1c4b:: with SMTP id
 l11mr5664488ejg.20.1550217529477; 
 Thu, 14 Feb 2019 23:58:49 -0800 (PST)
MIME-Version: 1.0
References: <20190213174005.28785-1-hch@lst.de>
 <20190213174005.28785-7-hch@lst.de>
 <CAK7LNAQZm2TXO1gxif2LZQzwYae2AiqgZnNGJBxBjiPwoZLqig@mail.gmail.com>
In-Reply-To: <CAK7LNAQZm2TXO1gxif2LZQzwYae2AiqgZnNGJBxBjiPwoZLqig@mail.gmail.com>
From: Greentime Hu <green.hu@gmail.com>
Date: Fri, 15 Feb 2019 15:58:11 +0800
Message-ID: <CAEbi=3ctaYwjCxOVaCyUrvT=741keKPwXj6v8rS9bzoTZPcsOA@mail.gmail.com>
Subject: Re: [PATCH 06/11] lockdep: consolidate the LOCKDEP_SUPPORT symbol
To: Masahiro Yamada <yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_235851_656710_F1110163 
X-CRM114-Status: GOOD (  12.77  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-xtensa@linux-xtensa.org,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgWWFtYWRhLAoKTWFzYWhpcm8gWWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNv
bT4g5pa8IDIwMTnlubQy5pyIMTXml6Ug6YCx5LqUIOS4i+WNiDM6MTflr6vpgZPvvJoKPgo+ICtD
QyBHcmVlbnRpbWUgSHUKPiArQ0MgVmluY2VudCBDaGVuCj4KPgo+IE9uIFRodSwgRmViIDE0LCAy
MDE5IGF0IDI6NDAgQU0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+IHdyb3RlOgo+ID4K
PiA+IEFkZCBvbmUgZGVmaW5pdGlvbiB0byBsaWIvS2NvbmZpZy5kZWJ1ZyBhbmQgbGV0IHRoZSBh
cmNoaXRlY3R1cmVzCj4gPiBzZWxlY3QgaWYgaXQgc3VwcG9ydGVkLgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+Cj4KPiBUaGlzIGNoYW5nZXMg
dGhlIGJlaGF2aW9yIG9mIG5kczMyLgo+Cj4gU28gcGxlYXNlIGxlYXZlIGEgbm90ZSBpbiB0aGUg
Y29tbWl0IGRlc2NyaXB0aW9uLgo+IChJZGVhbGx5LCB3ZSB3YW50IEFjayBvZiBhIE5EUzMyIG1h
aW50YWluZXIpCj4KPiBBbHNvLCBwbGVhc2UgZG8gY29tcGlsZSB0ZXN0IGZvciBORFMzMi4KPgo+
Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IFRoaXMgY29tbWl0IGNoYW5nZXMgQ09ORklH
X0xPQ0tERVBfU1VQUE9SVCB0byB5IGZvciBuZHMzMi4KPgo+IE5EUzMyIHNlbGVjdHMgTE9DS0VQ
X1NVUFBPUlQsIGJ1dCB0aGVyZSB3YXMgcHJldmlvdXNseQo+IG5vIGNvbmZpZyBlbnRyeSBvZiBM
T0NLREVQX1NVUFBPUlQgaW4gbmRzMzIuCj4KPiBJdCBpcyBub3cgYXZhaWxhYmxlIGluIGxpYi9L
Y29uZmlnLmRlYnVnLAo+IHNvIHRoaXMgY29tbWl0IGVuYWJsZXMgTE9DS0RFUF9TVVBQT1JUIGZv
ciBuZHMzMi4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpUaGFuayB5b3UgdG8gbGV0IHVz
IGtub3cgdGhpcyBjaGFuZ2UuCkkgdGhpbmsgaXQncyBvayB0byBlbmFibGUgTE9DS0RFUF9TVVBQ
T1JUIGZvciBuZHMzMi4KSSBqdXN0IHZlcmlmaWVkIGl0IGluIDUuMC4wLXJjMS4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
