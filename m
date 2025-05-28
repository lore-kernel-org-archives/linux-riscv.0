Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575B2C3ABB2
	for <linux-riscv@archiver.kernel.org>; Wed, 28 May 2025 07:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bxtsVdJ5QDhk3TJtSDWc37HfyXiGrMnjkLXCJ77XnZw=; b=KgKnOKAX1pr43x
	wfVxefRYfB5wca61HnhSVDce8Sbpyuu/LZn1QxW6C3zFh9I8vgq08Nh4NWfwZroKt2Qedl/6Sd0IE
	RD9vIbuKW5Py9jSYVGXVwl07fDaJhrqY3rMzE/9ceAocSAsT4u3O8OovRSZPqXx7URGle5+ypiLac
	9c4YB+BmJuzflAFvzeGTsRrt8MEYD+bifxiayMp6YeW/q5rz9I0HGauzTBpHFj3jJ8dtQotW6zwIl
	rn7ZPJOgxp6c/alt4KMC8g4KhFdtU8OjOhSwNLWjF1CsTKHktwDpxukyjc4LBDqW7BEmoKmTPjxPD
	kuG7vV/OjjJW9adLhlfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKBMP-0000000CS6z-2n5T;
	Wed, 28 May 2025 07:38:01 +0000
Received: from mail.profinix.pl ([89.46.78.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKBLd-0000000CS2Q-3yCH
	for linux-riscv@lists.infradead.org;
	Wed, 28 May 2025 07:37:15 +0000
Received: by mail.profinix.pl (Postfix, from userid 1002)
	id 971F883BB0; Wed, 28 May 2025 09:37:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=profinix.pl; s=mail;
	t=1748417832; bh=3R0DPJde5QP/N/HQ5yaIUnWadGPDvaKYjHWsht6yKtM=;
	h=Date:From:To:Subject:From;
	b=fxhRCPKUWRHBWByD0pofj8KKdyAKzNGkllmuGpPF/ZcJMKfzfEDRRRfSXUQL4hm2H
	 i5TzU5ahyLZTjdUTh5dYHLJORGqbAuPFRYRHIh0FNbdmVmhlOFlf14jIVWysTT6gwM
	 ZjzX/edx78YkUYoTOcl4nMy/Kw3tkKhg7eEMnGSqoCt3A2Lm/oQDob3RIinbKIYyey
	 5/JH1KK0wu6aU0s3GsvvazwBjJfAZBk0yA5BVkvFlbcC13uks8zaZsCl5D3n3nzewm
	 re0s/y3bO6vNuL+ZoGa6gcRHbCi0bgLrgr6zLSQ1C0MlIuC2/o8E//NcIXA7tpLyLK
	 p/cetNig0s1nA==
Received: by mail.profinix.pl for <linux-riscv@lists.infradead.org>; Wed, 28 May 2025 07:36:07 GMT
Message-ID: <20250528084500-0.1.fu.5wevc.0.rejpnfvbo1@profinix.pl>
Date: Wed, 28 May 2025 07:36:07 GMT
From: "Filip Ostrowski" <filip.ostrowski@profinix.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Prezentacja
X-Mailer: mail.profinix.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_003714_132023_961C98EE 
X-CRM114-Status: UNSURE (   0.04  )
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
