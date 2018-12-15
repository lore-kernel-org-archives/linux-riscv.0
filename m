Return-Path: <SRS0=MTom=OY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E13E5C43444
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 15 Dec 2018 05:22:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2FBE20645
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 15 Dec 2018 05:22:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jGcbvftm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="feuHfR82"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2FBE20645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R+bYlLaNE6fx+7yWrp6m1QU0YDQDk0uJtQgiII9hEUY=; b=jGcbvftmOkg3La
	PHpLOY+DeVNF+wsQs7TsFsI+/d79CxeZPfF/0JMKjsLPKdqTzRiF3JBYnysyCcqdhlzHsxveRlVhi
	K1O9x1Yo8JBDpueaPuLuNXX19m49F7BB9+dcVoHRA+qMuM8I8Agl5yB/gI24zU+Wrb+Qdu85yTlbj
	hR9fdrbEmmEqroqK7qMHG22wpudmT5t+xyq3tixCOJaD5KkFuSJu4x2DwFc1hjvQMyv5wxPRVg+vb
	l7f57pUiGseNjxuczdybJ7rDAAKJOuPkS7uooDseY/fppLBFBeTfdDuwuZKaHzyeaI7bt3O6mlAua
	2nh/vyuFAw4UIzW306mQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gY2PY-0004i1-Fe; Sat, 15 Dec 2018 05:22:48 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gY2PR-0004YB-Nh
 for linux-riscv@lists.infradead.org; Sat, 15 Dec 2018 05:22:43 +0000
Received: by mail-pf1-x441.google.com with SMTP id w73so3790781pfk.10
 for <linux-riscv@lists.infradead.org>; Fri, 14 Dec 2018 21:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OLe9TDsF9ykXoskMy1MUV6N74DR2JxYIMBM3AVcxyko=;
 b=feuHfR826w2zbdrMCBmO9bQOCB5pu21rH6+y8utGYNdneyOMzlRKZMZ0yZ6M+vo6QB
 KB7YU4Mml7amEdcxZtogoLH3cVSGI1p8ggWLyDorL91rCi2VxEJkBRh3LBeriDPAtzts
 7rAdGGHOIvm52Vd5qsDvAAtByJvDhOzaPj2QTYBjeUwp3MuId1jeeWBRCDsSjFJNP1yA
 wbTZxQisvd/f92hIBUzBw9Y7Sdq3AE1NHi22vFwvqmgxy9aG82OVeoM2ITXwSARWTdb/
 nJztNtNnUVbCHtMvc/+nIamH3xYlWrP4C8GKObR8GSS19l0Tu0mR2p6vcbqExDJlzAru
 gK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OLe9TDsF9ykXoskMy1MUV6N74DR2JxYIMBM3AVcxyko=;
 b=dofDr9PdZCqpDbo3G8tt2qnVdnaMQAb1aDXx2NGmmogvXwSG/B9LssQCxreqXJykZs
 6FOELzKYFDDp5WQoYaA0nN7U6HZxIhyXt0E09EG19kTEySJfjPYB7zR3gPusxImuOyeO
 HULxYjTXlljl264eaD4pLdJ6AM/Jg64mRp/MUMLJRxrYkJHJfasDigIxaaQ5AklZgCSn
 sxehMJuiypIDsZhTaUv36ejtSQ5X9GdKl/OjzmyaFbLHyUrOMpfIVt1zyL0z87HqJ/ve
 1SH8bVRKJekwHAJo3HQD3QX/tXDJGAmKkO9krLzdjSEL6q623f5NkH7dll2zS35DVRFU
 jfZQ==
X-Gm-Message-State: AA+aEWbvw/WoRmqxZqG4nU78N0TGjTn0sI2ke+UaszBWrwtbkyDXUeA0
 QCp7EUW0aRGDX4JjFO0u7yeCiA==
X-Google-Smtp-Source: AFSGD/VKuAo7dsf/qapsT4rICerC5zin1uQkYOu2fmF1M+PTkeQRU4rRjdtOkiorie6yBwO0+PN5jw==
X-Received: by 2002:a63:1b1f:: with SMTP id b31mr5107167pgb.66.1544851350858; 
 Fri, 14 Dec 2018 21:22:30 -0800 (PST)
Received: from viisi.sifive.com ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id z127sm11351282pfb.80.2018.12.14.21.22.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Dec 2018 21:22:30 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 3/7] dt-bindings: riscv: cpus: add E51 cores to the list of
 documented CPUs
Date: Fri, 14 Dec 2018 21:21:50 -0800
Message-Id: <20181215052154.24347-4-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20181215052154.24347-1-paul.walmsley@sifive.com>
References: <20181215052154.24347-1-paul.walmsley@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181214_212241_767007_16CD27F0 
X-CRM114-Status: GOOD (  11.84  )
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

Add compatible strings for the SiFive E51 family of CPU cores to the
RISC-V CPU compatible string documentation.  The E51 CPU core is
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
 Documentation/devicetree/bindings/riscv/cpus.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.txt b/Documentation/devicetree/bindings/riscv/cpus.txt
index adf7b7af5dc3..fb9d4f86f41f 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.txt
+++ b/Documentation/devicetree/bindings/riscv/cpus.txt
@@ -68,8 +68,9 @@ described below.
         - compatible:
                 Usage: required
                 Value type: <stringlist>
-                Definition: must contain "riscv", may contain one of
-                            "sifive,rocket0"
+                Definition: must contain "riscv", may contain one or
+			    more of "sifive,rocket0", "sifive,e51",
+			    "sifive,e5"
         - mmu-type:
                 Usage: optional
                 Value type: <string>
-- 
2.20.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
