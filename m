Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEFEC021A4
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 09:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+1xcNk19lOf9RpldHI0BtdySilckquiPa8DHiUc+1Jc=; b=fFkX3uSqN9qYTz
	e4LubgDl4ExC+ZlK6Uy7Idjb7JKDmhszFpf63qjHiXpr70d/B1nZCOvD4WGYaLbsUw8sIwGu/ZPrX
	4xSRHh8QY/v73YscnTPomhjLVfNXW+tyaaJ6XrhovhNh5ESYPFUTVULT6rJcxiQAUTBJePAEehJ9v
	uPhLk4TxbPra1ogzh2t1EjEcG8PSqtaZfXBhxMPXks4FlM/5pOKTjQSv7Gb691/RILjGSA+mUwJPT
	3f0qj6Q1ehYnqyE/Sh1An5RLSeM2GwT4cUiAfcV1hJTa6VUmqMfPvBguW0vrWiH1xoOYJp2lZ0nsD
	rKNKROL7ia/F8oPl0nsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tirav-0000000EEAN-0DDw;
	Fri, 14 Feb 2025 09:02:45 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tirV7-0000000ECeQ-0lY4
	for linux-riscv@lists.infradead.org;
	Fri, 14 Feb 2025 08:56:46 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5de38c3d2acso2940842a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Feb 2025 00:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739523403; x=1740128203; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9Kqb/+zQgoNRtarVFNZ+/aOPm1SAV4qBUOpuNnZj7rQ=;
        b=LAxFLeBgG8XAXLCNIapzIguIMNHv61GS0FJVmgNaziUM5/FU6m4wVyUGcVHG195Gq7
         JYqWqjBkFKxb18yHgZngydpZEO0RvBpJE6iqQGPLhRevRikOYERFWadTS/IPxM/vGxxh
         GM97WRgvJWTdG5FKHeVFuKVK+xmJyYyLbxzRmwizqKEgGBs25S6PQRtSM4LdR9LOgEoP
         sIjngi3UVXRz8q2IcJlwnECfXHa6g6aIJ8zKy5c7d6PFbS3dLryWFvHWq7uyTWWFS+56
         /XDqMjZQ8BSuhLAVN4d2SaijefRYRSyQxKyu48fuFl1ZCUZFkUCMJqFTDfMRqALxh0c9
         +h5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739523403; x=1740128203;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Kqb/+zQgoNRtarVFNZ+/aOPm1SAV4qBUOpuNnZj7rQ=;
        b=wJoPZ0MrEuYgPlZKIuIFqKvN7jFYLsNKJAwc1ksBLEZytxR0W3DZpJJrobtFYEHsc8
         i24KbFsTyYwgjIFMoctzDtk/Emy72SMJm7NeekLy7gP1SMU2s+BX390NGtacyfHQZQ7c
         3QvWw5glEUUC30srEEOWvNqaoXFUSVdcpX5jbxxUxreMhKAF+nZ7sUYQyg/eJXcVbDaK
         QXytI1N2WNajHk1a8AJX4BJNnbZDT8GE0iytyaa4dR0NZuJ3cAeCNG9cQw6mBk8jaPxI
         Mu7bo34ppgT+wmTTyqNzbM5WDIXljb6dQ+cdEIrQBdKW5B4v98lADn36TA/Iz1cy1MgJ
         2qbw==
X-Forwarded-Encrypted: i=1; AJvYcCUmMIHxNV7Bx1POMXlU6M/WiBe2nq/1VE+n0gNnVpYmCy/G3O1AD42EDGvWwvSvzV85Y3L8E0XKX/4oew==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3zMNpIC6CwRF9YRiAGVrr/KdoWHTF0gA0GFJa5AfrPPXY/1LF
	EHYyNs48yzBb627BYmMuGQQ+mvwf43+ccGAHr9nOjMinEQadopluIPjrN6QR
