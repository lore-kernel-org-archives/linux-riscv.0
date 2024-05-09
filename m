Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C8FC10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 21:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Yd362RiFgn02btv/4K2ugz2WiaFK1Xp+lFWzOYlpaSg=; b=ALTJZtGdIMRl67yms3216OYWJ+
	xQ21Eycg6L5JCil9NR2HjBxTWgvwEA6cjxF86cwSnjgeimZro+CrX/dZEizdYkHjtO5r+93a4oHcm
	ru2u4oj3E6dh3TR1z5Yn6FaS2fJDMSQSN669vyEUK3sDVlwnwNyRNgv8KO8ziUkHAUC/W4LM5QNA6
	wdGuPfHH0QDdyll3TkKfEt36oQcUpdSF/PCOJmdKk9YYik/fC5AOzXMfdSZnGCxlePwPWBw+Llizk
	n6ubUmRQ0GyFIzGgrlXmLhxsV+FCKuUzXG7j0TXMJds1KgXczMcfW2mNHbdVptZaLcucXDYgh3hFv
	CMEFMRng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5B8D-00000002uE8-42xZ;
	Thu, 09 May 2024 21:16:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59y3-00000002bj9-041F
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 May 2024 20:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=c7i8j1MXR4Q++mSB9x/D+2tDt3WYqeMVgfSlh13oZDs=; b=SWeC1JcSBR+FMcznMKP9uKb54q
	Adeh4XekAbe9CKXXXfN9Cs6Vuan04wFKPxI34HXlb1MMrWZLc2d7db22BFEh4PLzpVhCcGMJyhWpk
	qTq13jToAbemfSakCxCetMfSnHVspvPvDVovznWLF3f1jAWU7z9hpQkH0Tem89LSU/4j9AY8HUYnn
	lG57IRUV2VvIqpp+x4S0i4sxEswoghVHu3jw1geOXvycGuq90ML/RhkXfoRCdSz+mV+Jw3FFVD6C0
	nWrHKRm2lrfQ+ITZW7/+Xfti9VIit+0Co2aRILTCQtjHRxsX6E8cAX9/2qrUA117MYKahDUw3LrPh
	Fh+87x5A==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59xh-00000002zwO-29Yl
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:01:58 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1edf507b9e4so12722295ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284905; x=1715889705; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=c7i8j1MXR4Q++mSB9x/D+2tDt3WYqeMVgfSlh13oZDs=;
        b=oxrSD3WZd1yibdZaHfZFTQSSFEuixB/qLq1TEw0NUZ+dPHKdtDias6CxFEjJMC4XbB
         qmyX64/XVcGIFCvAAGZfWaB4p20orsAEVY850MSz223U7caydbSLQu4F15r7o+064tr4
         1b4moKnWAU0izmavR7MUoZotzgKUAGC8r4GrEJSA+Yo3TxYV4Bggm9W8KbkGSraXT4mp
         2KQJoiq4WxldzHW19OUgHalzRJTNFJJA8xJqoD/bfudmlxCg6Y7m/0nGEklgUa+i1Rui
         GUl0G8LcWzfBq3yBO83I3W2TPUnH0hqVlRHnQursjKniBVnuxynow63NTguYunf9qxU2
         omHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284905; x=1715889705;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c7i8j1MXR4Q++mSB9x/D+2tDt3WYqeMVgfSlh13oZDs=;
        b=KZWBjOjmK3Z26hrPCAj5C0BDqGmH+OxiM7kxH3Cp7bmPHBDAJX6N434V9o0+GZabr+
         /COz3ZOeNKxhOAFu/ZHiplfvmbNrcwgD0hjejB1NCvTxXSYSLwvhvRIu8AO9AKgcuybc
         wsMJSFVRjtQanhlPEvIK8RDUVPTBRuIIiQYJ8+QjHjhbfA2MWRbpiuqv6p2ZQ0eJ8AcL
         vicBohEsgMpifEMsckOjwilTijDW/PuNf75UxGjrkOggjICiC5qjYLRoza2LP/CD3mk8
         G3tOzCgeZzkFaqQ5piiZTHi2V8bCp9zFlXy/v15/kqWq58GSmicac5Kb5OauZQTCEZAL
         YBxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb+eSepAlmLxIKCYVuLM7IupJ6uBf8Lf+qWDxxYw5U33hox3a7W7FfJav8h0NqP/MPRdhb93xOj6MNc7wT8x/5gJL1JPZY5mtIXE088UXX
X-Gm-Message-State: AOJu0Yx9apuym5WbMt4dSeUUUkpE6meTKWpFGzdml/MuTX5srHCBjZ2v
	ZiYfIk905OBSEXK20iejX58QhL9mtjSFQOyJjoRHQZeCJridUsvpg8wWAwzsgUums0LuCI62TQJ
	ZHw==
X-Google-Smtp-Source: AGHT+IGcE37oFpFHu0r060mrxur25fNVzNH8gnu7DuNW1Ui+yVAdSFNdy04KrcqG/HBH3zmLWEsGkp/XAfc=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:c40d:b0:1eb:4c47:3457 with SMTP id
 d9443c01a7336-1ef43c0ffeemr21035ad.1.1715284904004; Thu, 09 May 2024 13:01:44
 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:12 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-21-edliaw@google.com>
Subject: [PATCH v3 20/68] selftests/fpu: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Edward Liaw <edliaw@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_210155_945654_6BFAA900 
X-CRM114-Status: GOOD (  10.29  )
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

_GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
redefinition warnings.

Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/fpu/test_fpu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/fpu/test_fpu.c b/tools/testing/selftests/fpu/test_fpu.c
index 200238522a9d..53a7fef839e7 100644
--- a/tools/testing/selftests/fpu/test_fpu.c
+++ b/tools/testing/selftests/fpu/test_fpu.c
@@ -4,8 +4,6 @@
  * module to perform floating point operations in the kernel. The control
  * register value should be independent between kernel and user mode.
  */
-
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <errno.h>
 #include <string.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
