Return-Path: <SRS0=rqMp=RP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D56EAC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 10:14:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A44C5214AE
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 10:14:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Klqa62G/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A44C5214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZnGvhmPq3E5D37AjjVeiizmfTlP7xZvR5gksaDQo94=; b=Klqa62G/6ASaNA
	sI4whye9qshYfDrkajQSKb/a+7u9dnetq+WlvrFAn8RazBl5E/QUHxr9sYUB/OYhLGB4u/rMzG2E+
	7+9B79FpQ8zoWyEuDiV1ZvE4PQkP3SKwFk9jzsoaj8Q/I3aVKvWI+o7M74+NxldqPVM/n3N4XOU+n
	TBZRVPCZKQHxZOzdtigRwwkoRKls+BKkBawYivye9yGIpSISk8S26clMSlBit2o90B4zCPJB1vHFs
	1TgYtG2ioL2AkyBjduZFBw/rIX8Imd5ODvJhRNj3rs3KKJvpgM6dFwrnZbhRMX4+ptuRn1/gDPWW6
	NmHU0KsehY2pfUB4zr/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3eQR-0004Cg-4q; Tue, 12 Mar 2019 10:14:23 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3eQN-0004Bv-V0
 for linux-riscv@lists.infradead.org; Tue, 12 Mar 2019 10:14:21 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AA9B1AC24;
 Tue, 12 Mar 2019 10:14:15 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v9 0/2] PWM support for HiFive Unleashed
References: <1552378289-27245-1-git-send-email-yash.shah@sifive.com>
X-Yow: It's OKAY --- I'm an INTELLECTUAL, too.
Date: Tue, 12 Mar 2019 11:14:15 +0100
In-Reply-To: <1552378289-27245-1-git-send-email-yash.shah@sifive.com> (Yash
 Shah's message of "Tue, 12 Mar 2019 13:41:27 +0530")
Message-ID: <mvmimwotn60.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_031420_141779_4CCBDDC3 
X-CRM114-Status: UNSURE (   7.88  )
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
 palmer@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 sachin.ghadi@sifive.com, thierry.reding@gmail.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTcOkciAxMiAyMDE5LCBZYXNoIFNoYWggPHlhc2guc2hhaEBzaWZpdmUuY29tPiB3cm90ZToK
Cj4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBhIFBXTSBkcml2ZXIgYW5kIERUIGRvY3VtZW50YXRp
b24KPiBmb3IgSGlGaXZlIFVubGVhc2hlZCBib2FyZC4gVGhlIHBhdGNoZXMgYXJlIG1vc3RseSBi
YXNlZCBvbgo+IFdlc2xleSdzIHBhdGNoLgoKSGVhcnRiZWF0IHRyaWdnZXIgc3RpbGwgZG9lc24n
dCB3b3JrIGZvciBtZS4KCkFuZHJlYXMuCgotLSAKQW5kcmVhcyBTY2h3YWIsIFNVU0UgTGFicywg
c2Nod2FiQHN1c2UuZGUKR1BHIEtleSBmaW5nZXJwcmludCA9IDAxOTYgQkFEOCAxQ0U5IDE5NzAg
RjRCRSAgMTc0OCBFNEQ0IDg4RTMgMEVFQSBCOUQ3CiJBbmQgbm93IGZvciBzb21ldGhpbmcgY29t
cGxldGVseSBkaWZmZXJlbnQuIgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
