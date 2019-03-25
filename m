Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A40C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 11:58:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32C2420850
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 11:58:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HbIGPc/l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32C2420850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bWA6D9bsKxmvDZcZSmcwwTOeDXkkFG4Oy0iWwaYYzzc=; b=HbIGPc/l5Td/sP
	xR4hBqEXBR3UhSahEbMDbqy1zNPG0jK4nFE7q7GvYJXBWDK3LgGAmvsCib7P2+FkIsgQLndx7rkVm
	2hqNute1mmHUEv+NmcYXrJx2gCUSe3mPe4bbeuLgVXPIwK0O66b1kFmzoeM1OtBkkuUzXJxjtzMba
	8yYffMhrxcgdTB30ble8y4xwLj/cfIgFESGE3jC1n0mUilbaAivkk8apmwkYAcEYXTuxo0QFuE6nn
	8lycUmHBqUIpCfM+bH07wcNu/VuX0/VnZGBbQ3ct46C5BIZwN/T9v8FwKektqhmEAibHRgap+ClgM
	nuBXU3SxTHeRfqZ+j7/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8OFQ-0007zy-9Y; Mon, 25 Mar 2019 11:58:36 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8OFM-0007yp-4w
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 11:58:34 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DB030AC61;
 Mon, 25 Mar 2019 11:58:26 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v9 0/2] PWM support for HiFive Unleashed
References: <1552378289-27245-1-git-send-email-yash.shah@sifive.com>
 <mvmimwotn60.fsf@suse.de>
 <CAJ2_jOE3RH9FyFg_NATcLEpHv5y89zdh06Ji2x8n3C_gp-wn6A@mail.gmail.com>
 <mvm5zsgp00d.fsf@suse.de>
 <CAJ2_jOHoNnBF2UwU6G1vdvNrJAUJdGL_RncRAOaXMWoS03cagA@mail.gmail.com>
 <CAJ2_jOFrXcxRS1oYOuYhtuRReTocmPKnoe5GO_3r_B1uAZb+xA@mail.gmail.com>
X-Yow: I was in a HOT TUB!  I was NORMAL!  I was ITALIAN!!  I enjoyed th'
 EARTHQUAKE!
Date: Mon, 25 Mar 2019 12:58:26 +0100
In-Reply-To: <CAJ2_jOFrXcxRS1oYOuYhtuRReTocmPKnoe5GO_3r_B1uAZb+xA@mail.gmail.com>
 (Yash Shah's message of "Mon, 25 Mar 2019 17:13:29 +0530")
Message-ID: <mvmmuljupwd.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_045832_341067_7C1FC302 
X-CRM114-Status: UNSURE (   8.28  )
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

T24gTcOkciAyNSAyMDE5LCBZYXNoIFNoYWggPHlhc2guc2hhaEBzaWZpdmUuY29tPiB3cm90ZToK
Cj4gSSBoYXZlIHNlbnQgb3V0IHRoZSB2MTEgcGF0Y2hzZXQsIHlvdSBjYW4gdGVzdCB0aGUgaGVh
cnRiZWF0Cj4gYXBwbGljYXRpb24gd2l0aCB0aGF0IHBhdGNoc2V0Lgo+IFlvdSBzdGlsbCBuZWVk
IHRvIG1ha2UgdGhhdCBEVCBmaWxlIG1vZGlmaWNhdGlvbiB3aGljaCB5b3UgcHJldmlvdXNseQo+
IGRpZCwgdXNpbmcgZnNibC5iaW4KCldoeSBjYW4ndCB0aGUgZHJpdmVyIG1ha2UgdXNlIG9mIHNp
Zml2ZSxhcHByb3gtcGVyaW9kPwoKQW5kcmVhcy4KCi0tIApBbmRyZWFzIFNjaHdhYiwgU1VTRSBM
YWJzLCBzY2h3YWJAc3VzZS5kZQpHUEcgS2V5IGZpbmdlcnByaW50ID0gMDE5NiBCQUQ4IDFDRTkg
MTk3MCBGNEJFICAxNzQ4IEU0RDQgODhFMyAwRUVBIEI5RDcKIkFuZCBub3cgZm9yIHNvbWV0aGlu
ZyBjb21wbGV0ZWx5IGRpZmZlcmVudC4iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
