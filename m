Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8578110F92EF
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 19:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iXxFbovHPhfcsQq9Pm7Vf4rHD+6UJt5QOvj/CGD9VAU=; b=znQYIKLG0quGdu
	VQqNBlidGs09TfIbRSo3IkNaEKKThcE3AA7lPW9JSryNiIx+/H1hOv86sJuE9DRDsW2VqKNzxo0Zc
	0f/xd4lj1o14sSvfhlU1Db7grZ4R3Bssa9We9OuQb3LeqYmbTslp5BI+7wGSigyWR1T8WqxxOWnM8
	G3PMXv7jdcYvFHn01u5GuWRB+ssTXGy5iY3CFBASKO/Q2zdWOrPkxWpq9TOBSs2b7OJ0GrJUnRs8B
	l2CsOlEDtj9ZxYUJFb5fRNgNPmWcavA3BsToL+5js8fszF9dUG3rc6+XXYMl+tX5DhLggOCJbVyax
	mO/zrfGJ0Uh5TUcXAH0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7eRd-0000000DSEg-0ZgL;
	Tue, 31 Mar 2026 19:08:09 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7eRb-0000000DSEK-0yBX
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 19:08:08 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-56cc67e01deso5411887e0c.3
        for <linux-riscv@lists.infradead.org>; Tue, 31 Mar 2026 12:08:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774984085; cv=none;
        d=google.com; s=arc-20240605;
        b=WzbF1YM27gFRm5wA3+xaAA/6F2py6Td51qYHw2EFfPEgREewGnM7wy6ATJUJGmdGvC
         wPwnEXmoiVsl6j1cWUKIQmgKLUvfYIJu2A4dDxIIKYmwiyE5nG3jpzUs+XCZ0IuWOdF0
         E+LQBH8oQ42cCjIvmGJYpeNaB8HNJSXg+0scbmlNaxqaUlyG/xdV6UrVkqybBHWJZk6A
         Jx5gMypEP0OOGOCp+KrChWkEzwaVpIvbLjf54Of5qnU6Po0PQMTYRNh4HNAzPKSGta1L
         Ot/8hlpSdEBr+lo7MkI2Qd5ia5pvqJCzuFWeZbwFgHx8+Wi4HFc+Ha/pWENG8XGYwo5x
         GCZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ODJKUE42J6Rz5kvZbkeA/0a+pxH8BWcdgMi0Zx2VGmY=;
        fh=eD0YcSJC/uWQbeaA5uDQK0kzMSyZr+YReTcF2Iw8SOI=;
        b=jSeUo1P2Lg5CQY44ujPNQyqhjHjTkkqPInpyj7u+mxFiHGg2CDcU3q3ws3qgvF/SL9
         DqEkCp+DC3xBpWOZBZilaA8yZ/dH3Tmvt+8DFz01lCujWBSQG3isOmMlbKnV8dn6cuyM
         gIS+gx+gOIo0txC+9HnCJjXw/EOG0ViZMd+Bnahp7Zm7/upZFAm2/IcWqYnG0OXXUFxP
         eMIhjjlzgFgEwuU1NZOszB//t+cRp/egzzJV+H0gputj/N9tvDMYc5LozTp12IRb3hPF
         KuBBaqYAHhBhgYmHzC8W576yFRdHOFq4XroWer36XsQoDkpHVpDt34TCfNC3/gTtLbZN
         qG9Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774984085; x=1775588885; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODJKUE42J6Rz5kvZbkeA/0a+pxH8BWcdgMi0Zx2VGmY=;
        b=YdAHJ0L6TzpO2C05jpKO01bKLYFjWdg+p0zjXE8cohzu/5bzlMPs35J5U4c04fewfR
         L/SwYR36iHd0QbHDDsen+ujdBGDNcNjM5TFief+NTGAO12dXOntK4n+yMBGBlaU8CsLh
         RKm/jRCUP2UxxsFJFCMOKQsx882M1j7wtZehCLyf8JP+z5TtBkRBPNE3UPH3zdG9Bwoq
         knOtuzwh95N5aopKtzdMwvatAOgbnMUnptQZp4SgxS5bSyouRIOaZPh8OyZ58wNEoc1u
         N4b2D+oHa22dMLLEWrDAQT1AJs02ipUp7BYA6JgVnA8JtQB1CaYmHTmaRMQD/AHonNVl
         1q+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774984085; x=1775588885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ODJKUE42J6Rz5kvZbkeA/0a+pxH8BWcdgMi0Zx2VGmY=;
        b=Q3CqCXqXL17slSb/hzp/fe37Vh6a484HaC8TagYt3F3BBBOiKfuyW69hXBjCgSeWPF
         6JV8wYLQLlB79DLTCvB/TzhX0B60tdC5ekxVsp1Ipvz66eO+fSqcZa2BD16+8BfRKZLg
         h/TI3FFAMB+iZw4I/tzt3F/q+6gJ56sh4reNFvnIRe1pkP6kxx/Pu31dGwEdH+j7Xx0m
         xr/7Gn4CoIu4OoLin1OE09AkZbHvqHdnxPGNr/PqdPqr8moqTcmLD/ySPy5ZWtgY+ZOJ
         j3cKo7l6jwd7ihcB4QFtTSeHSUsdPfISaaba2i+yNBKbbKY2SeB2+SE/aJEdiiIRO85Y
         l4Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXfcclWpkwXKNIUIAbxu14iTtC1RRFLtRD7qVQ3Hsk7QS1S88dyJ4F9QXUmNer/uopZPCMh0DSZF8Bxew==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1ZBZfULxCL4KUAj5ITgwtvIlhwNeJAJeD5lMCJWpJhkToiX7o
	KUXDy/rYLEEx8AW7l2faxulqLgFZ6dlD5lQski/qOEIAn9UvQgx870lzB7j7thOeeXiuGkh7X8U
	/59CqNwRAgDOXPZNzAnvOMzujC5Jazzw=
