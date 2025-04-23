Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46989C369CB
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 09:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iP3fBsB2HKPYB1baWSU5pkxgLooih7V5D6qeaGUcvvE=; b=RIpc6PowU/xmnb
	t7+kZDkw/H8DokzSuPvejf8efG4zz1N8UrtbafTEnPH3olU1TgVe7799Z0QD95DRuqlZTblr1uRJV
	Oq2riZLk/lTfW4wqavhL1IZbcVXauU7Ee43z4tvb5ZqktYGeaXQT91j7/5HFDDkHb2CZ0kd/8rM2K
	Gv56I3g6zgtMPrSZrNiG1cHx/BNYBBhzS5aJFJDiK9r8wUeiR7Ph+VXUD9b143X/M2C37oFssMx4A
	sR7yfSgHNynVd1jOfdHMD2YNH6sMjI+h8ICc/S9wsNbLydB/8cNOLJ7Shv7D1uC6L3EKvfindZ33Y
	5tvdKwSWUigW7XGAFr9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WrG-0000000A5G6-3b7Z;
	Wed, 23 Apr 2025 09:57:34 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Vr4-00000009pbV-1VL5
	for linux-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 08:53:19 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b041afe0ee1so5647688a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 23 Apr 2025 01:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745398397; x=1746003197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JjebrSqhRy+XNyTElbHFiq0P7Ym7xRzEEhcpacCtDZc=;
        b=J9+C0u2S7NxodOZxxItFHXqS6hYbWJOJ0Z1rDTpOnAB+STf6ugnSoSnSksGfipt+/4
         KoCj1DW/Rx1yOEyjNb46154ZtYSfx2FXbRDF08ZIpYiwQ7TcJ4+sEZNEAx2dLmzIEjEB
         udnUB+NL7luInDWw+NFLPsbLS7bmTdsS2Ndaotzlde5t6CCyyygWSNWtmIcguwX4pVRe
         EOWaSN+S00sQvfnwdBbwJkypk598fxLLwzoAWsvISEARDMJQx9rNGvXzwqBjEEiqsod+
         8ZYBSSBSNZejfQwNSB/EeSQcHkVxP0mnIMyux9exNHFy7RaDDh+/dMBNljY0qvo4QCT7
         oe7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398397; x=1746003197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JjebrSqhRy+XNyTElbHFiq0P7Ym7xRzEEhcpacCtDZc=;
        b=wMBIFJChM9wFOy9mlSPIsy39tQ0Koj2JxgqctfiOWf6A4Um8uW5RpCx8MzD8FuaesB
         pSGPrQi3+PcgsNDvNuaa8q3XXCpWofScAEG3NdGUpc9U1RDCt2MuHOp0oBH94UK2FmfX
         PscuwVfqQbwK69fpRt2cxeHy+v4wT6nFCa4pbWwtxnjws+LnlrfGd4EXkWEXKqZB6+oP
         0qguQA6XQxAN1WFWHpAksCzE/hqQsQTnVAGsL8+SR9sJyMcoSW0y49VpNlWXx0AN82o6
         rBa+XhAiSWyP/k0lD6piNJRBtoMlDJFMiHPGLJacTO9XUZRQnw30ZrtMZZXHzhwNv3mc
         IiXw==
X-Gm-Message-State: AOJu0YzppwHf4d9brpW170lQ5xoSReC01oJmzlfd+cmBOLRYYa8ahPMZ
	ItEEBe/VFn9SRcNXJg72xVXC5JXalE8kDnJa1h3+JV+HUTj94PClQmaPh5CJ9kw=
X-Gm-Gg: ASbGncs2q2VZQ64tWEo516LraUo5wbSMaN33U6sAjLo+0U2A40MbBWpc8D5XMDbIbQU
	utcwwCIgpstQgGfnAM1b255Zc7OaqvD6OzeOy+UFqTji+nnSGbN6rYf7umkvJo7mLfnO4mqd9sQ
	sTfBrIiavYgdVwtY+o2j2iiq70Y7u14e58w4kOLTK73rauVC5z2YE4/jGXpe1suNWwFiH56qcxe
	SjfUbjtyoPsxzvXHbaKRtGEboFnLzljqT94Ns0cGCgZWhOFwoAP/72Z8a2IsNNRa7FcVWuHRqn3
	vy6T+5nOEzQsV3jArN5rK1XB2j6wEjOSXeK5/RzayrXF3blB0c7/1ruX1GfB8eDLWOptKNKaZdw
	gzw==
