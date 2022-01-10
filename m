Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AFDC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jan 2022 09:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I7w9OJ45yhyG00RtS4krPXmvOR4UTrUD1WIIcekn7Hc=; b=VXrJloWYu/4dQ/
	VT5+0WaUbbe1oL5i+qjwq8sVBO1RgkNdVzJW+YXG1sbqbWJVvnRmLx3+VKUsnGlzV1W26jpqNZ7+h
	qpLgcxovGTS/gIDB/ljzLtBord24XtS9nnR0vvMoZHhdejKKc2NZ3pvAyTX7/4pRB6ktmFyi4mJQ2
	UsOrKNgUAbWM7DTMQ5CTwe2cK0O2Atx8T8sffm8EMwz6HlAMjeinNAEfdonSiGSKY88bM/30hT8SA
	ZDkG2aEebsGtIqS58zMa+G09bBY+WS4k4p+Vp5JKzuVPA2An/Qw32foDzLsz7hIfrnIXZcpfzSJ1z
	8SFR/aN9qe9ezs166IBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6rKl-00AaHm-EX; Mon, 10 Jan 2022 09:51:23 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6rKS-00Aa5q-Bz
 for linux-riscv@lists.infradead.org; Mon, 10 Jan 2022 09:51:05 +0000
Received: by mail-wr1-x42b.google.com with SMTP id r10so17944466wrc.3
 for <linux-riscv@lists.infradead.org>; Mon, 10 Jan 2022 01:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=XjI+RU6al+oJtSFSee741SP13qfOGtttOWkUcj1LQbs=;
 b=NJNPlDAKDl2C2HGO2BkBNbWyUWBNgBf4Oexcyn7jonBhZWZkxiVpbc9Y/lmcqGfeDu
 j6VC91aakYpMEYfH6wrbmBRAT+0i2jyghqDxaF+dAe2mbq5P2dlZrPD7jIJ7nx8kNGdj
 /fZJrxOXgDir2hBvS70ZyJ+z8SOQm2e5hvG2Zxusl+pptxOn+7a4oAPyunZml4It7xN2
 zmOgEIUPU/RrzsJXwGvx22joHp/70vWUmycVInyKYhqXnbiTlXWhIEaD0LS4j6U0Cw5x
 XWARprNFPcmfqfg7mti+cG0SJ+J3J2nqtHI8R4HTKdSjqY3sdRY+WQK8/aQ9HiooUlWv
 4HBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XjI+RU6al+oJtSFSee741SP13qfOGtttOWkUcj1LQbs=;
 b=AZq9Z/GqmVD86Ib41HnFR4SJ3vYlPDgB78wLzFF7gBPR6DjnE+t+g0mk0N7z9GvHoL
 SZn1l+GPmtaskyf8dyMqjZflGLCxreIorn6rN6z/twAAPkRDJlDzoFhAqWuz/+p4l2BC
 0ikPTcxk5+vh4VKA+dLAOUFpHOBTajKq8mdNR18IjK08Tgs/rSn0J/0M/tffkYyledhB
 psDxEY5iYrfDJHRRa09k3NARyNk5IX+FlUleFbFlq2BQkFFAHgf5wtGgfG1KrNZXKSHu
 DtzEfopdzBEmt4DxaHMr0Mdx+MKNFfiA5veHhgG329BC0wpHRgu4II72RZPqaBHXm2Fi
 A0iA==
X-Gm-Message-State: AOAM532YJoUDWN43saj8j5+ZVdsLBvEdbc3/boETYbCLVID1T+wWrYhh
 9hsIP/LtjdEWWpbsLCvWQS93T8HSxCm0Dg==
X-Google-Smtp-Source: ABdhPJy64z5uatD6yk6wqa3/5nkEpQ5brCeZ12/zFKyWtXxSGP2vBqwJk7aMZd00MBcF6osrGLJ8kg==
X-Received: by 2002:a05:6000:c8:: with SMTP id
 q8mr2089490wrx.611.1641808262884; 
 Mon, 10 Jan 2022 01:51:02 -0800 (PST)
Received: from google.com ([31.124.24.179])
 by smtp.gmail.com with ESMTPSA id k33sm6296470wms.21.2022.01.10.01.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 01:51:02 -0800 (PST)
Date: Mon, 10 Jan 2022 09:51:07 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Zong Li <zong.li@sifive.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4] clk: sifive: Fix W=1 kernel build warning
Message-ID: <YdwBi7uwH4NHi0GD@google.com>
References: <20220110065536.11451-1-zong.li@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220110065536.11451-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_015104_457669_FEB8BECF 
X-CRM114-Status: GOOD (  14.37  )
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

