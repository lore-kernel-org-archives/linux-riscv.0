Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180C3CA1013
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 19:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CKRm33B8iMz36oxlg0BOGs4ch67RgsXMdTZDU1QfHRs=; b=wyhPvlqNWm6EdU
	v22psHDd1Jotyl8KXEzLtQUshnXN/owxeudSA7u4eG0OqWuBnfJpdOfnzXaVugOddX8SXq2r8uvAg
	08AYlBwWsXzXNZ0X2xaJJpEVsZZEokTZTEkJj5aLW3G51F7dVlRtZJmkZP1weEChlIpDxWQJA4Oqv
	z6B0b0b+yb2oc/VnqdFYTBex3/7NHP44GV2wLzsHxAk8xv/QVX+wK4taDZFuYZjpiaRGj0YB/E5fo
	6fIyfPUYum0HnRcprp6sj4NlYCzdRw8rD99YhEUU9VN0OD+3nvhBF3fBSxCy/2/aj121fbgPbiiOw
	ByrRmkujfAqzodkssWpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKlp-0000000130R-45f4;
	Thu, 18 Sep 2025 19:58:21 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKlm-000000012xi-2Ebz
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 19:58:20 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-62fa062a1abso2194506a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Sep 2025 12:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758225496; x=1758830296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9McvDjxp1cOQ8m8DQ7zr8KAOkClRv+R613f7KwPZqLk=;
        b=aVScytwG+5OLN84c5kL14WxP55gqpSNJQtbZJEAFWCrMlLf16w4Biih4D39ULPcNrr
         Z14JUpEaGpRHZnmzBurD14qXWHvojpaoE47EcQpbTG0FYNNZTh0EvwBN5sdMg3MBenWj
         URlsVTmKgGExaYcNGznbc1Wny+L/pav4VBBCbZ73czSIwqnu4dQQm8kCmWNK9xixvSiQ
         I/fNGsuNRhsOZYadZy3980WRuz8B0Yez34uygnauTZc2O6IXUIAyHoMc7pJUrHRQzzGJ
         u+8pf6y+7Fw27ZHjxWmyoQrzvm7qPep7fs12NYLfsapHPh0qUTZXFEJ37S2U1lvYQeHU
         qfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758225496; x=1758830296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9McvDjxp1cOQ8m8DQ7zr8KAOkClRv+R613f7KwPZqLk=;
        b=bD4hGfBqfuskZWTjE3N6IM7eqNg8SJmN3J8uQDCf6o0c1Q2Fp7PoiPavN0sLoz7q73
         riQmaX6KWCpnfzmi+hA7RduNHGAgwH7Dptp5xwpVX3Zan6MxUs4MOTzYP+uJ51/goP2U
         ckzwVKhDtCcY0XZDLXOUaif+jJ3uha8VzjzqdVh35UVFuyQo0XuOessbwsG8OAmtTpvE
         lNFRS4W6FUOrFr292gT4LgL2puRkO5FfJkIb0A2FKaCUPPuqqAJ2I6JlZKdGpz28JIbd
         OwiGXRJh52djh6S9sBHAv4ax2QTf6BsVmW5aF5XZ53wv3Hh5W8KxFbyrDpWlAQAoKrdc
         uStQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5WOK5vCRBu0XwUO1RmcHKsQBAZzQ02EKHnDXu8PpeTaBBG6IsMwUcWSM+3t64ZekOcdBBAae3vj0cJg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNWtT9/7EApc6PdixYiV+dSZRtKGbnRjheJrwbvzEjc1vNY00m
	sWH2B8V4PTA9Mfx009M/DVke3Oe5FOC01k9Xk+bYd9Alne0lkRR/622d
X-Gm-Gg: ASbGncvRLVrujKzQCFvhyxoPbX2pOEgwEiBUsO27e9VOQLay5Ub76uFpr3dPZyxHXi6
	CAXlmvGIDl/EsHuj2yYct1XwXvoQ1xDZ3Fat0wHURNsUvrdQHeJYKJo76MgzR8JV2ZDU/ZmnEZR
	fH6SKE4kBlmsWyxrBBI94p4a/lOWGWBTIRnzxUNvDKu1H9oSfGeSG0z7uIf4YIomzzEFd2WgDIE
	4TLn8Uu4jox6vP/s+lcNYPOO4tvPSN+oh2hFkgKJQUHohvFDG16wmXYk+Ej8AxYPXrAbSkBRxma
	OxgxmPrlGOEZGR/hY+9xbL1iFZU2vRFpRhjEaB18hJQxReLwxWvc/hLgk+TWfo5bUmH67PjO2CR
	oi8LG3sz7BNMvnc/nz6S8fKzsXJ/pb/T1+xZuzw==
X-Google-Smtp-Source: AGHT+IH2NBu6L+bASXNqg9sJUcZ42MFCB2aqzEFiqoDEW6um54A4CtHcJnO37auTgFbi6nwycKDm8A==
X-Received: by 2002:a17:907:a089:b0:b19:969a:86 with SMTP id a640c23a62f3a-b24f35aa177mr45885966b.37.1758225496090;
        Thu, 18 Sep 2025 12:58:16 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b1fd1101c44sm264530466b.82.2025.09.18.12.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 12:58:15 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: nschichan@freebox.fr
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
	safinaskar@gmail.com,
	sparclinux@vger.kernel.org,
	thomas.weissschuh@linutronix.de,
	thorsten.blum@linux.dev,
	torvalds@linux-foundation.org,
	tytso@mit.edu,
	viro@zeniv.linux.org.uk,
	x86@kernel.org
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
Date: Thu, 18 Sep 2025 22:58:06 +0300
Message-ID: <20250918195806.6337-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250918152830.438554-1-nschichan@freebox.fr>
References: <20250918152830.438554-1-nschichan@freebox.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_125818_589382_4A48A0D8 
X-CRM114-Status: UNSURE (   6.97  )
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

> When booting with root=/dev/ram0 in the kernel commandline,
> handle_initrd() where the deprecation message resides is never called,
> which is rather unfortunate (init/do_mounts_initrd.c):

Yes, this is unfortunate.

I personally still think that initrd should be removed.

I suggest using workaround I described in cover letter.

Also, for unknown reasons I didn't get your letter in my inbox.
(Not even in spam folder.) I ocasionally found it on lore.kernel.org .

-- 
Askar Safin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
