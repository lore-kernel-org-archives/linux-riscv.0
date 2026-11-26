Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4190606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 06:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GTBtxrII;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eBWuHOM5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=U6R8raYeR5fBSNciDtfE7YvxAQzVV/w1LEo3nHqIO2g=; b=GTBtxrIIqCFGpXvzyeXj+86dg6
	iSEdfHBr+F2k0fWKzyeSgtmOCG3OJk1iwMdHSvzw56CcPtYxnQMbUAfpFKUxZ9xlAyaK1stcQ5vvN
	AFRpSpaItIOJFjEoATBEDw3K8Hj0cdGUNuP4tqV9+Is5pbWfq5EhSXb2/3etbLcyjWrmEW2CK/6pg
	urAuGLOXBuO+qip47ggd4Dwd0YD3XTA4V133shgcnT26xtkV9/TGiKyefpbwE9B0+yMqNxmRsTGgo
	Z/3lUjy6P3NT1JWrTw4I1UIvYQaYNEz5oG5EK5uFUMjwcgiw1DpzJGnGJAtG52oB0g1gID4YHy4Ug
	kN3NpZTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWT8e-0000000CD7j-31v0;
	Thu, 26 Nov 2026 06:39:24 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWT8c-0000000CD6q-057s
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 06:39:23 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8b904d10882so2821725b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 22:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795675161; x=1796279961; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mX7cQaJdQ3Z8GzuWZM+Tv7znYIvTndE2qCggNaFUZmE=;
        b=eBWuHOM5xAextLeNQzga8s5V/0psqEQ7Yh7SP9XZ1Pjt/qIur0IXmBzVE0Tgpti45o
         SgIY+nxO1xmrE62M9+jyJL3DelXX1m7+eqqWYscskKQbJ4O/5HaboXh1TuJTYvZtXH66
         FXrSLVYHFEzLMnoa1w4L7YM+6x2rG5gOXJ7egXoVXHI1/xS2GRLsL4syIHkF+sfLoFzO
         KqhMYztrmt1b14U4jCrvvkvqnUIv7Vt4nA3SxrLrmVSnNHEj7vtBuDolgRaJodGV7r+q
         YGWvqfPUeB3S1szifoGv20ayJsOzzeyLT8QFH0q63xGASj45vqrvCvNTVKokLTO7hPsp
         pvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795675161; x=1796279961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mX7cQaJdQ3Z8GzuWZM+Tv7znYIvTndE2qCggNaFUZmE=;
        b=M86RvfnKPKRl1bdmdnHW6yzxF65ir8yciUbISQT+W5OvwL30L1gsjQTtFRRE23qxxk
         RyzFo9rTPk+eXtUCANGgaZx/gex0Y3y/KEZVf+PzqVd0hpDSx8ww+wFsaGaJ1aS1rmEp
         D8Yu3Min3cvncZUkCumleIoC/jgbp8jjGyiZjm/v1wSPkL3BLx2VZQ4yssJMsa9wPt0O
         4jVm4yDIv1zwdMW5K5xZ3iCZFh0khLWfMhX6vyiRCQmFsozN4zfIGTAVlcki+a/HZKSk
         5SaQfiLV6J/QqY3xURVSlkgYbcnCug/opo3O7JTQBB7doKA/SiAy/8LEBB9JmLEIco1n
         sixg==
X-Forwarded-Encrypted: i=1; AL+hErHf9EG7vtr2RkXDWCX47OFUD6tVqdmrZkJ3QPChM/sbBGtMUiXlDWECuUUpPMAvPbt2amjuPZd7e2hXOg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/Z7/ogOrapboSyhEFPoSxwo+xmpKwXjUzjIDP20NMfkU5hpoOO
	77nqMp1ZbwwPz5BcGK3N9B0TqHB65cubieIAte+f4c3mwrYfWHEF1gF8
X-Gm-Gg: AZFdTZf0Z7YpS8xBW97l6Dd3GpIq2lX/3kDi1Zr/djq7ugoyKFd7FME2V4iTyosLNno
	eE2eQHVrcS6lTFwpmS8HeHVDbP1IinkS9DEJKufUFnzDBD6ArP4vybt6iNbXmYkG21MRUcJXWuw
	s3/+kJihBaV0imzH1AoBukLbRksf5sDPcRHsteZE76qiJf6blZ4JnmXEljI+Dj1Mf4J+SK0Yip4
	oVy8m1XN1MnjLh4tMFuUTjNovmJOtOFcX7RpRXlDz+MOQ/8a6Kz1XazfmdK3d2fca+Jyu+TeY6k
	ZhpjCOrpZDwr3ttCB3cdg2jWsQ0WyfGVpkdIaXDtIlguv59YZw30uuYMK35UqhnAZWy+BPG36eL
	tzhKOAILgxS7txytY84cwKbDhud6tzvRMPLrb8viGIcnee+6qq0VFoxbbHsHrvYCA7jCVyzJEkt
	9cnfdCfETRwWG+NKFp2eCgTdn+xH6NakCx0wlFQTjF13uMrVdYrkrjAQE1p/LOhLwuvLpGwoBws
	MB5XxEFwQYouRki9KWQ/m8indoZTLIpR/4l3MDZwb+YTF4O4HV0nANX6Ip6aqAPcNWZgG94xl2Z
	WDajDAr87kKpMk8U0Q07bKQ14Vv1q9CnC9k8cjpBEEtUQSGI6IAQ3DM=
X-Received: by 2002:a05:6a00:1802:b0:893:12e5:c07c with SMTP id d2e1a72fcca58-8c87c389ae0mr18623299b3a.27.1795675161015;
        Wed, 25 Nov 2026 22:39:21 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077a058sm10297575b3a.8.2026.11.25.22.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:39:20 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: cyan@meta.com
Cc: leeonion.muyu@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	mark.rutland@arm.com,
	alex@ghiti.fr,
	emil.renner.berthing@canonical.com,
	masahiroy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	u-boot@lists.denx.de
Subject: Re: [PATCH v2 0/2] arm64,riscv: boot: emit standard LZ4 frame for Image.lz4
Date: Thu, 26 Nov 2026 14:39:14 +0800
Message-Id: <20261126063914.3237108-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126030233.2546274-1-leeonion.muyu@gmail.com>
References: <20261126030233.2546274-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_223922_058233_4D18B8A8 
X-CRM114-Status: UNSURE (   4.84  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thanks a lot for testing across three lz4 versions, Yann -
especially 1.11.1, which I hadn't covered locally.

Ping

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
