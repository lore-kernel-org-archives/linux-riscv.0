Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681BDC48291
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Feb 2024 09:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mgaYZQP3M/Y/6WFsaOUZoL3Ne1jLFqCDfmyy6Wd2u4w=; b=ie2XnDe6mHMR+e
	TDh3E83lR41qdGCfpRiMHEgDENwlOqxAfaR6w+hsRnm1ADDFkyW4fZUr2MDqgV+61uttw+nCq2tz5
	K9kTMJrLVSRLn+aGV7uXg0bU2SCYXDZUSlduA1WJjdBP0EmkRx4O5uo7gF9amP+fbpJpm3A4wl0B/
	k0KpwrUwsIehcbO+fpQDP5WFHB5ixkLCO3ATZeUaXZJVgxc4bZK0nt6h1Zii9+hVlDFv0QzdQR6g8
	Ag2D+xR+tMgmz09ZskWo2Fa/1W5zpUzP9QvBrfSJTZ+v/2YCbqcJPCxUOTrTPUNQ0dxJaDI8N1LQf
	NsDfBA0OM8VV2IAaGOmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWv1O-00000002Z5W-0SVJ;
	Mon, 05 Feb 2024 09:12:10 +0000
Received: from mail.synergyflux.pl ([51.38.99.212])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWv1L-00000002Z3Q-0f4y
	for linux-riscv@lists.infradead.org;
	Mon, 05 Feb 2024 09:12:08 +0000
Received: by mail.synergyflux.pl (Postfix, from userid 1002)
	id BC27225E8E; Mon,  5 Feb 2024 09:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synergyflux.pl;
	s=mail; t=1707124325;
	bh=n9RRp8MlabRDJBtJNro49Rmci90RtotaZYZ8+xo6WI4=;
	h=Date:From:To:Subject:From;
	b=p2uf9q0ovXUBxWuelRDQRr4Xg3IEp60nOqZ4bJYTzizF5LpwVCq3WM0XdvRGgmV5A
	 h4x2ymWFyLgZaqpVdoT+7+3cybgdQiFlMXf5VQVIIX2SgMcVcDYmpG+WoqKuV+JUI+
	 VxrG9WkOzZcK8M6gIv7EoraliFtD3k8KkHb7H6GF//kkNE2dJo74vd6Fgoc6B6VJjp
	 S62o3pnqxirsAEyXedJqAp7My9VmeKQT24mnigmHyyCj1rkVlMirdk2nP6338au5DL
	 JBmNN64eYkiQIVJNgNGjrWGtAiX8UHGAOt4bHmNcdauigSrx7VZftSjMd0fhcgyCmb
	 HXAIJNfvlXTAA==
Received: by mail.synergyflux.pl for <linux-riscv@lists.infradead.org>; Mon,  5 Feb 2024 09:10:51 GMT
Message-ID: <20240205074500-0.1.9m.1w7ak.0.v4075ohoax@synergyflux.pl>
Date: Mon,  5 Feb 2024 09:10:51 GMT
From: =?UTF-8?Q?"Konrad_Zieli=C5=84ski_"?= <konrad.zielinski@synergyflux.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Instalacja pv
X-Mailer: mail.synergyflux.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_011207_359658_013EBDC4 
X-CRM114-Status: UNSURE (   0.72  )
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
IG9kIFBhxYRzdHdhIGN6eSBtb8W8ZW15IHBvcm96bWF3aWHEhy4KCgpQb3pkcmF3aWFtCktvbnJh
ZCBaaWVsacWEc2tpIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
