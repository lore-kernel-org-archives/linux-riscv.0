Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C206FCD342F
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 08:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mgaYZQP3M/Y/6WFsaOUZoL3Ne1jLFqCDfmyy6Wd2u4w=; b=Yudp/MjoyzP77n
	q6LOWdrAtwdaiHHOje+owh9Efnrjxw4wP0Me+c39aqVZ2eHWtqir9cIsYRAU4Gu+pUMXT3JRJnmMP
	UwBuZ0FtZiy+T6snS6W94ienq5yHD+90dzHKUnFoj8f3Ib6BGxDZuS2l+OkNZ68bn2NTOkAtH6SDb
	Vzf4K4+cPT0pReEZ9W7onheES3VH5NKpBAjegUGMmfr0LhhR6PR5ddkkqNFa/jFjmA14W5ngFnS1q
	LBnsxLhaJTslSQ4ddWUrznCHzcdrtelvypnhYL1Fwqi4oOcV862cZsE6b6xXpyDF/Nc8w/3eqoBTf
	kVU756UOjqTR1CWZcRWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slOS9-0000000GnfT-3X9a;
	Tue, 03 Sep 2024 07:59:53 +0000
Received: from mail.synergyflux.pl ([51.38.99.212])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slOQN-0000000GnED-1Hfc
	for linux-riscv@lists.infradead.org;
	Tue, 03 Sep 2024 07:58:05 +0000
Received: by mail.synergyflux.pl (Postfix, from userid 1002)
	id 9443D25937; Tue,  3 Sep 2024 09:56:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synergyflux.pl;
	s=mail; t=1725350196;
	bh=n9RRp8MlabRDJBtJNro49Rmci90RtotaZYZ8+xo6WI4=;
	h=Date:From:To:Subject:From;
	b=tuSMzzwBbCHTJ8Qcy/5GDjxcmn8CIyi+69z5tieugixN438rEqo9NbtRyzenKUN7C
	 7tIyRUIFqg4zz0HO4I3aCzq1v9SYG0/J/BVUcdoMPQM9xUUrzfRl7kJMZZpWUTlbvv
	 ksaew4oXG/k0HKiJy61UT6sbb8x1+ow7KSdEOmAMAA8swCMNsvU6k86Z/Pm0MXIIlX
	 F8QAI61DgUQrDj2K4+oIKMG4/rYPxGTh6gojm1xJj9G+Q27iKrlWhcbCc3C3gfiwtX
	 0YvTvXCR8WLTVVOAHfUSZWyYySxdw5+InenEuf1/QxY0DJntotxrHLsYc+/CLuJFN0
	 XsnvaBP7d+u7g==
Received: by mail.synergyflux.pl for <linux-riscv@lists.infradead.org>; Tue,  3 Sep 2024 07:55:44 GMT
Message-ID: <20240903084500-0.1.dp.3gchv.0.cqd8g8nikh@synergyflux.pl>
Date: Tue,  3 Sep 2024 07:55:44 GMT
From: =?UTF-8?Q?"Konrad_Zieli=C5=84ski_"?= <konrad.zielinski@synergyflux.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Instalacja pv
X-Mailer: mail.synergyflux.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_005804_058739_AE146BCD 
X-CRM114-Status: UNSURE (   0.67  )
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
