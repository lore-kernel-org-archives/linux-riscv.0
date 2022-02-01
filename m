Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950CCC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Feb 2022 10:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u1vQCN0HqREgOB5Z/Yrc+35bUbGf1vz6CSYBLP0Zra4=; b=LAKwcun0PwoK5w
	Cvh11XQGcrQh0blPtgFh+bqJS69k48GSM+NoXybfXssIreYb3YUfsNtxOfWPwSjKu45Dh2cRDwuh+
	hew0WogYvjKA7s0/I8BerFR1RqvJFfSPLznIwJSw2v/pEc71Oyoq7n4N6JWqDzZrGK+Ln9nVNu4tI
	ghCqxvW7ALn0IX1/WspuGSjnb3kQT3xpdIci4+HIZ77K2A3VTbkvEU43XEecyDrbfytAO9a8hOBo9
	fzzVrSB0qe/2fIUJDEn/JpUjptE37jK7vHJ2EmdkpeBQBLYV9BKWlnva6R6pVnzlTIIPj01PO5rO7
	DL0SUtpPgxVcukIgAV9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFCUg-00Eqzx-Nn; Wed, 02 Feb 2022 10:04:06 +0000
Received: from mail.profitfirm24.com.pl ([212.237.10.110])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFCUe-00Eqz8-8v
 for linux-riscv@lists.infradead.org; Wed, 02 Feb 2022 10:04:05 +0000
Received: by mail.profitfirm24.com.pl (Postfix, from userid 1001)
 id 8DB67AA00A; Tue,  1 Feb 2022 09:17:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=profitfirm24.com.pl;
 s=mail; t=1643707268;
 bh=M1ZVeu3q6Upppe+FUx/3rgI7MKJXh389NZDbgCK1SX4=;
 h=Date:From:To:Subject:From;
 b=h7hQ7dNxiJjalGlklJRdpp/oQZkRN64KrdcHOKLVx4rO2bdeT95mGzCs10ykNECux
 y9OSgNFWhxv4XWg0nBc/ETkMUgAs5PyIXD5ay0wive0YWyWOJk5VGSo5PnpxIIMkl7
 xr4oMn3TCb8IuoYgxp3gVtHnl6T+gjhWDtSwOvFlpK4UHgRNfQB4jhrcOMgFSO5WSB
 W0pxZDrvYHGtPXc2y7QIqrCzl4yzha6n/1zcXb1WYSaSZCaxOAJ1pJ59iNeJDmhvWF
 0dB/9nYsMz7xrFj7nbBaV00ftyF5+FQ9ytFGzXUvNJ15iIvRsaOsjWIQaFNzRaOLPH
 RADX19HLE6e7w==
Received: by profitfirm24.com.pl for <linux-riscv@lists.infradead.org>;
 Tue,  1 Feb 2022 09:17:20 GMT
Message-ID: <20220201074652-0.1.b.2zvn.0.bnm8r2ap24@profitfirm24.com.pl>
Date: Tue,  1 Feb 2022 09:17:20 GMT
From: =?UTF-8?Q?"Arkadiusz_Soko=C5=82owski"?=
 <arkadiusz.sokolowski@profitfirm24.com.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Koszty instalacji fotowoltaicznej
X-Mailer: mail.profitfirm24.com.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_020404_541311_B6020A54 
X-CRM114-Status: UNSURE (   1.08  )
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

RHppZcWEIGRvYnJ5LAoKc3R3b3J6eWxpxZtteSBzcGVjamFsbsSFIG9mZXJ0xJkgZGxhIGZpcm0s
IG5hIGtvbXBsZWtzb3fEhSBvYnPFgnVnxJkgaW53ZXN0eWNqaSB3IGZvdG93b2x0YWlrxJkuICAK
ClNwZWNqYWxpenVqZW15IHNpxJkgdyB6YWtyZXNpZSBkb2JvcnUsIG1vbnRhxbx1IGkgc2Vyd2lz
aWUgaW5zdGFsYWNqaSBmb3Rvd29sdGFpY3pueWNoLCBkeXNwb251amVteSBuYWpub3dvY3plxZtu
aWVqc3p5bWkgcm96d2nEhXphbmlhLCBrdMOzcmUgemFwZXduacSFIFBhxYRzdHd1IG9jemVraXdh
bmUgcmV6dWx0YXR5LgoKTW/FvGVteSBwcnp5Z290b3dhxIcgZGxhIFBhxYRzdHdhIHdzdMSZcG7E
hSBrYWxrdWxhY2rEmSBpIHByemVhbmFsaXpvd2HEhyBlZmVrdHkgbW/FvGxpd2UgZG8gb3NpxIVn
bmnEmWNpYS4KCkN6eSBzxIUgUGHFhHN0d28gb3R3YXJjaSBuYSB3c3TEmXBuxIUgcm96bW93xJkg
dyB0eW0gdGVtYWNpZT8KCgpQb3pkcmF3aWFtCkFya2FkaXVzeiBTb2tvxYJvd3NraQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
