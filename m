Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68B4C48BEB
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 10:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QejNCgRQvttq+6q21B3Af2v1kbm2S9/Xn9DlpX6dY0Q=; b=crqIGA3uu0Gaha
	jD86lHQA6b1llvPGIUF+D3yj6mLrhMm3zCLmkCBkGshBFsyKxMKN6EfglzMXWO6CSwUueuJGm47f+
	fpUtYcBaYOUVmGx48JJFCXhZfoN95x2LlTHzxTkVGeKUVooDrecoom+ckRKJwFR+s4plYCvvrrNnO
	9EetUlnhKhqOS9xVBU0cBSS78NeKyE7F2h7LxX/GxUwcBOjxJnLdB1VwVDS1c+mVQbc+CuD3qQonp
	TXNllgNocnPjkK4Pl1yI+wCQQSxKoYv6z/bsvIEOR0mJbM/VsJU8SgHYwWpMhtdycy6Xidn1cjjjw
	wRZ2pHOpYcpVzIMtjgLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5sW-00000004OX4-1t3l;
	Thu, 22 Feb 2024 10:00:32 +0000
Received: from mail.thrivehub.pl ([164.132.48.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5sU-00000004OVh-0SFa
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 10:00:31 +0000
Received: by mail.thrivehub.pl (Postfix, from userid 1002)
	id 07D3925AFE; Wed, 21 Feb 2024 08:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=thrivehub.pl; s=mail;
	t=1708505169; bh=m3ZUCTPRVLoDFM+cXi7VhHW+xNF3eUdGHrj1eDbLwQI=;
	h=Date:From:To:Subject:From;
	b=xsGzrXZzfNO0Ln/Gsf0UPgvs8tySn7K388gAoRoC1VFan2UyNSfcpk3MeHwe8PUIJ
	 STiAcsCCq8gF58JulZ0lKNY7aBEavlpRcMZuZivlqeyCZuvEUrxNNtXWKl5c7I0Xog
	 q4H/nWnjAVDQbYEEA3MUJ2XV49wAzc4uGpsiIQ5jTuU4kWrLg+hav1z0MVwm8fJW2Z
	 uXOxGaHyrW+S9cnn9C05aiO3HTmb7gazROKtdw9eNNFHk5E/E5jNKweG8wCIkVKOql
	 u+z90rDYsF4REWv7YnbOgrYl0gBmv+orrxy2uf2RqC8nC3HSBpalQp9+v0EQsaps8/
	 tgObRp1DDj4Wg==
Received: by mail.thrivehub.pl for <linux-riscv@lists.infradead.org>; Wed, 21 Feb 2024 08:45:49 GMT
Message-ID: <20240221074500-0.1.4r.233ym.0.lk3khpl210@thrivehub.pl>
Date: Wed, 21 Feb 2024 08:45:49 GMT
From: "Szymon Jankowski" <szymon.jankowski@thrivehub.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.thrivehub.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_020030_343932_F20861C8 
X-CRM114-Status: UNSURE (   1.41  )
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
