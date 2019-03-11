Return-Path: <SRS0=WyFe=RO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C32CCC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 13:22:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 926B320857
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 13:22:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="glHBUgUA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ZVt2oSst"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 926B320857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=8VZgE0alBIaQJzKWZYIU6a9ylYHvp0/L5XSugdQkCpU=; b=glHBUgUAnyHOqEaSr6+YQScup
	6knQ+84Dp+Gf+QM95bwPB8791OXOekWG3gGPQcJJBSzLucTxyquPav7En2W33bXDNkYCX5umTJrap
	aBEMOdkGlSeFctqRnaaOmFARUFArWDV3o1se93skPzKNGWe3a8hNfX2dchp3PXPFrZPFBfkGSwrdn
	RYSRS/SCHC4GySNkZtP2IE4xdlO63kD+gtU/PwQW/GwlCKMK0GoK+Ybs5/VtEO/PlscmHRa/uoMz5
	SvEzuastOvJC4zovTR8BCyIHDGe60cjclt2hoIQweesjXghDFVlLTnY5km9OUmQyf+i9BaE0JSfbe
	BOc/90QFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3Kt4-0006lK-O6; Mon, 11 Mar 2019 13:22:38 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3Kt1-0006kM-Vr
 for linux-riscv@lists.infradead.org; Mon, 11 Mar 2019 13:22:37 +0000
Received: by mail-pg1-x530.google.com with SMTP id r124so4038446pgr.3
 for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2019 06:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=FnKZrDINgR+D5KCesQnzL2VKICSwE1pRbTaaU5U4Y0I=;
 b=ZVt2oSstfBmuXuiQKbv0Lqa4UbP6OxApEVQ4OGWXBwtGS1/jDZvRBEF6pRLfTVirSr
 6lR1RUwTCPWnejmfPYAjdSnL5kRyCjjpLvruwVgiEuWzSuU21xPIOeFUYUvxS9JMF4Q9
 ErB3bt3IVjGDy5UVhMEV5QHaXhi38nCRe2kQa+MMEHqRVUf8PBMFNIA8tSxgHoQKwON1
 7br01JXT4HOcYtfsqzosQ1FmOGe778pWjALFIqx3jvg0Ap1GnyPsLCBKwGlrA1tQI+m2
 24MySgY32Nq/pKjLYae74BkjTfr0O4ebbODFzl6TL4PlP5W3o0cwERnlrtmqvPXSyH6g
 Ue0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=FnKZrDINgR+D5KCesQnzL2VKICSwE1pRbTaaU5U4Y0I=;
 b=HEEaDW10gfep6RY36delBLpWI4rkCXtPOLXioQEtQ5+6KVO2q9yfsvhKBhOUn/eJzT
 kwUcPFESDEaVL8AF8nk2iGnTgo02j52lokAZ/BKyQjrnHWyomY0lpZRnVdHMB6LbOWCS
 iy3XoYCNYHePVjyNm7WMiLC6jzuDnqqGZdVl6I0uGOEp50WFpU25kLtWjRBYapM0tWV5
 HDkFcT03egFFBiwpdaiY8x0Feu7hSi4/CS51mE+seU4m/waqFxrEpWd9CWPgjZqgvtx6
 JQy0BtMxDxt5nQFcm7W20jD5eyrsIm/Fvc0G+Xqih+92jpziqbQ1UhD6yrugLxWm3e8v
 QOvw==
X-Gm-Message-State: APjAAAVd7cS2UO5OsRsvrVNVtO/Rs7YIr65rIB29VHbkeHk0uOho1pbI
 bBaT2einleMn5kJmvWED6tAGWQ==
X-Google-Smtp-Source: APXvYqxUCx2YgwS/9BOlgrMl+VxvUqcYV9o0a+I6bNYxgUo51E343AzIetK1f5lCkKFoQqga/rZ7yQ==
X-Received: by 2002:a62:76c9:: with SMTP id
 r192mr33731262pfc.251.1552310554393; 
 Mon, 11 Mar 2019 06:22:34 -0700 (PDT)
Received: from localhost (60-250-203-158.HINET-IP.hinet.net. [60.250.203.158])
 by smtp.gmail.com with ESMTPSA id
 n6sm7766370pgh.79.2019.03.11.06.22.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Mar 2019 06:22:33 -0700 (PDT)
