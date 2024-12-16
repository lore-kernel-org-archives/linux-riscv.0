Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D30E77183
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 09:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XCC2BbaxC5oQ1en3nhAh5+f7bjKxtKvWUtluIGtu61M=; b=NOZEdXOOGBJ/Af
	dusaN6FX46qUW4c/ez36b7qpxvRoHvREHP5D38tR7Imd5z4zvmRIXI8vNVAtr3jCnhDS21Yq8IoAK
	ZFHWsCXp512kwn0WjYKBkTWQaw0NAFmXv0+D3n5B4MAWa4OYiLtvUQA59xrNEOkcx/wfHYVR9ekII
	ixeuLXXkpDudnr9f0FJJlNh8YmKdhEqY/MZ5MEeK0L1mDfuNcamraasl00Qu32nJwcpebMQhnVPDF
	2JcT+7Kl0ZywmAodhUmZq0QX4svt2IyZluYh+RRWENpEbiDvB7znkWQVFdPAfUEadxk54ZCF4kLHh
	okAQWAiWqfUjGwFYOTNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN70D-00000009U4M-0wdg;
	Mon, 16 Dec 2024 09:02:57 +0000
Received: from mail.analyticsservices.pl ([217.61.0.186])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6xk-00000009TgU-3xbF
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 09:00:26 +0000
Received: by mail.analyticsservices.pl (Postfix, from userid 1002)
	id 614F083D7B; Mon, 16 Dec 2024 09:56:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=analyticsservices.pl;
	s=mail; t=1734339435;
	bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=;
	h=Date:From:To:Subject:From;
	b=LDSSEpFCwLUpvvTNsQTb8uzON2qcc3B36kD+sg98522AAal3ERS6yDHjdyApX3Zjv
	 11UMScm8TavDFbBdKL2TbYllaf7Ru7ID+7fdL7XWWt1iLCM8S/g3g+IM5r3xt3CvHX
	 9nCURD9PhCmd1ASvaLkyuzp1rJcfN6vhVN4WTba4fzcRZ+mRlF3C6Xb0+Bdz62j8bO
	 Fs9mXb5V5RK58AtCkxRRPzrdRTHM+OYP4b3gO3lVeHJ9/pvddjwryvWgTdEeHmMOaB
	 zECoy+Im+hYJz1IpNJWeHF8gl4BBkEaq/V1xrTzoI2tI+A3TfRpymG9kaqc4MbQ1ua
	 5DVASx4MLsNsw==
Received: by mail.analyticsservices.pl for <linux-riscv@lists.infradead.org>; Mon, 16 Dec 2024 08:56:01 GMT
Message-ID: <20241216084501-0.1.i.3mnp.0.ogey2ps3sg@analyticsservices.pl>
Date: Mon, 16 Dec 2024 08:56:01 GMT
From: "Patryk Wysocki" <patryk.wysocki@analyticsservices.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.analyticsservices.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_010025_648541_AC3BE121 
X-CRM114-Status: UNSURE (   1.10  )
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

RHppZcWEIGRvYnJ5LAoKUG96d29sacWCZW0gc29iaWUgbmEga29udGFrdCwgcG9uaWV3YcW8IGpl
c3RlbSB6YWludGVyZXNvd2FueSB3ZXJ5ZmlrYWNqxIUgbW/FvGxpd2/Fm2NpIG5hd2nEhXphbmlh
IHdzcMOzxYJwcmFjeS4KCldzcGllcmFteSBmaXJteSB3IHBvenlza2l3YW5pdSBub3d5Y2gga2xp
ZW50w7N3IGJpem5lc293eWNoLgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHIHcgY2VsdSBwcnpl
ZHN0YXdpZW5pYSBzemN6ZWfDs8WCb3d5Y2ggaW5mb3JtYWNqaT8gCgoKUG96ZHJhd2lhbQpQYXRy
eWsgV3lzb2NraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
