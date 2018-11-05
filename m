Return-Path: <SRS0=E0x1=NQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD8EAC46475
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 13:51:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F81020827
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 13:51:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SQG8qFmr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUuaJYs8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F81020827
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rMcqF3CC4mxzNMx8w2uoHgy8HRAHV8gRmHpdrcoru6w=; b=SQG8qFmrx0SWJf
	kVqgNUZ7sXLu0cDqL9OUsw1HNfayhHWLnqaaT86mTEj2wPxJv+XTwbidv4YyrsiNtchZCl8M8DeAp
	tJ72dKp6ecatbTkOuuU/1Hsx52YCr3dLssx98DyLhLW6Z5V36qmBBZWV0rANCmsD7ajxq8CT/MvyC
	IhY7tf9CskyhJQw15mCSk55KyaUNxV9AD36Pxyj+8qKDgFjNY1ZZa81pga4+yDODuaaqmx5hQgerk
	RIC3sg+/zbz545/bvMqcMAFBwlJbDixLqglM3a6wwdL27gyqkjQSaywK60mhykMeJjm9aN5X0O6vb
	5uXcoe/+xKlhtyPQXHog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gJfIC-0003rr-Rp; Mon, 05 Nov 2018 13:51:48 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJfI9-0003oQ-Ka
 for linux-riscv@lists.infradead.org; Mon, 05 Nov 2018 13:51:47 +0000
Received: by mail-qk1-x743.google.com with SMTP id u68so14661051qkg.9
 for <linux-riscv@lists.infradead.org>; Mon, 05 Nov 2018 05:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=xkosleulG3JXCOYkWyXDfCwTpAjMrSZKbQYqjNHEjLo=;
 b=ZUuaJYs8moHi4C4/+JQnVsJdfoMHiXibncYRDtFGE7JsV8fiB7kwiBoZFDcxEwYgSD
 gZqxYbN7YNWwVb/pLIbStW9zr7obfnaWeRqF7ZY2cbBq+X1TavcloN282zQY/wbayI1L
 EqHyAedLKiWCgUE690ki9I6E1+/Q7ZtTjNa5/uH4RttXsKND9/qgMH219HUyVah0QXys
 9u4S2anYDMq29bdxzFcPZTi8uDHFZvler9RqNsL89LZRrvVC6rcHE7j0UTZIj24lvNS+
 fFJrbr5um5AQ3CmwpoFgQAD3V2aM0QC64ix9o0v6ZRjFK08rHRodDscUav2EKgQ1X3Z+
 7f4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=xkosleulG3JXCOYkWyXDfCwTpAjMrSZKbQYqjNHEjLo=;
 b=FJNtGDHYXcOnhqcFYhaPcdtFfND6FNLPEdqvP5pZLoj+dUgmPUbUqO63fQpyhYI7py
 0eINaAT5vkOOUHv6Bsu+ttHbitpwAneZEYppdpX8f2D8Ka474rGwswyIHRp+KS1yihdm
 BlVOURlNWf8YpbwAOMPjX+zImPdnjSOi9OLpY80ZwYh0afWUcnohCx6O/6uolGhiVdut
 YK9j8JTWIg6q4t0ZkJNTzGr29Eh0sBvcGxd76f3iwD11HE26DwuN/hDGVrytTMTNlqy0
 Eie7F2LM67319NQKmF+7hMZtdTvZIOi42zsD+3/0oG+Po+AxzX5Gpsw7BFJEd7mA5opD
 YzxA==
X-Gm-Message-State: AGRZ1gLGylBZQPGZUzXaKMCktxMavZDPwIxcgImumiJbpZ93Quu/4TIy
 Szw6SpfIW5kvYDP3aUfrWNS47153SPyYgW/g2CU=
