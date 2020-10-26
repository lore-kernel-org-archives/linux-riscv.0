Return-Path: <SRS0=maVz=EB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5AE3C4363A
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 23:03:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CC2B20708
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 23:03:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="td8C3JZ+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="nGr05oxD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CC2B20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wX4g/n6Z4vxFkVtoaai8oo26/fP6F8kk0A+XsmapyyU=; b=td8C3JZ+t42jYE9JYqpuhrzG4
	mf/Cyo+A34YAryyjJ0WDmJm+tlQtkguSCgdrAi0i9m5xvsxFET+HAp02yWKh4dNV1x1FSRYvzS4/h
	eLBjlmfQ3qmmCW7AOqwHU0JtVkosQDjljJPFBvpo9PPSGHRXUAwC8L1Jdk9jTxselPR8xSnRWZiJz
	PM2YlEJvLc7D1eMDhuD3w16L86NeGguAdgOVRf9zRyy1pdWtr6zLzXIcpObNv1LnfQ557Idrq83EV
	dRnIUFsIvavBFOWvmCvPeoscvnVkj1crBbLS7OrJUVO3/OU0WFY9zDvp3RcFq+dTxdqVptvB17q95
	LjIWwpkyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXBWV-0004Hv-KO; Mon, 26 Oct 2020 23:03:31 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXBWS-0004FU-Ay
 for linux-riscv@lists.infradead.org; Mon, 26 Oct 2020 23:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1603753408; x=1635289408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qmlk0Pnoc73PLeMzxCGZ41KUAZ0XJ8ZZaWUmbVJfPT0=;
 b=nGr05oxDAK6SRe7L7o1giKU1GJuN/1wDt6UpyPcYMwzGiDbNCVn3Jas8
 C7rWDC0lAKjCVjADONzoQTYpDq5AUGTNYO+dhqbDNJBsApSIv8jvsg1ZL
 RU3/nobD5FMZ2k3NJwx1BEde/T9oy5Gfq5OThiRZwe6cSGSoKCH+WXQda
 2kPPEDzScTwjpc2hMdq7+reRiFHvtVgaBg7FM4IXejGhxVN0SwEsVG6z2
 o3SSsreUZvNH8XtK83CNdDidTNESY/VNJHnP7lt23/8LIe6fgXwhVjC+g
 A6+Cml40M8I34uazxz9OngDliKt61AZr1YuXRQsOAfQ+GpvwabO8ZjIWp A==;
IronPort-SDR: JybhKPbwUi/q9fGONsYOeF/38aYwXWBa5uJtb/Y1EvUxqi+u/0Y2wm/lhLJgB4UR2aiwBOv4vW
 l3ApnDplRsZZx+azT1MoIzF+XCBslSC+ay04xht2qVX7bx3MSjjOIEnmE86rzQFSgx+GoEkQRs
 RttASlhJq4ZZ8RsyaRJRI0uxRXOmxkoajSiY5dMfebzmp7PTLBY84j8c1WzH28wekiXAwbmUB1
 H6hF2AahkCfeVbWPNAIjPwy/qWb3Fe52LbS3baXCDuiY0fjR3gAtZFfc4CTknO2ITlDcxRbIbq
 QtI=
X-IronPort-AV: E=Sophos;i="5.77,421,1596470400"; d="scan'208";a="152152906"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 27 Oct 2020 07:03:23 +0800
IronPort-SDR: Tpcus0rX16e4qgtbXcdZdBeFOG1T6Zg8N83jXFLUk3LPYmFifOthq2plK4SHViNbDmZQ6i1Lh8
 LUQCBq6AtyWkG4vl1cO1s/n8422erEiTSRrgtK60jzcY35aOrbaNASElmyzB+XB0rYFn7/C45Z
 qyoJhhP2uu+D+bCiyp8yea7M+ZZg15R1jhtXx0s7WGu26muiQfQAHWRe29m/cxwIsTbloNQkx9
 5jgejPdPMcAg6jW+VZNpy83oy9KALuxI6bnHbH+1nTUXijsxw1AyV1pZGy1wh23Gg+xqL7/VuT
 ZZ9sOmrtOa+0MTbHhXA4fcfz
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 15:48:34 -0700
IronPort-SDR: w0qKrqk4Ps76VXo2fhQqnJ3FzMjkvDA5n76UhstySma3ZkkQkkND11NhJZJe1RlXHu/OQkarV/
 5eJJS29Zjj//2bfffUYVZXW2/yuSD0isOWFHbB8RAWw1+v7/ODIlLVksfre4BHHKG/C4su00sv
 EAC/XmNixR8peOtynxZ0tW4ZofnRxUZ5ok6zjykyuVEQPSkyAFY4IZSWqNz+XVT+JZAK6I8bpi
 YWP1fNPizwdXJD1KYcY1PiwAqN04YYwkFs6RUTz+WYH+vwTMz3OLF7cwaI9wldwepnoJKem0cx
 6Ho=
WDCIronportException: Internal
Received: from 8223p12.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.110])
 by uls-op-cesaip02.wdc.com with ESMTP; 26 Oct 2020 16:03:24 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] RISC-V: Move __start_kernel to .head.text
Date: Mon, 26 Oct 2020 16:02:49 -0700
Message-Id: <20201026230254.911912-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026230254.911912-1-atish.patra@wdc.com>
References: <20201026230254.911912-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_190328_503890_B35AEB06 
X-CRM114-Status: GOOD (  13.15  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@suse.de>,
 Michel Lespinasse <walken@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, __start_kernel is kept in _init while _start is in head section.
This may result in "relocation truncated to fit error" if _init section is
moved far from head. It also makes sense to keep entire head.S in one
section.

Keep __start_kernel in head section rather than _init.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/head.S | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 11e2a4fe66e0..45dbdae930bf 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -177,7 +177,6 @@ setup_trap_vector:
 
 END(_start)
 
-	__INIT
 ENTRY(_start_kernel)
 	/* Mask all interrupts */
 	csrw CSR_IE, zero
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
