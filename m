Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1970DC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Nov 2021 17:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L/QStagRjLcDwkFK/lz2ydEua5sz5ZZbp5rZrO/7f9k=; b=p2BSTqptY3JQ97
	y8kCJpx+chVBtXEpBmss3tNNZ/h9uu6tj9H8vlm2+RJFZ9u/35wF/oQ5IAnA6x5Wy9/wyu2AFjGv8
	X4up6sA7EPUuC5zHIH3TtFYN43g8XuSpM2c+TkI7QzjT9X/kc9Z+/TimaXBzLreXKu9NZR7dMppiD
	SPfL6SWh+ApzhvJsLr20JOFNS8Y7F/fE1xfW7uxZjWc7RsOaUXuqMeVnv7dqsdw708WPdMKYqD2Ap
	PoFypZIGvNV82LuMElpBUdENZgO7rgzAAB27X9evrevsCDF7tt6eOKeP0WeZfgdzNak9L9uZKD7jN
	+cnB+FeT0RLPx7RVzeaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpCva-00HEW6-32; Mon, 22 Nov 2021 17:16:26 +0000
Received: from tartarus.angband.pl ([51.83.246.204])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpCvW-00HEVL-Qo; Mon, 22 Nov 2021 17:16:24 +0000
Received: from kilobyte by tartarus.angband.pl with local (Exim 4.94.2)
 (envelope-from <kilobyte@angband.pl>)
 id 1mpCtI-00Ckt5-5h; Mon, 22 Nov 2021 18:14:04 +0100
Date: Mon, 22 Nov 2021 18:14:04 +0100
From: Adam Borowski <kilobyte@angband.pl>
To: Anup Patel <anup.patel@wdc.com>, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org
Subject: ERROR: modpost: "boot_cpu_hartid" [arch/riscv/kvm/kvm.ko] undefined!
Message-ID: <YZvP3AuTdEdje/IY@angband.pl>
MIME-Version: 1.0
Content-Disposition: inline
X-Junkbait: aaron@angband.pl, zzyx@angband.pl
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: kilobyte@angband.pl
X-SA-Exim-Scanned: No (on tartarus.angband.pl); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_091622_892763_552518AF 
X-CRM114-Status: UNSURE (   5.45  )
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

SGkhCldpdGggQ09ORklHX0tWTT1tIGFuZCBDT05GSUdfU01QPW4sIHRoZSBidWlsZCBmYWlscyB3
aXRoOgpFUlJPUjogbW9kcG9zdDogImJvb3RfY3B1X2hhcnRpZCIgW2FyY2gvcmlzY3Yva3ZtL2t2
bS5rb10gdW5kZWZpbmVkIQoKQW4gb2J2aW91cyBmaXggd291bGQgYmUgdG8gY2hhbmdlIHJpc2N2
X2NwdWlkX3RvX2hhcnRpZF9tYXNrKCkgZnJvbSBhCnN0YXRpYyBpbmxpbmUgZnVuY3Rpb24gdG8g
YSByZWFsIGV4cG9ydGVkIHN5bWJvbCwgYnV0IEkgd29uZGVyOiBpcyB0aGVyZQphIHBvaW50IGlu
IGFsbG93aW5nIHN1Y2ggY29tYmluYXRpb25zIHRoYXQgbm8gb25lIHdpbGwgdGVzdD8KCgpNZW93
LgotLSAK4qKA4qO04qC+4qC74qK24qOm4qCAIC4tLVsgTWFrZWZpbGUgXQrio77ioIHioqDioJLi
oIDio7/ioYEgIyBiZXdhcmUgb2YgcmFjZXMK4qK/4qGE4qCY4qC34qCa4qCL4qCAIGFsbDogcGls
bGFnZSBidXJuCuKgiOKgs+KjhOKggOKggOKggOKggCBgLS0tLQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
