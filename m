Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DEFC282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 07:29:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48600222BE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 07:29:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AVQKSmHM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hKu2VKHT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48600222BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7i3W07/sWJG8pAJU08FcGn+S8AFkYoFA3n125PitRBs=; b=AVQKSmHMBuYvn5
	y8oN+K4nem9LF0k3K+1frKhbx92VB0XG8NvzOYeaJpsqXhpyklAPNiDSNFeoRA/Wvb6ENisKTvLXZ
	L+s1qZUdO8CCn5nbmanVG5hJI9MaI/sVr4PfXFoV4apa7J0UVSi0ywj7dcxrWjyBdTk4Sky0yAbYY
	o5T1YwFLfOXttREb6UhHKpyP5iKEPOJzNxDf3QGPr0ih9B3H7IzFFqLV8yFP78b6rPzbHyt433Qeo
	cEmI93nh6OFaX5oNmTj7blei9QPsYPaKfW8CPNKiAE4jnYujWeuevmDRCYgOpboYvc8ALkAG5FEx/
	j7nc21yeMH9xUBojhYJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtozN-0004Mq-5i; Wed, 13 Feb 2019 07:29:49 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtozA-0004Av-Dx
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 07:29:38 +0000
Received: by mail-wr1-x444.google.com with SMTP id q18so1240310wrx.9
 for <linux-riscv@lists.infradead.org>; Tue, 12 Feb 2019 23:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=p1ubNWXGHPnF8cNyX5xYmowXhYPVRyQWPlZNKdwfTas=;
 b=hKu2VKHT8ANYSMZfbVUfV7u6JKn6aZ8519m5/Q+ilXS/t8uBxsgQi92Uvx0cchs0k6
 0GS0R8muSud7PJBYF6mhzHEBfe9kHAnBnFfxPan9BeHGfzI//T9ez9hqA3oo816RRmZW
 wpYHbtKPgeW+Ifb3dvO/LCCJgnFyIF4Rj5sXrvmMVbgCDp3Cd5JuqWaO5h2+dhhJag22
 rf+lcITHUlTRnVPG0zKzo+0KtAz8LJKbeIrmRs8fVe5sfktMNzOu0VCf0FAn+CSFdDBx
 KCnYic2FHcgfPwIGxWieKHFvujUmy2bI44eRBnrSvNtkc+swOHwWm7gkl9cWoGDlDU6G
 LxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=p1ubNWXGHPnF8cNyX5xYmowXhYPVRyQWPlZNKdwfTas=;
 b=ZEuZv4CgZmajefm0V7dOE+418/YJxS15uzn7omNsOtv74GtVR8keAG3Bxdvndb9gKD
 ++QyE+C7iaOEi55QghOkp5y3LAzqsA00koMC09PJkJKeoBAz+FvxIDE0uoKW7296RqeA
 b7KPEMF+MLxWcIwhWfoRnVr13hTSOnwWr2x0Je5HU2/knpD05W7WZv/LYzkK+YaLeYq5
 JmEJNf+qMRBsJRlscusCXggjy2V+rfmF20U//Upu5Anm0Bv5mfKlMQozIXzK9uuAV5Q+
 E+bPVYdF8qr3LPsLfjgcUhkolS13Cnp2VvtsAbYMUS/Rq3+3+P+yxj9PHuB+PiHPN9GQ
 AmNg==
X-Gm-Message-State: AHQUAuZuIdcTBmJPXkwvCo2cK2uI2gb5RoUrYKZxDAPJl/967kpIuKXX
 yDDgLoZfUlPO9CfZsMozNpVIiw==
X-Google-Smtp-Source: AHgI3IZcd4zu/3yvHzkl49HGJ4yreQu5p0YiXKGToLp9LNR1JCXvFQTZLzDX27/8lOJeVrKoRHhVcQ==
X-Received: by 2002:a05:6000:6:: with SMTP id h6mr5767032wrx.68.1550042973913; 
 Tue, 12 Feb 2019 23:29:33 -0800 (PST)
