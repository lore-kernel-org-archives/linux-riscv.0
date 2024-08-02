Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42777C52D71
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 07:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mgaYZQP3M/Y/6WFsaOUZoL3Ne1jLFqCDfmyy6Wd2u4w=; b=SI5+fQ0xPNiTfd
	jWWeakvZPEu33ZD0/MuaBTqxU1bT6w2M6s/hgnmcQ4FtabE3FGO/YE72lN3bj04f9+BSBQ7BuHp/O
	uniTBnLyG9O+DZf1D8N/oz+DFdR3cvHBOj77qfTMq5K62QGw4vq4YoemTBgsJGY4IdZKOSbui80CI
	Cnn0KZYKquRGAVOLkQ00UQR9/hu1kXKB+3jJKp7kCEo3rbU/tCfpKZglh0pQb+/DXsRmyMs5P3Sop
	L0RyEXEcbVU3WmqmQQNwH4EG/nnncByf01xxcDjSEqBBheYz/fLAYssitQVUrW77jT5zRwisvWhjI
	fhlI1G8j5zPHxSLe+l8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZmpr-00000007ybQ-2SSN;
	Fri, 02 Aug 2024 07:36:23 +0000
Received: from mail.synergyflux.pl ([51.38.99.212])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZmpp-00000007yaF-2AwB
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 07:36:22 +0000
Received: by mail.synergyflux.pl (Postfix, from userid 1002)
	id 7224B2596B; Fri,  2 Aug 2024 09:36:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synergyflux.pl;
	s=mail; t=1722584179;
	bh=n9RRp8MlabRDJBtJNro49Rmci90RtotaZYZ8+xo6WI4=;
	h=Date:From:To:Subject:From;
	b=H2aJGCfEHPZxl9zaM3xG9xCdjiJiqmRXvbT2ZGKRtW+N5qsN1tsdqC0omgQzeuJJr
	 Qns3WGrDElmCdwSmVWVsWfpj2tNxsY8eGAyB/S/KPUZ/79tf/cWPdcK+HST3wTLdo0
	 YacjxDFXTMQXFK92mEpuE6dPMicQAijXUcIX4Y0kFG03yJkEnkBxH2G5DcSvkT2RvZ
	 QIzqhcf7PnihGuXrtS/mZEALVMM4ZsoslrWrwfPvPgKoOLwPHtT+z5c1Ri+HIYU1OR
	 Qpyzb3QrXtkIQfWhCBCZ1uEjR2E7N5aIExPsle17r3MaU+gRIeExm4XKa3ww5MHrCX
	 zL8FZYAyAf/Pg==
Received: by mail.synergyflux.pl for <linux-riscv@lists.infradead.org>; Fri,  2 Aug 2024 07:36:02 GMT
Message-ID: <20240802084500-0.1.d4.39htz.0.pl5kb9f9pj@synergyflux.pl>
Date: Fri,  2 Aug 2024 07:36:02 GMT
From: =?UTF-8?Q?"Konrad_Zieli=C5=84ski_"?= <konrad.zielinski@synergyflux.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Instalacja pv
X-Mailer: mail.synergyflux.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_003621_719060_224396CD 
X-CRM114-Status: UNSURE (   0.19  )
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
