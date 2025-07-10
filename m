Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E61C83F09
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 04:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZCXnSAv1wgExjQq4EbZuHopDFnyG7MeVmbQPIwkOCQ=; b=z5Hf3Gn6armGSZ
	lAEDT1uOake6KQkr4dZra7FgXzSxq22nJG7YZXbPYJ1dph5OrVGE328XlTw0mzrv6pCzOZQcslb/0
	YyfPYKttBy/Nxy0iI/+cCzZK/W0ck7dEbUFLu9l4ruwpJJcI/+p7OunErtscwSepaYA2v5FF6RB5W
	gM0+fynlJbsZYWzDIRzpnmMqPQMeFVoBV1syKPSa9y9R4GPBeHACVQDjuCQYgPNlrdz1ATdb/OESx
	bg5P8p5YVFKVDlgNLMk1YZrlWH6hW24BsVq/Wk6KbsSHdPtOfFtvlg49CQa0YWDInzbkM7NDKy8f6
	cMoMc6Rh6nuSUkpf/3Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZjF7-0000000AgM0-0usm;
	Thu, 10 Jul 2025 04:50:45 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZjF5-0000000AgJq-0wLi
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 04:50:44 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-747fba9f962so594985b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Jul 2025 21:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752123041; x=1752727841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtylixEBzO6jEVKuJIA6FfcGiADPfp9pum3boqegUFg=;
        b=VvMFbTH+2LfyLZWkX2srqF6QTCgo6dSdVSIsN54nkrOwNU2YGKdjv1KBIeMDp64Rm5
         yv4VqJaUS5f2rwk7D1k67uEyHXJkgFyw8zw76VeA2Y/SbSHdMgzi0NSl6V1aGK1UTWwL
         dyN63ddWQSnjRjWMio/Qz+lDz5m49a9LIQQR9m0jPyxc6Hu0AqP01JE+9hY938SY+XP9
         nJjwHrBDBvNyzxqCTFVE2eT/A33uXa0XrJ74PKX9hvL1j6gFc6YXhs4R+BTICUbZXPqW
         EPWxbBhPIy9j6A+yRULkzfK63hKLlC2kW3yJmLL+tDNomcyQtIAOU2E3jbCA5Zttvpyd
         jw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752123041; x=1752727841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QtylixEBzO6jEVKuJIA6FfcGiADPfp9pum3boqegUFg=;
        b=gCxFa3zTp8cnCUdWzdEWlgydCElkst7o7FVg1nDy0MkvzUbZacoMHN76Wct3N6I0x8
         d3XlSphca4xzl0FwQ9TXzRhFaH/PIb3TjZNvx8w94zUnuwK53xuCL7dHOYlV+o54P4kv
         YqKmWmsTBdY42eM33UHJsPySEYr7JO5kKaZt63FQ0ulAsPMUhP88aQQOLyGTzFeB0YzT
         LrNUl1bgV1JfNzLb9tTddYxC5GRC+QMNXgTlnJoRCQOskRXge+U6Sj7A5bKq2/e5qVRD
         mlKJUUrA9LJqGv/lBDu6vEaxuHgO5fx/3OqjVT0S/zm9VX6pfo2S+LGX0b47tmginlXT
         A6OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnmB4qZIwP/d5zRQIb6EI9+WrT9kMQ85tXeNveaeZ28jKaUAoemVw4j2UYCCByHG4QBGPl0cTWpnEbaw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/4clm86Mb9ZjyRMrfB9sxE3WqAQfcQNcUrIcrYR80zRqclBHk
	SG+nE9VR2olEFEiYmtAycEWj14h3p3mOyTqdPtiDnAn3q7fdzDgwIl7B
X-Gm-Gg: ASbGncttvsQNNYbjN90eqaC3Q/NIekvpiNWoLdbEn2J9HxQRaQIdGrjoEcYRfUqsiMD
	yF1peb9swvk7YNN2tTIcSm/FpTCezkGOwpRz4UNYKYf7EKheBxXYuD5RnzH9ryztGOC+UsQLw92
	RNMj0zgSZZDE9U5kysT8ySxi931ycf4VCrDW1vZKl9xOgA6mDe8PNUCEin6ACj4y/wuwwZRHE+0
	B6roO+uZ19sm0jAlHHvUzBjerD6ZnVPYjBQ+KowVEN4Spo/XYEkyOnW/GrDKauYWfyiArFaqd08
	DYA+G+iv3fozEvorNfJlosoZzfbJ6ZHVAB0EC4IbDMIJu2DT8+9frlsRypcV9A==
X-Google-Smtp-Source: AGHT+IHfDnnUa2iA/+iDRVSfbCQKkD4uhYVOacst5Po2qnE6YZro0V7CebitFaQ5OUOy24k6W92kxA==
X-Received: by 2002:a05:6a00:7595:b0:74a:cd4d:c0a6 with SMTP id d2e1a72fcca58-74eb593d16emr2726286b3a.5.1752123040554;
        Wed, 09 Jul 2025 21:50:40 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74eb9dd7341sm854848b3a.15.2025.07.09.21.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 21:50:40 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: devicetree@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] riscv: dts: sophgo: add more sg2042 isa extension support
Date: Thu, 10 Jul 2025 12:49:47 +0800
Message-ID: <175212292372.416883.14744071473341461158.b4-ty@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1751698574.git.rabenda.cn@gmail.com>
References: <cover.1751698574.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_215043_276579_06356E23 
X-CRM114-Status: UNSURE (   6.39  )
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

On Sat, 05 Jul 2025 15:00:11 +0800, Han Gao wrote:
> Add xtheadvector & ziccrse & zfh for sg2042
> 
> Thanks,
> Han
> 

Applied to for-next, thanks!

[1/3] riscv: dts: sophgo: Add xtheadvector to the sg2042 devicetree
      https://github.com/sophgo/linux/commit/d82362d92328c5391312df3a948077f5d651b598
[2/3] riscv: dts: sophgo: add ziccrse for sg2042
      https://github.com/sophgo/linux/commit/df5b30b7feef4a643e36fac74fa0e45c1b9f105a
[3/3] riscv: dts: sophgo: add zfh for sg2042
      https://github.com/sophgo/linux/commit/3eefd8e961cea639370df96b6553a52f638e02e8

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
