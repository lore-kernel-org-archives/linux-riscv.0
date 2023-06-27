Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC47EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 11:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x3zYMmR7nGZ4txVoGBOQywCiLSRLxtoqhPHlxxAKatU=; b=fk4H5TQxXZfpFQ
	TrSAfDiv3B7+VGHdcpfgcMzH0Ef2HlUccs91kIK/IrcedLHwulFZf3T8qQKVLg/RmCklbm2Zea2D0
	d4iPw3Dpbly1r+1D8MKkMVR4PZXX6RdbthjE9jq5Yu2nA+oPGBWS7Ko6h6Y+YeHZyYYeIIP3mzfqh
	f9KrXjv3vlw/q63Awwr0fBLTrmDbdugbNAdaDAMwz5Jneydp4blkUdBWE54LpH6RcXQVjbtdVVWJJ
	WfCx/RHd90fOqUzFszf6ftSyYjUzWOapK1qWbPAgN/wTm+Gg7IdHODz+i3woD9RPhNFlRltoU+8Sy
	xGWs+sG3tlnj6RqX9xNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE6gh-00D2KG-2e;
	Tue, 27 Jun 2023 11:16:47 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE6gb-00D2HX-2X
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 11:16:46 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-55adfa61199so1527119a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 04:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687864592; x=1690456592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3T9iTeVNQzTAU/7wMteUmuuKnmFgHV1312sTxoQaB0Y=;
        b=oRdVZMq7mZxqe5psKMkwXd3Pw7E2LBRN1zI62YKG2ZUagZMZvBOaW2F9ZW9XvWMIem
         5GyPj+pWI7ZrRpbvuj/HijnqITvfZ3fDXPaCMDtnDFIakgmO0tpimV9TGLMfEnC8LM+F
         fptP3WOvzCaIWzuCBafL3fgGpNIFzr9Bxo5J9MforIUYiCLhfclAmSU7ZSwii4OoSoJF
         v9WIIRAC/utMm8EZJo01UjbwSynpl/EhFdewcOXrLobY+3BUHOqFkObXKyfJY0Iyes23
         34z+nEnNAOZ6yl+JvGVmMCtJqPdQ5Tj3dGPCFFDPo76vRmBoRWgzWbODKJR353dtz0sM
         zxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687864592; x=1690456592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3T9iTeVNQzTAU/7wMteUmuuKnmFgHV1312sTxoQaB0Y=;
        b=OzaM6o2bnqBHcyndt3pxTwlayzs/TEEcoBCEKXRVcqwS5mOWief4y2UV5FNyQFfQbg
         cJ7d4NAej8iXLEz9LGX3USqGHj3dbt4b5k7g+jjECA+Qd5eNwTfSKH/wzvoWdkx7/0Jp
         VA4tes6GKSeelc4qEQSCglQKi8/HyLb+h7fDFWEvT33yx1NSJEW+N7uXsQNs7vlV12RO
         ++5e1gajB6MFgITiKgoEk9CLPdEbX03AHWQScS/DMje1iBxMqDk7KvMcdpFBbATQwzkE
         q7f9crM/GgGnhQoUqRW/HWVhCfdwt9a48rrGpBjxxpTXja0BmFk9707tEaFIzdBYdxME
         TwZg==
X-Gm-Message-State: AC+VfDwotAYirMKa29QMfakJGeQhwbNsr1s+yD/CY5NIBHrsbt78yJMB
	kYcSrzLHNvzW9bt/jKXPHEk=
X-Google-Smtp-Source: ACHHUZ79Fi8jt2Wz+6tpKuWWobH/1Bfv1d7qGECksB47nYmt7I9vII5rUXyK39VKG8wiF7jntfi7Qw==
X-Received: by 2002:a17:90a:2f06:b0:25b:bae6:3c67 with SMTP id s6-20020a17090a2f0600b0025bbae63c67mr31684018pjd.43.1687864591997;
        Tue, 27 Jun 2023 04:16:31 -0700 (PDT)
