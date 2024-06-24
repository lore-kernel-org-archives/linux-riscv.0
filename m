Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6F0C2BD05
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 11:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aoCTNVwqkdObyXR755JxwjHLrsP3RhvEcesInUA9lWc=; b=toVpivj8r3UJfC
	jHgeZYYTbmBuO9D4Yk5hwph51wsCBKRzO6SyOmcaqxJBbXyTAT8pxKuJb9J322KtMa6pACo9g1rko
	9SqLz9dv2jNdnyiNs43KUXRfJ6ONX1GSfpmREWUJy/jrskZNxnzuh48QZafU9K1ucA5uwHoG3FoW5
	Kn4kSWwkj+hT/d0874LU7cKspRm9iqmx0NDrqrP2ZvYVpaDKXUtBCIuRtubg47ThAlBdZK35syEz4
	deq+3RSkHOYgfPSHypVYV+sjdRZcAW+e6t8S1sARnIFoChYck1yjjd8qLy4jxZmrcmVctNYQAW9TY
	7AQi3jkciYNNz8a8GeeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLhr9-0000000Gb5U-1n3K;
	Mon, 24 Jun 2024 11:27:31 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLhr5-0000000Gb3i-3XPm
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 11:27:29 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3621ac606e1so3071916f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 04:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codasip.com; s=google; t=1719228446; x=1719833246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ErZu25pzqLlx0hslTTrxNR30qs/NYpfkUirTISVxhg=;
        b=iuh8FM8LsDQt1Vjwc93NSvuaYpkOnP+tTCm4xRTwLK5X4kU4UNpn53uiq+M2khUbjj
         Kp6wkFYOulTCJAjGYGc1J2knv/c7ivDOTqloP6qTXqRF0t2uApAyWMatcsC3xd/PvJTb
         xK0x72vQuHg/VGTMZFa6tLfRjMs1W47GKdnyd5DsU5UiAcJnqUOC7YFcHNBhFWGb/JJh
         eTxgDG3mzVOgfPuNhpI+vkgGnKIu44Q7Y5X2qD/RAjnIHP8ijHcHuHKJykDfoW1LwhU4
         YHWBCocZG6e+jvIC3Cr+LezJINV+8V+HPCtkqC8+JATo9I7f1KBRVam4ex1SN9Rjg92G
         SxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719228446; x=1719833246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ErZu25pzqLlx0hslTTrxNR30qs/NYpfkUirTISVxhg=;
        b=bRIGp+mwCYr34Qj/TJ7B9ii1/+zzR1Z+rMNQoCK0LD3cV4qyGbFF2CF0q8Bo2MiVH5
         cxh4kFUJqX9FT6FvHgKvyBeorEb2LkWTUipF8tr4c7sFrluTd3MPZAdjaqXZ9yAqdRLy
         XQPi/rXufGW6Q6qNtVh1rMJV/xF8feP5UqItvUAPNVDM0mmZcTMGpslFThyYmTaodDOW
         5s/ySWsuZBCQRgfb8452pTmOOA1NC5QYhm7rXT7AOC4+h3F9Xg50p82Ay2XLOsVX2t9b
         bj/0i7HGNaphPuJSFn2L8B9WBVW/S3EK2+zM95UArSb0OgP7CFxw2tZ4NpZICrR4EZvD
         Jj/g==
X-Forwarded-Encrypted: i=1; AJvYcCVGD8aTrrzjZSjcj/lcNLjSDWS5kXOvYQwaL8+u38VuaqQiTFTgtHnPR69Y0CwpspVqtjo0mGj88GidRtofc2oOliri7GUW3/86/tc9bzDw
X-Gm-Message-State: AOJu0YzkRDbiFK5Er5dyw/j+d8dUxBwfdT55+Ownu1cdptk6v5osiFj1
	R+3h+Ka/MhMmOnui6Qs5kQU5ycKGqcG7NtvgJAwKw2j3gWAE5d/dfsjyOh4+9jc=
X-Google-Smtp-Source: AGHT+IFWP5JEehjY69pBjz0WQ3anDW4CngvKUSqHMOwZQlqaLIx6z5C6tmyfHa/ydbDvB++TnaXu9Q==
X-Received: by 2002:a05:6000:110d:b0:363:d234:c790 with SMTP id ffacd0b85a97d-366e332e1eemr4408123f8f.29.1719228445715;
        Mon, 24 Jun 2024 04:27:25 -0700 (PDT)
Received: from nb152.localdomain ([167.98.108.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4248191c65asm130149825e9.40.2024.06.24.04.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 04:27:25 -0700 (PDT)
From: Stuart Menefy <stuart.menefy@codasip.com>
To: alexghiti@rivosinc.com
Cc: aou@eecs.berkeley.edu,
	bjorn@kernel.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	Stuart Menefy <stuart.menefy@codasip.com>
Subject: [PATCH] riscv: Extend sv39 linear mapping max size to 128G
Date: Mon, 24 Jun 2024 12:27:07 +0100
Message-ID: <20240624112707.2183752-1-stuart.menefy@codasip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240514133614.87813-1-alexghiti@rivosinc.com>
References: <20240514133614.87813-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_042727_923721_F161A84B 
X-CRM114-Status: UNSURE (   3.99  )
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

Alexandre Ghiti <alexghiti@rivosinc.com> writes:
> This harmonizes all virtual addressing modes which can now all map
> (PGDIR_SIZE * PTRS_PER_PGD) / 4 of physical memory.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Tested-by: Stuart Menefy <stuart.menefy@codasip.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
