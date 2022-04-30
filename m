Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C81C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Apr 2022 15:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SiNu6uWWFd9x0X8+NialSCXTi9SkWCCUEKSwCBK0OZc=; b=wNEZetlEKo13N2
	9OkUUy6ZOujUMIQUHMRXqFh6+A/chhIYWSMZwlrmdahwt0cK3uMGqTiZQCMXNb2201oBn141NvcF+
	br2A8A4fG9U9WaLDwsnS+xsv/G1lReQ25Z41o0x9qaGXVCLgxNCuxtnJqf8xDeKEHOVijHixHgcRG
	JuikOplczqDIUcJYEqFJAewmicR8//+xl7GKQGv1J2fNkaIxtAUu5So4sHpStsFjl2+hOeR0Cp3PT
	glmybiLHuG9CC2/GZsXF+d5xD8nJ4Q5PQzhokj11iVbADYqWDW8Lk+CQMRJGTI4MIU1Ly9xFs2/Sc
	WGRiSa4BHYWMR+YUTrvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkpAT-00EZ74-8g; Sat, 30 Apr 2022 15:37:57 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkpAQ-00EZ5e-Fm
 for linux-riscv@lists.infradead.org; Sat, 30 Apr 2022 15:37:56 +0000
Received: by mail-pf1-x42f.google.com with SMTP id p12so9266733pfn.0
 for <linux-riscv@lists.infradead.org>; Sat, 30 Apr 2022 08:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=np4HtbwGSB6iapeRruj8GZIUHuBuKuckcGYZnwyb7bo=;
 b=InNn+tkdTs6CYKbpqgE/Kt+T2kH9K4dNAnuziT6CNc1awAKVpLsBeXBEdSF55QM/8k
 udH4gEcsFOVPawephKUVFL/54PfXCMPmAorXXpszoBfjsIKvSI3jL3yHoCz/uqq1IJn+
 kVWFjf9c9lRBSJV5yXZBkvE8w4q0dL/oOu8lTnq28UsvEJQY0CH45LEYkuv+wRNYsTLP
 Eyvd+DTwR/Od3TwiXZX3NEqkZmEX32Za9+ZkVKeQEHjNlAk+KM4nrwQUJ54ndJvbu69L
 pGF/VGp+Zznm318sUZMvZlp/aR/nsxWR0vlR5TvJIrQjJvM+dt17gI1NbWJzGbD5zNqR
 3vVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=np4HtbwGSB6iapeRruj8GZIUHuBuKuckcGYZnwyb7bo=;
 b=cXuJUpwc7NqcTsQZr30oagJvnY/8GiBTdFLxRjnKwv3IV6o1zwqxEbqYLho+mcUkZ/
 m3s6EseOINmva0kVGmkdW3yjqIOH9qhOoXLTB6DclzOM75BCbG5dSNHHBO/70gQFs54x
 26iA2HRwxo+D5Kya1p9k/BVc5N4LW2LYTjjGbbA56NiBrQt41SSnVpA0jZy2c2tmGJQx
 TttipLQaze7w7FlXIyLQToKfWDtjbjwmDxuuE4MO++WinK5BeL0jKK5mSOUfEbaAQ2vp
 22jNuHVqJFsnLeJ+nJG80/OIC439mjFcWmYhaEGFdifZakJQ015vpHLm7VG+RMjJO40b
 hF9g==
X-Gm-Message-State: AOAM530NUHVLv8PyZP7Lm5769Z1OlKr0c//chKR0PPOsNfOgNg7ZeIQG
 jvn1nKR45agDfZsS0e18qqtnfw==
X-Google-Smtp-Source: ABdhPJyY6PFEoD09nOYm4tiKmrVzmrmKd1omAejHwAiMVanwvGm+TKpg7gHnHCqyfyt/42onKskybA==
X-Received: by 2002:a63:5606:0:b0:3ab:84d3:cfbe with SMTP id
 k6-20020a635606000000b003ab84d3cfbemr3521738pgb.191.1651333072975; 
 Sat, 30 Apr 2022 08:37:52 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 p2-20020a17090ad30200b001cd4989feb7sm17264343pju.3.2022.04.30.08.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 08:37:52 -0700 (PDT)
Subject: [PATCH v4 0/7] Generic Ticket Spinlocks
Date: Sat, 30 Apr 2022 08:36:19 -0700
Message-Id: <20220430153626.30660-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: guoren@kernel.org, peterz@infradead.org, mingo@redhat.com,
 Will Deacon <will@kernel.org>, longman@redhat.com, boqun.feng@gmail.com,
 jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, 
 Greg KH <gregkh@linuxfoundation.org>, sudipm.mukherjee@gmail.com,
 macro@orcam.me.uk, jszhang@kernel.org, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, 
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_083754_787643_3D88243F 
X-CRM114-Status: GOOD (  15.09  )
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

Comments on the v3 looked pretty straight-forward, essentially just that
RCsc issue I'd missed from the v2 and some cleanups.  A part of the
discussion some additional possible cleanups came up related to the
qrwlock headers, but I hadn't looked at those yet and I had already
handled everything else.  This went on the back burner, but given that
LoongArch appears to want to use it for their new port I think it's best
to just run with this and defer the other cleanups until later.

I've placed the whole patch set at palmer/tspinlock-v4, and also tagged
the asm-generic bits as generic-ticket-spinlocks-v4.  Ideally I'd like
to take that, along with the RISC-V patches, into my tree as there's
some RISC-V specific testing before things land in linux-next.  This
passes all my testing, but I'll hold off until merging things anywhere
else to make sure everyone has time to look.  There's no rush on my end
for this one, but I don't want to block LoongArch so I'll try to stay a
bit more on top of this one.

Changes since v3 <20220414220214.24556-1-palmer@rivosinc.com>:
* Added a smp_mb() in the lock slow-path, to make sure that is RCsc.
* Fixed the header guards.

Changes since v2 <20220319035457.2214979-1-guoren@kernel.org>:
* Picked up Peter's SOBs, which were posted on the v1.
* Re-ordered the first two patches, as they
* Re-worded the RISC-V qrwlock patch, as it was a bit mushy.  I also
  added a blurb in the qrwlock's top comment about this dependency.
* Picked up Stafford's fix for big-endian systems, which I have not
  tested as I don't have one (at least easily availiable, I think the BE
  MIPS systems are still in that pile in my garage).
* Call the generic version <asm-genenic/spinlock{_types}.h>, as there's
  really no utility to the version that only errors out.

Changes since v1 <20220316232600.20419-1-palmer@rivosinc.com>:
* Follow Arnd suggestion to make the patch series more generic.
* Add csky in the series.
* Combine RISC-V's two patches into one.
* Modify openrisc's patch to suit the new generic version.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
