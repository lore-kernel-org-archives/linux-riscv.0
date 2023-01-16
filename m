Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8E1C46467
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jan 2023 07:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ApP9P9XcGVMvlUiqBFx7E7Ljz/QYFLWH98eymx3Rl9Q=; b=tlM9cxMELBZ/UV
	W0avd5Mnr1MYTCrz1ewSRSOxEL1RXXIzEbG4OJllew0sB+p7w/42cWKH7HtxEpJg0CXenHJ28qzZq
	86geJX8GG2UR0ZKOvXY7f66Hc7nZ/TzRAQTRXHkcIUKod+z0fIE85jLHorZL+N7k+9POSnZK4zPTb
	i0+Nl3GfkD20NVhVHq4dWkAsRwLMzR3BcgyOm9Um4mU+/qWE3IkkOUh7o7DFzNHsTB9v5yZDry7h1
	H9AlXnLPJ3ExpVh9b2Ji4clHq7RbUTeJwYyQ4ee/Wujvu48KCnw/ZFbtG/A7q0H1y2S/skmgT8ORV
	aRD/72FjGCZai6yev/Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHK5A-0090kU-34; Mon, 16 Jan 2023 07:39:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHK57-0090ip-2a
	for linux-riscv@lists.infradead.org; Mon, 16 Jan 2023 07:39:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7F9EBB80D4F;
	Mon, 16 Jan 2023 07:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DBBAC433EF;
	Mon, 16 Jan 2023 07:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673854735;
	bh=hGkAuM1wsrP/rKI77ybxsAx4D4SSyg0EvajNB+hLnDM=;
	h=From:To:Cc:Subject:Date:From;
	b=OTmObwC5u5eBy9nVs0ctz4+zKQXFVwn1tHK5PHVdPKcM2XELGKyhHP0coAbcD4x2o
	 62hqNTRDceOLlPYU/79owcd+1n7m+vZw0houlyhV5/jqyTd/dBXTVJ2spKe4gj9rTJ
	 V2C4lLX794g+j6SSiGZ/rUY6XkkaS0Whew+ajsDHZFl1W7C2kPoDGrjKBhJlekVfpr
	 XCTnLwoIalXrh00DwV/NRIVIpw8W1abpODOFiWuIIoEPvp0WJ+CnwI3eRel5Rh/Isx
	 RWUx8UtcBZl7iGot8mAot2H4GU7sLOhEBCv3Wd4dx8r2FQifvz9766Y3hdkD3/KXTr
	 NS7N1PsQ3V33Q==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Andreas Schwab <schwab@linux-m68k.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] riscv: Dump faulting instructions in oops handler
Date: Mon, 16 Jan 2023 08:38:32 +0100
Message-Id: <20230116073834.333129-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_233901_305170_F6DB17AA 
X-CRM114-Status: UNSURE (   9.25  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKUklTQy1WIGRvZXMgbm90
IGR1bXAgZmF1bHRpbmcgaW5zdHJ1Y3Rpb25zIGluIHRoZSBvb3BzIGhhbmRsZXIuIFRoaXMKc2Vy
aWVzIGFkZHMgIkNvZGU6IiBkdW1wcyB0byB0aGUgb29wcyBvdXRwdXQgdG9nZXRoZXIgd2l0aApz
Y3JpcHRzL2RlY29kZWNvZGUgc3VwcG9ydC4KClRoYW5rcywKQmrDtnJuCgp2MS0+djI6IER1bXAg
aW5zdHJ1Y3Rpb25zIGluIDE2YiBwYXJjZWxzIChBbmRyZWFzKQoKQmrDtnJuIFTDtnBlbCAoMik6
CiAgcmlzY3Y6IEFkZCBpbnN0cnVjdGlvbiBkdW1wIHRvIFJJU0MtViBzcGxhdHMKICBzY3JpcHRz
L2RlY29kZWNvZGU6IEFkZCBzdXBwb3J0IGZvciBSSVNDLVYKCiBhcmNoL3Jpc2N2L2tlcm5lbC90
cmFwcy5jIHwgMjUgKysrKysrKysrKysrKysrKysrKysrKysrLQogc2NyaXB0cy9kZWNvZGVjb2Rl
ICAgICAgICB8IDEyICsrKysrKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAzNSBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKCmJhc2UtY29tbWl0OiA1ZGM0Yzk5NWRiOWViNDVmNjM3M2E5
NTZlYjFmNjk0NjBlNjllNmQ0Ci0tIAoyLjM3LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
