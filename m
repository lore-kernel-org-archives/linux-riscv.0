Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D34FF887E
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 22:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:Subject:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MPK4h2GSVAhRau5oVceTM0GQKHli8Gjmw4kQRFJ4y4A=; b=IIkKZ2oaljkJA+
	MPPMaaswPXh5b17De8t/uhGr2w+coQaMibqLVl+lCokx/TS6S9V6Rvnz+fVk7FM26PAwgKbuTYGdi
	pTVCgIyjEgiRHvhbQoszpgCsFmqrEbp2vPquaGWMCzr0w3h6XVw5b6GkKces2EqK4l+dqgyFcYyFj
	YZyscH2zCalEfklGOv9lPFB3mhdHyVXsn6na5eKBE5NAjKy/89Nd1w4io33nZnPk+RfSK+8Oa5ufl
	7nbP2b2fJbGjYVDxLRivUciwseC4VKjKeoPjLQDjJxnB574Ex+wx7x98PD27w4D9KV3uirlkeT2aE
	Melnz5c62wOWh6TNSmHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIDVC-00000004HI4-0QT7;
	Wed, 29 Apr 2026 22:35:30 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIDV9-00000004HGn-29if
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 22:35:28 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-8f984bddf4eso27638885a.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Apr 2026 15:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tennr.com; s=google; t=1777502125; x=1778106925; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+cM5bDOtup8kbf7WWvIOEk3VUCv6B35KmgW6pLVjks=;
        b=lPmWGZ263KuKm4TkPbxy8pNYaK9BSGT9EYmCx3K6wvNt+i1gnV7IxVAz9SgsVMIuDP
         AZCZhIH5963hmPyX6HNgYcSHAAehThdx7Rz+UYkpL6WKjE+r5ze4MMnsAsgX+CuRvhpJ
         eQAkRWXQFJWXdi4ebRchqeXkyvNpGsORAYHOZl/tpIalfKJwsxL4X/bzFnMJvDPwXyOK
         RaDR3kitCHkQ7hxF1jIN5n2zqLPg5Kyn632FAXA1JrEb1ZfAhgYIttlvcD1qDzejGZQH
         dpRfu7OdFf7QQ/wislL7UPG5kYLs1afDhmkOHX8wDlRcLubgA3z/WW1B/X5l/h6geVcO
         5E3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777502125; x=1778106925;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M+cM5bDOtup8kbf7WWvIOEk3VUCv6B35KmgW6pLVjks=;
        b=M9/cIymGeVIWHYptmUnsn2xqAaQRcemGgMsJa82feC4z/hToofIeZe5WbI4eTdV3Oe
         fvWcP65lov0zujVGc9AVC0fYMPpu9OYEfQuVmynVOJO9I6Oi3OD5Kt9Mug9XzcoRxwn3
         /HWZzPGG/0TC6KaJtb5C6sGgkbA5P0swa767HbgtyazOPMebQA9pRdRPpMueTokK4z+J
         eSjBnLl5zesKqdQAvsrE0b3R1LmyD95GogXhyGJ0U+JQCoUOFQn2fz5H/hlOask5nUVA
         HtyWTAOSDs3hocmhBQAPZCR0iVpq2CSxtmAyaIxm4CZvF1t55zunH6aJbb+uY4nXeLJ3
         ZiSg==
X-Gm-Message-State: AOJu0YyzPalrBudlmW0+49LIcoQnlDj+L1W215Ji1ZgZnUKfaSltkRLf
	vWWXhDiKziqGUxdPZ2ISMYGL6GvZmP461py/D+UnmuN7tb9JT3yuy2RuBMFJ7ghs+Ew=
