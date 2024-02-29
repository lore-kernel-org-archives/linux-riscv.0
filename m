Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89BBC48BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 12:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DXd4zst9KrqQjSKMB3ut6UjBOb1yLzwgkseL+wUCFEE=; b=I1ZPR6tHLugAyA
	aid+5qXZYDgl3Igr6ICFIComgX+ZT2Vja7uo3a4DfXUsXqDoV7uFbF8BVqektKT5nmKgvyAcmu8jq
	wb/jo789dg/YuXEJ0hsCoAKtKz7Mzzg+nDbfVZNQoR0WGq9/WSoQfKYOqx7rVDfdARq01M6f0XKm9
	bUxFbDvMPExy9Ifh+aewbp0/Dyu7Sf52DT78M/Ljf/rTlGPsNlufjLN2uoNmeMij6H9b+IIL76j/0
	ztZ/tUmf+fxprJPaUJV6L2OjX/jWf+KppgThx3ndgT3BcPl/0+ozJFL5G0fcT7S6mEb1GaSx/IB/p
	Nu2GcU7cga7jKTUXjlhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rffFU-0000000DSPa-1tYw;
	Thu, 29 Feb 2024 12:10:52 +0000
Received: from out162-62-58-211.mail.qq.com ([162.62.58.211])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rffFP-0000000DSNZ-0Iml
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 12:10:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709208634; bh=FXLGu9tMm3TBy8l3UYEso98K6Li1B3GrMam+HnDFMzg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d5v9QSPEyEZTpth4ZJJYpv5M9SezOZsW1CDhrG2mqXuwbU+WbMO1rNoEObKbDcONs
	 cQG8fvllsRuUkoY6hV80ssZq6M4IW++OpxxTS1NW0QyxXAndGpginqJ/pik6oQ3wuV
	 JLqSJXoQ5wDeGeCgJN1NhOoZkcoHUB8XfPCKPEWQ=
Received: from localhost.localdomain ([2001:da8:c800:d084:427:1102:8aff:8b6e])
	by newxmesmtplogicsvrszb9-1.qq.com (NewEsmtp) with SMTP
	id 283B6817; Thu, 29 Feb 2024 20:10:03 +0800
X-QQ-mid: xmsmtpt1709208603tcjm8z9wa
Message-ID: <tencent_3E8D4B7CAE824BDA238EA2B821310F21EE08@qq.com>
X-QQ-XMAILINFO: OATpkVjS499u19AglRscYPH4jyzJB+Vl8Fnt0SaLDIolkFrK9wPPPy0jK+e7cO
	 Ht3l64KsXh/Qll1xXkeRBT+W4Zmuz4GGc1jxddbiJA6iJD5p7nB2X85F1dXA4jTu2iaM/Rbqif2t
	 upImo5lLq5wHcftQLQepl6hLI3t/CdtvR26+UW8W8COiGWbcTERgB8KrFSkv8lMdMPXkJO4hz0RK
	 WNqvq1J8brOOVQ65AgGgtusp3vSoY+QuyNB9pZFKP+A7tGlqBX6xy0OP6BTXsALE4AMR5Mff16OL
	 cPIhvjyJvR2q1HbHcoSeB6yWtRekGj/6nLvN7vM0mhr8ZbBTPuPSEeJfu8ipqf+3RZ4RB6dT5sug
	 s7YQfmuPKsEXEvIh+aN5Ct5NjRwFTV3GWAQXLfgVmShKi3lbn0QqZNdHe5dsLc+B4Sp/a71Ya6en
	 WkHVt8v3HG+vpoeqVR1ySdYieuQEXrmryVuRWaWWsviqEzWx56/jTGILpvYOMPs6CdnySWgAAuiY
	 xCuzZPEREmGsLkARwLy5zgsPb/TaDj4Le9F/X75IeNsnoKSBBJRdBjomvV7Gc8FNTrZJd+lJISU/
	 qiGxO9WreS+EZe6gh7Us27BEmq96DXElSo6Ysd+mBZw730A20dO/6ZAUmRVt0/jok8VUskE9xS8C
	 BNh/ojbk/+OpeWSwUFNK2T+lndMhAelXvhQomyChV8Iwxjj+Szuvx2l+XoM+I58NP7PL56+El3+K
	 cPdC6TIkqhQfZqankMrfm+WrfZF9jlaMns1HtyDoqqandsHlugDFZ1mzcelBseHQDXEqEEFnx996
	 hZECdOD/DHaAYY0/uHdwgDM0iFjpgYJpPbJ/NPJ7E2pKFiarAF0/DnetYAbdYRgH3kB53lXPVrMk
	 xjaUG9sPizVOtTFChkom/HA7+5r/xkJZA+Xt4AKz4/WFw6JQXfnTlFiSs21pWs+uGd0BWDWT//Ae
	 3zZxZJUrmiM1HD7R2ng6R43PhVTm/K9iApYrQdafTQHQGthGLXb1n7M9iegdXc0XF+Ie0EdqFQtp
	 HKvpSw1lp9WcRue8QlEKNlloIuotM4WRHVz055rwDcpDbqld5tAgrjraCD+q5ufZNfK32a8/SUxO
	 YgY/XV
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: Yangyu Chen <cyy@cyyself.name>
To: cyy@cyyself.name
Cc: alexghiti@rivosinc.com,
	andy.chiu@sifive.com,
	charlie@rivosinc.com,
	conor.dooley@microchip.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: Re: [PATCH v2 0/3] RISC-V: mm: do not treat hint addr on mmap as the upper bound to search
