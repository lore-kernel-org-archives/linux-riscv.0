Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E47CFD364
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 09:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YXdlOro2KT55itQU3c8NnoAJ3vd3the71M4jkoA37LY=; b=KnHKydtZDApo4G
	ZB82k7F5Ns/851882l35lnV2zIUwrL35eNhdS+zWak8+lDTWAtG23D2o41SHbEhBsHK6AEHTDucmg
	8c3Hf1k+JsdU0hxKQDWq4im0ybOiefOSqdwdbCY4LHV1707NBWWRtYkQIINqrUBQnuw7dymcoM5xO
	1BWisCVQyrOYB2iPPtqwR0C0hTOfa0O9YxXai53AWW57NvLYPbnham0gLCg0AVvIhEXnVELsi6lZs
	aK4buTsqmz8lguVL74ABlYY5fJJVmb/MSZdXsU/A2GDRypEXXM7OOJ5tIeFHU/pF7gE36R/On3dVm
	ol8nXKe9UrYCkSi8W8TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpJy-0000000D1TZ-0HIc;
	Tue, 25 Nov 2025 09:26:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpJw-0000000D1TD-0MiB
	for linux-riscv@lists.infradead.org;
	Tue, 25 Nov 2025 09:26:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 56A6240914;
	Tue, 25 Nov 2025 09:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B145C4CEF1;
	Tue, 25 Nov 2025 09:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764062805;
	bh=ErOM444bOXMh61rVrobY83T6XHQyhnCIIqDGmHNaO+I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Di2nBLOSNMYX6/HckJXKqSEkHKif8fCu581MJdcRl+4veXlIsc/3xu6iRJGs+hpKl
	 V6+bg9GgXqXVsUUcgkHeUK+pgDF6yBX61eckxujcWVQypJbtq5l2t3O4QztdVBPkdD
	 CpPQ8f0JLhU0yzVeggD9iM4gBiA70aJN0C8o0VSgI3cR6AJVrP9BpuQimskeTzAJpq
	 Y46OB2fvCIHwiQ283v5+MaIhIAepLBh7gn7Y7vyQC5YEDvvEt/mNidsUpu7TOdv/IM
	 ZG8UgXssLmyrsV2Mvgktxd7uFea9k2K3GGUE6/WuWpheswv549N/WDWQkWyqMkCffG
	 Vccy3I6xp8ldA==
Date: Tue, 25 Nov 2025 02:26:42 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
cc: Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Charlie Jenkins <charlie@rivosinc.com>, 
    Song Liu <song@kernel.org>, Yu Kuai <yukuai3@huawei.com>, 
    linux-riscv@lists.infradead.org, linux-raid@vger.kernel.org, 
    linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH V3 3/5] raid6: riscv: Prevent compiler with vector support
 to build already vectorized code
In-Reply-To: <20250718072711.3865118-4-zhangchunyan@iscas.ac.cn>
Message-ID: <6c2a11f4-27ac-1389-23a6-5f5bcf1c5048@kernel.org>
References: <20250718072711.3865118-1-zhangchunyan@iscas.ac.cn> <20250718072711.3865118-4-zhangchunyan@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_012648_174702_874DE608 
X-CRM114-Status: GOOD (  13.76  )
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

Hi,

On Fri, 18 Jul 2025, Chunyan Zhang wrote:

> To avoid the inline assembly code to break what the compiler could have
> vectorized, this code must be built without compiler support for vector.
> 
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>

This one has been queued with a somewhat modified commit message to 
reflect what I thought the intention is.  But I might be wrong.  Can you 
check it, please?

thanks,


- Paul

From: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Date: Mon, 17 Nov 2025 21:19:24 -0700

raid6: riscv: Prevent compiler from breaking inline vector assembly code

To prevent the compiler from breaking the inline vector assembly code,
this code must be built without compiler support for vector.

Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Link: https://patch.msgid.link/20250718072711.3865118-4-zhangchunyan@iscas.ac.cn
[pjw@kernel.org: cleaned up commit message]
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 lib/raid6/rvv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/raid6/rvv.c b/lib/raid6/rvv.c
index 89da5fc247aa..015f3ee4da25 100644
--- a/lib/raid6/rvv.c
+++ b/lib/raid6/rvv.c
@@ -20,6 +20,10 @@ static int rvv_has_vector(void)
 	return has_vector();
 }
 
+#ifdef __riscv_vector
+#error "This code must be built without compiler support for vector"
+#endif
+
 static void raid6_rvv1_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
 {
 	u8 **dptr = (u8 **)ptrs;
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
