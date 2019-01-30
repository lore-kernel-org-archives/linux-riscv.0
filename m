Return-Path: <SRS0=j0kh=QG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82F6C282C7
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 30 Jan 2019 02:02:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B27C220880
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 30 Jan 2019 02:02:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AxnwOBXS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="B4KRYFA6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B27C220880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=a1D33YQflsGIukcdclqOpIfzai9fOUN09eh5aNvkpE8=; b=AxnwOBXSJ3RUFnqPC0a/XlHWw
	M/M3wMxakhWxy5HWVThDwH1HWnI7hStMCy4r+A5UYtJhTf8n5RKkzcQ5Lu8LQP/EVNLJYydw+YPZo
	bledVEmolstPO6zGV+GW5vvO/FhMNFvfGPA2i4sziVRMxCibM4jEXheYZl+US+uvoemn9PGWaNkXb
	UL/PjAaFlYWqvW6/Fo4dKfphFpkeWGnP0jpKyUO4Jyn4dfrRmzhzG7ofvjNyp1qZrF4VadM/e+fE9
	lMeY5gPtPv+qB2zYqUi8HEXxbVM7y8t4eZO3+/MV/nKrNt++Ty9jro9U8Fig2K6aRgkiY8RkxDdTC
	lDtiOZU8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gofDJ-0000Y6-3b; Wed, 30 Jan 2019 02:02:53 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gofDF-0000Xb-TR
 for linux-riscv@lists.infradead.org; Wed, 30 Jan 2019 02:02:51 +0000
Received: by mail-pf1-x441.google.com with SMTP id b85so10645554pfc.3
 for <linux-riscv@lists.infradead.org>; Tue, 29 Jan 2019 18:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=5OzZqvCBCR+QOKvySRrz5GXV63rEY/dMNudlUCaOzP8=;
 b=B4KRYFA6KHmkKgeb6H7aKh4n+Gb0rSPcqK+7G0VW8EJjBHtbeb1rwToLMFAtaMg01Q
 EbmAh/pzyUTVOw8UqkBMsUQ+LZx1lsi4WDRBKjFCtFa6+JgY9f1Hh94Ofwk82J9O65th
 wbPfy3oFLmS8UiyH1ioiLAYVrd/HZb0s9BBT2bCDbWhtIO39bQ6JoVKxq9gtbjakpMgZ
 R2IFXhSWPeqmTG+a8+JWqrS7iqUGUDehJ9OJ64wOcIPfbOtENBOorCqXrGwzQLI3SOL3
 fQfO4pVBebr5uC2M50F6U50ykeCfNCKNDSwKLFTJNzxYbOB0pGzm6tICzwUHoOuIrjJB
 Cgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=5OzZqvCBCR+QOKvySRrz5GXV63rEY/dMNudlUCaOzP8=;
 b=Pm0VbJEt3xFcKCRhtI2UEH4g93WfTGvS7x6sxWKVlxklJG+n8vMNUWpamY9eWXudjo
 gTILocS6SQGZhHyISxI4V3cuDU9jWLyB2G5XhtDvpPxkTou/L7XRM67PGwlZiAEh9nbE
 HcV3an0lb366+Q4OxMmdn3hi4wjuHDaoZ/jYMPseUyykZrYaYCM18dXVjP3p98T8Xfk3
 dl4Qg+kUn7kHV04WBmNoH+HNBTaAKX/bmUMkjdQ070j8oRAybnbLMnqHESmOSuRzdmQB
 FsF4opFIcABkPcQJu/PvuyikHEUl+cXypHOQKdoyh3uXrftLYBFSztEykhvc9z763frI
 t7UA==
X-Gm-Message-State: AJcUukePKM3uck2jNoyUxkNgtoFbYsCuJSMNhGgJE0eDOEwz4sNf5gVV
 iYcKeUg8bQU8+gB7HTC8elwJPpkzNVE=
X-Google-Smtp-Source: ALg8bN6l5UfYGg4eAiVSHFBxdu04xmlE25x9YCrPOLjhydwiUT4dyCi4CEtH2yiz67VPLLCbdU3iGQ==
X-Received: by 2002:a63:e711:: with SMTP id b17mr25153896pgi.363.1548813768075; 
 Tue, 29 Jan 2019 18:02:48 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id p77sm116458pfi.85.2019.01.29.18.02.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Jan 2019 18:02:47 -0800 (PST)
Date: Tue, 29 Jan 2019 18:02:47 -0800 (PST)
X-Google-Original-Date: Tue, 29 Jan 2019 18:02:40 PST (-0800)
Subject: Re: [RFC PATCH 0/3] RV64G eBPF JIT
In-Reply-To: <20190115083518.10149-1-bjorn.topel@gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: bjorn.topel@gmail.com
Message-ID: <mhng-7bbd5b99-85c7-4071-9427-11442b2a0f91@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_180249_961136_748EEFBA 
X-CRM114-Status: GOOD (  18.78  )
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
Cc: bjorn.topel@gmail.com, linux-riscv@lists.infradead.org, davidlee@sifive.com,
 daniel@iogearbox.net, netdev@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAxNSBKYW4gMjAxOSAwMDozNToxNSBQU1QgKC0wODAwKSwgYmpvcm4udG9wZWxAZ21h
