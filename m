Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B224BC3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 17:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zPQA0Su8PScRypllarmQKVfE5O5Da4Ik7DRwXjxAx2Q=; b=zQBuLfhUTWlg7B
	gb1/JMiJpNX1ESm+6HRoY43EwV396qNSbG1l/rUel/faPd3dahmbN2HlF/YqONvvE5QwBvvJS7TKX
	m3Tm1uBRv+JGXOZVerYMcVY8trmAwIaItiY0641XrMeSBkv3WYO3ycnN1w9M/lPkA7RhU3uSuU7al
	L5Y8Z+QDGz9BKnq5aSbd+7L7lxzvzKP+Jk6dSydJWvmgwKm0L/pC6hl3ssThaMO+Ta5g76i6jcd0l
	2glRTqKpfz9nT9dj345r+cIa/DLEMFgGvl7qvNHmzXiygr7C1F/OUKHMqj/aKnMEoNrBXq3ThfQF7
	Cue6GgpKpIUhq1KdWaWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb1fE-0000000GihU-3O8V;
	Mon, 05 Aug 2024 17:38:33 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb1f9-0000000Gid3-2Rm2
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 17:38:30 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1fc66fc35f2so41595055ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2024 10:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722879506; x=1723484306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZkU76SoGtSfmnwPfEEw88qwH45x7O9KVsPVc+U7f04=;
        b=EDneOA6zDGY0s4qY34fVv0qDop8vj0f4Vy6gGxKNtR0QCh3sS2t7jgUU06zqzUqeVk
         PwVGax7f1SrnRDMLOUxI3rxhhjYDLyGb1Y2BNDw3hAc7lWCo5erFhkDANahaoEHyNnRr
         ctBR971Uu1XXqXnnbIWg0zvbYikE+q3RT9t8t6tfd2nsL6wipC2vpdaiWcdaPnMoBmP7
         peYufAwpvXAuhZXGO1JoXaQH5IUyitH1d1pBFJAuUp2rV8XeCTvlUvxj0uZkMRurEI2y
         MWFSZvipMJhXr8TtfN15B7vhKeDsJSq2OZ/Yth88t9QJg9P37HrF/gVx+qqKRzLJ/I/9
         o4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722879506; x=1723484306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZkU76SoGtSfmnwPfEEw88qwH45x7O9KVsPVc+U7f04=;
        b=YgU5RwucfvbDcHabzCgNCOQ4xypxWTANPR20hvn/Ab7YPWMQmZRQ89BfOsH/kXIkr8
         0J5dko5xrF7rMk9ClI/2ruh05cR6VAAPK3+x0fK9P/xzoDDr+UZ9CTzST+tU3gYnpQDw
         NV5AMFLvd/Wt5OGLDd4L7u7USmbEMQWwlTEByX5iwjXHbC1Wbayv6bxVlBcOFaNiLLXI
         Zc6GBt0fkEauMuT50g3OTLGhInfjw3ntjYLbu86ax46HySlhLwb969tlsHf7Cpw9n6Un
         fjyCUM6PNqSi6MB0STo8sJvH8gDINLWThhqnpUMWVyuXbwX80ZvXRQmRDAlV+7bleuHu
         h+Mw==
X-Gm-Message-State: AOJu0Yzm/uoVv7RcgyTuwUzztoKeUIwAQ/SbjVH11wCz14/uX9LNNOxi
	oxW/BDc3uME2kjuGhQ93ItEjpB1pAZsK/yETPrk2rS4GaL32B3RJwY5wPBeyzt7iZaUOhUy/z9G
	p
X-Google-Smtp-Source: AGHT+IHhD7ZA5U9zNGbfmuHz6Kc73fLM0dyk7QDOl15u9J4kpVy9BxqJMA6+3ZrOnp9i0Fr8cg59Bg==
X-Received: by 2002:a17:902:d48f:b0:1fb:9cbf:b4e3 with SMTP id d9443c01a7336-1ff57ea1a8bmr218560665ad.22.1722879505996;
        Mon, 05 Aug 2024 10:38:25 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff5929407asm71128435ad.242.2024.08.05.10.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 10:38:25 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/1] RISC-V: kernel parameter for unaligned access speed
Date: Mon,  5 Aug 2024 13:38:16 -0400
Message-ID: <20240805173816.3722002-2-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240805173816.3722002-1-jesse@rivosinc.com>
References: <20240805173816.3722002-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_103827_822979_AB9218E1 
X-CRM114-Status: UNSURE (   8.15  )
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

Add a kernel parameter to the unaligned access speed. This allows
skiping of the speed tests for unaligned accesses, which often is very
slow.

This patch requires (RISC-V: Detect and report speed of unaligned vector
accesses) to be applied first.

https://lore.kernel.org/all/20240726163719.1667923-1-jesse@rivosinc.com/

Jesse Taube (1):
  RISC-V: Add parameter to unaligned access speed

 arch/riscv/kernel/unaligned_access_speed.c | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
