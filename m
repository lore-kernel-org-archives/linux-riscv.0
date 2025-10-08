Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD1BCAC5BB
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Oct 2025 08:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kIp8WaCz/rKoA6n48cK8Mv/gcsrprZO1afoQ4wAZQlo=; b=fDCXrHlpqMJSG8
	KzfzRQFREw4/Zov2oTYx7FnFYkkU4dyQI92SK/zy36kFIL67nHJ7OqYZ/oWeg2PtomiOqQnFzSche
	U8EJm8B4gbHOztjsGwzfM7H3z1C2rzFeEc3m+MQG+fOpJ9yUqnFyw+M3vGBH1bE7qGW27IR33avZ8
	0ID95SRTfprSxBQ3iBkZSTYEY6IrWDK4C2bw0XrPV9pZEZFOaCqAoahOFTPpNRi2JaTCpu9zIOEWf
	3ssbzadPo6MMKwEUm9B1qYUiHCcLciTgupAcrPu8XYpZEIf3YVQr7z/Ai7jKNvMtZsM8roOeUx/dU
	p9xccScZQWyJfiVzVetw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PJH-00000003QCx-20nB;
	Wed, 08 Oct 2025 08:14:07 +0000
Received: from mail.scalenook.pl ([51.91.253.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PJF-00000003QC0-0k9S
	for linux-riscv@lists.infradead.org;
	Wed, 08 Oct 2025 08:14:06 +0000
Received: by mail.scalenook.pl (Postfix, from userid 1002)
	id 605FA26851; Wed,  8 Oct 2025 08:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=scalenook.pl; s=mail;
	t=1759911088; bh=qsFkU/uX4KHJ4f1uzm2iz39kAHCe9u2uFgt0PtntkBE=;
	h=Date:From:To:Subject:From;
	b=UlBSUxELyHwufp8HVx//MxKQQp5TRzWngIB1Um6jU5P9/kvgXgBpfD+1tMcCzJ3kp
	 2U2+bpUlAQS0aBVu0JbfuF7NS3+Ibygem6MdF8hUaILs7dqN2w0vAIk2M6sdqDi7VP
	 D1cPcBTS58cfZ8uj1fJl1NL8ZbsxM5R3rkDV0MWe0j9ppHf32vpta6LphWKjoDvM7y
	 B1JZQhFziVapw9qi4Dh+m6+7yVAVC4vh98sf1dKwmUQu+O1uZGdQc31fyyGrZCnO0m
	 oS7m4ii3qxM12zhZOugRa08gD+KVWQce1RInTHFvhRn7sKzwJoq7LeV3tpR+6CyXsY
	 rDe5NqVRKTF+g==
Received: by mail.scalenook.pl for <linux-riscv@lists.infradead.org>; Wed,  8 Oct 2025 08:10:54 GMT
Message-ID: <20251008064500-0.1.k.8wid.0.lw9ck67b2f@scalenook.pl>
Date: Wed,  8 Oct 2025 08:10:54 GMT
From: "Ewelina Koprowska" <ewelina.koprowska@scalenook.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Karta lunchowa
X-Mailer: mail.scalenook.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_011405_362994_CA80E5CD 
X-CRM114-Status: UNSURE (   0.51  )
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

U3phbm93bmkgUGHFhHN0d28sCgpjenkgemFzdGFuYXdpYWxpIHNpxJkgUGHFhHN0d28sIGphayB6
d2nEmWtzennEhyB6YWRvd29sZW5pZSBwcmFjb3duaWvDs3cgaSBqZWRub2N6ZcWbbmllIHphb3N6
Y3rEmWR6acSHIG5hIGtvc3p0YWNoIHphdHJ1ZG5pZW5pYT8gCgpPYmVjbmllIGplc3QgbW/FvGxp
d2/Fm8SHIHp3b2xuaWVuaWEgeiBvcMWCYXQgWlVTIGHFvCBkbyA0NTAgesWCIG1pZXNpxJljem5p
ZSBuYSBrYcW8ZGVnbyBwcmFjb3duaWthIHBvcHJ6ZXogZG9maW5hbnNvd2FuaWUgcG9zacWCa8Oz
dy4gCgpaYSBwb21vY8SFIGthcnR5IGx1bmNoIHByYWNvd25pY3kgbW9nxIUgcMWCYWNpxIcgdyBy
ZXN0YXVyYWNqYWNoLCB6YW1hd2lhxIcgamVkemVuaWUgb25saW5lLCBrb3J6eXN0YcSHIHogY2F0
ZXJpbmd1IGN6eSByb2JpxIcgemFrdXB5IHNwb8W8eXdjemUuIFRvIGRvc2tvbmHFgmUgbmFyesSZ
ZHppZSBtb3R5d2FjeWpuZSwga3TDs3JlIHRha8W8ZSB3eXLDs8W8bmlhIGZpcm3EmSBuYSByeW5r
dSBwcmFjeS4KCkNoxJl0bmllIG9wb3dpZW0gd2nEmWNlaiBuYSB0ZW4gdGVtYXQsIGN6eSBtb2ds
aWJ5xZtteSBwb3Jvem1hd2lhxIcgdyBuYWpibGnFvHN6eW0gY3phc2llPwoKClBvemRyYXdpYW0K
RXdlbGluYSBLb3Byb3dza2EKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
