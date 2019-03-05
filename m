Return-Path: <SRS0=mVee=RI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668E6C00319
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2019 08:26:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36A97206DD
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2019 08:26:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sSYofn1o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="dx2+S8Hx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36A97206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tDDmQV/EjOj9DJOJPuU65lZ6amVC37fw+bB3bIzokoI=; b=sSYofn1oIpQ6kl
	+vDT1u1pNDeFLGLkWYZPEqbtiilL84eoDpY28sz32TuCFoFheezvN0Zg6PbAxHWG9DvYV4jV5fjBa
	Ml+pg2rJ+mfpZoEkpReUEC53A4Q1r4unpOOdWnHq/o9J4DUT7Nhff6+WyrA7S6Vp6cvTp8sE4/DQ0
	ZWyJo7KG35gJ51qzUINbFcJcWdFBnoTsN4MLS9lWR5SvCetlhGMHKm93SMawrt2Aky/0QTzqwtsax
	FnzwAso9N1ytt/zJSCIhyJ43gK8mQdZARzOFY6FXAc0yvmi2q+Pr+Lvdx4/j3euvdtheMUVLtEiOg
	zyLaONC54yUPvOi7FuDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h15P5-0004op-Ka; Tue, 05 Mar 2019 08:26:23 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h15P2-0004nt-TT
 for linux-riscv@lists.infradead.org; Tue, 05 Mar 2019 08:26:22 +0000
Received: by mail-lj1-x244.google.com with SMTP id q128so6792083ljb.11
 for <linux-riscv@lists.infradead.org>; Tue, 05 Mar 2019 00:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=80UeaXg4IUedyAUcI3zlaVRqw4KRHv1i5h4aQrChDzc=;
 b=dx2+S8HxXjQYkXtV0cB8MwOamzxzk896amgVgcubhQ9AMocBgUDGyqIshP8U3DdqCK
 EDUm2Yt63oE4N7frNz5RUHi3D36q2UTk/x4Ryuxz6DsoIkvw7PrP4gUfkSdY4i3bb4EX
 r2tHZQkQB1JiFjQqkY1mYpLF6LA7a308hwoL29SRHI2aZkPSgqZnyD1XS0/Ur7YgaYg6
 2EzzdhetsraVgtIiswNEonuLy9NcucjRLBzz2ygAMvSdmUpVtBsv0qlIKnRDqvht4FpM
 UPElUTHHaruRG7S1eeUU+KqIEIv9XFh+0lg7yPSYDwZQ+tSnxaJYVXEreOPsZZEZrQp9
 DRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=80UeaXg4IUedyAUcI3zlaVRqw4KRHv1i5h4aQrChDzc=;
 b=Vkt5aNK90VdpW+C0SeB6ThfWFf/ERMNjXgOnVmcvse/0mFuXOxOXRCE5/pWaXrJUZa
 C+sTTpD7DybrlyVm5t2HryGHcZg2fpx3vzGCz/4nsQVjbxA/GtEdckB7hRBqmjuwDm/Z
 JbOPbzKcaLKNwSsHbhLGkHHNQZPmxFUNoGVlPlBc/XeXcIKcJ895ru+jsNWwPQB6Zmrj
 9qzpVmWCAnd3XalY1yaAtFHivrrG+G9G+siYEzhzETRZKjWv7J7IUG+TTUdShbb+3MrH
 Cat2E32+sqQpzCPhwZgLP9HRwjEaI9X1MjGfn0jLSwcm7g2aD9T29j9lh5D52Ca8HkFP
 beNg==
X-Gm-Message-State: APjAAAXdj1SGIpHtPw6KhqeuAhlA6vU0O6GYi313SMPQy8dgliCql4IM
 ly3rfva+i2LWt2IF/s9vzWm4eBLgB8yLjhZVmTLzWg==
X-Google-Smtp-Source: APXvYqx4nfK40jW2snMNeC3o2Rj1kZQrBX6M/YRpbydBZ1mXnWCLTtrhgIGjuuyXqF5ARfC/aBlcC+eVm4ZcP58LB+M=
X-Received: by 2002:a2e:6505:: with SMTP id z5mr13303269ljb.180.1551774378026; 
 Tue, 05 Mar 2019 00:26:18 -0800 (PST)
