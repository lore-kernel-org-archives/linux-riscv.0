Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA00CAC5A8
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 13:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LdF2klI7hqcdB89UOXPzySwjoAXlX1VALwLCIcIX3As=; b=G7KN3wJGRMZuY6
	Rnpq6g3RnTqQKKcyxEWqXDQK/AjrM+67LRVrT6SoeuOe4QTxCjrHe5CbIUYskGwQBzrYBnukthh2T
	BkGArVCG6R1MD36mj5mW1k0kRGX5IwggKD0gODkuADq67HhxvYISFOOh9KoF+BdUY1XexeuJo4evo
	wlWPDQ4kgEPWbY/crYks42RPpZL/hc0wrmWfXaQi7gvZP0ULQaygBHCzAYPkxr/VTdbwsJnJoG6Pb
	o0aDr1Yjl6qOBsNWZUcn/bwreFmhFVA/GkgWn25fJl9dJEbAvlpzPsVCVRh8HcBUgBzFzU7ClYmZr
	FvTJJKnyckLa2IYQvw/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gzN-0000000AaIr-17zo;
	Mon, 22 Sep 2025 13:53:57 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gzI-0000000AaII-2aHI
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 13:53:55 +0000
Received: from Mobilestation.localdomain (unknown [183.6.59.140])
	by APP-03 (Coremail) with SMTP id rQCowAD3C4bjVNFop7xEBA--.8159S2;
	Mon, 22 Sep 2025 21:53:40 +0800 (CST)
From: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
To: zihong.plct@isrc.iscas.ac.cn
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	zhangyin2018@iscas.ac.cn,
	zihongyao@outlook.com
Subject: Re: [PATCH v1 0/2] riscv: hwprobe: add Zicbop support
Date: Mon, 22 Sep 2025 21:53:31 +0800
Message-ID: <20250922135337.38493-1-zihong.plct@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250911121219.20243-1-zihong.plct@isrc.iscas.ac.cn>
References: <20250911121219.20243-1-zihong.plct@isrc.iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowAD3C4bjVNFop7xEBA--.8159S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYc7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aV
	CY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE
	5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeV
	CFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l
	42xK82IYc2Ij64vIr41l4c8EcI0Ec7CjxVAaw2AFwI0_Jw0_GFyl4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjfUoOJ5UUUUU
X-Originating-IP: [183.6.59.140]
X-CM-SenderInfo: p2lk00vjoszunw6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_065353_019212_B8A5A7CD 
X-CRM114-Status: UNSURE (   5.20  )
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

SGkgYWxsLAoKSXTigJlzIGJlZW4gYWJvdXQgdHdvIHdlZWtzIHNpbmNlIEkgcG9zdGVkIHRoaXMg
cGF0Y2guCkNvdWxkIHNvbWVvbmUgdGFrZSBhIGxvb2sgd2hlbiBjb252ZW5pZW50IGFuZCBsZXQg
bWUga25vdyBpZiB0aGVyZSBhcmUKYW55IGNvbmNlcm5zIG9yIGltcHJvdmVtZW50cyBuZWVkZWQ/
CgpQYXRjaCBsaW5rczoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNTA5
MTExMjEyMTkuMjAyNDMtMS16aWhvbmcucGxjdEBpc3JjLmlzY2FzLmFjLmNuLwpodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI1MDkxMTEyMTIxOS4yMDI0My0yLXppaG9uZy5w
bGN0QGlzcmMuaXNjYXMuYWMuY24vCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2
LzIwMjUwOTExMTIxMjE5LjIwMjQzLTMtemlob25nLnBsY3RAaXNyYy5pc2Nhcy5hYy5jbi8KCklm
IHVzZWZ1bCwgSSBjYW4gcmVzZW5kIHdpdGggdXBkYXRlcyBpZiBuZWVkZWQuClRoYW5rcyBmb3Ig
eW91ciBhdHRlbnRpb24uCgpaaWhvbmcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
