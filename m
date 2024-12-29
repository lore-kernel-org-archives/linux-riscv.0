Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13A4E7718B
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Dec 2024 23:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LvuTXJqyvD3JhWwHkgcu3FhEUVoUzXhE5OlSuHIYGSk=; b=zS4LiaKNmNt4HV
	qJOM2w2b2yCB4RW/yQoc8razJ5IZSHbyM6EjJgBoyAIDZpIaoTxASZoYyRwOgMZuXIdg24SKbtViE
	+UOL7p0gTFFHt8QKw1Oi2q7xXzpTi9+Vf0ZVXQf/WY7QA1ldmNjzxLT1wRxAEiYQGhqb+xEUiEycp
	elO84Ninlp8JCqoIjR0EY3KNcQFzEGjrMQTYR86/ayPVwAdvWdV4MnAUa1AlmVVvgVHs5wa/oJ9Z5
	DyBZGC4Md3cG1y5LssN+IQMOb8JETBBLWNvR2LvXET63Nr1HnsPizSCSiqpDGajKtL59wTlwRXGEj
	+vbDPdHuDGe8Ve0V/BzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tS2iC-000000045k6-0aG2;
	Sun, 29 Dec 2024 23:28:44 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tS2i8-000000045jV-2RmX
	for linux-riscv@lists.infradead.org;
	Sun, 29 Dec 2024 23:28:41 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21661be2c2dso100585445ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 29 Dec 2024 15:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1735514919; x=1736119719; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Umzb/cpVkBSMsf5TuOtyuUgveg3g8v8YPbqtINmhT0k=;
        b=jku5t5ve+zVxKwF5g/HkN/RpO2S2FEQclg2IueGtak4sW1UYaGkenqACvtPseoQjPD
         kKZt9sUbssgGkkw2sKM8iA6MlW/4gYTOH0ceR+b6botxnDdF8u8bQ47AIum1+fRyHSQS
         I35gN8UMahU+D2dY2whV/9EuWsEYg35I0CmPbzTkOUJ0JTpVXPwmHBboKHTNyVmortNP
         xK4X3bC3GjGLqvvtDcDSll8mBB+uC1jjNNFgT6VVK4LMR+vFfkV7FBw8p6PL8qXOTCO4
         T1Zc5WJU6HUnShHOSfN0cDS5/+ZNDdgym/oWX+XhsT/cViwyVLNQKu/Y0nD4u4mBjPLI
         /3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735514919; x=1736119719;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Umzb/cpVkBSMsf5TuOtyuUgveg3g8v8YPbqtINmhT0k=;
        b=lsvkF35oUFvHyEhmmxjO/1lto0A/2IjXCx5Jh7/hgaglpf7xGiut2m+Avzmu9HzKhP
         orWqFsbuNe3AdLVWzL2FlxwesyBMkeFJHM4e881iKFsT8zYk6yNClxVn+2DlH35OkhGZ
         iRHcCo5krsMvuIJ/CQeIluEu5pQnip5UA+S8DRvqZrUwnDK7ruvSMCjQUJxUkrjUAmfw
         gGVooJHxhUn4fyK/7fBK7u12/nm4b+qghKC4FicTqS2+jdf5KmTaIkpW/n0eDkv+Xwfo
         wbtiFAd2jTw50ffC/uhPYypcpAz6VUq9tfNYV3JE+ORAvU1o0mxKVhwCUp8uF7txSTsx
         qrqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWICAOBAyqc9hzDo6a6MBXUR0sM01FvX/YJpgVHbMX/ZtjtXeB+BzBiSziNk3TqmaS1WDMpMIvDyN6yCg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKYiWMSp92VGIvGiGR6p8OfU0o9a0VUwSanLtJLQvVhZsswJxY
	RJezQd3tZNe7Zp7X6pRxr/oRmigIXU09TvfaYDhDaAJ/iYay5+emfw0gzETaN7w=
X-Gm-Gg: ASbGncu30GCeTpWxwYNyKUvHwK2aRAsBUYLECFTzZo10OodZdi0fYUz8LnrDaQhHQov
	quc96Q9rmTYaDkb+/w5Dl/jdYuH0zMFtBBnA5621flBibEtX0PNnYO2ip3xQVmJ6n6taObmJwTz
	PhgPW9kOUgG0tdUmXg0xKMIPgphd85YyiLmmCf3Ml1wfgHwHCDaKm9tFIQ1eszQghydaqMiGXOT
	+gyIxSwEfGsDJfmwu4o6AS2IoAIKvhx3s8W6O0YlyLzDZ1cGL+kcKzBV7zA5P4ZRg==
X-Google-Smtp-Source: AGHT+IHldvMkQufBuQX10YCQFp+ijImIhHav6sI7E20XU6PffBB8+yEkV3TBxa5dVe+iW9flE+V8GA==
X-Received: by 2002:a05:6a21:3989:b0:1db:e3a2:ea47 with SMTP id adf61e73a8af0-1e5e0461d58mr55130767637.14.1735514919066;
        Sun, 29 Dec 2024 15:28:39 -0800 (PST)
Received: from x1 (75-164-218-15.ptld.qwest.net. [75.164.218.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c133sm18592573b3a.183.2024.12.29.15.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 15:28:38 -0800 (PST)
Date: Sun, 29 Dec 2024 15:28:36 -0800
From: Drew Fustini <drew@pdp7.com>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V T-HEAD Devicetrees for v6.14
Message-ID: <Z3HbJPwZB+siJuAR@x1>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_152840_883550_5AC4F2E1 
X-CRM114-Status: UNSURE (   6.72  )
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

Hi Arnd,

There is only one thead device tree change for this cycle. I have run
W=1 dtbs_check, and it has been in linux-next for over 2 weeks.

Thanks,
Drew

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git@github.com:pdp7/linux.git tags/thead-dt-for-v6.14

for you to fetch changes up to c95c1362e5bcd90c45987828bbef02236d181ffd:

  riscv: dts: thead: Add mailbox node (2024-12-12 20:07:16 -0800)

----------------------------------------------------------------
thead-dt-for-v6.14: T-HEAD Devicetrees for v6.14

Add mailbox node for the T-Head TH1520 RISC-V SoC. The mailbox bindings
and driver were already merged in v6.13:

b2cf36e4a2ac ("dt-bindings: mailbox: Add thead,th1520-mailbox bindings")
5d4d263e1c6b ("mailbox: Introduce support for T-head TH1520 Mailbox driver")

Signed-off-by: Drew Fustini <drew@pdp7.com>

----------------------------------------------------------------
Michal Wilczynski (1):
      riscv: dts: thead: Add mailbox node

 arch/riscv/boot/dts/thead/th1520.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
