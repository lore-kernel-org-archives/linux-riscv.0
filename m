Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAC6CD4F3C
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 06:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s9MKU9XAfc5OZ8VEg4VCntp/Vyr2QbANegKw5KWEsC0=; b=qVdjsp70E5d/43
	n/PLK09qJBEWEgyUKatrokhZ2Xj/5iNRwNgAp2V8wrZpqMi3qxHZTdONuA1l9hnYPnk8gk5rCU5my
	rcnI+MHZpdgSA8zgnXHnRjJWl/rtsvdttgpoLCUSHCNrYI8NHdsQ7c31ZjQYk0znGfnyynZ3h/mxA
	YNqMogNbn0yH8QFRvisuuHxakDd1BOXPTOtl4dcn+Fs/BmXvYhSQXG8J+XdHcXrox0NzziIIg4VUF
	mf4VuA+BeMOOpF7t7W+J+haOBuWxg+EVeHh26f70OpL+wKWPNFpLrLG3GU7NEYopvAf7tlpCHqy5w
	rjeWej1mxnivyZiSJlUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDuS-00000000KKM-2FHQ;
	Tue, 19 May 2026 06:26:32 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDuN-00000000KGn-0sBp
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 06:26:29 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779171981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EFMoT1nh0350NXXeX7IPiJWaU/gL27UDTHeknFT5B9A=;
	b=yMyvZAQILT31NH0iEBkxgGxuNLVuogVm0ysZcPx+Dr2BRDb48TF2DnNtVr4rHI7TNE9Wi/
	vVWDWHFhbqTEZuNTXraJDJ1b7LNXzmCb/CulgKOBNt8oIRWl5EISDlb0kj7lWdlbDYdd6L
	i8Be1gz+7c9w73vX2IHX7kKKTnrxDcb96n1ONBxgSJY6i5+zcy6s+p6xNDOM/5cGbk92k2
	05F6QYJ8YoP/ESu8Q1qnKZ8R4i1fW3PbxrmhYJf2f3RM5D2KbGiqsxJGnNpnXBKSO2eAt5
	dBTRwGEJ1vqmzhwQwkVaIu2ERx8AV4s/Co2xPzJDHrJWzzWLltxQ9gCeufXSUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779171981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EFMoT1nh0350NXXeX7IPiJWaU/gL27UDTHeknFT5B9A=;
	b=fYd4iiMFALffZPC5upRbSlrma+6So5nMxTFfNkeD8Ops/qpqJHAgDuRuDXEpHQ9ehBjzJs
	Mxrh4W+5O+d/LICA==
Subject: [PATCH 0/3] vdso: Drop GENERIC_TIME_VSYSCALL
Date: Tue, 19 May 2026 08:26:14 +0200
Message-Id: <20260519-vdso-generic_time_vsyscal-v1-0-5c2a5905d5f5@linutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBNUsLKrREjYVANl4YQU0d2Tl
 n/x/gOMkZChLR6ImIhpDzlUWYBfhjCjoDE3aKkraVQj0si7mDFk5t1JG7rEN/thFbW0tbGqkdZ
 oyP6IONH1v7v+fT9MEOYIawAAAA==
X-Change-ID: 20260518-vdso-generic_time_vsyscal-709759180952
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779171981; l=1289;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=BFyIhH+P8aDUj+S6bxqM8bvEU6dJY5DTJmAlXV+VI1g=;
 b=1YEAKLXpMM+8BF6sr2RU1r/pXXf67u4oZC3U1Q1U5cfkzqDtP8mw19pjfz7E9lgUAeRpJFgwa
 vQZyBSSAOrRBWIauN0r1SGN8iLwBgxpsTujMYR77JTHNKBUcHDT6H+a
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_232627_392961_8EB49E8C 
X-CRM114-Status: UNSURE (   4.82  )
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

VG9kYXkgR0VORVJJQ19USU1FX1ZTWVNDQUxMIGlzIHJlYWxseSBvbmx5IGEgcG9pbnRsZXNzIGR1
cGxpY2F0ZSBvZgpHRU5FUklDX0dFVFRJTUVPRkRBWSwgcmVtb3ZlIGl0LgoKU2lnbmVkLW9mZi1i
eTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0t
LQpUaG9tYXMgV2Vpw59zY2h1aCAoMyk6CiAgICAgIHJpc2N2OiB2ZHNvOiBEcm9wIENPTkZJR19H
RU5FUklDX1RJTUVfVlNZU0NBTEwgZ3VhcmQgYXJvdW5kIHN5c2NhbGwgZmFsbGJhY2tzCiAgICAg
IHZkc28vdnN5c2NhbGw6IEdhdGUgdXBkYXRlX3ZzeXNjYWxsKCkgYmVoaW5kIENPTkZJR19HRU5F
UklDX0dFVFRJTUVPRkRBWQogICAgICB2ZHNvL3RyZWV3aWRlOiBEcm9wIEdFTkVSSUNfVElNRV9W
U1lTQ0FMTAoKIGFyY2gvYXJtL21tL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICB8IDEg
LQogYXJjaC9hcm02NC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSAtCiBhcmNo
L2xvb25nYXJjaC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgfCAxIC0KIGFyY2gvbWlwcy9L
Y29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEgLQogYXJjaC9wb3dlcnBjL0tjb25m
aWcgICAgICAgICAgICAgICAgICAgICAgIHwgMSAtCiBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAxIC0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9nZXR0
aW1lb2ZkYXkuaCB8IDggLS0tLS0tLS0KIGFyY2gvczM5MC9LY29uZmlnICAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDEgLQogYXJjaC9zcGFyYy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMSAtCiBhcmNoL3g4Ni9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAx
IC0KIGluY2x1ZGUvbGludXgvdGltZWtlZXBlcl9pbnRlcm5hbC5oICAgICAgICB8IDIgKy0KIGtl
cm5lbC90aW1lL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICB8IDQgLS0tLQogMTIgZmls
ZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIyIGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21t
aXQ6IDI1NGY0OTYzNGVlMTZhNzMxMTc0ZDJhZTM0YmM1MGJkNWY0NWU3MzEKY2hhbmdlLWlkOiAy
MDI2MDUxOC12ZHNvLWdlbmVyaWNfdGltZV92c3lzY2FsLTcwOTc1OTE4MDk1MgoKQmVzdCByZWdh
cmRzLAotLSAgClRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4
LmRlPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
