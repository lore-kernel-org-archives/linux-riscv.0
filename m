Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E65CAC58E
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 18:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4e700PnSzHqh6Iy+XyYqCJ9gqu7yhFRQOXs6hJlNSOE=; b=DWQvaRbwblYCqc
	MX/5qQNpQaiqLhyYA45eqSNvvbqi6TOCfEPAGrOrmdDNDseto8D6zzYgLqpX+/r7y3Vx8Wd6EWwq+
	s0SbVepfQomJvUTWGHBBhuxmrB2OcFBE1VhLRb22ZCT3QNJYglZfpDRIlD+9dMUd7KinO5/OpDzZj
	f5s8GBHRlHOSKwWaAKIiiGXAz2Yxvr2vUk1g8SuG8oaX63xxf8cY3CcV8jZ6/BUADtlLKLZXRXz/1
	fhc4G/0XwWB93UMkvDY+5+NyVl+GrsCXvYjSjs7T0Ah/tREE+wrpPJc0kSFQDkLkCdZoMQkDe8G15
	rf5+U39ohU9je5/yBlpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwmIv-00000004oWR-01N2;
	Thu, 11 Sep 2025 18:45:57 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwmIt-00000004oUt-07p1
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 18:45:56 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-772481b2329so1268472b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Sep 2025 11:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757616354; x=1758221154; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zac0gA5hNMKVbpgn/Yg6guyOmUi0xcryzjiA7m1Jwg0=;
        b=UxslNMLzCwnvXlJods6IIt1svOYEj+RyzwxEEcs+QB93lI2WGCcQv3Y3biGjmNET9Q
         khndSCpLmLaaGQOJqQrst6oFLZ/8kzkCGLiVRhUiUsfOpbKoFe0qm/pSzLlbrIdPRT9L
         rAiVjDjqprPqSZpnFjomIATOqgEWYXMqTuzeIkB0O7qoCnooZYfk2Jg1Zl7Ca4o3cbCA
         02+O/2v4zHC6xEdh30Mm5JGqrWLEW2y4+TwEObFL+wVDzXXb6VsT6gZ9xkVXaV5+jdUM
         +gAlzB0YDgUHYv9Xvdt+8QQmqnRddOH+fytxyUDxYVK/bsFrPO4hjKGXOrcd9EwpGH2m
         rjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757616354; x=1758221154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zac0gA5hNMKVbpgn/Yg6guyOmUi0xcryzjiA7m1Jwg0=;
        b=qiqpshPtr5c/qiSskxD8eapSzTceEFpHWYeUhWxteUTMgyanRLH8zfmr5HYWiM+LAv
         zh24FRAMIu/C2mTDtLL9VhlBHJb4iqdGCO7diuAPF6nyL3iW2hy1SXN2fk1wa709Rvvd
         S/YN/XrQVBQq+EttniUwjuMHZgucnTBDc9z8M7+xVv6MsQtAMPCdSsuVoEN6Fj2x2AsZ
         UAO3F42PYQVZdbc8P/TYpVEmL70NKV0lMG7vwWneEwIpp/VJU6QT1YCe3uIUKSGyENLc
         dicEePXevvS4QVJHY/6iKdcFEfrdnHIbcIyMrQSl0xkQkYe1afu19gOaHwL0uyz/Sak8
         KmLQ==
X-Gm-Message-State: AOJu0Yy42pTj1k16DOJKEt5iiQVxPkj6ohKuftFjGG0VryXUoatkK6Wz
	oLkulrV1gmTM2/QqfyWq+7hNqOl2/Vn6AXi/czix0uPj9ff0qoCgaQs2
X-Gm-Gg: ASbGncsYDKo/zx4ZyGl6rAJQwAEzOwNmeyj+/IKRjlRBA8A/JscIm9c62KJ50fWzZ0d
	bxCn94DcmIRGW+PwxLrGUcnpZSce33oucCGFloAzH5Nij1LjK2KjVX3udJ0OK3nV/sDCLGkcOs5
	vE6nTT78ldeJUiwQjLLSw/95Tvgv0wvcQzleVAs62sJVm7BltwzSB8u8tNR5fVpBdsHUWZteE5a
	hffVWQwanR/EN/DgdQ8UhDpVp0ZAFKVimcy6miZD5RedQRkfs/2PfLpNFfeEWpIRwMrBzHmwYX6
	MZz6AKFDuyfncEeP1N/9wBN7hrOYtfWbQvPhwRpClPTiqx3hoimv9+8ZwEcsCDSNrYfJ5LRDFdm
	yjVdTVneCIwRbqt7PTnkHTGYUEF+jegoOahR/aXNe/16n95KjHDTWmDtnESMf5sv8inao4CGRLa
	Ogv93pqu5+C8hjTlx0X5P+Tg==
X-Google-Smtp-Source: AGHT+IH5VlnojxWoH8JIuuaFn5H79HN4d5aux1SvTMyGC3y//bGWrfCGI5TTIL0/XlPldxFHDOB0Mw==
X-Received: by 2002:a05:6a00:1389:b0:776:2e3:a95b with SMTP id d2e1a72fcca58-77612064904mr567574b3a.1.1757616353247;
        Thu, 11 Sep 2025 11:45:53 -0700 (PDT)
Received: from localhost.localdomain (static.148.173.216.95.clients.your-server.de. [95.216.173.148])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607b34790sm2762616b3a.81.2025.09.11.11.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 11:45:52 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] riscv: dts: thead: add more th1520 isa extension support
Date: Fri, 12 Sep 2025 02:45:25 +0800
Message-ID: <20250911184528.1512543-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_114555_069217_D3E6C1D3 
X-CRM114-Status: UNSURE (   6.99  )
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

Add xtheadvector & ziccrse & zfh for th1520

Thanks,
Han

Han Gao (3):
  riscv: dts: thead: add xtheadvector to the th1520 devicetree
  riscv: dts: thead: add ziccrse for th1520
  riscv: dts: thead: add zfh for th1520

 arch/riscv/boot/dts/thead/th1520.dtsi | 28 +++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