Date: Mon, 11 Mar 2019 06:22:33 -0700 (PDT)
X-Google-Original-Date: Mon, 11 Mar 2019 06:15:52 PDT (-0700)
Subject: Re: per-cpu thoughts
In-Reply-To: <CAJ+HfNgSx49dRXDdJGovb=auAjSB703bN9tULjibW1OKHuHcPg@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: bjorn.topel@gmail.com
Message-ID: <mhng-79f13983-1ea9-4f9a-949a-87dac2060f42@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_062236_086625_429B6C7D 
X-CRM114-Status: GOOD (  15.83  )
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
Cc: mick@ics.forth.gr, cl@linux.com, paul@pwsan.com,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAwNyBNYXIgMjAxOSAyMzoxNzo1MiBQU1QgKC0wODAwKSwgYmpvcm4udG9wZWxAZ21h
aWwuY29tIHdyb3RlOgo+IE9uIEZyaSwgMjIgRmViIDIwMTkgYXQgMjA6NTYsIENocmlzdG9waGVy
IExhbWV0ZXIgPGNsQGxpbnV4LmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIEZyaSwgMjIgRmViIDIwMTks
IEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+Cj4+ID4gPiBUaGUgcHJvYmxlbSBpcyB0aGF0IHRoZSBy
ZWdpc3RlciBuZWVkcyB0byBiZSByZWZlcmVuY2VkIGJ5IHRoZSBhbW8KPj4gPiA+IGluc3RydWN0
aW9uLiBDYW4gYW1vYWRkIGluY3JlbWVudCBhbiBhZGRyZXNzIHJlbGF0aXZlIHRvIGEgc2NyYXRj
aAo+PiA+ID4gcmVnaXN0ZXI/Cj4+ID4gPgo+PiA+Cj4+ID4gSXQgY2Fubm90LiBTbywgd2UnbGwg
ZW5kIHVwIHdpdGggKGF0IGxlYXN0KSBhIHByZWVtcHQgZGlzYWJsZWQgcmVnaW9uLi4uCj4+Cj4+
IElmIHdlIG5lZWQgdG8gZG8gdGhhdCB0aGVuIHdlIGFscmVhZHkgaGF2ZSBzbyBtdWNoIG92ZXJo
ZWFkIGR1ZSB0byB0aGF0Cj4+IHByb2Nlc3NpbmcgdGhhdCBpdCBtYXkgbm90IGJlIHdvcnRod2hp
bGUuIGxjL3NjIG92ZXJoZWFkIGlzIG1pbm9yIGNvbXBhcmVkCj4+IHRvIHN3aXRjaGluZyBwcmVl
bXB0IG9uIGFuZCBvZmYgSSB0aGluay4KPj4KPgo+IEknbGwgZG8gc29tZSBtZWFzdXJlbWVudHMu
IFRoZSBnZW5lcmljIG9uZSBkaXNhYmxlcyBpbnRlcnJ1cHRzLCBzbyBhCj4gcHJlZW1wdF97ZGlz
LGVufWFibGUgYW5kIEFNTyBkYW5jZSBtaWdodCAod2VsbCwgd2UnbGwgc2VlIDotKSkgYmUKPiBi
ZXR0ZXIgc3RpbGwuIEkgZGVmaW5pdGVseSBzZWUgeW91ciBwb2ludHMgZnJvbSB0aGUgcHJlc2Vu
dGF0aW9uIG5vdy4KClRoYW5rcyBhIGJ1bmNoISAgSSBmZWVsIGxpa2UgdGhlIGJlc3Qgb3B0aW9u
IGhlcmUgaXMgdG8ganVzdCB1c2UgdGhlIEFNT3MgCndpdGhvdXQgZGlzYWJsaW5nIHByZWVtcHRp
b24gYW5kIGVuc3VyaW5nIHRoYXQgYWxsIG90aGVyIGFjY2Vzc2VzIGFyZSBhdG9taWMgCih2aWEg
QU1PcyBvciBMUi9TQykuICBUaGUgb25seSByZWFzb24gSSBjYW4gc2VlIHRoYXQgd291bGRuJ3Qg
YmUgdGhlIHdheSB0byBnbyAKd291bGQgYmUgaWYgaXQgcmVxdWlyZXMgbm9uLWFyY2ggbW9kaWZp
Y2F0aW9ucywgYXMgaWYgd2UgZ28gZG93biB0aGF0IHBhdGggCndlJ2xsIGJlIGFibGUgdG8gaGFu
ZGxlIHRoZSBwZXJmb3JtYW5jZSBlZGdlIGNhc2VzIGluIHRoZSBpbXBsZW1lbnRhdGlvbi4KCj4g
U2ltaWxhciB0byBBUk0sIFJJU0MtViBjYW5ub3QgdXNlIHByZWVtcHRfZW5hYmxlX25vX3Jlc2No
ZWQgOi0oLCBzbwo+IHdlJ2xsIGhhdmUgdG8gc2VlIHdoZXJlIHdlIGVuZCB1cCBwZXJmb3JtYW5j
ZS13aXNlLi4uCgpJJ20gaGF2aW5nIG5vIGx1Y2sgZmlndXJpbmcgb3V0IHdoeSB3ZSBjYW4ndCB1
c2UgdGhhdCAob3IgZXZlbiB3aGVyZSB3ZSdkIHVzZSAKaXQpLiAgSSd2ZSBsb3N0IG11Y2ggb2Yg
dGhlIGNvbnRleHQgb2YgdGhlIHRocmVhZCwgc28gc29ycnkgaWYgdGhpcyBpcyBtZWFudCB0byAK
YmUgb2J2aW91cywgYnV0IGRvIHlvdSBtaW5kIGV4cGxhaW5pbmc/ICBJZiB0aGVyZSdzIGEgdHJp
Y2sgdGhlbiBJJ2QgYXQgbGVhc3QgCmxpa2UgdG8ga25vdyBhYm91dCBpdCwgZXZlbiBpZiB3ZSBj
YW4ndCB0YWtlIGFkdmFudGFnZSBvZiBpdCA6KQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
