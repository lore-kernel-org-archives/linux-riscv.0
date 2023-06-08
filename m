Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8BFC7EE45
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 14:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NK/RsWDrq+8McT8j24cnJfiR+neE7hDR0zVwqZ96w/E=; b=R3vl2SB1aZV54F
	VxcUQsn9HKDDWlbMbyu5hdCNHpHPhA5QFrSDHAQaK4FYxikCvMjTMFblp+n7/mIwtvdhIN+wCTWxX
	QbZXD8tdg9WfCm4flDtqsKrAcwH2yy4DjWzRXOfDPpVJNJiClgdhcmdj4G9kyYw1qQc9zEBCv0sv1
	L6KXmNy+nXFlIbSYzNeZwzRY7JZ4dx1SiTHwCWUi74d5pTK+5WxDq+fXdvo5ZL99eYroJOyGzUMMn
	Ml0O6SaklpehzA1ANSuS3jsGUPpB0bLWx6KjUn7PNH7M5HW0BIioJDoY3SaxrHd9+v/4Ltvs5gut8
	Ire7UyYMX59kl2isO0DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7GGY-009ZGI-2s;
	Thu, 08 Jun 2023 14:05:30 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7GGU-009ZEf-0E
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 14:05:28 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b01dac1a82so3256585ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jun 2023 07:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1686233121; x=1688825121;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+L5RXpIosXD3TI1NHJa9r2aP5Z6LTTGpeX5TVtmGlUQ=;
        b=Fw9rSRoxxx67E0NwuI+8hq5zb62R2NWeVkrRz0Wz0saZdBM5f2dWBAymn3NdIBAF0B
         ukdvaNGerxCfBxnr9tCpROGfG91SgUZB/bD04Z7ar+DYTtCVnEEzQzc7HrWnIDvHxyLS
         MJ2I4A0U/pBLeexeqGvqifkGaw9kPpcPuHyc739Ob457AEWjgBFEzDSgBGNoN7OydNQe
         HK04dXdL0DUGq8PuXgtTV8W0wSG55AWqzu9OJbq/S1uO6iGOa4rI1gNK0iJAq6eI27vo
         aR38JX8Fn7AOJUdOJDEFcWLsXwOgJTJQM2A4Atg7tuzFVNfLdZIvX+Ovg2rM0QYYKnkb
         Hztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686233121; x=1688825121;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+L5RXpIosXD3TI1NHJa9r2aP5Z6LTTGpeX5TVtmGlUQ=;
        b=LGvws4spPD33SXM7AvFMJAaHfBkrtxIbYmpwoZjm8lDIlsMRtVKrP1P/qRsoqrZyHh
         nJ8qNmqlFP9ez/wSQG5NQBryrBgDrNZyceQpqMCgqBdbkXhPNGkxFo9gcV61a7PWHdf9
         NIcHCEklQzAdL93U/DEuhurqBsQqPQATwzvzD6otVY7B1gjWQXtsW9/Y/df11G0bysRj
         wzCtyTECVfCwtzMepi+0EaoYoAK17XApqE15hwqESxIxgUatsc3FfvvGjFgS54uBAdI4
         W4aJJFCKi1eVqAsySeumOiZBgYwpI09iheuvgoWgIGtX1U7WYeyOOaP6tQzPLLCuXCy4
         CVng==
X-Gm-Message-State: AC+VfDwFc95G8YTX+Bcz6Mz/nbZOGgmbteduri5TKRFUiHFjuHUHoCK4
	xJM387uOxjKHsFcZNYWiW911BPJVp5dQKNeq9G0=
X-Google-Smtp-Source: ACHHUZ7FxTGImnT787sCxG3Ew6AErJlsl5jEsxSyQ5ocnf2SccL/iSpyb8fDdX+9doRUQjC+BFF5rA==
X-Received: by 2002:a17:903:2285:b0:1a9:bdf8:f551 with SMTP id b5-20020a170903228500b001a9bdf8f551mr5240052plh.69.1686233121596;
        Thu, 08 Jun 2023 07:05:21 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id j3-20020a17090276c300b001ac7af58b66sm1470979plt.224.2023.06.08.07.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 07:05:21 -0700 (PDT)
In-Reply-To: <20230425102828.1616812-1-woodrow.shen@sifive.com>
References: <20230425102828.1616812-1-woodrow.shen@sifive.com>
Subject: Re: [PATCH v2] riscv: mm: Ensure prot of VM_WRITE and VM_EXEC must
 be readable
Message-Id: <168623309500.19530.8797987048849296109.b4-ty@rivosinc.com>
Date: Thu, 08 Jun 2023 07:04:55 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu, alexghiti@rivosinc.com,
  greentime.hu@sifive.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Woodrow Shen <woodrow.shen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_070526_331560_F498B213 
X-CRM114-Status: UNSURE (   9.03  )
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


On Tue, 25 Apr 2023 18:28:28 +0800, Woodrow Shen wrote:
> Commit 8aeb7b17f04e ("RISC-V: Make mmap() with PROT_WRITE imply PROT_READ")
> allows riscv to use mmap with PROT_WRITE only, and meanwhile mmap with w+x
> is also permitted. However, when userspace tries to access this page with
> PROT_WRITE|PROT_EXEC, which causes infinite loop at load page fault as
> well as it triggers soft lockup. According to riscv privileged spec,
> "Writable pages must also be marked readable". The fix to drop the
> `PAGE_COPY_READ_EXEC` and then `PAGE_COPY_EXEC` would be just used instead.
> This aligns the other arches (i.e arm64) for protection_map.
> 
> [...]

Applied, thanks!

[1/1] riscv: mm: Ensure prot of VM_WRITE and VM_EXEC must be readable
      https://git.kernel.org/palmer/c/6569fc12e442

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