X-Google-Smtp-Source: AJdET5dL2IAwW3iokujRJKl6sLUkshy9GyWnWB4sg6tQpf1Vl+WEWZIllFrQFES34y/l+ud4ijiDEjPAJfh/boNKNc0=
X-Received: by 2002:a0c:d992:: with SMTP id y18mr22061687qvj.161.1541425894314; 
 Mon, 05 Nov 2018 05:51:34 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a0c:9881:0:0:0:0:0 with HTTP;
 Mon, 5 Nov 2018 05:51:33 -0800 (PST)
In-Reply-To: <20181105090852.GA14924@infradead.org>
References: <CAAhSdy0Y_jdc=2Lf8epof_+7HigCfhDxMNe8EF0fHfncqhs-zA@mail.gmail.com>
 <mhng-01f0ac6a-c2fd-41be-9d53-44d1c139d453@palmer-si-x1c4>
 <20181101174857.du2zu4vnrhpu5asf@excalibur.cnev.de>
 <20181105065807.GA1286@andestech.com>
 <20181105070551.GA7274@infradead.org>
 <CAK8P3a2c98VVPArCkdAR=-nnDBq1gYRCLDDgQB71eGiTSRdb4A@mail.gmail.com>
 <20181105090852.GA14924@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 5 Nov 2018 14:51:33 +0100
X-Google-Sender-Auth: UVcM89bK9AjWEg2bVYa3d_3uM7U
Message-ID:
 <CAK8P3a2MSK-S+AzDGjq6t8WjcKrkj0XmynNL+fMPvL=JgnoEVA@mail.gmail.com>
Subject: Re: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181105_055145_678984_99AD9CF3 
X-CRM114-Status: GOOD (  17.89  )
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
Message-ID: <20181105135133.u43VKensu-64yeZISWzWvj8UpIHuuiGet2Pk-cpDD0U@z>

