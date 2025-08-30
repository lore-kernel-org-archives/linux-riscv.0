Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DAACA0EFF
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Aug 2025 18:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+3l9sJlzRFsMi3ng+JdJJhB2xcHZ1r9tCRoNHPydGbY=; b=z9NozlhwvJDy45
	poPQaJXhU9q/o9uA+jZKJUl6GlfcHrD5+g8sc+Q2QIWsDdjK4A9F34tdZIzS0kn6FwjK6HPtDsSS/
	ytzQnga/ai7dJIs76aPyUnsLgElp7TqwHxtsgkf3lHSd/AaJ5vDI9l46afGh/U3giiv42CSkdVcZP
	PJMTa32pSgP6+OmegpbOhou9EyoECneV7a+WMLu3HuXakYvqVvXDYSXKsqd8tmoFlrrVBl8bklzIN
	ZULAz13hdBHp4wnWj14JoMsNdzj9gGm/aNODg2RynUj8fgWVro9vh5r6q9uPHJlpXGmJIFsjhPIGd
	W8i01Jmw7jr5ZCS2mRsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usQX2-00000008JJd-0jw5;
	Sat, 30 Aug 2025 18:42:32 +0000
Received: from mail.saluslaboris.com ([170.231.171.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usQWz-00000008JJ1-0Gjs
	for linux-riscv@lists.infradead.org;
	Sat, 30 Aug 2025 18:42:30 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.saluslaboris.com (Postfix) with ESMTP id E5608DD11B3B
	for <linux-riscv@lists.infradead.org>; Sat, 30 Aug 2025 13:32:57 -0500 (-05)
Received: from mail.saluslaboris.com ([127.0.0.1])
 by localhost (mail.saluslaboris.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id TGrgT6oghzvw for <linux-riscv@lists.infradead.org>;
 Sat, 30 Aug 2025 13:32:57 -0500 (-05)
Received: from localhost (localhost [127.0.0.1])
	by mail.saluslaboris.com (Postfix) with ESMTP id 7940EDD14220
	for <linux-riscv@lists.infradead.org>; Sat, 30 Aug 2025 13:28:52 -0500 (-05)
X-Virus-Scanned: amavis at saluslaboris.com
Received: from mail.saluslaboris.com ([127.0.0.1])
 by localhost (mail.saluslaboris.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id CD5OMfnYj7VE for <linux-riscv@lists.infradead.org>;
 Sat, 30 Aug 2025 13:28:52 -0500 (-05)
Received: from [45.138.16.152] (unknown [45.138.16.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.saluslaboris.com (Postfix) with ESMTPSA id 2B7DBDD15944
	for <linux-riscv@lists.infradead.org>; Sat, 30 Aug 2025 13:21:16 -0500 (-05)
From: edwin.herrera@saluslaboris.com
To: linux-riscv@lists.infradead.org
Subject: xls
Date: 30 Aug 2025 11:21:16 -0700
Message-ID: <20250830112116.3F920BFD4ECB5933@saluslaboris.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_114229_232931_E6DE8AFC 
X-CRM114-Status: UNSURE (  -0.49  )
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
Reply-To: info.superenalotto@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

V2lyIGZyZXVlbiB1bnMsIElobmVuIG1pdHRlaWxlbiB6dSBrw7ZubmVuLCBkYXNzIFNpZSB6dSBk
ZW4gCkdld2lubmVybiBkZXIgasO8bmdzdGVuIFN1cGVyRW5hbG90dG8tWmllaHVuZyBpbiBadXNh
bW1lbmFyYmVpdCAKbWl0IExvdHRvMjQsIEV1cm9NaWxsaW9ucyB1bmQgUG93ZXJiYWxsIGdlaMO2
cmVuLiBTaWUgaGFiZW4gZWluZW4gCmVpbm1hbGlnZW4gR2V3aW5uIHZvbiDigqwzLjg1MC4wMDAg
IGluIGRlciB6d2VpdGVuIEdld2lubmtsYXNzZSAKZ2V3b25uZW4uIFVtIElocmVuIEdld2lubiBh
Ynp1d2lja2Vsbiwgc2VuZGVuIFNpZSB1bnMgYml0dGUgCmZvbGdlbmRlIEluZm9ybWF0aW9uZW4g
cGVyIEUtTWFpbDoKClZvbGxzdMOkbmRpZ2VyIE5hbWU6IExhbmQ6IFdvaG5hZHJlc3NlOiBBbHRl
cjogR2VzY2hsZWNodDogQmVydWY6IApIYW5keW51bW1lcjogV2hhdHNBcHAtTnVtbWVyLgoKSW0g
TmFtZW4gZGVyIE9ubGluZS1Mb3R0ZXJpZWFidGVpbHVuZ2VuIFN1cGVyRW5hbG90dG8sIApFdXJv
TWlsbGlvbnMgdW5kIFBvd2VyYmFsbCBncmF0dWxpZXJlbiB3aXIgSWhuZW4gaGVyemxpY2ggenUg
CklocmVtIEdld2lubi4KCk1pdCBmcmV1bmRsaWNoZW4gR3LDvMOfZW4KCkZyYXUgS2F0aGVyaW5l
IEZlZGVyaWNvCkxlaXRlcmluIE9ubGluZS1aYWhsdW5nZW4gLyBWYWxpZGllcnVuZ3NtYW5hZ2Vy
aW4KQ29kZS1OYWNocmljaHQ6IDczN0dIUzk4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
