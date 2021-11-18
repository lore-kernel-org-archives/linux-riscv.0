Return-Path: <SRS0=Kh2H=QF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CCFAC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 06:06:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68E2261AA5
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 06:06:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 68E2261AA5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ChW1HfndB8icNuhQjCRsKAloW5SlVaUIXbfpQ4uPDFc=; b=IBrBcX5W0OMZbn
	Dq854h/F28PjdSTnUgqr8nJrvc9DXXBHl63xXdggCTVzgpQmSSeI/5ewTU/VF/jHUGhaCTmGG60QB
	ckrMye3LNLjkI8C+784QutDpHLj8e3oLTp6swnrFao2f0aZfkywHoITnUQSM4NxpqYGzm22gmWScK
	rQi1bEjvlVciNd3tTqOnO34ZMMwUyNaFl3XJjFf0ZO+lXSqNWbBCs6rI0XBYI8HBbi5nTLkEJUcIn
	/NHEIf3D6L/lt5o4Lqp/69eCOEHTMCOjqJw6ZmiifAruXUS6PZ7l/4Yck+CKkM1VtlkNjcT6OW39D
	v+WDIWzXlOhQ2lqAHApQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnaYc-006xbH-FU; Thu, 18 Nov 2021 06:06:02 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnaYa-006xaS-3x
 for linux-riscv@lists.infradead.org; Thu, 18 Nov 2021 06:06:01 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id
 b31-20020a4a98e2000000b002bce352296cso2030284ooj.1
 for <linux-riscv@lists.infradead.org>; Wed, 17 Nov 2021 22:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GH5DsMQ3QaWgiH0MtT4VPh8uW1FF7ANWq123A9PIt3o=;
 b=qmL3blZ9nlnWuevH3rA18HtJtKXlurKxYR/1Rp5rBHLDOU5JFq4dprX0iD2YNXF4al
 m0NyR+CqsknraoB6x92KS4a+OsNDUzqfqCxsArkrxNMsXNMYpaxg+pC3UGYh3Z43C+Tw
 wgikDxMfbXo9d9U4E256aDQjLLrv8WrVxdGBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GH5DsMQ3QaWgiH0MtT4VPh8uW1FF7ANWq123A9PIt3o=;
 b=FYz9myc6FChP/094066VaHfUrZrjV8AG4ShEnYH/8D9LsY1B9y6Awy5VdIfcFwXeUo
 nwKGEpt7qBH45TyP5DLJLUuL+/NSe0wiKgdKMJ8Oj7jvAJOsmKaOQHaO/Nb7Di7GYF6P
 lw2rsScrwGljHCKhg31aIG3jNMd4xZ26sqL/Pn1sakDki4S/f9/rR/UToyAOiuw/Kdfn
 Sr/TEg3uG7tKxwDTB7XOoVpdAvN/Haj96sKNCUrknaPWlSmNDq6KxL0Coiqe1Sb6vMTI
 5NqKPGg8s1jj1r/UW7aMiBZcUglJxF9ccZXepQo4IOAXoB7HrrGCalHxVuYai+yilXdh
 VnWw==
X-Gm-Message-State: AOAM533rYU8ZHVGdmhKI7ZKN5GcJswaJe7CkyHWo5C9IpdGdWQ+7n3zd
 R60wkQ5LS3at+EBe7PEasoxK
X-Google-Smtp-Source: ABdhPJztZycF+YPOFZurRn2NUYVGfHgy2vIKmAmLQyQSIRA6iSyF9c1bLqOzpWJpW8w+rIrswzT1+w==
X-Received: by 2002:a4a:5842:: with SMTP id f63mr11953351oob.97.1637215558524; 
 Wed, 17 Nov 2021 22:05:58 -0800 (PST)
Received: from fedora.. (99-13-229-45.lightspeed.snjsca.sbcglobal.net.
 [99.13.229.45])
 by smtp.gmail.com with ESMTPSA id j20sm395379ota.76.2021.11.17.22.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 22:05:58 -0800 (PST)
From: Atish Patra <atishp@atishpatra.org>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@atishpatra.org>, anup.patel@wdc.com,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH] MAINTAINERS: Update Atish's email address
Date: Wed, 17 Nov 2021 22:05:01 -0800
Message-Id: <20211118060501.932993-1-atishp@atishpatra.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_220600_289035_5B8BA39F 
X-CRM114-Status: UNSURE (   8.39  )
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

I no longer employed by western digital. Update my email address to
personal one.

Signed-off-by: Atish Patra <atishp@atishpatra.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a2345ce8521..b22af4edcd08 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10434,7 +10434,7 @@ F:	arch/powerpc/kvm/
 
 KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)
 M:	Anup Patel <anup.patel@wdc.com>
-R:	Atish Patra <atish.patra@wdc.com>
+R:	Atish Patra <atishp@atishpatra.org>
 L:	kvm@vger.kernel.org
 L:	kvm-riscv@lists.infradead.org
 L:	linux-riscv@lists.infradead.org
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
