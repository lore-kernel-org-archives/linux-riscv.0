Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D1CEB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 18:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xPZmdV9wJ51R5SVJHb6f3GXe3usFyD9GKaTNkOV41L0=; b=qDNYV9f2EGpE52
	Sa2HFLJdi4oYuzPVg336VbNvmJi/oJBOZNan5MUtTscblfv+SpJN2rMjJpJy4+wBXAiveNuYR6FtY
	xTrU4tjyIo+vdWdmDcMnUmasOzjDYH/E3Bf1FYiwFVk+/s1NjCwxJTFDl3ZuI6ziwKeRh4X0EKX5R
	MhY9aDDQfCFGzW6qj/fi/T0xCUm73KjYDHr+znqQOFVPDdw/vFtlb1yE/fvkjJZhOh6C2zgWfrD5V
	DDK8BT8B+/V0L7PmweVLsPW6vzEsEO3wbd21/L0hHTwB09jViVcokfm/y14urfMgGXaDOXtxVt0K8
	ObxqxpqAxxxR8ca9VR5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBJS6-009B23-13;
	Mon, 19 Jun 2023 18:18:10 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBJS2-009B19-2h
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 18:18:08 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-54f71fa7e41so1953573a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jun 2023 11:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687198685; x=1689790685;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=m+OeXFhNDzLM0zPaS4YH2PeNnnnlp4kA8+TzrtJqYiQ=;
        b=yGQBhWODfMO4QGE36VsSLSajaVcCis5FFQV7l6lTne6poXtOXDYHv3XekY/i1umY3r
         PMlGtLQHdE2ZHw3zqX0HFSFXPOFiVRX5B3WrBCyovdt9rI8a2UKzwFpdZIq6bik0P578
         +B8Ox7+33MQcvBtzVuZcFJQSYU7qTngF567zp/2jBjZOh3ebP+d3QTX5cmvr8yQqPpx3
         H9CccXSazhBk3DyVn7xMoTkjQxaY9DxsjBbXgNeSCIaepf2WfFgj3i6bR+KEn9rlcnnZ
         yyHciBR14WSJoBc2HCZRvNYRjHE+d8RtoddT83CHpvHo83Q7vnSDII7tLCJGB4Ba41Dk
         /QBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687198685; x=1689790685;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+OeXFhNDzLM0zPaS4YH2PeNnnnlp4kA8+TzrtJqYiQ=;
        b=iRX3ieGiWJ69zip6n7JhGWQI6AgS0WYpgS7nXY6ibJnMV88gW/BSDQNfuUiaOh1uZq
         tK1mKKxJrZOWTB8of1cMpP7Js8UVJs5pMgO6BAl9fNtg5sPX4y1nZSBeF6kETe8bgYBM
         lEdmaKJokqZAiFKwdoxk8HW3pl+HwpxfUAtZwNSDA5Rbq+ZoWlQYN8GtvaOOUCDT3Q7C
         PjyUFkCFjrtc/fEswlUDnde2CBpqHTyIlR6BEmSOKBCmOxrIin6leTDERUFDaYogQ3nC
         o7zhiJBSX7GXGYTeVHkgXDITQwQVadNzyY+862L6nFjrapmCjA23xm9mrg+fURpUU8Ht
         PwSg==
X-Gm-Message-State: AC+VfDwrQbzbbrTma1rSJncNG7u0xHbrjnq2f69Vj91+cLWwf/J3IDq1
	dcTog8UxCnNBdsi5dqx0j6Nh643ieFaaBDHwyr0=
X-Google-Smtp-Source: ACHHUZ4E2oHq722lM/8InAXAnc+Ik7Y9l7F4JDd/tR/Ws44CQ3tXFNCFXFEkMu8GykT+Zyr4UCJBsA==
X-Received: by 2002:a17:902:ea01:b0:1b0:3576:c2a9 with SMTP id s1-20020a170902ea0100b001b03576c2a9mr8392670plg.33.1687198684992;
        Mon, 19 Jun 2023 11:18:04 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id q18-20020a170902b11200b001b050df0a93sm158427plr.93.2023.06.19.11.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 11:18:04 -0700 (PDT)
Subject: [PATCH v2] RISC-V: Document that V registers are clobbered on syscalls
Date: Mon, 19 Jun 2023 11:04:12 -0700
Message-Id: <20230619180411.12946-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, bjorn@kernel.org, remi@remlab.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_111807_088347_86E19642 
X-CRM114-Status: GOOD (  10.41  )
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

This is included in the ISA manual, but it's pretty common for bits of
the ISA manual that are actually ABI to change.  So let's document it
explicitly.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
Changes since v1 <20230614163534.18668-1-palmer@rivosinc.com>:

* Remove the code change, just update the documentation.  We might still
  want to do something in the code, but that's still under discussion so
  let's get the docs sorted out for now.
---
 Documentation/riscv/vector.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/riscv/vector.rst b/Documentation/riscv/vector.rst
index 48f189d79e41..96f0fedece73 100644
--- a/Documentation/riscv/vector.rst
+++ b/Documentation/riscv/vector.rst
@@ -130,3 +130,9 @@ processes in form of sysctl knob:
 
     Modifying the system default enablement status does not affect the enablement
     status of any existing process of thread that do not make an execve() call.
+
+3.  Vector Register State Across System Calls
+---------------------------------------------
+
+As indicated by version 1.0 of the V extension, vector registers are clobbered
+by system calls.
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