X-Gm-Gg: ASbGnctW71t9ooS7ghTQKOEXuguX+aUpi6cudarpbYwgSY6J5yCrTkRdy8SMl/dGXXe
	fmU+oZzY+EfzBEe4+p0z0z3zHlF54h66jejOeV38o5YEegeYlho6zRjZHSStSvg/VzgDmWDi/Rm
	ElBwcV3JWzvRmdsTTE6uwgPITGBrMHuBTGDLr8IIBiE1zr3//1olBQ6oEHStIIR5N+mrJEdEnPx
	aNQ/ZKbPtG3Qk52bYj0bDl0KknrUydYSqNRcdGVvkA4rXPEz+fONIWtTLa1ZLYFiqyi86ryVrsA
	0A37SyM/whb/2axm74nEJB86WKYAzJ0X
X-Google-Smtp-Source: AGHT+IFqEbwHxaFeljzu0PfuAtp7udbO/8qKtjBqtLZxQcoPfau33bDY4QxP+vf7C1LVwNKwMMolgQ==
X-Received: by 2002:a05:6402:26d6:b0:5dc:81b3:5e1a with SMTP id 4fb4d7f45d1cf-5deadd7b9aamr10094012a12.7.1739523403214;
        Fri, 14 Feb 2025 00:56:43 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece271223sm2612848a12.59.2025.02.14.00.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 00:56:42 -0800 (PST)
Message-ID: <40a548db804c6c8eb72494de17bee6210b8a7a85.camel@gmail.com>
Subject: Re: [PATCH v11 0/3] riscv: rtc: sophgo: add rtc support for CV1800
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, inochiama@outlook.com, 
	linux-kernel@vger.kernel.org, Jingbao Qiu <qiujingbao.dlmu@gmail.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Date: Fri, 14 Feb 2025 09:56:40 +0100
In-Reply-To: <BMXPR01MB24405F0CDCBDAF054888BB41FEFE2@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
References: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
	 <BMXPR01MB24405F0CDCBDAF054888BB41FEFE2@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_005645_217536_502B0CA3 
X-CRM114-Status: GOOD (  11.50  )
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

SGkgQ2hlbiEKCk9uIEZyaSwgMjAyNS0wMi0xNCBhdCAwODozMSArMDgwMCwgQ2hlbiBXYW5nIHdy
b3RlOgo+IEZpcnN0IG9mIGFsbCwgdGhhbmsgeW91IGZvciByZS1waWNraW5nIHVwIHRoaXMgb3Jw
aGFuIHBhdGNoc2V0Lgo+IAo+IFdlIHJlY2VudGx5IGNyZWF0ZWQgYSBtYWlsaW5nIGxpc3QgZm9y
IHNvcGhnbyAoc29waGdvQGxpc3RzLmxpbnV4LmRldiksIAo+IGFuZCB3ZSB3b3VsZCBhcHByZWNp
YXRlIGl0IGlmIHlvdSBzZW5kIGEgY29weSBvZiBhbnkgc29waGdvLXJlbGF0ZWQgCj4gcGF0Y2hl
cyB0byB0aGUgbWFpbGlzdCBpbiB0aGUgZnV0dXJlLgoKRG9lcyBpdCBtYWtlIHNlbnNlIHRvIGFk
ZCB0aGUgYWRkcmVzcyB0byB0aGUgTUFJTlRBSU5FUlMgZmlsZT8KT3IgaGFzIGEgY29ycmVzcG9u
ZGluZyBwYXRjaCBiZWVuIGFscmVhZHkgcG9zdGVkPwoKPiBZb3UgY2FuIHNlZSBodHRwczovL2dp
dGh1Yi5jb20vc29waGdvL2xpbnV4L3dpa2nCoGZvciBtb3JlIGRldGFpbHMgYWJvdXQgCj4gdGhp
cyBtYWlsaXN0LCBhbmQgd2UgYXJlIGtlZXBpbmcgdHJhY2sgb2YgdGhlIHN0YXR1cyBvZiB1cHN0
cmVhbWluZyAKPiBzb3BoZ28gcHJvZHVjdHMgdGhyb3VnaCB0aGlzIHdpa2kuIFdlIGhhdmUgdXBk
YXRlZCB0aGUgc3RhdHVzIG9mIHNvbWUgb2YgCj4gdGhlIHBhdGNoZXMgeW91IGFyZSB3b3JraW5n
IG9uLCBwbGVhc2UgaGVscCBkb3VibGUgY2hlY2suCgpMb29rcyBnb29kIHRvIG1lLCB0aGFua3Mh
CgotLSAKQWxleGFuZGVyIFN2ZXJkbGluLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
