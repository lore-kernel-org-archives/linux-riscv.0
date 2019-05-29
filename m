Return-Path: <SRS0=MB+m=T5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48182C28CC0
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 29 May 2019 09:41:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19EE82070D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 29 May 2019 09:41:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GrWivG9G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pEGWv8XI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19EE82070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DTdhNV24lkv6D7zYtHDBlQo7lGIg5E8O8UAIP0YhySA=; b=GrWivG9GzEe7hH
	AfgdUPq0eYJRiH5lzro9BtoBtnuvIFAk+z9bjETJWbTWAsWnlxY3Yg+WsMcjhY1j1l1OJZRpgANcW
	N9n28Pm7k1FxGd0mRbguCHOBDEEw/3/VMtOsCadJcn8Cq2HlQN7KXrMaAcY++wd6755gNt8rISZB3
	Qc5Q18EhIShEWVptSfHZZnVXjgptj81VkR66GLepNmcLsCZHXWi1+SKrix5m9hFmeqcH0zHDiQ7cK
	b4prHzsRqtCpEloFR6nagtBiEhhQTgwcspQXhCgJxcqdr+w+6ZXDSzda+r3tOfCk3TJBQNK+zvaKZ
	YKNgK8LyVWbZYB7DjrgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVv5L-0004Ae-Lj; Wed, 29 May 2019 09:41:27 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVv5I-00049d-96
 for linux-riscv@lists.infradead.org; Wed, 29 May 2019 09:41:26 +0000
Received: by mail-wr1-x443.google.com with SMTP id h1so1242738wro.4
 for <linux-riscv@lists.infradead.org>; Wed, 29 May 2019 02:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=f4sEI9yG6GpMwqHITTXcIshL6zD0jAjZRybb4dnfs7U=;
 b=pEGWv8XIyBlPvoBMuLhmJCRnsakkEZvpMkDr63LRYi25eLXJnV1RzXsBbMgi3iZIYj
 ExH1tQ4KjTdkrims0DrRkrkNoZnhI+CBoSPEf6r/PhVTlaOqT+0kuIuFdy9JnCnHm/C2
 fuRwh2MJDJMKDmybw+7wm4OwR3GmgqPrIrk5QfkQGOCK03VtX3rgtaM/fD9XMqa+8M+C
 iFyBrpOj0AZlxJrHjoQF4OUIAI0I0W9c2moVukJcm61YqREWq9PaXv/t00+2GioyiBmO
 LLNVM3R0n4kBjL23YyCePBMkCjXy24zxsZZZFkuPd3eMPl9rPVUw5izRkehAk0TDfoPY
 k07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=f4sEI9yG6GpMwqHITTXcIshL6zD0jAjZRybb4dnfs7U=;
 b=PaSvjG0lAk/D2q5VnVV3JtYFie4dR5V8+hLE6BpJ+aofaPIuLWivZG7I7t9zu6PQbz
 i1vPClXwWRgAs67AXR+G5JXRvRidbwtXT9t/5+n9hrT/HfumjTy5ohsmMgoCio2e3Myi
 sGtpInAhX6GT/hfZsRcw5Li1HRvk6i0t6cZjpZQXDr3+/8G9vYHxA6Z1ETaxWbfPgtpJ
 nY8UCdAU5svnxBNhRRYRzo3A8HVrQ22vORE2V8vHPMyxuKrrIyzmlo6UuJXNFZeLT9B3
 R21GtL3S7JAt3GIactMxIP1meYhYmYxT738ScgXBb363/9n42F2HQ/W54HED49885SQ2
 EVGA==
X-Gm-Message-State: APjAAAV7mllUBXRB955KgxIaZrozF2URIVjWA1+ExSFGblkwm7rTb7Ti
 hbXTZyURgNyMrvCbaPkoljsFHg==
X-Google-Smtp-Source: APXvYqybPz/dJgD/pPZK0boCv7Be6LJq3uXqA8v5HAX5Laduz+DAmgPPLkF2uW55sxcJpAGjkvuELQ==
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr73549530wrj.182.1559122877662; 
 Wed, 29 May 2019 02:41:17 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f20sm4727482wmh.22.2019.05.29.02.41.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 02:41:17 -0700 (PDT)
From: Loys Ollivier <lollivier@baylibre.com>
To: Karsten Merker <merker@debian.org>
Subject: Re: Testing the recent RISC-V DT patchsets
In-Reply-To: <20190528153542.jfkkwycyc3vu6hld@excalibur.cnev.de>
References: <alpine.DEB.2.21.9999.1904221705170.18377@viisi.sifive.com>
 <alpine.DEB.2.21.9999.1905280105110.20842@viisi.sifive.com>
 <86o93mpqbx.fsf@baylibre.com>
 <20190528153542.jfkkwycyc3vu6hld@excalibur.cnev.de>
