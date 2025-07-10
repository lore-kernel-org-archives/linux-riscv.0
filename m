Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0913CC83F17
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 10:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qS/SFiXHAWpsXLAoSVSvMiLg3KQscZ345oX8ssNpuQg=; b=tIp2vtPS5RsgHf
	ELkSuAUpHwh7Q0Mnh1g5KgLOPr9YKGxEQt+fksfTVHb14qV/4XjiyvtFOyikzjtTnzFfVMSiytUeX
	ty8wTg0yEzKzvZ2B7x1SmFCAXgLqYE6rkVQILaqBJow+aehJ3U4E4/OOjWRNEmALq4OYYSCd6Awsf
	ve0lqE2qFFT+NLTfYwtvRrWJsNw34fZJrMOQ134PP3HQwp5YVIuGGL8JUuCwvt7x6/H4tWooj5Pg7
	HGytbmT+RGGBgACTJt1yhTWxYbEpfhUggeiEE+HfgZPT3sRBUpt6XOUmyORncRe7oiUE/Wt+fkUt5
	yTOornFGq9lsayd8ytZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZoC0-0000000BQ6U-2kAX;
	Thu, 10 Jul 2025 10:07:52 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZmks-0000000BCSG-0JTI
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 08:35:47 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-234b9dfb842so7031385ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Jul 2025 01:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752136545; x=1752741345; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QzAnVGMIiXBRTiiP1DJESZEHpVWEA8ASRbQw4C/IcNY=;
        b=undv1PWSpADLDk+EIB9HtVFHxaPTG1fyVRyT58csRQCh32iXComK1nbF2GzZF13TPu
         HNPqQkPGrccILDUxN0LKK/wLgy1tL7JyNvSzFrCl866czUTBFwYv6z5GRpBzhEkq7/n4
         qRIMEeekZkgh4IX//H48tSGU1JUnR8IBBBoJcveVW/ejpBd7MDvn4CSm3Zgvbvi8MBfK
         XC117LsEoRANmxusSzwJYmMIGnMn9CxXnkhXHpQgj1wHrbdRzb9RxEKo3L4TOtA+cT+S
         PEIuuCEuKsIkaxk+cOLImv2pRIPbYktCnfKJda2s4+Ph3AR+dzkMZfbpwvlo9tMi+gwr
         XTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752136545; x=1752741345;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QzAnVGMIiXBRTiiP1DJESZEHpVWEA8ASRbQw4C/IcNY=;
        b=bck1jkTE6HRrl4k4EIQ2TqY1zffZPBei/TBiZtTsymPqwlHuIyfPzek9bOYBudpDP/
         9QliSUllaYDgJIx4o2fzpNgJnDC1fLD+LZtz4xNHWveV6BJ4C/lFSHKr9Nm8gBrQ2pVk
         YObxLQwlrjp7qK8+uck6LFsACUmFBy5cPU/5QuWERKGezGpjDEnz/VjFHYEeP7N3dhUp
         s/XrYXVZZpQB8mxtnCTeP0cOlhh586TNE1X3vNidrYiasWZEt3iARt0M342BkoiX/527
         hkPUL6uEfI8sucKZwS67qeibZRfjScLONKfZ9SAK1yqQbFsjE4/otKW+BK573IS9aaZF
         Ulkw==
X-Gm-Message-State: AOJu0YyhDHPoM74K7zzkisXQmNJ3J2wyFb3AMgCSOvycj+DWVtMxJxVm
	//PQLiVfNz3qx5rx93wK7EeonIlj+Sby6QcpGKr63W+pENfkHtDdsRl3fxCg5ZdDivU=
X-Gm-Gg: ASbGnctHlB4cSSSYaZDkiCh9uWhbfPYxhcPINuFe3T8Zzm/TgCuQJcU6VzPlfPizZq4
	G0fpwEmvl/uf1OtuLoF37wriFFclhVjz0N8ORlMPWXiCs14idjgFBYsdqNzm/VEnLMd8GR7STxz
	jPwSr5gM+dWwFNn0RX2OSIeQiGkAzWjzf7OHvUWE8g/mkIKw8ADNTKPZacP+rclsn6PE9R7VXtc
	kLDnJTeKy6phNLzNJwk5owbttAtaED0cp3J3IyJiQgRf1TWqU3FAd1Wb0LGenRE2fYkl4NDX/8c
	NL+sYCvZb0xV0R/pAWuC5yYFYZGpK5A6dzHcwmK9hMbprA3OUBBInsYk1Jv7wbT49k3qVEJjG+m
	jfp5DLEqNt959kHqy9asahlXQZrqKNPk67A==
