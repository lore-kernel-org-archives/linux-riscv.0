Return-Path: <SRS0=idjh=WA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F4FC19759
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  4 Aug 2019 15:48:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A52B82086D
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  4 Aug 2019 15:48:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f0/V2F2Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XU5QG53d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A52B82086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XqNVzYHMeiAKmRvyyuP41Q3LxQqAZZO3cHYFwoxyXPY=; b=f0/V2F2QW2kxhH
	sm5llvyqXHihg6dn6x3SnAurn3GQR1C1i26pCj+9W4GtOwHsNOrGY9ZKlLXz7DQQk2JT29BBlKjcV
	FSkvSOSz6fITi13J5ppcGYmXkBaxh0KgQp1741aIUwQ5HsIoZUVkS6gqFcxNMywy0aDyFj8UBXi35
	wf4FesRgWtxSOz43scgc7qWuaoF4/WEAmFyZa/ZyO2TcHFGG8SgSlNaFJzADmRZw07Xr/YtFzcyf6
	a3zp6Rb6epdQKxDmy2dUTru/smDSXDxb8Tz5GR10LNYy9LsRFx3LEa7D/shzQDQ/U6V/9cQs2+qoH
	1+G91Sw5hvtj/S5ieqAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huIji-0003QE-PA; Sun, 04 Aug 2019 15:47:54 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huIjf-0003Pq-BL
 for linux-riscv@lists.infradead.org; Sun, 04 Aug 2019 15:47:52 +0000
Received: by mail-wm1-x342.google.com with SMTP id u25so60422282wmc.4
 for <linux-riscv@lists.infradead.org>; Sun, 04 Aug 2019 08:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=XpKZwopndEr+MAU5NPtSJHYcO6Ev0MiXZLBr1uT/g74=;
 b=XU5QG53d3+2crKQsbTdHoGONPn6CyVrAJXUf8YhuW3jwt3jQNVcwL0fkkD4qsI6q24
 iRlsjJFNqFjAk34GEB5i5ZsPAoK7cqv8xr3ardQdu3a9vwP92MMf/ROCAQO3yfSl5CYQ
 2JZfTKPbcmQd8/HUDYjUjfhlvLH34tg8FBgB81GOx2nkc13oLYz+ypMoIwMGKVfakLvi
 hg2+QMbP/eowocijrEJiHCjdm1p7XCaHVkavK3FcGPuESQCxl0tZAgiPZIxMoHYipia2
 YENHHfbhrj4DPU/oZHFHHLxreYtH61LP0TQSKY1rfJV2C5dhj1tnKZmqKZiT7vZcq1Sn
 u5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=XpKZwopndEr+MAU5NPtSJHYcO6Ev0MiXZLBr1uT/g74=;
 b=F/MfwegyQuVyhJOJVhvxyDJcQRjRgomr/RfyLj4njowsu0UEKt8vG0khcc/fd3xu8g
 O63a9RCfFT3/bgGQ0rk0hWomMYz8H5xCUFViHqImMVttJ51/twk9oleZIM/Q4r8u0Y6B
 V7SPbhMT2NUUYAhXAaUEdfsOaatUh3KPbejnlhUZmnWnUMKDxRs50jrhgy4zGK/bM+rZ
 0C5ewDZhXqDKG+AtavC/unuwmF/TSkfaTg8gIe9iFrViDuD5K045xtYAoyhkhyRwkLPa
 GZX63k7jVa2FutmfYe+YkD6/sJCmF8ZUQnkV8ipcGxMW2hSXwuFwzoUJCZzY/R+qTrVO
 Y9Og==
X-Gm-Message-State: APjAAAX7iv2f2S65DqPRd7b35UuwLlsu0mCQk9p3S3VhXMtKMhTFWSFZ
 H8CSAUiuUPbe1Q9USAQxJIg=
X-Google-Smtp-Source: APXvYqzJFuGB25ozI+29umWEdsL9Hgl2qPQJteoUcZ6uWqBwZ6hn5nsD/8MzEZeeH8OkXj4yd8zWVg==
X-Received: by 2002:a1c:f918:: with SMTP id x24mr13576652wmh.132.1564933666469; 
 Sun, 04 Aug 2019 08:47:46 -0700 (PDT)
Received: from localhost ([197.211.57.129])
 by smtp.gmail.com with ESMTPSA id o20sm217192312wrh.8.2019.08.04.08.47.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 08:47:45 -0700 (PDT)
Date: Sun, 4 Aug 2019 16:46:35 +0100
From: Sheriff Esseson <sheriffesseson@gmail.com>
To: skhan@linuxfoundation.org
Subject: [PATCH] Documentation: virt: Fix broken reference to virt tree's index
Message-ID: <20190804154635.GA18475@localhost>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190804_084751_418244_970E48C8 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Song Liu <songliubraving@fb.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "open list:BPF \(Safe dynamic programs and tools\)" <bpf@vger.kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 "open list:BPF \(Safe dynamic programs and tools\)" <netdev@vger.kernel.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Yonghong Song <yhs@fb.com>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Martin KaFai Lau <kafai@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Fix broken reference to virt/index.rst.

Sequel to: 2f5947dfcaec ("Documentation: move Documentation/virtual to
Documentation/virt")

Reported-by: Sphinx

Signed-off-by: Sheriff Esseson <sheriffesseson@gmail.com>
---
 Documentation/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/index.rst b/Documentation/index.rst
index 2df5a3da563c..5205430305d5 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -115,7 +115,7 @@ needed).
    target/index
    timers/index
    watchdog/index
-   virtual/index
+   virt/index
    input/index
    hwmon/index
    gpu/index
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
