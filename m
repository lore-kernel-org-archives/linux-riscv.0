Return-Path: <SRS0=QRI7=AL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D016EC433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 13:41:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96A4420675
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 13:41:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lv+my9Sc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UsFOYN1F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="n1udXtdX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96A4420675
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=usZgmAagXDhKM/HLcAyOiZ2ba9c3r/aMQV4SE5DCWPk=; b=Lv+my9Sctip1WDYcuLlpx07w9
	OvG/Kk06XdGjLPXUre6GFLn8PALNVIBmFsaOOj1sCvZCTjOPVj7U9ijrVaHRV4s3looK6hy/ngSio
	KuhxDNKLfsjr/LSmq1Gzautv6fVNXS/R6cYOyyfHNkhNahGIZG2Ufh9XBv44fIgmwzIXdIqaKbpyt
	jdTWN6EJWdcqzPwoswyENHpBu37tozVUVe0EzIFMDSg98XYlHPngUUQW2UWuwECzfyS4hdDnm19Fx
	Hygsws8b4sLT5GhjxIbD7Soq0jBBZ/BcW2sG5LZU4F63buMT2UW9KPlBw3Ukdp0pg2QxNhFZVwIkY
	n02Y9nDtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqGVd-000773-SL; Tue, 30 Jun 2020 13:41:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqGVO-00070A-1q
 for linux-riscv@merlin.infradead.org; Tue, 30 Jun 2020 13:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=07uA+havW+1/Rk2ajmQVtP0fJ21rkD1Q6k8Mz28U3L8=; b=UsFOYN1F+FWbNAiF7uQmbowS3q
 yT/HtydRylrKXXyxcZXi6/Vbqm9dHbelVslDIzwd0uWQRmwdQLJ6WCAC0G+1BpAfdpWlet3CPIlA4
 DhSBGaCCDDZek2Xt3BxDcUk4KoVz0ht5mafR2uUCvkjkY5LcmKY5VzN/MzRswLB/4i7+ehIDEyoQz
 Z+jPAQhR4X04Z/HZVW36sm2sX+MXBRLTlQgS60hgOkykq+e6s3yuVK1/Teluprv7LfNyTge1dlTLa
 F9Gr8N8CcolYikwwtZ8lE05BlbQQqB8rQ+TYpwmKVpzNRdn9yRYqTQfmG6Mmlzzvd2L/wlwofG9XT
 mxpFpBHg==;
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqGV9-00081R-IC
 for linux-riscv@lists.infradead.org; Tue, 30 Jun 2020 13:40:56 +0000
Received: by mail-qt1-x841.google.com with SMTP id j10so15522012qtq.11
 for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2020 06:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=07uA+havW+1/Rk2ajmQVtP0fJ21rkD1Q6k8Mz28U3L8=;
 b=n1udXtdXbJXfg8weT05EXX/+B62f38P9D8O/S0PGj3Vzr72ywFT0wpFr++FWe2BTcx
 5xIut63r7WIaBPghQyDQGGcBzUMphFksUvx+nqemiRFGSQCh7eQLsLsAL2iq1s6XuX4E
 386yAwJrfwseGh+IJToNXNZ2gA8A4Z4YPJNpZleQRfapS8MfotkeqYVk/bYcm3h++DHI
 qzeAXn6a0PX1W6YiPq/UZKG9IFQ7wz1p1la8Hr0EooH1OUNtDJ6HEzNl2amJ0g+POrty
 rAy+k96s99rGs6OzS3/jzYt/JN/CeKH9AuH29z0PdKXY8u41ycwwLG4Si4j4pso08xtg
 +mpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=07uA+havW+1/Rk2ajmQVtP0fJ21rkD1Q6k8Mz28U3L8=;
 b=ue9Ga8qs7sUsoUyXlCVv1+pGSuSWT+pDI4ayA4B2EzqjZ8eZIXSJZgX0OTEV79SP7H
 AVCmZgFKjViPkgKcCNt4vwIb7z7G5nhgGsC1auEPUSB6tKsopLS6EPYrx/VSFPdCg6Oz
 5hsBDNe7VKEZ8fbGL7B7ojOW1qaYI9/8HiuxXJk9AnxVDO9PHZp0CAKLLuHV3rIYPWRk
 P1v273Acf9FhvG0UT5hRat+5iY7Trg15/47qYo8yHdiWHZbo0+3fQi50lM6SgRe/Aud/
 CPuhIFlJGuccWCeX/8ThS7nZgX1ucC5G7PVSeKQXn7GPRJzh3g+apM+Oo+tT2XIgvgX8
 Cf5Q==