X-Google-Smtp-Source: AGHT+IH1FXhHwkry8rqQNj86eFDFhygFgtZv0mBNeYCTjKFwkJESXNg6db3VIgb1DHM/glR9CTJNLg==
X-Received: by 2002:a17:902:f70a:b0:234:9375:e081 with SMTP id d9443c01a7336-23de488a306mr28819485ad.42.1752136544667;
        Thu, 10 Jul 2025 01:35:44 -0700 (PDT)
Received: from alexghiti.eu.rivosinc.com (alexghiti.eu.rivosinc.com. [141.95.202.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42ad3absm15392655ad.83.2025.07.10.01.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 01:35:44 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 10 Jul 2025 08:34:31 +0000
Subject: [PATCH] riscv: Stop considering R_RISCV_NONE as bad relocations
MIME-Version: 1.0
Message-Id: <20250710-dev-alex-riscv_none_bad_relocs_v1-v1-1-758f2fcc6e75@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIABZ7b2gC/x3NQQrDIBBA0auEWXdAk9ZKr1KCGJ22A0HLDEhAc
 vdKl2/zfwclYVJ4TB2EGivXMmAvE6RPLG9CzsMwm/lm7tZgpoZxpwOFNbVQaqGwxRyE9po0NIt
 bdObqnbd+cTA6X6EXH//Hcz3PH9KJvINzAAAA
X-Change-ID: 20250710-dev-alex-riscv_none_bad_relocs_v1-ba6048681836
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122;
 i=alexghiti@rivosinc.com; h=from:subject:message-id;
 bh=d5di5HzftKV8939xRBa1b1yblY0USW29MqZCUuqgraA=;
 b=owGbwMvMwCGWYr9pz6TW912Mp9WSGDLyqwPF5OJaWuILDlRcb84/K7Xr+CGFdb6az+zXXWEMk
 /77w7m8o5SFQYyDQVZMkUXBPKGrxf5s/ew/l97DzGFlAhnCwMUpABNZ2MTIsD3BZOkaAZdzSwpc
 lpyPu/Yk6vXuT0pLJM/OW5590VLk/SWGv2IqB9jKEu4/kgqcFPGwWtrlwzWOkiyvaVfUth1zPsJ
 oxQoA
X-Developer-Key: i=alexghiti@rivosinc.com; a=openpgp;
 fpr=DC049C97114ED82152FE79A783E4BA75438E93E3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_013546_351384_F1362628 
X-CRM114-Status: UNSURE (   8.84  )
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

Even though those relocations should not be present in the final
vmlinux, there are a lot of them. And since those relocations are
considered "bad", they flood the compilation output which may hide some
legitimate bad relocations.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/tools/relocs_check.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/tools/relocs_check.sh b/arch/riscv/tools/relocs_check.sh
index baeb2e7b2290558d696afbc5429d6a3c69ae49e1..742993e6a8cba72c657dd2f8f5dabc4c415e84bd 100755
--- a/arch/riscv/tools/relocs_check.sh
+++ b/arch/riscv/tools/relocs_check.sh
@@ -14,7 +14,9 @@ bad_relocs=$(
 ${srctree}/scripts/relocs_check.sh "$@" |
 	# These relocations are okay
 	#	R_RISCV_RELATIVE
-	grep -F -w -v 'R_RISCV_RELATIVE'
+	#	R_RISCV_NONE
+	grep -F -w -v 'R_RISCV_RELATIVE
+R_RISCV_NONE'
 )
 
 if [ -z "$bad_relocs" ]; then

---
base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
change-id: 20250710-dev-alex-riscv_none_bad_relocs_v1-ba6048681836

Best regards,
-- 
Alexandre Ghiti <alexghiti@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
