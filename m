Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5626DE77347
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 23:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DOSMVnxJDRB+9YdKHBEmp0qx96dTgw1A2oBYknid8Xg=; b=O3Qan5wLpwqMDy
	dwlk/NzW7zEdzg1aMdA6SkV+3em7zRpVTGWH1TkcjLiIVIL6PIo12/9WdnmO8I+i21ODHNK+HyaNt
	KQi9j0TZGkbaxKxMSICm77bMVCbv2fw5Or+JBm+ORfc7PihyaSYo8BWMOooixrzCWSzaw29KiNQ4+
	VDTK5G2lV4XlOI/HuYZSxKa+KEjheNEjrrYVafTjBNCNl0g8JkWxtXWdfNfM95byDbLkVCVpyGMCE
	m8Bx2I7GNr/atp9d53aLM5wgHHt1vcJrClRWiUzosl9v9nVvq3i0UpAiSXPWwxjZXCaWtrs+5qPFQ
	0K4wF/mH93Sy/Dxbvt7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmMYu-008gXs-1w;
	Fri, 29 Sep 2023 23:06:20 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmMYs-008gWs-0h
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 23:06:19 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5827f6d60aaso6913105a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 29 Sep 2023 16:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696028776; x=1696633576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JS8hWFdIolHgfI50iM7ndmrsQjVMPHZC5aONoPIyZAA=;
        b=HO3gu9JIHgQEh17mXfYUQTYnj+lmvHJf1LzyacVvpgySRag3caOlv2GFJaSG10tRHV
         ggissRbruybHIfHjrmHlU+SvzdZvS6DBsn/FoTEJYFHI/Lsc5aWa2koKPH3p70v1GyAt
         mXgw3Zrze0C/UpPY5uNADSKBMlLLAvJB5gQKbo6SYlGjJ0x4vXgMXl//oFT+3YXLRhJG
         R9GXriaWxi0ogqmpZdJP6tWjPeM8eHyEK37RwZlOpxBxMdLjJIES8UXAP7gq46S7NBfA
         /bIOvKBmUB4HX9mfvgs8u4xyJW5f0vcsRVOBUmHb89A/SkaTZ59ZyegTFjWJ6lWdI4pS
         P3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696028776; x=1696633576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JS8hWFdIolHgfI50iM7ndmrsQjVMPHZC5aONoPIyZAA=;
        b=Wcyt21VeoxrfZJD4b8HjOZD0XsUVnlgl1QNQglSfGzbCnH5Kj1Pi0tu4Uq8WmB6gYv
         JnmVyL5AfGX4LR/eDKee55MgktFUeNVZRp7nbY9re7J4YQ/+waOALuD44Z4CfmiQ6mot
         Ozc4XDZH61vMdOVNECCF9LhntXD/7/fE4yBpbScxmXiMWTVnlkE9HoghZ6pGJ7/kp29m
         BAsvvM7Qxg+FArzWw+/ouN0TAVDnYcFR0H2OPyFGBGoFanm2Vm4kKdE5jOPm9R0+QuQa
         9iFwS6tbpoprHoDX7fNMVyCl7CAZ98OF6upm2Yxw8Fn++Kx9wwIl/rbicMas1360kEOz
         3vWg==
X-Gm-Message-State: AOJu0YzfZQ+J2FAYbkl/ADwsq32rBsY8YsBE8TajfWpRV97ysPwwbNXe
	abhjtC/qEX2IC5WLWCrnHFI=
X-Google-Smtp-Source: AGHT+IFfV8wZh0MisNVzSqo3/Gyg2t0pUDH20dbx9PffJOXhqMoMkk633+SsFUvK1DyB9oSWjLjjtw==
X-Received: by 2002:a17:90a:f697:b0:277:298:deae with SMTP id cl23-20020a17090af69700b002770298deaemr5133437pjb.11.1696028776410;
        Fri, 29 Sep 2023 16:06:16 -0700 (PDT)
Received: from pek-lxu-l1.wrs.com ([36.129.58.185])
        by smtp.gmail.com with ESMTPSA id t9-20020a17090a5d8900b002630c9d78aasm1967024pji.5.2023.09.29.16.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 16:06:16 -0700 (PDT)
From: Edward AD <twuufnxlz@gmail.com>
To: alexghiti@rivosinc.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	conor@kernel.org,
	gregkh@linuxfoundation.org,
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
Date: Sat, 30 Sep 2023 07:05:49 +0800
Message-ID: <20230929230549.45206-2-twuufnxlz@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <CAHVXubhG2c=ShFHF4hMMFm8=BYDTyDUduOizujbUWQBW+55wTw@mail.gmail.com>
References: <CAHVXubhG2c=ShFHF4hMMFm8=BYDTyDUduOizujbUWQBW+55wTw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_160618_262457_8FD1AD19 
X-CRM114-Status: GOOD (  11.25  )
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

Hi Alexandre,

On Fri, 29 Sep 2023 10:25:59 +0200 Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
> I'm still not convinced this will fix the kasan out-of-bounds
> accesses, the page can be valid but the read can happen at an offset
> not initialized and trigger such errors right? I still think there is
> something weird about the stack frame, as to me this should not happen
> (but admittedly I don't know much about that).
The added check can confirm that the physical page is invalid (whether it is a 
vmalloc allocated page or a slab allocated page), and exit the for loop when it is invalid.

Perhaps we can trust the test results of syzbot.

Thanks,
edward

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
