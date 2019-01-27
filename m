Return-Path: <SRS0=74fC=QD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D72C282CB
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 27 Jan 2019 12:29:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D90BE2147A
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 27 Jan 2019 12:29:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xd/t8JTE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvIVX73D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D90BE2147A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1i6DfTWMamrJMPpvmU5iLOpXkx4YU0oHTEt02wYypc=; b=Xd/t8JTEo8oPis
	7FmoJpeRPRSJjgSC5fr/5LtRzQYSKE39y2yPpWM/XFtbPDDSSeo/i6FpZU4VrjCjG4wB9d1KXWEtY
	D9a4C2BfNzUt5ye9sz28QKiA4g6tK2pgz8mbaKQBy1OstKkekf0V0vD2jecPOGl9d5JIwkv4rsSSq
	bNOYb0a+AFvzWbzBcIbDJ3KgGXi8gVGP3v+5WutuM5MDnbQ1v30z4fdr2ggwKHiEO/iaZotakD76p
	x/2Oqw239le8x0KXOO8TvMXYdueOfyg9if2rH4ee7YPIg4c9gA7dL7rIErQpWpdaJa2o3BkHbmRMt
	jTTaJkL/nqknNvI2n2Tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gnjYi-0008Qv-KE; Sun, 27 Jan 2019 12:29:08 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gnjYf-0008QZ-T0
 for linux-riscv@lists.infradead.org; Sun, 27 Jan 2019 12:29:07 +0000
Received: by mail-qt1-x843.google.com with SMTP id p17so15530703qtl.5
 for <linux-riscv@lists.infradead.org>; Sun, 27 Jan 2019 04:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1+oBmsetBvh04PidPkJsDI5zIOJbIu/8+EYTCsRtMEs=;
 b=dvIVX73DZzy+WpQCicuFkDRWoC3TkbOGTNEwksZn3r1VRRUgn4kmzYYYcBll/u+y9f
 sF5gA4TJoDd9ndHRMRTh9UTRfTEEGbVjEs+OqmAp/tQ42ltz9ufOJZIomh+ClShMBI5F
 VjSr5duhgp3SbXA3ioAwUJdt4skG4s1N+8cMGUTkwouXk+cdvtNS9XSqFK5T7RckIO4W
 g7Q8g/d2PbMaMoMZ31E7v0SyM+1MjUR70WUVbNpTiPb6Y8kxeIyFd9XYhMpsNcWFamSF
 BygdDwbfnMXLCPoTEXPlmU0YfgWRLl26zMWGmrKZ7RhUb8LkZNlhFB5O35/hxrHAHE0J
 IU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1+oBmsetBvh04PidPkJsDI5zIOJbIu/8+EYTCsRtMEs=;
 b=nkgl9wLP32vtQgOaZekLmjXsCI+fTRE9Nw/AWmt34tOlmZU0990JO/UE2OgPuBB1zk
 T36LPUpctSajbBw4RCYeBFRfY3eR5EPmB4yOR2fKzgc0r/NUzF9vnkrap3bGknqTulUN
 +8I4Y4rzTAKh22+w8mnSVwSiXVMqPpfDDpm92B7jy/ZV4AdoYaVkv6mjMBmLkllu7oLX
 JD1FGr1qlbPfAC+98Ar39iRtCzhWCPc0rCmHr0XIPC0ZSauT34yPc+RF2w4/1vgU+xlv
 vImIVXO3vkeX3acZdot0AyMJRyvqwq1WBAH3WgXj2F/D9StWPZWoIqf1YY9NlLtJ2zM4
 dNsA==
X-Gm-Message-State: AJcUukfo8bRdeWmeid+MFrmCwBHNR7BoVJ1PU7o6DuxY9iIbglYCgfLX
 vAQPrDm0TZ245sK6iFz+ipINeETh89YDPjIwJXI=
X-Google-Smtp-Source: ALg8bN6pZB6V/yIVgN1LZCb9DIK9uj3DF2sYt90sBCEeHsFNz5QpCshmv5PVBPc1lzPKCAAy0r6YxHBTt/yxcKEu760=
X-Received: by 2002:ad4:41d0:: with SMTP id a16mr16942515qvq.55.1548592143821; 
 Sun, 27 Jan 2019 04:29:03 -0800 (PST)
MIME-Version: 1.0
References: <20190115083518.10149-1-bjorn.topel@gmail.com>
 <alpine.DEB.2.21.9999.1901251147250.20864@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1901251147250.20864@viisi.sifive.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Sun, 27 Jan 2019 13:28:51 +0100
Message-ID: <CAJ+HfNgg9-BRmf=a2H+gwGFrnqYrTgvCPM1UEc=mmwrDG=Y9+w@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] RV64G eBPF JIT
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190127_042905_966379_059E970F 
X-CRM114-Status: GOOD (  10.47  )
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
Cc: Netdev <netdev@vger.kernel.org>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>, Daniel Borkmann <daniel@iogearbox.net>,
 davidlee@sifive.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

RGVuIGZyZSAyNSBqYW4uIDIwMTkga2wgMjA6NTQgc2tyZXYgUGF1bCBXYWxtc2xleSA8cGF1bC53
YWxtc2xleUBzaWZpdmUuY29tPjoKPgo+IEhpLAo+Cj4gdGhhbmtzIGZvciB0YWtpbmcgYSBzaG90
IGF0IHRoZSBlQlBGIEpJVDsgdGhpcyB3aWxsIGJlIHZlcnkgdXNlZnVsLgo+Cj4gT24gVHVlLCAx
NSBKYW4gMjAxOSwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPgo+ID4gKiBJJ3ZlIGFkZGVkICJIQVZF
X0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTIiB0bwo+ID4gICBhcmNoL3Jpc2N2L0tjb25maWcu
IElzIHRoaXMgYXNzdW1wdGlvbiBjb3JyZWN0Pwo+Cj4gRnJvbSBhIGhhcmR3YXJlIHBvaW50IG9m
IHZpZXcsIHRoaXMgaXMgbm90IHRoZSBjYXNlIG9uIHRoZSBMaW51eC1jYXBhYmxlCj4gUklTQy1W
IEFTSUNzIHRoYXQgdGhlIHB1YmxpYyBjYW4gYnV5IHJpZ2h0IG5vdyAodG8gdGhlIGJlc3Qgb2Yg
bXkKPiBrbm93bGVkZ2UgdGhpcyBpcyBvbmx5IHRoZSBTaUZpdmUgRlU1NDApLgo+Cj4gU28gSSdk
IHJlY29tbWVuZCBub3QgaW5jbHVkaW5nIHRoaXMgZm9yIG5vdy4KPgoKR290IGl0ISBUaGFua3Mg
Zm9yIGNsZWFyaW5nIHRoYXQgdXAgZm9yIG1lIQoKSG9wZWZ1bGx5LCBJJ2xsIGZpbmQgc29tZSB0
aW1lIHRoZSBjb21pbmcgd2VlayB0byBnZXQgYSB2MiBvdXQgd2l0aAp0YWlsLWNhbGwgc3VwcG9y
dCBhbmQgbW9zdCBjb21tZW50cyBhZGRyZXNzZWQuCgoKQ2hlZXJzLApCasO2cm4KCgo+Cj4gLSBQ
YXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
