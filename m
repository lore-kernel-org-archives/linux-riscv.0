Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB85C7EE23
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 15:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fIHZnlA3+UKnCyRiuHa18BkrbFCweBbChddIrC77k0A=; b=av+GOoYXstVrM7
	dYjE2gge5+SrTKMZl8y/K54hTtu5c6UVUYD7lE4MYFMTgi2J0ueGXC3w8bl3gBV0bujyaEt0wFiXb
	+stko5mCrWpj1mTj2KfN5Y3Uv977+47GcqOLQOzOsiZPJvg1Pw0Jjltr+4+ltmSgi5W2d9Mqa35k/
	4V0g0eVqV7X0HwT8ROTwUkZOcVIXgZCUzJP2ST9NYQly+SVtftWbV72F8mVIVfYGVKRkDcwJeyF5K
	HV8NWqo5S9eCNdeDPpfFR4gkCzUNN9Zha9SsMM2ZO816NZvEtvuXjtSV1dtOVt4xrzmwW13a7ZQxI
	TNiV6VyYjdUFUr9WR5Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CLu-00G0k8-2y;
	Mon, 05 Jun 2023 15:42:38 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CLq-00G0e4-0i
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 15:42:36 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1b011cffe7fso22521995ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 08:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1685979752; x=1688571752;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GbKkWHcrIgmeU53Vku19x3Zfwadjf8vHA4LYRH5wmCY=;
        b=Fs+iSAQ26EuErgnKPEjcmBTy4eNZK9hqe+pb0SH0SZWFh8DPByC8+H1iiEbnYkIaKh
         eZjtX0qRh82RKh+ELSEojK5e65RuZ0CKZTsesRGER5bDwHdsZn051qdpkMQbSvgH+f59
         pcAIgMJLnxHQifCdBojIgeb7wpbLT+18TMbA2qZGD7LkeChlgrW4fpJehmY/CyeeDWaF
         QAsCNdIhOot2rzOPWyzSZfZLr7ja6J8mMLthqvKqwQw/79XsaMm+7rtegqT4KkjBskVm
         iuRfRTQtIgDPQM0BQPedH2seS974wyDc5B0HR6WzXy9Le4CX2cWubTgxhtCLHC4NFibP
         gFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979752; x=1688571752;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GbKkWHcrIgmeU53Vku19x3Zfwadjf8vHA4LYRH5wmCY=;
        b=bUOeezsbg8VjinYEleKlVIu5veYk/DIWym1RD0iuee0u+SQfjiPKGMkRTsCpc8w31m
         npuyVaaaz1bJ4Ue1/Y1GJrh/xbrwcdPYFvhCn1trgJ4iC54OFYF2jsQrK0y8lDp0fltI
         dMzrtY6rmMcocxYex9volIoe7/ZQiaoCNogu+3QRfHWwWwNQ3hpFXvwdPoCN28Hxgup9
         qIb+KFG3uyLR4hrgo3b8RGnpXlihZhX6HDkdjm/Ia0jC4sawoaEGC9Bp4fv04l++rOVS
         KfWZy+WpA1lJP5ECSWKWoMOG6nXdJR7covaQBSbZ0bUmigDNFMUppns4+JkMVLFdBBvr
         mHrw==
X-Gm-Message-State: AC+VfDwKP7dKfL6PBfw3Nfk7WxVIKidogJXRiLbfd7L8X03n5JcKOlFo
	GLPtw20k7QMeEhLv0Fik3IaYzq2JxcrmdZYwQk8M2O6HGoZLKxPxBe5FLKkpjDcDTMVu+mdLk2N
	MoWZrBIhGI77l5RXP100Guxdmvs7c04pUqqKv9Ts6tpfjFw41jWdsAXPHuZDQFJzzt3197ROegE
	lnpKJzVuY4/RA9IAg=
X-Google-Smtp-Source: ACHHUZ7S3X2JsL5hHF0bKLSbGHCJWcERbwDqGTA5uH+49EFqOOvFm/YH7BsXtElZU5mUItovy54HgA==
X-Received: by 2002:a17:902:e886:b0:1b0:7c3c:31f9 with SMTP id w6-20020a170902e88600b001b07c3c31f9mr3863001plg.53.1685979752011;
        Mon, 05 Jun 2023 08:42:32 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id jk19-20020a170903331300b001b0aec3ed59sm6725962plb.256.2023.06.05.08.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:42:31 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH -next v21 27/27] selftests: add .gitignore file for RISC-V hwprobe
Date: Mon,  5 Jun 2023 11:07:24 +0000
Message-Id: <20230605110724.21391-28-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230605110724.21391-1-andy.chiu@sifive.com>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_084234_261422_A6A8859F 
X-CRM114-Status: UNSURE (   9.62  )
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

The executable file "hwprobe" should be ignored by git, adding it to fix
that.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 tools/testing/selftests/riscv/hwprobe/.gitignore | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 tools/testing/selftests/riscv/hwprobe/.gitignore

diff --git a/tools/testing/selftests/riscv/hwprobe/.gitignore b/tools/testing/selftests/riscv/hwprobe/.gitignore
new file mode 100644
index 000000000000..8113dc3bdd03
--- /dev/null
+++ b/tools/testing/selftests/riscv/hwprobe/.gitignore
@@ -0,0 +1 @@
+hwprobe
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
