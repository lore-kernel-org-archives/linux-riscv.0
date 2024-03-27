Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA6EC54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 16:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=78ZIwFUdREo66GFqWSz93Z8Gstcr/E0KtEVc6BQOBFo=; b=b7NL3hiLFmAiMF
	mdRKMTwS+YoyyKjx4LQVejmVAmJn3tZiEzP2VcKpLGWfY9maJuFdsYdzIyZFRtlN/7HBtFdqewzxw
	FlRDz/tlxYUq76NuLkKSnS1Nwh04g9JuCQv56OJX0SkJxVaYstz9s1kId8Z24XIhJfK6/YDMR2zxN
	hr9pflF+n3zWYaMdDcjCFxomgg10MOR3Pk4YoNxafuvewcX9TpdwTqHbD3BcTHmxK3avTWGm0Y/+a
	1rBrFT6CqIDTdhoJeU5nLwlooKO6Hg97J1ebB4VaZE4Utnal0dp5627JDQhpR74xV7Fj2MHIpPj2f
	o14SE8NOXdvwx+1DEqCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVmY-00000009zEU-3WLX;
	Wed, 27 Mar 2024 16:05:42 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVmK-00000009z8O-363F
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 16:05:33 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1def2a1aafaso46050095ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 09:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711555526; x=1712160326; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Xc93+JfN2S4FIXbabsoTVMgsbTEMk8Oy5ZNwdIewJ8=;
        b=SI89lYADumqU5M6VxoYnwd3s9RKH5fTeshCIApM1i5xUXqtf37+JLU8WvSCju2FLuH
         KGwvhFSQvl0TNveBaPT6KHhQ0PV0BZXiHYuWp0DJOvJX3rc7Yll0+riTYBWhcSs2oQdo
         WvZe8o5Z+UfcWqQYCrhOc9tcHADUzv8zmWOJOHTADeYLlnEGqGOO+/SAftVccPDtDEJv
         PO7qWbMfMUU16oOItLlBqkPCmRos1QWiqiVaCkVK2jprzW3m1Wg3K8QvhoW3bkbGSxrz
         uWJHxw4TZoH5pdOA9C0VcvN6bF+5OxS9O2XWqVunq3tDKoK30xLPN6xrtI+VEBULY6a6
         46eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711555526; x=1712160326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Xc93+JfN2S4FIXbabsoTVMgsbTEMk8Oy5ZNwdIewJ8=;
        b=GDL5Ub1HqDKyLq3bW/s46FHuitsxthg78tvdWWUFD4lvkChZYl3ZT4/d5aMOrwCUP7
         2igS73ytvxCgVOJVt5HqWiFLyyBOd5UADZaTgANZfj/DFmJctFZeuHKPtWbVnAP+T1gG
         iHY+EVK/0MWwtQU2AllfU9Ku2vEZ6encDSWreXoHIZSOFVW+3dTE6OUhLi0a14fT+6Ol
         c5NMHlwd2ocn8MhImRDZHjJ6akyAlAO0pdXxWWqkJACOGGeQN43Oaz6r0eJczx+exG4C
         udljjOobc1KShDTrTukla+xSAFXb4BNMRjNuBdnqwh1J/SLERP6MbGzEB5hQaQiSuTu5
         rPMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRxXUeVDjhFg0dHfk6Y2kl38hcdt71u1M/TnnvKfTZX6RQuC7U2E2qNZR/hHQDTFK8Sfqq45yeLM58zo7iiS6u7LGB5AhWSTX7qbKZYcL7
X-Gm-Message-State: AOJu0YxJLOaHtxFcyQVmmvrGkE3sijs8tPs94JAbVeE3U5zqnw8cOXs1
	hc/VYBNTcXdU9IOh38vwTWRjRahW1YQedD/ts85sHAA3yVzYOM80TKUBxxnT26s=
X-Google-Smtp-Source: AGHT+IG5UtEW/LihmnxDCmHBZwJ44J0/v8NsXjFKi7Yo3FMGF74v7Eh2hJ1dT0cL1L3h19a1fVN3hQ==
X-Received: by 2002:a17:903:287:b0:1e0:c580:4972 with SMTP id j7-20020a170903028700b001e0c5804972mr102612plr.33.1711555525198;
        Wed, 27 Mar 2024 09:05:25 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id bf4-20020a170902b90400b001e14807f9cesm1718226plb.125.2024.03.27.09.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 09:05:24 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 2/7] riscv: jump_label: Simplify assembly syntax
Date: Wed, 27 Mar 2024 09:04:41 -0700
Message-ID: <20240327160520.791322-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327160520.791322-1-samuel.holland@sifive.com>
References: <20240327160520.791322-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_090529_050622_CC3DAA7C 
X-CRM114-Status: UNSURE (   9.04  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhlIGlkaW9tYXRpYyB3YXkgdG8gd3JpdGUgImphbCB6ZXJvIiBpcyAiaiIuCgpSZXZpZXdlZC1i
eTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYW11
ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KLS0tCgoobm8gY2hhbmdlcyBz
aW5jZSB2MSkKCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2p1bXBfbGFiZWwuaCB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vanVtcF9sYWJlbC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9qdW1wX2xhYmVsLmgKaW5kZXggNjI5MGIyNmY0YTE0Li4xYzc2OGQwMmJkMGMgMTAwNjQ0
Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vanVtcF9sYWJlbC5oCisrKyBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vanVtcF9sYWJlbC5oCkBAIC00Niw3ICs0Niw3IEBAIHN0YXRpYyBfX2Fs
d2F5c19pbmxpbmUgYm9vbCBhcmNoX3N0YXRpY19icmFuY2hfanVtcChzdHJ1Y3Qgc3RhdGljX2tl
eSAqIGNvbnN0IGtlCiAJCSIJLm9wdGlvbiBwdXNoCQkJCVxuXHQiCiAJCSIJLm9wdGlvbiBub3Jl
bGF4CQkJCVxuXHQiCiAJCSIJLm9wdGlvbiBub3J2YwkJCQlcblx0IgotCQkiMToJamFsCQl6ZXJv
LCAlbFtsYWJlbF0JCVxuXHQiCisJCSIxOglqCQklbFtsYWJlbF0JCVxuXHQiCiAJCSIJLm9wdGlv
biBwb3AJCQkJXG5cdCIKIAkJIgkucHVzaHNlY3Rpb24JX19qdW1wX3RhYmxlLCBcImF3XCIJXG5c
dCIKIAkJIgkuYWxpZ24JCSIgUklTQ1ZfTEdQVFIgIgkJXG5cdCIKLS0gCjIuNDMuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
