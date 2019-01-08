Return-Path: <SRS0=dvb3=PQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD67C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 03:45:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F048A2173C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 03:45:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sd1VPfiZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="upaYJTZY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F048A2173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fwZ3H92fHb8thlydMAcus5n5rCYc0y5tiQARdFqlg/k=; b=sd1VPfiZZRNNVl
	XZFOwCgFXgG5g6dh1ZrLiLLzbXg9PI9p40mPLx3IpXWTtLqmDWeGBkCtjjGP4qbB+4xCQ2/SHWsGj
	E7iGTtoxMeWV3RgQzS0NyHFMvK3bqk1fqNzRh2lOlX5LlAuIIodyzJMjou5g7F9tn4Dlo8WhUkDEa
	SpPLcrVLOx6P46L+dniJ9+bDYITihoEzo3WCl74uqWuK4i/+jcv9fkKfmnGdj210kuwkvEpstCZKk
	t4cPhG3hPp0CNle1GtshweYEsaKsQO2//3lotayhIfgfRslDkEVs3EbZUuUbmtbVVijRxBENBS6Si
	T0uYljw2xfXzOTEcL6Iw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggiKj-0002js-H1; Tue, 08 Jan 2019 03:45:41 +0000
Received: from mail-it1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggiKg-0002iu-Ej
 for linux-riscv@lists.infradead.org; Tue, 08 Jan 2019 03:45:39 +0000
Received: by mail-it1-x143.google.com with SMTP id w18so4427103ite.1
 for <linux-riscv@lists.infradead.org>; Mon, 07 Jan 2019 19:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qBzP3hEnz8EtXsRfnybObj8hrlTb4I2PGnva9hzv1CM=;
 b=upaYJTZYjcD24FuwGZDJN7Y29il/nydgT6quxUv5731xqNt5JYdU4R+sa+jhGEKoXE
 DL5jAcrwg/UnoHFCQJ+TDSW3GCJZDSgPiGjI7vNlLyGIKIKyTE9t14ixLdFOew+T9Z6M
 HuXqMucq3MywaD9N9sqvAdi1qzvHNaOqDvPC98bLYheL2fWFbA7BvQtWczSrcRl2HGWO
 s8CuedP1tjOMqAvU0S/vB97zoxDYGIRwbfOsvLP8VLkvOs1FGM7MQ4uYcO59JCXo7iIY
 p8Gm4/z+AQFNqKkUEq7rWbXH6QSWBkZjycjNsD7ZQUMrxmANOEYtLoF4UJ/9dn4vyz5/
 ixmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qBzP3hEnz8EtXsRfnybObj8hrlTb4I2PGnva9hzv1CM=;
 b=IGbq/wWDNkHCVi1FlD/AGxaoPkroxnu5jxaqoED84e0Gl5KQzUvG0bJhYy9GyOfM0k
 R2uAKYHuXhkiYltKjeDD7pzRORYcODTUSdK1y8QB06L5safilifmeD475sK9dDUzLE5n
 ZOmKrNIlvo4644HaeQYXkMqIfapWgOwdafijzkORAKDV6kHnig1iMCfvZv0RMRiYo73O
 GYS7g1hwnW8p+T9PSmEdqBA8QtPwenlXlzdZicn5Pz1vrVwdeBrBXQaFDgnKIrQ+7N4d
 7SpDu6LhWP69Q/QIC6tkHO0i85rIlqgnbA6fEdxC/WBslhjwQe93hUcYuiAPSeZcSPQo
 H1zw==
X-Gm-Message-State: AJcUukd3dUz9lE4GtdPH3kig/EZdcvrQg5Ml+rbebWZOl+CzdfNKM8Rv
 JWC1qZeYHy5RJyaFNtFiz6rioTKQEHxz0fluDcmsWA==
X-Google-Smtp-Source: ALg8bN6gwrGbxNIxLTiMfA/aXac6krGMnEoC8wCcDKCX97ttlUvoG90MNYnDiTqXO+pBuATuJpxdok34j7PguqSm/a8=
X-Received: by 2002:a24:9005:: with SMTP id x5mr300788itd.102.1546919133351;
 Mon, 07 Jan 2019 19:45:33 -0800 (PST)