Received: from localhost.localdomain ([58.240.82.166])
        by smtp.gmail.com with ESMTPSA id 8-20020a17090a004800b00262d6ac0140sm5438658pjb.9.2023.06.27.04.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 04:16:31 -0700 (PDT)
From: Song Shuai <suagrfillet@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	guoren@kernel.org,
	suagrfillet@gmail.com,
	bjorn@rivosinc.com,
	jszhang@kernel.org,
	conor.dooley@microchip.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	songshuaishuai@tinylab.org
Subject: [PATCH V11 1/5] riscv: select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
Date: Tue, 27 Jun 2023 19:16:08 +0800
Message-Id: <20230627111612.761164-2-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230627111612.761164-1-suagrfillet@gmail.com>
References: <20230627111612.761164-1-suagrfillet@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_041641_822950_1E0B2FA2 
X-CRM114-Status: UNSURE (   9.78  )
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

SW4gUklTQy1WLCAtZnBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeSBvcHRpb24gaXMgdXNlZCB0byBz
dXBwb3J0CmR5bmFtaWMgZnRyYWNlIGluIHRoaXMgY29tbWl0IGFmYzc2YjhiODAxMSAoInJpc2N2
OiBVc2luZwpQQVRDSEFCTEVfRlVOQ1RJT05fRU5UUlkgaW5zdGVhZCBvZiBNQ09VTlQiKS4gU28g
cmVjb3JkbWNvdW50CmRvbid0IGhhdmUgdG8gYmUgY2FsbGVkIHRvIGNyZWF0ZSB0aGUgX19tY291
bnRfbG9jIHNlY3Rpb24gYmVmb3JlCnRoZSB2bWxpbnV4IGxpbmtpbmcuCgpIZXJlIHNlbGVjdHMg
RlRSQUNFX01DT1VOVF9VU0VfUEFUQ0hBQkxFX0ZVTkNUSU9OX0VOVFJZIHRvIHRlbGwKTWFrZWZp
bGUgbm90IHRvIHJ1biByZWNvcmRtY291bnQuCgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1yaXNjdi9DQUFZczI9ajNFYWs5dlU2eGJBdzB6UHVvaDAwcmg4djVDMlUzZmVQa29r
WkZpYldzMmdAbWFpbC5nbWFpbC5jb20vVC8jdApMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1yaXNjdi9ZNGp0ZnJKdCslMkZRNW5NT3pAc3B1ZC8KU2lnbmVkLW9mZi1ieTogU29u
ZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPgpUZXN0ZWQtYnk6IEd1byBSZW4gPGd1b3Jl
bkBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4K
QWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jp
c2N2L0tjb25maWcgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwppbmRleCA1OTY2
YWQ5N2MzMGMuLjc1NmQ4NTRlNmNkZCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCisr
KyBiL2FyY2gvcmlzY3YvS2NvbmZpZwpAQCAtNTksNiArNTksNyBAQCBjb25maWcgUklTQ1YKIAlz
ZWxlY3QgQ09NTU9OX0NMSwogCXNlbGVjdCBDUFVfUE0gaWYgQ1BVX0lETEUgfHwgSElCRVJOQVRJ
T04KIAlzZWxlY3QgRURBQ19TVVBQT1JUCisJc2VsZWN0IEZUUkFDRV9NQ09VTlRfVVNFX1BBVENI
QUJMRV9GVU5DVElPTl9FTlRSWSBpZiBEWU5BTUlDX0ZUUkFDRQogCXNlbGVjdCBHRU5FUklDX0FS
Q0hfVE9QT0xPR1kKIAlzZWxlY3QgR0VORVJJQ19BVE9NSUM2NCBpZiAhNjRCSVQKIAlzZWxlY3Qg
R0VORVJJQ19DTE9DS0VWRU5UU19CUk9BRENBU1QgaWYgU01QCi0tIAoyLjIwLjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
