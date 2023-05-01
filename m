Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15283C77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  1 May 2023 15:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P/GWb6HFOnI0lBef5EON1aR2slcZWiEa+Hv02rz5Ono=; b=GA+pW2c7ZH7Plg
	LfLsAsfsxUBzCLCfvB+IQZGC4NnmrWedcALYmrJBQiRz938sm4TGQsgeX5TzyHQ4no3cFsz+y/KS0
	0VYq+/vH2Y2XkNBkvzUG6fduxvrBHHPLwLkc9hqo7G+n7KCISjq6tWyJpOxaXMT9GeR5UmzesyDID
	tpp9izheVVqPqwmP5MEQ89H2jCLGVhOeIsRS/QJuSQ4Hwm9gE4MMN+LxTAE0+fHeRPGBUr23z9lhm
	5cJohkq/J1UUg6+5ETbY1dJvlwMlYADt5V69ryuDWVJj7GXsOCt968KFpdjm2gKm7VYVzKeEec16p
	dBusoYA8eJa4+9dyporg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptSo0-00Fzn3-1V;
	Mon, 01 May 2023 12:39:00 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptSny-00Fzly-0Y
	for linux-riscv@lists.infradead.org;
	Mon, 01 May 2023 12:38:59 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-50a14564d17so39255292a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 05:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682944735; x=1685536735;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xJc/FIv16Z5bKlEeMjq3JH7jrMiztUQ6tRChXDQSURU=;
        b=oKFN/r8uKGx9Dr4DETHEAj7XJds+1Bkl9Cqn4Z6CQQSxDowYbUKPXMMW3MeG+X8FYo
         fBbtsDIE6lZ/2kRnHPaVvNFwGmN5R+12wlVOtMs22XZvF4DeqmQ7ZLHPROSNR6NOEBIy
         hQHlXVgw1kAmIgV931djagKU+oBuvB30KXM04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682944735; x=1685536735;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJc/FIv16Z5bKlEeMjq3JH7jrMiztUQ6tRChXDQSURU=;
        b=e6LtofbJPfqiv061OJGnN/WsuzmFizAYbRweXe39sMCHAn4n3bmqERyUHkqPzoxRcL
         TZUgIX9EUJhTYklkLCLzY5smodqoJ+5qow8QG3t9QPaxBJhw7PiJUFiwttC4XXXQTMWI
         VIOcRy4ui+N+Pnw61dSSM/sPo95FmAg9p1hhU2Ovq5/f408ZHETW08FM1PWXevAjC6s3
         pxti2615676GIXv2dazmj9c2yvqNVRJMU92m5VJlJFdI9ndjcAB+ubogds0YjxyaVVt3
         dDGsrKo/qT3/lxZkZnlHIjr53J6wn7X+DsyL44HzjmCvucOQ/c3o1yx4/6tiWJ7bZ+Ah
         NjhA==
X-Gm-Message-State: AC+VfDzxfHHTeYAR2cWkqvIlFI82f0T4UYivDpCJ017HZkErKgMOc1F2
	1TN73tTtCzHfCGPb7d5F6TEFiQ==
X-Google-Smtp-Source: ACHHUZ5dy1t28pTgAv9ZewhiQXtL5zGnuRNOu5Z+CKjak1xPicSHjkyOJ9snAkywki500Fps2M3Y7g==
X-Received: by 2002:a05:6402:4413:b0:4af:7bdc:188e with SMTP id y19-20020a056402441300b004af7bdc188emr6406640eda.16.1682944735175;
        Mon, 01 May 2023 05:38:55 -0700 (PDT)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:c573:159e:712e:688b])
        by smtp.gmail.com with ESMTPSA id c8-20020aa7c988000000b0050bcbb5708asm146772edt.35.2023.05.01.05.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:38:54 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v6 0/4] kexec: Fix kexec_file_load for llvm16 with PGO
Date: Mon, 01 May 2023 14:38:18 +0200
Message-Id: <20230321-kexec_clang16-v6-0-a2255e81ab45@chromium.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALqyT2QC/33QzWrDMAwA4FcpPs/F8n922nuMMhJZaczSBOw1d
 JS8e9UeR5aTkIQ+Cd1FpZKpivfDXRRacs3zxIl/Owgc2ulMMifOhVbaKKNBftON8AtH7oGX1oF
 CbRLoBgXPdG0l2ZV2woGnpus4cnHI9Wcuv68dC3D4/I9bQCrZBh971BjQpg8cynzJ18txLmdxY
 mzRu4BmIIEilxyE6JsNwOwChgHXK/AYk6IYNgC7C1gGwFjlIPZNpK0L3C7gnhc4b7qePwDB/AH
 WdX0Ax4+WyLYBAAA=
