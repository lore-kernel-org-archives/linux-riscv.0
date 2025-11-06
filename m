Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8BFCCFA05
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Nov 2025 16:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NFb4ns+vFlQxUcvbNDUPqjjQx/WZkUkBRCQyErCUtNc=; b=Q85Zy+TKt2vgbO
	blR021soh8d0z4ANNP21UWYGV/zXGOJd6RYwAyzIgDZl+BRi2+DIkFBg1S+VXABS1PF+YSVSpySVl
	LB9texA4S+uVi3LaR5Hj/wWGkUBtJIHo9Elc+mp7/XrtEDM2+Tfls73f4MasSkFx0Kd/Q/6UaNMi5
	RNn+8DCtbWnIB77fMehSm2eAm+8kBUvT55vpwQpkVCK4yJmHuncR5VBJT8wZhCKkAp959BGPihCzV
	SbTWpowqlddwl+YJv8cYr4MO+555X6+ROzAHQvHJV7ZpeHoxQNNj6rHwoMYhB+Xu412H6YNJuw6uC
	JmoJ7Hguu9mSyAewvLPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2TL-0000000Frsf-0UoX;
	Thu, 06 Nov 2025 16:04:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2TJ-0000000FrsP-0wra
	for linux-riscv@lists.infradead.org;
	Thu, 06 Nov 2025 16:04:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C89D618FB;
	Thu,  6 Nov 2025 16:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538EAC4CEF7;
	Thu,  6 Nov 2025 16:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762445064;
	bh=tfoWKbGkWGrx1rWAMfcc3SKOmRrWzeEzHpAOZDpTe8I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tl+UsoHL0dLcdRgsZplwHi385klqaW7n7/yYYb6A9H2Muht1ffsVvCbaOgNXTMv0U
	 NOHczlLBQeYAqJS7/t70Hr0hX2LkKZEHRug9Ng+VVofpQP0WyQ+xYN3Jx72XQLAHa7
	 rKnhPl2XeQfpERi18b6pyW7bEUrPdGbW5fC7EH6DNQBfpfepusxggJ13D0ymPcsA0H
	 Y+7TYFfud3Hms/f5suhuzcfqLt0cfYRWddg7kYJo0MZbkyDicnBwnLHg+xcUOHvy5j
	 ZD28MupVCztYJbumhDx/PwfPWRqwH403N4sKrolxico9SCqw+Ms/WHSMC+8gYfSjqB
	 Bv3EmwPNa2ZSw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, kernel test robot <lkp@intel.com>
In-Reply-To: <20251027-p1-kconfig-fix-v2-1-49688f30bae8@linux.spacemit.com>
References: <20251027-p1-kconfig-fix-v2-1-49688f30bae8@linux.spacemit.com>
Subject: Re: (subset) [PATCH v2 1/4] mfd: simple-mfd-i2c: remove select
 I2C_K1
Message-Id: <176244506110.1925720.10807118665958896958.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 16:04:21 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-52d38
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

T24gTW9uLCAyNyBPY3QgMjAyNSAxMzo0ODowNSArMDgwMCwgVHJveSBNaXRjaGVsbCB3cm90ZToK
PiBzZWxlY3Qgd2lsbCBmb3JjZSBhIHN5bWJvbCB0byBhIHNwZWNpZmljIHZhbHVlIHdpdGhvdXQg
Y29uc2lkZXJpbmcKPiBpdHMgZGVwZW5kZW5jaWVzLiBBcyBhIHJlc3VsdCwgdGhlIGkyYy1rMSBk
cml2ZXIgd2lsbCBmYWlsIHRvIGJ1aWxkCj4gd2hlbiBPRiBvciBDT01NT05fQ0xLIGFyZSBkaXNh
YmxlZC4KPiAKPiBUaGUgcmVhc29uIGZvciByZW1vdmluZyBJMkNfSzEgaW5zdGVhZCBvZiBhZGRp
bmcgYSBkZXBlbmRzIG9uIGNvbmRpdGlvbgo+IGlzIHRvIGtlZXAgdGhlIHBvc3NpYmlsaXR5IGZv
ciBvdGhlciBTb0NzIHRvIHVzZSB0aGlzIFBNSUMuCj4gCj4gWy4uLl0KCkFwcGxpZWQsIHRoYW5r
cyEKClsxLzRdIG1mZDogc2ltcGxlLW1mZC1pMmM6IHJlbW92ZSBzZWxlY3QgSTJDX0sxCiAgICAg
IGNvbW1pdDogZWNmNmJjNDc0YWU5N2M0MDRlMjEyNWI0MTNlYjBlZjM2MjdiMDNjNQoKLS0KTGVl
IEpvbmVzIFvmnY7nkLzmlq9dCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