MIME-Version: 1.0
References: <1551437599-29509-1-git-send-email-yash.shah@sifive.com>
 <mvmfts228vu.fsf@suse.de>
In-Reply-To: <mvmfts228vu.fsf@suse.de>
From: Yash Shah <yash.shah@sifive.com>
Date: Tue, 5 Mar 2019 13:55:41 +0530
Message-ID: <CAJ2_jOE=8_c6aN2FTQVt0wTpBAkL8BYyF3UFaMmqdvWYWAAmvg@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] PWM support for HiFive Unleashed
To: Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190305_002620_965283_B79BF11E 
X-CRM114-Status: GOOD (  11.77  )
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
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, Sachin Ghadi <sachin.ghadi@sifive.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBNYXIgNCwgMjAxOSBhdCA0OjM5IFBNIEFuZHJlYXMgU2Nod2FiIDxzY2h3YWJAc3Vz
ZS5kZT4gd3JvdGU6Cj4KPiBPbiBNw6RyIDAxIDIwMTksIFlhc2ggU2hhaCA8eWFzaC5zaGFoQHNp
Zml2ZS5jb20+IHdyb3RlOgo+Cj4gPiBUaGlzIHBhdGNoIHNlcmllcyBhZGRzIGEgUFdNIGRyaXZl
ciBhbmQgRFQgZG9jdW1lbnRhdGlvbgo+ID4gZm9yIEhpRml2ZSBVbmxlYXNoZWQgYm9hcmQuIFRo
ZSBwYXRjaGVzIGFyZSBtb3N0bHkgYmFzZWQgb24KPiA+IFdlc2xleSdzIHBhdGNoLgo+Cj4gVGhh
dCBkb2Vzbid0IGFwcGVhciB0byB3b3JrIHdpdGggdGhlIGhlYXJ0YmVhdCB0cmlnZ2VyLCB0aGUg
bGVkIGRvZXNuJ3QKPiBmbGFzaC4KCk1ha2Ugc3VyZSB5b3UgbW9kaWZ5IHRoZSBEVFMgZmlsZSBz
aW5jZSB3aXRoIHRoaXMgcGF0Y2ggdGhlIHBlcmlvZCBpcwpub3cgcGFzc2VkIHRocm91Z2ggdGhl
IGNvbnZlbnRpb25hbCB3YXkuCkV4YW1wbGU6CnB3bWxlZHMgewogICAgY29tcGF0aWJsZSA9ICJw
d20tbGVkcyI7CiAgICBoZWFydGJlYXQgewogICAgICAgIHB3bXMgPSA8Jkw0NSAwIDEwMDAwMCAw
PjsKICAgICAgICBtYXgtYnJpZ2h0bmVzcyA9IDwyNTU+OwogICAgICAgIGxpbnV4LGRlZmF1bHQt
dHJpZ2dlciA9ICJoZWFydGJlYXQiOwogICAgfTsKfTsKCkkgaGF2ZSB0ZXN0ZWQgdGhlIGhlYXJ0
YmVhdCB0cmlnZ2VyIG9uIEhpRml2ZSBVbmxlYXNoZWQgYm9hcmQgYW5kIGl0J3MKd29ya2luZyB3
aXRoIHRoaXMgUFdNIHBhdGNoLgoKCj4KPiBBbmRyZWFzLgo+Cj4gLS0KPiBBbmRyZWFzIFNjaHdh
YiwgU1VTRSBMYWJzLCBzY2h3YWJAc3VzZS5kZQo+IEdQRyBLZXkgZmluZ2VycHJpbnQgPSAwMTk2
IEJBRDggMUNFOSAxOTcwIEY0QkUgIDE3NDggRTRENCA4OEUzIDBFRUEgQjlENwo+ICJBbmQgbm93
IGZvciBzb21ldGhpbmcgY29tcGxldGVseSBkaWZmZXJlbnQuIgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
