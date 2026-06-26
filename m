Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10AECDE017
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1nIDW9DAsXG+3h36tMIGDvSuL6HRlg1QylW6oe9U8qE=; b=pBhPJUFv7SWzYB
	KLO0v7fVU3YjJKG8INVPGuh6/xz84es5BvxBKZFTa0uKyzdlo4w0Uwe+UOlUB9Xls8/zyY/vO5fVz
	EbLMGoFLhN+IbfTpQFLYNASayubPgOH0HLicBblxRlQTII/sh6y1zBNFHfC+4kEmAKZkLG+y1eLrH
	R9JuwDqPgpk1lflU/QTtcjEswV3aIvpiuylyM96fd2rDw1edIyLTbSwhVigKuudRYsTK02dA8nZ+9
	+J3l6gTwyrTSxgfzP7fkpAgjoRSqoZIsA8abch7k77M2T928ZLE9t+c0j6H5OA95ZSux+vXL8Dw5V
	iuygVkPmyEeQMngEXNwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oE-0000000Amz5-0DoV;
	Fri, 26 Jun 2026 08:21:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oC-0000000AmyC-4BZ6
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 08:21:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B05134430E;
	Fri, 26 Jun 2026 08:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9248D1F00A3A;
	Fri, 26 Jun 2026 08:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462068;
	bh=9yhOZy5GJQAalKGlzlvL465nKcnZT4DpOJCZVNWObBo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=BkkwnSbVZIOGwdRlHQR/f1QeQjTqEJaQo9coWUy9UuFQRz9cRwupu06CuJ0VGMNq2
	 SK5isISj6BK9Ivwd51tlghRPoYphX3Hx79RhhdwQ8MZL34PjciRejwpv/TnENIdV6B
	 nMKr3ZKXVuqtbOshnOOxU16TFeWS6KOWuCvyyecpRdIgwnP+IMst48t1MF+J1NCn4r
	 f6uP5tcQpJlH+QHTcqYAfc4QsjictlwRxuGyUmWHY95lXCkUXdoWSY5u8hilxJAf99
	 MEfkykbMHA4r2ruEPKIFgQBaKZ3uFkNFOW/QUJuNUmf+ybIv7s59fvzFJEFC0Tb5lq
	 O7u7VriUHWElg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A2639389E8;
	Fri, 26 Jun 2026 08:20:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] vdso: Drop GENERIC_TIME_VSYSCALL
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178246205554.3816447.6510487256526598897.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:20:55 +0000
References: <20260519-vdso-generic_time_vsyscal-v1-0-5c2a5905d5f5@linutronix.de>
In-Reply-To: <20260519-vdso-generic_time_vsyscal-v1-0-5c2a5905d5f5@linutronix.de>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=3Cthomas=2Eweissschuh=40linutronix=2Ede=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org,
 linux-kernel@vger.kernel.org, luto@kernel.org, vincenzo.frascino@arm.com
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

SGVsbG86CgpUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byByaXNjdi9saW51eC5naXQgKGZpeGVz
KQpieSBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAa2VybmVsLm9yZz46CgpPbiBUdWUsIDE5IE1heSAy
MDI2IDA4OjI2OjE0ICswMjAwIHlvdSB3cm90ZToKPiBUb2RheSBHRU5FUklDX1RJTUVfVlNZU0NB
TEwgaXMgcmVhbGx5IG9ubHkgYSBwb2ludGxlc3MgZHVwbGljYXRlIG9mCj4gR0VORVJJQ19HRVRU
SU1FT0ZEQVksIHJlbW92ZSBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1
aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KPiAtLS0KPiBUaG9tYXMgV2Vpw59z
Y2h1aCAoMyk6Cj4gICAgICAgcmlzY3Y6IHZkc286IERyb3AgQ09ORklHX0dFTkVSSUNfVElNRV9W
U1lTQ0FMTCBndWFyZCBhcm91bmQgc3lzY2FsbCBmYWxsYmFja3MKPiAgICAgICB2ZHNvL3ZzeXNj
YWxsOiBHYXRlIHVwZGF0ZV92c3lzY2FsbCgpIGJlaGluZCBDT05GSUdfR0VORVJJQ19HRVRUSU1F
T0ZEQVkKPiAgICAgICB2ZHNvL3RyZWV3aWRlOiBEcm9wIEdFTkVSSUNfVElNRV9WU1lTQ0FMTAo+
IAo+IFsuLi5dCgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6CiAgLSBbMS8zXSByaXNj
djogdmRzbzogRHJvcCBDT05GSUdfR0VORVJJQ19USU1FX1ZTWVNDQUxMIGd1YXJkIGFyb3VuZCBz
eXNjYWxsIGZhbGxiYWNrcwogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jLzkxZDJh
MWE5MTZhOQogIC0gWzIvM10gdmRzby92c3lzY2FsbDogR2F0ZSB1cGRhdGVfdnN5c2NhbGwoKSBi
ZWhpbmQgQ09ORklHX0dFTkVSSUNfR0VUVElNRU9GREFZCiAgICBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3Jpc2N2L2MvYmY4Zjk2OGE2MzE1CiAgLSBbMy8zXSB2ZHNvL3RyZWV3aWRlOiBEcm9wIEdF
TkVSSUNfVElNRV9WU1lTQ0FMTAogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jLzk2
OTQyMDkyZDVlNgoKWW91IGFyZSBhd2Vzb21lLCB0aGFuayB5b3UhCi0tIApEZWV0LWRvb3QtZG90
LCBJIGFtIGEgYm90LgpodHRwczovL2tvcmcuZG9jcy5rZXJuZWwub3JnL3BhdGNod29yay9wd2Jv
dC5odG1sCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
