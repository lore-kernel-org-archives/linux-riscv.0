Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231EDC369D8
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 09:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FHUlItoUeTuMpVeFQIbZbqeDXYyqO6leSwtBNl/HHck=; b=K/H67j5+FNlhGM
	ISm3IHqFUlDFwJiPpgTemmdOGf0iXNqZggrMuXxqqxdH/k8sKnME7F4llwpXtgII+7N/UOcYSxea4
	TYvatnP/RMWMiCOSmBZcU3dyYoouzbDSaXgSaoAwj6W/fwsL9wBLWpnD9i/7qnQ3lZzmLATgjkYfK
	wEUiSQ30Wso2nT2w8n6+2CzAgrrmBptCokYeel9AsfmHdbc3ibV6FC6gKZ94QDcZDjhvQpDA7Xy7C
	0Qg3MVD6dJ3D0fV1aqS6dw0s0816kU/wAJoS/iHnaemG6Z5QDW2aP9rTa4gxXp63Ow37quApS20EG
	hULwutW+cE6bVfgaOnpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6nip-000000041Dy-2irY;
	Mon, 21 Apr 2025 09:45:51 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6ngy-000000040nU-0Tn0
	for linux-riscv@lists.infradead.org;
	Mon, 21 Apr 2025 09:43:57 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-736b0c68092so3097035b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 21 Apr 2025 02:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745228635; x=1745833435; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O8r8PRZBSMwqOsQQkiAo5Ug34CtBtLjSR9VzLdpS8hc=;
        b=RlJbK7qKWUN94V0b6Yiydok8L0SMMOtPCm//O7sX0Gl8TegehtNVsrsqWoq5i04Ovu
         mMWzAnQBy8HLUrGEdvHQidVOZA7LY3etNA5Pun5Fjx2t0irFbGy3m66KmgfRRb+SQdNF
         iW0YL2E0tIQUW2mjMI6OhvDQC0oFA8YevXdvCaet3KuDWz79EiVlE30Dn1A9/7udixuw
         t14t9xUxkZB/ppNnEGpxucSVc+6rWF3qdAOGMwkA7PL8Zv51wejVj2+LFs5k7Hy+4AMN
         qNvGaX0UpQSI61M80yO/5xDfWSL1OWkq1hI/Uo6rQ40mz28IroRXEQFX4GvhDem4VV0j
         wW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745228635; x=1745833435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8r8PRZBSMwqOsQQkiAo5Ug34CtBtLjSR9VzLdpS8hc=;
        b=qpVNitjpTIiSqliJ4QRwf2BBzrvcImA5LDdD0dzkCQB5qFikJKpP40oSH2tInN9PqY
         f2YnmIzydqz7//LQ86pF4tibroFFTVmiyqQrjt0FDocoCbS9HXS1u+56hbZ1d7sOUaNd
         qesQkEu3c+OqMOn8oc4NdVYNzCaJDcQ4lBO9CN+9qvMrxSFfD03zyDCptXiB0QVTudOF
         l7d+QA6iE1suPjnx/7w4TNjgf4WoKviQTmMR4ybEMPDB6eJpvA0GGXq+F4lbBDkuNGlX
         OZvzLJBMqZy1JLmCpSfYH4Vn1+M3JJAgcte65lHPJQWFhx07ZqCXiJUfA4/9vjtzfPgG
         0m1Q==
X-Gm-Message-State: AOJu0Yw+DeQ1ziI4DICwgyZWcp8P+OfAzpFGA8PIopTj/CiVI5n+35SO
	z3QDDnKI/U46OSaPqOtkMh55Du018hdy96YWgk3Tpi7Lp+enWZcPyz9V70P4eNI=
X-Gm-Gg: ASbGncsdIN+KkkDa7BWT4ZDaPFP42UnE5XWsk/UFtHbVUE2FOo09EvtGawYYJ9IDD2g
	PVl8OOii86nVAd+OZ3gDsogd0Eso/rZBL816CfCmFKNgf+Dsvazwhyo4luQHuX0sFsPv2xQg2iX
	VKz1UVf7e2/MZHvQ6Y3rOyVXKtJRZCaWUMBHsrZmYnVzYrhJuLHpW61kVElHOw33g5oJL0Reajb
	2V0SyeoFxW+kjDLn31RXIOb10uQbQpinC2OMN5RqGH7O+QkeSC1NHqX3fnPPdl3S7zE32RvwW9o
	/iahLnJ4VKREHpFG+mPvmNOFoD+mduMKvrAfKQZWtQN1APWfHB2CB0LSuq1gvFOz+2nWhkWGtWm
	8TA==
X-Google-Smtp-Source: AGHT+IGhhm/9RykTH/OsZ/BlA/Y/U3CBjIrgF60WUexTWjWufmCT5/ANaQZOPSEaVkm2xDGoxKPQAQ==
X-Received: by 2002:a05:6a00:3988:b0:736:9e40:13b1 with SMTP id d2e1a72fcca58-73dc15cfce7mr14584741b3a.23.1745228634697;
        Mon, 21 Apr 2025 02:43:54 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaacf32sm6371965b3a.142.2025.04.21.02.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 02:43:54 -0700 (PDT)
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
Subject: [PATCH v11 0/5] Change PWM-controlled LED pin active mode and algorithm
Date: Mon, 21 Apr 2025 17:55:16 +0800
Message-Id: <20250421095521.1500427-1-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_024356_160238_71A6C4FE 
X-CRM114-Status: GOOD (  13.25  )
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

Updated patches: 0
New patches: 2
Unchanged patches: 3

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
 drivers/pwm/pwm-sifive.c                      | 46 ++++++++++++++-----
 3 files changed, 42 insertions(+), 28 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
