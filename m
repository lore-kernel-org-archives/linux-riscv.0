Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164B3EE643D
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 08:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m57Yaqm1598o7NBj3Pu/X/4wTI6VXH3jM8UNl2v2VBc=; b=Ls4gelmj/wMAPO
	VGHBU9X1L/BksoG50nfD+k422wffFuGkZZd3QoPCSjHQYNWepFXEalOnovJCi9MwzfnDDvQD7kRnh
	mwazyr7hXH+s/scC+yQ+oY4KvvZMsn7FnvRq0akLSsh/HdutYSIyUaK/aTI2uui3j2uj5u6BQllzN
	yBdkxpJFx0UeV50hoCugVI+9wNllWHPZRL4zRzZP8h8vJ8nA5ZAWcObv/yTEBNMkUUqxhy5eRBpyj
	ioB54418lf8SezVhnKzISKyOwCzaxXf1uUInAgOU4FSRX9HHNEaYlAzEkSMMYDkU/6rC2nbvjbFhf
	EUJjFzi5CvduJa9OvLdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh4AT-00A9Pi-1Z;
	Fri, 15 Sep 2023 08:27:13 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh4AQ-00A9P0-2B
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 08:27:12 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1c0d5b16aacso15833855ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 01:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1694766427; x=1695371227; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYRzx0TpeDUW5Ewzu/7dcGq2ZlcfQLnv/5BiKhle4N4=;
        b=D0RhS9ytG0GEpkjVdzdzPaNqeoiZU9yYa5y63gx8yz9o3R6FB4P/S37SBSEDdfv+TY
         oieMJaT3ep84nIN5gpTE9/T0RYxqs06T5cbNZ26rECdcbULxKCwE7SDbrS0Q+QD15Z+N
         ebEJgnyy55PeQflanYoyuLxx/b1FpCUteC6tIenyArlyPqAvC9vXkEXGyLUCumJ9na1S
         JQ1jE+3eX+5fM84CUXLX11TjE09ysyAbiyMtEABL0oq3h+E95txN0KrUlMTjtXc4UQ8E
         2v1IJLzcpgfDDKca5db2KmjNwvN2g9c7WYRII+CFb04BP5hzpGCGomJwBMmxfNxEU7kK
         XdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694766427; x=1695371227;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYRzx0TpeDUW5Ewzu/7dcGq2ZlcfQLnv/5BiKhle4N4=;
        b=iV9NunRyjndAJpQS6tGX+ttv4YCUchLvOAf5KvnfSklR/xRg4+9qjKH+M2Q6yhY9PJ
         W0uoSef4OfwjGMWBUFYALJYQKmfevBn96CRrxfBFNqTwH52dLwyb6k4nTNryUTrResU0
         +99zXxWcoME1HL9B6AU/WsHNQKx2mCAt2A0HcJqZ11IakNQpL8oett+tHbiWRpwbzjCj
         BkUbEUCGcGMc5zc2rCAIr8OVY0P16ivKTRB80JLsAkflgKqB2tqPLhrZIEflhAvkeLNM
         X80gs8cV4MRhUhyxOXmvJda3b8wqlR2zxEOTJX6Io5cWWhGHE6QP0p0w98USA5tYlipz
         Bw7Q==
X-Gm-Message-State: AOJu0Yws+8/95STzTe8KknTXNnOalCok7kXDotZdMFyLafjEWVfB08Dx
	0KgJvqIsbCxutKFH7Q9kEM+PepWMr8dg8uthYzYzqSb4uJzzVfTMEoCLMYB6hOGjPgnvRkiMY3B
	S6zU2EKIpTVWXfEkTCIIJQyII7wrSPYJjroYwxjDFYN6Yt1HbDLRkPkAcPRZGC/NwYf2bPvPEWL
	XCYSllpOKXOnsF9VSWtS6c
X-Google-Smtp-Source: AGHT+IHX7s80HWT060hr48wi6zOOLu7vZJwDey2aUN6hpbBjoWBv/hTeHAP0hHwrC9hWLYtecqb3tQ==
X-Received: by 2002:a17:902:db08:b0:1b9:e9b2:124b with SMTP id m8-20020a170902db0800b001b9e9b2124bmr1151862plx.64.1694766426557;
        Fri, 15 Sep 2023 01:27:06 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id f4-20020a170902ab8400b001c0af36dd64sm2912806plr.162.2023.09.15.01.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 01:27:06 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	tjytimi@163.com,
	alex@ghiti.fr,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 0/2] Add Svadu Extension Support
Date: Fri, 15 Sep 2023 08:26:56 +0000
Message-Id: <20230915082701.3643-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_012710_711062_4A090FF7 
X-CRM114-Status: UNSURE (   7.60  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Svadu is a RISC-V extension for hardware updating of PTE A/D bits. This
patch set adds support to enable Svadu extension for both host and guest
OS. 

Yong-Xuan Wang (2):
  RISC-V: Detect and Enable Svadu Extension Support
  RISC-V: KVM: Add Svadu Extension Support for Guest/VM

 arch/riscv/include/asm/csr.h      | 1 +
 arch/riscv/include/asm/hwcap.h    | 1 +
 arch/riscv/include/asm/pgtable.h  | 6 ++++++
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kernel/cpufeature.c    | 1 +
 arch/riscv/kvm/vcpu.c             | 3 +++
 arch/riscv/kvm/vcpu_onereg.c      | 1 +
 7 files changed, 14 insertions(+)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
