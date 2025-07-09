Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6ABC83F09
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 10:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f9O0Tv09P4zpHGZmPz9SsxWQQ8nlg6s3NtTgeRH+aCw=; b=Q2oNdJ6udpDTZq
	fJaSaY2qyb4adRmaKayMCm3AqM5dd8DKJEQ8zgefCYqPua7oQqx/bmavlsNkMgxhy8/ff85toRILP
	/JZf+JyCHsYbx7qGc3gK0aUBWnp9xvzwAdizbx1VxG9iQAJXMtGBr4f+B4Pr3u24V2qa2idD2PnHH
	i/FxCqa+WYk44BJGnO/KOFklGpl2rBe1kF857IxhHZrw73+Lbhd5GGkbWOUt0utSRp52dC2aAimrd
	tJEKEJiCImoFa/6tlvcdNl92ZA92jjAtXG5lYrawyRLLHY/ps9ylgckHc53tADLc4EuVs+OyRsbNn
	D8zWhWoFJhh6heAVoD/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRas-00000008DAz-2XsL;
	Wed, 09 Jul 2025 10:00:02 +0000
Received: from mail.biznator.pl ([162.19.205.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPiy-00000007sNX-0Lmp
	for linux-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 08:00:19 +0000
Received: by mail.biznator.pl (Postfix, from userid 1002)
	id 04D4428D66; Wed,  9 Jul 2025 09:56:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=biznator.pl; s=mail;
	t=1752047815; bh=DjNALEe96gRlzA4ffLINmOD2oI1cqzpVK/E4I+uckvQ=;
	h=Date:From:To:Subject:From;
	b=TVXt2ixlE6FYPTsWTRaDwytwvsAb3EGPFoUtXaECpfCGowTGK6gyUP9amx2zu713w
	 /mCIOWOLI1HArtNdfMrVen21BdM8NES3UpiJz4vN+my5QirSVsd+Vkkl+RtCF0J70q
	 nR1gLmX9dWSTpcecaSZIKjN167Y55K98sddO65JO6GTjrCPEFAwH/UsUkBo/foIHmO
	 FO2pQ/7dMz21mOuLsoSu5qEL9C6Qvg03ROjcMmbs69bOztsTTnr2K5c9I8sqj+vPD0
	 UaTloNyaCuwDeUXAxAjOjEjZ0mmRQtMKZvDJu/s0bwIapieSyv+yNlXx1mCre7ZaiZ
	 SXiOAfK1s8jeQ==
Received: by mail.biznator.pl for <linux-riscv@lists.infradead.org>; Wed,  9 Jul 2025 07:55:23 GMT
Message-ID: <20250709084500-0.1.ic.13goi.0.5bkn0rxxhe@biznator.pl>
Date: Wed,  9 Jul 2025 07:55:23 GMT
From: "Wojciech Mroczka" <wojciech.mroczka@biznator.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Instalacja pv
X-Mailer: mail.biznator.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_010017_646589_2B6D9187 
X-CRM114-Status: UNSURE (  -0.02  )
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
IG9kIFBhxYRzdHdhIGN6eSBtb8W8ZW15IHBvcm96bWF3aWHEhwoKClBvemRyYXdpYW0KV29qY2ll
Y2ggTXJvY3prYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