T24gMTEvNS8xOCwgQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBpbmZyYWRlYWQub3JnPiB3cm90ZToK
PiBPbiBNb24sIE5vdiAwNSwgMjAxOCBhdCAwOTo1Mjo1MkFNICswMTAwLCBBcm5kIEJlcmdtYW5u
IHdyb3RlOgo+PiA+IEkgZnVuZGFtZW50YWxseSBkaXNhZ3JlZSB3aXRoIHRoaXPigKYgYW5kIHRo
aW5rIGl0IHNob3VsZCBiZSB0aGUKPj4gPiBjb250cmFyeS4KPj4gPgo+PiA+IDEuIFRoZSBrZXJu
ZWwgc2hhbGwgc3VwcG9ydCBubyB2ZW5kb3Igc3BlY2lmaWMgaW5zdHJ1Y3Rpb25zIHdoYXRzb2V2
ZXIsCj4+ID4gcGVyaW9kLgo+Pgo+PiBJIHRoaW5rIHdoYXQgd2FzIG1lYW50IGFib3ZlIGlzCj4+
Cj4+IDEuIElmIGEgdmVuZG9yIGV4dGVuc2lvbiByZXF1aXJlcyBrZXJuZWwgc3VwcG9ydCwgdGhh
dCBzdXBwb3J0Cj4+IG11c3QgYmUgYWJsZSB0byBiZSBidWlsdCBpbnRvIGEga2VybmVsIGltYWdl
IHdpdGhvdXQgYnJlYWtpbmcgc3VwcG9ydAo+PiBmb3IgQ1BVcyB0aGF0IGRvIG5vdCBoYXZlIHRo
YXQgZXh0ZW5zaW9uLCB0byBhbGxvdyBidWlsZGluZyBhIHNpbmdsZQo+PiBrZXJuZWwgaW1hZ2Ug
dGhhdCB3b3JrcyBvbiBhbGwgQ1BVcy4KPgo+IE5vLiAgVGhpcyBsaXRlcmFsbHkgbWVhbnMgbm8g
dmVuZG9yIGV4dGVuc2lvbnMgaW52b2x2aW5nIGluc3RydWN0aW9ucwo+IG9yIENTUnMgaW4gdGhl
IGtlcm5lbC4gIFRoZXkgYXJlIGZpbmUgZm9yIHVzZXJzcGFjZSwgb3IgZm9yIHRoZSBNLW1vZGUK
PiBjb2RlIGluY2x1ZGluZyBpbXBlbWVudGF0aW9uIG9mIHRoZSBTQkksIGJ1dCBub3QgZm9yIHRo
ZSBrZXJuZWwuCgpJIHdhcyB0cnlpbmcgdG8gaW50ZXJwcmV0IHdoYXQgVmluY2VudCB3cm90ZSwg
bm90IHdoYXQgeW91IHdyb3RlLAp5b3Ugd2VyZSBwcmV0dHkgY2xlYXIgYWxyZWFkeSA7LSkKCldp
dGggdGhlIHN0cmljdGVyIHBvbGljeSB5b3Ugc3VnZ2VzdCwgd2UnZCBsb29zZSB0aGUgYWJpbGl0
eSB0byBzdXBwb3J0CnNvbWUgZXh0ZW5zaW9ucyB0aGF0IG1pZ2h0IGJlIGNvbW1vbjoKCi0gYW4g
ZXh0ZW5zaW9uIGZvciB1c2VyIHNwYWNlIHRoYXQgYWRkcyBuZXcgcmVnaXN0ZXJzIHRoYXQgbXVz
dCBiZQogIHNhdmVkIGFuZCByZXN0b3JlZCBvbiBhIHRhc2sgc3dpdGNoLCBlLmcuIEZQVSwgRFNQ
IG9yIE5QVQogIGluc3RydWN0aW9ucy4gQVJNIHN1cHBvcnRzIHNldmVyYWwgaW5jb21wYXRpYmxl
IGV4dGVuc2lvbnMgbGlrZQogIHRoYXQgaW4gb25lIGtlcm5lbCwgYW5kIHRoaXMgaXMgcmVhbGx5
IHVnbHksIGJ1dCBJIHN1c3BlY3QgUklTQy1WCiAgd2lsbCBhbHJlYWR5IG5lZWQgdGhlIHNhbWUg
dGhpbmcgdG8gc3VwcG9ydCBhbGwgY29tYmluYXRpb25zIG9mCiAgc3RhbmRhcmQgZXh0ZW5zaW9u
cywgc28gZnJvbSBhIHByYWN0aWNhbCBwZXJzcGVjdGl2ZSBpdCdzIG5vdAogIG11Y2ggZGlmZmVy
ZW50IGZvciBjdXN0b20gZXh0ZW5zaW9uLCBhc2lkZSBmcm9tIHRoZSBxdWVzdGlvbgogIGhvdyBm
YXIgeW91IHdhbnQgdG8gZ28gdG8gZGlzY291cmFnZSBjdXN0b20gZXh0ZW5zaW9ucyBieQogIHJl
cXVpcmluZyB1c2VycyB0byBwYXRjaCB0aGVpciBrZXJuZWxzLgoKLSBBIGNyeXB0byBpbnN0cnVj
dGlvbiBmb3IgYSBjaXBoZXIgdGhhdCBpcyB1c2VkIGluIHRoZSBrZXJuZWwKICBmb3Igc3BlZWRp
bmcgdXAgbmV0d29yayBvciBibG9jayBkYXRhIGVuY3J5cHRpb24uCiAgVGhpcyB3b3VsZCB0eXBp
Y2FsbHkgYmUgYSBzdGFuZGFsb25lIGxvYWRhYmxlIG1vZHVsZSwgc28KICB0aGUgaW1wYWN0IG9m
IGFsbG93aW5nIGN1c3RvbSBleHRlbnNpb25zIGluIGFkZGl0aW9uIHRvCiAgc3RhbmRhcmQgb25l
cyBpcyBtaW5pbWFsLgoKICAgICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
