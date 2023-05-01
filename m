Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B774BC77B61
	for <linux-riscv@archiver.kernel.org>; Mon,  1 May 2023 16:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xUy7MJ5N7WNYcDdEfxRXLeVQMILcZUwXQcCEbBLNErw=; b=N2BYi7HmSk86j1
	ySLcIO98yr1vLXmFRxn0ZRIqCFQUepx3y6odklHI7c/RfBPy9zIe0p0SaMjOHqOwX1FhBpLE58Npp
	pJGibpbZlHmVl7Ke4JutNK8n2OM9U5cyzg9Xp41XbgfKPvNUvighn3a/7h35Y1ytVUwJa+gAFrUqE
	7sEa8du05CHIHJpfH51Ah1iMpYIqcobB/vc6itvcaLsPqfXjJX1IBlO6PVo3o3Bbx1NuBd51gNoa+
	wC/Rqs4EFWudOF3ljRSUTywpUi8NrgUJusn5pq0qqVGgyWlRhW2f1xnjrmj1Wtzr/6lY1cG9eyADd
	+9G+Jfl3a5xunaR/ZC/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptWCV-00GIL9-1T;
	Mon, 01 May 2023 16:16:31 +0000
Received: from out203-205-221-239.mail.qq.com ([203.205.221.239])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptWCQ-00GIKC-05
	for linux-riscv@lists.infradead.org;
	Mon, 01 May 2023 16:16:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1682957470; bh=1i4fXVrCHwEHcOBQq4Knw1AJdDT/VSryujsH07IAoqQ=;
	h=From:To:Cc:Subject:Date;
	b=UKWQ+b24CF1iBZ3hJK3myiF0teCi6Jguw8dv3SscxNb1iFZOCJ9/rwZWV3MGL02bl
	 fu0yKdL/jr6cDEThMX3f4KjNKx8QepT3R2yw5+JUr+7IxT0YFiuaXYAjW02MYcSnLg
	 oGQem488C5exnnz9u6lzgr0Om/yMVjGFW51RcV50=
Received: from cyy-pc.lan ([2001:da8:c800:d084:c65a:644a:13d7:e72c])
	by newxmesmtplogicsvrsza10-0.qq.com (NewEsmtp) with SMTP
	id 2C5BE6A6; Tue, 02 May 2023 00:11:05 +0800
X-QQ-mid: xmsmtpt1682957465tbh88bn4e
Message-ID: <tencent_E6911C8D71F5624E432A1AFDF86804C3B509@qq.com>
X-QQ-XMAILINFO: MB5+LsFw85NoN+Knf0Ay9A4a08OjqZU83GADjlLKdSN2QEjLhjRhG9wBVAS++z
	 C+5NxI/l8K4j+Gz5TyWv5BkO6CB0IZa4OJD5mwLzE3CxzDGWkb9ZYorgLjeoP7eM3f7B3BN2sk1H
	 UMLr5AdjEZ/T4ao4ChX4o8MN7JPo6NIVgHr1d8u9HaSLc64yfYZzCb5dwvn9O1itdWiMbH/s36Pe
	 6NKME10is6Z4mpZuAL+w8zmB26HlIS4p9+OBMHmY6FeA84B7v6Ez7TUi/XUYBjfioHcvJOYkO671
	 uJPoE8QNzqPHJA+SG+6PdX4T8fpQlK8dMNifJASiL9Is0ZK3mo6OoR2vxoMWz8Tt1Cx8FfKx5Fff
	 764EMdkhh5inrFGm/+zg7UpjADs+DAFxVV5U1IHrX9eDg8SumBMvj+q28xnnWUNDFwUHzymUb2sI
	 bbNBawlLhh3ZkPbYbWr//rWZT4pjr0ohQzQUDhHt93xELgEY7S9kkx1G57USJQLGWHxcapR2Z5Yv
	 rcBMJta5gbc07yYQ+2WRJUITbCjxtDz1FgyAK+EfvgpBYpSSOSZ/D9rdQT3MmKOeVH/Qpbk608zQ
	 aYXHIrzqckeSCniOUhEOMLOJ3+9Bb816DoJQpgt0M/pO49CAxopXmoTNElss3INWSS1earQIF2qM
	 G03ddTFSL/0RTZ7AGsygnrfj3aWJ4nCfg+7i/i2spyUq016gQysCWfSbsX12d6Ly6W6Yi49XyQEq
	 BiGe2NWqv24foTI5T/NFQBYZQBl4uuRBSI0VedpO+7DAg73APEnqCXhmQu4fGp3fIQkfWEq1aK0K
	 5FCMelPOb2GSIpaFbl/Ibcloic6AGZJ21QNGKgVVqWow719bDHd/7qveSmbFvqFvVwg/wMsExu8X
	 54Xnp63uQ4lbsQfrgiKgPhb9ZwMXDpP1KA2hYCkQ+zFkkdG/+EHrzVhKcqPJQSMLQV6+AEE9Do/U
	 W7Q52QzxAdTJYIPQ5on3+sBSwl1Z9lcEtW7WuCZFdpbkuLrTvQdymsFQH0p3KA
