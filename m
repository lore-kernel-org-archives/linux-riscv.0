Return-Path: <SRS0=JiLF=R5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27480C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2019 08:45:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9A8A20856
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2019 08:45:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ewt5TI6H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9A8A20856
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mdX2ZOo468CydjxHAH+MZsCk1tpHJZlPT7UPqHvNAjg=; b=Ewt5TI6H3jFJW0
	XwqsyeQJC+fM2MNTa0sc1v+ijjgq1SizmLjKFFellfJovR5LTf7pVTBLe62en9f7augmiv8WqFhWw
	IqBP7fZMJ4ttjz2F0YIQOV/gvlhGEFdyjzVamELMhcZXCo42AUveBIOCg7adMD4AqtTzHv1yKyG6O
	6aHhHknTVe92/SqHJVt+sSMDx8p/hxM+3Y3XHMFP0r4I1fsQGX5n2LfZ/x4Tcj4dh+YexZl0rxU0Z
	KtuGTLZlTc0K1OgOsINgLGbQPZdQl3Gk96OU7wZ0KdGns69uo4WAn+ASDzLciCgToNOnHVKOKW5O6
	bu3UwwS3pEVD8oLXslIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8hhg-0004SO-TS; Tue, 26 Mar 2019 08:45:04 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8hhd-000454-Ip
 for linux-riscv@lists.infradead.org; Tue, 26 Mar 2019 08:45:03 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E22E9AC4B;
 Tue, 26 Mar 2019 08:44:57 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v11 0/2] PWM support for HiFive Unleashed
References: <1553508779-9685-1-git-send-email-yash.shah@sifive.com>
 <mvmbm1zueya.fsf@suse.de>
 <CAJ2_jOFuw2uu7Et1cOkKpaEwVofR5nD_v-rkOgFZbACK4BvHhg@mail.gmail.com>
X-Yow: O.K.! Speak with a PHILADELPHIA ACCENT!! Send out for CHINESE FOOD!!
 Hop a JET!
Date: Tue, 26 Mar 2019 09:44:57 +0100
In-Reply-To: <CAJ2_jOFuw2uu7Et1cOkKpaEwVofR5nD_v-rkOgFZbACK4BvHhg@mail.gmail.com>
 (Yash Shah's message of "Tue, 26 Mar 2019 12:15:11 +0530")
Message-ID: <mvmva06t46u.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190326_014501_778285_8044E1D6 
X-CRM114-Status: UNSURE (   9.59  )
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
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, Sachin Ghadi <sachin.ghadi@sifive.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTcOkciAyNiAyMDE5LCBZYXNoIFNoYWggPHlhc2guc2hhaEBzaWZpdmUuY29tPiB3cm90ZToK
Cj4gJ09uIE1vbiwgTWFyIDI1LCAyMDE5IGF0IDk6MjQgUE0gQW5kcmVhcyBTY2h3YWIgPHNjaHdh
YkBzdXNlLmRlPiB3cm90ZToKPj4KPj4KPj4gSSBzdGlsbCBkb24ndCBzZWUgYW55IGltcHJvdmVt
ZW50LiAgRllJLCB0aGlzIGlzIHRoZSBwYXRjaCBJIHVzZSBmb3IgdGhlCj4+IGRldmljZSB0cmVl
Ogo+Pgo+Cj4gSSBhbSBzaGFyaW5nIHlvdSBteSB0ZXN0IGVudmlyb25tZW50IHdoaWNoIGhhcyBi
ZWVuIHdvcmtpbmcgZm9yIG1lIHNvCj4gdGhhdCB5b3UgY2FuIGR1cGxpY2F0ZSBhdCB5b3VyIGVu
ZAoKUGxlYXNlIHRlc3QgeW91ciBkcml2ZXIgd2l0aCB0aGUgRFQgYXMgYWJvdmUuCgpBbmRyZWFz
LgoKLS0gCkFuZHJlYXMgU2Nod2FiLCBTVVNFIExhYnMsIHNjaHdhYkBzdXNlLmRlCkdQRyBLZXkg
ZmluZ2VycHJpbnQgPSAwMTk2IEJBRDggMUNFOSAxOTcwIEY0QkUgIDE3NDggRTRENCA4OEUzIDBF
RUEgQjlENwoiQW5kIG5vdyBmb3Igc29tZXRoaW5nIGNvbXBsZXRlbHkgZGlmZmVyZW50LiIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
