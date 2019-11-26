Return-Path: <SRS0=Sfcq=ZS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA7BC432C0
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Nov 2019 16:43:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92B752084D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Nov 2019 16:43:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QAuVnYkc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LiImRZD+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92B752084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ll+e5O5YNNYz2Go/6tHEIAFEoJgaNx3Ra6c0UZIv/5A=; b=QAuVnYkcJuVJZF
	FXo7zLCvrNTU6QicQMNENe5qxOU8gWiVThC2oVpXsB+Pa9n8F5+JkGPHdRnsxJNSM1TxhtFPND56o
	WsxgxLzrIljjouXen3vZbQDm+OFwNwuiVgbj2Ts3oyrladU9aWquvobuO5j1ETKaMUVKnE7eaWMiY
	6jbMhfmMg95PxdhPnjcO27UznYMA3UfqqH7dybnaGupE4RdoCzCqqYyxmVZBYdWNEueW1SeK3fDiS
	qdB55FKrVIPfezHTF/u1o7pB+CFwbwfh6OHITyLKnB5K/rZf0NiSxYR7ljcY9yUSjhKHuZk20o6qi
	Qv9AYM1IqvOrjBkqfosw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZdwD-000172-Ex; Tue, 26 Nov 2019 16:43:41 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZdwB-00016j-DJ
 for linux-riscv@lists.infradead.org; Tue, 26 Nov 2019 16:43:40 +0000
Received: by mail-qv1-xf41.google.com with SMTP id s18so7563814qvr.4
 for <linux-riscv@lists.infradead.org>; Tue, 26 Nov 2019 08:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KhtA9rIXQXlNV4fQ7BqQSdVc8vKs6lkf7nkcaD0QNF4=;
 b=LiImRZD+xfZ3IAzkqOnhJ6Wg3r6nQIwN79W130V6fXYY1bnILHPRse0aWy0TTCOBMc
 tqSmPCek/nl4knYns2V7+hKDw1mx96aYsHPf/1r7yvxoGWCU4yjlPXgH9rPmwNL/MKHh
 uf6zr5rxTv3+G2McmIn1E4jPOqSHQ1TrBBiknK7lTct3fXHHHmuhPR+AgMDOdf1RiGBA
 HTHN2H9ILqvPvIaW+JgwgjjvAjehktnIcDJ62S/GaFTj4PPUy4K0VIvH1RpU4zIT9pNQ
 hatSLCLokVZeIqDYv6ggp/pcbJaAMvlec/w0C8p4ZS7cWfmf+iioy87xDxAElUVjc14Q
 qCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KhtA9rIXQXlNV4fQ7BqQSdVc8vKs6lkf7nkcaD0QNF4=;
 b=PYkqivsQnC+HnkTtQhjklo85Fi34kPnWILY20F6h+3jDZdnoJhmnKe5EalkyQ9QLBR
 bdyr7/oHLFAV1FMVtajrAp/BdXWftAzQdcttNciCq9Xa/vfLBuYQorwi1UUGThh3DFAJ
 W8zWpkv89fgId8wuzLnb1TI94Y2yMcSbFDRYT4B7nD78d4k7ZF44nD59ZhbTo68Yj5Bx
 J7GCwiVT6ZALNgYQC1dY2L3V4DjZssZeASIaT2wwcnnyJavSGZshvZQ8jt4ktEaaYRKg
 5gF0DiHyUQg5rtVBD+hzowkAwMMlU7Jg+4ScIGAUY4gLDy5JAAIrdfa6Z7hvWD9kXqTV
 KAYA==
X-Gm-Message-State: APjAAAVzKWQK32u6VGCPzp5d8gotldUqwqdYhs7Aw76Anrv6ObRK/XNG
 MV7fPXQRCZRn/0b6YtHTL/HDAaSP9GxwzWDNy1p92xhKzvY=
X-Google-Smtp-Source: APXvYqyq/GXZX7yyMNA8vGtvbY6ac+kEF+SEwTmtTMCRiJ3Dmjd3mK5Drs42n+6p2OBtOym0w7lnnSnQ5lb8DzvqBIg=
X-Received: by 2002:a05:6214:208:: with SMTP id
 i8mr19822372qvt.233.1574786617862; 
 Tue, 26 Nov 2019 08:43:37 -0800 (PST)
MIME-Version: 1.0
References: <mhng-0a2f9574-9b23-4f26-ae76-18ed7f2c8533@palmer-si-x1c4>
 <87d0yoizv9.fsf@xps13.shealevy.com> <87zi19gjof.fsf@xps13.shealevy.com>
 <CAJ+HfNhoJnGon-L9OwSfrMbmUt1ZPBB_=A8ZFrg1CgEq3ua-Sg@mail.gmail.com>
 <87o8wyojlq.fsf@xps13.shealevy.com>
In-Reply-To: <87o8wyojlq.fsf@xps13.shealevy.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Tue, 26 Nov 2019 17:43:26 +0100
Message-ID: <CAJ+HfNiq9LWA1Zmf_F9j23__K2_NqcfQqRA5evGVP5wGzi881w@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Load modules within relative jump range of the
 kernel text.
To: Shea Levy <shea@shealevy.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191126_084339_475120_62BA5377 
X-CRM114-Status: UNSURE (   8.15  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, albert@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyNiBOb3YgMjAxOSBhdCAxNDoyNSwgU2hlYSBMZXZ5IDxzaGVhQHNoZWFsZXZ5LmNv
bT4gd3JvdGU6Cj4KPiBIaSBCasO2cm4sCj4KPiBVbmZvcnR1bmF0ZWx5IEknbSBub3Qgc3VyZSB3
aGF0IG1vcmUgaXMgbmVlZGVkIHRvIGdldCB0aGlzIGluLCBhbmQgSSdtCj4gaW4gdGhlIG1pZGRs
ZSBvZiBhIG1vdmUgYW5kIHdvbid0IGhhdmUgZWFzeSBhY2Nlc3MgdG8gbXkgUklTQy1WIHNldHVw
Cj4gZm9yIHRlc3RpbmcuIEkgZG9uJ3QgdGhpbmsgeW91IGNhbiBjb3VudCBvbiBtZSBmb3IgdGhp
cyBvbmUuCj4KClRoYW5rcyBmb3IgZ2V0dGluZyBiYWNrIHF1aWNrbHkhIE5vIHdvcnJpZXMsIEkn
bGwgcGljayBpdCB1cCEKCgpDaGVlcnMsCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
