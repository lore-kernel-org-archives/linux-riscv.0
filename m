Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CC6C71130
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 19:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mm4+MghOmHrXzrTg2D0kb5pTbUiCKGALR6dgZy5GQ2s=; b=s6rX54DtAWdDyW
	vXS9nsT3GG9ws7wl9M/8HmBJUqTfY/hjbJ1cAltI1GCwMOTN9WJyt1DpANCm2oHlzeGGOdvkyE715
	lb4Zl1UZ5bVDI20e26oalB+YxjpOCUsVR/D8L+TqWbh21MpIK2mHkwYd1oKix7mcStdO/PsPVpxwv
	uX10tLcrWtkEMOiv73BEVDldBgVase/fc8vSvyqrmCuehtnatrulJAnVwFxFyVFZAfNLZW++NcsZM
	g7troUM13An4K5GCQ1lbS/0EMhLlJy0bfd6LQK97lrnUBLVQt4LedZexrOZyHlWLaCDFOEXaD9ahS
	uF+MgG1tcHFm6TFFDq9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP55D-00000007ygi-0014;
	Tue, 10 Jun 2025 19:56:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1pP-00000007T2g-1z72
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 16:28:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A936B5C571B;
	Tue, 10 Jun 2025 16:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F90EC4CEED;
	Tue, 10 Jun 2025 16:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749572878;
	bh=mFxvI/kVZrzum73f4JuAnsQvQ7oMH5qbvvBDTrR8D+M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VQlxGt+FqI3gqtXadAFcUs97IUFFcFFoQNYIS1YMiCOwSw8fB/GQHW3sWVdyKgdtn
	 A9h7kD4lIg/z42ZzV6iLq1g5+hdToOz613HUg0jc9ejXI3gOBwpLF5auyibwmxHj/y
	 6ijU1n8/v5T9xkeScsbxE9VSa7vg7ojvmOmnYKGzWYzRqF3B6N/QWFU7U9ZhZ3P+Ry
	 FugqWsvm1yFMJVeMSIHmPLExxcOeDibIVB25PcgtDmYVrINYjyzrlxleA+92+FKvID
	 lC3xC5Ryva24Rv/ABPfx4G6MBufp3gcpx0OINvtiGz2nS6pyIguwKrl2Ad4IW9v+hO
	 X8ytWgu7gICwg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD1A39D6540;
	Tue, 10 Jun 2025 16:28:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] kunit: qemu_configs: Add riscv32 config
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174957290850.2454024.5667943279293290236.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jun 2025 16:28:28 +0000
References: <20250407-kunit-qemu-riscv32-v1-1-7b9800034a35@linutronix.de>
In-Reply-To: <20250407-kunit-qemu-riscv32-v1-1-7b9800034a35@linutronix.de>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=3Cthomas=2Eweissschuh=40linutronix=2Ede=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, brendan.higgins@linux.dev,
 davidgow@google.com, rmoar@google.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_092759_553645_68A53D34 
X-CRM114-Status: UNSURE (   8.70  )
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZml4ZXMp
CmJ5IFNodWFoIEtoYW4gPHNraGFuQGxpbnV4Zm91bmRhdGlvbi5vcmc+OgoKT24gTW9uLCAwNyBB
cHIgMjAyNSAxMDoxNzoxMiArMDIwMCB5b3Ugd3JvdGU6Cj4gQWRkIGEgYmFzaWMgY29uZmlnIHRv
IHJ1biBrdW5pdCB0ZXN0cyBvbiByaXNjdjMyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBX
ZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgo+IC0tLQo+ICB0b29s
cy90ZXN0aW5nL2t1bml0L3FlbXVfY29uZmlncy9yaXNjdjMyLnB5IHwgMTcgKysrKysrKysrKysr
KysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykKPiAKPiBbLi4uXQoKSGVy
ZSBpcyB0aGUgc3VtbWFyeSB3aXRoIGxpbmtzOgogIC0ga3VuaXQ6IHFlbXVfY29uZmlnczogQWRk
IHJpc2N2MzIgY29uZmlnCiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2MvOWFhMDhl
NzYxYjY3CgpZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlvdSEKLS0gCkRlZXQtZG9vdC1kb3QsIEkg
YW0gYSBib3QuCmh0dHBzOi8va29yZy5kb2NzLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3B3Ym90Lmh0
bWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
