Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B5FC25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 18:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U2gJFKBKNFitRaXPAcBlgH2ZIBmrO3zvYbxRavtwcuI=; b=lTxDlrKCxsx/AH
	8dUdpcxFqryXTI6sIUXujlqlD6m5nUf7gWvRglsDLI/mswgIibXDUHWvoF3FuAg9PaP0sck4SkUfV
	ALOH9jvh+STzf8EqqhacSBoK7HXiwEjzTt/zafP/J2Qn4l8JWqPz4UAPkGUhURt2hjqEChXSXjR7K
	KElpzuazxPlHd7Fzx1vKMP08T3GVDMRxzZUJV9nwqzRtvsKRO+vSzgu+PBtfBFFzE+oyrA82XsrrO
	m0br/eejjBxgfyqnDy6bMJ9cz3MnsCTFzbJqz2NhWDNwQx1TTkCEvWftnn2EjEroKZnsPuLL0k2F0
	DsEQnagBZLtzOvKyS95A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAa5e-00000009eHR-21xo;
	Fri, 24 May 2024 18:56:30 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAa5a-00000009eGp-3v8Q
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 18:56:28 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1f33d84eaefso17052175ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 May 2024 11:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716576985; x=1717181785; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=xLUodbpWlHV/m1Bt2U9fTwJmOlm4ytnN9TrwQjmnMvY=;
        b=VZggPCwQStTgcv/r9CnL5sAAMpPAaFT1xVAbfSxFwkLb+Kog8hKhWQ9rd1TVUd/CGu
         DN19Cxkuv3xQQOfIoR/ehrq4B/HOpf2Dgl4g9pTyxbu9/nSvF8Lgts48BBwac6ELwSCY
         25bCzKO2iJlItnbETeIidUi3L+e0h6RXLuNRn/yO9J7J9IGqnrVHezwKGTZfP3au1J8H
         gl+r2ODsujf/+iGt/P3EEaxUcb+LoBX0N3DW6CN+QEUIRCghcwfMaR+7M9kV/oGfzD7n
         fEnVw/gRqFb8oCaO5ImqnO9BSuwJ+uSzijNy1mxCnqbX79I0DXSxPqRRl6opxWnsxGJP
         +b1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716576985; x=1717181785;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLUodbpWlHV/m1Bt2U9fTwJmOlm4ytnN9TrwQjmnMvY=;
        b=WCL4fqkhrNQiLdMMC9qls41F7cyXI8AABpslnZFo1H1cc7plyb1/IjfWXDVpMoxCsn
         N8I3rL8V8bvRu5oummnctGqT6hrxqdelSCxfKRIzKgPrkYaPgorv+wNw9WsDY7dUexpq
         O7dpJM3U90f/2E+CPTF81HIiMXI+x7mMdaYyXdpXe2FPt29erFUv0g3RxlAuuJ5TMvcx
         DT0+yjdAH/FCt/kpTLpygaTXZHSWAl63uzz0XEtDbq1Mhia+ZsyAHfz8w2DPOhZmOXKV
         tVN5G6FascGUvADEoM9wxhVpxtqLdnKiqkhPqAh4ngl7xo52myJfDeh3xHRhY5Av4M2Q
         pocQ==
X-Gm-Message-State: AOJu0YyqLewXlAfI6bpwco+SWORKWFeZ9his/8sdCPfNAhXLon7RTbFc
	5sVt6k06ayanPbpcm26wNMKwj2yUXAeq5xM+U0YNlLdfvBnkUTx2y/r9ZQVXC6Y=
X-Google-Smtp-Source: AGHT+IHmjdtRpnISU8MeUC5uHlVT+aFruq8xOMm5QCnc85cjYN6x/xbnArZ5Bph7B9WPdNdkHZeeug==
X-Received: by 2002:a17:902:e746:b0:1e4:3909:47c0 with SMTP id d9443c01a7336-1f4498f0d96mr42599825ad.62.1716576985229;
        Fri, 24 May 2024 11:56:25 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9c7f32sm17084505ad.281.2024.05.24.11.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 11:56:24 -0700 (PDT)
Subject: [PATCH] Documentation: RISC-V: uabi: Only scalar misaligned loads are supported
Date: Fri, 24 May 2024 11:56:00 -0700
Message-ID: <20240524185600.5919-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Cc: corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, costa.shul@redhat.com,
  Conor Dooley <conor.dooley@microchip.com>, linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_115627_129343_8CE22374 
X-CRM114-Status: UNSURE (   9.77  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

We're stuck supporting scalar misaligned loads in userspace because they
were part of the ISA at the time we froze the uABI.  That wasn't the
case for vector misaligned accesses, so depending on them
unconditionally is a userspace bug.  All extant vector hardware traps on
these misaligned accesses.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 Documentation/arch/riscv/uabi.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/uabi.rst b/Documentation/arch/riscv/uabi.rst
index 54d199dce78b..2b420bab0527 100644
--- a/Documentation/arch/riscv/uabi.rst
+++ b/Documentation/arch/riscv/uabi.rst
@@ -65,4 +65,6 @@ the extension, or may have deliberately removed it from the listing.
 Misaligned accesses
 -------------------
 
-Misaligned accesses are supported in userspace, but they may perform poorly.
+Misaligned scalar accesses are supported in userspace, but they may perform
+poorly.  Misaligned vector accesses are only supported if the Zicclsm extension
+is supported.
-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
