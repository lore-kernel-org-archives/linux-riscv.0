Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408C1C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GfP316IAYj0nBHxDpyKzGwDwKXPSgBPyMxvYjSkItm0=; b=QSfG1S09P1+sTXoJ0wj55k2JTx
	RMiTxTjaU9VVKUTUP13YEhuu1iTBv3MyVvAi/VqX2WCGn7Ib05ne6KzJxX6IQX/oF8ZqTL/1ZX9I9
	vRyv60FYgvdBf8Car0UBkV72qdqgr63E5CN4uBvwsAttGHvBhhpx+aAZfu6xnHeDeqX7p81/oIGx2
	NUp5juQpx9UhZpoz8/VdFsbZzHFtbk1ROC5rfovQi7+/ohKKR8v/rlYLNP/7/307+/cqthl21b71U
	LQbTUHRM1n7C6UEerWLTe2YpDHWeJL5xnCIoGAUhJn0bPgh6D/4UXxoP79JyYXx1PVckyT4hPdFZM
	u6m0bk5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dsu-00000003PMs-1lhr;
	Fri, 10 May 2024 00:13:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Drj-00000003OZ5-10Nv
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:11:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GEXQmokrWI+eGSugaFt5D0Texu6UPbeRbKfQ1EoEEI0=; b=IGoGJctSVYuKx7hd1ZkDcMoZ2Q
	ORLWBAVTbzWLGIZeJ2OF3+j7139O8utgDMrBpYIFxiBkYbzNY9nWPh0BJbiM/VH93T5ys25fKdbNm
	ha6cPfhKL2Cmiq+mMv3ceYtU2B6M/x7v6dsGPnPjYxgTYTCDIYfgHHn96J/avfCfx1K4oAX/F2QVy
	jfG6s6vFt0ZuTFjbMm7JmspPw4jm7kHg6mMmM56oe/PZuDW5Kp6uKZ/ritFWq0RwfnSQcCC/RJVNS
	gO4Z8IYkZGRoYeQ8UGiB2jeF4F8bEYX01vz2xFJ+egX8b+vgrl2IfZ4M2OTdrhGQwRuiDUSNXTyd1
	Bwx8OxZg==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DrW-000000036N1-0Mba
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:11:57 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2b33cce8cfaso1345991a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299901; x=1715904701; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GEXQmokrWI+eGSugaFt5D0Texu6UPbeRbKfQ1EoEEI0=;
        b=JF9borqSSuZGbvmJiRlu7N0Zc8KKQ+uiMpkysIyQu1vULd3uTFxHmB62gJi3i4Vipz
         9Er7RF00cjeRLQYZBqFxPZd42GfFmSLcVCVWCHyryBW/YJn9pnPS/Nc4wGVJlift53Ba
         nySG8edgNTUI1k0j/FRbd/ox+hUybJxBTXQqa1B5V1crev0DfMj7aMPDeRcmMc2HbG0b
         qT+grozEv6XHCcyBGn3Gu/hnMDJPS6n94KVZXylGaPBYRHvTaWTlrxuXAxGCIXEnj/SV
         K/+6MGGiwjOAW8xwrX2NB1KXsNUwy/FaTjrqU4TzkUMHqM7VfL/ohs1rDR0smJwBzMve
         hSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299901; x=1715904701;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GEXQmokrWI+eGSugaFt5D0Texu6UPbeRbKfQ1EoEEI0=;
        b=uufjCE/OEa/wTB9g8v7ohZgcnUTyKVcDlaWJ5Esmr2eSg/qzdM4FZ8UiYqis9Ho8xS
         2yRBiANguoiD/L4mSXITa+pVJ18CUT9hvH0jcQQJZyULJdEYxJcBTGI0tLMAb2mVHEmv
         QKb+RcFE67ZRQPF/OAQLkadIhcG4eKtDTGqQ1YvH9AyfCgzsYCBQW7prgM4aThwY/BH2
         M037cdVX2uirBnUlBxqlHQLAO/8l0z0p0HrhYp47Ta9IetjcX2Z2X2CwTDvO+gZsSach
         lbLDeKTbP71UY7SZI/gknNMHTjdAASzfmgvm155YoyGR6rHICm6tQk7k6HuqUMeL7ZSA
         Mvwg==
X-Forwarded-Encrypted: i=1; AJvYcCUXCE+02JasKpMg1Icz5vl/qV6yDst4wqcBowdlaKlxxfoR3hh9R9TOpylGXnurv17W+38GtgkcZ9EW/uiUaa8vzhKmVE9/Tew+wm244nDh
X-Gm-Message-State: AOJu0Ywbr5cMWoSxchGYfVz/NMebdQkvWGU33p8oG76FOEBWONrm95q7
	RS14x8ALM1TSnUxukbbgA/luK73Wo/sa7uA1vSRugLJJ24oM7brWcaCRqu0tkR3hqgfeQwyazLh
	oBw==
X-Google-Smtp-Source: AGHT+IGihj7M2pUQip2rg4KZarz+rgG5Vi5HqpEnSpOrKP8ghunMKLfzsoaIXqf3xJNXm0bE3pdliozrz4I=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:90b:3597:b0:29b:f937:cc00 with SMTP id
 98e67ed59e1d1-2b6ccc73d48mr2761a91.7.1715299900699; Thu, 09 May 2024 17:11:40
 -0700 (PDT)
Date: Fri, 10 May 2024 00:07:11 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-55-edliaw@google.com>
Subject: [PATCH v4 54/66] selftests/sched: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_011153_539698_864D44DA 
X-CRM114-Status: UNSURE (   9.46  )
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

_GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
redefinition warnings.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/sched/cs_prctl_test.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/sched/cs_prctl_test.c b/tools/testing/selftests/sched/cs_prctl_test.c
index 62fba7356af2..abf907f243b6 100644
--- a/tools/testing/selftests/sched/cs_prctl_test.c
+++ b/tools/testing/selftests/sched/cs_prctl_test.c
@@ -18,8 +18,6 @@
  * You should have received a copy of the GNU Lesser General Public License
  * along with this library; if not, see <http://www.gnu.org/licenses>.
  */
-
-#define _GNU_SOURCE
 #include <sys/eventfd.h>
 #include <sys/wait.h>
 #include <sys/types.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
