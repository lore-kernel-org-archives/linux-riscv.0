Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E5ED232FD
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 09:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dqQnGqB4dY0jBgGS7xRXxgtb4OZ+I2CQqsPMZ8ZUSTI=; b=V3EcR8MZyUWnZj
	vJ0TD/XTAdnHI5GHUcEIglzkueGp/TEU1zXTk78sT9vBVrAJe/Iz+nbm3OyYjSSABt0lIzQ6gP9e0
	tW1VP32b3Uf5FyfHln4OsOEO+5J1/RLd3Kz1mY2h94RfHPcGhDDC/pf3JeR5h3Xz1VLf9BVTGZY5d
	I/9/AYvkdHKOFWUGcVjKyn4HcLWG2cT2WJMXyvlih6ZixCoG+1hjNCdHDDV+cAkzUf1PAI6j+EAhI
	Y5/oxpTopH48yyynst3cIknzdUw/w6c6iDQnEH0BedQrxR9bCvWmVQQJyWOtILP+e4myuBMyfqZth
	REHyQK9bJN01Yb2Sexcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8Zu-00000001z7y-02PZ;
	Fri, 09 Jan 2026 09:14:42 +0000
Received: from mail.fontri.pl ([51.195.90.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8Zq-00000001z7J-2zv7
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 09:14:40 +0000
Received: by mail.fontri.pl (Postfix, from userid 1002)
	id A4B2BAEFC2; Fri,  9 Jan 2026 10:11:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fontri.pl; s=mail;
	t=1767949943; bh=Kb7u+lszG/nXqIAGpk/hByhDC/8HGhmWaIRwB9KIYkQ=;
	h=Date:From:To:Subject:From;
	b=Ss8nTTTB7oR/rSPvXPvt3KETDgBepqeO2IlWXjjY12ntfOwigq8I32Yv45g1ygX8p
	 C87soQ+U1Dhkue6B/5Gi3WCKvKwA+VTpXzrLf0e+ILHEuJWeM1PtTYC5RhlzE8dyEL
	 L3IXH09oUYE3BarHPSWXoT6sDBBB7Dr61NIMHVH/sFEqHSDtCi2ilGWlV1PXFV9pem
	 qVsKN+B57Fw0ekedU0zpaQUCpf9PvAQv7ebJ3Q9xmgEJGZUy6FVP7+6vkVZy3g5GjY
	 psPHkW0LF44nl/vkXi5XLeNpcuWpssVSXcBgkFGdGB8aAxpIEZz3o9w82aj1rg8PQq
	 qbzTpLSoApTcg==
Received: by mail.fontri.pl for <linux-riscv@lists.infradead.org>; Fri,  9 Jan 2026 09:11:18 GMT
Message-ID: <20260109084500-0.1.td.6k9gk.0.q6ql5kigkd@fontri.pl>
Date: Fri,  9 Jan 2026 09:11:18 GMT
From: =?UTF-8?Q?"=C5=BBaneta_K=C4=99dzierska"?= <zaneta.kedzierska@fontri.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Odbi=C3=B3r_w_paczkomacie_?=
X-Mailer: mail.fontri.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_011439_328566_DA5A9DCA 
X-CRM114-Status: UNSURE (   0.91  )
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

RHppZcWEIGRvYnJ5LAoKamFrbyBsaWRlciB3IHVzxYJ1Z2FjaCBrdXJpZXJza2ljaCB3IFBvbHNj
ZSBwcnp5Z290b3dhbGnFm215IGVsYXN0eWN6bmUgcm96d2nEhXphbmllIGRsYSBwcnplZHNpxJli
aW9yY8Ozdy4KClN0d29yenlsacWbbXkgYWJvbmFtZW50IMWCxIVjesSFY3kgZG9zdGF3eSBkbyBQ
YWN6a29tYXQgMjQvNyBvcmF6IG9ic8WCdWfEmSBrdXJpZXJza8SFIC0gamVkZW4gZG9zdGF3Y2Es
IGplZG5hIGZha3R1cmEgaSBwcnpld2lkeXdhbG5lLCBzdGHFgmUga29zenR5LiAKCkN6eSBtb2fE
mSBwcnplZHN0YXdpxIcsIGNvIG1vxbxlbXkgemFwcm9wb25vd2HEhyB3emdsxJlkZW0gUGHFhHN0
d2EgcG90cnplYj8KCgpQb3pkcmF3aWFtCsW7YW5ldGEgS8SZZHppZXJza2EKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