X-Gm-Message-State: AOAM533He+vCXdzwqfCIvNbyhDUrjucLKbcaJigHbdu5HVZQUHyHN285
 mXM0SPAL9s+EEHOYYeQGLq1Xx5R33Kxe9aoyFQY6GQ==
X-Google-Smtp-Source: ABdhPJwFxpMFQ2GtTqyo+GdB0lOrG7OTyd1bqNae21jY2UBWOnm/iuNVsHawHLikNvrmRGWxMasKbhNdrsadwMUIzT8=
X-Received: by 2002:aed:2b04:: with SMTP id p4mr20956729qtd.158.1593524429402; 
 Tue, 30 Jun 2020 06:40:29 -0700 (PDT)
MIME-Version: 1.0
References: <CACT4Y+a3A6DEvUjCsk_jKz9nZ=5iAzXTyG4WDPkug6u7BVrceQ@mail.gmail.com>
 <mvmtuysn227.fsf@suse.de>
 <CACT4Y+Y8=0m+Xku_+kQYuiiABgFUDzHBEqUK_FNGs8=f9NGZng@mail.gmail.com>
 <mvm4kqsn0e7.fsf@suse.de>
In-Reply-To: <mvm4kqsn0e7.fsf@suse.de>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 30 Jun 2020 15:40:18 +0200
Message-ID: <CACT4Y+askdjyUjw=D6yqnOHy8n7N3h7QFs8KjvkU5DOHGY66Zg@mail.gmail.com>
Subject: Re: syzkaller on risc-v
To: Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_144045_501400_52C21942 
X-CRM114-Status: GOOD (  11.62  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 syzkaller <syzkaller@googlegroups.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Tobias Klauser <tklauser@distanz.ch>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdW4gMzAsIDIwMjAgYXQgMzozMyBQTSBBbmRyZWFzIFNjaHdhYiA8c2Nod2FiQHN1
c2UuZGU+IHdyb3RlOgo+Cj4gT24gSnVuIDMwIDIwMjAsIERtaXRyeSBWeXVrb3Ygd3JvdGU6Cj4K
PiA+IE9uIFR1ZSwgSnVuIDMwLCAyMDIwIGF0IDM6MTQgUE0gQW5kcmVhcyBTY2h3YWIgPHNjaHdh
YkBzdXNlLmRlPiB3cm90ZToKPiA+Pgo+ID4+IE9uIEp1biAzMCAyMDIwLCBEbWl0cnkgVnl1a292
IHdyb3RlOgo+ID4+Cj4gPj4gPiBLQVNBTiB3b3VsZCBiZSBhIHByZXJlcXVpc2l0ZSBmb3IgdGVz
dGluZyByaXNjLXYgb24gc3l6Ym90Lgo+ID4+Cj4gPj4gWW91IG5lZWQgdG8gaW1wbGVtZW50IHRo
ZSBHQ0Mgc3VwcG9ydCBmaXJzdC4KPiA+Cj4gPiBJbnRlcmVzdGluZy4gQmrDtnJuIGNsYWltZWQg
S0FTQU4gd29ya3MgYWxyZWFkeS4gIEFuZCB0aGVyZSBpczoKPiA+Cj4gPiBjb21taXQgOGFkOGI3
MjcyMWQwZjA3ZmEwMmRiZTcxZjkwMTc0M2Y5YzcxYzhlNgo+ID4gQXV0aG9yOiBOaWNrIEh1Cj4g
PiBEYXRlOiAgIE1vbiBKYW4gNiAxMDozODozMiAyMDIwIC0wODAwCj4gPiAgICAgcmlzY3Y6IEFk
ZCBLQVNBTiBzdXBwb3J0Cj4gPgo+ID4gSXMgdGhlcmUgYW55IGtub3duIGlzc3VlIHdpdGggZ2Nj
Pwo+Cj4gaHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9OTE0NDEK
Pgo+ICQgZ2NjIC1mc2FuaXRpemU9a2VybmVsLWFkZHJlc3MgLXhjIC0gPC9kZXYvbnVsbAo+IGNj
MTogd2FybmluZzog4oCYLWZzYW5pdGl6ZT1hZGRyZXNz4oCZIGFuZCDigJgtZnNhbml0aXplPWtl
cm5lbC1hZGRyZXNz4oCZIGFyZSBub3Qgc3VwcG9ydGVkIGZvciB0aGlzIHRhcmdldAoKaHR0cHM6
Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9OTE0NDEjYzMKRml4ZWQgOykK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
