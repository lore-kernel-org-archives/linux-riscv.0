Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55FBCA5FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 23:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qBAYRGXoldPiHAcdu4pmK++dwJUpVSiQTL2PktR9Xjs=; b=3DKX/JpZMkuVgu
	twTnPXnBecoaK8I3gp4LQqOLwEw3AfG2DvofW+C8XERUfvvUAWui9wYMbWk6bA2ChHWVVeSwA1X2J
	SLrgjeLiqMCN13tPXid3CKR8p6Us9BrcBTrZQzIRzegCg62KmUx2PfUKL+ZJU/ncdDsCmsv3M4eLv
	37l6JV1pfAYGO9KSDsaMuWOaKBKx1J5fEi7YLm1/OJYRcFTzoUXhPogAmDtF1NO39F+S5xeuZ07BR
	rZmiOjWSgDPYfs7bIhoXhdGndIuGq9cilrRAIif0cyxG3LuEJ7pxb9pRA8cL0WaM3Knv4u7Zky+77
	3fdE01t+ouUSadJ4y0ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBhcb-00000004mej-1h92;
	Tue, 29 Sep 2026 23:52:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBhca-00000004mea-2AOH
	for linux-riscv@bombadil.infradead.org;
	Tue, 29 Sep 2026 23:52:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=9Oklwia5HgEZOvXxS1ulCHmSLw8O5GR4I/AE2lHqbUE=; b=pRrzQplZTW8bsBBTaEah+D6Pqx
	jh40Doj84UpDt+x9hEf7V/nbcPUYeYftmW5wjVZhox8iJbRFRSQh0JgfDC8KfoWMsDuwQ1IgCGn60
	CM6s908gimLnWu1Gta3QsTZ6X28/W0SFeIk8SfVDWhjpTC/ynTeW2e1eNGDwRcTxd1RzwoYhw+wDL
	T5Y4aAyo3giQqWKXrpCDS+JoXx0MMgP9KSYYJlWU18FihE0XZWofvvvp1n3NTHme+iXGi+MMy9Y5c
	oIMSUIb8wpdvA4W/LN97yWMwF/Py18eeNAiKr1c90du5ljN3uJBAUyT4EhIF0KtIl5Qolgry0syJg
	3+HN/WJg==;
Received: from namei.org ([65.99.196.166] helo=mail.namei.org)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBhcW-00000003BWK-25wK
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 23:52:27 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.namei.org (Postfix) with ESMTPS id 9D0DD2C5;
	Tue, 29 Sep 2026 23:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.namei.org 9D0DD2C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=namei.org; s=2;
	t=1790725938; bh=9Oklwia5HgEZOvXxS1ulCHmSLw8O5GR4I/AE2lHqbUE=;
	h=Date:From:To:Subject:From;
	b=bGbCtvOCi7bXlHEuMcMuiOl07kVoB9QJLjOJhU4dBn8Rcv1Pzn7768OgEjrDrf8yE
	 w+JYNaTnlF5D6QqxiYf0xCQgRa68zQveqvtd6fTgQL0K3yvmrpMUrrg2R7FpJOw6ew
	 bhZob5g3GhwQW4TtnebuU3hrlfUc3O/JSJn8LyP8=
Date: Tue, 29 Sep 2026 16:52:18 -0700 (PDT)
From: James Morris <jmorris@namei.org>
To: devel@lists.fedoraproject.org, linux-riscv@lists.infradead.org, 
    spacemit@lists.linux.dev
Subject: Wiki resource for Fedora RISC-V + KVM on the Spacemit K3 Com260
 board
Message-ID: <b143791b-7bba-a6a4-64ac-9c6dc0735ff3@namei.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_005225_069796_E0C2884E 
X-CRM114-Status: UNSURE (   6.65  )
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

Hi Folks,

I've been playing with Fedora RISC-V on the Spacemit K3 Com260 board 
(which implements full virtualization per the RVA23 spec).

I've captured the bringup process as a wiki with the help of an LLM. This 
supports a native KVM host running an F44 guest image. It's current for 
F44, with F45-beta a WIP.

Wiki: https://github.com/xjamesmorris/k3-com260-info/wiki



-- 
James Morris
<jmorris@namei.org>
https://mastodon.social/@xjamesmorris


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
