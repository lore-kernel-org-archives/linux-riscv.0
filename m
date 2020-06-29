Return-Path: <SRS0=q2sy=AK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 226A5C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 23:37:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0D0E206F1
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 23:37:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yU8Sbpue";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QnKqIkK1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0D0E206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dyCEcHHClO1PhWIJbj14eXjL3O34/K/6EWlY70BXCqQ=; b=yU8Sbpue0gRpku2lBMb/VEoib
	BmpYg1VKXS+7XUhWKwP3PQkHrZ+icxvpbe0QXfrJoINEVJ8wJ4Cwuvd5RnebKzctU/ArZNmfXJdW5
	d4Fe2Eldf1mEO92ccZt6R1rYRDyusKekHbjQJjqqN6GzhLIAOMpIt9obXhOtZgJzibhKxao+XK/jH
	Xyzmd5aO3HL659s5khAN1HEnu13uylh9GKUKit/wy7hre/3y5WyHrbFMQF3z7XUjb3J77DvnvYcfL
	gDe0rhvhLfb9hRvYRJJuE17Eh4HmDVXPLaBVh7SzgrsHEUN8nBY09KH7pK8v2OmoexALDvsJUCMNW
	D69xW/P6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq3LS-0007vK-3z; Mon, 29 Jun 2020 23:37:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq3LQ-0007vB-JL
 for linux-riscv@lists.infradead.org; Mon, 29 Jun 2020 23:37:49 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D59C206F1;
 Mon, 29 Jun 2020 23:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593473867;
 bh=jwY2o3i7A/yilz2MIuZg3u9zREXVh4++QwAfajlJ9l4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=QnKqIkK1Mtx4Lx4nmaKwHDuiOd0k9+8ngFNH1vIGu8nJpMDUEN7dZg5OVCz6DCWU3
 RZ5vFPXRwWRSNN6WKEgVJvW0r4AeJyj3qRbFmjNf9elEMd1pEa791bd0d+v1e3TdiD
 GsJ7ELoqXLrhZ2QhtSAXrXUW6ARFVFfOQxFADq4s=
MIME-Version: 1.0
In-Reply-To: <mhng-f15789ef-8446-4dbe-a483-19d2f6c37b96@palmerdabbelt-glaptop1>
References: <mhng-f15789ef-8446-4dbe-a483-19d2f6c37b96@palmerdabbelt-glaptop1>
Subject: Re: [PATCH] clk: sifive: allocate sufficient memory for struct
 __prci_data
From: Stephen Boyd <sboyd@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Date: Mon, 29 Jun 2020 16:37:46 -0700
Message-ID: <159347386681.1987609.8025910491933969394@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: schwab@suse.de, mturquette@baylibre.com, stable@vger.kernel.org,
 vincent.chen@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Palmer Dabbelt (2020-06-29 16:34:10)
> On Mon, 29 Jun 2020 16:23:47 PDT (-0700), sboyd@kernel.org wrote:
> >
> > Does that mean applied to sifive tree? I see it in next but only noticed
> > this by chance because it wasn't sent to the linux-clk mailing list.
> 
> Sorry, I was going a bit too fast and didn't realize this wasn't in arch/riscv/
> so I didn't wait for an ack.  I put it on my fixes branch, which is what I sent
> for the RCs.  That's merged into linux-next as well, as far as I understand
> that's the normal way to do things.  It ended up in Linus' tree as d0a5fdf4cc83
> ("clk: sifive: allocate sufficient memory for struct __prci_data"), which is in
> rc3.
> 
> We don't really have a SiFive tree, the SiFive stuff just goes in through the
> RISC-V tree.  In theory I've been meaning to split them up for a while, but
> given the maintainers are the same I just never got around to doing so.
> 
> LMK if I screwed something up.

No worries. I would have noticed this patch earlier if it had been sent
to the linux-clk mailing list which I use to catch patches that should
be reviewed for the clk tree. I'm not overly concerned. Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