Date: Wed, 29 May 2019 11:41:11 +0200
Message-ID: <86zhn54myw.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190529_024124_314853_A97C5B8D 
X-CRM114-Status: GOOD (  15.52  )
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlIDI4IE1heSAyMDE5IGF0IDE3OjM1LCBLYXJzdGVuIE1lcmtlciA8bWVya2VyQGRlYmlh
bi5vcmc+IHdyb3RlOgoKPiBPbiBUdWUsIE1heSAyOCwgMjAxOSBhdCAwNToxMDo0MlBNICswMjAw
LCBMb3lzIE9sbGl2aWVyIHdyb3RlOgo+PiBPbiBUdWUgMjggTWF5IDIwMTkgYXQgMDE6MzIsIFBh
dWwgV2FsbXNsZXkgPHBhdWwud2FsbXNsZXlAc2lmaXZlLmNvbT4gd3JvdGU6Cj4+IAo+PiA+IEFu
IHVwZGF0ZSBmb3IgdGhvc2UgdGVzdGluZyBSSVNDLVYgcGF0Y2hlczogaGVyZSdzIGEgbmV3IGJy
YW5jaCBvZiAKPj4gPiByaXNjdi1way9iYmwgdGhhdCBkb2Vzbid0IHRyeSB0byByZWFkIG9yIG1v
ZGlmeSB0aGUgRFQgZGF0YSBhdCBhbGwsIHdoaWNoIAo+PiA+IHNob3VsZCBiZSB1c2VmdWwgdW50
aWwgVS1Cb290IHNldHRsZXMgZG93bi4KPiBbLi4uXQo+PiA+IEhlcmUgaXMgYW4gTGludXgga2Vy
bmVsIGJyYW5jaCB3aXRoIHVwZGF0ZWQgRFQgZGF0YSB0aGF0IGNhbiBiZSBib290ZWQgCj4+ID4g
d2l0aCB0aGUgYWJvdmUgYm9vdGxvYWRlcjoKPj4gPgo+PiA+ICAgIGh0dHBzOi8vZ2l0aHViLmNv
bS9zaWZpdmUvcmlzY3YtbGludXgvdHJlZS9kZXYvcGF1bHcvZHRzLXY1LjItcmMxLWV4cGVyaW1l
bnRhbAo+PiA+Cj4+ID4gQSBzYW1wbGUgYm9vdCBsb2cgZm9sbG93cywgdXNpbmcgYSAnZGVmY29u
ZmlnJyBidWlsZCBmcm9tIHRoYXQgYnJhbmNoLiAgCj4+IAo+PiBUaGFua3MgUGF1bCwgSSBjYW4g
Y29uZmlybSB0aGF0IGl0IHdvcmtzLgo+PiAKPj4gU29tZXRoaW5nIGlzIHN0aWxsIHVuY2xlYXIg
dG8gbXlzZWxmLgo+PiBVc2luZyBGU0JMICsgcmlzY3YtcGsvYmJsIHRoZSBsaW51eCBrZXJuZWwg
KyBkZXZpY2UgdHJlZSBib290cy4KPj4gTmVpdGhlciBGU0JMIG5vciByaXNjdi1way9iYmwgYXJl
IG1vZGlmeWluZyB0aGUgRFQuCj4+IAo+PiBVc2luZyBGU0JMICsgT3BlblNCSSArIFUtQm9vdCB0
aGUgc2FtZSBrZXJuZWwgKyBkZXZpY2UgdHJlZSBoYW5ncyBvbgo+PiBydW5uaW5nIC9pbml0Lgo+
PiAKPj4gV291bGQgeW91IGhhdmUgYW55IHBvaW50ZXIgb24gd2hhdCByaXNjdi1wayBkb2VzIHRo
YXQgT3BlblNCSS9VLWJvb3QgZG9lc24ndCA/Cj4+IE9yIG1heWJlIGl0IGlzIHRoZSBvdGhlciB3
YXkgYXJvdW5kIC0gT3BlblNCSS9VLWJvb3QgZG9lcyBzb21ldGhpbmcgdGhhdAo+PiBleHRyYSB0
aGF0IHNob3VsZCBub3QgaGFwcGVuLgo+Cj4gSGVsbG8sCj4KPiBJIGRvbid0IGtub3cgd2hpY2gg
dmVyc2lvbiBvZiBPcGVuU0JJIHlvdSBhcmUgdXNpbmcsIGJ1dCB0aGVyZSBpcwo+IGEgcHJvYmxl
bSB3aXRoIHRoZSBjb21iaW5hdGlvbiBvZiBrZXJuZWwgNS4yLXJjMSBhbmQgT3BlblNCSQo+IHZl
cnNpb25zIGJlZm9yZSBjb21taXQKPgo+ICAgaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L29wZW5z
YmkvY29tbWl0LzRlMmNkNDc4MjA4NTMxYzQ3MzQzMjkwZjE1YjU3N2Q0MGM4MjY0OWMKPgo+IHRo
YXQgY2FuIHJlc3VsdCBpbiBhIGhhbmcgb24gZXhlY3V0aW5nIGluaXQsIHNvIGluIGNhc2UgeW91
Cj4gc2hvdWxkIGJlIHVzaW5nIGFuIG9sZGVyIE9wZW5TQkkgYnVpbGQgdGhhdCBtaWdodCBiZSB0
aGUgc291cmNlCj4gb2YgdGhlIHByb2JsZW0gdGhhdCB5b3UgYXJlIGV4cGVyaWVuY2luZy4KPgoK
SGVsbG8gS2Fyc3RlbiwKVGhhdCB3YXMgaXQgISBUaGlzIGZpeGVzIHRoZSBpc3N1ZSBJIGhhZCBv
biBpbml0IGV4ZWN1dGlvbi4KR29vZCBjYXRjaCwgdGhhbmtzIGEgbG90IGZvciB0aGUgaGVscCAh
CgpSZWdhcmRzLApMb3lzCgoKPiBSZWdhcmRzLAo+IEthcnN0ZW4KPiAtLSAKPiBJY2ggd2lkZXJz
cHJlY2hlIGhpZXJtaXQgYXVzZHLDvGNrbGljaCBkZXIgTnV0enVuZyBzb3dpZSBkZXIKPiBXZWl0
ZXJnYWJlIG1laW5lciBwZXJzb25lbmJlem9nZW5lbiBEYXRlbiBmw7xyIFp3ZWNrZSBkZXIgV2Vy
YnVuZwo+IHNvd2llIGRlciBNYXJrdC0gb2RlciBNZWludW5nc2ZvcnNjaHVuZy4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
