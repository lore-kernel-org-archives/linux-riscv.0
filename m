Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8E0C369DC
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 07:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iH5or2kBtfKVFtmgFRx96BklmzjKA+ehbvCesNFx+s8=; b=G+j4Qn9Z6kWVIf
	oy0mURH2RxCIl94o2CLtVxCPUFRJ6yrbybm6hQddC+20aT7ygpr8xd9t6jQdW92mrBsbRTK+apBfg
	dy9ie4DE5U38n1SX0BC6iliSZH2cAWm7JqdaRZhsCrZ7izDYW46kDFzjxr0r7Y+5xo5nfcFK2sQ/p
	nuCoRPgAyf0BMAiL/WX17rKIQBbsMxn6tp4SXfqZeQAAgUlQ7clZBm1g/+otxmHq9w30zvhWzd9p+
	F+DBOg1vK5jTx/QmlDq4/mCp3H9uBRED1lN0PZOFTGpG8sDwWOE6DK7YTwZs+kmR8CrzPN6ksroP6
	PqJiWtK7sC9JrrSBPmlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2Lo-0000000C4Yz-1Hvi;
	Wed, 30 Apr 2025 07:59:28 +0000
Received: from mail.commetro.pl ([217.61.16.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA24L-0000000C1XH-38zw
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 07:41:26 +0000
Received: by mail.commetro.pl (Postfix, from userid 1002)
	id 71E1A8337F; Wed, 30 Apr 2025 09:41:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commetro.pl; s=mail;
	t=1745998884; bh=COht1CALZmZz8MRkow5xVDQUyVzx29Nu6ozA/Y0jgb4=;
	h=Date:From:To:Subject:From;
	b=RRv/bf1+swweYdygUtDmTDZOOfDIYh5X66nbLG+dBCWmeRCjDUx/1O6ZkcBUNyMsM
	 /nouhvP5oh/9phvmtKaB6xc2WZhraUTrZfcN67gztQkSGvuTdtrufzoMhduT+I0rsL
	 g7xOUwxswtzm0pcCV7wCjKmSEXLfQ8QgvlWgrcd7Z1HvncQhWUk6s3DJT7GSXWtKns
	 Hmid+p3p6QkCX9V3Ix/M8s2vUkCjZolsYQZoE1ecmIZJq1YUH2V6CQbAWNR1WugVrf
	 MzAZzmzcvUpikEh2SshHQSVq44Ju1uZE9gewe7NUf/nsdlA0yqMwzLsrtvZfbLRpru
	 FS941s/TK8lKQ==
Received: by mail.commetro.pl for <linux-riscv@lists.infradead.org>; Wed, 30 Apr 2025 07:41:06 GMT
Message-ID: <20250430084500-0.1.2a.qb66.0.zh03b72lsc@commetro.pl>
Date: Wed, 30 Apr 2025 07:41:06 GMT
From: =?UTF-8?Q?"Jaros=C5=82aw_Kownacki"?= <jaroslaw.kownacki@commetro.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_ofert=C4=99?=
X-Mailer: mail.commetro.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_004125_914365_432CEE0A 
X-CRM114-Status: UNSURE (   0.38  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IHBvdHJ6ZWJ1asSFIFBhxYRzdHdvIGFrdHVhbG5pZSBub3d5Y2gg
a2xpZW50w7N3ID8KClNrdXRlY3puaWUgcG9tYWdhbXkgcm96cG9jenluYcSHIHJvem1vd3kgaGFu
ZGxvd2UgeiBrbGllbnRhbWkgemFpbnRlcmVzb3dhbnltaSBQYcWEc3R3YSBvZmVydMSFLgoKWmFw
cmFzemFtIGRvIGtvbnRha3R1IHp3cm90bmVnby4KCgpQb3pkcmF3aWFtIHNlcmRlY3puaWUKSmFy
b3PFgmF3IEtvd25hY2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
