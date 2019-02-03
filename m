Return-Path: <SRS0=yhZS=QK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB22C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  3 Feb 2019 17:08:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D8AC2083B
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  3 Feb 2019 17:08:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LQNoGVUw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D8AC2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WuL+ifTPM2wndi+PjIw/7O36Q8+4HjWV7MAiEF98nSE=; b=LQNoGVUw0eOkNp
	Oe7lg47Imx/rTl2XkUYzeACsaY7hWiSlFiz9P7Ui3E13Ipnv9HZjSt7Ofn1qLS5dBeFLyj+XDwC0E
	aqVU4j9yKBDr6isG3usL4ovAZJp1KoM9SaoY3u3VuZv5IZRtyL97H45X1YWnBrxaGZYs85VsbDhJK
	fXtbox8GSKOSOzL4EKXZNM9dfhhrGvb4nD2B4XByjH2FEBxyFzcu572U8RLVIEZDQT4kPljKm8Owg
	gU/xSTFr0S2GfizBhjTQO+Ga8U7L+SMlGmQ0gpcA/DQyjFoJM/2AxYHCYWFs1g1q80KcnQCYtk0vF
	EMNN+NkeoZ+n4HvUeAWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqLG1-0006ok-0L; Sun, 03 Feb 2019 17:08:37 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqLFz-0006na-1X
 for linux-riscv@lists.infradead.org; Sun, 03 Feb 2019 17:08:36 +0000
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A33783D09;
 Sun,  3 Feb 2019 17:08:34 +0000 (UTC)
Received: from localhost (ovpn-112-14.rdu2.redhat.com [10.10.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 550605C238;
 Sun,  3 Feb 2019 17:08:32 +0000 (UTC)
Date: Sun, 03 Feb 2019 09:08:31 -0800 (PST)
Message-Id: <20190203.090831.1775635225008332226.davem@redhat.com>
To: bjorn.topel@gmail.com
Subject: Re: [PATCH bpf-next 2/3] MAINTAINERS: add RISC-V BPF JIT maintainer
From: David Miller <davem@redhat.com>
In-Reply-To: <20190203115132.8766-3-bjorn.topel@gmail.com>
References: <20190203115132.8766-1-bjorn.topel@gmail.com>
 <20190203115132.8766-3-bjorn.topel@gmail.com>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Sun, 03 Feb 2019 17:08:34 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190203_090835_099463_EF33D3D9 
X-CRM114-Status: UNSURE (   6.95  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: daniel@iogearbox.net, netdev@vger.kernel.org, palmer@sifive.com,
 ast@kernel.org, hch@infradead.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: bjorn.topel@gmail.com
Date: Sun,  3 Feb 2019 12:51:30 +0100

> From: Bj=F6rn T=F6pel <bjorn.topel@gmail.com>
> =

> Add Bj=F6rn T=F6pel as RISC-V BPF JIT maintainer.
> =

> Signed-off-by: Bj=F6rn T=F6pel <bjorn.topel@gmail.com>

Acked-by: David S. Miller <davem@davemloft.net>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