X-Gm-Gg: AeBDiesc9d6q8IP9a41W70HG3QH8rfJek4KbSnkwQLQ0dnrBkPGsPFViLOOPBFP+nhg
	F98Mr2KINTechuR6ihLp+HzTxP8bLJMqaviAokjWYjow8xJ78ZmkbXJr/4rhJARsQXsWlUIcpPa
	P2OMn6jqAduH36LNVpDJ1z+dU/607bwf9pCxQZuoGudbmLzdx1SCeeTcGgdywL41FpShW5Pc3l1
	6iiIu/tIciGLzv9h/l0e6o9IdTa1zqibxFlLrnpYf1f4e/vwtvjq5/RDbImZVfzIs0nrDZ66gba
	I1FenSOX2kF4CI9t7V/NO2D0k/Z0nN1keOGk5/H1Ysc6Ef3D0yOC7g70GCn6F+EyF58p7K23QYw
	sPfuofFaPk47mdk5ApT5kBLZo2+K6xyEg9VeZbby3wK/Q3E9VwA4WzMQADTIqiQr0IMfeqVjpzH
	jZyo5Cr6zJ54oSoSNHueRzCkIf3OmmeId/JStZcJHKwulcwYmjBKMb1XLnGWgsA2mQvn5hpOCdS
	idsqrRxowvANV0PtfqFkmefsFg2PFEHwFqg8VQ5IWhzuCAg
X-Received: by 2002:ac8:7f08:0:b0:50e:6313:6e13 with SMTP id d75a77b69052e-5102ab34ed8mr5941171cf.5.1777502125036;
        Wed, 29 Apr 2026 15:35:25 -0700 (PDT)
Received: from ?IPV6:2603:7001:e0f0:ecf1:358c:7c1f:bb1b:654d? ([2603:7001:e0f0:ecf1:358c:7c1f:bb1b:654d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5101ae985e4sm27897071cf.27.2026.04.29.15.35.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 15:35:24 -0700 (PDT)
Message-ID: <391d16fb-5f11-45fa-8f3b-1debe095695e@tennr.com>
Date: Wed, 29 Apr 2026 18:35:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr,
 corbet@lwn.net
Cc: linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, avi.radinsky@tennr.com
Subject: [PATCH] Documentation: riscv: cmodx: fix typos
Content-Language: en-US
From: Avi Radinsky <avi.radinsky@tennr.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_153527_579477_09A5A89A 
X-CRM114-Status: GOOD (  10.88  )
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

Fix typos in the dynamic ftrace section: atmoic -> atomic (twice),
pacthable -> patchable, derect -> directed.

Signed-off-by: Avi Radinsky <avi.radinsky@tennr.com>
---
 Documentation/arch/riscv/cmodx.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/arch/riscv/cmodx.rst b/Documentation/arch/riscv/cmodx.rst
index 40ba53bed..cbfa812a1 100644
--- a/Documentation/arch/riscv/cmodx.rst
+++ b/Documentation/arch/riscv/cmodx.rst
@@ -21,13 +21,13 @@ call at each patchable function entry, and patches it dynamically at runtime to
 enable or disable the redirection. In the case of RISC-V, 2 instructions,
 AUIPC + JALR, are required to compose a function call. However, it is impossible
 to patch 2 instructions and expect that a concurrent read-side executes them
-without a race condition. This series makes atmoic code patching possible in
+without a race condition. This series makes atomic code patching possible in
 RISC-V ftrace. Kernel preemption makes things even worse as it allows the old
 state to persist across the patching process with stop_machine().
 
 In order to get rid of stop_machine() and run dynamic ftrace with full kernel
 preemption, we partially initialize each patchable function entry at boot-time,
-setting the first instruction to AUIPC, and the second to NOP. Now, atmoic
+setting the first instruction to AUIPC, and the second to NOP. Now, atomic
 patching is possible because the kernel only has to update one instruction.
 According to Ziccif, as long as an instruction is naturally aligned, the ISA
 guarantee an  atomic update.
@@ -36,8 +36,8 @@ By fixing down the first instruction, AUIPC, the range of the ftrace trampoline
 is limited to +-2K from the predetermined target, ftrace_caller, due to the lack
 of immediate encoding space in RISC-V. To address the issue, we introduce
 CALL_OPS, where an 8B naturally align metadata is added in front of each
-pacthable function. The metadata is resolved at the first trampoline, then the
-execution can be derect to another custom trampoline.
+patchable function. The metadata is resolved at the first trampoline, then the
+execution can be directed to another custom trampoline.
 
 CMODX in the User Space
 -----------------------
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
