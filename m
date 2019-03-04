Return-Path: <SRS0=iqkr=RH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324AAC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2019 11:10:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00B7320815
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2019 11:10:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nqMD8HNi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00B7320815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=43j/ERH1O4RPlou+yhdSRbFPvtGbl0nLqxeNYhMwHU8=; b=nqMD8HNiNqvtaF
	7oOtfgwdsrIlo9cxtKwETwYO1GJAWUIoPy/sBrT4BMaeccoarBo7VP2hjISfxmFsDl55IxR+N8l8c
	bV35cAh35srggUcZuDgoAN4eV4EMjB2IUBhp6py1pgPpw/7cpVULwhKxHQf8w83yd89e018NZ0ZHB
	YJx8+qq6sR+rFJxD0GEFvuYX8kpSvLwW0hk/qddDH3DHpGNAqGaRm+HIkMdUe8JssVaJWkhi9BlA0
	VrDAwqZiW65uBgww6KxlCelwk1TnRZMpTukcKRr9SepLK6ey8Lmeur2HrDOd52h/2MTPgqGLwn/rV
	JK3WdrrVF1DIRypMTuzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0lTv-0002iS-To; Mon, 04 Mar 2019 11:10:03 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0lTr-0002Rn-Qk
 for linux-riscv@lists.infradead.org; Mon, 04 Mar 2019 11:10:02 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 08906AE0E;
 Mon,  4 Mar 2019 11:09:58 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v8 0/2] PWM support for HiFive Unleashed
References: <1551437599-29509-1-git-send-email-yash.shah@sifive.com>
X-Yow: Do I hear th' SPINNING of various WHIRRING, ROUND, and WARM
 WHIRLOMATICS?!
Date: Mon, 04 Mar 2019 12:09:57 +0100
In-Reply-To: <1551437599-29509-1-git-send-email-yash.shah@sifive.com> (Yash
 Shah's message of "Fri, 1 Mar 2019 16:23:17 +0530")
Message-ID: <mvmfts228vu.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_031000_013630_DFA8FE4E 
X-CRM114-Status: UNSURE (   8.83  )
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

T24gTcOkciAwMSAyMDE5LCBZYXNoIFNoYWggPHlhc2guc2hhaEBzaWZpdmUuY29tPiB3cm90ZToK
Cj4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBhIFBXTSBkcml2ZXIgYW5kIERUIGRvY3VtZW50YXRp
b24KPiBmb3IgSGlGaXZlIFVubGVhc2hlZCBib2FyZC4gVGhlIHBhdGNoZXMgYXJlIG1vc3RseSBi
YXNlZCBvbgo+IFdlc2xleSdzIHBhdGNoLgoKVGhhdCBkb2Vzbid0IGFwcGVhciB0byB3b3JrIHdp
dGggdGhlIGhlYXJ0YmVhdCB0cmlnZ2VyLCB0aGUgbGVkIGRvZXNuJ3QKZmxhc2guCgpBbmRyZWFz
LgoKLS0gCkFuZHJlYXMgU2Nod2FiLCBTVVNFIExhYnMsIHNjaHdhYkBzdXNlLmRlCkdQRyBLZXkg
ZmluZ2VycHJpbnQgPSAwMTk2IEJBRDggMUNFOSAxOTcwIEY0QkUgIDE3NDggRTRENCA4OEUzIDBF
RUEgQjlENwoiQW5kIG5vdyBmb3Igc29tZXRoaW5nIGNvbXBsZXRlbHkgZGlmZmVyZW50LiIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
