Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83780D60CFA
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Nov 2024 23:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+HpY/VfrN0H9thwNh6Jxkp/yPYppWbaU3z2gGbGy5kk=; b=AY4gl13k5m42z5
	Uki3bVAbzhFcYUZgvVAjitzbHIKNLscng8rV/JRAMYI+FrwnsPU6u9cI+WhR5sE9Yx4I7ubr0WLGr
	WfqOzgGNg1AriLwsgSUH4shwdJu9aaz9B//tDEh+x6QKzjSAsResyuOUcV4ygMUaXbQEmAXEp3mFw
	6T4qWBG/I+YaTOgJ2EgyTGKyu6e36fS9/X5Rsutfx8oLKuc8AJgxv/sr8dcagpxI4g5tNp2VjqIA1
	+6XLJ3Cs+KCp/bLdFOdVV+qoreK13wcnbP4fCkKuz6vjlD76npHNP96bE8ZcjuIi9gVsmEclcnxC/
	GSk7bypQXcu69Pi37Otg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDAkf-0000000AoKV-0ZK7;
	Mon, 18 Nov 2024 23:01:49 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDAkM-0000000AoEX-0ERI
	for linux-riscv@lists.infradead.org;
	Mon, 18 Nov 2024 23:01:31 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7b1488fde46so16068485a.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 Nov 2024 15:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1731970887; x=1732575687; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=djuvR/hK6Phqs0gApr6Ryi9KOHrK/yeBmxBlrxcxSDU=;
        b=HFEGPqmG2zdDt9gAAsHtL+/HonxLoCJDthJfkhbtU+xLJ0rp3woK8TBYkFDkoXjIE2
         ce4JV6nL/7ouqKEr1wLnEbr6O58/dKY+fEs6d7tvqyI5KyskSzT03kNfLrq9AgQzrdhV
         EUdnoWhn72Lj/kc4xzGbRoHhMB6kb0rYTjR3mhhZfHXtA4DNieemAuAVKvV+gyHeKg9L
         zqmJNuQYWtn/TOtflAQCw2tphcA8AP4QaX1c16b0+IPcBrG24ThWRO2NSNolne2cqQcy
         H/WaYziNJGwVPWptqPTgtO75/INfe9muil3QFYpcjqK0irCAFMoJJ9mNtMXUX8tVJq+p
         cvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731970887; x=1732575687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djuvR/hK6Phqs0gApr6Ryi9KOHrK/yeBmxBlrxcxSDU=;
        b=fKJG0VCrPpWHciIQTV43wMV0PjtA7+B+dR1VkmgJDKJUv143VTK1WSPxROjtiB9Xyx
         /o2OCzSLXdpPC/NH3DSLmnhd2t4ED25TtxBr4zLvyIlS5aoRpt415x0y9jeni5eVEsZc
         LJktCe6rs5J41lzK6rMPMBs96nuLbQitEEtAP0oTDaMo9m/VGTkca0uxVy/HYwt+vDa8
         g0qkxInQkGAMwsZF5EW7W/CoB+kph9yRYmPgSglzQ2a8gNu35IgZ+vxzz9Uxw1V8cJc/
         xywiZejnNrkplnxW8pjc+LxMyEy+2AESjPKrKrNVSHNBk+Os0SEo6SqJMq0djIkAW2+o
         5+0g==
X-Gm-Message-State: AOJu0YzsZfEnxRVYgksHZL5+bwkwWUSlrO2I541k4SzKOlcwY1HYFeEo
	LqZ+8zWWwkvkRX47jiGfulSMNXQ9aYuCcOWzwjxUPX0CsD8b4VqT1oNcOwIthA==
X-Google-Smtp-Source: AGHT+IEb5VGhHOeSAKca+M48dLT2SblGVszeSfsokiKrXZGx+fD2vDeKB6QVtLklhRn01Q/fEOq68A==
X-Received: by 2002:a05:620a:45a4:b0:7b1:4d6a:b99f with SMTP id af79cd13be357-7b3622aadbdmr2257319685a.14.1731970887347;
        Mon, 18 Nov 2024 15:01:27 -0800 (PST)
Received: from aus-ird.local.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b37a897eebsm35344185a.94.2024.11.18.15.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 15:01:26 -0800 (PST)
From: Cyril Bur <cyrilbur@tenstorrent.com>
To: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] riscv: uaccess: optimizations
Date: Mon, 18 Nov 2024 23:01:08 +0000
Message-Id: <20241118230112.2872978-1-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_150130_156757_2677EE60 
X-CRM114-Status: UNSURE (   9.05  )
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

Orignally sent by Jisheng Zhang <jszhang@kernel.org>

This series tries to optimize riscv uaccess in the following way:

patch1 implement the user_access_begin and families, I.E the unsafe
accessors. when a function like strncpy_from_user() is called,
the userspace access protection is disabled and enabled for every
word read. After patch1, the protection is disabled at the beginning
of the copy and enabled at the end.

patch2 is a simple clean up

patch3 uses 'asm goto' for put_user()
patch4 uses 'asm goto output' for get_user()

Both patch3 and patch4 are based on the fact -- 'asm goto' and
'asm goto output'generates noticeably better code since we don't need
to test the error etc, the exception just jumps to the error handling
directly.

V2:
I've taken on this series as there isn't any response from Jisheng. No
significant changes other than build fixes.
- Fixes build breakage in patch 3 to do with not having used 'goto' keyword.
- Fixes build breakage in patch 4 on 32bit not having delcared __ptr in the
  macro.
I did read the discussion this series generated. It isn't clear to me
which direction to take the patches, if any.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
