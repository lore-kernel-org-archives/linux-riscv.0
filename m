Return-Path: <SRS0=meey=XI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF9AC4CEC5
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2019 20:40:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A68820692
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2019 20:40:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YMWtFRnC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A68820692
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=q/KTPuAsI5mgEU3HfSQJrtJlEnMGFp82oDqEGvd7Vdw=; b=YMWtFRnCEQx5kuVSk3AMCTH60
	UyuZZq3HG8rLqfYuy1e/c1+sQJdQtJjej36tlNwvCzDjdhWXBv1OFkMrzad0/7Y4O43LTkjmUWjYf
	vmQFh6fY7INuQRkq5MEE3piB+zqvXkEAhchTA4hdsiQGjavtpoXE2VpOUdC3BYZ1M+eTzU2N+GSOC
	8alytReOYPT5iYBxGUf2oevGWPiQjUugfWsau/jnsMDU5PfJ3GfAkpdKg/6lQgKtEpTrz6qgww4Cg
	DRapGyD6SGehjGo4FmPu/I8fZY7dfWiZBDEm+c3+A1If3U6sAxGiC1dlvqDrJKI8NL81VEFYEUhaN
	ax7e00o8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i8sMp-0008OT-2i; Fri, 13 Sep 2019 20:40:31 +0000
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8sMm-0008NH-Vv
 for linux-riscv@lists.infradead.org; Fri, 13 Sep 2019 20:40:30 +0000
Received: by mail-pf1-f195.google.com with SMTP id y22so18831924pfr.3
 for <linux-riscv@lists.infradead.org>; Fri, 13 Sep 2019 13:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=qU9A6qb+veDWW9PC+1djL9KV1hH5r1qd0AwYGNHfhBY=;
 b=W7M12vjzlqbzDL+QQsoyiSZv3eufKibUnXc3YUDO3gqweIUgHTAzbOUQBmVVOaNxJi
 2atuNUPi0eI6Ygro2cMWTGOESYpRXrFwc63y2If0MGHKIYqCTa1Zgf0MIhXeW9IADy+z
 Fwf+NMiVluzo4OlA4oDS+P7O8o28CjhLe4ts0tsTBpT2no1Qcrxx24QEsZKpljz8FgGd
 7d533nXHgYiz4GPJGCl/0UjMsVIg2wTeLz4rRTEo+dhzH+ul8hbephdZ0BhBrAbcjj22
 d/AGJBiArNLOx0EfLGGNcnZ4Ha2dd1x+c5ynZr95XUXONPlJX2kinWhH+rD3x2j1S9l3
 sOuw==
X-Gm-Message-State: APjAAAXyrtYj27DS6TGKKVsx54qRWrpfCBJyqOHdBnhpo9yATtvLuf81
 spKSWU6IjvmRBYp7sxXtRUAjWg==
X-Google-Smtp-Source: APXvYqwRwn0c+PmiWsgzZC28IXBATIqtHCXXHGwwyRxHek1xZzURFPAkB8G4vkaL2qShC9KYKXBgYA==
X-Received: by 2002:a63:f357:: with SMTP id t23mr45980721pgj.421.1568407227922; 
 Fri, 13 Sep 2019 13:40:27 -0700 (PDT)
Received: from localhost (amx-tls3.starhub.net.sg. [203.116.164.13])
 by smtp.gmail.com with ESMTPSA id u65sm33355649pfu.104.2019.09.13.13.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2019 13:40:27 -0700 (PDT)
Date: Fri, 13 Sep 2019 13:40:27 -0700 (PDT)
X-Google-Original-Date: Fri, 13 Sep 2019 13:39:43 PDT (-0700)
Subject: Re: [PATCH] serial/sifive: select SERIAL_EARLYCON
In-Reply-To: <20190910143630.GA6794@lst.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: schwab@suse.de, Christoph Hellwig <hch@lst.de>
Message-ID: <mhng-218f6b9f-bfd8-4adb-8147-298989494bcf@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190913_134029_054786_3C38F126 
X-CRM114-Status: UNSURE (   9.64  )
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
Cc: Greg KH <gregkh@linuxfoundation.org>, schwab@suse.de, jslaby@suse.com,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAxMCBTZXAgMjAxOSAwNzozNjozMCBQRFQgKC0wNzAwKSwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMTA6MTg6MTVBTSArMDIwMCwgQW5k
cmVhcyBTY2h3YWIgd3JvdGU6Cj4+ID4gSG93IHNvPyAgV9GWdGggT0YgYW5kIGEgc3Rkb3V0IHBh
dGggeW91IGp1c3Qgc2V0IGVhcmx5Y29uIG9uIHRoZQo+PiA+IGNvbW1hbmQgbGluZSB3aXRob3V0
IGFueSBhcmd1bWVudHMgYW5kIGl0IHdpbGwgYmUgZm91bmQuCj4+IAo+PiBEb2Vzbid0IHdvcmsg
Zm9yIG1lLgo+PiAKPj4gWyAgICAwLjAwMDAwMF0gTWFsZm9ybWVkIGVhcmx5IG9wdGlvbiAnZWFy
bHljb24nCj4KPiBUaGF0IGZ1bmN0aW9uYWxpdHkgaXMgaW1wbGVtZW50ZWQgYnkgcGFyYW1fc2V0
dXBfZWFybHljb24gYW5kCj4gZWFybHlfaW5pdF9kdF9zY2FuX2Nob3Nlbl9zdGRvdXQuICBDaGVj
ayB3aHkgdGhvc2UgYXJlbid0IGJ1aWx0IGludG8KPiB5b3VyIGtlcm5lbC4KCk9wZW5FbWJlZGRl
ZCBwYXNzZXMgImVhcmx5Y29uPXNiaSIsIHdoaWNoIEkgY2FuIGZpbmQgaW4gdGhlIGRvdW1lbnRh
dGlvbi4gIEkgCmNhbid0IGZpbmQgYW55dGhpbmcgYWJvdXQganVzdCAiZWFybHljb24iLiAgSSd2
ZSBzZW50IGEgcGF0Y2ggYWRkaW5nIHNiaSB0byB0aGUgCmxpc3Qgb2YgZWFybHljb24gYXJndW1l
bnRzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
