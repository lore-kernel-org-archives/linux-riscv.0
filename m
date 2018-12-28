Return-Path: <SRS0=TJaN=PF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 672CBC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 28 Dec 2018 15:12:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 107C520874
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 28 Dec 2018 15:12:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QufF0jgB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 107C520874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Subject:To:From:Date:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BYhJHl0URrcq7rw+5FhfgweTI87l9UYavN3vCSZQ4e8=; b=QufF0jgBBydidn
	NQuBrcBVXb5ufwJlV4EG+kQ56hIRceq7T9V03HKeyNnQBfunjWaweSN0Zf5K0GqGvvw/GlewBbyku
	G7vuVZFt8VV4EH/0XK58G2d/MrMCQ6QZEIKvjaH3ZIG4vUZoSdKHf+gtHoe+bjwa8pIQasDnsbox5
	TBG/FVwlD2Y5BaRsoNRzfEgjoMp7MdHtYoANSdQzEUeOsJfdzTLw8M0Hc1XdwMcc5Q1VUolpZjv8f
	HQ6DPBW51M6ygOTMylQ4CRkWu5LSHvEKqW98qvVN2BzJRQ9cGzdWQ3lt9Unh3TjL0IueWfg6esxDH
	YYQJycpiOHvf223tZcrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gcto1-0006yT-Kg; Fri, 28 Dec 2018 15:12:09 +0000
Received: from mailgate-2.ics.forth.gr ([139.91.1.5])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gctny-0006xt-4B
 for linux-riscv@lists.infradead.org; Fri, 28 Dec 2018 15:12:08 +0000
Received: from av1.ics.forth.gr (av3in [139.91.1.77])
 by mailgate-2.ics.forth.gr (8.14.4/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 wBSFBXH1010768
 for <linux-riscv@lists.infradead.org>; Fri, 28 Dec 2018 15:11:35 GMT
X-AuditID: 8b5b9d4d-90dff7000000235c-c3-5c263d24c032
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 AF.E3.09052.42D362C5; Fri, 28 Dec 2018 17:11:33 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id wBSFBWim005091
 for <linux-riscv@lists.infradead.org>; Fri, 28 Dec 2018 17:11:32 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Fri, 28 Dec 2018 17:11:32 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: linux-riscv@lists.infradead.org
Subject: Wiki for Linux development
Organization: FORTH
Message-ID: <8033884262d72a7a3edcce50c821f9fa@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGLMWRmVeSWpSXmKPExsXSHc2orKtqqxZjcP80q8W2zy1sDowem5fU
 BzBGcdmkpOZklqUW6dslcGXM376YqWALc8WG83OZGhhvMnUxcnJICJhI3Lp6mLGLkYtDSOAI
 o8TvzftZIZwXjBKLFx5lh6gylZi9t5MRxOYVEJQ4OfMJSxcjBwezgLVE+x4DkDCzgLzE9rdz
 mEFsFgFVicsPutlAbDYBTYn5lw6ClYsIKEvMv+cKEhYGMhc9egJWwi8gLPHp7kVWiOkuEnu3
 foW6TUXiw+8HYBeIAtW/ODGddQIj/ywkR8xCOGIWkiMWMDKvYhRILDPWy0wu1kvLLyrJ0Esv
 2sQIDq25vjsYzy2wP8QowMGoxMMb8EklRog1say4MvcQowQHs5IIrxK/WowQb0piZVVqUX58
 UWlOavEhRmkOFiVx3sMvwoOEBNITS1KzU1MLUotgskwcnFINjN266y2NG996eNu6qUXtDXz9
 2Sf5qTL71ncZB8zl9/hbOmVc0bOLiPLlusK7N//3K1td81RhtcYju9jP/Xt2UPbOjWfqJY0S
 Kwtn/ajoteM41bpcwDhM47Ve7KSlB+/fNfOs0UwwDNhUvlB/g4uk/eyJLxI4A8/ZyYfuWpp1
 0tGZr/J596TtSizFGYmGWsxFxYkASRVhhykCAAA=
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-2.ics.forth.gr
 [139.91.1.5]);
 Fri, 28 Dec 2018 15:11:35 +0000 (GMT) for IP:'139.91.1.77' DOMAIN:'av3in'
 HELO:'av1.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mailgate-2.ics.forth.gr [139.91.1.5]); Fri, 28 Dec 2018 15:11:35 +0000 (GMT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181228_071206_650029_8DDB6D42 
X-CRM114-Status: UNSURE (   2.38  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hello all,

I've set up a wiki to assist in the development process and help new 
users and developers get started.
https://riscv.ics.forth.gr/doku.php/start

It's hosted on a VM of mine and has around 100GBs of storage on a 1Gb 
link, so we can use that VM to host stuff if needed. I've also opened a 
ticket on kernel.org (#62351) to have riscv.wiki.kernel.org point there 
but they haven't come back yet.

Regards,
Nick

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
