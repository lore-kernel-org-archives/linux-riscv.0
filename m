Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF0BEB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 01:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kB5sgPpbOZM5fcAbW0FFJ07DoQvleDzZK7RJz17/0SI=; b=KSFE+v/WvEyrO+
	rYh1sz39BvkB3M/fkOjjN/9Xvo0ykEaSKfFohU4v985KNtiaQ0s5nsf7b6Q19hYP75OdI6xTZHqhW
	JSKI0r1Nq2+O0KyGRMjnHpt/nL6xjv51166zeQVkbHztRCJdiPct9BIGhRWHfWbuQusWuwfuCy1Lb
	PEv4qZ/mu6y18CfNUtSLCudTb8wYNM3s9qaX1srYU0HrxQpBYHsK0tI2or3tdCXbG4dYjzTmdiC7w
	w4LUbTzZn9McyMuQvTjAwrKz1TBNe8AEbYjwInuVwJVDVL+kycRWKL1bmKQSqnZonoiXa8MOuYTDh
	Mtrf5koaeak7nOztA+Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDxw8-00BPDw-0y;
	Tue, 27 Jun 2023 01:56:08 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDxw4-00BPCs-1T
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 01:56:06 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-66869feb7d1so2130638b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 18:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1687830961; x=1690422961;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/zwlrUQvnJZPB1PxtpNLJ/gginWhf0/3T5xPAclgcE=;
        b=iRYNiGhoQVw4DS25sIW7bZykH+8FhmIC9jpo04/cPUIQff0T7iftwWfQ1R9W19gk3M
         CvaWnwsZPioKnFbxGCjRwhT46rVbhyfsm/K6+OPnkDTqFUsER3WWwjS5kBo30D5yXcOF
         opD99qD2zBOyy6IQW9d2wh/yB1w5s3Srs/tOS0uODcahuTkL0QH3z+5h/RpMSL86wHQW
         uEKu3VgvlGFHHMjpImRvT3Db4EjYSaxv4dJZJRhyNEC77M8qOG3Jp9xABASbTxEWLrQY
         vtWnINX1CcHVQ7fREVyltAqD36WjCWWgXUIhzkwbp83mQBUYafqCACK0ouopw80wrEIu
         enZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687830961; x=1690422961;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/zwlrUQvnJZPB1PxtpNLJ/gginWhf0/3T5xPAclgcE=;
        b=KvzDhQBEPzOeln60tLLOilF3+/u0m+g/PRt8MHcJ4bqP8sSLdFsgLlAgqw0K6yJ+Rw
         afn5xO23vpRD8RyynNEP6DwA76lsGNc0HQgHnk3O1sg+gcDYzKsYEETeJovyglQFpRMP
         m+Ug8VYFh4szxTMa43QlkmMJ8e/NZuU6ho65pFm+MVdH2xG4FyzQ/W/KPTRmTA6KCSJv
         jTZbjHb36UNMl9SL+k0xxw3tsU8+ZNKiT0YPM8Ck+VFSeLY7vv4zUqgHPAXmKU+YT6oh
         ByTCGZrnJcz79kbMO3g6GVJSNndJ473/zM+4kt8JOCco0JGs+fFMfQlIjFmMR8++Fp4S
         VGkw==
X-Gm-Message-State: AC+VfDyrMnlmsrOsbl8H8m+gip+s3IePgiVtKP4jm5HCcOzjX8aNfJy/
	H+ABlIcd0KE43EWi86T6HLSEoic7GpT8HFYaF313ivdFF5CrDa7pOz9eKlCabEYa7G47UpSKkBl
	9cD+G7PDYqh266u8o9RfgEow7bhgjy3aJDOfkotKaVpvonAxvthwwxUHhguJxzQD1RJf9lTLXnd
	z14dUtgnurNgq+
X-Google-Smtp-Source: ACHHUZ7COrTSsB7bb/hK64fBUw7a1zGar9DCJiA+7HdjDF9Tok2hilzX7ny4H9S1bG9gWF7EKFA/2Q==
X-Received: by 2002:a05:6a20:7f8a:b0:118:2e5a:efab with SMTP id d10-20020a056a207f8a00b001182e5aefabmr30253680pzj.4.1687830961234;
        Mon, 26 Jun 2023 18:56:01 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id iw4-20020a170903044400b001b80104446fsm2643375plb.20.2023.06.26.18.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 18:56:00 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@rivosinc.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [v1, 0/2] Initialize Vector registers in the first-use trap
Date: Tue, 27 Jun 2023 01:55:53 +0000
Message-Id: <20230627015556.12329-1-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_185604_588202_D6DC94D5 
X-CRM114-Status: UNSURE (   8.11  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Before applying this series, We only initialize the space for saving
Vector registers. This is not enough as Vector registers themselves also
neeeded to be initialized before dropping back into userspace. Or, we
may risk leaking a process's data left in Vector register to another
process. This can be verified by only applying the second patch and
running the test.

Andy Chiu (2):
  riscv: vector: clear V-reg in the first-use trap
  selftests: Test RISC-V Vector's first-use handler

 arch/riscv/kernel/vector.c                    |  1 +
 .../testing/selftests/riscv/vector/.gitignore |  1 +
 tools/testing/selftests/riscv/vector/Makefile |  6 +-
 .../selftests/riscv/vector/v_initval_nolibc.c | 68 +++++++++++++++++++
 4 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/riscv/vector/v_initval_nolibc.c

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
