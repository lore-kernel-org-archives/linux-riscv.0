Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B1F10BA437
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 08:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MxJPw6y5RjFMtcu9EERa21l6zoKGCcW1xAUQKyp8kEA=; b=aDlmN+S4Zo8B1n
	9W8tEne6HsL3LF2nEwr/lnnFYiz4soexmZzp5Z+wwb2oP2dQiQoFeLoDuYI8m0aBL1/5l52KzZhvw
	8BsesnlwCa14tMetB7tfrFw5URhUtqmBKyMxLng6xntezBLvX1mHxsTaps0rTKYYn+lMmtIFCk29c
	i8SASuLp1gGAqZWImK/WjWEF71vG37yzEQCtozhARwIT/Xe8feY7RbJ1eUNr2mK0jOI1xehLjQn8f
	tX40PqKgltHtCyW4573oTaUSdI20Pw7S6ijiETSmpGUE4XV8oI/7EnHsnpg9FVprA8dxswdGJxEqo
	0bulemyArzbejzCnXQsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w627s-00000006v84-3FS2;
	Fri, 27 Mar 2026 08:01:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w627q-00000006v6b-3qI0
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Mar 2026 08:01:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=K4moBxHVs6SiILsKE/Pxveo5RaXduWTr95oeVQa3H18=; b=jFJ3XIwBZ0eGCreYiV6mpX+gNE
	AUu69v8Bb6X8SR9T9/7GwMEjwtqwXTyj7PadMgQFOglI8+pJxCHI1wUX3Dxy4I8pYHdsWKG/dFYqp
	cTibmS9HKspUXCtaY5WCsqKnWcJcyT0MuL7ZtS58ns86Mw6RrtS5j99L1GI09BltwhamWc3Jv9yGK
	fq+qjhwDC/qBqCpo7ayMRF1sPseP96UoNSj7Wb4Wkl5iJWgh+bRi4UxcqtCV8nch3ncjzMYdU7x+4
	v1M2Eqt25Nf3lqvH2WPxzUzAaMThs+3URtrELvyRJDu6nwVpsya9uni0kazjBAI3qoCBtO2LLuC0H
	Hhau6+pg==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w627n-00000009vJY-1Blx
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 08:01:01 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so17637435e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Mar 2026 01:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774598458; x=1775203258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4moBxHVs6SiILsKE/Pxveo5RaXduWTr95oeVQa3H18=;
        b=UMsCfGMI4WPN8h7wK1dJLOU1U3KlYcaWeN2Y+EKkwVHZ8g0CU8AWd9sHZjtSFIDPkm
         uXa6C8QDEHj01YKZx+yOxAcPEp+Q7qPsf5EW8dvgD3RY8VRCHM7x69T9eynG4gA4e6d2
         iytzV5ODT0WJo7xIhtqCy5NYYpXev1+M7nU53BsBjB3EKRkjwlXivjZdgc3cv7CCd6N8
         xBCz54B9MAdb888UyvJzXhswavpMUZG5+XAatqV8NHrxlp6tJGVO+xy+dxYNo5Wysxm3
         vLz23oikM3c+ZN+Hw8cCaj2KdQOeTgGT+/Fx2Hz4qIluX4fYr9YDW9f4xHH55vzHgNFB
         u8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598458; x=1775203258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K4moBxHVs6SiILsKE/Pxveo5RaXduWTr95oeVQa3H18=;
        b=UBfCOAMqKdKThLMa78qOCEMJhsXc+dgU91uy9qGin0lJ2Xbfi10/eBQ3UI1o1GF84N
         AptWsn4XtHRm+6XbtGGCZbBuvcHQ1tULL5irAdmowFLkiKxKUgMpVt4GOb+R9Mimwf4M
         dTWYpPI9aZ5YtR+kLv37nm3gyVvMhH7isDxyqECvtqzkoJyU96su6nTrfcPtQBV9DPIi
         1uM1XBVxNnZxJym1xFHEHEuodzGHDkZAxJCPDu3QcCbT0GCsrVult6+jK02cLrPrS3PF
         3uaVlZFhI+AcCGFEaBMenwsVDuvNjV1EC6PeA9km+9EaNftXP+8BzHiCF5F0p0p9lFUz
         zYIg==
