Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDFAC77B7E
	for <linux-riscv@archiver.kernel.org>; Tue,  2 May 2023 05:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EH7gLR6V5+kUd/EEcaewg+WobeEn7j1TGYML9+2Jrs0=; b=Rcll6xZ5k1s4HH
	EGcxQMxkNQHywBm5FgQ3bQfz+zDDY6rhM5M8ZzIUhyR38VZb6AGhCNGieJ0sqK4o9flpe7mDEnTBc
	RD1MRBK5fNbB5QFo2MigIBnXMQ4S3k/MJQqQzbzJlTGxG/zvQQ/8U++pmyLC0e3tZ3W60K31hpn6M
	obks3/kHOvP5w5y55kvCbM/Smd+MohlU/vmO7SbVFDIRK5PwxlhoLx5eDS/gbCExcynC6alpZyryV
	VPxGGC54TnU6+I/OBo+4QurlYfNT5fnOjhrHFELhxyA0+VK1K2e9bsUVY3GL1tS3YStSQTFo4gCcR
	lTku1BCvw5y3zh4BZXwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptism-000GOR-2k;
	Tue, 02 May 2023 05:49:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptisl-000GNp-2e
	for linux-riscv@bombadil.infradead.org;
	Tue, 02 May 2023 05:48:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=To:From:Cc:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AzHLu2IE2hBOSzYWzYuO1d3tPlj9dvz+Gi0jCi92Ess=; b=imhNsOzCKifb6bTssVrbXIjRL6
	uaoSOABgySI6Xz7k19TonwSmPHAvN5kMLEiNZbtYszQVlGd0wBKCehHvYyfIJujkVRsIgua1gbuwo
	u/FHi1fxfaEOpVBUP4WZqdTvgokAowIx8JS8flutgzqOn5FzML1uqvTSg6JNGn+1IAM1W4UOJsOk0
	peF26Usr3Gy6oa7sX+416x0WV+EsAVNthMXfLTd6eYZZE7ZdHM9Swx5cgydTLpVStFnddm1Doe0+K
	ukV2vLIdXioYFwwrZY572vS1zDQuibnuYxjO8L9FRr7Zhiysb44EshtJ6U8L2wJaxPWWqGpUF9gfe
	3HGxMplQ==;
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptcGV-00F2KQ-2v
	for linux-riscv@lists.infradead.org;
	Mon, 01 May 2023 22:45:06 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-63b620188aeso3602917b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 15:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682981101; x=1685573101;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AzHLu2IE2hBOSzYWzYuO1d3tPlj9dvz+Gi0jCi92Ess=;
        b=l+etingCqkCcg7YVZcIbCb3tAgH/fw+7NrA+JQimhwOqMhVpayG0TnqhScXDp67Gbj
         mt3Rowavme0deGnxcl7tzfUNKU12fLdb2IepA/AGjDtk/8ZyHItON/8clKIEh7Ih3a/+
         Xqq+3KEvSI5pa77EM7OeEwgURPpOwsZ9CYJttafPPCtDiNExYauuLjzdHhXO4r3O3Kzm
         LEAN3Q6qQrRzf8NZaXfvYyEhm8katOz+3bmQ1bSozWkYnz/s3uMAFoo7OM3jYJyKtQOQ
         EvSGYVkCub7saq51URsMQIxyI4nVjxbTnDMzcGdzljShHBuQ8J44LmZp+xkYYv20iJhz
         b06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682981101; x=1685573101;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AzHLu2IE2hBOSzYWzYuO1d3tPlj9dvz+Gi0jCi92Ess=;
        b=OK9/nFfMRu/Dbu0b6awt4hUB7S2RS+igjJRUgRyjaKCQpHN/eRELawGNUbPq2XB5yF
         EtUzYX/iXeL9Y1c+pPFc9m6fGh9REwT2oxrEc7IEdWsvuTIV1eXJ3Sy6MQOSraBr2kjh
         nxfCSeZ4aL6Q9BE2TahCKEYS4H3biaivxjpHWs0GcGO0yy+awtB9bVKVGrJ0ZAaiD3uP
         +kmvVXwK6hGSaDXWPChryWtLsHp+JLkI77TPEPJLn2dhwOGZILQtLpgcOiVbRh0RM99a
         Sdb2/xQrP5rErYw8KrGemd6tGa3ISiqIueY6iPlsg73KsiJxlnDcoZSQ33O2wSaqBeft
         o8rQ==
X-Gm-Message-State: AC+VfDyB3yVIMSjDSYMgsECWfxIYvtuboiX/SikirphQMeVvR2oxMqml
	wcolj5+kdoxMBPUHlsjLaqvmDQ==
X-Google-Smtp-Source: ACHHUZ4x6VuJp/yEmoeYuM5nzs5gQwZFdfvd1p2XMb9T7ryqZdb9THhG5jPgoDjaT3nPCWGHnvXe+A==
X-Received: by 2002:a05:6a00:1a14:b0:63d:2d7d:b6f2 with SMTP id g20-20020a056a001a1400b0063d2d7db6f2mr22871225pfv.4.1682981100881;
        Mon, 01 May 2023 15:45:00 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id p14-20020aa79e8e000000b006258dd63a3fsm20407733pfq.56.2023.05.01.15.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 15:45:00 -0700 (PDT)
In-Reply-To: <20230429155247.12131-1-rdunlap@infradead.org>
References: <20230429155247.12131-1-rdunlap@infradead.org>
Subject: Re: [PATCH v2] RISC-V: fix sifive and thead section mismatches in
 errata
Message-Id: <168298107620.32296.5030493060943182788.b4-ty@rivosinc.com>
Date: Mon, 01 May 2023 15:44:36 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
  Conor Dooley <conor@kernel.org>, Evan Green <evan@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_234504_102935_07E940C4 
X-CRM114-Status: UNSURE (   6.82  )
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


On Sat, 29 Apr 2023 08:52:47 -0700, Randy Dunlap wrote:
> When CONFIG_MODULES is set, __init_or_module becomes <empty>, but when
> CONFIG_MODULES is not set, __init_or_module becomes __init.
> In the latter case, it causes section mismatch warnings:
> 
> WARNING: modpost: vmlinux.o: section mismatch in reference: riscv_fill_cpu_mfr_info (section: .text) -> sifive_errata_patch_func (section: .init.text)
> WARNING: modpost: vmlinux.o: section mismatch in reference: riscv_fill_cpu_mfr_info (section: .text) -> thead_errata_patch_func (section: .init.text)
> 
> [...]

Applied, thanks!

[1/1] RISC-V: fix sifive and thead section mismatches in errata
      https://git.kernel.org/palmer/c/a2a58b5ca124

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