Date: Thu, 29 Feb 2024 20:10:03 +0800
X-OQ-MSGID: <20240229121003.14374-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <tencent_B2D0435BC011135736262764B511994F4805@qq.com>
References: <tencent_B2D0435BC011135736262764B511994F4805@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_041047_677149_98FB431B 
X-CRM114-Status: GOOD (  14.50  )
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

This patch has not been reviewed for more than a month. There is another patch that did the same fix but in another way and still has not been reviewed like this. I'm here to do a comparison of some choices briefly to let the maintainer understand the issues and the solutions. I think it's time to make a decision before the next Linux LTS v6.9. As a number of sv48 chips will be released this year.

Issues:

Since commit add2cc6b6515 ("RISC-V: mm: Restrict address space for sv39,sv48,sv57") from patch [1], userspace software cannot create virtual address memory mapping on the hint address if the address larger than (1<<38) on sv48, sv57 capable CPU using mmap without MAP_FIXED set. 

This is because since that commit, the hint address is treated as the upper bound to create the mapping when the hint address is larger than (1<<38).

Existing regression for userspace software since that commit:
- box64 [2]

Some choices are:

1. Do not change it

Con:

This behavior is not the same as x86, arm64, and powerpc when treating memory address space larger than 48-bit. On x86, arm64, and powerpc, if the hint address is larger than 48-bit, mmap will not limit the upper bound to use.

Also, these ISAs limit the mmap to 48-bit by default. However, RISC-V currently uses sv39 by default, which is not the same as the document and commit message.

2. Use my patch

which limits the upper bound of mmap to 47-bit by default, if the hint address is larger than (1<<47), then no limit.

Pros: Let the behavior of mmap align with x86, arm64, powerpc

Cons: A new regression for software that assumes mmap will not return an address larger than the hint address if the hint address is larger than (1<<38) as it has been documented on RISC-V since v6.6. However, there is no change in the widespread sv39 systems we use now.

3. Use Charlie's patch [3]

which adjusts the upper bound to hint address + size.

Pros: Still has upper-bound limit using hint address but allows userspace to create mapping on the hint address without MAP_FIXED set.

Cons: That patch will introduce a new regression even for the sv39 system when creating mmap with the same hint address more than one time if the hint address is less than round-gap.

4. Some new ideas currently are not on the mailing list

Hope this issue can be fixed before the Linux v6.9 release.

Thanks,
Yangyu Chen

[1] https://lore.kernel.org/linux-riscv/20230809232218.849726-2-charlie@rivosinc.com/
[2] https://github.com/ptitSeb/box64/commit/5b700cb6e6f397d2074c49659f7f9915f4a33c5f
[3] https://lore.kernel.org/linux-riscv/20240130-use_mmap_hint_address-v3-0-8a655cfa8bcb@rivosinc.com/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
