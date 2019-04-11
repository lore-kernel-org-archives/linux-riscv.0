Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A2B3C10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 16:47:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 172CE2173C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 16:47:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bqw6UBLg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 172CE2173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7ibYaFTxVRIHxObImtgQJtiYwSXCx1diL2debl7kIkQ=; b=bqw6UBLgIVIcGe2lvagmwgjUt
	5LnIq1HmvmisyuEUC+44St/Y3Quk4N5x46YzmwTBvAgGYcwHpi2Zk+9thj5/07KykUAt4aSEHV43f
	F+/NNxdfkyPBIsbsxfmS3Ghf0Jiw/JffI0rQSh+ZnxwDyL7yKuKTn0jKILq69/8zOX3URJVay81L9
	aC16xGZxloyuYvW7DKEXdXXBvGa1loHkqMN9FdmWnOmng9iV4DGNLlMC4KVC8It+GOMuP3WnIqZGd
	zeS8B3iK8p9GiwCfOC1XbVe0UoEW+RxrLLcTzcTtA7hOGQ5j6ENI5Ze4nVID2e70e96W2jk3T01B9
	uJkzGKUUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEcrP-0001Uj-33; Thu, 11 Apr 2019 16:47:35 +0000
Received: from mailgate-2.ics.forth.gr ([139.91.1.5])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEcrK-0001TM-6B
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 16:47:32 +0000
Received: from av1.ics.forth.gr (av3in [139.91.1.77])
 by mailgate-2.ics.forth.gr (8.14.4/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 x3BGlKAd014413; Thu, 11 Apr 2019 16:47:22 GMT
X-AuditID: 8b5b9d4d-8f5ff7000000235c-fa-5caf6f9883cb
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 D0.C9.09052.89F6FAC5; Thu, 11 Apr 2019 19:47:20 +0300 (EEST)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id x3BGlKP9016360; Thu, 11 Apr 2019 19:47:20 +0300
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Thu, 11 Apr 2019 19:47:20 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/9] riscv: remove dead big endian code
Organization: FORTH
In-Reply-To: <20190411163109.GA26533@lst.de>
References: <20190411115623.5749-1-hch@lst.de>
 <20190411115623.5749-3-hch@lst.de>
 <3382adaf8be0b44af9ebb8b7528cac41@mailhost.ics.forth.gr>
 <20190411154731.GA23171@lst.de>
 <a5de00d885d5ebf5db35fa2c78738963@mailhost.ics.forth.gr>
 <20190411163109.GA26533@lst.de>
Message-ID: <a4c98bb5f5d4823d68c84f8133320eb0@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-2.ics.forth.gr
 [139.91.1.5]);
 Thu, 11 Apr 2019 16:47:22 +0000 (GMT) for IP:'139.91.1.77' DOMAIN:'av3in'
 HELO:'av1.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mailgate-2.ics.forth.gr [139.91.1.5]); Thu, 11 Apr 2019 16:47:22 +0000 (GMT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_094730_591498_8338689D 
X-CRM114-Status: UNSURE (   5.67  )
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
Cc: Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

zqPPhM65z4IgMjAxOS0wNC0xMSAxOTozMSwgQ2hyaXN0b3BoIEhlbGx3aWcgzq3Os8+BzrHPiM61
Ogo+IE9uIFRodSwgQXByIDExLCAyMDE5IGF0IDA3OjA4OjMwUE0gKzAzMDAsIE5pY2sgS29zc2lm
aWRpcyB3cm90ZToKPj4gSSB0aGluayB3ZSBzaG91bGQgYXQgbGVhc3Qgd2FybiB0aGUgdXNlciBh
Ym91dCB1bnN1cHBvcnRlZCBlbmRpYW5lc3MsCj4gCj4gVGhlIGVuZGlhbmVzcyBpcyBzZWxlY3Rl
ZCBieSBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vYnl0ZW9yZGVyLmgKPiBpbmNsdWRpbmcg
aW5jbHVkZS91YXBpL2xpbnV4L2J5dGVvcmRlci9saXR0bGVfZW5kaWFuLmgsIHdoaWNoIHRoZW4K
PiBkZWZpbmVzIF9fTElUVExFX0VORElBTi4gIFNvIHdlJ2QgcmVhbGx5IG5lZWQgdG8gY2hlY2sg
b25lIHBhcnQgb2YKPiB0aGUga2VybmVsIHBvcnQgYWdyZWVzIHdpdGggb3RoZXJzLCB3aGljaCBp
cyBhIGxpdHRsZSBvZGQuICBBbmQgaW4KPiB3aGljaCBwbGFjZSBkbyB3ZSBjaGVjayB0aGF0IGFu
ZCBpbiB3aGljaCBvbmUgbm90PyAgSXQgaXNuJ3QgbGlrZQo+IG90aGVyIHBvcnRzIGxpa2UgeDg2
IGFyZSBmdWxsIG9mIHN1Y2gganVzdCBiZWNhdXNlIGNoZWNrcy4uCj4gCgpZb3UgZ290IGEgcG9p
bnQgdGhlcmUsIGhvdyBhYm91dCBzb21ldGhpbmcgbGlrZToKCiNpZiBfX0JZVEVfT1JERVJfXyAh
PSBfX09SREVSX0xJVFRMRV9FTkRJQU5fXwojZXJyb3IgIlVuc3VwcG9ydGVkIGVuZGlhbmVzcywg
Y2hlY2sgeW91ciB0b29sY2hhaW4iCiNlbmRpZgoKb24gYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2J5dGVvcmRlci5oID8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
