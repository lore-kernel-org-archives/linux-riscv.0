Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC43C531F9
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 03:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Mime-Version:From:Date:
	Message-Id:References:Subject:Cc:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eaEujBDDWs8HR61lfOaFgCa5PDdiPQT7f8lXmrm+648=; b=yDkReeeYDsbDWK
	cly0VDfTQlBkOusqtxywWGkOWRj2FAPX1JNVUo6qjDXMmTvFCUOa9bSe4rgHd32mGjkNLiaNMSYL7
	8TUK0XBPjcKBGyiU5NqWbg0SyGvDyYM+mt0pjITvUCOnKlXkIvoQSdbrfJ6rGXSL7t22dTf0prf1p
	eu8dCP+nd/N0nFo8nf/byzXmjDu7J00HNUDTIwvYnQVDK4qkpQVXucfWyvKOY4IC8QQG64x0q+kPz
	xrvr/kqiPVGvY4YNco9zeQHgj3knTQtCXZBRKqkP1ZZQitBLtE4TCHCBq3ajL84yMoRXlif6880Zm
	+GQsge0QfwZcY7yohbdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woYxX-00000004MKN-2wrt;
	Tue, 28 Jul 2026 03:58:27 +0000
Received: from va-1-112.ptr.blmpb.com ([209.127.230.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woYxT-00000004MJt-1oit
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 03:58:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1785211094; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=ORYKnzp8p3b4t6SG9fxg+YLTbVDjbxQPufazEnHJ7Tc=;
 b=H2OGs30PRsGxVhGfYSeFM4YgS/Evcx4T/XlSX24nPK89y/KRPKRT27xOFaC/xvxNtdYrPF
 9a8Nh+8kxqZGwVdZtfYiGoSPRuF2MQ2554IsdftwTBrgVPkh7QCucSDjb1Dw75LQ5c6dOh
 q6JjP0Is9jwaY+x7oyo5otts6h9F+YT5+CvTktwSFcN6avoRftz3thFyAGcrox3AZs5LeU
 fhfEaYACG5Iu5gDDrfa8kAyGI0Kt2kZ7L2vW4Lj2ZbybSE1EJSg+fLUdxIlBMLPv/FCnjV
 bnI56IZ4JJ0KqB+sGK2jAxJJN9jgOs5/8RpvAU+OItLtR1UaLRzglPiSPKPJkA==
To: "Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, "Nam Cao" <namcao@linutronix.de>, 
	"Kees Cook" <kees@kernel.org>, "Jingwei Wang" <wangjingwei@iscas.ac.cn>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: hwprobe: Register unaligned probes before usermode
X-Original-From: Rui Qi <qirui.001@bytedance.com>
References: <20260721150511.1607105-1-qirui.001@bytedance.com>
Message-Id: <20260728035756.11757-2-qirui.001@bytedance.com>
X-Mailer: git-send-email 2.52.0
Date: Tue, 28 Jul 2026 11:57:57 +0800
X-Lms-Return-Path: <lba+26a6828d4+6dc07d+lists.infradead.org+qirui.001@bytedance.com>
From: "Rui Qi" <qirui.001@bytedance.com>
Mime-Version: 1.0
In-Reply-To: <20260721150511.1607105-1-qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_205823_552994_86C53C4B 
X-CRM114-Status: UNSURE (   2.72  )
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

Hi Palmer, Alexandre,

Gentle ping on this patch [1]. Nam has reviewed and given his
Reviewed-by. Is there anything else needed before this can be picked
up?

Thanks,
Rui

[1] https://lore.kernel.org/all/20260721150511.1607105-1-qirui.001@bytedance.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
