Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C3AC52D6F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 16:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7kIlke99bTA0pZxsLlQ0vn8ToMw/kNPgZLQwlibKCfI=; b=DriOkfG2ZqVWet
	6zSVrXOzqNq45JKRHDMAnzJoAn4Mos83UeSjNza+djBZAUdzf3VMEswal78IbCmA9AJle8VjhmIv3
	BMgdIZ+xA60c/mnw7HOCU4taF7F4ndGfObPEW9TZJtdcTQUAH3obMZfx3pMhyq6tVV5VU5CRZPkNf
	Yoc2LBEEFRh1Z3ohMa39qGu4LKBl7QsPw/FESSO1CJqxZYvyR9Izvz/VIgBRTvWqntX8gK9CrcPnx
	SiUXTbY5NcfcCFhLwFqB8TsOk3ejzTHQVQ2+sCffTFd8RLB5awYBO3/E4JXKYvsCGK9Jfj3SxyiXk
	SeR7MIDJVcVp1sU+cdYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgnu0-00000009gaS-31W9;
	Wed, 21 Aug 2024 16:09:40 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgnSq-00000009Xot-1CA4
	for linux-riscv@lists.infradead.org;
	Wed, 21 Aug 2024 15:41:37 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2f3ffc7841dso2588821fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Aug 2024 08:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724254893; x=1724859693; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJChN869UL/h3+G10gWt4CYZ4ps7Wq+zty4zLe9qiVY=;
        b=jX9pqoLxpejl3tnsxseCwKFlX19MYCpp/iIMRfNRazq/4uXfvBolHsPwgGwfDiLEZ0
         uz6mu9ujmEpeBIN4tH3akhAsC0krNizPWjaAD2yx+Hjm83q30UciiTDODJZ7Uah3Y8lQ
         cbU5bRGv9GIoBJgqLX2wC1jg0VBMO4lNYI+unWpxQ5v4MZh0Jrd0DmjJd2DM2IZYl52N
         mVDiSRGk3ReAQxL1WmL46dCFQNtXR3Nhl9fcOf8++nPZLSZDdpwzY/QbiuJSmlu1KirD
         Bmql1l5ZPc8QSg/xir/bW2x0MdvdoiUWVzqYenHj87+6FtNI892Mr/8bvuRjneP/7v1z
         JaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724254893; x=1724859693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJChN869UL/h3+G10gWt4CYZ4ps7Wq+zty4zLe9qiVY=;
        b=tkKU9bDaIONYxkbXL6f0B68RH2B05do4LMiHdCIXm8qMETKACSPHIU+jPRZx44TcW6
         k4oSGPRWa/MjgKUxTBtmypfI5/ut4XQyZVwIugm9Z+Ip5pP6dQt62sXYnBk+eaM/+/t0
         Jcpc5Sbmwv7odPguKsc+eLBq14NS8/Z9lkBjUyWjkiSj+oNe0LkjVrIiMFpUH1rytTe8
         QWpaO2xcDHjlYAPwV8zgA4qnoZR7QL2fufPSh5at9RY3PD0I3c0Pz6Qk/nSzPOV42nB5
         D2VQ++DLe1y9JvpI0IZZZnoNKFk2bJtvqGm9JLQvJ4i9BHEOEdDjjMPCOAtXH/lSDZiy
         5gPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXY8ogfA95VDfRujmVRPJ5+1ybaf+l7rZCoAIJo9sQWhW9BHWyR7mlhg8K11cuoPilqZIPWBCNMZbc8zg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwCP+Ip39UVpbNvpXlKw1kA96/xto8mWR9tnjsSpK52clI7JvL
	7SGnfu1obPsYuWmDItv/H9L5/ZPY9e9euXkaw/VAnKwYfTvXDTlV
X-Google-Smtp-Source: AGHT+IF1q19g9sPEkyhyIQ2mVqcE2Hrd8pSMhB+vdCqFK1lIj96Ld2axJ4ecGOR0fc6OxLmfWalUtg==
X-Received: by 2002:a2e:9584:0:b0:2f2:a436:f31d with SMTP id 38308e7fff4ca-2f3f88f8a13mr19415621fa.26.1724254893065;
        Wed, 21 Aug 2024 08:41:33 -0700 (PDT)
Received: from localhost.localdomain (145.14.26.98.cable.starman.ee. [145.14.26.98])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-2f4017a3922sm128911fa.70.2024.08.21.08.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 08:41:32 -0700 (PDT)
From: indrek.kruusa@gmail.com
To: charlie@rivosinc.com
Cc: apatel@ventanamicro.com,
	conor.dooley@microchip.com,
	guoren@kernel.org,
	heiko@sntech.de,
	jernej.skrabec@gmail.com,
	linux-riscv@lists.infradead.org,
	samuel.holland@sifive.com,
	samuel@sholland.org
Subject: Re: [PATCH v9 00/13] riscv: Add support for xtheadvector
Date: Wed, 21 Aug 2024 18:41:27 +0300
Message-Id: <20240821154127.105-1-indrek.kruusa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZsPQVpJAh7L5kuXX@ghost>
References: <ZsPQVpJAh7L5kuXX@ghost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_084136_343434_30240874 
X-CRM114-Status: UNSURE (   8.99  )
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

> Anup sent out a patch to fix this:
> https://lore.kernel.org/lkml/20240817081218.2985171-1-apatel@ventanamicro.com/.

Thank you for the feedback! As I'm seeing now from related e-mail threads then
the issue was reported quite a while back. Obviously I didn't dig deep enough
in linux-riscv archives and started to kind of bisect the issue by my self.
It's sad to read about how Allwinner doesn't provide much or any resources to
maintain the sofware support for its own chips. The next problem I have with
this CPU (D1s actually) is that u-boot compiled with binutils newer than v2.40
will not boot. But that's another story.


Thank you. I appreciate your help.
Indrek

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
