Return-Path: <SRS0=W42x=NR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B1AC32789
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 23:46:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8177B20830
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 23:46:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NAqSk9be";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="JPrBnR4d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8177B20830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=xg4UiFEUqURX37SA3tc/YfvLQwAKBCHbWw+GhQ46/44=; b=NAqSk9beHicMDU/L5TJzENQyx
	WtD+f/wLt0VyNxg9sb+YOuNNwS9Rio2v5JQVT0GoGxNNvQZV9AHlODFvX3F2mI3xJZRFHMunSccOW
	4e69C5nOVuCY+anKb5hugInkyABwFc4kN3jaacYJtI5mJ5M4vsuthDuC5FRUwo7RGGPDNC6n6jUwG
	ZVkQsFLQtZTnmPWjUZe8MjdPGNE7JvEZUOjZVnS8GbFUbgNviJ8gUecnzzYAS9ESAamu1q6d3yFrj
	B3xl9/JMoe435jA0GeV63JUbK82fi9k/s791j6bTnzarcg8YBif+rKEhna4E4IiKFFxbYXsE/9Z4K
	iLgSlb87w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKB2u-0002DY-7w; Tue, 06 Nov 2018 23:46:08 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKB2r-0002C8-I0
 for linux-riscv@lists.infradead.org; Tue, 06 Nov 2018 23:46:06 +0000
Received: by mail-pg1-x542.google.com with SMTP id c10-v6so6522980pgq.4
 for <linux-riscv@lists.infradead.org>; Tue, 06 Nov 2018 15:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=PvRdCeUv9lrfO5bDLD5hQ9E8Bby0+CLYXIqfRz+Gd1Q=;
 b=JPrBnR4dxGgxy4YHURFqa2BPfEtflcDS6ERTNr4bfA3/LpP8ATsZ/i3LjT0sq6tB2P
 7+m5IjA+PygK6W0jFPFI/KKekvcVCSXa6v2c+5Uu5G0iSBVWbbic+Qvi793OvqV7FJ7n
 qdFKVIhOg9hL9xhhr0t8eSYWUPKdZbUDpg8E5QIa4pG0u2tWqAHOhSVi0wEy1iRNB/J7
 0dkVRKr3j8aT6CNQE16L87DWdqxSfO6Kz1dXM6K07APmsbzXYHFuT10KbC9uGBy3buME
 xFXcO8MrXGlUSWD5D9KQz2CIG2j3itrYy64Lspaq1m1ODnUsa/K6sOhMxBgI6nJpxxQj
 pjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=PvRdCeUv9lrfO5bDLD5hQ9E8Bby0+CLYXIqfRz+Gd1Q=;
 b=nsxunArs8FRVwpP+jueJYIPf0u2CJw3TuiJyLuElfEZWX0dEC+RqvVYhbQEvZwwomX
 7Vw9hmmKjGiKUyMxv2BoVA8+YbRYYrpZvtm+GQURH2FpuEBBclOzJxuT7IlRUwaGKhMP
 ytggY47l4dkLcmZc59xzP+yk4BD0FtfHD6NY4BgW6OVOkWGOi7PIId3YqNBIZQTbMQGI
 YzjkKCL+JirJAUlYCVMPLLv4doAnvGnfKBvLBOMSgZXrbryEzBp5u5oMupd3sg0zRPAp
 YrVLEt7tDAlSknW+FfmAv8O2uhedSgASJ1KQfdQWC0AR9JC6H+bJI9/uPWI/Qt8Slhbl
 LNtA==
X-Gm-Message-State: AGRZ1gK1Y2QhJ0uAWkauX9cqPGEFFR4voyQ9Wm5bP8oNdYlohvrofpXh
 OGQP206NmXcF7NxKQjPclXDGHQ==
X-Google-Smtp-Source: AJdET5f8pZdDNW2PflTzHiI+CBFFla7acp298E/06PjRQ/Hdk/EaVw8tQKjUw8svXfJqEUWwDcpcXA==
X-Received: by 2002:a62:9316:: with SMTP id
 b22-v6mr29063595pfe.193.1541547954745; 
 Tue, 06 Nov 2018 15:45:54 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 22-v6sm14757457pfs.108.2018.11.06.15.45.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Nov 2018 15:45:54 -0800 (PST)