aWwuY29tIHdyb3RlOgo+IEhpIQo+Cj4gSSd2ZSBiZWVuIGhhY2tpbmcgb24gYSBSVjY0RyBlQlBG
IEpJVCBjb21waWxlciwgYW5kIHdvdWxkIGxpa2Ugc29tZQo+IGZlZWRiYWNrLgo+Cj4gQ29kZXdp
c2UsIGl0IG5lZWRzIHNvbWUgcmVmYWN0b3JpbmcuIEN1cnJlbnRseSB0aGVyZSdzIGEgYml0IHRv
byBtdWNoCj4gY29weS1hbmQtcGFzdGUgZ29pbmcgb24sIGFuZCBJIGtub3cgc29tZSBwbGFjZXMg
d2hlcmUgSSBjb3VsZCBvcHRpbWl6ZQo+IHRoZSBjb2RlIGdlbmVyYXRpb24gYSBiaXQgKG1vc3Rs
eSBCUEZfSyB0eXBlIG9mIGluc3RydWN0aW9ucywgZGVhbGluZwo+IHdpdGggaW1tZWRpYXRlcyku
Cj4KPiBGcm9tIGEgZmVhdHVyZXMgcGVyc3BlY3RpdmUsIHR3byB0aGluZ3MgYXJlIG1pc3Npbmc6
Cj4KPiAqIHRhaWwgY2FsbHMKPiAqICJmYXItYnJhbmNoZXMiLCBpLmUuIGNvbmRpdGlvbmFsIGJy
YW5jaGVzIHRoYXQgcmVhY2ggYmV5b25kIDEzYi4KPgo+IFRoZSB0ZXN0X2JwZi5rbyAob25seSB0
ZXN0ZWQgb24gNC4yMCEpIHBhc3NlcyBhbGwgdGVzdHMuCj4KPiBJJ3ZlIGRvbmUgYWxsIHRoZSB0
ZXN0cyBvbiBRRU1VICh2ZXJzaW9uIDMuMS41MCksIHNvIG5vIHJlYWwgaGFyZHdhcmUuCj4KPiBT
b21lIHF1ZXN0aW9ucy9vYnNlcnZhdGlvbnM6Cj4KPiAqIEkndmUgYWRkZWQgIkhBVkVfRUZGSUNJ
RU5UX1VOQUxJR05FRF9BQ0NFU1MiIHRvCj4gICBhcmNoL3Jpc2N2L0tjb25maWcuIElzIHRoaXMg
YXNzdW1wdGlvbiBjb3JyZWN0Pwo+Cj4gKiBlbWl0X2ltbSgpIGp1c3QgcmVsaWVzIG9uIGx1aSwg
YWRkcyBhbmQgc2hpZnRzLiBObyBmYW5jeSB4b3JpIGNvc3QKPiAgIG9wdGltaXphdGlvbnMgbGlr
ZSBHQ0MgZG9lcy4KPgo+ICogU3VnZ2VzdGlvbnMgb24gaG93IHRvIGltcGxlbWVudCB0aGUgdGFp
bCBjYWxsLCBnaXZlbiB0aGF0IHRoZQo+ICAgcHJvbG9ndWUvZXBpbG9ndWUgaGFzIHZhcmlhYmxl
IHNpemUuIEkgd2lsbCBkaWcgaW50byB0aGUgZGV0YWlscyBvZgo+ICAgbWlwcy9hcm02NC94ODYu
IDotKQo+Cj4gTmV4dCBzdGVwcyAocHJpb3IgcGF0Y2ggcHJvcGVyKSBpcyBjbGVhbmluZyB1cCB0
aGUgY29kZSwgYWRkIHRhaWwKPiBjYWxscywgYW5kIG1ha2luZyBzdXJlIHRoYXQgYnBmdG9vbCBk
aXNhc3NlbWJseSB3b3JrcyBjb3JyZWN0bHkuCj4KPiBBbGwgaW5wdXQgYXJlIHdlbGNvbWUuIFRo
aXMgaXMgbXkgZmlyc3QgUklTQy1WIGhhY2ssIHNvIEkgc3VyZSB0aGVyZQo+IGFyZSBhIGxvdCB0
aGluZ3MgdG8gaW1wcm92ZSEKPgo+Cj4gVGhhbmtzLAo+IEJqw7Zybgo+Cj4KPiBCasO2cm4gVMO2
cGVsICgzKToKPiAgIHJpc2N2OiBzZXQgSEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUwo+
ICAgcmlzY3Y6IGFkZCBidWlsZCBpbmZyYSBmb3IgSklUIGNvbXBpbGVyCj4gICBicGYsIHJpc2N2
OiBhZGRlZCBlQlBGIEpJVCBmb3IgUlY2NEcKPgo+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAg
ICAgICB8ICAgIDIgKwo+ICBhcmNoL3Jpc2N2L01ha2VmaWxlICAgICAgICAgICB8ICAgIDQgKwo+
ICBhcmNoL3Jpc2N2L25ldC9NYWtlZmlsZSAgICAgICB8ICAgIDUgKwo+ICBhcmNoL3Jpc2N2L25l
dC9icGZfaml0X2NvbXAuYyB8IDE2MTIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Cj4gIDQgZmlsZXMgY2hhbmdlZCwgMTYyMyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBhcmNoL3Jpc2N2L25ldC9NYWtlZmlsZQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9y
aXNjdi9uZXQvYnBmX2ppdF9jb21wLmMKClRoYW5rcyBmb3IgZG9pbmcgdGhpcy4gIEkgc2F3IGEg
ZmV3IHJldmlld3MgZ28gYnkgYW5kIEknbSBiZWhpbmQgb24gZW1haWwsIHNvIApJJ20gZ29pbmcg
dG8gZHJvcCB0aGlzIHVudGlsIGEgdjIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
