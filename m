Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5807CAC5B8
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Sep 2025 14:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hs04xyrrDVcbRJVuU3VhRrNRS1Jf0rsJi6gACV6qBV4=; b=NTQt7gKXVsXhhv
	TMt4AsJkkSksaZIjfbsi3ACBjugHyP03XBzDOe/P49KxUZRG0wL9jGcOcu77gVVYckWT8e05dwrmK
	WhISJi3wIwucX8QuNz6UVcgpvrZZ9HDnMxo0dnxyBV9T3AixqrrvmRIlswS8mC9USt3rhVlyzeqKO
	QLlwqHYrbHPQEo52+dVVbfUCtE4zBNVm4h7dFAoTYyJeE2w/XjBOlPJU9jpx7X49D19QCtY4DyEbC
	LAGWUUrIZDXbpRiusdZoi77ri8UCOLxWwwskJ726ep2ZOVJaCvVwZYwEFgV+lsltz4PsHbNTmk/rg
	axUELdK2v8r8RIV06Bbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29RY-00000001za6-1TqE;
	Fri, 26 Sep 2025 14:29:04 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29RU-00000001zWr-3kSi
	for linux-riscv@lists.infradead.org;
	Fri, 26 Sep 2025 14:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:content-transfer-encoding
	:in-reply-to; s=k1; bh=00v6MirzP4QEvBylEctFh7muMmPA8J8nPJMfbun/H
	SM=; b=XSqU27EnmXYl3Tz0pztgPK16Fl4QqKaVl6BSonzIg4xyoSnBLqf1Mq4mH
	v3gRIeqIxEegnAYqEUwrf8GfkkEvlen6JZiS3w4OMB8Ci3xfKFSCThJw4pvlJNC2
	5u/svt1LFakI8Mpv/wk9YD0gQ6DrO2AcnD2/agQWofElI/hlbFqhOPFp/Z4mpQl1
	Mati5ivvH3rr3hI5fiTJ6L1gxKVzjcP84d6Dw2Yn2E0ERxMu58m3WvwufZwdwCCL
	THYQ7mv36T5wyFtY0sYYIVuQklkCfOs59TPgMpyK3y47uFY3BSrQdQfBDy9Rf9jc
	h9zGPoX5Lf3iRQH8+t1MR2UDG3eJg==
Received: (qmail 2289488 invoked from network); 26 Sep 2025 16:28:56 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2025 16:28:56 +0200
X-UD-Smtp-Session: l3s3148p1@wt0NG7U/RsogAwDPXwQHAL/S9V79e5yL
Date: Fri, 26 Sep 2025 16:28:55 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, Andi Shyti <andi.shyti@kernel.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <aNajJ0RZ4Ku0eDXr@shikoro>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
 <20250926111055-GYB1324993@gentoo.org>
 <E4EE696368DDDB1E+aNaRl8upyNeld9zX@troy-wujie14pro-arch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E4EE696368DDDB1E+aNaRl8upyNeld9zX@troy-wujie14pro-arch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_072901_804578_5481DA1F 
X-CRM114-Status: UNSURE (   4.43  )
X-CRM114-Notice: Please train this message.
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

Cj4gU2luY2UgcGF0Y2hlcyAx4oCTNSBoYXZlIGFscmVhZHkgYmVlbiBtZXJnZWQsCj4gc2hvdWxk
IEkga2VlcCB0aGUgY3VycmVudCB2ZXJzaW9uIG51bWJlciBhbmQganVzdCBzZW5kIHRoaXMgc2lu
Z2xlIHBhdGNoID8KClllcywgcGxlYXNlLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
