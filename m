Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DD3CCA470
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 08:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Fo3xhni1GFsSRlzuUAs74UrNV9I1CD1fNMbE6i5aYlI=; b=qqibGQKmJ872tf
	IJcIykL+sH2n3DnsHMV4Vj6EPvlSMeYNgFKPDz9ZYXeslp+s/tuzGhfwexHVjAy3DiaSCFMAVBstU
	Q9Dn9cH4ZcPIjGXYIzOiBiYMiMPqSFf+WgUg2H9p2+Yuw6HTYOR75yLDbYQ0UHdiI/XFxmDjko1GH
	KfrbhMGTUmnPx7lMJqf0qKOW5F1/s5B5qOogxmJLCAb/QkJ08UoV6Zrjz50v7f//fjO4B6IZokmS7
	q+L0pf0MQorL77UbctpG5cxR3c7A+H2uG41tvyYWsc9YgantnxGz36M3rP0bXWY/TnROGz66NfVrB
	F/qS/G5s0/P8YeRYIKwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lar-00000005Qx1-34DI;
	Thu, 09 Oct 2025 08:01:45 +0000
Received: from mail.biznator.pl ([162.19.205.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lap-00000005QvX-3FUo
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 08:01:45 +0000
Received: by mail.biznator.pl (Postfix, from userid 1002)
	id 8257329B25; Thu,  9 Oct 2025 09:56:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=biznator.pl; s=mail;
	t=1759996651; bh=JvuWKFUQUJpOJ2bAkrqaCtACbxZAO0avZaBH++nQ1CI=;
	h=Date:From:To:Subject:From;
	b=dL6hev9acfWrcEqgr5yuHL2LWhEJ5HhsqO/c8C/ImtpYiy7Uu1fhCCRJtxcBvQAOL
	 EZ/E1tyLtORbMqDLaT3hZ5FgDVlW0VitIgqumkluEKdtYn2P1Rf2ZSE994EbXob5a/
	 iUlmFAT7Un9XNkOP08IpC24KqxAM/MxR0BoXXGirK6WnEffmkBzYcd5oE08HnD2KCM
	 eQOoL9CXaCcbVYyTrNljjZPh2EaO0d+WgAW3L5CarErAEyTNK+KVIafAo9Pwng0QmV
	 jnBw0+oaJwcOIhzjVDUp50zXfIvnhc0so6NrOxWml9LQSOFBWux9zR54YIQaMeskn9
	 QKgQ3CFMu1eJQ==
Received: by mail.biznator.pl for <linux-riscv@lists.infradead.org>; Thu,  9 Oct 2025 07:56:02 GMT
Message-ID: <20251009084501-0.1.k6.26da3.0.c49odpoh22@biznator.pl>
Date: Thu,  9 Oct 2025 07:56:02 GMT
From: "Wojciech Mroczka" <wojciech.mroczka@biznator.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Instalacja pv
X-Mailer: mail.biznator.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_010143_982445_3D2EB7CF 
X-CRM114-Status: UNSURE (  -0.23  )
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

RHppZcWEIGRvYnJ5LAoKY3p5IHPEhSBQYcWEc3R3byBvdHdhcmNpIG5hIG5pZXpvYm93acSFenVq
xIVjxIUgcm96bW93xJkgbmEgdGVtYXQgZm90b3dvbHRhaWtpPwoKSmFrbyBmaXJtYSBzcGVjamFs
aXp1asSFY2Egc2nEmSB3IGluc3RhbGFjamkgaSBzZXJ3aXNpZSBuYWpsZXBzenljaCBqYWtvxZtj
aW93byBwYW5lbGkgc8WCb25lY3pueWNoIG5hIHJ5bmt1IGNoY2lhxYJieW0gcHJ6ZWRzdGF3acSH
IHByb3BvenljasSZLCBqYWvEhSB3c3DDs2xuaWUgeiB6ZXNwb8WCZW0gcHJ6eWdvdG93YWxpxZtt
eSBkbGEgUGHFhHN0d2Egb2JpZWt0dS4KCkLEmWTEmSB3ZHppxJljem55IHphIHdpYWRvbW/Fm8SH
IG9kIFBhxYRzdHdhIGN6eSBtb8W8ZW15IHBvcm96bWF3aWHEhy4KIAoKUG96ZHJhd2lhbSwKV29q
Y2llY2ggTXJvY3prYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
