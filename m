Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900E0C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 08:36:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D5002063F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 08:36:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="liEAKA7l";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/BeKDjb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D5002063F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qdhAasNtXN4WPd3Ms75Ljuu0CgM00FCAiVrfFhdz67s=; b=liEAKA7lDG3P2F
	JjUJ2mVuZQXysPtpSMQpJOpwvMexPbnkqCh420ZomlkmBGMvM8FYuz0rqjkfzoSDCM0uhrsjIfTpe
	DLTDGic/UxCddHM8YFrKUhuabAPuqJ0HsARh2I3RnEfghRMyLWMzd7MxmLGtP7QFRHdKv4gRtEVzw
	Th8Aq43CgPbXrE1V99hYZ/hJLc/Ky4dvHqX0v0duCEV7+qjNvNZUvwaERgdUq4JnAe9YTxTZNZCAJ
	pJaMi4iY24R3yU6dQ8JVrJbUill8Aia8t9Fq3F7eSfu3KyVg+phN7846HcfVehHvTwuz2caY5Zgyz
	4vu8+kqgaswLzv2mnejA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjKCX-0002uv-At; Tue, 15 Jan 2019 08:36:01 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjKCU-0002uA-DI
 for linux-riscv@lists.infradead.org; Tue, 15 Jan 2019 08:35:59 +0000
Received: by mail-lf1-x143.google.com with SMTP id e26so1386392lfc.2
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jan 2019 00:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QcF4B9mGuhP6VK9RSwpwllB/amuY6eOTwBt5evqymMI=;
 b=U/BeKDjbxhPWJ2qfrk67YJh0HDp3RCXEfQvxRBS4U5+fW4/xxzuq6dCT5hTxZMLwAX
 7bfxEd6h4PgPaZmgi/+8fFl2vXBAo1+LGc07gg8lMd45RLYE+j+YNPlpFppVRR+kHBTK
 UQH9gsZKv1zMPxf1sUIUh9N0FyPXuWAbTusZ1Vlk1OQ13ypuH1+56hDQbb91Up9G5I7e
 jDKDveCxnyHk1tdmKgSguxjWMlgvu5Se6jS+r019jQXNIsSDsvXU7w1SmXvrIzK31Bjy
 wP95BfAFe8Ygqb3cTUYtQchwBQzb/kmjx/lq2wijuRuo7ymGhfmvS4vs65ER7N38W2sn
 8CkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QcF4B9mGuhP6VK9RSwpwllB/amuY6eOTwBt5evqymMI=;
 b=JOlOQz4muvynPdIdzp9upzzHO/m2IRHHpVT3BtPTv/vIHrBcuIetZ3sGFPWpGOZm1s
 y6kOVLxgOtCMgnSB/DAwqkaaYwTCQv27LX0cxT3/mWZHmijVd9ktFqbS8VcvLhQMgokN
 4JcFui+KUpAHwXuqVNU5WdiUY6H6jKii3mpl+PB37U1fY73cgFExwG/XShGCZdB7dTqE
 CLpX5QEfPUuT+f+R6HIAJmtvRU9jxFH1e/aAD+zBSEx0L6wsVfAwHxef4aJI8N1+nYky
 4XxKwKTRU4v+slu2gimNhIAa6iA7AL9nK5dKmprLGkZhkIAKHGJTY+tES3Pr9XZZ/6yX
 OWqg==
X-Gm-Message-State: AJcUukfDDWL/0T080DZYXpoV/3FICi2S/zb34tRvlLd7LBIqLC7MDxyE
 fLOmUXgi2g74pS7TihLuKpQNz+E2QqfGLQ==
X-Google-Smtp-Source: ALg8bN4sTDkmaV5c4PREhT8il+HWODnxR0tx08KbeVLfiYcWpyYoUlHivOjSKA8zxtwafUH6+FiPgA==
X-Received: by 2002:a19:9781:: with SMTP id z123mr2068621lfd.80.1547541355852; 
 Tue, 15 Jan 2019 00:35:55 -0800 (PST)
Received: from btopel-mobl.ger.intel.com ([213.100.199.124])
 by smtp.gmail.com with ESMTPSA id e14-v6sm453004ljb.31.2019.01.15.00.35.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Jan 2019 00:35:55 -0800 (PST)
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: [RFC PATCH 1/3] riscv: set HAVE_EFFICIENT_UNALIGNED_ACCESS
Date: Tue, 15 Jan 2019 09:35:16 +0100
Message-Id: <20190115083518.10149-2-bjorn.topel@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190115083518.10149-1-bjorn.topel@gmail.com>
References: <20190115083518.10149-1-bjorn.topel@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_003558_469282_4D5EE493 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>,
 palmer@sifive.com, davidlee@sifive.com, daniel@iogearbox.net,
 netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

U2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm4udG9wZWxAZ21haWwuY29tPgotLS0K
IGFyY2gvcmlzY3YvS2NvbmZpZyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
CgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCmlu
ZGV4IGZlZWVhYTYwNjk3Yy4uZjEzMjIwOTA0ZDdjIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L0tj
b25maWcKKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCkBAIC00OSw2ICs0OSw3IEBAIGNvbmZpZyBS
SVNDVgogCXNlbGVjdCBSSVNDVl9USU1FUgogCXNlbGVjdCBHRU5FUklDX0lSUV9NVUxUSV9IQU5E
TEVSCiAJc2VsZWN0IEFSQ0hfSEFTX1BURV9TUEVDSUFMCisJc2VsZWN0IEhBVkVfRUZGSUNJRU5U
X1VOQUxJR05FRF9BQ0NFU1MKIAogY29uZmlnIE1NVQogCWRlZl9ib29sIHkKLS0gCjIuMTkuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