Date: Tue, 06 Nov 2018 15:45:54 -0800 (PST)
X-Google-Original-Date: Tue, 06 Nov 2018 15:44:21 PST (-0800)
Subject: Re: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
In-Reply-To: <CAK8P3a2c98VVPArCkdAR=-nnDBq1gYRCLDDgQB71eGiTSRdb4A@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-19511b81-9f89-4a15-8b2f-d63779074fb4@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181106_154605_592519_1CCDE7A1 
X-CRM114-Status: GOOD (  15.27  )
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
Cc: vincentc@andestech.com, aou@eecs.berkeley.edu, alankao@andestech.com,
 greentime@andestech.com, zong@andestech.com, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, kito@andestech.com,
 linux-riscv@lists.infradead.org, deanbo422@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181106234554.TYDmabd6uMVCvOOJIMpnPO5pbd_9Wl6qEuZlIOKbICQ@z>

T24gTW9uLCAwNSBOb3YgMjAxOCAwMDo1Mjo1MiBQU1QgKC0wODAwKSwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBPbiAxMS81LzE4LCBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGluZnJhZGVhZC5vcmc+
IHdyb3RlOgo+PiBPbiBNb24sIE5vdiAwNSwgMjAxOCBhdCAwMjo1ODowN1BNICswODAwLCBWaW5j
ZW50IENoZW4gd3JvdGU6Cj4+PiBNYW55IHRoYW5rcyBmb3Iga2luZHMgb2YgY29tbWVudHMuIEkg
cXVpY2tseSBzeW50aGVzaXplIHRoZSBjb21tZW50cyBhbmQKPj4+IGxpc3QgdGhlbSBhcyBiZWxv
dy4KPj4+IDEuIFRoZSBrZXJuZWwgaW1hZ2Ugc2hhbGwgaW5jbHVkZSBhbGwgdmVuZG9yLXNwZWNp
ZmljIGNvZGUuCj4+Cj4+IEkgZnVuZGFtZW50YWxseSBkaXNhZ3JlZSB3aXRoIHRoaXPigKYgYW5k
IHRoaW5rIGl0IHNob3VsZCBiZSB0aGUgY29udHJhcnkuCj4+Cj4+IDEuIFRoZSBrZXJuZWwgc2hh
bGwgc3VwcG9ydCBubyB2ZW5kb3Igc3BlY2lmaWMgaW5zdHJ1Y3Rpb25zIHdoYXRzb2V2ZXIsCj4+
IHBlcmlvZC4KPgo+IEkgdGhpbmsgd2hhdCB3YXMgbWVhbnQgYWJvdmUgaXMKPgo+IDEuIElmIGEg
dmVuZG9yIGV4dGVuc2lvbiByZXF1aXJlcyBrZXJuZWwgc3VwcG9ydCwgdGhhdCBzdXBwb3J0Cj4g
bXVzdCBiZSBhYmxlIHRvIGJlIGJ1aWx0IGludG8gYSBrZXJuZWwgaW1hZ2Ugd2l0aG91dCBicmVh
a2luZyBzdXBwb3J0Cj4gZm9yIENQVXMgdGhhdCBkbyBub3QgaGF2ZSB0aGF0IGV4dGVuc2lvbiwg
dG8gYWxsb3cgYnVpbGRpbmcgYSBzaW5nbGUKPiBrZXJuZWwgaW1hZ2UgdGhhdCB3b3JrcyBvbiBh
bGwgQ1BVcy4KClllcy4gIEkgZG9uJ3Qgd2FudCBhbnl0aGluZyB0aGF0IHdvbid0IGNvbXBpbGUg
d2l0aCB1cHN0cmVhbSBHQ0MsIGJ1dCBJIGFsc28gCmRvbid0IHdhbnQgdG8gaGF2ZSBhIEtjb25m
aWcgdGhhdCBzYXlzICJtYWtlIHRoZSBrZXJuZWwgb25seSB3b3JrIG9uICRWRU5ET1IncyAKaW1w
bGVtZW50YXRpb24iLiAgSSB0aGluayB0aGlzIGNhbiBiZSBhY2hpZXZlZCwgYXQgbGVhc3QgZm9y
IHRoZSBjYXNlcyBJJ3ZlIApzZWVuIHNvIGZhci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
