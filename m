Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC497CA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Aug 2025 06:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g6gko3paNO7lnJvdNgR/liLjPhjRiG2b7WnD57Sau6s=; b=kzavLs9cC9bPLM
	eBZZuE1verXTqkxQj96kwHZnGfvML20WvaGHazFr5qKez0KLc4xmyN2my9dNA4nbggyqPOpHI8DL7
	vgsVWUfKn2NUBZ6q+j3dvUoPv94nCudES6UrCLXopVnRiYI/dy4kii3hz52aJYOgtGbg+zkSP2j4t
	5iwsQ9VrMUHjCMpHg7oAXdP7tM3dDqFl1Rv56oTOXNuOf5Tnc4MRXam1ANVNDmRB2vevJFlu6Cqb/
	qwi6JpnY7W3eozNdjFBEg5wXVxSx/p/HoEq4i1sJ/q16R6jTVHjMMaaJF8WUadTAwavFHvrnovTbL
	cy3+K3/A7IrTuh06Zolg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unAgI-00000004A9F-3vFM;
	Sat, 16 Aug 2025 06:46:22 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unAgF-00000004A8f-2MSV
	for linux-riscv@lists.infradead.org;
	Sat, 16 Aug 2025 06:46:20 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-435de59ddf7so1667494b6e.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Aug 2025 23:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755326778; x=1755931578; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gAvOBrY5es/yKWkDs7Yk9hOG49QFhgslkJsBwv3zr0s=;
        b=QFW5YF1kdsNw+S9ZzzBBff/piCax9izZjmpGIn3hiHPo/XEb/VZdOoqYaCXx4TMTDv
         1mOfRNXZOhJc30qUIYSIisDPptiiUP9PQoLeomxl+fOeU5kwjIAPctnrlJtm9xfow59c
         mGHPVOvBWMsStjnOMimLstdKKJ8pfQrfgquG1K9qZ33LAl64r+aUpVd0wVC0AfeqOqwp
         r6G94md0oMY2tUXPF5hhtwyv2eFMbfwHDk1QogdShvGGI65+Q+ENDbrW/QcHW/wqCPTp
         VFUWGzgTvRXS4IUHy0ze5AVWsh2LAwppbuetAUujvZ/hbqAkpLthKPKf6DX3sX6LzyWF
         5EyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755326778; x=1755931578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAvOBrY5es/yKWkDs7Yk9hOG49QFhgslkJsBwv3zr0s=;
        b=Ro6RGFDCmYW9sdwk9RU6yAm2cdQHHT4lYTG6tVKvGhjsNVr2qVWj/4S7dXAksXTkNz
         k+2er806tipFj+ihkjBFKgyGHNWE3ia6J9Y7gf39Bergo/T2fQHfxSQBRyBmZoxX/ndy
         9qQMoM3au81lYX1m/OaSMIMTbuVCbslLhnQrLO2USkDoC94IjNOuUti38ptKIPPhMm/t
         BbDSzoxboBMiAauLdvYZ8rRBnrJqjuoFT225jf4akOyn40CvudbIuxvAzzA2WQYco/bl
         jpd/e22QSk8yhxU8KtpUAKxo/F27LKPVtPUaTi2CKZ86BHPgZNX8rDHH+ioDpK2gLVjk
         MWcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUiNNM4RYvA1U3LgApyBxkTKFNn5Y68uOamGT2PqLjB1TOKe91DLQI1ePi6EMkSTm408omy0hOOETSbQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwqKPapZylBZfaHNsdIK5tPsPSIuBkx9ahsj/40akupEDKwKa1C
	evx3Y8M60fW/UnR9I/iW4OM1YwUH4q3szHQjSndVLKM10fKpE5ETLn8KAplnVqcnRIk7WqyVcqV
	lvCxCPhiH9CYcL0tzQy/eVqGGirRM3rg=
X-Gm-Gg: ASbGnctKYmEzMWr1JxdptLzkBAiHw7Y3Y/K4N0QwQ5sx6juiw8GwQVkCxSWRJlagjaB
	7jw7MGeVzN+OST2HyaMUgDr2v1QWGQ9dpV4wJ6sHeTF6JUYjyqrTG36wzeDWd/N51cFFBmgbYlX
	udG3XZpRt0E71/UPazXFLsbaj/0SdYmfqRbhyaCnuZ7zvOhIJ1AAgvL2gU4uh+a0yxZJHk3Vvcm
	7PZjT51wOUuWGZNHrfIVf+56Hd2LA+kZ/e4UpU=
X-Google-Smtp-Source: AGHT+IGjUuTFMbcHoxRQ16+EoLIDzFiULTRGmEHr00m0tAm0LGBEAq+siKWzqCMyJm8+Yk6JcOtKE+H+Yf8xIItqBpE=
X-Received: by 2002:a05:6870:8910:b0:2d4:d9d6:c8d2 with SMTP id
 586e51a60fabf-310aaec9831mr3004527fac.35.1755326778529; Fri, 15 Aug 2025
 23:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250815182742.45541-1-suchitkarunakaran@gmail.com> <aJ-ScOp3ZCG6PQmD@google.com>
In-Reply-To: <aJ-ScOp3ZCG6PQmD@google.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Sat, 16 Aug 2025 12:16:07 +0530
X-Gm-Features: Ac12FXycVXpv53_SMZYPs1lhxZFFkJf2blSiPR5TbUndixnCz2Z4HJEjGK5pwjQ
Message-ID: <CAO9wTFj7S7G2bqbiuKbR+o7Y0u1EkYY5GsHasJZLmAo5ZuCx9w@mail.gmail.com>
Subject: Re: [PATCH RESEND] perf/util: make TYPE_STATE_MAX_REGS architecture-dependent
To: Namhyung Kim <namhyung@kernel.org>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, guoren@kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-csky@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_234619_599407_3234497E 
X-CRM114-Status: UNSURE (   5.89  )
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

Hi Namhyung,
Thanks for reviewing the patch. I'd like to ask if there's anything
else I should do regarding this patch, given that it's supported only
for x86 and powerpc?

Thanks,
Suchit

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
