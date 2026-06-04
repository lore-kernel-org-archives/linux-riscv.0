Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE938CD6E4A
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 14:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CmQiuBKUXaYg4JrnCicsG8LpTbED26HYhG7Jz8iqink=; b=f7Qsy+u+GojgiZ
	ROrDNVYZrsyU/A+Gj75/YVm19v0yj2WdSc6HhDwzrVhpDkCZdsVqaDfb0jfE6zkZ1WcktRI80qdgX
	CuHJodqf9fNnO6GJn5bL8fBshyxfgp1hjxt8I0AWlcCSZX2FGliP37r0U+ds4RUu1FpPU6omw9+l8
	qo4AN4UfgHCKIomVK66a/0fnZkgqYzMwsbtEaDwQNyruHX6fyOr87BTlaY9IxSAFwt9NmY0dJHnMY
	ebHlqc6LcrKuP4taxKA2bQYCg6yNJBynWFVw1gySpFrFC5WAqZ1Ic9gVMyEFBdA2WSLu/dirs3ZFK
	hWQf8tVpwY+/Dw3l+vNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9Xr-0000000Gwxg-3BrE;
	Thu, 04 Jun 2026 14:59:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9Xq-0000000GwxP-1WKb
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 14:59:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B83A9404D6;
	Thu,  4 Jun 2026 14:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1125F1F00893;
	Thu,  4 Jun 2026 14:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780585181;
	bh=XOqQyI3gZmKvelsdA1mwzglKHOSKd9JIfd039oOU6sA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mOTGQ04gfuV1tU91ShWH7puQNjDv5Y2mgiZZHX7RpupDx3xftNmdy8PXdS/7foNSe
	 ye6JT5PnUoFW9CEFsrBfhKacEQ1I6iKHUaAWliWQIBPWjYQvZjZtejSWNHf3+Me4YT
	 y6jr605lyPbCuJOMwrSj13hW0ZgKz0KX9ywPG+woChgEB99MMlVDgj6ucfm9RFcX9g
	 rUlq85OIqjt6OOhTotQqIOi3At3YGRchWMf3IQtErsHS5954UTDpty6dia83by4UsM
	 tmiHPw/P3hmS1C5eUiw0Jxgap7JCXOlEz9GjFtpjo1iPyIq5CNGI4FEoRO5gzuUuB0
	 Z7Zp99Gorhr7Q==
Date: Thu, 4 Jun 2026 17:59:33 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 0/2] riscv: mm: Avoid spurious fault after hotplugging
 vmemmap
Message-ID: <aiGS1e6wMwcwC-sC@kernel.org>
References: <20260604-mark-after-vmemmap-populate-v2-0-ab6a7d03b434@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260604-mark-after-vmemmap-populate-v2-0-ab6a7d03b434@iscas.ac.cn>
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

On Thu, Jun 04, 2026 at 07:11:53PM +0800, Vivian Wang wrote:
> Patch 1 adds a hook and should be no functional change on its own,
> whereas patch 2 is the actual fix, which depends on my earlier kfence
> fixes for mark_new_valid_map() [1].
> 
> Found while testing AMD_HSA/ZONE_DEVICE on SpacemiT K3. Using
> ZONE_DEVICE requires another fix [2].
> 
> [1]: https://lore.kernel.org/linux-riscv/20260303-handle-kfence-protect-spurious-fault-v2-0-f80d8354d79d@iscas.ac.cn
> [2]: https://lore.kernel.org/linux-riscv/20260309-riscv-sparsemem-vmemmap-limits-v1-2-f40efe18e3cd@iscas.ac.cn
> 
> ---
> Changes in v2:
> - Split patch in two, hook point and riscv hook 

I don't think it should be split. You can add a hook and it's riscv
implementation in one patch, anyway this should go upstream via the same
tree.

> - Explain hook necessity in patch 1 message (Mike)
> - Make hook #define based (Mike)
> - Call finalize hook only on populate success
> - Link to v1: https://patch.msgid.link/20260525-mark-after-vmemmap-populate-v1-1-e698d859ba16@iscas.ac.cn
> 
> ---
> Vivian Wang (2):
>       mm/vmemmap: Add a post-population hook for architectures
>       riscv: mm: Avoid spurious fault after hotplugging vmemmap
> 
>  arch/riscv/include/asm/pgtable.h | 4 ++++
>  arch/riscv/mm/init.c             | 6 ++++++
>  mm/sparse-vmemmap.c              | 8 ++++++++
>  3 files changed, 18 insertions(+)
> ---
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> change-id: 20260525-mark-after-vmemmap-populate-68bd790839c9
> prerequisite-message-id: <20260303-handle-kfence-protect-spurious-fault-v2-0-f80d8354d79d@iscas.ac.cn>
> prerequisite-patch-id: fdc42f2647e21d111f44a6532887a6705cd470a9
> prerequisite-patch-id: 096fa339c84c36643ae4311fd8362dc63e23d950
> prerequisite-patch-id: 305c876a5f4a23a840a8142aea79b796ed297545
> prerequisite-patch-id: d78cb55d6a616b1170f06a401c8fd44acd11e5d5
> prerequisite-patch-id: b02b4a76e94f3e2821291d4c23b46f6e5ecf5203
> 
> Best regards,
> --  
> Vivian Wang <wangruikang@iscas.ac.cn>
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