From: Yangyu Chen <cyy@cyyself.name>
To: Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Jones <ajones@ventanamicro.com>,
	Wende Tan <twd2.me@gmail.com>,
	Soha Jin <soha@lohu.info>,
	Hongren Zheng <i@zenithal.me>,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v3 0/2] riscv: allow case-insensitive ISA string parsing
Date: Tue,  2 May 2023 00:10:19 +0800
X-OQ-MSGID: <20230501161019.150419-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_091626_387657_E7F08E9D 
X-CRM114-Status: GOOD (  11.79  )
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

This patchset allows case-insensitive ISA string parsing, which is
needed in the ACPI environment. As the RISC-V Hart Capabilities Table
(RHCT) description in UEFI Forum ECR[1] shows the format of the ISA
string is defined in the RISC-V unprivileged specification[2]. However,
the RISC-V unprivileged specification defines the ISA naming strings are
case-insensitive while the current ISA string parser in the kernel only
accepts lowercase letters. In this case, the kernel should allow
case-insensitive ISA string parsing. Moreover, this reason has been
discussed in Conor's patch[3]. And I have also checked the current ISA
string parsing in the recent ACPI support patch[4] will also call
`riscv_fill_hwcap` function as DT we use now.

The original motivation for my patch v1[5] is that some SoC generators
will provide generated DT with illegal ISA string in dt-binding such as
rocket-chip, which will even cause kernel panic in some cases as I
mentioned in v1[5]. Now, the rocket-chip has been fixed in PR #3333[6].
However, when using some specific version of rocket-chip with
illegal ISA string in DT, this patchset will also work for parsing
uppercase letters correctly in DT, thus will have better compatibility.

In summary, this patch not only works for case-insensitive ISA string
parsing to meet the requirements in ECR[1] but also can be a workaround
for some specific versions of rocket-chip.

[1] https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/view
[2] https://github.com/riscv/riscv-isa-manual/blob/main/src/naming.adoc
[3] https://lore.kernel.org/all/20230426-getting-tactile-e6cee2cdf870@spud/
[4] https://lore.kernel.org/linux-riscv/20230404182037.863533-14-sunilvl@ventanamicro.com/
[5] https://lore.kernel.org/all/tencent_1647475C9618C390BEC601BE2CC1206D0C07@qq.com/
[6] https://github.com/chipsalliance/rocket-chip/pull/3333

Changes since v2:
* Fixed misaligned '\' in `riscv_fill_hwcap`
* Move case 'S' after 's' to make the workaround only works for QEMU 
    in `riscv_fill_hwcap`

Changes since v1:
* Remove convert all isa string to lowercase letters in `print_isa`
* Remove warp parser pointer dereference with tolower in switch, use
    uppercase letter case instead in `riscv_fill_hwcap`
* Remove allow uppercase letters in dt-bindings
* Add Conor Dooley's patch which drops invalid comment about riscv,isa
    lower-case reasoning

Conor Dooley (1):
  dt-bindings: riscv: drop invalid comment about riscv,isa lower-case
    reasoning

Yangyu Chen (1):
  riscv: allow case-insensitive ISA string parsing

 .../devicetree/bindings/riscv/cpus.yaml       |  2 +-
 arch/riscv/kernel/cpu.c                       |  3 +-
 arch/riscv/kernel/cpufeature.c                | 35 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
