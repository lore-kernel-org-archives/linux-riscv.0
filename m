Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40EDC25B74
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 22:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5XdjMhKhC6Dh6mF/YEeAC3Za/5yOsxleLGjPQDry034=; b=T2dIYGTi8CoiM3WbIYaLXmEF6m
	VSRVSlvanG0e+SvIY2lY5hnYxcuiObBCi31w5/4ENKGhPwk8L/lHt0gmoS/0k7+IY6RLwqWcgdlCU
	1YWoSVU+6z6k8+uP428CB8bgFKhwHoq99uNmSgoJ3rZwfMgd5iynIBCHGY4gP4skM4OWOnv0LWrHb
	sV50qQZzSkpNRmPU9V7GkE3ggfCBaVrKzDTdnCPGL/HfdkZAQCg8yAhL2AhyWSR3DTm//7DGHufOE
	KUW8XGaz1IbOqzlFxKAq7Lwdu34cP1yGr9IcCz7A0GcLwXIYnFu45gxwr/K9xtHdVTFivE9Zlp1+L
	37HANNwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5CIh-000000036Gs-2bkf;
	Thu, 09 May 2024 22:31:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59yy-00000002cPJ-0k1y
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 May 2024 20:03:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bektZwrY6X7Dpw89yPQbwlH2LMGiwkQluDbu3J3hz3c=; b=A1UXP/gBLfD0ZHEED2dpk1P4VH
	4rmRJugYjDUH+hp3VPfFrwItKsmXLEe5z4y2OluRna2w4R9Z0K/yZJERwRmCVsk3FSyYbxNixIwAg
	d2gHXpivAw8yb5bEZCl0NgfazEOgWrgr6YlhmX/sOv5FmZzzA5PgE7ZqjDvwVH40Yf8zsBfCfHdwT
	sIfgb/+YjfV0wixgAusMI9Kod/221GbtvIWgiODWmJKPbgQFs6QAwMz0Es4D5q8fF58wFJ+idooVL
	TIeMp01OMk+keRopH50QpWkPLVMIqRVvI4bsgeYYqhGzhrbREmVevZI7LKONvGQ8xYT8sZ5rMrpRh
	uyTj+vpg==;
Received: from mail-yb1-f201.google.com ([209.85.219.201])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59yp-0000000303k-2rdi
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:03:06 +0000
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-ddaf165a8d9so1723898276.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284960; x=1715889760; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bektZwrY6X7Dpw89yPQbwlH2LMGiwkQluDbu3J3hz3c=;
        b=is8ON2x1Ool6mxNeLsC37BSUb0bZdcYyltibsBBoqbTBN7CGUdugFsmuAD+Z6H8fgJ
         1sPaM6sobtd1H2b9pbFuGexNsqPXNCvVY1jY37vHkpoCR0aggQ/aSW1cwy7xZjCwAqdc
         7rr2sU6uOgsmOdI9k3sJcwatX0WIp1HyHNANWd2qwnvu9cRX8dmoUSVxwYuRslktvxqx
         0/U5QwNi8NeEp1tBgTrWLcLWABa6UByRZrZgL+AmODyqLAKa5rtpf47eCZaGDh2rvpbu
         xS8jcApL77axuT3cY8S1EpywoqH1tlPXO0EFxUUFzbJiImGITN79D/3IQoGmBjp08anr
         gkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284960; x=1715889760;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bektZwrY6X7Dpw89yPQbwlH2LMGiwkQluDbu3J3hz3c=;
        b=j5teM4KdGci5ZaUBJqyGwZ5K2breSHds7CznWdw6bRK1Wx8Tt7OP/nrlMsNHsw1MhD
         4FFQ52VmJJjMX7GYKhDVuEEQ90ypgGGX2ctpZ5LE8Xrmhwo8dywPqjllOQT62mbjuEVo
         ZZ4w9FqrHG+o896aGInIB90e0pPvq21HXfsaum5uym1+g5FSwe+sngiQUIOipIJEDPc/
         r1nCHHbgHT1VtxPwnihUei3yZXNiPFT37R9cO4ps+qy4TAWVNKRWeWnvpbtmL9k0e7Wh
         qsCtq9feBxh5vVNCRQlM9d0v3d/EMiz/0/0jBnjcZ/TKFQPweV+Q9xssO9js46BLR2uf
         YnAg==
X-Forwarded-Encrypted: i=1; AJvYcCX0ClsmfIpFzKkBrFxX7Rqwfyz2f0r06jPJqnI0och8yZdbQ7kYlaRS+MljKZvuxPqp3FMUIjvusRSOYdd7GfavNINdjdng66ggewpI2jVJ
X-Gm-Message-State: AOJu0YzRdBDqjiWZHvrds0RoesxZpDD41bi8g1VSIN/II1tajJHgIuvc
	7ScyAbOqPs0PYjCO8AKWLaoMp+750hmQIOZ7qNG9W6vYXylJ8ISDCUppkSfHTHILLDENk1dUDKs
	Jfw==
X-Google-Smtp-Source: AGHT+IHEPIgVySZLbvq9qgme/sMXplcMjKtrRTfWsK6m+jYlUbK8Q8RcqLUbNvwspV02hcVRppHAU40NpqM=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a25:db81:0:b0:deb:88f1:7d3b with SMTP id
 3f1490d57ef6-dee4f32dbd2mr64276276.4.1715284959917; Thu, 09 May 2024 13:02:39
 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:30 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-39-edliaw@google.com>
Subject: [PATCH v3 38/68] selftests/net: Drop duplicate -D_GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_210304_733200_4207D127 
X-CRM114-Status: UNSURE (   9.56  )
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

-D_GNU_SOURCE can be de-duplicated here, as it is added by lib.mk.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/net/tcp_ao/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/tcp_ao/Makefile b/tools/testing/selftests/net/tcp_ao/Makefile
index 522d991e310e..c608b1ec02e6 100644
--- a/tools/testing/selftests/net/tcp_ao/Makefile
+++ b/tools/testing/selftests/net/tcp_ao/Makefile
@@ -26,7 +26,7 @@ LIB	:= $(LIBDIR)/libaotst.a
 LDLIBS	+= $(LIB) -pthread
 LIBDEPS	:= lib/aolib.h Makefile
 
-CFLAGS	:= -Wall -O2 -g -D_GNU_SOURCE -fno-strict-aliasing
+CFLAGS	:= -Wall -O2 -g -fno-strict-aliasing
 CFLAGS	+= $(KHDR_INCLUDES)
 CFLAGS	+= -iquote ./lib/ -I ../../../../include/
 
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
