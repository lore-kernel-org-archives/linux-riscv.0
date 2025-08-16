Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B62CA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Aug 2025 08:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wJko6lnN2MkbCdceYQ9khwCjvE9iJZgGP71757L+eAU=; b=wEsAkq4V/9VLP7
	Xnd4k4y2z214s/CTTf2cj4+ARPqcHanliweJAh9j4ooJGFFDibT+GWTa3/M4RYEAQVMSq7f5ZhuQo
	efUQoFyAh+yy1zlGhgaicb4y/k0GNe2Pq0QJ/Mcz63T0T/USPySWMDvocwr79FA8PufDOTEwENqdc
	km+8Frpn9qOaEXqE2NWdMA4g6jfMaWocN9iXDRfiG7hlFeFiDD7OayLnoXLCGVMhnYiqp4HBB1Egj
	MhAh736LNkIa4yicpmLooSOWw8gSi/66LzPSY7vc+g0NC8kbrVi6UJ0Dv8suNyWrArclWYHdt9EOA
	J2+ujXN75tK98qe+nhaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCXF-00000004Jjs-0nLV;
	Sat, 16 Aug 2025 08:45:09 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCXD-00000004JjS-1Y7A
	for linux-riscv@lists.infradead.org;
	Sat, 16 Aug 2025 08:45:08 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755333900; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XXAOpm4rWcwReFuaQKg8NtDfyw9w0XiWY97NzK9aEVZNVR9yY7HjywXrU01faseUSyW+KHmdu/W02qA1ct5l4wEt0rhz2auhUmfqF6VUvo9ei80EiU2cSiCvKEKWelDNeSIp44ACdOR4LZ66VX63glUhVRxXplwORYPgKeLDgIY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755333900; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=t773CWX/vAKNBpBvue1w4mNog/qC2XeO74irT/8/hA8=; 
	b=E5Iz9hCkG8mIw5NiziigRQmlZhtdyRVckSUJisQSr0byLOFU6T6n/GMBs3HoSLHVotP5TRVs2I9FzPWNtllUv5du3FO5bzR49vp+f2f0ikf8HIALdNBOu3VJVdZnwu+J713yKCR4imZ2BCEzHb+3VivFcZmRrfH6i02GPfDrxjs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755333900;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=t773CWX/vAKNBpBvue1w4mNog/qC2XeO74irT/8/hA8=;
	b=h8LsyQDUj1El7T8Y+CXCrE7pWurCEfJs2TeH0i8xVBnsvceCk2rhZVAriI2ra+N9
	NkTYK/7bJATOODYZOEp24oOoolSPi3h2sBRuWm1SmklOOVD5vcn5ki8cq+VCATr/Ws6
	myFIi0uthjt3WlX9bNPNuP/+LYipxXlHJpZqdZUglkcJFnMo6C7JNZwzejxkjkmJ24B
	Cx1yn6QwXmd5UQlwRmzRAVXqHn/3ox9sN2Ke6+tJYBZN1gU1nHSiHdwj5EQaPhabNQV
	aSXJEoiw/hiHG6tTE67SUIv/y4aH9+mjsRM3GP9JG+cXaKsOAlTvZLai5dv90s5rmae
	ooQaAsqoCw==
Received: by mx.zohomail.com with SMTPS id 1755333898289307.1686031953286;
	Sat, 16 Aug 2025 01:44:58 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 0/2] clk: thead: th1520-ap: allow gate cascade and fix padctrl0
Date: Sat, 16 Aug 2025 16:44:43 +0800
Message-ID: <20250816084445.2582692-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_014507_476641_E8D8C6EC 
X-CRM114-Status: UNSURE (   5.42  )
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

Current ccu_gate implementation does not easily allow gates to be clock
parents because of the waste of struct clk_hw in struct ccu_gate;
however it's found that the padctrl0 apb clock gate seems to be
downstream of perisys-apb4-hclk, gating the latter w/o gating the former
makes the padctrl0 registers inaccessible too.

Fix this by refactor ccu_gate code, mimicing what Yao Zi did on
ccu_mux; and then assign perisys-apb4-hclk as parent of padctrl0 bus
gate.

Icenowy Zheng (2):
  clk: thead: th1520-ap: describe gate clocks with clk_gate
  clk: thead: th1520-ap: fix parent of padctrl0 clock

 drivers/clk/thead/clk-th1520-ap.c | 386 +++++++++++++++---------------
 1 file changed, 189 insertions(+), 197 deletions(-)

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
