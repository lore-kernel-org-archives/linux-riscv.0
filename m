Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1322FC3ABC9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 08:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bxtsVdJ5QDhk3TJtSDWc37HfyXiGrMnjkLXCJ77XnZw=; b=iAjWABRBGH1Ya7
	N8z76b07agsrFc05oCtYwvbTvESGuTQ1mU5FXB/rFZL83oJDYIo1l6693pQWswdwPdn6n9oLui/HU
	H72DJE0A2WEgFunCJGcHbHQjSuVaZsEjjsc47ivwlYY7QRDbcYmGFKPM7LGK2RdZEqFpWiEjxXX2h
	ggm31sT3gxG4/jJfhqEicBSu8Qz266hByyAa7aNd/HgvdUtl0m+MmO3lmKaHm2D8S5ypaeq200BAh
	I9nTEDMZKHhbvJ9OLsGl/1xAxf0eihfYXZ5uzqQpO1ygQjIIYTtrTlvsuzpFJZZTkby03/dSzI1F6
	mYVpp99rkTtWzvdkG7YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTq9-0000000HUuj-3zMa;
	Thu, 15 May 2025 08:21:17 +0000
Received: from mail.profinix.pl ([89.46.78.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFThp-0000000HTL1-1NcW
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 08:12:44 +0000
Received: by mail.profinix.pl (Postfix, from userid 1002)
	id 5B3FF82B5B; Thu, 15 May 2025 10:10:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=profinix.pl; s=mail;
	t=1747296643; bh=3R0DPJde5QP/N/HQ5yaIUnWadGPDvaKYjHWsht6yKtM=;
	h=Date:From:To:Subject:From;
	b=T+R/JHWfmbPAg/i//CJovIHs2wJ/nr5TZgIXpCckuNDliDrmErcZzqy1tJfW0d2qA
	 cfjACUs/Oto1yNIsddsQRrYhYe2Lq3A+dr7wxjLrf397onY5R02xUrw9YnfqNEBvk3
	 YeQ37ofrU26kvqXovvISPvrqlv1FXBIoGlMjjXL67tfq1imqHRAgvIp9t3QK2cVFTZ
	 SqeFk8+YIBfp/ver8hmW7qR4G67RbhPMdxGhOC5tONrvUQE2bld18TTOmSRShMd16F
	 6ygczxKeMXRpa+MsSUoRb9d2euWVBCZPcxQ6cIrbUd4Bx89bN5W647IqLa04SoNj59
	 yWl9fGZkuhwqg==
Received: by mail.profinix.pl for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 08:10:42 GMT
Message-ID: <20250515084500-0.1.fl.5wevc.0.zmbphe697r@profinix.pl>
Date: Thu, 15 May 2025 08:10:42 GMT
From: "Filip Ostrowski" <filip.ostrowski@profinix.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Prezentacja
X-Mailer: mail.profinix.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_011241_515640_1C7910B3 
X-CRM114-Status: UNSURE (  -0.16  )
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

RHppZcWEIGRvYnJ5IQoKQ3p5IG3Ds2fFgmJ5bSBwcnplZHN0YXdpxIcgcm96d2nEhXphbmllLCBr
dMOzcmUgdW1vxbxsaXdpYSBtb25pdG9yaW5nIGthxbxkZWdvIGF1dGEgdyBjemFzaWUgcnplY3p5
d2lzdHltIHcgdHltIGplZ28gcG96eWNqxJksIHp1xbx5Y2llIHBhbGl3YSBpIHByemViaWVnPwoK
RG9kYXRrb3dvIG5hc3plIG5hcnrEmWR6aWUgbWluaW1hbGl6dWplIGtvc3p0eSB1dHJ6eW1hbmlh
IHNhbW9jaG9kw7N3LCBza3JhY2EgY3phcyBwcnplamF6ZMOzdywgYSB0YWvFvGUgdW1vxbxsaXdp
YSB0d29yemVuaWUgcGxhbnUgdHJhcyBjenkgZG9zdGF3LgoKWiBuYXN6ZWogd2llZHp5IGkgZG/F
m3dpYWRjemVuaWEga29yenlzdGEganXFvCBwb25hZCA0OSB0eXMuIEtsaWVudMOzdy4gTW9uaXRv
cnVqZW15IDgwOSAwMDAgcG9qYXpkw7N3IG5hIGNhxYJ5bSDFm3dpZWNpZSwgY28gamVzdCBuYXN6
xIUgbmFqbGVwc3rEhSB3aXp5dMOzd2vEhS4KCkJhcmR6byBwcm9zesSZIG8gZS1tYWlsYSB6d3Jv
dG5lZ28sIGplxZtsaSBtb2dsaWJ5xZtteSB3c3DDs2xuaWUgb23Ds3dpxIcgcG90ZW5jamHFgiB3
eWtvcnp5c3RhbmlhIHRha2llZ28gcm96d2nEhXphbmlhIHcgUGHFhHN0d2EgZmlybWllLgoKClBv
emRyYXdpYW0KRmlsaXAgT3N0cm93c2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
