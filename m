Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE43C433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Oct 2022 07:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=slz2Jc1v4dcsfF7P3MTxu2RlAqz78gwGpjMOYRB9tsU=; b=Jw42ca4dRbn0+ihIz1aUMjPB+4
	extY5QkR5KwfJFwBftZL4ZfLua2DauJEXdQn4A4Vy6f4sFiBQVeBKp6kOvm5EB/EnXbJXCJelz78o
	dGGQEo4pAQv491/dXPXmOVR5uJCsItEw5GzZXnEzgz2IXEVaN9S8I+D6WYsEI299QAYu7tO4ho9BF
	fjDALMrjdJXW63K/L8LIy11GWu9B6tlFVYHqok0MARY5dBVKKZhyfsZE6tiVxu+WRC1Fr1KyZq+I1
	/+zHKLiV3z2ouvJDwFTLeR7PoXOiK2fIb8V62aeXpQT5LKCAqv9Bq1Phx3tdCWckw3VU+9q3MA1ub
	qTgZ2BxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojbIJ-00GZk8-3f; Sat, 15 Oct 2022 07:09:15 +0000
Received: from forward108p.mail.yandex.net ([77.88.28.116])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojbIF-00GZj1-9F
	for linux-riscv@lists.infradead.org; Sat, 15 Oct 2022 07:09:13 +0000
Received: from iva7-f62245f79210.qloud-c.yandex.net (iva7-f62245f79210.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:2e83:0:640:f622:45f7])
	by forward108p.mail.yandex.net (Yandex) with ESMTP id 5DDFF2679A4F;
	Sat, 15 Oct 2022 10:08:59 +0300 (MSK)
Received: by iva7-f62245f79210.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 1lRMmvEtWP-8vjeZEld;
	Sat, 15 Oct 2022 10:08:58 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cloudbear.ru; s=mail; t=1665817738;
	bh=KKX8BVExRu86w4MwhKPsvN5ihorbYP8gTnS2TecsHwY=;
	h=Subject:From:Cc:To:Date:Message-ID;
	b=KrkGJC1TL8T2OtEaiyq6J0vMvTAxd7d7T/HoUsnlSD3HAN/kFhxzEaoASdJ+jP4l1
	 hr3gOzdAajmxnKZ1LoMIdYO/hppz1iNDsCJVgLv3i8ATFqtWIkapkaMBPCaq4OvcOw
	 thho5H09AQwhkJMGmqkKG79nSd0nMC7fdCajBnwo=
Authentication-Results: iva7-f62245f79210.qloud-c.yandex.net; dkim=pass header.i=@cloudbear.ru
Message-ID: <3815b200-a9e2-a3db-c7f1-1e3f86dbab3f@cloudbear.ru>
Date: Sat, 15 Oct 2022 10:08:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: ru
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Dao Lu <daolu@rivosinc.com>, linux-riscv@lists.infradead.org
From: Denis Ivanov <denis.ivanov@cloudbear.ru>
Subject: Bug report: cpu_relax call from vdso space
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221015_000911_885954_5DB97BE6 
X-CRM114-Status: UNSURE (   1.42  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello,

Segmentation fault may be raised from cpu_relax() 
(arch/riscv/include/asm/vdso/processor.h).

cpu_relax() may be called from vDSO functions (ex: 
__vdso_clock_gettime). This means that global 'riscv_isa_ext_keys' 
variable must not be used in cpu_relax() directly.

Use of this array was added to cpu_relax() in
https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/?h=fixes&id=8eb060e10185cfc97ef0200d197ec246ba0f9f8c

Denis Ivanov


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
