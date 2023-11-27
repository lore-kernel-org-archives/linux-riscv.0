Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF0CC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 09:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QejNCgRQvttq+6q21B3Af2v1kbm2S9/Xn9DlpX6dY0Q=; b=b/hXePGaVhMWgs
	NegCmpWg3HOyMiyAngFKkOM1Ze9gFtp/TJ8m9xASj7ddvbV318/Wl3A1W9S3N6SyQKmQ7CQvB6gMV
	phleTL0+T27vxSzxm0QklMB9N35b9EEArQ0u7ncFyiLA8XPP4fbMuS1c8ZUdgL54Un5+q82TNcZII
	sty565itvy9VUDtL7Je0ToqZY/Mf2meZt92GK3Iu/B11GDwJlqg/3FYCWzB9WeWY94/u/uo7gDPk6
	vPOcu3SqjhTNDM8cUFa45BYl9lWy5NVhFhKlYwt3GLV7MsPqTkXXECZ0M556588rqK4SB/e4whh03
	NZWpD1OjP3P1kIA0/JyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7XZU-001v8W-0N;
	Mon, 27 Nov 2023 09:06:28 +0000
Received: from mail.thrivehub.pl ([164.132.48.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7XZP-001v6h-2Y
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 09:06:26 +0000
Received: by mail.thrivehub.pl (Postfix, from userid 1002)
	id 4AA8224F87; Mon, 27 Nov 2023 09:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=thrivehub.pl; s=mail;
	t=1701075923; bh=m3ZUCTPRVLoDFM+cXi7VhHW+xNF3eUdGHrj1eDbLwQI=;
	h=Date:From:To:Subject:From;
	b=W7CkcYzp61I1hZcJ3qtdWdrz3TKDTSMeg4RbhM8EcOXK9a6nDMz/I9nCoJhVefYK7
	 etu7sqTf1SvaWirqvCC6eWduL5EhE6TGhZ4eSzsDvrhpH69MXWO82rulkTMBM4jeCF
	 MxDz5gkhFL+lu+fWghKgEVei/Wx26upHEWD+oUEY71YqKIPCgMLujy3uBSmoe45bHx
	 NWUod3hHHQzp7tpe/BMaXgDP49Iiwt3u80OXuZRBp2VCIL+EdtNsQrE25JXOFLSBLn
	 2pgDzw84wzYIrpbeLC97AJniYsj2+AIptW+iBLCGit35rf6dKddutzozmWrO/WO4U5
	 l5+NQVWNIobkw==
Received: by mail.thrivehub.pl for <linux-riscv@lists.infradead.org>; Mon, 27 Nov 2023 09:05:02 GMT
Message-ID: <20231127074500-0.1.35.1bp1h.0.l12f4mh2c7@thrivehub.pl>
Date: Mon, 27 Nov 2023 09:05:02 GMT
From: "Szymon Jankowski" <szymon.jankowski@thrivehub.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.thrivehub.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_010624_589291_427700F4 
X-CRM114-Status: UNSURE (   1.18  )
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

RHppZcWEIGRvYnJ5LAoKUG96d29sacWCZW0gc29iaWUgbmEga29udGFrdCwgcG9uaWV3YcW8IGpl
c3RlbSB6YWludGVyZXNvd2FueSB3ZXJ5ZmlrYWNqxIUgbW/FvGxpd2/Fm2NpIG5hd2nEhXphbmlh
IHdzcMOzxYJwcmFjeS4KCldzcGllcmFteSBmaXJteSB3IHBvenlza2l3YW5pdSBub3d5Y2gga2xp
ZW50w7N3IGJpem5lc293eWNoLgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHIHcgY2VsdSBwcnpl
ZHN0YXdpZW5pYSBzemN6ZWfDs8WCb3d5Y2ggaW5mb3JtYWNqaT8gCgoKUG96ZHJhd2lhbQpTenlt
b24gSmFua293c2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