MIME-Version: 1.0
References: <1546696272-19152-1-git-send-email-gsatish.ldd@gmail.com>
 <alpine.DEB.2.21.9999.1901062233110.7801@viisi.sifive.com>
 <CAK1XJzUHgkSe9GODaUHH89b4XD0zW0EvO5RMzt5f7hpWiVsfNg@mail.gmail.com>
 <alpine.DEB.2.21.9999.1901071036170.11080@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1901071036170.11080@viisi.sifive.com>
From: satish kumar <gsatish.ldd@gmail.com>
Date: Tue, 8 Jan 2019 09:15:19 +0530
Message-ID: <CAK1XJzWreGAXY+1x=DGwcfea2Bz51DrYidXJGLiJg3g0UYRWPw@mail.gmail.com>
Subject: Re: [PATCH] RISCV:IRQ: Adds Err column to /proc/interrupts
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190107_194538_494807_AA5258CE 
X-CRM114-Status: GOOD (  10.57  )
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCA4IEphbiAyMDE5IGF0IDAwOjA5LCBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1zbGV5
QHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCA3IEphbiAyMDE5LCBzYXRpc2gga3VtYXIg
d3JvdGU6Cj4KPiA+IE9uIE1vbiwgNyBKYW4gMjAxOSBhdCAxMjowNCwgUGF1bCBXYWxtc2xleSA8
cGF1bC53YWxtc2xleUBzaWZpdmUuY29tPiB3cm90ZToKPiA+ICAgICAgIE9uIFNhdCwgNSBKYW4g
MjAxOSwgRyBTYXRpc2hLdW1hciB3cm90ZToKPiA+Cj4gPiAgICAgICA+ICAgICAgIFRoaXMgcGF0
Y2ggYWRkcyBleHRyYSByb3cgc2hvd2luZyBlcnJvciBjb3VudCB0byBvdXRwdXQgb2YKPiA+ICAg
ICAgID4gICAgICAgL3Byb2MvaW50ZXJydXB0cyB1c2luZyBzZXFfcHJpbnRmKCkuCj4gPiAgICAg
ICA+ICAgICAgIHNlcV9wcmludGYoKSBBUEkgaXMgdXNlZCB3aGVuIHByaW50aW5nIHRvIC9wcm9j
LyBmaWxlcyBhcyBhCj4gPiAgICAgICA+ICAgICAgIGhlbHBlciBmdW5jdGlvbnMgdG8gcmV0dXJu
IGZvcm1hdHRlZCBvdXRwdXQgZnJvbSDigJhwcm9jX3JlYWTigJkKPiA+ICAgICAgID4gICAgICAg
Y2FsbGJhY2suCj4gPiAgICAgICA+Cj4gPiAgICAgICA+ICAgICAgIEl0IGFkZHMgRXJyOiByb3cg
dG8gL3Byb2MvaW50ZXJydXB0cwo+ID4KPiA+ICAgICAgIFdoeT8gIEl0J3MgYWx3YXlzIGdvaW5n
IHRvIHByaW50ICIwIiB3aXRoIHRoaXMgcGF0Y2guICBEb2VzIHRoZSBtaXNzaW5nCj4gPiAgICAg
ICBsaW5lIGJyZWFrIHNvbWV0aGluZz8KPiA+Cj4gPiBJdCBhZGRzIGV4dHJhIGluZm8gaW4gdGhl
IC9wcm9jL2ludGVycnVwdHMgd2hpY2ggcHJvdmlkZXMgIGVycm9yIGNvdW50Lgo+ID4gSXQgaXMg
dXNlZCBmb3IgcHJpbnRpbmcgaW5mb3JtYXRpb24uCj4KPiBJZiB0aGlzIHBhdGNoIGtlcHQgdHJh
Y2sgb2YgaW50ZXJydXB0LXJlbGF0ZWQgZXJyb3JzLCBJJ2QgYWdyZWUuICBCdXQgaWYKPiBpdCBh
bHdheXMgcHJpbnRzIDAsIGFzIGl0IGN1cnJlbnRseSBkb2VzLCB0aGVuIHRoZXJlIGRvZXNuJ3Qg
c2VlbSBtdWNoCj4gcG9pbnQ/ClllcywgaXQgZG9lcy4gVGhpcyBwYXRjaCBnaXZlcyBpbmZvcm1h
dGlvbiBvZiBJbnRlcnJ1cHQgZXJyb3IgY291bnQKaW4gYWxsIGNhc2VzIC4KClJlZ2FyZHMKU2F0
aXNoIEcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
