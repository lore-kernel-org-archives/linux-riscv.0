Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97453D10DCF
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2024 09:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ru4nhTDFNwycfOcRHhFhFUdAa7/k4P9wo2RAN7hrUbc=; b=3wQwihfrgzFiUl
	UCDNtv/2/rtMyExeNnRrwDzp47eYWlas3I3xyd2+y9Rvq32BZpPEUQ5jvHi0D00uO+5JozQPvqn2o
	0zRNOWuh+hdHFEBBqEKjw+KaJxH6mItdAgZm24AdmXfjZFbsbHfVQWqyrmYO7nKNzFxp+xgWR1y6S
	UUcz4MNlWOOPUFNF0X532+0rKVECzULE464SGa1rINOeAM1qjthTNJfuu7FDlpZvIGZoLf4aoKuLB
	GtqWaxpA/muPwbbqXUdJn9K3ysIBEYsuYzb9DfrfR6q+qr6GgMxOD73oEVW+bGafR3D9afJoTv9oH
	MJqeaGv8FS2IMCHXb+SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2WZ-00000005Wko-2xQN;
	Mon, 02 Dec 2024 09:15:23 +0000
Received: from mail.finteras.pl ([5.249.155.118])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2WX-00000005Wk2-1ndB
	for linux-riscv@lists.infradead.org;
	Mon, 02 Dec 2024 09:15:22 +0000
Received: by mail.finteras.pl (Postfix, from userid 1002)
	id DEE7483318; Mon,  2 Dec 2024 10:15:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=finteras.pl; s=mail;
	t=1733130919; bh=4SsVKfavNtEL8KiAyuhM0WdCxWV7dwsn0eOpgkwr5fY=;
	h=Date:From:To:Subject:From;
	b=J3evfdzfYlNcVsJnl09sPim2OI8R0pDcHZCQpemzmuY/nPb9xJQmyROqWdawiqQ2B
	 U+gi3ncMwVFZVVgYvHL70HIlp1BI7r1PCZY2W5s3/fs8z3qExiwQElXbhH4MYHgbFE
	 HgV+jxZftFJ2GpHtWzR8vgqOh/x1CMKKaabo4v56PtyNdMEOiyzMg40y/IJivhKkTB
	 dng43a68BPBjC38LCSAokqX2X+BHWl/SxeujGuO8DEhtENPjg+X5GjeuM3vXTBfyaC
	 IXRFvR2gaBtXw9I74o9PAAVqxASxIcoRohT4IAnzoDqeWFYjiktpuoY7IXTlhMcs9z
	 z2qn0TvM7aLbw==
Received: by mail.finteras.pl for <linux-riscv@lists.infradead.org>; Mon,  2 Dec 2024 09:15:10 GMT
Message-ID: <20241202084500-0.1.57.6s0h.0.kc819008vx@finteras.pl>
Date: Mon,  2 Dec 2024 09:15:10 GMT
From: "Urszula Kurach" <urszula.kurach@finteras.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Pakiety_telemedyczne_dla_pracownik=C3=B3w?=
X-Mailer: mail.finteras.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_011521_614309_D7A1F82C 
X-CRM114-Status: UNSURE (   1.26  )
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

U3phbm93bmkgUGHFhHN0d28sCgpjaGNpYcWCYWJ5bSB6YXB5dGHEhywgY3p5IGJ5bGlieSBQYcWE
c3R3byB6YWludGVyZXNvd2FuaSBkb3N0xJlwZW0gZG8gbmllbGltaXRvd2FuZWogb3BpZWtpIHRl
bGVtZWR5Y3puZWogcGVkaWF0cnksIG9ydG9wZWR5LCBuZXVyb2xvZ2Egb3JheiBsZWthcnp5IHdp
ZWx1IGlubnljaCBzcGVjamFsaXphY2ppPwoKT2ZlcnVqZW15IDMgcsOzxbxuZSBwYWtpZXR5LCBr
dMOzcmUgemFwZXduaWFqxIUgZG9zdMSZcCBkbyB1c8WCdWcgZG9wYXNvd2FueWNoIGRvIHBvdHJ6
ZWIgUGHFhHN0d2EgZmlybXkuIFBha2lldCBwb2RzdGF3b3d5IGRhamUgbW/FvGxpd2/Fm8SHIGtv
cnp5c3RhbmlhIHoga29uc3VsdGFjamkgaW50ZXJuaXN0eSBuYXdldCB3IHdlZWtlbmR5IGkgxZt3
acSZdGEsIG5hdG9taWFzdCBwYWtpZXQgcGXFgm55IG9iZWptdWplIGRvc3TEmXAgZG8gbGVrYXJ6
eSA0MiBzcGVjamFsaXphY2ppLCBhIHRha8W8ZSBhdHJha2N5am5lIHJhYmF0eSBuYSBiYWRhbmlh
IGxhYm9yYXRvcnlqbmUgaSBkaWFnbm9zdHlrxJkgb2JyYXpvd8SFLgoKRHppxJlraSB0YWtpbSBy
b3p3acSFemFuaW9tLCBQYcWEc3R3YSBwcmFjb3duaWN5IHp5c2thasSFIHdhcnRvxZtjaW93eSBi
ZW5lZml0IHBvemFwxYJhY293eSwgYSBmaXJtYSB6eXNrYSB6bW90eXdvd2FueSB6ZXNww7PFgiwg
bW5pZWogYWJzZW5jamkgY2hvcm9ib3d5Y2ggaSBkb2RhdGtvd2Ugb3N6Y3rEmWRub8WbY2kuCgpD
enkgbW9nxJkgcHJ6ZWRzdGF3acSHIHdpxJljZWogc3pjemVnw7PFgsOzdyBuYSB0ZW1hdCBkb3N0
xJlwbnljaCBwYWtpZXTDs3c/CgoKUG96ZHJhd2lhbQpVcnN6dWxhIEt1cmFjaAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
