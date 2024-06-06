Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03A1C27C52
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jun 2024 20:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMbxG/biEzaV9Ue0cVWQ75FjM3J/bdPIC7L20f7gqn8=; b=oM/YX0zH2yrBFn
	x+QLlphtWlvuvQCtlA60qnBwidC8dUs0U0TDZwCvwsxjSltGlpzxzvNY2Z/4vecorLL1X4OkWoKqC
	SrKEQGo+vrlJzSiOK+tX4dUcO3UuqUqAv9TI11Tv1yic/19NArAxlxmopRLHAiJo6GNibEHk8j86a
	S+S3FbrbuZGXsJ3kukt9IUVzJBLUhkTJVUtZVUWNQ27LOo7LRT62nMc8Dz2XZ/wU0OVU/LOCxAjnU
	s3pX8cjC7WiqC1o2BtSsJRk1IDNA+7brniHDO4beoNCzTwskkm0VzOQPBgLczf6yLQKOFB5JW5/A6
	sRfzMowhNhoVELklRI1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFJQs-0000000BCkw-447A;
	Thu, 06 Jun 2024 20:09:58 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFJQp-0000000BCjP-3OT2
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jun 2024 20:09:57 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-52b8b7b8698so1841658e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jun 2024 13:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717704591; x=1718309391; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/x/2WBQ6gbCvrND5IFxR/WBO/YzUMRUz9LhDGSvyj84=;
        b=bI9oS33FgtETzpN8cNOv3nBgjspG+ZQzrJn+JdgPtTVZAuW4s/Lcq3rgtsl6gOS2wu
         kjQZaIp2vHCS+hxQbWZfu3AHjCFfZ2+cWm4/vVF5mUtg4WdFkE2gvmhIEe2JkmtTQxUy
         VYE9DrWRWZpQYF+Ml2gXfO8zTm4uKFg0SNsBk8gc/Y9ooe+yIn084VDTrAEztJGt1C7c
         6zfFu4/2jW0sHx6NKsK47QP2sMrx4vNwY272HJIgaRof378VAD2+aqUeZy63VwAWLeuK
         Fc5S6P8m+klN43HP1dhxXE5CqA83YY2M0sNztqNPLtuAEtCNJvAPKUvvrfy+NeNsqqOf
         dqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717704591; x=1718309391;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/x/2WBQ6gbCvrND5IFxR/WBO/YzUMRUz9LhDGSvyj84=;
        b=TYpDrDJXjryrD3TquwesAbUhAMyekRN9nbiB3ZAftwLsTXFAc1SxnG9iFRHtFv0pj0
         ntgfr6f+L1P6NljQ0fGztEdH57ic/aDdIHV5bOPUIe++mcNO6a9m2KSCEx4yblAPV/ES
         BoWlx7Ke+0l3NuegRtg4bBl2gH85DlMkYQkvbitp0xkZmtDcJGyI8cYLKN69IkRqLc4B
         2lNylGYFLIa0MEHlY20Ip1lcNpuJYe5Tspvt4oF2t55R45Noa2DvHbJ2pg4LYkAtoics
         pxfrXsaPutFhkCzONWeaEzJV1kp0z9PeYeXh5lHOcl4jMUcXHYrQ4at8vkb66MX7Lnlj
         Gm9w==
X-Gm-Message-State: AOJu0YyYVBhyTTr0922Ty15o3I1iJEubilAHkFhpdnRCNtooH34F9z85
	1l7ung1aJv1vLT0zVBDGq75pPJVV6YGzDyjgPh6+6ZRfUOURN6F16OTd4w==
X-Google-Smtp-Source: AGHT+IFMfUWxTcXE7jBqrp2Tc4LC6zjHPkg4CMCIpoorHg0SDKqa9BsjNrIHbnXKOQDYdlxiTanoAg==
X-Received: by 2002:a05:6512:5d3:b0:51b:e0f0:e4f8 with SMTP id 2adb3069b0e04-52bb9f815d2mr364391e87.31.1717704591106;
        Thu, 06 Jun 2024 13:09:51 -0700 (PDT)
Received: from localhost (5cfc9638.dynamic.mv.ru. [92.252.150.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb433c30fsm286016e87.250.2024.06.06.13.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 13:09:50 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 06 Jun 2024 23:09:49 +0300
Message-Id: <D1T7GIYA1OXX.CX879LDSBWN6@gmail.com>
Cc: <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 1/4] riscv: Fix 32-bit call_on_irq_stack() frame pointer
 ABI
From: "Matthew Bystrin" <dev.mbstr@gmail.com>
To: "Samuel Holland" <samuel.holland@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>
References: <20240530001733.1407654-1-samuel.holland@sifive.com>
 <20240530001733.1407654-2-samuel.holland@sifive.com>
In-Reply-To: <20240530001733.1407654-2-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_130955_876839_35344996 
X-CRM114-Status: UNSURE (   3.82  )
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

LGTM, thanks!

Reviewed-by: Matthew Bystrin <dev.mbstr@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