X-Google-Smtp-Source: AGHT+IE/xgNsfxLOOIy9HFiTH79KuPX/M8jQhMYXEVtLbecTAoeikygJMa2gCllgel3Hj8t3lvLqwQ==
X-Received: by 2002:a17:90b:2751:b0:301:98fc:9b5a with SMTP id 98e67ed59e1d1-3087bb4150cmr24558428a91.6.1745398396823;
        Wed, 23 Apr 2025 01:53:16 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309dfa5f880sm1047611a91.38.2025.04.23.01.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:53:16 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Nylon Chen <nylon.chen@sifive.com>
Subject: [PATCH v13 0/5] Change PWM-controlled LED pin active mode and algorithm
Date: Wed, 23 Apr 2025 17:04:41 +0800
Message-Id: <20250423090446.294846-1-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_015318_407864_DF5F6C71 
X-CRM114-Status: GOOD (  13.36  )
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

According to the circuit diagram of User LEDs - RGB described in the
manual hifive-unleashed-a00.pdf[0] and hifive-unmatched-schematics-v3.pdf[1].

The behavior of PWM is acitve-high.

According to the descriptionof PWM for pwmcmp in SiFive FU740-C000 Manual[2].

The pwm algorithm is (PW) pulse active time  = (D) duty * (T) period.
The `frac` variable is pulse "inactive" time so we need to invert it.

So this patchset removes active-low in DTS and adds reverse logic to the driver.

Links:
- [0]: https://sifive.cdn.prismic.io/sifive/c52a8e32-05ce-4aaf-95c8-7bf8453f8698_hifive-unleashed-a00-schematics-1.pdf
- [1]: https://sifive.cdn.prismic.io/sifive/6a06d6c0-6e66-49b5-8e9e-e68ce76f4192_hifive-unmatched-schematics-v3.pdf
- [2]: https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b16acba_fu740-c000-manual-v1p6.pdf

Updated patches: 1
New patches: 0
Unchanged patches: 4

Changed in v13:
 - Fix syntax error: Added missing closing parenthesis in do_div()
   function call.

Changed in v12:
 - Replace division with do_div() to fix __udivdi3 modpost error.

Changed in v11:
 - Fix rounding consistency in apply() and get_state()
 - Add code comments to help clarify Reference Manual errors.

Changed in v10:
 - Add 'inactive' variable in apply() to match pwm_sifive_get_state()
   style
 - Update comment about hardware limitation - it cannot generate 0% duty
   cycle rather than 100% duty cycle

Changed in v9:
 - Fix commit message to adhere to 75 columns rule.
 - Update commit message's subject.
 - Add a variable for inactive logic.

Changed in v8:
 - Fix Signed-off-by and Co-developed-by typo.

Changed in v7:
 - Remove active-low strings from hifive-unleashed-a00.dts file.

Changed in v6:
 - Separate the idempotent test bug fixes into a new patch.
 - Move the reversing the duty before the line checking
   state->enabled.
 - Fix the algorithm and change it to take the minimum value first and
   then reverse it.

Changed in v5:
 - Add the updates to the PWM algorithm based on version 2 back in.
 - Replace div64_ul with DIV_ROUND_UP_ULL to correct the error in the
   period value of the idempotent test in pwm_apply_state_debug.

Changed in v4:
 - Remove previous updates to the PWM algorithm.

Changed in v3:
 - Convert the reference link to standard link.
 - Move the inverted function before taking the minimum value.
 - Change polarity check condition(high and low).
 - Pick the biggest period length possible that is not bigger than the
   requested period.

Changed in v2:
 - Convert the reference link to standard link.
 - Fix typo: s/sifive unmatched:/sifive: unmatched:/.
 - Remove active-low from hifive-unleashed-a00.dts.
 - Include this reference link in the dts and pwm commit messages.

Nylon Chen (5):
  riscv: dts: sifive: unleashed/unmatched: Remove PWM controlled LED's
    active-low properties
  pwm: sifive: change the PWM algorithm
  pwm: sifive: Fix the error in the idempotent test within the
    pwm_apply_state_debug function
  pwm: sifive: Fix rounding issues in apply and get_state functions
  pwm: sifive: clarify inverted compare logic in comments

 .../boot/dts/sifive/hifive-unleashed-a00.dts  | 12 ++---
 .../boot/dts/sifive/hifive-unmatched-a00.dts  | 12 ++---
 drivers/pwm/pwm-sifive.c                      | 49 ++++++++++++++-----
 3 files changed, 45 insertions(+), 28 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
