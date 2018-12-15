Return-Path: <SRS0=MTom=OY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F3DC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 15 Dec 2018 05:22:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD4B220645
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 15 Dec 2018 05:22:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q5Md508D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="cBMsA5ys"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD4B220645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Anjz1hSkrBM/ysKeMruBGXo4mPsnemZgJkFVDdyz+9c=; b=q5Md508DMQW36+
	xmRE3fOHHb8cC1O9EdVvDSfl1XJIJsA+hoW1cruJOg8Ma1jnJpA/D6jRHSK739T8cOdVVxFgtPHrm
	Xhv7Jr108fuJF3rfgD1Cpb5Jq8ZxvIqoCMgYGsLzTT9496xfDRVwDdhEL9NMjsOqAExlAU+DLD8K2
	b5JxZiBE+n+B5nj+vWrEac6rlVxSc1jo+q5fsSt+BMREjxDCmjlznwZG6RinVd/LEz0tdVXwlfmUn
	jNZKz0UAceSpcBY+sGNvueK2HPFq1rFZL1gCpcYunmONv3n4JPYGyGKkfvlOE133Nj0BAjf+cealf
	crpJPSlHAxTu3Q27Zf6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gY2Pa-0004kR-3y; Sat, 15 Dec 2018 05:22:50 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gY2PS-0004YC-Tn
 for linux-riscv@lists.infradead.org; Sat, 15 Dec 2018 05:22:44 +0000
Received: by mail-pg1-x542.google.com with SMTP id z11so3638620pgu.0
 for <linux-riscv@lists.infradead.org>; Fri, 14 Dec 2018 21:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lrkjhn+VGgEYsGRmcDheJi7s4ycITorGPJHMYu67u84=;
 b=cBMsA5ysBO/Xr4lUDjIAnzwIBnhFQTynifBQRqmU4s8Tq0GcE7Qyntf3PSavrDPPNm
 8YLVhddr0/kibitabU+A1mFQo9cMcfZaHA9/sxXPWuTPEoW6wYL+rxxgU/2vCSgidxgo
 GUfCtQzMRYn11tGHSG31UtwddtAjqu1/ZkFFJh/ZsviHzrvsxVISKiVz2avuJIdd/UDx
 3oZADcP7Znc9Xzua8HMUHKfFdERjjWJaE0GAUACrkgmHkCnfMkyp0wMzXwNLe08/s1JM
 zfpMdbqd2FQYo1+BNmTem5exWnzlj+L8gNil0JKUloZj395rO0g7JrylfYNxZ9tgQuHV
 biEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lrkjhn+VGgEYsGRmcDheJi7s4ycITorGPJHMYu67u84=;
 b=ElGnGp3AHGvH5eWNyNR7UnECysa0F5VDkNmcQ6NHKpV5eYyWLmvBtGHkUCakXGmjoJ
 lc9AOA7TtLDZuEbHhiBfDX3aNdwza17eLVkODCzRmiyx01fq/MQB2nIC9/evsU/q7/Kw
 4Nel7DS+zPjyWLBx4O7IxkGbXmYC6VYzQl4SZTp8XO1sYPCTX05nsSFANBuzSCH70pCE
 2nYhMA1cbgzkmI5s5LVD2+s4dk3XUkenN+D+6/xYf69Rs9oIq1IxAqy80JO5yNYdkddf
 ikDqyhAV9xsQw21IsfM9ykkB8k9nr595zJN+w7njLJ+WiwUdM4fk99AwMHOnx3J190i6
 jKrA==
X-Gm-Message-State: AA+aEWaKNi0CMVFOZHoVuN9cfWOFQyoKdnl87jo9vaXEk4qSON4DAFB6
 GRQ5oGuSIgnl2pvncXs7yXjfYw==
X-Google-Smtp-Source: AFSGD/W/O58QF1bUp4utha4Fq6oCo7f2ghWpbVnDhbBoL7fVnkuYMcZBn5mIzpv0hiiZ/HnmrlQUug==
X-Received: by 2002:a63:d747:: with SMTP id w7mr5057144pgi.360.1544851352098; 
 Fri, 14 Dec 2018 21:22:32 -0800 (PST)
Received: from viisi.sifive.com ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id z127sm11351282pfb.80.2018.12.14.21.22.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Dec 2018 21:22:31 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 4/7] dt-bindings: riscv: cpus: add U54 cores to the list of
 documented CPUs
Date: Fri, 14 Dec 2018 21:21:51 -0800
Message-Id: <20181215052154.24347-5-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20181215052154.24347-1-paul.walmsley@sifive.com>
References: <20181215052154.24347-1-paul.walmsley@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181214_212243_194673_869F0A97 
X-CRM114-Status: GOOD (  12.52  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Add compatible strings for the SiFive U54 family of CPU cores to the
RISC-V CPU compatible string documentation.  The U54 CPU cores are
described in:

https://static.dev.sifive.com/FU540-C000-v1.0.pdf


Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
---
 Documentation/devicetree/bindings/riscv/cpus.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.txt b/Documentation/devicetree/bindings/riscv/cpus.txt
index fb9d4f86f41f..d8d99b6b5386 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.txt
+++ b/Documentation/devicetree/bindings/riscv/cpus.txt
@@ -70,7 +70,8 @@ described below.
                 Value type: <stringlist>
                 Definition: must contain "riscv", may contain one or
 			    more of "sifive,rocket0", "sifive,e51",
-			    "sifive,e5"
+			    "sifive,e5", "sifive,u54-mc", "sifive,u54",
+			    "sifive,u5"
         - mmu-type:
                 Usage: optional
                 Value type: <string>
-- 
2.20.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
