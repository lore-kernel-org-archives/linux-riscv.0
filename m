Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC652C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 03:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ARFDB6gkJVediVVVpjm1Kh7ZyGULP5NkXtuipvTHqTs=; b=2uiZBwpYiQPCxC
	BsOPUHAUBCI5lMeFhguYkrQml+7HsO+xiG4mgvmMMRodEnAGV47bxKckP4z/o/Lb7qAzzD1cCuuaX
	FzUsULiJ/nCpzNA0rpbWV9vRJZYCUGIhpLOsu8jxPZXjlmfXL4rPKx1jfmzuCSiI4Xx4LzVwQbqnx
	iKVfHE6n5g+MmMsJu/6XGVI0eqiehVM+MNT82QCS00H/P1f6CCL6aaoSPvagA9ZRlxJrEGv/mFc46
	CGb1MB435m0QYqflkDNi/9wT60qhY3x+ipuvbyyKzQBpXXUpTZUTXv97GuJK12fz+8/m+XCeHmY6H
	m3O8W706RlTfCnWKTkgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwat9-004ww6-2K;
	Wed, 10 May 2023 03:53:15 +0000
Received: from m12.mail.163.com ([220.181.12.215])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwat6-004wuz-1n
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 03:53:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=p9uHm
	CC4GlxQ1KU1bCyXbYnX5kCC6wGpCXGXt/a9UPs=; b=aLE2OGyMktksauQZV60GQ
	2juJOIJXrU0JD9B222ZqcM6sR9AJIsiwXQdhRxvNNfmViY9XXBkX0uN4/pRMaMCW
	sYEc17UWX9zcfKiEN+TUnoE9LbYZ5tkM0VtuMayg8y4slJ9Zfi0+2sT7HQ+l6XR2
	kLBJQo/m4iAIYAeutBnIkk=
Received: from zhangf-virtual-machine.localdomain (unknown [180.111.102.183])
	by zwqz-smtp-mta-g3-4 (Coremail) with SMTP id _____wBHlVQOFVtk+zPWBQ--.60792S5;
	Wed, 10 May 2023 11:52:59 +0800 (CST)
From: zhangfei <zhang_fei_0403@163.com>
To: ajones@ventanamicro.com
Cc: aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	zhang_fei_0403@163.com,
	zhangfei@nj.iscas.ac.cn
Subject: Re: [PATCH] riscv: Optimize memset 
Date: Wed, 10 May 2023 11:52:43 +0800
Message-Id: <20230510035243.8586-4-zhang_fei_0403@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510035243.8586-1-zhang_fei_0403@163.com>
References: <20230509-b0dc346928ddc8d2b5690f67@orel>
 <20230510035243.8586-1-zhang_fei_0403@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wBHlVQOFVtk+zPWBQ--.60792S5
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr4fCw18Ww4rtF4DtFW7twb_yoWfCwb_G3
	yUJrnYkwn8ArZakFs3Kr45WrWqy34DArW5Wr18Xw12gr9YqrWDZ3yvkr9Yva48G3WI9Fnx
	CFyYqayUAr1S9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRiBHqJUUUUU==
X-Originating-IP: [180.111.102.183]
X-CM-SenderInfo: x2kd0w5bihxsiquqjqqrwthudrp/xtbCfBBrl2DcJd-5swAAsc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_205312_933636_FFF89959 
X-CRM114-Status: UNSURE (   9.86  )
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

From: zhangfei <zhangfei@nj.iscas.ac.cn>

On Tue, May 09, 2023 11:16:33AM +0200, Andrew Jones wrote: 
> On Tue, May 09, 2023 at 10:22:07AM +0800, zhangfei wrote:
> > 
> > Hi,
> > 
> > I filled head and tail with minimal branching. Each conditional ensures that 
> > all the subsequently used offsets are well-defined and in the dest region.
> 
> I know. You trimmed my comment, so I'll quote myself, here
> 
> """
> After the check of a2 against 6 above we know that offsets 6(t0)
> and -7(a3) are safe. Are we trying to avoid too may redundant
> stores with these additional checks?
> """
> 
> So, again. Why the additional check against 8 above and, the one you
> trimmed, checking 10?

Hi,

These additional checks are to avoid too many redundant stores. 

Adding a check for more than 8 bytes is because after the loop 
segment '3' comes out, the remaining bytes are less than 8 bytes, 
which also avoids redundant stores.

Thanks,
Fei Zhang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
