Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910C0C53219
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 12:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vQiPkasUCULo3fV5k3tn+FhFAGrY9iN5HTKKTZflYfc=; b=0jzb/JKZmJrNv6
	B58P7hLJknff1qGZMzDfwcMkjdNX/ZnOntPUdwJuKVjQZ3OUBBFnYXxgBTN89UuJ/JEYkAKyxwt5N
	KUonn+Gy5neQwEwdrn5miJRSUM1mAsT81Fl5jSLUR0XpgWoU+wnQvEFBHw89u0vxqcSd8jmgZrRqM
	UNhT7auU3JsUNgKcJxwRgOYTW77QWEEH96Ga7+nXQ+8EZFwMZbIw1sxDHRSI3ynHMSKDC+nfZ1xar
	J83ajzEQhjsH9upZdEB8mAuudQZHD0jNC827D/IjoTRtpmiQ6VX58GxpdWfzeLA/PUj/fe65C5U3s
	r0KALCpVuk0YQh5QdumA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKc8-00000002j9I-3tIo;
	Mon, 27 Jul 2026 12:39:24 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKc6-00000002j8h-1sPe
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 12:39:23 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-c9fcd903839so1211307a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2026 05:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785155962; x=1785760762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rHRV5gwUjVGQwdFF5biWwFHxQewlnY4tVqU7C1q5tGI=;
        b=emzXZXaYfrDPtUEU3xPVoviKsWeQh5R7cTukMQkh7oksfvEQUZ2vzrZ2iWiMyJWIbh
         yFU1OFu9CoctLmC+lH8KW41OVV3ZkwJA54hDygjk9+SRIuluMk6/L/OOLASL0vn/+Iq3
         piNr+ompWRL1VMVlu4/mt25DgfUMiD4l9Q5nr8+jAR65YFi8nxW03poQ4NNPCfLTmNZW
         JVsycl276VWolAnDOqeRLtsY154seeAhlge0trmqnZEzl/TeJo9+9ZRrjjrlscoxVpKg
         SetX4hZ9h/LPPfc74jUPTRK2ZSGuRb3dKYWGhopB0rD78+6Zj1+YTAKtRaaeUZSrshf7
         v4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785155962; x=1785760762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rHRV5gwUjVGQwdFF5biWwFHxQewlnY4tVqU7C1q5tGI=;
        b=U8Y8xZ5nbiUpyu8d8xGQsN6/qYgLttHDpF/gKWn6pF8NR11eOBTpgBX+VxiuTriUhc
         znXDU1C+KybKnpaDeoGAv9lh4w20yPjUYOPE7NEp2N6YDpNNR7eaI8M+sTaqOCsLAMVh
         VOJwcoUwgPTYRHYWZQaT8Ww18cNBYHPjO9AHKLHWzv3CUu8qqicNhgR5xIqjVYlVFbI3
         X2L84FYYQ4iIkVAeJRUTJPnTJ/0SER3ZyDePUk0FenADWlr0gNrU3KQDjjjMzlkQ6IqA
         e++xT69+twOJ80VTN87bE651l9x6RvqdQh/ErmneKOH9moqW9SJAmXmA51AZJJFmKaXT
         2ZAg==
X-Forwarded-Encrypted: i=1; AHgh+RqbJjNQTBOzw0B7I8e4ll07GJQQaYHf0i6nI+gt7JGvOPMJrevFN/Rn+mZDVHpB6F3K2TRm5AJmDLm5vg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUhhCVQC+T3CdYJm7M4ugX9nd06TSXZCsgBTI5AB6VnmtdQVI8
	N/e5kwd6/y79T+VIacdB/7CFlmD3R4E+KxmW5S7ao4U9xsRTn1NXpRUA
X-Gm-Gg: AR+sD13qtWU69/yVRPkHo6ayEOcBI97tXbFb9tkab6KgNNt0dRbuMsRjjXudoMVVWch
	3UMQj+i1ziZzulcz50DAgckb8pTY9pq0a7kE6yBd7fxz+HObkNnCGcxrsB7IPh5+6djjvLGpc0V
	qrRysJFYK5y73MaPahiy8rjfA4ajqBrPStdUEmZfg9t/ZRmWwDW4GsCCKhaxZGGYpj6WROqu00a
	4xKGGi85pruAwHJcGmDeak4SdxhraE82DAYioGc/9WhIOx4TlgvODyFsB5BWLPczQp8EB7jluRw
	godGvA2tD8+VeAtQwe2K+EqX6zn2Wxsj00sAJHeJ3ebp1PIAv1ukyXVLufbdwl62zMEjQjvMF2n
	T7iGPM6wRijEI6GNQEnhKl9s7Ckhtf2FdpsOE6nS01ySFwQvGh6t2JZvVA5KkZYf/xLgN5mc=
X-Received: by 2002:a05:6a00:983:b0:848:4123:68ff with SMTP id d2e1a72fcca58-84e5958eeb8mr6476053b3a.65.1785155961592;
        Mon, 27 Jul 2026 05:39:21 -0700 (PDT)
Received: from wud.. ([218.194.32.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1386sm3036732b3a.36.2026.07.27.05.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:39:21 -0700 (PDT)
From: "Dylan.Wu" <fredwudi0305@gmail.com>
To: pjw@kernel.org
Cc: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	anup@brainfault.org,
	alex@ghiti.fr,
	atish.patra@linux.dev,
	zhouquan@iscas.ac.cn,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: ptdump: Move pagetable definitions to common header
Date: Mon, 27 Jul 2026 08:39:15 -0400
Message-Id: <20260727123915.119650-1-fredwudi0305@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3bb2f519-c70b-6c35-c404-6fbfe8adbeb1@kernel.org>
References: <3bb2f519-c70b-6c35-c404-6fbfe8adbeb1@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_053922_508342_E0DE80E9 
X-CRM114-Status: UNSURE (   8.03  )
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

Hi Paul,

Thank you very much for taking the time to review this patch and for
the helpful suggestion.

I have split the patch as you requested and sent v2:

  https://lore.kernel.org/linux-riscv/20260727122745.118764-1-fredwudi0305@gmail.com/

Changes in v2:
  - Patch 1/3: Create ptdump.h, move declarations there, and export note_page()
  - Patch 2/3: Make attribute parsing use per-level bits, rename
               pg_level[] to kernel_pg_levels[]
  - Patch 3/3: KVM gstage ptdump

I would greatly appreciate any further feedback you may have.

Best regards,
Dylan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
