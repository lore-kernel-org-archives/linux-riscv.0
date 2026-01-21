Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE2CC44502
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 09:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q0O+yV7Mn6umgkPR/3daTU1TtuauEI3yKEArJychAh0=; b=jGwIV6pirIVfIu
	mbjbLtkEhrCQKle/Xv60OJLtM0K49fFgdtJnRut1GO1SJKqeP4i07Kich1oJscPNSbYr+Cr+mGVm6
	Iucia3eAgPZPQcHiK6q2ORNekDtE84cl6Kpiums3JWbJLplmw6w7Y8/JLphjg7Lc3SKSyffx4cLCz
	TB4zL6uiKtSkEdysnNmqnl3O7smz4wI9PEFen9TOYAOwZGq2R8tOy02FAjfBagiygva68IoX26L5K
	+bnR4Y/9oM+uI+8An8sP0EXcLiI90C+Rw1HvffMd+/XMvqPMTuonOu5B2CkvZlM8kbZQmWaGk3Plu
	MOUtDcjOOhifrbCAbGSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUKM-00000005AYy-0HQ1;
	Wed, 21 Jan 2026 09:16:38 +0000
Received: from mail.vexro.pl ([141.94.250.70])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUKK-00000005AYQ-0rHk
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 09:16:37 +0000
Received: by mail.vexro.pl (Postfix, from userid 1002)
	id B81CFA709A; Wed, 21 Jan 2026 10:11:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vexro.pl; s=mail;
	t=1768986758; bh=Q8rYVmzeb0BIhBpMFUreKtfVcFEbEBQ1myveAe1Z1DY=;
	h=Date:From:To:Subject:From;
	b=ev1awIuAZcbfpVwamF56a7rH0ChBaH0C+12X5L6yzL6QiieRfASLYJkgP3lH6yh0a
	 SKnzTj91EeGOztxKfUm63/M3Hl41vSC46TrbYWmZNUvvtY6wyNqaiEeKtWSSAFybRe
	 1h1nVHlnSz/7MQFyrVSKstwi9LeeCumoCXcwltCRRI7maQqYCkFhi9FuRzYT0FXiji
	 4KFot/7PU7SZDtfZbfNYtma5Cfr9czjLmTi7koFf+gRsUPBns7y+8VETi/0gyEFsA0
	 oIk0yi3/K7i7qvqkC7RngGDTdjAZ7XcQ9cdMBzpYInPl07lM4ClJtHO9K7q5wDPis1
	 GRm2FZP4tXbXA==
Received: by mail.vexro.pl for <linux-riscv@lists.infradead.org>; Wed, 21 Jan 2026 09:10:50 GMT
Message-ID: <20260121084500-0.1.pt.4z26h.0.c21d7ghtbv@vexro.pl>
Date: Wed, 21 Jan 2026 09:10:50 GMT
From: "Adam Drzewiecki" <adam.drzewiecki@vexro.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d_?=
X-Mailer: mail.vexro.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_011636_384311_E7ABC2BE 
X-CRM114-Status: UNSURE (   1.50  )
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

U3phbm93bmkgUGHFhHN0d28sCgp6YWptdWplbXkgc2nEmSB3ZHJhxbxhbmllbSBzeXN0ZW11LCBr
dMOzcnkgemFwZXduaWEgcGXFgm55IG5hZHrDs3IgbmFkIHBvamF6ZGFtaSB3IGN6YXNpZSByemVj
enl3aXN0eW0sIHVzcHJhd25pYSBwbGFub3dhbmllIHRyYXMgaSByZWR1a3VqZSBrb3N6dHkgb3Bl
cmFjeWpuZS4KClBsYXRmb3JtYSBhdXRvbWF0eWN6bmllIGdlbmVydWplIHJhcG9ydHksIHd5c3nF
gmEgcG93aWFkb21pZW5pYSBvIHN0YW5pZSB0ZWNobmljem55bSBhdXQgaSBkb3N0YXJjemEgZGFu
eWNoIHdzcGllcmFqxIVjeWNoIGRlY3l6amUgemFyesSFZGN6ZS4KCkN6eSBieWxpYnkgUGHFhHN0
d28gemFpbnRlcmVzb3dhbmkga3LDs3RrxIUgcHJlemVudGFjasSFIGx1YiBiZXpwxYJhdG55bSB0
ZXN0ZW0gc3lzdGVtdT8KCgpQb3pkcmF3aWFtCkFkYW0gRHJ6ZXdpZWNraQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
