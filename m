Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A71C64EC7
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 15:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=716H1RHGFuwj6aEWo9iUmzmXIKBVkqCsAZY5GYK4pF8=; b=yzhzQQbEVMPGpy
	VmCbu20a2WtZRT+YFz0Sq4a7gcXulvFLw5mux+3FTN1ru8ugHW8CMLBipRDMK9P0f1VYBhQ/hsEJM
	Pf78YD0C4UUIg/l3cy7cb4feylG7Xsflf+n/lh7N6JRxGfFSgdaDsS/cUs9LTM+xeNFuy8nzrQ8Qq
	Oj5bGYAl1rjeK74wLOMXVgFhkLeC2JjP7GpGoEh3Y63xGxvQq4QLrcuIXCFV5ssRmzdUdrhCWUjoM
	x0FeaAhTMO0wXkEHFbK5Yi4K+GAHwzB5+1D7+xlypWAyy3AlbaMoWhDIojWsZF80sDmgqteyNGLUd
	g5yqIrqkCXSGkr4fmB9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqbi-00CmA1-Ho; Wed, 22 Feb 2023 15:00:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqbZ-00Cm56-3f
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 15:00:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DE70C614B4;
	Wed, 22 Feb 2023 15:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7649AC43326;
	Wed, 22 Feb 2023 15:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677078022;
	bh=gFfjgz0Q8tMCqC/g+ibd4XRnh3poCdRXJ7SYTaiiMGk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iUc07ou9jr7xs7FuduwDLvvw0KikIv8SlZP1q1piXXUzcMoPtu3WuD3PH48O5QbYm
	 L0as6vtkohdapB/UNVtj0ISsMuXtiXh1COxdB8Gu+LtEzGtPvTzQw5nouXApk1k8jA
	 HoOMjuPQTtVlNFKNMyQmnc97UntHwZ/8foqGvWikA0hIiLNMv3c+dt7uUToS8WwtAu
	 8/ZfdprXYt/wKJ7J0Mv//j2S3YBZ7uVfQ2ytGs0869oCXLNEeX5N1IHpSAHaDaH2Vg
	 gUqkuu4urOWFr2Ay0iQLMCo6NZaQQDaz9zx6gMQgNqD+ZmmChUeZh2Lh1TyN12bS3+
	 1l6WXTUhCXroQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5DE11C395DF;
	Wed, 22 Feb 2023 15:00:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/2] riscv: Dump faulting instructions in oops handler
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167707802237.24438.17153104207129769364.git-patchwork-notify@kernel.org>
Date: Wed, 22 Feb 2023 15:00:22 +0000
References: <20230119074738.708301-1-bjorn@kernel.org>
In-Reply-To: <20230119074738.708301-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, bjorn@rivosinc.com,
 schwab@linux-m68k.org, geert@linux-m68k.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_070025_243621_DEC0F3DC 
X-CRM114-Status: GOOD (  10.35  )
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

SGVsbG86CgpUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byByaXNjdi9saW51eC5naXQgKGZvci1u
ZXh0KQpieSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT46CgpPbiBUaHUsIDE5
IEphbiAyMDIzIDA4OjQ3OjM2ICswMTAwIHlvdSB3cm90ZToKPiBGcm9tOiBCasO2cm4gVMO2cGVs
IDxiam9ybkByaXZvc2luYy5jb20+Cj4gCj4gUklTQy1WIGRvZXMgbm90IGR1bXAgZmF1bHRpbmcg
aW5zdHJ1Y3Rpb25zIGluIHRoZSBvb3BzIGhhbmRsZXIuIFRoaXMKPiBzZXJpZXMgYWRkcyAiQ29k
ZToiIGR1bXBzIHRvIHRoZSBvb3BzIG91dHB1dCB0b2dldGhlciB3aXRoCj4gc2NyaXB0cy9kZWNv
ZGVjb2RlIHN1cHBvcnQuCj4gCj4gVGhhbmtzLAo+IEJqw7Zybgo+IAo+IFsuLi5dCgpIZXJlIGlz
IHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6CiAgLSBbdjMsMS8yXSByaXNjdjogQWRkIGluc3RydWN0
aW9uIGR1bXAgdG8gUklTQy1WIHNwbGF0cwogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNj
di9jL2ViMTY1YmZhOGVhZgogIC0gW3YzLDIvMl0gc2NyaXB0cy9kZWNvZGVjb2RlOiBBZGQgc3Vw
cG9ydCBmb3IgUklTQy1WCiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2MvMDBiMjQy
NTA5YzhmCgpZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlvdSEKLS0gCkRlZXQtZG9vdC1kb3QsIEkg
YW0gYSBib3QuCmh0dHBzOi8va29yZy5kb2NzLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3B3Ym90Lmh0
bWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
