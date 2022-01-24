Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1434C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jan 2022 09:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=shGEA8q7nU/jY87eCqPShmhgYEgpYhF9JInjBmVgLPE=; b=G0jldh/rJ2p6z8
	v+YpZvCMs15Zj/R6xhxwNsZbN5LltOrvTIURiDN0MHwe5XZivJXY6KIckh1S8TXkTCtOVwHjByy/g
	DWMkpID4NpxSeL2uo+mNRxkR1E3ZIzsjwK5+o37SXEWUFUk2vK8Pp5BumsYiEQFXnZYzhvEUQMkDQ
	ntEw0QuADXOWijENPd2T98MgZWm9DyURu+KXfbjCptD4QiwuQs8dMQyKOFmAUse7h8GZqtE6A+8cs
	IId4ND0z14g2rlgZdjKfRQLODplex/1d8ahxCrVc86PVJIUGYCnzTafTTFoew+0PBUspbZHKnCxFS
	KW2iSCHVR7WzX2sM6bIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBvF2-002idP-Du; Mon, 24 Jan 2022 09:02:24 +0000
Received: from mail.portyid.pl ([192.36.61.58])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBvEp-002iVD-Lm
 for linux-riscv@lists.infradead.org; Mon, 24 Jan 2022 09:02:14 +0000
Received: by mail.portyid.pl (Postfix, from userid 1001)
 id F006A4142B; Mon, 24 Jan 2022 10:01:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=portyid.pl; s=mail;
 t=1643014899; bh=+PMi7irkA4XlRgpdW2HqpqcJeZNxKGysf407T0katTE=;
 h=Date:From:To:Subject:From;
 b=ZHwm574MPWSU4Df/E/UM16T0X2pYwk3dWLBN2v4avakJxeNSO0KR+mmb4HEIMkonM
 YPRK4O1yDoMQprofbKrDl7TPbt8Bv7yiJ3T3H1gFQZPDWH9JDUwDkEssMLxoKD9U1J
 sj1GTlxkWMmP5U1tKXk2jj6YQbgeEUZO6a11dzFoqKbBRelgN+tW82P1q9RMbaK035
 68x+ZgQvDkrBHAAzOrK3Y/9ypiymcs5PRBtWBSqdmxHIfilgCWX2vKczaCVo+Io1Q9
 r036Qal2KbHs/1eQzUvaLDTZZgBkIOvX722CJ5kGieeJ5uUQDzFuwrS4LbthdhN1vO
 ni0iFojfMtJTA==
Received: by mail.portyid.pl for <linux-riscv@lists.infradead.org>;
 Mon, 24 Jan 2022 09:01:16 GMT
Message-ID: <20220124084500-0.1.1b.5epk.0.76mf5d9xk3@portyid.pl>
Date: Mon, 24 Jan 2022 09:01:16 GMT
From: =?UTF-8?Q?"Pawe=C5=82_Jasi=C5=84ski"?= <pawel.jasinski@portyid.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Fotowoltaika - nowe warunki
X-Mailer: mail.portyid.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_010211_983440_11355216 
X-CRM114-Status: UNSURE (   1.56  )
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

RHppZcWEIGRvYnJ5LAoKamVzemN6ZSB3IHBpZXJ3c3plaiBwb8WCb3dpZSAyMDIyIHJva3Ugd3py
b3NuxIUgY2VueSB6YSB3eWt1cCBlbmVyZ2lpIGRsYSBwb3NpYWRhY3p5IGZvdG93b2x0YWlraS4g
CgpBYnkgdW5pa27EhcSHIHVtb3d5IG5hIG5vd3ljaCB6YXNhZGFjaCB0cnplYmEgemRlY3lkb3dh
xIcgc2nEmSBuYSBpbnN0YWxhY2rEmSBwYW5lbGkgUFYgZG8ga2/FhGNhIG1hcmNhLiAKCkpha28g
ZmlybWEgc3BlY2phbGl6dWrEhWNhIHNpxJkgdyBtb250YcW8dSBpIHNlcndpc2llIGZvdG93b2x0
YWlraSBjaMSZdG5pZSBwb2Rlam1pZW15IHNpxJkgcmVhbGl6YWNqaSBjYcWCZWdvIHByb2pla3R1
LiBTxIUgUGHFhHN0d28gemFpbnRlcmVzb3dhbmk/CgoKUG96ZHJhd2lhbQpQYXdlxYIgSmFzacWE
c2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
