Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776CAC43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 10:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=75N9XVSeaMQ1QUb0Flz25bgKK+HItZyrvm92YoHtoDo=; b=ZV7SLQWQVRf3DN
	PANWuUwRrDBf0psFmpLrr/1CrJqiNPRPaGNdztLjnggXJlgMZ39mpWX2kqHW+hBnxVVqdRg91v9oW
	LqyXhXl5TB5SOLxFgYTvwTujuqSiZDRG/qo51Zj9inMlQ8T7Is+jlFzJPzlZZJ0qmH72FXbQW5gBu
	wNQqb1zC7AwODBVeE+nGwQWVNcsKB292KlYhRsnZBkpTb6IRmkKPauhCsXUN4YtgCo3c63wbIJtQQ
	247CjkVQcIZKK+sjSiL0+WU9npWqSzq3ZvqnqytugvbjvnYtcAgOreuXcJDkVg5pEnRIf0+hjqcJw
	cZU7B3095HKfrYFnM79Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDhx-00000008rMd-03oF;
	Mon, 13 Jul 2026 10:16:17 +0000
Received: from mail-pj2-x00.google.com ([2607:f8b0:4864:39::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDhu-00000008rMF-0anr
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 10:16:15 +0000
Received: by mail-pj2-x00.google.com with SMTP id d9443c01a7336-2cc6207127aso15669365ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 03:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783937773; x=1784542573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Pw/M9cQ/WNEAfuTTS00025CV/d5Oe7obd9EEdA8IR8=;
        b=bl+h9BwbWynYpOlpD5s+3Pq9hk6VC2YLbdczhGmqQiRCbSv9OiCOI+nCYuhtUJ1pG4
         2CcaJJN4RArBYIYJTpHoID5eAOoLGbLClZktLxvuuMDn+T8z9DxpYXoc9v+T1YbnxABm
         roxVAPcFx4Ffrqh47uZd0dtmNK+0xc0KvsbjZpopDzkzwS9nva+MfCOTY+nWpa5JItQf
         hGP2pdmG6kZ4SmcVnpR2SJb2Ks/7xtMOpd1X/mx1L1V5BaHQ7OaXuPUJKlmn/jh6jZ5u
         be4OBqCKOxCCdlirLSs8pijvNFiqDrCJpUwlqQ9nrLRWuUio5D8GZw2HkD+pbT+vtOST
         SZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783937773; x=1784542573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Pw/M9cQ/WNEAfuTTS00025CV/d5Oe7obd9EEdA8IR8=;
        b=tJ8Kw4opuuUw7I+wK5//+yIC5suZhfUh2NbfOoQNUwa+MtVu0eYRrdC8lkGYzh+BX7
         zf4BaRfGPDUZ1D5uPLbs0bh27HSBrVY4GA8KrJM5aVEd4oohb2/OlF55SgXS0HNXq0EL
         3kSZzoltiyM8M6QFxaoFtw/o8GJbnBaJKpy4awzArNRt64Tc0j/Juaua5cDvhpZbvjXa
         69cAC0m7eANiZaDmfq9Fxqjmr5lm/8DDh5ft0m4RteAwGy8I3Dc8cHVK0WRAHDjYEkuU
         Be/MTi8wPG8A9PC5Pcz6Dd3NOX6VsAJFsbvEX8FfbpugrEGQEBwa+TRSY9VgJL96udRf
         36gQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+fuOuQGtW83eaCJkj9dqGzF0pVdGSuqndma/0+jVv8KmqhyTjnZ453ddHRUAoP1fLbJtcWSchdEwYnw==@lists.infradead.org
X-Gm-Message-State: AOJu0YweGyF60iitFPpFP/pgaL8+WpZhVxg+LAdJCKI9rJJZGeteKmBz
	r04WAQZumYE8UrYjoEW2zSRD15XabPcisiXoA/WLXKtUqctInE3ATLNA
X-Gm-Gg: AfdE7clvUSxMQEU/8cZHVNf8oB9dW17YoyMWcjdWJ8Y/ZdZPT2dXh29B9IozHcFvnDX
	byUeRcN8Jxy5p+oGSzbXM9HuqhkFVXCyUfjMLwjkGeN7FP1tuFibv4JosqcaJxkayewRCgCT9GM
	DfmC/bWF6dJkYq6C4fu4FvzmqRLi7W12aNgvHTE4EIsrZienVVnVPDvvaFMGnkFleAEq4Vvaycw
	w8QDW1CyY6LSy5MEU/0iEW/Vu2Uey5DGfscz3BEOllWQHZ1d5rfM/zhJ/g9rjQjOMVFbIUzbHhA
	gDuGbh7XReiqD/7EH08khPiNbfHcvaq1GP5/e23njX21my8vtAzesHm0Xdv45nmyN68VM5dv2RT
	LmhD9KhBttugn6Zu0zjzhg+Un3OaBP0jvMTPZZC/ayiJGN77w9YmN74B2g51bjEH25GVmx6Iibp
	BMYi2tlO68H3SSxfafTMDbQR/vWRA=
X-Received: by 2002:a17:903:2d1:b0:2ca:6c8:abd8 with SMTP id d9443c01a7336-2ce9eabdb67mr74433615ad.12.1783937773073;
        Mon, 13 Jul 2026 03:16:13 -0700 (PDT)
Received: from q-System-Product-Name ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb56fsm98067295ad.15.2026.07.13.03.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:16:12 -0700 (PDT)
From: "Bingyu.Xian" <shanbeeyoo@gmail.com>
To: Gong Shuai <gsh517025@gmail.com>
Cc: Tomasz Jeznach <tomasz.jeznach@linux.dev>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: Re: [PATCH v1] iommu/riscv: Add page request queue and IOPF support
Date: Mon, 13 Jul 2026 18:15:46 +0800
Message-ID: <20260713101548.1594496-1-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <0c596ea4-8c29-4e5f-8238-cb8f8c5015fc@gmail.com>
References: <20260617090116.3254505-1-shanbeeyoo@gmail.com> <0c596ea4-8c29-4e5f-8238-cb8f8c5015fc@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_031614_185647_BF608CE0 
X-CRM114-Status: UNSURE (   7.60  )
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

Hi Shuai,

Sorry for the delayed reply, and thanks for pointing me to Tomasz's
riscv_iommu.next branch.

I agree that the PQ/IOPF work in this patch overlaps with Tomasz's
ATS/PRI/SVA series.  Please consider this patch withdrawn.  I will review
his branch and coordinate any remaining work with him rather than duplicate
the existing implementation.

I also agree that the debugfs test helper should not be mixed with the core
implementation.  If I send follow-up work, I will keep the test helper in a
separate patch.

Regards,
Bingyu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