X-Forwarded-Encrypted: i=1; AJvYcCWvUgnbPHqjCoPx5iXijFSb4YJrSGz/jcIo28U+Xezbg4anX65s5AGv4Yo4sYGVuMqooQ9V2G9Eo2TwzA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjH0PRPnusbq9RowLd6+JfwE/Zju+cuaYIsK+yHc0G/HyM5b1s
	JFFF/ueFDATS5p8QbD1jwsVJqbQLFgQ5LPhzob6rc9ZoSBgDAiFQU3Pq46SdqGtP1RA=
X-Gm-Gg: ATEYQzzWYD8d3cCCtoZQiKmqSK8oMoe/hpDJdMPyNCyJZyrQR9l4PsfMgHqYxsFqlTD
	9FZvNvBA5VeC7BGoYB03VHsh35nMiSpxcO7XzmHQw3A/aj8Q5FfeVXzAuRSFcZuIKer0nByXnUT
	0jjFPgrP9Nu4gmQ9G2q9v+EGqoXyHQoQXqU0r0fbhNi4q27rJxR1DjivUHNDpr9SI9EXCu4p3ZA
	9jE6dn5y1FZ8sVKdPTM0cFwn0BIRw9wFyh0ovPcvWM+AET9Zy7dBpRTzjjI7avSFzwhMzRUnXo6
	zWz6qu5+HeiFvE0/jRvLZsJxEpaWt1c+YN65MfcAPckld6uyOhRxgqtHyAIho6IfvcGNoDV+0ua
	lpXkHlYYsgaEy70myEGFWBnglimavWgEjxcHo6S8VfJgYi5+F1Yu31SrAjwlv6aDeK7EW5R3Eoa
	bGmuB5cmVjtS1Ct8OJFp/vWdvW4MvJJEVX0uXiVPk4
X-Received: by 2002:a05:600c:19cf:b0:487:1108:48bc with SMTP id 5b1f17b1804b1-48727ec7695mr24399785e9.17.1774598458048;
        Fri, 27 Mar 2026 01:00:58 -0700 (PDT)
Received: from zovi.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725fc4827sm12089735e9.11.2026.03.27.01.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:00:57 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-riscv@lists.infradead.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] module, m68k: force sh_addr=0 for arch-specific sections
Date: Fri, 27 Mar 2026 08:59:02 +0100
Message-ID: <20260327080023.861105-4-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327080023.861105-1-petr.pavlu@suse.com>
References: <20260327080023.861105-1-petr.pavlu@suse.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_080059_586940_D28D64A8 
X-CRM114-Status: GOOD (  10.83  )
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

When linking modules with 'ld.bfd -r', sections defined without an address
inherit the location counter, resulting in non-zero sh_addr values in the
resulting .ko files. Relocatable objects are expected to have sh_addr=0 for
all sections. Non-zero addresses are confusing in this context, typically
worse compressible, and may cause tools to misbehave [1].

Force sh_addr=0 for all m68k-specific module sections.

Link: https://sourceware.org/bugzilla/show_bug.cgi?id=33958 [1]
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 arch/m68k/include/asm/module.lds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/module.lds.h b/arch/m68k/include/asm/module.lds.h
index fda94fa38243..fcd08689b282 100644
--- a/arch/m68k/include/asm/module.lds.h
+++ b/arch/m68k/include/asm/module.lds.h
@@ -1,5 +1,5 @@
 SECTIONS {
-	.m68k_fixup : {
+	.m68k_fixup 0 : {
 		__start_fixup = .;
 		*(.m68k_fixup)
 		__stop_fixup = .;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
