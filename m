Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939F7C021A0
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 10:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hrnrULJj+x0BDLqsMyvT87Y/QfEVKeJoxEAHtoSjw/8=; b=AVyVt72U1kAU0V
	RJnQHVnPZzIGJgMYrUjnvqAn9noqI4eM9LUdNEV8TV691onuso0v1e8Fp1WeC54+RJ1YBstmSWEiX
	LfSyNF4nC/Sx7WrTTsmF0gB78Phvwndyuu1pQGRlQhzjw7OqSgGyoQaUKWhKEIgU4ixRELNFB7NiE
	qKttBVyksdsAvmYyFNkNcfZKGEp8j76+jgBt034lz8+/Yk0rDRlPMzFPBDn9o/GXTUqI4P5khloCr
	FEyQt76+7yIXA8BepY63Bb6otFUepDwkqFEzLg4jnJCydrnRMLyTMTDa1cmJFhQLQUhVGySbxvsRy
	k9/l0r6Vg+zfsbUFPuLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9as-00000006uXY-3rIo;
	Wed, 12 Feb 2025 10:03:46 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9Fj-00000006pif-3q22
	for linux-riscv@lists.infradead.org;
	Wed, 12 Feb 2025 09:41:57 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-726f4410a2bso271566a34.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Feb 2025 01:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739353314; x=1739958114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2lYXt/3Bss7OL7a9qiIyaDSSXu34p7TnxlM9/4leqMM=;
        b=BxqmZGj6LlGEbeFHqErdCWDdsmSOzQhJv8yNwLLA/K0OPPv05ivLHN1lsleCJQJ1Bg
         pAOWy/V430r/3YiPIK+i8sj5/lI0IbVGL1fMfvjzRAbaOWYgfHF4zXoIvmubwPN+J1rH
         g5Rak+BcjeUkCTgSPfRwaMkLa/cliqnF35J4v4h/VVl0AQ82ScZ5itVV7iHSSeWk3z56
         YdzCP7FLc6pyT+acL8C1y4YEF1OT5Dw2vw7magzN59UZCnsIKwzKE4kf3Z/2Mqz8929U
         Fu96PiCmxcJPxTlEdodNKPJBfyThbY34FNJkkipzokhavJ6eaCJbaPdPMRxzD13PYELD
         6VnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739353314; x=1739958114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2lYXt/3Bss7OL7a9qiIyaDSSXu34p7TnxlM9/4leqMM=;
        b=cCY7au476tYjIZOeuf7DTqWsgjUMaSx5e0oynI/bT+pFTzq3oa4BVuUoh53Jrdkk9J
         EEI/OJ63NA5ucUVhq+eaDiFJJZFBptGz6HjRpXKhIEHfT+7/lptJ+fhCRf/XR7SCgZoB
         B7G3XfJQCwsGJPARZWmq1rTDL7XrRSrvOIa2s/nGpCO8bGKd/j8OV22Qq0FuPrOp1Cx6
         Rqm3E9OJGnX3QddmG7dEjM9gMMRieoyIisHN9bv5xWeVInR7QSzcsZwXBbfscOPoKkFK
         esp4gwxKxsYdIjbA4OQBsNqeD8vhv0iVIsMajBR/lahHe3Lhov+Zk8drD5sXKi2TQJse
         P8yQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG15hHSS+cxY5HmWNe+alFTXSx8mHWMmLWOHvVU/kpnKCXBiV1B8TNjfacvOtmr5rMuordUpdfAX4LfA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQqzyzF5kibiil95KqYpURvtqAvGX0s2jP7DPQlErBKGCV/nY6
	Nb1v5iHqIyKili/b9a2OsEnmnkt3Ey8d9tClw54ZnmxM0Mgei1uLO/nuhNbmXQ8=
X-Gm-Gg: ASbGncuap3oKWlO37TR06Q9Hi1GXDDIjah11EhR/qVNYHdGCErfU4niGmjndABSRoNp
	lgRy2mlNF7HtuxcZUen5WDYofsbIb5ma5L+HdjwFK+9XjmGMPCfdnkl9Z2V1JDEi5VTfv++Cbp8
	mczECmQK5FpH2LWJfgUY6SYULtjkX2OsgbrUxvoct1yHEanznegiK481771E0te45WxF4aF3lZL
	NtBfTQYfIwRRyi/p0tB5febbf0UeTnk46lhfRaecAt0VWI3lIgRco0vBFRRbY8PTw6amHgss+4J
	A7hofFMefIW8a460AkgVrY80PQ==
X-Google-Smtp-Source: AGHT+IGMUCgL6dH7JKQmunmpmXk80dIsegcySmRMCkVerehVQyr2tMV4lRmcqcwVBrmjBGppiol5gw==
X-Received: by 2002:a05:6870:56aa:b0:29e:f61:3b62 with SMTP id 586e51a60fabf-2b8d646fab0mr1704840fac.7.1739353314366;
        Wed, 12 Feb 2025 01:41:54 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b8a2ab07f2sm2417113fac.13.2025.02.12.01.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 01:41:53 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	chunzhi.lin@sophgo.com,
	inochiama@gmail.com,
	sophgo@lists.linux.dev
Subject: [PATCH 0/2] Add pwm-fan for Milk-V Pioneer
Date: Wed, 12 Feb 2025 17:41:44 +0800
Message-Id: <cover.1739351437.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_014155_965428_1FCF3A19 
X-CRM114-Status: UNSURE (   7.39  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Milk-V Pioneer uses fan as cooling-device, and speed of the fan is
controlled by the first channel of pwm controller of SG2042.

This patchset depends on another patchset for the SG2042 pwm controller,
the driver part is now on pwm/for-next [pwm-for-next] and the dts part is
now on sophgo/for-next [sophgo-for-next]. If you want to have a test,
you need to apply the corresponding patchset.

Link: https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git [pwm-for-next]
Link: https://github.com/sophgo/linux.git [sophgo-for-next]

Thanks,
Chen

---

Chen Wang (2):
  riscv: sophgo: dts: add pwm-fan for Milk-V Pioneer
  riscv: sophgo: dts: add cooling maps for Milk-V Pioneer

 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
prerequisite-patch-id: c4b7f2697276f9278f13e3f2f54669eabed14157
prerequisite-patch-id: e6e1753842784bbc41eae5917470d4abfacd21a0
prerequisite-patch-id: 768254e961eb246d230258ff33922e4f2a36597e
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