Received: from dell ([2.27.35.171])
 by smtp.gmail.com with ESMTPSA id q24sm4487482wmq.16.2019.02.12.23.29.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Feb 2019 23:29:33 -0800 (PST)
Date: Wed, 13 Feb 2019 07:29:31 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 01/12] mfd/sm501: depend on HAS_DMA
Message-ID: <20190213072931.GD1863@dell>
References: <20190211133554.30055-1-hch@lst.de>
 <20190211133554.30055-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190211133554.30055-2-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_232936_490431_78153EDC 
X-CRM114-Status: GOOD (  17.32  )
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
Cc: linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 x86@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-riscv@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAxMSBGZWIgMjAxOSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cgo+IEN1cnJlbnRs
eSB0aGUgc201MDEgbWZkIGRyaXZlciBjYW4gYmUgY29tcGlsZWQgd2l0aG91dCBhbnkgZGVwZW5k
ZW5jaWVzLAo+IGJ1dCB0aHJvdWdoIHRoZSB1c2Ugb2YgZG1hX2RlY2xhcmVfY29oZXJlbnQgaXQg
cmVhbGx5IGRlcGVuZHMgb24KPiBoYXZpbmcgRE1BIGFuZCBpb21lbSBzdXBwb3J0LiAgTm9ybWFs
bHkgd2UgZG9uJ3QgZXhwbGljaXRseSByZXF1aXJlIERNQQo+IHN1cHBvcnQgYXMgd2UgaGF2ZSBz
dHVicyBmb3IgaXQgaWYgb24gVU1MLCBidXQgaW4gdGhpcyBjYXNlIHRoZSBkcml2ZXIKPiBzZWxl
Y3RzIHN1cHBvcnQgZm9yIGRtYV9kZWNsYXJlX2NvaGVyZW50IGFuZCB0aHVzIGFsc28gcmVxdWly
ZXMKPiBtZW1tYXAgc3VwcG9ydC4gIEd1YXJkIHRoaXMgYnkgYW4gZXhwbGljaXQgZGVwZW5kZW5j
eS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiAt
LS0KPiAgZHJpdmVycy9tZmQvS2NvbmZpZyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvS2NvbmZpZyBiL2RyaXZlcnMv
bWZkL0tjb25maWcKPiBpbmRleCBmNDYxNDYwYTJhZWIuLmYxNWY2NDg5ODAzZCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL21mZC9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9tZmQvS2NvbmZpZwo+IEBA
IC0xMDY2LDYgKzEwNjYsNyBAQCBjb25maWcgTUZEX1NJNDc2WF9DT1JFCj4gIAo+ICBjb25maWcg
TUZEX1NNNTAxCj4gIAl0cmlzdGF0ZSAiU2lsaWNvbiBNb3Rpb24gU001MDEiCj4gKwlkZXBlbmRz
IG9uIEhBU19ETUEKPiAgCSAtLS1oZWxwLS0tCj4gIAkgIFRoaXMgaXMgdGhlIGNvcmUgZHJpdmVy
IGZvciB0aGUgU2lsaWNvbiBNb3Rpb24gU001MDEgbXVsdGltZWRpYQo+ICAJICBjb21wYW5pb24g
Y2hpcC4gVGhpcyBkZXZpY2UgaXMgYSBtdWx0aWZ1bmN0aW9uIGRldmljZSB3aGljaCBtYXkKCkkg
d291bGQgbm9ybWFsbHkgaGF2ZSB0YWtlbiB0aGlzLCBidXQgSSBmZWFyIGl0IHdpbGwgY29uZmxp
Y3Qgd2l0aApbUEFUQ0ggMDYvMTJdLiAgRm9yIHRoYXQgcmVhc29uLCBqdXN0IHRha2UgbXk6Cgog
IEFja2VkLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKLS0gCkxlZSBKb25l
cyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDi
lIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vi
b29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
