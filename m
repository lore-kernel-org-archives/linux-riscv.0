Return-Path: <SRS0=8slP=YC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46859ECE58C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2019 19:42:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A7542190F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2019 19:42:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mjIXQbQy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="JqmPT+MZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A7542190F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q5o5RmRnTgYAC1JgO6RL9zu5/cbH4kF2gB+6GYKU6EA=; b=mjIXQbQyGh3cCm
	Q5QJBxQoSE18Udq0pPExFy7IJJihDlUO2Erd7SbviSzzeAWsVyg5gnpTjB3ULQvjXvTRqsVUlprfe
	0t0MirffnSrXMyU7yEtGbuKio8DknLFyp68J83sT2aEV5O4Lgru1/Dpw17wZpPCxz1tk5RRRzaK7u
	aWoS/xpqzaDIkmb74V63nQJ4GF8klfwwk0yaZZA3K22ZLWnrFtg2N6EMv/PyvEAxxX7q3s30kDhvA
	ov34LQC3uamePlbAy9nDnZO+WSUbzsJnF3E1CJt5zaX1EcMUvo6oZZKZX4dqWRTeL+kVHi7zLh/cy
	LpR3t7Biw91oXdMyweDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iIHrF-0002Dx-Pg; Wed, 09 Oct 2019 19:42:49 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iIHrD-0002Da-D3
 for linux-riscv@lists.infradead.org; Wed, 09 Oct 2019 19:42:48 +0000
Received: by mail-io1-xd41.google.com with SMTP id u8so7818866iom.5
 for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2019 12:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:message-id:user-agent:mime-version;
 bh=+KlI9AjuWQfTR2YtyJ47gFugrYwenbbGRumyyrkEG94=;
 b=JqmPT+MZwUh6TV8RvMkIBN6mPdYVJZ1Z/j2BObiv9kgi4hgwgS9RInTkhBldMtR0l0
 gjqPGFqoqofsQkGHS+nXQSY6gBU1Corb1haodDV+xq6YpB42/k8MvBBuPF3H/eHV5vpP
 dTd6TBc8W7e5FDWlMJNm8ImM4PncaGF1XsbJu6Y3Lmv+/C6vABuSqYLAPciSLM2Zikx4
 oox7CGDOJV2j4RbFjZ17KSqE9mNQK5BWZZ2P0lHYNWj212rakCbUMXQEzJBfpF4HRVYU
 u7bzRcrnlQMDFpw5pqiM/bG77qg27PuSbuBDxXxvzsjJQl8x16huu2VPhyW2dddnROB+
 xx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :mime-version;
 bh=+KlI9AjuWQfTR2YtyJ47gFugrYwenbbGRumyyrkEG94=;
 b=PdPi+KIgXlfobEyWdpMRAq5dyXaDKY/UUDotG9OIgJi4PjmRy/MR9bhYT3wXrshwv4
 z4Z3FCRgtVczU9CnyANFS2aWW7bjYk0U55ELziM3/11A43W5QBEh/i4kGIKY1+2ma7/g
 T3+Z6HiWgsZNPl1cM84TmY3uSokRaKrod04GlH8Gx6Rgh+cEVlpgBTvMsl+8xnMRlxUn
 msoYme1aiynwTfe3EREk9lx4GYlvCGq2oIHS/flJnHxle9L6VB5WKkygrGx7wHFGNINE
 XD/NY24CZ7rEKp8BRfMGbCW+ELz539vSgejlmp4feffGihlBpFNWSh7ONVIeKkgd/J7F
 EmDA==
X-Gm-Message-State: APjAAAU7Qj/gTziDdqtIPXEl7w56SqOeNZQ1WdSRUqvU2J9O4nDCj0Zs
 PAjUYBHAvn+ahEq0+/FxBSLPSuW5yRM=
X-Google-Smtp-Source: APXvYqwdEoDZ8D48q3qk4OPa90nVU+iVNMbJAUe4M4Y1VfbLn43LsORxIYD9MhzVUj3L2cuD0RJWsQ==
X-Received: by 2002:a02:6d08:: with SMTP id m8mr5157249jac.34.1570650165999;
 Wed, 09 Oct 2019 12:42:45 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 h70sm1614658iof.48.2019.10.09.12.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 12:42:45 -0700 (PDT)
Date: Wed, 9 Oct 2019 12:42:44 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: dts: HiFive Unleashed: add default chosen/stdout-path
Message-ID: <alpine.DEB.2.21.9999.1910091240220.11044@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191009_124247_481755_C0DC6026 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


Add a default "stdout-path" to the kernel DTS file, as is present in many 
of the board DTS files elsewhere in the kernel tree. With this line 
present, earlyconsole can be enabled by simply passing "earlycon" on the 
kernel command line.  No specific device details are necessary, since the 
kernel will use the stdout-path as the default.

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
---
Tested on a HiFive Unleashed using BBL.

 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index 104d334511cd..88cfcb96bf23 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -13,6 +13,7 @@
 	compatible = "sifive,hifive-unleashed-a00", "sifive,fu540-c000";
 
 	chosen {
+		stdout-path = "serial0";
 	};
 
 	cpus {
-- 
2.23.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