X-Gm-Gg: ATEYQzyFNZH3eE36TbIXLrSpeLKuTY7PgEnFWBCil30fl8JxgvKuNFZ1cixSNQJsg8i
	kIS7YB82HofiD1NRI4v+Ee9Hct0a2Zwm7K0rN5HxTNGeo03qDS8Y0ystaSfQlVIRVFARtpAt1T7
	mw9/H392h8LZyKjyFng9lK9WCh/sulysIrEQ68EeQkmZwDzoRH2F9rPZs+57Jq8c5NyJ16I/Ac4
	AjlGEczdkk4hRbD/G+q6KtI2ShF7O87JrzmyLgEf0jsWOSAJiTTk5+ECJrR7o3SMT9lblVDOKL3
	FUzqhmxe+0N/eAQIvPbNalhe+V3eHb+ekz91T6ZFZUPybzUgw6Y=
X-Received: by 2002:a05:6122:80aa:b0:566:341b:4ddd with SMTP id
 71dfb90a1353d-56d8a64f111mr484576e0c.0.1774984085028; Tue, 31 Mar 2026
 12:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260331175658.1015829-1-gaohan@iscas.ac.cn> <acwZOxbEJoAJrvGb@wunner.de>
In-Reply-To: <acwZOxbEJoAJrvGb@wunner.de>
From: Han Gao <rabenda.cn@gmail.com>
Date: Wed, 1 Apr 2026 03:07:53 +0800
X-Gm-Features: AQROBzAOzUNTpcwxA_0dIdIlemphcrqtCbFrf2oB8l5IhJydsZw1imk4dsqq1tU
Message-ID: <CAAT7Ki8_xKTOuX2kjmkfXrKMevxQZcO26jdmExx8vCXnu1_c4A@mail.gmail.com>
Subject: Re: [PATCH 0/2] PCI: Allow disabling port services on broken root ports
To: Lukas Wunner <lukas@wunner.de>
Cc: Han Gao <gaohan@iscas.ac.cn>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Kees Cook <kees@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-pci@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Icenowy Zheng <zhengxingda@iscas.ac.cn>, Inochi Amaoto <inochiama@gmail.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_120807_278887_41D3D82A 
X-CRM114-Status: GOOD (  21.33  )
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

