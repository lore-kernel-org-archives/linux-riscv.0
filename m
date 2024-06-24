Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5E0C41513
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 00:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WSn41jz8tM0nTHj+ofYyjg5q/UFikRBX6DXV4l3O5Pc=; b=uhJitcOvL7a+KTt+gbz9rM4Tit
	HoybW3A/htvuBo3sE82+xpqJfQLZSoZ7LSZFIZFyCT9ClpH7UiJ4Yl8mMhMajd1PmdG0SfCjMYkjW
	stIOS8svp/WvhwNk9fVUl/HWbg6SWQBSCglpQHN/TkGI0JnSx9c871W2w16VqNLTHW/8UQuukQ8PR
	hTrkcDpWoSLTZUQIuhyjLf/849VgStqBtkhurRk+pYUWalyHYhqI7s6xUYsvDW2cIjtT29kT01El5
	5mWCM1tkTOc11TjZfQRyenYVdXLv5OyKMvw2Em1rU9zbtKP/6xn+RPWk/4yPlxiJA1c8hDj5BlDEa
	1qZwgvBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLu4z-000000016EL-1M88;
	Tue, 25 Jun 2024 00:30:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLt8O-00000000yf0-1Dgs
	for linux-riscv@bombadil.infradead.org;
	Mon, 24 Jun 2024 23:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=diaj5tFwwNQVaMCQX5T2JTz4mfzyRWuO7s480xW0M7E=; b=fvjd6etNbcKU2GoQX3NuE38AqN
	6B02GdIUonUH08X99eqveJiT89FPaVpjtMlLeDbW+IUnkvAGrBt0Ypg+DPYt3E+RIp+TMs3MawMci
	E0uqmbMUCdtZNkiMJjD5Ymrftvqn/mcgLl5yqD1ErJN+hXCvYF4H05I6T4pD1a83K6mGEg9uwtTzr
	7VVLPVtzHMjWSVnEfXNvH6glE4sfJrbpRSqJ7SEq980acC4SmRZ/ZPtzqXQNvcW7q5p8hf4j2Flvi
	eqZm2h5cFNgojIQDIo9/zcHQpbsBiocXVVGLte9wKOXqNJIMpg3AyHadK/ALHgXou/8JxqDqT21rz
	I9gpwLPA==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLt8J-00000008JJ2-23cb
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 23:30:02 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1f6174d0421so52231045ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 16:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719271792; x=1719876592; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=diaj5tFwwNQVaMCQX5T2JTz4mfzyRWuO7s480xW0M7E=;
        b=Ek/XubhoPA/mMCvurlAcKgyI1H4HND3N/1CfIMBaMsIZbcWlVKXW1rUpecyBqB/xfL
         W2PMlk9Ih5IpLV/z54yOqey5FcHZpGFAhDVV5iSlSwwTVCNLyabf6UAQqbfPt3UA7FGL
         wbVb9u76KLRXRFntIIMLEVwlZ8e1EJ4ZZE1t1Hqx/YteNfBgUPJ/itlLnZ0EcPT0pHog
         bFhctAHoI9KbUpRgNxFFMamz1QHLJsMHir5zZlXlMyjv602338suaU2dfO28D+7TCulh
         UErU+ZF/jH82O0FkQ18dQdcP1UW0V7SwcQqb1VlU5+X7jtUalghSFLkYrhPuMg/eV9KM
         MqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719271792; x=1719876592;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=diaj5tFwwNQVaMCQX5T2JTz4mfzyRWuO7s480xW0M7E=;
        b=sltDVBT2e7M8o8WOf9rsYFVvBs4W5DWW0aAKlg0HVBb05Dfc1fD6pAuM919rSB5wLF
         BeSmo44wIbPmA5afqv/FiIi5RX+XBVTdIXfWuqJrjwHKII7vSl4Qn2OKd4JwKhiDgAgz
         MlCQA5Y7BxMhQ/q+FEVYkCU8VeIQx0wQgkmZd9KCVmj7vfQQNnmNLDe2jpuGd4jRrQ/d
         8NOmcyo3sdpflE5/CUe8olILj05KuxmFeU3m+ROdyQ9/pTSh/Vcd33MEj/ZpNhBRUUWa
         SMnZCB075psUBhyQHt3eWURpqQOUf8Du8xC9hv3DvnYomls6qqBCwWv1DFP+qJAjwSTA
         Kuqg==
X-Forwarded-Encrypted: i=1; AJvYcCV6Cuipwq1g+iPLMIXXsYBkceOcMo6LHy1ek468kUPyyUVM9HA6JYRKKxiCreUm9GPiK/orvilXn6xsmoBM4y610KIh4pJxRM+oDZHkYJmI
X-Gm-Message-State: AOJu0YxwgCN9ddkktnBVjaiGvUPandy/IYvAdcYXwrm2wkArhqjiU84e
	g2iiYvINsyWesRjBwBdgfDTAeZLYXCeiPmXR2WG6mMQHN4KKUGh7vAAR1QXIIM3IaP2e4OyGwXy
	0WQ==
X-Google-Smtp-Source: AGHT+IFAHsy2vEbD08I44y0v3BWNlocV2o4z95Fg4teVzqZkoUDKjX2v6KqYVtDHhi51zA7DQs3radXmbQo=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:ea08:b0:1f7:3bb3:abe2 with SMTP id
 d9443c01a7336-1fa15938adfmr8753425ad.12.1719271791633; Mon, 24 Jun 2024
 16:29:51 -0700 (PDT)
Date: Mon, 24 Jun 2024 23:26:19 +0000
In-Reply-To: <20240624232718.1154427-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240624232718.1154427-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240624232718.1154427-11-edliaw@google.com>
Subject: [PATCH v6 10/13] selftests/resctrl: Drop redundant -D_GNU_SOURCE
 CFLAGS in Makefile
From: Edward Liaw <edliaw@google.com>
To: linux-kselftest@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Fenghua Yu <fenghua.yu@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, usama.anjum@collabora.com, seanjc@google.com, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, linux-mm@kvack.org, 
	iommu@lists.linux.dev, kvm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sgx@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_003000_659858_E3B9C0A0 
X-CRM114-Status: GOOD (  10.72  )
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

-D_GNU_SOURCE= will be provided by lib.mk CFLAGS, so -D_GNU_SOURCE
should be dropped to prevent redefinition warnings.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/resctrl/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/resctrl/Makefile b/tools/testing/selftests/resctrl/Makefile
index 021863f86053..f408bd6bfc3d 100644
--- a/tools/testing/selftests/resctrl/Makefile
+++ b/tools/testing/selftests/resctrl/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-CFLAGS = -g -Wall -O2 -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE
+CFLAGS = -g -Wall -O2 -D_FORTIFY_SOURCE=2
 CFLAGS += $(KHDR_INCLUDES)
 
 TEST_GEN_PROGS := resctrl_tests
-- 
2.45.2.741.gdbec12cfda-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
