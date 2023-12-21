Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B49C35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 18:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GiYshGRVcDI7Gp6/xQ6fME+3AgSs6tU8ze3IsbGWrFQ=; b=OfwBcYMrKvjRHs
	PJ7idmoH4SCZn+mttTVF9K0L55UqxSx0fCssAqsIhokkB7qnG7txbsv/24a99a4rtlslEmMkQShKj
	EVA7cA/GTpc7/alLCE/hn0+xDKXknRVH8+ENbicHmwTZHqnsU8aKu5EJN7XTII4YvIvqWA9EYnpI7
	4gr81/RXQR5BA92u88ButkBmSCYSD1UwSF1+pEKYVFYENrqB4Z1dxDFE+HBxoTkZElPZPyTXbzMCy
	ndWGuAG/qrWbVru65TbWQr83nkLD5xOr5RQsOOlthlYIblvuLsk7JdORwPhefeofF3rZMki1pR3xN
	K1ol+k8sm9Dln4BRZTOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGO9W-003qqs-2l;
	Thu, 21 Dec 2023 18:52:14 +0000
Received: from smtp31.i.mail.ru ([95.163.41.72])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGO9T-003qoY-2a
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 18:52:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
	To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=8z752kWn2ItQPo1gIar/HLa1/HPTgnoBsS+XUrRGhd8=; t=1703184727; x=1703274727; 
	b=tObYDF9mjw0KzLBUbta5IczWSflCT9zSgEKR4dfCWyopj35r/2WA9n8aRjTGUTaKHynQfFn0geC
	mp/y+gyYTLmalKPt1511SnKBZUaZfXBDLDobOQwyxQ5pfyaOkwpI8rBgQZbjl1BHpLloCrymZ31tX
	uuOEImERSZrIS6vlGgX56BTjaln11kW75uTFOc6e4io8tgX9Rue9hYtAS4xiRFF20SQwapKb00AB2
	UY4H2PWmRREi/SpRbC/0BC/V0RQoD+jMLme189eASz+bXKSAH/oSqizf185/QkvFwmGudT/Onmv46
	erScuTiT3R5yju56QUNvL5aOYBZKM/w8ReRQ==;
Received: by smtp31.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1rGO9L-00E989-1Z; Thu, 21 Dec 2023 21:52:03 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	robh@kernel.org,
	jiaxun.yang@flygoat.com,
	mpe@ellerman.id.au,
	aou@eecs.berkeley.edu,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	Maxim Kochetkov <fido_max@inbox.ru>
Subject: [PATCH 1/1] riscv: set ARCH_DMA_DEFAULT_COHERENT if RISCV_DMA_NONCOHERENT is not set
Date: Thu, 21 Dec 2023 21:51:52 +0300
Message-Id: <20231221185152.327231-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Authentication-Results: smtp31.i.mail.ru; auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9F008C97756F746CAE2B75521B1C23978BC5B3227EFB96EBE182A05F538085040370FE867DC3D4720A26974E0E12F2DC15DD9759C82CEB7C379A875CD76395E03
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A179494B5629353BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637B997C8222C70C3D98638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8202B07C5C43061E46D7D784B04609B7D6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE78C592797616C97AB9FA2833FD35BB23D9E625A9149C048EEB1593CA6EC85F86DF04B652EEC242312D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B63AF70AF8205D7DCA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C22494854413538E1713FE827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B6A45692FFBBD75A6A089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: 0D63561A33F958A5E90DC88608AF0C30D34BED36B961B47FBC9D70AD38F4B40CF87CCE6106E1FC07E67D4AC08A07B9B013BDA61BF53F5E1D9C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A0997E3FB2386030E77
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFCA5E698E74EB8E346FD914991A9554B3B451BD46D1873B37D883D4BC84590BAB0AA6441730D2A0F05FCFFA5448E432FF0300F8D3E5E7DFA5CBF13CAC92B0A663464E0F6E1F48538C02C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojd2R+qgYPpI3akiytHA9YmA==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE338AC28B8DC0150D286D00A84E9A3A6A6998CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_105212_202507_968500A4 
X-CRM114-Status: UNSURE (   7.78  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Not all the RISCV are DMA coherent by default. Moreover we have
RISCV_DMA_NONCOHERENT option.
So set ARCH_DMA_DEFAULT_COHERENT only when RISCV_DMA_NONCOHERENT is not set

Fixes: c00a60d6f4a1 ("of: address: always use dma_default_coherent for default coherency")
Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d6824bec2c00..111c5d92d503 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -14,7 +14,7 @@ config RISCV
 	def_bool y
 	select ACPI_GENERIC_GSI if ACPI
 	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
-	select ARCH_DMA_DEFAULT_COHERENT
+	select ARCH_DMA_DEFAULT_COHERENT if !RISCV_DMA_NONCOHERENT
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
