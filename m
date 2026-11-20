Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FD5606A320
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 08:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pdHAgLnM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=16ZL6GQ5/o2v771I97+bWZRl7FOIMWTK8MmXeWik7Mw=; b=pdHAgLnMC6G8gZYHr0XgdsPgGo
	d8eRq+VsM26/bX1/0TUe9FWPdUn2WzUe5zquufPkChEOUI72I3qkK18OX4MHQuXUzhThiwn5jTTy0
	3WsHIhlYi2/WmthOWWvpCevbdNo9gWrNr2ZPbxODwYIzC1NE0l356e0vhbFU2He2F1aEfd91E9ER/
	YaXSRxOxWzkAQijQLXfm4opZk2OSBgVmfB5J+Wwg0LmjAnhJKSHoeuWFzRsmX7A/RUuQbvPznq2ZN
	78T2oLmaPhgNNT+jbw+lXONk++ajp+Eu8EuAD2q3ptVQpHxQD/lSghOek1v4wExhh0dP5r5dbfFff
	vstXAJaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKKG-0000000EOV5-1MFC;
	Fri, 20 Nov 2026 08:50:32 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKK9-0000000EOS4-1w36
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 08:50:31 +0000
Received: from [127.0.0.2] (unknown [123.116.51.226])
	by APP-03 (Coremail) with SMTP id rQCowACHkpPFCQBrNdxnAQ--.12681S2;
	Fri, 20 Nov 2026 16:50:15 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Fri, 20 Nov 2026 16:47:44 +0800
Subject: [PATCH] mailmap: Update Vivian Wang's email address
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-update-email-v1-1-b7e080827c7c@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2N2wrCMBAFfyXss5EkXir9lVIhSbe6YtqaSxFC/
 t1ofRyYMydDQE8YoGUZPK4UaJ4qyB0De9fTDTkNlUEJdZZSCZ6WQUfk6DQ9uWnEAS9WnUYroE4
 WjyO9f7mu3zgk80Abv42/4fGV6k/cNDA6ILezcxRbtjb7I/dWXnOBvpQPDL3BPJ8AAAA=
X-Change-ID: 20261120-update-email-b703e8c25fc0
To: linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Cc: Vivian Wang <dram+linux@dram.page>
X-Mailer: b4 0.15.2
X-CM-TRANSID: rQCowACHkpPFCQBrNdxnAQ--.12681S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtF1kZF1UtryxJw4fGFWfZrb_yoWDtrg_K3
	WrtrykurWkAFn8KrnxXFs3Cr1F93s7tr1jgwn8Jr9xZFy3KFn3CrWkCFWa9a4DXrykWr9r
	Gr1avFZYvFn3ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb2kYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF
	04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8mXdUUUUUU==
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_005026_242680_566B1236 
X-CRM114-Status: UNSURE (   4.38  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I am leaving ISCAS in December of 2026. Redirect future mail to my
personal address.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 0d05be949eff..1e518c12123c 100644
--- a/.mailmap
+++ b/.mailmap
@@ -993,6 +993,7 @@ Viresh Kumar <vireshk@kernel.org> <viresh.linux@gmail.com>
 Viresh Kumar <viresh.kumar@linaro.org> <viresh.kumar@linaro.com>
 Vishnu Dasa <vishnu.dasa@broadcom.com> <vdasa@vmware.com>
 Vivek Aknurwar <quic_viveka@quicinc.com> <viveka@codeaurora.org>
+Vivian Wang <dram+linux@dram.page> <wangruikang@iscas.ac.cn>
 Vivien Didelot <vivien.didelot@gmail.com> <vivien.didelot@savoirfairelinux.com>
 Vlad Dogaru <ddvlad@gmail.com> <vlad.dogaru@intel.com>
 Vladimir Davydov <vdavydov.dev@gmail.com> <vdavydov@parallels.com>

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261120-update-email-b703e8c25fc0

Best regards,
--  
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
