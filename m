Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FC7E77347
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 23:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aT9sI2vEVt/ubr5pOjJPzq8BjxljM68pnEvX5RUyvvo=; b=AKLKhSZQR97SjI
	tiXPZFYxLVbek5eU68dnk+0OJPBOBkzVK2DwhaqemrRyAzwfGKtECDO+51OoEFHlAF4CiYZwjVA2z
	niZs36q+pAZJCL4UlPFbPkr7Jw6MjrgNuhHZZNSWJ0gIzx4fQt9D80OSPDpXlg2Iym/4DXSwnQ2Fz
	Jm7z5tae3MjH59O/CTlNoOXT4iiSRtr893vPNHFRkSu36SAKIbztzZyXHW420hZspTXDFaVuuTtJs
	FilShLMUV2802tuver1i4jGBmoxw5fueJ4u8qnYS/cxQS/xfRIk3Fupb+jPOuwJ93pomRE9m8iReh
	R8fsBIZdbyFv7XfUbPZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmMYO-008gUi-0X;
	Fri, 29 Sep 2023 23:05:48 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmMYL-008gUH-0i
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 23:05:46 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-578d791dd91so900278a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 29 Sep 2023 16:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696028742; x=1696633542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tO/3fjY6V7NXsX7xew0hJBkgL5vxDhdDpy1c37B9zRs=;
        b=WXI3Mj4Q7U6bFnCLNiuWNC5Y/ZIF7CDhtFq8W+igEQsqxCnwH2pivJ9tZt3haypBAa
         24VvV5acXlDMMvS8PzzIH8DxI7WtMf/5OxnjlLHmbJPMooM3GyPTTQpdQXAAqDMDPzPb
         C9cWl+mJM/MtljqlIv8ZTcQRcpwXR3l9WK2sVRXrEyqC97d/wGyWrAQ8SjE/G8b/tO/k
         oSlok+hF9Ii11+Gu7BclWYbAb4qVGYa6NEGk4lXda8wGPfKoo7/9JDHBCs1MzaSHOi9/
         h+jgq/OQ/SwQrKojsHggxEH9Owh/ElCbBDskN0NAXT10QaP80nJ/6QUDhozQYrkjgcwU
         Mg2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696028742; x=1696633542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tO/3fjY6V7NXsX7xew0hJBkgL5vxDhdDpy1c37B9zRs=;
        b=hiqP2GdlJ3L4JasK5FSciaNaquViIfWgYeYVCk3txPq5L/JXX8pkawpPRM8JDjApur
         6neDvd2W0GecaTa0dX86y5317QXNiuWZ3ycKFZGX4kSReWv+ADWb69K0qBzgns8t0nzg
         sKzTn2TQJ0pgihZstl0g3s6kehs4jh8os56C4HJ7U0QJz+tHXIvJQAYkK3SEHOsU/zwv
         bpjebmCJBQY8XWHkFa8cTNFVl3ka/Rj6/hMQJdFud9HtynIe4rG/PUCU6gJqaC1+f7Qy
         fJF6BsHGkaF5CheFf6Bw5OPHMt9z0p7tih2LTcgqwVoW6BWtr97w/KmuUt05wW/GLr1V
         Md2g==
X-Gm-Message-State: AOJu0YzsoO01InZGDlvqHPoQJ0AE+nYxva4CmmoTe/K9Fci3iAcmiiqc
	QeoX/O8x99R6U4mYmOHkQvw=
X-Google-Smtp-Source: AGHT+IFrw1dPJE3cXJ1o6BoBTIGR8EtX662/Ps/RLmspptBTBu/hV6/hDvN+n6uvIda9Nqq5f2szqA==
X-Received: by 2002:a17:90a:b396:b0:277:422d:3a0f with SMTP id e22-20020a17090ab39600b00277422d3a0fmr8751976pjr.17.1696028742549;
        Fri, 29 Sep 2023 16:05:42 -0700 (PDT)
Received: from pek-lxu-l1.wrs.com ([36.129.58.185])
        by smtp.gmail.com with ESMTPSA id c7-20020a170902d48700b001c736746d3fsm3768151plg.271.2023.09.29.16.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 16:05:42 -0700 (PDT)
From: Edward AD <twuufnxlz@gmail.com>
To: gregkh@linuxfoundation.org
Cc: alex@ghiti.fr,
	alexghiti@rivosinc.com,
	aou@eecs.berkeley.edu,
	conor@kernel.org,
	guoren@kernel.org,
	jirislaby@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	liushixin2@huawei.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	syzbot+8d2757d62d403b2d9275@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	twuufnxlz@gmail.com
Subject: [PATCH] Test for riscv fixes
Date: Sat, 30 Sep 2023 07:05:35 +0800
Message-ID: <20230929230534.45142-2-twuufnxlz@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <2023092939-lagoon-punctual-e312@gregkh>
References: <2023092939-lagoon-punctual-e312@gregkh>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_160545_263939_7BEBE97D 
X-CRM114-Status: UNSURE (   5.49  )
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

On Fri, 29 Sep 2023 08:04:57 +0200 Greg KH wrote:
> Where are you getting your odd cc: list from?  This has nothing to do
> with serial drivers...
https://lore.kernel.org/all/0000000000000170df0605ccf91a@google.com/raw

Thanks,
edward

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