T24gV2VkLCBBcHIgMSwgMjAyNiBhdCAyOjU44oCvQU0gTHVrYXMgV3VubmVyIDxsdWthc0B3dW5u
ZXIuZGU+IHdyb3RlOgo+Cj4gT24gV2VkLCBBcHIgMDEsIDIwMjYgYXQgMDE6NTY6NTZBTSArMDgw
MCwgSGFuIEdhbyB3cm90ZToKPiA+IFNHMjA0MidzIFBDSWUgcm9vdCBwb3J0cyBvbmx5IHN1cHBv
cnQgTVNJLCBub3QgTVNJLVguIFRoZSBNU0kKPiA+IGNvbnRyb2xsZXIgcHJvdmlkZXMgb25seSAz
MiB2ZWN0b3JzIHNoYXJlZCBhY3Jvc3MgYWxsIGRldmljZXMgYmVoaW5kCj4gPiBlYWNoIHJvb3Qg
cG9ydC4gV2hlbiBuYXRpdmUgcG9ydCBzZXJ2aWNlcyBjbGFpbSB2ZWN0b3JzIGZyb20gdGhpcwo+
ID4gbGltaXRlZCBwb29sLCBkb3duc3RyZWFtIGRldmljZXMgYXJlIHN0YXJ2ZWQgb2YgaW50ZXJy
dXB0cywgcmVzdWx0aW5nCj4gPiBpbiB6ZXJvIGludGVycnVwdHMgZGVsaXZlcmVkIGFuZCBkcml2
ZXIgdGltZW91dHMgKGUuZy4gYW1kZ3B1IGZlbmNlCj4gPiBmYWxsYmFjayB0aW1lciBleHBpcmVk
IG9uIGFsbCByaW5ncykuCj4KPiBIYXZlIHlvdSBjb25zaWRlcmVkIHNldHRpbmcgdGhlIHBjaV9k
ZXY6Om5vX21zaSBmbGFnIG9uIHRoZSBSb290IFBvcnRzCj4gdG8gZm9yY2UgdGhlbSB0byB1c2Ug
SU5UeCBpbnRlcnJ1cHRzIGluc3RlYWQgb2YgTVNJPyAgVGhhdCB3b3VsZCBzZWVtCj4gbGlrZSBh
IGNsZWFuZXIgc29sdXRpb24uICBUaGVyZSBhcmUgYWxyZWFkeSBzZXZlcmFsIGRldmljZXMgZm9y
IHdoaWNoCj4gdGhlIGZsYWcgaXMgc2V0IGluIGRyaXZlcnMvcGNpL3F1aXJrcy5jLCBzZWUgcXVp
cmtfbm9fbXNpKCkuCgpVbmZvcnR1bmF0ZWx5LCB0aGUgU0cyMDQyIGhhcyBubyBJTlR4IGludGVy
cnVwdHMuCgo+Cj4gPiBTb21lIFBDSWUgcm9vdCBwb3J0cyBicmVhayBNU0kgZGVsaXZlcnkgdG8g
ZG93bnN0cmVhbSBkZXZpY2VzIHdoZW4KPiA+IG5hdGl2ZSBwb3J0IHNlcnZpY2VzIChBRVIsIFBN
RSwgYndjdHJsLCBldGMuKSBhcmUgYWN0aXZlLiBUaGUgZXhpc3RpbmcKPiA+IHBjaWVfcG9ydHM9
Y29tcGF0IGtlcm5lbCBwYXJhbWV0ZXIgd29ya3MgYXJvdW5kIHRoaXMgZ2xvYmFsbHksIGJ1dAo+
ID4gYWZmZWN0cyBhbGwgcG9ydHMgb24gdGhlIHN5c3RlbS4KPiA+Cj4gPiBUaGlzIHNlcmllcyBh
ZGRzIGEgcGVyLWRldmljZSBtZWNoYW5pc20gdG8gc2tpcCBwb3J0IHNlcnZpY2UgcHJvYmluZzoK
PiA+ICAgMS4gSW50cm9kdWNlIFBDSV9ERVZfRkxBR1NfTk9fUE9SVF9TRVJWSUNFUyBmbGFnIGFu
ZCB3aXJlIGl0IGludG8KPiA+ICAgICAgdGhlIFBDSWUgcG9ydCBkcml2ZXIKPiA+ICAgMi4gQXBw
bHkgaXQgdmlhIHF1aXJrIHRvIFNvcGhnbyBTRzIwNDIgcm9vdCBwb3J0cyBbMWYxYzoyMDQyXSwg
d2hpY2gKPiA+ICAgICAgZmFpbCB0byBkZWxpdmVyIE1TSSBpbnRlcnJ1cHRzIHdoZW4gcG9ydCBz
ZXJ2aWNlcyBhcmUgZW5hYmxlZAo+Cj4gSSB0aGluayB3ZSBzaG91bGQgdHJ5IHRvIG1pbmltaXpl
IHN1Y2ggd29ya2Fyb3VuZHMgb3IgYXQgbGVhc3QgbWFrZSB0aGVtCj4gYXMgbm9uLWludHJ1c2l2
ZSBhcyBwb3NzaWJsZSwgc28gcGxlYXNlIHRyeSB0aGUgbm9fbXNpIGFwcHJvYWNoIGluc3RlYWQu
Cj4KPiBJIGFsc28gZG9uJ3Qgc2VlIHdoeSB0aGUgc3RhYmxlIGRlc2lnbmF0aW9uIGlzIG5lZWRl
ZCBUQkguCgo2LjE4IGhhcyBtZXJnZWQgUENJZSBkcml2ZXJzLCBzbyBhIHN0YWJsZSB0YWcgaXMg
cmVxdWlyZWQuCgo+Cj4gVGhhbmtzLAo+Cj4gTHVrYXMKCkhhbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
