Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5EAF483E9
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 19:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gimudw3Hr6e9rx/fg7ZSXZUH5XKe2d8sD56vkgGCEsA=; b=4v7lrdYLBtLIsQ
	IdgIc04aR5wg8q4uK1JO4oH6hwZWtzFrF7mbjsTNFtE0oIDZN6TiMMjEFVrxru8oJQIxUCME2lEXZ
	p0FdfI3qfAcOM/1gORShAXDOehinZROVQ1xS1RYbhdQfycHhdj2L0jceKMnbDYlDNppkSn8vCyM9a
	x5rF5ZUDFDY+xZZHP3bC3fH1AtYlGveQBzhatuUYlq1RwUGz4WbQgU4Ie3xRidFgnp+miDKdZvKId
	7OOXoF9lP0sNXNTp/AdHiAugrQqVTCINzDEb4Dtyv7i2cdlPRsTKsfX5LvCtHTKppI4fpEPGeYL3H
	HaAdUqbutsI2eIy72e+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4l5R-0000000HSVm-0E8e;
	Mon, 23 Mar 2026 19:37:17 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4l5O-0000000HSVS-1RwV
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 19:37:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1774294617; x=1774899417; i=markus.elfring@web.de;
	bh=5BGRcdA36LVVKtAvAJ9aNHJv8AVUrsJIiR0mMu+qOvE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pNr69tbB3/OOivG7FZ33Rh3Tj9AFoHUqUC7S4VVyZ1ufpqhbAlIwaNr2aviUSrJP
	 oIUNjY3zFqCaCo4lTTkawY4ZTjrB+Cyc6d/Uk+Zekja8kvm7/O7ILJqWeghS7X6b7
	 DFuVCggolcigx08qyzTL5+yFz8b1Eci66rIxyby6y29ddOO6arWXgldBzJQrdQMxq
	 eLejpHNb3+0vURdnjmXITrBigBEJ6foVPbuE7Nsbu5PNUwoAfDVAL6GjlwmIdQ3eO
	 IroBYuTZyFiLkZpj3NnR1FORqBcc2M5shgxb9oj4iUWx85nVgwRVSyRKHjJgBX7aH
	 xBFHdjIhALwhP/StJA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MUCz3-1vwKss1YOJ-00Uy3r; Mon, 23
 Mar 2026 20:36:57 +0100
Message-ID: <f4fba38e-c2b8-4e08-a958-ea433a7cbe05@web.de>
Date: Mon, 23 Mar 2026 20:36:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vulab@iscas.ac.cn, linux-riscv@lists.infradead.org,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>,
 Atish Patra <atish.patra@linux.dev>
References: <20260323115957.38348-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] riscv: cacheinfo: Fix node reference leak in
 populate_cache_leaves
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260323115957.38348-1-vulab@iscas.ac.cn>
X-Provags-ID: V03:K1:CQVB+hFlhabYUDW5vlLRbBoHdaQuObik5nMXbbjjSFzLGBUjRSd
 nol6OqL+8vKR4Cio7t23jxicfcdwwbJIIZj/MbtIWyqL6Ca7qoY+ayZ80HClgc6vTWna9tk
 +Mqi8I9TvmGZjdLeb8y/CaUX387EDGGCtyELf1OoAMAWVEzxvHNWklJeC+Cruo9FPp29Ja9
 shLtMHSGIFaxBemaIs9HA==
UI-OutboundReport: notjunk:1;M01:P0:6Tkw9uzrKYE=;Cw8vSLP8bjcw3BmegK/oimulbj5 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 DH1HvRfttQsPYi3WQMlb7jzcxWLj6t7Cw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_123714_686887_64926D93 
X-CRM114-Status: UNSURE (   5.03  )
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

4oCmCj4gRml4IHRoaXMgYnkgY2hhbmdpbmcgdGhlIGZpbmFsIGBvZl9ub2RlX3B1dChucClgIHRv
IGBvZl9ub2RlX3B1dChwcmV2KWAuCgpIb3cgZG8geW91IHRoaW5rIGFib3V0IHRvIHVzZSBhIHdv
cmRpbmcgYXBwcm9hY2ggbGlrZSDigJxUaHVzIHJlcGxhY2UKdGhlIHBhc3NlZCB2YXJpYWJsZSBu
cCBieSBwcmV2IGluIGFuIG9mX25vZGVfcHV0KCkgY2FsbCBhdCB0aGUgZW5kIG9mCnRoaXMgZnVu
Y3Rpb24gaW1wbGVtZW50YXRpb27igJ0/CgoK4oCmCj4gU2lnbmVkLW9mZi1ieTogWmlzaHVuIFlp
IDx2dWxhYkBpc2Nhcy5hYy5jbj4KCkNhbiBmdXJ0aGVyIGNsYXJpZmljYXRpb25zIGJlY29tZSBo
ZWxwZnVsIGFsc28gZm9yIHRoZSBzYWZlIHVzYWdlIG9mCnRoZSBEZXZlbG9wZXIncyBDZXJ0aWZp
Y2F0ZSBvZiBPcmlnaW4/CgpSZWdhcmRzLApNYXJrdXMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
