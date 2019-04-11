Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42509C10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 16:08:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CC6B2133D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 16:08:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f/aECNuK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CC6B2133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rFIOENSc9fgSM8aLPpJr4M54dxDXQJchxBTjI5eIBsM=; b=f/aECNuKjAsCSvlXOy2DhILAm
	YrflbeRA9f2TtibRjoaASYys2QtzhbR0D8Zi5kmv4WMwK8TgKkB3ZEMHD2nD+QUBS/dzqnNht+bNB
	invBkZl9ZAKkRUeWu+3PBM8R+i3lwDtZD5m/UB109556iIxEB1MrjldFJWWWbyvtHlAXqjU6S4FF3
	kBp5rS+yU4L2PDhz9rp5wSPS9TJfdk6r13VkuDuHLp8NlQKkCauzLWouc7HsWcH6zG2Jo6pGREBMW
	AgFPognukRRMln/sPmnm43zaqgx1lT35hRTC9Q6D1f6TBF1re4lybfhDiu+Pm333lnUJeo6a2HOgW
	Pgmr1EW2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEcFi-0006rF-6N; Thu, 11 Apr 2019 16:08:38 +0000
Received: from mailgate-2.ics.forth.gr ([139.91.1.5])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEcFe-0006qf-TZ
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 16:08:36 +0000
Received: from av1.ics.forth.gr (av3in [139.91.1.77])
 by mailgate-2.ics.forth.gr (8.14.4/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 x3BG8Uqr013157; Thu, 11 Apr 2019 16:08:32 GMT
X-AuditID: 8b5b9d4d-8f5ff7000000235c-18-5caf667e6c94
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 A3.B9.09052.E766FAC5; Thu, 11 Apr 2019 19:08:30 +0300 (EEST)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id x3BG8UCn004369; Thu, 11 Apr 2019 19:08:30 +0300
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Thu, 11 Apr 2019 19:08:30 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/9] riscv: remove dead big endian code
Organization: FORTH
In-Reply-To: <20190411154731.GA23171@lst.de>
References: <20190411115623.5749-1-hch@lst.de>
 <20190411115623.5749-3-hch@lst.de>
 <3382adaf8be0b44af9ebb8b7528cac41@mailhost.ics.forth.gr>
 <20190411154731.GA23171@lst.de>
Message-ID: <a5de00d885d5ebf5db35fa2c78738963@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-2.ics.forth.gr
 [139.91.1.5]);
 Thu, 11 Apr 2019 16:08:33 +0000 (GMT) for IP:'139.91.1.77' DOMAIN:'av3in'
 HELO:'av1.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mailgate-2.ics.forth.gr [139.91.1.5]); Thu, 11 Apr 2019 16:08:33 +0000 (GMT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_090835_322652_810452EE 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
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
Cc: Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

zqPPhM65z4IgMjAxOS0wNC0xMSAxODo0NywgQ2hyaXN0b3BoIEhlbGx3aWcgzq3Os8+BzrHPiM61
Ogo+IE9uIFRodSwgQXByIDExLCAyMDE5IGF0IDA2OjQwOjA3UE0gKzAzMDAsIE5pY2sgS29zc2lm
aWRpcyB3cm90ZToKPj4gSSBkb24ndCB0aGluayB3ZSBjYW4gZGVmaW5pdGVseSBzYXkgdGhhdCBS
SVNDLVYgd2lsbCBhbHdheXMgaGF2ZSBhCj4+IGxpdHRsZS1lbmRpYW4sCj4+IG1lbW9yeSBzeXN0
ZW0gb25seSB0aGF0IGl0IGlzIGxpdHRsZS1lbmRpYW4gZm9yIG5vdy4gQWxzbyB0aGlzIGNvZGUg
Cj4+IGFjdHMgYXMKPj4gYSBjaGVjaywKPiAKPiBBbmQgd2UgZG9uJ3Qga25vdyBpZiBMaW51eCB3
aWxsIGJlIGFyb3VuZCBpZiB0aGF0IGV2ZXIgY2hhbmdlcy4KPiAKPiBUaGUgcG9pbnQgaXM6Cj4g
Cj4gIGEpIHRoZSBjdXJyZW50IFJJU0MtViBzcGVjIGlzIExFIG9ubHkKPiAgYikgdGhlIGN1cnJl
bnQgbGludXggcG9ydCBpcyBMRSBvbmx5IGV4Y2VwdCBmb3IgdGhpcyBsaXR0bGUgYml0Cj4gCj4g
VGhlcmUgaXMgbm8gcG9pbnQgaW4gbGVhdmluZyBqdXN0IHRoaXMgYml0cm90dGluZyBjb2RlIGFy
b3VuZC4gIEl0Cj4ganVzdCBjb25mdXNlcyBkZXZlbG9wZXJzLCAodmVyeSB2ZXJ5IHNsaWdodGx5
KSBzbG93cyBkb3duIGNvbXBpbGVzCj4gYW5kIHdpbGwgYml0cm90LiAgSXQgYWxzbyB3b24ndCBi
ZSBhbnkgc2lnbmlmaWNhbnQgaGVscCB0byBhIGZ1dHVyZQo+IGRldmVsb3BlciBkb3duIHRoZSBy
b2FkIGRvaW5nIGEgaHlwb3RoZXRpY2FsIEJFIFJJU0MtViBMaW51eCBwb3J0LgoKSSB0aGluayB3
ZSBzaG91bGQgYXQgbGVhc3Qgd2FybiB0aGUgdXNlciBhYm91dCB1bnN1cHBvcnRlZCBlbmRpYW5l
c3MsCmFsc28gSSBzdWdnZXN0IHlvdSBhbHNvIGNsZWFuIHVwIGluY2x1ZGUvYXNtL2VsZi5oLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
