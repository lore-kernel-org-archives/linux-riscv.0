Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3074C25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 15:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qvYtKGT0f3icLEy0VjNEoVrgwEhj8l1uXcJYwWwgv58=; b=rmZWg3b3yToQ/V
	MxuPZJIVa/TtGm2CrNkEKT3A6SoRSwjjyqqkuUVSQLWNwm5kcuIakovWjDGyIb0nHFkJXCC4SHcUa
	HWZ/9LqrBRdZTE0kngqgAV26QnP3pWaE2V2/fKMvP67RqgUslJPNni4myvs7jCEPTQ69HQwcxmY+f
	f4eZhgxYSyD0LobWlkqGpnx+kin+73ebMCWhdBdIKfB46z3CP6tDGybGvFL3WkeDzXY/npPGtThZ3
	avk6X/p/K396jjA2nLBFQW5Vv1ndOi6pzqY9z0YPqEGHRZUpmwM7EgzYgl8SEr3vPaO9DL/MPlqId
	+/moxWfUbA7uFu44thug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBcK9-0000000FbcI-3Ye1;
	Mon, 27 May 2024 15:31:45 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBcK7-0000000FbbI-16PW
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 15:31:45 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-42108822e3cso17533135e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 May 2024 08:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716823900; x=1717428700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3NNSVjNWOYxdySt3enWuEY8NgLaDOrN76ngl0Gdie4Y=;
        b=J72Hpi86KDWm6NimQe0MHMXqLJLAoz0BngcwKZUFscIP0of9AQN/5ruGTduIZF3Gp4
         Fm8h45ncq7yWeon6D3ZcvAaM1LeMRXyoAmeRat/dj8dkg2CR/Fk0Ap0EYul4UeX3qPks
         /o9JQRHiT657Kf8da5XbQibscnuvco/lltAe49hBVQJMXDJGeX0FiqfoZIHRYvn/5N3J
         29y2YzvP38HlmooDENBvwhx8uMVVj+xmcGCE1BBOnahwuRg7ebry/isoyEgcYx/FW1kH
         Nr/IMyHElSPyCMMghms5+yUx2ETegyZSqV4ussHNHp2U2mErlYHnwgmOyGb673Exhkd7
         h9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716823900; x=1717428700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NNSVjNWOYxdySt3enWuEY8NgLaDOrN76ngl0Gdie4Y=;
        b=RyjDzK2+g0ClxSL1jdR27iAF+nSZPRxqACiP8FdzCUVEZVrcPKtf9GDJHHBIQVxQLh
         3bHiQzrOuF3pa/bNFi+lMs8MqjP1z8JUR1STteI7nMKGk/MpcUClHfMxwsKJY2Z0Bwgl
         HVnYY5uP/okXOSUoiak8PsGPcJN+9vwM9HUthOQKKKfE1Hse0UMGK/TjZeR5l3ubrjqO
         OKZw00yBSQQtLSiOIbR9/2v6+N7y1sn4zAJjn6TqcsLEmsqBVqXaekIxrsOnppg4jx4z
         kMhcGZLou2W2B/Y53cNUYfAiBJ4AtSiNhGv0aqJOC/vmOpmK0mkaoF5sh3gL/sxmJDlS
         E8yw==
X-Forwarded-Encrypted: i=1; AJvYcCWT+1KovTDCBX3Fl1UtUiPt7zo6t6R1lK9tpJbbVKCNwf402pTl/+zmXuGXVft5/kBrCN1FiOQdtZum2H+zWpC0FlPBMFyXUJrJwkWFyQbH
X-Gm-Message-State: AOJu0YyKcxJL3+VCITifCzIcrG7WaGukGtlPIAnp9fKCtF8zbNy79uE7
	hQNGIrqShBwR01CpswsNLE+6DMrL62GLDQ0WjA80qNNB9b4zao0DIwKJzGoQBLo=
X-Google-Smtp-Source: AGHT+IFSDuvlJ2R7D/NqkTDnql6BSN77CVwr33o+H6Jjh+G4hTBM9HNZ/ptH1Wz7cL3YA694hyF33A==
X-Received: by 2002:a05:600c:4449:b0:41b:f4e1:381b with SMTP id 5b1f17b1804b1-421015a60b9mr122553155e9.2.1716823899690;
        Mon, 27 May 2024 08:31:39 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42108970967sm113261895e9.17.2024.05.27.08.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 08:31:39 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -fixes] bpf: resolve_btfids: Fix integer overflow when calling elf_update()
Date: Mon, 27 May 2024 17:31:37 +0200
Message-Id: <20240527153137.271933-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_083143_412302_6E97044A 
X-CRM114-Status: GOOD (  11.06  )
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

The following error was encoutered in [1]:

FAILED elf_update(WRITE): no error

elf_update() returns the total size of the file which here happens to be
a ~2.5GB vmlinux file: this size overflows the integer used to hold the
return value of elf_update() and is then interpreted as being negative.

So fix this by using the correct type expected by elf_update() which is
off_t.

Fixes: fbbb68de80a4 ("bpf: Add resolve_btfids tool to resolve BTF IDs in ELF object")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=218887 [1]
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 tools/bpf/resolve_btfids/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/main.c
index d9520cb826b3..af393c7dee1f 100644
--- a/tools/bpf/resolve_btfids/main.c
+++ b/tools/bpf/resolve_btfids/main.c
@@ -728,7 +728,7 @@ static int sets_patch(struct object *obj)
 
 static int symbols_patch(struct object *obj)
 {
-	int err;
+	off_t err;
 
 	if (__symbols_patch(obj, &obj->structs)  ||
 	    __symbols_patch(obj, &obj->unions)   ||
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
