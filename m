Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD388606A32C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 08:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YuPEsdIm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=R15BR0HF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:Subject:To:Date:In-Reply-To:Cc:
	References:Mime-Version:Message-Id:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0aco/8mYa6iszFlQlCxc7bO8JQ0T18/LcXNj0Wr0W0k=; b=YuPEsdIml2R6m4QqBIODs6FlzI
	h7iUDRMMOf3qDQw3vG0x/YkiVMBPGxFL22BcxyOQ+86zLIIf4vICUyBJgie4KJhgJmqMys3YpIWyV
	hWqufPvGx2uk5D4dk6BrspQJb1fWH2Fp3dB/oceY6ts3bQjZ+QQKG4oeSAtKXv6zkbubZS9Gz1RFO
	ZqWGI2wkKe5GEZeJyQM4HuoLjHeo/EOYjTRV+c19D8RFWTUlB0jg5TM2Yh0Fh6nATeHJah5vFopNK
	t6J/eiVJwh92+OQ2um4rezHi4tImRoyz3vCTdFuE8YvPSUEtLlLXOjr0U/O0cEFcKOzTfXoZhfXlK
	zB4YDH8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsYO-00000001gwC-3Vn0;
	Mon, 16 Nov 2026 08:59:08 +0000
Received: from va-2-29.ptr.blmpb.com ([209.127.231.29])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsYM-00000001gum-43Ni
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 08:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794819534;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=XVGuat01xtbGFqMwwAT48i+lQJU6RP1WQYE+osx+dlk=;
 b=R15BR0HFtk4hmy78Z49KI/+1shzMrm0eVMUcQIuJwrTEsV7qTEjt3LY767PjVu3bjaW+J0
 zfmnqkcPUQh1cNPtWiZ4kJgLYN3fENeyqjyGrJwb513AHfDdoAW9qLdqllfY3M9bq9rYbQ
 AS8Ews2c8AmeAtjXZ/GBlhCxa5kw7CKGOmaxVt6dOOiiXMSB1OUt5nu9SuJxy/nbsYgjo6
 soYd8NOB7VQB9aFLTo/b5rvpREMrVf+0cAsROx/WpiIcDOwfvcOwvUZjqmjW/krosvLdX+
 3b56oTsDrejWlLuV1si16nw7uf24qrKXhqdUELNiG02P9cc2zUm4nU7CfF+8lg==
Message-Id: <20261116085838.951269-1-sandie.cao@deepcomputing.io>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+26afac5cc+b05e07+lists.infradead.org+sandie.cao@deepcomputing.io>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
In-Reply-To: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Mon, 16 Nov 2026 16:58:51 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Date: Mon, 16 Nov 2026 16:58:38 +0800
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Subject: [PATCH 1/5] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add 115200n8 to stdout-path
X-Mailer: git-send-email 2.43.0
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_005907_078597_E0B92E7B 
X-CRM114-Status: UNSURE (   7.40  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Specify the console options in stdout-path so the kernel configures the
FML13V05 debug UART (uart0) at 115200 baud, 8 data bits and no parity.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index 051046fe90b2..804a9e64cf6e 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -15,7 +15,7 @@ aliases {
 	};
 
 	chosen {
-		stdout-path = "serial0";
+		stdout-path = "serial0:115200n8";
 	};
 
 	memory@100000000 {
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
