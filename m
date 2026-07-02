Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C209C43602
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 08:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xff6R6ydfZmkhRgv+47C/0WKkjHdZ1au3+dZsOEb/5k=; b=I31ZbMqgVbm66n
	AMwlgUfBS8eJ1BE/iXJKMrOSFgn0t+uMFvAPDBCnjOp9hp4SRoS9WxRUDoJcks1WPtScFjHpF8JeV
	HyxKE7SDR3B2EUYcvrU91fuxQidP0ybbRo0IIzRVospiv26U7tmrBQ6DejGg+R3YnsYN43bAW9QYE
	KspgZfQHjNqNRgBmzFwohcyZwqGWWedZVjSBVoqwC90/nxfGeSMAinzlJa2RGVWCWI6q4c/F5EKX0
	iXdZUzDOvcOzi8MVEVydVOW8EH3o08j95Z/CgIcbyyFU3esf1LxKLrFwnYTFuUfabQr5VoSCK8B5v
	uTQQq0VXvmo8Z+Wu5w1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCXe-00000003ot5-0Te8;
	Thu, 02 Jul 2026 08:13:02 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCXb-00000003osO-1Yc2
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 08:13:00 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782979977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1g5nByJG5knbckJrtSh5dIvJzHbPhIcgBQQ/GmVani8=;
	b=Laaadz6ItsMrGnI/DCLptW6hRwNrunhrwsZ+SteJQre0s7pJlv2ZXkYLd05gH1xXq07fGc
	Vi8YNvIWBOT8FNLLHLx7SESyAS5utaePucXjn80xGEJrOd8h1jUgS1XCJ2r9F8L3sEkWcD
	JUDUK1nvKxgTMZne/Y3kPYipcCYtsSqPfBdZNxVYfA8R5NUie9eYL3lEz7cqPm0j/5TFI3
	YSi0Y2RviqZNFteVI0176YmlvnAlQANuscO86fpLVWMYM64yushOWMy2neDmDasepONuHI
	qLiiPS4Qr7HZaMyC9klXk5YN7N7Wb7cNVDxNBHM5gmR4FTOIr8LrJilguShoXw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782979977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1g5nByJG5knbckJrtSh5dIvJzHbPhIcgBQQ/GmVani8=;
	b=GMx2QucFP+mx1exSY8sb6c44e7+vFGSiknmXObZ16YAMVVoYEYlCmxZqUWBfx0kwWmsrCP
	FjLGWCUfGJf6naDQ==
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?utf-8?Q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?=
 <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH 0/3] riscv: alternative: Statically compute alternative
 section boundaries and patch compat vDSO
In-Reply-To: <20260630-riscv-vdso32-alternative-v1-0-a32fd89b7b1c@linutronix.de>
References: <20260630-riscv-vdso32-alternative-v1-0-a32fd89b7b1c@linutronix.de>
Date: Thu, 02 Jul 2026 10:12:56 +0200
Message-ID: <87fr21vmgn.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_011259_557990_5C8A1768 
X-CRM114-Status: UNSURE (   5.65  )
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

VGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+IHdyaXRl
czoKPiBDdXJyZW50bHkgdGhlIGFsdGVybmF0aXZlIHNlY3Rpb25zIGFyZSBleHRyYWN0ZWQgZnJv
bSB0aGUgdkRTTwo+IGJpbmFyaWVzIGF0IHJ1bnRpbWUuIFRoaXMgaGFzIHJ1bnRpbWUgb3Zlcmhl
YWQgYW5kIGFsc28gZG9lc24ndAo+IHdvcmsgZm9yIHRoZSBjb21wYXQgdkRTTy4KPgo+IEV4dHJh
Y3QgdGhlIG9mZnNldHMgb2YgdGhlIGFsdGVybmF0aXZlIHNlY3Rpb24gZHVyaW5nIHRoZSBidWls
ZCB3aXRoIHRoZQo+IGV4aXN0aW5nIHN5bWJvbCBleHRyYWN0aW9uIG1hY2hpbmVyeSBhbmQgdXNl
IHRob3NlLgo+Cj4gQWxzbyBhZGQgc3VwcG9ydCBmb3IgdGhlIGNvbXBhdCB2RFNPLgoKUmV2aWV3
ZWQtYnk6IE5hbSBDYW8gPG5hbWNhb0BsaW51dHJvbml4LmRlPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
