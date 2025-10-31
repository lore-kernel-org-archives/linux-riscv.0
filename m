Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31897CCF9F0
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 02:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3m0znk8fCSB1DNSNm6eXBLY4qq91nmodLGXZz0aZ+7Y=; b=M54AXejvNTWd6w
	DdLmoprI+A7GeBbDbhaONpaJPMJpNbvXbPx1pomjGuTPyusML+miC1RlTbcFdH6nqnV5F/XdW4gmv
	qyBPlKi0Ll+2VNF7GFwwQpOBOJeZVEm/fJSAYxtHCOKpEbFOIVCrG52TvysUPCjpPNsTuurKiMLVW
	RvsuoZ4qYg9MXPUt6Z9P3oa5QzGfai41pSsc0rxF5gPa8nz1xwnGj51YLa3z5nTEg3Gqwc6ezFMGQ
	Nn45uskzlkexQJAY4Gp6Hoa3IdOYoEy3E/BUtar+MfAb0n4uHrQ2TwiEfOXWn0WFWgp9OMLANzEz1
	UK2Mgo6HGM2leGI4DmVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEf8a-00000005HYh-1rRa;
	Fri, 31 Oct 2025 02:45:13 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEf8X-00000005HXi-1IGS
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 02:45:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1761878656;
	bh=frwsj15DgVxVMJ8KO7DoMvHVFee+Jhsr1xRKxDB+3cw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=lEtZsil+X93z2NhcgnwSxRVCvVDA+r9JHfER1EUitRp44zbZRvAU3iOImQ+NoUI8X
	 0OobxANNDI7SEJMvbHKEdZCd2JoYSVwvPFkM25x3Oy5N2FljDFbxGSrwgkXFHURw0r
	 WI25hinCahtrUcW9sTEFG+OwHuhuRQ49hspF4lcs=
X-QQ-mid: zesmtpsz2t1761878650t811abe2e
X-QQ-Originating-IP: 6sh+ThAW+eQ59N+O6BU1he7uvP2VizEbUxZD6p44FpY=
Received: from localhost.localdomain ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 31 Oct 2025 10:44:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1469372003017503645
EX-QQ-RecipientCnt: 9
From: Qiang Ma <maqianga@uniontech.com>
To: ardb@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-efi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Qiang Ma <maqianga@uniontech.com>
Subject: [PATCH] efi/riscv: Remove the useless failure return message print
Date: Fri, 31 Oct 2025 10:43:28 +0800
Message-Id: <20251031024328.735161-1-maqianga@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: M7nxhb6mzyWmhLP0LYDlObH120Gmy+iY54Hfc8Ze186KgxhUBnwR49jO
	PWIf5GLYUKJTEcoOv8rby8+TjtW9ZKTL65qyZar7qHUPfYW9LToiFecsBNVOToJbM9qbHAQ
	cBXNuaDChAB3nUorAHeI/5zdNu2YeIVw0dg3TE4HYHJc1FWSV/Fa0A11cjpJb2UhkFB6L8G
	3m6DyUzqWEtL7p58kvIWskHdaGmza0a8cct8MYs0xBqWFNvRk1aucuiTDCBseyuty4U5wNV
	SBzw9xrVboWkQAydng19hZ18ZPWij/ftTo7t8jXqLwoDZAMgIU4gDR7RgaSAoKuvJft0tJ1
	9c20YLCzoAb1megViOwaauWji4EBOnTTanOTCcsvx8eiFQ1diCXU66FvtTQTB2tfxIZzPE3
	vXJnKBDwnl/BB1dnORMs+kVRGrI0Z7XWaXQtgaTUNRu9o+9o04i/aO541c3JNi3tNLSmVai
	C3pJ/nouBSnkae8Ui1IEnCO8ZyoXtAChg0PFb25+UhBCE+u7GpNOhML9TKhWuoWbsPPSsxy
	+3nDSYMF0lBKV9BZTXxjy4PM/w+1a3zsGPze5C/rhWcXGvPqEejEKeZTAKSAYXjoifO47c+
	n+7WC7l4VFKsbx+EPdBzYFvL7P72TW2AWyEChQeCvfAgoLLfVGN+n8Tfz7j1cSF8tmuj4Zp
	ajVL4A3lT5fzXTHlbOVuJLE7ptb3j616wDGdHp8C8AfTrm5BYP415Ztf/KAv4wvx74Yqq+b
	JMtRtFqASV/XuIdWhe1lG+MUtYV0p4XRudYFwc5ZEcSoAwOzdhfXIMwCndCTC3AWDypDVpk
	AeUpcJWnNp6Qz7zA+ZXIiLT0Mvf9SviwzXTExJfrkiCcTTfrsqHu7ynp7P04FuvtoU4XtvH
	6DDZso8gjwxTQxOOE0nW7j4E7+yXNdNOC1GPdScRDlPkw6AAX8/8gKTMaDHqD0xdUO0k1ic
	g9qvhpx551t+AtjY7Ot2wh7TbEVLb+xXnVLoGFmiMQ2JHK1tiuA9QbqRgqnurX9GwQwmRD6
	6s7fh+ALythYypYIO9B/lP+CV5rv6H1w++d6ydvw==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_194509_939479_06F1B59E 
X-CRM114-Status: UNSURE (   8.65  )
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

In the efi_create_mapping() in arch/riscv/kernel/efi.c,
the return value is always 0, and this debug message
is unnecessary. So, remove it.

Signed-off-by: Qiang Ma <maqianga@uniontech.com>
---
 drivers/firmware/efi/riscv-runtime.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/firmware/efi/riscv-runtime.c b/drivers/firmware/efi/riscv-runtime.c
index fa71cd898120..4a2588358be2 100644
--- a/drivers/firmware/efi/riscv-runtime.c
+++ b/drivers/firmware/efi/riscv-runtime.c
@@ -36,20 +36,12 @@ static bool __init efi_virtmap_init(void)
 	init_new_context(NULL, &efi_mm);
 
 	for_each_efi_memory_desc(md) {
-		phys_addr_t phys = md->phys_addr;
-		int ret;
-
 		if (!(md->attribute & EFI_MEMORY_RUNTIME))
 			continue;
 		if (md->virt_addr == U64_MAX)
 			return false;
 
-		ret = efi_create_mapping(&efi_mm, md);
-		if (ret) {
-			pr_warn("  EFI remap %pa: failed to create mapping (%d)\n",
-				&phys, ret);
-			return false;
-		}
+		efi_create_mapping(&efi_mm, md);
 	}
 
 	if (efi_memattr_apply_permissions(&efi_mm, efi_set_mapping_permissions))
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
