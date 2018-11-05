Return-Path: <SRS0=E0x1=NQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DEF5ECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 08:53:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 314AB20819
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 08:53:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YO+yuznC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8MLgKNL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 314AB20819
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VRiWBZ5/84a651D95eiuTh0DFF/bRWJZ7GHREyHAtl4=; b=YO+yuznC+HgaXM
	9o+YzQR3sG/5ISZ46+u2mzjDsD8Cp9kHEz05GTcOsh3biONr+IR28xeW3T3VvRAlJ7E9o2plcQyVj
	TjfcyOoXy3oSckB1cGUK+nvQMs3bDYykZt2IIgXgconzG4URfIqcSd1qgrGdNaMzUjpWO2M7fw/h9
	JisVYBZqaSxZT+M/KMm+493BQvCFu/gChk+8rWaDAx2ONnsZl9lV/A1QjnexEOlSmSXJKaKvIykfr
	kGSFjjTgjPMa6b99LEnWZnEPycCRjC7X9L4PIw3S/dXzjanfWn9Ev2NIqY9YqDN8a42NgZCO8Yjh6
	A/4rF0A2cC1DKhhgyi/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gJadA-0004EQ-5K; Mon, 05 Nov 2018 08:53:08 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJad6-0004DH-R2
 for linux-riscv@lists.infradead.org; Mon, 05 Nov 2018 08:53:06 +0000
Received: by mail-qk1-x742.google.com with SMTP id n12so13268800qkh.11
 for <linux-riscv@lists.infradead.org>; Mon, 05 Nov 2018 00:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=8JMYtjfNYxLfbYDC9OvzWnhNZN5UoKOiwiG13yTWbTE=;
 b=D8MLgKNLezWGWd7LOpCrLZDP5Nr+JaEOE7X6Xqbg2a/Eyh46nZ1ApM2bDPcFC3jwKr
 XPt7RrF8cp36pkH/mtNlUvElB/ak5HyiC9RQm6aZ9mkll9yyotYT1K/xQ9+lvfPFEWSX
 9a+4CRE9k+tOnrLIPPZhBtdpWh3dithgTisXhwlwjd9GiI7aPvroqnx2lQTvcN9Ck3JP
 KqONQ/EGDrV0nCtKR6Z7miCULypvSDozUxVGqtTddwe2ORpuLbJUqu7Maanuz7OAGPhi
 kx7l7AmiCNXpCY1bMZHhns8Ri45Yeu2OZuLBQ/p4UNTmJphtKahAtJX4/1g74VHtel7x
 X7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=8JMYtjfNYxLfbYDC9OvzWnhNZN5UoKOiwiG13yTWbTE=;
 b=EPetBUTqE6O69Y+NXTQbk27QSucxVibJNyb37FECMopl2tqIXVfqh8eOhC2wc+WEXZ
 Lf6PB692un3zfoEza51Kl/1a7Nk7X56a3ANgHcobU7/uX7Xds9jeQdNyWGXUItvHknrx
 dBvJBUGgvhqw2E0gSqYMtm57R5JsozO59MZKaW4c28yvbkzTY1gNeNCtS2dUxHe7IqVs
 0N5KvQ2aCzYS5xcAVhuu2t/ttLIvdELYQrqvfxuVP7SrO2bU4C2M/uhEPt3Tiquo0WIJ
 HL5BALVoa7A/y+Pekj2GZVvJJuBgfWhwxXb/NnlFDTG8DCCXwyWgYUpg+bcHLpAl+zbR
 l5KQ==
X-Gm-Message-State: AGRZ1gJqtFFy7NHBDkdreWzTeKrw7/QIbp571ruWrMyjKf1l5W0vZ2rY
 JvXemvVpdYTWHWIfNon0v9UX3gnHAWpPbAopT5c=
