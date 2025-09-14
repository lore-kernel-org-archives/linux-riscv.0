Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C54CAC582
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Sep 2025 04:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7DvD+OEENwGemlztZKqk+O8kCf2nO2/LcUO0pjeTgAM=; b=cSYzq9CpUti3n2
	t2Al5DhCyIud8tTGs6dnHhVpmy3Davz2c8YVoGfJh3QVA5xDtcxa7J0mPbCLY/oXR7MtkoApGbZwE
	n1XVAvFEFM28eqQSRokgnCG9rhrYnqgn+9ApNOU5gN0MW6wL6xfClNhGnqehOb58u8R6yot4btmeq
	84qPMopgKIOIhIn08b4Jz2BNmnZ1HGC1yDQcGmF6hHvwkY29GoQBoUFONhGVagk44dgvZnJ2oeWPw
	d6rcori/l/RWzgvBHp9dOurGvtn1B3+OBk2KsiS0u4L3/gy5BVDfhT6gqW3MDWkIBr6udZNs8GAzX
	7EXUS+aqYObERmcYl1aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxeD7-0000000HUqA-1ymG;
	Sun, 14 Sep 2025 04:19:33 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxeD4-0000000HUoX-2LDq
	for linux-riscv@lists.infradead.org;
	Sun, 14 Sep 2025 04:19:31 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b0b6bf0097aso101165966b.1
        for <linux-riscv@lists.infradead.org>; Sat, 13 Sep 2025 21:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757823569; x=1758428369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXtvCmrZRR9OgP0sG11mqG9m/nOQIjqm8VdJ9uLACjc=;
        b=i61K4bxjQxphbKR5XDfL9ITN2JqnD8OT+w31bCn8eI6HYw/Coi1JYcuIEbL/PXghKv
         eL4gzJriILRpdbtLoAaLpzmAKolqCHgWUzURnhMbVrFQ2ClwjSS/N6RN8CyuBPUY57rv
         EN48beJxu3EnnxjGPuHKBeh9w8y9L+y5PRfMMEKmQMPM8aJMXefdcHwyCeAd3dxDalLR
         gIBfNLzcl2VumagVps/Onnx3Sw7gKMxfDBi0vS5O+Kjfsi8U7CGSdEILLm6pp3Xe+HMP
         nxqrPwS0Mut363cT1h3FKE/0f8w2n/qbnPKPGs4rOrFiroMlEdT1/2bMmAVGMZc6L4ly
         aXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757823569; x=1758428369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXtvCmrZRR9OgP0sG11mqG9m/nOQIjqm8VdJ9uLACjc=;
        b=eg7C6XTTeUNk2E2DvEgZxKBFZNyNlz61HLj0aKKJgW+xjLA2HOQC/gp0PyhATQMvkm
         BHhYI//vv7xYeVdwAfV7V2ayBrkGhQsUpFMcIUq44czpbqW+KQ3ejMMNvBDEFwGXFy/l
         rlbD8mUzY1ZlyA6BicwuTPXceakdS06TQ8rCgQLK8fVMtI1WMUpaXnzVTKJ3pANcqLiY
         i9boLzOY7bFuTXWCpxds1uF18J91jo8eMJWGGtny+1p399GjG4Mls9PEqZEnEA/Y/WuF
         pcZWz3DdwHrVoe2ln65w0P5u5gQScbAXzew5ebu7WPKI6FScn2fcuSGAbz8rS3B2SzXM
         UDEg==
X-Forwarded-Encrypted: i=1; AJvYcCV0vtLWgb+3+X8n7YSvDexUmfe5Q7a0mCurMHitzyqyJhgOgWTtB1tF5vIJ6M+2QsMMYZcI5skNUfZ2Pg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoyFVwFU2zIwBOFuJicemnCJhko/J9+is8zoeqXAdMPoDms6vs
	cHmt+bWASRHnoEwciEieUXDMnrkhJEDGftU9dBSr0djN1UT7xSDcUWJp
X-Gm-Gg: ASbGncukXC+CsGxHG3by+FAjMwJyD5K7TSiDFQqqH3YUcD1h8zGDYM/pOptfW7E6fLM
	05dRuGAAMKpesu2jnUq/XxDKNFVM5DqEk9PmjEcR+2YsTfn0FnElgMMW1trUtnpBYhZywoMea6g
	g19qQM1Tt2eaex+9PToB/IVF1aVdIsn5lGlmqYl316tfAjVXffFsbHlYvGQqSSk0dgbiHEmRAn+
	bRRRySXzTFr8NAGvHlwPBDKKK4Mo/90NsbV01BgsubUn/lYCi1DNzV4G3jrEixiprGDw/mMgFNd
	N/pdkQqHrnr6XphfUYsKT4vLWHfcCNaaiSydS8LM2ftmH1kBma8tf0BUVOzDdM2hYLyRjdgRsXb
	l4oLr48kptWRcrzDAhwHPQj0eWTM27Q==
X-Google-Smtp-Source: AGHT+IF6mujdx9qWAhF6oXDc9ZfcQYBKEdRbKR8jum+cm7upWvg9UYWarRjAWufJtq6SFHzRS8+jpA==
X-Received: by 2002:a17:907:9809:b0:b04:25e6:2ddc with SMTP id a640c23a62f3a-b07c353a723mr763099266b.8.1757823568595;
        Sat, 13 Sep 2025 21:19:28 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07c28f190fsm504796666b.39.2025.09.13.21.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 21:19:28 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: safinaskar@gmail.com
Cc: akpm@linux-foundation.org,
	andy.shevchenko@gmail.com,
	axboe@kernel.dk,
	brauner@kernel.org,
	cyphar@cyphar.com,
	devicetree@vger.kernel.org,
	ecurtin@redhat.com,
	email2tema@gmail.com,
	graf@amazon.com,
	gregkh@linuxfoundation.org,
	hca@linux.ibm.com,
	hch@lst.de,
	hsiangkao@linux.alibaba.com,
	initramfs@vger.kernel.org,
	jack@suse.cz,
	julian.stecklina@cyberus-technology.de,
	kees@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	mcgrof@kernel.org,
	mingo@redhat.com,
	monstr@monstr.eu,
	mzxreary@0pointer.de,
	patches@lists.linux.dev,
	rob@landley.net,
	sparclinux@vger.kernel.org,
	thomas.weissschuh@linutronix.de,
	thorsten.blum@linux.dev,
	torvalds@linux-foundation.org,
	tytso@mit.edu,
	viro@zeniv.linux.org.uk,
	x86@kernel.org
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
Date: Sun, 14 Sep 2025 07:19:23 +0300
Message-ID: <20250914041923.4119219-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_211930_610244_7ABE23B0 
X-CRM114-Status: UNSURE (   3.93  )
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

Gmail banned me after first bunch of letters.
Just now I sent remaining letters.
So now the patchset is ready for review

-- 
Askar Safin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