To: Eric Biederman <ebiederm@xmission.com>, 
 Philipp Rudo <prudo@linux.vnet.ibm.com>, Dave Young <dyoung@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Baoquan He <bhe@redhat.com>, Philipp Rudo <prudo@redhat.com>, 
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ross Zwisler <zwisler@google.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Simon Horman <horms@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
 llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1858; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=GVJi+03Xz3YcKIs9vohmPUDUq2YTUUxMRlFdBxq2C24=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBkT7LAFLlAuOy2Pigaz4i/nocmi0AaG2bDBwCis
 1EE/BR48JCJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCZE+ywAAKCRDRN9E+zzrE
 iBVJD/0bvdaJk33Kto6cW3Qh7bkAyMST0SlVrSVNNRzCcHkU8OMpa7+OaBEM6aylG0KK+gBpSC+
 9M/aU99yVviz/wK8tmypnptMZYvvfeVNiQeO93KdPzYmUZTepOB54/pajMpWdXzgXYnQD+5fVJj
 XS1Mg4dxUrfaWd9jTaMg6bMPcw4hnduHVIUToP1960WZux+4iyt66qBkHDTUhEe+4aLJdIPu8y0
 TXEFshDvlVqy/6h7WqW2Wn9X038Lecaf2Cb+vKG/dtcFncw1BsXiCUe+Ny7zQhFXCb+9f3XeamD
 VVWQ8RhWqq+IsHt/LUVH0SWBcwegONn8/OA3jHsAfFQY9s2iYABKgoBbDzq7QuVR4DeXsS/B8kd
 Je8L101yFCiVa6aM7T/iN025l2Pr0M6mSxPsEZbwbXYUnADYf4FjlVcsvSiBCQghUXRcE7yb0zE
 9s1uOFvgW1Tmn9KJTK5e91CRxAKAz5AUF/fiqJYtGJuXhPypDbO7xrVcHx2XV/9/KFsCVAWCFli
 izkP0mT4SSvRRjga1EF091s9YDLMxKe287MF0LcOdNASLL8QmYbIG4Nk2KJcqLUx7RR/UAzd6LI
 mzp4oKuDvSVn1XPWMnSidoCM4GInDmiQ20x5trgZ1hUVyat2PHBgU0I5SdzrjK2gYZDAo/Q8/4q
 9iNvZ9J8J2WbZpw==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_053858_227061_81A98798 
X-CRM114-Status: GOOD (  11.59  )
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

When upreving llvm I realised that kexec stopped working on my test
platform.

The reason seems to be that due to PGO there are multiple .text sections
on the purgatory, and kexec does not supports that.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v6:
- Replace linker script with Makefile rule. Thanks Nick
- Link to v5: https://lore.kernel.org/r/20230321-kexec_clang16-v5-0-5563bf7c4173@chromium.org

Changes in v5:
- Add warning when multiple text sections are found. Thanks Simon!
- Add Fixes tag.
- Link to v4: https://lore.kernel.org/r/20230321-kexec_clang16-v4-0-1340518f98e9@chromium.org

Changes in v4:
- Add Cc: stable
- Add linker script for x86
- Add a warning when the kernel image has overlapping sections.
- Link to v3: https://lore.kernel.org/r/20230321-kexec_clang16-v3-0-5f016c8d0e87@chromium.org

Changes in v3:
- Fix initial value. Thanks Ross!
- Link to v2: https://lore.kernel.org/r/20230321-kexec_clang16-v2-0-d10e5d517869@chromium.org

Changes in v2:
- Fix if condition. Thanks Steven!.
- Update Philipp email. Thanks Baoquan.
- Link to v1: https://lore.kernel.org/r/20230321-kexec_clang16-v1-0-a768fc2c7c4d@chromium.org

---
Ricardo Ribalda (4):
      kexec: Support purgatories with .text.hot sections
      x86/purgatory: Remove profile optimization flags
      powerpc/purgatory: Remove profile optimization flags
      risc/purgatory: Add linker script

 arch/powerpc/purgatory/Makefile |  5 +++++
 arch/riscv/purgatory/Makefile   |  5 +++++
 arch/x86/purgatory/Makefile     |  5 +++++
 kernel/kexec_file.c             | 14 +++++++++++++-
 4 files changed, 28 insertions(+), 1 deletion(-)
---
base-commit: 58390c8ce1bddb6c623f62e7ed36383e7fa5c02f
change-id: 20230321-kexec_clang16-4510c23d129c

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