X-Google-Smtp-Source: AJdET5dLcTAkwp9cARYapZYvWFyATrmLu/B6uVtF7HO3WXgZlcFDLisAuDY3POGB3YUMnu9iMatiKZiE/Va4je2jxWQ=
X-Received: by 2002:a37:a3c6:: with SMTP id
 m189mr19797249qke.173.1541407973298; 
 Mon, 05 Nov 2018 00:52:53 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a0c:9881:0:0:0:0:0 with HTTP;
 Mon, 5 Nov 2018 00:52:52 -0800 (PST)
In-Reply-To: <20181105070551.GA7274@infradead.org>
References: <CAAhSdy0Y_jdc=2Lf8epof_+7HigCfhDxMNe8EF0fHfncqhs-zA@mail.gmail.com>
 <mhng-01f0ac6a-c2fd-41be-9d53-44d1c139d453@palmer-si-x1c4>
 <20181101174857.du2zu4vnrhpu5asf@excalibur.cnev.de>
 <20181105065807.GA1286@andestech.com>
 <20181105070551.GA7274@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 5 Nov 2018 09:52:52 +0100
X-Google-Sender-Auth: o-kIcVGL0PLGM20_dbB_NR5HFxM
Message-ID:
 <CAK8P3a2c98VVPArCkdAR=-nnDBq1gYRCLDDgQB71eGiTSRdb4A@mail.gmail.com>
Subject: Re: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181105_005304_872281_E69111C5 
X-CRM114-Status: GOOD (  11.07  )
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
Cc: zong@andestech.com, aou@eecs.berkeley.edu, alankao@andestech.com,
 greentime@andestech.com, palmer@sifive.com, linux-kernel@vger.kernel.org,
 Vincent Chen <vincentc@andestech.com>, kito@andestech.com,
 linux-riscv@lists.infradead.org, deanbo422@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181105085252.lsAsmmozX24le0YLVFdeJzrVYeNuvH_f6q0eu9AgsiA@z>

T24gMTEvNS8xOCwgQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBpbmZyYWRlYWQub3JnPiB3cm90ZToK
PiBPbiBNb24sIE5vdiAwNSwgMjAxOCBhdCAwMjo1ODowN1BNICswODAwLCBWaW5jZW50IENoZW4g
d3JvdGU6Cj4+IE1hbnkgdGhhbmtzIGZvciBraW5kcyBvZiBjb21tZW50cy4gSSBxdWlja2x5IHN5
bnRoZXNpemUgdGhlIGNvbW1lbnRzIGFuZAo+PiBsaXN0IHRoZW0gYXMgYmVsb3cuCj4+IDEuIFRo
ZSBrZXJuZWwgaW1hZ2Ugc2hhbGwgaW5jbHVkZSBhbGwgdmVuZG9yLXNwZWNpZmljIGNvZGUuCj4K
PiBJIGZ1bmRhbWVudGFsbHkgZGlzYWdyZWUgd2l0aCB0aGlz4oCmIGFuZCB0aGluayBpdCBzaG91
bGQgYmUgdGhlIGNvbnRyYXJ5Lgo+Cj4gMS4gVGhlIGtlcm5lbCBzaGFsbCBzdXBwb3J0IG5vIHZl
bmRvciBzcGVjaWZpYyBpbnN0cnVjdGlvbnMgd2hhdHNvZXZlciwKPiBwZXJpb2QuCgpJIHRoaW5r
IHdoYXQgd2FzIG1lYW50IGFib3ZlIGlzCgoxLiBJZiBhIHZlbmRvciBleHRlbnNpb24gcmVxdWly
ZXMga2VybmVsIHN1cHBvcnQsIHRoYXQgc3VwcG9ydAptdXN0IGJlIGFibGUgdG8gYmUgYnVpbHQg
aW50byBhIGtlcm5lbCBpbWFnZSB3aXRob3V0IGJyZWFraW5nIHN1cHBvcnQKZm9yIENQVXMgdGhh
dCBkbyBub3QgaGF2ZSB0aGF0IGV4dGVuc2lvbiwgdG8gYWxsb3cgYnVpbGRpbmcgYSBzaW5nbGUK
a2VybmVsIGltYWdlIHRoYXQgd29ya3Mgb24gYWxsIENQVXMuCgogICAgICAgQXJuZAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