T24gTW9uLCAxMCBKYW4gMjAyMiwgWm9uZyBMaSB3cm90ZToKCj4gVGhpcyBjb21taXQgcmV2ZXJ0
cyBjb21taXQgNDg3ZGM3YmI2YTBjICgiY2xrOiBzaWZpdmU6IGZ1NTQwLXByY2k6Cj4gRGVjbGFy
ZSBzdGF0aWMgY29uc3QgdmFyaWFibGUgJ3ByY2lfY2xrX2Z1NTQwJyB3aGVyZSBpdCdzIHVzZWQi
KS4KPiBGb3IgZml4aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKSBhYm91dCDigJhwcmNp
X2Nsa19mdTU0MOKAmSBkZWZpbmVkCj4gYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJp
YWJsZT1dLCB0aGUgcHJvYmxlbSBpcyB0aGF0IHRoZSBDIGZpbGUKPiBvZiBmdTU0MCBhbmQgZnU3
NDAgZG9lc24ndCB1c2UgdGhlc2UgdmFyaWFibGVzLCBidXQgdGhleSBpbmNsdWRlIHRoZQo+IGhl
YWRlciBmaWxlcy4gV2UgY291bGQgcmVmaW5lIHRoZSBjb2RlIGJ5IG1vdmluZyB0aGUgZGVmaW5p
dGlvbiBvZiB0aGVzZQo+IHZhcmlhYmxlcyBpbnRvIGZ1NTQwIGFuZCBmdTc0MCBpbXBsZW1lbnRh
dGlvbiByZXNwZWN0aXZlbHkgaW5zdGVhZCBvZgo+IGNvbW1vbiBjb3JlIGNvZGUsIHRoZW4gd2Ug
Y291bGQgc3RpbGwgc2VwYXJhdGUgdGhlIFNvQ3MtZGVwZW5kZW50IGRhdGEKPiBpbiB0aGVpciBv
d24gaW1wbGVtZW50YXRpb24uCj4gCj4gRml4ZXM6IDQ4N2RjN2JiNmEwYyAoImNsazogc2lmaXZl
OiBmdTU0MC1wcmNpOiBEZWNsYXJlIHN0YXRpYyBjb25zdCB2YXJpYWJsZSAncHJjaV9jbGtfZnU1
NDAnIHdoZXJlIGl0J3MgdXNlZCIpCgpPa2F5LCB0aGF0J3MgZ29vZC4KCk15IG90aGVyIGNvbW1l
bnRzIHN0aWxsIGFwcGx5IGhlcmUgdGhvdWdoLgoKPiBTaWduZWQtb2ZmLWJ5OiBab25nIExpIDx6
b25nLmxpQHNpZml2ZS5jb20+Cj4gCj4gLS0tCj4gQ2hhbmdlZCBpbiB2NDoKPiAgLSBSZWJhc2Ug
b24gdjUuMTYKPiAgLSBNb2RpZnkgZml4ZXMgdGFnCj4gCj4gQ2hhbmdlZCBpbiB2MzoKPiAgLSBS
ZWJhc2Ugb24gdjUuMTYtcmM4Cj4gIC0gQWRkIGZpeGVzIHRhZwo+IAo+IENoYW5nZWQgaW4gdjI6
Cj4gIC0gTW92ZSBkZWZpbml0aW9uIG9mIHZhcmlhYmxlIHRvIEMgZmlsZSBmcm9tIGhlYWRlcgo+
IC0tLQo+ICBkcml2ZXJzL2Nsay9zaWZpdmUvZnU1NDAtcHJjaS5jICB8ICA2ICsrKysrLQo+ICBk
cml2ZXJzL2Nsay9zaWZpdmUvZnU1NDAtcHJjaS5oICB8ICA2ICstLS0tLQo+ICBkcml2ZXJzL2Ns
ay9zaWZpdmUvZnU3NDAtcHJjaS5jICB8ICA2ICsrKysrLQo+ICBkcml2ZXJzL2Nsay9zaWZpdmUv
ZnU3NDAtcHJjaS5oICB8IDExICstLS0tLS0tLS0tCj4gIGRyaXZlcnMvY2xrL3NpZml2ZS9zaWZp
dmUtcHJjaS5jIHwgIDUgLS0tLS0KPiAgNSBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCsp
LCAyMiBkZWxldGlvbnMoLSkKCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KUHJpbmNpcGFsIFRl
Y2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291
cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0
ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
